section	.text
	global	ft_read
	extern	__errno_location

ft_read: 

	push rbp
	mov rbp, rsp

	mov rax, 0
	syscall
	test rax, rax
	jns end

error:
	push rax
	call __errno_location wrt ..plt
	pop rcx
	mov qword [rax], rcx
	mov rax, -1
	leave
	ret

end:
	leave
	ret

