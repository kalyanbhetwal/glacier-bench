
target/msp430-none-elf/release/rsa:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 bc c2 	call	#-15684	;#0xc2bc
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 4c 07 	cmp	0x074c,	r4	;PC rel. 0xc758
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 3e 07 	cmp	0x073e,	r4	;PC rel. 0xc75a
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 5c c8 	mov.b	-14244(r4),7366(r4);0xffffc85c, 0x1cc6
    c024:	c6 1c 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	04 12       	push	r4		;
    c02e:	05 12       	push	r5		;
    c030:	06 12       	push	r6		;
    c032:	07 12       	push	r7		;
    c034:	08 12       	push	r8		;
    c036:	09 12       	push	r9		;
    c038:	0a 12       	push	r10		;
    c03a:	31 80 18 00 	sub	#24,	r1	;#0x0018
    c03e:	3c 40 80 1c 	mov	#7296,	r12	;#0x1c80
    c042:	3d 40 40 1c 	mov	#7232,	r13	;#0x1c40
    c046:	3e 40 0b 00 	mov	#11,	r14	;#0x000b
    c04a:	3f 40 00 1c 	mov	#7168,	r15	;#0x1c00
    c04e:	8f 4e 00 00 	mov	r14,	0(r15)	;
    c052:	8f 43 02 00 	mov	#0,	2(r15)	;r3 As==00
    c056:	2f 52       	add	#4,	r15	;r2 As==10
    c058:	8d 43 02 00 	mov	#0,	2(r13)	;r3 As==00
    c05c:	8d 43 00 00 	mov	#0,	0(r13)	;r3 As==00
    c060:	2d 52       	add	#4,	r13	;r2 As==10
    c062:	8c 43 02 00 	mov	#0,	2(r12)	;r3 As==00
    c066:	8c 43 00 00 	mov	#0,	0(r12)	;r3 As==00
    c06a:	2c 52       	add	#4,	r12	;r2 As==10
    c06c:	3e 50 07 00 	add	#7,	r14	;
    c070:	3e 90 7b 00 	cmp	#123,	r14	;#0x007b
    c074:	ec 23       	jnz	$-38     	;abs 0xc04e
    c076:	82 43 c2 1c 	mov	#0,	&0x1cc2	;r3 As==00
    c07a:	82 43 c0 1c 	mov	#0,	&0x1cc0	;r3 As==00
    c07e:	82 43 c4 1c 	mov	#0,	&0x1cc4	;r3 As==00
    c082:	1c 42 c4 1c 	mov	&0x1cc4,r12	;0x1cc4
    c086:	3c 90 10 00 	cmp	#16,	r12	;#0x0010
    c08a:	11 2d       	jc	$+548    	;abs 0xc2ae
    c08c:	37 40 11 00 	mov	#17,	r7	;#0x0011
    c090:	81 4c 00 00 	mov	r12,	0(r1)	;
    c094:	0c 5c       	rla	r12		;
    c096:	0c 5c       	rla	r12		;
    c098:	19 4c 02 1c 	mov	7170(r12),r9	;0x01c02
    c09c:	81 4c 02 00 	mov	r12,	2(r1)	;
    c0a0:	18 4c 00 1c 	mov	7168(r12),r8	;0x01c00
    c0a4:	0a 43       	clr	r10		;
    c0a6:	0b 43       	clr	r11		;
    c0a8:	06 43       	clr	r6		;
    c0aa:	1c 43       	mov	#1,	r12	;r3 As==01
    c0ac:	81 4c 12 00 	mov	r12,	18(r1)	; 0x0012
    c0b0:	0c 43       	clr	r12		;
    c0b2:	81 4c 10 00 	mov	r12,	16(r1)	; 0x0010
    c0b6:	81 4c 0e 00 	mov	r12,	14(r1)	; 0x000e
    c0ba:	81 4c 0c 00 	mov	r12,	12(r1)	; 0x000c
    c0be:	3c 40 a1 0c 	mov	#3233,	r12	;#0x0ca1
    c0c2:	0d 43       	clr	r13		;
    c0c4:	0e 43       	clr	r14		;
    c0c6:	0f 43       	clr	r15		;
    c0c8:	b0 12 ec c3 	call	#-15380	;#0xc3ec
    c0cc:	04 4c       	mov	r12,	r4	;
    c0ce:	05 4f       	mov	r15,	r5	;
    c0d0:	17 b3       	bit	#1,	r7	;r3 As==01
    c0d2:	2b 24       	jz	$+88     	;abs 0xc12a
    c0d4:	18 41 12 00 	mov	18(r1),	r8	;0x00012
    c0d8:	19 41 10 00 	mov	16(r1),	r9	;0x00010
    c0dc:	1a 41 0e 00 	mov	14(r1),	r10	;0x0000e
    c0e0:	1b 41 0c 00 	mov	12(r1),	r11	;0x0000c
    c0e4:	0c 44       	mov	r4,	r12	;
    c0e6:	81 4d 16 00 	mov	r13,	22(r1)	; 0x0016
    c0ea:	1d 41 16 00 	mov	22(r1),	r13	;0x00016
    c0ee:	81 4e 14 00 	mov	r14,	20(r1)	; 0x0014
    c0f2:	1e 41 14 00 	mov	20(r1),	r14	;0x00014
    c0f6:	0f 45       	mov	r5,	r15	;
    c0f8:	b0 12 c0 c2 	call	#-15680	;#0xc2c0
    c0fc:	08 4c       	mov	r12,	r8	;
    c0fe:	09 4d       	mov	r13,	r9	;
    c100:	0a 4e       	mov	r14,	r10	;
    c102:	0b 4f       	mov	r15,	r11	;
    c104:	3c 40 a1 0c 	mov	#3233,	r12	;#0x0ca1
    c108:	0d 43       	clr	r13		;
    c10a:	0e 43       	clr	r14		;
    c10c:	0f 43       	clr	r15		;
    c10e:	b0 12 ec c3 	call	#-15380	;#0xc3ec
    c112:	81 4c 12 00 	mov	r12,	18(r1)	; 0x0012
    c116:	81 4d 10 00 	mov	r13,	16(r1)	; 0x0010
    c11a:	1d 41 16 00 	mov	22(r1),	r13	;0x00016
    c11e:	81 4e 0e 00 	mov	r14,	14(r1)	; 0x000e
    c122:	1e 41 14 00 	mov	20(r1),	r14	;0x00014
    c126:	81 4f 0c 00 	mov	r15,	12(r1)	; 0x000c
    c12a:	08 44       	mov	r4,	r8	;
    c12c:	09 4d       	mov	r13,	r9	;
    c12e:	0a 4e       	mov	r14,	r10	;
    c130:	0b 45       	mov	r5,	r11	;
    c132:	0c 44       	mov	r4,	r12	;
    c134:	0f 45       	mov	r5,	r15	;
    c136:	b0 12 c0 c2 	call	#-15680	;#0xc2c0
    c13a:	08 4c       	mov	r12,	r8	;
    c13c:	09 4d       	mov	r13,	r9	;
    c13e:	0a 4e       	mov	r14,	r10	;
    c140:	0b 4f       	mov	r15,	r11	;
    c142:	06 93       	cmp	#0,	r6	;r3 As==00
    c144:	0d 42       	mov	r2,	r13	;
    c146:	27 93       	cmp	#2,	r7	;r3 As==10
    c148:	0c 42       	mov	r2,	r12	;
    c14a:	06 93       	cmp	#0,	r6	;r3 As==00
    c14c:	04 24       	jz	$+10     	;abs 0xc156
    c14e:	0d 11       	rra	r13		;
    c150:	1c 43       	mov	#1,	r12	;r3 As==01
    c152:	0c cd       	bic	r13,	r12	;
    c154:	01 3c       	jmp	$+4      	;abs 0xc158
    c156:	1c f3       	and	#1,	r12	;r3 As==01
    c158:	0d 46       	mov	r6,	r13	;
    c15a:	4d 4d       	mov.b	r13,	r13	;
    c15c:	8d 10       	swpb	r13		;
    c15e:	12 c3       	clrc			
    c160:	07 10       	rrc	r7		;
    c162:	0d 5d       	rla	r13		;
    c164:	0d 5d       	rla	r13		;
    c166:	0d 5d       	rla	r13		;
    c168:	0d 5d       	rla	r13		;
    c16a:	0d 5d       	rla	r13		;
    c16c:	0d 5d       	rla	r13		;
    c16e:	0d 5d       	rla	r13		;
    c170:	07 dd       	bis	r13,	r7	;
    c172:	12 c3       	clrc			
    c174:	06 10       	rrc	r6		;
    c176:	1c b3       	bit	#1,	r12	;r3 As==01
    c178:	a2 23       	jnz	$-186    	;abs 0xc0be
    c17a:	1c 41 02 00 	mov	2(r1),	r12	;
    c17e:	19 41 10 00 	mov	16(r1),	r9	;0x00010
    c182:	8c 49 42 1c 	mov	r9,	7234(r12); 0x1c42
    c186:	18 41 12 00 	mov	18(r1),	r8	;0x00012
    c18a:	8c 48 40 1c 	mov	r8,	7232(r12); 0x1c40
    c18e:	1c 43       	mov	#1,	r12	;r3 As==01
    c190:	81 4c 0a 00 	mov	r12,	10(r1)	; 0x000a
    c194:	07 43       	clr	r7		;
    c196:	36 40 c1 0a 	mov	#2753,	r6	;#0x0ac1
    c19a:	0c 43       	clr	r12		;
    c19c:	81 4c 08 00 	mov	r12,	8(r1)	;
    c1a0:	81 4c 06 00 	mov	r12,	6(r1)	;
    c1a4:	81 4c 04 00 	mov	r12,	4(r1)	;
    c1a8:	1a 41 0e 00 	mov	14(r1),	r10	;0x0000e
    c1ac:	1b 41 0c 00 	mov	12(r1),	r11	;0x0000c
    c1b0:	3c 40 a1 0c 	mov	#3233,	r12	;#0x0ca1
    c1b4:	0d 43       	clr	r13		;
    c1b6:	0e 43       	clr	r14		;
    c1b8:	0f 43       	clr	r15		;
    c1ba:	b0 12 ec c3 	call	#-15380	;#0xc3ec
    c1be:	05 4e       	mov	r14,	r5	;
    c1c0:	04 4f       	mov	r15,	r4	;
    c1c2:	16 b3       	bit	#1,	r6	;r3 As==01
    c1c4:	2b 24       	jz	$+88     	;abs 0xc21c
    c1c6:	18 41 0a 00 	mov	10(r1),	r8	;0x0000a
    c1ca:	19 41 08 00 	mov	8(r1),	r9	;
    c1ce:	1a 41 06 00 	mov	6(r1),	r10	;
    c1d2:	1b 41 04 00 	mov	4(r1),	r11	;
    c1d6:	81 4c 16 00 	mov	r12,	22(r1)	; 0x0016
    c1da:	1c 41 16 00 	mov	22(r1),	r12	;0x00016
    c1de:	81 4d 14 00 	mov	r13,	20(r1)	; 0x0014
    c1e2:	1d 41 14 00 	mov	20(r1),	r13	;0x00014
    c1e6:	0e 45       	mov	r5,	r14	;
    c1e8:	0f 44       	mov	r4,	r15	;
    c1ea:	b0 12 c0 c2 	call	#-15680	;#0xc2c0
    c1ee:	08 4c       	mov	r12,	r8	;
    c1f0:	09 4d       	mov	r13,	r9	;
    c1f2:	0a 4e       	mov	r14,	r10	;
    c1f4:	0b 4f       	mov	r15,	r11	;
    c1f6:	3c 40 a1 0c 	mov	#3233,	r12	;#0x0ca1
    c1fa:	0d 43       	clr	r13		;
    c1fc:	0e 43       	clr	r14		;
    c1fe:	0f 43       	clr	r15		;
    c200:	b0 12 ec c3 	call	#-15380	;#0xc3ec
    c204:	81 4c 0a 00 	mov	r12,	10(r1)	; 0x000a
    c208:	1c 41 16 00 	mov	22(r1),	r12	;0x00016
    c20c:	81 4d 08 00 	mov	r13,	8(r1)	;
    c210:	1d 41 14 00 	mov	20(r1),	r13	;0x00014
    c214:	81 4e 06 00 	mov	r14,	6(r1)	;
    c218:	81 4f 04 00 	mov	r15,	4(r1)	;
    c21c:	08 4c       	mov	r12,	r8	;
    c21e:	09 4d       	mov	r13,	r9	;
    c220:	0a 45       	mov	r5,	r10	;
    c222:	0b 44       	mov	r4,	r11	;
    c224:	0e 45       	mov	r5,	r14	;
    c226:	0f 44       	mov	r4,	r15	;
    c228:	b0 12 c0 c2 	call	#-15680	;#0xc2c0
    c22c:	08 4c       	mov	r12,	r8	;
    c22e:	09 4d       	mov	r13,	r9	;
    c230:	0a 4e       	mov	r14,	r10	;
    c232:	0b 4f       	mov	r15,	r11	;
    c234:	07 93       	cmp	#0,	r7	;r3 As==00
    c236:	0d 42       	mov	r2,	r13	;
    c238:	26 93       	cmp	#2,	r6	;r3 As==10
    c23a:	0c 42       	mov	r2,	r12	;
    c23c:	07 93       	cmp	#0,	r7	;r3 As==00
    c23e:	04 24       	jz	$+10     	;abs 0xc248
    c240:	0d 11       	rra	r13		;
    c242:	1c 43       	mov	#1,	r12	;r3 As==01
    c244:	0c cd       	bic	r13,	r12	;
    c246:	01 3c       	jmp	$+4      	;abs 0xc24a
    c248:	1c f3       	and	#1,	r12	;r3 As==01
    c24a:	0d 47       	mov	r7,	r13	;
    c24c:	4d 4d       	mov.b	r13,	r13	;
    c24e:	8d 10       	swpb	r13		;
    c250:	12 c3       	clrc			
    c252:	06 10       	rrc	r6		;
    c254:	0d 5d       	rla	r13		;
    c256:	0d 5d       	rla	r13		;
    c258:	0d 5d       	rla	r13		;
    c25a:	0d 5d       	rla	r13		;
    c25c:	0d 5d       	rla	r13		;
    c25e:	0d 5d       	rla	r13		;
    c260:	0d 5d       	rla	r13		;
    c262:	06 dd       	bis	r13,	r6	;
    c264:	12 c3       	clrc			
    c266:	07 10       	rrc	r7		;
    c268:	1c b3       	bit	#1,	r12	;r3 As==01
    c26a:	a2 23       	jnz	$-186    	;abs 0xc1b0
    c26c:	1c 41 02 00 	mov	2(r1),	r12	;
    c270:	1d 41 08 00 	mov	8(r1),	r13	;
    c274:	8c 4d 82 1c 	mov	r13,	7298(r12); 0x1c82
    c278:	1d 41 0a 00 	mov	10(r1),	r13	;0x0000a
    c27c:	8c 4d 80 1c 	mov	r13,	7296(r12); 0x1c80
    c280:	1c 41 00 00 	mov	0(r1),	r12	;
    c284:	3c 90 0f 00 	cmp	#15,	r12	;#0x000f
    c288:	0d 20       	jnz	$+28     	;abs 0xc2a4
    c28a:	1c 43       	mov	#1,	r12	;r3 As==01
    c28c:	1c 52 c0 1c 	add	&0x1cc0,r12	;0x1cc0
    c290:	0c 93       	cmp	#0,	r12	;r3 As==00
    c292:	0d 42       	mov	r2,	r13	;
    c294:	0d 11       	rra	r13		;
    c296:	1d f3       	and	#1,	r13	;r3 As==01
    c298:	82 5d c2 1c 	add	r13,	&0x1cc2	;
    c29c:	82 4c c0 1c 	mov	r12,	&0x1cc0	;
    c2a0:	0c 43       	clr	r12		;
    c2a2:	01 3c       	jmp	$+4      	;abs 0xc2a6
    c2a4:	1c 53       	inc	r12		;
    c2a6:	82 4c c4 1c 	mov	r12,	&0x1cc4	;
    c2aa:	03 43       	nop			
    c2ac:	ea 3e       	jmp	$-554    	;abs 0xc082
    c2ae:	b0 12 b2 c2 	call	#-15694	;#0xc2b2

