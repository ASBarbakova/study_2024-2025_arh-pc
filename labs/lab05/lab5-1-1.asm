SECTION .data
msg: DB 'Введите строку: ',10

msgLen: EQU $-msg

SECTION .bss
buf1: RESB 80

SECTION .text
GLOBAL _start
_start:

mov eax,4
mov ebx,1
mov ecx,msg
mov edx,msgLen
int 80h

mov eax,3
mov ebx, 0
mov ecx, buf1
mov edx, 80
int 80h

mov eax,4;системный вызов для записи(sys_write)
mov ebx,1;описатель файла '1' - стандартный вывод
mov ecx,buf1;адрес строки buf1 в ecx
mov edx,buf1;размер строки buf1
int 80h;вызов ядра

mov eax,1
mov ebx,0
int 80h

