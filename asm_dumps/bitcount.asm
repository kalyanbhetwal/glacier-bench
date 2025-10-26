
target/msp430-none-elf/release/bitcount:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 24 c1 	call	#-16092	;#0xc124
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 78 01 	cmp	0x0178,	r4	;PC rel. 0xc184
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 6a 01 	cmp	0x016a,	r4	;PC rel. 0xc186
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 88 c1 	mov.b	-15992(r4),8454(r4);0xffffc188, 0x2106
    c024:	06 21 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	09 12       	push	r9		;
    c02e:	0a 12       	push	r10		;
    c030:	0a 43       	clr	r10		;
    c032:	39 40 00 1d 	mov	#7424,	r9	;#0x1d00
    c036:	0c 4a       	mov	r10,	r12	;
    c038:	0d 43       	clr	r13		;
    c03a:	3e 40 6d 4e 	mov	#20077,	r14	;#0x4e6d
    c03e:	3f 40 c6 41 	mov	#16838,	r15	;#0x41c6
    c042:	b0 12 28 c1 	call	#-16088	;#0xc128
    c046:	0e 4c       	mov	r12,	r14	;
    c048:	3e 50 39 30 	add	#12345,	r14	;#0x3039
    c04c:	89 4e 00 00 	mov	r14,	0(r9)	;
    c050:	0e 9c       	cmp	r12,	r14	;
    c052:	1c 43       	mov	#1,	r12	;r3 As==01
    c054:	0c c2       	bic	r2,	r12	;
    c056:	0c 5d       	add	r13,	r12	;
    c058:	3c f0 ff 7f 	and	#32767,	r12	;#0x7fff
    c05c:	89 4c 02 00 	mov	r12,	2(r9)	;
    c060:	29 52       	add	#4,	r9	;r2 As==10
    c062:	ca 43 00 1c 	mov.b	#0,	7168(r10);r3 As==00, 0x1c00
    c066:	1a 53       	inc	r10		;
    c068:	3a 90 00 01 	cmp	#256,	r10	;#0x0100
    c06c:	e4 23       	jnz	$-54     	;abs 0xc036
    c06e:	82 43 00 21 	mov	#0,	&0x2100	;r3 As==00
    c072:	82 43 04 21 	mov	#0,	&0x2104	;r3 As==00
    c076:	82 43 02 21 	mov	#0,	&0x2102	;r3 As==00
    c07a:	1c 42 00 21 	mov	&0x2100,r12	;0x2100
    c07e:	3c 90 00 01 	cmp	#256,	r12	;#0x0100
    c082:	49 2c       	jc	$+148    	;abs 0xc116
    c084:	0e 4c       	mov	r12,	r14	;
    c086:	0e 5e       	rla	r14		;
    c088:	0e 5e       	rla	r14		;
    c08a:	1d 4e 02 1d 	mov	7426(r14),r13	;0x01d02
    c08e:	1e 4e 00 1d 	mov	7424(r14),r14	;0x01d00
    c092:	0f 4e       	mov	r14,	r15	;
    c094:	0f dd       	bis	r13,	r15	;
    c096:	0f 93       	cmp	#0,	r15	;r3 As==00
    c098:	21 24       	jz	$+68     	;abs 0xc0dc
    c09a:	4f 43       	clr.b	r15		;
    c09c:	0d 93       	cmp	#0,	r13	;r3 As==00
    c09e:	0a 42       	mov	r2,	r10	;
    c0a0:	2e 93       	cmp	#2,	r14	;r3 As==10
    c0a2:	0b 42       	mov	r2,	r11	;
    c0a4:	0d 93       	cmp	#0,	r13	;r3 As==00
    c0a6:	04 24       	jz	$+10     	;abs 0xc0b0
    c0a8:	0a 11       	rra	r10		;
    c0aa:	1b 43       	mov	#1,	r11	;r3 As==01
    c0ac:	0b ca       	bic	r10,	r11	;
    c0ae:	01 3c       	jmp	$+4      	;abs 0xc0b2
    c0b0:	1b f3       	and	#1,	r11	;r3 As==01
    c0b2:	4a 4e       	mov.b	r14,	r10	;
    c0b4:	5a f3       	and.b	#1,	r10	;r3 As==01
    c0b6:	4f 5a       	add.b	r10,	r15	;
    c0b8:	0a 4d       	mov	r13,	r10	;
    c0ba:	4a 4a       	mov.b	r10,	r10	;
    c0bc:	8a 10       	swpb	r10		;
    c0be:	12 c3       	clrc			
    c0c0:	0e 10       	rrc	r14		;
    c0c2:	0a 5a       	rla	r10		;
    c0c4:	0a 5a       	rla	r10		;
    c0c6:	0a 5a       	rla	r10		;
    c0c8:	0a 5a       	rla	r10		;
    c0ca:	0a 5a       	rla	r10		;
    c0cc:	0a 5a       	rla	r10		;
    c0ce:	0a 5a       	rla	r10		;
    c0d0:	0e da       	bis	r10,	r14	;
    c0d2:	12 c3       	clrc			
    c0d4:	0d 10       	rrc	r13		;
    c0d6:	1b b3       	bit	#1,	r11	;r3 As==01
    c0d8:	e1 23       	jnz	$-60     	;abs 0xc09c
    c0da:	01 3c       	jmp	$+4      	;abs 0xc0de
    c0dc:	4f 43       	clr.b	r15		;
    c0de:	cc 4f 00 1c 	mov.b	r15,	7168(r12); 0x1c00
    c0e2:	4d 4f       	mov.b	r15,	r13	;
    c0e4:	1e 42 02 21 	mov	&0x2102,r14	;0x2102
    c0e8:	0d 5e       	add	r14,	r13	;
    c0ea:	0d 9e       	cmp	r14,	r13	;
    c0ec:	1e 43       	mov	#1,	r14	;r3 As==01
    c0ee:	0e c2       	bic	r2,	r14	;
    c0f0:	82 5e 04 21 	add	r14,	&0x2104	;
    c0f4:	82 4d 02 21 	mov	r13,	&0x2102	;
    c0f8:	3c 90 ff 00 	cmp	#255,	r12	;#0x00ff
    c0fc:	07 20       	jnz	$+16     	;abs 0xc10c
    c0fe:	82 43 00 21 	mov	#0,	&0x2100	;r3 As==00
    c102:	82 43 04 21 	mov	#0,	&0x2104	;r3 As==00
    c106:	82 43 02 21 	mov	#0,	&0x2102	;r3 As==00
    c10a:	03 3c       	jmp	$+8      	;abs 0xc112
    c10c:	1c 53       	inc	r12		;
    c10e:	82 4c 00 21 	mov	r12,	&0x2100	;
    c112:	03 43       	nop			
    c114:	b2 3f       	jmp	$-154    	;abs 0xc07a
    c116:	b0 12 1a c1 	call	#-16102	;#0xc11a

