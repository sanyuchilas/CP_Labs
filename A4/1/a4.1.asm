	.file	"a4.1.c"
	.intel_syntax noprefix
	.globl	_testCounter
	.data
	.align 4
_testCounter:
	.long	1
	.section .rdata,"dr"
LC0:
	.ascii "%d\0"
LC1:
	.ascii ", %d\0"
	.text
	.globl	_printArray
	.def	_printArray;	.scl	2;	.type	32;	.endef
_printArray:
LFB13:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	sub	esp, 40
	cmp	DWORD PTR [ebp+12], 0
	je	L6
	mov	eax, DWORD PTR [ebp+8]
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	DWORD PTR [ebp-12], 1
	jmp	L4
L5:
	mov	edx, DWORD PTR [ebp-12]
	mov	eax, DWORD PTR [ebp+8]
	add	eax, edx
	movzx	eax, BYTE PTR [eax]
	movsx	eax, al
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC1
	call	_printf
	add	DWORD PTR [ebp-12], 1
L4:
	mov	eax, DWORD PTR [ebp-12]
	cmp	eax, DWORD PTR [ebp+12]
	jl	L5
	mov	DWORD PTR [esp], 10
	call	_putchar
	jmp	L1
L6:
	nop
L1:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.section .rdata,"dr"
LC2:
	.ascii "Test %d.\12\0"
LC3:
	.ascii "A: \0"
LC4:
	.ascii "B: \0"
	.text
	.globl	_test
	.def	_test;	.scl	2;	.type	32;	.endef
_test:
LFB14:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	edi
	push	esi
	push	ebx
	sub	esp, 108
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	mov	eax, DWORD PTR _testCounter
	lea	edx, [eax+1]
	mov	DWORD PTR _testCounter, edx
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC2
	call	_printf
	mov	DWORD PTR [esp], OFFSET FLAT:LC3
	call	_printf
	mov	eax, DWORD PTR [ebp+8]
	mov	DWORD PTR [esp+4], 16
	mov	DWORD PTR [esp], eax
	call	_printArray
	mov	DWORD PTR [ebp-39], 0
	mov	DWORD PTR [ebp-35], 0
	mov	DWORD PTR [ebp-31], 0
	mov	WORD PTR [ebp-27], 0
	mov	BYTE PTR [ebp-25], 0
	lea	edx, [ebp-100]
	mov	eax, 0
	mov	ecx, 15
	mov	edi, edx
	rep stosd
	mov	DWORD PTR [ebp-104], 0
/APP
 # 30 ".\a4.1.c" 1
	lea esi, DWORD PTR [ebp+8];      
lea edi, [ebp-39];      
mov ecx, 15;      
mov al, 16 
mov [edi], al 

 # 0 "" 2
/NO_APP
	mov	DWORD PTR [esp], OFFSET FLAT:LC4
	call	_printf
	mov	DWORD PTR [esp+4], 15
	lea	eax, [ebp-39]
	mov	DWORD PTR [esp], eax
	call	_printArray
	nop
	add	esp, 108
	pop	ebx
	.cfi_restore 3
	pop	esi
	.cfi_restore 6
	pop	edi
	.cfi_restore 7
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.def	___main;	.scl	2;	.type	32;	.endef
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
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	BYTE PTR [esp+16], 15
	mov	BYTE PTR [esp+17], 14
	mov	BYTE PTR [esp+18], 13
	mov	BYTE PTR [esp+19], 12
	mov	BYTE PTR [esp+20], 11
	mov	BYTE PTR [esp+21], 10
	mov	BYTE PTR [esp+22], 9
	mov	BYTE PTR [esp+23], 8
	mov	BYTE PTR [esp+24], 7
	mov	BYTE PTR [esp+25], 6
	mov	BYTE PTR [esp+26], 5
	mov	BYTE PTR [esp+27], 4
	mov	BYTE PTR [esp+28], 3
	mov	BYTE PTR [esp+29], 2
	mov	BYTE PTR [esp+30], 1
	mov	BYTE PTR [esp+31], 0
	lea	eax, [esp+16]
	mov	DWORD PTR [esp], eax
	call	_test
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef
