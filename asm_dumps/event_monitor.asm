
target/msp430-none-elf/release/event_monitor:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 56 c1 	call	#-16042	;#0xc156
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 3c 02 	cmp	0x023c,	r4	;PC rel. 0xc248
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 2e 02 	cmp	0x022e,	r4	;PC rel. 0xc24a
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 4c c2 	mov.b	-15796(r4),7692(r4);0xffffc24c, 0x1e0c
    c024:	0c 1e 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	65 3c       	jmp	$+204    	;abs 0xc0f6

0000c02c <TIMER1_A0>:
    c02c:	08 12       	push	r8		;
    c02e:	09 12       	push	r9		;
    c030:	0a 12       	push	r10		;
    c032:	0b 12       	push	r11		;
    c034:	0c 12       	push	r12		;
    c036:	0d 12       	push	r13		;
    c038:	0e 12       	push	r14		;
    c03a:	0f 12       	push	r15		;
    c03c:	1a 42 06 1e 	mov	&0x1e06,r10	;0x1e06
    c040:	19 42 08 1e 	mov	&0x1e08,r9	;0x1e08
    c044:	0c 4a       	mov	r10,	r12	;
    c046:	0d 49       	mov	r9,	r13	;
    c048:	3e 40 11 00 	mov	#17,	r14	;#0x0011
    c04c:	0f 43       	clr	r15		;
    c04e:	b0 12 5a c1 	call	#-16038	;#0xc15a
    c052:	3e 40 05 00 	mov	#5,	r14	;
    c056:	0f 43       	clr	r15		;
    c058:	b0 12 2a c2 	call	#-15830	;#0xc22a
    c05c:	08 4c       	mov	r12,	r8	;
    c05e:	0c 4a       	mov	r10,	r12	;
    c060:	0d 49       	mov	r9,	r13	;
    c062:	3e 40 17 00 	mov	#23,	r14	;#0x0017
    c066:	0f 43       	clr	r15		;
    c068:	b0 12 5a c1 	call	#-16038	;#0xc15a
    c06c:	3e 40 e8 03 	mov	#1000,	r14	;#0x03e8
    c070:	0f 43       	clr	r15		;
    c072:	b0 12 2a c2 	call	#-15830	;#0xc22a
    c076:	48 93       	cmp.b	#0,	r8	;r3 As==00
    c078:	06 24       	jz	$+14     	;abs 0xc086
    c07a:	78 90 03 00 	cmp.b	#3,	r8	;
    c07e:	03 24       	jz	$+8      	;abs 0xc086
    c080:	3c 90 f5 01 	cmp	#501,	r12	;#0x01f5
    c084:	21 28       	jnc	$+68     	;abs 0xc0c8
    c086:	1d 42 00 1e 	mov	&0x1e00,r13	;0x1e00
    c08a:	3d 90 40 00 	cmp	#64,	r13	;#0x0040
    c08e:	30 2c       	jc	$+98     	;abs 0xc0f0
    c090:	0e 4d       	mov	r13,	r14	;
    c092:	0e 5e       	rla	r14		;
    c094:	0e 5e       	rla	r14		;
    c096:	0e 5e       	rla	r14		;
    c098:	ce 48 00 1c 	mov.b	r8,	7168(r14); 0x1c00
    c09c:	8e 49 04 1c 	mov	r9,	7172(r14); 0x1c04
    c0a0:	8e 4a 02 1c 	mov	r10,	7170(r14); 0x1c02
    c0a4:	8e 4c 06 1c 	mov	r12,	7174(r14); 0x1c06
    c0a8:	1d 53       	inc	r13		;
    c0aa:	3d f0 3f 00 	and	#63,	r13	;#0x003f
    c0ae:	82 4d 00 1e 	mov	r13,	&0x1e00	;
    c0b2:	1c 43       	mov	#1,	r12	;r3 As==01
    c0b4:	1c 52 02 1e 	add	&0x1e02,r12	;0x1e02
    c0b8:	0c 93       	cmp	#0,	r12	;r3 As==00
    c0ba:	0d 42       	mov	r2,	r13	;
    c0bc:	0d 11       	rra	r13		;
    c0be:	1d f3       	and	#1,	r13	;r3 As==01
    c0c0:	82 5d 04 1e 	add	r13,	&0x1e04	;
    c0c4:	82 4c 02 1e 	mov	r12,	&0x1e02	;
    c0c8:	1c 43       	mov	#1,	r12	;r3 As==01
    c0ca:	1c 52 06 1e 	add	&0x1e06,r12	;0x1e06
    c0ce:	0c 93       	cmp	#0,	r12	;r3 As==00
    c0d0:	0d 42       	mov	r2,	r13	;
    c0d2:	0d 11       	rra	r13		;
    c0d4:	1d f3       	and	#1,	r13	;r3 As==01
    c0d6:	82 5d 08 1e 	add	r13,	&0x1e08	;
    c0da:	82 4c 06 1e 	mov	r12,	&0x1e06	;
    c0de:	3f 41       	pop	r15		;
    c0e0:	3e 41       	pop	r14		;
    c0e2:	3d 41       	pop	r13		;
    c0e4:	3c 41       	pop	r12		;
    c0e6:	3b 41       	pop	r11		;
    c0e8:	3a 41       	pop	r10		;
    c0ea:	39 41       	pop	r9		;
    c0ec:	38 41       	pop	r8		;
    c0ee:	00 13       	reti			
    c0f0:	0c 4d       	mov	r13,	r12	;
    c0f2:	b0 12 4c c1 	call	#-16052	;#0xc14c

