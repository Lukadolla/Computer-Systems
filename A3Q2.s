        .data
output: .asciiz "Hello World!"
        .text
        .globl main 
 
 main:     
    jal message
    
    li $v0,10
    syscall       

message: 
    la $a0, output
    li $v0,4
    syscall     
    jr $ra