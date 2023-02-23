/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strdup.s                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text
	global ft_strdup

extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location

ft_strdup:
	push rdi					; sauvegarde le premier arg sur la pile
	call ft_strlen					; fait appel a strlen
	mov rdi, rax					; rdi prend maintenant la longeur de la chaine (en premier arg pour malloc)
	call malloc					; alloue de la memoire pour copier la chaine de caractere
	cmp rax, 0					; compare que le malloc a bien fonctionner
	jz dup_error					; si le malloc a fail jump jusqu'a du_error
	mov rdi, rax					; met l'adresse de la nouvelle allocation de mémoire dans le premier arg pour l'appel à ft_strcpy
	pop rsi						; récupère le premier argument (l'adresse de la chaîne originale) depuis la pile
	call ft_strcpy					; copie la chaine originale dans la nouvelle
	ret						; retourne le pointeur vers la nouvelle allocation

dup_error:
	call __errno_location				; appel errno pour avoir son adrasse adresse
	mov [rax], rbx					; save le code d'erreur de errno
	mov rax, -1					; return -1 comme code d'erreur par defaut
	ret						; return rax
