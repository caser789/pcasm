%include "asm_io.inc"

segment .data
prompt db "Enter a number: ", 0

segment .bss
input reds 1


segment .text
    global asm_main

asm_main:
    enter 0,0
    push a

    mov eax, prompt
    call print_string

    popa
    mov eax, 0
    leave
    ret
