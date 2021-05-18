.macro superFuncaoColisao( %obstaculosPosicao %obstaculosRaio %obstaculosVidas %playerColidiu %vy %vx %bolay %bolax)
addi sp, sp,-100
sw s0,0(sp)
sw s1,4(sp)
sw s2,8(sp)
sw s3,12(sp)
sw s4,16(sp)
sw s5,20(sp)
sw s6, 24(sp)
sw s7, 28(sp)
sw s8, 32(sp)
sw s9 36(sp)
sw s10 40(sp)
sw s11 44(sp)
fsw fs0,48(sp)
fsw fs1, 52(sp)
fsw fs2, 56(sp)
fsw fs3, 60(sp)
fsw fs4, 64(sp)
fsw fs5, 68(sp)
fsw fs6, 72(sp)
fsw fs7, 76(sp)
fsw fs8, 80(sp)
fsw fs9 84(sp)
fsw fs10, 88(sp)
fsw fs11, 92(sp)
	fmv.s fs0 %vy
	fmv.s fs1 %vx
	mv s0 %bolay
	mv s1 %bolax
	mv s9 %playerColidiu
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	
	
	
	colidirDiagonal(114, 11,0,103 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(99,304 ,0 ,208 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(480,116 ,390 ,16 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(480, 210 ,395 ,306 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	
	
	checkColisaoParedes( s0, s1, fs0, fs1 )
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirPlanetas( s8, %obstaculosPosicao %obstaculosRaio %obstaculosVidas s9 fs0 fs1)
	
	j continua2
	continua2:
	flipperBate(470, 180,450,224, s0, s1, fs0, fs1, 15)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	
fmv.s fa0 fs0
fmv.s fa1 fs1
mv a0 s9
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)
lw s3,12(sp)
lw s4,16(sp)
lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
lw s8, 32(sp)
lw s9 36(sp)
lw s10 40(sp)
lw s11 44(sp)
flw fs0,48(sp)
flw fs1, 52(sp)
flw fs2, 56(sp)
flw fs3, 60(sp)
flw fs4, 64(sp)
flw fs5, 68(sp)
flw fs6, 72(sp)
flw fs7, 76(sp)
flw fs8, 80(sp)
flw fs9 84(sp)
flw fs10, 88(sp)
flw fs11, 92(sp)

addi sp, sp, 100
	
.end_macro	