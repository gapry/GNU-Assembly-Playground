.section .text
.globl _start
_start:
  movq $1,   %rax       
  movq $1,   %rdi       
  movq $msg, %rsi     
  movq $len, %rdx     
  syscall
  
  movq $60,  %rax       
  xorq %rdi, %rdi      
  syscall

.section .data
msg:    
  .asciz "I go to school by bus!\n"
  len =  . - msg
