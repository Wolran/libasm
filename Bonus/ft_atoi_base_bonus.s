/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base_bonus.s                               :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vmuller <vmuller@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/23 05:14:16 by vmuller           #+#    #+#             */
/*   Updated: 2023/02/23 05:14:16 by vmuller          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

section .text				; Section du code exécutable
	global ft_atoi_base		; Déclaration de la fonction globale ft_atoi_base
	extern ft_strlen		; Déclaration externe de la fonction ft_strlen

ft_atoi_base:
	xchg RDI, RSI			; Échange les valeurs de RDI et RSI (utilisation inversée des registres)
	call ft_strlen			; Appel de la fonction ft_strlen
	xchg RDI, RSI			; Échange à nouveau les valeurs de RDI et RSI
	cmp RAX, 2				; Compare la valeur de RAX avec 2
	jb set_rax				; Sauter à l'étiquette set_rax si RAX < 2
	mov R10, RAX			; Déplace la valeur de RAX dans R10
	mov RAX, -1				; Initialise RAX à -1 (valeur par défaut)

check_base_loop:
	inc RAX					; Incrémente la valeur de RAX
	cmp byte[RSI + RAX], 0	; Compare la valeur de byte[RSI + RAX] à 0
	je skip_spaces_init		; Sauter à l'étiquette skip_spaces_init si c'est égal à 0
	cmp byte[RSI + RAX], 32	; Compare la valeur de byte[RSI + RAX] à 32
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 32
	cmp byte[RSI + RAX], 43	; Compare la valeur de byte[RSI + RAX] à 43
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 43
	cmp byte[RSI + RAX], 45	; Compare la valeur de byte[RSI + RAX] à 45
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 45
	cmp byte[RSI + RAX], 12	; Compare la valeur de byte[RSI + RAX] à 12
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 12
	cmp byte[RSI + RAX], 10	; Compare la valeur de byte[RSI + RAX] à 10
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 10
	cmp byte[RSI + RAX], 13	; Compare la valeur de byte[RSI + RAX] à 13
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 13
	cmp byte[RSI + RAX], 9	; Compare la valeur de byte[RSI + RAX] à 9
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 9
	cmp byte[RSI + RAX], 11	; Compare la valeur de byte[RSI + RAX] à 11
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal à 11
	mov R8, RAX				; Déplace la valeur de RAX dans R8
	mov R9B, byte[RSI + RAX]	; Déplace la valeur de byte[RSI + RAX] dans R9B

check_dupl_loop:
	inc R8					; Incrémente la valeur de R8
	cmp byte[RSI + R8], 0	; Compare la valeur de byte[RSI + R8] à 0
	je check_base_loop		; Sauter à l'étiquette check_base_loop si c'est égal à 0
	cmp R9B, byte[RSI + R8]	; Compare la valeur de R9B à byte[RSI + R8]
	je set_rax				; Sauter à l'étiquette set_rax si c'est égal
	jmp check_dupl_loop		; Sauter à l'étiquette check_dupl_loop

set_rax:
	xor RAX, RAX			; Effectue un XOR de RAX avec lui-même (réinitialise RAX à 0)
	ret						; Retourne de la fonction

skip_spaces_init:
	mov RAX, -1				; Initialise RAX à -1

skip_spaces_loop:
	inc RAX					; Incrémente la valeur de RAX
	cmp byte[RDI + RAX], 32	; Compare la valeur de byte[RDI + RAX] à 32
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 32
	cmp byte[RDI + RAX], 12	; Compare la valeur de byte[RDI + RAX] à 12
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 12
	cmp byte[RDI + RAX], 10	; Compare la valeur de byte[RDI + RAX] à 10
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 10
	cmp byte[RDI + RAX], 13	; Compare la valeur de byte[RDI + RAX] à 13
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 13
	cmp byte[RDI + RAX], 9	; Compare la valeur de byte[RDI + RAX] à 9
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 9
	cmp byte[RDI + RAX], 11	; Compare la valeur de byte[RDI + RAX] à 11
	je skip_spaces_loop		; Sauter à l'étiquette skip_spaces_loop si c'est égal à 11
	push R12				; Empile la valeur de R12 sur la pile
	mov R12, 1				; Initialise R12 à 1
	dec RAX					; Décrémente la valeur de RAX
skip_sign_loop:
	inc RAX					; Incrémente la valeur de RAX
	cmp byte[RDI + RAX], 45	; Compare la valeur de byte[RDI + RAX] à 45
	je set_negative			; Sauter à l'étiquette set_negative si c'est égal à 45
	cmp byte[RDI + RAX], 43	; Compare la valeur de byte[RDI + RAX] à 43
	je skip_sign_loop		; Sauter à l'étiquette skip_sign_loop si c'est égal à 43
	jmp convert_init		; Sauter à l'étiquette convert_init

set_negative:
	neg R12					; Négation de la valeur de R12
	jmp skip_sign_loop		; Sauter à l'étiquette skip_sign_loop

convert_init:
	mov R8, RAX				; Déplace la valeur de RAX dans R8
	xor RAX, RAX			; Effectue un XOR de RAX avec lui-même (réinitialise RAX à 0)

convert_loop:
	cmp byte [RDI + R8], 0	; Compare la valeur de byte[RDI + R8] à 0
	je end					; Sauter à l'étiquette end si c'est égal à 0
	mov R9B, [RDI + R8]		; Déplace la valeur de byte[RDI + R8] dans R9B
	xor R11, R11			; Effectue un XOR de R11 avec lui-même (réinitialise R11 à 0)

find_loop:
	cmp byte [RSI + R11], 0	; Compare la valeur de byte[RSI + R11] à 0
	je end					; Sauter à l'étiquette end si c'est égal à 0
	cmp R9B, [RSI + R11]	; Compare la valeur de R9B à byte[RSI + R11]
	je atoi					; Sauter à l'étiquette atoi si c'est égal
	inc R11					; Incrémente la valeur de R11
	jmp find_loop			; Sauter à l'étiquette find_loop

atoi:
	mul R10					; Multiplie RAX par R10
	add RAX, R11			; Ajoute R11 à RAX
	inc R8					; Incrémente la valeur de R8
	jmp convert_loop		; Sauter à l'étiquette convert_loop

end:
	mul R12					; Multiplie RAX par R12
	pop R12					; Dépile la valeur de R12 de la pile
	ret						; Return de la fonction
