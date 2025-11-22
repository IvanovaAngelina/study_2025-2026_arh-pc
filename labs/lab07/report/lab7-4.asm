%include 'in_out.asm'

section .data
    msgx db 'Введите x = ',0h
    msga db 'Введите a = ',0h
    msgresult db 'Результат f(x) = ',0h
    
section .bss
    x resb 10
    a resb 10
    result resb 10
    
section .text
global _start

_start:
    mov eax, msgx
    call sprint
    mov ecx, x
    mov edx, 10
    call sread
    mov eax, x
    call atoi
    mov [x], eax
    mov eax, msga
    call sprint
    mov ecx, a
    mov edx, 10
    call sread
    mov eax, a
    call atoi
    mov [a], eax
    mov ebx, [x]
    mov ecx, [a]
    cmp ebx, ecx
    jg greater_case
    mov [result], ebx
    jmp output_result
    
greater_case:
    add ecx, ebx
    mov [result], ecx
    
output_result:
    mov eax, msgresult
    call sprint
    mov eax, [result]
    call iprintLF
    call quit
