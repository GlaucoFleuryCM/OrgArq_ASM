#estratégia: ler o que o cara escreveu;
#avançar até o LF; arrancá-lo
#ler o que o cara quer escrever e botar lá
#anexar o /0
#sucesso!
.data 
.align 0
	str: .space 100
	
.text
.align 2
.globl main 
main:
	#lendo first string
	li a1, 100
	la a0, str
	mv t1, a0#t1 tem nosso adress inicial
	li a7, 8
	ecall
	#vai ser nosso comparador = t0
	li t0, 10 #LINE FEED
	lb t2, 0(t1)
		
loop:	#comparando caracter até chegar no LF
	beq t0, t2, f_loop
	addi t1, t1, 1
	lb t2, 0(t1)
	j loop
	
	#CHEGUEIONDE EU QUERO!
	
f_loop: #iniciar a escrever em t1
	li a1, 50
	mv a0, t1
	li a7, 8
	ecall
	
loop2:	#depois que escreveu, ir até o fim pra add /0
	beq t0, t2, f_loop2
	addi t1, t1, 1
	lb t2, 0(t1)
	j loop2

f_loop2:#trocar, printar, findar programa
	li t3, 0
	lb t3, 0(t1)
	
	li a7, 4
	la a0, str
	ecall
	
	li a7, 10
	ecall
