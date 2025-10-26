//! Key-Value Store Benchmark
//!
//! Simple key-value store for intermittent computing.
//! Tests data storage, retrieval, and persistence operations.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const STORE_SIZE: usize = 32;

#[derive(Clone, Copy)]
#[repr(C)]
struct KVPair {
    key: u16,
    value: u32,
    valid: bool,
}

static mut STORE: [KVPair; STORE_SIZE] = [KVPair {
    key: 0,
    value: 0,
    valid: false,
}; STORE_SIZE];

static mut OPERATION_COUNT: u32 = 0;
static mut CURRENT_KEY: u16 = 0;

/// Initialize the key-value store
fn init() {
    unsafe {
        for i in 0..STORE_SIZE {
            write_volatile(&mut STORE[i].key, 0);
            write_volatile(&mut STORE[i].value, 0);
            write_volatile(&mut STORE[i].valid, false);
        }
        write_volatile(&mut OPERATION_COUNT, 0);
        write_volatile(&mut CURRENT_KEY, 0);
    }
}

/// Hash function for key to index mapping
fn hash_key(key: u16) -> usize {
    ((key as u32 * 2654435761) % STORE_SIZE as u32) as usize
}

/// Insert a key-value pair
fn insert(key: u16, value: u32) -> bool {
    let mut idx = hash_key(key);
    let start_idx = idx;

    unsafe {
        loop {
            let valid = read_volatile(&STORE[idx].valid);

            if !valid {
                write_volatile(&mut STORE[idx].key, key);
                write_volatile(&mut STORE[idx].value, value);
                write_volatile(&mut STORE[idx].valid, true);
                return true;
            }

            let existing_key = read_volatile(&STORE[idx].key);
            if existing_key == key {
                write_volatile(&mut STORE[idx].value, value);
                return true;
            }

            idx = (idx + 1) % STORE_SIZE;
            if idx == start_idx {
                return false; // Store is full
            }
        }
    }
}

/// Lookup a value by key
fn lookup(key: u16) -> Option<u32> {
    let mut idx = hash_key(key);
    let start_idx = idx;

    unsafe {
        loop {
            let valid = read_volatile(&STORE[idx].valid);

            if !valid {
                return None;
            }

            let stored_key = read_volatile(&STORE[idx].key);
            if stored_key == key {
                let value = read_volatile(&STORE[idx].value);
                return Some(value);
            }

            idx = (idx + 1) % STORE_SIZE;
            if idx == start_idx {
                return None;
            }
        }
    }
}

/// Run one iteration
fn run() -> bool {
    unsafe {
        let key = read_volatile(&CURRENT_KEY);
        let value = (key as u32) * 1000 + 42;

        // Insert operation
        insert(key, value);

        // Lookup operation to verify
        let _result = lookup(key);

        let count = read_volatile(&OPERATION_COUNT);
        write_volatile(&mut OPERATION_COUNT, count + 1);

        // Update key
        let next_key = (key + 1) % 100;
        write_volatile(&mut CURRENT_KEY, next_key);

        true
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
