	.data
prompt: .asciz "Give me 10 numbers:\n"
prompt2:.asciz "Sum of positive: "
	.text
	.globl main
main:
	li a0, 40
	li a7, 9
	ecall
	mv s11, a0
	mv s10, s11
	
	la a0, prompt
	li a7, 4
	ecall
	
	li t1, 10
	li t6, 0

input_loop:
	li a7, 5
	ecall
	sw a0, (s10)
	addi s10, s10, 4
	addi t1, t1, -1
	bnez t1, input_loop

counting:
	lw t2, (s11)
	blez t2, increment
	add t6, t6, t2

increment:
	addi s11, s11, 4
	bne s11, s10, counting
	
end:
	la a0, prompt2
	li a7, 4
	ecall
	
	mv a0, t6
	li a7, 1
	ecall
	