
target/msp430-none-elf/release/dnn:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 0c c2 	call	#-15860	;#0xc20c
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 b4 03 	cmp	0x03b4,	r4	;PC rel. 0xc3c0
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 a6 03 	cmp	0x03a6,	r4	;PC rel. 0xc3c2
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 c4 c3 	mov.b	-15420(r4),7530(r4);0xffffc3c4, 0x1d6a
    c024:	6a 1d 
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
    c03a:	39 40 00 1c 	mov	#7168,	r9	;#0x1c00
    c03e:	38 40 ce ff 	mov	#-50,	r8	;#0xffce
    c042:	07 43       	clr	r7		;
    c044:	06 43       	clr	r6		;
    c046:	0a 47       	mov	r7,	r10	;
    c048:	05 48       	mov	r8,	r5	;
    c04a:	04 43       	clr	r4		;
    c04c:	0c 4a       	mov	r10,	r12	;
    c04e:	3d 40 64 00 	mov	#100,	r13	;#0x0064
    c052:	b0 12 d8 c2 	call	#-15656	;#0xc2d8
    c056:	3d 40 64 00 	mov	#100,	r13	;#0x0064
    c05a:	b0 12 5a c2 	call	#-15782	;#0xc25a
    c05e:	0d 49       	mov	r9,	r13	;
    c060:	0d 54       	add	r4,	r13	;
    c062:	0e 45       	mov	r5,	r14	;
    c064:	0e 8c       	sub	r12,	r14	;
    c066:	8d 4e 00 00 	mov	r14,	0(r13)	;
    c06a:	3a 50 0d 00 	add	#13,	r10	;#0x000d
    c06e:	35 50 0d 00 	add	#13,	r5	;#0x000d
    c072:	24 53       	incd	r4		;
    c074:	34 90 10 00 	cmp	#16,	r4	;#0x0010
    c078:	e9 23       	jnz	$-44     	;abs 0xc04c
    c07a:	37 50 11 00 	add	#17,	r7	;#0x0011
    c07e:	38 50 11 00 	add	#17,	r8	;#0x0011
    c082:	39 50 10 00 	add	#16,	r9	;#0x0010
    c086:	16 53       	inc	r6		;
    c088:	36 90 10 00 	cmp	#16,	r6	;#0x0010
    c08c:	dc 23       	jnz	$-70     	;abs 0xc046
    c08e:	3c 40 00 1d 	mov	#7424,	r12	;#0x1d00
    c092:	0d 43       	clr	r13		;
    c094:	0e 43       	clr	r14		;
    c096:	0f 4d       	mov	r13,	r15	;
    c098:	0b 43       	clr	r11		;
    c09a:	3f 90 64 00 	cmp	#100,	r15	;#0x0064
    c09e:	0a 4f       	mov	r15,	r10	;
    c0a0:	03 28       	jnc	$+8      	;abs 0xc0a8
    c0a2:	0a 4f       	mov	r15,	r10	;
    c0a4:	3a 50 9c ff 	add	#-100,	r10	;#0xff9c
    c0a8:	09 4c       	mov	r12,	r9	;
    c0aa:	09 5b       	add	r11,	r9	;
    c0ac:	3a 50 ce ff 	add	#-50,	r10	;#0xffce
    c0b0:	89 4a 00 00 	mov	r10,	0(r9)	;
    c0b4:	3f 50 13 00 	add	#19,	r15	;#0x0013
    c0b8:	2b 53       	incd	r11		;
    c0ba:	3b 90 06 00 	cmp	#6,	r11	;
    c0be:	ed 23       	jnz	$-36     	;abs 0xc09a
    c0c0:	3d 50 17 00 	add	#23,	r13	;#0x0017
    c0c4:	3c 50 06 00 	add	#6,	r12	;
    c0c8:	1e 53       	inc	r14		;
    c0ca:	3e 92       	cmp	#8,	r14	;r2 As==11
    c0cc:	e4 23       	jnz	$-54     	;abs 0xc096
    c0ce:	0c 43       	clr	r12		;
    c0d0:	3d 40 30 1d 	mov	#7472,	r13	;#0x1d30
    c0d4:	8d 4c 00 00 	mov	r12,	0(r13)	;
    c0d8:	2d 53       	incd	r13		;
    c0da:	3c 50 07 00 	add	#7,	r12	;
    c0de:	3c 90 70 00 	cmp	#112,	r12	;#0x0070
    c0e2:	f8 23       	jnz	$-14     	;abs 0xc0d4
    c0e4:	09 43       	clr	r9		;
    c0e6:	82 43 68 1d 	mov	#0,	&0x1d68	;r3 As==00
    c0ea:	82 43 66 1d 	mov	#0,	&0x1d66	;r3 As==00
    c0ee:	08 49       	mov	r9,	r8	;
    c0f0:	08 58       	rla	r8		;
    c0f2:	07 48       	mov	r8,	r7	;
    c0f4:	37 50 00 1c 	add	#7168,	r7	;#0x1c00
    c0f8:	06 43       	clr	r6		;
    c0fa:	0a 43       	clr	r10		;
    c0fc:	05 43       	clr	r5		;
    c0fe:	1e 46 30 1d 	mov	7472(r6),r14	;0x01d30
    c102:	0f 4e       	mov	r14,	r15	;
    c104:	8f 10       	swpb	r15		;
    c106:	8f 11       	sxt	r15		;
    c108:	0f 11       	rra	r15		;
    c10a:	1c 47 00 00 	mov	0(r7),	r12	;
    c10e:	0d 4c       	mov	r12,	r13	;
    c110:	8d 10       	swpb	r13		;
    c112:	8d 11       	sxt	r13		;
    c114:	0f 11       	rra	r15		;
    c116:	0f 11       	rra	r15		;
    c118:	0f 11       	rra	r15		;
    c11a:	0f 11       	rra	r15		;
    c11c:	0f 11       	rra	r15		;
    c11e:	0f 11       	rra	r15		;
    c120:	0d 11       	rra	r13		;
    c122:	0d 11       	rra	r13		;
    c124:	0d 11       	rra	r13		;
    c126:	0d 11       	rra	r13		;
    c128:	0d 11       	rra	r13		;
    c12a:	0d 11       	rra	r13		;
    c12c:	0d 11       	rra	r13		;
    c12e:	b0 12 10 c2 	call	#-15856	;#0xc210
    c132:	0a 5c       	add	r12,	r10	;
    c134:	0a 9c       	cmp	r12,	r10	;
    c136:	1c 43       	mov	#1,	r12	;r3 As==01
    c138:	0c c2       	bic	r2,	r12	;
    c13a:	0d 55       	add	r5,	r13	;
    c13c:	0d 5c       	add	r12,	r13	;
    c13e:	37 50 10 00 	add	#16,	r7	;#0x0010
    c142:	26 53       	incd	r6		;
    c144:	36 90 20 00 	cmp	#32,	r6	;#0x0020
    c148:	05 4d       	mov	r13,	r5	;
    c14a:	d9 23       	jnz	$-76     	;abs 0xc0fe
    c14c:	0c 4a       	mov	r10,	r12	;
    c14e:	3e 40 64 00 	mov	#100,	r14	;#0x0064
    c152:	0f 43       	clr	r15		;
    c154:	b0 12 66 c3 	call	#-15514	;#0xc366
    c158:	1c 93       	cmp	#1,	r12	;r3 As==01
    c15a:	01 34       	jge	$+4      	;abs 0xc15e
    c15c:	0c 43       	clr	r12		;
    c15e:	88 4c 50 1d 	mov	r12,	7504(r8); 0x1d50
    c162:	19 53       	inc	r9		;
    c164:	39 92       	cmp	#8,	r9	;r2 As==11
    c166:	c3 23       	jnz	$-120    	;abs 0xc0ee
    c168:	09 43       	clr	r9		;
    c16a:	38 40 00 1d 	mov	#7424,	r8	;#0x1d00
    c16e:	07 43       	clr	r7		;
    c170:	06 48       	mov	r8,	r6	;
    c172:	0a 43       	clr	r10		;
    c174:	05 43       	clr	r5		;
    c176:	1e 47 50 1d 	mov	7504(r7),r14	;0x01d50
    c17a:	0f 4e       	mov	r14,	r15	;
    c17c:	8f 10       	swpb	r15		;
    c17e:	8f 11       	sxt	r15		;
    c180:	0f 11       	rra	r15		;
    c182:	1c 46 00 00 	mov	0(r6),	r12	;
    c186:	0d 4c       	mov	r12,	r13	;
    c188:	8d 10       	swpb	r13		;
    c18a:	8d 11       	sxt	r13		;
    c18c:	0f 11       	rra	r15		;
    c18e:	0f 11       	rra	r15		;
    c190:	0f 11       	rra	r15		;
    c192:	0f 11       	rra	r15		;
    c194:	0f 11       	rra	r15		;
    c196:	0f 11       	rra	r15		;
    c198:	0d 11       	rra	r13		;
    c19a:	0d 11       	rra	r13		;
    c19c:	0d 11       	rra	r13		;
    c19e:	0d 11       	rra	r13		;
    c1a0:	0d 11       	rra	r13		;
    c1a2:	0d 11       	rra	r13		;
    c1a4:	0d 11       	rra	r13		;
    c1a6:	b0 12 10 c2 	call	#-15856	;#0xc210
    c1aa:	0a 5c       	add	r12,	r10	;
    c1ac:	0a 9c       	cmp	r12,	r10	;
    c1ae:	1c 43       	mov	#1,	r12	;r3 As==01
    c1b0:	0c c2       	bic	r2,	r12	;
    c1b2:	0d 55       	add	r5,	r13	;
    c1b4:	0d 5c       	add	r12,	r13	;
    c1b6:	36 50 06 00 	add	#6,	r6	;
    c1ba:	27 53       	incd	r7		;
    c1bc:	37 90 10 00 	cmp	#16,	r7	;#0x0010
    c1c0:	05 4d       	mov	r13,	r5	;
    c1c2:	d9 23       	jnz	$-76     	;abs 0xc176
    c1c4:	0c 4a       	mov	r10,	r12	;
    c1c6:	3e 40 64 00 	mov	#100,	r14	;#0x0064
    c1ca:	0f 43       	clr	r15		;
    c1cc:	b0 12 66 c3 	call	#-15514	;#0xc366
    c1d0:	0d 49       	mov	r9,	r13	;
    c1d2:	0d 5d       	rla	r13		;
    c1d4:	8d 4c 60 1d 	mov	r12,	7520(r13); 0x1d60
    c1d8:	28 53       	incd	r8		;
    c1da:	19 53       	inc	r9		;
    c1dc:	39 90 03 00 	cmp	#3,	r9	;
    c1e0:	c6 23       	jnz	$-114    	;abs 0xc16e
    c1e2:	0c 43       	clr	r12		;
    c1e4:	9c 53 30 1d 	inc	7472(r12)		;
    c1e8:	2c 53       	incd	r12		;
    c1ea:	3c 90 20 00 	cmp	#32,	r12	;#0x0020
    c1ee:	fa 23       	jnz	$-10     	;abs 0xc1e4
    c1f0:	1c 43       	mov	#1,	r12	;r3 As==01
    c1f2:	1c 52 66 1d 	add	&0x1d66,r12	;0x1d66
    c1f6:	0c 93       	cmp	#0,	r12	;r3 As==00
    c1f8:	0d 42       	mov	r2,	r13	;
    c1fa:	0d 11       	rra	r13		;
    c1fc:	1d f3       	and	#1,	r13	;r3 As==01
    c1fe:	82 5d 68 1d 	add	r13,	&0x1d68	;
    c202:	82 4c 66 1d 	mov	r12,	&0x1d66	;
    c206:	09 43       	clr	r9		;
    c208:	03 43       	nop			
    c20a:	71 3f       	jmp	$-284    	;abs 0xc0ee

