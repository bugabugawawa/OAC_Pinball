# imports
.include "./Funcoes/dataImports"
.include "./Funcoes/prints"
#.include "./Funcoes/Menu"
#.include "./Funcoes/specialEffects"
.include "./Funcoes/userInterface"
.include "./Funcoes/backend"

.text
Inicio:
	li s3 12
	li s4 9
	printarPlanetas(obstaculosPosicao  obstaculosRaio obstaculosX obstaculosY obstaculosVidas)

	li a7 10
	ecall

N2IP1: num2img( s3 t4 )
N2IP2: num2img( s4 t4 )
