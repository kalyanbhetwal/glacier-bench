#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]
#![feature(asm_experimental_arch)]

extern crate panic_msp430;

use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

// GPIO toggle for debugging/measurement
#[inline(always)]
fn gpioTwiddle() {
    unsafe {
        use msp430fr5994::Peripherals;
        let dp = Peripherals::steal();
        // P1OUT |= BIT0; P1DIR |= BIT0; P1OUT &= ~BIT0;
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() | 0x01));
        dp.p1.p1dir().modify(|r, w| w.bits(r.bits() | 0x01));
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() & !0x01));
        // P1OUT |= BIT1; P1DIR |= BIT1; P1OUT &= ~BIT1;
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() | 0x02));
        dp.p1.p1dir().modify(|r, w| w.bits(r.bits() | 0x02));
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() & !0x02));
    }
}

// Utility functions implemented in Rust
#[inline(always)]
fn uartlink_close() {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn uartlink_open_tx() {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn uartlink_send(_buf: *const u8, _len: u16) {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn msp_sleep(_time: u16) {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn gpioUp() {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn gpioDown() {
    unsafe { core::arch::asm!("nop"); }
}

// Macro for big non-volatile variables in FRAM
macro_rules! big_nv {
    ($name:ident: $type:ty = $init:expr) => {{
        #[link_section = ".fram"]
        static mut $name: $type = $init;
        unsafe { &mut $name }
    }};
}

/* Globals for interrupt-driven sensor reading */
static mut SENSOR_VALUE: u16 = 0;
static mut SENSOR_SEED: u16 = 1;

//GUIDE: IO op annotations as pub static function pointer
#[no_mangle]
pub static IO_NAME: fn(u16) -> u16 = read_light;
#[no_mangle]
pub static IO_NAME1: fn() -> () = radio_on;
#[no_mangle]
pub static IO_NAME2: fn() -> () = radio_off;

// Simulated sensor functions
fn read_light(_count: u16) -> u16 {
    unsafe {
        read_volatile(&SENSOR_VALUE)
    }
}

// Generate sensor value (called from interrupt)
#[inline(always)]
fn generate_light_value(seed: u16) -> u16 {
    let mut val = seed;
    for _i in 0..50 {
        val = val.wrapping_add(1);
    }
    1400 + (val % 17)
}

fn radio_on() {
    let mut val = 0;
    for _i in 0..50 {
        val += 1;
    }
}

fn radio_off() {
    let mut val = 0;
    for _i in 0..50 {
        val += 1;
    }
}

const RADIO_PAYLOAD_LEN:usize = 1;
const RADIO_BOOT_CYCLES:u16 =  60;

const RADIO_CMD_SET_ADV_PAYLOAD:u8 = 0;

struct RadioPkt{
    cmd:u8,
    payload:[u8;RADIO_PAYLOAD_LEN],
}

//TODO: confirm that capy init does indeed initialize the radio pins
fn sense_and_send(count: u16) {
    let light: u16 = read_light(count);
    if light > 4000 {
        let packet: RadioPkt = RadioPkt {
            cmd: RADIO_CMD_SET_ADV_PAYLOAD,
            payload: [0x77],
        };
        radio_on();
        msp_sleep(RADIO_BOOT_CYCLES); // ~15ms @ ACLK/8

        uartlink_open_tx();
        // send size + 1 (size of packet.cmd)
        uartlink_send([packet.cmd, packet.payload[0]].as_ptr(), RADIO_PAYLOAD_LEN as u16 + 1);
        uartlink_close();

        // Heuristic number based on experiment
        msp_sleep(30 * (RADIO_PAYLOAD_LEN as u16));

        radio_off();
    }
}	

#[entry]
fn main() -> !
{
    // Initialize sensor timer interrupt
    init_sensor_timer();

    // Enable global interrupts
    unsafe {
        msp430::interrupt::enable();
    }

    loop {	
	let mut count:u16 = 0;
	
	for _i in 0..100 {
            //PROTECT_BEGIN();
	//    unsafe{ start_atomic();
	//	    printf(b"start\r\n\0".as_ptr());
	//	    end_atomic();}
	    //	PROTECT_END();
	    
	    
	    //PROTECT_BEGIN();
	    sense_and_send(count);
	    //PROTECT_END();
	    // translated code end
	    
	    //PROTECT_BEGIN();
	    //unsafe{start_atomic();
	    //printf(b"end %l\r\n\0".as_ptr(), count as u32);
	    //end_atomic();}
	    //PROTECT_END();
	    count+=1;
	}
	gpioTwiddle();
	gpioTwiddle();
    }
}

/// Timer interrupt handler for sensor data generation
#[no_mangle]
extern "msp430-interrupt" fn TIMER0_A0() {
    unsafe {
        let seed = read_volatile(&SENSOR_SEED);
        let value = generate_light_value(seed);
        write_volatile(&mut SENSOR_VALUE, value);
        write_volatile(&mut SENSOR_SEED, seed.wrapping_add(1));
    }
}

/// Initialize Timer_A0 for periodic sensor interrupts
fn init_sensor_timer() {
    unsafe {
        use msp430fr5994::Peripherals;
        let peripherals = Peripherals::steal();
        let timer = &peripherals.ta0;

        timer.ta0ctl().write(|w| w.mc().stop());
        timer.ta0ccr0().write(|w| w.bits(1000));
        timer.ta0ctl().modify(|_, w| w.taclr().set_bit());
        timer.ta0cctl0().modify(|_, w| w.ccie().set_bit());
        timer.ta0ctl().write(|w| {
            w.tassel().smclk()
             .id()._1()
             .mc().up()
        });
    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}