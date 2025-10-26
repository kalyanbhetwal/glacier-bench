
target/msp430-none-elf/release/cuckoo:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 6c c2 	call	#-15764	;#0xc26c
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 00 03 	cmp	0x0300,	r4	;PC rel. 0xc30c
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 f2 02 	cmp	0x02f2,	r4	;PC rel. 0xc30e
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 10 c3 	mov.b	-15600(r4),7440(r4);0xffffc310, 0x1d10
    c024:	10 1d 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	45 3c       	jmp	$+140    	;abs 0xc0b6

0000c02c <_ZN6cuckoo6lookup17h5d9e5b1ca1c0ec4cE>:
    c02c:	07 12       	push	r7		;
    c02e:	08 12       	push	r8		;
    c030:	09 12       	push	r9		;
    c032:	0a 12       	push	r10		;
    c034:	08 4c       	mov	r12,	r8	;
    c036:	3e 40 b9 79 	mov	#31161,	r14	;#0x79b9
    c03a:	3f 40 37 9e 	mov	#-25033,r15	;#0x9e37
    c03e:	b0 12 70 c2 	call	#-15760	;#0xc270
    c042:	0a 4d       	mov	r13,	r10	;
    c044:	8a 10       	swpb	r10		;
    c046:	6a 93       	cmp.b	#2,	r10	;r3 As==10
    c048:	01 2c       	jc	$+4      	;abs 0xc04c
    c04a:	5a 43       	mov.b	#1,	r10	;r3 As==01
    c04c:	0c 4a       	mov	r10,	r12	;
    c04e:	3d 40 15 00 	mov	#21,	r13	;#0x0015
    c052:	b0 12 ba c2 	call	#-15686	;#0xc2ba
    c056:	09 4c       	mov	r12,	r9	;
    c058:	07 43       	clr	r7		;
    c05a:	39 f0 3f 00 	and	#63,	r9	;#0x003f
    c05e:	0c 48       	mov	r8,	r12	;
    c060:	3d 40 31 00 	mov	#49,	r13	;#0x0031
    c064:	b0 12 ba c2 	call	#-15686	;#0xc2ba
    c068:	3c f0 3f 00 	and	#63,	r12	;#0x003f
    c06c:	09 ec       	xor	r12,	r9	;
    c06e:	0c 5c       	rla	r12		;
    c070:	0c 5c       	rla	r12		;
    c072:	3c 50 00 1c 	add	#7168,	r12	;#0x1c00
    c076:	27 92       	cmp	#4,	r7	;r2 As==10
    c078:	08 24       	jz	$+18     	;abs 0xc08a
    c07a:	0d 4c       	mov	r12,	r13	;
    c07c:	0d 57       	add	r7,	r13	;
    c07e:	17 53       	inc	r7		;
    c080:	5d 4d 00 00 	mov.b	0(r13),	r13	;
    c084:	4d 9a       	cmp.b	r10,	r13	;
    c086:	f7 23       	jnz	$-16     	;abs 0xc076
    c088:	0e 3c       	jmp	$+30     	;abs 0xc0a6
    c08a:	0c 43       	clr	r12		;
    c08c:	09 59       	rla	r9		;
    c08e:	09 59       	rla	r9		;
    c090:	39 50 00 1c 	add	#7168,	r9	;#0x1c00
    c094:	2c 92       	cmp	#4,	r12	;r2 As==10
    c096:	09 24       	jz	$+20     	;abs 0xc0aa
    c098:	0d 49       	mov	r9,	r13	;
    c09a:	0d 5c       	add	r12,	r13	;
    c09c:	1c 53       	inc	r12		;
    c09e:	5d 4d 00 00 	mov.b	0(r13),	r13	;
    c0a2:	4d 9a       	cmp.b	r10,	r13	;
    c0a4:	f7 23       	jnz	$-16     	;abs 0xc094
    c0a6:	5c 43       	mov.b	#1,	r12	;r3 As==01
    c0a8:	01 3c       	jmp	$+4      	;abs 0xc0ac
    c0aa:	4c 43       	clr.b	r12		;
    c0ac:	3a 41       	pop	r10		;
    c0ae:	39 41       	pop	r9		;
    c0b0:	38 41       	pop	r8		;
    c0b2:	37 41       	pop	r7		;
    c0b4:	30 41       	ret			

