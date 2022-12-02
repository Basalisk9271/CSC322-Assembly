; Gabe Imlay
; CSC322 <12/02/22>
; Project 9: Sort Array
; This project will sort the contents of an array from the data section 
; of the program before printing it out in the sorted order. 

;https://www.youtube.com/watch?v=0H6i6_Cqlfw&ab_channel=MalikShahzaibOfficial 

%macro PrintIt 2
	pusha
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h 
	popa
%endmacro

; address of the array, size of the array
SECTION .data
nums:	dw	 200, 300, 0, 65535, 0, 1, 65534, 300, 100
numslen:	EQU	($-nums)
outputfield: db "     ", 10 ; This is the size of the outputs
origStr: dw "Original Array:", 10
origStrLen EQU	($-origStr)
sortStr: dw "Sorted Array:", 10
sortStrLen EQU	($-sortStr)
ten: dw 10
newline:	db 10
; Clear Screen control characters
cls:      db      1bh, '[2J'
clsSize:  EQU  $-cls

SECTION .bss

SECTION .text
global _main
_main:

; put your code here.

PrintIt cls, clsSize

PrintIt origStr, origStrLen
mov ecx, numslen/2
mov ebx, nums
call printTop

mov ecx, numslen
mov ebx, nums
call bubblesort

PrintIt newline, 1

PrintIt sortStr, sortStrLen
mov ecx, numslen/2
mov ebx, nums
call printTop

lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h


;mov length into ecx before calling and the array address into ebx
bubblesort:
pusha 
shr ecx, 1							; divide the ecx (holding array length) by 2
start:
	xor eax, eax					; zero out the eax register used for the array offset
	comparison:
		mov dx, [ebx+eax*2]			; move the first item into the dx register to compare
		cmp dx, [ebx+eax*2+2]		; compare the value in dex to the next value in the array
		jb noswap					; if the value in dx is less than the next value, they do not need to be switched, jump to noswap
		; swap
		xchg dx, word[ebx+eax*2+2]	; exchange the first item (greater item) with the second item (lesser item)
		mov word[ebx+eax*2], dx		; move the saved item (lesser item) into the first slot
		inc eax						; increment offset
		cmp eax, numslen/2-1		; check to see if offset is greater than the length of the array
		jne comparison				; if the offset does not 
		loop start					; loop to the start since the entire array has been iterated
	noswap:
      		inc eax					; increment offset
      		cmp eax, numslen/2-1	; check to see if offset is greater than the length of the array
      		jne comparison			; if the offset does not 
      		loop start				; loop to the start since the entire array has been iterated
popa
ret

; length of array in ecx, array pointer in ebx
printTop:
	mov ax, [ebx]
	call _convert
	add ebx, 2
	loop printTop

	ret

_convert:
	pusha

	mov ebx, outputfield
	add ebx, 4
	mov ecx, 5

	fivetimes:
		xor dx, dx
		div word[ten]
		add dl, '0'
		mov [ebx], dl
		dec ebx
		loop fivetimes

	PrintIt outputfield, 6
	popa 
	ret