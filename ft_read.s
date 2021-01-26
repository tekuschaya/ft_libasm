# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 18:41:20 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/04 17:02:46 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_read
extern ___error
section .text

_ft_read:
			xor		rax, rax
			mov		rax, 0x02000003
			syscall
			jc		error
			ret

error:
    		mov			rdi, rax
    		call		___error
    		mov			[rax], rdi				; set the value of errno
    		mov			rax, -1
    		ret
