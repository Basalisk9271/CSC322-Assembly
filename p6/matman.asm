; Gabe Imlay
; CSC322 <11/02/22>
; Project 6: Matrix Manipulation
; This project will calculate the sum of rows and columns in a 2D array 
; and place those sums into corresponding arrays so that a grand total 
; for the matrix can be determined

;;;;;;;;;;;;;;;;;;;;;;;; TEST CASE 2 ;;;;;;;;;;;;;;;;;;;;;;;;;
ROWS:     	EQU	5	; defines a constant ROWS set to 5.
COLS:      EQU	7	; defines a constant COLS set to 7.

SECTION .data
MyMatrix: 	dw	 1,  2,  3,  4,  5,  6,  7
	    	dw	 8,  9, 10, 11, 12, 13, 14
			dw	15, 16, 17, 18, 19, 20, 21
			dw	22, 23, 24, 25, 26, 27, 28
			dw	29, 30, 31, 32, 33, 34, 35
rowSumPos: 	dd 0
matrixPos:	dd 0
Sum:		dw 0
SECTION .bss
RowSums:	RESW ROWS
ColSums:	RESW COLS

saveECX:	RESD 1
SECTION .text
global _main
_main:

; put your code here.

; Calculate the column sums and add them to ColSums
xor edx, edx ; Used for the col sums
mov ecx, COLS
OuterColLoop:
	mov DWORD[saveECX], ecx
	mov ecx, ROWS
	InnerColLoop:
		add ax, [MyMatrix + ebx]
		add ebx, 2*COLS
		loop InnerColLoop
	mov [ColSums+edx], ax
	xor ax, ax
	sub ebx, 2*COLS*ROWS
	add ebx, 2
	add edx, 2
	mov ecx, [saveECX]
	loop OuterColLoop

; Calculate the Row sums and add them to RowSums
; Also calculate the total sum
xor ecx, ecx
xor eax, eax
mov ecx, ROWS
OuterRowLoop:
	mov DWORD[saveECX], ecx
	mov ecx, COLS
	InnerRowLoop:
		mov eax, [matrixPos]
		mov dx, [MyMatrix+eax*2]

		mov ebx, [rowSumPos]
		add [RowSums+ebx*2], dx

		add word[Sum], dx
		inc dword[matrixPos]

		loop InnerRowLoop
	mov ecx, [saveECX]
	inc dword[rowSumPos]
	loop OuterRowLoop

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
