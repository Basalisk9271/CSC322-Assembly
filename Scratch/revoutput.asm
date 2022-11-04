; REVERSE THE OUTPUT STRING
; Bob Allen
; Fall 2022
; based upon the textbook example:
; Console Output
; Materials - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

; Uses system call information from Chapter 10

SECTION .data
s1: DB "Hello Universe it is time to go!!!!", 10, 0
lenS1: EQU ($ - s1)

newline: db 10
SECTION .bss
r1: RESB lenS1

SECTION .text
global _main
_main:

; Print
	mov eax, 4     ; syswrite
	mov ebx, 1     ; stdout
	mov ecx, s1    ; starting address of string
	mov edx, lenS1 ; len of string
	int 80h

; Reverse the string, char by char from s1 to r1
	mov ecx,lenS1
	mov ebx,s1+lenS1-1  	;;; point to the last char of s1
	mov edx,r1		;;; point to the first char of r1

revTop:
	mov ah,[ebx]
	mov [edx],ah
	inc edx
	dec ebx
	loop revTop

; Reverse Print
	mov eax, 4     ; syswrite
	mov ebx, 1     ; stdout
	mov ecx, r1    ; starting address of string
	mov edx, lenS1 ; len of string
	int 80h

; Print newline
	mov eax, 4     ; syswrite
	mov ebx, 1     ; stdout
	mov ecx, newline    ; starting address of string
	mov edx, 1 ; len of string
	int 80h


done:	
mov eax, 1
mov ebx, 0
int 80h





; Reverse the string 
	mov ebx,s1
	mov ecx,lenS1
top:
	push DWORD [ebx]
	inc  ebx
	loop top

	mov ebx,s1
	mov ecx,lenS1
top2:
	pop DWORD[ebx]
	inc ebx
	loop top2

print2: mov eax, 4     ; syswrite
	mov ebx, 1     ; stdout
	mov ecx, s1    ; starting address of string
	mov edx, lenS1 ; len of string
	int 80h









