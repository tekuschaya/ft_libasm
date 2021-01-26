# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: odhazzar <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/04 14:45:13 by odhazzar          #+#    #+#              #
#    Updated: 2020/11/16 13:44:32 by odhazzar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
COMPILE = nasm
FLAGS = -f macho64
GCC = gcc
GCCFLAGS = -Wall -Wextra -Werror
DEL = rm -rf
ARRC = ar rcs
SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s

OBJ = $(SRC:.s=.o)

%.o : %.c
	$(COMPILE) $(FLAGS) -c $< -o $@

all: $(NAME)

$(NAME): $(OBJ)
	$(ARRC) $(NAME) $(OBJ)

clean:
	$(DEL) $(OBJ)

fclean: clean
	$(DEL) $(NAME)

re: fclean all

.PHONY: all clean fclean re