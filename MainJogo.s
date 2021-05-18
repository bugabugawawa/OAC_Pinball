# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
.include "./Funcoes/Menu"
#.include "./Funcoes/userInterface"
#.include "./Funcoes/backend"

.text
Inicio:
	
	startMenu()
	drawMenu()
	
	li a7 10
	ecall


# Declaração de funções necessárias
subir: upSelected(s2)
descer: downSelected(s2)
N2IP1: num2img( s3 t4 )
N2IP2: num2img( s4 t4 )


