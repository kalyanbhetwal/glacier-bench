
target/msp430-none-elf/release/activity_recognition:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 e2 c5 	call	#-14878	;#0xc5e2
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 48 07 	cmp	0x0748,	r4	;PC rel. 0xc754
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 3a 07 	cmp	0x073a,	r4	;PC rel. 0xc756
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 58 c7 	mov.b	-14504(r4),7624(r4);0xffffc758, 0x1dc8
    c024:	c8 1d 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	6a 3c       	jmp	$+214    	;abs 0xc100

0000c02c <TIMER2_A0>:
    c02c:	06 12       	push	r6		;
    c02e:	07 12       	push	r7		;
    c030:	08 12       	push	r8		;
    c032:	09 12       	push	r9		;
    c034:	0a 12       	push	r10		;
    c036:	0b 12       	push	r11		;
    c038:	0c 12       	push	r12		;
    c03a:	0d 12       	push	r13		;
    c03c:	0e 12       	push	r14		;
    c03e:	0f 12       	push	r15		;
    c040:	1a 42 c0 1d 	mov	&0x1dc0,r10	;0x1dc0
    c044:	16 42 c0 1d 	mov	&0x1dc0,r6	;0x1dc0
    c048:	0c 46       	mov	r6,	r12	;
    c04a:	3d 40 17 00 	mov	#23,	r13	;#0x0017
    c04e:	b0 12 30 c6 	call	#-14800	;#0xc630
    c052:	08 4c       	mov	r12,	r8	;
    c054:	0c 46       	mov	r6,	r12	;
    c056:	3d 40 1d 00 	mov	#29,	r13	;#0x001d
    c05a:	b0 12 30 c6 	call	#-14800	;#0xc630
    c05e:	09 4c       	mov	r12,	r9	;
    c060:	0c 4a       	mov	r10,	r12	;
    c062:	3d 40 03 00 	mov	#3,	r13	;
    c066:	b0 12 30 c6 	call	#-14800	;#0xc630
    c06a:	07 4c       	mov	r12,	r7	;
    c06c:	37 90 c0 00 	cmp	#192,	r7	;#0x00c0
    c070:	40 2c       	jc	$+130    	;abs 0xc0f2
    c072:	0c 46       	mov	r6,	r12	;
    c074:	3d 40 11 00 	mov	#17,	r13	;#0x0011
    c078:	b0 12 30 c6 	call	#-14800	;#0xc630
    c07c:	3c 50 1f 00 	add	#31,	r12	;#0x001f
    c080:	3c f0 ff 07 	and	#2047,	r12	;#0x07ff
    c084:	3c 50 00 fc 	add	#-1024,	r12	;#0xfc00
    c088:	0d 47       	mov	r7,	r13	;
    c08a:	0d 5d       	rla	r13		;
    c08c:	8d 4c 00 1c 	mov	r12,	7168(r13); 0x1c00
    c090:	37 90 bf 00 	cmp	#191,	r7	;#0x00bf
    c094:	31 24       	jz	$+100    	;abs 0xc0f8
    c096:	38 50 2f 00 	add	#47,	r8	;#0x002f
    c09a:	38 f0 ff 07 	and	#2047,	r8	;#0x07ff
    c09e:	38 50 00 fc 	add	#-1024,	r8	;#0xfc00
    c0a2:	3d 50 00 1c 	add	#7168,	r13	;#0x1c00
    c0a6:	8d 48 02 00 	mov	r8,	2(r13)	;
    c0aa:	0c 47       	mov	r7,	r12	;
    c0ac:	2c 53       	incd	r12		;
    c0ae:	37 90 be 00 	cmp	#190,	r7	;#0x00be
    c0b2:	24 2c       	jc	$+74     	;abs 0xc0fc
    c0b4:	39 50 3b 00 	add	#59,	r9	;#0x003b
    c0b8:	39 f0 ff 07 	and	#2047,	r9	;#0x07ff
    c0bc:	39 50 00 fc 	add	#-1024,	r9	;#0xfc00
    c0c0:	0c 5c       	rla	r12		;
    c0c2:	8c 49 00 1c 	mov	r9,	7168(r12); 0x1c00
    c0c6:	1a 53       	inc	r10		;
    c0c8:	3a 90 40 00 	cmp	#64,	r10	;#0x0040
    c0cc:	05 28       	jnc	$+12     	;abs 0xc0d8
    c0ce:	82 43 c0 1d 	mov	#0,	&0x1dc0	;r3 As==00
    c0d2:	d2 43 c6 1d 	mov.b	#1,	&0x1dc6	;r3 As==01
    c0d6:	02 3c       	jmp	$+6      	;abs 0xc0dc
    c0d8:	82 4a c0 1d 	mov	r10,	&0x1dc0	;
    c0dc:	3f 41       	pop	r15		;
    c0de:	3e 41       	pop	r14		;
    c0e0:	3d 41       	pop	r13		;
    c0e2:	3c 41       	pop	r12		;
    c0e4:	3b 41       	pop	r11		;
    c0e6:	3a 41       	pop	r10		;
    c0e8:	39 41       	pop	r9		;
    c0ea:	38 41       	pop	r8		;
    c0ec:	37 41       	pop	r7		;
    c0ee:	36 41       	pop	r6		;
    c0f0:	00 13       	reti			
    c0f2:	0c 47       	mov	r7,	r12	;
    c0f4:	b0 12 d8 c5 	call	#-14888	;#0xc5d8
    c0f8:	3c 40 c0 00 	mov	#192,	r12	;#0x00c0
    c0fc:	b0 12 d8 c5 	call	#-14888	;#0xc5d8

