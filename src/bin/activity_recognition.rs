#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]

extern crate panic_msp430;

use msp430_rt::entry;
use core::ptr::{read_volatile, write_volatile};

// GPIO toggle for debugging/measurement
#[inline(always)]
fn gpioTwiddle() {
    unsafe {
        use msp430fr5994::Peripherals;
        let dp = Peripherals::steal();
        dp.p1.p1out().modify(|r, w| w.bits(r.bits() ^ 0x01));
    }
}

// Stub implementations for printf and output guards (not used in MSP430 target)
#[inline(always)]
fn output_guard_start() {}

#[inline(always)]
fn output_guard_end() {}

// Macro for big non-volatile variables in FRAM
macro_rules! big_nv {
    ($name:ident: $type:ty = $init:expr) => {{
        #[link_section = ".fram"]
        static mut $name: $type = $init;
        unsafe { &mut $name }
    }};
}

// Consistency annotation (no-op for now)
#[inline(always)]
fn Consistent<T>(_val: T, _id: u8) {}

// Freshness annotation (no-op for now)
#[inline(always)]
fn Fresh<T>(_val: &T) {}
// Number of samples to discard before recording training set
const NUM_WARMUP_SAMPLES:u16 = 3;

const ACCEL_WINDOW_SIZE:usize = 3;
const  MODEL_SIZE:usize = 16;
const SAMPLE_NOISE_FLOOR:u8 = 10; // TODO: made up value

// Number of classifications to complete in one experiment
const SAMPLES_TO_COLLECT:u16 = 128;

/*
#define TASK_CHECKPOINT(...)

#include "ftest_util.h"
void mspconsole_init();
 */
#[allow(non_camel_case_types)]
struct threeAxis_t_8{
    x:u8,
    y:u8,
    z:u8,
}

#[allow(non_camel_case_types)]
type accelReading = threeAxis_t_8;
#[allow(non_camel_case_types)]
type accelWindow = [accelReading; ACCEL_WINDOW_SIZE as usize];

#[allow(non_camel_case_types)]
struct features_t {
    meanmag: u32,      // Squared magnitude (avoids sqrt)
    stddevmag: u32,    // Squared magnitude (avoids sqrt)
}

#[allow(non_camel_case_types)]
enum class_t {
    CLASS_STATIONARY,
    CLASS_MOVING,
}

#[allow(non_camel_case_types)]
struct model_t {
    stationary: [features_t; MODEL_SIZE as usize],
    moving: [features_t; MODEL_SIZE as usize],
}

#[allow(non_camel_case_types)]
enum run_mode_t {
    MODE_IDLE = 3,
    MODE_TRAIN_STATIONARY = 2,
    MODE_TRAIN_MOVING = 1,
    MODE_RECOGNIZE = 0, // default
}
#[allow(non_camel_case_types)]
struct stats_t {
    totalCount:u16,
    movingCount:u16,
    stationaryCount: u16,
}

/* Globals for interrupt-driven sensor reading */
static mut SENSOR_VALUE: u8 = 0;
static mut SENSOR_SEED: u16 = 1;

#[no_mangle]
pub static IO_NAME:fn(u16) ->u8 = readSensor;

// Read the current sensor value (updated by timer interrupt)
// The input parameter is ignored - value comes from interrupt
#[no_mangle]
fn readSensor(_input:u16) -> u8
{
    unsafe {
        read_volatile(&SENSOR_VALUE)
    }
}

// Generate sensor value (called from interrupt)
#[inline(always)]
fn generate_sensor_value(seed: u16) -> u8 {
    (seed % 85) as u8
}

/*Needs more paras than original to account for no globals in Rust*/
fn accel_sample(nv_seed:& mut u16) -> threeAxis_t_8
{

    
    let mut seed:u16 = *nv_seed;
    //inferred region for Consistent set 1 will start here
    let xs = readSensor(seed*17);
    Consistent(xs,1);
    let ys = readSensor(seed*17*17);
    Consistent(ys,1);
    let zs = readSensor(seed*17*17*17);
    Consistent(zs,1);
    //region will end here
    let result: threeAxis_t_8 = threeAxis_t_8{x:xs, y:ys, z:zs};
    
    seed = seed +1;
    *nv_seed = seed;
    return result;
}


//#define accel_sample ACCEL_singleSample

