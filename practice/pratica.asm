#objetivo: escrever o insertion sort com alocação dinâmica e função;
.data
	.align 0
space:	.byte " "
	.align 2
ptr:	.word 

.text
	.globl main

main:#1: ler o tamanho do vetor de entrada
	li a7, 5
	ecall
	mv t2, a0 #t2 tbm guarda agora o tamanho do
	#vetor de entrada
	
	#alocando espaço dinamicamente
	li a7, 9
	ecall
	#agora vamos guardar o endereço do nosso
	#vetor no ponteiro
	la t0, ptr
	sw a0, 0(t0)
	#agora, t0 tem o endereço de memória
	#que leva ao vetor
	
	#loop pra ler input;
	lw t1, 0(t0) #pegando o endereço em ptr
	#t1 = o endereço do nosso vetor
	li a7, 5
	mv t3, t2#t3 = contador
	
loop0:	#lendo valores
	ecall
	sw a0, 0(t1)
	addi t1, t1, 4
	addi t3, t3, -1
	beqz t3, floop0
	j loop0
	
floop0:	
	li a7, 1
	la t0, ptr
	#t0 tem o endereço do vetor
	lw t0, 0(t0)
	
	jal insert #chamando função
	#A FUNÇÃO SÓ DEIXA T2 INTACTO
	
	#t1 é nosso contador
	mv t1, t2
	
loop1:	#printando tudo
	beqz t1, floop1
	sw a0, 0(t0)
	ecall
	addi t1, t1, -1
	addi t0, t0, 4
	j loop1
	
floop1:	#fim do programa
	li a7, 10
	ecall
	
insert: #fazendo o insertion sort;
	#2 loops em que vamos ordenar
	li s0, t2#MÁXIMO
	mv s1, t0#s1 recebe o endereço inicial
	li t3, 0 #loop maior = t3
	li t4, 0#loop menor = t4
	mv t5, s1#endereço móvel do vetor
	
	#t1 = tmp pra comparar; t6 = numero de comparação
Bloop:	beq t3, s0, Bend
	slli t0, t3, 2
	#shiftando pro número atual de análise
	addi t5, t5, t0
	#pegando o número de análise
	lw t1, 0(t5)
	#atualizando loop maior
	addi t3, t3, -1

bloop:	beq t4, t3

	
	
	
	
	
	