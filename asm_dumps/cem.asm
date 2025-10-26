
target/msp430-none-elf/release/cem:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 f6 c1 	call	#-15882	;#0xc1f6
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 dc 02 	cmp	0x02dc,	r4	;PC rel. 0xc2e8
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 ce 02 	cmp	0x02ce,	r4	;PC rel. 0xc2ea
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 ec c2 	mov.b	-15636(r4),7184(r4);0xffffc2ec, 0x1c10
    c024:	10 1c 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	a4 3c       	jmp	$+330    	;abs 0xc174

0000c02c <TIMER3_A0>:
    c02c:	09 12       	push	r9		;
    c02e:	0a 12       	push	r10		;
    c030:	0b 12       	push	r11		;
    c032:	0c 12       	push	r12		;
    c034:	0d 12       	push	r13		;
    c036:	0e 12       	push	r14		;
    c038:	0f 12       	push	r15		;
    c03a:	1c 42 0a 1c 	mov	&0x1c0a,r12	;0x1c0a
    c03e:	1d 42 0c 1c 	mov	&0x1c0c,r13	;0x1c0c
    c042:	3e 40 25 00 	mov	#37,	r14	;#0x0025
    c046:	0f 43       	clr	r15		;
    c048:	b0 12 fa c1 	call	#-15878	;#0xc1fa
    c04c:	0e 4c       	mov	r12,	r14	;
    c04e:	3e 50 0d 00 	add	#13,	r14	;#0x000d
    c052:	0e 9c       	cmp	r12,	r14	;
    c054:	1a 43       	mov	#1,	r10	;r3 As==01
    c056:	1c 43       	mov	#1,	r12	;r3 As==01
    c058:	0c c2       	bic	r2,	r12	;
    c05a:	0d 5c       	add	r12,	r13	;
    c05c:	0c 4e       	mov	r14,	r12	;
    c05e:	3e 40 c8 00 	mov	#200,	r14	;#0x00c8
    c062:	0f 43       	clr	r15		;
    c064:	b0 12 ca c2 	call	#-15670	;#0xc2ca
    c068:	0e 4c       	mov	r12,	r14	;
    c06a:	3e 50 ba ff 	add	#-70,	r14	;#0xffba
    c06e:	3e 90 3d 00 	cmp	#61,	r14	;#0x003d
    c072:	0a 28       	jnc	$+22     	;abs 0xc088
    c074:	1a 52 06 1c 	add	&0x1c06,r10	;0x1c06
    c078:	0a 93       	cmp	#0,	r10	;r3 As==00
    c07a:	0d 42       	mov	r2,	r13	;
    c07c:	0d 11       	rra	r13		;
    c07e:	1d f3       	and	#1,	r13	;r3 As==01
    c080:	82 5d 08 1c 	add	r13,	&0x1c08	;
    c084:	82 4a 06 1c 	mov	r10,	&0x1c06	;
    c088:	1d 42 00 1c 	mov	&0x1c00,r13	;0x1c00
    c08c:	1b 42 0c 1c 	mov	&0x1c0c,r11	;0x1c0c
    c090:	1f 42 0a 1c 	mov	&0x1c0a,r15	;0x1c0a
    c094:	3d 90 80 00 	cmp	#128,	r13	;#0x0080
    c098:	6a 2c       	jc	$+214    	;abs 0xc16e
    c09a:	3c 50 ce ff 	add	#-50,	r12	;#0xffce
    c09e:	09 4d       	mov	r13,	r9	;
    c0a0:	09 59       	rla	r9		;
    c0a2:	09 59       	rla	r9		;
    c0a4:	09 59       	rla	r9		;
    c0a6:	89 4c 10 1c 	mov	r12,	7184(r9); 0x1c10
    c0aa:	89 4b 14 1c 	mov	r11,	7188(r9); 0x1c14
    c0ae:	89 4f 12 1c 	mov	r15,	7186(r9); 0x1c12
    c0b2:	3e 90 3d 00 	cmp	#61,	r14	;#0x003d
    c0b6:	1a 43       	mov	#1,	r10	;r3 As==01
    c0b8:	1c 43       	mov	#1,	r12	;r3 As==01
    c0ba:	0c c2       	bic	r2,	r12	;
    c0bc:	c9 4c 16 1c 	mov.b	r12,	7190(r9); 0x1c16
    c0c0:	1d 53       	inc	r13		;
    c0c2:	3d f0 7f 00 	and	#127,	r13	;#0x007f
    c0c6:	82 4d 00 1c 	mov	r13,	&0x1c00	;
    c0ca:	1c 43       	mov	#1,	r12	;r3 As==01
    c0cc:	1c 52 0a 1c 	add	&0x1c0a,r12	;0x1c0a
    c0d0:	0c 93       	cmp	#0,	r12	;r3 As==00
    c0d2:	0d 42       	mov	r2,	r13	;
    c0d4:	0d 11       	rra	r13		;
    c0d6:	1d f3       	and	#1,	r13	;r3 As==01
    c0d8:	82 5d 0c 1c 	add	r13,	&0x1c0c	;
    c0dc:	82 4c 0a 1c 	mov	r12,	&0x1c0a	;
    c0e0:	1a 52 02 1c 	add	&0x1c02,r10	;0x1c02
    c0e4:	0a 93       	cmp	#0,	r10	;r3 As==00
    c0e6:	09 42       	mov	r2,	r9	;
    c0e8:	09 11       	rra	r9		;
    c0ea:	19 f3       	and	#1,	r9	;r3 As==01
    c0ec:	19 52 04 1c 	add	&0x1c04,r9	;0x1c04
    c0f0:	0c 4a       	mov	r10,	r12	;
    c0f2:	0d 49       	mov	r9,	r13	;
    c0f4:	3e 40 cd cc 	mov	#-13107,r14	;#0xcccd
    c0f8:	3f 40 cc cc 	mov	#-13108,r15	;#0xcccc
    c0fc:	b0 12 fa c1 	call	#-15878	;#0xc1fa
    c100:	0e 4d       	mov	r13,	r14	;
    c102:	4e 4e       	mov.b	r14,	r14	;
    c104:	8e 10       	swpb	r14		;
    c106:	0e 5e       	rla	r14		;
    c108:	0e 5e       	rla	r14		;
    c10a:	0e 5e       	rla	r14		;
    c10c:	0e 5e       	rla	r14		;
    c10e:	0e 5e       	rla	r14		;
    c110:	0e 5e       	rla	r14		;
    c112:	0e 5e       	rla	r14		;
    c114:	12 c3       	clrc			
    c116:	0f 4c       	mov	r12,	r15	;
    c118:	0f 10       	rrc	r15		;
    c11a:	0f de       	bis	r14,	r15	;
    c11c:	3f 90 9a 99 	cmp	#-26214,r15	;#0x999a
    c120:	0e 42       	mov	r2,	r14	;
    c122:	4c 4c       	mov.b	r12,	r12	;
    c124:	8c 10       	swpb	r12		;
    c126:	12 c3       	clrc			
    c128:	0d 10       	rrc	r13		;
    c12a:	0c 5c       	rla	r12		;
    c12c:	0c 5c       	rla	r12		;
    c12e:	0c 5c       	rla	r12		;
    c130:	0c 5c       	rla	r12		;
    c132:	0c 5c       	rla	r12		;
    c134:	0c 5c       	rla	r12		;
    c136:	0c 5c       	rla	r12		;
    c138:	0c dd       	bis	r13,	r12	;
    c13a:	3c 90 9a 19 	cmp	#6554,	r12	;#0x199a
    c13e:	0d 42       	mov	r2,	r13	;
    c140:	3c 90 99 19 	cmp	#6553,	r12	;#0x1999
    c144:	03 24       	jz	$+8      	;abs 0xc14c
    c146:	1d f3       	and	#1,	r13	;r3 As==01
    c148:	0e 4d       	mov	r13,	r14	;
    c14a:	01 3c       	jmp	$+4      	;abs 0xc14e
    c14c:	1e f3       	and	#1,	r14	;r3 As==01
    c14e:	82 49 04 1c 	mov	r9,	&0x1c04	;
    c152:	82 4a 02 1c 	mov	r10,	&0x1c02	;
    c156:	1e b3       	bit	#1,	r14	;r3 As==01
    c158:	02 20       	jnz	$+6      	;abs 0xc15e
    c15a:	d2 43 0e 1c 	mov.b	#1,	&0x1c0e	;r3 As==01
    c15e:	3f 41       	pop	r15		;
    c160:	3e 41       	pop	r14		;
    c162:	3d 41       	pop	r13		;
    c164:	3c 41       	pop	r12		;
    c166:	3b 41       	pop	r11		;
    c168:	3a 41       	pop	r10		;
    c16a:	39 41       	pop	r9		;
    c16c:	00 13       	reti			
    c16e:	0c 4d       	mov	r13,	r12	;
    c170:	b0 12 ec c1 	call	#-15892	;#0xc1ec

