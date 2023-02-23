section .text
	global ft_strlen

ft_strlen:
	xor rax, rax 			 	;je remet tout les bit 1 de rax a 0 pour avoir: rax = 0d
	;mov rax, 0d

while:
	cmp byte[rdi + rax], 0d	 		; je compare str a l'index rax avec \0
	je end					; saute vers end si le comparatif est correcte
	inc rax					; j'incrémente rax de 1
	jmp while				; sinon je loop sur while

end:
	ret					; je return la fin de la fonction

------------------------------------------------------------------------------------------------
section .text
	global ft_strlen

ft_strlen:
	mov rax, -1d 				; je remet tout les bit 1 de rax a 0 pour avoir: rax = 0d 

while:
	inc rax					; j'incrémente rax de 1
	cmp byte[rdi + rax], 0d			; je compare str a l'index rax avec \0
	jne while				; si le comparatif n'est pas correct je loop sur while
	ret					; je return la fin de la fonction
