section .data
    filename db "access.log", 0
    message  db "you have been hacked", 0xA
    msg_len  equ $ - message

section .text
    global _start

_start:
    ; sys_open("access.log", O_CREAT|O_WRONLY|O_TRUNC, 0644)
    mov eax, 5              ; sys_open
    mov ebx, filename       ; filename
    mov ecx, 0x241          ; O_WRONLY|O_CREAT|O_TRUNC (0x1|0x40|0x200)
    mov edx, 0o644          ; permissions
    int 0x80
    mov ebx, eax            ; save file descriptor

    ; sys_write(fd, message, msg_len)
    mov eax, 4              ; sys_write
    mov ecx, message        ; message
    mov edx, msg_len        ; length
    int 0x80

    ; sys_close(fd)
    mov eax, 6              ; sys_close
    int 0x80

    ; sys_exit(0)
    mov eax, 1              ; sys_exit
    xor ebx, ebx
    int 0x80
