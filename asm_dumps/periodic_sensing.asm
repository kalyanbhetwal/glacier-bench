
target/msp430-none-elf/release/periodic_sensing:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 e8 c1 	call	#-15896	;#0xc1e8
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 24 02 	cmp	0x0224,	r4	;PC rel. 0xc230
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 16 02 	cmp	0x0216,	r4	;PC rel. 0xc232
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 34 c2 	mov.b	-15820(r4),7436(r4);0xffffc234, 0x1d0c
    c024:	0c 1d 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	5d 3c       	jmp	$+188    	;abs 0xc0e6

0000c02c <TIMER0_A0>:
    c02c:	0b 12       	push	r11		;
    c02e:	0c 12       	push	r12		;
    c030:	0d 12       	push	r13		;
    c032:	0e 12       	push	r14		;
    c034:	0f 12       	push	r15		;
    c036:	1c 42 02 1d 	mov	&0x1d02,r12	;0x1d02
    c03a:	3d 40 11 00 	mov	#17,	r13	;#0x0011
    c03e:	b0 12 ec c1 	call	#-15892	;#0xc1ec
    c042:	0d 4c       	mov	r12,	r13	;
    c044:	1c 42 04 1d 	mov	&0x1d04,r12	;0x1d04
    c048:	1c 42 00 1d 	mov	&0x1d00,r12	;0x1d00
    c04c:	3c 90 80 00 	cmp	#128,	r12	;#0x0080
    c050:	48 2c       	jc	$+146    	;abs 0xc0e2
    c052:	3d 50 1f 00 	add	#31,	r13	;#0x001f
    c056:	3d f0 ff 03 	and	#1023,	r13	;#0x03ff
    c05a:	3d 50 00 fe 	add	#-512,	r13	;#0xfe00
    c05e:	0e 4c       	mov	r12,	r14	;
    c060:	0e 5e       	rla	r14		;
    c062:	8e 4d 00 1c 	mov	r13,	7168(r14); 0x1c00
    c066:	1d 92 0c 1d 	cmp	&0x1d0c,r13	;0x1d0c
    c06a:	02 34       	jge	$+6      	;abs 0xc070
    c06c:	82 4d 0c 1d 	mov	r13,	&0x1d0c	;
    c070:	82 9d 0e 1d 	cmp	r13,	&0x1d0e	;
    c074:	02 34       	jge	$+6      	;abs 0xc07a
    c076:	82 4d 0e 1d 	mov	r13,	&0x1d0e	;
    c07a:	1e 42 06 1d 	mov	&0x1d06,r14	;0x1d06
    c07e:	0f 4e       	mov	r14,	r15	;
    c080:	0f 5d       	add	r13,	r15	;
    c082:	0f 9e       	cmp	r14,	r15	;
    c084:	0e 42       	mov	r2,	r14	;
    c086:	8d 10       	swpb	r13		;
    c088:	8d 11       	sxt	r13		;
    c08a:	0d 11       	rra	r13		;
    c08c:	0d 11       	rra	r13		;
    c08e:	0d 11       	rra	r13		;
    c090:	0d 11       	rra	r13		;
    c092:	0d 11       	rra	r13		;
    c094:	0d 11       	rra	r13		;
    c096:	0d 11       	rra	r13		;
    c098:	1d 52 08 1d 	add	&0x1d08,r13	;0x1d08
    c09c:	82 4f 06 1d 	mov	r15,	&0x1d06	;
    c0a0:	1f 43       	mov	#1,	r15	;r3 As==01
    c0a2:	1b 43       	mov	#1,	r11	;r3 As==01
    c0a4:	0b ce       	bic	r14,	r11	;
    c0a6:	0b 5d       	add	r13,	r11	;
    c0a8:	82 4b 08 1d 	mov	r11,	&0x1d08	;
    c0ac:	1f 52 02 1d 	add	&0x1d02,r15	;0x1d02
    c0b0:	0f 93       	cmp	#0,	r15	;r3 As==00
    c0b2:	0d 42       	mov	r2,	r13	;
    c0b4:	0d 11       	rra	r13		;
    c0b6:	1d f3       	and	#1,	r13	;r3 As==01
    c0b8:	82 5d 04 1d 	add	r13,	&0x1d04	;
    c0bc:	82 4f 02 1d 	mov	r15,	&0x1d02	;
    c0c0:	0d 4c       	mov	r12,	r13	;
    c0c2:	1d 53       	inc	r13		;
    c0c4:	3d f0 7f 00 	and	#127,	r13	;#0x007f
    c0c8:	82 4d 00 1d 	mov	r13,	&0x1d00	;
    c0cc:	3c 90 7f 00 	cmp	#127,	r12	;#0x007f
    c0d0:	02 20       	jnz	$+6      	;abs 0xc0d6
    c0d2:	d2 43 0a 1d 	mov.b	#1,	&0x1d0a	;r3 As==01
    c0d6:	3f 41       	pop	r15		;
    c0d8:	3e 41       	pop	r14		;
    c0da:	3d 41       	pop	r13		;
    c0dc:	3c 41       	pop	r12		;
    c0de:	3b 41       	pop	r11		;
    c0e0:	00 13       	reti			
    c0e2:	b0 12 da c1 	call	#-15910	;#0xc1da

