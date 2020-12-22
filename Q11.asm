        .data
DataIn: .ascii "Hello 123."
        
         .text
         .globl main
         
main: 
    la $a0, DataIn
    jal obfuscate
    li $v0, 10
    syscall
    
obfuscate:
      la $t0, 0($a0)  #read address
      la $t1, 0($a0)  #write address
      li $t2, 46     # '.' in ascii 
      li $t3, 32     #' ' in ascii
       
loop:
      lb $t4, 0($t0)     #base + offset
      
      beq $t4, $t2, end   #exit if $t4 = '.' terminator
      
      beq $t4, $t3, skip  #skip increment if there is a space
      
      addi $t4, $t4, 1   #increase ascii by 1

skip:      
      sb $t4, 0($t1)     #write byte to string
      addi $t1, $t1, 1   
      
      addi $t0, $t0, 1   #increment pointer
      j loop
      
end:
      li $v0, 4       #write output to concole
      syscall
      jr $ra         #return to main