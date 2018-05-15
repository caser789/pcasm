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
outmsg1 db "You entered ", 0
outmsg2 db " and ", 0
outmsg3 db ", the sum of these is ", 0
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

    mov eax, [input1]
    add eax, [input2]
    mov ebx, eax

    dump_regs 1
    dump_mem 2, outmsg1, 1

    mov eax, outmsg1
    call print_string

    mov eax, [input1]
    call print_int

    mov eax, outmsg2
    call print_string

    mov eax, [input2]
    call print_int

    mov eax, outmsg3
    call print_string

    mov eax, ebx
    call print_int
    call print_nl

    popa
    mov eax, 0
    leave
    ret
