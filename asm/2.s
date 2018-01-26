bits 32
section .text
global _start
_start:
	; set up stack frame
	push ebp
	mov ebp, esp

	; build space for running total
	; location ebp-4
	xor eax, eax
	mov al, 0x2 ; handle the even that gets preloaded
	push eax

	; space for two prior
	mov al, 0x1
	push eax
	; space for one prior
	mov al, 0x2
	push eax


getfib:
	; load the prior and two prior
	mov eax, [ebp-12]
	mov ebx, [ebp-8]

	; set the new prior to the old prior
	mov [ebp-8], eax

	; calculate sum
	add eax, ebx

	; store new sum into prior
	mov [ebp-12], eax

	; check to see if the sum is greater than 4mil
	; value needs to end at 4 mil, extra math is to remove nulls
	push eax       ; save eax for later
	xor eax, eax   ; null out eax
	mov ecx, eax   ; null out ecx
	mov ax, 0x07d0 ; the value 2000
	mov cx, ax     ; setting up to do a squared operation
	mul ecx        ; multiply 2000*2000=4000000
	mov ecx, eax   ; put it into the necessary register
	pop eax        ; get eax back
	sub ecx, eax
	js printsum

	; check to see if the value is even
	xor edx, edx
	push eax
	xor ecx, ecx
	mov cl, 0x2
	div ecx
	test edx, edx
	jnz getfib
	pop eax

	; add sum to running total
	mov ebx, [ebp-4]
	add ebx, eax
	mov [ebp-4], ebx

	jmp getfib

printsum:
	xor eax, eax
	push eax
	mov al, 0xa
	push eax
	mov eax, [ebp-4]
printsumloop:
	xor edx, edx
	xor ebx, ebx
	mov bl, 0xa
	div ebx
	add edx, 0x30
	push edx
	test eax, eax
	jnz printsumloop
printloop:
	xor eax, eax
	mov ebx, eax
	mov edx, eax
	mov al, 0x4
	mov bl, 0x1
	lea ecx, [esp]
	mov dl, 0x1
	int 0x80
	pop eax
	test eax, eax
	jnz printloop
	nop

exit:
	xor eax, eax
	mov al, 0x1
	xor ebx, ebx
	int 0x80		
	
