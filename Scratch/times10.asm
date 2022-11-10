; NAME
; Assignment
; Date
; Etc...

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
num1: dw 3
num2: dw 14
num3: dw 322

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.
mov ebx, 245
mov ax, [num1]
call t10
mov [num1], ax
mov ax, [num2]
call t10
mov [num2], ax
mov ax, [num3]
call t10
mov [num3], ax
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


;;;; Times 10 function
;;;; pass a word in the AX
;;;; return that number times 10 in the AX
t10: 
    push ebx
    mov bx, AX
    shl ax, 1   ;times 2
    shl bx, 3   ;times 8
    add ax, bx ;times 10 original value
    pop ebx
    ret