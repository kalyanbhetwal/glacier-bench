//! Deep Neural Network Inference Benchmark
//!
//! Simplified DNN inference for intermittent computing.
//! Tests matrix operations and activation functions.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const INPUT_SIZE: usize = 16;
const HIDDEN_SIZE: usize = 8;
const OUTPUT_SIZE: usize = 3;

// Network weights (simplified, normally would be larger)
static mut WEIGHTS_IH: [[i16; HIDDEN_SIZE]; INPUT_SIZE] = [[0; HIDDEN_SIZE]; INPUT_SIZE];
static mut WEIGHTS_HO: [[i16; OUTPUT_SIZE]; HIDDEN_SIZE] = [[0; OUTPUT_SIZE]; HIDDEN_SIZE];

// Activations
static mut INPUT: [i16; INPUT_SIZE] = [0; INPUT_SIZE];
static mut HIDDEN: [i16; HIDDEN_SIZE] = [0; HIDDEN_SIZE];
static mut OUTPUT: [i16; OUTPUT_SIZE] = [0; OUTPUT_SIZE];

static mut INFERENCE_COUNT: u32 = 0;

/// Initialize the DNN benchmark
fn init() {
    unsafe {
        // Initialize weights with small values
        for i in 0..INPUT_SIZE {
            for j in 0..HIDDEN_SIZE {
                let w = ((i * 17 + j * 13) % 100) as i16 - 50;
                write_volatile(&mut WEIGHTS_IH[i][j], w);
            }
        }

        for i in 0..HIDDEN_SIZE {
            for j in 0..OUTPUT_SIZE {
                let w = ((i * 23 + j * 19) % 100) as i16 - 50;
                write_volatile(&mut WEIGHTS_HO[i][j], w);
            }
        }

        // Initialize input with sample data
        for i in 0..INPUT_SIZE {
            write_volatile(&mut INPUT[i], ((i * 7) % 256) as i16);
        }

        write_volatile(&mut INFERENCE_COUNT, 0);
    }
}

/// ReLU activation function
fn relu(x: i16) -> i16 {
    if x > 0 { x } else { 0 }
}

/// Forward pass through the network
fn forward_pass() {
    unsafe {
        // Input to hidden layer
        for j in 0..HIDDEN_SIZE {
            let mut sum: i32 = 0;
            for i in 0..INPUT_SIZE {
                let input_val = read_volatile(&INPUT[i]) as i32;
                let weight = read_volatile(&WEIGHTS_IH[i][j]) as i32;
                sum += input_val * weight;
            }
            let activated = relu((sum / 100) as i16);
            write_volatile(&mut HIDDEN[j], activated);
        }

        // Hidden to output layer
        for j in 0..OUTPUT_SIZE {
            let mut sum: i32 = 0;
            for i in 0..HIDDEN_SIZE {
                let hidden_val = read_volatile(&HIDDEN[i]) as i32;
                let weight = read_volatile(&WEIGHTS_HO[i][j]) as i32;
                sum += hidden_val * weight;
            }
            write_volatile(&mut OUTPUT[j], (sum / 100) as i16);
        }
    }
}

/// Run one iteration
fn run() -> bool {
    unsafe {
        // Perform forward pass
        forward_pass();

        // Update input for next iteration
        for i in 0..INPUT_SIZE {
            let val = read_volatile(&INPUT[i]);
            write_volatile(&mut INPUT[i], val.wrapping_add(1));
        }

        let count = read_volatile(&INFERENCE_COUNT);
        write_volatile(&mut INFERENCE_COUNT, count + 1);

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
