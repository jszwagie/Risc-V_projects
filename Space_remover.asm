	.data
prompt: .asciz "Enter sentence:\n"
strin:	.space 100
strout: .space 100
	.text
	.globl main
main:
	li a7, 4
	la a0, prompt
	ecall

	li a7, 8
	la a0, strin
	li a1, 100
	ecall
	
	la t3, strin
	lb t4, (t3)
	la t5, strout
	beqz t4, end
	li t1, 32
loop:
	beq t1, t4, next
	sb t4, (t5)
	addi t5, t5, 1
next:
	addi t3, t3, 1
	lb t4, (t3)
	bnez t4, loop
end:
	li a7, 4
	la a0, strout
	ecall
	
	li a7, 10
	ecall