0000c20c <PreInit_>:
    c20c:	30 41       	ret			

0000c20e <DefaultHandler_>:
    c20e:	ff 3f       	jmp	$+0      	;abs 0xc20e

0000c210 <__mspabi_mpyl>:
    c210:	0a 12       	push	r10		;

0000c212 <.LCFI10>:
    c212:	09 12       	push	r9		;

0000c214 <.LCFI11>:
    c214:	08 12       	push	r8		;

0000c216 <.LCFI12>:
    c216:	07 12       	push	r7		;

0000c218 <.LCFI13>:
    c218:	06 12       	push	r6		;

0000c21a <.LCFI14>:
    c21a:	0a 4c       	mov	r12,	r10	;
    c21c:	0b 4d       	mov	r13,	r11	;

0000c21e <.LVL27>:
    c21e:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c222 <.Loc.30.2>:
    c222:	4c 43       	clr.b	r12		;

0000c224 <.LVL28>:
    c224:	4d 43       	clr.b	r13		;

0000c226 <.L6>:
    c226:	09 4e       	mov	r14,	r9	;
    c228:	09 df       	bis	r15,	r9	;
    c22a:	09 93       	cmp	#0,	r9	;r3 As==00
    c22c:	05 24       	jz	$+12     	;abs 0xc238
    c22e:	49 48       	mov.b	r8,	r9	;
    c230:	79 53       	add.b	#-1,	r9	;r3 As==11
    c232:	48 49       	mov.b	r9,	r8	;

