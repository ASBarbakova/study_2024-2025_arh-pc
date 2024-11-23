%include 'in_out.asm'

SECTION .data
msg: DB 'Введите строку: ',0h

SECTION .bss
buf1: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax,msg
call sprint

mov ecx, buf1
mov edx, 80

call sread

mov eax,4;системный вызов для записи(sys_write)
mov ebx,1;описатель файла '1' - стандартный вывод
mov ecx,buf1;адрес строки buf1 в ecx
int 80h;вызов ядра

call quit

