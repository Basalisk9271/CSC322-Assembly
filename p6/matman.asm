; Gabe Imlay
; CSC322 <11/02/22>
; Project 6: Matrix Manipulation
; This project will calculate the sum of rows and columns in a 2D array 
; and place those sums into corresponding arrays so that a grand total 
; for the matrix can be determined

;;;;;;;;;;;;;;;;;;;;;;;; TEST CASE 1 ;;;;;;;;;;;;;;;;;;;;;;;;;
ROWS:		EQU	3	; defines a constant ROWS set to 3.
COLS:      EQU	2	; defines a constant COLS set to 2.

SECTION .data
MyMatrix: 	dw	  1,   2
	    	dw	  4,   -2
		dw     -10,  8

SECTION .bss
RowSums:	RESW ROWS
ColSums:	RESW COLS
Sum:		RESW 1

SECTION .text
global _main
_main:

; put your code here.

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
