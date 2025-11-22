%include 'in_out.asm'

section .data
    a dd 46
    b dd 32
    c dd 74
    msg db "Наименьшее число: ",0h

section .bss
    min resb 10

section .text
global _start

_start:
    mov eax, [a]
    mov ebx, [b]
    mov ecx, [c]
    cmp eax, ebx
    jl check_c
    mov eax, ebx
check_c:
    cmp eax, ecx
    jl save_result
    mov eax, ecx
    
save_result:
    mov [min], eax
    mov eax, msg
    call sprint
    mov eax, [min]
    call iprintLF
    call quit
