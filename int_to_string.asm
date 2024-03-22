	.data
prompt: .asciz "Enter number:\n"
prompt2:.asciz "Cannot handle negative numbers :(\n"
prompt3:.asciz "String: "
output: .space 100
	.text
	.globl main
main:
	li a7, 4
	la a0, prompt
	ecall
	
	li a7, 5
	ecall
	mv t1, a0
	li t3, 10
	la t6, output
	la t5, output
	beqz t1, zero_case
	li s10, '-'
	li s11, '+'
	bgtz t1, loop
	sub t1, zero, t1
	li s11, '-'
	
loop:
	beqz t1, printer
	remu t2, t1, t3
	divu t1, t1, t3
	addi t2, t2, '0'
	sb t2, (t6)
	addi t6, t6, 1
	b loop


printer:
	jal print
	beq s10, s11, negative
	b p_loop

negative:
	addi t6, t6, 1
	sb s11, (t6)
	addi t6, t6, 1

p_loop:
	addi t6, t6, -1	
	lb a0, (t6)
	li a7, 11
	ecall
	beq t6, t5, end
	b p_loop

print:
	li a7, 4
	la a0, prompt3
	ecall
	li a0, '"'
	li a7, 11
	ecall
	ret
	
zero_case:
	jal print
	addi a0, zero, '0'
	li a7, 11
	ecall
	
end:
	li a0, '"'
	li a7, 11
	ecall
	li a7, 10
	ecall
