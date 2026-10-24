global main
extern fopen
extern fclose
extern printf
extern exit

section .rodata
    filename db "Grace_kid.s",0
    mode     db "w",0
	msg		 db "global main%1$extern fopen%1$extern fclose%1$cextern printf%1$cextern exit%1$c; Comment before the entry point%1$c%1$csection .rodata%1$c	msg db %2$c%3$s%2$c,0%1$c%1$csection .text%1$c%1$cmain:%1$c	; Comment after the entry point%1$c	sub rsp,8%1$c%1$c	lea rdi,[rel msg]%1$c	mov rsi,10%1$c	mov rdx,34%1$c	lea rcx,[rel msg]%1$c	xor eax,eax%1$c%1$c	call printf wrt ..plt%1$c%1$c	add rsp,8%1$c%1$c	xor rdi,rdi%1$c	call exit wrt ..plt",0


section .text

main:
    lea rdi, [rel filename]
    lea rsi, [rel mode]
    call fopen wrt ..plt

    ; rax now contains the FILE* pointer
    test rax, rax
    jz .error

	extern fprintf

	mov rbx, rax          ; Save the FILE* pointer

	mov rdi, rbx
	lea rsi, [rel msg]
	mov rdx, 10
	mov rcx, 34
	lea r8, [rel msg]
	xor eax, eax

	call fprintf wrt ..plt

    mov rdi, rbx
    call fclose wrt ..plt

    xor rdi, rdi
    call exit wrt ..plt

.error:
    mov rdi, 1
    mov rax, 60
    syscall