0000c234 <.LVL30>:
    c234:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c236:	01 20       	jnz	$+4      	;abs 0xc23a

0000c238 <.L5>:
    c238:	bd 3c       	jmp	$+380    	;abs 0xc3b4

0000c23a <.L10>:
    c23a:	09 4e       	mov	r14,	r9	;
    c23c:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c23e <.Loc.36.2>:
    c23e:	09 93       	cmp	#0,	r9	;r3 As==00
    c240:	02 24       	jz	$+6      	;abs 0xc246

0000c242 <.Loc.37.2>:
    c242:	0c 5a       	add	r10,	r12	;

0000c244 <.LVL31>:
    c244:	0d 6b       	addc	r11,	r13	;

0000c246 <.L7>:
    c246:	06 4a       	mov	r10,	r6	;
    c248:	07 4b       	mov	r11,	r7	;
    c24a:	06 5a       	add	r10,	r6	;
    c24c:	07 6b       	addc	r11,	r7	;
    c24e:	0a 46       	mov	r6,	r10	;

0000c250 <.LVL33>:
    c250:	0b 47       	mov	r7,	r11	;

0000c252 <.LVL34>:
    c252:	12 c3       	clrc			
    c254:	0f 10       	rrc	r15		;
    c256:	0e 10       	rrc	r14		;

