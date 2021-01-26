# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 11:42:05 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/05 10:43:40 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcpy
section .text

_ft_strcpy:										; src = rsi, dst = rdi
				xor		rcx, rcx				; rcx = 0
				cmp		rsi, 0					; !src
				jz		return

while:
				mov		al, byte [rsi + rcx]
				mov		byte [rdi + rcx], al
				cmp		al, 0
				jz		return
				inc		rcx
				jmp		while

return:
				mov		rax, rdi				; return dst
				ret