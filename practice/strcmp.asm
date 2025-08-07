.data
str1:	.space 100
str2:	.space 100
l:	.asciz "Diferentes"
w:	.asciz "Iguais"

.text
.align 2
.globl main
main:	#pegando as strings
	li a1, 100
	la a0, str1
	li a7, 8
	ecall
	
	la a0, str2
	ecall
	
	la t0, str1#t0 = primeira string
	la t1, str2#t1 = segunda string
	li t2, 10#end line = t2
	
	#loadando e preparando
	lb t3, 0(t0)
	lb t4, 0(t1)

loop:	#vai ter 2 branches
	bne t3, t4, diff
	beq t2, t3, equal
	addi t0, t0, 1
	addi t1, t1, 1
	lb t3, 0(t0)
	lb t4, 0(t1)
	j loop
	
diff:	#deu distinto
	li a7, 4
	la a0, l
	ecall
	li a7, 10
	ecall
	
equal:	#deu igual
	li a7, 4
	la a0, w
	ecall
	li a7, 10
	ecall