# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
#.include "./Funcoes/Menu"
#.include "./Funcoes/specialEffects"
.include "./Funcoes/userInterface"
.include "./Funcoes/backend"

.text
Inicio:
	li s3 699		# dei um valor para teste
	printbitmapEficiente( zero zero background)
	alterScoreP1(  )
	li s4 93		# dei um valor para teste
	alterScoreP2(  )
	
	li a7 10
	ecall


N2IP1: num2img( s3 t4 )
N2IP2: num2img( s4 t4 )
