.data
.include "./colisao.s"
.eqv cEsq 15
.eqv cDir 283
.eqv cCima 10
.eqv cBaixo 465


.macro checkColisaoParedes( %y, %x, %velocidadeY, %velocidadeX )
faddi(ft0, -1)
faddi(ft1, 1)
li t0 , cEsq
ble %x, t0, colidiuEsq
j checkdir
colidiuEsq:
fmul.s %velocidadeX, %velocidadeX, ft0
addi %x, %x 1
j checkcima
checkdir:
li t0, cDir
ble t0, %x, colidiuDir
j checkcima
colidiuDir:
fmul.s %velocidadeX, %velocidadeX, ft0
addi %x,%x -1


checkcima:
li t0, cCima
ble %y, t0, colidiuCima
j checkbaixo
colidiuCima:
fmul.s %velocidadeY, %velocidadeY, ft0
j fim

checkbaixo:
li t0, cBaixo
ble t0, %y, colidiuBaixo
j fim


colidiuBaixo:
fmul.s %velocidadeY, %velocidadeY, ft0
j fim


j fim

fim:
j end
end:
fmv.s  fa1 %velocidadeX
fmv.s  fa0 %velocidadeY
.end_macro	
