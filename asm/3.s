bits 32
section .text
global _start
_start:
	; set up stack frame
	push ebp
	mov ebp, esp

	; set up space for the divisor
	; location ebp-4
	xor eax, eax
	mov ax, 0x338b
	
	; set up space to hold highest prime
	; location ebp-8
	xor eax, eax
	push eax

	; initialize the divisor
	mov eax, [ebp-4] 

	; initialize counter to first possible value
	xor ecx, ecx
	mov cl, 0x1

findfactor:
	add ecx, 0x2 ;dont need to look at evens
	xor edx, edx
	div ecx
	test eax, eax
	jz printprime
	test edx, edx
	jz testprime
	jmp findfactor

testprime:
	nop	


printprime:
	nop
