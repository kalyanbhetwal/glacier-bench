
target/msp430-none-elf/release/message_queue:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 b2 c1 	call	#-15950	;#0xc1b2
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
    c020:	d4 44 ec c2 	mov.b	-15636(r4),7826(r4);0xffffc2ec, 0x1e92
    c024:	92 1e 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	05 12       	push	r5		;
    c02e:	06 12       	push	r6		;
    c030:	07 12       	push	r7		;
    c032:	08 12       	push	r8		;
    c034:	09 12       	push	r9		;
    c036:	0a 12       	push	r10		;
    c038:	0c 43       	clr	r12		;
    c03a:	cc 43 00 1c 	mov.b	#0,	7168(r12);r3 As==00, 0x1c00
    c03e:	8c 43 04 1c 	mov	#0,	7172(r12);r3 As==00, 0x1c04
    c042:	8c 43 02 1c 	mov	#0,	7170(r12);r3 As==00, 0x1c02
    c046:	8c 43 08 1c 	mov	#0,	7176(r12);r3 As==00, 0x1c08
    c04a:	8c 43 06 1c 	mov	#0,	7174(r12);r3 As==00, 0x1c06
    c04e:	3c 50 0a 00 	add	#10,	r12	;#0x000a
    c052:	3c 90 80 02 	cmp	#640,	r12	;#0x0280
    c056:	f1 23       	jnz	$-28     	;abs 0xc03a
    c058:	82 43 80 1e 	mov	#0,	&0x1e80	;r3 As==00
    c05c:	82 43 82 1e 	mov	#0,	&0x1e82	;r3 As==00
    c060:	82 43 84 1e 	mov	#0,	&0x1e84	;r3 As==00
    c064:	82 43 88 1e 	mov	#0,	&0x1e88	;r3 As==00
    c068:	82 43 86 1e 	mov	#0,	&0x1e86	;r3 As==00
    c06c:	82 43 8c 1e 	mov	#0,	&0x1e8c	;r3 As==00
    c070:	82 43 8a 1e 	mov	#0,	&0x1e8a	;r3 As==00
    c074:	82 43 90 1e 	mov	#0,	&0x1e90	;r3 As==00
    c078:	82 43 8e 1e 	mov	#0,	&0x1e8e	;r3 As==00
    c07c:	19 42 8e 1e 	mov	&0x1e8e,r9	;0x1e8e
    c080:	1a 42 90 1e 	mov	&0x1e90,r10	;0x1e90
    c084:	0c 49       	mov	r9,	r12	;
    c086:	0d 4a       	mov	r10,	r13	;
    c088:	3e 40 05 00 	mov	#5,	r14	;
    c08c:	0f 43       	clr	r15		;
    c08e:	b0 12 c8 c2 	call	#-15672	;#0xc2c8
    c092:	08 4c       	mov	r12,	r8	;
    c094:	0c 49       	mov	r9,	r12	;
    c096:	0d 4a       	mov	r10,	r13	;
    c098:	3e 40 e8 03 	mov	#1000,	r14	;#0x03e8
    c09c:	0f 43       	clr	r15		;
    c09e:	b0 12 b6 c1 	call	#-15946	;#0xc1b6
    c0a2:	06 4c       	mov	r12,	r6	;
    c0a4:	05 4d       	mov	r13,	r5	;
    c0a6:	1c 42 84 1e 	mov	&0x1e84,r12	;0x1e84
    c0aa:	3c 90 40 00 	cmp	#64,	r12	;#0x0040
    c0ae:	26 2c       	jc	$+78     	;abs 0xc0fc
    c0b0:	17 42 82 1e 	mov	&0x1e82,r7	;0x1e82
    c0b4:	37 90 40 00 	cmp	#64,	r7	;#0x0040
    c0b8:	71 2c       	jc	$+228    	;abs 0xc19c
    c0ba:	0c 47       	mov	r7,	r12	;
    c0bc:	3d 40 0a 00 	mov	#10,	r13	;#0x000a
    c0c0:	b0 12 00 c2 	call	#-15872	;#0xc200
    c0c4:	cc 48 00 1c 	mov.b	r8,	7168(r12); 0x1c00
    c0c8:	8c 45 04 1c 	mov	r5,	7172(r12); 0x1c04
    c0cc:	8c 46 02 1c 	mov	r6,	7170(r12); 0x1c02
    c0d0:	8c 4a 08 1c 	mov	r10,	7176(r12); 0x1c08
    c0d4:	8c 49 06 1c 	mov	r9,	7174(r12); 0x1c06
    c0d8:	17 53       	inc	r7		;
    c0da:	37 f0 3f 00 	and	#63,	r7	;#0x003f
    c0de:	82 47 82 1e 	mov	r7,	&0x1e82	;
    c0e2:	92 53 84 1e 	inc	&0x1e84		;
    c0e6:	1c 43       	mov	#1,	r12	;r3 As==01
    c0e8:	1c 52 86 1e 	add	&0x1e86,r12	;0x1e86
    c0ec:	0c 93       	cmp	#0,	r12	;r3 As==00
    c0ee:	0d 42       	mov	r2,	r13	;
    c0f0:	0d 11       	rra	r13		;
    c0f2:	1d f3       	and	#1,	r13	;r3 As==01
    c0f4:	82 5d 88 1e 	add	r13,	&0x1e88	;
    c0f8:	82 4c 86 1e 	mov	r12,	&0x1e86	;
    c0fc:	0c 49       	mov	r9,	r12	;
    c0fe:	0d 4a       	mov	r10,	r13	;
    c100:	3e 40 ab aa 	mov	#-21845,r14	;#0xaaab
    c104:	3f 40 aa aa 	mov	#-21846,r15	;#0xaaaa
    c108:	b0 12 b6 c1 	call	#-15946	;#0xc1b6
    c10c:	3d 90 56 55 	cmp	#21846,	r13	;#0x5556
    c110:	0e 42       	mov	r2,	r14	;
    c112:	3c 90 56 55 	cmp	#21846,	r12	;#0x5556
    c116:	0c 42       	mov	r2,	r12	;
    c118:	3d 90 55 55 	cmp	#21845,	r13	;#0x5555
    c11c:	03 24       	jz	$+8      	;abs 0xc124
    c11e:	1e f3       	and	#1,	r14	;r3 As==01
    c120:	0c 4e       	mov	r14,	r12	;
    c122:	01 3c       	jmp	$+4      	;abs 0xc126
    c124:	1c f3       	and	#1,	r12	;r3 As==01
    c126:	1d 42 84 1e 	mov	&0x1e84,r13	;0x1e84
    c12a:	1c b3       	bit	#1,	r12	;r3 As==01
    c12c:	2b 20       	jnz	$+88     	;abs 0xc184
    c12e:	0d 93       	cmp	#0,	r13	;r3 As==00
    c130:	29 24       	jz	$+84     	;abs 0xc184
    c132:	82 93 84 1e 	cmp	#0,	&0x1e84	;r3 As==00
    c136:	26 24       	jz	$+78     	;abs 0xc184
    c138:	18 42 80 1e 	mov	&0x1e80,r8	;0x1e80
    c13c:	38 90 40 00 	cmp	#64,	r8	;#0x0040
    c140:	30 2c       	jc	$+98     	;abs 0xc1a2
    c142:	0c 48       	mov	r8,	r12	;
    c144:	3d 40 0a 00 	mov	#10,	r13	;#0x000a
    c148:	b0 12 00 c2 	call	#-15872	;#0xc200
    c14c:	5d 4c 00 1c 	mov.b	7168(r12),r13	;0x01c00
    c150:	1d 4c 04 1c 	mov	7172(r12),r13	;0x01c04
    c154:	1d 4c 02 1c 	mov	7170(r12),r13	;0x01c02
    c158:	1d 4c 08 1c 	mov	7176(r12),r13	;0x01c08
    c15c:	1c 4c 06 1c 	mov	7174(r12),r12	;0x01c06
    c160:	18 53       	inc	r8		;
    c162:	38 f0 3f 00 	and	#63,	r8	;#0x003f
    c166:	82 48 80 1e 	mov	r8,	&0x1e80	;
    c16a:	b2 53 84 1e 	add	#-1,	&0x1e84	;r3 As==11
    c16e:	1c 43       	mov	#1,	r12	;r3 As==01
    c170:	1c 52 8a 1e 	add	&0x1e8a,r12	;0x1e8a
    c174:	0c 93       	cmp	#0,	r12	;r3 As==00
    c176:	0d 42       	mov	r2,	r13	;
    c178:	0d 11       	rra	r13		;
    c17a:	1d f3       	and	#1,	r13	;r3 As==01
    c17c:	82 5d 8c 1e 	add	r13,	&0x1e8c	;
    c180:	82 4c 8a 1e 	mov	r12,	&0x1e8a	;
    c184:	19 53       	inc	r9		;
    c186:	82 49 8e 1e 	mov	r9,	&0x1e8e	;
    c18a:	09 93       	cmp	#0,	r9	;r3 As==00
    c18c:	0c 42       	mov	r2,	r12	;
    c18e:	0c 11       	rra	r12		;
    c190:	1c f3       	and	#1,	r12	;r3 As==01
    c192:	0a 5c       	add	r12,	r10	;
    c194:	82 4a 90 1e 	mov	r10,	&0x1e90	;
    c198:	03 43       	nop			
    c19a:	70 3f       	jmp	$-286    	;abs 0xc07c
    c19c:	0c 47       	mov	r7,	r12	;
    c19e:	b0 12 a8 c1 	call	#-15960	;#0xc1a8
    c1a2:	0c 48       	mov	r8,	r12	;
    c1a4:	b0 12 a8 c1 	call	#-15960	;#0xc1a8