0000c100 <main>:
    c100:	04 12       	push	r4		;
    c102:	05 12       	push	r5		;
    c104:	06 12       	push	r6		;
    c106:	07 12       	push	r7		;
    c108:	08 12       	push	r8		;
    c10a:	09 12       	push	r9		;
    c10c:	0a 12       	push	r10		;
    c10e:	31 80 0e 00 	sub	#14,	r1	;#0x000e
    c112:	0c 43       	clr	r12		;
    c114:	8c 43 00 1c 	mov	#0,	7168(r12);r3 As==00, 0x1c00
    c118:	2c 53       	incd	r12		;
    c11a:	3c 90 80 01 	cmp	#384,	r12	;#0x0180
    c11e:	fa 23       	jnz	$-10     	;abs 0xc114
    c120:	0c 43       	clr	r12		;
    c122:	8c 43 82 1d 	mov	#0,	7554(r12);r3 As==00, 0x1d82
    c126:	8c 43 80 1d 	mov	#0,	7552(r12);r3 As==00, 0x1d80
    c12a:	2c 52       	add	#4,	r12	;r2 As==10
    c12c:	3c 90 40 00 	cmp	#64,	r12	;#0x0040
    c130:	f8 23       	jnz	$-14     	;abs 0xc122
    c132:	82 43 c0 1d 	mov	#0,	&0x1dc0	;r3 As==00
    c136:	d2 43 c7 1d 	mov.b	#1,	&0x1dc7	;r3 As==01
    c13a:	82 43 c4 1d 	mov	#0,	&0x1dc4	;r3 As==00
    c13e:	82 43 c2 1d 	mov	#0,	&0x1dc2	;r3 As==00
    c142:	82 43 00 04 	mov	#0,	&0x0400	;r3 As==00
    c146:	b2 40 d4 30 	mov	#12500,	&0x0412	;#0x30d4
    c14a:	12 04 
    c14c:	a2 d2 00 04 	bis	#4,	&0x0400	;r2 As==10
    c150:	b2 d0 10 00 	bis	#16,	&0x0402	;#0x0010
    c154:	02 04 
    c156:	b2 40 d0 02 	mov	#720,	&0x0400	;#0x02d0
    c15a:	00 04 
    c15c:	03 43       	nop			
    c15e:	32 d2       	eint			
    c160:	03 43       	nop			
    c162:	5c 42 c6 1d 	mov.b	&0x1dc6,r12	;0x1dc6
    c166:	1c b3       	bit	#1,	r12	;r3 As==01
    c168:	02 20       	jnz	$+6      	;abs 0xc16e
    c16a:	30 40 d2 c5 	br	#0xc5d2		;
    c16e:	0c 43       	clr	r12		;
    c170:	08 43       	clr	r8		;
    c172:	07 43       	clr	r7		;
    c174:	0a 43       	clr	r10		;
    c176:	05 43       	clr	r5		;
    c178:	0b 43       	clr	r11		;
    c17a:	0d 43       	clr	r13		;
    c17c:	06 43       	clr	r6		;
    c17e:	04 43       	clr	r4		;
    c180:	0e 43       	clr	r14		;
    c182:	81 4e 0c 00 	mov	r14,	12(r1)	; 0x000c
    c186:	1f 4c 00 1c 	mov	7168(r12),r15	;0x01c00
    c18a:	1e 4c 02 1c 	mov	7170(r12),r14	;0x01c02
    c18e:	19 4c 04 1c 	mov	7172(r12),r9	;0x01c04
    c192:	06 59       	add	r9,	r6	;
    c194:	06 9b       	cmp	r11,	r6	;
    c196:	81 42 0a 00 	mov	r2,	10(r1)	; 0x000a
    c19a:	04 5e       	add	r14,	r4	;
    c19c:	04 9a       	cmp	r10,	r4	;
    c19e:	0a 42       	mov	r2,	r10	;
    c1a0:	1b 41 0c 00 	mov	12(r1),	r11	;0x0000c
    c1a4:	0b 5f       	add	r15,	r11	;
    c1a6:	81 4b 0c 00 	mov	r11,	12(r1)	; 0x000c
    c1aa:	1b 41 0c 00 	mov	12(r1),	r11	;0x0000c
    c1ae:	0b 98       	cmp	r8,	r11	;
    c1b0:	08 42       	mov	r2,	r8	;
    c1b2:	8e 10       	swpb	r14		;
    c1b4:	8e 11       	sxt	r14		;
    c1b6:	0e 11       	rra	r14		;
    c1b8:	0e 11       	rra	r14		;
    c1ba:	0e 11       	rra	r14		;
    c1bc:	0e 11       	rra	r14		;
    c1be:	0e 11       	rra	r14		;
    c1c0:	0e 11       	rra	r14		;
    c1c2:	0e 11       	rra	r14		;
    c1c4:	0e 55       	add	r5,	r14	;
    c1c6:	8f 10       	swpb	r15		;
    c1c8:	8f 11       	sxt	r15		;
    c1ca:	0f 11       	rra	r15		;
    c1cc:	0f 11       	rra	r15		;
    c1ce:	0f 11       	rra	r15		;
    c1d0:	0f 11       	rra	r15		;
    c1d2:	0f 11       	rra	r15		;
    c1d4:	0f 11       	rra	r15		;
    c1d6:	0f 11       	rra	r15		;
    c1d8:	0f 57       	add	r7,	r15	;
    c1da:	17 43       	mov	#1,	r7	;r3 As==01
    c1dc:	07 c8       	bic	r8,	r7	;
    c1de:	07 5f       	add	r15,	r7	;
    c1e0:	15 43       	mov	#1,	r5	;r3 As==01
    c1e2:	05 ca       	bic	r10,	r5	;
    c1e4:	1f 43       	mov	#1,	r15	;r3 As==01
    c1e6:	1b 41 0a 00 	mov	10(r1),	r11	;0x0000a
    c1ea:	0f cb       	bic	r11,	r15	;
    c1ec:	05 5e       	add	r14,	r5	;
    c1ee:	1e 41 0c 00 	mov	12(r1),	r14	;0x0000c
    c1f2:	89 10       	swpb	r9		;
    c1f4:	89 11       	sxt	r9		;
    c1f6:	09 11       	rra	r9		;
    c1f8:	09 11       	rra	r9		;
    c1fa:	09 11       	rra	r9		;
    c1fc:	09 11       	rra	r9		;
    c1fe:	09 11       	rra	r9		;
    c200:	09 11       	rra	r9		;
    c202:	09 11       	rra	r9		;
    c204:	09 5d       	add	r13,	r9	;
    c206:	09 5f       	add	r15,	r9	;
    c208:	3c 50 06 00 	add	#6,	r12	;
    c20c:	3c 90 80 01 	cmp	#384,	r12	;#0x0180
    c210:	08 4e       	mov	r14,	r8	;
    c212:	0a 44       	mov	r4,	r10	;
    c214:	0b 46       	mov	r6,	r11	;
    c216:	0d 49       	mov	r9,	r13	;
    c218:	b4 23       	jnz	$-150    	;abs 0xc182
    c21a:	0d 47       	mov	r7,	r13	;
    c21c:	8d 10       	swpb	r13		;
    c21e:	8d 11       	sxt	r13		;
    c220:	0d 11       	rra	r13		;
    c222:	0d 11       	rra	r13		;
    c224:	0d 11       	rra	r13		;
    c226:	0d 11       	rra	r13		;
    c228:	0d 11       	rra	r13		;
    c22a:	0d 11       	rra	r13		;
    c22c:	0d 11       	rra	r13		;
    c22e:	8d 10       	swpb	r13		;
    c230:	4d 4d       	mov.b	r13,	r13	;
    c232:	12 c3       	clrc			
    c234:	0d 10       	rrc	r13		;
    c236:	0d 11       	rra	r13		;
    c238:	0d 5e       	add	r14,	r13	;
    c23a:	0d 9e       	cmp	r14,	r13	;
    c23c:	0b 42       	mov	r2,	r11	;
    c23e:	0c 49       	mov	r9,	r12	;
    c240:	8c 10       	swpb	r12		;
    c242:	8c 11       	sxt	r12		;
    c244:	0c 11       	rra	r12		;
    c246:	0c 11       	rra	r12		;
    c248:	0c 11       	rra	r12		;
    c24a:	0c 11       	rra	r12		;
    c24c:	0c 11       	rra	r12		;
    c24e:	0c 11       	rra	r12		;
    c250:	0c 11       	rra	r12		;
    c252:	8c 10       	swpb	r12		;
    c254:	4c 4c       	mov.b	r12,	r12	;
    c256:	12 c3       	clrc			
    c258:	0c 10       	rrc	r12		;
    c25a:	0c 11       	rra	r12		;
    c25c:	0c 56       	add	r6,	r12	;
    c25e:	81 46 02 00 	mov	r6,	2(r1)	;
    c262:	0c 96       	cmp	r6,	r12	;
    c264:	0a 42       	mov	r2,	r10	;
    c266:	0e 45       	mov	r5,	r14	;
    c268:	8e 10       	swpb	r14		;
    c26a:	8e 11       	sxt	r14		;
    c26c:	0e 11       	rra	r14		;
    c26e:	0e 11       	rra	r14		;
    c270:	0e 11       	rra	r14		;
    c272:	0e 11       	rra	r14		;
    c274:	0e 11       	rra	r14		;
    c276:	0e 11       	rra	r14		;
    c278:	0e 11       	rra	r14		;
    c27a:	8e 10       	swpb	r14		;
    c27c:	4e 4e       	mov.b	r14,	r14	;
    c27e:	12 c3       	clrc			
    c280:	0e 10       	rrc	r14		;
    c282:	0e 11       	rra	r14		;
    c284:	0e 54       	add	r4,	r14	;
    c286:	81 44 00 00 	mov	r4,	0(r1)	;
    c28a:	0e 94       	cmp	r4,	r14	;
    c28c:	08 42       	mov	r2,	r8	;
    c28e:	1f 43       	mov	#1,	r15	;r3 As==01
    c290:	0f cb       	bic	r11,	r15	;
    c292:	0f 57       	add	r7,	r15	;
    c294:	12 c3       	clrc			
    c296:	0d 10       	rrc	r13		;
    c298:	0d 11       	rra	r13		;
    c29a:	0d 11       	rra	r13		;
    c29c:	0d 11       	rra	r13		;
    c29e:	0d 11       	rra	r13		;
    c2a0:	0d 11       	rra	r13		;
    c2a2:	06 4f       	mov	r15,	r6	;
    c2a4:	46 46       	mov.b	r6,	r6	;
    c2a6:	86 10       	swpb	r6		;
    c2a8:	06 56       	rla	r6		;
    c2aa:	06 56       	rla	r6		;
    c2ac:	06 dd       	bis	r13,	r6	;
    c2ae:	1b 43       	mov	#1,	r11	;r3 As==01
    c2b0:	0b c8       	bic	r8,	r11	;
    c2b2:	1d 43       	mov	#1,	r13	;r3 As==01
    c2b4:	0d ca       	bic	r10,	r13	;
    c2b6:	0b 55       	add	r5,	r11	;
    c2b8:	82 46 80 1d 	mov	r6,	&0x1d80	;
    c2bc:	12 c3       	clrc			
    c2be:	0e 10       	rrc	r14		;
    c2c0:	0e 11       	rra	r14		;
    c2c2:	0e 11       	rra	r14		;
    c2c4:	0e 11       	rra	r14		;
    c2c6:	0e 11       	rra	r14		;
    c2c8:	0e 11       	rra	r14		;
    c2ca:	0a 4b       	mov	r11,	r10	;
    c2cc:	4a 4a       	mov.b	r10,	r10	;
    c2ce:	8a 10       	swpb	r10		;
    c2d0:	0a 5a       	rla	r10		;
    c2d2:	0a 5a       	rla	r10		;
    c2d4:	0a de       	bis	r14,	r10	;
    c2d6:	0d 59       	add	r9,	r13	;
    c2d8:	0f 11       	rra	r15		;
    c2da:	0f 11       	rra	r15		;
    c2dc:	0f 11       	rra	r15		;
    c2de:	0f 11       	rra	r15		;
    c2e0:	0f 11       	rra	r15		;
    c2e2:	0f 11       	rra	r15		;
    c2e4:	82 4f 82 1d 	mov	r15,	&0x1d82	;
    c2e8:	0b 11       	rra	r11		;
    c2ea:	0b 11       	rra	r11		;
    c2ec:	0b 11       	rra	r11		;
    c2ee:	0b 11       	rra	r11		;
    c2f0:	0b 11       	rra	r11		;
    c2f2:	0b 11       	rra	r11		;
    c2f4:	82 4b 86 1d 	mov	r11,	&0x1d86	;
    c2f8:	82 4a 84 1d 	mov	r10,	&0x1d84	;
    c2fc:	0e 4d       	mov	r13,	r14	;
    c2fe:	0e 11       	rra	r14		;
    c300:	0e 11       	rra	r14		;
    c302:	0e 11       	rra	r14		;
    c304:	0e 11       	rra	r14		;
    c306:	0e 11       	rra	r14		;
    c308:	0e 11       	rra	r14		;
    c30a:	82 4e 8a 1d 	mov	r14,	&0x1d8a	;
    c30e:	12 c3       	clrc			
    c310:	0c 10       	rrc	r12		;
    c312:	0c 11       	rra	r12		;
    c314:	0c 11       	rra	r12		;
    c316:	0c 11       	rra	r12		;
    c318:	0c 11       	rra	r12		;
    c31a:	0c 11       	rra	r12		;
    c31c:	4d 4d       	mov.b	r13,	r13	;
    c31e:	8d 10       	swpb	r13		;
    c320:	0d 5d       	rla	r13		;
    c322:	0d 5d       	rla	r13		;
    c324:	0d dc       	bis	r12,	r13	;
    c326:	82 4d 88 1d 	mov	r13,	&0x1d88	;
    c32a:	06 43       	clr	r6		;
    c32c:	0c 43       	clr	r12		;
    c32e:	81 4c 0a 00 	mov	r12,	10(r1)	; 0x000a
    c332:	0d 43       	clr	r13		;
    c334:	81 4c 08 00 	mov	r12,	8(r1)	;
    c338:	08 43       	clr	r8		;
    c33a:	81 4c 06 00 	mov	r12,	6(r1)	;
    c33e:	0a 43       	clr	r10		;
    c340:	81 4d 04 00 	mov	r13,	4(r1)	;
    c344:	1d 46 00 1c 	mov	7168(r6),r13	;0x01c00
    c348:	1e 42 80 1d 	mov	&0x1d80,r14	;0x1d80
    c34c:	0d 9e       	cmp	r14,	r13	;
    c34e:	0f 42       	mov	r2,	r15	;
    c350:	0c 4d       	mov	r13,	r12	;
    c352:	0c 8e       	sub	r14,	r12	;
    c354:	8d 10       	swpb	r13		;
    c356:	8d 11       	sxt	r13		;
    c358:	0d 11       	rra	r13		;
    c35a:	1e 43       	mov	#1,	r14	;r3 As==01
    c35c:	0e cf       	bic	r15,	r14	;
    c35e:	0d 11       	rra	r13		;
    c360:	0d 11       	rra	r13		;
    c362:	0d 11       	rra	r13		;
    c364:	0d 11       	rra	r13		;
    c366:	0d 11       	rra	r13		;
    c368:	0d 11       	rra	r13		;
    c36a:	1d 82 82 1d 	sub	&0x1d82,r13	;0x1d82
    c36e:	0d 8e       	sub	r14,	r13	;
    c370:	0e 4c       	mov	r12,	r14	;
    c372:	0f 4d       	mov	r13,	r15	;
    c374:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c378:	1e 41 06 00 	mov	6(r1),	r14	;
    c37c:	0e 5c       	add	r12,	r14	;
    c37e:	81 4e 06 00 	mov	r14,	6(r1)	;
    c382:	0e 9c       	cmp	r12,	r14	;
    c384:	0e 42       	mov	r2,	r14	;
    c386:	0d 5a       	add	r10,	r13	;
    c388:	1f 46 02 1c 	mov	7170(r6),r15	;0x01c02
    c38c:	1b 42 84 1d 	mov	&0x1d84,r11	;0x1d84
    c390:	0f 9b       	cmp	r11,	r15	;
    c392:	0a 42       	mov	r2,	r10	;
    c394:	0c 4f       	mov	r15,	r12	;
    c396:	0c 8b       	sub	r11,	r12	;
    c398:	8f 10       	swpb	r15		;
    c39a:	8f 11       	sxt	r15		;
    c39c:	0f 11       	rra	r15		;
    c39e:	1b 43       	mov	#1,	r11	;r3 As==01
    c3a0:	0b ca       	bic	r10,	r11	;
    c3a2:	0f 11       	rra	r15		;
    c3a4:	0f 11       	rra	r15		;
    c3a6:	0f 11       	rra	r15		;
    c3a8:	0f 11       	rra	r15		;
    c3aa:	0f 11       	rra	r15		;
    c3ac:	0f 11       	rra	r15		;
    c3ae:	1f 82 86 1d 	sub	&0x1d86,r15	;0x1d86
    c3b2:	0f 8b       	sub	r11,	r15	;
    c3b4:	1a 43       	mov	#1,	r10	;r3 As==01
    c3b6:	0a ce       	bic	r14,	r10	;
    c3b8:	0a 5d       	add	r13,	r10	;
    c3ba:	0d 4f       	mov	r15,	r13	;
    c3bc:	0e 4c       	mov	r12,	r14	;
    c3be:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c3c2:	1e 41 08 00 	mov	8(r1),	r14	;
    c3c6:	0e 5c       	add	r12,	r14	;
    c3c8:	81 4e 08 00 	mov	r14,	8(r1)	;
    c3cc:	0e 9c       	cmp	r12,	r14	;
    c3ce:	0e 42       	mov	r2,	r14	;
    c3d0:	0d 58       	add	r8,	r13	;
    c3d2:	1f 46 04 1c 	mov	7172(r6),r15	;0x01c04
    c3d6:	1b 42 88 1d 	mov	&0x1d88,r11	;0x1d88
    c3da:	0f 9b       	cmp	r11,	r15	;
    c3dc:	08 42       	mov	r2,	r8	;
    c3de:	0c 4f       	mov	r15,	r12	;
    c3e0:	0c 8b       	sub	r11,	r12	;
    c3e2:	8f 10       	swpb	r15		;
    c3e4:	8f 11       	sxt	r15		;
    c3e6:	0f 11       	rra	r15		;
    c3e8:	1b 43       	mov	#1,	r11	;r3 As==01
    c3ea:	0b c8       	bic	r8,	r11	;
    c3ec:	0f 11       	rra	r15		;
    c3ee:	0f 11       	rra	r15		;
    c3f0:	0f 11       	rra	r15		;
    c3f2:	0f 11       	rra	r15		;
    c3f4:	0f 11       	rra	r15		;
    c3f6:	0f 11       	rra	r15		;
    c3f8:	1f 82 8a 1d 	sub	&0x1d8a,r15	;0x1d8a
    c3fc:	0f 8b       	sub	r11,	r15	;
    c3fe:	18 43       	mov	#1,	r8	;r3 As==01
    c400:	08 ce       	bic	r14,	r8	;
    c402:	08 5d       	add	r13,	r8	;
    c404:	0d 4f       	mov	r15,	r13	;
    c406:	0e 4c       	mov	r12,	r14	;
    c408:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c40c:	04 4d       	mov	r13,	r4	;
    c40e:	1d 41 0a 00 	mov	10(r1),	r13	;0x0000a
    c412:	0d 5c       	add	r12,	r13	;
    c414:	81 4d 0a 00 	mov	r13,	10(r1)	; 0x000a
    c418:	0d 9c       	cmp	r12,	r13	;
    c41a:	1c 43       	mov	#1,	r12	;r3 As==01
    c41c:	0c c2       	bic	r2,	r12	;
    c41e:	1d 41 04 00 	mov	4(r1),	r13	;
    c422:	04 5d       	add	r13,	r4	;
    c424:	04 5c       	add	r12,	r4	;
    c426:	36 50 06 00 	add	#6,	r6	;
    c42a:	36 90 80 01 	cmp	#384,	r6	;#0x0180
    c42e:	0d 44       	mov	r4,	r13	;
    c430:	87 23       	jnz	$-240    	;abs 0xc340
    c432:	1c 41 0c 00 	mov	12(r1),	r12	;0x0000c
    c436:	0d 47       	mov	r7,	r13	;
    c438:	0e 4c       	mov	r12,	r14	;
    c43a:	0f 47       	mov	r7,	r15	;
    c43c:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c440:	07 4c       	mov	r12,	r7	;
    c442:	06 4d       	mov	r13,	r6	;
    c444:	1c 41 00 00 	mov	0(r1),	r12	;
    c448:	0d 45       	mov	r5,	r13	;
    c44a:	0e 4c       	mov	r12,	r14	;
    c44c:	0f 45       	mov	r5,	r15	;
    c44e:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c452:	05 4d       	mov	r13,	r5	;
    c454:	05 56       	add	r6,	r5	;
    c456:	07 5c       	add	r12,	r7	;
    c458:	07 9c       	cmp	r12,	r7	;
    c45a:	1c 43       	mov	#1,	r12	;r3 As==01
    c45c:	0c c2       	bic	r2,	r12	;
    c45e:	05 5c       	add	r12,	r5	;
    c460:	1c 41 02 00 	mov	2(r1),	r12	;
    c464:	0d 49       	mov	r9,	r13	;
    c466:	0e 4c       	mov	r12,	r14	;
    c468:	0f 49       	mov	r9,	r15	;
    c46a:	b0 12 e6 c5 	call	#-14874	;#0xc5e6
    c46e:	0d 55       	add	r5,	r13	;
    c470:	0c 57       	add	r7,	r12	;
    c472:	0c 97       	cmp	r7,	r12	;
    c474:	1e 43       	mov	#1,	r14	;r3 As==01
    c476:	0e c2       	bic	r2,	r14	;
    c478:	0d 5e       	add	r14,	r13	;
    c47a:	0f 4a       	mov	r10,	r15	;
    c47c:	8f 10       	swpb	r15		;
    c47e:	8f 11       	sxt	r15		;
    c480:	0f 11       	rra	r15		;
    c482:	0f 11       	rra	r15		;
    c484:	0f 11       	rra	r15		;
    c486:	0f 11       	rra	r15		;
    c488:	0f 11       	rra	r15		;
    c48a:	0f 11       	rra	r15		;
    c48c:	0f 11       	rra	r15		;
    c48e:	8f 10       	swpb	r15		;
    c490:	4f 4f       	mov.b	r15,	r15	;
    c492:	12 c3       	clrc			
    c494:	0f 10       	rrc	r15		;
    c496:	0f 11       	rra	r15		;
    c498:	1e 41 06 00 	mov	6(r1),	r14	;
    c49c:	0f 5e       	add	r14,	r15	;
    c49e:	0f 9e       	cmp	r14,	r15	;
    c4a0:	0e 42       	mov	r2,	r14	;
    c4a2:	0b 48       	mov	r8,	r11	;
    c4a4:	8b 10       	swpb	r11		;
    c4a6:	8b 11       	sxt	r11		;
    c4a8:	0b 11       	rra	r11		;
    c4aa:	0b 11       	rra	r11		;
    c4ac:	0b 11       	rra	r11		;
    c4ae:	0b 11       	rra	r11		;
    c4b0:	0b 11       	rra	r11		;
    c4b2:	0b 11       	rra	r11		;
    c4b4:	0b 11       	rra	r11		;
    c4b6:	8b 10       	swpb	r11		;
    c4b8:	4b 4b       	mov.b	r11,	r11	;
    c4ba:	12 c3       	clrc			
    c4bc:	0b 10       	rrc	r11		;
    c4be:	0b 11       	rra	r11		;
    c4c0:	19 41 08 00 	mov	8(r1),	r9	;
    c4c4:	0b 59       	add	r9,	r11	;
    c4c6:	0b 99       	cmp	r9,	r11	;
    c4c8:	07 42       	mov	r2,	r7	;
    c4ca:	19 43       	mov	#1,	r9	;r3 As==01
    c4cc:	09 ce       	bic	r14,	r9	;
    c4ce:	09 5a       	add	r10,	r9	;
    c4d0:	0e 44       	mov	r4,	r14	;
    c4d2:	8e 10       	swpb	r14		;
    c4d4:	8e 11       	sxt	r14		;
    c4d6:	0e 11       	rra	r14		;
    c4d8:	0e 11       	rra	r14		;
    c4da:	0e 11       	rra	r14		;
    c4dc:	0e 11       	rra	r14		;
    c4de:	0e 11       	rra	r14		;
    c4e0:	0e 11       	rra	r14		;
    c4e2:	0e 11       	rra	r14		;
    c4e4:	8e 10       	swpb	r14		;
    c4e6:	4e 4e       	mov.b	r14,	r14	;
    c4e8:	12 c3       	clrc			
    c4ea:	0e 10       	rrc	r14		;
    c4ec:	0e 11       	rra	r14		;
    c4ee:	1a 41 0a 00 	mov	10(r1),	r10	;0x0000a
    c4f2:	0e 5a       	add	r10,	r14	;
    c4f4:	0e 9a       	cmp	r10,	r14	;
    c4f6:	06 42       	mov	r2,	r6	;
    c4f8:	12 c3       	clrc			
    c4fa:	0f 10       	rrc	r15		;
    c4fc:	0f 11       	rra	r15		;
    c4fe:	0f 11       	rra	r15		;
    c500:	0f 11       	rra	r15		;
    c502:	0f 11       	rra	r15		;
    c504:	0f 11       	rra	r15		;
    c506:	05 49       	mov	r9,	r5	;
    c508:	45 45       	mov.b	r5,	r5	;
    c50a:	85 10       	swpb	r5		;
    c50c:	05 55       	rla	r5		;
    c50e:	05 55       	rla	r5		;
    c510:	05 df       	bis	r15,	r5	;
    c512:	1a 43       	mov	#1,	r10	;r3 As==01
    c514:	0a c7       	bic	r7,	r10	;
    c516:	0a 58       	add	r8,	r10	;
    c518:	82 45 8c 1d 	mov	r5,	&0x1d8c	;
    c51c:	12 c3       	clrc			
    c51e:	0b 10       	rrc	r11		;
    c520:	0b 11       	rra	r11		;
    c522:	0b 11       	rra	r11		;
    c524:	0b 11       	rra	r11		;
    c526:	0b 11       	rra	r11		;
    c528:	0b 11       	rra	r11		;
    c52a:	08 4a       	mov	r10,	r8	;
    c52c:	48 48       	mov.b	r8,	r8	;
    c52e:	88 10       	swpb	r8		;
    c530:	08 58       	rla	r8		;
    c532:	08 58       	rla	r8		;
    c534:	08 db       	bis	r11,	r8	;
    c536:	1f 43       	mov	#1,	r15	;r3 As==01
    c538:	0f c6       	bic	r6,	r15	;
    c53a:	0f 54       	add	r4,	r15	;
    c53c:	09 11       	rra	r9		;
    c53e:	09 11       	rra	r9		;
    c540:	09 11       	rra	r9		;
    c542:	09 11       	rra	r9		;
    c544:	09 11       	rra	r9		;
    c546:	09 11       	rra	r9		;
    c548:	82 49 8e 1d 	mov	r9,	&0x1d8e	;
    c54c:	0a 11       	rra	r10		;
    c54e:	0a 11       	rra	r10		;
    c550:	0a 11       	rra	r10		;
    c552:	0a 11       	rra	r10		;
    c554:	0a 11       	rra	r10		;
    c556:	0a 11       	rra	r10		;
    c558:	82 4a 92 1d 	mov	r10,	&0x1d92	;
    c55c:	82 48 90 1d 	mov	r8,	&0x1d90	;
    c560:	0b 4f       	mov	r15,	r11	;
    c562:	0b 11       	rra	r11		;
    c564:	0b 11       	rra	r11		;
    c566:	0b 11       	rra	r11		;
    c568:	0b 11       	rra	r11		;
    c56a:	0b 11       	rra	r11		;
    c56c:	0b 11       	rra	r11		;
    c56e:	82 4b 96 1d 	mov	r11,	&0x1d96	;
    c572:	12 c3       	clrc			
    c574:	0e 10       	rrc	r14		;
    c576:	0e 11       	rra	r14		;
    c578:	0e 11       	rra	r14		;
    c57a:	0e 11       	rra	r14		;
    c57c:	0e 11       	rra	r14		;
    c57e:	0e 11       	rra	r14		;
    c580:	4f 4f       	mov.b	r15,	r15	;
    c582:	8f 10       	swpb	r15		;
    c584:	0f 5f       	rla	r15		;
    c586:	0f 5f       	rla	r15		;
    c588:	0f de       	bis	r14,	r15	;
    c58a:	82 4f 94 1d 	mov	r15,	&0x1d94	;
    c58e:	3e 40 e8 03 	mov	#1000,	r14	;#0x03e8
    c592:	0f 43       	clr	r15		;
    c594:	b0 12 f8 c6 	call	#-14600	;#0xc6f8
    c598:	82 4d 9a 1d 	mov	r13,	&0x1d9a	;
    c59c:	82 4c 98 1d 	mov	r12,	&0x1d98	;
    c5a0:	1c 42 82 1d 	mov	&0x1d82,r12	;0x1d82
    c5a4:	1c 42 80 1d 	mov	&0x1d80,r12	;0x1d80
    c5a8:	1c 42 86 1d 	mov	&0x1d86,r12	;0x1d86
    c5ac:	1c 42 84 1d 	mov	&0x1d84,r12	;0x1d84
    c5b0:	1c 42 96 1d 	mov	&0x1d96,r12	;0x1d96
    c5b4:	1c 42 94 1d 	mov	&0x1d94,r12	;0x1d94
    c5b8:	1c 43       	mov	#1,	r12	;r3 As==01
    c5ba:	1c 52 c2 1d 	add	&0x1dc2,r12	;0x1dc2
    c5be:	0c 93       	cmp	#0,	r12	;r3 As==00
    c5c0:	0d 42       	mov	r2,	r13	;
    c5c2:	0d 11       	rra	r13		;
    c5c4:	1d f3       	and	#1,	r13	;r3 As==01
    c5c6:	82 5d c4 1d 	add	r13,	&0x1dc4	;
    c5ca:	82 4c c2 1d 	mov	r12,	&0x1dc2	;
    c5ce:	c2 43 c6 1d 	mov.b	#0,	&0x1dc6	;r3 As==00
    c5d2:	03 43       	nop			
    c5d4:	30 40 62 c1 	br	#0xc162		;

