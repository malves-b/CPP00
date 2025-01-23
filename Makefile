# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malves-b <malves-b@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/01/23 19:52:51 by malves-b          #+#    #+#              #
#    Updated: 2025/01/23 19:55:57 by malves-b         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malves-b <malves-b@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/09/21 13:44:52 by malves-b          #+#    #+#              #
#    Updated: 2024/10/10 17:02:37 by malves-b         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

TARGET = cpp00

FILES = $(wildcard srcs/*.c)

OBJS = $(patsubst srcs/%.c, objs/%.o, $(FILES))

CC = cc -g
CFLAGS = -Wall -Wextra -Werror -std=c++98
RM = rm -f

all: create_objs $(TARGET)

create_objs:
	@mkdir -p objs

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

objs/%.o: srcs/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(TARGET)

re: fclean all

.PHONY: all, clean, fclean, re