0000c1a8 <_ZN4core9panicking18panic_bounds_check17ha61b0f5d4cffb333E>:
    c1a8:	b0 12 ac c1 	call	#-15956	;#0xc1ac

0000c1ac <_ZN4core9panicking9panic_fmt17hb4e8523a0c852053E>:
    c1ac:	32 c2       	dint			
    c1ae:	03 43       	nop			
    c1b0:	ff 3f       	jmp	$+0      	;abs 0xc1b0

0000c1b2 <PreInit_>:
    c1b2:	30 41       	ret			

0000c1b4 <DefaultHandler_>:
    c1b4:	ff 3f       	jmp	$+0      	;abs 0xc1b4

0000c1b6 <__mspabi_mpyl>:
    c1b6:	0a 12       	push	r10		;

0000c1b8 <.LCFI10>:
    c1b8:	09 12       	push	r9		;

0000c1ba <.LCFI11>:
    c1ba:	08 12       	push	r8		;

0000c1bc <.LCFI12>:
    c1bc:	07 12       	push	r7		;

0000c1be <.LCFI13>:
    c1be:	06 12       	push	r6		;

0000c1c0 <.LCFI14>:
    c1c0:	0a 4c       	mov	r12,	r10	;
    c1c2:	0b 4d       	mov	r13,	r11	;

