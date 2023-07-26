section .data
	result db "the %dth Fibonacci number is: %d",10,0
section .text
	global main

main:
        mov edx,7
	mov eax,0
	mov ebx,1
        mov ecx,1
fibonacci:
        add eax,ebx
        xchg eax,ebx
        inc ecx
        cmp ecx,edx
        jnz fibonacci

        mov eax,1
        xor ebx,ebx
        int 0x80
