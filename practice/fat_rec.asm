#int fatorial (int n){
#	if (n == 0) return 1;
#	return (fatorial(n-1) * n)

#em funções q chamam funções (que nem a fatorial), a gente perde no registrador
#'ra' o endereço original de 'jal' (não consegue voltar)

#EMPILHRA: addi sp, sp, -8
          #sw ra, 0(sp)
          #sw a0, 4(sp)
#DESMEPI: #lw ra, 0(sp)
	  #lw a0, 4(sp)
	  #addi sp, sp, 8 
	 
 fatorial: #empilhar ra e a0
 	addi sp, sp, -8
 	sw ra, 0(sp)
 	sw a0, 4(sp)#lembrando que a0 é o valor a ser calculado
 	
 	beq a0, zero, return1
 	#atualizar parâmetro
 	addi a0, a0, -1
 	#chama a função
 	jal fatorial #é o nosso adress2
 	#incrementar a0
 	addi a0, a0, 1
 	mul a1, a1, a0
 	j ret_fat
 
return1:#a1 = 1
	addi a1, zero, 1
	
ret_fat:#desempilhar
	lw a0, 4(sp)
	lw ra, 0(sp)
	addi sp, sp, 8
	jr ra
	
 	