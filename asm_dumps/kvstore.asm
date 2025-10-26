
target/msp430-none-elf/release/kvstore:     file format elf32-msp430


Disassembly of section .text:

0000c000 <Reset>:
    c000:	31 40 00 3c 	mov	#15360,	r1	;#0x3c00
    c004:	b0 12 22 c1 	call	#-16094	;#0xc122
    c008:	04 43       	clr	r4		;

0000c00a <.more_bss>:
    c00a:	14 90 fc 01 	cmp	0x01fc,	r4	;PC rel. 0xc208
    c00e:	04 2c       	jc	$+10     	;abs 0xc018
    c010:	c4 43 00 1c 	mov.b	#0,	7168(r4);r3 As==00, 0x1c00
    c014:	14 53       	inc	r4		;
    c016:	f9 3f       	jmp	$-12     	;abs 0xc00a

0000c018 <.done_bss>:
    c018:	04 43       	clr	r4		;

0000c01a <.more_data>:
    c01a:	14 90 ee 01 	cmp	0x01ee,	r4	;PC rel. 0xc20a
    c01e:	05 2c       	jc	$+12     	;abs 0xc02a
    c020:	d4 44 0c c2 	mov.b	-15860(r4),7430(r4);0xffffc20c, 0x1d06
    c024:	06 1d 
    c026:	14 53       	inc	r4		;
    c028:	f8 3f       	jmp	$-14     	;abs 0xc01a

0000c02a <.done_data>:
    c02a:	00 3c       	jmp	$+2      	;abs 0xc02c