0000c258 <.LVL35>:
    c258:	e6 3f       	jmp	$-50     	;abs 0xc226

0000c25a <__mspabi_mpyi>:
    c25a:	0a 12       	push	r10		;

0000c25c <.LCFI0>:
    c25c:	0e 4c       	mov	r12,	r14	;

0000c25e <L0^A>:
    c25e:	4f 43       	clr.b	r15		;

0000c260 <.Loc.11.1>:
    c260:	0d 93       	cmp	#0,	r13	;r3 As==00
    c262:	04 34       	jge	$+10     	;abs 0xc26c

0000c264 <.Loc.13.1>:
    c264:	4c 43       	clr.b	r12		;

0000c266 <.LVL2>:
    c266:	0c 8d       	sub	r13,	r12	;
    c268:	0d 4c       	mov	r12,	r13	;

0000c26a <.LVL3>:
    c26a:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c26c <.L2>:
    c26c:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c270 <.Loc.9.1>:
    c270:	4c 43       	clr.b	r12		;

0000c272 <.L3>:
    c272:	0d 93       	cmp	#0,	r13	;r3 As==00
    c274:	04 20       	jnz	$+10     	;abs 0xc27e

0000c276 <.L9>:
    c276:	0f 93       	cmp	#0,	r15	;r3 As==00
    c278:	0d 20       	jnz	$+28     	;abs 0xc294

0000c27a <.L1>:
    c27a:	3a 41       	pop	r10		;

0000c27c <.LCFI1>:
    c27c:	30 41       	ret			

0000c27e <.L5>:
    c27e:	4b 4a       	mov.b	r10,	r11	;
    c280:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c282:	4a 4b       	mov.b	r11,	r10	;

0000c284 <.LVL9>:
    c284:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c286:	f7 27       	jz	$-16     	;abs 0xc276

