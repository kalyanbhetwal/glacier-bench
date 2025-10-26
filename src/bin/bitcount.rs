//! Bit Count Benchmark
//!
//! Counts the number of set bits in various data structures.
//! Tests bit manipulation operations in intermittent computing.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const DATA_SIZE: usize = 256;

static mut DATA: [u32; DATA_SIZE] = [0; DATA_SIZE];
static mut BIT_COUNTS: [u8; DATA_SIZE] = [0; DATA_SIZE];
static mut INDEX: usize = 0;
static mut TOTAL_BITS: u32 = 0;

/// Initialize the benchmark
fn init() {
    unsafe {
        // Initialize with pseudo-random data
        for i in 0..DATA_SIZE {
            let val = ((i as u32).wrapping_mul(1103515245).wrapping_add(12345)) & 0x7FFFFFFF;
            write_volatile(&mut DATA[i], val);
            write_volatile(&mut BIT_COUNTS[i], 0);
        }
        write_volatile(&mut INDEX, 0);
        write_volatile(&mut TOTAL_BITS, 0);
    }
}

/// Count bits in a 32-bit value (population count)
fn count_bits(mut n: u32) -> u8 {
    let mut count = 0;
    while n != 0 {
        count += (n & 1) as u8;
        n >>= 1;
    }
    count
}

/// Run one iteration
fn run() -> bool {
    unsafe {
        let idx = read_volatile(&INDEX);

        // Get the data value
        let val = read_volatile(&DATA[idx]);

        // Count bits
        let bits = count_bits(val);
        write_volatile(&mut BIT_COUNTS[idx], bits);

        // Update total
        let total = read_volatile(&TOTAL_BITS);
        write_volatile(&mut TOTAL_BITS, total + bits as u32);

        let next_idx = idx + 1;

        if next_idx >= DATA_SIZE {
            write_volatile(&mut INDEX, 0);
            write_volatile(&mut TOTAL_BITS, 0);
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
