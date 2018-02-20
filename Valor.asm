%include "io.inc"
section .data
    ini dd 80,
        var equ ($-ini)
        dd BARATO,
        bloco equ ($-ini)
        dd 120,
        dd NORMAL,
        dd 200,
        dd CARO
        tam equ( $-ini)/bloco
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4,eax
    mov esi,ini
    
 LACO:
    cmp eax,[esi]
    ja l
    add esi, var
    call [esi]
    JMP FIM
    
l:
    add esi,bloco
    cmp eax,[esi]
    ja l2
    add esi,var
    call [esi]
    JMP FIM
l2: 
    add esi,bloco
    cmp eax,[esi]
    ja l3
    add  esi, var
    call [esi]
    JMP FIM
l3:
    PRINT_STRING "Muito Caro"
FIM:
    xor eax, eax
    ret
    
 BARATO:
    PRINT_STRING "Barato"
    ret
 NORMAL:
   PRINT_STRING "Normal"
   ret
CARO:
    PRINT_STRING "Caro"
    ret
    
    