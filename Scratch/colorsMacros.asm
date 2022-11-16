; Bob Allen
; Printing colors and messages with Macros
; Fall 2022

%macro printIt 2
  	pusha
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
	popa
%endmacro

;;;;;  String, len, color
%macro prtWithColor 3
	printIt %3, 5
	printIt %1, %2
%endmacro

SECTION .data
; Clear Screen control characters 
cls	db	1bh, '[2J' 
clsLen	dd $-cls

; Reset console colors
reset 	db	1bh,'[0m'
resetLen dd $-reset

; Some messages with their lengths
msg1    db "No Shave November.", 10, 10
msg1Len dd $-msg1
msg2    db "Love CSC 322!!.", 10, 10
msg2Len dd $-msg2
msg3    db "Go Mercer Bears!!!!!!!", 10, 10
msg3Len dd $-msg3
msg4    db "Eat Chili!", 10, 10
msg4Len dd $-msg4
msg5	db "Jesse Mercer", 10, 10
msg5Len dd $-msg5

; Color sequences ** NOTE:  all color sequences have a length of 5
colorLen: dd 5

black:	db 1bh, "[30m"  ;;; black foreground
red:	db 1bh, "[31m"  ;;; red foreground
green:	db 1bh, "[32m" 	;;; green foreground
yellow:	db 1bh, "[33m" 	;;; yellow foreground
blue:	db 1bh, "[34m" 	;;; blue foreground
magenta:db 1bh, "[35m" 	;;; magenta foreground
cyan:	db 1bh, "[36m" 	;;; cyan foreground
white:	db 1bh, "[37m" 	;;; white foreground


SECTION .text
global _main
_main:

mov eax,1
mov ebx,2
mov ecx,3
mov edx,322

;;;;;  Print Clear the screen
	printIt cls, [clsLen]

;;;;;  Print some messages
	printIt msg1,[msg1Len]
	printIt msg2,[msg2Len]
	printIt msg3,[msg3Len]
	printIt msg4,[msg4Len]
	printIt msg5,[msg5Len]
	
;;;;;  Print some messages WITH COLORS
	prtWithColor msg1,[msg1Len], red
	prtWithColor msg2,[msg2Len], green
	prtWithColor msg3,[msg3Len], blue
	prtWithColor msg4,[msg4Len], magenta
	prtWithColor msg5,[msg5Len], cyan
	


lastBreak:
; Normal termination code
	mov eax, 1
	mov ebx, 0
	int 80h
