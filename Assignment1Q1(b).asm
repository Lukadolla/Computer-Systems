 ##Lukasz Filanowski 18414616
    
    .data
D1: .word 1,2,4
D2: .word 5,6,8
D3: .word 0,0,0
    .text
    .globl main

main: la $t0, D1
      la $t1, D2
      la $t2, D3
      lw $t3, 0($t0)
      lw $t4 0($t1)
      add $t3, $t3, $t4
      sw $t3, 0($t2)
      
      lw $t3, 4($t0)
      lw $t4 4($t1)
      add $t3, $t3, $t4
      sw $t3, 4($t2)
     
      lw $t3, 8($t0)
      lw $t4 8($t1)
      add $t3, $t3, $t4
      sw $t3, 8($t2)
      
      #
      li $v0, 10
      syscall 
