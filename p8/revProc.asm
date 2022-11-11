; Gabe Imlay
; CSC322 <11/11/22>
; Project 8: Reverse Array with a Proc
; This project will reverse the contents of an array by calling a 
; procedure.  The procedure should work for any sized DWORD array of 
; signed integers.  After the procedure’s code runs, the values in all 
; registers should be unchanged from when the procedure was called.

SECTION .data
array1: dd      1,2,3,4,5
len1:   EQU     ($-array1)


array2: dd      -10, -9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9
len2:   EQU     ($-array2)


array3: dd  0,10,20,30,40,50,60,70,80,90
  dd  100,110,120,130,140,150,160,170,180,190
  dd  200,210,220,230,240,250,260,270,280,290
  dd  300,310,320,330,340,350,360,370,380,390
  dd  400,410,420,430,440,450,460,470,480,490,500
len3:   EQU     ($-array3)

SECTION .bss

SECTION .text
global _main
_main:

; put your code here.
firstBreak:
pusha	; This saves all of the registers in a certain state
mov ebx, len1	; move the size of the first array into the ebx so it can be used in the function
mov edx, array1	; move the address for the first array into the edx so it can be used in the function
shr ebx, 2	; divide the size of the array by four since it is supposed to be a DWORD array
call reverse	; call reverse function
mov ebx, len2	; rinse and repeat for arrays two and three
mov edx, array2
shr ebx, 2
call reverse
mov ebx, len3
mov edx, array3
shr ebx, 2
call reverse
popa	; restore all registers from the point before the code
lastBreak:

; Normal termination code
mov eax, 1
mov ebx, 0
int 80h

; take number from ecx which should be the length of the array to reverse
reverse:
    mov ecx, ebx
    xor eax, eax
	revLoop: ; loop to send all of the array elements to the stack
        	push DWORD[edx+eax]
        	add eax, 4
        	revLoopBreak:
        	loop revLoop
    xor eax, eax
    mov ecx, ebx
    popLoop: ; loop to put the elements into the array in a reverse order
        pop DWORD[edx+eax]
        add eax, 4
        loop popLoop
    ret	;send the function back to the regular code
