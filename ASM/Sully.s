global main
extern strcmp
extern sprintf
extern fopen
extern fprintf
extern fclose
extern system

section .data
    i dq 5

section .rodata
    original db "Sully.s", 0
    source_file db __FILE__, 0
    filename_fmt db "Sully_%ld.s", 0
    command_fmt db "nasm -f elf64 Sully_%1$ld.s -o Sully_%1$ld.o && gcc Sully_%1$ld.o -o Sully_%1$ld && ./Sully_%1$ld", 0
    mode db "w", 0
    msg db "global main%1$cextern strcmp%1$cextern sprintf%1$cextern fopen%1$cextern fprintf%1$cextern fclose%1$cextern system%1$c%1$csection .data%1$c    i dq %4$ld%1$c%1$csection .rodata%1$c    original db %2$cSully.s%2$c, 0%1$c    source_file db __FILE__, 0%1$c    filename_fmt db %2$cSully_%%ld.s%2$c, 0%1$c    command_fmt db %2$cnasm -f elf64 Sully_%%1$ld.s -o Sully_%%1$ld.o && gcc Sully_%%1$ld.o -o Sully_%%1$ld && ./Sully_%%1$ld%2$c, 0%1$c    mode db %2$cw%2$c, 0%1$c    msg db %2$c%3$s%2$c, 0%1$c%1$csection .bss%1$c    filename resb 10%1$c    command resb 80%1$c%1$csection .text%1$cmain:%1$c    push rbx%1$c%1$c    lea rdi, [rel source_file]%1$c    lea rsi, [rel original]%1$c    call strcmp wrt ..plt%1$c    test rax, rax%1$c    jz .check_counter%1$c    dec qword [rel i]%1$c%1$c.check_counter:%1$c    cmp qword [rel i], 0%1$c    jl .done%1$c%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel filename_fmt]%1$c    mov rdx, [rel i]%1$c    xor rax, rax%1$c    call sprintf wrt ..plt%1$c%1$c    lea rdi, [rel filename]%1$c    lea rsi, [rel mode]%1$c    call fopen wrt ..plt%1$c    test rax, rax%1$c    jz .error%1$c%1$c    mov rbx, rax%1$c    mov rdi, rbx%1$c    lea rsi, [rel msg]%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    lea r8, [rel msg]%1$c    mov r9, [rel i]%1$c    xor rax, rax%1$c    call fprintf wrt ..plt%1$c%1$c    mov rdi, rbx%1$c    call fclose wrt ..plt%1$c%1$c    lea rdi, [rel command]%1$c    lea rsi, [rel command_fmt]%1$c    mov rdx, [rel i]%1$c    xor rax, rax%1$c    call sprintf wrt ..plt%1$c%1$c    lea rdi, [rel command]%1$c    call system wrt ..plt%1$c%1$c.done:%1$c    xor rax, rax%1$c    jmp .return%1$c%1$c.error:%1$c    mov rax, 1%1$c%1$c.return:%1$c    pop rbx%1$c    ret%1$c", 0

section .bss
    filename resb 10
    command resb 80

section .text
main:
    push rbx

    lea rdi, [rel source_file]
    lea rsi, [rel original]
    call strcmp wrt ..plt
    test rax, rax
    jz .check_counter
    dec qword [rel i]

.check_counter:
    cmp qword [rel i], 0
    jl .done

    lea rdi, [rel filename]
    lea rsi, [rel filename_fmt]
    mov rdx, [rel i]
    xor rax, rax
    call sprintf wrt ..plt

    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt
    test rax, rax
    jz .error

    mov rbx, rax
    mov rdi, rbx
    lea rsi, [rel msg]
    mov rdx, 10
    mov rcx, 34
    lea r8, [rel msg]
    mov r9, [rel i]
    xor rax, rax
    call fprintf wrt ..plt

    mov rdi, rbx
    call fclose wrt ..plt

    lea rdi, [rel command]
    lea rsi, [rel command_fmt]
    mov rdx, [rel i]
    xor rax, rax
    call sprintf wrt ..plt

    lea rdi, [rel command]
    call system wrt ..plt

.done:
    xor rax, rax
    jmp .return

.error:
    mov rax, 1

.return:
    pop rbx
    ret
