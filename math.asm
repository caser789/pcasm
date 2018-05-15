%include "asm_io.inc"

segment .data
prompt db "Enter a number: ", 0
square_msg db "Square of input is ", 0
cube_msg db "Cube of input is ", 0

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
    mov eax, ebx
    call print_int
    call print_nl

    mov ebx, eax
    imul ebx, [input]
    mov eax, cube_msg
    call print_string
    mov eax, ebx
    call print_int
    call print_nl

    imul ecx, ebx, 25
    mov eax, cube25_msg
    call print_string
    mov eax, ecx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
