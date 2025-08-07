.data 
	.align 0
	space: .byte ' ' #precisa da diretiva, pra reconhecer tam = 1 byte
	str: .asciz "tamanho do vetor "
	str2: .asciz "conteudo\n"
	.align 2
	vec: .word 0
	
.text
.globl main

main:
	read1:	li a7, 4
		la a0, str
		ecall 
		li a7, 5
		ecall
		mv t0, a0 #tam está em t0
		
	read2:	li a7, 4
		la a0, str2
		ecall
		li a7, 5#comando pra ler int's
		li t1, 0#t1 será o incremento
		la t2, vec#t2 terá o começo do nosso vetor
	#loop pra ler os conteúdos do vetor
	#t4 = acumulador
		mv t4, zero
		
	loop1:	beq t1, t0, end
		addi t1, t1, 1
		ecall
		add t4, t4, a0
		sw a0, 0(t2)
		addi t2, t2, 4
		j loop1
		
	end:	li a7, 1
		mv a0, t4
		ecall
		li a7, 10
		ecall
		
		
					
		