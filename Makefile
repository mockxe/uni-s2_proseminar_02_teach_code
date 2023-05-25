CC = gcc
AS = as
CFLAGS = -Wall -Werror -pedantic

NAME = example
SRCS = $(NAME).c

.PHONY: all box show-empty-c empty show-empty-asm show-example-c ir show-ir asm show-asm assemble binary compare clean

all: binary

# setup
box:
	echo "Hello World!" | boxes -d stone -s 90x20 -a hcvc

# explain empty
show-empty-c: empty.c
	highlight -l $<

empty: empty.c
	$(CC) $(CFLAGS) -S -masm=intel  -o empty.asm $<

show-empty-asm: empty.asm
	highlight -l -S langDefs/assembler.lang $<

# explain code generation
show-example-c: $(SRCS)
	highlight $<

ir: $(SRCS)
	$(CC) $(CFLAGS) -fdump-tree-optimized-graph=$(NAME).ir -o /dev/null $<
	dot -Tpng $(NAME).ir.dot -o $(NAME).ir.png

show-ir: $(NAME).ir
	highlight -l -S langDefs/ir.lang $<

asm: $(SRCS)
	$(CC) $(CFLAGS) -S -masm=intel -o $(NAME).asm $<

show-asm: $(NAME).asm
	highlight -S ~/.local/share/highlight/langDefs/assembler.lang $<

assemble: $(NAME).asm
	$(AS) -o $(NAME).o $<
	$(CC) $(CFLAGS) -o $(NAME)_manual $(NAME).o

# compare results
binary: $(SRCS)
	$(CC) $(CFLAGS) -o $(NAME)_direct $<

compare: $(NAME)_manual $(NAME)_direct
	sha1sum $(NAME)_manual
	sha1sum $(NAME)_direct

# clean
clean:
	rm -rf empty.asm $(NAME).ir $(NAME).ir.* $(NAME).asm $(NAME).o $(NAME)_manual $(NAME)_direct
