#![no_main]
#![no_std]
#![feature(abi_msp430_interrupt)]
#![feature(asm_experimental_arch)]

extern crate panic_msp430; // For now, we only have an infinitely-looping panic handler.

use core::arch::asm;
use core::ptr;

use msp430::asm;
use msp430_rt::entry;
use msp430_rt::interrupt;

#[allow(unused)]
// Bring interrupt vectors into scope so the linker can see them; enabling the "rt"
// feature of msp430fr5994 transitively enables the "device" feature of msp430-rt.
// This prevents default interrupt vectors from being generated.
use msp430fr5994;

mod checkpoint;
// #[link_section = ".fram"]



static mut sp1: *mut u16 = 0x4402 as *mut u16;
static mut sp2: *mut u16 = 0x4404 as *mut u16;

static mut spr: *mut u16 = 0x4800 as *mut u16;
// static mut prev_ins_addr: *mut u16 = 0x4400 as *mut u16;

// static mut size: u16 = 0;


#[entry]
unsafe fn  main() -> ! {

    let dp = msp430fr5994::Peripherals::steal();
    dp.wdt_a.wdtctl().write(|w| unsafe {
        w.bits(0x5A00 | 0x0080) // 0x5A00 is the password, 0x0080 is the hold bit
    });

   // dp.pmm.pm5ctl0().write(|w| w.locklpm5().locklpm5_0());
   *dp.pmm.pm5ctl0().as_ptr()  =  *dp.pmm.pm5ctl0().as_ptr() & !(0x01);

  //for blinking led

    dp.p1.p1out().modify(|r, w| w.bits(r.bits() &!(0x03)));
    dp.p1.p1dir().modify(|r, w| w.bits(r.bits() | 0x03));

    // *dp.p1.p1dir().as_ptr() =  *dp.p1.p1dir().as_ptr() | 0x03;
  



//for enabling port5 interrupt
    dp.p5.p5dir().write(|w | w.bits(!(0b01000000)));
    dp.p5.p5out().write(|w| w.bits(0b01000000));
    dp.p5.p5ren().write(|w| w.bits(0b01000000));

    dp.p5.p5ie().write(|w| w.bits(0b01000000));
    dp.p5.p5ies().write(|w| w.bits(0b01000000));
    dp.p5.p5ifg().write(|w| w.bits(!(0b01000000)));

    core::arch::asm!("bis #0x0018, SR");
    //*P5IFG |= 0b01000000;

    *dp.p5.p5ifg().as_ptr() |= 0b01000000; 


    //restore();
    //save_main_stack(0x0011, r0);  //from base stack and current sp
    //set sp1 with current sp value

    checkpoint_main(sp1, spr);
    asm!("mov pc, r4");  // this will be the return poiint after handling power failure


   loop {
   }
}

// The compiler will emit calls to the abort() compiler intrinsic if debug assertions are
// enabled (default for dev profile). MSP430 does not actually have meaningful abort() support
// so for now, we create our own in each application where debug assertions are present.
#[no_mangle]
extern "C" fn abort() -> ! {
    panic!();
}

#[no_mangle]
unsafe extern  "msp430-interrupt" fn TIMER0_A0() {

    let mut a = core::ptr::read_volatile(0x4402 as *mut u16);
    a = a + 10;
    core::ptr::write_volatile(0x4404 as *mut u16,a );
    let mut a = core::ptr::read_volatile(0x4406 as *mut u16);
    a = a + 10;
    core::ptr::write_volatile(0x4408 as *mut u16,a );


}


#[no_mangle]
unsafe extern "msp430-interrupt" fn TIMER0_A1() {
    let a = 0;
    let b = 1;
    let c = a + b;
}