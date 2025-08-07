.data 
.align 0
	str: .space 100 #endereço da string
	
.text
.align 2
.globl main
main:
	#lendo o tamanho da string (s/contar o null)
	li a7, 5 
	ecall
	mv t0, a0 #t0 = tamanho
	
	#armazenando a string
	li a7, 8
	la a0, str
	mv t1, a0 #t1 = endereço da str
	li a1, 100
	ecall

	#avançando pro índice final da string
	add t1, t1, t0 
	
	#preparando pra printar
	li a7, 11
	
loop:	#loop: quando chegar em 0, acabou o que tem pra ler
	beqz t0, end_loop
	addi t1, t1, -1
	lb a0, 0(t1)
	ecall
	addi t0, t0, -1
	j loop
	
end_loop:#fim do programa
	li a7, 10
	ecall