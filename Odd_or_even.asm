	.data
prompt: .asciz "Insert number:\n"
odd_p: 	.asciz "Number is odd\n"
even_p: .asciz "Number is even\n"
	
	.text
	.globl main
main:
	li a7, 4
	la a0, prompt
	ecall
	
	li a7, 5
	ecall
	
	andi t1, a0, 0x1
	beqz t1, even
	
	li a7, 4
	la a0, odd_p
	ecall
	b end

even:
	li a7, 4
	la a0, even_p
	ecall

end:
	li a7, 10
	ecall