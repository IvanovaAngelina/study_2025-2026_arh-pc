%include 'in_out.asm'
SECTION .data
    msg: DB 'Как Вас зовут? ',0
    filename: DB 'name.txt',0
    message: DB 'Меня зовут ',0
SECTION .bss
    name: RESB 80
SECTION .text
    global _start
_start:
    mov eax,msg
    call sprint
    mov ecx, name
    mov edx,80
    call sread
    mov ecx,0777o
    mov ebx,filename
    mov eax,8
    int 80h
    mov esi,eax
    mov eax,message
    call slen
    mov edx,eax
    mov ecx,message
    mov ebx,esi
    mov eax,4
    int 80h
    mov ebx,esi
    mov eax,6
    int 80h
    mov ecx,1
    mov ebx,filename
    mov eax,5
    int 80h
    mov esi,eax
    mov edx,2
    mov ecx,0
    mov ebx,eax
    mov eax,19
    int 80h
    mov eax,name
    call slen
    mov edx,eax
    mov ecx,name
    mov ebx,esi
    mov eax,4
    int 80h
    mov ebx,esi
    mov eax,6
    int 80h
    call quit