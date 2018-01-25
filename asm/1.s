bits 32
section .text
global _start
_start:
	; set up stack frame
	push ebp
	mov ebp, esp

	; create the running total
	; location ebp-4
	xor eax, eax
	push eax

	; define the starting amount
	mov ecx, 1000
	
	; decrease the starting amount to handle off by 1 errors
	sub ecx, 0x1

loop3:
	mov ebx, 0x3
	jmp checkmod
loop5:
	mov ebx, 0x5
	jmp checkmod
reloop:
	test ecx, ecx
	sub ecx, 0x1
	jz printsum
	jmp loop3

checkmod:
	mov eax, ecx
	push ecx
	xor edx, edx
	div ebx
	pop ecx
	test edx, edx
	jnz changecount
	mov eax, [ebp-4]
	add eax, ecx
	mov [ebp-4], eax
	jmp reloop

changecount:
	cmp ebx, 0x3
	je loop5
	jmp reloop

printsum:
	xor eax, eax
	push eax
	push 0xa
	mov ecx, 0x4
	mov eax, [ebp-4]
buildsumloop:
	mov ebx, 0xa
	xor edx, edx
	div ebx
	add edx, 0x30
	push edx
	add ecx,0x4
	test eax, eax
	jnz buildsumloop
	mov eax, 0x4
	mov ebx, 0x1
	mov edx, ecx
	lea ecx, [esp]
	int 0x80
	jmp exit
		
exit:
	mov eax, 0x1
	xor ebx, ebx
	int 0x80