0000c174 <main>:
    c174:	0c 43       	clr	r12		;
    c176:	8c 43 10 1c 	mov	#0,	7184(r12);r3 As==00, 0x1c10
    c17a:	8c 43 14 1c 	mov	#0,	7188(r12);r3 As==00, 0x1c14
    c17e:	8c 43 12 1c 	mov	#0,	7186(r12);r3 As==00, 0x1c12
    c182:	dc 43 16 1c 	mov.b	#1,	7190(r12);r3 As==01, 0x1c16
    c186:	3c 52       	add	#8,	r12	;r2 As==11
    c188:	3c 90 00 04 	cmp	#1024,	r12	;#0x0400
    c18c:	f4 23       	jnz	$-22     	;abs 0xc176
    c18e:	82 43 00 1c 	mov	#0,	&0x1c00	;r3 As==00
    c192:	82 43 04 1c 	mov	#0,	&0x1c04	;r3 As==00
    c196:	82 43 02 1c 	mov	#0,	&0x1c02	;r3 As==00
    c19a:	82 43 08 1c 	mov	#0,	&0x1c08	;r3 As==00
    c19e:	82 43 06 1c 	mov	#0,	&0x1c06	;r3 As==00
    c1a2:	d2 43 0f 1c 	mov.b	#1,	&0x1c0f	;r3 As==01
    c1a6:	82 43 0c 1c 	mov	#0,	&0x1c0c	;r3 As==00
    c1aa:	82 43 0a 1c 	mov	#0,	&0x1c0a	;r3 As==00
    c1ae:	82 43 40 04 	mov	#0,	&0x0440	;r3 As==00
    c1b2:	b2 40 24 f4 	mov	#-3036,	&0x0452	;#0xf424
    c1b6:	52 04 
    c1b8:	a2 d2 40 04 	bis	#4,	&0x0440	;r2 As==10
    c1bc:	b2 d0 10 00 	bis	#16,	&0x0442	;#0x0010
    c1c0:	42 04 
    c1c2:	b2 40 d0 02 	mov	#720,	&0x0440	;#0x02d0
    c1c6:	40 04 
    c1c8:	03 43       	nop			
    c1ca:	32 d2       	eint			
    c1cc:	03 43       	nop			
    c1ce:	5c 42 0e 1c 	mov.b	&0x1c0e,r12	;0x1c0e
    c1d2:	1c b3       	bit	#1,	r12	;r3 As==01
    c1d4:	09 24       	jz	$+20     	;abs 0xc1e8
    c1d6:	0c 43       	clr	r12		;
    c1d8:	5d 4c 16 1c 	mov.b	7190(r12),r13	;0x01c16
    c1dc:	3c 52       	add	#8,	r12	;r2 As==11
    c1de:	3c 90 00 04 	cmp	#1024,	r12	;#0x0400
    c1e2:	fa 23       	jnz	$-10     	;abs 0xc1d8
    c1e4:	c2 43 0e 1c 	mov.b	#0,	&0x1c0e	;r3 As==00
    c1e8:	03 43       	nop			
    c1ea:	f1 3f       	jmp	$-28     	;abs 0xc1ce

