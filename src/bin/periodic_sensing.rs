//! Periodic Sensing Benchmark - Interrupt-Driven
//!
//! Simulates periodic sensor readings and data aggregation.
//! Uses Timer_A0 interrupt for periodic sampling.

#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};
use msp430fr5994::Peripherals;

const BUFFER_SIZE: usize = 128;

static mut SENSOR_DATA: [i16; BUFFER_SIZE] = [0; BUFFER_SIZE];
static mut BUFFER_INDEX: usize = 0;
static mut SAMPLE_COUNT: u32 = 0;

// Statistics
static mut MIN_VALUE: i16 = i16::MAX;
static mut MAX_VALUE: i16 = i16::MIN;
static mut SUM: i32 = 0;

// Flag for buffer processing
static mut BUFFER_READY: bool = false;

/// Initialize the periodic sensing benchmark
fn init() {
    unsafe {
        for i in 0..BUFFER_SIZE {
            write_volatile(&mut SENSOR_DATA[i], 0);
        }
        write_volatile(&mut BUFFER_INDEX, 0);
        write_volatile(&mut SAMPLE_COUNT, 0);
        write_volatile(&mut MIN_VALUE, i16::MAX);
        write_volatile(&mut MAX_VALUE, i16::MIN);
        write_volatile(&mut SUM, 0);
    }
}

/// Simulate reading a sensor value
fn read_sensor() -> i16 {
    unsafe {
        let count = read_volatile(&SAMPLE_COUNT);
        // Simulate sensor data with some variation
        let value = ((count * 17 + 31) % 1024) as i16 - 512;
        value
    }
}

/// Update statistics
fn update_statistics(value: i16) {
    unsafe {
        // Update min
        let min = read_volatile(&MIN_VALUE);
        if value < min {
            write_volatile(&mut MIN_VALUE, value);
        }

        // Update max
        let max = read_volatile(&MAX_VALUE);
        if value > max {
            write_volatile(&mut MAX_VALUE, value);
        }

        // Update sum
        let sum = read_volatile(&SUM);
        write_volatile(&mut SUM, sum + value as i32);
    }
}

/// Calculate average
fn calculate_average() -> i16 {
    unsafe {
        let sum = read_volatile(&SUM);
        let count = read_volatile(&SAMPLE_COUNT);
        if count > 0 {
            (sum / count as i32) as i16
        } else {
            0
        }
    }
}

/// Process buffer (aggregate statistics)
fn process_buffer() {
    unsafe {
        // Reset statistics
        write_volatile(&mut MIN_VALUE, i16::MAX);
        write_volatile(&mut MAX_VALUE, i16::MIN);
        write_volatile(&mut SUM, 0);

        // Recalculate from buffer
        for i in 0..BUFFER_SIZE {
            let val = read_volatile(&SENSOR_DATA[i]);
            update_statistics(val);
        }
    }
}

/// Configure Timer_A0 for periodic interrupts
fn setup_timer() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta0;

    // Stop timer
    timer.ta0ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // SMCLK is typically 1MHz, /8 = 125kHz
    // CCR0 = 12500 gives ~10Hz interrupt (100ms period)
    timer.ta0ccr0().write(|w| unsafe { w.bits(12500) });

    // Clear counter
    timer.ta0ctl().modify(|_, w| w.taclr().set_bit());

    // Enable CCR0 interrupt
    timer.ta0cctl0().modify(|_, w| w.ccie().set_bit());

    // Start timer in up mode, SMCLK, /8 divider
    timer.ta0ctl().write(|w| {
        w.tassel().smclk()  // SMCLK
         .id()._8()         // /8 divider
         .mc().up()         // Up mode
    });
}

/// Timer_A0 interrupt handler - samples sensor periodically
#[no_mangle]
extern "msp430-interrupt" fn TIMER0_A0() {
    unsafe {
        // Read sensor
        let value = read_sensor();

        // Store in buffer
        let idx = read_volatile(&BUFFER_INDEX);
        write_volatile(&mut SENSOR_DATA[idx], value);

        // Update statistics
        update_statistics(value);

        // Increment counters
        let count = read_volatile(&SAMPLE_COUNT);
        write_volatile(&mut SAMPLE_COUNT, count + 1);

        let next_idx = (idx + 1) % BUFFER_SIZE;
        write_volatile(&mut BUFFER_INDEX, next_idx);

        // Set flag when buffer is full
        if next_idx == 0 {
            write_volatile(&mut BUFFER_READY, true);
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
        // Process buffer when ready
        unsafe {
            if read_volatile(&BUFFER_READY) {
                process_buffer();
                let _avg = calculate_average();
                write_volatile(&mut BUFFER_READY, false);
            }
        }

        // Low power mode - wait for interrupt
        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
