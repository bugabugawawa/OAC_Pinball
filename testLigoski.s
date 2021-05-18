# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
.include "./Funcoes/Menu"
.include "./Funcoes/specialEffects"
#.include "./Funcoes/userInterface"
#.include "./Funcoes/backend"

.text
Inicio:

	#printbitmapEficiente(zero zero background)
	#printbitmapEficiente(zero zero tres)
	#li s6 40
	#printbitmapClean( s6 s6 40 40 )
	#drawMenu()
	explodePlanet()
	
	li a7 10
	ecall

subir: upSelected(s2)
descer: downSelected(s2)