0000c5d8 <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c5d8:	b0 12 dc c5 	call	#-14884	;#0xc5dc

0000c5dc <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c5dc:	32 c2       	dint			
    c5de:	03 43       	nop			
    c5e0:	ff 3f       	jmp	$+0      	;abs 0xc5e0

0000c5e2 <PreInit_>:
    c5e2:	30 41       	ret			

0000c5e4 <DefaultHandler_>:
    c5e4:	ff 3f       	jmp	$+0      	;abs 0xc5e4

0000c5e6 <__mspabi_mpyl>:
    c5e6:	0a 12       	push	r10		;

0000c5e8 <.LCFI10>:
    c5e8:	09 12       	push	r9		;

0000c5ea <.LCFI11>:
    c5ea:	08 12       	push	r8		;

0000c5ec <.LCFI12>:
    c5ec:	07 12       	push	r7		;

0000c5ee <.LCFI13>:
    c5ee:	06 12       	push	r6		;

0000c5f0 <.LCFI14>:
    c5f0:	0a 4c       	mov	r12,	r10	;
    c5f2:	0b 4d       	mov	r13,	r11	;

0000c5f4 <.LVL27>:
    c5f4:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c5f8 <.Loc.30.2>:
    c5f8:	4c 43       	clr.b	r12		;

