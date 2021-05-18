# imports
.data
.include "./Funcoes/prints"

.include "./Funcoes/dataImports"
.data
.eqv RAIO 10

.include "./Imagens/Ball.data"

obstaculosPosicao: .word 0xFF014BA1, 0xFF009C72, -1

obstaculosRaio: .word  32, 45, -1
obstaculosVidas: .word  3, 3, -1
# imports

.include "./Funcoes/Fisica/flippers.s"
.include "./Funcoes/EfeitosEspeciais/EfeitosPlanetas.s"
.data


.text
Inicio: 
	#colisao x parede = 5 e 283 
	li s1 150
	li s0 70
	printbitmapEficiente(zero zero background )
	vamola:
	li a0, 4
	li a1, 3
	li s4 0
	li s3 0
	
	#y=275 x=100
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	faddi(fs0 5)
	faddi(fs1 1)
Fim:
	
	
	
	li s9 1
	li t0 1
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
	colidirPlanetas( s8, obstaculosPosicao obstaculosRaio obstaculosVidas s9 fs0 fs1)
	j continua2
	continua2:
	flipperBate(470, 180,450,224, s0, s1, fs0, fs1, 15)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	mv s9, a0
	#beq s9, t0, colidiu
	move(fs0, fs1 s0 s1)
	gravidade(fs0, s0, 1, 25)
	perdaEnergia(fs0, 995, 1000)
	perdaEnergia(fs1, 995, 1000)
	#li s11 4
	#rem s11 s1, s11
	#sub s11 s1 s11
	printbitmap(s1 s0 Ball )
	continua:
	
	
	
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	
	
Fim2:
	j Fim
colidiu:
printFloatln(fs0)
fcvt.w.s t0, fs0
printint(t0)
printFloatln(fs1)
fcvt.w.s t0, fs1
printint(t0)
 li a7 10
 ecall




