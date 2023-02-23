; 1er test
section .text
	global ft_strlen

ft_strlen:
	xor rax, rax 				 ;je remet tout les bit 1 de rax a 0 pour avoir: rax = 0d
	;mov rax, 0d

while:
	cmp byte[rdi + rax], 0		; je compare str a l'index rax avec \0
	je end						; saute vers end si le comparatif est correcte
	inc rax						; j'incrémente rax de 1
	jmp while					; sinon je loop sur while

end:
	ret

------------------------------------------------------------------------------------------------
; test avec rax -1
section .text
	global ft_strlen

ft_strlen:
	mov rax, -1d 				; je remet tout les bit 1 de rax a 0 pour avoir: rax = 0d 

while:
	inc rax						; j'incrémente rax de 1
	cmp byte[rdi + rax], 0d		; je compare str a l'index rax avec \0
	jne while					; si le compare n'est pas bon je loop sur while
	ret							; je return la fin de la fonction

-----------------------------------------------------------------------------------------------
; test avec mov et test
section .text
	global ft_strlen

ft_strlen:
    xor rax, rax				; rax = 0
	xor rbx, rbx				; rbx = 0

while:
    mov bl, byte [rdi + rax]	; charge le byte à l'adresse de rdi + rax dans bl
    test bl, bl					; vérifie si bl est nul (plus rapide que cmp)
    jz end						; si bl est nul, sort de la boucle
    inc rax						; incrémente rax
	jmp while					; retourne au début de la boucle

end:
    ret

-----------------------------------------------------------------------------------------------
; test avec inc de rdi
section .text
    global ft_strlen

ft_strlen:
    xor rax, rax				; rax = 0
	xor rbx, rbx				; rbx = 0
   
while:
    mov bl, byte [rdi]			; charge le byte à l'adresse de rdi dans bl
    test bl, bl					; vérifie si bl est nul (plus rapide que cmp)
	jz end						; si bl est nul, sort de la boucle
    inc rdi           			; incrémente rdi
    inc rax						; incrémente rax
    jmp while					; retourne au début de la boucle

end:
    ret

; normalement la plus optimiser des 4 car test + mov est plus rapide que cmp
; incrémente directement rdi est plus rapide que de faire la somme de rdi + rax
