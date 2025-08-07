.data
.align 2
.globl main
.text

# MAIN: lê um número informado pelo usuário, calcula seu fatorial
# com a função 'fat', printa esse resultado, e finda o programa

main:	#lê o número do fatorial (N!)
	li a7, 5
	ecall
	mv t0, a0 #N está em t0
	
	li t2, 1#t2 armazenará o resultado da função
	jal ra, fat
	
	#printa nosso fatorial
	mv a0, t2
	li a7, 1
	ecall
	
	#fim do programa
	li a7, 10
	ecall
	
# FUNÇÃO FATORIAL: recebe N, e retorna N!, se e somente se 
# N >= 0. A função fatorial não é definida para números negativos,
# somente para os naturais.
	
fat:	#se for 0 ou menos, fatorial dá 1
	blez t2, end	

loop:	#calcular iterativamente
	beq t0, zero, end
	mul t2, t0, t2
	addi t0, t0, -1
	j loop
	
end:	#fim do cálculo
	ret
	