; REVERSE THE OUTPUT STRING
; Bob Allen
; Fall 2022
; based upon the textbook example:
; Console Output
; Materials - NASM (32-bit)
; Copyright (c) 2017 Hall & Slonka

; Uses system call information from Chapter 10

SECTION .data
s1: DB "Hi, my name is Josh", 10, 0
lenS1: EQU ($ - s1)
num: db 7


newline: db 10

SECTION .bss
r1: RESB lenS1
output: RESB 1

SECTION .text
global _main
_main:

	mov al,[num]
	add al,'0'
  	mov [output],al
	mov eax, 4     ; syswrite
	mov ebx, 1     ; stdout
	mov ecx, output    ; starting address of string
	mov edx, 1 ; len of string
	int 80h

; Print a new line
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
	int 80h


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

; Print a new line
	mov eax,4
	mov ebx,1
	mov ecx,newline
	mov edx,1
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









