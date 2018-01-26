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
	mov ax, 0x338b ;13195
	push eax
	
	; set up space to hold highest prime
	; location ebp-8
	xor eax, eax
	push eax

	; initialize counter to first possible value
	xor ecx, ecx
	mov cl, 0x1

findfactor:
	mov eax, [ebp-4]
	add ecx, 0x2 ;dont need to look at evens
	xor edx, edx
	div ecx
	test eax, eax
	jz printprime
	test edx, edx
	jz testprime
	jmp findfactor

testprime:
	mov eax, ecx
	xor ecx, ecx
	add ecx, 0x2
testprimeloop:
	push eax
	xor edx, edx
	div ecx
	test edx, edx
	pop eax        ;get the findfactor counter back
	mov ebx, ecx   ;temporarially store the testprime counter
	mov ecx, eax   ;put the findfactor counter in the right place for if we jump
	jz findfactor  ;jump if it finds a whole divide
	mov ecx, ebx   ;fix counters in case that jump didnt happen
	inc ecx
	cmp ecx, eax
	jnz testprimeloop
	mov [ebp-8], eax
	mov ecx, eax
	jmp findfactor
	
printprime:
	xor eax, eax
	push eax ;null terminate string
	push 0xa ;push newline
	mov eax, [ebp-8]
itosloop:
	xor edx, edx
	mov ecx, edx
	mov cl, 0xa
	div ecx
	add edx, 0x30
	push edx
	test eax, eax
	jnz itosloop
printloop:
	xor eax, eax
	mov ebx, eax
	mov edx, eax
	mov al, 0x4
	mov bl, 0x1
	lea ecx, [esp]
	mov dl, 0x1
	int 0x80
	pop ecx
	test ecx, ecx
	jnz printloop
	

exit:
	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	int 0x80
