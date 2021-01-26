# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/03 18:49:56 by odhazzar          #+#    #+#              #
#    Updated: 2020/09/04 21:19:51 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_write
extern ___error
section .text

_ft_write:
			xor			rax, rax
			mov			rax, 0x02000004
			syscall
			jc			error
			ret

error:
    		mov			rdi, rax
    		call		___error
    		mov			[rax], rdi				; set the value of errno
    		mov			rax, -1
    		ret