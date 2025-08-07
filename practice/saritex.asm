.data #declarando variáveis;

.align 0
str1:	.asciz "Hello World++!"
str2:	.asciz "Hello World--!"

.text #iniciando código;

.align 2 #PQ .GLOBAL MAIN E PQ .ALIGN2
.global main
main: 	addi a7, zero, 5
	ecall
	add s0, a0, zero
	blt s0, a0, print_neg #branching on condition
	#imrpimir string1
	addi a7, zero, 4
	la a0, str1
	ecall
	j the_end
	
print_neg:#imprimir string 
	addi a7, zero, 4
	la a0, str2
	ecall
	
the_end:addi a7, zero, 1
	add a0, s0, zero
	addi a7, zero, 10
	ecall
	li a