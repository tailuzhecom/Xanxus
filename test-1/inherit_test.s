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
	.globl	A_ctor                  # -- Begin function A_ctor
	.p2align	4, 0x90
	.type	A_ctor,@function
A_ctor:                                 # @A_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	$__unnamed_2, (%rdi)
	retq
.Lfunc_end1:
	.size	A_ctor, .Lfunc_end1-A_ctor
	.cfi_endproc
                                        # -- End function
	.globl	Main_inherit_test_0     # -- Begin function Main_inherit_test_0
	.p2align	4, 0x90
	.type	Main_inherit_test_0,@function
Main_inherit_test_0:                    # @Main_inherit_test_0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$10, 8(%rdi)
	movl	$.L__unnamed_3, %edi
	movl	$10, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end2:
	.size	Main_inherit_test_0, .Lfunc_end2-Main_inherit_test_0
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
	callq	Main_inherit_test_0
	popq	%rcx
	retq
.Lfunc_end3:
	.size	Main_main_0, .Lfunc_end3-Main_main_0
	.cfi_endproc
                                        # -- End function
	.globl	Main_ctor               # -- Begin function Main_ctor
	.p2align	4, 0x90
	.type	Main_ctor,@function
Main_ctor:                              # @Main_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	$__unnamed_4, (%rdi)
	retq
.Lfunc_end4:
	.size	Main_ctor, .Lfunc_end4-Main_ctor
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
	movq	%rsp, %rbx
	movq	%rbx, %rdi
	callq	Main_ctor
	movq	%rbx, %rdi
	callq	Main_main_0
	addq	$16, %rsp
	popq	%rbx
	retq
.Lfunc_end5:
	.size	main, .Lfunc_end5-main
	.cfi_endproc
                                        # -- End function
	.type	__unnamed_1,@object     # @0
	.section	.rodata,"a",@progbits
	.globl	__unnamed_1
	.p2align	3
__unnamed_1:
	.size	__unnamed_1, 0

	.type	__unnamed_2,@object     # @1
	.globl	__unnamed_2
	.p2align	3
__unnamed_2:
	.size	__unnamed_2, 0

	.type	__unnamed_4,@object     # @2
	.globl	__unnamed_4
	.p2align	3
__unnamed_4:
	.quad	Main_inherit_test_0
	.quad	Main_main_0
	.size	__unnamed_4, 16

	.type	.L__unnamed_3,@object   # @3
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_3:
	.asciz	"%d\n"
	.size	.L__unnamed_3, 4


	.section	".note.GNU-stack","",@progbits