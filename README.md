# logs
logs asm code to create a fake access.log to make some SOC @.@

# BUILD
```shell
nasm -f elf32 logs.asm -o logs.o
ld -m elf_i386 -s -o logs logs.o
```
