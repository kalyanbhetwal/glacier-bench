
target/msp430-none-elf/release/bitcount_cmp:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 18 c1 	call	#-16104	;#0xc118
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 6c 01 	cmp	0x016c,	r4	;PC rel. 0xc178
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 5e 01 	cmp	0x015e,	r4	;PC rel. 0xc17a
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 7c c1 	mov.b	-16004(r4),7938(r4);0xffffc17c, 0x1f02
    c024:	02 1f 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	08 12       	push	r8		;
    c02e:	09 12       	push	r9		;
    c030:	0a 12       	push	r10		;
    c032:	0a 43       	clr	r10		;
    c034:	39 40 00 1d 	mov	#7424,	r9	;#0x1d00
    c038:	0c 4a       	mov	r10,	r12	;
    c03a:	0d 43       	clr	r13		;
    c03c:	3e 40 8f bc 	mov	#-17265,r14	;#0xbc8f
    c040:	0f 43       	clr	r15		;
    c042:	b0 12 1c c1 	call	#-16100	;#0xc11c
    c046:	89 4d 02 00 	mov	r13,	2(r9)	;
    c04a:	89 4c 00 00 	mov	r12,	0(r9)	;
    c04e:	29 52       	add	#4,	r9	;r2 As==10
    c050:	ca 43 00 1c 	mov.b	#0,	7168(r10);r3 As==00, 0x1c00
    c054:	ca 43 80 1c 	mov.b	#0,	7296(r10);r3 As==00, 0x1c80
    c058:	1a 53       	inc	r10		;
    c05a:	3a 90 80 00 	cmp	#128,	r10	;#0x0080
    c05e:	ec 23       	jnz	$-38     	;abs 0xc038
    c060:	82 43 00 1f 	mov	#0,	&0x1f00	;r3 As==00
    c064:	1c 42 00 1f 	mov	&0x1f00,r12	;0x1f00
    c068:	3c 90 80 00 	cmp	#128,	r12	;#0x0080
    c06c:	4e 2c       	jc	$+158    	;abs 0xc10a
    c06e:	0d 4c       	mov	r12,	r13	;
    c070:	0d 5d       	rla	r13		;
    c072:	0d 5d       	rla	r13		;
    c074:	1e 4d 02 1d 	mov	7426(r13),r14	;0x01d02
    c078:	1f 4d 00 1d 	mov	7424(r13),r15	;0x01d00
    c07c:	0d 4f       	mov	r15,	r13	;
    c07e:	0d de       	bis	r14,	r13	;
    c080:	0d 93       	cmp	#0,	r13	;r3 As==00
    c082:	33 24       	jz	$+104    	;abs 0xc0ea
    c084:	4d 43       	clr.b	r13		;
    c086:	0b 4f       	mov	r15,	r11	;
    c088:	0a 4e       	mov	r14,	r10	;
    c08a:	0a 93       	cmp	#0,	r10	;r3 As==00
    c08c:	08 42       	mov	r2,	r8	;
    c08e:	2b 93       	cmp	#2,	r11	;r3 As==10
    c090:	09 42       	mov	r2,	r9	;
    c092:	0a 93       	cmp	#0,	r10	;r3 As==00
    c094:	04 24       	jz	$+10     	;abs 0xc09e
    c096:	08 11       	rra	r8		;
    c098:	19 43       	mov	#1,	r9	;r3 As==01
    c09a:	09 c8       	bic	r8,	r9	;
    c09c:	01 3c       	jmp	$+4      	;abs 0xc0a0
    c09e:	19 f3       	and	#1,	r9	;r3 As==01
    c0a0:	48 4b       	mov.b	r11,	r8	;
    c0a2:	58 f3       	and.b	#1,	r8	;r3 As==01
    c0a4:	4d 58       	add.b	r8,	r13	;
    c0a6:	08 4a       	mov	r10,	r8	;
    c0a8:	48 48       	mov.b	r8,	r8	;
    c0aa:	88 10       	swpb	r8		;
    c0ac:	12 c3       	clrc			
    c0ae:	0b 10       	rrc	r11		;
    c0b0:	08 58       	rla	r8		;
    c0b2:	08 58       	rla	r8		;
    c0b4:	08 58       	rla	r8		;
    c0b6:	08 58       	rla	r8		;
    c0b8:	08 58       	rla	r8		;
    c0ba:	08 58       	rla	r8		;
    c0bc:	08 58       	rla	r8		;
    c0be:	0b d8       	bis	r8,	r11	;
    c0c0:	12 c3       	clrc			
    c0c2:	0a 10       	rrc	r10		;
    c0c4:	19 b3       	bit	#1,	r9	;r3 As==01
    c0c6:	e1 23       	jnz	$-60     	;abs 0xc08a
    c0c8:	4b 43       	clr.b	r11		;
    c0ca:	0f 93       	cmp	#0,	r15	;r3 As==00
    c0cc:	0a 42       	mov	r2,	r10	;
    c0ce:	09 4f       	mov	r15,	r9	;
    c0d0:	39 53       	add	#-1,	r9	;r3 As==11
    c0d2:	0f f9       	and	r9,	r15	;
    c0d4:	0a 11       	rra	r10		;
    c0d6:	1a f3       	and	#1,	r10	;r3 As==01
    c0d8:	09 4e       	mov	r14,	r9	;
    c0da:	09 8a       	sub	r10,	r9	;
    c0dc:	0e f9       	and	r9,	r14	;
    c0de:	5b 53       	inc.b	r11		;
    c0e0:	0a 4f       	mov	r15,	r10	;
    c0e2:	0a de       	bis	r14,	r10	;
    c0e4:	0a 93       	cmp	#0,	r10	;r3 As==00
    c0e6:	f1 23       	jnz	$-28     	;abs 0xc0ca
    c0e8:	02 3c       	jmp	$+6      	;abs 0xc0ee
    c0ea:	4d 43       	clr.b	r13		;
    c0ec:	4b 43       	clr.b	r11		;
    c0ee:	cc 4d 00 1c 	mov.b	r13,	7168(r12); 0x1c00
    c0f2:	cc 4b 80 1c 	mov.b	r11,	7296(r12); 0x1c80
    c0f6:	0d 43       	clr	r13		;
    c0f8:	3c 90 7f 00 	cmp	#127,	r12	;#0x007f
    c0fc:	02 24       	jz	$+6      	;abs 0xc102
    c0fe:	1c 53       	inc	r12		;
    c100:	0d 4c       	mov	r12,	r13	;
    c102:	82 4d 00 1f 	mov	r13,	&0x1f00	;
    c106:	03 43       	nop			
    c108:	ad 3f       	jmp	$-164    	;abs 0xc064
    c10a:	b0 12 0e c1 	call	#-16114	;#0xc10e