0000c5fa <.LVL28>:
    c5fa:	4d 43       	clr.b	r13		;

0000c5fc <.L6>:
    c5fc:	09 4e       	mov	r14,	r9	;
    c5fe:	09 df       	bis	r15,	r9	;
    c600:	09 93       	cmp	#0,	r9	;r3 As==00
    c602:	05 24       	jz	$+12     	;abs 0xc60e
    c604:	49 48       	mov.b	r8,	r9	;
    c606:	79 53       	add.b	#-1,	r9	;r3 As==11
    c608:	48 49       	mov.b	r9,	r8	;

0000c60a <.LVL30>:
    c60a:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c60c:	01 20       	jnz	$+4      	;abs 0xc610

0000c60e <.L5>:
    c60e:	9b 3c       	jmp	$+312    	;abs 0xc746

0000c610 <.L10>:
    c610:	09 4e       	mov	r14,	r9	;
    c612:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c614 <.Loc.36.2>:
    c614:	09 93       	cmp	#0,	r9	;r3 As==00
    c616:	02 24       	jz	$+6      	;abs 0xc61c

0000c618 <.Loc.37.2>:
    c618:	0c 5a       	add	r10,	r12	;

0000c61a <.LVL31>:
    c61a:	0d 6b       	addc	r11,	r13	;

