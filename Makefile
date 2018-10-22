# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mfiguera <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/27 10:12:04 by mfiguera          #+#    #+#              #
#    Updated: 2018/03/28 16:06:59 by mfiguera         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
FILES = ft_printf1 ft_printf2 ft_printf_d ft_printf_o ft_printf_u ft_printf_x ft_printf_c ft_printf_pc ft_printf_s ft_printf_p
LIBFTFILES = ft_isdigit ft_itoa ft_memchr ft_memset ft_putchar ft_putstr ft_strdup ft_strjoin ft_strlen ft_strnew ft_strstr ft_toupper ft_strnjoin ft_swap ft_ftoa ft_dtoa ft_itoabase ft_toupperstr ft_atoiptr ft_sttoa ft_utoa ft_strrev ft_putwchar ft_putwstr ft_wstrjoin ft_wstrlen ft_wstrnjoin ft_wstrstr ft_wstrnew ft_putendl ft_mbstr ft_strjoinfree ft_strsub
OBJ_DIR = obj
SRCS_DIR = srcs
INCL_DIR = incl
OBJ = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(FILES)))
SRCS = $(addprefix $(SRCS_DIR)/, $(addsuffix .c, $(FILES)))
HEAD = $(addprefix $(INCL_DIR)/, $(addsuffix .h, $(INCLUDES)))
LIBFT = $(addprefix libft/, $(addsuffix .o, $(LIBFTFILES)))
INCLUDES = ft_printf
FLAGS = -Wall -Werror -Wextra

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJ)
	@cd libft && make
	@ar rc $(NAME) $(OBJ) $(LIBFT)

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.c $(HEAD)
	@gcc $(FLAGS) -c $< -o $@ -I $(INCL_DIR)/

clean:
	@rm -rf $(OBJ_DIR)
	@make -C libft clean

fclean: clean
	@rm -f $(NAME)
	@make -C libft fclean

re: fclean $(NAME)