%macro MY_GRACE 0
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    test rax, rax
    jz %%.error
    mov rbx, rax          ; Save the FILE* pointer
    mov rdi, rax
    lea rsi, [rel msg]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel msg]
    xor eax, eax
    call fprintf wrt ..plt
    mov rdi, rbx
    call fclose wrt ..plt
    jmp %%.done
%%.error:
    mov eax, 1
%%.done:
%endmacro

global main
extern fopen
extern fprintf
extern fclose

section .rodata
filename: db "Grace_kid.s", 0
mode:     db "w", 0
msg:      db "%%macro MY_GRACE 0%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz %%%%.error%1$c    mov rbx, rax          ; Save the FILE* pointer%1$c    mov rdi, rax%1$c    lea rsi, [rel msg]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel msg]%1$c    xor eax, eax%1$c    call fprintf wrt ..plt%1$c    mov rdi, rbx%1$c    call fclose wrt ..plt%1$c    jmp %%%%.done%1$c%%%%.error:%1$c    mov eax, 1%1$c%%%%.done:%1$c%%endmacro%1$c%1$cglobal main%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$c%1$csection .rodata%1$cfilename: db %2$cGrace_kid.s%2$c, 0%1$cmode:     db %2$cw%2$c, 0%1$cmsg:      db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    sub rsp, 16%1$c    MY_GRACE%1$c    leave%1$c    ret%1$c", 0

section .text
main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    MY_GRACE
    leave
    ret