fn acquire_window(window:&mut accelWindow, seed:& mut u16) -> ()
{
    //accelReading sample;
    let mut samplesInWindow:usize = 0;

    //TASK_CHECKPOINT();

    while samplesInWindow < ACCEL_WINDOW_SIZE {
        let sample: accelReading = accel_sample(seed);
        //LOG("acquire: sample %u %u %u\r\n", sample.x, sample.y, sample.z);

        window[samplesInWindow] = sample;
	samplesInWindow += 1;
    }
}

fn transform(window:&mut accelWindow) -> ()
{

    //LOG("transform\r\n");

    for i in 0..ACCEL_WINDOW_SIZE {
        let sample:&mut accelReading = &mut window[i];

        if sample.x < SAMPLE_NOISE_FLOOR ||
            sample.y < SAMPLE_NOISE_FLOOR ||
            sample.z < SAMPLE_NOISE_FLOOR {

            //LOG("transform: sample %u %u %u\r\n",
            //    sample->x, sample->y, sample->z);

            (*sample).x = if sample.x > SAMPLE_NOISE_FLOOR {sample.x} else {0};
            (*sample).y = if sample.y > SAMPLE_NOISE_FLOOR {sample.y} else {0};
            (*sample).z = if sample.z > SAMPLE_NOISE_FLOOR {sample.z} else {0};
        }
    }
}

fn featurize(features:&mut features_t, aWin:&accelWindow) -> ()
{
    //TASK_CHECKPOINT();

    let mut mean = accelReading {x:0,y:0,z:0};
    let mut stddev = accelReading {x:0,y:0,z:0};
    
    
    for i in 0..ACCEL_WINDOW_SIZE {
        mean.x += aWin[i].x;  // x
        mean.y += aWin[i].y;  // y
        mean.z += aWin[i].z;  // z
    }
    
    mean.x >>= 2;
    mean.y >>= 2;
    mean.z >>= 2;

    for i in 0..ACCEL_WINDOW_SIZE {
        stddev.x += if aWin[i].x > mean.x {aWin[i].x - mean.x} else
        {mean.x - aWin[i].x};  // x
        stddev.y += if aWin[i].y > mean.y { aWin[i].y - mean.y } else {
            mean.y - aWin[i].y};  // y
        stddev.z += if aWin[i].z > mean.z { aWin[i].z - mean.z } else
            { mean.z - aWin[i].z};  // z
    }
    
    stddev.x >>= 2;
    stddev.y >>= 2;
    stddev.z >>= 2;

    // Store squared magnitudes directly (avoids sqrt computation)
    let meanmag:u32 = mean.x as u32*mean.x as u32 + mean.y as u32 *mean.y as u32+
	mean.z as u32*mean.z as u32 ;
    let stddevmag:u32 = stddev.x as u32*stddev.x as u32 + stddev.y as u32*stddev.y as u32
	+ stddev.z as u32 *stddev.z as u32;

    features.meanmag   = meanmag;
    features.stddevmag = stddevmag;

    //LOG("featurize: mean %u sd %u\r\n", features->meanmag, features->stddevmag);
}
fn classify(features:&features_t, model:&model_t) -> class_t
{
    let mut move_less_error:i16 = 0;
    let mut stat_less_error:i16 = 0;
    let mut model_features:features_t = features_t{meanmag:0, stddevmag:0};

    //TASK_CHECKPOINT();

    for i in 0..MODEL_SIZE {
        model_features.meanmag = model.stationary[i].meanmag;
	model_features.stddevmag = model.stationary[i].stddevmag;

        let stat_mean_err:i32 = if model_features.meanmag > features.meanmag
        { (model_features.meanmag  - features.meanmag) as i32} else
        { (features.meanmag - model_features.meanmag) as i32};

        let stat_sd_err:i32 = if model_features.stddevmag > features.stddevmag
        {(model_features.stddevmag - features.stddevmag) as i32}
        else {(features.stddevmag - model_features.stddevmag) as i32};

        model_features.meanmag = model.moving[i].meanmag;
	    model_features.stddevmag = model.moving[i].stddevmag;

        let move_mean_err:i32 = if model_features.meanmag > features.meanmag
        {(model_features.meanmag - features.meanmag) as i32}
        else  {(features.meanmag - model_features.meanmag) as i32};

        let move_sd_err:i32 = if model_features.stddevmag > features.stddevmag
        {(model_features.stddevmag - features.stddevmag) as i32} else
        {(features.stddevmag - model_features.stddevmag) as i32};

        if move_mean_err < stat_mean_err {
            move_less_error+=1;
        } else {
            stat_less_error+=1;
        }

        if move_sd_err < stat_sd_err {
            move_less_error+=1;
        } else {
            stat_less_error+=1;
        }
    }

    let class:class_t = if move_less_error > stat_less_error
    {class_t::CLASS_MOVING} else {class_t::CLASS_STATIONARY };
    //LOG("classify: class %u\r\n", class);

    return class;
}

