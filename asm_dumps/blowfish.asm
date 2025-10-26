
target/msp430-none-elf/release/blowfish:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 94 c2 	call	#-15724	;#0xc294
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 8c 02 	cmp	0x028c,	r4	;PC rel. 0xc298
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 7e 02 	cmp	0x027e,	r4	;PC rel. 0xc29a
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 9c c2 	mov.b	-15716(r4),7196(r4);0xffffc29c, 0x1c1c
    c024:	1c 1c 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	07 12       	push	r7		;
    c02e:	08 12       	push	r8		;
    c030:	09 12       	push	r9		;
    c032:	0a 12       	push	r10		;
    c034:	31 80 18 00 	sub	#24,	r1	;#0x0018
    c038:	3c 40 10 1c 	mov	#7184,	r12	;#0x1c10
    c03c:	3d 40 08 1c 	mov	#7176,	r13	;#0x1c08
    c040:	3e 40 78 ff 	mov	#-136,	r14	;#0xff78
    c044:	3f 40 00 1c 	mov	#7168,	r15	;#0x1c00
    c048:	4b 4e       	mov.b	r14,	r11	;
    c04a:	7b 50 b2 ff 	add.b	#-78,	r11	;#0xffb2
    c04e:	cf 4b 00 00 	mov.b	r11,	0(r15)	;
    c052:	1f 53       	inc	r15		;
    c054:	cd 43 00 00 	mov.b	#0,	0(r13)	;r3 As==00
    c058:	1d 53       	inc	r13		;
    c05a:	cc 43 00 00 	mov.b	#0,	0(r12)	;r3 As==00
    c05e:	1c 53       	inc	r12		;
    c060:	3e 50 11 00 	add	#17,	r14	;#0x0011
    c064:	0e 93       	cmp	#0,	r14	;r3 As==00
    c066:	f0 23       	jnz	$-30     	;abs 0xc048
    c068:	82 43 1a 1c 	mov	#0,	&0x1c1a	;r3 As==00
    c06c:	82 43 18 1c 	mov	#0,	&0x1c18	;r3 As==00
    c070:	0c 43       	clr	r12		;
    c072:	81 43 06 00 	mov	#0,	6(r1)	;r3 As==00
    c076:	81 43 04 00 	mov	#0,	4(r1)	;r3 As==00
    c07a:	81 43 02 00 	mov	#0,	2(r1)	;r3 As==00
    c07e:	81 43 00 00 	mov	#0,	0(r1)	;r3 As==00
    c082:	0d 41       	mov	r1,	r13	;
    c084:	0d 5c       	add	r12,	r13	;
    c086:	dd 4c 00 1c 	mov.b	7168(r12),0(r13)	;0x01c00
    c08a:	00 00 
    c08c:	1c 53       	inc	r12		;
    c08e:	3c 92       	cmp	#8,	r12	;r2 As==11
    c090:	f8 23       	jnz	$-14     	;abs 0xc082
    c092:	0b 43       	clr	r11		;
    c094:	19 41 04 00 	mov	4(r1),	r9	;
    c098:	89 10       	swpb	r9		;
    c09a:	1a 41 06 00 	mov	6(r1),	r10	;
    c09e:	8a 10       	swpb	r10		;
    c0a0:	1f 41 00 00 	mov	0(r1),	r15	;
    c0a4:	8f 10       	swpb	r15		;
    c0a6:	1e 41 02 00 	mov	2(r1),	r14	;
    c0aa:	8e 10       	swpb	r14		;
    c0ac:	0c 4f       	mov	r15,	r12	;
    c0ae:	1c eb 1e 1c 	xor	7198(r11),r12	;0x01c1e
    c0b2:	0d 4e       	mov	r14,	r13	;
    c0b4:	1d eb 1c 1c 	xor	7196(r11),r13	;0x01c1c
    c0b8:	12 c3       	clrc			
    c0ba:	0e 4c       	mov	r12,	r14	;
    c0bc:	0e 10       	rrc	r14		;
    c0be:	0e 11       	rra	r14		;
    c0c0:	0e 11       	rra	r14		;
    c0c2:	0e 11       	rra	r14		;
    c0c4:	0e 11       	rra	r14		;
    c0c6:	0e 11       	rra	r14		;
    c0c8:	3e f0 3c 00 	and	#60,	r14	;#0x003c
    c0cc:	1f 4e 34 1c 	mov	7220(r14),r15	;0x01c34
    c0d0:	1e 4e 36 1c 	mov	7222(r14),r14	;0x01c36
    c0d4:	08 4c       	mov	r12,	r8	;
    c0d6:	38 f0 0f 00 	and	#15,	r8	;#0x000f
    c0da:	08 58       	rla	r8		;
    c0dc:	08 58       	rla	r8		;
    c0de:	1e 58 76 1c 	add	7286(r8),r14	;0x01c76
    c0e2:	18 48 74 1c 	mov	7284(r8),r8	;0x01c74
    c0e6:	0f 58       	add	r8,	r15	;
    c0e8:	0f 98       	cmp	r8,	r15	;
    c0ea:	18 43       	mov	#1,	r8	;r3 As==01
    c0ec:	08 c2       	bic	r2,	r8	;
    c0ee:	08 5e       	add	r14,	r8	;
    c0f0:	12 c3       	clrc			
    c0f2:	0e 4d       	mov	r13,	r14	;
    c0f4:	0e 10       	rrc	r14		;
    c0f6:	0e 11       	rra	r14		;
    c0f8:	0e 11       	rra	r14		;
    c0fa:	0e 11       	rra	r14		;
    c0fc:	0e 11       	rra	r14		;
    c0fe:	0e 11       	rra	r14		;
    c100:	3e f0 3c 00 	and	#60,	r14	;#0x003c
    c104:	18 ee b6 1c 	xor	7350(r14),r8	;0x01cb6
    c108:	1f ee b4 1c 	xor	7348(r14),r15	;0x01cb4
    c10c:	07 4d       	mov	r13,	r7	;
    c10e:	37 f0 0f 00 	and	#15,	r7	;#0x000f
    c112:	07 57       	rla	r7		;
    c114:	07 57       	rla	r7		;
    c116:	18 57 f6 1c 	add	7414(r7),r8	;0x01cf6
    c11a:	0e 4f       	mov	r15,	r14	;
    c11c:	1e 57 f4 1c 	add	7412(r7),r14	;0x01cf4
    c120:	0e 9f       	cmp	r15,	r14	;
    c122:	1f 43       	mov	#1,	r15	;r3 As==01
    c124:	0f c2       	bic	r2,	r15	;
    c126:	0f 58       	add	r8,	r15	;
    c128:	0f e9       	xor	r9,	r15	;
    c12a:	0e ea       	xor	r10,	r14	;
    c12c:	2b 52       	add	#4,	r11	;r2 As==10
    c12e:	3b 90 10 00 	cmp	#16,	r11	;#0x0010
    c132:	0a 4d       	mov	r13,	r10	;
    c134:	09 4c       	mov	r12,	r9	;
    c136:	ba 23       	jnz	$-138    	;abs 0xc0ac
    c138:	1d e2 2c 1c 	xor	&0x1c2c,r13	;0x1c2c
    c13c:	c1 4d 0b 00 	mov.b	r13,	11(r1)	; 0x000b
    c140:	0b 4d       	mov	r13,	r11	;
    c142:	8b 10       	swpb	r11		;
    c144:	c1 4b 0a 00 	mov.b	r11,	10(r1)	; 0x000a
    c148:	1c e2 2e 1c 	xor	&0x1c2e,r12	;0x1c2e
    c14c:	c1 4c 09 00 	mov.b	r12,	9(r1)	;
    c150:	1e e2 30 1c 	xor	&0x1c30,r14	;0x1c30
    c154:	c1 4e 0f 00 	mov.b	r14,	15(r1)	; 0x000f
    c158:	1f e2 32 1c 	xor	&0x1c32,r15	;0x1c32
    c15c:	c1 4f 0d 00 	mov.b	r15,	13(r1)	; 0x000d
    c160:	0b 4c       	mov	r12,	r11	;
    c162:	8b 10       	swpb	r11		;
    c164:	c1 4b 08 00 	mov.b	r11,	8(r1)	;
    c168:	0b 4e       	mov	r14,	r11	;
    c16a:	8b 10       	swpb	r11		;
    c16c:	c1 4b 0e 00 	mov.b	r11,	14(r1)	; 0x000e
    c170:	0b 4f       	mov	r15,	r11	;
    c172:	8b 10       	swpb	r11		;
    c174:	c1 4b 0c 00 	mov.b	r11,	12(r1)	; 0x000c
    c178:	0b 43       	clr	r11		;
    c17a:	0a 41       	mov	r1,	r10	;
    c17c:	3a 50 08 00 	add	#8,	r10	;
    c180:	0a 5b       	add	r11,	r10	;
    c182:	db 4a 00 00 	mov.b	0(r10),	7176(r11); 0x1c08
    c186:	08 1c 
    c188:	1b 53       	inc	r11		;
    c18a:	3b 92       	cmp	#8,	r11	;r2 As==11
    c18c:	f6 23       	jnz	$-18     	;abs 0xc17a
    c18e:	3b 40 0c 00 	mov	#12,	r11	;#0x000c
    c192:	1d e2 30 1c 	xor	&0x1c30,r13	;0x1c30
    c196:	1c e2 32 1c 	xor	&0x1c32,r12	;0x1c32
    c19a:	1f e2 2e 1c 	xor	&0x1c2e,r15	;0x1c2e
    c19e:	1e e2 2c 1c 	xor	&0x1c2c,r14	;0x1c2c
    c1a2:	12 c3       	clrc			
    c1a4:	09 4f       	mov	r15,	r9	;
    c1a6:	09 10       	rrc	r9		;
    c1a8:	09 11       	rra	r9		;
    c1aa:	09 11       	rra	r9		;
    c1ac:	09 11       	rra	r9		;
    c1ae:	09 11       	rra	r9		;
    c1b0:	09 11       	rra	r9		;
    c1b2:	39 f0 3c 00 	and	#60,	r9	;#0x003c
    c1b6:	1a 49 34 1c 	mov	7220(r9),r10	;0x01c34
    c1ba:	18 49 36 1c 	mov	7222(r9),r8	;0x01c36
    c1be:	09 4f       	mov	r15,	r9	;
    c1c0:	09 59       	rla	r9		;
    c1c2:	09 59       	rla	r9		;
    c1c4:	39 f0 3c 00 	and	#60,	r9	;#0x003c
    c1c8:	18 59 76 1c 	add	7286(r9),r8	;0x01c76
    c1cc:	19 49 74 1c 	mov	7284(r9),r9	;0x01c74
    c1d0:	0a 59       	add	r9,	r10	;
    c1d2:	0a 99       	cmp	r9,	r10	;
    c1d4:	19 43       	mov	#1,	r9	;r3 As==01
    c1d6:	09 c2       	bic	r2,	r9	;
    c1d8:	09 58       	add	r8,	r9	;
    c1da:	12 c3       	clrc			
    c1dc:	08 4e       	mov	r14,	r8	;
    c1de:	08 10       	rrc	r8		;
    c1e0:	08 11       	rra	r8		;
    c1e2:	08 11       	rra	r8		;
    c1e4:	08 11       	rra	r8		;
    c1e6:	08 11       	rra	r8		;
    c1e8:	08 11       	rra	r8		;
    c1ea:	38 f0 3c 00 	and	#60,	r8	;#0x003c
    c1ee:	19 e8 b6 1c 	xor	7350(r8),r9	;0x01cb6
    c1f2:	1a e8 b4 1c 	xor	7348(r8),r10	;0x01cb4
    c1f6:	07 4e       	mov	r14,	r7	;
    c1f8:	07 57       	rla	r7		;
    c1fa:	07 57       	rla	r7		;
    c1fc:	37 f0 3c 00 	and	#60,	r7	;#0x003c
    c200:	19 57 f6 1c 	add	7414(r7),r9	;0x01cf6
    c204:	08 4a       	mov	r10,	r8	;
    c206:	18 57 f4 1c 	add	7412(r7),r8	;0x01cf4
    c20a:	08 9a       	cmp	r10,	r8	;
    c20c:	1a 43       	mov	#1,	r10	;r3 As==01
    c20e:	0a c2       	bic	r2,	r10	;
    c210:	0a 59       	add	r9,	r10	;
    c212:	0a ec       	xor	r12,	r10	;
    c214:	08 ed       	xor	r13,	r8	;
    c216:	0c 4f       	mov	r15,	r12	;
    c218:	1c eb 1e 1c 	xor	7198(r11),r12	;0x01c1e
    c21c:	0d 4e       	mov	r14,	r13	;
    c21e:	1d eb 1c 1c 	xor	7196(r11),r13	;0x01c1c
    c222:	3b 50 fc ff 	add	#-4,	r11	;#0xfffc
    c226:	3b 90 fc ff 	cmp	#-4,	r11	;#0xfffc
    c22a:	0e 48       	mov	r8,	r14	;
    c22c:	0f 4a       	mov	r10,	r15	;
    c22e:	b9 23       	jnz	$-140    	;abs 0xc1a2
    c230:	c1 48 17 00 	mov.b	r8,	23(r1)	; 0x0017
    c234:	c1 4d 13 00 	mov.b	r13,	19(r1)	; 0x0013
    c238:	88 10       	swpb	r8		;
    c23a:	c1 48 16 00 	mov.b	r8,	22(r1)	; 0x0016
    c23e:	c1 4a 15 00 	mov.b	r10,	21(r1)	; 0x0015
    c242:	8d 10       	swpb	r13		;
    c244:	c1 4d 12 00 	mov.b	r13,	18(r1)	; 0x0012
    c248:	c1 4c 11 00 	mov.b	r12,	17(r1)	; 0x0011
    c24c:	8a 10       	swpb	r10		;
    c24e:	c1 4a 14 00 	mov.b	r10,	20(r1)	; 0x0014
    c252:	8c 10       	swpb	r12		;
    c254:	c1 4c 10 00 	mov.b	r12,	16(r1)	; 0x0010
    c258:	0c 43       	clr	r12		;
    c25a:	0d 41       	mov	r1,	r13	;
    c25c:	3d 50 10 00 	add	#16,	r13	;#0x0010
    c260:	0d 5c       	add	r12,	r13	;
    c262:	dc 4d 00 00 	mov.b	0(r13),	7184(r12); 0x1c10
    c266:	10 1c 
    c268:	1c 53       	inc	r12		;
    c26a:	3c 92       	cmp	#8,	r12	;r2 As==11
    c26c:	f6 23       	jnz	$-18     	;abs 0xc25a
    c26e:	1c 43       	mov	#1,	r12	;r3 As==01
    c270:	1c 52 18 1c 	add	&0x1c18,r12	;0x1c18
    c274:	0c 93       	cmp	#0,	r12	;r3 As==00
    c276:	0d 42       	mov	r2,	r13	;
    c278:	0d 11       	rra	r13		;
    c27a:	1d f3       	and	#1,	r13	;r3 As==01
    c27c:	82 5d 1a 1c 	add	r13,	&0x1c1a	;
    c280:	82 4c 18 1c 	mov	r12,	&0x1c18	;
    c284:	0c 43       	clr	r12		;
    c286:	dc 53 00 1c 	inc.b	7168(r12)		;
    c28a:	1c 53       	inc	r12		;
    c28c:	3c 92       	cmp	#8,	r12	;r2 As==11
    c28e:	fb 23       	jnz	$-8      	;abs 0xc286
    c290:	03 43       	nop			
    c292:	ee 3e       	jmp	$-546    	;abs 0xc070

0000c294 <PreInit_>:
    c294:	30 41       	ret			

0000c296 <DefaultHandler_>:
    c296:	ff 3f       	jmp	$+0      	;abs 0xc296
