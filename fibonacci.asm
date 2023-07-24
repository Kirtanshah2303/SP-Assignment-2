section .data
    result_msg db 'The %dth Fibonacci number is: %d', 10, 0
    n equ 10          ; Replace 10 with the desired value of n

section .text
    global _start

_start:
    mov eax, 0   ; fib[0] = 0
    mov ebx, 1   ; fib[1] = 1
    mov ecx, 2   ; Start the loop from index 2
loop_start:
    add eax, ebx
    xchg eax, ebx
    dec dword [n]   ; Decrement the value of n
    jnz loop_start  ; Continue the loop if n is not zero

    ; Print the result directly without using printf
    mov rsi, n
    mov rdi, result_msg
    mov rax, 0x1     ; System call number for write
    mov rdx, 26      ; Length of the message (adjust if needed)
    syscall

    ; Exit the program
    xor edi, edi     ; System call number for exit
    call exit
