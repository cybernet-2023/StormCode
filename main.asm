bits 32
section .text
	dd 0x1BADB002
	dd 0x00
	dd - (0x1BADB002 + 0x00)
extern kmain
global start
start:
	cli
	call kmain
	hlt
