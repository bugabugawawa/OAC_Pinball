# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
.include "./Funcoes/Menu"
.include "./Funcoes/specialEffects"
#.include "./Funcoes/userInterface"
#.include "./Funcoes/backend"

.text
Inicio:
<<<<<<< HEAD
=======
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
>>>>>>> master

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
