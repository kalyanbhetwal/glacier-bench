//! Bit Count Compare Benchmark
//!
//! Compares different bit counting algorithms for performance.
//! Tests optimization of bit manipulation in intermittent systems.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const TEST_SIZE: usize = 128;

static mut TEST_DATA: [u32; TEST_SIZE] = [0; TEST_SIZE];
static mut RESULTS_NAIVE: [u8; TEST_SIZE] = [0; TEST_SIZE];
static mut RESULTS_OPTIMIZED: [u8; TEST_SIZE] = [0; TEST_SIZE];
static mut INDEX: usize = 0;

/// Initialize the benchmark
fn init() {
    unsafe {
        for i in 0..TEST_SIZE {
            let val = ((i as u32) * 48271) % 0x7FFFFFFF;
            write_volatile(&mut TEST_DATA[i], val);
            write_volatile(&mut RESULTS_NAIVE[i], 0);
            write_volatile(&mut RESULTS_OPTIMIZED[i], 0);
        }
        write_volatile(&mut INDEX, 0);
    }
}

/// Naive bit counting
fn count_bits_naive(mut n: u32) -> u8 {
    let mut count = 0;
    while n != 0 {
        count += (n & 1) as u8;
        n >>= 1;
    }
    count
}

/// Optimized bit counting (Brian Kernighan's algorithm)
fn count_bits_optimized(mut n: u32) -> u8 {
    let mut count = 0;
    while n != 0 {
        n &= n - 1;  // Clear the least significant bit
        count += 1;
    }
    count
}

/// Run one iteration
fn run() -> bool {
    unsafe {
        let idx = read_volatile(&INDEX);
        let val = read_volatile(&TEST_DATA[idx]);

        // Test both algorithms
        let naive_count = count_bits_naive(val);
        let optimized_count = count_bits_optimized(val);

        write_volatile(&mut RESULTS_NAIVE[idx], naive_count);
        write_volatile(&mut RESULTS_OPTIMIZED[idx], optimized_count);

        let next_idx = idx + 1;

        if next_idx >= TEST_SIZE {
            write_volatile(&mut INDEX, 0);
            return true;
        }

        write_volatile(&mut INDEX, next_idx);
        false
    }
}

#[entry]
fn main() -> ! {
    init();

    loop {
        run();
        asm::nop();
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}
