

.macro matarbola(%bolay %bolax %vy %vx)
mv t0 %bolay
li t1 445
ble   t1 %bolay matarbola
li t1 10
ble  %bolay t1 matarbola
li a0 0
j fim
matarbola:

	li s11 4
	rem s11 %bolax, s11
	sub s11 %bolax s11
	printbitmapClean(s11 %bolay 24 24 background)
	lw t0 contagemBolas
	addi t0 t0 -1
	addi sp sp -8
	sw s4 4(sp)
	sw s3 0(sp)
	
	
	
	sw t0 contagemBolas t1
	printbitmapEficiente (zero zero background)
	alterScoreP1()
	alterScoreP2()
	mv s3 t0
	mv s4 t0	
	alterScoreBOLAS( )
	mv t0 s3
	
	
	
	lw s4 4(sp)
	lw s3 0(sp)
	addi sp sp 8
	
	
	ble t0 zero fimdejogo
	j spawnarbola

fimdejogo:

j stage2


j fim

spawnarbola:
li %bolay 220
li %bolax 24
li t0 2
li %bolay 200
li %bolax 24
li t0 5000
printGif( %bolax %bolay explosion31 6 t0 )
mv a2 %bolax
mv a3 %bolay
li a4 110
li a5 110
printbitmapClean(%bolax %bolay 108 108 background)

printarPlanetas(obstaculosPosicao  obstaculosRaio obstaculosX obstaculosY obstaculosVidas)
faddi(%vy -3)
faddi(%vx 3)
j fim
fim:


.end_macro


.macro matarbola2(%bolay %bolax %vy %vx)
mv t0 %bolay
li t1 445
ble   t1 %bolay matarbola2
li t1 10
ble  %bolay t1 matarbola2 # funcao matar bola 22
li a0 0
j fim22
matarbola2:

	li s11 4
	rem s11 %bolax, s11
	sub s11 %bolax s11# funcao matar bola 22
	printbitmapClean(s11 %bolay 24 24 background1) 
	lw t0 contagemBolas1# funcao matar bola 22
	addi t0 t0 -1
	addi sp sp -8
	sw s4 4(sp)
	sw s3 0(sp)
	
	
	
	sw t0 contagemBolas t1
	printbitmapEficiente (zero zero background1)
	alterScoreP1()
	alterScoreP2()
	mv s3 t0
	mv s4 t0	
	alterScoreBOLAS( )
	mv t0 s3
	
	
	
	lw s4 4(sp)
	lw s3 0(sp)
	addi sp sp 8
	
	
	
	
	ble t0 zero fimdejogo2
	
	j spawnarbola2

fimdejogo2:


li a7 50
la a0 fimdejogopopup
ecall
li a7 10
ecall
j fim22

spawnarbola2:
li %bolay 220
li %bolax 24
li t0 2
li %bolay 200
li %bolax 24
li t0 5000
printGif( %bolax %bolay explosion31 6 t0 )
mv a2 %bolax
mv a3 %bolay
li a4 110
li a5 110
printbitmapClean(%bolax %bolay 108 108 background1)
printbitmapEficiente(zero zero background1)

alterScoreP1()
alterScoreP2()

alterScoreBOLAS( )
printarPlanetas( obstaculosPosicao1  obstaculosRaio1 obstaculosX1 obstaculosY1 obstaculosVidas1 )
faddi(%vy -3)
faddi(%vx 3)
j fim22
fim22:


.end_macro

