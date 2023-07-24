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

    mov r10, rbx
    mov rdi, result_msg  
    mov rsi, n           
    mov rdx, r10        
    call printf

    mov rbx, r10

    xor edi, edi         ; System call number for exit
    call exit
