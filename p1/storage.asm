; Gabe Imlay
; Project 1: Data Storage
; 9/21/22
; This is the first project we are doing in CSC322

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.



; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
