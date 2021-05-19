# imports
.data


.include "./Funcoes/dataImports"
.data




obstaculosPosicao: .word 0xFF014BA1, 0xFF009C72, -1

obstaculosRaio: .word  32, 45, -1
obstaculosVidas: .word  3, 3, -1
# imports

.include "./Funcoes/Fisica/flippers.s"
.include "./Funcoes/EfeitosEspeciais/EfeitosPlanetas.s"
.data

# Numero de Notas a tocar
NUM: .word 147
# lista de nota,duração,nota,duração,nota,duração,...
NOTAS: 76,789,77,789,71,526,77,789,79,789,83,131,81,131,79,131,76,920,77,789,71,1841,59,131,59,131,60,131,64,131,60,131,76,920,77,789,71,526,77,789,79,789,83,131,81,131,79,131,76,920,77,789,71,1578,64,131,64,394,64,131,64,262,64,131,48,263,50,263,52,263,52,263,53,263,50,526,48,131,47,1972,48,263,48,263,50,263,52,263,48,526,47,263,59,526,59,263,53,1578,48,263,48,263,50,263,52,263,48,263,52,263,53,526,50,263,48,263,50,131,48,131,47,1315,48,263,48,263,50,263,52,263,48,263,47,526,53,263,53,263,53,263,55,263,53,1052,52,1315,53,263,55,263,52,263,53,263,53,263,53,263,55,263,53,263,47,263,47,1578,48,263,50,263,52,263,48,526,53,263,55,263,53,789,47,131,48,131,52,131,48,131,55,394,55,394,53,789,47,131,48,131,50,131,48,131,53,394,53,394,52,263,50,131,48,394,47,131,48,131,52,131,48,131,52,394,53,394,50,131,48,394,47,526,47,263,53,526,52,1052,47,131,48,131,52,131,48,131,55,394,55,394,53,788,47,131,48,131,50,131,48,131,59,394,50,394,52,263,50,131,48,394,47,131,48,131,50,131,48,131,52,394,53,394,50,394,48,131,47,526,47,263,53,263,52,263,52,526
TEMPOCONTADO: .word 0
TEMPOINICIAL: .word 0
CONTADORDENOTAS: .word 0
.text
Inicio: 
	#colisao x parede = 5 e 283 
	li s1 150
	li s0 70
	printbitmapEficiente(zero zero background )
	
	vamola:
	li a0, 4
	li a1, 3
	li s4 70
	li s3 70
	alterScoreP1()
	alterScoreP2()
	
	#y=275 x=100
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	faddi(fs0 10)
	faddi(fs1 1)
Fim:
	
	
	li s8, 0xFF000000
	add s8, s1, s8
	li t2, 320
	mul t1, s0, t2
	add s8, t1, s8
	
	
	
	colidirDiagonal(114, 11,0,103 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(99,304 ,0 ,208 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(480,116 ,390 ,16 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(480, 210 ,395 ,306 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	#agr os flippers
	colidirDiagonal(34, 100 ,14 ,144 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(15, 180 ,34 ,220 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(450, 102 470 ,144 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	colidirDiagonal(470, 180 450 ,224 , s0, s1, fs0, fs1)
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	
	checkColisaoParedes( s0, s1, fs0, fs1 )
	fmv.s fs0, fa0
	fmv.s fs1, fa1
	li s9 1
	colidirPlanetas( s8, obstaculosPosicao obstaculosRaio obstaculosVidas s9 fs0 fs1)
	mv s9, a0
	j continua2
	continua2:
	#flipperBate(470, 180,450,224, s0, s1, fs0, fs1, 15)
	#fmv.s fs0, fa0
	#fmv.s fs1, fa1
	
	#player remoto
	lerAPI()
	j depoisAPI
	FlipperEsquerdoS:
	useFlipper( 12 144 32 100 FES1 s0, s1, fs0, fs1, 15 s9 88 0)
	fmv.s fs0 fa0
	fmv.s fs1, fa1
	mv s9, a1
	j depoisAPI
	FlipperDireitoS:
	useFlipper( 12 180 32 220 FDS1 s0, s1, fs0, fs1, 15 s9 174 0)
	fmv.s fs0 fa0
	fmv.s fs1, fa1
	mv s9, a1
	j depoisAPI
	
	
	depoisAPI:
	#player 1
	getInputFlipper()
	j depoisdoflipper
	FlipperEsquerdo:
	useFlipper( 470 144 452 100 FEI1 s0, s1, fs0, fs1, 15 s9 84 408)
	fmv.s fs0 fa0
	fmv.s fs1, fa1
	mv s9, a1
	j depoisdoflipper
	FlipperDireito:
	useFlipper( 470 180 452 224 FDI1 s0, s1, fs0, fs1, 15 s9 176 408)
	fmv.s fs0 fa0
	fmv.s fs1, fa1
	mv s9, a1
	j depoisdoflipper
	
	
	
	depoisdoflipper:
	li s11 4
	rem s11 s1, s11
	sub s11 s1 s11
	printbitmapClean(s11 s0 40 40)
	move(fs0, fs1 s0 s1)
	gravidade(fs0, s0, 1, 20)
	perdaEnergia(fs0, 990, 1000)
	perdaEnergia(fs1, 990, 1000)
	
	printbitmap(s1 s0 Ball )
	li a7 32
	li a0 50
	ecall
	continua:
	j Fim2



INICIO:	la s0,NUM		# define o endereço do número de notas
	la s0,NOTAS		# define o endereço das notas
	lw t0 CONTADORDENOTAS	# zera o contador de notas
	li a2,24		# define o instrumento
	li a3,127		# define o volume

LOOP:   blt s6,a0,FIMNOTA
LOOPQ:	beq t0,s1, INICIO	# contador chegou no final? então  vá para INICIO, o LOOPQ deve ser retirado apos concluir o blt
	lw a0,0(s0)		# le o valor da nota
	lw a1,4(s0)		# le a duracao da nota
	li a7,31		# define a chamada de syscall
	ecall			# toca a nota
	mv a0,a1		# passa a duração da nota para a pausa
	# Isto deve ser retirado quando o blt estiver concluido
	li a7,31		# define a chamada de syscal 
	ecall			# realiza uma pausa de a0 ms
	#######################################################
	addi s0,s0,8		# incrementa para o endereço da próxima nota
	addi t0,t0,1		# incrementa o contador de notas
				# volta ao loop
	
FIMNOTA: 
	
	
	
	
	
Fim2:
	j Fim

N2IP1: num2img( s3 t4 )
N2IP2: num2img( s4 t4 )

