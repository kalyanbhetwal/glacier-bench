//! Blowfish Encryption Benchmark
//!
//! Simplified Blowfish block cipher implementation for intermittent computing.
//! This is a reduced version suitable for resource-constrained embedded systems.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const NUM_ROUNDS: usize = 4; // Reduced from 16 for embedded systems
const BLOCK_SIZE: usize = 8; // 64 bits

// Simplified P-array (normally 18 elements, reduced for embedded)
static mut P_ARRAY: [u32; NUM_ROUNDS + 2] = [
    0x243F6A88, 0x85A308D3, 0x13198A2E, 0x03707344, 0xA4093822, 0x299F31D0,
];

// Simplified S-boxes (normally 4 boxes of 256 entries each, heavily reduced)
static mut S_BOX: [[u32; 16]; 4] = [
    [
        0xD1310BA6, 0x98DFB5AC, 0x2FFD72DB, 0xD01ADFB7,
        0xB8E1AFED, 0x6A267E96, 0xBA7C9045, 0xF12C7F99,
        0x24A19947, 0xB3916CF7, 0x0801F2E2, 0x858EFC16,
        0x636920D8, 0x71574E69, 0xA458FEA3, 0xF4933D7E,
    ],
    [
        0x0D95748F, 0x728EB658, 0x718BCD58, 0x82154AEE,
        0x7B54A41D, 0xC25A59B5, 0x9C30D539, 0x2AF26013,
        0xC5D1B023, 0x286085F0, 0xCA417918, 0xB8DB38EF,
        0x8E79DCB0, 0x603A180E, 0x6C9E0E8B, 0xB01E8A3E,
    ],
    [
        0xD71577C1, 0xBD314B27, 0x78AF2FDA, 0x55605C60,
        0xE65525F3, 0xAA55AB94, 0x57489862, 0x63E81440,
        0x55CA396A, 0x2AAB10B6, 0xB4CC5C34, 0x1141E8CE,
        0xA15486AF, 0x7C72E993, 0xB3EE1411, 0x636FBC2A,
    ],
    [
        0x2BA9C55D, 0x741831F6, 0xCE5C3E16, 0x9B87931E,
        0xAFD6BA33, 0x6C24CF5C, 0x7A325381, 0x28958677,
        0x3B8F4898, 0x6B4BB9AF, 0xC4BFE81B, 0x66282193,
        0x61D809CC, 0xFB21A991, 0x487CAC60, 0x5DEC8032,
    ],
];

static mut PLAINTEXT: [u8; BLOCK_SIZE] = [0; BLOCK_SIZE];
static mut CIPHERTEXT: [u8; BLOCK_SIZE] = [0; BLOCK_SIZE];
static mut DECRYPTED: [u8; BLOCK_SIZE] = [0; BLOCK_SIZE];
static mut ENCRYPTION_COUNT: u32 = 0;

/// Initialize the Blowfish benchmark
fn init() {
    unsafe {
        // Initialize plaintext with sample data
        for i in 0..BLOCK_SIZE {
            write_volatile(&mut PLAINTEXT[i], (i * 17 + 42) as u8);
            write_volatile(&mut CIPHERTEXT[i], 0);
            write_volatile(&mut DECRYPTED[i], 0);
        }
        write_volatile(&mut ENCRYPTION_COUNT, 0);
    }
}

/// F-function of Blowfish
fn f_function(x: u32) -> u32 {
    unsafe {
        let a = ((x >> 24) & 0xFF) as usize % 16;
        let b = ((x >> 16) & 0xFF) as usize % 16;
        let c = ((x >> 8) & 0xFF) as usize % 16;
        let d = (x & 0xFF) as usize % 16;

        let s0 = read_volatile(&S_BOX[0][a]);
        let s1 = read_volatile(&S_BOX[1][b]);
        let s2 = read_volatile(&S_BOX[2][c]);
        let s3 = read_volatile(&S_BOX[3][d]);

        ((s0.wrapping_add(s1)) ^ s2).wrapping_add(s3)
    }
}

/// Convert 4 bytes to u32 (big-endian)
fn bytes_to_u32(bytes: &[u8], offset: usize) -> u32 {
    ((bytes[offset] as u32) << 24)
        | ((bytes[offset + 1] as u32) << 16)
        | ((bytes[offset + 2] as u32) << 8)
        | (bytes[offset + 3] as u32)
}

/// Convert u32 to 4 bytes (big-endian)
fn u32_to_bytes(val: u32, bytes: &mut [u8], offset: usize) {
    bytes[offset] = (val >> 24) as u8;
    bytes[offset + 1] = (val >> 16) as u8;
    bytes[offset + 2] = (val >> 8) as u8;
    bytes[offset + 3] = val as u8;
}

/// Encrypt a single 64-bit block
fn encrypt_block(input: &[u8], output: &mut [u8]) {
    unsafe {
        let mut left = bytes_to_u32(input, 0);
        let mut right = bytes_to_u32(input, 4);

        // Reduced round Feistel network
        for i in 0..NUM_ROUNDS {
            let p = read_volatile(&P_ARRAY[i]);
            left ^= p;
            right ^= f_function(left);
            core::mem::swap(&mut left, &mut right);
        }

        // Undo the last swap
        core::mem::swap(&mut left, &mut right);

        left ^= read_volatile(&P_ARRAY[NUM_ROUNDS]);
        right ^= read_volatile(&P_ARRAY[NUM_ROUNDS + 1]);

        u32_to_bytes(left, output, 0);
        u32_to_bytes(right, output, 4);
    }
}

/// Decrypt a single 64-bit block
fn decrypt_block(input: &[u8], output: &mut [u8]) {
    unsafe {
        let mut left = bytes_to_u32(input, 0);
        let mut right = bytes_to_u32(input, 4);

        left ^= read_volatile(&P_ARRAY[NUM_ROUNDS + 1]);
        right ^= read_volatile(&P_ARRAY[NUM_ROUNDS]);

        // Reversed round Feistel network
        for i in (0..NUM_ROUNDS).rev() {
            core::mem::swap(&mut left, &mut right);
            right ^= f_function(left);
            let p = read_volatile(&P_ARRAY[i]);
            left ^= p;
        }

        u32_to_bytes(left, output, 0);
        u32_to_bytes(right, output, 4);
    }
}

/// Run one iteration of Blowfish encryption/decryption
fn run() -> bool {
    unsafe {
        // Read plaintext
        let mut plain_buf = [0u8; BLOCK_SIZE];
        for i in 0..BLOCK_SIZE {
            plain_buf[i] = read_volatile(&PLAINTEXT[i]);
        }

        // Encrypt
        let mut cipher_buf = [0u8; BLOCK_SIZE];
        encrypt_block(&plain_buf, &mut cipher_buf);
        for i in 0..BLOCK_SIZE {
            write_volatile(&mut CIPHERTEXT[i], cipher_buf[i]);
        }

        // Decrypt
        let mut decrypt_buf = [0u8; BLOCK_SIZE];
        decrypt_block(&cipher_buf, &mut decrypt_buf);
        for i in 0..BLOCK_SIZE {
            write_volatile(&mut DECRYPTED[i], decrypt_buf[i]);
        }

        // Increment counter
        let count = read_volatile(&ENCRYPTION_COUNT);
        write_volatile(&mut ENCRYPTION_COUNT, count + 1);

        // Update plaintext for next iteration
        for i in 0..BLOCK_SIZE {
            let val = read_volatile(&PLAINTEXT[i]);
            write_volatile(&mut PLAINTEXT[i], val.wrapping_add(1));
        }

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