0000c0b6 <main>:
    c0b6:	04 12       	push	r4		;
    c0b8:	05 12       	push	r5		;
    c0ba:	06 12       	push	r6		;
    c0bc:	07 12       	push	r7		;
    c0be:	08 12       	push	r8		;
    c0c0:	09 12       	push	r9		;
    c0c2:	0a 12       	push	r10		;
    c0c4:	0c 43       	clr	r12		;
    c0c6:	3d 40 00 1c 	mov	#7168,	r13	;#0x1c00
    c0ca:	0e 43       	clr	r14		;
    c0cc:	0f 4d       	mov	r13,	r15	;
    c0ce:	0f 5e       	add	r14,	r15	;
    c0d0:	cf 43 00 00 	mov.b	#0,	0(r15)	;r3 As==00
    c0d4:	1e 53       	inc	r14		;
    c0d6:	2e 92       	cmp	#4,	r14	;r2 As==10
    c0d8:	f9 23       	jnz	$-12     	;abs 0xc0cc
    c0da:	2d 52       	add	#4,	r13	;r2 As==10
    c0dc:	1c 53       	inc	r12		;
    c0de:	3c 90 40 00 	cmp	#64,	r12	;#0x0040
    c0e2:	f3 23       	jnz	$-24     	;abs 0xc0ca
    c0e4:	82 43 02 1d 	mov	#0,	&0x1d02	;r3 As==00
    c0e8:	82 43 00 1d 	mov	#0,	&0x1d00	;r3 As==00
    c0ec:	82 43 06 1d 	mov	#0,	&0x1d06	;r3 As==00
    c0f0:	82 43 04 1d 	mov	#0,	&0x1d04	;r3 As==00
    c0f4:	82 43 0a 1d 	mov	#0,	&0x1d0a	;r3 As==00
    c0f8:	82 43 08 1d 	mov	#0,	&0x1d08	;r3 As==00
    c0fc:	82 43 0e 1d 	mov	#0,	&0x1d0e	;r3 As==00
    c100:	82 43 0c 1d 	mov	#0,	&0x1d0c	;r3 As==00
    c104:	19 42 0c 1d 	mov	&0x1d0c,r9	;0x1d0c
    c108:	1a 42 0e 1d 	mov	&0x1d0e,r10	;0x1d0e
    c10c:	0c 49       	mov	r9,	r12	;
    c10e:	0d 4a       	mov	r10,	r13	;
    c110:	3e 40 b9 79 	mov	#31161,	r14	;#0x79b9
    c114:	3f 40 37 9e 	mov	#-25033,r15	;#0x9e37
    c118:	b0 12 70 c2 	call	#-15760	;#0xc270
    c11c:	08 4d       	mov	r13,	r8	;
    c11e:	88 10       	swpb	r8		;
    c120:	68 93       	cmp.b	#2,	r8	;r3 As==10
    c122:	01 2c       	jc	$+4      	;abs 0xc126
    c124:	58 43       	mov.b	#1,	r8	;r3 As==01
    c126:	0c 48       	mov	r8,	r12	;
    c128:	3d 40 15 00 	mov	#21,	r13	;#0x0015
    c12c:	b0 12 ba c2 	call	#-15686	;#0xc2ba
    c130:	06 4c       	mov	r12,	r6	;
    c132:	05 43       	clr	r5		;
    c134:	36 f0 3f 00 	and	#63,	r6	;#0x003f
    c138:	0c 49       	mov	r9,	r12	;
    c13a:	3d 40 31 00 	mov	#49,	r13	;#0x0031
    c13e:	b0 12 ba c2 	call	#-15686	;#0xc2ba
    c142:	07 4c       	mov	r12,	r7	;
    c144:	37 f0 3f 00 	and	#63,	r7	;#0x003f
    c148:	06 e7       	xor	r7,	r6	;
    c14a:	0c 47       	mov	r7,	r12	;
    c14c:	0c 5c       	rla	r12		;
    c14e:	0c 5c       	rla	r12		;
    c150:	3c 50 00 1c 	add	#7168,	r12	;#0x1c00
    c154:	25 92       	cmp	#4,	r5	;r2 As==10
    c156:	0a 24       	jz	$+22     	;abs 0xc16c
    c158:	0d 4c       	mov	r12,	r13	;
    c15a:	0d 55       	add	r5,	r13	;
    c15c:	15 53       	inc	r5		;
    c15e:	5e 4d 00 00 	mov.b	0(r13),	r14	;
    c162:	4e 93       	cmp.b	#0,	r14	;r3 As==00
    c164:	f7 23       	jnz	$-16     	;abs 0xc154
    c166:	cd 48 00 00 	mov.b	r8,	0(r13)	;
    c16a:	44 3c       	jmp	$+138    	;abs 0xc1f4
    c16c:	0c 43       	clr	r12		;
    c16e:	0d 46       	mov	r6,	r13	;
    c170:	0d 5d       	rla	r13		;
    c172:	0d 5d       	rla	r13		;
    c174:	3d 50 00 1c 	add	#7168,	r13	;#0x1c00
    c178:	2c 92       	cmp	#4,	r12	;r2 As==10
    c17a:	0a 24       	jz	$+22     	;abs 0xc190
    c17c:	0e 4d       	mov	r13,	r14	;
    c17e:	0e 5c       	add	r12,	r14	;
    c180:	1c 53       	inc	r12		;
    c182:	5f 4e 00 00 	mov.b	0(r14),	r15	;
    c186:	4f 93       	cmp.b	#0,	r15	;r3 As==00
    c188:	f7 23       	jnz	$-16     	;abs 0xc178
    c18a:	ce 48 00 00 	mov.b	r8,	0(r14)	;
    c18e:	32 3c       	jmp	$+102    	;abs 0xc1f4
    c190:	19 b3       	bit	#1,	r9	;r3 As==01
    c192:	01 24       	jz	$+4      	;abs 0xc196
    c194:	07 46       	mov	r6,	r7	;
    c196:	05 43       	clr	r5		;
    c198:	04 49       	mov	r9,	r4	;
    c19a:	34 f0 03 00 	and	#3,	r4	;
    c19e:	34 50 00 1c 	add	#7168,	r4	;#0x1c00
    c1a2:	0c 47       	mov	r7,	r12	;
    c1a4:	0c 5c       	rla	r12		;
    c1a6:	0c 5c       	rla	r12		;
    c1a8:	0c 54       	add	r4,	r12	;
    c1aa:	56 4c 00 00 	mov.b	0(r12),	r6	;
    c1ae:	cc 48 00 00 	mov.b	r8,	0(r12)	;
    c1b2:	46 93       	cmp.b	#0,	r6	;r3 As==00
    c1b4:	1f 24       	jz	$+64     	;abs 0xc1f4
    c1b6:	15 53       	inc	r5		;
    c1b8:	0c 46       	mov	r6,	r12	;
    c1ba:	3d 40 15 00 	mov	#21,	r13	;#0x0015
    c1be:	b0 12 ba c2 	call	#-15686	;#0xc2ba
    c1c2:	3c f0 3f 00 	and	#63,	r12	;#0x003f
    c1c6:	07 ec       	xor	r12,	r7	;
    c1c8:	0c 43       	clr	r12		;
    c1ca:	0d 47       	mov	r7,	r13	;
    c1cc:	0d 5d       	rla	r13		;
    c1ce:	0d 5d       	rla	r13		;
    c1d0:	3d 50 00 1c 	add	#7168,	r13	;#0x1c00
    c1d4:	2c 92       	cmp	#4,	r12	;r2 As==10
    c1d6:	08 24       	jz	$+18     	;abs 0xc1e8
    c1d8:	0e 4d       	mov	r13,	r14	;
    c1da:	0e 5c       	add	r12,	r14	;
    c1dc:	1c 53       	inc	r12		;
    c1de:	5f 4e 00 00 	mov.b	0(r14),	r15	;
    c1e2:	4f 93       	cmp.b	#0,	r15	;r3 As==00
    c1e4:	f7 23       	jnz	$-16     	;abs 0xc1d4
    c1e6:	04 3c       	jmp	$+10     	;abs 0xc1f0
    c1e8:	35 90 f4 01 	cmp	#500,	r5	;#0x01f4
    c1ec:	0e 24       	jz	$+30     	;abs 0xc20a
    c1ee:	d9 3f       	jmp	$-76     	;abs 0xc1a2
    c1f0:	ce 46 00 00 	mov.b	r6,	0(r14)	;
    c1f4:	1c 43       	mov	#1,	r12	;r3 As==01
    c1f6:	1c 52 00 1d 	add	&0x1d00,r12	;0x1d00
    c1fa:	0c 93       	cmp	#0,	r12	;r3 As==00
    c1fc:	0d 42       	mov	r2,	r13	;
    c1fe:	0d 11       	rra	r13		;
    c200:	1d f3       	and	#1,	r13	;r3 As==01
    c202:	82 5d 02 1d 	add	r13,	&0x1d02	;
    c206:	82 4c 00 1d 	mov	r12,	&0x1d00	;
    c20a:	0c 49       	mov	r9,	r12	;
    c20c:	0d 4a       	mov	r10,	r13	;
    c20e:	b0 12 2c c0 	call	#-16340	;#0xc02c
    c212:	1c 43       	mov	#1,	r12	;r3 As==01
    c214:	1c 52 04 1d 	add	&0x1d04,r12	;0x1d04
    c218:	0c 93       	cmp	#0,	r12	;r3 As==00
    c21a:	0d 42       	mov	r2,	r13	;
    c21c:	0d 11       	rra	r13		;
    c21e:	1d f3       	and	#1,	r13	;r3 As==01
    c220:	82 5d 06 1d 	add	r13,	&0x1d06	;
    c224:	82 4c 04 1d 	mov	r12,	&0x1d04	;
    c228:	0c 49       	mov	r9,	r12	;
    c22a:	3c 50 10 27 	add	#10000,	r12	;#0x2710
    c22e:	0c 99       	cmp	r9,	r12	;
    c230:	1d 43       	mov	#1,	r13	;r3 As==01
    c232:	0d c2       	bic	r2,	r13	;
    c234:	0d 5a       	add	r10,	r13	;
    c236:	b0 12 2c c0 	call	#-16340	;#0xc02c
    c23a:	0c 93       	cmp	#0,	r12	;r3 As==00
    c23c:	0b 24       	jz	$+24     	;abs 0xc254
    c23e:	1c 43       	mov	#1,	r12	;r3 As==01
    c240:	1c 52 08 1d 	add	&0x1d08,r12	;0x1d08
    c244:	0c 93       	cmp	#0,	r12	;r3 As==00
    c246:	0d 42       	mov	r2,	r13	;
    c248:	0d 11       	rra	r13		;
    c24a:	1d f3       	and	#1,	r13	;r3 As==01
    c24c:	82 5d 0a 1d 	add	r13,	&0x1d0a	;
    c250:	82 4c 08 1d 	mov	r12,	&0x1d08	;
    c254:	19 53       	inc	r9		;
    c256:	82 49 0c 1d 	mov	r9,	&0x1d0c	;
    c25a:	09 93       	cmp	#0,	r9	;r3 As==00
    c25c:	0c 42       	mov	r2,	r12	;
    c25e:	0c 11       	rra	r12		;
    c260:	1c f3       	and	#1,	r12	;r3 As==01
    c262:	0a 5c       	add	r12,	r10	;
    c264:	82 4a 0e 1d 	mov	r10,	&0x1d0e	;
    c268:	03 43       	nop			
    c26a:	4c 3f       	jmp	$-358    	;abs 0xc104

