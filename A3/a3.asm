	.file	"a3.c"
	.intel_syntax noprefix
	.text
	.globl	_convertSIntoIntArray
	.def	_convertSIntoIntArray;	.scl	2;	.type	32;	.endef
_convertSIntoIntArray:
LFB13:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 0
	jmp	L2
L3:
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	ecx, DWORD PTR [ebp-4]
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	movzx	edx, BYTE PTR [edx]
	sub	edx, 48
	mov	BYTE PTR [eax], dl
	add	DWORD PTR [ebp-4], 1
L2:
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	jne	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.globl	_convertIntArrayIntoS
	.def	_convertIntArrayIntoS;	.scl	2;	.type	32;	.endef
_convertIntArrayIntoS:
LFB14:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 16
	mov	DWORD PTR [ebp-4], 0
	jmp	L5
L6:
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	mov	ecx, DWORD PTR [ebp-4]
	mov	edx, DWORD PTR [ebp+8]
	add	edx, ecx
	movzx	edx, BYTE PTR [edx]
	add	edx, 48
	mov	BYTE PTR [eax], dl
	add	DWORD PTR [ebp-4], 1
L5:
	mov	edx, DWORD PTR [ebp-4]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	test	al, al
	jne	L6
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC0:
	.ascii "Please, enter string of four decimal digits without spaces: \0"
LC1:
	.ascii "%s\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB15:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	and	esp, -16
	sub	esp, 32
	.cfi_offset 3, -12
	call	___main
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	eax, DWORD PTR __imp___iob
	mov	DWORD PTR [esp+8], eax
	mov	DWORD PTR [esp+4], 6
	lea	eax, [esp+28]
	mov	DWORD PTR [esp], eax
	call	_fgets
	lea	eax, [esp+28]
	mov	DWORD PTR [esp], eax
	call	_strlen
	sub	eax, 1
	mov	BYTE PTR [esp+28+eax], 0
	lea	eax, [esp+28]
	mov	DWORD PTR [esp], eax
	call	_convertSIntoIntArray
/APP
 # 71 ".\a3.c" 1
	mov al, BYTE PTR [esp+31] 
cbw 
mov bl, 5 
div bl 
mov bl, BYTE PTR [esp+29] 
cmp ah, bl 
jne C 
mov bl, BYTE PTR [esp+30] 
cmp al, bl 
jne C 
mov bl, 0 
cmp al, bl 
je EXIT 
dec al 
mov BYTE PTR [esp+31], al 
jmp EXIT 
C: 
mov bl, BYTE PTR [esp+28] 
mov BYTE PTR [esp+30], bl 
mov BYTE PTR [esp+31], bl 
EXIT: 
nop
 # 0 "" 2
/NO_APP
	lea	eax, [esp+28]
	mov	DWORD PTR [esp], eax
	call	_convertIntArrayIntoS
	lea	eax, [esp+28]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	mov	eax, 0
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fgets;	.scl	2;	.type	32;	.endef
	.def	_strlen;	.scl	2;	.type	32;	.endef