0000c02c <main>:
    c02c:	08 12       	push	r8		;
    c02e:	09 12       	push	r9		;
    c030:	0a 12       	push	r10		;
    c032:	0c 43       	clr	r12		;
    c034:	8c 43 00 1c 	mov	#0,	7168(r12);r3 As==00, 0x1c00
    c038:	8c 43 04 1c 	mov	#0,	7172(r12);r3 As==00, 0x1c04
    c03c:	8c 43 02 1c 	mov	#0,	7170(r12);r3 As==00, 0x1c02
    c040:	cc 43 06 1c 	mov.b	#0,	7174(r12);r3 As==00, 0x1c06
    c044:	3c 52       	add	#8,	r12	;r2 As==11
    c046:	3c 90 00 01 	cmp	#256,	r12	;#0x0100
    c04a:	f4 23       	jnz	$-22     	;abs 0xc034
    c04c:	82 43 02 1d 	mov	#0,	&0x1d02	;r3 As==00
    c050:	82 43 00 1d 	mov	#0,	&0x1d00	;r3 As==00
    c054:	82 43 04 1d 	mov	#0,	&0x1d04	;r3 As==00
    c058:	1a 42 04 1d 	mov	&0x1d04,r10	;0x1d04
    c05c:	0c 4a       	mov	r10,	r12	;
    c05e:	0d 43       	clr	r13		;
    c060:	3e 40 e8 03 	mov	#1000,	r14	;#0x03e8
    c064:	0f 43       	clr	r15		;
    c066:	b0 12 26 c1 	call	#-16090	;#0xc126
    c06a:	09 4c       	mov	r12,	r9	;
    c06c:	39 50 2a 00 	add	#42,	r9	;#0x002a
    c070:	09 9c       	cmp	r12,	r9	;
    c072:	18 43       	mov	#1,	r8	;r3 As==01
    c074:	08 c2       	bic	r2,	r8	;
    c076:	08 5d       	add	r13,	r8	;
    c078:	0c 4a       	mov	r10,	r12	;
    c07a:	3d 40 11 00 	mov	#17,	r13	;#0x0011
    c07e:	b0 12 70 c1 	call	#-16016	;#0xc170
    c082:	3c f0 1f 00 	and	#31,	r12	;#0x001f
    c086:	0d 4c       	mov	r12,	r13	;
    c088:	0e 4d       	mov	r13,	r14	;
    c08a:	0e 5e       	rla	r14		;
    c08c:	0e 5e       	rla	r14		;
    c08e:	0e 5e       	rla	r14		;
    c090:	5f 4e 06 1c 	mov.b	7174(r14),r15	;0x01c06
    c094:	3e 50 00 1c 	add	#7168,	r14	;#0x1c00
    c098:	1f b3       	bit	#1,	r15	;r3 As==01
    c09a:	09 24       	jz	$+20     	;abs 0xc0ae
    c09c:	8e 9a 00 00 	cmp	r10,	0(r14)	;
    c0a0:	0f 24       	jz	$+32     	;abs 0xc0c0
    c0a2:	1d 53       	inc	r13		;
    c0a4:	3d f0 1f 00 	and	#31,	r13	;#0x001f
    c0a8:	0d 9c       	cmp	r12,	r13	;
    c0aa:	ee 23       	jnz	$-34     	;abs 0xc088
    c0ac:	0d 3c       	jmp	$+28     	;abs 0xc0c8
    c0ae:	8e 4a 00 00 	mov	r10,	0(r14)	;
    c0b2:	8e 48 04 00 	mov	r8,	4(r14)	;
    c0b6:	8e 49 02 00 	mov	r9,	2(r14)	;
    c0ba:	de 43 06 00 	mov.b	#1,	6(r14)	;r3 As==01
    c0be:	04 3c       	jmp	$+10     	;abs 0xc0c8
    c0c0:	8e 49 02 00 	mov	r9,	2(r14)	;
    c0c4:	8e 48 04 00 	mov	r8,	4(r14)	;
    c0c8:	0d 4c       	mov	r12,	r13	;
    c0ca:	0e 4d       	mov	r13,	r14	;
    c0cc:	0e 5e       	rla	r14		;
    c0ce:	0e 5e       	rla	r14		;
    c0d0:	0e 5e       	rla	r14		;
    c0d2:	5f 4e 06 1c 	mov.b	7174(r14),r15	;0x01c06
    c0d6:	1f b3       	bit	#1,	r15	;r3 As==01
    c0d8:	0f 24       	jz	$+32     	;abs 0xc0f8
    c0da:	3e 50 00 1c 	add	#7168,	r14	;#0x1c00
    c0de:	8e 9a 00 00 	cmp	r10,	0(r14)	;
    c0e2:	06 24       	jz	$+14     	;abs 0xc0f0
    c0e4:	1d 53       	inc	r13		;
    c0e6:	3d f0 1f 00 	and	#31,	r13	;#0x001f
    c0ea:	0d 9c       	cmp	r12,	r13	;
    c0ec:	ee 23       	jnz	$-34     	;abs 0xc0ca
    c0ee:	04 3c       	jmp	$+10     	;abs 0xc0f8
    c0f0:	1c 4e 04 00 	mov	4(r14),	r12	;
    c0f4:	1c 4e 02 00 	mov	2(r14),	r12	;
    c0f8:	1c 43       	mov	#1,	r12	;r3 As==01
    c0fa:	1c 52 00 1d 	add	&0x1d00,r12	;0x1d00
    c0fe:	0c 93       	cmp	#0,	r12	;r3 As==00
    c100:	0d 42       	mov	r2,	r13	;
    c102:	0d 11       	rra	r13		;
    c104:	1d f3       	and	#1,	r13	;r3 As==01
    c106:	82 5d 02 1d 	add	r13,	&0x1d02	;
    c10a:	82 4c 00 1d 	mov	r12,	&0x1d00	;
    c10e:	1a 53       	inc	r10		;
    c110:	0c 4a       	mov	r10,	r12	;
    c112:	3d 40 64 00 	mov	#100,	r13	;#0x0064
    c116:	b0 12 ee c1 	call	#-15890	;#0xc1ee
    c11a:	82 4c 04 1d 	mov	r12,	&0x1d04	;
    c11e:	03 43       	nop			
    c120:	9b 3f       	jmp	$-200    	;abs 0xc058

0000c122 <PreInit_>:
    c122:	30 41       	ret			

0000c124 <DefaultHandler_>:
    c124:	ff 3f       	jmp	$+0      	;abs 0xc124

0000c126 <__mspabi_mpyl>:
    c126:	0a 12       	push	r10		;

0000c128 <.LCFI10>:
    c128:	09 12       	push	r9		;

0000c12a <.LCFI11>:
    c12a:	08 12       	push	r8		;

0000c12c <.LCFI12>:
    c12c:	07 12       	push	r7		;

0000c12e <.LCFI13>:
    c12e:	06 12       	push	r6		;

0000c130 <.LCFI14>:
    c130:	0a 4c       	mov	r12,	r10	;
    c132:	0b 4d       	mov	r13,	r11	;

0000c134 <.LVL27>:
    c134:	78 40 21 00 	mov.b	#33,	r8	;#0x0021

0000c138 <.Loc.30.2>:
    c138:	4c 43       	clr.b	r12		;

