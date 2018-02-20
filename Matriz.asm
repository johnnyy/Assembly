%include "io.inc"


section .data
        
msg1 DB 'O maior valor é:',0
msgLA DB 'Linha:',0
msgCA DB 'Coluna:',0
msg2 DB 'Menor valor é :',0
msgLB DB 'Linha:',0
msgCB DB 'Coluna:',0
section .bss
matriz RESB 18
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    mov ecx, 18
    mov esi, matriz
    
L1:    
    GET_UDEC 1, [esi]
    inc esi
    loop L1
    
    mov esi, matriz
    mov bl, BYTE[esi]   ;maior
    mov dl, BYTE[esi]   ;menor
    mov edi, matriz
    mov eax, matriz
    mov ecx, 17
L2:
    inc esi
    cmp bl,BYTE [esi]
    jb SWAP
COMP:
    cmp dl,BYTE[esi]
    ja SWAP2
VOLTA:
    dec ecx
    jnz L2
        
quit:   
    PRINT_UDEC 1,dl 
    xor eax, eax
    ret
SWAP:
    mov bl,[esi]
    mov edi,esi
    jmp COMP
SWAP2:
    mov dl,[esi]
    mov eax,esi
    jmp VOLTA 
    