section .text
	global main

main:
	mov eax,5
	mov ebx,48
	add eax, ebx
	
	mov eax,1
	xor ebx,ebx
	int 0x80