0000c0f6 <main>:
    c0f6:	0c 43       	clr	r12		;
    c0f8:	cc 43 00 1c 	mov.b	#0,	7168(r12);r3 As==00, 0x1c00
    c0fc:	8c 43 04 1c 	mov	#0,	7172(r12);r3 As==00, 0x1c04
    c100:	8c 43 02 1c 	mov	#0,	7170(r12);r3 As==00, 0x1c02
    c104:	8c 43 06 1c 	mov	#0,	7174(r12);r3 As==00, 0x1c06
    c108:	3c 52       	add	#8,	r12	;r2 As==11
    c10a:	3c 90 00 02 	cmp	#512,	r12	;#0x0200
    c10e:	f4 23       	jnz	$-22     	;abs 0xc0f8
    c110:	82 43 00 1e 	mov	#0,	&0x1e00	;r3 As==00
    c114:	82 43 04 1e 	mov	#0,	&0x1e04	;r3 As==00
    c118:	82 43 02 1e 	mov	#0,	&0x1e02	;r3 As==00
    c11c:	d2 43 0a 1e 	mov.b	#1,	&0x1e0a	;r3 As==01
    c120:	82 43 08 1e 	mov	#0,	&0x1e08	;r3 As==00
    c124:	82 43 06 1e 	mov	#0,	&0x1e06	;r3 As==00
    c128:	82 43 80 03 	mov	#0,	&0x0380	;r3 As==00
    c12c:	b2 40 6a 18 	mov	#6250,	&0x0392	;#0x186a
    c130:	92 03 
    c132:	a2 d2 80 03 	bis	#4,	&0x0380	;r2 As==10
    c136:	b2 d0 10 00 	bis	#16,	&0x0382	;#0x0010
    c13a:	82 03 
    c13c:	b2 40 d0 02 	mov	#720,	&0x0380	;#0x02d0
    c140:	80 03 
    c142:	03 43       	nop			
    c144:	32 d2       	eint			
    c146:	03 43       	nop			
    c148:	03 43       	nop			
    c14a:	fe 3f       	jmp	$-2      	;abs 0xc148

0000c14c <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c14c:	b0 12 50 c1 	call	#-16048	;#0xc150

0000c150 <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c150:	32 c2       	dint			
    c152:	03 43       	nop			
    c154:	ff 3f       	jmp	$+0      	;abs 0xc154

0000c156 <PreInit_>:
    c156:	30 41       	ret			

0000c158 <DefaultHandler_>:
    c158:	ff 3f       	jmp	$+0      	;abs 0xc158

0000c15a <__mspabi_mpyl>:
    c15a:	0a 12       	push	r10		;

0000c15c <.LCFI10>:
    c15c:	09 12       	push	r9		;

0000c15e <.LCFI11>:
    c15e:	08 12       	push	r8		;

0000c160 <.LCFI12>:
    c160:	07 12       	push	r7		;

0000c162 <.LCFI13>:
    c162:	06 12       	push	r6		;

