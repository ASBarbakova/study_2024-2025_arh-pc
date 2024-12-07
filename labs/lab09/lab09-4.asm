%include 'in_out.asm'
.
SECTION .data.
msg_func db "Функция: f(x) = 7 + 2x", 0.
msg_result db "Результат: ", 0.

SECTION .text.
GLOBAL _start.

_start:
    mov eax, msg_func
    call sprintLF

    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0

next:
    cmp ecx, 0h
    jz _end
    pop eax
    call atoi
    
    call _calculate_fx

    add esi, eax
    loop next

_end:
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF
    call quit
    
_calculate_fx:
    mov ebx, 2
    mul ebx
    add eax, 7
    ret