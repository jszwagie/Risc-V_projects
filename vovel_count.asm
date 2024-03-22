	.data
prompt: .asciz "Enter sentence:\n"
exit_p: .asciz "Vowel counted: "
buff:	.space 100
checker:.asciz "aeiou"

	.text
	.globl main
main:
	li a7, 4
	la a0, prompt
	ecall
	
	li a7, 8
	la a0, buff
	li a1, 100
	ecall
	
	la t1, buff
	lb t2, (t1)
	la t3, checker
	lb t4, (t3)
	li t6, 0
	b buff_loop
	
increment_buff:
	addi t1, t1, 1
	lb t2, (t1)
	
buff_loop:
	beqz t2, end
	mv t5, t3
	lb t4, (t5)
	
check_loop:
	beqz t4, increment_buff
	beq t4, t2, count
	addi t5, t5, 1
	lb t4, (t5)
	b check_loop

count:
	addi t6, t6, 1
	b increment_buff

end:
	li a7, 1
	mv a0, t6
	ecall
	
	li a7, 10
	ecall
	