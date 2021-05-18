.data
.eqv BITMAP 0xFF000000
.eqv LEN 320
.eqv HEIGHT 480
movemos: .string "Movemos e Novo y e esse pai : "
.macro move(%vy, %vx, %y, %x)
fcvt.w.s t0, %vy
fcvt.w.s t1, %vx
add %y, t0, %y
add %x, t1, %x
li t0, HEIGHT
li t1, LEN
blt %y, zero, corrigirYneg
bgt %y, t0, corrigirYgrande
j testx
corrigirYneg:
li %y,0
j testx
corrigirYgrande:
li %y 465 #height - diametro, pra garantir n dar merda na colisao
j testx
testx:

.end_macro


newline: .string "\n"  
colidimo:  .string "Colidimo pai\n"  
obsy:  .string "Esse e o obstaculo y^^^^\n"
obsx:   .string "Esse e o obstaculo x^^^^\n"
bolay: .string "Essa e a bola y ^^^\n"
bolax: .string "Essa e a bola x^^^\n"
previousvelocity: .string "Essas sao as velocidades y e x\n"
#assumindo bitmap 320*480

.macro faddi(%fp %im)
addi sp, sp , -4
sw t0, 0(sp)
li t0, %im
fcvt.s.w %fp, t0
lw t0, 0(sp)
addi sp, sp , 4

.end_macro

.macro gravidade(%vy, %y , %denominador, %numerador )
addi sp, sp,-100
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
fsw ft0, 12(sp)
fsw ft1, 16(sp)
fsw ft2, 20(sp)
faddi(ft0, %denominador)
faddi(ft1, %numerador)
fdiv.s ft0, ft0,ft1
li t0, 240
ble %y, t0, gNeg
j gPos
gNeg: 
fsub.s %vy, %vy, ft0
j end
gPos:
fadd.s %vy, %vy, ft0
j end
end:
lw t0, 0(sp)
lw t1, 4(sp)
lw t2, 8(sp)
flw ft0, 12(sp)
flw ft1, 16(sp)
flw ft2, 20(sp)
addi sp, sp,100

.end_macro


.macro perdaEnergia(%v, %denominador, %numerador)
addi sp, sp,-100
sw t0, 0(sp)
sw t1, 4(sp)
sw t2, 8(sp)
fsw ft0, 12(sp)
fsw ft1, 16(sp)
fsw ft2, 20(sp)
faddi(ft0, %denominador)
faddi(ft1, %numerador)
fdiv.s ft0, ft0,ft1
fmv.s fa0 ft0
li a7 2 
ecall
fmul.s %v, %v, ft0
end:
lw t0, 0(sp)
lw t1, 4(sp)
lw t2, 8(sp)
flw ft0, 12(sp)
flw ft1, 16(sp)
flw ft2, 20(sp)
addi sp, sp,100
println()
.end_macro

.macro printStringln(%string)
addi sp, sp , -4
sw a0, 0(sp)
la a0, %string
li a7, 4
ecall
lw a0, 0(sp)
addi sp, sp , 4
println()

.end_macro

.macro println()
addi sp, sp , -4
sw a0, 0(sp)
la a0, newline
li a7, 4
ecall
lw a0, 0(sp)
addi sp, sp , 4
.end_macro

.macro printFloatln(%fp)
addi sp, sp , -4
fsw fa0, 0(sp)
fmv.s fa0, %fp
li a7, 2
ecall
println()

flw fa0, 0(sp)
addi sp, sp , 4
.end_macro
.macro printint(%i)
addi sp, sp , -4
sw a0, 0(sp)
li a7, 1
mv a0, %i
ecall
lw a0, 0(sp)
addi sp, sp , 4
println()
.end_macro

#tem um jeito de eu n precisar fazer o check inteiro toda hr
#mas eu legit so vou codar esse jeito se tiver probs de performance, pq eu n sou masoquista
#lembre-se, lobster. Nao vamos tentar engulir mais do q cabe na boca, se n a gente n engole. Ent fazemos primeiro q isso serve so pra um player