0000c164 <.LCFI14>:
    c164:	0a 4c       	mov	r12,	r10	;
    c166:	0b 4d       	mov	r13,	r11	;

0000c168 <.LVL27>:
    c168:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c16c <.Loc.30.2>:
    c16c:	4c 43       	clr.b	r12		;

0000c16e <.LVL28>:
    c16e:	4d 43       	clr.b	r13		;

0000c170 <.L6>:
    c170:	09 4e       	mov	r14,	r9	;
    c172:	09 df       	bis	r15,	r9	;
    c174:	09 93       	cmp	#0,	r9	;r3 As==00
    c176:	05 24       	jz	$+12     	;abs 0xc182
    c178:	49 48       	mov.b	r8,	r9	;
    c17a:	79 53       	add.b	#-1,	r9	;r3 As==11
    c17c:	48 49       	mov.b	r9,	r8	;

0000c17e <.LVL30>:
    c17e:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c180:	01 20       	jnz	$+4      	;abs 0xc184

0000c182 <.L5>:
    c182:	5c 3c       	jmp	$+186    	;abs 0xc23c

0000c184 <.L10>:
    c184:	09 4e       	mov	r14,	r9	;
    c186:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c188 <.Loc.36.2>:
    c188:	09 93       	cmp	#0,	r9	;r3 As==00
    c18a:	02 24       	jz	$+6      	;abs 0xc190

0000c18c <.Loc.37.2>:
    c18c:	0c 5a       	add	r10,	r12	;

0000c18e <.LVL31>:
    c18e:	0d 6b       	addc	r11,	r13	;

0000c190 <.L7>:
    c190:	06 4a       	mov	r10,	r6	;
    c192:	07 4b       	mov	r11,	r7	;
    c194:	06 5a       	add	r10,	r6	;
    c196:	07 6b       	addc	r11,	r7	;
    c198:	0a 46       	mov	r6,	r10	;

0000c19a <.LVL33>:
    c19a:	0b 47       	mov	r7,	r11	;

0000c19c <.LVL34>:
    c19c:	12 c3       	clrc			
    c19e:	0f 10       	rrc	r15		;
    c1a0:	0e 10       	rrc	r14		;

0000c1a2 <.LVL35>:
    c1a2:	e6 3f       	jmp	$-50     	;abs 0xc170

0000c1a4 <udivmodsi4>:
    c1a4:	0a 12       	push	r10		;

0000c1a6 <.LCFI0>:
    c1a6:	09 12       	push	r9		;

0000c1a8 <L0^A>:
    c1a8:	08 12       	push	r8		;

0000c1aa <.LCFI2>:
    c1aa:	07 12       	push	r7		;

0000c1ac <.LCFI3>:
    c1ac:	06 12       	push	r6		;

0000c1ae <.LCFI4>:
    c1ae:	0a 4c       	mov	r12,	r10	;
    c1b0:	0b 4d       	mov	r13,	r11	;

0000c1b2 <.LVL1>:
    c1b2:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

0000c1b6 <.LVL2>:
    c1b6:	58 43       	mov.b	#1,	r8	;r3 As==01
    c1b8:	49 43       	clr.b	r9		;

0000c1ba <.L2>:
    c1ba:	0f 9b       	cmp	r11,	r15	;
    c1bc:	04 28       	jnc	$+10     	;abs 0xc1c6
    c1be:	0b 9f       	cmp	r15,	r11	;
    c1c0:	07 20       	jnz	$+16     	;abs 0xc1d0
    c1c2:	0e 9a       	cmp	r10,	r14	;
    c1c4:	05 2c       	jc	$+12     	;abs 0xc1d0

0000c1c6 <.L15>:
    c1c6:	3c 53       	add	#-1,	r12	;r3 As==11

0000c1c8 <.Loc.38.1>:
    c1c8:	0c 93       	cmp	#0,	r12	;r3 As==00
    c1ca:	2c 24       	jz	$+90     	;abs 0xc224

0000c1cc <.Loc.38.1>:
    c1cc:	0f 93       	cmp	#0,	r15	;r3 As==00
    c1ce:	0c 34       	jge	$+26     	;abs 0xc1e8

0000c1d0 <.L13>:
    c1d0:	4c 43       	clr.b	r12		;
    c1d2:	4d 43       	clr.b	r13		;