0000c1c4 <.LVL27>:
    c1c4:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c1c8 <.Loc.30.2>:
    c1c8:	4c 43       	clr.b	r12		;

0000c1ca <.LVL28>:
    c1ca:	4d 43       	clr.b	r13		;

0000c1cc <.L6>:
    c1cc:	09 4e       	mov	r14,	r9	;
    c1ce:	09 df       	bis	r15,	r9	;
    c1d0:	09 93       	cmp	#0,	r9	;r3 As==00
    c1d2:	05 24       	jz	$+12     	;abs 0xc1de
    c1d4:	49 48       	mov.b	r8,	r9	;
    c1d6:	79 53       	add.b	#-1,	r9	;r3 As==11
    c1d8:	48 49       	mov.b	r9,	r8	;

0000c1da <.LVL30>:
    c1da:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c1dc:	01 20       	jnz	$+4      	;abs 0xc1e0

0000c1de <.L5>:
    c1de:	7d 3c       	jmp	$+252    	;abs 0xc2da

0000c1e0 <.L10>:
    c1e0:	09 4e       	mov	r14,	r9	;
    c1e2:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c1e4 <.Loc.36.2>:
    c1e4:	09 93       	cmp	#0,	r9	;r3 As==00
    c1e6:	02 24       	jz	$+6      	;abs 0xc1ec

0000c1e8 <.Loc.37.2>:
    c1e8:	0c 5a       	add	r10,	r12	;

0000c1ea <.LVL31>:
    c1ea:	0d 6b       	addc	r11,	r13	;

0000c1ec <.L7>:
    c1ec:	06 4a       	mov	r10,	r6	;
    c1ee:	07 4b       	mov	r11,	r7	;
    c1f0:	06 5a       	add	r10,	r6	;
    c1f2:	07 6b       	addc	r11,	r7	;
    c1f4:	0a 46       	mov	r6,	r10	;

0000c1f6 <.LVL33>:
    c1f6:	0b 47       	mov	r7,	r11	;

0000c1f8 <.LVL34>:
    c1f8:	12 c3       	clrc			
    c1fa:	0f 10       	rrc	r15		;
    c1fc:	0e 10       	rrc	r14		;

0000c1fe <.LVL35>:
    c1fe:	e6 3f       	jmp	$-50     	;abs 0xc1cc

0000c200 <__mspabi_mpyi>:
    c200:	0a 12       	push	r10		;

