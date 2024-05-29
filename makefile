ASM = nasm
ASM_FLAGS = -f elf32

CC = clang
CC_FLAGS = --target=i686-elf

.PHONY: all always clean boot kernel bin

all: always boot kernel bin

always:
	mkdir -p build

clean:
	rm -rf build/*

boot: boot.o
boot.o: main.asm
	$(ASM) $(ASM_FLAGS) main.asm -o boot.o

kernel: krnl.o
krnl.o: main.c
	$(CC) $(CC_FLAGS) -m32 -c main.c -o krnl.o

bin: build/kernel
build/kernel: boot kernel
	ld -m elf_i386 -T link.ld -o build/kernel boot.o krnl.o
