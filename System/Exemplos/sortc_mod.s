.text 					# Coloquei o .text e .data, e troquei o main para ser a primeira label
main:                                   # @main
        addi    sp, sp, -16
        sw      ra, 12(sp)
        sw      s0, 8(sp)
        lui     a0, %hi(v)
        addi    s0, a0, %lo(v)
        addi    a1, zero, 30
        add     a0, zero, s0
        call    show
        addi    a1, zero, 30
        add     a0, zero, s0
        call    sort
        addi    a1, zero, 30
        add     a0, zero, s0
        call    show
        mv      a0, zero
        lw      s0, 8(sp)
        lw      ra, 12(sp)
        addi    sp, sp, 16
        li a7 10
        ecall
show:                                   # @show
         mv     t0,a0 
         mv     t1,a1 
         mv     t2,zero 
loop1:  beq     t2,t1,fim1 
        li      a7,1 
        lw      a0,0(t0) 
        ecall 
        li      a7,11 
        li      a0,9 
        ecall 
        addi    t0,t0,4 
        addi    t2,t2,1 
        j       loop1 
fim1:   li      a7,11 
        li      a0,10 
        ecall 

        ret
swap:                                   # @swap
        slli    a1, a1, 2
        add     a0, a0, a1
        lw      a1, 4(a0)
        lw      a2, 0(a0)
        sw      a1, 0(a0)
        sw      a2, 4(a0)
        ret
sort:                                   # @sort
        addi    sp, sp, -48
        sw      ra, 44(sp)
        sw      s0, 40(sp)
        sw      s1, 36(sp)
        sw      s2, 32(sp)
        sw      s3, 28(sp)
        sw      s4, 24(sp)
        sw      s5, 20(sp)
        sw      s6, 16(sp)
        sw      s7, 12(sp)
        addi    s3, zero, 1
        blt     a1, s3, .LBB2_7
        add     s2, zero, a1
        add     s7, zero, a0
        mv      s6, zero
        addi    s4, zero, 1
        add     s5, zero, a0
        j       .LBB2_3
.LBB2_2:                                #   in Loop: Header=BB2_3 Depth=1
        addi    s6, s6, 1
        addi    s5, s5, 4
        addi    s4, s4, 1
        beq     s6, s2, .LBB2_7
.LBB2_3:                                # =>This Loop Header: Depth=1
        beqz    s6, .LBB2_2
        add     s0, zero, s4
        add     s1, zero, s5
.LBB2_5:                                #   Parent Loop BB2_3 Depth=1
        lw      a0, -4(s1)
        lw      a1, 0(s1)
        bge     a1, a0, .LBB2_2
        addi    a1, s0, -2
        add     a0, zero, s7
        call    swap
        addi    s0, s0, -1
        addi    s1, s1, -4
        blt     s3, s0, .LBB2_5
        j       .LBB2_2
.LBB2_7:
        lw      s7, 12(sp)
        lw      s6, 16(sp)
        lw      s5, 20(sp)
        lw      s4, 24(sp)
        lw      s3, 28(sp)
        lw      s2, 32(sp)
        lw      s1, 36(sp)
        lw      s0, 40(sp)
        lw      ra, 44(sp)
        addi    sp, sp, 48
        ret

.data        
v:
        .word   9                       # 0x9
        .word   2                       # 0x2
        .word   5                       # 0x5
        .word   1                       # 0x1
        .word   8                       # 0x8
        .word   2                       # 0x2
        .word   4                       # 0x4
        .word   3                       # 0x3
        .word   6                       # 0x6
        .word   7                       # 0x7
        .word   10                      # 0xa
        .word   2                       # 0x2
        .word   32                      # 0x20
        .word   54                      # 0x36
        .word   2                       # 0x2
        .word   12                      # 0xc
        .word   6                       # 0x6
        .word   3                       # 0x3
        .word   1                       # 0x1
        .word   78                      # 0x4e
        .word   54                      # 0x36
        .word   23                      # 0x17
        .word   1                       # 0x1
        .word   54                      # 0x36
        .word   2                       # 0x2
        .word   65                      # 0x41
        .word   3                       # 0x3
        .word   6                       # 0x6
        .word   55                      # 0x37
        .word   31                      # 0x1f