0000c202 <.LCFI0>:
    c202:	0e 4c       	mov	r12,	r14	;

0000c204 <L0^A>:
    c204:	4f 43       	clr.b	r15		;

0000c206 <.Loc.11.1>:
    c206:	0d 93       	cmp	#0,	r13	;r3 As==00
    c208:	04 34       	jge	$+10     	;abs 0xc212

0000c20a <.Loc.13.1>:
    c20a:	4c 43       	clr.b	r12		;

0000c20c <.LVL2>:
    c20c:	0c 8d       	sub	r13,	r12	;
    c20e:	0d 4c       	mov	r12,	r13	;

0000c210 <.LVL3>:
    c210:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c212 <.L2>:
    c212:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c216 <.Loc.9.1>:
    c216:	4c 43       	clr.b	r12		;

0000c218 <.L3>:
    c218:	0d 93       	cmp	#0,	r13	;r3 As==00
    c21a:	04 20       	jnz	$+10     	;abs 0xc224

0000c21c <.L9>:
    c21c:	0f 93       	cmp	#0,	r15	;r3 As==00
    c21e:	0d 20       	jnz	$+28     	;abs 0xc23a

0000c220 <.L1>:
    c220:	3a 41       	pop	r10		;

0000c222 <.LCFI1>:
    c222:	30 41       	ret			

0000c224 <.L5>:
    c224:	4b 4a       	mov.b	r10,	r11	;
    c226:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c228:	4a 4b       	mov.b	r11,	r10	;

0000c22a <.LVL9>:
    c22a:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c22c:	f7 27       	jz	$-16     	;abs 0xc21c

0000c22e <.Loc.19.1>:
    c22e:	1d b3       	bit	#1,	r13	;r3 As==01
    c230:	01 24       	jz	$+4      	;abs 0xc234

0000c232 <.Loc.20.1>:
    c232:	0c 5e       	add	r14,	r12	;

0000c234 <.L4>:
    c234:	0e 5e       	rla	r14		;

0000c236 <.Loc.22.1>:
    c236:	0d 11       	rra	r13		;

0000c238 <.Loc.17.1>:
    c238:	ef 3f       	jmp	$-32     	;abs 0xc218

0000c23a <.L6>:
    c23a:	4d 43       	clr.b	r13		;

0000c23c <.LVL13>:
    c23c:	0d 8c       	sub	r12,	r13	;
    c23e:	0c 4d       	mov	r13,	r12	;

0000c240 <.LVL14>:
    c240:	ef 3f       	jmp	$-32     	;abs 0xc220

0000c242 <udivmodsi4>:
    c242:	0a 12       	push	r10		;

0000c244 <.LCFI0>:
    c244:	09 12       	push	r9		;

0000c246 <L0^A>:
    c246:	08 12       	push	r8		;

0000c248 <.LCFI2>:
    c248:	07 12       	push	r7		;

0000c24a <.LCFI3>:
    c24a:	06 12       	push	r6		;

0000c24c <.LCFI4>:
    c24c:	0a 4c       	mov	r12,	r10	;
    c24e:	0b 4d       	mov	r13,	r11	;

0000c250 <.LVL1>:
    c250:	7c 40 21 00 	mov.b	#33,	r12	;#0x0021

0000c254 <.LVL2>:
    c254:	58 43       	mov.b	#1,	r8	;r3 As==01
    c256:	49 43       	clr.b	r9		;

0000c258 <.L2>:
    c258:	0f 9b       	cmp	r11,	r15	;
    c25a:	04 28       	jnc	$+10     	;abs 0xc264
    c25c:	0b 9f       	cmp	r15,	r11	;
    c25e:	07 20       	jnz	$+16     	;abs 0xc26e
    c260:	0e 9a       	cmp	r10,	r14	;
    c262:	05 2c       	jc	$+12     	;abs 0xc26e

0000c264 <.L15>:
    c264:	3c 53       	add	#-1,	r12	;r3 As==11

0000c266 <.Loc.38.1>:
    c266:	0c 93       	cmp	#0,	r12	;r3 As==00
    c268:	2c 24       	jz	$+90     	;abs 0xc2c2

0000c26a <.Loc.38.1>:
    c26a:	0f 93       	cmp	#0,	r15	;r3 As==00
    c26c:	0c 34       	jge	$+26     	;abs 0xc286

0000c26e <.L13>:
    c26e:	4c 43       	clr.b	r12		;
    c270:	4d 43       	clr.b	r13		;

