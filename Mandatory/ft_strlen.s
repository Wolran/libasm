/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlen.s                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_strlen

ft_strlen:
    xor rax, rax				; Initialisation de rax à 0

while:
    mov bl, byte [rdi + rax]	; charge le byte à l'adresse de rdi + rax dans bl
    test bl, bl					; vérifie si bl est == \0
    jz end						; si bl est nul, jump vers end
    inc rax						; incrémente rax de 1
	jmp while					; retourne au début de la boucle

end:
    ret							; return rax