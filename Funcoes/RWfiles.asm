.macro lerAPI()
	li a7 1024
	la a0 API
	li a1 0
	ecall

	li a7 63
	la a1 buf
	li a2 10
	ecall

	li a7 57
	ecall

	la t0 buf
	lb a2 0(t0)
	
	li a0 97
	beq a2 a0 FlipperEsquerdo	# criar Label que usa isto no arquivo main
	li a0 100
	beq a2 a0 FlipperDireito	# criar Label que usa isto no arquivo main
.end_macro