0000c272 <.L8>:
    c272:	07 48       	mov	r8,	r7	;
    c274:	07 d9       	bis	r9,	r7	;
    c276:	07 93       	cmp	#0,	r7	;r3 As==00
    c278:	13 20       	jnz	$+40     	;abs 0xc2a0

0000c27a <.L5>:
    c27a:	81 93 0c 00 	cmp	#0,	12(r1)	;r3 As==00, 0x000c
    c27e:	02 24       	jz	$+6      	;abs 0xc284
    c280:	0c 4a       	mov	r10,	r12	;
    c282:	0d 4b       	mov	r11,	r13	;

0000c284 <.L1>:
    c284:	2a 3c       	jmp	$+86     	;abs 0xc2da

0000c286 <.L6>:
    c286:	06 4e       	mov	r14,	r6	;
    c288:	07 4f       	mov	r15,	r7	;
    c28a:	06 5e       	add	r14,	r6	;
    c28c:	07 6f       	addc	r15,	r7	;
    c28e:	0e 46       	mov	r6,	r14	;

0000c290 <.LVL7>:
    c290:	0f 47       	mov	r7,	r15	;

0000c292 <.LVL8>:
    c292:	06 48       	mov	r8,	r6	;
    c294:	07 49       	mov	r9,	r7	;
    c296:	06 58       	add	r8,	r6	;
    c298:	07 69       	addc	r9,	r7	;
    c29a:	08 46       	mov	r6,	r8	;

0000c29c <.LVL9>:
    c29c:	09 47       	mov	r7,	r9	;

0000c29e <.LVL10>:
    c29e:	dc 3f       	jmp	$-70     	;abs 0xc258

0000c2a0 <.L11>:
    c2a0:	0b 9f       	cmp	r15,	r11	;
    c2a2:	08 28       	jnc	$+18     	;abs 0xc2b4
    c2a4:	0f 9b       	cmp	r11,	r15	;
    c2a6:	02 20       	jnz	$+6      	;abs 0xc2ac
    c2a8:	0a 9e       	cmp	r14,	r10	;
    c2aa:	04 28       	jnc	$+10     	;abs 0xc2b4

0000c2ac <.L16>:
    c2ac:	0a 8e       	sub	r14,	r10	;
    c2ae:	0b 7f       	subc	r15,	r11	;

0000c2b0 <.Loc.48.1>:
    c2b0:	0c d8       	bis	r8,	r12	;

0000c2b2 <.LVL13>:
    c2b2:	0d d9       	bis	r9,	r13	;

0000c2b4 <.L9>:
    c2b4:	12 c3       	clrc			
    c2b6:	09 10       	rrc	r9		;
    c2b8:	08 10       	rrc	r8		;

0000c2ba <.Loc.51.1>:
    c2ba:	12 c3       	clrc			
    c2bc:	0f 10       	rrc	r15		;
    c2be:	0e 10       	rrc	r14		;
    c2c0:	d8 3f       	jmp	$-78     	;abs 0xc272

0000c2c2 <.L14>:
    c2c2:	4c 43       	clr.b	r12		;
    c2c4:	4d 43       	clr.b	r13		;
    c2c6:	d9 3f       	jmp	$-76     	;abs 0xc27a

0000c2c8 <__mspabi_remul>:
    c2c8:	21 83       	decd	r1		;

0000c2ca <.LCFI22>:
    c2ca:	91 43 00 00 	mov	#1,	0(r1)	;r3 As==01
    c2ce:	
0000c2d0 <L0^A>:
    c2d0:	42 c2       	bic.b	r2,	r2	;

0000c2d2 <.LVL43>:
    c2d2:	21 53       	incd	r1		;

0000c2d4 <.LCFI23>:
    c2d4:	30 41       	ret			

0000c2d6 <__mspabi_func_epilog_7>:
    c2d6:	34 41       	pop	r4		;

0000c2d8 <__mspabi_func_epilog_6>:
    c2d8:	35 41       	pop	r5		;

0000c2da <__mspabi_func_epilog_5>:
    c2da:	36 41       	pop	r6		;

0000c2dc <__mspabi_func_epilog_4>:
    c2dc:	37 41       	pop	r7		;

0000c2de <__mspabi_func_epilog_3>:
    c2de:	38 41       	pop	r8		;

0000c2e0 <__mspabi_func_epilog_2>:
    c2e0:	39 41       	pop	r9		;

0000c2e2 <__mspabi_func_epilog_1>:
    c2e2:	3a 41       	pop	r10		;
    c2e4:	30 41       	ret			
