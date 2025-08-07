```	
.data
	.align 0
str_src:
	.asciz "I am in your walls"
	.align 2
ptr:	
	.word # ponteiro


	.text
	.align 2
	.global main
main:
	
	######################################
	# Calcula o tamanho da string source #
	######################################
	li t1, 0	# Contador do tamanho
	la s0, str_src 	# Ponteiro de endereço
	
loop_tam:
	lb t0, 0(s0)   # Le o caractere
	addi s0, s0, 1 # Avança o ponteiro
	addi t1, t1, 1 # Incrementa contador
	bnez t0, loop_tam # Checa fim str
	
	###############################
	# Pede memoria para o sistema #
	###############################
	
	# sbrk (parametro a0: numero de bytes a ser retornados)
	# realizar essa ecall vai guardar o endereço do primeiro byte em a0
	li a7, 9 # sbrk
	add a0, t1, zero # numero de bytes <- contador
	ecall
	
	# queremos guardar o endereço da string no "ponteiro"
	la t2, ptr
	sw a0, 0(t2) # o endereço da string (a0) vai ficar ser armazenada no ponteiro (t2)
	
	################################
	# 	Cópiando a string      #
	################################
	
	# s0 = endereço string origem
	# s1 = endereço string destino
	la s0, str_src
	la t2, ptr
	lw s1, 0(t2)
	
loop_cpy:
	# t0 = conteudo lido
	lb t0, 0(s0)
	sb t0, 0(s1)
	# Avança as strings
	addi s0, s0, 1
	addi s1, s1, 1
	bnez t0, loop_cpy
	
	##################################
	# 	Imprimindo a string      #
	##################################
	la t2, ptr
	lw a1, 0(t2)
	li a7, 4
	ecall
	
	li a7, 10 # Encerra o programa
	ecall
	
# Lição de casa: Implementar um vector copy de inteiros
```