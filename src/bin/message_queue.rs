//! Message Queue Benchmark
//!
//! Circular message queue for intermittent systems.
//! Tests FIFO operations and message passing.

#![no_main]
#![no_std]

extern crate panic_msp430;

use msp430::asm;
use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

#[allow(unused)]
use msp430fr5994;

const QUEUE_SIZE: usize = 64;

#[derive(Clone, Copy)]
#[repr(C)]
struct Message {
    msg_type: u8,
    payload: u32,
    timestamp: u32,
}

static mut QUEUE: [Message; QUEUE_SIZE] = [Message {
    msg_type: 0,
    payload: 0,
    timestamp: 0,
}; QUEUE_SIZE];

static mut HEAD: usize = 0;
static mut TAIL: usize = 0;
static mut COUNT: usize = 0;
static mut ENQUEUE_COUNT: u32 = 0;
static mut DEQUEUE_COUNT: u32 = 0;
static mut TIMESTAMP: u32 = 0;

/// Initialize the message queue
fn init() {
    unsafe {
        for i in 0..QUEUE_SIZE {
            write_volatile(&mut QUEUE[i].msg_type, 0);
            write_volatile(&mut QUEUE[i].payload, 0);
            write_volatile(&mut QUEUE[i].timestamp, 0);
        }
        write_volatile(&mut HEAD, 0);
        write_volatile(&mut TAIL, 0);
        write_volatile(&mut COUNT, 0);
        write_volatile(&mut ENQUEUE_COUNT, 0);
        write_volatile(&mut DEQUEUE_COUNT, 0);
        write_volatile(&mut TIMESTAMP, 0);
    }
}

/// Check if queue is full
fn is_full() -> bool {
    unsafe { read_volatile(&COUNT) >= QUEUE_SIZE }
}

/// Check if queue is empty
fn is_empty() -> bool {
    unsafe { read_volatile(&COUNT) == 0 }
}

/// Enqueue a message
fn enqueue(msg: Message) -> bool {
    if is_full() {
        return false;
    }

    unsafe {
        let tail = read_volatile(&TAIL);

        write_volatile(&mut QUEUE[tail].msg_type, msg.msg_type);
        write_volatile(&mut QUEUE[tail].payload, msg.payload);
        write_volatile(&mut QUEUE[tail].timestamp, msg.timestamp);

        let next_tail = (tail + 1) % QUEUE_SIZE;
        write_volatile(&mut TAIL, next_tail);

        let count = read_volatile(&COUNT);
        write_volatile(&mut COUNT, count + 1);

        let enq_count = read_volatile(&ENQUEUE_COUNT);
        write_volatile(&mut ENQUEUE_COUNT, enq_count + 1);

        true
    }
}

/// Dequeue a message
fn dequeue() -> Option<Message> {
    if is_empty() {
        return None;
    }

    unsafe {
        let head = read_volatile(&HEAD);

        let msg = Message {
            msg_type: read_volatile(&QUEUE[head].msg_type),
            payload: read_volatile(&QUEUE[head].payload),
            timestamp: read_volatile(&QUEUE[head].timestamp),
        };

        let next_head = (head + 1) % QUEUE_SIZE;
        write_volatile(&mut HEAD, next_head);

        let count = read_volatile(&COUNT);
        write_volatile(&mut COUNT, count - 1);

        let deq_count = read_volatile(&DEQUEUE_COUNT);
        write_volatile(&mut DEQUEUE_COUNT, deq_count + 1);

        Some(msg)
    }
}

/// Run one iteration
fn run() -> bool {
    unsafe {
        let ts = read_volatile(&TIMESTAMP);

        // Create a message
        let msg = Message {
            msg_type: ((ts % 5) as u8),
            payload: ts * 1000,
            timestamp: ts,
        };

        // Enqueue
        enqueue(msg);

        // Dequeue if queue has items
        if !is_empty() && ts % 3 == 0 {
            let _msg = dequeue();
        }

        write_volatile(&mut TIMESTAMP, ts + 1);

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
