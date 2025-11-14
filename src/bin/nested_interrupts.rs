//! Nested Interrupts Benchmark
//!
//! Demonstrates interrupt preemption where a high-priority interrupt
//! preempts a lower-priority interrupt handler.
//!
//! Uses Timer_A0 (lower priority) and Timer_A1 (higher priority).
//! Timer_A1 can preempt Timer_A0's handler execution.

#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};
use msp430fr5994::Peripherals;

// Performance counters
static mut LOW_PRIORITY_COUNT: u32 = 0;
static mut HIGH_PRIORITY_COUNT: u32 = 0;
static mut NESTED_COUNT: u32 = 0;

// Computation state for low priority interrupt
static mut LOW_PRIORITY_BUFFER: [u32; 64] = [0; 64];
static mut LOW_PRIORITY_SUM: u32 = 0;

// Computation state for high priority interrupt
static mut HIGH_PRIORITY_BUFFER: [u16; 32] = [0; 32];
static mut HIGH_PRIORITY_MAX: u16 = 0;

// Flag to detect nesting
static mut IN_LOW_PRIORITY_ISR: bool = false;

/// Initialize benchmark
fn init() {
    unsafe {
        write_volatile(&mut LOW_PRIORITY_COUNT, 0);
        write_volatile(&mut HIGH_PRIORITY_COUNT, 0);
        write_volatile(&mut NESTED_COUNT, 0);
        write_volatile(&mut LOW_PRIORITY_SUM, 0);
        write_volatile(&mut HIGH_PRIORITY_MAX, 0);
        write_volatile(&mut IN_LOW_PRIORITY_ISR, false);

        for i in 0..64 {
            write_volatile(&mut LOW_PRIORITY_BUFFER[i], 0);
        }
        for i in 0..32 {
            write_volatile(&mut HIGH_PRIORITY_BUFFER[i], 0);
        }
    }
}

/// Perform computational work in low priority ISR
fn low_priority_work() {
    unsafe {
        // Simulate complex computation that can be interrupted
        let count = read_volatile(&LOW_PRIORITY_COUNT);

        // Fill buffer with computed values
        for i in 0..64 {
            let value = (count.wrapping_mul(13).wrapping_add(i as u32 * 7)) % 1000;
            write_volatile(&mut LOW_PRIORITY_BUFFER[i], value);

            // Add some NOPs to make this slower and more likely to be preempted
            for _ in 0..10 {
                asm::nop();
            }
        }

        // Calculate sum of buffer
        let mut sum: u32 = 0;
        for i in 0..64 {
            let val = read_volatile(&LOW_PRIORITY_BUFFER[i]);
            sum = sum.wrapping_add(val);
        }
        write_volatile(&mut LOW_PRIORITY_SUM, sum);
    }
}

/// Perform computational work in high priority ISR
fn high_priority_work() {
    unsafe {
        // Simulate fast, critical computation
        let count = read_volatile(&HIGH_PRIORITY_COUNT);

        // Fill smaller buffer with time-critical data
        for i in 0..32 {
            let value = ((count.wrapping_mul(17).wrapping_add(i as u32 * 3)) % 256) as u16;
            write_volatile(&mut HIGH_PRIORITY_BUFFER[i], value);
        }

        // Find maximum value (simulating priority decision making)
        let mut max: u16 = 0;
        for i in 0..32 {
            let val = read_volatile(&HIGH_PRIORITY_BUFFER[i]);
            if val > max {
                max = val;
            }
        }
        write_volatile(&mut HIGH_PRIORITY_MAX, max);
    }
}

/// Configure Timer_A0 for low priority periodic interrupts
fn setup_timer_a0() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta0;

    // Stop timer
    timer.ta0ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // CCR0 = 25000 gives ~5Hz interrupt (200ms period)
    timer.ta0ccr0().write(|w| unsafe { w.bits(25000) });

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

/// Configure Timer_A1 for high priority periodic interrupts
fn setup_timer_a1() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta1;

    // Stop timer
    timer.ta1ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // CCR0 = 6250 gives ~20Hz interrupt (50ms period)
    // This fires more frequently than Timer_A0
    timer.ta1ccr0().write(|w| unsafe { w.bits(6250) });

    // Clear counter
    timer.ta1ctl().modify(|_, w| w.taclr().set_bit());

    // Enable CCR0 interrupt
    timer.ta1cctl0().modify(|_, w| w.ccie().set_bit());

    // Start timer in up mode, SMCLK, /8 divider
    timer.ta1ctl().write(|w| {
        w.tassel().smclk()  // SMCLK
         .id()._8()         // /8 divider
         .mc().up()         // Up mode
    });
}

/// Timer_A0 interrupt handler - LOW PRIORITY
/// This performs longer computation and can be preempted by Timer_A1
#[no_mangle]
extern "msp430-interrupt" fn TIMER0_A0() {
    unsafe {
        // Mark that we're in the low priority ISR
        write_volatile(&mut IN_LOW_PRIORITY_ISR, true);

        // Increment counter
        let count = read_volatile(&LOW_PRIORITY_COUNT);
        write_volatile(&mut LOW_PRIORITY_COUNT, count.wrapping_add(1));

        // Perform computational work (can be interrupted)
        low_priority_work();

        // Clear flag before exiting
        write_volatile(&mut IN_LOW_PRIORITY_ISR, false);
    }
}

/// Timer_A1 interrupt handler - HIGH PRIORITY
/// This can preempt the Timer_A0 handler
#[no_mangle]
extern "msp430-interrupt" fn TIMER1_A0() {
    unsafe {
        // Check if we're preempting the low priority ISR
        let in_low_isr = read_volatile(&IN_LOW_PRIORITY_ISR);
        if in_low_isr {
            // We're nested! Increment the nested counter
            let nested = read_volatile(&NESTED_COUNT);
            write_volatile(&mut NESTED_COUNT, nested.wrapping_add(1));
        }

        // Increment counter
        let count = read_volatile(&HIGH_PRIORITY_COUNT);
        write_volatile(&mut HIGH_PRIORITY_COUNT, count.wrapping_add(1));

        // Perform high-priority computational work
        high_priority_work();
    }
}

#[entry]
fn main() -> ! {
    init();
    setup_timer_a0();  // Low priority timer
    setup_timer_a1();  // High priority timer

    // Enable global interrupts to allow nesting
    unsafe {
        msp430::interrupt::enable();
    }

    loop {
        // Main loop - monitor the counters
        unsafe {
            let _low = read_volatile(&LOW_PRIORITY_COUNT);
            let _high = read_volatile(&HIGH_PRIORITY_COUNT);
            let _nested = read_volatile(&NESTED_COUNT);
            let _sum = read_volatile(&LOW_PRIORITY_SUM);
            let _max = read_volatile(&HIGH_PRIORITY_MAX);
        }

        // Low power mode - wait for interrupts
        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