0000c2b2 <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c2b2:	b0 12 b6 c2 	call	#-15690	;#0xc2b6

0000c2b6 <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c2b6:	32 c2       	dint			
    c2b8:	03 43       	nop			
    c2ba:	ff 3f       	jmp	$+0      	;abs 0xc2ba

0000c2bc <PreInit_>:
    c2bc:	30 41       	ret			

0000c2be <DefaultHandler_>:
    c2be:	ff 3f       	jmp	$+0      	;abs 0xc2be

0000c2c0 <__mspabi_mpyll>:
    c2c0:	0a 12       	push	r10		;

0000c2c2 <.LCFI0>:
    c2c2:	09 12       	push	r9		;

0000c2c4 <.LCFI1>:
    c2c4:	08 12       	push	r8		;

0000c2c6 <.LCFI2>:
    c2c6:	07 12       	push	r7		;

0000c2c8 <.LCFI3>:
    c2c8:	06 12       	push	r6		;

0000c2ca <.LCFI4>:
    c2ca:	05 12       	push	r5		;

0000c2cc <.LCFI5>:
    c2cc:	04 12       	push	r4		;

0000c2ce <.LCFI6>:
    c2ce:	31 80 12 00 	sub	#18,	r1	;#0x0012

0000c2d2 <.LCFI7>:
    c2d2:	81 4a 0a 00 	mov	r10,	10(r1)	; 0x000a
    c2d6:	81 4b 0c 00 	mov	r11,	12(r1)	; 0x000c
    c2da:	05 4d       	mov	r13,	r5	;
    c2dc:	81 4e 0e 00 	mov	r14,	14(r1)	; 0x000e
    c2e0:	81 4f 10 00 	mov	r15,	16(r1)	; 0x0010

