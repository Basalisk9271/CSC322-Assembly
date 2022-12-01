; Gabe Imlay
; CSC322 <12/02/22>
; Project 9: Sort Array
; This project will sort the contents of an array from the data section 
; of the program before printing it out in the sorted order. 

;https://www.youtube.com/watch?v=0H6i6_Cqlfw&ab_channel=MalikShahzaibOfficial 

; address of the array, size of the array
%macro sort 2

%endmacro
SECTION .data
nums:	dw	 200, 300, 0, 65535, 0, 1, 65534, 300, 100
numslen:	EQU	($-nums)
swap: db 0

SECTION .bss

SECTION .text
global _main
_main:

; put your code here.
;sort nums, numslen
mov ecx, numslen
mov ebx, nums
call selectionsort

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


;mov length into ecx before calling and the array address into ebx
selectionsort:

pusha  
;xor eax, eax
shr ecx, 1
start:
	xor eax, eax
	comparison:
      		mov dx, [ebx+eax*2]
      		cmp dx, [ebx+eax*2+2]
      		jb noswap
      		; swap
		xchg dx, word[ebx+eax*2+2]
		mov word[ebx+eax*2], dx
		inc eax
		cmp eax, numslen/2-1
		jne comparison
		loop start
	noswap:
      		inc eax
      		cmp eax, numslen/2-1
      		jne comparison 
      		loop start
popa
ret
