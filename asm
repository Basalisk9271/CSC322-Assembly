nasm -g -f elf32 -l $1.lst $1.asm
ld -e _main -melf_i386 $1.o
rm $1.o