0000c61c <.L7>:
    c61c:	06 4a       	mov	r10,	r6	;
    c61e:	07 4b       	mov	r11,	r7	;
    c620:	06 5a       	add	r10,	r6	;
    c622:	07 6b       	addc	r11,	r7	;
    c624:	0a 46       	mov	r6,	r10	;

0000c626 <.LVL33>:
    c626:	0b 47       	mov	r7,	r11	;

0000c628 <.LVL34>:
    c628:	12 c3       	clrc			
    c62a:	0f 10       	rrc	r15		;
    c62c:	0e 10       	rrc	r14		;

0000c62e <.LVL35>:
    c62e:	e6 3f       	jmp	$-50     	;abs 0xc5fc

0000c630 <__mspabi_mpyi>:
    c630:	0a 12       	push	r10		;

0000c632 <.LCFI0>:
    c632:	0e 4c       	mov	r12,	r14	;

0000c634 <L0^A>:
    c634:	4f 43       	clr.b	r15		;

0000c636 <.Loc.11.1>:
    c636:	0d 93       	cmp	#0,	r13	;r3 As==00
    c638:	04 34       	jge	$+10     	;abs 0xc642

0000c63a <.Loc.13.1>:
    c63a:	4c 43       	clr.b	r12		;

0000c63c <.LVL2>:
    c63c:	0c 8d       	sub	r13,	r12	;
    c63e:	0d 4c       	mov	r12,	r13	;

