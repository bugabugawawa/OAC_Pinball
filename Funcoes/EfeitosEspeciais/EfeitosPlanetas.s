.data
explosion: .string "planeta explodiu"
efeitosEspeciais: .string "Ativaremos os efeitos agr\n"
#RETORNA EM FS0 A VELOCIDADE Y E EM FS1 A VELOCIDADE X

#colidiu planeta e a bool q mostra se colidiu
#planeta e a posicao do vetor dos planetas, ambas vem do colisao.s
.macro efeitosPlanetas(%colidiuplaneta %planeta %vy %vx %vetorPlanetas %vetorPlanetasVidas %ultimoplayer %obstaculosPosicao %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas %background)
addi sp, sp,-100
sw s0,0(sp)
sw s1,4(sp)
sw s2,8(sp)

sw s5,20(sp)
sw s6, 24(sp)
sw s7, 28(sp)

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

mv s0 %planeta
mv t0 %colidiuplaneta
beq t0 zero fimnada #se n colidiu fodase
#printStringln(efeitosEspeciais)
mv t0 %planeta 
la t1 %vetorPlanetasVidas 
add t1 t0 t1 #acha o endereco certo
lw t2 0(t1) 
addi t2, t2 ,-1 #vida-1
sw t2 0(t1) #salva vidas
ble t2 zero matarPlaneta #se acabaram-se as vidas, planetx morre
j efeitos
matarPlaneta:
mv t0 %planeta
la t1 %vetorPlanetas
add t1 t0 t1
mv t2 zero 
sw t2 0(t1)

explodePlanet()
printbitmapEficiente( zero zero background ) 
printarPlanetas(%obstaculosPosicao  %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas)

#alterScoreP1()
#alterScoreP2()
### #clean planeta
j efeitos
j efeitos



efeitos:
li t1 0
li t2 12
li t3 8
beq t0 t3 aumentarscore
beq t0 t2 aumentarvelocidade
beq t0 t0 diminuirscore
j fim
diminuirscore:
li t5 1
beq %ultimoplayer t5 player1scorediminuir
li t5 2
beq %ultimoplayer  t5 player2scorediminuir
j fim
player1scorediminuir:
addi s4 s4 -50
ble zero s4 player1dcontinua
li s4 0
player1dcontinua:
#printbitmapEficiente( zero zero %background)
alterScoreP2()
j fim


player2scorediminuir:
addi s3 s3 -50
ble zero s3 player2dcontinua
li s3 0
player2dcontinua:
#printbitmapEficiente( zero zero %background)
alterScoreP1()
j fim



aumentarscore:
li t5 1
beq %ultimoplayer t5 player1score
li t5 2
beq %ultimoplayer  t5 player2score
j fim
player1score:
addi s4 s4 50
#printbitmapEficiente( zero zero %background)
alterScoreP2()

j fim
player2score:
addi s3 s3 50
#printbitmapEficiente( zero zero %background)
alterScoreP1()
j fim

aumentarvelocidade:
li t5 10
fmul.s ft0 %vy %vy
fmul.s ft1 %vx %vx
faddi(fa0 15)
fadd.s ft0 ft0 ft1
fsqrt.s ft0 ft0
fdiv.s ft0 fa0 ft0
fmul.s fa0 %vy ft0
fmul.s fa1 %vx ft0

j fimvelocidadealterada





fim:
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)

lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
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
fmv.s fa0 %vy
fmv.s fa1 %vx

printarPlanetas(%obstaculosPosicao  %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas)

j end



fimvelocidadealterada:
fmul.s fa0 %vy ft0
fmul.s fa1 %vx ft0
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)

lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
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
printarPlanetas(%obstaculosPosicao  %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas)
j end


fimnada:
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)

lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
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
fmv.s fa0 %vy
fmv.s fa1 %vx



j end

end:

.end_macro
# ver com scotton como selecionar o planeta aqui
.macro explodePlanet()
	li t4 0
	li t5 9
	loop:
	printGif( zero zero explosion1 9 t4 )
	addi t4 t4 1
	addi t5 t5 -1
	bnez t5 loop
.end_macro

.macro colidirPlanetas(  %bolaPosicao %obstaculosPosicao  %obstaculosRaio %obstaculosVidas %ultimoPlayer %vy %vx  %obstaculosPosicao  %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas %background )

	checkColisao( s8, %obstaculosPosicao,%obstaculosRaio, fs0, fs1, RAIO, s9 )
	batemoPai:
	fmv.s %vy, fa0
	fmv.s %vx, fa1
	efeitosPlanetas(a0 a1 fs0 fs1 %obstaculosPosicao  %obstaculosVidas s9  %obstaculosPosicao  %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas %background)
	fmv.s %vy, fa0 
	fmv.s %vx, fa1
.end_macro
