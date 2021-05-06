.data
.include "./Imagens/background.data"
.include "./Imagens/Ball.data"

# imports
.include "./Funcoes/prints"

.text
Inicio:
	li s1 100
	li s0 80
	printbitmap(zero zero background Fim)
Fim:
	#checar colisao
	addi s0 s0 1
	printbitmap(s1 s0 Ball Fim)
Fim2:
	j Fim