0000c640 <.LVL3>:
    c640:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c642 <.L2>:
    c642:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c646 <.Loc.9.1>:
    c646:	4c 43       	clr.b	r12		;

0000c648 <.L3>:
    c648:	0d 93       	cmp	#0,	r13	;r3 As==00
    c64a:	04 20       	jnz	$+10     	;abs 0xc654

0000c64c <.L9>:
    c64c:	0f 93       	cmp	#0,	r15	;r3 As==00
    c64e:	0d 20       	jnz	$+28     	;abs 0xc66a

0000c650 <.L1>:
    c650:	3a 41       	pop	r10		;

0000c652 <.LCFI1>:
    c652:	30 41       	ret			

0000c654 <.L5>:
    c654:	4b 4a       	mov.b	r10,	r11	;
    c656:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c658:	4a 4b       	mov.b	r11,	r10	;

0000c65a <.LVL9>:
    c65a:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c65c:	f7 27       	jz	$-16     	;abs 0xc64c

0000c65e <.Loc.19.1>:
    c65e:	1d b3       	bit	#1,	r13	;r3 As==01
    c660:	01 24       	jz	$+4      	;abs 0xc664

0000c662 <.Loc.20.1>:
    c662:	0c 5e       	add	r14,	r12	;

0000c664 <.L4>:
    c664:	0e 5e       	rla	r14		;

