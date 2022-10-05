; Gabe Imlay
; CSC322 <10/05/22>
; Project 4: Fibonacci Sequence
; This program will calculate and store the first 
; 16 numbers in the Fibonacci sequence.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
Fibs:	RESW 16

SECTION .text
global _main
_main:

; put your code here.

mov AX, 0000d
mov [Fibs], AX  ;1
b1:
mov AX, 0001d
mov [Fibs+2], AX    ;2
b2:
mov AX, [Fibs]
add AX, [Fibs + 2]
mov [Fibs+4], AX    ;3
b3:
mov AX, [Fibs + 2]
add AX, [Fibs + 4]
mov [Fibs + 6], AX  ;4
b4:
mov AX, [Fibs + 4]
add AX, [Fibs + 6]
mov [Fibs + 8], AX  ;5
b5:
mov AX, [Fibs + 6]
add AX, [Fibs + 8]
mov [Fibs + 10], AX ;6
b6:
mov AX, [Fibs + 8]
add AX, [Fibs + 10]
mov [Fibs + 12], AX ;7
b7:
mov AX, [Fibs + 10]
add AX, [Fibs + 12]
mov [Fibs + 14], AX ;8
b8:
mov AX, [Fibs + 12]
add AX, [Fibs + 14]
mov [Fibs + 16], AX ;9
b9:
mov AX, [Fibs + 14]
add AX, [Fibs + 16]
mov [Fibs + 18], AX ;10
b10:
mov AX, [Fibs + 16]
add AX, [Fibs + 18]
mov [Fibs + 20], AX ;11
b11:
mov AX, [Fibs + 18]
add AX, [Fibs + 20]
mov [Fibs + 22], AX ;12
b12:
mov AX, [Fibs + 20]
add AX, [Fibs + 22]
mov [Fibs + 24], AX ;13
b13:
mov AX, [Fibs + 22]
add AX, [Fibs + 24]
mov [Fibs + 26], AX ;14
b14:
mov AX, [Fibs + 24]
add AX, [Fibs + 26]
mov [Fibs + 28], AX ;15
b15:
mov AX, [Fibs + 26]
add AX, [Fibs + 28]
mov [Fibs + 30], AX ;16
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h