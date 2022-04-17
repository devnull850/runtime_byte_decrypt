
	.section .text
	.globl _start

_start:

	jmp	.L0
.L2:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
.L0:
	pushq	$0xa
	popq	%rax
	movl	$0x401000,%edi
	movl	$0x1000,%esi
	pushq	$7
	popq	%rdx
	syscall
	xorl	%ecx,%ecx
	movl	$0x40107a,%eax
.L1:
	leaq	(%rax,%rcx,4),%rbx
	xorl	$0xae1fc0de,(%rbx)
	incl	%ecx
	cmpb	$0xb,%cl
	jl	.L1
	jmp	.L2