0000c13a <.LVL28>:
    c13a:	4d 43       	clr.b	r13		;

0000c13c <.L6>:
    c13c:	09 4e       	mov	r14,	r9	;
    c13e:	09 df       	bis	r15,	r9	;
    c140:	09 93       	cmp	#0,	r9	;r3 As==00
    c142:	05 24       	jz	$+12     	;abs 0xc14e
    c144:	49 48       	mov.b	r8,	r9	;
    c146:	79 53       	add.b	#-1,	r9	;r3 As==11
    c148:	48 49       	mov.b	r9,	r8	;

0000c14a <.LVL30>:
    c14a:	49 93       	cmp.b	#0,	r9	;r3 As==00
    c14c:	01 20       	jnz	$+4      	;abs 0xc150

0000c14e <.L5>:
    c14e:	55 3c       	jmp	$+172    	;abs 0xc1fa

0000c150 <.L10>:
    c150:	09 4e       	mov	r14,	r9	;
    c152:	59 f3       	and.b	#1,	r9	;r3 As==01

0000c154 <.Loc.36.2>:
    c154:	09 93       	cmp	#0,	r9	;r3 As==00
    c156:	02 24       	jz	$+6      	;abs 0xc15c

0000c158 <.Loc.37.2>:
    c158:	0c 5a       	add	r10,	r12	;

0000c15a <.LVL31>:
    c15a:	0d 6b       	addc	r11,	r13	;

0000c15c <.L7>:
    c15c:	06 4a       	mov	r10,	r6	;
    c15e:	07 4b       	mov	r11,	r7	;
    c160:	06 5a       	add	r10,	r6	;
    c162:	07 6b       	addc	r11,	r7	;
    c164:	0a 46       	mov	r6,	r10	;

0000c166 <.LVL33>:
    c166:	0b 47       	mov	r7,	r11	;

0000c168 <.LVL34>:
    c168:	12 c3       	clrc			
    c16a:	0f 10       	rrc	r15		;
    c16c:	0e 10       	rrc	r14		;

0000c16e <.LVL35>:
    c16e:	e6 3f       	jmp	$-50     	;abs 0xc13c

0000c170 <__mspabi_mpyi>:
    c170:	0a 12       	push	r10		;

0000c172 <.LCFI0>:
    c172:	0e 4c       	mov	r12,	r14	;

0000c174 <L0^A>:
    c174:	4f 43       	clr.b	r15		;

0000c176 <.Loc.11.1>:
    c176:	0d 93       	cmp	#0,	r13	;r3 As==00
    c178:	04 34       	jge	$+10     	;abs 0xc182

0000c17a <.Loc.13.1>:
    c17a:	4c 43       	clr.b	r12		;

0000c17c <.LVL2>:
    c17c:	0c 8d       	sub	r13,	r12	;
    c17e:	0d 4c       	mov	r12,	r13	;

0000c180 <.LVL3>:
    c180:	5f 43       	mov.b	#1,	r15	;r3 As==01

0000c182 <.L2>:
    c182:	7a 40 11 00 	mov.b	#17,	r10	;#0x0011

0000c186 <.Loc.9.1>:
    c186:	4c 43       	clr.b	r12		;

0000c188 <.L3>:
    c188:	0d 93       	cmp	#0,	r13	;r3 As==00
    c18a:	04 20       	jnz	$+10     	;abs 0xc194

0000c18c <.L9>:
    c18c:	0f 93       	cmp	#0,	r15	;r3 As==00
    c18e:	0d 20       	jnz	$+28     	;abs 0xc1aa

0000c190 <.L1>:
    c190:	3a 41       	pop	r10		;

0000c192 <.LCFI1>:
    c192:	30 41       	ret			

0000c194 <.L5>:
    c194:	4b 4a       	mov.b	r10,	r11	;
    c196:	7b 53       	add.b	#-1,	r11	;r3 As==11
    c198:	4a 4b       	mov.b	r11,	r10	;

0000c19a <.LVL9>:
    c19a:	4b 93       	cmp.b	#0,	r11	;r3 As==00
    c19c:	f7 27       	jz	$-16     	;abs 0xc18c

0000c19e <.Loc.19.1>:
    c19e:	1d b3       	bit	#1,	r13	;r3 As==01
    c1a0:	01 24       	jz	$+4      	;abs 0xc1a4

0000c1a2 <.Loc.20.1>:
    c1a2:	0c 5e       	add	r14,	r12	;

