	.file	"simplesync.c"
	.text
.Ltext0:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"About to increase variable %d times\n"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"pthread_mutex_lock"
.LC2:
	.string	"pthread_mutex_unlock"
.LC3:
	.string	"Done increasing variable.\n"
	.text
	.p2align 4
	.globl	increase_fn
	.type	increase_fn, @function
increase_fn:
.LVL0:
.LFB23:
	.file 1 "simplesync.c"
	.loc 1 43 1 view -0
	.cfi_startproc
	.loc 1 44 2 view .LVU1
	.loc 1 45 2 view .LVU2
	.loc 1 43 1 is_stmt 0 view .LVU3
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	.loc 1 47 2 view .LVU4
	movl	$10000000, %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	.loc 1 43 1 view .LVU5
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
.LVL1:
	.loc 1 47 2 is_stmt 1 view .LVU6
.LBB2:
	.loc 1 57 10 is_stmt 0 view .LVU7
	leaq	mutex(%rip), %r13
.LBE2:
	.loc 1 43 1 view .LVU8
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	.loc 1 47 2 view .LVU9
	movl	$10000000, %ebp
	.loc 1 43 1 view .LVU10
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 47 2 view .LVU11
	movq	stderr(%rip), %rdi
.LVL2:
	.loc 1 47 2 view .LVU12
	call	fprintf@PLT
.LVL3:
	.loc 1 48 2 is_stmt 1 view .LVU13
	.loc 1 48 14 view .LVU14
	jmp	.L4
.LVL4:
	.p2align 4,,10
	.p2align 3
.L2:
.LBB3:
	.loc 1 59 5 discriminator 1 view .LVU15
	.loc 1 61 4 discriminator 1 view .LVU16
	.loc 1 61 7 is_stmt 0 discriminator 1 view .LVU17
	movl	(%r12), %eax
	.loc 1 63 10 discriminator 1 view .LVU18
	movq	%r13, %rdi
	.loc 1 61 4 discriminator 1 view .LVU19
	addl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 63 4 is_stmt 1 discriminator 1 view .LVU20
	.loc 1 63 10 is_stmt 0 discriminator 1 view .LVU21
	call	pthread_mutex_unlock@PLT
.LVL5:
	movl	%eax, %ebx
.LVL6:
	.loc 1 64 4 is_stmt 1 discriminator 1 view .LVU22
	.loc 1 64 6 is_stmt 0 discriminator 1 view .LVU23
	testl	%eax, %eax
	jne	.L14
	.loc 1 65 5 is_stmt 1 discriminator 1 view .LVU24
.LBE3:
	.loc 1 48 21 discriminator 1 view .LVU25
.LVL7:
	.loc 1 48 14 discriminator 1 view .LVU26
	.loc 1 48 2 is_stmt 0 discriminator 1 view .LVU27
	subl	$1, %ebp
.LVL8:
	.loc 1 48 2 discriminator 1 view .LVU28
	je	.L15
.LVL9:
.L4:
	.loc 1 49 3 is_stmt 1 view .LVU29
.LBB4:
	.loc 1 56 4 view .LVU30
	.loc 1 57 4 view .LVU31
	.loc 1 57 10 is_stmt 0 view .LVU32
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL10:
	movl	%eax, %ebx
.LVL11:
	.loc 1 58 4 is_stmt 1 view .LVU33
	.loc 1 58 6 is_stmt 0 view .LVU34
	testl	%eax, %eax
	je	.L2
	.loc 1 59 5 is_stmt 1 view .LVU35
	.loc 1 59 5 view .LVU36
	call	__errno_location@PLT
