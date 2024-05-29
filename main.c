void kmain(void)
{
	char* vidmem = (char*) 0xb8000;
	vidmem[0] = 'W';
	vidmem[1] = 0x02;
}
