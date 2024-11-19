	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LVL0:
.LFB23:
	.file 1 "simplesync.c"
	.loc 1 42 1 view -0
	.cfi_startproc
	.loc 1 43 2 view .LVU1
	.loc 1 44 2 view .LVU2
	.loc 1 42 1 is_stmt 0 view .LVU3
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 46 2 view .LVU4
	movl	$10000000, %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	.loc 1 44 16 view .LVU5
	movq	%rdi, 8(%rsp)
	.loc 1 46 2 is_stmt 1 view .LVU6
	movq	stderr(%rip), %rdi
.LVL1:
	.loc 1 46 2 is_stmt 0 view .LVU7
	call	fprintf@PLT
.LVL2:
	.loc 1 47 2 is_stmt 1 view .LVU8
	.loc 1 47 14 view .LVU9
	.loc 1 46 2 is_stmt 0 view .LVU10
	movl	$10000000, %eax
.LVL3:
	.p2align 4,,10
	.p2align 3
.L2:
	.loc 1 48 3 is_stmt 1 view .LVU11
	.loc 1 51 4 view .LVU12
	lock addq	$1, 8(%rsp)
	.loc 1 64 5 view .LVU13
	.loc 1 47 21 view .LVU14
.LVL4:
	.loc 1 47 14 view .LVU15
	.loc 1 47 2 is_stmt 0 view .LVU16
	subl	$1, %eax
.LVL5:
	.loc 1 47 2 view .LVU17
	jne	.L2
	.loc 1 67 2 is_stmt 1 view .LVU18
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC1(%rip), %rdi
	call	fwrite@PLT
.LVL6:
	.loc 1 69 2 view .LVU19
	.loc 1 70 1 is_stmt 0 view .LVU20
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC2:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC3:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL7:
.LFB24:
	.loc 1 73 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 74 2 view .LVU22
	.loc 1 75 2 view .LVU23
	.loc 1 73 1 is_stmt 0 view .LVU24
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	.loc 1 77 2 view .LVU25
	movl	$10000000, %edx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	.loc 1 75 16 view .LVU26
	movq	%rdi, 8(%rsp)
	.loc 1 77 2 is_stmt 1 view .LVU27
	movq	stderr(%rip), %rdi
.LVL8:
	.loc 1 77 2 is_stmt 0 view .LVU28
	call	fprintf@PLT
.LVL9:
	.loc 1 78 2 is_stmt 1 view .LVU29
	.loc 1 78 14 view .LVU30
	.loc 1 77 2 is_stmt 0 view .LVU31
	movl	$10000000, %eax
.LVL10:
	.p2align 4,,10
	.p2align 3
.L7:
	.loc 1 79 3 is_stmt 1 view .LVU32
	.loc 1 82 4 view .LVU33
	lock subq	$1, 8(%rsp)
	.loc 1 95 5 view .LVU34
	.loc 1 78 21 view .LVU35
.LVL11:
	.loc 1 78 14 view .LVU36
	.loc 1 78 2 is_stmt 0 view .LVU37
	subl	$1, %eax
.LVL12:
	.loc 1 78 2 view .LVU38
	jne	.L7
	.loc 1 98 2 is_stmt 1 view .LVU39
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL13:
	.loc 1 100 2 view .LVU40
	.loc 1 101 1 is_stmt 0 view .LVU41
	xorl	%eax, %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC4:
	.string	"NOT "
.LC5:
	.string	""
.LC6:
	.string	"pthread_create"
.LC7:
	.string	"pthread_join"
.LC8:
	.string	"pthread_mutex_destroy"
.LC9:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL14:
.LFB25:
	.loc 1 105 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 106 2 view .LVU43
	.loc 1 107 2 view .LVU44
	.loc 1 111 2 view .LVU45
	.loc 1 105 1 is_stmt 0 view .LVU46
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	.loc 1 116 8 view .LVU47
	xorl	%esi, %esi