.LVL12:
	.loc 1 59 5 is_stmt 0 view .LVU37
	leaq	.LC1(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 59 5 is_stmt 1 view .LVU38
	call	perror@PLT
.LVL13:
	jmp	.L2
.LVL14:
	.p2align 4,,10
	.p2align 3
.L14:
	.loc 1 65 5 view .LVU39
	.loc 1 65 5 view .LVU40
	call	__errno_location@PLT
.LVL15:
	.loc 1 65 5 is_stmt 0 view .LVU41
	leaq	.LC2(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 65 5 is_stmt 1 view .LVU42
	call	perror@PLT
.LVL16:
	.loc 1 65 5 view .LVU43
.LBE4:
	.loc 1 48 21 view .LVU44
	.loc 1 48 14 view .LVU45
	.loc 1 48 2 is_stmt 0 view .LVU46
	subl	$1, %ebp
.LVL17:
	.loc 1 48 2 view .LVU47
	jne	.L4
.LVL18:
.L15:
	.loc 1 68 2 is_stmt 1 view .LVU48
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC3(%rip), %rdi
	call	fwrite@PLT
.LVL19:
	.loc 1 70 2 view .LVU49
	.loc 1 71 1 is_stmt 0 view .LVU50
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL20:
	.loc 1 71 1 view .LVU51
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL21:
	.loc 1 71 1 view .LVU52
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	increase_fn, .-increase_fn
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"About to decrease variable %d times\n"
	.section	.rodata.str1.1
.LC5:
	.string	"Done decreasing variable.\n"
	.text
	.p2align 4
	.globl	decrease_fn
	.type	decrease_fn, @function
decrease_fn:
.LVL22:
.LFB24:
	.loc 1 74 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 75 2 view .LVU54
	.loc 1 76 2 view .LVU55
	.loc 1 74 1 is_stmt 0 view .LVU56
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	.loc 1 78 2 view .LVU57
	movl	$10000000, %edx
	leaq	.LC4(%rip), %rsi
	xorl	%eax, %eax
	.loc 1 74 1 view .LVU58
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
.LVL23:
	.loc 1 78 2 is_stmt 1 view .LVU59
.LBB5:
	.loc 1 88 10 is_stmt 0 view .LVU60
	leaq	mutex(%rip), %r13
.LBE5:
	.loc 1 74 1 view .LVU61
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	.loc 1 78 2 view .LVU62
	movl	$10000000, %ebp
	.loc 1 74 1 view .LVU63
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	.loc 1 78 2 view .LVU64
	movq	stderr(%rip), %rdi
.LVL24:
	.loc 1 78 2 view .LVU65
	call	fprintf@PLT
.LVL25:
	.loc 1 79 2 is_stmt 1 view .LVU66
	.loc 1 79 14 view .LVU67
	jmp	.L19
.LVL26:
	.p2align 4,,10
	.p2align 3
.L17:
.LBB6:
	.loc 1 90 5 discriminator 1 view .LVU68
	.loc 1 92 4 discriminator 1 view .LVU69
	.loc 1 92 7 is_stmt 0 discriminator 1 view .LVU70
	movl	(%r12), %eax
	.loc 1 94 10 discriminator 1 view .LVU71
	movq	%r13, %rdi
	.loc 1 92 4 discriminator 1 view .LVU72
	subl	$1, %eax
	movl	%eax, (%r12)
	.loc 1 94 4 is_stmt 1 discriminator 1 view .LVU73
	.loc 1 94 10 is_stmt 0 discriminator 1 view .LVU74
	call	pthread_mutex_unlock@PLT
.LVL27:
	movl	%eax, %ebx
.LVL28:
	.loc 1 95 4 is_stmt 1 discriminator 1 view .LVU75
	.loc 1 95 6 is_stmt 0 discriminator 1 view .LVU76
	testl	%eax, %eax
	jne	.L28
	.loc 1 96 5 is_stmt 1 discriminator 1 view .LVU77
.LBE6:
	.loc 1 79 21 discriminator 1 view .LVU78
.LVL29:
	.loc 1 79 14 discriminator 1 view .LVU79
	.loc 1 79 2 is_stmt 0 discriminator 1 view .LVU80
	subl	$1, %ebp
.LVL30:
	.loc 1 79 2 discriminator 1 view .LVU81
	je	.L29
.LVL31:
.L19:
	.loc 1 80 3 is_stmt 1 view .LVU82
.LBB7:
	.loc 1 87 4 view .LVU83
	.loc 1 88 4 view .LVU84
	.loc 1 88 10 is_stmt 0 view .LVU85
	movq	%r13, %rdi
	call	pthread_mutex_lock@PLT
.LVL32:
	movl	%eax, %ebx
.LVL33:
	.loc 1 89 4 is_stmt 1 view .LVU86
	.loc 1 89 6 is_stmt 0 view .LVU87
	testl	%eax, %eax
	je	.L17
	.loc 1 90 5 is_stmt 1 view .LVU88
	.loc 1 90 5 view .LVU89
	call	__errno_location@PLT
.LVL34:
	.loc 1 90 5 is_stmt 0 view .LVU90
	leaq	.LC1(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 90 5 is_stmt 1 view .LVU91
	call	perror@PLT
.LVL35:
	jmp	.L17
.LVL36:
	.p2align 4,,10
	.p2align 3
.L28:
	.loc 1 96 5 view .LVU92
	.loc 1 96 5 view .LVU93
	call	__errno_location@PLT
.LVL37:
	.loc 1 96 5 is_stmt 0 view .LVU94
	leaq	.LC2(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 96 5 is_stmt 1 view .LVU95
	call	perror@PLT
.LVL38:
	.loc 1 96 5 view .LVU96
.LBE7:
	.loc 1 79 21 view .LVU97
	.loc 1 79 14 view .LVU98
	.loc 1 79 2 is_stmt 0 view .LVU99
	subl	$1, %ebp
.LVL39:
	.loc 1 79 2 view .LVU100
	jne	.L19
.LVL40:
.L29:
	.loc 1 99 2 is_stmt 1 view .LVU101
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC5(%rip), %rdi
	call	fwrite@PLT
.LVL41:
	.loc 1 101 2 view .LVU102
	.loc 1 102 1 is_stmt 0 view .LVU103
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
.LVL42:
	.loc 1 102 1 view .LVU104
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
.LVL43:
	.loc 1 102 1 view .LVU105
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	decrease_fn, .-decrease_fn
	.section	.rodata.str1.1
.LC6:
	.string	"NOT "
.LC7:
	.string	""
.LC8:
	.string	"pthread_create"
.LC9:
	.string	"pthread_join"
.LC10:
	.string	"pthread_mutex_destroy"
.LC11:
	.string	"%sOK, val = %d.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LVL44:
.LFB25:
	.loc 1 106 1 is_stmt 1 view -0
	.cfi_startproc
	.loc 1 107 2 view .LVU107
	.loc 1 108 2 view .LVU108
	.loc 1 113 2 view .LVU109
	.loc 1 106 1 is_stmt 0 view .LVU110
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	.loc 1 118 8 view .LVU111
	xorl	%esi, %esi
.LVL45:
	.loc 1 118 8 view .LVU112
	leaq	increase_fn(%rip), %rdx
	.loc 1 106 1 view .LVU113
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	.loc 1 118 8 view .LVU114
	leaq	12(%rsp), %r12
	leaq	16(%rsp), %rdi
	.loc 1 113 6 view .LVU115
	movl	$0, 12(%rsp)
	.loc 1 118 2 is_stmt 1 view .LVU116
	.loc 1 118 8 is_stmt 0 view .LVU117
	movq	%r12, %rcx
	call	pthread_create@PLT
.LVL46:
	.loc 1 119 2 is_stmt 1 view .LVU118
	.loc 1 119 5 is_stmt 0 view .LVU119
	testl	%eax, %eax
	jne	.L49
	.loc 1 123 2 is_stmt 1 view .LVU120
	.loc 1 123 8 is_stmt 0 view .LVU121
	leaq	24(%rsp), %rdi
	movq	%r12, %rcx
	leaq	decrease_fn(%rip), %rdx
	xorl	%esi, %esi
	call	pthread_create@PLT
.LVL47:
	.loc 1 123 8 view .LVU122
	movl	%eax, %ebx
.LVL48:
	.loc 1 124 2 is_stmt 1 view .LVU123
	.loc 1 124 5 is_stmt 0 view .LVU124
	testl	%eax, %eax
	jne	.L48
	.loc 1 133 2 is_stmt 1 view .LVU125
	.loc 1 133 8 is_stmt 0 view .LVU126
	movq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL49:
	.loc 1 133 8 view .LVU127
	movl	%eax, %ebx
.LVL50:
	.loc 1 134 2 is_stmt 1 view .LVU128
	.loc 1 134 5 is_stmt 0 view .LVU129
	testl	%eax, %eax
	jne	.L50
.LVL51:
.L33:
	.loc 1 135 3 is_stmt 1 discriminator 1 view .LVU130
	.loc 1 136 2 discriminator 1 view .LVU131
	.loc 1 136 8 is_stmt 0 discriminator 1 view .LVU132
	movq	24(%rsp), %rdi
	xorl	%esi, %esi
	call	pthread_join@PLT
.LVL52:
	movl	%eax, %ebx
.LVL53:
	.loc 1 137 2 is_stmt 1 discriminator 1 view .LVU133
	.loc 1 137 5 is_stmt 0 discriminator 1 view .LVU134
	testl	%eax, %eax
	jne	.L51
.LVL54:
.L34:
	.loc 1 138 3 is_stmt 1 discriminator 1 view .LVU135
	.loc 1 143 2 discriminator 1 view .LVU136
	.loc 1 143 12 is_stmt 0 discriminator 1 view .LVU137
	movl	12(%rsp), %r12d
	xorl	%r13d, %r13d
	.loc 1 145 8 discriminator 1 view .LVU138
	leaq	mutex(%rip), %rdi
	.loc 1 143 12 discriminator 1 view .LVU139
	testl	%r12d, %r12d
	sete	%r13b
.LVL55:
	.loc 1 145 2 is_stmt 1 discriminator 1 view .LVU140
	.loc 1 145 8 is_stmt 0 discriminator 1 view .LVU141
	call	pthread_mutex_destroy@PLT
.LVL56:
	movl	%eax, %ebx
.LVL57:
	.loc 1 146 2 is_stmt 1 discriminator 1 view .LVU142
	.loc 1 146 4 is_stmt 0 discriminator 1 view .LVU143
	testl	%eax, %eax
	jne	.L52
.LVL58:
.L35:
	.loc 1 147 3 is_stmt 1 discriminator 1 view .LVU144
	.loc 1 149 2 discriminator 1 view .LVU145
	testl	%r12d, %r12d
	leaq	.LC7(%rip), %rax
	movl	12(%rsp), %edx
	leaq	.LC6(%rip), %rsi
	cmove	%rax, %rsi
	leaq	.LC11(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
.LVL59:
	.loc 1 150 2 discriminator 1 view .LVU146
	.loc 1 151 1 is_stmt 0 discriminator 1 view .LVU147
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	movl	%r13d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
.LVL60:
	.loc 1 151 1 discriminator 1 view .LVU148
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
.LVL61:
	.loc 1 151 1 discriminator 1 view .LVU149
	ret
.LVL62:
.L50:
	.cfi_restore_state
	.loc 1 135 3 is_stmt 1 view .LVU150
	.loc 1 135 3 view .LVU151
	call	__errno_location@PLT
.LVL63:
	.loc 1 135 3 is_stmt 0 view .LVU152
	leaq	.LC9(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 135 3 is_stmt 1 view .LVU153
	call	perror@PLT
.LVL64:
	jmp	.L33
.LVL65:
.L52:
	.loc 1 147 3 view .LVU154
	.loc 1 147 3 view .LVU155
	call	__errno_location@PLT
.LVL66:
	.loc 1 147 3 is_stmt 0 view .LVU156
	leaq	.LC10(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 147 3 is_stmt 1 view .LVU157
	call	perror@PLT
.LVL67:
	jmp	.L35
.LVL68:
.L51:
	.loc 1 138 3 view .LVU158
	.loc 1 138 3 view .LVU159
	call	__errno_location@PLT
.LVL69:
	.loc 1 138 3 is_stmt 0 view .LVU160
	leaq	.LC9(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 138 3 is_stmt 1 view .LVU161
	call	perror@PLT
.LVL70:
	jmp	.L34
.LVL71:
.L49:
	.loc 1 138 3 is_stmt 0 view .LVU162
	movl	%eax, %ebx
	.loc 1 120 3 is_stmt 1 view .LVU163
	.loc 1 120 3 view .LVU164
.LVL72:
.L48:
	.loc 1 125 3 view .LVU165
	.loc 1 125 3 view .LVU166
	call	__errno_location@PLT
.LVL73:
	leaq	.LC8(%rip), %rdi
	movl	%ebx, (%rax)
	.loc 1 125 3 view .LVU167
	call	perror@PLT
.LVL74:
	.loc 1 125 3 view .LVU168
	.loc 1 126 3 view .LVU169
	movl	$1, %edi
	call	exit@PLT
.LVL75:
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
	.long	0x92e
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF82
	.byte	0xc
	.long	.LASF83
	.long	.LASF84
	.long	.Ldebug_ranges0+0x80
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
	.long	.LASF85
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
	.byte	0x28
	.byte	0x11
	.long	0x39b
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.uleb128 0x12
	.long	.LASF69
	.byte	0x1
	.byte	0x69
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
	.byte	0x69
	.byte	0xe
	.long	0x61
	.long	.LLST8
	.long	.LVUS8
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x69
	.byte	0x1a
	.long	0x3a7
	.long	.LLST9
	.long	.LVUS9
	.uleb128 0x14
	.string	"val"
	.byte	0x1
	.byte	0x6b
	.byte	0x6
	.long	0x61
	.uleb128 0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x6b
	.byte	0xb
	.long	0x61
	.long	.LLST10
	.long	.LVUS10
	.uleb128 0x15
	.string	"ok"
	.byte	0x1
	.byte	0x6b
	.byte	0x10
	.long	0x61
	.long	.LLST11
	.long	.LVUS11
	.uleb128 0x14
	.string	"t1"
	.byte	0x1
	.byte	0x6c
	.byte	0xc
	.long	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x14
	.string	"t2"
	.byte	0x1
	.byte	0x6c
	.byte	0x10
	.long	0x351
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.quad	.LVL46
	.long	0x8a7
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
	.quad	.LVL47
	.long	0x8a7
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
	.quad	.LVL49
	.long	0x8b3
	.long	0x4d6
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x16
	.quad	.LVL52
	.long	0x8b3
	.long	0x4ed
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x16
	.quad	.LVL56
	.long	0x8bf
	.long	0x50c
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	mutex
	.byte	0
	.uleb128 0x16
	.quad	.LVL59
	.long	0x8cc
	.long	0x54d
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC11
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x1e
	.byte	0x3
	.quad	.LC6
	.byte	0x3
	.quad	.LC7
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
	.quad	.LVL63
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL64
	.long	0x8e5
	.long	0x579
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x18
	.quad	.LVL66
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL67
	.long	0x8e5
	.long	0x5a5
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC10
	.byte	0
	.uleb128 0x18
	.quad	.LVL69
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL70
	.long	0x8e5
	.long	0x5d1
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC9
	.byte	0
	.uleb128 0x18
	.quad	.LVL73
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL74
	.long	0x8e5
	.long	0x5fd
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC8
	.byte	0
	.uleb128 0x19
	.quad	.LVL75
	.long	0x8f2
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
	.byte	0x49
	.byte	0x7
	.long	0x43
	.quad	.LFB24
	.quad	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.long	0x759
	.uleb128 0x1a
	.string	"arg"
	.byte	0x1
	.byte	0x49
	.byte	0x19
	.long	0x43
	.long	.LLST4
	.long	.LVUS4
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x4b
	.byte	0x6
	.long	0x61
	.long	.LLST5
	.long	.LVUS5
	.uleb128 0x15
	.string	"ip"
	.byte	0x1
	.byte	0x4c
	.byte	0x10
	.long	0x759
	.long	.LLST6
	.long	.LVUS6
	.uleb128 0x1b
	.long	.Ldebug_ranges0+0x40
	.long	0x70e
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x57
	.byte	0x8
	.long	0x61
	.long	.LLST7
	.long	.LVUS7
	.uleb128 0x16
	.quad	.LVL27
	.long	0x8ff
	.long	0x6a1
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.quad	.LVL32
	.long	0x90c
	.long	0x6b9
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.quad	.LVL34
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL35
	.long	0x8e5
	.long	0x6e5
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x18
	.quad	.LVL37
	.long	0x8d9
	.uleb128 0x19
	.quad	.LVL38
	.long	0x8e5
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x16
	.quad	.LVL25
	.long	0x919
	.long	0x733
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC4
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.quad	.LVL41
	.long	0x926
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC5
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
	.byte	0x2a
	.byte	0x7
	.long	0x43
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x8a7
	.uleb128 0x1a
	.string	"arg"
	.byte	0x1
	.byte	0x2a
	.byte	0x19
	.long	0x43
	.long	.LLST0
	.long	.LVUS0
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x2c
	.byte	0x6
	.long	0x61
	.long	.LLST1
	.long	.LVUS1
	.uleb128 0x15
	.string	"ip"
	.byte	0x1
	.byte	0x2d
	.byte	0x10
	.long	0x759
	.long	.LLST2
	.long	.LVUS2
	.uleb128 0x1b
	.long	.Ldebug_ranges0+0
	.long	0x85c
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x38
	.byte	0x8
	.long	0x61
	.long	.LLST3
	.long	.LVUS3
	.uleb128 0x16
	.quad	.LVL5
	.long	0x8ff
	.long	0x7ef
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.quad	.LVL10
	.long	0x90c
	.long	0x807
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7d
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.quad	.LVL12
	.long	0x8d9
	.uleb128 0x16
	.quad	.LVL13
	.long	0x8e5
	.long	0x833
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.byte	0
	.uleb128 0x18
	.quad	.LVL15
	.long	0x8d9
	.uleb128 0x19
	.quad	.LVL16
	.long	0x8e5
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC2
	.byte	0
	.byte	0
	.uleb128 0x16
	.quad	.LVL3
	.long	0x919
	.long	0x881
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.uleb128 0x17
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.quad	.LVL19
	.long	0x926
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
	.uleb128 0x1c
	.long	.LASF72
	.long	.LASF72
	.byte	0xa
	.byte	0xc6
	.byte	0xc
	.uleb128 0x1c
	.long	.LASF73
	.long	.LASF73
	.byte	0xa
	.byte	0xd7
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF74
	.long	.LASF74
	.byte	0xa
	.value	0x2da
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF75
	.long	.LASF75
	.byte	0x9
	.value	0x14c
	.byte	0xc
	.uleb128 0x1c
	.long	.LASF76
	.long	.LASF76
	.byte	0xb
	.byte	0x25
	.byte	0xd
	.uleb128 0x1d
	.long	.LASF77
	.long	.LASF77
	.byte	0x9
	.value	0x307
	.byte	0xd
	.uleb128 0x1d
	.long	.LASF78
	.long	.LASF78
	.byte	0xc
	.value	0x269
	.byte	0xd
	.uleb128 0x1d
	.long	.LASF79
	.long	.LASF79
	.byte	0xa
	.value	0x2f4
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF80
	.long	.LASF80
	.byte	0xa
	.value	0x2e2
	.byte	0xc
	.uleb128 0x1d
	.long	.LASF81
	.long	.LASF81
	.byte	0x9
	.value	0x146
	.byte	0xc
	.uleb128 0x1e
	.long	.LASF86
	.long	.LASF87
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x5
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
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LVUS8:
	.uleb128 0
	.uleb128 .LVU118
	.uleb128 .LVU118
	.uleb128 0
.LLST8:
	.quad	.LVL44
	.quad	.LVL46-1
	.value	0x1
	.byte	0x55
	.quad	.LVL46-1
	.quad	.LFE25
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS9:
	.uleb128 0
	.uleb128 .LVU112
	.uleb128 .LVU112
	.uleb128 0
.LLST9:
	.quad	.LVL44
	.quad	.LVL45
	.value	0x1
	.byte	0x54
	.quad	.LVL45
	.quad	.LFE25
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS10:
	.uleb128 .LVU118
	.uleb128 .LVU122
	.uleb128 .LVU123
	.uleb128 .LVU127
	.uleb128 .LVU127
	.uleb128 .LVU128
	.uleb128 .LVU128
	.uleb128 .LVU130
	.uleb128 .LVU130
	.uleb128 .LVU133
	.uleb128 .LVU133
	.uleb128 .LVU135
	.uleb128 .LVU135
	.uleb128 .LVU142
	.uleb128 .LVU142
	.uleb128 .LVU144
	.uleb128 .LVU144
	.uleb128 .LVU148
	.uleb128 .LVU150
	.uleb128 .LVU152
	.uleb128 .LVU152
	.uleb128 .LVU154
	.uleb128 .LVU154
	.uleb128 .LVU156
	.uleb128 .LVU156
	.uleb128 .LVU158
	.uleb128 .LVU158
	.uleb128 .LVU160
	.uleb128 .LVU160
	.uleb128 .LVU162
	.uleb128 .LVU162
	.uleb128 .LVU165
.LLST10:
	.quad	.LVL46
	.quad	.LVL47-1
	.value	0x1
	.byte	0x50
	.quad	.LVL48
	.quad	.LVL49-1
	.value	0x1
	.byte	0x50
	.quad	.LVL49-1
	.quad	.LVL50
	.value	0x1
	.byte	0x53
	.quad	.LVL50
	.quad	.LVL51
	.value	0x1
	.byte	0x50
	.quad	.LVL51
	.quad	.LVL53
	.value	0x1
	.byte	0x53
	.quad	.LVL53
	.quad	.LVL54
	.value	0x1
	.byte	0x50
	.quad	.LVL54
	.quad	.LVL57
	.value	0x1
	.byte	0x53
	.quad	.LVL57
	.quad	.LVL58
	.value	0x1
	.byte	0x50
	.quad	.LVL58
	.quad	.LVL60
	.value	0x1
	.byte	0x53
	.quad	.LVL62
	.quad	.LVL63-1
	.value	0x1
	.byte	0x50
	.quad	.LVL63-1
	.quad	.LVL65
	.value	0x1
	.byte	0x53
	.quad	.LVL65
	.quad	.LVL66-1
	.value	0x1
	.byte	0x50
	.quad	.LVL66-1
	.quad	.LVL68
	.value	0x1
	.byte	0x53
	.quad	.LVL68
	.quad	.LVL69-1
	.value	0x1
	.byte	0x50
	.quad	.LVL69-1
	.quad	.LVL71
	.value	0x1
	.byte	0x53
	.quad	.LVL71
	.quad	.LVL72
	.value	0x1
	.byte	0x50
	.quad	0
	.quad	0
.LVUS11:
	.uleb128 .LVU140
	.uleb128 .LVU149
	.uleb128 .LVU154
	.uleb128 .LVU158
.LLST11:
	.quad	.LVL55
	.quad	.LVL61
	.value	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	.LVL65
	.quad	.LVL68
	.value	0x6
	.byte	0x7d
	.sleb128 0
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS4:
	.uleb128 0
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 0
.LLST4:
	.quad	.LVL22
	.quad	.LVL24
	.value	0x1
	.byte	0x55
	.quad	.LVL24
	.quad	.LVL43
	.value	0x1
	.byte	0x5c
	.quad	.LVL43
	.quad	.LFE24
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS5:
	.uleb128 .LVU67
	.uleb128 .LVU68
	.uleb128 .LVU68
	.uleb128 .LVU79
	.uleb128 .LVU79
	.uleb128 .LVU81
	.uleb128 .LVU81
	.uleb128 .LVU98
	.uleb128 .LVU98
	.uleb128 .LVU100
	.uleb128 .LVU100
	.uleb128 .LVU101
.LLST5:
	.quad	.LVL25
	.quad	.LVL26
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL26
	.quad	.LVL29
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL29
	.quad	.LVL30
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL30
	.quad	.LVL38
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL38
	.quad	.LVL39
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL39
	.quad	.LVL40
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS6:
	.uleb128 .LVU59
	.uleb128 .LVU65
	.uleb128 .LVU65
	.uleb128 .LVU105
	.uleb128 .LVU105
	.uleb128 0
.LLST6:
	.quad	.LVL23
	.quad	.LVL24
	.value	0x1
	.byte	0x55
	.quad	.LVL24
	.quad	.LVL43
	.value	0x1
	.byte	0x5c
	.quad	.LVL43
	.quad	.LFE24
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS7:
	.uleb128 .LVU68
	.uleb128 .LVU75
	.uleb128 .LVU75
	.uleb128 .LVU82
	.uleb128 .LVU86
	.uleb128 .LVU90
	.uleb128 .LVU90
	.uleb128 .LVU92
	.uleb128 .LVU92
	.uleb128 .LVU94
	.uleb128 .LVU94
	.uleb128 .LVU104
.LLST7:
	.quad	.LVL26
	.quad	.LVL28
	.value	0x1
	.byte	0x53
	.quad	.LVL28
	.quad	.LVL31
	.value	0x1
	.byte	0x50
	.quad	.LVL33
	.quad	.LVL34-1
	.value	0x1
	.byte	0x50
	.quad	.LVL34-1
	.quad	.LVL36
	.value	0x1
	.byte	0x53
	.quad	.LVL36
	.quad	.LVL37-1
	.value	0x1
	.byte	0x50
	.quad	.LVL37-1
	.quad	.LVL42
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
.LVUS0:
	.uleb128 0
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 0
.LLST0:
	.quad	.LVL0
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL21
	.value	0x1
	.byte	0x5c
	.quad	.LVL21
	.quad	.LFE23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS1:
	.uleb128 .LVU14
	.uleb128 .LVU15
	.uleb128 .LVU15
	.uleb128 .LVU26
	.uleb128 .LVU26
	.uleb128 .LVU28
	.uleb128 .LVU28
	.uleb128 .LVU45
	.uleb128 .LVU45
	.uleb128 .LVU47
	.uleb128 .LVU47
	.uleb128 .LVU48
.LLST1:
	.quad	.LVL3
	.quad	.LVL4
	.value	0x2
	.byte	0x30
	.byte	0x9f
	.quad	.LVL4
	.quad	.LVL7
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL7
	.quad	.LVL8
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL8
	.quad	.LVL16
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL16
	.quad	.LVL17
	.value	0x9
	.byte	0xc
	.long	0x989681
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	.LVL17
	.quad	.LVL18
	.value	0x9
	.byte	0xc
	.long	0x989680
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS2:
	.uleb128 .LVU6
	.uleb128 .LVU12
	.uleb128 .LVU12
	.uleb128 .LVU52
	.uleb128 .LVU52
	.uleb128 0
.LLST2:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x55
	.quad	.LVL2
	.quad	.LVL21
	.value	0x1
	.byte	0x5c
	.quad	.LVL21
	.quad	.LFE23
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LVUS3:
	.uleb128 .LVU15
	.uleb128 .LVU22
	.uleb128 .LVU22
	.uleb128 .LVU29
	.uleb128 .LVU33
	.uleb128 .LVU37
	.uleb128 .LVU37
	.uleb128 .LVU39
	.uleb128 .LVU39
	.uleb128 .LVU41
	.uleb128 .LVU41
	.uleb128 .LVU51
.LLST3:
	.quad	.LVL4
	.quad	.LVL6
	.value	0x1
	.byte	0x53
	.quad	.LVL6
	.quad	.LVL9
	.value	0x1
	.byte	0x50
	.quad	.LVL11
	.quad	.LVL12-1
	.value	0x1
	.byte	0x50
	.quad	.LVL12-1
	.quad	.LVL14
	.value	0x1
	.byte	0x53
	.quad	.LVL14
	.quad	.LVL15-1
	.value	0x1
	.byte	0x50
	.quad	.LVL15-1
	.quad	.LVL20
	.value	0x1
	.byte	0x53
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
	.quad	.LBB2
	.quad	.LBE2
	.quad	.LBB3
	.quad	.LBE3
	.quad	.LBB4
	.quad	.LBE4
	.quad	0
	.quad	0
	.quad	.LBB5
	.quad	.LBE5
	.quad	.LBB6
	.quad	.LBE6
	.quad	.LBB7
	.quad	.LBE7
	.quad	0
	.quad	0
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
.LASF84:
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
.LASF80:
	.string	"pthread_mutex_lock"
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
.LASF81:
	.string	"fprintf"
.LASF56:
	.string	"__spins"
.LASF68:
	.string	"argv"
.LASF78:
	.string	"exit"
.LASF27:
	.string	"_old_offset"
.LASF87:
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
.LASF82:
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
.LASF83:
	.string	"simplesync.c"
.LASF34:
	.string	"_wide_data"
.LASF35:
	.string	"_freeres_list"
.LASF37:
	.string	"__pad5"
.LASF79:
	.string	"pthread_mutex_unlock"
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
.LASF86:
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
.LASF85:
	.string	"_IO_lock_t"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
