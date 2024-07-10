section .text
	global ft_strcmp

ft_strcmp:
	push rbp
	mov rbp, rsp
	push rdx
	push rcx
	xor rax, rax
	xor rdx, rdx
	xor rcx, rcx

loop:
	mov al, byte[rdi + rcx]
	mov dl, byte[rsi + rcx]
	sub rax, rdx
	jne return
	cmp dl, 0
	je return
	inc rcx
	jmp loop

return:
	pop rcx
	pop rdx
	leave
	ret