0000c0e6 <main>:
    c0e6:	0c 43       	clr	r12		;
    c0e8:	8c 43 00 1c 	mov	#0,	7168(r12);r3 As==00, 0x1c00
    c0ec:	2c 53       	incd	r12		;
    c0ee:	3c 90 00 01 	cmp	#256,	r12	;#0x0100
    c0f2:	fa 23       	jnz	$-10     	;abs 0xc0e8
    c0f4:	82 43 00 1d 	mov	#0,	&0x1d00	;r3 As==00
    c0f8:	82 43 04 1d 	mov	#0,	&0x1d04	;r3 As==00
    c0fc:	82 43 02 1d 	mov	#0,	&0x1d02	;r3 As==00
    c100:	b2 40 ff 7f 	mov	#32767,	&0x1d0c	;#0x7fff
    c104:	0c 1d 
    c106:	b2 40 00 80 	mov	#-32768,&0x1d0e	;#0x8000
    c10a:	0e 1d 
    c10c:	d2 43 0b 1d 	mov.b	#1,	&0x1d0b	;r3 As==01
    c110:	82 43 08 1d 	mov	#0,	&0x1d08	;r3 As==00
    c114:	82 43 06 1d 	mov	#0,	&0x1d06	;r3 As==00
    c118:	82 43 40 03 	mov	#0,	&0x0340	;r3 As==00
    c11c:	b2 40 d4 30 	mov	#12500,	&0x0352	;#0x30d4
    c120:	52 03 
    c122:	a2 d2 40 03 	bis	#4,	&0x0340	;r2 As==10
    c126:	b2 d0 10 00 	bis	#16,	&0x0342	;#0x0010
    c12a:	42 03 
    c12c:	b2 40 d0 02 	mov	#720,	&0x0340	;#0x02d0
    c130:	40 03 
    c132:	03 43       	nop			
    c134:	32 d2       	eint			
    c136:	03 43       	nop			
    c138:	5c 42 0a 1d 	mov.b	&0x1d0a,r12	;0x1d0a
    c13c:	1c b3       	bit	#1,	r12	;r3 As==01
    c13e:	49 24       	jz	$+148    	;abs 0xc1d2
    c140:	0c 43       	clr	r12		;
    c142:	b2 40 ff 7f 	mov	#32767,	&0x1d0c	;#0x7fff
    c146:	0c 1d 
    c148:	b2 40 00 80 	mov	#-32768,&0x1d0e	;#0x8000
    c14c:	0e 1d 
    c14e:	82 43 08 1d 	mov	#0,	&0x1d08	;r3 As==00
    c152:	82 43 06 1d 	mov	#0,	&0x1d06	;r3 As==00
    c156:	1d 4c 00 1c 	mov	7168(r12),r13	;0x01c00
    c15a:	1e 42 0c 1d 	mov	&0x1d0c,r14	;0x1d0c
    c15e:	0d 9e       	cmp	r14,	r13	;
    c160:	02 34       	jge	$+6      	;abs 0xc166
    c162:	82 4d 0c 1d 	mov	r13,	&0x1d0c	;
    c166:	82 9d 0e 1d 	cmp	r13,	&0x1d0e	;
    c16a:	02 34       	jge	$+6      	;abs 0xc170
    c16c:	82 4d 0e 1d 	mov	r13,	&0x1d0e	;
    c170:	2c 53       	incd	r12		;
    c172:	1f 42 06 1d 	mov	&0x1d06,r15	;0x1d06
    c176:	0e 4f       	mov	r15,	r14	;
    c178:	0e 5d       	add	r13,	r14	;
    c17a:	0e 9f       	cmp	r15,	r14	;
    c17c:	1f 43       	mov	#1,	r15	;r3 As==01
    c17e:	0f c2       	bic	r2,	r15	;
    c180:	8d 10       	swpb	r13		;
    c182:	8d 11       	sxt	r13		;
    c184:	0d 11       	rra	r13		;
    c186:	0d 11       	rra	r13		;
    c188:	0d 11       	rra	r13		;
    c18a:	0d 11       	rra	r13		;
    c18c:	0d 11       	rra	r13		;
    c18e:	0d 11       	rra	r13		;
    c190:	0d 11       	rra	r13		;
    c192:	1d 52 08 1d 	add	&0x1d08,r13	;0x1d08
    c196:	82 4e 06 1d 	mov	r14,	&0x1d06	;
    c19a:	0d 5f       	add	r15,	r13	;
    c19c:	82 4d 08 1d 	mov	r13,	&0x1d08	;
    c1a0:	3c 90 00 01 	cmp	#256,	r12	;#0x0100
    c1a4:	d8 23       	jnz	$-78     	;abs 0xc156
    c1a6:	1e 42 08 1d 	mov	&0x1d08,r14	;0x1d08
    c1aa:	1f 42 06 1d 	mov	&0x1d06,r15	;0x1d06
    c1ae:	1c 42 04 1d 	mov	&0x1d04,r12	;0x1d04
    c1b2:	1d 42 02 1d 	mov	&0x1d02,r13	;0x1d02
    c1b6:	0b 4d       	mov	r13,	r11	;
    c1b8:	0b dc       	bis	r12,	r11	;
    c1ba:	0b 93       	cmp	#0,	r11	;r3 As==00
    c1bc:	08 24       	jz	$+18     	;abs 0xc1ce
    c1be:	3e e0 00 80 	xor	#-32768,r14	;#0x8000
    c1c2:	0f de       	bis	r14,	r15	;
    c1c4:	0f 93       	cmp	#0,	r15	;r3 As==00
    c1c6:	03 20       	jnz	$+8      	;abs 0xc1ce
    c1c8:	0d fc       	and	r12,	r13	;
    c1ca:	3d 93       	cmp	#-1,	r13	;r3 As==11
    c1cc:	04 24       	jz	$+10     	;abs 0xc1d6
    c1ce:	c2 43 0a 1d 	mov.b	#0,	&0x1d0a	;r3 As==00
    c1d2:	03 43       	nop			
    c1d4:	b1 3f       	jmp	$-156    	;abs 0xc138
    c1d6:	b0 12 e4 c1 	call	#-15900	;#0xc1e4