0000c288 <.Loc.19.1>:
    c288:	1d b3       	bit	#1,	r13	;r3 As==01
    c28a:	01 24       	jz	$+4      	;abs 0xc28e

0000c28c <.Loc.20.1>:
    c28c:	0c 5e       	add	r14,	r12	;

0000c28e <.L4>:
    c28e:	0e 5e       	rla	r14		;

0000c290 <.Loc.22.1>:
    c290:	0d 11       	rra	r13		;

0000c292 <.Loc.17.1>:
    c292:	ef 3f       	jmp	$-32     	;abs 0xc272

0000c294 <.L6>:
    c294:	4d 43       	clr.b	r13		;

0000c296 <.LVL13>:
    c296:	0d 8c       	sub	r12,	r13	;
    c298:	0c 4d       	mov	r13,	r12	;

0000c29a <.LVL14>:
    c29a:	ef 3f       	jmp	$-32     	;abs 0xc27a

0000c29c <udivmodhi4>:
    c29c:	0f 4c       	mov	r12,	r15	;

0000c29e <.LVL1>:
    c29e:	
0000c2a0 <L0^A>:
    c2a0:	11 00       	mova	@r0+,	r1	;

0000c2a2 <.LVL2>:
    c2a2:	5b 43       	mov.b	#1,	r11	;r3 As==01

0000c2a4 <.L2>:
    c2a4:	0d 9f       	cmp	r15,	r13	;
    c2a6:	05 2c       	jc	$+12     	;abs 0xc2b2
    c2a8:	3c 53       	add	#-1,	r12	;r3 As==11

0000c2aa <.Loc.38.1>:
    c2aa:	0c 93       	cmp	#0,	r12	;r3 As==00
    c2ac:	05 24       	jz	$+12     	;abs 0xc2b8

0000c2ae <.Loc.38.1>:
    c2ae:	0d 93       	cmp	#0,	r13	;r3 As==00
    c2b0:	07 34       	jge	$+16     	;abs 0xc2c0

0000c2b2 <.L10>:
    c2b2:	4c 43       	clr.b	r12		;

0000c2b4 <.L6>:
    c2b4:	0b 93       	cmp	#0,	r11	;r3 As==00
    c2b6:	07 20       	jnz	$+16     	;abs 0xc2c6

0000c2b8 <.L4>:
    c2b8:	0e 93       	cmp	#0,	r14	;r3 As==00
    c2ba:	01 24       	jz	$+4      	;abs 0xc2be
    c2bc:	0c 4f       	mov	r15,	r12	;

0000c2be <.L1>:
    c2be:	30 41       	ret			

0000c2c0 <.L5>:
    c2c0:	0d 5d       	rla	r13		;

0000c2c2 <.Loc.41.1>:
    c2c2:	0b 5b       	rla	r11		;
    c2c4:	ef 3f       	jmp	$-32     	;abs 0xc2a4

0000c2c6 <.L8>:
    c2c6:	0f 9d       	cmp	r13,	r15	;
    c2c8:	02 28       	jnc	$+6      	;abs 0xc2ce

0000c2ca <.Loc.47.1>:
    c2ca:	0f 8d       	sub	r13,	r15	;

0000c2cc <.Loc.48.1>:
    c2cc:	0c db       	bis	r11,	r12	;

0000c2ce <.L7>:
    c2ce:	12 c3       	clrc			
    c2d0:	0b 10       	rrc	r11		;

0000c2d2 <.Loc.51.1>:
    c2d2:	12 c3       	clrc			
    c2d4:	0d 10       	rrc	r13		;
    c2d6:	ee 3f       	jmp	$-34     	;abs 0xc2b4

0000c2d8 <__mspabi_divu>:
    c2d8:	4e 43       	clr.b	r14		;
    c2da:	
0000c2dc <L0^A>:
    c2dc:	
0000c2de <.LVL35>:
    c2de:	30 41       	ret			

0000c2e0 <udivmodsi4>:
    c2e0:	0a 12       	push	r10		;

0000c2e2 <.LCFI0>:
    c2e2:	09 12       	push	r9		;

0000c2e4 <.LCFI1>:
    c2e4:	08 12       	push	r8		;