0000c26c <PreInit_>:
    c26c:	30 41       	ret			

0000c26e <DefaultHandler_>:
    c26e:	ff 3f       	jmp	$+0      	;abs 0xc26e

0000c270 <__mspabi_mpyl>:
    c270:	0a 12       	push	r10		;

0000c272 <.LCFI10>:
    c272:	09 12       	push	r9		;

0000c274 <.LCFI11>:
    c274:	08 12       	push	r8		;

0000c276 <.LCFI12>:
    c276:	07 12       	push	r7		;

0000c278 <.LCFI13>:
    c278:	06 12       	push	r6		;

0000c27a <.LCFI14>:
    c27a:	0a 4c       	mov	r12,	r10	;
    c27c:	0b 4d       	mov	r13,	r11	;

0000c27e <.LVL27>:
    c27e:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c282 <.Loc.30.2>:
    c282:	4c 43       	clr.b	r12		;

0000c284 <.LVL28>:
    c284:	4d 43       	clr.b	r13		;

0000c286 <.L6>:
    c286:	09 4e       	mov	r14,	r9	;
    c288:	09 df       	bis	r15,	r9	;
    c28a:	09 93       	cmp	#0,	r9	;r3 As==00
    c28c:	05 24       	jz	$+12     	;abs 0xc298
    c28e:	49 48       	mov.b	r8,	r9	;
    c290:	79 53       	add.b	#-1,	r9	;r3 As==11
    c292:	48 49       	mov.b	r9,	r8	;

