section .text
	global ft_list_size

ft_list_size:
	xor		rax, rax

loop_list:
	cmp		rdi, 0
	je		exit
	mov		rdi, [rdi + 8]
	inc		rax
	jmp		loop_list

exit:
	ret