.LVL15:
	.loc 1 116 8 view .LVU48
	leaq	increase_fn(%rip), %rdx
	.loc 1 105 1 view .LVU49
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 116 8 view .LVU50
	leaq	12(%rsp), %r12
	leaq	16(%rsp), %rdi
	.loc 1 111 6 view .LVU51
	movl	$0, 12(%rsp)
	.loc 1 116 2 is_stmt 1 view .LVU52
	.loc 1 116 8 is_stmt 0 view .LVU53
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL16:
	.loc 1 117 2 is_stmt 1 view .LVU54
	.loc 1 117 5 is_stmt 0 view .LVU55
	testl	%eax, %eax
	jne	.L29
	.loc 1 121 2 is_stmt 1 view .LVU56
	.loc 1 121 8 is_stmt 0 view .LVU57
	leaq	24(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL17:
	.loc 1 121 8 view .LVU58
	movl	%eax, %ebx
.LVL18:
	.loc 1 122 2 is_stmt 1 view .LVU59
	.loc 1 122 5 is_stmt 0 view .LVU60
	testl	%eax, %eax
	jne	.L28
	.loc 1 131 2 is_stmt 1 view .LVU61
	.loc 1 131 8 is_stmt 0 view .LVU62
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL19:
	.loc 1 131 8 view .LVU63
	movl	%eax, %ebx
.LVL20:
	.loc 1 132 2 is_stmt 1 view .LVU64
	.loc 1 132 5 is_stmt 0 view .LVU65
	testl	%eax, %eax
	jne	.L30
.LVL21:
.L13:
	.loc 1 133 3 is_stmt 1 discriminator 1 view .LVU66
	.loc 1 134 2 discriminator 1 view .LVU67
	.loc 1 134 8 is_stmt 0 discriminator 1 view .LVU68
	movq	24(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL22:
	movl	%eax, %ebx
.LVL23:
	.loc 1 135 2 is_stmt 1 discriminator 1 view .LVU69
	.loc 1 135 5 is_stmt 0 discriminator 1 view .LVU70
	testl	%eax, %eax
	jne	.L31
.LVL24:
.L14:
	.loc 1 136 3 is_stmt 1 discriminator 1 view .LVU71
	.loc 1 141 2 discriminator 1 view .LVU72
	.loc 1 141 12 is_stmt 0 discriminator 1 view .LVU73
	movl	12(%rsp), %r12d
	xorl	%r13d, %r13d
	.loc 1 143 8 discriminator 1 view .LVU74
	leaq	mutex(%rip), %rdi
	.loc 1 141 12 discriminator 1 view .LVU75
	testl	%r12d, %r12d
	sete	%r13b
.LVL25:
	.loc 1 143 2 is_stmt 1 discriminator 1 view .LVU76
	.loc 1 143 8 is_stmt 0 discriminator 1 view .LVU77
	call	pthread_mutex_destroy@PLT
.LVL26:
	movl	%eax, %ebx
.LVL27:
	.loc 1 144 2 is_stmt 1 discriminator 1 view .LVU78
	.loc 1 144 4 is_stmt 0 discriminator 1 view .LVU79
	testl	%eax, %eax
	jne	.L32
.LVL28:
.L15:
	.loc 1 145 3 is_stmt 1 discriminator 1 view .LVU80
	.loc 1 147 2 discriminator 1 view .LVU81
	testl	%r12d, %r12d
	leaq	.LC5(%rip), %rax
	movl	12(%rsp), %edx
	leaq	.LC4(%rip), %rsi
	cmove	%rax, %rsi
	leaq	.LC9(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.LVL29:
	.loc 1 149 2 discriminator 1 view .LVU82
	.loc 1 150 1 is_stmt 0 discriminator 1 view .LVU83
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL30:
	.loc 1 150 1 discriminator 1 view .LVU84
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL31:
	.loc 1 150 1 discriminator 1 view .LVU85
	ret
.LVL32:
.L30:
	.cfi_restore_state
	.loc 1 133 3 is_stmt 1 view .LVU86
	.loc 1 133 3 view .LVU87
	call	__errno_location@PLT
.LVL33:
	.loc 1 133 3 is_stmt 0 view .LVU88
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 133 3 is_stmt 1 view .LVU89
	call	perror@PLT
.LVL34:
	jmp	.L13
.LVL35:
.L32:
	.loc 1 145 3 view .LVU90
	.loc 1 145 3 view .LVU91
	call	__errno_location@PLT
.LVL36:
	.loc 1 145 3 is_stmt 0 view .LVU92
	leaq	.LC8(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 145 3 is_stmt 1 view .LVU93
	call	perror@PLT
.LVL37:
	jmp	.L15
.LVL38:
.L31:
	.loc 1 136 3 view .LVU94
	.loc 1 136 3 view .LVU95
	call	__errno_location@PLT
.LVL39:
	.loc 1 136 3 is_stmt 0 view .LVU96
	leaq	.LC7(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 136 3 is_stmt 1 view .LVU97
	call	perror@PLT
.LVL40:
	jmp	.L14
.LVL41:
.L29:
	.loc 1 136 3 is_stmt 0 view .LVU98
	movl	%eax, %ebx
	.loc 1 118 3 is_stmt 1 view .LVU99
	.loc 1 118 3 view .LVU100
.LVL42:
.L28:
	.loc 1 123 3 view .LVU101
	.loc 1 123 3 view .LVU102
	call	__errno_location@PLT
.LVL43:
	leaq	.LC6(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 123 3 view .LVU103
	call	perror@PLT
.LVL44:
	.loc 1 123 3 view .LVU104
	.loc 1 124 3 view .LVU105
	movl	$1, %edi
	call	exit@PLT
.LVL45:
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.globl	mutex
	.bss
	.align 32
	.type	mutex, @object
	.size	mutex, 40
mutex:
	.zero	40
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/10/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/thread-shared-types.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/struct_mutex.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/pthread.h"
	.file 11 "/usr/include/errno.h"
	.file 12 "/usr/include/stdlib.h"
	.file 13 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x7f0
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF80
	.byte	0xc
	.long	.LASF81
	.long	.LASF82
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x35
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.long	0x61
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x7
	.byte	0x8
	.long	0x92
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	.LASF45
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x220
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0x9
	.long	.LASF17
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0x9
	.long	.LASF18
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0x9
	.long	.LASF19
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0x9
	.long	.LASF20
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0x9
	.long	.LASF21
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0x9
	.long	.LASF22
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0x9
	.long	.LASF23
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x239
	.byte	0x60
	.uleb128 0x9
	.long	.LASF24
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x23f
	.byte	0x68
	.uleb128 0x9
	.long	.LASF25
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x61
	.byte	0x70
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x61
	.byte	0x74
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x4c
	.byte	0x80
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x53
	.byte	0x82
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x245
	.byte	0x83
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x255
	.byte	0x88
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x260
	.byte	0x98
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x26b
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF35
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x23f
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF36
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x43
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF37
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x29
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF38
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x61
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF39
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x271
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0x99
	.uleb128 0xa
	.long	.LASF83
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF41
	.uleb128 0x7
	.byte	0x8
	.long	0x234
	.uleb128 0x7
	.byte	0x8
	.long	0x99
	.uleb128 0xc
	.long	0x92
	.long	0x255
	.uleb128 0xd
	.long	0x35
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x22c
	.uleb128 0xb
	.long	.LASF42
	.uleb128 0x7
	.byte	0x8
	.long	0x25b
	.uleb128 0xb
	.long	.LASF43
	.uleb128 0x7
	.byte	0x8
	.long	0x266
	.uleb128 0xc
	.long	0x92
	.long	0x281
	.uleb128 0xd
	.long	0x35
	.byte	0x13
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x220
	.uleb128 0xe
	.long	.LASF65
	.byte	0x9
	.byte	0x8b
	.byte	0xe
	.long	0x281
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF44
	.uleb128 0x8
	.long	.LASF46
	.byte	0x10
	.byte	0x6
	.byte	0x31
	.byte	0x10
	.long	0x2c2
	.uleb128 0x9
	.long	.LASF47
	.byte	0x6
	.byte	0x33
	.byte	0x23
	.long	0x2c2
	.byte	0
	.uleb128 0x9
	.long	.LASF48
	.byte	0x6
	.byte	0x34
	.byte	0x23
	.long	0x2c2
	.byte	0x8
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x29a
	.uleb128 0x2
	.long	.LASF49
	.byte	0x6
	.byte	0x35
	.byte	0x3
	.long	0x29a
	.uleb128 0x8
	.long	.LASF50
	.byte	0x28
	.byte	0x7
	.byte	0x16
	.byte	0x8
	.long	0x34a
	.uleb128 0x9
	.long	.LASF51
	.byte	0x7
	.byte	0x18
	.byte	0x7
	.long	0x61
	.byte	0
	.uleb128 0x9
	.long	.LASF52
	.byte	0x7
	.byte	0x19
	.byte	0x10
	.long	0x3c
	.byte	0x4
	.uleb128 0x9
	.long	.LASF53
	.byte	0x7
	.byte	0x1a
	.byte	0x7
	.long	0x61
	.byte	0x8
	.uleb128 0x9
	.long	.LASF54
	.byte	0x7
	.byte	0x1c
	.byte	0x10
	.long	0x3c
	.byte	0xc
	.uleb128 0x9
	.long	.LASF55
	.byte	0x7
	.byte	0x20
	.byte	0x7
	.long	0x61
	.byte	0x10
	.uleb128 0x9
	.long	.LASF56
	.byte	0x7
	.byte	0x22
	.byte	0x9
	.long	0x5a
	.byte	0x14
	.uleb128 0x9
	.long	.LASF57
	.byte	0x7
	.byte	0x23
	.byte	0x9
	.long	0x5a
	.byte	0x16
	.uleb128 0x9
	.long	.LASF58
	.byte	0x7
	.byte	0x24
	.byte	0x14
	.long	0x2c8
	.byte	0x18
	.byte	0
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF59
	.uleb128 0x2
	.long	.LASF60
	.byte	0x8
	.byte	0x1b
	.byte	0x1b
	.long	0x35
	.uleb128 0xf
	.byte	0x28
	.byte	0x8
	.byte	0x43
	.byte	0x9
	.long	0x38b
	.uleb128 0x10
	.long	.LASF61
	.byte	0x8
	.byte	0x45
	.byte	0x1c
	.long	0x2d4
	.uleb128 0x10
	.long	.LASF62
	.byte	0x8
	.byte	0x46
	.byte	0x8
	.long	0x38b
	.uleb128 0x10
	.long	.LASF63
	.byte	0x8
	.byte	0x47
	.byte	0xc
	.long	0x6d
	.byte	0
	.uleb128 0xc
	.long	0x92
	.long	0x39b
	.uleb128 0xd
	.long	0x35
	.byte	0x27
	.byte	0
	.uleb128 0x2
	.long	.LASF64
	.byte	0x8
	.byte	0x48
	.byte	0x3
	.long	0x35d
	.uleb128 0x7
	.byte	0x8
	.long	0x8c
	.uleb128 0x11
	.long	.LASF66
	.byte	0x1
	.byte	0x27
	.byte	0x11
	.long	0x39b
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x12
	.long	.LASF69
	.byte	0x1
	.byte	0x68
	.byte	0x5
	.long	0x61
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x611
	.uleb128 0x13
	.long	.LASF67
	.byte	0x1
	.byte	0x68
	.byte	0xe
	.long	0x61
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x68
	.byte	0x1a
	.long	0x3a7
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x14
	.string	"val"
	.byte	0x1
	.byte	0x6a
	.byte	0x6
	.long	0x61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x6a
	.byte	0xb
	.long	0x61
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x15
	.string	"ok"
	.byte	0x1
	.byte	0x6a
	.byte	0x10
	.long	0x61
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x14
	.string	"t1"
	.byte	0x1
	.byte	0x6b
	.byte	0xc
	.long	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.string	"t2"
	.byte	0x1
	.byte	0x6b
	.byte	0x10
	.long	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.quad	.LVL16
	.long	0x783
	.long	0x48f
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	increase_fn
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x16
	.quad	.LVL17
	.long	0x783
	.long	0x4bf
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x9
	.byte	0x3
	.quad	decrease_fn
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x52
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.byte	0
	.uleb128 0x16
	.quad	.LVL19
	.long	0x78f
	.long	0x4d6
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x16
	.quad	.LVL22
	.long	0x78f
	.long	0x4ed
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x16
	.quad	.LVL26
	.long	0x79b
	.long	0x50c
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.byte	0
	.uleb128 0x16
	.quad	.LVL29
	.long	0x7a8
	.long	0x54d
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1e
	.byte	0x3
	.quad	.LC4
	.byte	0x3
	.quad	.LC5
	.byte	0x7c
	.sleb128 0
	.byte	0x8
	.byte	0x20
	.byte	0x24
	.byte	0x30
	.byte	0x2e
	.byte	0x28
	.value	0x1
	.byte	0x16
	.byte	0x13
	.byte	0
	.uleb128 0x18
	.quad	.LVL33
	.long	0x7b5
	.uleb128 0x16
	.quad	.LVL34
	.long	0x7c1
	.long	0x579
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x18
	.quad	.LVL36
	.long	0x7b5
	.uleb128 0x16
	.quad	.LVL37
	.long	0x7c1
	.long	0x5a5
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x18
	.quad	.LVL39
	.long	0x7b5
	.uleb128 0x16
	.quad	.LVL40
	.long	0x7c1
	.long	0x5d1
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC7
	.byte	0
	.uleb128 0x18
	.quad	.LVL43
	.long	0x7b5
	.uleb128 0x16
	.quad	.LVL44
	.long	0x7c1
	.long	0x5fd
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC6
	.byte	0
	.uleb128 0x19
	.quad	.LVL45
	.long	0x7ce
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x12
	.long	.LASF70
	.byte	0x1
	.byte	0x48
	.byte	0x7
	.long	0x43
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x6c7
	.uleb128 0x1a
	.string	"arg"
	.byte	0x1
	.byte	0x48
	.byte	0x19
	.long	0x43
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x4a
	.byte	0x6
	.long	0x61
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x14
	.string	"ip"
	.byte	0x1
	.byte	0x4b
	.byte	0x10
	.long	0x6c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.long	0x679
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.byte	0x56
	.byte	0x8
	.long	0x61
	.byte	0
	.uleb128 0x16
	.quad	.LVL9
	.long	0x7db
	.long	0x6a1
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.uleb128 0x19
	.quad	.LVL13
	.long	0x7e8
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC3
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x8
	.long	0x68
	.uleb128 0x12
	.long	.LASF71
	.byte	0x1
	.byte	0x29
	.byte	0x7
	.long	0x43
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x783
	.uleb128 0x1a
	.string	"arg"
	.byte	0x1
	.byte	0x29
	.byte	0x19
	.long	0x43
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.byte	0x6
	.long	0x61
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x14
	.string	"ip"
	.byte	0x1
	.byte	0x2c
	.byte	0x10
	.long	0x6c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1b
	.long	0x735
	.uleb128 0x1c
	.string	"ret"
	.byte	0x1
	.byte	0x37
	.byte	0x8
	.long	0x61
	.byte	0
	.uleb128 0x16
	.quad	.LVL2
	.long	0x7db
	.long	0x75d
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x5
	.byte	0xc
	.long	0x989680
	.byte	0
	.uleb128 0x19
	.quad	.LVL6
	.long	0x7e8
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x31
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x4a
	.byte	0
	.byte	0
	.uleb128 0x1d
	.long	.LASF72
	.long	.LASF72
	.byte	0xa
	.byte	0xc6
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF73
	.long	.LASF73
	.byte	0xa
	.byte	0xd7
	.byte	0xc
	.uleb128 0x1e
	.long	.LASF74
	.long	.LASF74
	.byte	0xa
	.value	0x2da
	.byte	0xc
	.uleb128 0x1e
	.long	.LASF75
	.long	.LASF75
	.byte	0x9
	.value	0x14c
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF76
	.long	.LASF76
	.byte	0xb
	.byte	0x25
	.byte	0xd
	.uleb128 0x1e
	.long	.LASF77
	.long	.LASF77
	.byte	0x9
	.value	0x307
	.byte	0xd
	.uleb128 0x1e
	.long	.LASF78
	.long	.LASF78
	.byte	0xc
	.value	0x269
	.byte	0xd
	.uleb128 0x1e
	.long	.LASF79
	.long	.LASF79
	.byte	0x9
	.value	0x146
	.byte	0xc
	.uleb128 0x1f
	.long	.LASF84
	.long	.LASF85
	.byte	0xd
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.uleb128 0x2137
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS4:
	.uleb128 0
	.uleb128 .LVU54
	.uleb128 .LVU54
	.uleb128 0
.LLST4:
	.quad	.LVL14
	.quad	.LVL16-1
	.value	0x1
	.byte	0x55
	.quad	.LVL16-1
	.quad	.LFE25
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 0
	.uleb128 .LVU48
	.uleb128 .LVU48
	.uleb128 0
.LLST5:
	.quad	.LVL14
	.quad	.LVL15
	.value	0x1
	.byte	0x54
	.quad	.LVL15
	.quad	.LFE25
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU54
	.uleb128 .LVU58
	.uleb128 .LVU59
	.uleb128 .LVU63
	.uleb128 .LVU63
	.uleb128 .LVU64
	.uleb128 .LVU64
	.uleb128 .LVU66
	.uleb128 .LVU66
	.uleb128 .LVU69
	.uleb128 .LVU69
	.uleb128 .LVU71
	.uleb128 .LVU71
	.uleb128 .LVU78
	.uleb128 .LVU78
	.uleb128 .LVU80
	.uleb128 .LVU80
	.uleb128 .LVU84
	.uleb128 .LVU86
	.uleb128 .LVU88
	.uleb128 .LVU88
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU92
	.uleb128 .LVU92
	.uleb128 .LVU94
	.uleb128 .LVU94
	.uleb128 .LVU96
	.uleb128 .LVU96
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU101
.LLST6:
	.quad	.LVL16
	.quad	.LVL17-1
	.value	0x1
	.byte	0x50
	.quad	.LVL18
	.quad	.LVL19-1
	.value	0x1
	.byte	0x50
	.quad	.LVL19-1
	.quad	.LVL20
	.value	0x1
	.byte	0x53
	.quad	.LVL20
	.quad	.LVL21
	.value	0x1
	.byte	0x50
	.quad	.LVL21
	.quad	.LVL23
	.value	0x1
	.byte	0x53
	.quad	.LVL23
	.quad	.LVL24
	.value	0x1
	.byte	0x50
	.quad	.LVL24
	.quad	.LVL27
	.value	0x1
	.byte	0x53
	.quad	.LVL27
	.quad	.LVL28
	.value	0x1
	.byte	0x50
	.quad	.LVL28
	.quad	.LVL30
	.value	0x1
	.byte	0x53
	.quad	.LVL32
	.quad	.LVL33-1
	.value	0x1
	.byte	0x50
	.quad	.LVL33-1
	.quad	.LVL35
	.value	0x1
	.byte	0x53
	.quad	.LVL35
	.quad	.LVL36-1
	.value	0x1
	.byte	0x50
	.quad	.LVL36-1
	.quad	.LVL38
	.value	0x1
	.byte	0x53
	.quad	.LVL38
	.quad	.LVL39-1
	.value	0x1
	.byte	0x50
	.quad	.LVL39-1
	.quad	.LVL41
	.value	0x1
	.byte	0x53
	.quad	.LVL41
	.quad	.LVL42
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU76
	.uleb128 .LVU85
	.uleb128 .LVU90
	.uleb128 .LVU94
.LLST7:
	.quad	.LVL25
	.quad	.LVL31
	.value	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL35
	.quad	.LVL38
	.value	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 0
	.uleb128 .LVU28
	.uleb128 .LVU28
	.uleb128 .LVU29
	.uleb128 .LVU29
	.uleb128 0
.LLST2:
	.quad	.LVL7
	.quad	.LVL8
	.value	0x1
	.byte	0x55
	.quad	.LVL8
	.quad	.LVL9-1
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.quad	.LVL9-1
	.quad	.LFE24
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU30
	.uleb128 .LVU32
	.uleb128 .LVU32
	.uleb128 .LVU36
	.uleb128 .LVU36
	.uleb128 .LVU38
	.uleb128 .LVU38
	.uleb128 .LVU40
.LLST3:
	.quad	.LVL9
	.quad	.LVL10
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL10
	.quad	.LVL11
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL11
	.quad	.LVL12
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL12
	.quad	.LVL13-1
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU7
	.uleb128 .LVU7
	.uleb128 .LVU8
	.uleb128 .LVU8
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL1
	.value	0x1
	.byte	0x55
	.quad	.LVL1
	.quad	.LVL2-1
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.quad	.LVL2-1
	.quad	.LFE23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU9
	.uleb128 .LVU11
	.uleb128 .LVU11
	.uleb128 .LVU15
	.uleb128 .LVU15
	.uleb128 .LVU17
	.uleb128 .LVU17
	.uleb128 .LVU19
.LLST1:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL3
	.quad	.LVL4
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL4
	.quad	.LVL5
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL5
	.quad	.LVL6-1
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x70
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB25
	.quad	.LFE25
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF76:
	.string	"__errno_location"
.LASF61:
	.string	"__data"
.LASF45:
	.string	"_IO_FILE"
.LASF22:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_offset"
.LASF46:
	.string	"__pthread_internal_list"
.LASF82:
	.string	"/home/oslab/oslab093/ex2/sync"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF64:
	.string	"pthread_mutex_t"
.LASF52:
	.string	"__count"
.LASF31:
	.string	"_lock"
.LASF63:
	.string	"__align"
.LASF23:
	.string	"_markers"
.LASF13:
	.string	"_IO_read_end"
.LASF36:
	.string	"_freeres_buf"
.LASF47:
	.string	"__prev"
.LASF48:
	.string	"__next"
.LASF65:
	.string	"stderr"
.LASF55:
	.string	"__kind"
.LASF44:
	.string	"long long int"
.LASF73:
	.string	"pthread_join"
.LASF72:
	.string	"pthread_create"
.LASF6:
	.string	"long int"
.LASF75:
	.string	"printf"
.LASF28:
	.string	"_cur_column"
.LASF77:
	.string	"perror"
.LASF79:
	.string	"fprintf"
.LASF56:
	.string	"__spins"
.LASF68:
	.string	"argv"
.LASF78:
	.string	"exit"
.LASF27:
	.string	"_old_offset"
.LASF85:
	.string	"__builtin_fwrite"
.LASF2:
	.string	"unsigned char"
.LASF67:
	.string	"argc"
.LASF74:
	.string	"pthread_mutex_destroy"
.LASF4:
	.string	"signed char"
.LASF33:
	.string	"_codecvt"
.LASF59:
	.string	"long long unsigned int"
.LASF70:
	.string	"decrease_fn"
.LASF1:
	.string	"unsigned int"
.LASF41:
	.string	"_IO_marker"
.LASF30:
	.string	"_shortbuf"
.LASF80:
	.string	"GNU C17 10.2.1 20210110 -mtune=generic -march=x86-64 -g -O2 -fasynchronous-unwind-tables"
.LASF15:
	.string	"_IO_write_base"
.LASF39:
	.string	"_unused2"
.LASF12:
	.string	"_IO_read_ptr"
.LASF66:
	.string	"mutex"
.LASF62:
	.string	"__size"
.LASF19:
	.string	"_IO_buf_end"
.LASF10:
	.string	"char"
.LASF54:
	.string	"__nusers"
.LASF69:
	.string	"main"
.LASF81:
	.string	"simplesync.c"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF37:
	.string	"__pad5"
.LASF51:
	.string	"__lock"
.LASF53:
	.string	"__owner"
.LASF3:
	.string	"short unsigned int"
.LASF71:
	.string	"increase_fn"
.LASF50:
	.string	"__pthread_mutex_s"
.LASF84:
	.string	"fwrite"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF57:
	.string	"__elision"
.LASF25:
	.string	"_fileno"
.LASF24:
	.string	"_chain"
.LASF49:
	.string	"__pthread_list_t"
.LASF38:
	.string	"_mode"
.LASF8:
	.string	"__off_t"
.LASF21:
	.string	"_IO_backup_base"
.LASF18:
	.string	"_IO_buf_base"
.LASF26:
	.string	"_flags2"
.LASF42:
	.string	"_IO_codecvt"
.LASF14:
	.string	"_IO_read_base"
.LASF58:
	.string	"__list"
.LASF29:
	.string	"_vtable_offset"
.LASF43:
	.string	"_IO_wide_data"
.LASF20:
	.string	"_IO_save_base"
.LASF40:
	.string	"FILE"
.LASF60:
	.string	"pthread_t"
.LASF83:
	.string	"_IO_lock_t"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
