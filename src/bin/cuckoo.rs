//! Cuckoo Filter Benchmark
//!
//! Implementation of a Cuckoo filter, a probabilistic data structure for
//! approximate set membership queries. More memory-efficient than Bloom filters
//! and supports deletions.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const BUCKET_COUNT: usize = 64;
const BUCKET_SIZE: usize = 4;
const FINGERPRINT_SIZE: u8 = 8; // bits
const MAX_KICKS: usize = 500;

type Fingerprint = u8;

#[derive(Clone, Copy)]
struct Bucket {
    entries: [Fingerprint; BUCKET_SIZE],
}

static mut FILTER: [Bucket; BUCKET_COUNT] = [Bucket {
    entries: [0; BUCKET_SIZE],
}; BUCKET_COUNT];

static mut INSERT_COUNT: u32 = 0;
static mut LOOKUP_COUNT: u32 = 0;
static mut FALSE_POSITIVES: u32 = 0;
static mut CURRENT_ITEM: u32 = 0;

/// Initialize the Cuckoo filter benchmark
fn init() {
    unsafe {
        for i in 0..BUCKET_COUNT {
            for j in 0..BUCKET_SIZE {
                write_volatile(&mut FILTER[i].entries[j], 0);
            }
        }
        write_volatile(&mut INSERT_COUNT, 0);
        write_volatile(&mut LOOKUP_COUNT, 0);
        write_volatile(&mut FALSE_POSITIVES, 0);
        write_volatile(&mut CURRENT_ITEM, 0);
    }
}

/// Simple hash function
fn hash(item: u32, seed: u32) -> usize {
    let h = item.wrapping_mul(2654435761u32).wrapping_add(seed);
    (h as usize) % BUCKET_COUNT
}

/// Generate fingerprint from item
fn fingerprint(item: u32) -> Fingerprint {
    let fp = (item.wrapping_mul(0x9E3779B9) >> 24) as u8;
    if fp == 0 { 1 } else { fp } // Avoid 0 fingerprints
}

/// Get alternate bucket index
fn alt_index(index: usize, fp: Fingerprint) -> usize {
    let hash_fp = (fp as u32).wrapping_mul(0x5BD1E995);
    (index ^ (hash_fp as usize)) % BUCKET_COUNT
}

/// Try to insert fingerprint into bucket
fn insert_into_bucket(bucket_idx: usize, fp: Fingerprint) -> bool {
    unsafe {
        for i in 0..BUCKET_SIZE {
            let entry = read_volatile(&FILTER[bucket_idx].entries[i]);
            if entry == 0 {
                write_volatile(&mut FILTER[bucket_idx].entries[i], fp);
                return true;
            }
        }
    }
    false
}

/// Insert an item into the Cuckoo filter
fn insert(item: u32) -> bool {
    let fp = fingerprint(item);
    let i1 = hash(item, 0);
    let i2 = alt_index(i1, fp);

    // Try to insert in first bucket
    if insert_into_bucket(i1, fp) {
        return true;
    }

    // Try to insert in second bucket
    if insert_into_bucket(i2, fp) {
        return true;
    }

    // Must relocate existing items (simplified version - only try a few times)
    let mut idx = if item & 1 == 0 { i1 } else { i2 };

    for _ in 0..MAX_KICKS {
        unsafe {
            // Pick a random entry to evict
            let entry_idx = (item as usize) % BUCKET_SIZE;
            let old_fp = read_volatile(&FILTER[idx].entries[entry_idx]);

            // Replace it with new fingerprint
            write_volatile(&mut FILTER[idx].entries[entry_idx], fp);

            if old_fp == 0 {
                return true;
            }

            // Try to reinsert the evicted fingerprint
            let old_fp_val = old_fp;
            idx = alt_index(idx, old_fp_val);

            // Try to insert evicted item
            for i in 0..BUCKET_SIZE {
                let entry = read_volatile(&FILTER[idx].entries[i]);
                if entry == 0 {
                    write_volatile(&mut FILTER[idx].entries[i], old_fp_val);
                    return true;
                }
            }
        }
    }

    false // Filter is full
}

/// Lookup an item in the Cuckoo filter
fn lookup(item: u32) -> bool {
    let fp = fingerprint(item);
    let i1 = hash(item, 0);
    let i2 = alt_index(i1, fp);

    unsafe {
        // Check first bucket
        for i in 0..BUCKET_SIZE {
            if read_volatile(&FILTER[i1].entries[i]) == fp {
                return true;
            }
        }

        // Check second bucket
        for i in 0..BUCKET_SIZE {
            if read_volatile(&FILTER[i2].entries[i]) == fp {
                return true;
            }
        }
    }

    false
}

/// Run one iteration of the Cuckoo filter benchmark
fn run() -> bool {
    unsafe {
        let item = read_volatile(&CURRENT_ITEM);

        // Insert the item
        if insert(item) {
            let count = read_volatile(&INSERT_COUNT);
            write_volatile(&mut INSERT_COUNT, count + 1);
        }

        // Lookup the item (should be found)
        let found = lookup(item);
        let lookup_count = read_volatile(&LOOKUP_COUNT);
        write_volatile(&mut LOOKUP_COUNT, lookup_count + 1);

        // Test for false positive with a different item
        let test_item = item.wrapping_add(10000);
        if lookup(test_item) {
            let fp_count = read_volatile(&FALSE_POSITIVES);
            write_volatile(&mut FALSE_POSITIVES, fp_count + 1);
        }

        write_volatile(&mut CURRENT_ITEM, item + 1);

        // Complete one iteration every 10 operations
        (item + 1) % 10 == 0
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