fn record_stats(stats:&mut stats_t, class:class_t) -> ()
{
    //TASK_CHECKPOINT();

    /* stats->totalCount, stats->movingCount, and stats->stationaryCount have an
     * nv-internal consistency requirement.  This code should be atomic. */

    stats.totalCount+=1;

    match class {
        class_t::CLASS_MOVING => stats.movingCount+=1,
            
        class_t::CLASS_STATIONARY => stats.stationaryCount+=1,
    }

/*    unsafe{printf(b"stats: s %u\0".as_ptr(),
		  stats.stationaryCount as u32);
    printf(b" m %u\0".as_ptr(),
	   stats.movingCount as u32);
    printf(b" t %u\r\n\0".as_ptr(),
		  stats.totalCount as u32);}*/
}

fn print_stats(stats:&stats_t) -> ()
{
    let _resultStationaryPct = stats.stationaryCount * 100 / stats.totalCount;
    let _resultMovingPct = stats.movingCount * 100 / stats.totalCount;

    let _sum = stats.stationaryCount + stats.movingCount;

    // Printing not supported in MSP430 target - stats collection only
    output_guard_start();
    // printf output disabled for MSP430
    output_guard_end();
}


fn warmup_sensor(seed:&mut u16) -> ()
{
    let mut discardedSamplesCount:u16 = 0;
    let mut _sample:accelReading;

    //TASK_CHECKPOINT();

    //LOG("warmup\r\n");

    while discardedSamplesCount < NUM_WARMUP_SAMPLES {
	_sample = accel_sample(seed);
	discardedSamplesCount += 1;
    }
}

fn train(classModel:&mut [features_t; MODEL_SIZE], seed:& mut u16) -> ()
{
    let mut sampleWindow:accelWindow= [accelReading{x:0,y:0, z:0},
				 accelReading{x:0,y:0, z:0},accelReading{x:0,y:0, z:0}];
    let mut features:features_t = features_t{meanmag:0, stddevmag:0};
    warmup_sensor(seed);

    for i in 0..MODEL_SIZE {
        acquire_window(&mut sampleWindow, seed);
        transform(&mut sampleWindow);
        featurize(&mut features, &sampleWindow);

        //TASK_CHECKPOINT();

        classModel[i].meanmag = features.meanmag;
	classModel[i].stddevmag = features.stddevmag;
    }

//    unsafe {
//	printf(b"train: done: mn %l sd %l\r\n\0".as_ptr(), features.meanmag as u32, features.stddevmag as u32);
    //}
    
}

fn recognize(model:&model_t, seed:&mut u16) -> ()
{
    let mut stats:stats_t = stats_t{totalCount:0,movingCount:0,stationaryCount:0};
    let mut sampleWindow:accelWindow = [accelReading{x:0,y:0, z:0},
				 accelReading{x:0,y:0, z:0},accelReading{x:0,y:0, z:0}];
    let mut features:features_t = features_t{meanmag:0, stddevmag:0};
    let mut class:class_t;
    
    for _i in 0..SAMPLES_TO_COLLECT {
        //inferred region for Fresh var 'class' will start here, 
        //before the first input it depends on
        acquire_window(&mut sampleWindow, seed);
        transform(&mut sampleWindow);
        featurize(&mut features, &sampleWindow);
        class = classify(&features, model);
	    Fresh(&class);
	    record_stats(&mut stats, class);
        //region for Fresh class will end here, as class is used in record_stats
    }

    print_stats(&stats);
}

fn end_of_benchmark() -> ()
{
//	output_guard_start();
//	printf(b"This is the end of the AR benchmark\r\n\0".as_ptr());
//	output_guard_end();
    //exit(0);
    //for measuring runtime, pulse twice
//    loop {};
}

fn count_error(_count:&u16) -> ()
{
    // Error logging not supported in MSP430 target
}


