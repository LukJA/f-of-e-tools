
bubblesort:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00000013          	nop
       4:	00001137          	lui	sp,0x1
       8:	40010113          	addi	sp,sp,1024 # 1400 <bsort_input+0x3c0>
       c:	0040006f          	j	10 <main>

00000010 <main>:
      10:	fa010113          	addi	sp,sp,-96
      14:	04112e23          	sw	ra,92(sp)
      18:	04812c23          	sw	s0,88(sp)
      1c:	06010413          	addi	s0,sp,96
      20:	000027b7          	lui	a5,0x2
      24:	fef42223          	sw	a5,-28(s0)
      28:	fe442783          	lw	a5,-28(s0)
      2c:	0007a023          	sw	zero,0(a5) # 2000 <bsort_input+0xfc0>
      30:	000017b7          	lui	a5,0x1
      34:	fa440713          	addi	a4,s0,-92
      38:	00478793          	addi	a5,a5,4 # 1004 <_etext+0x4>
      3c:	03c00693          	li	a3,60
      40:	00068613          	mv	a2,a3
      44:	00078593          	mv	a1,a5
      48:	00070513          	mv	a0,a4
      4c:	184000ef          	jal	ra,1d0 <memcpy>
      50:	03b00793          	li	a5,59
      54:	fff78793          	addi	a5,a5,-1
      58:	fef42423          	sw	a5,-24(s0)
      5c:	13c0006f          	j	198 <main+0x188>
      60:	fe042623          	sw	zero,-20(s0)
      64:	11c0006f          	j	180 <main+0x170>
      68:	000017b7          	lui	a5,0x1
      6c:	04078713          	addi	a4,a5,64 # 1040 <bsort_input>
      70:	fec42783          	lw	a5,-20(s0)
      74:	00f707b3          	add	a5,a4,a5
      78:	0007c703          	lbu	a4,0(a5)
      7c:	fec42783          	lw	a5,-20(s0)
      80:	00178693          	addi	a3,a5,1
      84:	000017b7          	lui	a5,0x1
      88:	04078793          	addi	a5,a5,64 # 1040 <bsort_input>
      8c:	00f687b3          	add	a5,a3,a5
      90:	0007c783          	lbu	a5,0(a5)
      94:	0ee7f063          	bleu	a4,a5,174 <main+0x164>
      98:	000017b7          	lui	a5,0x1
      9c:	04078713          	addi	a4,a5,64 # 1040 <bsort_input>
      a0:	fec42783          	lw	a5,-20(s0)
      a4:	00f707b3          	add	a5,a4,a5
      a8:	0007c703          	lbu	a4,0(a5)
      ac:	fec42783          	lw	a5,-20(s0)
      b0:	00178693          	addi	a3,a5,1
      b4:	000017b7          	lui	a5,0x1
      b8:	04078793          	addi	a5,a5,64 # 1040 <bsort_input>
      bc:	00f687b3          	add	a5,a3,a5
      c0:	0007c783          	lbu	a5,0(a5)
      c4:	00f747b3          	xor	a5,a4,a5
      c8:	0ff7f713          	andi	a4,a5,255
      cc:	000017b7          	lui	a5,0x1
      d0:	04078693          	addi	a3,a5,64 # 1040 <bsort_input>
      d4:	fec42783          	lw	a5,-20(s0)
      d8:	00f687b3          	add	a5,a3,a5
      dc:	00e78023          	sb	a4,0(a5)
      e0:	fec42783          	lw	a5,-20(s0)
      e4:	00178713          	addi	a4,a5,1
      e8:	000017b7          	lui	a5,0x1
      ec:	04078793          	addi	a5,a5,64 # 1040 <bsort_input>
      f0:	00f707b3          	add	a5,a4,a5
      f4:	0007c703          	lbu	a4,0(a5)
      f8:	000017b7          	lui	a5,0x1
      fc:	04078693          	addi	a3,a5,64 # 1040 <bsort_input>
     100:	fec42783          	lw	a5,-20(s0)
     104:	00f687b3          	add	a5,a3,a5
     108:	0007c783          	lbu	a5,0(a5)
     10c:	fec42683          	lw	a3,-20(s0)
     110:	00168693          	addi	a3,a3,1
     114:	00f747b3          	xor	a5,a4,a5
     118:	0ff7f713          	andi	a4,a5,255
     11c:	000017b7          	lui	a5,0x1
     120:	04078793          	addi	a5,a5,64 # 1040 <bsort_input>
     124:	00f687b3          	add	a5,a3,a5
     128:	00e78023          	sb	a4,0(a5)
     12c:	000017b7          	lui	a5,0x1
     130:	04078713          	addi	a4,a5,64 # 1040 <bsort_input>
     134:	fec42783          	lw	a5,-20(s0)
     138:	00f707b3          	add	a5,a4,a5
     13c:	0007c703          	lbu	a4,0(a5)
     140:	fec42783          	lw	a5,-20(s0)
     144:	00178693          	addi	a3,a5,1
     148:	000017b7          	lui	a5,0x1
     14c:	04078793          	addi	a5,a5,64 # 1040 <bsort_input>
     150:	00f687b3          	add	a5,a3,a5
     154:	0007c783          	lbu	a5,0(a5)
     158:	00f747b3          	xor	a5,a4,a5
     15c:	0ff7f713          	andi	a4,a5,255
     160:	000017b7          	lui	a5,0x1
     164:	04078693          	addi	a3,a5,64 # 1040 <bsort_input>
     168:	fec42783          	lw	a5,-20(s0)
     16c:	00f687b3          	add	a5,a3,a5
     170:	00e78023          	sb	a4,0(a5)
     174:	fec42783          	lw	a5,-20(s0)
     178:	00178793          	addi	a5,a5,1
     17c:	fef42623          	sw	a5,-20(s0)
     180:	fec42703          	lw	a4,-20(s0)
     184:	fe842783          	lw	a5,-24(s0)
     188:	eef740e3          	blt	a4,a5,68 <main+0x58>
     18c:	fe842783          	lw	a5,-24(s0)
     190:	fff78793          	addi	a5,a5,-1
     194:	fef42423          	sw	a5,-24(s0)
     198:	fe842783          	lw	a5,-24(s0)
     19c:	ecf042e3          	bgtz	a5,60 <main+0x50>
     1a0:	fa440793          	addi	a5,s0,-92
     1a4:	00078593          	mv	a1,a5
     1a8:	000017b7          	lui	a5,0x1
     1ac:	04078513          	addi	a0,a5,64 # 1040 <bsort_input>
     1b0:	13c000ef          	jal	ra,2ec <strcmp>
     1b4:	fea42023          	sw	a0,-32(s0)
     1b8:	fe042783          	lw	a5,-32(s0)
     1bc:	fe079ee3          	bnez	a5,1b8 <main+0x1a8>
     1c0:	fe442783          	lw	a5,-28(s0)
     1c4:	0ff00713          	li	a4,255
     1c8:	00e7a023          	sw	a4,0(a5)
     1cc:	fedff06f          	j	1b8 <main+0x1a8>