0000c1ec <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c1ec:	b0 12 f0 c1 	call	#-15888	;#0xc1f0

0000c1f0 <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c1f0:	32 c2       	dint			
    c1f2:	03 43       	nop			
    c1f4:	ff 3f       	jmp	$+0      	;abs 0xc1f4

0000c1f6 <PreInit_>:
    c1f6:	30 41       	ret			

0000c1f8 <DefaultHandler_>:
    c1f8:	ff 3f       	jmp	$+0      	;abs 0xc1f8

0000c1fa <__mspabi_mpyl>:
    c1fa:	0a 12       	push	r10		;

0000c1fc <.LCFI10>:
    c1fc:	09 12       	push	r9		;

0000c1fe <.LCFI11>:
    c1fe:	08 12       	push	r8		;

0000c200 <.LCFI12>:
    c200:	07 12       	push	r7		;

0000c202 <.LCFI13>:
    c202:	06 12       	push	r6		;

0000c204 <.LCFI14>:
    c204:	0a 4c       	mov	r12,	r10	;
    c206:	0b 4d       	mov	r13,	r11	;

0000c208 <.LVL27>:
    c208:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c20c <.Loc.30.2>:
    c20c:	4c 43       	clr.b	r12		;

0000c20e <.LVL28>:
    c20e:	4d 43       	clr.b	r13		;