0000c666 <.Loc.22.1>:
    c666:	0d 11       	rra	r13		;

0000c668 <.Loc.17.1>:
    c668:	ef 3f       	jmp	$-32     	;abs 0xc648

0000c66a <.L6>:
    c66a:	4d 43       	clr.b	r13		;

0000c66c <.LVL13>:
    c66c:	0d 8c       	sub	r12,	r13	;
    c66e:	0c 4d       	mov	r13,	r12	;

0000c670 <.LVL14>:
    c670:	ef 3f       	jmp	$-32     	;abs 0xc650

0000c672 <udivmodsi4>:
    c672:	0a 12       	push	r10		;

0000c674 <.LCFI0>:
    c674:	09 12       	push	r9		;

0000c676 <L0^A>:
    c676:	08 12       	push	r8		;

0000c678 <.LCFI2>:
    c678:	07 12       	push	r7		;

0000c67a <.LCFI3>:
    c67a:	06 12       	push	r6		;

0000c67c <.LCFI4>:
    c67c:	0a 4c       	mov	r12,	r10	;
    c67e:	0b 4d       	mov	r13,	r11	;

0000c680 <.LVL1>:
    c680:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

0000c684 <.LVL2>:
    c684:	58 43       	mov.b	#1,	r8	;r3 As==01
    c686:	49 43       	clr.b	r9		;

0000c688 <.L2>:
    c688:	0f 9b       	cmp	r11,	r15	;
    c68a:	04 28       	jnc	$+10     	;abs 0xc694
    c68c:	0b 9f       	cmp	r15,	r11	;
    c68e:	07 20       	jnz	$+16     	;abs 0xc69e
    c690:	0e 9a       	cmp	r10,	r14	;
    c692:	05 2c       	jc	$+12     	;abs 0xc69e

0000c694 <.L15>:
    c694:	3c 53       	add	#-1,	r12	;r3 As==11

0000c696 <.Loc.38.1>:
    c696:	0c 93       	cmp	#0,	r12	;r3 As==00
    c698:	2c 24       	jz	$+90     	;abs 0xc6f2

0000c69a <.Loc.38.1>:
    c69a:	0f 93       	cmp	#0,	r15	;r3 As==00
    c69c:	0c 34       	jge	$+26     	;abs 0xc6b6

0000c69e <.L13>:
    c69e:	4c 43       	clr.b	r12		;
    c6a0:	4d 43       	clr.b	r13		;

0000c6a2 <.L8>:
    c6a2:	07 48       	mov	r8,	r7	;
    c6a4:	07 d9       	bis	r9,	r7	;
    c6a6:	07 93       	cmp	#0,	r7	;r3 As==00
    c6a8:	13 20       	jnz	$+40     	;abs 0xc6d0

