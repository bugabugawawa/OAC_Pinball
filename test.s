# imports
.data
.include "./Funcoes/prints"
.include "./Funcoes/userInterface"

.data
.eqv RAIO 10
.include "./Imagens/background.data"
.include "./Imagens/Ball.data"

obstaculosPosicao: .word 0xFF014B97, -12
obstaculosRaio: .word  32, -1
# imports

.include "./Funcoes/Fisica/colisaoTeste.s"
.data
movemos: .string "Movemos e Novo y e esse pai : "
.macro move(%vy, %vx, %y, %x)
fcvt.w.s t0, %vy
fcvt.w.s t1, %vx
add %y, t0, %y
add %x, t1, %x
.end_macro

.text
Inicio: 
	#colisao x parede = 5 e 283 
	li s1 120
	li s0 380
	printbitmap(zero zero background vamola )
	vamola:
	li a0, 4
	li a1, 3
	
	
	#y=275 x=100
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	faddi(fs0 -5)
	faddi(fs1 0)
Fim:
	
	
	
	li s9 0
	li t0 1
	checkColisao( s8, obstaculosPosicao,obstaculosRaio, fs1, fs0, RAIO, s9 )
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	mv s9, a0
	#beq s9, t0, colidiu
	move(fs0, fs1 s0 s1)
	printbitmap(s1 s0 Ball continua )
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


.text
Inicio:
	li s1 100
	li s0 80
	
	printbitmap( zero zero background )
	Fim:
	printbitmapEficiente( zero zero background )
	
	alterScore

	#checar colisao
	#addi s0 s0 1
	#printbitmap(s1 s0 Ball)
	#j Fim

