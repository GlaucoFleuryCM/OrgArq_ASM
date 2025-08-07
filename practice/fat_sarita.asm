# armazenar vetor de strings na memória: declarar vetor de números com .word,
# N strings com .asciz, e daí só dar la do vetor de address, lw da enésima string, sw,
#e segue adiante;

#característica das RISC's: uso intensivo de registrador

#FUNÇÕES: a0, a1 = parâmetro e/ou retorno; a2, .. a7 = parâmetro 
#pro fatorial: a0 = n° a ser calculado, e a1 = valor calculado

#Reg's salvos: dentro da função, se usado, seu valor deve ser preservado pós chamada 
#de função; pro temporário, pode mudar

	.data
	.align 0
str_in:	.asciz "Digite o primeiro número"
str_out:.asciz "Fatorial calculado: "
	.text
	.align 2
	.globl main
	
main:	#imprimir str_in
	li a7, 4
	la a0, str_in
	ecall
	#lê o valor digitado
	li a7, 5
	ecall
	#salva o valor em s0
	add s0, zero, a0
	#chamando função
	jal fatorial
	#salva o valor retornado em s1;
	#SEMPRE QUE TIVER PARAMETRO DE RETORNO: tire dos reg's do tipo a;
	add s1, zero, a1
	#imprimir str_out
	li a7, 4
	la a0, str_out
	ecall
	#imprimir valor
	li a7, 1
	add a0, zero, s1
	ecall
	#encerrando tudo
	li a7, 10
	ecall
	
fatorial:#pq ela ficou escrevendo com a0?
	#retorno inicial
	addi a1, zero, 1
	#contador; aqui pode só tirar o próximo add, e substituir
	#t0 por a0
	add t0, zero, a0
loop:
	beq t0, zero, sai_loop
	mul a1, a1, t0
	addi t0, t0, -1
	j loop
sai_loop:
	jr ra #quem é esse cara;
	
#IMPORTANTE: aqui tem que transferir de s0 pra t0, pq
#é um registrador q tem q manter salvo
#fatorial:
#	addi s1, zero, 1
#	add t0, zero, s0
#loop:	
#	beq t0, zero, sai_loop
#	mul s1, s1, t0
#	addi t0, t0, -1
#	j loop
#sai_loop:
	

	