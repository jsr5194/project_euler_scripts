bits 32
section .text
global _start
_start:
	;ref http://x86asm.net/articles/working-with-big-numbers-using-x86-instructions/
	push ebp
	mov ebp, esp

	;;allocate space for the bignum
	xor eax, eax
	;loc ebp-4 as bignum_low
	push eax 
	;loc ebp-8 as bignum_hi
	push eax 

	mov eax, 0xe589eac7
	mov [ebp-4], eax
	mov eax, 0x8b
	mov [ebp-8], eax

	; set up divisor
	mov ebx, 0xa

	; prep edx
	xor edx, edx

	; division starting from the top
	mov eax, [ebp-8]
	div ebx
	mov [ebp-8], eax

	; next level of division
	mov eax, [ebp-4]
	div ebx ;interesting that this time edx doesnt get nulled
	mov [ebp-4], eax

	;edx holds remainder

print:
	mov ecx, 0x2
	mov eax, [ebp-8]
printloop:
	mov ebx, 0xa
	xor edx, edx
	div ebx
	add edx, 0x30
	push eax ;save result for later
	push ecx ;save counter for later
	mov eax, 0x4
	mov ebx, 0x1
	push edx
	lea ecx, [esp]
	mov edx, 0x1
	pop edx
	int 0x80
	pop ecx ;get counter back
	pop eax ; get result back
	test eax, eax
	jnz printloop
	sub ecx, 0x1
	mov eax, 0x4
	
	test ecx, ecx
	jnz printloop
		

exit:
	mov eax, 0x1
	xor ebx, ebx
	int 0x80	
