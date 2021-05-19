.macro printarPlanetas( %obstaculosPosicao %obstaculosRaio %obstaculosX %obstaculosY %obstaculosVidas)
addi sp, sp,-100
sw s0,0(sp)
sw s1,4(sp)
sw s2,8(sp)
sw s3,12(sp)
sw s4,16(sp)
sw s5,20(sp)
sw s6, 24(sp)
sw s7, 28(sp)
sw s8, 32(sp)
sw s9 36(sp)


li s9 0
la s8 %obstaculosPosicao
add s8 s8 s9
lw s0 0(s8)

la s8 %obstaculosX
add s8 s8 s9
lw s1 0(s8)

la s8 %obstaculosY
add s8 s8 s9
lw s2 0(s8)

la s8 %obstaculosVidas
add s8 s8 s9
lw s3 0(s8)

la s8 %obstaculosRaio
add s8 s8 s9
lw s4 0(s8)
loop:
	li s7 -1
	beq s0 s7 fim
	
	#printbitmapClean(s1 s2 140 140)
	beq s3 zero proxloop
	li s7 0
	beq s7 s9 prtplaneta1
	li s7 4
	beq s7 s9 prtplaneta2
	li s7 8
	beq s7 s9 prtplaneta3
	li s7 12
	beq s7 s9 prtplaneta4
	j proxloop
	
	prtplaneta1:
	
	printbitmap(s1 s2 planeta1)
	j proxloop
	prtplaneta2:
	printbitmap(s1 s2 planeta2)
	j proxloop
	prtplaneta3:
	printbitmap(s1 s2 planeta3)
	j proxloop
	prtplaneta4:
	printbitmap(s1 s2 planeta4)
	j proxloop
	
	proxloop:
	addi s9 s9 4
	la s8 %obstaculosPosicao
add s8 s8 s9
lw s0 0(s8)

la s8 %obstaculosX
add s8 s8 s9
lw s1 0(s8)

la s8 %obstaculosY
add s8 s8 s9
lw s2 0(s8)

la s8 %obstaculosVidas
add s8 s8 s9
lw s3 0(s8)
la s8 %obstaculosRaio
add s8 s8 s9
lw s4 0(s8)
	j loop

fim:
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)
lw s3,12(sp)
lw s4,16(sp)
lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
lw s8, 32(sp)
lw s9 36(sp)
addi sp, sp, 100
j end
end:
.end_macro

.macro printarPlanetas1()
addi sp, sp,-100
sw s0,0(sp)
sw s1,4(sp)
sw s2,8(sp)
sw s3,12(sp)
sw s4,16(sp)
sw s5,20(sp)
sw s6, 24(sp)
sw s7, 28(sp)
sw s8, 32(sp)
sw s9 36(sp)


li s9 0
la s8 %obstaculosPosicao1
add s8 s8 s9
lw s0 0(s8)

la s8 %obstaculosX1
add s8 s8 s9
lw s1 0(s8)

la s8 %obstaculosY1
add s8 s8 s9
lw s2 0(s8)

la s8 %obstaculosVidas1
add s8 s8 s9
lw s3 0(s8)

la s8 %obstaculosRaio1
add s8 s8 s9
lw s4 0(s8)
loop:
	li s7 -1
	beq s0 s7 fim
	
	#printbitmapClean(s1 s2 140 140)
	beq s3 zero proxloop
	li s7 0
	beq s7 s9 prtplaneta1
	li s7 4
	beq s7 s9 prtplaneta2
	li s7 8
	beq s7 s9 prtplaneta3
	li s7 12
	beq s7 s9 prtplaneta4
	j proxloop
	
	prtplaneta1:
	
	printbitmap(s1 s2 planeta1)
	j proxloop
	prtplaneta2:
	printbitmap(s1 s2 planeta2)
	j proxloop
	prtplaneta3:
	printbitmap(s1 s2 planeta3)
	j proxloop
	prtplaneta4:
	printbitmap(s1 s2 planeta4)
	j proxloop
	
	proxloop:
	addi s9 s9 4
	la s8 obstaculosPosicao1
add s8 s8 s9
lw s0 0(s8)

la s8 %obstaculosX1
add s8 s8 s9
lw s1 0(s8)

la s8 %obstaculosY1
add s8 s8 s9
lw s2 0(s8)

la s8 %obstaculosVidas1
add s8 s8 s9
lw s3 0(s8)
la s8 %obstaculosRaio1
add s8 s8 s9
lw s4 0(s8)
	j loop

fim:
lw s0,0(sp)
lw s1,4(sp)
lw s2,8(sp)
lw s3,12(sp)
lw s4,16(sp)
lw s5,20(sp)
lw s6, 24(sp)
lw s7, 28(sp)
lw s8, 32(sp)
lw s9 36(sp)
addi sp, sp, 100
j end
end:
.end_macro