0000c2e6 <.LCFI2>:
    c2e6:	07 12       	push	r7		;

0000c2e8 <.LCFI3>:
    c2e8:	06 12       	push	r6		;

0000c2ea <.LCFI4>:
    c2ea:	0a 4c       	mov	r12,	r10	;
    c2ec:	0b 4d       	mov	r13,	r11	;

0000c2ee <.LVL1>:
    c2ee:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

0000c2f2 <.LVL2>:
    c2f2:	58 43       	mov.b	#1,	r8	;r3 As==01
    c2f4:	49 43       	clr.b	r9		;

0000c2f6 <.L2>:
    c2f6:	0f 9b       	cmp	r11,	r15	;
    c2f8:	04 28       	jnc	$+10     	;abs 0xc302
    c2fa:	0b 9f       	cmp	r15,	r11	;
    c2fc:	07 20       	jnz	$+16     	;abs 0xc30c
    c2fe:	0e 9a       	cmp	r10,	r14	;
    c300:	05 2c       	jc	$+12     	;abs 0xc30c

0000c302 <.L15>:
    c302:	3c 53       	add	#-1,	r12	;r3 As==11

0000c304 <.Loc.38.1>:
    c304:	0c 93       	cmp	#0,	r12	;r3 As==00
    c306:	2c 24       	jz	$+90     	;abs 0xc360

0000c308 <.Loc.38.1>:
    c308:	0f 93       	cmp	#0,	r15	;r3 As==00
    c30a:	0c 34       	jge	$+26     	;abs 0xc324

0000c30c <.L13>:
    c30c:	4c 43       	clr.b	r12		;
    c30e:	4d 43       	clr.b	r13		;

0000c310 <.L8>:
    c310:	07 48       	mov	r8,	r7	;
    c312:	07 d9       	bis	r9,	r7	;
    c314:	07 93       	cmp	#0,	r7	;r3 As==00
    c316:	13 20       	jnz	$+40     	;abs 0xc33e

0000c318 <.L5>:
    c318:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
    c31c:	02 24       	jz	$+6      	;abs 0xc322
    c31e:	0c 4a       	mov	r10,	r12	;
    c320:	0d 4b       	mov	r11,	r13	;

0000c322 <.L1>:
    c322:	48 3c       	jmp	$+146    	;abs 0xc3b4

0000c324 <.L6>:
    c324:	06 4e       	mov	r14,	r6	;
    c326:	07 4f       	mov	r15,	r7	;
    c328:	06 5e       	add	r14,	r6	;
    c32a:	07 6f       	addc	r15,	r7	;
    c32c:	0e 46       	mov	r6,	r14	;

0000c32e <.LVL7>:
    c32e:	0f 47       	mov	r7,	r15	;

0000c330 <.LVL8>:
    c330:	06 48       	mov	r8,	r6	;
    c332:	07 49       	mov	r9,	r7	;
    c334:	06 58       	add	r8,	r6	;
    c336:	07 69       	addc	r9,	r7	;
    c338:	08 46       	mov	r6,	r8	;

0000c33a <.LVL9>:
    c33a:	09 47       	mov	r7,	r9	;

0000c33c <.LVL10>:
    c33c:	dc 3f       	jmp	$-70     	;abs 0xc2f6

0000c33e <.L11>:
    c33e:	0b 9f       	cmp	r15,	r11	;
    c340:	08 28       	jnc	$+18     	;abs 0xc352
    c342:	0f 9b       	cmp	r11,	r15	;
    c344:	02 20       	jnz	$+6      	;abs 0xc34a
    c346:	0a 9e       	cmp	r14,	r10	;
    c348:	04 28       	jnc	$+10     	;abs 0xc352

0000c34a <.L16>:
    c34a:	0a 8e       	sub	r14,	r10	;
    c34c:	0b 7f       	subc	r15,	r11	;

0000c34e <.Loc.48.1>:
    c34e:	0c d8       	bis	r8,	r12	;

0000c350 <.LVL13>:
    c350:	0d d9       	bis	r9,	r13	;

0000c352 <.L9>:
    c352:	12 c3       	clrc			
    c354:	09 10       	rrc	r9		;
    c356:	08 10       	rrc	r8		;

