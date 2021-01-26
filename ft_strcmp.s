# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 12:06:22 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/05 10:51:23 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcmp
section .text

_ft_strcmp:											; s1 = rdi, s2 = rsi
				xor		rcx, rcx					; init rcx (i = 0)
				cmp		rdi, 0						; !s1
				jz		check_null					; if yes go to check_null
				cmp		rsi, 0						; !s2
				jz		check_null					; if yes go to check_null

while:
				cmp		byte [rdi + rcx], 0 		; end of s1?
				jz		check						; if yes go to check
				cmp		byte [rsi + rcx], 0			; end of s2?
				jz		ret_greater					; if yes then s1 > s2
				mov		al, byte [rdi + rcx]		; copy in intermediate register
				cmp		al, byte [rsi + rcx]		; compare s1[i] and s2[i]
				jg		ret_greater					; s1[i] > s2[i]
				jl		ret_less					; s1[i] < s2[i]
				inc		rcx							; if equal then rcx++
				jmp		while						; again

check:
				cmp		byte [rsi + rcx], 0			; s2[i] = 0 ?
				jz		ret_equal					; if yes then s1 = s2
				jmp		ret_less					; else s1 < s2


check_null:
				cmp		rdi, rsi					; compare s1 and s2
				jg		ret_greater					; s1 > s2
				jl		ret_less					; s1 < s2
				jmp		ret_equal					; s1 = s2

ret_greater:
				mov		rax, 1
				ret

ret_less:
				mov		rax, -1
				ret

ret_equal:
				mov		rax, 0
				ret