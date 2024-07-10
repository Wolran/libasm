section .text
	global ft_strcpy

ft_strcpy:
	push rbp
	mov rbp, rsp

	mov rax, rsi

loop:
	mov cl, [rdi]
	mov [rsi], cl
	cmp byte [rdi], 0
	je end
	inc rsi
	inc rdi
	jmp loop

end:
	leave
	ret
