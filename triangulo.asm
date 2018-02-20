%include "io.inc"
section .data
 EQUI DB 'EQUILATERO',0
 ESCA DB 'ESCALENO',0
 ISO DB 'ISOSCELES',0
 TRIAN DB 'NÃO É TRIANGULO',0
section .bss
 valor1 RESB 1
 valor2 RESB 1
 valor3 RESB 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 1, valor1
    GET_UDEC 1, valor2
    GET_UDEC 1, valor3
    mov al, [valor1]
    add al, [valor2]
    cmp al, [valor3]
    jae TRIANGULO 
    PRINT_STRING TRIAN
FIM:  
    xor eax, eax
    ret
PRINT_ISOSCELES:
    PRINT_STRING ISO
    jmp FIM
PRINT_EQUILATERO:
    PRINT_STRING EQUI
    jmp FIM
    
    
TRIANGULO:
   mov al, [valor1]
   cmp al, [valor2]
   je IGUAL1_2
   mov al, [valor2]
   cmp al, [valor3]
   je PRINT_ISOSCELES
   mov al, [valor1]
   cmp al, [valor3]
   je PRINT_ISOSCELES
   PRINT_STRING ESCA
   jmp FIM
IGUAL1_2:
   mov al,[valor2]
   cmp al,[valor3]
   je PRINT_EQUILATERO
   jmp PRINT_ISOSCELES
   