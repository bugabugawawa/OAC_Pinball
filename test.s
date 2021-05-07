# imports
.include "./Funcoes/prints"
.include "./Funcoes/userInterface"

.data
.include "./Imagens/background.data"
.include "./Imagens/Ball.data"

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
