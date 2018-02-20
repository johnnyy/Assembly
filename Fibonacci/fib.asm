global Fib

section .text

Fib:
    mov eax, 0
fib:
    push ebp
    mov ebp,esp
    mov ecx,[ebp+8]
    cmp ecx, 1
    jne L1
    add eax, 1
    jmp FIM    
L1:
    cmp ecx, 2
    jne L2
    add eax, 1
    jmp FIM
L2:
    dec ecx
    push ecx
    call fib
    mov ecx,[ebp+8]
    dec ecx
    dec ecx
    push ecx
    call fib
FIM:
   pop ebp
   ret 4