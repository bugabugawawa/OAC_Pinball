.data 
.include "./colisaoDiagonais.s"
fliperamos: .string "BATEMO NESSE CARALHO DE FLIPPER\n"
#retorna em a1 qual player bateu no flipper, velocidades sempre no msm retorno
.macro flipperBate(%y1, %x1,%y0,%x0, )
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
addi t0, %ybola, RAIO
addi t1, %xbola, RAIO
addi s10, %ybola, RAIO #s10 = ybola
addi s11, %xbola, RAIO #s11 = xbola


faddi(ft0, %y1)
faddi(ft1,%x1)
faddi(ft2,%y0)
faddi(ft3,%x0)
fsub.s ft4, ft0,ft2  #delta y
fsub.s ft5, ft1,ft3 #delta x
fmul.s ft6, ft4,ft4  #ft6 = y^2
fmul.s ft7, ft5, ft5 #ft7 = x^2
fadd.s ft8, ft6,ft7 # ft8 = hip^2
fsqrt.s ft8,ft8 # ft8 = hipotenusa = raio flipper
fcvt.w.s s8 ft8 #s8 = raio flipper em int
li t5 %y0
li t6 %x0
sub s0 t0 t5 #delta y bola raio
sub s1 t1 t6 #delta x bola raio
mul s0 s0 s0
mul s1 s1 s1
add s0 s1 s0 #s0 = distancia entre bola e flipper ao quadrado

acharSenCos( t0 t1 t5, t6)
fmv.s fs11 fa1
fmv.s fs10 fa0
fcvt.s.w ft0 s0
fsqrt.s ft0 ft0
fcvt.w.s s0 ft0 #s0 = distancia entre bola raio

addi t0, s8, RAIO #t0 = raio bola + raio flipper
ble s0 t0 bateumano

j fimnaocolidiu
bateumano:
	printStringln(fliperamos)
	
	
	
	faddi(fs3 %forca)
	faddi(fs4 1)
	fmul.s ft11 fs11 fs11 #ft11 = cos^2
	fmul.s ft10 fs10 fs10 #ft10 = sen^2
	fdiv.s ft11 ft11 ft10   #ft11 = (cos^2)/sen^2
	printFloatln(ft11)
	fadd.s ft11 fs4 ft11  #ft11 = 1+ (cos^2)/sen^2
	printFloatln(ft11)
	fsqrt.s ft11 ft11 #magia negra so aceita pai 
	printFloatln(ft11)
	fdiv.s fs1 fs3 ft11 # vx = forca/essa raiz ai . Explicacao: magia negra so aceita pai
	fdiv.s ft0 fs11 fs10 #cos/sen
	faddi(fs5 -1)
	fmul.s fs0 ft0 fs1
	fmul.s fs0 fs5 fs0
	
	
	corrigey( s10 fs0)
	
	printFloatln(fs0)
	printFloatln(fs1)
	
	fmv.s fa0 fs0
	fmv.s fa1 fs1
	
	j fimcolidiu
	#ble s0 s8 bateuforte # se o centro da bola ta no circulo do flipper, bate forte
	
	

fimcolidiu:
fmv.s fa0 fs0
fmv.s fa1 fs1
add a1 a1 zero
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
j end

fimnaocolidiu:
fmv.s fa0, %vybola
fmv.s fa1, %vxbola

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
j end

end:

.end_macro




.macro corrigey(%bolay,%vy)
addi sp, sp,-100
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
fsw ft0, 12(sp)
fsw ft1, 16(sp)
fsw ft2, 20(sp)
faddi(ft0 -1)
li t0 240
ble %bolay t0 emcima
j embaixo
emcima:
fabs.s %vy, %vy
li a1 1
j fim
embaixo:
fabs.s %vy, %vy
fmul.s %vy %vy ft0
li a1 2
j fim
fim:


lw t0, 0(sp)
lw t1, 4(sp)
lw t2, 8(sp)
flw ft0, 12(sp)
flw ft1, 16(sp)
flw ft2, 20(sp)
addi sp, sp,100
.end_macro
