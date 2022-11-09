; Bob Allen
; Demonstrate PUSH for nesting loops
; Fall 2022

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
a:	dd	5
b:	dd	6
c:	dd	7


SECTION .bss
; define uninitialized data here
prod:	RESD 1

SECTION .text
global _main
_main:


; Nesting three loops
	xor	eax,eax		; zero out ax to accumulate the product
	mov	ecx,[a]		; loop "a" times
aTop:
	push	ecx		; save a's ecx value on the stack
	mov 	ecx,[b]		; loop "b" times
bTop:
	push	ecx		; save b's ecx value on the stack
	mov	ecx,[c]		; loop "c" times
cTop:
	inc	eax		; innermost nesting is where we'll inc ax 
	loop	cTop

	pop	ecx		; restore b's ecx value from the stack
	loop	bTop

	pop	ecx		; restore a's ecx value from the stack
	loop	aTop

	mov	[prod],eax	; save the "product" in ram

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
