; Bob Allen
; Convert int to printable int
; Fall 2022

%macro  PrintIt 2
        pusha
        mov eax,4
        mov ebx,1
        mov ecx,%1
        mov edx,%2
        int 80h
        popa
%endmacro



SECTION .data
; Clear Screen control characters
cls:      db      1bh, '[2J'
clsSize:  EQU  $-cls

;;;; Array of unsigned ints as byte data
nums:	  db	0, 1, 2, 3, 4, 5, 6, 100, 200, 255; should work with more
numslen:  EQU	($-nums)

label:    db "Array Values",10
labellen: EQU $-label

outputfield:	db "   ",10	;;;  Note this is three spaces to hold 3 digits for printing and newline char

ten:	db 10			;;;  For dividing by ten

SECTION .bss
; define uninitialized data here

SECTION .text
global _main, _convert, _prtarray
_main:


	PrintIt cls,clsSize
	PrintIt label, labellen

;;;  Parameters: ebx points to array
;;;		 ecx is len of array
	mov	ebx,nums
	mov	ecx,numslen
	call	_prtarray

lastBreak:


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

;;  Print Array, passed pointer to array in ebx, size in ecx
_prtarray:
	pusha

prtTop:
	mov	al,[ebx]
	call	_convert
	inc	ebx
	loop	prtTop

	popa
	ret

;;  Convert unsigned byte int in AL reg into 3 chars
_convert:
	pusha

	mov	ebx,outputfield
	add	ebx,2			;;;; point to right most digit.
	mov 	ecx,3			;;;; loop over max of 3 digits in unsigned byte
threetimes:	
	xor	ah,ah			;;;; ax = al value unsigned
	div	BYTE [ten]
	add	ah,'0'
	mov	[ebx],ah
	dec	ebx
	loop	threetimes

	mov	eax,4
	mov	ebx,1
	mov 	ecx,outputfield
	mov	edx,4
	int	80h

	popa
	ret

