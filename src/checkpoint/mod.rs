#![allow(unsafe_code, non_upper_case_globals)]

use core::mem;
use core::ptr;
use core::arch::asm;

// Memory locations for MSP430FR5994
pub static mut transcation_log: u16 = 0x4400; // Start of FRAM
pub static mut data_loc: u16 = 0x4500; // Data section in FRAM
pub static mut execution_mode: bool = true;  //1. true is jit 2.false is static 
pub static mut counter: *mut u16 = 0x1C00 as *mut u16; // RAM location

pub fn save_variables<T>(mem_loc: *const T, size: usize) {
    unsafe {
        ptr::write(transcation_log as *mut u16, mem_loc as u16);
        transcation_log += 2;
        ptr::write(transcation_log as *mut u16, size as u16);
        transcation_log += 2;
        ptr::write(data_loc as *mut u16, *(mem_loc as *const u16));
        data_loc += 2;
        *counter = *counter + 1;
    }
}

pub fn start_atomic() {
    unsafe { execution_mode = false; }
}

pub fn end_atomic() {
    unsafe {
        transcation_log = 0x4400;
        data_loc = 0x4500;
        execution_mode = true;
        *counter = 0;
    }
}

#[no_mangle]
pub fn checkpoint(c_type: bool) {
    unsafe { asm!("NOP"); }

    let r4_value: u16;
    let r5_value: u16;
    let r6_value: u16;
    let r7_value: u16;
    let r8_value: u16;
    let r9_value: u16;
    let r10_value: u16;
    let r11_value: u16;
    let r12_value: u16;
    let r13_value: u16;
    let r14_value: u16;
    let r15_value: u16;
    let sp_value: u16;

    unsafe {
        asm!(
            "mov.w r1, {0}",
            out(reg) sp_value
        );
    }

    unsafe {
        asm!(
            "mov.w r4, {0}",
            out(reg) r4_value
        );
    }

    unsafe {
        asm!(
            "mov.w r5, {0}",
            out(reg) r5_value
        );
    }

    unsafe {
        asm!(
            "mov.w r6, {0}",
            out(reg) r6_value
        );
    }

    unsafe {
        asm!(
            "mov.w r7, {0}",
            out(reg) r7_value
        );
    }

    unsafe {
        asm!(
            "mov.w r8, {0}",
            out(reg) r8_value
        );
    }

    unsafe {
        asm!(
            "mov.w r9, {0}",
            out(reg) r9_value
        );
    }

    unsafe {
        asm!(
            "mov.w r10, {0}",
            out(reg) r10_value
        );
    }

    unsafe {
        asm!(
            "mov.w r11, {0}",
            out(reg) r11_value
        );
    }

    unsafe {
        asm!(
            "mov.w r12, {0}",
            out(reg) r12_value
        );
    }

    unsafe {
        asm!(
            "mov.w r13, {0}",
            out(reg) r13_value
        );
    }

    unsafe {
        asm!(
            "mov.w r14, {0}",
            out(reg) r14_value
        );
    }

    unsafe {
        asm!(
            "mov.w r15, {0}",
            out(reg) r15_value
        );
    }

    unsafe {
        let mut fram_start_address = 0x9DC0;
        let mut fram_end_address = 0xFF80;

        let mut checkpoint_size: u16 = 0;
        // Calculate actual stack size using stack pointer
        let stack_start = 0x3C00; // End of RAM (stack grows downward)
        let stack_size = stack_start - (sp_value +178);  // Actual stack size in bytes

        // Calculate checkpoint size
        // 1. actual stack size
        // 2. 2 bytes -> 0xF1F1 (end of stack in the frame magic number)
        // 3. 12 * 2 -> all the cpu registers
        // 4. 2 bytes -> size of frame
        // 5. 2 bytes -> 0xDEAD (magic number to indicate the static checkpoint)
        checkpoint_size = stack_size + 2 + 12 * 2 + 2 + 2;

        // Write size at beginning of packet
        ptr::write_volatile(fram_start_address as *mut u16, checkpoint_size);
        fram_start_address += 2;

        if c_type {
            // Write magic number for JIT checkpoint
            ptr::write_volatile(fram_start_address as *mut u16, 0xDEAD);
        } else {
            // Write magic number for static checkpoint
            ptr::write_volatile(fram_start_address as *mut u16, 0x0001);
        }
        fram_start_address += 2;

        // Save actual stack contents
        let stack_start = 0x3BFE; // End of RAM (stack grows downward) 

        // Copy stack contents to FRAM
        for addr in (sp_value+178..=stack_start).rev().step_by(2) {
            let value = ptr::read_volatile(addr as *const u16);
            ptr::write_volatile(fram_start_address as *mut u16, value);
            fram_start_address += 2;
        }

        // Write stack end marker
        ptr::write_volatile(fram_start_address as *mut u16, 0xF1F1);
        fram_start_address += 2;
        // Save registers
        ptr::write_volatile(fram_start_address as *mut u16, r4_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r5_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r6_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r7_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r8_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r9_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r10_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r11_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r12_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r13_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r14_value);
        fram_start_address += 2;
        ptr::write_volatile(fram_start_address as *mut u16, r15_value);
       // fram_start_address += 2;
        core::arch::asm!("nop");
  
    }
}