0000c10e <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c10e:	b0 12 12 c1 	call	#-16110	;#0xc112

0000c112 <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c112:	32 c2       	dint			
    c114:	03 43       	nop			
    c116:	ff 3f       	jmp	$+0      	;abs 0xc116

0000c118 <PreInit_>:
    c118:	30 41       	ret			

0000c11a <DefaultHandler_>:
    c11a:	ff 3f       	jmp	$+0      	;abs 0xc11a

0000c11c <__mspabi_mpyl>:
    c11c:	0a 12       	push	r10		;

0000c11e <.LCFI10>:
    c11e:	09 12       	push	r9		;

0000c120 <.LCFI11>:
    c120:	08 12       	push	r8		;

0000c122 <.LCFI12>:
    c122:	07 12       	push	r7		;

0000c124 <.LCFI13>:
    c124:	06 12       	push	r6		;

0000c126 <.LCFI14>:
    c126:	0a 4c       	mov	r12,	r10	;
    c128:	0b 4d       	mov	r13,	r11	;

0000c12a <.LVL27>:
    c12a:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c12e <.Loc.30.2>:
    c12e:	4c 43       	clr.b	r12		;

0000c130 <.LVL28>:
    c130:	4d 43       	clr.b	r13		;

0000c132 <.L6>:
    c132:	09 4e       	mov	r14,	r9	;
    c134:	09 df       	bis	r15,	r9	;
    c136:	09 93       	cmp	#0,	r9	;r3 As==00
    c138:	05 24       	jz	$+12     	;abs 0xc144
    c13a:	49 48       	mov.b	r8,	r9	;
    c13c:	79 53       	add.b	#-1,	r9	;r3 As==11
    c13e:	48 49       	mov.b	r9,	r8	;

0000c140 <.LVL30>:
    c140:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c142:	01 20       	jnz	$+4      	;abs 0xc146

0000c144 <.L5>:
    c144:	12 3c       	jmp	$+38     	;abs 0xc16a

0000c146 <.L10>:
    c146:	09 4e       	mov	r14,	r9	;
    c148:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c14a <.Loc.36.2>:
    c14a:	09 93       	cmp	#0,	r9	;r3 As==00
    c14c:	02 24       	jz	$+6      	;abs 0xc152

0000c14e <.Loc.37.2>:
    c14e:	0c 5a       	add	r10,	r12	;

0000c150 <.LVL31>:
    c150:	0d 6b       	addc	r11,	r13	;

0000c152 <.L7>:
    c152:	06 4a       	mov	r10,	r6	;
    c154:	07 4b       	mov	r11,	r7	;
    c156:	06 5a       	add	r10,	r6	;
    c158:	07 6b       	addc	r11,	r7	;
    c15a:	0a 46       	mov	r6,	r10	;

0000c15c <.LVL33>:
    c15c:	0b 47       	mov	r7,	r11	;

0000c15e <.LVL34>:
    c15e:	12 c3       	clrc			
    c160:	0f 10       	rrc	r15		;
    c162:	0e 10       	rrc	r14		;

0000c164 <.LVL35>:
    c164:	e6 3f       	jmp	$-50     	;abs 0xc132

0000c166 <__mspabi_func_epilog_7>:
    c166:	34 41       	pop	r4		;

0000c168 <__mspabi_func_epilog_6>:
    c168:	35 41       	pop	r5		;

0000c16a <__mspabi_func_epilog_5>:
    c16a:	36 41       	pop	r6		;

0000c16c <__mspabi_func_epilog_4>:
    c16c:	37 41       	pop	r7		;

0000c16e <__mspabi_func_epilog_3>:
    c16e:	38 41       	pop	r8		;

0000c170 <__mspabi_func_epilog_2>:
    c170:	39 41       	pop	r9		;

0000c172 <__mspabi_func_epilog_1>:
    c172:	3a 41       	pop	r10		;
    c174:	30 41       	ret			
