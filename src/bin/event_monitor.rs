//! Event Monitor Benchmark - Interrupt-Driven
//!
//! Monitors and logs system events in an intermittent environment.
//! Uses Timer_A1 interrupt for event detection and logging.

#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};
use msp430fr5994::Peripherals;

const LOG_SIZE: usize = 64;

#[derive(Clone, Copy)]
#[repr(C)]
struct Event {
    event_type: u8,
    timestamp: u32,
    value: i16,
}

static mut EVENT_LOG: [Event; LOG_SIZE] = [Event {
    event_type: 0,
    timestamp: 0,
    value: 0,
}; LOG_SIZE];

static mut LOG_INDEX: usize = 0;
static mut EVENT_COUNT: u32 = 0;
static mut TIMESTAMP: u32 = 0;

/// Initialize the event monitor
fn init() {
    unsafe {
        for i in 0..LOG_SIZE {
            write_volatile(&mut EVENT_LOG[i].event_type, 0);
            write_volatile(&mut EVENT_LOG[i].timestamp, 0);
            write_volatile(&mut EVENT_LOG[i].value, 0);
        }
        write_volatile(&mut LOG_INDEX, 0);
        write_volatile(&mut EVENT_COUNT, 0);
        write_volatile(&mut TIMESTAMP, 0);
    }
}

/// Generate a simulated event
fn generate_event() -> Event {
    unsafe {
        let ts = read_volatile(&TIMESTAMP);
        let event_type = ((ts * 17) % 5) as u8;
        let value = ((ts * 23) % 1000) as i16;

        Event {
            event_type,
            timestamp: ts,
            value,
        }
    }
}

/// Check if event should be logged (filtering)
fn should_log_event(event: &Event) -> bool {
    // Log events of certain types or with significant values
    event.event_type == 0 || event.event_type == 3 || event.value > 500
}

/// Log an event
fn log_event(event: Event) {
    unsafe {
        let idx = read_volatile(&LOG_INDEX);

        write_volatile(&mut EVENT_LOG[idx].event_type, event.event_type);
        write_volatile(&mut EVENT_LOG[idx].timestamp, event.timestamp);
        write_volatile(&mut EVENT_LOG[idx].value, event.value);

        let next_idx = (idx + 1) % LOG_SIZE;
        write_volatile(&mut LOG_INDEX, next_idx);

        let count = read_volatile(&EVENT_COUNT);
        write_volatile(&mut EVENT_COUNT, count + 1);
    }
}

/// Configure Timer_A1 for periodic event monitoring
fn setup_timer() {
    let peripherals = unsafe { Peripherals::steal() };
    let timer = &peripherals.ta1;

    // Stop timer
    timer.ta1ctl().write(|w| w.mc().stop());

    // Configure for up mode, SMCLK, /8 divider
    // SMCLK is typically 1MHz, /8 = 125kHz
    // CCR0 = 6250 gives ~20Hz interrupt (50ms period for event monitoring)
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

/// Timer_A1 interrupt handler - detects and logs events
#[no_mangle]
extern "msp430-interrupt" fn TIMER1_A0() {
    unsafe {
        // Generate event
        let event = generate_event();

        // Filter and log
        if should_log_event(&event) {
            log_event(event);
        }

        // Increment timestamp
        let ts = read_volatile(&TIMESTAMP);
        write_volatile(&mut TIMESTAMP, ts + 1);
    }
}

#[entry]
fn main() -> ! {
    init();
    setup_timer();

    // Enable global interrupts
    unsafe { msp430::interrupt::enable(); }

    loop {
        // Main loop can perform other tasks or sleep
        // Events are handled by interrupt
        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
