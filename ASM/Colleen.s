global _start
extern printf
extern exit
; Comment before the entry point

section .rodata
	msg db "global _start%1$cextern printf%1$cextern exit%1$c; Comment before the entry point%1$c%1$csection .rodata%1$c	msg db %2$c%3$s%2$c,0%1$c%1$csection .text%1$c_exit:%1$c	xor rdi,rdi%1$c	call exit wrt ..plt%1$c%1$c_start:%1$c	; Comment after the entry point%1$c	call print_content%1$c	jmp _exit%1$c%1$cprint_content:%1$c	sub rsp,8%1$c%1$c	lea rdi,[rel msg]%1$c	mov rsi,10%1$c	mov rdx,34%1$c	lea rcx,[rel msg]%1$c	xor eax,eax%1$c%1$c	call printf wrt ..plt%1$c%1$c	add rsp,8%1$c	ret",0

section .text
_exit:
	xor rdi,rdi
	call exit wrt ..plt

_start:
	; Comment after the entry point
	call print_content
	jmp _exit

print_content:
	sub rsp,8

	lea rdi,[rel msg]
	mov rsi,10
	mov rdx,34
	lea rcx,[rel msg]
	xor eax,eax

	call printf wrt ..plt

	add rsp,8
	ret