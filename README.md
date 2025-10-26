# Glacier Benchmark Suite

This repository contains a collection of standalone benchmarks for intermittent computing research on MSP430 microcontrollers. Each benchmark is a self-contained binary that can be built and uploaded independently.

**⚡ New:** Four benchmarks now feature **interrupt-driven concurrency** using MSP430 timer interrupts for realistic real-time embedded behavior!

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

Four benchmarks use **MSP430 Timer_A interrupts** for concurrent execution:

- **periodic_sensing** (Timer_A0 @ 10Hz): ISR samples sensors, main loop aggregates
- **event_monitor** (Timer_A1 @ 20Hz): ISR detects events, main loop processes
- **activity_recognition** (Timer_A2 @ 10Hz): ISR collects data, main loop classifies
- **cem** (Timer_A3 @ 2Hz): ISR monitors temperature, main loop analyzes

See [BENCHMARKS.md](BENCHMARKS.md) for detailed documentation.

## Project Structure

```
src/
├── bin/                              # Standalone benchmark binaries
│   ├── activity_recognition.rs       # Activity Recognition ⚡
│   ├── bitcount.rs                   # Bit Counting
│   ├── bitcount_cmp.rs               # Bit Count Comparison
│   ├── blowfish.rs                   # Blowfish Encryption
│   ├── cem.rs                        # Cold-chain Equipment Monitor ⚡
│   ├── cuckoo.rs                     # Cuckoo Filter
│   ├── dnn.rs                        # DNN Inference
│   ├── event_monitor.rs              # Event Monitor ⚡
│   ├── kvstore.rs                    # Key-Value Store
│   ├── message_queue.rs              # Message Queue
│   ├── periodic_sensing.rs           # Periodic Sensing ⚡
│   └── rsa.rs                        # RSA Encryption
└── main.rs                           # Template (not used)
```

⚡ = Interrupt-driven with hardware timer

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

### Activity Recognition (activity_recognition) ⚡

Interrupt-driven activity recognition using Timer_A2 (10 Hz). ISR samples accelerometer data, main loop performs feature extraction and classification. Detects: standing, walking, running. Complete in `src/bin/activity_recognition.rs`.

### Bit Count (bitcount)

Counts set bits in data arrays. Tests bit manipulation and counting operations. Self-contained in `src/bin/bitcount.rs`.

### Bit Count Compare (bitcount_cmp)

Compares naive vs optimized bit counting algorithms. Evaluates algorithm efficiency. Complete in `src/bin/bitcount_cmp.rs`.

### Blowfish Encryption (blowfish)

Simplified Blowfish block cipher implementation. Tests symmetric encryption operations. Full implementation in `src/bin/blowfish.rs`.

### Cold-chain Equipment Monitor (cem) ⚡

Interrupt-driven temperature monitoring using Timer_A3 (2 Hz). ISR reads temperature and logs data, main loop analyzes violations. Complete in `src/bin/cem.rs`.

### Cuckoo Filter (cuckoo)

Cuckoo filter for approximate set membership queries. More memory-efficient than Bloom filters, supports deletions. Complete in `src/bin/cuckoo.rs`.

### Deep Neural Network (dnn)

Neural network inference with input, hidden, and output layers. Tests matrix operations and activation functions. Full implementation in `src/bin/dnn.rs`.

### Event Monitor (event_monitor) ⚡

Interrupt-driven event monitoring using Timer_A1 (20 Hz). ISR detects and filters events, logs to circular buffer. Complete in `src/bin/event_monitor.rs`.

### Key-Value Store (kvstore)

Hash table based key-value storage with collision handling. Tests data structure operations. Self-contained in `src/bin/kvstore.rs`.

### Message Queue (message_queue)

Circular FIFO queue for message passing. Tests queue operations (enqueue/dequeue). Complete in `src/bin/message_queue.rs`.

### Periodic Sensing (periodic_sensing) ⚡

Interrupt-driven sensor sampling using Timer_A0 (10 Hz). ISR samples sensors and updates statistics, main loop aggregates data. Complete in `src/bin/periodic_sensing.rs`.

### RSA Encryption (rsa)

Simplified RSA implementation using small key sizes. Tests cryptographic operations under intermittent power. Self-contained in `src/bin/rsa.rs`.

## Notes

- All benchmarks use `read_volatile`/`write_volatile` for power-failure resilience
- Built with `opt-level = "s"` for size optimization
- Uses LTO (Link-Time Optimization) for better code size
- Designed for MSP430FR5994 microcontroller
- Each benchmark is fully self-contained with no shared libraries or modules
- **Four benchmarks use hardware timer interrupts** for realistic concurrent execution
- Interrupt-driven benchmarks require `#![feature(abi_msp430_interrupt)]` nightly feature
- Assembly dumps available in `asm_dumps/` directory

# License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or
  http://www.apache.org/licenses/LICENSE-2.0)

- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)
  at your option.

## Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in the work by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

[team]: https://github.com/rust-embedded/wg#the-msp430-team
