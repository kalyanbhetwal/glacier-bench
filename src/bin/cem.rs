//! CEM (Cold-chain Equipment Monitor) Benchmark - Interrupt-Driven
//!
//! Simulates temperature monitoring and data logging for cold-chain equipment.
//! Uses Timer_A3 interrupt for periodic temperature monitoring.

#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};
use msp430fr5994::Peripherals;

const LOG_SIZE: usize = 128;
const TEMP_THRESHOLD_LOW: i16 = 2;   // 2°C
const TEMP_THRESHOLD_HIGH: i16 = 8;  // 8°C
const SAMPLES_PER_LOG: usize = 10;

#[derive(Clone, Copy)]
#[repr(C)]
struct TempReading {
    temperature: i16,  // Temperature in Celsius * 10 (e.g., 25 = 2.5°C)
    timestamp: u32,
    in_range: bool,
}

static mut TEMP_LOG: [TempReading; LOG_SIZE] = [TempReading {
    temperature: 0,
    timestamp: 0,
    in_range: true,
}; LOG_SIZE];

static mut LOG_INDEX: usize = 0;
static mut SAMPLE_COUNT: u32 = 0;
static mut VIOLATIONS: u32 = 0;
static mut TIMESTAMP: u32 = 0;
static mut ANALYSIS_READY: bool = false;

/// Initialize the CEM benchmark
fn init() {
    unsafe {
        for i in 0..LOG_SIZE {
            write_volatile(&mut TEMP_LOG[i].temperature, 0);
            write_volatile(&mut TEMP_LOG[i].timestamp, 0);
            write_volatile(&mut TEMP_LOG[i].in_range, true);
        }
        write_volatile(&mut LOG_INDEX, 0);
        write_volatile(&mut SAMPLE_COUNT, 0);
        write_volatile(&mut VIOLATIONS, 0);
        write_volatile(&mut TIMESTAMP, 0);
    }
}

/// Simulate temperature sensor reading
fn read_temperature() -> i16 {
    unsafe {
        // Generate pseudo-random temperature between -5°C and 15°C
        let time = read_volatile(&TIMESTAMP);
        let temp = ((time * 37 + 13) % 200) as i16 - 50;
        temp
    }
}

/// Process temperature reading
fn process_reading(temp: i16) -> bool {
    let low = TEMP_THRESHOLD_LOW * 10;
    let high = TEMP_THRESHOLD_HIGH * 10;
    temp >= low && temp <= high
}

/// Log temperature reading
fn log_reading(temp: i16, in_range: bool) {
    unsafe {
        let idx = read_volatile(&LOG_INDEX);
        let timestamp = read_volatile(&TIMESTAMP);

        write_volatile(&mut TEMP_LOG[idx].temperature, temp);
        write_volatile(&mut TEMP_LOG[idx].timestamp, timestamp);
        write_volatile(&mut TEMP_LOG[idx].in_range, in_range);

        let next_idx = (idx + 1) % LOG_SIZE;
        write_volatile(&mut LOG_INDEX, next_idx);
    }
}

/// Analyze logged data for violations
fn analyze_log() -> u32 {
    unsafe {
        let mut violation_count = 0;
        for i in 0..LOG_SIZE {
            let in_range = read_volatile(&TEMP_LOG[i].in_range);
            if !in_range {
                violation_count += 1;
            }
        }
        violation_count
    }
}

/// Configure Timer_A3 for periodic temperature monitoring
fn setup_timer() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta3;

    // Stop timer
    timer.ta3ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // SMCLK is typically 1MHz, /8 = 125kHz
    // CCR0 = 62500 gives ~2Hz interrupt (500ms per temp reading)
    timer.ta3ccr0().write(|w| unsafe { w.bits(62500) });

    // Clear counter
    timer.ta3ctl().modify(|_, w| w.taclr().set_bit());

    // Enable CCR0 interrupt
    timer.ta3cctl0().modify(|_, w| w.ccie().set_bit());

    // Start timer in up mode, SMCLK, /8 divider
    timer.ta3ctl().write(|w| {
        w.tassel().smclk()  // SMCLK
         .id()._8()         // /8 divider
         .mc().up()         // Up mode
    });
}

/// Timer_A3 interrupt handler - reads temperature periodically
#[no_mangle]
extern "msp430-interrupt" fn TIMER3_A0() {
    unsafe {
        // Read and process temperature
        let temp = read_temperature();
        let in_range = process_reading(temp);

        if !in_range {
            let v = read_volatile(&VIOLATIONS);
            write_volatile(&mut VIOLATIONS, v + 1);
        }

        // Log the reading
        log_reading(temp, in_range);

        // Increment timestamp and sample count
        let ts = read_volatile(&TIMESTAMP);
        write_volatile(&mut TIMESTAMP, ts + 1);

        let count = read_volatile(&SAMPLE_COUNT);
        write_volatile(&mut SAMPLE_COUNT, count + 1);

        // Set flag for analysis every SAMPLES_PER_LOG samples
        if (count + 1) % SAMPLES_PER_LOG as u32 == 0 {
            write_volatile(&mut ANALYSIS_READY, true);
        }
    }
}

#[entry]
fn main() -> ! {
    init();
    setup_timer();

    // Enable global interrupts
    unsafe { msp430::interrupt::enable(); }

    loop {
        // Perform analysis when ready
        unsafe {
            if read_volatile(&ANALYSIS_READY) {
                let _analysis = analyze_log();
                write_volatile(&mut ANALYSIS_READY, false);
            }
        }

        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
