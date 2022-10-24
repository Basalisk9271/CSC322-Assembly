; Gabe Imlay
; CSC322 <10/19/22>
; Project 5: Max Fibonacci
; This project will calculate the largest, unsigned fibonacci 
; number that can fit into a double word on our machine

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
MaxFib:     RESD 1
FibCount:	RESW 1

SECTION .text
global _main
_main:

; put your code here.

mov EAX, 0 ; use EAX to hold first int
mov EBX, 1 ; use EBX to hold second int
mov WORD [FibCount], 2
top:	
	inc WORD [FibCount] ; increment fib count to keep track of the number of fib nums
	mov ECX, EAX ; save a copy of the int in EAX
	add ECX, EBX ; Determine the next fib num
	js stop   ; if there was not a sign change, keep looping
	          ; otherwise ECX has the max unsigned in
	mov EAX, EBX ; move num in EBX into EAX
	mov EBX, ECX ; move num in ECX to EBX
	jmp top ; if there is not a carry above, repeat
stop:	
	mov [MaxFib],ECX ; move the last successful fib number into MaxFib
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