0000c294 <.LVL30>:
    c294:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c296:	01 20       	jnz	$+4      	;abs 0xc29a

0000c298 <.L5>:
    c298:	33 3c       	jmp	$+104    	;abs 0xc300

0000c29a <.L10>:
    c29a:	09 4e       	mov	r14,	r9	;
    c29c:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c29e <.Loc.36.2>:
    c29e:	09 93       	cmp	#0,	r9	;r3 As==00
    c2a0:	02 24       	jz	$+6      	;abs 0xc2a6

0000c2a2 <.Loc.37.2>:
    c2a2:	0c 5a       	add	r10,	r12	;

0000c2a4 <.LVL31>:
    c2a4:	0d 6b       	addc	r11,	r13	;

0000c2a6 <.L7>:
    c2a6:	06 4a       	mov	r10,	r6	;
    c2a8:	07 4b       	mov	r11,	r7	;
    c2aa:	06 5a       	add	r10,	r6	;
    c2ac:	07 6b       	addc	r11,	r7	;
    c2ae:	0a 46       	mov	r6,	r10	;

0000c2b0 <.LVL33>:
    c2b0:	0b 47       	mov	r7,	r11	;

0000c2b2 <.LVL34>:
    c2b2:	12 c3       	clrc			
    c2b4:	0f 10       	rrc	r15		;
    c2b6:	0e 10       	rrc	r14		;

