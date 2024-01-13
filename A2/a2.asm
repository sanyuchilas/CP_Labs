	.file	"a2.c"
	.intel_syntax noprefix
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC0:
	.ascii "%d\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB10:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	and	esp, -16
	sub	esp, 32
	call	___main
	mov	WORD PTR [esp+30], 2
	mov	BYTE PTR [esp+27], -3
	mov	BYTE PTR [esp+26], 7
/APP
 # 20 "./a2.c" 1
	# вычисляем числитель 

	 mov al, BYTE PTR [esp+27]       # y --> al 
	 cbw              # y --> слово 
	 imul WORD PTR [esp+30]      # x * y 
	 sub ax, 4        # ax - 4 --> ax 
	 # вычсляем знаменатель 

	 mov dl, BYTE PTR [esp+26]       # z --> dl 
	 cbw              # z --> слово 
	 sub dx, 2        # dx - 2 --> dx 

	 mov WORD PTR [esp+28], ax	 sub ax, 2        # ax - 2 --> ax 


 # 0 "" 2
/NO_APP
	movzx	eax, WORD PTR [esp+28]
	cwde
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:LC0
	call	_printf
	mov	eax, 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printf;	.scl	2;	.type	32;	.endef