0000c2e4 <.Loc.55.1>:
    c2e4:	04 48       	mov	r8,	r4	;
    c2e6:	0a 48       	mov	r8,	r10	;

0000c2e8 <.Loc.63.1>:
    c2e8:	07 4c       	mov	r12,	r7	;
    c2ea:	81 4c 04 00 	mov	r12,	4(r1)	;

0000c2ee <.Loc.65.1>:
    c2ee:	38 40 a2 c3 	mov	#-15454,r8	;#0xc3a2

0000c2f2 <.LVL3>:
    c2f2:	0e 4c       	mov	r12,	r14	;
    c2f4:	4f 43       	clr.b	r15		;
    c2f6:	0c 44       	mov	r4,	r12	;

0000c2f8 <.LVL4>:
    c2f8:	4d 43       	clr.b	r13		;
    c2fa:	88 12       	call	r8		;

0000c2fc <.LVL5>:
    c2fc:	81 4c 06 00 	mov	r12,	6(r1)	;
    c300:	81 4d 08 00 	mov	r13,	8(r1)	;

0000c304 <.LVL6>:
    c304:	0e 47       	mov	r7,	r14	;
    c306:	4f 43       	clr.b	r15		;
    c308:	0c 49       	mov	r9,	r12	;

0000c30a <.LVL7>:
    c30a:	4d 43       	clr.b	r13		;

0000c30c <.LVL8>:
    c30c:	88 12       	call	r8		;

0000c30e <.LVL9>:
    c30e:	06 4c       	mov	r12,	r6	;
    c310:	07 4d       	mov	r13,	r7	;

0000c312 <.LVL10>:
    c312:	0e 45       	mov	r5,	r14	;
    c314:	4f 43       	clr.b	r15		;
    c316:	0c 49       	mov	r9,	r12	;
    c318:	4d 43       	clr.b	r13		;
    c31a:	88 12       	call	r8		;

0000c31c <.LVL11>:
    c31c:	81 4c 00 00 	mov	r12,	0(r1)	;
    c320:	81 4d 02 00 	mov	r13,	2(r1)	;

0000c324 <.LVL12>:
    c324:	0e 45       	mov	r5,	r14	;
    c326:	4f 43       	clr.b	r15		;
    c328:	0c 44       	mov	r4,	r12	;
    c32a:	4d 43       	clr.b	r13		;
    c32c:	88 12       	call	r8		;

0000c32e <.LVL13>:
    c32e:	0c 56       	add	r6,	r12	;
    c330:	0d 67       	addc	r7,	r13	;

0000c332 <.Loc.70.1>:
    c332:	48 43       	clr.b	r8		;
    c334:	1f 41 08 00 	mov	8(r1),	r15	;

0000c338 <.Loc.71.1>:
    c338:	0f 5c       	add	r12,	r15	;
    c33a:	08 6d       	addc	r13,	r8	;

0000c33c <.LVL15>:
    c33c:	08 97       	cmp	r7,	r8	;
    c33e:	04 28       	jnc	$+10     	;abs 0xc348
    c340:	07 98       	cmp	r8,	r7	;
    c342:	06 20       	jnz	$+14     	;abs 0xc350
    c344:	0f 96       	cmp	r6,	r15	;
    c346:	04 2c       	jc	$+10     	;abs 0xc350

0000c348 <.L4>:
    c348:	81 53 00 00 	add	#0,	0(r1)	;r3 As==00
    c34c:	91 63 02 00 	addc	#1,	2(r1)	;r3 As==01

0000c350 <.L2>:
    c350:	46 43       	clr.b	r6		;

0000c352 <.LVL17>:
    c352:	07 4f       	mov	r15,	r7	;

0000c354 <.Loc.77.1>:
    c354:	4d 43       	clr.b	r13		;
    c356:	1c 41 06 00 	mov	6(r1),	r12	;

0000c35a <.Loc.77.1>:
    c35a:	06 5c       	add	r12,	r6	;
    c35c:	07 6d       	addc	r13,	r7	;

0000c35e <.Loc.79.1>:
    c35e:	34 40 a2 c3 	mov	#-15454,r4	;#0xc3a2
    c362:	1e 41 0e 00 	mov	14(r1),	r14	;0x0000e
    c366:	1f 41 10 00 	mov	16(r1),	r15	;0x00010

0000c36a <.LVL19>:
    c36a:	0c 4a       	mov	r10,	r12	;
    c36c:	0d 49       	mov	r9,	r13	;
    c36e:	84 12       	call	r4		;

0000c370 <.LVL20>:
    c370:	0a 4c       	mov	r12,	r10	;
    c372:	09 4d       	mov	r13,	r9	;

0000c374 <.Loc.80.1>:
    c374:	1e 41 0a 00 	mov	10(r1),	r14	;0x0000a
    c378:	1f 41 0c 00 	mov	12(r1),	r15	;0x0000c
    c37c:	1c 41 04 00 	mov	4(r1),	r12	;
    c380:	0d 45       	mov	r5,	r13	;
    c382:	84 12       	call	r4		;

0000c384 <.LVL23>:
    c384:	0a 5c       	add	r12,	r10	;
    c386:	0f 49       	mov	r9,	r15	;
    c388:	0f 6d       	addc	r13,	r15	;
    c38a:	0a 58       	add	r8,	r10	;
    c38c:	49 43       	clr.b	r9		;
    c38e:	0f 69       	addc	r9,	r15	;
    c390:	0e 4a       	mov	r10,	r14	;
    c392:	2e 51       	add	@r1,	r14	;
    c394:	1f 61 02 00 	addc	2(r1),	r15	;

0000c398 <.Loc.81.1>:
    c398:	0c 46       	mov	r6,	r12	;
    c39a:	0d 47       	mov	r7,	r13	;
    c39c:	31 50 12 00 	add	#18,	r1	;#0x0012

0000c3a0 <.LCFI8>:
    c3a0:	7d 3d       	jmp	$+764    	;abs 0xc69c

0000c3a2 <__mspabi_mpyl>:
    c3a2:	0a 12       	push	r10		;

0000c3a4 <L0^A>:
    c3a4:	09 12       	push	r9		;

0000c3a6 <.LCFI11>:
    c3a6:	08 12       	push	r8		;

0000c3a8 <.LCFI12>:
    c3a8:	07 12       	push	r7		;

0000c3aa <.LCFI13>:
    c3aa:	06 12       	push	r6		;

0000c3ac <.LCFI14>:
    c3ac:	0a 4c       	mov	r12,	r10	;
    c3ae:	0b 4d       	mov	r13,	r11	;

0000c3b0 <.LVL27>:
    c3b0:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c3b4 <.Loc.30.2>:
    c3b4:	4c 43       	clr.b	r12		;

0000c3b6 <.LVL28>:
    c3b6:	4d 43       	clr.b	r13		;

0000c3b8 <.L6>:
    c3b8:	09 4e       	mov	r14,	r9	;
    c3ba:	09 df       	bis	r15,	r9	;
    c3bc:	09 93       	cmp	#0,	r9	;r3 As==00
    c3be:	05 24       	jz	$+12     	;abs 0xc3ca
    c3c0:	49 48       	mov.b	r8,	r9	;
    c3c2:	79 53       	add.b	#-1,	r9	;r3 As==11
    c3c4:	48 49       	mov.b	r9,	r8	;

0000c3c6 <.LVL30>:
    c3c6:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c3c8:	01 20       	jnz	$+4      	;abs 0xc3cc

0000c3ca <.L5>:
    c3ca:	6a 3d       	jmp	$+726    	;abs 0xc6a0

0000c3cc <.L10>:
    c3cc:	09 4e       	mov	r14,	r9	;
    c3ce:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c3d0 <.Loc.36.2>:
    c3d0:	09 93       	cmp	#0,	r9	;r3 As==00
    c3d2:	02 24       	jz	$+6      	;abs 0xc3d8

0000c3d4 <.Loc.37.2>:
    c3d4:	0c 5a       	add	r10,	r12	;

0000c3d6 <.LVL31>:
    c3d6:	0d 6b       	addc	r11,	r13	;

0000c3d8 <.L7>:
    c3d8:	06 4a       	mov	r10,	r6	;
    c3da:	07 4b       	mov	r11,	r7	;
    c3dc:	06 5a       	add	r10,	r6	;
    c3de:	07 6b       	addc	r11,	r7	;
    c3e0:	0a 46       	mov	r6,	r10	;

0000c3e2 <.LVL33>:
    c3e2:	0b 47       	mov	r7,	r11	;

0000c3e4 <.LVL34>:
    c3e4:	12 c3       	clrc			
    c3e6:	0f 10       	rrc	r15		;
    c3e8:	0e 10       	rrc	r14		;

0000c3ea <.LVL35>:
    c3ea:	e6 3f       	jmp	$-50     	;abs 0xc3b8

0000c3ec <__mspabi_remull>:
    c3ec:	0a 12       	push	r10		;

0000c3ee <.LCFI0>:
    c3ee:	09 12       	push	r9		;

0000c3f0 <L0^A>:
    c3f0:	08 12       	push	r8		;

0000c3f2 <.LCFI2>:
    c3f2:	07 12       	push	r7		;

0000c3f4 <.LCFI3>:
    c3f4:	06 12       	push	r6		;

0000c3f6 <.LCFI4>:
    c3f6:	05 12       	push	r5		;

0000c3f8 <.LCFI5>:
    c3f8:	04 12       	push	r4		;

0000c3fa <.LCFI6>:
    c3fa:	04 41       	mov	r1,	r4	;

0000c3fc <.LCFI7>:
    c3fc:	31 80 0e 00 	sub	#14,	r1	;#0x000e
    c400:	07 48       	mov	r8,	r7	;
    c402:	05 49       	mov	r9,	r5	;
    c404:	06 4a       	mov	r10,	r6	;
    c406:	84 4b fe ff 	mov	r11,	-2(r4)	; 0xfffe
    c40a:	08 4c       	mov	r12,	r8	;

0000c40c <.LVL1>:
    c40c:	09 4d       	mov	r13,	r9	;
    c40e:	0a 4e       	mov	r14,	r10	;
    c410:	0b 4f       	mov	r15,	r11	;

0000c412 <.LBB4>:
    c412:	84 9f fe ff 	cmp	r15,	-2(r4)	; 0xfffe
    c416:	12 29       	jnc	$+550    	;abs 0xc63c
    c418:	1f 94 fe ff 	cmp	-2(r4),	r15	;
    c41c:	0a 20       	jnz	$+22     	;abs 0xc432
    c41e:	06 9e       	cmp	r14,	r6	;
    c420:	0d 29       	jnc	$+540    	;abs 0xc63c
    c422:	0e 96       	cmp	r6,	r14	;
    c424:	06 20       	jnz	$+14     	;abs 0xc432
    c426:	05 9d       	cmp	r13,	r5	;
    c428:	09 29       	jnc	$+532    	;abs 0xc63c
    c42a:	0d 95       	cmp	r5,	r13	;
    c42c:	02 20       	jnz	$+6      	;abs 0xc432
    c42e:	07 9c       	cmp	r12,	r7	;
    c430:	05 29       	jnc	$+524    	;abs 0xc63c

0000c432 <.L36>:
    c432:	0c 48       	mov	r8,	r12	;

0000c434 <.LVL3>:
    c434:	0d 49       	mov	r9,	r13	;
    c436:	0e 4a       	mov	r10,	r14	;
    c438:	0f 4b       	mov	r11,	r15	;
    c43a:	84 4b f2 ff 	mov	r11,	-14(r4)	; 0xfff2
    c43e:	b0 12 f8 c6 	call	#-14600	;#0xc6f8

0000c442 <.LVL4>:
    c442:	84 4c fa ff 	mov	r12,	-6(r4)	; 0xfffa

0000c446 <.LVL5>:
    c446:	0c 47       	mov	r7,	r12	;

0000c448 <.LVL6>:
    c448:	0d 45       	mov	r5,	r13	;
    c44a:	0e 46       	mov	r6,	r14	;
    c44c:	1f 44 fe ff 	mov	-2(r4),	r15	;
    c450:	b0 12 f8 c6 	call	#-14600	;#0xc6f8

0000c454 <.LVL7>:
    c454:	1e 44 fa ff 	mov	-6(r4),	r14	;
    c458:	0d 4e       	mov	r14,	r13	;
    c45a:	3d b0 00 80 	bit	#-32768,r13	;#0x8000
    c45e:	0e 7e       	subc	r14,	r14	;
    c460:	3e e3       	inv	r14		;

0000c462 <.LVL8>:
    c462:	84 4d fa ff 	mov	r13,	-6(r4)	; 0xfffa
    c466:	84 4e fc ff 	mov	r14,	-4(r4)	; 0xfffc

0000c46a <.Loc.963.1>:
    c46a:	3c b0 00 80 	bit	#-32768,r12	;#0x8000
    c46e:	0d 7d       	subc	r13,	r13	;
    c470:	3d e3       	inv	r13		;

0000c472 <.LVL9>:
    c472:	1e 44 fa ff 	mov	-6(r4),	r14	;
    c476:	1f 44 fc ff 	mov	-4(r4),	r15	;
    c47a:	0e 8c       	sub	r12,	r14	;
    c47c:	0f 7d       	subc	r13,	r15	;
    c47e:	84 4e fa ff 	mov	r14,	-6(r4)	; 0xfffa
    c482:	84 4f fc ff 	mov	r15,	-4(r4)	; 0xfffc

0000c486 <.LVL10>:
    c486:	84 4e f4 ff 	mov	r14,	-12(r4)	; 0xfff4

0000c48a <.Loc.966.1>:
    c48a:	1b 44 f2 ff 	mov	-14(r4),r11	;0xfffffff2

0000c48e <.LVL11>:
    c48e:	1c 44 fa ff 	mov	-6(r4),	r12	;

0000c492 <.LVL12>:
    c492:	b0 12 ac c6 	call	#-14676	;#0xc6ac

0000c496 <.LVL13>:
    c496:	08 4c       	mov	r12,	r8	;
    c498:	09 4d       	mov	r13,	r9	;
    c49a:	0a 4e       	mov	r14,	r10	;
    c49c:	0b 4f       	mov	r15,	r11	;

0000c49e <.LVL14>:
    c49e:	84 9f fe ff 	cmp	r15,	-2(r4)	; 0xfffe
    c4a2:	39 28       	jnc	$+116    	;abs 0xc516
    c4a4:	1f 94 fe ff 	cmp	-2(r4),	r15	;
    c4a8:	0a 20       	jnz	$+22     	;abs 0xc4be
    c4aa:	06 9e       	cmp	r14,	r6	;
    c4ac:	34 28       	jnc	$+106    	;abs 0xc516
    c4ae:	0e 96       	cmp	r6,	r14	;
    c4b0:	06 20       	jnz	$+14     	;abs 0xc4be
    c4b2:	05 9d       	cmp	r13,	r5	;
    c4b4:	30 28       	jnc	$+98     	;abs 0xc516
    c4b6:	0d 95       	cmp	r5,	r13	;
    c4b8:	02 20       	jnz	$+6      	;abs 0xc4be
    c4ba:	07 9c       	cmp	r12,	r7	;
    c4bc:	2c 28       	jnc	$+90     	;abs 0xc516

0000c4be <.L37>:
    c4be:	0f 47       	mov	r7,	r15	;
    c4c0:	0f 88       	sub	r8,	r15	;
    c4c2:	84 4f f8 ff 	mov	r15,	-8(r4)	; 0xfff8
    c4c6:	5e 43       	mov.b	#1,	r14	;r3 As==01
    c4c8:	07 9f       	cmp	r15,	r7	;
    c4ca:	01 28       	jnc	$+4      	;abs 0xc4ce
    c4cc:	4e 43       	clr.b	r14		;

0000c4ce <.L6>:
    c4ce:	0c 45       	mov	r5,	r12	;
    c4d0:	0c 89       	sub	r9,	r12	;
    c4d2:	5f 43       	mov.b	#1,	r15	;r3 As==01
    c4d4:	05 9c       	cmp	r12,	r5	;
    c4d6:	01 28       	jnc	$+4      	;abs 0xc4da
    c4d8:	4f 43       	clr.b	r15		;

