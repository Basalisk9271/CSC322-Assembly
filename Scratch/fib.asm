; define the array to store the Fibonacci numbers
fib_array   WORD   1, 1, 0, 0, 0, 0, 0, 0, 0, 0

; define the word registers we will use
%define fib_n1   %ax
%define fib_n2   %bx
%define fib_sum  %cx

; initialize the fib_n1 and fib_n2 registers with the first two Fibonacci numbers
mov fib_n1, 1
mov fib_n2, 1

; iterate 10 times to generate the first 10 Fibonacci numbers
fib_loop:
  ; calculate the sum of the previous two numbers
  mov fib_sum, fib_n1
  add fib_sum, fib_n2

  ; store the sum in the array
  mov [fib_array+2*%counter], fib_sum

  ; update the fib_n1 and fib_n2 registers for the next iteration
  mov fib_n1, fib_n2
  mov fib_n2, fib_sum

  ; increment the counter and check if we have reached 10 yet
  inc %counter
  cmp %counter, 10
  jl fib_loop

; exit the program
mov %ax, 0
int 0x80