000001d0 <memcpy>:
     1d0:	00a5c7b3          	xor	a5,a1,a0
     1d4:	0037f793          	andi	a5,a5,3
     1d8:	00c508b3          	add	a7,a0,a2
     1dc:	06079263          	bnez	a5,240 <memcpy+0x70>
     1e0:	00300793          	li	a5,3
     1e4:	04c7fe63          	bleu	a2,a5,240 <memcpy+0x70>
     1e8:	00357793          	andi	a5,a0,3
     1ec:	00050713          	mv	a4,a0
     1f0:	06079863          	bnez	a5,260 <memcpy+0x90>
     1f4:	ffc8f613          	andi	a2,a7,-4
     1f8:	fe060793          	addi	a5,a2,-32
     1fc:	08f76c63          	bltu	a4,a5,294 <memcpy+0xc4>
     200:	02c77c63          	bleu	a2,a4,238 <memcpy+0x68>
     204:	00058693          	mv	a3,a1
     208:	00070793          	mv	a5,a4
     20c:	0006a803          	lw	a6,0(a3)
     210:	00478793          	addi	a5,a5,4
     214:	00468693          	addi	a3,a3,4
     218:	ff07ae23          	sw	a6,-4(a5)
     21c:	fec7e8e3          	bltu	a5,a2,20c <memcpy+0x3c>
     220:	fff60793          	addi	a5,a2,-1
     224:	40e787b3          	sub	a5,a5,a4
     228:	ffc7f793          	andi	a5,a5,-4
     22c:	00478793          	addi	a5,a5,4
     230:	00f70733          	add	a4,a4,a5
     234:	00f585b3          	add	a1,a1,a5
     238:	01176863          	bltu	a4,a7,248 <memcpy+0x78>
     23c:	00008067          	ret
     240:	00050713          	mv	a4,a0
     244:	ff157ce3          	bleu	a7,a0,23c <memcpy+0x6c>
     248:	0005c783          	lbu	a5,0(a1)
     24c:	00170713          	addi	a4,a4,1
     250:	00158593          	addi	a1,a1,1
     254:	fef70fa3          	sb	a5,-1(a4)
     258:	ff1768e3          	bltu	a4,a7,248 <memcpy+0x78>
     25c:	00008067          	ret
     260:	0005c683          	lbu	a3,0(a1)
     264:	00170713          	addi	a4,a4,1
     268:	00377793          	andi	a5,a4,3
     26c:	fed70fa3          	sb	a3,-1(a4)
     270:	00158593          	addi	a1,a1,1
     274:	f80780e3          	beqz	a5,1f4 <memcpy+0x24>
     278:	0005c683          	lbu	a3,0(a1)
     27c:	00170713          	addi	a4,a4,1
     280:	00377793          	andi	a5,a4,3
     284:	fed70fa3          	sb	a3,-1(a4)
     288:	00158593          	addi	a1,a1,1
     28c:	fc079ae3          	bnez	a5,260 <memcpy+0x90>
     290:	f65ff06f          	j	1f4 <memcpy+0x24>
     294:	0005a683          	lw	a3,0(a1)
     298:	0045a283          	lw	t0,4(a1)
     29c:	0085af83          	lw	t6,8(a1)
     2a0:	00c5af03          	lw	t5,12(a1)
     2a4:	0105ae83          	lw	t4,16(a1)
     2a8:	0145ae03          	lw	t3,20(a1)
     2ac:	0185a303          	lw	t1,24(a1)
     2b0:	01c5a803          	lw	a6,28(a1)
     2b4:	02458593          	addi	a1,a1,36
     2b8:	00d72023          	sw	a3,0(a4)
     2bc:	ffc5a683          	lw	a3,-4(a1)
     2c0:	00572223          	sw	t0,4(a4)
     2c4:	01f72423          	sw	t6,8(a4)
     2c8:	01e72623          	sw	t5,12(a4)
     2cc:	01d72823          	sw	t4,16(a4)
     2d0:	01c72a23          	sw	t3,20(a4)
     2d4:	00672c23          	sw	t1,24(a4)
     2d8:	01072e23          	sw	a6,28(a4)
     2dc:	02470713          	addi	a4,a4,36
     2e0:	fed72e23          	sw	a3,-4(a4)
     2e4:	faf768e3          	bltu	a4,a5,294 <memcpy+0xc4>
     2e8:	f19ff06f          	j	200 <memcpy+0x30>

