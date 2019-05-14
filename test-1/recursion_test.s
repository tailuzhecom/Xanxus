	.text
	.file	"Xanxus"
	.globl	Object_ctor             # -- Begin function Object_ctor
	.p2align	4, 0x90
	.type	Object_ctor,@function
Object_ctor:                            # @Object_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	$__unnamed_1, (%rdi)
	retq
.Lfunc_end0:
	.size	Object_ctor, .Lfunc_end0-Object_ctor
	.cfi_endproc
                                        # -- End function
	.globl	Main_main_0             # -- Begin function Main_main_0
	.p2align	4, 0x90
	.type	Main_main_0,@function
Main_main_0:                            # @Main_main_0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$1, %esi
	callq	Main_sum_Int_1
	movl	%eax, %ecx
	movl	$.L__unnamed_2, %edi
	xorl	%eax, %eax
	movl	%ecx, %esi
	callq	printf
	popq	%rcx
	retq
.Lfunc_end1:
	.size	Main_main_0, .Lfunc_end1-Main_main_0
	.cfi_endproc
                                        # -- End function
	.globl	Main_sum_Int_1          # -- Begin function Main_sum_Int_1
	.p2align	4, 0x90
	.type	Main_sum_Int_1,@function
Main_sum_Int_1:                         # @Main_sum_Int_1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movl	%esi, 12(%rsp)
	movl	$10, %eax
	cmpl	$9, %esi
	jg	.LBB2_2
# %bb.1:                                # %then
	movl	12(%rsp), %ebx
	leal	1(%rbx), %esi
	callq	Main_sum_Int_1
	addl	%ebx, %eax
.LBB2_2:                                # %merge
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end2:
	.size	Main_sum_Int_1, .Lfunc_end2-Main_sum_Int_1
	.cfi_endproc
                                        # -- End function
	.globl	Main_ctor               # -- Begin function Main_ctor
	.p2align	4, 0x90
	.type	Main_ctor,@function
Main_ctor:                              # @Main_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	$__unnamed_3, (%rdi)
	retq
.Lfunc_end3:
	.size	Main_ctor, .Lfunc_end3-Main_ctor
	.cfi_endproc
                                        # -- End function
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	leaq	8(%rsp), %rbx
	movq	%rbx, %rdi
	callq	Main_ctor
	movq	%rbx, %rdi
	callq	Main_main_0
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
	.cfi_endproc
                                        # -- End function
	.type	__unnamed_1,@object     # @0
	.section	.rodata,"a",@progbits
	.globl	__unnamed_1
	.p2align	3
__unnamed_1:
	.size	__unnamed_1, 0

	.type	__unnamed_3,@object     # @1
	.globl	__unnamed_3
	.p2align	3
__unnamed_3:
	.quad	Main_main_0
	.quad	Main_sum_Int_1
	.size	__unnamed_3, 16

	.type	.L__unnamed_2,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"%d\n"
	.size	.L__unnamed_2, 4


	.section	".note.GNU-stack","",@progbits