0000c6aa <.L5>:
    c6aa:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
    c6ae:	02 24       	jz	$+6      	;abs 0xc6b4
    c6b0:	0c 4a       	mov	r10,	r12	;
    c6b2:	0d 4b       	mov	r11,	r13	;

0000c6b4 <.L1>:
    c6b4:	48 3c       	jmp	$+146    	;abs 0xc746

0000c6b6 <.L6>:
    c6b6:	06 4e       	mov	r14,	r6	;
    c6b8:	07 4f       	mov	r15,	r7	;
    c6ba:	06 5e       	add	r14,	r6	;
    c6bc:	07 6f       	addc	r15,	r7	;
    c6be:	0e 46       	mov	r6,	r14	;

0000c6c0 <.LVL7>:
    c6c0:	0f 47       	mov	r7,	r15	;

0000c6c2 <.LVL8>:
    c6c2:	06 48       	mov	r8,	r6	;
    c6c4:	07 49       	mov	r9,	r7	;
    c6c6:	06 58       	add	r8,	r6	;
    c6c8:	07 69       	addc	r9,	r7	;
    c6ca:	08 46       	mov	r6,	r8	;

0000c6cc <.LVL9>:
    c6cc:	09 47       	mov	r7,	r9	;

0000c6ce <.LVL10>:
    c6ce:	dc 3f       	jmp	$-70     	;abs 0xc688

0000c6d0 <.L11>:
    c6d0:	0b 9f       	cmp	r15,	r11	;
    c6d2:	08 28       	jnc	$+18     	;abs 0xc6e4
    c6d4:	0f 9b       	cmp	r11,	r15	;
    c6d6:	02 20       	jnz	$+6      	;abs 0xc6dc
    c6d8:	0a 9e       	cmp	r14,	r10	;
    c6da:	04 28       	jnc	$+10     	;abs 0xc6e4

0000c6dc <.L16>:
    c6dc:	0a 8e       	sub	r14,	r10	;
    c6de:	0b 7f       	subc	r15,	r11	;

0000c6e0 <.Loc.48.1>:
    c6e0:	0c d8       	bis	r8,	r12	;

0000c6e2 <.LVL13>:
    c6e2:	0d d9       	bis	r9,	r13	;

0000c6e4 <.L9>:
    c6e4:	12 c3       	clrc			
    c6e6:	09 10       	rrc	r9		;
    c6e8:	08 10       	rrc	r8		;

0000c6ea <.Loc.51.1>:
    c6ea:	12 c3       	clrc			
    c6ec:	0f 10       	rrc	r15		;
    c6ee:	0e 10       	rrc	r14		;
    c6f0:	d8 3f       	jmp	$-78     	;abs 0xc6a2

0000c6f2 <.L14>:
    c6f2:	4c 43       	clr.b	r12		;
    c6f4:	4d 43       	clr.b	r13		;
    c6f6:	d9 3f       	jmp	$-76     	;abs 0xc6aa

0000c6f8 <__mspabi_divli>:
    c6f8:	0a 12       	push	r10		;

0000c6fa <.LCFI6>:
    c6fa:	09 12       	push	r9		;

0000c6fc <.LCFI7>:
    c6fc:	08 12       	push	r8		;

0000c6fe <.LCFI8>:
    c6fe:	21 83       	decd	r1		;

0000c700 <L0^A>:
    c700:	4a 43       	clr.b	r10		;

0000c702 <.Loc.64.1>:
    c702:	0d 93       	cmp	#0,	r13	;r3 As==00
    c704:	07 34       	jge	$+16     	;abs 0xc714

0000c706 <.Loc.66.1>:
    c706:	48 43       	clr.b	r8		;
    c708:	49 43       	clr.b	r9		;
    c70a:	08 8c       	sub	r12,	r8	;
    c70c:	09 7d       	subc	r13,	r9	;
    c70e:	0c 48       	mov	r8,	r12	;

0000c710 <.LVL20>:
    c710:	0d 49       	mov	r9,	r13	;

0000c712 <.LVL21>:
    c712:	5a 43       	mov.b	#1,	r10	;r3 As==01

0000c714 <.L21>:
    c714:	0f 93       	cmp	#0,	r15	;r3 As==00
    c716:	07 34       	jge	$+16     	;abs 0xc726

0000c718 <.Loc.72.1>:
    c718:	48 43       	clr.b	r8		;
    c71a:	49 43       	clr.b	r9		;
    c71c:	08 8e       	sub	r14,	r8	;
    c71e:	09 7f       	subc	r15,	r9	;
    c720:	0e 48       	mov	r8,	r14	;

0000c722 <.LVL23>:
    c722:	0f 49       	mov	r9,	r15	;

0000c724 <.LVL24>:
    c724:	1a e3       	xor	#1,	r10	;r3 As==01

0000c726 <.L23>:
    c726:	81 43 00 00 	mov	#0,	0(r1)	;r3 As==00
    c72a:	b0 12 72 c6 	call	#-14734	;#0xc672

0000c72e <.LVL26>:
    c72e:	0a 93       	cmp	#0,	r10	;r3 As==00
    c730:	06 24       	jz	$+14     	;abs 0xc73e

0000c732 <.LVL27>:
    c732:	49 43       	clr.b	r9		;
    c734:	4a 43       	clr.b	r10		;
    c736:	09 8c       	sub	r12,	r9	;
    c738:	0a 7d       	subc	r13,	r10	;
    c73a:	0c 49       	mov	r9,	r12	;

0000c73c <.LVL28>:
    c73c:	0d 4a       	mov	r10,	r13	;

0000c73e <.L20>:
    c73e:	21 53       	incd	r1		;

0000c740 <.LCFI10>:
    c740:	04 3c       	jmp	$+10     	;abs 0xc74a

0000c742 <__mspabi_func_epilog_7>:
    c742:	34 41       	pop	r4		;

0000c744 <__mspabi_func_epilog_6>:
    c744:	35 41       	pop	r5		;

0000c746 <__mspabi_func_epilog_5>:
    c746:	36 41       	pop	r6		;

0000c748 <__mspabi_func_epilog_4>:
    c748:	37 41       	pop	r7		;

0000c74a <__mspabi_func_epilog_3>:
    c74a:	38 41       	pop	r8		;

0000c74c <__mspabi_func_epilog_2>:
    c74c:	39 41       	pop	r9		;

0000c74e <__mspabi_func_epilog_1>:
    c74e:	3a 41       	pop	r10		;
    c750:	30 41       	ret			
