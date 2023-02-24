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
	xor rax rax

while:
	test rdi, rdi
	jz end
	inc rax
	mov rdi, [rdi + 8]
	jmp while

end:
	ret