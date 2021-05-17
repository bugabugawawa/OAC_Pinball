.data 
.include "./colisaoDiagonais.s"

.macro flipperBate(%y1, %x1,%y0,%x0, %ybola, %xbola, %vybola, %vxbola, %forca)
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
addi s10, %ybola, RAIO
addi s11, %xbola, RAIO


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
fdiv.s fs11, ft5, ft8 #fs11 = cos
fdiv.s fs10, ft4, ft8 #fs10 = sen
fcvt.w.s s8 ft8 #s8 = raio flipper em int
sub s0 t0 %y0
sub s1 t1 %x0
mul s0 s0 s0
mul s1 s1 s1
add s0 s1 s0 #s0 = distancia entre bola e flipper ao quadrado
fcvt.s.w ft0 s0
fsqrt.s ft0 ft0
fcvt.w.s s0 ft0 #s0 = distancia entre bola raio

addi t0, s8, RAIO #t0 = raio bola + raio flipper
ble s0 t0 bateumano

j fimnaobateu
bateumano:
	faddi(fs3 %forca)
	faddi(fs0 1)
	fmul.s ft11 fs11 fs11 #ft11 = cos^2
	fmul.s ft ft10 fs10 fs10 #ft10 = sen^2
	fdiv.s ft11 ft11 ft10   #ft11 = (cos^2)/sen^2
	fsub,s ft11 fs0 ft11  #ft11 = 1- (cos^2)/sen^2

	#ble s0 s8 bateuforte # se o centro da bola ta no circulo do flipper, bate forte
	
	



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