#me da a posicao dentro do bitmap em REGISTRADOR ok?
#posicao tu me entrega em um reg
#obstaculosposicao e raio tu me entrega em endereco pra vetor
#o ultimo numero dos vetores e ffffffffffffff pra sinalizar o fim dos vetores blz?
#velocidadeX e Y tu me entrega em regs
#retorna em fa0 a velocidade y
#retorna em fa1 a velocidade x
pegamodaStack: .string "Pegamo s0 da stack, ele ta aqui embaixo: "
botamonaStack: .string "Botamo s0 na stack, ele ta aqui embaixo: "
.macro checkColisao( %posicao,%obstaculosPosicao,%obstaculosRaio, %velocidadeY, %velocidadeX, %raioBola, %testeParada)	
addi sp, sp,-100
sw s0,0(sp)
sw s1,4(sp)
sw s2,8(sp)
sw s3,12(sp)
sw s4,16(sp)
sw s5,20(sp)
sw s6, 24(sp)
sw s7, 28(sp)

fsw fs0,48(sp)
fsw fs1, 52(sp)
fsw fs2, 56(sp)
fsw fs3, 60(sp)
fsw fs4, 64(sp)
fsw fs5, 68(sp)
fsw fs6, 72(sp)
fsw fs7, 76(sp)
fsw fs8, 80(sp)
fsw fs9 84(sp)
fsw fs10, 88(sp)
fsw fs11, 92(sp)


mv s0,%posicao #bola posicao = s0
li t6, BITMAP
sub s0,s0,t6
li t5, LEN
rem s1, s0, t5 # s1 = x
div s0, s0, t5 # s0 = y
li s2, %raioBola #s2 = raio bola
add s1, s2,s1
add s0, s0,s2


li s11, 0 # int i = 0

# s0 = bola y , s1 = bola x, s2 =raio bola, 
# s3 = obstaculo y, s4 = obstaculo x, s5 = r obstaculo
for1:	
	li t6, BITMAP
	la t1, %obstaculosPosicao
	la t2, %obstaculosRaio
	add t1, t1,s11 #aumentando o endereco POSICAO
	add t2, t2, s11#aumentando o endereco RAIO
	lw s3, 0(t1) #s3 = obstaculo
	
	lw s5, 0(t2) #s4 = obstaculo raio
	li t4, -1
	beq s3, t4, fimSemColisao # se a posicao e ffffffff chegamos ao fim do vetor
	sub s3, s3, t6 #s3 - bitmap
	li t6, BITMAP
	rem s4, ,s3, t5  # obstaculo x
	div s3, s3, t5 # obstaculo y
	
	
	#s3= obstaculo y  #s4 = obstaculo x
	calculardistancia:
	#s6 = delta y; s7 = delta x; s8 = raio + raio
	sub s6 , s0, s3
	
	sub s7 s1 s4
	
	add s8 s2 s5
	
	# dy^2 +dx^2 <= (raioB+raioO)^2 ? j colidir : j for1
	mul s6 s6 s6
	
	mul s7 s7 s7
	
	add s6 s6 s7
	
	
	mul s8 s8 s8
		
	
	ble s6 s8 colidir
	addi s11,s11 4
	j for1
	# s0 = bola y , s1 = bola x, s2 =raio bola, 
	# s3 = obstaculo y, s4 = obstaculo x, s5 = r obstaculo
	
	colidir:
	fmv.s fs0, %velocidadeY #vx = ft0	vy = ft1
	fmv.s fs1, %velocidadeX
	printStringln(previousvelocity)
	printFloatln(fs0)
	printFloatln(fs1)
	
	#printStringln(colidimo)
	acharSenCos(s3, s4, s0,  s1)
	fmv.s fs3, fa0
	
	fmv.s fs4, fa1
	
	
	#fa0 = senA, fa1 = cosA
	#mas queremos 90-a=b
	#logo, fa0=cosB e fa1=senB
	#rotacionando speed
	
	#logo,  fs4=senB e fs3=cosB
	rotacaoXVetor(fs0,  fs1, fs4,  fs3)
	#rotacionando speed
	
	faddi(fs5 0)
	fsub.s fs0, fs5,fs0
	#refletindo o y
	#agr vamos rotacionar pra -B
	#pra isso, invertemos i seno
	fsub.s, fs4, fs5, fs4
	rotacaoXVetor(fs0,  fs1, fs4,  fs3)
	fmv.s  fa0 fs0 #y = fa0
	fmv.s  fa1 fs1	#vx = fa1
	li a0, 1
	printFloatln(%velocidadeY)
	printFloatln(%velocidadeX)
	
	#li a7, 10
	#ecall
	j fim
	
	
	
	
	
	
