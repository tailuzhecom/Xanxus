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
	.globl	A_add_0                 # -- Begin function A_add_0
	.p2align	4, 0x90
	.type	A_add_0,@function
A_add_0:                                # @A_add_0
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.L__unnamed_1, %edi
	movl	$.L__unnamed_2, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end1:
	.size	A_add_0, .Lfunc_end1-A_add_0
	.cfi_endproc
                                        # -- End function
	.globl	A_ctor                  # -- Begin function A_ctor
	.p2align	4, 0x90
	.type	A_ctor,@function
A_ctor:                                 # @A_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$A_add_0, (%rax)
	retq
.Lfunc_end2:
	.size	A_ctor, .Lfunc_end2-A_ctor
	.cfi_endproc
                                        # -- End function
	.globl	B_add_0                 # -- Begin function B_add_0
	.p2align	4, 0x90
	.type	B_add_0,@function
B_add_0:                                # @B_add_0
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$0, -4(%rsp)
	xorl	%eax, %eax
	retq
.Lfunc_end3:
	.size	B_add_0, .Lfunc_end3-B_add_0
	.cfi_endproc
                                        # -- End function
	.globl	B_ctor                  # -- Begin function B_ctor
	.p2align	4, 0x90
	.type	B_ctor,@function
B_ctor:                                 # @B_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$B_add_0, (%rax)
	retq
.Lfunc_end4:
	.size	B_ctor, .Lfunc_end4-B_ctor
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
	movl	$16, %edi
	callq	malloc
	movq	%rax, 16(%rbx)
	movl	8(%rbx), %esi
	movq	%rbx, %rdi
	callq	Main_add_Int_1
	movl	$1, %esi
	movq	%rbx, %rdi
	callq	Main_add_Bool_1
	popq	%rbx
	retq
.Lfunc_end5:
	.size	Main_main_0, .Lfunc_end5-Main_main_0
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
	movl	$.L__unnamed_3, %edi
	movl	$.L__unnamed_4, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end6:
	.size	Main_add_Int_1, .Lfunc_end6-Main_add_Int_1
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
	movl	$.L__unnamed_5, %edi
	movl	$.L__unnamed_6, %esi
	xorl	%eax, %eax
	callq	printf
	popq	%rcx
	retq
.Lfunc_end7:
	.size	Main_add_Bool_1, .Lfunc_end7-Main_add_Bool_1
	.cfi_endproc
                                        # -- End function
	.globl	Main_ctor               # -- Begin function Main_ctor
	.p2align	4, 0x90
	.type	Main_ctor,@function
Main_ctor:                              # @Main_ctor
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	$Main_add_Bool_1, 16(%rax)
	movq	$Main_add_Int_1, 8(%rax)
	movq	$Main_main_0, (%rax)
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
	movq	%rsp, %rdi
	callq	Main_main_0
	addq	$24, %rsp
	retq
.Lfunc_end9:
	.size	main, .Lfunc_end9-main
	.cfi_endproc
                                        # -- End function
	.type	.L__unnamed_1,@object   # @0
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__unnamed_1:
	.asciz	"%s\n"
	.size	.L__unnamed_1, 4

	.type	.L__unnamed_2,@object   # @1
.L__unnamed_2:
	.asciz	"A::add()"
	.size	.L__unnamed_2, 9

	.type	.L__unnamed_3,@object   # @2
.L__unnamed_3:
	.asciz	"%s\n"
	.size	.L__unnamed_3, 4

	.type	.L__unnamed_4,@object   # @3
.L__unnamed_4:
	.asciz	"add_with_Int"
	.size	.L__unnamed_4, 13

	.type	.L__unnamed_5,@object   # @4
.L__unnamed_5:
	.asciz	"%s\n"
	.size	.L__unnamed_5, 4

	.type	.L__unnamed_6,@object   # @5
.L__unnamed_6:
	.asciz	"add_with_Bool"
	.size	.L__unnamed_6, 14


	.section	".note.GNU-stack","",@progbits
