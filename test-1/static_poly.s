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
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movl	8(%rbx), %esi
	callq	Main_add_Int_1
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	Main_add_Bool_1
	popq	%rbx
	retq
.Lfunc_end1:
	.size	Main_main_0, .Lfunc_end1-Main_main_0
	.cfi_endproc
                                        # -- End function
	.globl	Main_add_Int_1          # -- Begin function Main_add_Int_1
	.p2align	4, 0x90
	.type	Main_add_Int_1,@function
Main_add_Int_1:                         # @Main_add_Int_1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%esi, 4(%rsp)
	movl	$.L__unnamed_2, %edi
	movl	$.L__unnamed_3, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end2:
	.size	Main_add_Int_1, .Lfunc_end2-Main_add_Int_1
	.cfi_endproc
                                        # -- End function
	.globl	Main_add_Bool_1         # -- Begin function Main_add_Bool_1
	.p2align	4, 0x90
	.type	Main_add_Bool_1,@function
Main_add_Bool_1:                        # @Main_add_Bool_1
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	andl	$1, %esi
	movb	%sil, 7(%rsp)
	movl	$.L__unnamed_4, %edi
	movl	$.L__unnamed_5, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end3:
	.size	Main_add_Bool_1, .Lfunc_end3-Main_add_Bool_1
	.cfi_endproc
                                        # -- End function
	.globl	Main_ctor               # -- Begin function Main_ctor
	.p2align	4, 0x90
	.type	Main_ctor,@function
Main_ctor:                              # @Main_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	$__unnamed_6, (%rdi)
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

	.type	__unnamed_6,@object     # @1
	.globl	__unnamed_6
	.p2align	4
__unnamed_6:
	.quad	Main_main_0
	.quad	Main_add_Int_1
	.quad	Main_add_Bool_1
	.size	__unnamed_6, 24

	.type	.L__unnamed_2,@object   # @2
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_2:
	.asciz	"%s\n"
	.size	.L__unnamed_2, 4

	.type	.L__unnamed_3,@object   # @3
.L__unnamed_3:
	.asciz	"add_with_Int"
	.size	.L__unnamed_3, 13

	.type	.L__unnamed_4,@object   # @4
.L__unnamed_4:
	.asciz	"%s\n"
	.size	.L__unnamed_4, 4

	.type	.L__unnamed_5,@object   # @5
.L__unnamed_5:
	.asciz	"add_with_Bool"
	.size	.L__unnamed_5, 14


	.section	".note.GNU-stack","",@progbits
