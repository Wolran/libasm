section	.text
	global ft_strlen

ft_strlen:
	push rbp
	mov rbp, rsp

	xor rax, rax

loop:
	cmp byte [rdi], 0
	je end

	inc eax
	inc rdi
	jmp loop

end:
	leave
	ret