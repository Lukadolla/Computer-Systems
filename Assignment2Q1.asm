#Lukasz Filanowski 18414616         
         .data
screen:  .space 524288     
         
         .include "font8x8.inc"
         .text
         .globl main
main:
         li $a0, 'F'   #code of character '0'
         li $a1, 7     # X
         li $a2, 0     # Y
         jal putch
         
         li $v0, 10
         syscall
         
putch: 
        la $t0, font8x8 
        sll $t1, $a0, 3   
        add $t0, $t0, $t1
        
        la $t2, screen #load bitmap 
        li $t3, 0  #1st loop counter
        li $t4, 0  #2nd loop counter
 
loop1:       
        beq $t3, 8, end1
        lb $t5, 0($t0)      
        j loop2
        
loop2:
       beq $t4, 7, end2
       sll $t6, $a2, 9      
       add $t6, $t6, $a1
       sll $t6, $t6, 2
       add $t6, $t6, $t2
       
       andi $s1, $t5, 1 
       
       beqz $s1, ifend 
       la $a3, 0xffffff     
       sw $a3, 0($t6)
ifend:
       subi $a1, $a1, 1
       addi $t4, $t4, 1
       srl $t5, $t5, 1
  
       j loop2   
end2:        
       addi $t0, $t0, 1        
       addi $t3, $t3, 1 
       addi $a2, $a2, 1    
       li $t4, 0
       li $a1, 7
       j loop1
end1:
        li $v0, 10
        syscall
        
        
        
        
        
        
        
        