0000c210 <.L6>:
    c210:	09 4e       	mov	r14,	r9	;
    c212:	09 df       	bis	r15,	r9	;
    c214:	09 93       	cmp	#0,	r9	;r3 As==00
    c216:	05 24       	jz	$+12     	;abs 0xc222
    c218:	49 48       	mov.b	r8,	r9	;
    c21a:	79 53       	add.b	#-1,	r9	;r3 As==11
    c21c:	48 49       	mov.b	r9,	r8	;

0000c21e <.LVL30>:
    c21e:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c220:	01 20       	jnz	$+4      	;abs 0xc224

0000c222 <.L5>:
    c222:	5c 3c       	jmp	$+186    	;abs 0xc2dc

0000c224 <.L10>:
    c224:	09 4e       	mov	r14,	r9	;
    c226:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c228 <.Loc.36.2>:
    c228:	09 93       	cmp	#0,	r9	;r3 As==00
    c22a:	02 24       	jz	$+6      	;abs 0xc230

0000c22c <.Loc.37.2>:
    c22c:	0c 5a       	add	r10,	r12	;

0000c22e <.LVL31>:
    c22e:	0d 6b       	addc	r11,	r13	;

0000c230 <.L7>:
    c230:	06 4a       	mov	r10,	r6	;
    c232:	07 4b       	mov	r11,	r7	;
    c234:	06 5a       	add	r10,	r6	;
    c236:	07 6b       	addc	r11,	r7	;
    c238:	0a 46       	mov	r6,	r10	;

0000c23a <.LVL33>:
    c23a:	0b 47       	mov	r7,	r11	;

0000c23c <.LVL34>:
    c23c:	12 c3       	clrc			
    c23e:	0f 10       	rrc	r15		;
    c240:	0e 10       	rrc	r14		;

0000c242 <.LVL35>:
    c242:	e6 3f       	jmp	$-50     	;abs 0xc210

0000c244 <udivmodsi4>:
    c244:	0a 12       	push	r10		;

0000c246 <.LCFI0>:
    c246:	09 12       	push	r9		;

0000c248 <L0^A>:
    c248:	08 12       	push	r8		;

0000c24a <.LCFI2>:
    c24a:	07 12       	push	r7		;

0000c24c <.LCFI3>:
    c24c:	06 12       	push	r6		;

0000c24e <.LCFI4>:
    c24e:	0a 4c       	mov	r12,	r10	;
    c250:	0b 4d       	mov	r13,	r11	;

0000c252 <.LVL1>:
    c252:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

0000c256 <.LVL2>:
    c256:	58 43       	mov.b	#1,	r8	;r3 As==01
    c258:	49 43       	clr.b	r9		;

0000c25a <.L2>:
    c25a:	0f 9b       	cmp	r11,	r15	;
    c25c:	04 28       	jnc	$+10     	;abs 0xc266
    c25e:	0b 9f       	cmp	r15,	r11	;
    c260:	07 20       	jnz	$+16     	;abs 0xc270
    c262:	0e 9a       	cmp	r10,	r14	;
    c264:	05 2c       	jc	$+12     	;abs 0xc270

0000c266 <.L15>:
    c266:	3c 53       	add	#-1,	r12	;r3 As==11

0000c268 <.Loc.38.1>:
    c268:	0c 93       	cmp	#0,	r12	;r3 As==00
    c26a:	2c 24       	jz	$+90     	;abs 0xc2c4

0000c26c <.Loc.38.1>:
    c26c:	0f 93       	cmp	#0,	r15	;r3 As==00
    c26e:	0c 34       	jge	$+26     	;abs 0xc288

0000c270 <.L13>:
    c270:	4c 43       	clr.b	r12		;
    c272:	4d 43       	clr.b	r13		;

