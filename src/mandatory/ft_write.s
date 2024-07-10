section	.text
	global ft_write
	extern __errno_location

ft_write:

	push rbp
	mov rbp, rsp

	mov rax, 1
	syscall
	test rax,rax
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

