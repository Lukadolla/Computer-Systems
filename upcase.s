        .data
char_buffer: .byte 0

.text
.globl __start

__start:

start:         
          li $a0, 1
          la $a1, char_buffer
          li $a2, 1
          
          li $v0, 4003
          syscall
          beqz $v0, end
          
          lb $t0, 0($a1)
          
          bgt $t0, 122, end_if
          blt $t0, 97, end_if
          
          sub $t0, $t0, 32
end_if:
          sb $t0, 0($a1)
          li $a0, 0
          la $a1, char_buffer
          li $a2, 1
          
          li $v0, 4004
          syscall
          j start
 end:
          li $a0, 0
          li $v0, 4001
          syscall
       
