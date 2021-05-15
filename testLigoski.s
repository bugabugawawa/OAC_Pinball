# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
.include "./Funcoes/userInterface"
.include "./Funcoes/backend"

.text
Inicio:
	li s1 100
	li s0 80
	
	#mv s9 seis
	
	#lw s9 
	
	#lw t0 um
	
	#printbitmap( zero zero background )
	Fim:
	li a6 500
	jal choose
	alterScore( playerOneScore )
	printbitmapEficiente( zero zero background )
#	printbitmapEficiente( zero zero cinco )
	#printbitmapEficiente( zero zero zerow )
	#alterScore( zerow playerOneScore )
	
#	alterScore

	#checar colisao
	#addi s0 s0 1
	#printbitmap(s1 s0 Ball)
	#j Fim
	li a7 10
	ecall

choose:
	num2img( a6 100 )
