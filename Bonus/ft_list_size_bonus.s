/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_list_size_bonus.s                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_list_size_bonus

ft_list_size_bonus:
	xor rax rax				; Initialisation de rax à 0

while:
	test rdi, rdi				; test si rdi est NULL
	jz end					; si rdi est NULL jump vers end
	inc rax					; incremente rax de 1
	mov rdi, [rdi + 8]			; met rdi a l'adresse du prochain element de la chaine
	jmp while				; jump vers while

end:
	ret					; return rax
