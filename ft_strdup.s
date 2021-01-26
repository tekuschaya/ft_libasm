# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 16:04:20 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/05 11:11:42 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strdup
extern _malloc
section .text

_ft_strdup:
				cmp		rdi, 0						; !s ?
				jz		error						; if yes go to error
				xor		rcx, rcx					; init rcx (i = 0)

str_len:
				cmp		byte [rdi + rcx], 0			; s[i] = 0 ?
				jz		malloc_start				; if yes go to malloc
				inc		rcx							; rcx++
				jmp		str_len						; repeat

malloc_start:
				inc		rcx							; rcx++
				push	rdi							; save s
				mov		rdi, rcx					; rdi = rcx
				call	_malloc						; rax = malloc(strlen)
				pop		rdi							; restore s
				cmp		rax, 0						; rax == 0 ?
				jz		error						; memory was not allocated
				xor		rcx, rcx					; rcx = 0

copy_start:
				mov		dl, byte [rdi + rcx]
				mov		byte [rax + rcx], dl
				cmp		dl, 0
				jz		return
				inc		rcx
				jmp		copy_start

error:
				xor		rax, rax

return:
				ret