0000c1da <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c1da:	b0 12 de c1 	call	#-15906	;#0xc1de

0000c1de <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c1de:	32 c2       	dint			
    c1e0:	03 43       	nop			
    c1e2:	ff 3f       	jmp	$+0      	;abs 0xc1e2

0000c1e4 <_ZN4core9panicking11panic_const24panic_const_div_overflow17hc971d8745ac3b4fbE>:
    c1e4:	b0 12 de c1 	call	#-15906	;#0xc1de

0000c1e8 <PreInit_>:
    c1e8:	30 41       	ret			

0000c1ea <DefaultHandler_>:
    c1ea:	ff 3f       	jmp	$+0      	;abs 0xc1ea

0000c1ec <__mspabi_mpyi>:
    c1ec:	0a 12       	push	r10		;

0000c1ee <.LCFI0>:
    c1ee:	0e 4c       	mov	r12,	r14	;

0000c1f0 <.LVL1>:
    c1f0:	4f 43       	clr.b	r15		;

0000c1f2 <.Loc.11.1>:
    c1f2:	0d 93       	cmp	#0,	r13	;r3 As==00
    c1f4:	04 34       	jge	$+10     	;abs 0xc1fe

0000c1f6 <.Loc.13.1>:
    c1f6:	4c 43       	clr.b	r12		;

0000c1f8 <.LVL2>:
    c1f8:	0c 8d       	sub	r13,	r12	;
    c1fa:	0d 4c       	mov	r12,	r13	;

0000c1fc <.LVL3>:
    c1fc:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c1fe <.L2>:
    c1fe:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c202 <.Loc.9.1>:
    c202:	4c 43       	clr.b	r12		;

0000c204 <.L3>:
    c204:	0d 93       	cmp	#0,	r13	;r3 As==00
    c206:	04 20       	jnz	$+10     	;abs 0xc210

0000c208 <.L9>:
    c208:	0f 93       	cmp	#0,	r15	;r3 As==00
    c20a:	0d 20       	jnz	$+28     	;abs 0xc226

0000c20c <.L1>:
    c20c:	3a 41       	pop	r10		;

0000c20e <.LCFI1>:
    c20e:	30 41       	ret			

0000c210 <.L5>:
    c210:	4b 4a       	mov.b	r10,	r11	;
    c212:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c214:	4a 4b       	mov.b	r11,	r10	;

0000c216 <.LVL9>:
    c216:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c218:	f7 27       	jz	$-16     	;abs 0xc208

0000c21a <.Loc.19.1>:
    c21a:	1d b3       	bit	#1,	r13	;r3 As==01
    c21c:	01 24       	jz	$+4      	;abs 0xc220

0000c21e <.Loc.20.1>:
    c21e:	0c 5e       	add	r14,	r12	;

0000c220 <.L4>:
    c220:	0e 5e       	rla	r14		;

0000c222 <.Loc.22.1>:
    c222:	0d 11       	rra	r13		;

0000c224 <.Loc.17.1>:
    c224:	ef 3f       	jmp	$-32     	;abs 0xc204

0000c226 <.L6>:
    c226:	4d 43       	clr.b	r13		;

0000c228 <.LVL13>:
    c228:	0d 8c       	sub	r12,	r13	;
    c22a:	0c 4d       	mov	r13,	r12	;

0000c22c <.LVL14>:
    c22c:	ef 3f       	jmp	$-32     	;abs 0xc20c
