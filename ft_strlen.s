# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 11:20:01 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/05 10:38:55 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strlen
section .text

_ft_strlen:
			xor		rax, rax				; init rax (i = 0)

while:
			cmp		byte [rdi + rax], 0		; str[i] == 0
			jz		return					; if true go to return
			inc		rax						; rax++
			jmp		while					; again

return:
			ret