0000c11a <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c11a:	b0 12 1e c1 	call	#-16098	;#0xc11e

0000c11e <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c11e:	32 c2       	dint			
    c120:	03 43       	nop			
    c122:	ff 3f       	jmp	$+0      	;abs 0xc122

0000c124 <PreInit_>:
    c124:	30 41       	ret			

0000c126 <DefaultHandler_>:
    c126:	ff 3f       	jmp	$+0      	;abs 0xc126

0000c128 <__mspabi_mpyl>:
    c128:	0a 12       	push	r10		;

0000c12a <.LCFI10>:
    c12a:	09 12       	push	r9		;

0000c12c <.LCFI11>:
    c12c:	08 12       	push	r8		;

0000c12e <.LCFI12>:
    c12e:	07 12       	push	r7		;

0000c130 <.LCFI13>:
    c130:	06 12       	push	r6		;

0000c132 <.LCFI14>:
    c132:	0a 4c       	mov	r12,	r10	;
    c134:	0b 4d       	mov	r13,	r11	;

0000c136 <.LVL27>:
    c136:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c13a <.Loc.30.2>:
    c13a:	4c 43       	clr.b	r12		;

0000c13c <.LVL28>:
    c13c:	4d 43       	clr.b	r13		;

0000c13e <.L6>:
    c13e:	09 4e       	mov	r14,	r9	;
    c140:	09 df       	bis	r15,	r9	;
    c142:	09 93       	cmp	#0,	r9	;r3 As==00
    c144:	05 24       	jz	$+12     	;abs 0xc150
    c146:	49 48       	mov.b	r8,	r9	;
    c148:	79 53       	add.b	#-1,	r9	;r3 As==11
    c14a:	48 49       	mov.b	r9,	r8	;

0000c14c <.LVL30>:
    c14c:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c14e:	01 20       	jnz	$+4      	;abs 0xc152

0000c150 <.L5>:
    c150:	12 3c       	jmp	$+38     	;abs 0xc176

0000c152 <.L10>:
    c152:	09 4e       	mov	r14,	r9	;
    c154:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c156 <.Loc.36.2>:
    c156:	09 93       	cmp	#0,	r9	;r3 As==00
    c158:	02 24       	jz	$+6      	;abs 0xc15e

0000c15a <.Loc.37.2>:
    c15a:	0c 5a       	add	r10,	r12	;

0000c15c <.LVL31>:
    c15c:	0d 6b       	addc	r11,	r13	;

0000c15e <.L7>:
    c15e:	06 4a       	mov	r10,	r6	;
    c160:	07 4b       	mov	r11,	r7	;
    c162:	06 5a       	add	r10,	r6	;
    c164:	07 6b       	addc	r11,	r7	;
    c166:	0a 46       	mov	r6,	r10	;

0000c168 <.LVL33>:
    c168:	0b 47       	mov	r7,	r11	;

0000c16a <.LVL34>:
    c16a:	12 c3       	clrc			
    c16c:	0f 10       	rrc	r15		;
    c16e:	0e 10       	rrc	r14		;

0000c170 <.LVL35>:
    c170:	e6 3f       	jmp	$-50     	;abs 0xc13e

0000c172 <__mspabi_func_epilog_7>:
    c172:	34 41       	pop	r4		;

0000c174 <__mspabi_func_epilog_6>:
    c174:	35 41       	pop	r5		;

0000c176 <__mspabi_func_epilog_5>:
    c176:	36 41       	pop	r6		;

0000c178 <__mspabi_func_epilog_4>:
    c178:	37 41       	pop	r7		;

0000c17a <__mspabi_func_epilog_3>:
    c17a:	38 41       	pop	r8		;

0000c17c <__mspabi_func_epilog_2>:
    c17c:	39 41       	pop	r9		;

0000c17e <__mspabi_func_epilog_1>:
    c17e:	3a 41       	pop	r10		;
    c180:	30 41       	ret			
