.include "./Imagens/background.data"
.include "./Imagens/Ball.data"
.include "./Funcoes/prints"
.include "./Funcoes/Fisica/colisaoTeste.s"
.data
.eqv RAIO 10

obstaculosPosicao: .word 0xFF014B97, -1
obstaculosRaio: .word  32, -1
# imports


movemos: .string "Movemos e Novo y e esse pai : "
.macro move(%vy, %vx, %y, %x)
fcvt.w.s t0, %vy
printFloatln(%vy)
fcvt.w.s t1, %vx
printStringln(movemos)

add %y, t0, %y
add %x, t1, %x
printint(%y)
println()
println()
println()
.end_macro

.text
Inicio: 
	#colisao x parede = 5 e 283 
	li s1 100
	li s0 100
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
	faddi(fs0 5)
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
