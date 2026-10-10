
NAME = Colleen Grace Sully

CC = cc
CFLAGS = -Wall -Wextra -Werror

SRCS = Colleen.c Grace.c Sully.c
OBJS = $(SRCS:.c=.o)

all: $(NAME)

Colleen: Colleen.o
	$(CC) $(CFLAGS) $< -o $@

Grace: Grace.o
	$(CC) $(CFLAGS) $< -o $@

cGrace:
	rm -f Grace_kid.c

Sully: Sully.o
	$(CC) $(CFLAGS) $< -o $@

cSully:
	rm -f Sully_[0-5] Sully_[0-5].c

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
