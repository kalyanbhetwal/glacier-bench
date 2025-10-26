MEMORY
{
  ROM  (rx) : ORIGIN = 0xC000, LENGTH = 128K
  /* Main FRAM region (for code, consts, initialized vars) */
  FRAM    (rx)  : ORIGIN = 0x4400, LENGTH = 0xBB80 /* 48 KB FRAM (starts after interrupt vectors) */
  /* Extra FRAM2 region (for persistent storage, large buffers) */
  FRAM2   (rx)  : ORIGIN = 0x10000, LENGTH = 0x33FF8 /* 212 KB extra FRAM */
  RAM    (rw) : ORIGIN = 0x1C00, LENGTH = 8K    /*  // Combined RAM regions (shared)*/
  VECTORS(rx) : ORIGIN = 0xFF80, LENGTH = 0x80
}
PROVIDE(__VECTORS_END_ADDR = 0x10000);

/* Stack begins at the end of RAM:
   _stack_start = ORIGIN(RAM) + LENGTH(RAM); */

/* TODO: Code (and data?) above 64kB mark, which is supported even without
   using MSP430X mode. */