fim:
fmv.s  fa0 fs0 #y = fa0
fmv.s  fa1 fs1	#vx = fa1
li a0, 1
lw s0,0(sp)

lw s1,4(sp)
lw s2,8(sp)
lw s3,12(sp)
lw s4,16(sp)
lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
flw fs0,48(sp)
flw fs1, 52(sp)
flw fs2, 56(sp)
flw fs3, 60(sp)
flw fs4, 64(sp)
flw fs5, 68(sp)
flw fs6, 72(sp)
flw fs7, 76(sp)
addi sp, sp, 100
j retorno

fimSemColisao:
fmv.s  fa0 %velocidadeY #yy = fa0
fmv.s  fa1 %velocidadeX	#vx = fa1
li a0, 0
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)
lw s3,12(sp)
lw s4,16(sp)
lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
flw fs0,48(sp)
flw fs1, 52(sp)
flw fs2, 56(sp)
flw fs3, 60(sp)
flw fs4, 64(sp)
flw fs5, 68(sp)
flw fs6, 72(sp)
flw fs7, 76(sp)
flw fs8, 80(sp)
flw fs9 84(sp)
flw fs10, 88(sp)
flw fs11, 92(sp)

j retorno
retorno:
.end_macro


# retorna sen em fa0, cos em fa1
.macro acharSenCos(%yb, %xb, %ya,  %xa)
fcvt.s.w ft0, %yb

fcvt.s.w ft1, %xb
fcvt.s.w ft2, %ya
fcvt.s.w ft3, %xa
# acha a hipopotenusa
#a0 = y, a1 = x
fsub.s ft0, ft0,ft2

fsub.s ft1, ft1, ft3
#s2 = y^2, s3 = x^2
fmul.s ft2, ft0, ft0

fmul.s ft3, ft1, ft1

fadd.s ft2, ft2, ft3
fsqrt.s ft2, ft2

#sen = ft0, cos = ft1
fdiv.s ft0, ft0, ft2

fdiv.s ft1, ft1, ft2


fmv.s fa0, ft0
fmv.s fa1,ft1
.end_macro

#multiplica o vetor pela matriz de rotacao
vetory: .string "Esse e o vetor y^^^^^\n"
vetorx: .string "Esse e o vetor x^^^^^\n"
rotacao: .string "Rotacionando pai\n"
.macro rotacaoXVetor(%vy, %vx, %sen,  %cos)
#printStringln(rotacao)
fmv.s ft0, %vy
fmv.s ft1, %vx
fmv.s ft2, %sen
fmv.s ft3, %cos
#yt = xsen + ycos
fmul.s ft4, ft3, ft0 #ycos
fmul.s ft5, ft2, ft1 #xsen
fadd.s %vy, ft4, ft5 #YCOS+XSEN
#x = xcos - ysen
fmul.s ft4, ft3,ft1 #xcos
fmul.s ft5, ft2,ft0 #ysen
fsub.s %vx, ft4, ft5 #xcos-ysen
#printFloatln(%vy)
#printStringln(vetory)

#printFloatln(%vx)
#printStringln(vetorx)

.end_macro