pub fn restore_globals() {
    unsafe {
        let mut restore_ctr: u16 = 0;
        let cnt = ptr::read_volatile(0x1C00 as *mut u16);
        
        loop {
            if cnt <= restore_ctr {
                break;
            }

            ptr::write(*(transcation_log as *const u16) as *mut u16, *(data_loc as *const u16));
            transcation_log += 2;
            let size = ptr::read(transcation_log as *mut u16);
            data_loc += size;
            transcation_log += 2;
            restore_ctr = restore_ctr + 1;
        }
    }
}

#[no_mangle]
pub unsafe fn restore() -> bool {
        let mut fram_start_address = 0x9DC0;
        let packet_size = ptr::read_volatile(fram_start_address as *const u16);

        asm!("NOP");
        asm!("NOP");
        asm!("NOP");
        
        if packet_size == 0  || packet_size == 0xFFFF{
            return false;
        }

        fram_start_address += 2;

        if ptr::read_volatile(fram_start_address as *const u16) == 0xDEAD {
           // restore_globals();
           // *counter = 0;
        }

        fram_start_address += 2;

        // Set up r0 with fram_start_address for assembly
        asm!(
            "mov.w {0}, r4",
            in(reg) fram_start_address as u16
        );

        // Set up stack pointer to end of RAM
        asm!(
            "mov.w #0x3C00, r1"
        );
        // Set up r6 with stack end marker (0xF1F1)
        asm!(
            "mov.w #0xF1F1, r6"
        );

        //Restore stack contents
        asm!(
            "1:
            mov.w @r4+, r5
            cmp.w r6, r5
            jeq 2f
            push r5
            jmp 1b
            2:"
        );

        asm!("NOP");
        asm!("NOP");            
       // Restore registers
        asm!(
            "mov.w @r4+, r4
            mov.w @r4+, r5
            mov.w @r4+, r6
            mov.w @r4+, r7
            mov.w @r4+, r8
            mov.w @r4+, r9
            mov.w @r4+, r10
            mov.w @r4+, r11
            mov.w @r4+, r12
            mov.w @r4+, r13
            mov.w @r4+, r14
            mov.w @r4+, r15"
        );
        asm!("ret");
    return true;
}

// pub fn delete_pg(page: u32){
//     unsafe{
//     let mut dp = Peripherals::steal();
//     let mut flash= &mut dp.FLASH;
//     unlock(&mut flash); 
//     wait_ready(&flash);
//     erase_page(&mut flash,  page);
//     }
// }
// pub fn delete_all_pg(){
//     let start_address = 0x0803_0000;
//     unsafe{
//         let mut dp = Peripherals::steal();
//         let mut flash= &mut dp.FLASH;
//         for i in 0..25{
//             let page = start_address + i * 2*1024;
//             unlock(&mut flash); 
//             wait_ready(&flash);
//             erase_page(&mut flash,  page);
//         }
//        // drop(flash);
//     }

// }