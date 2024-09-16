TARGET		:=	asm6502

CC			:=	cc
CFLAGS		:=	-Wall -Werror -Wextra -O2

SRC_DIR		:=	src
INC_DIR		:=	include
OBJ_DIR		:=	obj
BIN_DIR		:=	bin

include Files.mk
OBJECTS		:=	$(FILES:%=$(OBJ_DIR)/%.o)

all: $(BIN_DIR)/$(TARGET)

clean:
	rm -rf $(OBJECTS)

fclean: clean
	rm -rf $(BIN_DIR)/$(TARGET)

re: fclean all

.PHONY: all clean fclean re

$(BIN_DIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CC) -o $@ $^ $(LFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(@D)
	$(CC) -c $< -o $@ -I$(INC_DIR) $(CFLAGS)
