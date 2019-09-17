section .data
shell db '/bin/sh',0

section .text
global _start
_vuln:
	push rbp
	mov rbp, rsp
	sub rsp, 0x40
	mov rax, 0
	mov rdi, 0
	lea rsi, [rbp-0x40]
	mov rdx, 0x400
	syscall
	leave
	push 0
	pop rax
	ret

_start:
	push rbp
	mov rbp, rsp
	call _vuln
	mov rax, 60
	mov rdi, 0
	syscall
