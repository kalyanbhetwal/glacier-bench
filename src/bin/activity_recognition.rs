//! Activity Recognition Benchmark - Interrupt-Driven
//!
//! More comprehensive activity recognition using accelerometer data.
//! Uses Timer_A2 interrupt for periodic sensor sampling.

#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};
use msp430fr5994::Peripherals;

const WINDOW_SIZE: usize = 64;
const NUM_FEATURES: usize = 16;
const NUM_CLASSES: usize = 3;

// Simulated accelerometer data window
static mut DATA_WINDOW: [i16; WINDOW_SIZE * 3] = [0; WINDOW_SIZE * 3]; // x, y, z axes
static mut FEATURES: [i32; NUM_FEATURES] = [0; NUM_FEATURES];
static mut WINDOW_INDEX: usize = 0;
static mut CLASSIFICATION_COUNT: u32 = 0;
static mut WINDOW_READY: bool = false;

/// Initialize the activity recognition benchmark
fn init() {
    unsafe {
        for i in 0..DATA_WINDOW.len() {
            write_volatile(&mut DATA_WINDOW[i], 0);
        }
        for i in 0..FEATURES.len() {
            write_volatile(&mut FEATURES[i], 0);
        }
        write_volatile(&mut WINDOW_INDEX, 0);
        write_volatile(&mut CLASSIFICATION_COUNT, 0);
    }
}

/// Simulate reading accelerometer data
fn read_sensor_data() -> (i16, i16, i16) {
    unsafe {
        let idx = read_volatile(&WINDOW_INDEX);
        let x = ((idx * 17 + 31) % 2048) as i16 - 1024;
        let y = ((idx * 23 + 47) % 2048) as i16 - 1024;
        let z = ((idx * 29 + 59) % 2048) as i16 - 1024;
        (x, y, z)
    }
}

/// Extract features from the data window
fn extract_features() {
    unsafe {
        let mut mean_x: i32 = 0;
        let mut mean_y: i32 = 0;
        let mut mean_z: i32 = 0;

        for i in 0..WINDOW_SIZE {
            mean_x += read_volatile(&DATA_WINDOW[i * 3]) as i32;
            mean_y += read_volatile(&DATA_WINDOW[i * 3 + 1]) as i32;
            mean_z += read_volatile(&DATA_WINDOW[i * 3 + 2]) as i32;
        }

        write_volatile(&mut FEATURES[0], mean_x / WINDOW_SIZE as i32);
        write_volatile(&mut FEATURES[1], mean_y / WINDOW_SIZE as i32);
        write_volatile(&mut FEATURES[2], mean_z / WINDOW_SIZE as i32);

        let mut var_x: i32 = 0;
        let mut var_y: i32 = 0;
        let mut var_z: i32 = 0;

        for i in 0..WINDOW_SIZE {
            let dx = read_volatile(&DATA_WINDOW[i * 3]) as i32 - read_volatile(&FEATURES[0]);
            let dy = read_volatile(&DATA_WINDOW[i * 3 + 1]) as i32 - read_volatile(&FEATURES[1]);
            let dz = read_volatile(&DATA_WINDOW[i * 3 + 2]) as i32 - read_volatile(&FEATURES[2]);

            var_x += dx * dx;
            var_y += dy * dy;
            var_z += dz * dz;
        }

        write_volatile(&mut FEATURES[3], var_x / WINDOW_SIZE as i32);
        write_volatile(&mut FEATURES[4], var_y / WINDOW_SIZE as i32);
        write_volatile(&mut FEATURES[5], var_z / WINDOW_SIZE as i32);

        let mag = ((mean_x * mean_x + mean_y * mean_y + mean_z * mean_z) / 1000) as i32;
        write_volatile(&mut FEATURES[6], mag);
    }
}

/// Simple classification based on features
fn classify() -> usize {
    unsafe {
        let mean_x = read_volatile(&FEATURES[0]);
        let mean_y = read_volatile(&FEATURES[1]);
        let var_z = read_volatile(&FEATURES[5]);

        if var_z > 500 {
            2 // Running
        } else if mean_x.abs() > 100 || mean_y.abs() > 100 {
            1 // Walking
        } else {
            0 // Standing
        }
    }
}

/// Configure Timer_A2 for periodic accelerometer sampling
fn setup_timer() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta2;

    // Stop timer
    timer.ta2ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // SMCLK is typically 1MHz, /8 = 125kHz
    // CCR0 = 12500 gives ~10Hz interrupt (100ms per sample)
    timer.ta2ccr0().write(|w| unsafe { w.bits(12500) });

    // Clear counter
    timer.ta2ctl().modify(|_, w| w.taclr().set_bit());

    // Enable CCR0 interrupt
    timer.ta2cctl0().modify(|_, w| w.ccie().set_bit());

    // Start timer in up mode, SMCLK, /8 divider
    timer.ta2ctl().write(|w| {
        w.tassel().smclk()  // SMCLK
         .id()._8()         // /8 divider
         .mc().up()         // Up mode
    });
}

/// Timer_A2 interrupt handler - samples accelerometer periodically
#[no_mangle]
extern "msp430-interrupt" fn TIMER2_A0() {
    unsafe {
        let mut idx = read_volatile(&WINDOW_INDEX);

        let (x, y, z) = read_sensor_data();
        write_volatile(&mut DATA_WINDOW[idx * 3], x);
        write_volatile(&mut DATA_WINDOW[idx * 3 + 1], y);
        write_volatile(&mut DATA_WINDOW[idx * 3 + 2], z);

        idx += 1;

        if idx >= WINDOW_SIZE {
            write_volatile(&mut WINDOW_INDEX, 0);
            write_volatile(&mut WINDOW_READY, true);
        } else {
            write_volatile(&mut WINDOW_INDEX, idx);
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
        // Process window when ready
        unsafe {
            if read_volatile(&WINDOW_READY) {
                extract_features();
                let _class = classify();

                let count = read_volatile(&CLASSIFICATION_COUNT);
                write_volatile(&mut CLASSIFICATION_COUNT, count + 1);
                write_volatile(&mut WINDOW_READY, false);
            }
        }

        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
