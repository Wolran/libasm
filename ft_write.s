section .text
	global ft_write
	extern	__errno_location

ft_write:
	mov rax, 1					; code pour appeler write (1)
							; rdi est la sortie (stdout)
							; rdx est la longeur de la chaine a écrire
							; rsi est l'adresse donné en parametre (le char a write)
	syscall						; appel systeme de write
	cmp rax, 0					; vérifie qu'il n'y a pas eu d'erreur
	jl write_error					; saute vers write_error si rax < 0 (jl = jump if less than)
	ret						; return rax si tout est bon

write_error:
	neg rax						; met rax en positif pour plus tard
	mov rbx, rax					; met rax dans rbx pour retun la value plus tard
	call __errno_location				; appel errno pour avoir son adrasse adresse
	mov [rax], rbx					; save le code d'erreur de errno
	mov rax, -1					; return -1 comme code d'erreur par defaut
	ret						; return rax

