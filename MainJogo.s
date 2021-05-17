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

subir: upSelected(s2)
descer: downSelected(s2)
