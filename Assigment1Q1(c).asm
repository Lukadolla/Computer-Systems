    
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
      addi $t5, $zero, 0    
while:
      beq $t5, 12, end
      lw $t3, D1($t5)
      lw $t4 D2($t5)
      add $t2, $t3, $t4
      sw $t2, D3($t5)
      addi $t5, $t5, 4 
      j while
end:
      #
      li $v0, 10
      syscall 
