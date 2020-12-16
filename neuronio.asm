.data
	W1: .float 0.76
	W2: .float 0.4
	txAprend: .float 0.07
	entrada: .float 4.0
	valDesejado: .float 8.0
	Wtotal: .float 0.0
	erro: .float 0.0
	
.text
main:
	#li $v0, 2
	lwc1 $f0, W1 #W1
	lwc1 $f1, W2 #W2
	
	lwc1 $f2, txAprend #txAprend
	lwc1 $f3, entrada #entrada int
	lwc1 $f4, valDesejado #valDesejado int
	lwc1 $f5, Wtotal #Wtotal
	lwc1 $f6, erro #erro
	
	ADDI $t0, $zero, 1
	ADDI $t1, $zero, 20
	FOR:	
		ADD.S $f5,$f0,$f1
 		
 		SUB.S $f6,$f4,$f5
 		
 		MUL.S $f28,$f2,$f3
 		MUL.S $f29,$f28,$f6
	 	ADD.S $f0,$f0,$f29
		
	  	MUL.S $f28,$f2,$f3
 		MUL.S $f29,$f28,$f6
	 	ADD.S $f1,$f1,$f29
  	  
  		ADDI $t0, $t0, 1
  		BNE $t0, $t1, FOR
	
	ADD.S $f5,$f0,$f1
	  
	li   $v0, 2
	mov.s $f12, $f5
	syscall
	
jr $ra
