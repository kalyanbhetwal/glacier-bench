#![allow(unsafe_code, non_upper_case_globals)]

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
            ptr::write_volatile(fram_start_address as *mut u16, 0xFEAD);
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
    // Boundary marker constants
    const BOUNDARY_NORMAL: u16 = 0xBEEF;
    const BOUNDARY_DISCARD: u16 = 0xDEAD;
    const BOUNDARY_IMMEDIATE: u16 = 0xCAFE;
    const STACK_END_MARKER: u16 = 0xF1F1;

    let mut fram_addr = 0x9DC0;
    let packet_size = ptr::read_volatile(fram_addr as *const u16);

    asm!("NOP");
    asm!("NOP");
    asm!("NOP");

    // Check if valid checkpoint exists
    if packet_size == 0 || packet_size == 0xFFFF {
        return false;
    }

    fram_addr += 2;

    // Read magic number (checkpoint type)
    let magic = ptr::read_volatile(fram_addr as *const u16);
    if magic == 0x0001 {
        // static checkpoint - could restore globals here if needed
        // restore_globals();
        // *counter = 0;
    }

    fram_addr += 2;

    // Initialize stack pointer to top of RAM
    let mut ram_sp: u16 = 0x3C00;

    // Track boundary transitions for PC replacement
    let mut prev_boundary: u16 = BOUNDARY_NORMAL;  // Start with NORMAL
    let mut active_return_address: u16 = 0;

    // Restore stack contents by parsing task frames
    // Frame structure in FRAM: [PC][SR][boundary][stack_size][saved_regs][locals]
    // stack_size = size of [PC][SR][saved_regs][locals] (includes PC+SR, excludes boundary+stack_size)
    loop {
        // Read PC
        let pc = ptr::read_volatile(fram_addr as *const u16);

        // Check if we've reached the end of stack marker
        if pc == STACK_END_MARKER {
            fram_addr += 2;
            break;
        }

        // Read SR, boundary, stack_size
        let sr = ptr::read_volatile((fram_addr + 2) as *const u16);
        let curr_boundary = ptr::read_volatile((fram_addr + 4) as *const u16);
        let stack_size = ptr::read_volatile((fram_addr + 6) as *const u16);

        // Handle PC replacement based on boundary transitions
        if prev_boundary != BOUNDARY_DISCARD && curr_boundary == BOUNDARY_DISCARD {
            // Transition: non-DEAD -> DEAD - save PC from discard task
            active_return_address = pc;
        }

        // Handle restoration based on boundary type
        if curr_boundary == BOUNDARY_DISCARD {
            // Skip discard tasks - don't copy to RAM stack
            // Jump: boundary(2) + stack_size(2) + data(stack_size which includes PC+SR)
            fram_addr += 4 + stack_size;
        } else if prev_boundary == BOUNDARY_DISCARD && curr_boundary != BOUNDARY_DISCARD {
            // Transition: DEAD -> non-DEAD - restore with replaced PC

            // Push replaced PC
            ram_sp -= 2;
            ptr::write_volatile(ram_sp as *mut u16, active_return_address);

            // Copy SR and rest of frame data (stack_size - 2 bytes, excluding PC)
            if stack_size > 2 {
                ptr::copy_nonoverlapping(
                    (fram_addr + 2) as *const u16,  // Start at SR
                    ram_sp.wrapping_sub(stack_size - 2) as *mut u16,
                    ((stack_size - 2) / 2) as usize
                );
                ram_sp = ram_sp.wrapping_sub(stack_size - 2);
            }

            // Push boundary and stack_size
            ram_sp -= 2;
            ptr::write_volatile(ram_sp as *mut u16, curr_boundary);
            ram_sp -= 2;
            ptr::write_volatile(ram_sp as *mut u16, stack_size);

            // Jump to next frame
            fram_addr += 4 + stack_size;
        } else {
            // Normal case: restore task as-is

            // Copy stack_size bytes (PC, SR, saved_regs, locals)
            if stack_size > 0 {
                ptr::copy_nonoverlapping(
                    fram_addr as *const u16,
                    ram_sp.wrapping_sub(stack_size) as *mut u16,
                    (stack_size / 2) as usize
                );
                ram_sp = ram_sp.wrapping_sub(stack_size);
            }

            // Push boundary and stack_size
            ram_sp -= 2;
            ptr::write_volatile(ram_sp as *mut u16, curr_boundary);
            ram_sp -= 2;
            ptr::write_volatile(ram_sp as *mut u16, stack_size);

            // Jump to next frame
            fram_addr += 4 + stack_size;
        }

        prev_boundary = curr_boundary;
    }

    // Update actual stack pointer
    asm!(
        "mov.w {0}, r1",
        in(reg) ram_sp
    );

    // Restore CPU registers (r4-r15) from FRAM
    // fram_addr now points to saved registers
    let r4  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r5  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r6  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r7  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r8  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r9  = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r10 = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r11 = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r12 = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r13 = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r14 = ptr::read_volatile(fram_addr as *const u16); fram_addr += 2;
    let r15 = ptr::read_volatile(fram_addr as *const u16);

    // Restore all registers using assembly
    asm!(
        "mov.w {r4}, r4
         mov.w {r5}, r5
         mov.w {r6}, r6
         mov.w {r7}, r7
         mov.w {r8}, r8
         mov.w {r9}, r9
         mov.w {r10}, r10
         mov.w {r11}, r11
         mov.w {r12}, r12
         mov.w {r13}, r13
         mov.w {r14}, r14
         mov.w {r15}, r15",
        r4 = in(reg) r4,
        r5 = in(reg) r5,
        r6 = in(reg) r6,
        r7 = in(reg) r7,
        r8 = in(reg) r8,
        r9 = in(reg) r9,
        r10 = in(reg) r10,
        r11 = in(reg) r11,
        r12 = in(reg) r12,
        r13 = in(reg) r13,
        r14 = in(reg) r14,
        r15 = in(reg) r15,
    );

    return true;
}