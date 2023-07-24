section .data
    result_msg db "The %dth Fibonacci number is: %d", 10, 0
    n equ 10     

section .text
    global _start

_start:
    mov eax, 0
    mov ebx, 1

loop_start:
    add eax, ebx
    xchg eax, ebx

    dec n
    jnz loop_start  ; Jump to loop_start if n is not zero, otherwise, break the loop

    push ebx
    push n
    push dword result_msg
    call printf

    mov eax, 1
    xor ebx, ebx
    int 0x80