0000c2b8 <.LVL35>:
    c2b8:	e6 3f       	jmp	$-50     	;abs 0xc286

0000c2ba <__mspabi_mpyi>:
    c2ba:	0a 12       	push	r10		;

0000c2bc <.LCFI0>:
    c2bc:	0e 4c       	mov	r12,	r14	;

0000c2be <L0^A>:
    c2be:	4f 43       	clr.b	r15		;

0000c2c0 <.Loc.11.1>:
    c2c0:	0d 93       	cmp	#0,	r13	;r3 As==00
    c2c2:	04 34       	jge	$+10     	;abs 0xc2cc

0000c2c4 <.Loc.13.1>:
    c2c4:	4c 43       	clr.b	r12		;

0000c2c6 <.LVL2>:
    c2c6:	0c 8d       	sub	r13,	r12	;
    c2c8:	0d 4c       	mov	r12,	r13	;

0000c2ca <.LVL3>:
    c2ca:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c2cc <.L2>:
    c2cc:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c2d0 <.Loc.9.1>:
    c2d0:	4c 43       	clr.b	r12		;

0000c2d2 <.L3>:
    c2d2:	0d 93       	cmp	#0,	r13	;r3 As==00
    c2d4:	04 20       	jnz	$+10     	;abs 0xc2de

0000c2d6 <.L9>:
    c2d6:	0f 93       	cmp	#0,	r15	;r3 As==00
    c2d8:	0d 20       	jnz	$+28     	;abs 0xc2f4

0000c2da <.L1>:
    c2da:	3a 41       	pop	r10		;

0000c2dc <.LCFI1>:
    c2dc:	30 41       	ret			

0000c2de <.L5>:
    c2de:	4b 4a       	mov.b	r10,	r11	;
    c2e0:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c2e2:	4a 4b       	mov.b	r11,	r10	;

0000c2e4 <.LVL9>:
    c2e4:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c2e6:	f7 27       	jz	$-16     	;abs 0xc2d6

0000c2e8 <.Loc.19.1>:
    c2e8:	1d b3       	bit	#1,	r13	;r3 As==01
    c2ea:	01 24       	jz	$+4      	;abs 0xc2ee

0000c2ec <.Loc.20.1>:
    c2ec:	0c 5e       	add	r14,	r12	;

0000c2ee <.L4>:
    c2ee:	0e 5e       	rla	r14		;

0000c2f0 <.Loc.22.1>:
    c2f0:	0d 11       	rra	r13		;

0000c2f2 <.Loc.17.1>:
    c2f2:	ef 3f       	jmp	$-32     	;abs 0xc2d2

0000c2f4 <.L6>:
    c2f4:	4d 43       	clr.b	r13		;

0000c2f6 <.LVL13>:
    c2f6:	0d 8c       	sub	r12,	r13	;
    c2f8:	0c 4d       	mov	r13,	r12	;

0000c2fa <.LVL14>:
    c2fa:	ef 3f       	jmp	$-32     	;abs 0xc2da

0000c2fc <__mspabi_func_epilog_7>:
    c2fc:	34 41       	pop	r4		;

0000c2fe <__mspabi_func_epilog_6>:
    c2fe:	35 41       	pop	r5		;

0000c300 <__mspabi_func_epilog_5>:
    c300:	36 41       	pop	r6		;

0000c302 <__mspabi_func_epilog_4>:
    c302:	37 41       	pop	r7		;

0000c304 <__mspabi_func_epilog_3>:
    c304:	38 41       	pop	r8		;

0000c306 <__mspabi_func_epilog_2>:
    c306:	39 41       	pop	r9		;

0000c308 <__mspabi_func_epilog_1>:
    c308:	3a 41       	pop	r10		;
    c30a:	30 41       	ret			
