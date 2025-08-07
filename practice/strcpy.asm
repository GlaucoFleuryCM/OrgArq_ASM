#ideia: ter 2 espaços distintos;
#ir escrevendo em um o outro skibidi
.data
str1: 	.space 100
str2:	.space 100

.text
.align 2
.globl main
main:	#lendo string 1
	li a7, 8
	la a0, str1
	li a1, 100
	ecall
	la t0, str2#t0 = adress to copy
	la t1, str1#t1 = adress copied
	lb t2, 0(t1)#t2 é pra guardar e ver
	li t3, 10#LINEFEED
	 
loop:	#copiando até o line feed (nao copia ele)
	beq t2, t3, floop
	sb t2, 0(t0)
	lb t2, 0(t1)
	addi t1, t1, 1
	addi t0, t0, 1
	j loop
	
floop:	#dicionando /0 e printando
	li t2, 0
	sb t2, 0(t0)
	la a0, str1
	li a7, 4
	ecall
	li a7, 10
	ecall 