0000c1a4 <.L4>:
    c1a4:	0e 5e       	rla	r14		;

0000c1a6 <.Loc.22.1>:
    c1a6:	0d 11       	rra	r13		;

0000c1a8 <.Loc.17.1>:
    c1a8:	ef 3f       	jmp	$-32     	;abs 0xc188

0000c1aa <.L6>:
    c1aa:	4d 43       	clr.b	r13		;

0000c1ac <.LVL13>:
    c1ac:	0d 8c       	sub	r12,	r13	;
    c1ae:	0c 4d       	mov	r13,	r12	;

0000c1b0 <.LVL14>:
    c1b0:	ef 3f       	jmp	$-32     	;abs 0xc190

0000c1b2 <udivmodhi4>:
    c1b2:	0f 4c       	mov	r12,	r15	;

0000c1b4 <.LVL1>:
    c1b4:	
0000c1b6 <L0^A>:
    c1b6:	11 00       	mova	@r0+,	r1	;

0000c1b8 <.LVL2>:
    c1b8:	5b 43       	mov.b	#1,	r11	;r3 As==01

0000c1ba <.L2>:
    c1ba:	0d 9f       	cmp	r15,	r13	;
    c1bc:	05 2c       	jc	$+12     	;abs 0xc1c8
    c1be:	3c 53       	add	#-1,	r12	;r3 As==11

0000c1c0 <.Loc.38.1>:
    c1c0:	0c 93       	cmp	#0,	r12	;r3 As==00
    c1c2:	05 24       	jz	$+12     	;abs 0xc1ce

0000c1c4 <.Loc.38.1>:
    c1c4:	0d 93       	cmp	#0,	r13	;r3 As==00
    c1c6:	07 34       	jge	$+16     	;abs 0xc1d6

0000c1c8 <.L10>:
    c1c8:	4c 43       	clr.b	r12		;

0000c1ca <.L6>:
    c1ca:	0b 93       	cmp	#0,	r11	;r3 As==00
    c1cc:	07 20       	jnz	$+16     	;abs 0xc1dc

0000c1ce <.L4>:
    c1ce:	0e 93       	cmp	#0,	r14	;r3 As==00
    c1d0:	01 24       	jz	$+4      	;abs 0xc1d4
    c1d2:	0c 4f       	mov	r15,	r12	;

0000c1d4 <.L1>:
    c1d4:	30 41       	ret			

0000c1d6 <.L5>:
    c1d6:	0d 5d       	rla	r13		;

0000c1d8 <.Loc.41.1>:
    c1d8:	0b 5b       	rla	r11		;
    c1da:	ef 3f       	jmp	$-32     	;abs 0xc1ba

0000c1dc <.L8>:
    c1dc:	0f 9d       	cmp	r13,	r15	;
    c1de:	02 28       	jnc	$+6      	;abs 0xc1e4

0000c1e0 <.Loc.47.1>:
    c1e0:	0f 8d       	sub	r13,	r15	;

0000c1e2 <.Loc.48.1>:
    c1e2:	0c db       	bis	r11,	r12	;

0000c1e4 <.L7>:
    c1e4:	12 c3       	clrc			
    c1e6:	0b 10       	rrc	r11		;

0000c1e8 <.Loc.51.1>:
    c1e8:	12 c3       	clrc			
    c1ea:	0d 10       	rrc	r13		;
    c1ec:	ee 3f       	jmp	$-34     	;abs 0xc1ca

0000c1ee <__mspabi_remu>:
    c1ee:	5e 43       	mov.b	#1,	r14	;r3 As==01
    c1f0:	
0000c1f2 <L0^A>:
    c1f2:	
0000c1f4 <.LVL37>:
    c1f4:	30 41       	ret			

0000c1f6 <__mspabi_func_epilog_7>:
    c1f6:	34 41       	pop	r4		;

0000c1f8 <__mspabi_func_epilog_6>:
    c1f8:	35 41       	pop	r5		;

0000c1fa <__mspabi_func_epilog_5>:
    c1fa:	36 41       	pop	r6		;

0000c1fc <__mspabi_func_epilog_4>:
    c1fc:	37 41       	pop	r7		;

0000c1fe <__mspabi_func_epilog_3>:
    c1fe:	38 41       	pop	r8		;

0000c200 <__mspabi_func_epilog_2>:
    c200:	39 41       	pop	r9		;

0000c202 <__mspabi_func_epilog_1>:
    c202:	3a 41       	pop	r10		;
    c204:	30 41       	ret			
