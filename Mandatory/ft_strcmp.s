/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcmp.s                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_strcmp

ft_strcmp:
    xor rax, rax						; Initialisation de rax à 0

while:
    mov bl, byte [rdi + rax]					; mov le carac de la 1er chaine dans bl
    mov cl, byte [rsi + rax]					; mov le carac de la 2de chaine dans cl
    cmp bl, cl							; compare des deux caractères
    jne end							; si les caractères ne sont pas égaux, saute a end
	test bl, bl						; test si bl = \0 (si bl est = 0 en ascii)
    jz end							; test le zeroflag, si présent saute a end
    test cl, cl							; test si cl = \0 (si cl est = 0 en ascii)
    jz end							; test le zeroflag, si présent saute a end
    inc rax							; incrémente rax de 1
    jmp while							; boucle sur while

end:
	mov rcx, rax						; met la valeur rax dans rcx
	mov rax, byte[rdi + rcx]				; met la derniere valeur trouver de la 1er chaine dans rax
	mov rbx, byte[rsi + rcx]				; met la derniere valeur trouver de la 2de chaine dans rbx
	sub rax, rbx						; soustrait rax (1er chaine) avec rbx (2de chaine) et met le resultat dans rax
    ret								; return rax