0000c1d4 <.L8>:
    c1d4:	07 48       	mov	r8,	r7	;
    c1d6:	07 d9       	bis	r9,	r7	;
    c1d8:	07 93       	cmp	#0,	r7	;r3 As==00
    c1da:	13 20       	jnz	$+40     	;abs 0xc202

0000c1dc <.L5>:
    c1dc:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
    c1e0:	02 24       	jz	$+6      	;abs 0xc1e6
    c1e2:	0c 4a       	mov	r10,	r12	;
    c1e4:	0d 4b       	mov	r11,	r13	;

0000c1e6 <.L1>:
    c1e6:	2a 3c       	jmp	$+86     	;abs 0xc23c

0000c1e8 <.L6>:
    c1e8:	06 4e       	mov	r14,	r6	;
    c1ea:	07 4f       	mov	r15,	r7	;
    c1ec:	06 5e       	add	r14,	r6	;
    c1ee:	07 6f       	addc	r15,	r7	;
    c1f0:	0e 46       	mov	r6,	r14	;

0000c1f2 <.LVL7>:
    c1f2:	0f 47       	mov	r7,	r15	;

0000c1f4 <.LVL8>:
    c1f4:	06 48       	mov	r8,	r6	;
    c1f6:	07 49       	mov	r9,	r7	;
    c1f8:	06 58       	add	r8,	r6	;
    c1fa:	07 69       	addc	r9,	r7	;
    c1fc:	08 46       	mov	r6,	r8	;

0000c1fe <.LVL9>:
    c1fe:	09 47       	mov	r7,	r9	;

0000c200 <.LVL10>:
    c200:	dc 3f       	jmp	$-70     	;abs 0xc1ba

0000c202 <.L11>:
    c202:	0b 9f       	cmp	r15,	r11	;
    c204:	08 28       	jnc	$+18     	;abs 0xc216
    c206:	0f 9b       	cmp	r11,	r15	;
    c208:	02 20       	jnz	$+6      	;abs 0xc20e
    c20a:	0a 9e       	cmp	r14,	r10	;
    c20c:	04 28       	jnc	$+10     	;abs 0xc216

0000c20e <.L16>:
    c20e:	0a 8e       	sub	r14,	r10	;
    c210:	0b 7f       	subc	r15,	r11	;

0000c212 <.Loc.48.1>:
    c212:	0c d8       	bis	r8,	r12	;

0000c214 <.LVL13>:
    c214:	0d d9       	bis	r9,	r13	;

0000c216 <.L9>:
    c216:	12 c3       	clrc			
    c218:	09 10       	rrc	r9		;
    c21a:	08 10       	rrc	r8		;

0000c21c <.Loc.51.1>:
    c21c:	12 c3       	clrc			
    c21e:	0f 10       	rrc	r15		;
    c220:	0e 10       	rrc	r14		;
    c222:	d8 3f       	jmp	$-78     	;abs 0xc1d4

0000c224 <.L14>:
    c224:	4c 43       	clr.b	r12		;
    c226:	4d 43       	clr.b	r13		;
    c228:	d9 3f       	jmp	$-76     	;abs 0xc1dc

0000c22a <__mspabi_remul>:
    c22a:	21 83       	decd	r1		;

0000c22c <.LCFI22>:
    c22c:	91 43 00 00 	mov	#1,	0(r1)	;r3 As==01
    c230:	
0000c232 <L0^A>:
    c232:	
0000c234 <.LVL43>:
    c234:	21 53       	incd	r1		;

0000c236 <.LCFI23>:
    c236:	30 41       	ret			

0000c238 <__mspabi_func_epilog_7>:
    c238:	34 41       	pop	r4		;

0000c23a <__mspabi_func_epilog_6>:
    c23a:	35 41       	pop	r5		;

0000c23c <__mspabi_func_epilog_5>:
    c23c:	36 41       	pop	r6		;

0000c23e <__mspabi_func_epilog_4>:
    c23e:	37 41       	pop	r7		;

0000c240 <__mspabi_func_epilog_3>:
    c240:	38 41       	pop	r8		;

0000c242 <__mspabi_func_epilog_2>:
    c242:	39 41       	pop	r9		;

0000c244 <__mspabi_func_epilog_1>:
    c244:	3a 41       	pop	r10		;
    c246:	30 41       	ret			
