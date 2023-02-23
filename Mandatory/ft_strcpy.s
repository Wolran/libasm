/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcpy.s                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax						; Initialisation de rax à 0

while:
	mov cl, byte[rsi + rax]				; place le caractere de la 2de chaine dans cl
	mov byte[rdi + rax], cl				; place cl dans la premierre chaine
	test cl, cl							; test si cl = \0 (si cl est = 0 en ascii) 
	jz end								; test le zeroflag, si présent saute a end
	inc rax								; incrémente rax de 1
    jmp while							; boucle sur while

end:
	mov rax, rdi						; place rdi (1er chaine) dans rax
	ret									; return rax