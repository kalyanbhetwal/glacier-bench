# Glacier Benchmark Suite

This repository contains a collection of standalone benchmarks for intermittent computing research on MSP430 microcontrollers. Each benchmark is a self-contained binary that can be built and uploaded independently.

**New in this version:** Four benchmarks now feature **interrupt-driven concurrency** using MSP430 timer interrupts, enabling realistic real-time embedded behavior and concurrent task execution.

## Available Benchmarks

1. **activity_recognition** - Activity Recognition ⚡ *Interrupt-Driven*
2. **bitcount** - Bit Counting Operations
3. **bitcount_cmp** - Bit Count Algorithm Comparison
4. **blowfish** - Blowfish Encryption
5. **cem** - Cold-chain Equipment Monitor ⚡ *Interrupt-Driven*
6. **cuckoo** - Cuckoo Filter
7. **dnn** - Deep Neural Network Inference
8. **event_monitor** - Event Monitoring and Logging ⚡ *Interrupt-Driven*
9. **kvstore** - Key-Value Store
10. **message_queue** - FIFO Message Queue
11. **periodic_sensing** - Periodic Sensor Sampling ⚡ *Interrupt-Driven*
12. **rsa** - RSA Encryption

## Interrupt-Driven Concurrency

Four benchmarks implement **interrupt-driven concurrency** using MSP430 hardware timers. This enables realistic real-time embedded system behavior where interrupts handle time-critical tasks while the main loop processes heavier computations.

### Architecture

| Benchmark | Timer Used | Interrupt Frequency | ISR Task | Main Loop Task |
|-----------|-----------|---------------------|----------|----------------|
| **periodic_sensing** | Timer_A0 | 10 Hz (100ms) | Sensor sampling, statistics updates | Buffer processing when full |
| **event_monitor** | Timer_A1 | 20 Hz (50ms) | Event detection, filtering, logging | Background tasks / sleep |
| **activity_recognition** | Timer_A2 | 10 Hz (100ms) | Accelerometer sampling | Feature extraction, classification |
| **cem** | Timer_A3 | 2 Hz (500ms) | Temperature reading, logging | Violation analysis |

### Key Features

- **Hardware Timer Interrupts**: Uses MSP430's Timer_A peripherals (TA0-TA3)
- **Concurrent Execution**: ISRs run asynchronously, main loop handles background tasks
- **Real-Time Constraints**: Interrupts ensure timely sensor sampling/event handling
- **Power-Aware Design**: Main loop can enter low-power modes between interrupts
- **MSP430 ABI**: Uses `extern "msp430-interrupt"` with `#![feature(abi_msp430_interrupt)]`

### Implementation Details

Each interrupt-driven benchmark follows this pattern:

```rust
#![feature(abi_msp430_interrupt)]

// Timer configuration
fn setup_timer() {
    // Configure Timer_Ax for periodic interrupts
    // Set frequency, enable interrupt, start timer
}

// Interrupt Service Routine
#[no_mangle]
extern "msp430-interrupt" fn TIMERx_A0() {
    // Time-critical task (sensor reading, event detection)
    // Set flags for main loop processing
}

#[entry]
fn main() -> ! {
    init();
    setup_timer();
    unsafe { msp430::interrupt::enable(); }

    loop {
        // Process events flagged by ISR
        // Heavy computation tasks
        // Low-power sleep
    }
}
```

### Why Not RTIC?

**RTIC** (Real-Time Interrupt-driven Concurrency) is a popular framework for embedded Rust, but:
- RTIC is designed for **ARM Cortex-M** microcontrollers only
- `msp430-rtfm` exists but is **unmaintained**
- Raw interrupt approach provides **full control** needed for intermittent computing research
- Direct timer access allows fine-tuning for power-failure scenarios

### Assembly Code Size Impact

Interrupt-driven versions have slightly larger code due to ISR overhead:

| Benchmark | Original Size | Interrupt Version | Increase |
|-----------|---------------|-------------------|----------|
| periodic_sensing | 8.5K | 9.4K | +11% |
| event_monitor | 10K | 11K | +10% |
| activity_recognition | 31K | 32K | +3% |
| cem | 12K | 14K | +17% |

The size increase is justified by realistic concurrent behavior and real-time guarantees.

## Project Structure

```
src/
├── bin/                              # Standalone benchmark binaries
│   ├── activity_recognition.rs       # Activity Recognition
│   ├── bitcount.rs                   # Bit Counting
│   ├── bitcount_cmp.rs               # Bit Count Comparison
│   ├── blowfish.rs                   # Blowfish Encryption
│   ├── cem.rs                        # Cold-chain Equipment Monitor
│   ├── cuckoo.rs                     # Cuckoo Filter
│   ├── dnn.rs                        # DNN Inference
│   ├── event_monitor.rs              # Event Monitor
│   ├── kvstore.rs                    # Key-Value Store
│   ├── message_queue.rs              # Message Queue
│   ├── periodic_sensing.rs           # Periodic Sensing
│   └── rsa.rs                        # RSA Encryption
└── main.rs                           # Template (not used)
```

## Building Individual Benchmarks

Each benchmark is a separate binary that can be built and uploaded independently.

### Build a specific benchmark

```bash
cargo build --bin activity_recognition --release
cargo build --bin bitcount --release
cargo build --bin bitcount_cmp --release
cargo build --bin blowfish --release
cargo build --bin cem --release
cargo build --bin cuckoo --release
cargo build --bin dnn --release
cargo build --bin event_monitor --release
cargo build --bin kvstore --release
cargo build --bin message_queue --release
cargo build --bin periodic_sensing --release
cargo build --bin rsa --release
```

