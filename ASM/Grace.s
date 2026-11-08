%macro OPEN_FILE 0
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt
%endmacro

%macro WRITE_FILE 0
    mov rbx, rax
    mov rdi, rbx
    lea rsi, [rel msg]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel msg]
    xor rax, rax
    call fprintf wrt ..plt
    mov rdi, rbx
    call fclose wrt ..plt
%endmacro

%macro GRACE_MAIN 0
    global main
    section .text
main:
    push rbx
    OPEN_FILE
    test rax, rax
    jz %%error
    WRITE_FILE
    xor rax, rax
    jmp %%done
%%error:
    mov rax, 1
%%done:
    pop rbx
    ret
%endmacro

extern fopen
extern fprintf
extern fclose

; Grace's comment.
section .rodata
filename db "Grace_kid.s", 0
mode db "w", 0
msg db "%%macro OPEN_FILE 0%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c%%endmacro%1$c%1$c%%macro WRITE_FILE 0%1$c    mov rbx, rax%1$c    mov rdi, rbx%1$c    lea rsi, [rel msg]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel msg]%1$c    xor rax, rax%1$c    call fprintf wrt ..plt%1$c    mov rdi, rbx%1$c    call fclose wrt ..plt%1$c%%endmacro%1$c%1$c%%macro GRACE_MAIN 0%1$c    global main%1$c    section .text%1$cmain:%1$c    push rbx%1$c    OPEN_FILE%1$c    test rax, rax%1$c    jz %%%%error%1$c    WRITE_FILE%1$c    xor rax, rax%1$c    jmp %%%%done%1$c%%%%error:%1$c    mov rax, 1%1$c%%%%done:%1$c    pop rbx%1$c    ret%1$c%%endmacro%1$c%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$c%1$c; Grace's comment.%1$csection .rodata%1$cfilename db %2$cGrace_kid.s%2$c, 0%1$cmode db %2$cw%2$c, 0%1$cmsg db %2$c%3$s%2$c, 0%1$c%1$cGRACE_MAIN%1$c", 0

GRACE_MAIN