; Bob Allen
; Demo of conditionals to determine maxint
; Fall 2022
; Just another day of fun in CSC 322

SECTION .data
; define data/variables here.  Think DB, DW, DD, DQ

SECTION .bss
; define uninitialized data here
maxDB: RESB 1
maxDW: RESW 1
maxDD: RESD 1

SECTION .text
global _main
_main:

; use AL to hold the unsigned int, 
; start it out at 0
	mov AL,0

; Repeat adding AL to AL until there is a carry (unsigned int didn't fit)
topDB:
	mov BL,AL   ; save a copy of the int
	add AL,1    ; increment the int
	jnc topDB   ; if there was not a carry, keep looping
	            ; otherwise BL has the max unsigned in	
	mov [maxDB],BL

; use AX to hold the unsigned int, 
; start it out at 0
	mov AX,0
topDW:
	mov BX,AX   ; save a copy of the int
	add AX,1    ; increment the int
	jnc topDW   ; if there was not a carry, keep looping
	            ; otherwise BL has the max unsigned in	
	mov [maxDW],BX

; use EAX to hold the unsigned int, 
; start it out at 0
topDD:
	mov EBX,EAX   ; save a copy of the int
	add EAX,1     ; increment the int
	jnc topDD   ; if there was not a carry, keep looping
	            ; otherwise BL has the max unsigned in	
	mov [maxDD],EBX

lastBreak:


; Normal termination code
mov eax, 1
mov ebx, 0
int 80h
