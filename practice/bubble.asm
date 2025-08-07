	.data #declarando variáveis;
	.align 2 
vector:
	.word 7 6 5 4 3 2 1 
#i, j, max e aux eu vou escrever nos registradores na hora	
	.text
	.globl main
main: 	
	addi t0, zero, 6 #t0 = MÁX - 1 = 6 pro caso do i
	addi s0 zero, 7 #s0 = MÁX pro caso do j
	addi t1, zero, -1 #t1 = onde eu guardarei o 'i' = -1
	#t2 = onde eu guardarei o 'j';
	
loop1:	beq t1, t0, endloop1
	addi t1, t1, 1 #incrementado i = i + 1
	addi t2, zero, 0 #settando j para 0
	addi s0, s0, -1#decrementando o máximo do nosso j
loop2:		beq t2, s0, endloop2
			addi t2, t2, 1 #incrementando j =j + 1
			la t3, vector #memória inicial
			slli t6, t2, 2 #shifta 2 bits == multiplica por 4
			add t3, t6, t3 #shiftando pra MEM[a[j]]
			lw t4, 0(t3) #pegando a[j]
			#fazendo o mesmo para a[j-1]
			addi t5, t3, -4
			lw t5, 0(t5)
			#t4 terá a[j], t5 terá a[j-1]
			blt t4, t5, swap
			j loop2
endloop2:
		j loop1 			
endloop1:#hora de parar o programa e printar tudo!
	la t1 vector
	li t2 7
	li a7, 1 #ajustando pra ecall que a gente quer =)
print:	beq zero t2 end_print
	addi t2, t2, -1
	lw t3, 0(t1)
	addi t1, t1, 4
	mv a0, t3
	ecall
	j print
end_print:	
	#encerra tudo
	li a7, 10
	ecall

#TROCA O VALOR DAS COISAS NA MEMÓRIA
swap: 
	#t6 é o temporário pra swap
	sw t5 0(t3)#guardando a[j-1] em MEM[a[j]]
	addi t3, t3, -4#ajustando memória
	sw t4 0(t3)#guardando a[j] em MEM[a[j-1]]
	j loop2
		    
			
			
