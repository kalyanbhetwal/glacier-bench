//! RSA Encryption Benchmark
//!
//! Simplified RSA implementation for intermittent computing benchmarks.
//! Uses small key sizes suitable for resource-constrained devices.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

// Using small primes for embedded systems
const P: u32 = 61;
const Q: u32 = 53;
const N: u32 = P * Q;  // 3233
const E: u32 = 17;     // Public exponent (commonly used small value)

// Precomputed: d = 2753 (private exponent)
// (d * e) mod ((p-1)*(q-1)) = 1
const D: u32 = 2753;

const MESSAGE_SIZE: usize = 16;

static mut PLAINTEXT: [u32; MESSAGE_SIZE] = [0; MESSAGE_SIZE];
static mut CIPHERTEXT: [u32; MESSAGE_SIZE] = [0; MESSAGE_SIZE];
static mut DECRYPTED: [u32; MESSAGE_SIZE] = [0; MESSAGE_SIZE];
static mut ENCRYPTION_COUNT: u32 = 0;
static mut MESSAGE_INDEX: usize = 0;

/// Initialize the RSA benchmark
fn init() {
    unsafe {
        // Initialize with sample plaintext (small values < N)
        for i in 0..MESSAGE_SIZE {
            write_volatile(&mut PLAINTEXT[i], ((i * 7 + 11) % 256) as u32);
            write_volatile(&mut CIPHERTEXT[i], 0);
            write_volatile(&mut DECRYPTED[i], 0);
        }
        write_volatile(&mut ENCRYPTION_COUNT, 0);
        write_volatile(&mut MESSAGE_INDEX, 0);
    }
}

/// Modular exponentiation: (base^exp) mod modulus
fn mod_pow(mut base: u64, mut exp: u32, modulus: u64) -> u32 {
    let mut result: u64 = 1;
    base = base % modulus;

    while exp > 0 {
        if exp & 1 == 1 {
            result = (result * base) % modulus;
        }
        exp = exp >> 1;
        base = (base * base) % modulus;
    }

    result as u32
}

/// Encrypt a single value
fn encrypt(plaintext: u32) -> u32 {
    mod_pow(plaintext as u64, E, N as u64)
}

/// Decrypt a single value
fn decrypt(ciphertext: u32) -> u32 {
    mod_pow(ciphertext as u64, D, N as u64)
}

/// Run one iteration of RSA encryption/decryption
fn run() -> bool {
    unsafe {
        let idx = read_volatile(&MESSAGE_INDEX);

        // Encrypt one message element
        let plain = read_volatile(&PLAINTEXT[idx]);
        let cipher = encrypt(plain);
        write_volatile(&mut CIPHERTEXT[idx], cipher);

        // Decrypt it back
        let decrypted = decrypt(cipher);
        write_volatile(&mut DECRYPTED[idx], decrypted);

        let next_idx = idx + 1;

        // If we've processed all message elements
        if next_idx >= MESSAGE_SIZE {
            let count = read_volatile(&ENCRYPTION_COUNT);
            write_volatile(&mut ENCRYPTION_COUNT, count + 1);
            write_volatile(&mut MESSAGE_INDEX, 0);
            return true;
        }

        write_volatile(&mut MESSAGE_INDEX, next_idx);
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
