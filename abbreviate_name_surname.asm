	.data
prompt: .asciz "Enter name and surname:\n"
input: .space 100
output: .space 5

	.text
	.globl main
main:
	la a0, prompt
	li a7, 4
	ecall
	
	la a0, input
	li a1, 100
	li a7, 8
	ecall
	
	la t1, output
	la t2, input
	li s11, ' '
	
	lb t6, (t2)
	sb t6, (t1)

loop:
	addi t2, t2, 1
	lb t6, (t2)
	beqz t6, end
	beq t6, s11, surname
	b loop

surname:
	addi t2, t2, 1
	lb t6, (t2)
	addi t1, t1, 1
	li s10, '.'
	sb s10, (t1)
	addi t1, t1, 1
	sb s11, (t1)
	addi t1, t1, 1
	sb t6, (t1)
	addi t1, t1, 1
	sb s10, (t1)

end:
	la a0, output
	li a7, 4
	ecall
	
	li a7, 10
	ecall