000002ec <strcmp>:
     2ec:	00b56733          	or	a4,a0,a1
     2f0:	fff00393          	li	t2,-1
     2f4:	00377713          	andi	a4,a4,3
     2f8:	10071063          	bnez	a4,3f8 <strcmp+0x10c>
     2fc:	7f7f87b7          	lui	a5,0x7f7f8
     300:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <bsort_input+0x7f7f6f3f>
     304:	00052603          	lw	a2,0(a0)
     308:	0005a683          	lw	a3,0(a1)
     30c:	00f672b3          	and	t0,a2,a5
     310:	00f66333          	or	t1,a2,a5
     314:	00f282b3          	add	t0,t0,a5
     318:	0062e2b3          	or	t0,t0,t1
     31c:	10729263          	bne	t0,t2,420 <strcmp+0x134>
     320:	08d61663          	bne	a2,a3,3ac <strcmp+0xc0>
     324:	00452603          	lw	a2,4(a0)
     328:	0045a683          	lw	a3,4(a1)
     32c:	00f672b3          	and	t0,a2,a5
     330:	00f66333          	or	t1,a2,a5
     334:	00f282b3          	add	t0,t0,a5
     338:	0062e2b3          	or	t0,t0,t1
     33c:	0c729e63          	bne	t0,t2,418 <strcmp+0x12c>
     340:	06d61663          	bne	a2,a3,3ac <strcmp+0xc0>
     344:	00852603          	lw	a2,8(a0)
     348:	0085a683          	lw	a3,8(a1)
     34c:	00f672b3          	and	t0,a2,a5
     350:	00f66333          	or	t1,a2,a5
     354:	00f282b3          	add	t0,t0,a5
     358:	0062e2b3          	or	t0,t0,t1
     35c:	0c729863          	bne	t0,t2,42c <strcmp+0x140>
     360:	04d61663          	bne	a2,a3,3ac <strcmp+0xc0>
     364:	00c52603          	lw	a2,12(a0)
     368:	00c5a683          	lw	a3,12(a1)
     36c:	00f672b3          	and	t0,a2,a5
     370:	00f66333          	or	t1,a2,a5
     374:	00f282b3          	add	t0,t0,a5
     378:	0062e2b3          	or	t0,t0,t1
     37c:	0c729263          	bne	t0,t2,440 <strcmp+0x154>
     380:	02d61663          	bne	a2,a3,3ac <strcmp+0xc0>
     384:	01052603          	lw	a2,16(a0)
     388:	0105a683          	lw	a3,16(a1)
     38c:	00f672b3          	and	t0,a2,a5
     390:	00f66333          	or	t1,a2,a5
     394:	00f282b3          	add	t0,t0,a5
     398:	0062e2b3          	or	t0,t0,t1
     39c:	0a729c63          	bne	t0,t2,454 <strcmp+0x168>
     3a0:	01450513          	addi	a0,a0,20
     3a4:	01458593          	addi	a1,a1,20
     3a8:	f4d60ee3          	beq	a2,a3,304 <strcmp+0x18>
     3ac:	01061713          	slli	a4,a2,0x10
     3b0:	01069793          	slli	a5,a3,0x10
     3b4:	00f71e63          	bne	a4,a5,3d0 <strcmp+0xe4>
     3b8:	01065713          	srli	a4,a2,0x10
     3bc:	0106d793          	srli	a5,a3,0x10
     3c0:	40f70533          	sub	a0,a4,a5
     3c4:	0ff57593          	andi	a1,a0,255
     3c8:	02059063          	bnez	a1,3e8 <strcmp+0xfc>
     3cc:	00008067          	ret
     3d0:	01075713          	srli	a4,a4,0x10
     3d4:	0107d793          	srli	a5,a5,0x10
     3d8:	40f70533          	sub	a0,a4,a5
     3dc:	0ff57593          	andi	a1,a0,255
     3e0:	00059463          	bnez	a1,3e8 <strcmp+0xfc>
     3e4:	00008067          	ret
     3e8:	0ff77713          	andi	a4,a4,255
     3ec:	0ff7f793          	andi	a5,a5,255
     3f0:	40f70533          	sub	a0,a4,a5
     3f4:	00008067          	ret
     3f8:	00054603          	lbu	a2,0(a0)
     3fc:	0005c683          	lbu	a3,0(a1)
     400:	00150513          	addi	a0,a0,1
     404:	00158593          	addi	a1,a1,1
     408:	00d61463          	bne	a2,a3,410 <strcmp+0x124>
     40c:	fe0616e3          	bnez	a2,3f8 <strcmp+0x10c>
     410:	40d60533          	sub	a0,a2,a3
     414:	00008067          	ret
     418:	00450513          	addi	a0,a0,4
     41c:	00458593          	addi	a1,a1,4
     420:	fcd61ce3          	bne	a2,a3,3f8 <strcmp+0x10c>
     424:	00000513          	li	a0,0
     428:	00008067          	ret
     42c:	00850513          	addi	a0,a0,8
     430:	00858593          	addi	a1,a1,8
     434:	fcd612e3          	bne	a2,a3,3f8 <strcmp+0x10c>
     438:	00000513          	li	a0,0
     43c:	00008067          	ret
     440:	00c50513          	addi	a0,a0,12
     444:	00c58593          	addi	a1,a1,12
     448:	fad618e3          	bne	a2,a3,3f8 <strcmp+0x10c>
     44c:	00000513          	li	a0,0
     450:	00008067          	ret
     454:	01050513          	addi	a0,a0,16
     458:	01058593          	addi	a1,a1,16
     45c:	f8d61ee3          	bne	a2,a3,3f8 <strcmp+0x10c>
     460:	00000513          	li	a0,0
     464:	00008067          	ret
	...