0000c4da <.L7>:
    c4da:	0d 4c       	mov	r12,	r13	;
    c4dc:	0d 8e       	sub	r14,	r13	;
    c4de:	5e 43       	mov.b	#1,	r14	;r3 As==01
    c4e0:	0c 9d       	cmp	r13,	r12	;
    c4e2:	01 28       	jnc	$+4      	;abs 0xc4e6
    c4e4:	4e 43       	clr.b	r14		;

0000c4e6 <.L8>:
    c4e6:	0f de       	bis	r14,	r15	;
    c4e8:	07 46       	mov	r6,	r7	;
    c4ea:	07 8a       	sub	r10,	r7	;

0000c4ec <.LVL15>:
    c4ec:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c4ee:	06 97       	cmp	r7,	r6	;
    c4f0:	01 28       	jnc	$+4      	;abs 0xc4f4
    c4f2:	4c 43       	clr.b	r12		;

0000c4f4 <.L9>:
    c4f4:	0e 47       	mov	r7,	r14	;
    c4f6:	0e 8f       	sub	r15,	r14	;
    c4f8:	5f 43       	mov.b	#1,	r15	;r3 As==01
    c4fa:	07 9e       	cmp	r14,	r7	;
    c4fc:	01 28       	jnc	$+4      	;abs 0xc500
    c4fe:	4f 43       	clr.b	r15		;

0000c500 <.L10>:
    c500:	0c df       	bis	r15,	r12	;
    c502:	1f 44 fe ff 	mov	-2(r4),	r15	;
    c506:	0f 8b       	sub	r11,	r15	;
    c508:	17 44 f8 ff 	mov	-8(r4),	r7	;
    c50c:	05 4d       	mov	r13,	r5	;
    c50e:	06 4e       	mov	r14,	r6	;
    c510:	0f 8c       	sub	r12,	r15	;
    c512:	84 4f fe ff 	mov	r15,	-2(r4)	; 0xfffe

0000c516 <.L4>:
    c516:	1c 44 fa ff 	mov	-6(r4),	r12	;
    c51a:	1c d4 fc ff 	bis	-4(r4),	r12	;
    c51e:	0c 93       	cmp	#0,	r12	;r3 As==00
    c520:	8d 24       	jz	$+284    	;abs 0xc63c

0000c522 <.Loc.981.1>:
    c522:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c524:	b0 12 d8 c6 	call	#-14632	;#0xc6d8

0000c528 <.LVL17>:
    c528:	84 4c f6 ff 	mov	r12,	-10(r4)	; 0xfff6
    c52c:	84 4d f8 ff 	mov	r13,	-8(r4)	; 0xfff8

0000c530 <.L35>:
    c530:	84 9f fe ff 	cmp	r15,	-2(r4)	; 0xfffe
    c534:	8b 28       	jnc	$+280    	;abs 0xc64c
    c536:	1f 94 fe ff 	cmp	-2(r4),	r15	;
    c53a:	0d 20       	jnz	$+28     	;abs 0xc556
    c53c:	06 9e       	cmp	r14,	r6	;
    c53e:	86 28       	jnc	$+270    	;abs 0xc64c
    c540:	0e 96       	cmp	r6,	r14	;
    c542:	09 20       	jnz	$+20     	;abs 0xc556
    c544:	15 94 f8 ff 	cmp	-8(r4),	r5	;
    c548:	81 28       	jnc	$+260    	;abs 0xc64c
    c54a:	84 95 f8 ff 	cmp	r5,	-8(r4)	; 0xfff8
    c54e:	03 20       	jnz	$+8      	;abs 0xc556
    c550:	17 94 f6 ff 	cmp	-10(r4),r7	;0xfffffff6
    c554:	7b 28       	jnc	$+248    	;abs 0xc64c

0000c556 <.L38>:
    c556:	0d 47       	mov	r7,	r13	;
    c558:	1d 84 f6 ff 	sub	-10(r4),r13	;0xfffffff6
    c55c:	59 43       	mov.b	#1,	r9	;r3 As==01
    c55e:	07 9d       	cmp	r13,	r7	;
    c560:	01 28       	jnc	$+4      	;abs 0xc564
    c562:	49 43       	clr.b	r9		;

0000c564 <.L14>:
    c564:	0c 45       	mov	r5,	r12	;
    c566:	1c 84 f8 ff 	sub	-8(r4),	r12	;
    c56a:	5a 43       	mov.b	#1,	r10	;r3 As==01
    c56c:	05 9c       	cmp	r12,	r5	;
    c56e:	01 28       	jnc	$+4      	;abs 0xc572
    c570:	4a 43       	clr.b	r10		;

0000c572 <.L15>:
    c572:	08 4c       	mov	r12,	r8	;
    c574:	08 89       	sub	r9,	r8	;
    c576:	59 43       	mov.b	#1,	r9	;r3 As==01
    c578:	0c 98       	cmp	r8,	r12	;
    c57a:	01 28       	jnc	$+4      	;abs 0xc57e
    c57c:	49 43       	clr.b	r9		;

0000c57e <.L16>:
    c57e:	0a d9       	bis	r9,	r10	;
    c580:	07 46       	mov	r6,	r7	;
    c582:	07 8e       	sub	r14,	r7	;

0000c584 <.LVL19>:
    c584:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c586:	06 97       	cmp	r7,	r6	;
    c588:	01 28       	jnc	$+4      	;abs 0xc58c
    c58a:	4c 43       	clr.b	r12		;

0000c58c <.L17>:
    c58c:	09 47       	mov	r7,	r9	;
    c58e:	09 8a       	sub	r10,	r9	;
    c590:	5a 43       	mov.b	#1,	r10	;r3 As==01
    c592:	07 99       	cmp	r9,	r7	;
    c594:	01 28       	jnc	$+4      	;abs 0xc598
    c596:	4a 43       	clr.b	r10		;

0000c598 <.L18>:
    c598:	0c da       	bis	r10,	r12	;
    c59a:	1b 44 fe ff 	mov	-2(r4),	r11	;
    c59e:	0b 8f       	sub	r15,	r11	;
    c5a0:	0b 8c       	sub	r12,	r11	;

0000c5a2 <.Loc.989.1>:
    c5a2:	0a 4d       	mov	r13,	r10	;
    c5a4:	0a 5a       	rla	r10		;
    c5a6:	56 43       	mov.b	#1,	r6	;r3 As==01
    c5a8:	0a 9d       	cmp	r13,	r10	;
    c5aa:	01 28       	jnc	$+4      	;abs 0xc5ae
    c5ac:	46 43       	clr.b	r6		;

0000c5ae <.L19>:
    c5ae:	0c 48       	mov	r8,	r12	;
    c5b0:	0c 5c       	rla	r12		;
    c5b2:	5d 43       	mov.b	#1,	r13	;r3 As==01
    c5b4:	0c 98       	cmp	r8,	r12	;
    c5b6:	01 28       	jnc	$+4      	;abs 0xc5ba
    c5b8:	4d 43       	clr.b	r13		;

