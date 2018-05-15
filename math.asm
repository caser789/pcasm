%include "asm_io.inc"

segment .data
prompt db "Enter a number: ", 0
square_msg db "Square of input is ", 0

segment .bss
input resd 1


segment .text
    global asm_main

asm_main:
    enter 0,0
    pusha

    mov eax, prompt
    call print_string

    call read_int
    mov [input], eax

    imul eax
    mov ebx, eax
    mov eax, square_msg
    call print_string

    popa
    mov eax, 0
    leave
    ret
