%include 'in_out.asm'

SECTION .data
    msg db "Результат: ", 0
    
SECTION .bss
    res: RESB 80
    
SECTION .text
    global _start
    
_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov dword [res], 0

next:
    cmp ecx, 0h
    jz _end
    pop eax
    call atoi
    call _calcul
    add [res], eax
    dec ecx
    jmp next

_end:
    mov eax, msg
    call sprint
    mov eax, [res]
    call iprintLF
    call quit

_calcul:
    mov ebx, 8
    mul ebx
    sub eax, 3
    ret