0000c5ba <.L20>:
    c5ba:	06 5c       	add	r12,	r6	;
    c5bc:	58 43       	mov.b	#1,	r8	;r3 As==01
    c5be:	06 9c       	cmp	r12,	r6	;
    c5c0:	01 28       	jnc	$+4      	;abs 0xc5c4
    c5c2:	48 43       	clr.b	r8		;

0000c5c4 <.L21>:
    c5c4:	0d d8       	bis	r8,	r13	;
    c5c6:	08 49       	mov	r9,	r8	;
    c5c8:	08 58       	rla	r8		;
    c5ca:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c5cc:	08 99       	cmp	r9,	r8	;
    c5ce:	01 28       	jnc	$+4      	;abs 0xc5d2
    c5d0:	4c 43       	clr.b	r12		;

0000c5d2 <.L22>:
    c5d2:	0d 58       	add	r8,	r13	;
    c5d4:	59 43       	mov.b	#1,	r9	;r3 As==01
    c5d6:	0d 98       	cmp	r8,	r13	;
    c5d8:	01 28       	jnc	$+4      	;abs 0xc5dc
    c5da:	49 43       	clr.b	r9		;

0000c5dc <.L23>:
    c5dc:	0c d9       	bis	r9,	r12	;
    c5de:	0b 5b       	rla	r11		;
    c5e0:	0c 5b       	add	r11,	r12	;

0000c5e2 <.Loc.989.1>:
    c5e2:	07 4a       	mov	r10,	r7	;
    c5e4:	17 53       	inc	r7		;
    c5e6:	59 43       	mov.b	#1,	r9	;r3 As==01
    c5e8:	3a 93       	cmp	#-1,	r10	;r3 As==11
    c5ea:	01 2c       	jc	$+4      	;abs 0xc5ee
    c5ec:	49 43       	clr.b	r9		;

0000c5ee <.L24>:
    c5ee:	09 56       	add	r6,	r9	;
    c5f0:	5a 43       	mov.b	#1,	r10	;r3 As==01
    c5f2:	09 96       	cmp	r6,	r9	;
    c5f4:	01 28       	jnc	$+4      	;abs 0xc5f8
    c5f6:	4a 43       	clr.b	r10		;

0000c5f8 <.L26>:
    c5f8:	0a 5d       	add	r13,	r10	;
    c5fa:	5b 43       	mov.b	#1,	r11	;r3 As==01
    c5fc:	0a 9d       	cmp	r13,	r10	;
    c5fe:	01 28       	jnc	$+4      	;abs 0xc602
    c600:	4b 43       	clr.b	r11		;

0000c602 <.L28>:
    c602:	05 49       	mov	r9,	r5	;
    c604:	06 4a       	mov	r10,	r6	;
    c606:	0b 5c       	add	r12,	r11	;
    c608:	84 4b fe ff 	mov	r11,	-2(r4)	; 0xfffe

0000c60c <.L29>:
    c60c:	b4 53 fa ff 	add	#-1,	-6(r4)	;r3 As==11, 0xfffa
    c610:	b4 63 fc ff 	addc	#-1,	-4(r4)	;r3 As==11, 0xfffc

0000c614 <.Loc.993.1>:
    c614:	1c 44 fa ff 	mov	-6(r4),	r12	;
    c618:	1c d4 fc ff 	bis	-4(r4),	r12	;
    c61c:	0c 93       	cmp	#0,	r12	;r3 As==00
    c61e:	88 23       	jnz	$-238    	;abs 0xc530

0000c620 <.Loc.997.1>:
    c620:	08 47       	mov	r7,	r8	;
    c622:	09 45       	mov	r5,	r9	;
    c624:	0a 46       	mov	r6,	r10	;
    c626:	1b 44 fe ff 	mov	-2(r4),	r11	;
    c62a:	1c 44 f4 ff 	mov	-12(r4),r12	;0xfffffff4
    c62e:	b0 12 d8 c6 	call	#-14632	;#0xc6d8

0000c632 <.LVL22>:
    c632:	07 4c       	mov	r12,	r7	;

0000c634 <.LVL23>:
    c634:	05 4d       	mov	r13,	r5	;

0000c636 <.LVL24>:
    c636:	06 4e       	mov	r14,	r6	;

0000c638 <.LVL25>:
    c638:	84 4f fe ff 	mov	r15,	-2(r4)	; 0xfffe

0000c63c <.L2>:
    c63c:	0c 47       	mov	r7,	r12	;
    c63e:	0d 45       	mov	r5,	r13	;
    c640:	0e 46       	mov	r6,	r14	;
    c642:	1f 44 fe ff 	mov	-2(r4),	r15	;
    c646:	31 50 0e 00 	add	#14,	r1	;#0x000e
    c64a:	28 3c       	jmp	$+82     	;abs 0xc69c

0000c64c <.L12>:
    c64c:	08 47       	mov	r7,	r8	;
    c64e:	08 58       	rla	r8		;
    c650:	59 43       	mov.b	#1,	r9	;r3 As==01
    c652:	08 97       	cmp	r7,	r8	;
    c654:	01 28       	jnc	$+4      	;abs 0xc658
    c656:	49 43       	clr.b	r9		;

0000c658 <.L30>:
    c658:	0c 45       	mov	r5,	r12	;
    c65a:	0c 5c       	rla	r12		;
    c65c:	5a 43       	mov.b	#1,	r10	;r3 As==01
    c65e:	0c 95       	cmp	r5,	r12	;
    c660:	01 28       	jnc	$+4      	;abs 0xc664
    c662:	4a 43       	clr.b	r10		;

0000c664 <.L31>:
    c664:	09 5c       	add	r12,	r9	;
    c666:	5d 43       	mov.b	#1,	r13	;r3 As==01
    c668:	09 9c       	cmp	r12,	r9	;
    c66a:	01 28       	jnc	$+4      	;abs 0xc66e
    c66c:	4d 43       	clr.b	r13		;

0000c66e <.L32>:
    c66e:	0a dd       	bis	r13,	r10	;
    c670:	0d 46       	mov	r6,	r13	;
    c672:	0d 5d       	rla	r13		;
    c674:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c676:	0d 96       	cmp	r6,	r13	;
    c678:	01 28       	jnc	$+4      	;abs 0xc67c
    c67a:	4c 43       	clr.b	r12		;

0000c67c <.L33>:
    c67c:	0a 5d       	add	r13,	r10	;
    c67e:	57 43       	mov.b	#1,	r7	;r3 As==01

0000c680 <.LVL28>:
    c680:	0a 9d       	cmp	r13,	r10	;
    c682:	01 28       	jnc	$+4      	;abs 0xc686
    c684:	47 43       	clr.b	r7		;

0000c686 <.L34>:
    c686:	0c d7       	bis	r7,	r12	;
    c688:	1b 44 fe ff 	mov	-2(r4),	r11	;
    c68c:	0b 5b       	rla	r11		;
    c68e:	07 48       	mov	r8,	r7	;
    c690:	05 49       	mov	r9,	r5	;
    c692:	06 4a       	mov	r10,	r6	;
    c694:	0c 5b       	add	r11,	r12	;
    c696:	84 4c fe ff 	mov	r12,	-2(r4)	; 0xfffe

