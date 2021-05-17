.data
teste: 
.asciz "API"
buf: .byte 200, 100, 230, 145
# append eh 8 nao 9 prob

.text
li a7 1024
la a0 teste
li a1 1
ecall
li a7 1
ecall

li a7 64
la a1 buf
li a2 4
ecall

li a7 57
ecall

li a7 10
ecall