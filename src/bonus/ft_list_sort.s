section .text
	global ft_list_sort

ft_list_sort:
	cmp		rdi, 0
	je		exit
	cmp		rsi, 0
	je		exit
	push	r12
	push	r13
	mov		r12, [rdi]

reset_cursors:
	cmp		r12, 0
	je		exit
	mov		r13, [r12 + 8]
	jmp		compare	

inc_current:
	mov		r12, [r12 + 8]
	jmp		reset_cursors

inc_next:
	mov		r13, [r13 + 8]
compare:
	cmp		r13, 0
	je		inc_current
	push	rdi
	push	rsi
	mov		rax, rsi
	mov		rdi, [r12]
	mov		rsi, [r13]
	call	rax
	pop		rsi
	pop		rdi	
	cmp		rax, 0
	jg		swap
	jmp		inc_next

swap:
	mov		r10, [r12]
	mov		r11, [r13]
	mov		[r12], r11
	mov		[r13], r10
	jmp		inc_next

exit:
	pop		r13;
	pop		r12;
	ret