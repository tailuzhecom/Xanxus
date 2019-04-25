	.text
	.file	"Xanxus"
	.globl	Object_ctor             # -- Begin function Object_ctor
	.p2align	4, 0x90
	.type	Object_ctor,@function
Object_ctor:                            # @Object_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	retq
.Lfunc_end0:
	.size	Object_ctor, .Lfunc_end0-Object_ctor
	.cfi_endproc
                                        # -- End function
	.globl	Collection_ctor         # -- Begin function Collection_ctor
	.p2align	4, 0x90
	.type	Collection_ctor,@function
Collection_ctor:                        # @Collection_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$fib, (%rax)
	retq
.Lfunc_end1:
	.size	Collection_ctor, .Lfunc_end1-Collection_ctor
	.cfi_endproc
                                        # -- End function
	.globl	A_add                   # -- Begin function A_add
	.p2align	4, 0x90
	.type	A_add,@function
A_add:                                  # @A_add
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %edi
	callq	fib
	movl	%eax, %ecx
	movl	$.L__unnamed_3, %edi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf
	popq	%rcx
	retq
.Lfunc_end2:
	.size	A_add, .Lfunc_end2-A_add
	.cfi_endproc
                                        # -- End function
	.globl	A_ctor                  # -- Begin function A_ctor
	.p2align	4, 0x90
	.type	A_ctor,@function
A_ctor:                                 # @A_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$A_add, (%rax)
	retq
.Lfunc_end3:
	.size	A_ctor, .Lfunc_end3-A_ctor
	.cfi_endproc
                                        # -- End function
	.globl	B_add                   # -- Begin function B_add
	.p2align	4, 0x90
	.type	B_add,@function
B_add:                                  # @B_add
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -4(%rsp)
	movl	$1, %eax
	retq
.Lfunc_end4:
	.size	B_add, .Lfunc_end4-B_add
	.cfi_endproc
                                        # -- End function
	.globl	B_ctor                  # -- Begin function B_ctor
	.p2align	4, 0x90
	.type	B_ctor,@function
B_ctor:                                 # @B_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$B_add, (%rax)
	retq
.Lfunc_end5:
	.size	B_ctor, .Lfunc_end5-B_ctor
	.cfi_endproc
                                        # -- End function
	.globl	Main_main               # -- Begin function Main_main
	.p2align	4, 0x90
	.type	Main_main,@function
Main_main:                              # @Main_main
	.cfi_startproc
# %bb.0:                                # %merge
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	$0, 12(%rsp)
	movl	$3, 8(%rbx)
	callq	Main_add
	movq	16(%rbx), %rdi
	callq	A_add
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end6:
	.size	Main_main, .Lfunc_end6-Main_main
	.cfi_endproc
                                        # -- End function
	.globl	Main_add                # -- Begin function Main_add
	.p2align	4, 0x90
	.type	Main_add,@function
Main_add:                               # @Main_add
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -4(%rsp)
	movl	$1, %eax
	retq
.Lfunc_end7:
	.size	Main_add, .Lfunc_end7-Main_add
	.cfi_endproc
                                        # -- End function
	.globl	Main_ctor               # -- Begin function Main_ctor
	.p2align	4, 0x90
	.type	Main_ctor,@function
Main_ctor:                              # @Main_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$Main_add, 8(%rax)
	movq	$Main_main, (%rax)
	retq
.Lfunc_end8:
	.size	Main_ctor, .Lfunc_end8-Main_ctor
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	$.L__unnamed_4, %edi
	callq	puts
	movq	%rsp, %rdi
	callq	Main_main
	addq	$24, %rsp
	retq
.Lfunc_end9:
	.size	main, .Lfunc_end9-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_4,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_4:
	.asciz	"hello world!\n"
	.size	.L__unnamed_4, 14

	.type	.L__unnamed_1,@object   # @1
.L__unnamed_1:
	.asciz	"%s\n"
	.size	.L__unnamed_1, 4

	.type	.L__unnamed_2,@object   # @2
.L__unnamed_2:
	.asciz	"A::add()"
	.size	.L__unnamed_2, 9

	.type	.L__unnamed_3,@object   # @3
.L__unnamed_3:
	.asciz	"%d\n"
	.size	.L__unnamed_3, 4


	.section	".note.GNU-stack","",@progbits
