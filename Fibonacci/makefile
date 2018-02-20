all: Compilar 

rmObj:
	rm *.o
Compilar:
	gcc *.c -m32 -c
	nasm -f elf32 *.asm
	gcc -m32 -o main *.o
