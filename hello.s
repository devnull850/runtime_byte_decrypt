
	.section .text
	.globl _start

_start:

	movq	$0xa21646c726f,%rax
	pushq	%rax
	movq	$0x57202c6f6c6c6548,%rax
	pushq	%rax
	pushq	$1
	popq	%rax
	pushq	$1
	popq	%rdi
	movq	%rsp,%rsi
	pushq	$0xe
	popq	%rdx
	syscall
	pushq	$0x3c
	popq	%rax
	xorl	%edi,%edi
	syscall

