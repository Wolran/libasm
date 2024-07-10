section .text
	global ft_list_push_front
	extern malloc

ft_list_push_front:
	cmp		rdi, 0
	je		exit
	push	rdi
	push	rsi
	mov		rdi, 16
	call	malloc	 wrt ..plt
	cmp		rax, 0
	je		exit
	pop		rsi
	pop		rdi
	mov		[rax], rsi
	mov		r8, [rdi]
	mov		[rax + 8], r8
	mov		[rdi], rax

exit:
	ret
	