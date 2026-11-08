.DELETE_ON_ERROR:
.PHONY: all clean fclean re cGrace cSully

NAME	= Colleen Grace Sully

CC		= gcc
CFLAGS	= 

SRCS = Colleen.s Grace.s Sully.s
OBJS = $(SRCS:.s=.o)

all: $(NAME)

Colleen: Colleen.o
	$(CC) $(CFLAGS) $< -o $@ -lc

Grace: Grace.o
	$(CC) $(CFLAGS) $< -o $@

cGrace:
	rm -f Grace_kid.s

Sully: Sully.o
	$(CC) $(CFLAGS) $< -o $@

cSully:
	rm -f Sully_[0-5] Sully_[0-5].o Sully_[0-5].s

%.o: %.s
	nasm -f elf64 -g -F dwarf $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)
