; Bob Allen
; Printing colors
; Fall 2022

SECTION .data

; Some messages with 2 'new line' chars
msg1    db "No Shave November.", 10, 10
msg2    db "Love CSC 322!", 10, 10
msg3    db "Go Mercer Bears!!!!!!!", 10, 10
msg4    db "Eat Chili!", 10, 10

; Color sequences ** NOTE:  all color sequences have a length of 5
;        note2:  1bh is the ASCII code for the <esc> key

black:	db 1bh, "[30m"  ;;; black foreground
red:	db 1bh, "[31m"  ;;; red foreground
green:	db 1bh, "[32m" 	;;; green foreground
yellow:	db 1bh, "[33m" 	;;; yellow foreground
blue:	db 1bh, "[34m" 	;;; blue foreground
magenta:db 1bh, "[35m" 	;;; magenta foreground
cyan:	db 1bh, "[36m" 	;;; cyan foreground
white:	db 1bh, "[37m" 	;;; white foreground

; Way to clear the screen
cls:	db 1bh, "[2J"

SECTION .text
global _main
_main:

;;;;;  Print Clear the screen
	mov	eax,4
	mov	ebx,1
	mov 	ecx,cls
	mov	edx,4
	int 	80h

;;;   set color to red
	mov	eax,4
	mov	ebx,1
	mov 	ecx,red
	mov	edx,5
	int	80h

;;;; 	print first message
	mov	eax,4
	mov	ebx,1
	mov 	ecx,msg1
	mov	edx,20
	int 	80h

;;;   set color to blue
	mov	eax,4
	mov	ebx,1
	mov 	ecx,blue
	mov	edx,5
	int	80h

;;;; 	print second message
	mov	eax,4
	mov	ebx,1
	mov 	ecx,msg2
	mov	edx,15
	int 	80h

;;;   set color to green
	mov	eax,4
	mov	ebx,1
	mov 	ecx,green
	mov	edx,5
	int	80h

;;;; 	print third  message
	mov	eax,4
	mov	ebx,1
	mov 	ecx,msg3
	mov	edx,24
	int 	80h

;;;   set color to magenta
	mov	eax,4
	mov	ebx,1
	mov 	ecx,magenta
	mov	edx,5
	int	80h

;;;; 	print fourth  message
	mov	eax,4
	mov	ebx,1
	mov 	ecx,msg4
	mov	edx,12
	int 	80h

;;;   set color to white
	mov	eax,4
	mov	ebx,1
	mov 	ecx,yellow
	mov	edx,5
	int	80h


; Normal termination code
	mov eax, 1
	mov ebx, 0
	int 80h
