; Gabe Imlay
; CSC322 <10/05/22>
; Project 3: Adding Integers
; This project sums three different arrays of signed integers, 
; and calculate a grand total of all three sums.

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ
bArray:         DB		-1,-2,-3,-4,-5
wArray:         DW		0,1,2,3,4
dArray:         DD		322,322h,322q,1833,1833h
bArraySum:      DB		0
wArraySum:      DW		0
dArraySum:      DD		0
grandTotal:     DD		0

SECTION .bss
; define uninitialized data here

SECTION .text
global _main
_main:

; put your code here.

mov AH ,[bArray]
add AH, [bArray+1]
add AH, [bArray+2]
add AH, [bArray+3]
add AH, [bArray+4]
mov [bArraySum], AH
b1:
mov BX ,[wArray]
add BX, [wArray+2]
add BX, [wArray+4]
add BX, [wArray+6]
add BX, [wArray+8]
mov [wArraySum], BX
b2:
mov EAX ,[dArray]
add EAX, [dArray+4]
add EAX, [dArray+8]
add EAX, [dArray+12]
add EAX, [dArray+16]
mov [dArraySum], EAX
b3:

movsx EBX, byte[bArraySum]
movsx ECX, word[wArraySum]
b4:

add [grandTotal], EAX
add [grandTotal], EBX
add [grandTotal], ECX
lastBreak:


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
