%include 'in_out.asm'

SECTION .data
msg db "Наименьшее число: ",0h
A dd '84'
B dd '32'
C dd '77'

SECTION .bss
min resb 10

SECTION .text

GLOBAL _start
_start:

mov ecx,[A]
mov [min],ecx

cmp ecx,[B]
jl check_C
mov ecx,[B]
mov [min],ecx

check_C:
mov eax,min
call atoi
mov [min],eax

mov ecx,[min]
cmp ecx,[C]
jl fin
mov ecx,[C]
mov [min],ecx

fin:
mov eax, msg
call sprint
mov eax,[min]
call iprintLF
call quit