0000c69a <.LVL29>:
    c69a:	b8 3f       	jmp	$-142    	;abs 0xc60c

0000c69c <__mspabi_func_epilog_7>:
    c69c:	34 41       	pop	r4		;

0000c69e <__mspabi_func_epilog_6>:
    c69e:	35 41       	pop	r5		;

0000c6a0 <__mspabi_func_epilog_5>:
    c6a0:	36 41       	pop	r6		;

0000c6a2 <__mspabi_func_epilog_4>:
    c6a2:	37 41       	pop	r7		;

0000c6a4 <__mspabi_func_epilog_3>:
    c6a4:	38 41       	pop	r8		;

0000c6a6 <__mspabi_func_epilog_2>:
    c6a6:	39 41       	pop	r9		;

0000c6a8 <__mspabi_func_epilog_1>:
    c6a8:	3a 41       	pop	r10		;
    c6aa:	30 41       	ret			

0000c6ac <__mspabi_sllll>:
    c6ac:	0f 4b       	mov	r11,	r15	;
    c6ae:	0b 4c       	mov	r12,	r11	;
    c6b0:	0e 4a       	mov	r10,	r14	;
    c6b2:	0d 49       	mov	r9,	r13	;
    c6b4:	0c 48       	mov	r8,	r12	;
    c6b6:	0b 93       	cmp	#0,	r11	;r3 As==00
    c6b8:	01 20       	jnz	$+4      	;abs 0xc6bc
    c6ba:	30 41       	ret			

0000c6bc <.L1^B3>:
    c6bc:	0c 5c       	rla	r12		;
    c6be:	0d 6d       	rlc	r13		;
    c6c0:	0e 6e       	rlc	r14		;
    c6c2:	0f 6f       	rlc	r15		;
    c6c4:	3b 53       	add	#-1,	r11	;r3 As==11
    c6c6:	fa 23       	jnz	$-10     	;abs 0xc6bc
    c6c8:	30 41       	ret			

0000c6ca <.L1^B2>:
    c6ca:	3e 53       	add	#-1,	r14	;r3 As==11
    c6cc:	12 c3       	clrc			
    c6ce:	0d 10       	rrc	r13		;
    c6d0:	0c 10       	rrc	r12		;

0000c6d2 <__mspabi_srll>:
    c6d2:	0e 93       	cmp	#0,	r14	;r3 As==00
    c6d4:	fa 23       	jnz	$-10     	;abs 0xc6ca
    c6d6:	30 41       	ret			

0000c6d8 <__mspabi_srlll>:
    c6d8:	0f 4b       	mov	r11,	r15	;
    c6da:	0b 4c       	mov	r12,	r11	;
    c6dc:	0e 4a       	mov	r10,	r14	;
    c6de:	0d 49       	mov	r9,	r13	;
    c6e0:	0c 48       	mov	r8,	r12	;
    c6e2:	0b 93       	cmp	#0,	r11	;r3 As==00
    c6e4:	01 20       	jnz	$+4      	;abs 0xc6e8
    c6e6:	30 41       	ret			

0000c6e8 <.L1^B3>:
    c6e8:	12 c3       	clrc			
    c6ea:	0f 10       	rrc	r15		;
    c6ec:	0e 10       	rrc	r14		;
    c6ee:	0d 10       	rrc	r13		;
    c6f0:	0c 10       	rrc	r12		;
    c6f2:	3b 53       	add	#-1,	r11	;r3 As==11
    c6f4:	f9 23       	jnz	$-12     	;abs 0xc6e8
    c6f6:	30 41       	ret			

0000c6f8 <__clzdi2>:
    c6f8:	0a 12       	push	r10		;

0000c6fa <.LCFI0>:
    c6fa:	09 12       	push	r9		;

0000c6fc <.LCFI1>:
    c6fc:	08 12       	push	r8		;

0000c6fe <.LCFI2>:
    c6fe:	0a 4c       	mov	r12,	r10	;

0000c700 <.Loc.721.1>:
    c700:	0c 4e       	mov	r14,	r12	;

0000c702 <.LVL1>:
    c702:	0e df       	bis	r15,	r14	;
    c704:	0e 93       	cmp	#0,	r14	;r3 As==00
    c706:	0c 24       	jz	$+26     	;abs 0xc720

0000c708 <.Loc.726.1>:
    c708:	0d 4f       	mov	r15,	r13	;

0000c70a <.LVL2>:
    c70a:	4a 43       	clr.b	r10		;

0000c70c <.L4>:
    c70c:	0d 93       	cmp	#0,	r13	;r3 As==00
    c70e:	0c 20       	jnz	$+26     	;abs 0xc728
    c710:	7e 42       	mov.b	#8,	r14	;r2 As==11
    c712:	4f 43       	clr.b	r15		;
    c714:	79 40 ff 00 	mov.b	#255,	r9	;#0x00ff
    c718:	09 9c       	cmp	r12,	r9	;
    c71a:	10 28       	jnc	$+34     	;abs 0xc73c
    c71c:	4e 43       	clr.b	r14		;
    c71e:	0d 3c       	jmp	$+28     	;abs 0xc73a

0000c720 <.L2>:
    c720:	0c 4a       	mov	r10,	r12	;

0000c722 <.LVL5>:
    c722:	7a 40 20 00 	mov.b	#32,	r10	;#0x0020
    c726:	f2 3f       	jmp	$-26     	;abs 0xc70c

0000c728 <.L5>:
    c728:	7e 40 18 00 	mov.b	#24,	r14	;#0x0018
    c72c:	4f 43       	clr.b	r15		;
    c72e:	79 40 ff 00 	mov.b	#255,	r9	;#0x00ff
    c732:	09 9d       	cmp	r13,	r9	;
    c734:	03 28       	jnc	$+8      	;abs 0xc73c
    c736:	7e 40 10 00 	mov.b	#16,	r14	;#0x0010

0000c73a <.L15>:
    c73a:	4f 43       	clr.b	r15		;

0000c73c <.L7>:
    c73c:	78 40 20 00 	mov.b	#32,	r8	;#0x0020
    c740:	49 43       	clr.b	r9		;
    c742:	08 8e       	sub	r14,	r8	;
    c744:	09 7f       	subc	r15,	r9	;
    c746:	b0 12 d2 c6 	call	#-14638	;#0xc6d2

0000c74a <.LVL8>:
    c74a:	5c 4c 5c c7 	mov.b	-14500(r12),r12	;0xffffc75c
    c74e:	0a 8c       	sub	r12,	r10	;
    c750:	0c 4a       	mov	r10,	r12	;

0000c752 <.LBE4>:
    c752:	0c 58       	add	r8,	r12	;
    c754:	a7 3f       	jmp	$-176    	;abs 0xc6a4