0000c274 <.L8>:
    c274:	07 48       	mov	r8,	r7	;
    c276:	07 d9       	bis	r9,	r7	;
    c278:	07 93       	cmp	#0,	r7	;r3 As==00
    c27a:	13 20       	jnz	$+40     	;abs 0xc2a2

0000c27c <.L5>:
    c27c:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
    c280:	02 24       	jz	$+6      	;abs 0xc286
    c282:	0c 4a       	mov	r10,	r12	;
    c284:	0d 4b       	mov	r11,	r13	;

0000c286 <.L1>:
    c286:	2a 3c       	jmp	$+86     	;abs 0xc2dc

0000c288 <.L6>:
    c288:	06 4e       	mov	r14,	r6	;
    c28a:	07 4f       	mov	r15,	r7	;
    c28c:	06 5e       	add	r14,	r6	;
    c28e:	07 6f       	addc	r15,	r7	;
    c290:	0e 46       	mov	r6,	r14	;

0000c292 <.LVL7>:
    c292:	0f 47       	mov	r7,	r15	;

0000c294 <.LVL8>:
    c294:	06 48       	mov	r8,	r6	;
    c296:	07 49       	mov	r9,	r7	;
    c298:	06 58       	add	r8,	r6	;
    c29a:	07 69       	addc	r9,	r7	;
    c29c:	08 46       	mov	r6,	r8	;

0000c29e <.LVL9>:
    c29e:	09 47       	mov	r7,	r9	;

0000c2a0 <.LVL10>:
    c2a0:	dc 3f       	jmp	$-70     	;abs 0xc25a

0000c2a2 <.L11>:
    c2a2:	0b 9f       	cmp	r15,	r11	;
    c2a4:	08 28       	jnc	$+18     	;abs 0xc2b6
    c2a6:	0f 9b       	cmp	r11,	r15	;
    c2a8:	02 20       	jnz	$+6      	;abs 0xc2ae
    c2aa:	0a 9e       	cmp	r14,	r10	;
    c2ac:	04 28       	jnc	$+10     	;abs 0xc2b6

0000c2ae <.L16>:
    c2ae:	0a 8e       	sub	r14,	r10	;
    c2b0:	0b 7f       	subc	r15,	r11	;

0000c2b2 <.Loc.48.1>:
    c2b2:	0c d8       	bis	r8,	r12	;

0000c2b4 <.LVL13>:
    c2b4:	0d d9       	bis	r9,	r13	;

0000c2b6 <.L9>:
    c2b6:	12 c3       	clrc			
    c2b8:	09 10       	rrc	r9		;
    c2ba:	08 10       	rrc	r8		;

0000c2bc <.Loc.51.1>:
    c2bc:	12 c3       	clrc			
    c2be:	0f 10       	rrc	r15		;
    c2c0:	0e 10       	rrc	r14		;
    c2c2:	d8 3f       	jmp	$-78     	;abs 0xc274

0000c2c4 <.L14>:
    c2c4:	4c 43       	clr.b	r12		;
    c2c6:	4d 43       	clr.b	r13		;
    c2c8:	d9 3f       	jmp	$-76     	;abs 0xc27c

0000c2ca <__mspabi_remul>:
    c2ca:	21 83       	decd	r1		;

0000c2cc <.LCFI22>:
    c2cc:	91 43 00 00 	mov	#1,	0(r1)	;r3 As==01
    c2d0:	
0000c2d2 <L0^A>:
    c2d2:	44 c2       	bic.b	r2,	r4	;

0000c2d4 <.LVL43>:
    c2d4:	21 53       	incd	r1		;

0000c2d6 <.LCFI23>:
    c2d6:	30 41       	ret			

0000c2d8 <__mspabi_func_epilog_7>:
    c2d8:	34 41       	pop	r4		;

0000c2da <__mspabi_func_epilog_6>:
    c2da:	35 41       	pop	r5		;

0000c2dc <__mspabi_func_epilog_5>:
    c2dc:	36 41       	pop	r6		;

0000c2de <__mspabi_func_epilog_4>:
    c2de:	37 41       	pop	r7		;

0000c2e0 <__mspabi_func_epilog_3>:
    c2e0:	38 41       	pop	r8		;

0000c2e2 <__mspabi_func_epilog_2>:
    c2e2:	39 41       	pop	r9		;

0000c2e4 <__mspabi_func_epilog_1>:
    c2e4:	3a 41       	pop	r10		;
    c2e6:	30 41       	ret			
