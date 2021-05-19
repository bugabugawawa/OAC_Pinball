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
	
	li a7 1024
    	la a0  API
    	li a1 1
    	ecall
    	
	li a7 57
	ecall
	
	li a0 97
	beq a2 a0 FlipperEsquerdoS	# criar Label que usa isto no arquivo main
	li a0 100
	beq a2 a0 FlipperDireitoS	# criar Label que usa isto no arquivo main
.end_macro

.macro escreverRankings()
	li a7 1024
	la a0 rankings
	li a1 0
	ecall

	li a7 64
	la a1 rankAppend
	li a2 10
	ecall

	li a7 57
	ecall
.end_macro
