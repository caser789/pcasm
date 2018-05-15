; file first.asm
; First assembly program. This program asks for two integers as
; input and prints out their sum.
;
; To create executable using djgpp;
; nasm -f coff first.asm
; gcc -o first first.o driver.c asm_io.o

%include "asm_io.inc"
;
; initialized data is put in the .data segment
;
segment .data
;
; These labels refer to strings used for output
;
prompt1 db "Enter a number: ", 0
prompt2 db "Enter another number: ", 0
;
; uninitialized data is put in the .bss segment
;
segment .bss
;
; these labels refer to double words used to store the inputs
;
input1 resd 1
input2 resd 1
;
; code is put in the .text segment
;
segment .text
    global asm_main
asm_main:
    enter 0,0 ; setup routine
    pusha

    mov eax, prompt1 ; print out prompt
    call print_string

    call read_int
    mov [input1], eax

    mov eax, prompt2 ; print out prompt
    call print_string

    call read_int
    mov [input2], eax

    popa
    mov eax, 0
    leave
    ret
