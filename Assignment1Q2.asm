 ##Lukasz Filanowski 18414616
         
         .data
array:   .word 1, 2, 3
         .text
      
        .globl main
 
main: la $t0, array
      li $t1, 3
      li $t2, 0
      li $t3, 8
      addi $t5, $zero, 0
     

while: 
      beq $t5, $t1, end
      lw $t4, array($t3)
      lw $t6, array($t2)
      sw $t6, array($t3)
      sw $t4, array($t2)
      addi $t2, $t2, 4
      subi $t3, $t3, 4
      addi $t5, $t5, 1
      j while
end: 
      #
      li $v0, 10
      syscall 
