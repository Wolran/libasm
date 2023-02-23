/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_read.s                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_read

extern  __errno_location

ft_read:
	xor rax, rax					; Initialisation de rax à 0
							; rax = apel system (0 étant read)
							; rdi = le fd
							; rsi est le pointeur vers le buffer
							; rdx est le nombre max d'octets a lire
	syscall						; appel system de read 
	test rax, rax					; compare rax et 0 (idem que: cmp rax, 0)
	jl read_error					; si rax < 0 alors jump vers read_error
	ret						; return rax

read_error:
	neg rax						; met rax en positif pour plus tard
	mov rbx, rax					; met rax dans rbx pour retun la value plus tard
	call __errno_location				; appel errno pour avoir son adrasse adresse
	mov [rax], rbx					; save le code d'erreur de errno
	mov rax, -1					; return -1 comme code d'erreur par defaut
	ret						; return rax