### Build all benchmarks

```bash
cargo build --bins --release
```

## Uploading to Device

After building, the binaries will be located at:
```
target/msp430-none-elf/release/<benchmark-name>
```

### Upload using mspdebug

In one terminal session:
```bash
mspdebug -C mspdebug.cfg rf2500
```

In another terminal session:
```bash
# Example: Upload CEM benchmark
msp430-elf-gdb -x mspdebug.gdb target/msp430-none-elf/release/cem

# Example: Upload DNN benchmark
msp430-elf-gdb -x mspdebug.gdb target/msp430-none-elf/release/dnn
```

## Benchmark Descriptions

Each benchmark is completely self-contained with all code in a single file.

### Activity Recognition (activity_recognition) ⚡ *Interrupt-Driven*
Comprehensive activity recognition benchmark with detailed feature extraction and classification. **Uses Timer_A2 interrupts (10 Hz)** to sample accelerometer data at regular intervals. The ISR collects sensor readings into a sliding window, while the main loop performs computationally intensive feature extraction and classification when a full window is available. Detects activities: standing, walking, running. Complete in `src/bin/activity_recognition.rs`.

### Bit Count (bitcount)
Counts set bits in data arrays. Tests bit manipulation and counting operations common in data processing applications. Self-contained in `src/bin/bitcount.rs`.

### Bit Count Compare (bitcount_cmp)
Compares different bit counting algorithms (naive vs optimized). Useful for evaluating algorithm efficiency in intermittent systems. Complete in `src/bin/bitcount_cmp.rs`.

### Blowfish Encryption (blowfish)
Simplified Blowfish block cipher implementation. Tests symmetric encryption operations in resource-constrained environments. Full implementation in `src/bin/blowfish.rs`.

### Cold-chain Equipment Monitor (cem) ⚡ *Interrupt-Driven*
Simulates temperature monitoring and data logging for cold-chain equipment. **Uses Timer_A3 interrupts (2 Hz)** to read temperature sensors every 500ms. The ISR performs temperature reading, threshold checking, and logging, while the main loop performs periodic analysis of logged data to detect temperature violations. Tests sensor reading, data processing, and logging operations. Fully contained in `src/bin/cem.rs`.

### Cuckoo Filter (cuckoo)
Implementation of a Cuckoo filter for approximate set membership queries. More memory-efficient than Bloom filters and supports deletions. Complete in `src/bin/cuckoo.rs`.

### Deep Neural Network (dnn)
Simplified neural network inference with input, hidden, and output layers. Tests matrix operations and activation functions. Full implementation in `src/bin/dnn.rs`.

### Event Monitor (event_monitor) ⚡ *Interrupt-Driven*
Monitors system events with filtering and logging capabilities. **Uses Timer_A1 interrupts (20 Hz)** to detect and log system events at 50ms intervals. The ISR generates events, applies filtering logic, and logs events to a circular buffer. Tests real-time event detection, classification, and circular logging under interrupt-driven execution. Complete in `src/bin/event_monitor.rs`.

### Key-Value Store (kvstore)
Hash table based key-value storage with collision handling. Tests data structure operations and persistence. Self-contained in `src/bin/kvstore.rs`.

### Message Queue (message_queue)
Circular FIFO queue for message passing. Tests queue operations (enqueue/dequeue) and message handling. Complete in `src/bin/message_queue.rs`.

### Periodic Sensing (periodic_sensing) ⚡ *Interrupt-Driven*
Simulates periodic sensor sampling with statistics computation (min, max, average). **Uses Timer_A0 interrupts (10 Hz)** to sample sensors at 100ms intervals. The ISR handles time-critical sensor reading and incremental statistics updates, while the main loop processes the full buffer and computes aggregate statistics when the buffer is full. Tests data aggregation, rolling buffers, and interrupt-driven sensing. Full implementation in `src/bin/periodic_sensing.rs`.

### RSA Encryption (rsa)
Simplified RSA implementation using small key sizes suitable for embedded systems. Tests cryptographic operations under intermittent power. Self-contained in `src/bin/rsa.rs`.

## Notes

- All benchmarks use `read_volatile`/`write_volatile` for power-failure resilience
- Built with `opt-level = "s"` for size optimization
- Uses LTO (Link-Time Optimization) for better code size
- Designed for MSP430FR5994 microcontroller
- Each benchmark is fully self-contained with no shared libraries or modules
- **Four benchmarks use hardware timer interrupts** for realistic concurrent execution
- Interrupt-driven benchmarks require `#![feature(abi_msp430_interrupt)]` nightly feature
- Assembly dumps available in `asm_dumps/` directory for all benchmarks

## Concurrent Execution Model

The interrupt-driven benchmarks demonstrate two execution models:

### Polled Execution (8 benchmarks)
Traditional embedded pattern where the main loop continuously polls and processes:
- bitcount, bitcount_cmp, blowfish, cuckoo
- dnn, kvstore, message_queue, rsa

### Interrupt-Driven Execution (4 benchmarks)
Realistic real-time pattern with concurrent ISR and main loop execution:
- **periodic_sensing**: Timer ISR samples sensors → Main loop aggregates data
- **event_monitor**: Timer ISR detects events → Main loop can perform background tasks
- **activity_recognition**: Timer ISR collects sensor data → Main loop classifies activities
- **cem**: Timer ISR monitors temperature → Main loop analyzes violations

This dual approach enables research into both:
1. **Sequential intermittent execution** (polled benchmarks)
2. **Concurrent intermittent execution** with interrupt-driven behavior (interrupt benchmarks)
