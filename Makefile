# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: chervy <chervy@student.42lyon.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/23 10:19:19 by chervy            #+#    #+#              #
#    Updated: 2025/01/23 12:38:28 by chervy           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

NASM = nasm
CC   = gcc
RM	 = rm -rfv

SRC  = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s
OBJ  = $(SRC:.s=.o)

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)
.PHONY: all

%.o: %.s
	$(NASM) -f elf64 $< -o $@

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

tests:
	$(CC) $(CFLAGS) main.c -L. -lasm -o CrashTest
.PHONY: tests

clean:
	${RM} $(OBJ)
.PHONY: clean

fclean: clean
	${RM} $(NAME) CrashTest
.PHONY: fclean

re: fclean all
.PHONY: re
