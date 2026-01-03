#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]
#![feature(asm_experimental_arch)]

extern crate panic_msp430;

use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

// Provide memcpy for floating-point operations
#[no_mangle]
pub unsafe extern "C" fn memcpy(dest: *mut u8, src: *const u8, n: usize) -> *mut u8 {
    let mut i = 0;
    while i < n {
        *dest.add(i) = *src.add(i);
        i += 1;
    }
    dest
}

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
fn gpioUp() {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn gpioDown() {
    unsafe { core::arch::asm!("nop"); }
}

#[inline(always)]
fn gpioOneTwiddle() {
    unsafe {
        use msp430fr5994::Peripherals;
        let dp = Peripherals::steal();
        // P1OUT |= BIT0; P1DIR |= BIT0; P1OUT &= ~BIT0;
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() | 0x01));
        dp.p1.p1dir().modify(|r, w| w.bits(r.bits() | 0x01));
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() & !0x01));
    }
}

#[inline(always)]
fn delay(_time: u32) {
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
static mut SENSOR_ADC: u16 = 0;
static mut SENSOR_TEMP: u16 = 0;
static mut SENSOR_SEED: u16 = 1;

//GUIDE: IO op annotations as pub static function pointer
#[no_mangle]
pub static IO_NAME: fn() -> u16 = adcConfig;
#[no_mangle]
pub static IO_NAME2: fn(u16) -> u16 = adcSample;
#[no_mangle]
pub static IO_NAME3: fn() -> u16 = tempConfig;
#[no_mangle]
pub static IO_NAME4: fn(u16) -> f32 = tempDegC;

// Simulating the sensor driver functions
fn adcConfig() -> u16 {
    let mut reg = 0;
    for _i in 0..40 {
        reg += 1;
    }
    0
}

fn tempConfig() -> u16 {
    let mut reg = 0;
    for _i in 0..40 {
        reg += 1;
    }
    0
}

fn adcSample(_count: u16) -> u16 {
    unsafe {
        read_volatile(&SENSOR_ADC)
    }
}

fn tempDegC(_count: u16) -> f32 {
    unsafe {
        let temp_val = read_volatile(&SENSOR_TEMP);
        4.7 + temp_val as f32
    }
}

// Generate sensor values (called from interrupt)
#[inline(always)]
fn generate_adc_value(seed: u16) -> u16 {
    1000 + (seed % 17)
}

#[inline(always)]
fn generate_temp_value(seed: u16) -> u16 {
    seed % 50
}

//GUIDE: and now write the app in rust normally

pub const SAMPLE_SIZE:usize  = 5;

struct Tuple {
    m:u16,
    t:f32,
}


fn calcAvg(moisture:&[u16], temperature:&[f32]) -> Tuple
{
    let mut avg:Tuple = Tuple{m:0, t:0.0};
    for i in 0..SAMPLE_SIZE
    {
        avg.m += moisture[i];
        avg.t = avg.t + temperature[i];
    }
    avg.m = avg.m/(SAMPLE_SIZE as u16);
    avg.t = avg.t/(SAMPLE_SIZE as f32);
    return avg;
}

fn storeData(m:u16, t:f32, moisture:&mut [u16], temperature:&mut [f32]) -> ()
{
    for i in 1..SAMPLE_SIZE
    {
        moisture[i] = moisture[i-1];
        temperature[i] = temperature[i-1];
    }
    moisture[0] = m;
    temperature[0] = t;
}

fn compute(avg: &Tuple) {
    if avg.t > 10.0 && avg.t < 22.0 {
        gpioOneTwiddle();
    } else if avg.t >= 22.0 {
        gpioOneTwiddle();
        gpioOneTwiddle();
    } else {
        gpioOneTwiddle();
        gpioOneTwiddle();
        gpioOneTwiddle();
    }
}

fn sendData(data:&Tuple) -> ()
{
    //unsafe{ delay(30000)};
    //M: tweak this to actually send a radio packet as in send_photo? 
    let mut i:u16 = 0;
    while i < 3000 {
	i+=1;
    }
}

#[entry]
fn main() -> !
{
    let senseCount1:&'static mut u8 = big_nv!(SENSE1:u8 = 0);
    let senseCount2:&'static mut u8 = big_nv!(SENSE2:u8 = 0);
    let computeCount:&'static mut u8 = big_nv!(COMPUTEC:u8 = 0);
    let sendCount:&'static mut u8 = big_nv!(SENDC:u8 = 0);

    let moisture:&'static mut[u16;SAMPLE_SIZE] = big_nv!(MOISTURE:[u16;SAMPLE_SIZE] = [0,0,0,0,0]);
    let temperature:&'static mut[f32;SAMPLE_SIZE] = big_nv!(TEMPERATURE:[f32;SAMPLE_SIZE] = [0.0,0.0,0.0,0.0,0.0]);
    let moist:&'static mut u16 = big_nv!(MOIST:u16 = 0);
    let temp:&'static mut f32 = big_nv!(TEMP:f32 = 0.0);
    let moistTempAvg:&'static mut Tuple = big_nv!(AVG:Tuple = Tuple{m:0, t:0.0});

    // Initialize sensor timer interrupt
    init_sensor_timer();

    // Enable global interrupts
    unsafe {
        msp430::interrupt::enable();
    }

    loop {
        //platformInit();
        //if(P8IN & 0x02)
        for _i in 0..40 {
            // checkpoint
            let _init = adcConfig();

            *moist = adcSample(_i);
            *senseCount1 += 1;

            let _init2 = tempConfig();

            *temp = tempDegC(_i);
            *senseCount2 += 1;

            // checkpoint
	    storeData(*moist, *temp, moisture, temperature);

            // checkpoint
	    let moistTempAvgLocal = calcAvg(moisture, temperature);
	    
	    moistTempAvg.m = moistTempAvgLocal.m;
            moistTempAvg.t = moistTempAvgLocal.t;
            /*unsafe {
		output_guard_start();
                printf(b"Moisture: %l Moist avg.:%l Temp: %l MoistTempAvg: %l overflow %l %l %l \n\r\0".as_ptr(),
                       *moist as u32, moistTempAvg.m as u32, *temp as f64, moistTempAvg.t as f64, 0, 0, 0);
		output_guard_end();
            }*/
            compute(moistTempAvg);
            *computeCount+=1;

            // checkpoint
	    
            sendData(moistTempAvg);
            *sendCount+=1;

            // checkpoint
	    //delay(5);
        }
	gpioTwiddle();
        gpioTwiddle();
	*senseCount1 = 0;
	*senseCount2 = 0;
	*computeCount = 0;
	*sendCount = 0;
    }
}

/// Timer interrupt handler for sensor data generation
#[no_mangle]
extern "msp430-interrupt" fn TIMER0_A0() {
    unsafe {
        let seed = read_volatile(&SENSOR_SEED);

        let adc_val = generate_adc_value(seed);
        let temp_val = generate_temp_value(seed);

        write_volatile(&mut SENSOR_ADC, adc_val);
        write_volatile(&mut SENSOR_TEMP, temp_val);
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