0000c358 <.Loc.51.1>:
    c358:	12 c3       	clrc			
    c35a:	0f 10       	rrc	r15		;
    c35c:	0e 10       	rrc	r14		;
    c35e:	d8 3f       	jmp	$-78     	;abs 0xc310

0000c360 <.L14>:
    c360:	4c 43       	clr.b	r12		;
    c362:	4d 43       	clr.b	r13		;
    c364:	d9 3f       	jmp	$-76     	;abs 0xc318

0000c366 <__mspabi_divli>:
    c366:	0a 12       	push	r10		;

0000c368 <.LCFI6>:
    c368:	09 12       	push	r9		;

0000c36a <.LCFI7>:
    c36a:	08 12       	push	r8		;

0000c36c <.LCFI8>:
    c36c:	21 83       	decd	r1		;

0000c36e <L0^A>:
    c36e:	4a 43       	clr.b	r10		;

0000c370 <.Loc.64.1>:
    c370:	0d 93       	cmp	#0,	r13	;r3 As==00
    c372:	07 34       	jge	$+16     	;abs 0xc382

0000c374 <.Loc.66.1>:
    c374:	48 43       	clr.b	r8		;
    c376:	49 43       	clr.b	r9		;
    c378:	08 8c       	sub	r12,	r8	;
    c37a:	09 7d       	subc	r13,	r9	;
    c37c:	0c 48       	mov	r8,	r12	;

0000c37e <.LVL20>:
    c37e:	0d 49       	mov	r9,	r13	;

0000c380 <.LVL21>:
    c380:	5a 43       	mov.b	#1,	r10	;r3 As==01

0000c382 <.L21>:
    c382:	0f 93       	cmp	#0,	r15	;r3 As==00
    c384:	07 34       	jge	$+16     	;abs 0xc394

0000c386 <.Loc.72.1>:
    c386:	48 43       	clr.b	r8		;
    c388:	49 43       	clr.b	r9		;
    c38a:	08 8e       	sub	r14,	r8	;
    c38c:	09 7f       	subc	r15,	r9	;
    c38e:	0e 48       	mov	r8,	r14	;

0000c390 <.LVL23>:
    c390:	0f 49       	mov	r9,	r15	;

0000c392 <.LVL24>:
    c392:	1a e3       	xor	#1,	r10	;r3 As==01

0000c394 <.L23>:
    c394:	81 43 00 00 	mov	#0,	0(r1)	;r3 As==00
    c398:	b0 12 e0 c2 	call	#-15648	;#0xc2e0

0000c39c <.LVL26>:
    c39c:	0a 93       	cmp	#0,	r10	;r3 As==00
    c39e:	06 24       	jz	$+14     	;abs 0xc3ac

0000c3a0 <.LVL27>:
    c3a0:	49 43       	clr.b	r9		;
    c3a2:	4a 43       	clr.b	r10		;
    c3a4:	09 8c       	sub	r12,	r9	;
    c3a6:	0a 7d       	subc	r13,	r10	;
    c3a8:	0c 49       	mov	r9,	r12	;

0000c3aa <.LVL28>:
    c3aa:	0d 4a       	mov	r10,	r13	;

0000c3ac <.L20>:
    c3ac:	21 53       	incd	r1		;

0000c3ae <.LCFI10>:
    c3ae:	04 3c       	jmp	$+10     	;abs 0xc3b8

0000c3b0 <__mspabi_func_epilog_7>:
    c3b0:	34 41       	pop	r4		;

0000c3b2 <__mspabi_func_epilog_6>:
    c3b2:	35 41       	pop	r5		;

0000c3b4 <__mspabi_func_epilog_5>:
    c3b4:	36 41       	pop	r6		;

0000c3b6 <__mspabi_func_epilog_4>:
    c3b6:	37 41       	pop	r7		;

0000c3b8 <__mspabi_func_epilog_3>:
    c3b8:	38 41       	pop	r8		;

0000c3ba <__mspabi_func_epilog_2>:
    c3ba:	39 41       	pop	r9		;

0000c3bc <__mspabi_func_epilog_1>:
    c3bc:	3a 41       	pop	r10		;
    c3be:	30 41       	ret			
