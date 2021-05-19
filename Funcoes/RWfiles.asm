.macro lerAPI()
    li a7 1024
    la a0 API
    li a1 0
    ecall

    li a7 63
    la a1 buf
    li a2 1
    ecall

    li a7 57
    li a0 3
    ecall

    lb a2 0(a1)
    
    li a7 1024
        la a0  API
        li a1 1
        ecall
        
        li a7 57
    li a0 3
    ecall
    
    li a0 97
    beq a2 a0 FlipperEsquerdoS    # criar Label que usa isto no arquivo main
    li a0 100
    beq a2 a0 FlipperDireitoS    # criar Label que usa isto no arquivo main
.end_macro

.macro lerAPI2()
    li a7 1024
    la a0 API
    li a1 0
    ecall

    li a7 63
    la a1 buf
    li a2 1
    ecall

    li a7 57
    li a0 3
    ecall

    lb a2 0(a1)
    
    li a7 1024
        la a0  API
        li a1 1
        ecall
        
        li a7 57
    li a0 3
    ecall
    
    li a0 97
    beq a2 a0 FlipperEsquerdoS2    # criar Label que usa isto no arquivo main
    li a0 100
    beq a2 a0 FlipperDireitoS2    # criar Label que usa isto no arquivo main
.end_macro