fn select_mode(prev_pin_state:&mut u8, count: &mut u16) -> u8 
{
    let mut pin_state:u8 = run_mode_t::MODE_IDLE as u8;

    //TASK_CHECKPOINT();

    *count = *count + 1;

    /* The InK order
     *  rounds:
     *      1,2 = MODE_TRAIN_MOVING
     *      3,4 = MODE_TRAIN_STATIONARY
     *      5,6 = MODE_RECOGNIZE
     *      7   = END OF BENCHMARK
     */
    match *count {
        1|2 => pin_state = run_mode_t::MODE_TRAIN_MOVING as u8,
        3|4 => pin_state = run_mode_t::MODE_TRAIN_STATIONARY as u8,
        5|6  => pin_state = run_mode_t::MODE_RECOGNIZE as u8,
        7 => end_of_benchmark(),
        _ => {
            pin_state = run_mode_t::MODE_IDLE as u8;
            count_error(count)
	},
    }

    //loop benchmark
    if *count == 7 {
	return run_mode_t::MODE_IDLE as u8;
    }

    //pin_state = GPIO(PORT_AUX, IN) & (BIT(PIN_AUX_1) | BIT(PIN_AUX_2));

    // Don't re-launch training after finishing training
    // Vito: could have done this while assigning pin_state. But keep is the same as the original
    if (pin_state == run_mode_t::MODE_TRAIN_STATIONARY as u8  ||
        pin_state == run_mode_t::MODE_TRAIN_MOVING as u8) &&
        pin_state == *prev_pin_state  {
        pin_state = run_mode_t::MODE_IDLE as u8;
    } else {
        *prev_pin_state = pin_state;
    }

    //LOG("selectMode: pins %04x\r\n", pin_state);

    return pin_state;
}

/// Timer interrupt handler for sensor data generation
/// Continuously generates new sensor readings at regular intervals
/// The accel_sample function reads these values when needed
#[no_mangle]
extern "msp430-interrupt" fn TIMER0_A0() {
    unsafe {
        // Read current seed
        let seed = read_volatile(&SENSOR_SEED);

        // Generate new sensor value
        let value = generate_sensor_value(seed);

        // Store the value (readSensor will read this)
        write_volatile(&mut SENSOR_VALUE, value);

        // Update seed for next reading
        write_volatile(&mut SENSOR_SEED, seed.wrapping_add(1));
    }
}

/// Initialize Timer_A0 for periodic sensor interrupts
fn init_sensor_timer() {
    unsafe {
        use msp430fr5994::Peripherals;
        let peripherals = Peripherals::steal();
        let timer = &peripherals.ta0;

        // Stop timer
        timer.ta0ctl().write(|w| w.mc().stop());

        // Configure for up mode, SMCLK, /1 divider
        // CCR0 = 1000 gives fast sensor sampling rate
        timer.ta0ccr0().write(|w| w.bits(1000));

        // Clear counter
        timer.ta0ctl().modify(|_, w| w.taclr().set_bit());

        // Enable CCR0 interrupt
        timer.ta0cctl0().modify(|_, w| w.ccie().set_bit());

        // Start timer in up mode, SMCLK, /1 divider
        timer.ta0ctl().write(|w| {
            w.tassel().smclk()  // SMCLK
             .id()._1()         // /1 divider
             .mc().up()         // Up mode
        });
    }
}

#[entry]
fn main() -> !
{
    // previous "Globals" must be declared nv here, as mut globals are unsafe in rust
    let mut prev_pin_state:u8 = run_mode_t::MODE_IDLE as u8;
    //NVM unsigned int count = 1;
    //NVM model_t model;

    let count: &'static mut u16 = big_nv!(COUNT_NV: u16 = 1);
    let model: &'static mut model_t =
	big_nv!(MODEL_NV:model_t = model_t{
	    moving:[features_t{meanmag:0,stddevmag:0}, features_t{meanmag:0,stddevmag:0}, features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0}],
	    stationary:[features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},features_t{meanmag:0,stddevmag:0},
		    features_t{meanmag:0,stddevmag:0}]
			       });
    //nv!(model, model_t);
     let _v_seed: &'static mut u16 = big_nv!(SEED_NV: u16 = 1);

    // Initialize sensor timer interrupt
    init_sensor_timer();

    // Enable global interrupts
    unsafe {
        msp430::interrupt::enable();
    }

    //count = 1;
    loop {
	let mut localSeed = *_v_seed;
	let mode:u8 = select_mode(&mut prev_pin_state, count);
	if mode == 2 {
	    train(&mut model.stationary, &mut localSeed);
	} else if mode == 1 {
	    
	    train(&mut model.moving, &mut localSeed);
	} else if mode == 0 {
	    recognize(&model, &mut localSeed);
	
	} else if mode == 3 && *count == 7{
	    //idle, for restarting the bench
	    localSeed = 1;
	    *count = 1;
	    prev_pin_state = run_mode_t::MODE_IDLE as u8;
	    gpioTwiddle();
	    gpioTwiddle();
	}
	*_v_seed = localSeed;

    }
}

#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}