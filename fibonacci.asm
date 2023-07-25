section .data
    result_msg db 'The %dth Fibonacci number is: %d', 10, 0
    n equ 10          ; Replace 10 with the desired value of n

section .text
    global main

main:
    mov eax, 0   ; fib[0] = 0
    mov ebx, 1   ; fib[1] = 1
    mov ecx, 2   ; Start the loop from index 2

loop_start:
    add eax, ebx
    xchg eax, ebx
    inc ecx
    cmp ecx, dword[n]
    jnz loop_start  ; Continue the loop if n is not zerio
    mov eax, 1
    xor ebx, ebx
    int 0x80
