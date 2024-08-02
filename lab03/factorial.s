.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    add t0, a0, x0
    addi sp, sp, -4
    sw ra, 0(sp)
    addi a1, a0, -1
loop:
    beq a1, x0, exit
    jal ra, mult
    addi a1, a1, -1
    jal x0, loop
exit:
    lw ra, 0(sp)
    addi sp, sp, 4
    jr ra

mult:
    add t1, a1, x0
    add t2, a0, x0
    addi t3, x0, 1
newloop:
    beq t1, t3, newexit
    add a0, a0, t2
    addi t1, t1, -1
    jal x0, newloop
newexit:
    jr ra
