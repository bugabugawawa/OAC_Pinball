.data
# Colocar as funcoes relacionadas a prints aqui
.macro printbitmap( %imagem %enderecoDestino) # %pontoNaTela (a2=altura a3 = largura a0 = origem da imagem a1 = onde comeca imagem no bitmap [em 0x])
	la a0 %imagem
	li a1 0xFF000000			# endereco destino dentro da bitmap
	li a4 0xFF100000
	lw a2 4(a0) 				# altura
	lw a3 0(a0) 				# largura
	addi a0 a0 8				# vetor de bytes origem 	
	for_linhas:	
		blez a2 %enderecoDestino	# enquanto a2 > 0 print
		mv t0 a1			# endereco do inicio linha atual
		mv t3 a1
		li t1 0x100000
		add t3 t3 t1
		mv t1 a3			# t1 = largura
		for_colunas:	
			blez t1 fim_da_largura # enquanto t1 > 0
			lbu t2 0(a0)		# le uma word do vetor
			sb t2 0(t0)		# Salva no display a word lida do vetor 
			sb t2 0(t3)		# faz uma copia no frame 1
			addi a0 a0 1		# a0 += 1
			addi a4 a4 1
			addi t0 t0 1		# t0 += 1
			addi t3 t3 1
			addi t1 t1 -1		# t1 -=1
			j for_colunas
		fim_da_largura:
			addi a1 a1 320 		# desceu uma linha
			addi a2 a2 -1		# a2--
			j for_linhas
.end_macro
