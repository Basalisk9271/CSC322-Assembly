; Bob Allen
; Demo ifs and for statements
; Fall 2022

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
A: dw 50
B: dw 7
C: dw 0

I: dw 0
nums: dw 2,4,6,8,10,12,14,16,18,20,-100
sum:  dw 0
count: dw 0

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

;;;;;;;;;;;;;;;;;;;;;;;;;;;
; If A less than B, increment C else decrement C
;
; if (A<B)
;    C++
; else
;    C--

	mov ax,[A]
	cmp ax,[B]
	jge else1
then1:
	inc WORD [C]
	jmp done1
else1:
	dec WORD [C]
done1:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sum the first five values in array nums
;
; for (I=0; I<5; I++)
;     sum += nums[I]

	mov   WORD [I],0 		; I=0
forTop:
	cmp   WORD [I],5
	jge   forend		; I<5 ??
	movsx ebx,WORD [I]		; use as index into nums
	mov   ax,[nums+ebx*2]	; get next val from nums
	add   [sum],ax		; sum += nums[I]
	inc   WORD [I]		; I++
	jmp   forTop
forend:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Count how many integers are in nums before -100 is found
;
; I = 0
; while (nums[I] != -100)
;    count++
;    I++

	mov   WORD [I],0	; I=0
	movsx ebx, WORD [I]	; for indexing array
	mov   ax,[nums+ebx*2]	; get first number in array
whileTop:
	cmp   ax, -100
	je    whileEnd
	inc   WORD [count]
	inc   WORD [I]
	movsx ebx, WORD [I]	; for indexing array
	mov   ax,[nums+ebx*2]	; get first number in array
	jmp   whileTop
whileEnd:

lastBreak:
; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
