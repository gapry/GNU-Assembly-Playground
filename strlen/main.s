.section .text
.global _start

_start:
  movq  $msg, %rax
  call  strlen
  call  write
  call  exit

write:
  movq  %rax, %rdx
  movq  $msg, %rcx
  movq  $1, %rbx
  movq  $4, %rax
  int   $0x80
  ret
 
exit:
  movq  $0, %rbx
  movq  $1, %rax
  int   $0x80

strlen:
  pushq %rbx
  movq  %rax, %rbx

strlen_iterate:
  cmpb  $0, (%rax)
  je    strlen_end;
  incq  %rax
  jmp   strlen_iterate

strlen_end:
  subq  %rbx, %rax
  popq  %rbx
  ret

.section .data
msg:  
  .asciz "I go to school by bus!\n"
