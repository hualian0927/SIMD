	.arch armv8-a
	.file	"main.cc"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, %function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1709:
	.cfi_startproc
	mov	w0, w1
	ret
	.cfi_endproc
.LFE1709:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text._ZN7hnswlib17BaseFilterFunctorclEm,"axG",@progbits,_ZN7hnswlib17BaseFilterFunctorclEm,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17BaseFilterFunctorclEm
	.type	_ZN7hnswlib17BaseFilterFunctorclEm, %function
_ZN7hnswlib17BaseFilterFunctorclEm:
.LFB3495:
	.cfi_startproc
	mov	w0, 1
	ret
	.cfi_endproc
.LFE3495:
	.size	_ZN7hnswlib17BaseFilterFunctorclEm, .-_ZN7hnswlib17BaseFilterFunctorclEm
	.text
	.align	2
	.p2align 4,,11
	.type	_ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_, %function
_ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_:
.LFB3537:
	.cfi_startproc
	ldr	x4, [x2]
	cbz	x4, .L7
	movi	v1.2s, #0
	mov	x2, 0
	mov	w3, 0
	.p2align 3,,7
.L6:
	ldr	s2, [x0, x2, lsl 2]
	add	w3, w3, 1
	ldr	s0, [x1, x2, lsl 2]
	uxtw	x2, w3
	fmadd	s1, s2, s0, s1
	cmp	x4, x2
	bhi	.L6
	fmov	s0, 1.0e+0
	fsub	s0, s0, s1
	ret
	.p2align 2,,3
.L7:
	fmov	s0, 1.0e+0
	ret
	.cfi_endproc
.LFE3537:
	.size	_ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_, .-_ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_
	.section	.text._ZN7hnswlib17InnerProductSpace13get_data_sizeEv,"axG",@progbits,_ZN7hnswlib17InnerProductSpace13get_data_sizeEv,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17InnerProductSpace13get_data_sizeEv
	.type	_ZN7hnswlib17InnerProductSpace13get_data_sizeEv, %function
_ZN7hnswlib17InnerProductSpace13get_data_sizeEv:
.LFB3541:
	.cfi_startproc
	ldr	x0, [x0, 16]
	ret
	.cfi_endproc
.LFE3541:
	.size	_ZN7hnswlib17InnerProductSpace13get_data_sizeEv, .-_ZN7hnswlib17InnerProductSpace13get_data_sizeEv
	.section	.text._ZN7hnswlib17InnerProductSpace13get_dist_funcEv,"axG",@progbits,_ZN7hnswlib17InnerProductSpace13get_dist_funcEv,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17InnerProductSpace13get_dist_funcEv
	.type	_ZN7hnswlib17InnerProductSpace13get_dist_funcEv, %function
_ZN7hnswlib17InnerProductSpace13get_dist_funcEv:
.LFB3542:
	.cfi_startproc
	ldr	x0, [x0, 8]
	ret
	.cfi_endproc
.LFE3542:
	.size	_ZN7hnswlib17InnerProductSpace13get_dist_funcEv, .-_ZN7hnswlib17InnerProductSpace13get_dist_funcEv
	.section	.text._ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv,"axG",@progbits,_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv
	.type	_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv, %function
_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv:
.LFB3543:
	.cfi_startproc
	add	x0, x0, 24
	ret
	.cfi_endproc
.LFE3543:
	.size	_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv, .-_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv
	.section	.text._ZN7hnswlib17InnerProductSpaceD2Ev,"axG",@progbits,_ZN7hnswlib17InnerProductSpaceD5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17InnerProductSpaceD2Ev
	.type	_ZN7hnswlib17InnerProductSpaceD2Ev, %function
_ZN7hnswlib17InnerProductSpaceD2Ev:
.LFB3545:
	.cfi_startproc
	ret
	.cfi_endproc
.LFE3545:
	.size	_ZN7hnswlib17InnerProductSpaceD2Ev, .-_ZN7hnswlib17InnerProductSpaceD2Ev
	.weak	_ZN7hnswlib17InnerProductSpaceD1Ev
	.set	_ZN7hnswlib17InnerProductSpaceD1Ev,_ZN7hnswlib17InnerProductSpaceD2Ev
	.section	.text._ZN7hnswlib17InnerProductSpaceD0Ev,"axG",@progbits,_ZN7hnswlib17InnerProductSpaceD5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib17InnerProductSpaceD0Ev
	.type	_ZN7hnswlib17InnerProductSpaceD0Ev, %function
_ZN7hnswlib17InnerProductSpaceD0Ev:
.LFB3547:
	.cfi_startproc
	mov	x1, 32
	b	_ZdlPvm
	.cfi_endproc
.LFE3547:
	.size	_ZN7hnswlib17InnerProductSpaceD0Ev, .-_ZN7hnswlib17InnerProductSpaceD0Ev
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"cannot create std::vector larger than max_size()"
	.text
	.align	2
	.p2align 4,,11
	.type	_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0, %function
_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0:
.LFB13659:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x0
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bhi	.L25
	stp	xzr, xzr, [x19]
	lsl	x20, x1, 2
	str	xzr, [x19, 16]
	cbz	x1, .L16
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	mov	x21, x2
	mov	x0, x20
	bl	_Znwm
	add	x3, x0, x20
	ldr	s1, [x21]
	stp	x0, x0, [x19]
	str	x3, [x19, 16]
	cmp	x3, x0
	beq	.L24
	sub	x20, x20, #4
	mov	x1, x0
	lsr	x4, x20, 2
	add	x4, x4, 1
	cmp	x20, 8
	bls	.L18
	dup	v0.4s, v1.s[0]
	lsr	x2, x4, 2
	add	x2, x0, x2, lsl 4
	.p2align 3,,7
.L19:
	str	q0, [x1], 16
	cmp	x1, x2
	bne	.L19
	and	x1, x4, -4
	add	x0, x0, x1, lsl 2
	cmp	x4, x1
	beq	.L20
.L18:
	mov	x1, x0
	str	s1, [x1], 4
	cmp	x3, x1
	beq	.L20
	add	x1, x0, 8
	str	s1, [x0, 4]
	cmp	x3, x1
	beq	.L20
	str	s1, [x0, 8]
.L20:
	ldr	x21, [sp, 32]
	.cfi_restore 21
	mov	x0, x3
.L17:
	str	x0, [x19, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L16:
	.cfi_restore_state
	mov	x0, 0
	str	xzr, [x19]
	str	xzr, [x19, 16]
	b	.L17
.L24:
	.cfi_offset 21, -16
	ldr	x21, [sp, 32]
	.cfi_restore 21
	b	.L17
.L25:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE13659:
	.size	_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0, .-_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0
	.align	2
	.p2align 4,,11
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, %function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB13603:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x0
	ldr	x0, [x0]
	ldr	x0, [x0, -24]
	add	x0, x19, x0
	ldr	x20, [x0, 240]
	cbz	x20, .L32
	ldrb	w0, [x20, 56]
	cbz	w0, .L28
	ldrb	w1, [x20, 67]
.L29:
	mov	x0, x19
	bl	_ZNSo3putEc
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZNSo5flushEv
.L28:
	.cfi_restore_state
	mov	x0, x20
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x1, [x20]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	ldr	x2, [x1, 48]
	cmp	x2, x0
	bne	.L33
	mov	w1, 10
	b	.L29
.L33:
	mov	w1, 10
	mov	x0, x20
	blr	x2
	and	w1, w0, 255
	b	.L29
.L32:
	bl	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE13603:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.align	2
	.p2align 4,,11
	.type	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0, %function
_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0:
.LFB13609:
	.cfi_startproc
	cbz	x0, .L95
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
.L52:
	ldr	x24, [x23, 24]
	cbz	x24, .L36
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -24
	.cfi_offset 25, -32
.L51:
	ldr	x25, [x24, 24]
	cbz	x25, .L37
.L50:
	ldr	x26, [x25, 24]
	cbz	x26, .L38
.L49:
	ldr	x19, [x26, 24]
	cbz	x19, .L39
.L48:
	ldr	x20, [x19, 24]
	cbz	x20, .L40
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -56
	.cfi_offset 21, -64
	str	x27, [sp, 80]
	.cfi_offset 27, -16
.L47:
	ldr	x27, [x20, 24]
	cbz	x27, .L41
.L46:
	ldr	x21, [x27, 24]
	cbz	x21, .L42
.L45:
	ldr	x22, [x21, 24]
	cbz	x22, .L43
.L44:
	ldr	x0, [x22, 24]
	bl	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	mov	x0, x22
	mov	x1, 40
	ldr	x22, [x22, 16]
	bl	_ZdlPvm
	cbnz	x22, .L44
.L43:
	ldr	x22, [x21, 16]
	mov	x0, x21
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x22, .L42
	mov	x21, x22
	b	.L45
.L96:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldr	x27, [sp, 80]
	.cfi_restore 27
.L40:
	mov	x0, x19
	ldr	x20, [x19, 16]
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x20, .L39
	mov	x19, x20
	b	.L48
	.p2align 2,,3
.L41:
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 27, -16
	ldr	x21, [x20, 16]
	mov	x0, x20
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x21, .L96
	mov	x20, x21
	b	.L47
.L39:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 27
	ldr	x19, [x26, 16]
	mov	x0, x26
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x19, .L38
	mov	x26, x19
	b	.L49
	.p2align 2,,3
.L42:
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 27, -16
	ldr	x21, [x27, 16]
	mov	x0, x27
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x21, .L41
	mov	x27, x21
	b	.L46
.L38:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 27
	ldr	x19, [x25, 16]
	mov	x0, x25
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x19, .L37
	mov	x25, x19
	b	.L50
.L37:
	ldr	x19, [x24, 16]
	mov	x0, x24
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x19, .L97
	mov	x24, x19
	b	.L51
.L97:
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
.L36:
	mov	x0, x23
	ldr	x19, [x23, 16]
	mov	x1, 40
	bl	_ZdlPvm
	cbz	x19, .L98
	mov	x23, x19
	b	.L52
.L98:
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L95:
	ret
	.cfi_endproc
.LFE13609:
	.size	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0, .-_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	.section	.text._ZN7hnswlib15HierarchicalNSWIfED0Ev,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfED0Ev
	.type	_ZN7hnswlib15HierarchicalNSWIfED0Ev, %function
_ZN7hnswlib15HierarchicalNSWIfED0Ev:
.LFB13385:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	adrp	x1, _ZTVN7hnswlib15HierarchicalNSWIfEE+16
	add	x1, x1, :lo12:_ZTVN7hnswlib15HierarchicalNSWIfEE+16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x19, x0
	add	x20, x0, 272
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	add	x22, x0, 16
	mov	w21, 0
	ldr	x0, [x0, 256]
	stp	x23, x24, [sp, 48]
	str	x1, [x19]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	bl	free
	str	xzr, [x19, 256]
	.p2align 3,,7
.L102:
	ldar	x1, [x22]
	uxtw	x0, w21
	add	w21, w21, 1
	cmp	x0, x1
	bcs	.L100
.L178:
	ldr	x1, [x20]
	ldr	w1, [x1, x0, lsl 2]
	cmp	w1, 0
	ble	.L102
	ldr	x1, [x19, 264]
	ldr	x0, [x1, x0, lsl 3]
	bl	free
	ldar	x1, [x22]
	uxtw	x0, w21
	add	w21, w21, 1
	cmp	x0, x1
	bcc	.L178
.L100:
	ldr	x0, [x19, 264]
	bl	free
	str	xzr, [x19, 264]
	stlr	xzr, [x22]
	ldr	x24, [x19, 112]
	str	xzr, [x19, 112]
	cbz	x24, .L103
	add	x21, x24, 48
	str	x25, [sp, 64]
	.cfi_offset 25, -16
	add	x25, x24, 16
.L109:
	ldp	x4, x22, [x25, 16]
	ldr	x3, [x25]
	.p2align 3,,7
.L107:
	sub	x0, x4, x3
	ldp	x2, x6, [x21]
	sub	x7, x4, #8
	ldr	x5, [x21, 24]
	sub	x1, x5, x22
	sub	x2, x2, x6
	asr	x1, x1, 3
	sub	x1, x1, #1
	asr	x2, x2, 3
	add	x1, x2, x1, lsl 6
	add	x0, x1, x0, asr 3
	cbz	x0, .L104
	ldr	x23, [x3]
	cmp	x3, x7
	beq	.L105
	add	x3, x3, 8
	str	x3, [x24, 16]
	cbz	x23, .L107
.L179:
	ldr	x0, [x23, 8]
	cbz	x0, .L108
	bl	_ZdaPv
.L108:
	mov	x0, x23
	mov	x1, 24
	bl	_ZdlPvm
	b	.L109
	.p2align 2,,3
.L105:
	ldr	x0, [x24, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x24, 40]
	add	x22, x0, 8
	ldr	x3, [x0, 8]
	str	x22, [x25, 24]
	add	x4, x3, 512
	stp	x3, x4, [x25, 8]
	str	x3, [x24, 16]
	cbz	x23, .L107
	b	.L179
	.p2align 2,,3
.L104:
	ldr	x0, [x24]
	cbz	x0, .L110
	add	x21, x5, 8
	cmp	x21, x22
	bls	.L111
	.p2align 3,,7
.L112:
	ldr	x0, [x22], 8
	mov	x1, 512
	bl	_ZdlPvm
	cmp	x21, x22
	bhi	.L112
	ldr	x0, [x24]
.L111:
	ldr	x1, [x24, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L110:
	mov	x0, x24
	mov	x1, 136
	bl	_ZdlPvm
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L103:
	add	x22, x19, 512
	ldr	x21, [x22, 16]
	cbz	x21, .L116
	.p2align 3,,7
.L113:
	mov	x0, x21
	mov	x1, 16
	ldr	x21, [x21]
	bl	_ZdlPvm
	cbnz	x21, .L113
.L116:
	ldr	x2, [x22, 8]
	mov	w1, 0
	ldr	x0, [x19, 512]
	lsl	x2, x2, 3
	bl	memset
	ldr	x0, [x19, 512]
	add	x2, x19, 560
	stp	xzr, xzr, [x22, 16]
	ldr	x1, [x22, 8]
	cmp	x0, x2
	beq	.L114
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L114:
	ldr	x21, [x19, 384]
	add	x22, x19, 368
	cbz	x21, .L120
	.p2align 3,,7
.L117:
	mov	x0, x21
	mov	x1, 24
	ldr	x21, [x21]
	bl	_ZdlPvm
	cbnz	x21, .L117
.L120:
	ldr	x2, [x22, 8]
	mov	w1, 0
	ldr	x0, [x19, 368]
	lsl	x2, x2, 3
	bl	memset
	ldr	x0, [x19, 368]
	add	x2, x19, 416
	stp	xzr, xzr, [x22, 16]
	ldr	x1, [x22, 8]
	cmp	x0, x2
	beq	.L118
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L118:
	ldr	x0, [x19, 272]
	cbz	x0, .L121
	ldr	x1, [x20, 16]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L121:
	ldr	x0, [x19, 192]
	cbz	x0, .L122
	ldr	x1, [x19, 208]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L122:
	ldr	x0, [x19, 120]
	cbz	x0, .L123
	ldr	x1, [x19, 136]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L123:
	ldr	x23, [x19, 112]
	cbz	x23, .L124
	add	x24, x23, 16
	add	x20, x23, 48
.L130:
	ldp	x4, x21, [x24, 16]
	ldr	x3, [x24]
	.p2align 3,,7
.L128:
	sub	x0, x4, x3
	ldp	x2, x6, [x20]
	sub	x7, x4, #8
	ldr	x5, [x20, 24]
	sub	x1, x5, x21
	sub	x2, x2, x6
	asr	x1, x1, 3
	sub	x1, x1, #1
	asr	x2, x2, 3
	add	x1, x2, x1, lsl 6
	add	x1, x1, x0, asr 3
	cbz	x1, .L125
	ldr	x22, [x3]
	cmp	x3, x7
	beq	.L126
	add	x3, x3, 8
	str	x3, [x23, 16]
	cbz	x22, .L128
.L180:
	ldr	x0, [x22, 8]
	cbz	x0, .L129
	bl	_ZdaPv
.L129:
	mov	x0, x22
	mov	x1, 24
	bl	_ZdlPvm
	b	.L130
	.p2align 2,,3
.L126:
	ldr	x0, [x23, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x23, 40]
	add	x21, x0, 8
	ldr	x3, [x0, 8]
	str	x21, [x24, 24]
	add	x4, x3, 512
	stp	x3, x4, [x24, 8]
	str	x3, [x23, 16]
	cbz	x22, .L128
	b	.L180
	.p2align 2,,3
.L125:
	ldr	x0, [x23]
	cbz	x0, .L131
	add	x20, x5, 8
	cmp	x20, x21
	bls	.L132
	.p2align 3,,7
.L133:
	ldr	x0, [x21], 8
	mov	x1, 512
	bl	_ZdlPvm
	cmp	x20, x21
	bhi	.L133
	ldr	x0, [x23]
.L132:
	ldr	x1, [x23, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L131:
	mov	x0, x23
	mov	x1, 136
	bl	_ZdlPvm
.L124:
	mov	x0, x19
	mov	x1, 568
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.cfi_endproc
.LFE13385:
	.size	_ZN7hnswlib15HierarchicalNSWIfED0Ev, .-_ZN7hnswlib15HierarchicalNSWIfED0Ev
	.section	.text._ZN7hnswlib15HierarchicalNSWIfED2Ev,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfED2Ev
	.type	_ZN7hnswlib15HierarchicalNSWIfED2Ev, %function
_ZN7hnswlib15HierarchicalNSWIfED2Ev:
.LFB13383:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	adrp	x1, _ZTVN7hnswlib15HierarchicalNSWIfEE+16
	add	x1, x1, :lo12:_ZTVN7hnswlib15HierarchicalNSWIfEE+16
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x19, x0
	add	x20, x0, 272
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	add	x22, x0, 16
	mov	w21, 0
	ldr	x0, [x0, 256]
	stp	x23, x24, [sp, 48]
	str	x1, [x19]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	bl	free
	str	xzr, [x19, 256]
	.p2align 3,,7
.L184:
	ldar	x1, [x22]
	uxtw	x0, w21
	add	w21, w21, 1
	cmp	x0, x1
	bcs	.L182
.L257:
	ldr	x1, [x20]
	ldr	w1, [x1, x0, lsl 2]
	cmp	w1, 0
	ble	.L184
	ldr	x1, [x19, 264]
	ldr	x0, [x1, x0, lsl 3]
	bl	free
	ldar	x1, [x22]
	uxtw	x0, w21
	add	w21, w21, 1
	cmp	x0, x1
	bcc	.L257
.L182:
	ldr	x0, [x19, 264]
	bl	free
	str	xzr, [x19, 264]
	stlr	xzr, [x22]
	ldr	x24, [x19, 112]
	str	xzr, [x19, 112]
	cbz	x24, .L185
	add	x21, x24, 48
	str	x25, [sp, 64]
	.cfi_offset 25, -16
	add	x25, x24, 16
.L191:
	ldp	x4, x22, [x25, 16]
	ldr	x0, [x25]
	.p2align 3,,7
.L189:
	sub	x2, x4, x0
	ldp	x3, x6, [x21]
	sub	x7, x4, #8
	ldr	x5, [x21, 24]
	sub	x1, x5, x22
	sub	x3, x3, x6
	asr	x1, x1, 3
	sub	x1, x1, #1
	asr	x3, x3, 3
	add	x1, x3, x1, lsl 6
	add	x1, x1, x2, asr 3
	cbz	x1, .L186
	ldr	x23, [x0]
	cmp	x0, x7
	beq	.L187
	add	x0, x0, 8
	str	x0, [x24, 16]
	cbz	x23, .L189
.L258:
	ldr	x0, [x23, 8]
	cbz	x0, .L190
	bl	_ZdaPv
.L190:
	mov	x0, x23
	mov	x1, 24
	bl	_ZdlPvm
	b	.L191
	.p2align 2,,3
.L187:
	ldr	x0, [x24, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x24, 40]
	add	x22, x0, 8
	ldr	x0, [x0, 8]
	str	x22, [x25, 24]
	add	x4, x0, 512
	stp	x0, x4, [x25, 8]
	str	x0, [x24, 16]
	cbz	x23, .L189
	b	.L258
	.p2align 2,,3
.L186:
	ldr	x0, [x24]
	cbz	x0, .L192
	add	x21, x5, 8
	cmp	x21, x22
	bls	.L193
	.p2align 3,,7
.L194:
	ldr	x0, [x22], 8
	mov	x1, 512
	bl	_ZdlPvm
	cmp	x21, x22
	bhi	.L194
	ldr	x0, [x24]
.L193:
	ldr	x1, [x24, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L192:
	mov	x0, x24
	mov	x1, 136
	bl	_ZdlPvm
	ldr	x25, [sp, 64]
	.cfi_restore 25
.L185:
	add	x22, x19, 512
	ldr	x21, [x22, 16]
	cbz	x21, .L198
	.p2align 3,,7
.L195:
	mov	x0, x21
	mov	x1, 16
	ldr	x21, [x21]
	bl	_ZdlPvm
	cbnz	x21, .L195
.L198:
	ldr	x2, [x22, 8]
	mov	w1, 0
	ldr	x0, [x19, 512]
	lsl	x2, x2, 3
	bl	memset
	ldr	x0, [x19, 512]
	add	x2, x19, 560
	stp	xzr, xzr, [x22, 16]
	ldr	x1, [x22, 8]
	cmp	x0, x2
	beq	.L196
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L196:
	ldr	x21, [x19, 384]
	add	x22, x19, 368
	cbz	x21, .L202
	.p2align 3,,7
.L199:
	mov	x0, x21
	mov	x1, 24
	ldr	x21, [x21]
	bl	_ZdlPvm
	cbnz	x21, .L199
.L202:
	ldr	x2, [x22, 8]
	mov	w1, 0
	ldr	x0, [x19, 368]
	lsl	x2, x2, 3
	bl	memset
	ldr	x0, [x19, 368]
	add	x2, x19, 416
	stp	xzr, xzr, [x22, 16]
	ldr	x1, [x22, 8]
	cmp	x0, x2
	beq	.L200
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L200:
	ldr	x0, [x19, 272]
	cbz	x0, .L203
	ldr	x1, [x20, 16]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L203:
	ldr	x0, [x19, 192]
	cbz	x0, .L204
	ldr	x1, [x19, 208]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L204:
	ldr	x0, [x19, 120]
	cbz	x0, .L205
	ldr	x1, [x19, 136]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L205:
	ldr	x22, [x19, 112]
	cbz	x22, .L181
	add	x23, x22, 16
	add	x19, x22, 48
.L212:
	ldp	x4, x20, [x23, 16]
	ldr	x3, [x23]
	.p2align 3,,7
.L210:
	sub	x1, x4, x3
	ldp	x2, x6, [x19]
	sub	x7, x4, #8
	ldr	x5, [x19, 24]
	sub	x0, x5, x20
	sub	x2, x2, x6
	asr	x0, x0, 3
	sub	x0, x0, #1
	asr	x2, x2, 3
	add	x0, x2, x0, lsl 6
	add	x0, x0, x1, asr 3
	cbz	x0, .L207
	ldr	x21, [x3]
	cmp	x3, x7
	beq	.L208
	add	x3, x3, 8
	str	x3, [x22, 16]
	cbz	x21, .L210
.L259:
	ldr	x0, [x21, 8]
	cbz	x0, .L211
	bl	_ZdaPv
.L211:
	mov	x0, x21
	mov	x1, 24
	bl	_ZdlPvm
	b	.L212
	.p2align 2,,3
.L208:
	ldr	x0, [x22, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x22, 40]
	add	x20, x0, 8
	ldr	x3, [x0, 8]
	str	x20, [x23, 24]
	add	x4, x3, 512
	stp	x3, x4, [x23, 8]
	str	x3, [x22, 16]
	cbz	x21, .L210
	b	.L259
	.p2align 2,,3
.L207:
	ldr	x0, [x22]
	cbz	x0, .L213
	add	x19, x5, 8
	cmp	x19, x20
	bls	.L214
	.p2align 3,,7
.L215:
	ldr	x0, [x20], 8
	mov	x1, 512
	bl	_ZdlPvm
	cmp	x19, x20
	bhi	.L215
	ldr	x0, [x22]
.L214:
	ldr	x1, [x22, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L213:
	mov	x0, x22
	mov	x1, 136
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.p2align 2,,3
.L181:
	.cfi_restore_state
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE13383:
	.size	_ZN7hnswlib15HierarchicalNSWIfED2Ev, .-_ZN7hnswlib15HierarchicalNSWIfED2Ev
	.weak	_ZN7hnswlib15HierarchicalNSWIfED1Ev
	.set	_ZN7hnswlib15HierarchicalNSWIfED1Ev,_ZN7hnswlib15HierarchicalNSWIfED2Ev
	.section	.rodata._Z8train_pqPKfmmiiRSt6vectorIfSaIfEE.str1.8,"aMS",@progbits,1
	.align	3
.LC1:
	.string	"[PQ] Training "
	.align	3
.LC2:
	.string	" sub-spaces, "
	.align	3
.LC3:
	.string	" centroids each..."
	.section	.text._Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,"axG",@progbits,_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,comdat
	.align	2
	.p2align 4,,11
	.weak	_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE
	.type	_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE, %function
_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE:
.LFB10533:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10533
	stp	x29, x30, [sp, -336]!
	.cfi_def_cfa_offset 336
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	adrp	x19, _ZSt4cerr
	add	x19, x19, :lo12:_ZSt4cerr
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	mov	x24, x2
	mov	x2, 14
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	mov	x21, x0
	mov	x0, x19
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	mov	w26, w4
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	sxtw	x27, w3
	str	x1, [sp, 136]
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	str	x5, [sp, 280]
	str	w27, [sp, 328]
.LEHB0:
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w1, w27
	mov	x0, x19
	bl	_ZNSolsEi
	mov	x19, x0
	mov	x2, 13
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w1, w26
	mov	x0, x19
	bl	_ZNSolsEi
	mov	x19, x0
	adrp	x1, .LC3
	mov	x2, 18
	add	x1, x1, :lo12:.LC3
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x0, [x19]
	udiv	x20, x24, x27
	ldr	x0, [x0, -24]
	add	x0, x19, x0
	ldr	x22, [x0, 240]
	cbz	x22, .L370
	ldrb	w0, [x22, 56]
	cbz	w0, .L262
	ldrb	w1, [x22, 67]
.L263:
	mov	x0, x19
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	ldr	w0, [sp, 328]
	cmp	w0, 0
	ble	.L260
	ldr	x2, [sp, 136]
	sxtw	x0, w26
	cmp	x27, x24
	str	x0, [sp, 208]
	csinc	x1, x20, xzr, ls
	str	x1, [sp, 232]
	lsl	x2, x2, 2
	str	x2, [sp, 192]
	lsl	x2, x0, 2
	mul	x0, x0, x20
	and	x23, x1, -4
	lsr	x19, x1, 2
	add	x1, x23, 1
	str	x0, [sp, 216]
	lsl	x0, x0, 2
	str	x1, [sp, 240]
	add	x1, x23, 2
	lsl	x19, x19, 4
	lsl	x25, x20, 2
	str	x0, [sp, 184]
	lsl	x0, x24, 2
	str	x1, [sp, 248]
	mul	x1, x20, x2
	str	d8, [sp, 96]
	.cfi_offset 72, -240
	str	xzr, [sp, 120]
	str	xzr, [sp, 144]
	str	wzr, [sp, 164]
	str	x2, [sp, 200]
	stp	x1, x0, [sp, 256]
	mov	w0, 2139095039
	fmov	s8, w0
.L322:
	ldr	x0, [sp, 280]
	mov	x28, 0
	mov	w4, 0
	ldr	x22, [x0]
	ldr	x0, [sp, 144]
	add	x22, x22, x0
	cmp	w26, 0
	ble	.L269
	mov	w1, w26
	mov	x0, x22
	mov	x26, x19
	mov	x22, x20
	mov	x19, x27
	mov	x20, x25
	mov	x27, x24
	mov	x25, x23
	mov	w24, w4
	mov	x23, x0
	mov	w4, w1
.L265:
	str	w4, [sp, 128]
	bl	rand
	ldr	x1, [sp, 136]
	sxtw	x0, w0
	ldr	w4, [sp, 128]
	cmp	x19, x27
	udiv	x2, x0, x1
	msub	x2, x2, x1, x0
	bhi	.L273
	ldr	x0, [sp, 120]
	sxtw	x2, w2
	add	x6, x23, x28, lsl 2
	madd	x2, x2, x27, x0
	add	x0, x2, 1
	lsl	x0, x0, 2
	add	x1, x21, x0
	sub	x0, x0, #4
	sub	x1, x6, x1
	add	x0, x21, x0
	cmp	x1, 8
	mov	x1, 0
	ccmp	x22, 8, 0, hi
	bls	.L276
.L272:
	ldr	q0, [x0, x1]
	str	q0, [x6, x1]
	add	x1, x1, 16
	cmp	x1, x26
	bne	.L272
	ldr	x0, [sp, 232]
	cmp	x0, x25
	beq	.L273
	add	x0, x2, x25
	add	x1, x25, x28
	ldr	s0, [x21, x0, lsl 2]
	str	s0, [x23, x1, lsl 2]
	ldr	x1, [sp, 240]
	cmp	x22, x1
	bls	.L273
	add	x0, x2, x1
	add	x1, x1, x28
	ldr	s0, [x21, x0, lsl 2]
	ldr	x0, [sp, 248]
	str	s0, [x23, x1, lsl 2]
	cmp	x22, x0
	bls	.L273
	add	x2, x2, x0
	add	x0, x0, x28
	ldr	s0, [x21, x2, lsl 2]
	str	s0, [x23, x0, lsl 2]
.L273:
	add	w24, w24, 1
	add	x28, x28, x22
	cmp	w4, w24
	bne	.L265
	mov	x0, x23
	mov	x24, x27
	mov	x23, x25
	mov	x27, x19
	mov	x25, x20
	mov	x19, x26
	mov	x20, x22
	mov	w26, w4
	mov	x22, x0
.L269:
	ldr	x1, [sp, 136]
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bhi	.L371
	cbz	x1, .L329
	ldr	x28, [sp, 192]
	mov	x0, x28
	bl	_Znwm
.LEHE0:
	add	x3, x0, x28
	str	x0, [sp, 128]
	str	x3, [sp, 176]
	mov	x2, x28
	cmp	x3, x0
	beq	.L277
	mov	w1, 0
	bl	memset
.L277:
	ldr	x1, [sp, 216]
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bhi	.L372
	cbz	x1, .L330
	ldr	x0, [sp, 184]
.LEHB1:
	bl	_Znwm
.LEHE1:
	ldr	x2, [sp, 184]
	mov	x28, x0
	add	x1, x0, x2
	str	x1, [sp, 152]
	cmp	x1, x0
	beq	.L331
	mov	w1, 0
	bl	memset
	ldr	x1, [sp, 152]
	str	x1, [sp, 168]
.L279:
	ldr	x1, [sp, 208]
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bhi	.L373
	cbz	x1, .L332
	ldr	x0, [sp, 200]
.LEHB2:
	bl	_Znwm
.LEHE2:
	ldr	x2, [sp, 200]
	mov	x5, x0
	add	x7, x0, x2
	cmp	x7, x0
	beq	.L333
	mov	w1, 0
	str	x0, [sp, 224]
	str	x7, [sp, 272]
	bl	memset
	ldr	x7, [sp, 272]
	ldr	x5, [sp, 224]
	mov	x8, x7
.L281:
	ldp	x0, x1, [sp, 120]
	str	x8, [sp, 288]
	ldr	x10, [sp, 232]
	mov	w8, w26
	ldr	x12, [sp, 264]
	mov	x26, x23
	add	x0, x21, x0, lsl 2
	str	x0, [sp, 272]
	ldr	x0, [sp, 192]
	mov	x23, x28
	mov	x28, x25
	mov	x25, x22
	add	x6, x0, x1
	mov	w0, 15
	str	w0, [sp, 224]
	mov	x0, x24
	mov	x22, x5
	mov	x24, x21
	mov	x21, x27
	mov	x27, x0
.L301:
	ldr	x0, [sp, 136]
	ldp	x16, x18, [sp, 120]
	ldr	x2, [sp, 272]
	cbz	x0, .L294
	.p2align 3,,7
.L282:
	cmp	w8, 0
	ble	.L335
	fmov	s5, s8
	mov	x1, x25
	mov	x3, 0
	mov	w5, 0
	mov	w11, 0
	.p2align 3,,7
.L293:
	movi	v1.2s, #0
	cmp	x21, x27
	bhi	.L286
	mov	x0, 0
	cmp	x20, 3
	bls	.L287
	.p2align 3,,7
.L289:
	ldr	q2, [x1, x0]
	ldr	q0, [x2, x0]
	add	x0, x0, 16
	fsub	v0.4s, v0.4s, v2.4s
	fmul	v0.4s, v0.4s, v0.4s
	dup	s2, v0.s[0]
	dup	s4, v0.s[1]
	dup	s3, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s1, s2, s1
	fadd	s1, s1, s4
	fadd	s1, s3, s1
	fadd	s1, s1, s0
	cmp	x0, x19
	bne	.L289
	cmp	x10, x26
	beq	.L286
	mov	x0, x26
.L287:
	add	x13, x0, x16
	add	x9, x0, x3
	add	x4, x0, 1
	ldr	s0, [x24, x13, lsl 2]
	ldr	s2, [x25, x9, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x4, x20
	bcs	.L286
	add	x9, x4, x16
	add	x4, x4, x3
	add	x0, x0, 2
	ldr	s0, [x24, x9, lsl 2]
	ldr	s2, [x25, x4, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x20, x0
	bls	.L286
	add	x4, x0, x16
	add	x0, x0, x3
	ldr	s0, [x24, x4, lsl 2]
	ldr	s2, [x25, x0, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
.L286:
	fcmpe	s5, s1
	bgt	.L342
.L291:
	add	w5, w5, 1
	add	x3, x3, x20
	add	x1, x1, x28
	cmp	w8, w5
	bne	.L293
	str	w11, [x18], 4
	add	x16, x16, x27
	add	x2, x2, x12
	cmp	x18, x6
	bne	.L282
.L294:
	ldr	x0, [sp, 152]
	cmp	x23, x0
	beq	.L283
	sub	x2, x0, x23
	mov	w1, 0
	mov	x0, x23
	stp	x7, x10, [sp, 296]
	stp	x12, x6, [sp, 312]
	str	w8, [sp, 332]
	bl	memset
	ldp	x7, x10, [sp, 296]
	ldp	x12, x6, [sp, 312]
	ldr	w8, [sp, 332]
.L283:
	cmp	x22, x7
	beq	.L295
	sub	x2, x7, x22
	mov	x0, x22
	mov	w1, 0
	stp	x7, x10, [sp, 296]
	stp	x12, x6, [sp, 312]
	str	w8, [sp, 332]
	bl	memset
	ldp	x7, x10, [sp, 296]
	ldp	x12, x6, [sp, 312]
	ldr	w8, [sp, 332]
.L295:
	ldr	x0, [sp, 136]
	cbz	x0, .L297
	ldp	x3, x4, [sp, 120]
	.p2align 3,,7
.L298:
	ldrsw	x0, [x4]
	ldr	w1, [x22, x0, lsl 2]
	add	w1, w1, 1
	str	w1, [x22, x0, lsl 2]
	cmp	x21, x27
	bhi	.L306
	mul	x2, x0, x20
	cmp	x20, 3
	bls	.L338
	add	x1, x23, x2, lsl 2
	add	x5, x24, x3, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L305:
	ldr	q1, [x1, x0]
	ldr	q0, [x5, x0]
	fadd	v0.4s, v0.4s, v1.4s
	str	q0, [x1, x0]
	add	x0, x0, 16
	cmp	x0, x19
	bne	.L305
	mov	x0, x26
	cmp	x10, x26
	beq	.L306
.L303:
	add	x9, x2, x0
	add	x5, x0, x3
	add	x1, x0, 1
	ldr	s0, [x23, x9, lsl 2]
	ldr	s1, [x24, x5, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x23, x9, lsl 2]
	cmp	x1, x20
	bcs	.L306
	add	x9, x2, x1
	add	x5, x1, x3
	add	x1, x0, 2
	ldr	s0, [x23, x9, lsl 2]
	ldr	s1, [x24, x5, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x23, x9, lsl 2]
	cmp	x20, x1
	bls	.L306
	add	x0, x2, x1
	add	x1, x1, x3
	ldr	s0, [x23, x0, lsl 2]
	ldr	s1, [x24, x1, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x23, x0, lsl 2]
.L306:
	add	x4, x4, 4
	add	x3, x3, x27
	cmp	x4, x6
	bne	.L298
.L297:
	cmp	w8, 0
	ble	.L309
	mov	x1, x23
	mov	x4, x25
	mov	x3, x25
	mov	x13, 0
	mov	x2, 0
	ldp	x9, x11, [sp, 240]
	b	.L310
	.p2align 2,,3
.L311:
	add	x2, x2, 1
	add	x13, x13, x20
	add	x1, x1, x28
	add	x4, x4, x28
	add	x3, x3, x28
	cmp	w8, w2
	ble	.L309
.L310:
	ldr	w0, [x22, x2, lsl 2]
	cmp	w0, 0
	ble	.L311
	cmp	x21, x27
	bhi	.L311
	add	x5, x1, 4
	scvtf	s1, w0
	sub	x0, x3, x5
	cmp	x0, 8
	ccmp	x20, 6, 0, hi
	bls	.L339
	dup	v2.4s, v1.s[0]
	mov	x0, 0
	.p2align 3,,7
.L314:
	ldr	q0, [x1, x0]
	fdiv	v0.4s, v0.4s, v2.4s
	str	q0, [x3, x0]
	add	x0, x0, 16
	cmp	x0, x19
	bne	.L314
	cmp	x10, x26
	beq	.L311
	add	x0, x13, x26
	ldr	s0, [x23, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x25, x0, lsl 2]
	cmp	x20, x9
	bls	.L311
	add	x0, x13, x9
	ldr	s0, [x23, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x25, x0, lsl 2]
	cmp	x20, x11
	bls	.L311
	add	x0, x13, x11
	add	x2, x2, 1
	add	x13, x13, x20
	add	x1, x1, x28
	add	x4, x4, x28
	add	x3, x3, x28
	ldr	s0, [x23, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x25, x0, lsl 2]
	cmp	w8, w2
	bgt	.L310
.L309:
	ldr	w0, [sp, 224]
	subs	w0, w0, #1
	str	w0, [sp, 224]
	bne	.L301
	mov	x0, x27
	mov	x25, x28
	mov	x27, x21
	mov	x28, x23
	mov	x21, x24
	mov	x23, x26
	mov	x24, x0
	mov	w26, w8
	ldr	x8, [sp, 288]
	cbz	x22, .L317
	sub	x1, x8, x22
	mov	x0, x22
	bl	_ZdlPvm
.L317:
	cbz	x28, .L318
	ldr	x0, [sp, 168]
	sub	x1, x0, x28
	mov	x0, x28
	bl	_ZdlPvm
.L318:
	ldr	x0, [sp, 128]
	cbz	x0, .L319
	ldr	w2, [sp, 164]
	ldr	x1, [sp, 176]
	add	w22, w2, 1
	str	w22, [sp, 164]
	sub	x1, x1, x0
	bl	_ZdlPvm
	ldr	x0, [sp, 144]
	ldr	x1, [sp, 256]
	add	x0, x0, x1
	str	x0, [sp, 144]
	ldr	x0, [sp, 120]
	add	x0, x0, x20
	str	x0, [sp, 120]
	ldr	w0, [sp, 328]
	cmp	w0, w22
	bne	.L322
.L368:
	ldr	d8, [sp, 96]
	.cfi_restore 72
.L260:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 336
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L276:
	.cfi_def_cfa_offset 336
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	.cfi_offset 72, -240
	ldr	s0, [x0, x1, lsl 2]
	str	s0, [x6, x1, lsl 2]
	add	x1, x1, 1
	cmp	x22, x1
	bls	.L273
	ldr	s0, [x0, x1, lsl 2]
	str	s0, [x6, x1, lsl 2]
	add	x1, x1, 1
	cmp	x22, x1
	bhi	.L276
	b	.L273
	.p2align 2,,3
.L342:
	fmov	s5, s1
	mov	w11, w5
	b	.L291
.L335:
	mov	w11, 0
	str	w11, [x18], 4
	add	x16, x16, x27
	add	x2, x2, x12
	cmp	x18, x6
	bne	.L282
	b	.L294
.L338:
	mov	x0, 0
	b	.L303
.L339:
	mov	x0, 0
.L312:
	ldr	s0, [x1, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	x20, x0
	bhi	.L312
	b	.L311
.L319:
	ldr	x1, [sp, 144]
	ldr	x2, [sp, 256]
	ldr	w0, [sp, 164]
	add	x1, x1, x2
	str	x1, [sp, 144]
	ldr	x1, [sp, 120]
	add	w0, w0, 1
	str	w0, [sp, 164]
	add	x1, x1, x20
	str	x1, [sp, 120]
	ldr	w1, [sp, 328]
	cmp	w1, w0
	bne	.L322
	b	.L368
.L333:
	mov	x8, x7
	b	.L281
.L332:
	mov	x5, 0
	mov	x7, 0
	ldr	x8, [sp, 200]
	b	.L281
.L331:
	str	x1, [sp, 168]
	b	.L279
.L329:
	ldr	x0, [sp, 192]
	str	xzr, [sp, 128]
	str	x0, [sp, 176]
	b	.L277
.L330:
	ldr	x0, [sp, 184]
	mov	x28, 0
	str	xzr, [sp, 152]
	str	x0, [sp, 168]
	b	.L279
.L262:
	.cfi_restore 72
	mov	x0, x22
.LEHB3:
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x22]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	mov	w1, 10
	ldr	x2, [x2, 48]
	cmp	x2, x0
	beq	.L263
	mov	x0, x22
	blr	x2
	and	w1, w0, 255
	b	.L263
.L370:
	str	d8, [sp, 96]
	.cfi_offset 72, -240
	bl	_ZSt16__throw_bad_castv
.LEHE3:
.L373:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB4:
	bl	_ZSt20__throw_length_errorPKc
.LEHE4:
.L372:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB5:
	bl	_ZSt20__throw_length_errorPKc
.LEHE5:
.L371:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB6:
	bl	_ZSt20__throw_length_errorPKc
.L341:
	ldr	x1, [sp, 168]
	mov	x19, x0
	sub	x1, x1, x28
	cbz	x28, .L325
	mov	x0, x28
	bl	_ZdlPvm
.L325:
	ldr	x0, [sp, 128]
	ldr	x1, [sp, 176]
	sub	x1, x1, x0
	cbz	x0, .L326
	bl	_ZdlPvm
.L326:
	mov	x0, x19
	bl	_Unwind_Resume
.LEHE6:
.L340:
	mov	x19, x0
	b	.L325
	.cfi_endproc
.LFE10533:
	.global	__gxx_personality_v0
	.section	.gcc_except_table._Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,"aG",@progbits,_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,comdat
.LLSDA10533:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10533-.LLSDACSB10533
.LLSDACSB10533:
	.uleb128 .LEHB0-.LFB10533
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB10533
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L340-.LFB10533
	.uleb128 0
	.uleb128 .LEHB2-.LFB10533
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L341-.LFB10533
	.uleb128 0
	.uleb128 .LEHB3-.LFB10533
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB4-.LFB10533
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L341-.LFB10533
	.uleb128 0
	.uleb128 .LEHB5-.LFB10533
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L340-.LFB10533
	.uleb128 0
	.uleb128 .LEHB6-.LFB10533
	.uleb128 .LEHE6-.LEHB6
	.uleb128 0
	.uleb128 0
.LLSDACSE10533:
	.section	.text._Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,"axG",@progbits,_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE,comdat
	.size	_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE, .-_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE
	.section	.rodata._Z9train_ivfPKfmmiRSt6vectorIfSaIfEE.str1.8,"aMS",@progbits,1
	.align	3
.LC4:
	.string	"[IVF] Training "
	.align	3
.LC5:
	.string	" coarse centroids (rooms)..."
	.section	.text._Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,"axG",@progbits,_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,comdat
	.align	2
	.p2align 4,,11
	.weak	_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE
	.type	_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE, %function
_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE:
.LFB10567:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10567
	stp	x29, x30, [sp, -192]!
	.cfi_def_cfa_offset 192
	.cfi_offset 29, -192
	.cfi_offset 30, -184
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -176
	.cfi_offset 20, -168
	mov	x19, x2
	mov	x2, 15
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -160
	.cfi_offset 22, -152
	adrp	x22, _ZSt4cerr
	add	x22, x22, :lo12:_ZSt4cerr
	mov	w21, w3
	mov	x20, x0
	mov	x0, x22
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -144
	.cfi_offset 24, -136
	mov	x24, x4
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -128
	.cfi_offset 26, -120
	mov	x26, x1
	adrp	x1, .LC4
	add	x1, x1, :lo12:.LC4
	stp	x27, x28, [sp, 80]
	str	d8, [sp, 96]
	.cfi_offset 27, -112
	.cfi_offset 28, -104
	.cfi_offset 72, -96
.LEHB7:
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	w1, w21
	mov	x0, x22
	bl	_ZNSolsEi
	mov	x23, x0
	adrp	x1, .LC5
	mov	x2, 28
	add	x1, x1, :lo12:.LC5
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x0, [x23]
	ldr	x0, [x0, -24]
	add	x0, x23, x0
	ldr	x22, [x0, 240]
	cbz	x22, .L481
	ldrb	w0, [x22, 56]
	cbz	w0, .L376
	ldrb	w1, [x22, 67]
.L377:
	mov	x0, x23
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	cmp	w21, 0
	ble	.L382
	lsr	x22, x19, 2
	and	x25, x19, -4
	add	x4, x25, 1
	add	x28, x25, 2
	lsl	x22, x22, 4
	sub	x5, x19, #1
	mov	x23, 0
	mov	w27, 0
.L383:
	stp	x4, x5, [sp, 120]
	bl	rand
	sxtw	x0, w0
	ldp	x4, x5, [sp, 120]
	udiv	x2, x0, x26
	msub	x2, x2, x26, x0
	cbz	x19, .L387
	sxtw	x2, w2
	ldr	x6, [x24]
	mul	x2, x2, x19
	add	x0, x2, 1
	add	x3, x6, x23, lsl 2
	lsl	x0, x0, 2
	add	x1, x20, x0
	sub	x0, x0, #4
	sub	x1, x3, x1
	add	x0, x20, x0
	cmp	x1, 8
	mov	x1, 0
	ccmp	x5, 7, 0, hi
	bls	.L390
.L386:
	ldr	q0, [x0, x1]
	str	q0, [x3, x1]
	add	x1, x1, 16
	cmp	x1, x22
	bne	.L386
	cmp	x19, x25
	beq	.L387
	add	x0, x2, x25
	add	x1, x25, x23
	ldr	s0, [x20, x0, lsl 2]
	str	s0, [x6, x1, lsl 2]
	cmp	x19, x4
	bls	.L387
	add	x0, x2, x4
	add	x1, x4, x23
	ldr	s0, [x20, x0, lsl 2]
	str	s0, [x6, x1, lsl 2]
	cmp	x19, x28
	bls	.L387
	add	x2, x2, x28
	add	x0, x28, x23
	ldr	s0, [x20, x2, lsl 2]
	str	s0, [x6, x0, lsl 2]
.L387:
	add	w27, w27, 1
	add	x23, x23, x19
	cmp	w21, w27
	bne	.L383
.L382:
	mov	x0, 2305843009213693951
	cmp	x26, x0
	bhi	.L482
	lsl	x23, x26, 2
	cbz	x26, .L440
	mov	x0, x23
	bl	_Znwm
.LEHE7:
	add	x1, x0, x23
	str	x1, [sp, 120]
	mov	x25, x0
	cmp	x1, x0
	beq	.L391
	mov	x2, x23
	mov	w1, 0
	bl	memset
.L391:
	sxtw	x0, w21
	str	x0, [sp, 128]
	mov	x1, 2305843009213693951
	mul	x0, x0, x19
	cmp	x0, x1
	bhi	.L483
	lsl	x28, x0, 2
	cbz	x0, .L441
	mov	x0, x28
.LEHB8:
	bl	_Znwm
.LEHE8:
	add	x27, x0, x28
	mov	x22, x0
	cmp	x27, x0
	beq	.L393
	mov	x2, x28
	mov	w1, 0
	bl	memset
.L393:
	ldr	x1, [sp, 128]
	mov	x0, 2305843009213693951
	cmp	x1, x0
	bhi	.L484
	lsl	x28, x1, 2
	cbz	x1, .L442
	mov	x0, x28
.LEHB9:
	bl	_Znwm
.LEHE9:
	add	x8, x0, x28
	mov	x5, x0
	cmp	x8, x0
	beq	.L395
	mov	x2, x28
	mov	w1, 0
	stp	x0, x8, [sp, 128]
	bl	memset
	ldp	x5, x8, [sp, 128]
.L395:
	lsr	x0, x19, 2
	and	x3, x19, -4
	lsl	x6, x19, 2
	add	x10, x3, 1
	add	x9, x3, 2
	sub	x28, x19, #1
	add	x7, x23, x25
	mov	w1, 15
	lsl	x23, x0, 4
	mov	w0, 2139095039
	fmov	s8, w0
	str	w1, [sp, 128]
.L416:
	mov	x1, x20
	mov	x15, x25
	mov	x13, 0
	cbz	x26, .L408
	.p2align 3,,7
.L409:
	cmp	w21, 0
	ble	.L443
	fmov	s5, s8
	mov	x2, 0
	ldr	x12, [x24]
	mov	w11, 0
	mov	w14, 0
	.p2align 3,,7
.L407:
	movi	v1.2s, #0
	cbz	x19, .L400
	cmp	x28, 2
	bls	.L445
	add	x16, x12, x2, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L403:
	ldr	q2, [x16, x0]
	ldr	q0, [x1, x0]
	add	x0, x0, 16
	fsub	v0.4s, v0.4s, v2.4s
	fmul	v0.4s, v0.4s, v0.4s
	dup	s4, v0.s[0]
	dup	s3, v0.s[1]
	dup	s2, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s1, s1, s4
	fadd	s1, s3, s1
	fadd	s1, s2, s1
	fadd	s1, s1, s0
	cmp	x0, x23
	bne	.L403
	mov	x0, x3
	cmp	x19, x3
	beq	.L400
.L401:
	add	x18, x0, x13
	add	x17, x0, x2
	add	x16, x0, 1
	ldr	s0, [x20, x18, lsl 2]
	ldr	s2, [x12, x17, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x19, x16
	bls	.L400
	add	x17, x16, x13
	add	x16, x16, x2
	add	x0, x0, 2
	ldr	s0, [x20, x17, lsl 2]
	ldr	s2, [x12, x16, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x19, x0
	bls	.L400
	add	x16, x0, x13
	add	x0, x0, x2
	ldr	s0, [x20, x16, lsl 2]
	ldr	s2, [x12, x0, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
.L400:
	fcmpe	s5, s1
	bgt	.L450
.L405:
	add	w11, w11, 1
	add	x2, x2, x19
	cmp	w21, w11
	bne	.L407
	str	w14, [x15], 4
	add	x13, x13, x19
	add	x1, x1, x6
	cmp	x15, x7
	bne	.L409
.L408:
	cmp	x22, x27
	beq	.L397
	sub	x2, x27, x22
	mov	x0, x22
	mov	w1, 0
	stp	x9, x5, [sp, 136]
	stp	x8, x3, [sp, 152]
	stp	x10, x6, [sp, 168]
	str	x7, [sp, 184]
	bl	memset
	ldp	x9, x5, [sp, 136]
	ldp	x8, x3, [sp, 152]
	ldp	x10, x6, [sp, 168]
	ldr	x7, [sp, 184]
.L397:
	cmp	x5, x8
	beq	.L410
	sub	x2, x8, x5
	mov	x0, x5
	mov	w1, 0
	stp	x8, x9, [sp, 136]
	stp	x3, x10, [sp, 152]
	stp	x6, x7, [sp, 168]
	bl	memset
	mov	x5, x0
	ldp	x8, x9, [sp, 136]
	ldp	x3, x10, [sp, 152]
	ldp	x6, x7, [sp, 168]
.L410:
	cbz	x26, .L412
	mov	x12, x25
	mov	x11, 0
	.p2align 3,,7
.L413:
	ldrsw	x1, [x12]
	ldr	w0, [x5, x1, lsl 2]
	add	w0, w0, 1
	str	w0, [x5, x1, lsl 2]
	cbz	x19, .L421
	mul	x13, x1, x19
	cmp	x28, 2
	bls	.L447
	add	x1, x22, x13, lsl 2
	add	x2, x20, x11, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L420:
	ldr	q1, [x1, x0]
	ldr	q0, [x2, x0]
	fadd	v0.4s, v0.4s, v1.4s
	str	q0, [x1, x0]
	add	x0, x0, 16
	cmp	x0, x23
	bne	.L420
	mov	x0, x3
	cmp	x19, x3
	beq	.L421
.L418:
	add	x14, x13, x0
	add	x2, x0, x11
	add	x1, x0, 1
	ldr	s0, [x22, x14, lsl 2]
	ldr	s1, [x20, x2, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x22, x14, lsl 2]
	cmp	x1, x19
	bcs	.L421
	add	x2, x13, x1
	add	x1, x1, x11
	add	x0, x0, 2
	ldr	s0, [x22, x2, lsl 2]
	ldr	s1, [x20, x1, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x22, x2, lsl 2]
	cmp	x19, x0
	bls	.L421
	add	x1, x13, x0
	add	x0, x0, x11
	ldr	s0, [x22, x1, lsl 2]
	ldr	s1, [x20, x0, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x22, x1, lsl 2]
.L421:
	add	x12, x12, 4
	add	x11, x11, x19
	cmp	x12, x7
	bne	.L413
.L412:
	add	x15, x22, 4
	mov	x11, 0
	mov	x1, 0
	mov	x2, 0
	cmp	w21, 0
	ble	.L424
	.p2align 3,,7
.L414:
	ldr	w0, [x5, x2, lsl 2]
	cmp	w0, 0
	bgt	.L423
.L479:
	add	x12, x1, x6
.L425:
	add	x2, x2, 1
	mov	x1, x12
	add	x11, x11, x19
	cmp	w21, w2
	bgt	.L414
.L424:
	ldr	w0, [sp, 128]
	subs	w0, w0, #1
	str	w0, [sp, 128]
	bne	.L416
	cbz	x5, .L432
	sub	x1, x8, x5
	mov	x0, x5
	bl	_ZdlPvm
.L432:
	cbz	x22, .L433
	sub	x1, x27, x22
	mov	x0, x22
	bl	_ZdlPvm
.L433:
	cbz	x25, .L374
	ldr	x0, [sp, 120]
	ldp	x19, x20, [sp, 16]
	sub	x1, x0, x25
	mov	x0, x25
	ldr	d8, [sp, 96]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 192
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
.L390:
	.cfi_restore_state
	ldr	s0, [x0, x1, lsl 2]
	str	s0, [x3, x1, lsl 2]
	add	x1, x1, 1
	cmp	x19, x1
	beq	.L387
	ldr	s0, [x0, x1, lsl 2]
	str	s0, [x3, x1, lsl 2]
	add	x1, x1, 1
	cmp	x19, x1
	bne	.L390
	b	.L387
.L423:
	cbz	x19, .L479
	ldr	x13, [x24]
	scvtf	s1, w0
	sub	x0, x13, x15
	add	x12, x13, x1
	cmp	x0, 8
	ccmp	x28, 5, 0, hi
	bls	.L426
	dup	v2.4s, v1.s[0]
	add	x14, x1, x22
	mov	x0, 0
	.p2align 3,,7
.L428:
	ldr	q0, [x14, x0]
	fdiv	v0.4s, v0.4s, v2.4s
	str	q0, [x12, x0]
	add	x0, x0, 16
	cmp	x0, x23
	bne	.L428
	add	x12, x1, x6
	cmp	x19, x3
	beq	.L425
	add	x0, x11, x3
	ldr	s0, [x22, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x13, x0, lsl 2]
	cmp	x19, x10
	bls	.L425
	add	x0, x11, x10
	ldr	s0, [x22, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x13, x0, lsl 2]
	cmp	x9, x19
	bcs	.L425
	add	x0, x9, x11
	ldr	s0, [x22, x0, lsl 2]
	fdiv	s0, s0, s1
	str	s0, [x13, x0, lsl 2]
	b	.L425
	.p2align 2,,3
.L450:
	fmov	s5, s1
	mov	w14, w11
	b	.L405
.L445:
	mov	x0, 0
	b	.L401
.L443:
	mov	w14, 0
	str	w14, [x15], 4
	add	x13, x13, x19
	add	x1, x1, x6
	cmp	x15, x7
	bne	.L409
	b	.L408
.L447:
	mov	x0, 0
	b	.L418
.L426:
	add	x12, x1, x6
	mov	x0, x1
.L431:
	ldr	s0, [x22, x0]
	fdiv	s0, s0, s1
	str	s0, [x13, x0]
	add	x0, x0, 4
	cmp	x12, x0
	bne	.L431
	b	.L425
.L376:
	mov	x0, x22
.LEHB10:
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x22]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	mov	w1, 10
	ldr	x2, [x2, 48]
	cmp	x2, x0
	beq	.L377
	mov	x0, x22
	blr	x2
	and	w1, w0, 255
	b	.L377
.L374:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	d8, [sp, 96]
	ldp	x29, x30, [sp], 192
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
.L442:
	.cfi_restore_state
	mov	x5, 0
	mov	x8, 0
	b	.L395
.L441:
	mov	x22, 0
	mov	x27, 0
	b	.L393
.L440:
	mov	x25, 0
	str	xzr, [sp, 120]
	b	.L391
.L482:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	_ZSt20__throw_length_errorPKc
.L481:
	bl	_ZSt16__throw_bad_castv
.LEHE10:
.L484:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB11:
	bl	_ZSt20__throw_length_errorPKc
.LEHE11:
.L483:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB12:
	bl	_ZSt20__throw_length_errorPKc
.LEHE12:
.L449:
	sub	x1, x27, x22
	mov	x19, x0
	cbz	x22, .L437
	mov	x0, x22
	bl	_ZdlPvm
.L437:
	ldr	x0, [sp, 120]
	sub	x1, x0, x25
	cbz	x25, .L438
	mov	x0, x25
	bl	_ZdlPvm
.L438:
	mov	x0, x19
.LEHB13:
	bl	_Unwind_Resume
.LEHE13:
.L448:
	mov	x19, x0
	b	.L437
	.cfi_endproc
.LFE10567:
	.section	.gcc_except_table._Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,"aG",@progbits,_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,comdat
.LLSDA10567:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10567-.LLSDACSB10567
.LLSDACSB10567:
	.uleb128 .LEHB7-.LFB10567
	.uleb128 .LEHE7-.LEHB7
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB8-.LFB10567
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L448-.LFB10567
	.uleb128 0
	.uleb128 .LEHB9-.LFB10567
	.uleb128 .LEHE9-.LEHB9
	.uleb128 .L449-.LFB10567
	.uleb128 0
	.uleb128 .LEHB10-.LFB10567
	.uleb128 .LEHE10-.LEHB10
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB11-.LFB10567
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L449-.LFB10567
	.uleb128 0
	.uleb128 .LEHB12-.LFB10567
	.uleb128 .LEHE12-.LEHB12
	.uleb128 .L448-.LFB10567
	.uleb128 0
	.uleb128 .LEHB13-.LFB10567
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
.LLSDACSE10567:
	.section	.text._Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,"axG",@progbits,_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE,comdat
	.size	_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE, .-_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE
	.section	.rodata._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_.str1.8,"aMS",@progbits,1
	.align	3
.LC6:
	.string	"basic_string::_M_construct null not valid"
	.align	3
.LC7:
	.string	"basic_string::append"
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
	.type	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_, %function
_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_:
.LFB10873:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10873
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	add	x22, x8, 16
	ldr	x20, [x0, 8]
	str	x23, [sp, 48]
	.cfi_offset 23, -32
	str	x22, [x8]
	ldr	x23, [x0]
	cmn	x23, x20
	ccmp	x23, 0, 0, ne
	beq	.L499
	str	x20, [sp, 72]
	mov	x19, x8
	mov	x21, x1
	cmp	x20, 15
	bhi	.L500
	cmp	x20, 1
	bne	.L489
	ldrb	w1, [x23]
	mov	x0, x22
	strb	w1, [x8, 16]
.L490:
	str	x20, [x19, 8]
	strb	wzr, [x0, x20]
	mov	x0, x21
	bl	strlen
	mov	x2, x0
	ldr	x1, [x19, 8]
	mov	x0, 4611686018427387903
	sub	x0, x0, x1
	cmp	x2, x0
	bhi	.L501
	mov	x1, x21
	mov	x0, x19
.LEHB14:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE14:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L489:
	.cfi_restore_state
	mov	x0, x22
	cbz	x20, .L490
	b	.L488
	.p2align 2,,3
.L500:
	add	x1, sp, 72
	mov	x0, x8
	mov	x2, 0
.LEHB15:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE15:
	ldr	x1, [sp, 72]
	str	x0, [x19]
	str	x1, [x19, 16]
.L488:
	mov	x2, x20
	mov	x1, x23
	bl	memcpy
	ldr	x0, [x19]
	ldr	x20, [sp, 72]
	b	.L490
.L501:
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
.LEHB16:
	bl	_ZSt20__throw_length_errorPKc
.LEHE16:
.L499:
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
.LEHB17:
	bl	_ZSt19__throw_logic_errorPKc
.L495:
	ldr	x2, [x19]
	mov	x20, x0
	cmp	x22, x2
	beq	.L493
	ldr	x1, [x19, 16]
	mov	x0, x2
	add	x1, x1, 1
	bl	_ZdlPvm
.L493:
	mov	x0, x20
	bl	_Unwind_Resume
.LEHE17:
	.cfi_endproc
.LFE10873:
	.section	.gcc_except_table._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,"aG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,comdat
.LLSDA10873:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10873-.LLSDACSB10873
.LLSDACSB10873:
	.uleb128 .LEHB14-.LFB10873
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L495-.LFB10873
	.uleb128 0
	.uleb128 .LEHB15-.LFB10873
	.uleb128 .LEHE15-.LEHB15
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB16-.LFB10873
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L495-.LFB10873
	.uleb128 0
	.uleb128 .LEHB17-.LFB10873
	.uleb128 .LEHE17-.LEHB17
	.uleb128 0
	.uleb128 0
.LLSDACSE10873:
	.section	.text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,"axG",@progbits,_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_,comdat
	.size	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_, .-_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
	.section	.text._ZNSt6vectorI7IVFListSaIS0_EED2Ev,"axG",@progbits,_ZNSt6vectorI7IVFListSaIS0_EED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorI7IVFListSaIS0_EED2Ev
	.type	_ZNSt6vectorI7IVFListSaIS0_EED2Ev, %function
_ZNSt6vectorI7IVFListSaIS0_EED2Ev:
.LFB11114:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	ldp	x19, x20, [x0]
	str	x21, [sp, 32]
	.cfi_offset 21, -16
	mov	x21, x0
	cmp	x19, x20
	beq	.L503
	.p2align 3,,7
.L507:
	ldr	x1, [x19]
	mov	x0, x1
	cbz	x1, .L504
	ldr	x2, [x19, 16]
	add	x19, x19, 24
	sub	x1, x2, x1
	bl	_ZdlPvm
	cmp	x20, x19
	bne	.L507
	ldr	x20, [x21]
.L503:
	cbz	x20, .L502
	ldr	x1, [x21, 16]
	mov	x0, x20
	ldr	x21, [sp, 32]
	sub	x1, x1, x20
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.p2align 2,,3
.L504:
	.cfi_restore_state
	add	x19, x19, 24
	cmp	x20, x19
	bne	.L507
	ldr	x20, [x21]
	b	.L503
	.p2align 2,,3
.L502:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11114:
	.size	_ZNSt6vectorI7IVFListSaIS0_EED2Ev, .-_ZNSt6vectorI7IVFListSaIS0_EED2Ev
	.weak	_ZNSt6vectorI7IVFListSaIS0_EED1Ev
	.set	_ZNSt6vectorI7IVFListSaIS0_EED1Ev,_ZNSt6vectorI7IVFListSaIS0_EED2Ev
	.section	.rodata._Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE.str1.8,"aMS",@progbits,1
	.align	3
.LC8:
	.string	"[IVF] Building Inverted Lists (Distributing vectors into rooms)..."
	.align	3
.LC9:
	.string	"vector::_M_realloc_insert"
	.align	3
.LC10:
	.string	"vector::_M_range_insert"
	.align	3
.LC11:
	.string	"[IVF] Build Finished! 100,000 vectors successfully buckets!"
	.section	.text._Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,"axG",@progbits,_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,comdat
	.align	2
	.p2align 4,,11
	.weak	_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE
	.type	_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE, %function
_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE:
.LFB10568:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10568
	stp	x29, x30, [sp, -176]!
	.cfi_def_cfa_offset 176
	.cfi_offset 29, -176
	.cfi_offset 30, -168
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -160
	.cfi_offset 20, -152
	mov	x20, x2
	mov	x2, 66
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -144
	.cfi_offset 22, -136
	mov	x22, x0
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -128
	.cfi_offset 24, -120
	mov	w24, w3
	str	d8, [sp, 96]
	stp	x8, x1, [sp, 120]
	adrp	x1, .LC8
	add	x1, x1, :lo12:.LC8
	str	x4, [sp, 144]
.LEHB18:
	.cfi_offset 72, -80
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, _ZSt4cerr
	adrp	x1, _ZSt4cerr
	add	x1, x1, :lo12:_ZSt4cerr
	ldr	x0, [x0, #:lo12:_ZSt4cerr]
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	x19, [x0, 240]
	cbz	x19, .L636
	ldrb	w0, [x19, 56]
	cbz	w0, .L512
	ldrb	w1, [x19, 67]
.L513:
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZNSo3putEc
	sxtw	x19, w24
	bl	_ZNSo5flushEv
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -104
	.cfi_offset 25, -112
	mov	x0, 6148914691236517205
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -88
	.cfi_offset 27, -96
	movk	x0, 0x555, lsl 48
	cmp	x19, x0
	bhi	.L637
	ldr	x25, [sp, 120]
	mov	w21, 24
	movi	v0.4s, 0
	smull	x21, w24, w21
	str	xzr, [x25, 16]
	str	q0, [x25]
	cbz	x19, .L515
	mov	x0, x21
	sub	x23, x19, #1
	bl	_Znwm
.LEHE18:
	add	x3, x0, x21
	str	x0, [x25]
	mov	x1, x0
	str	x3, [x25, 16]
	cmp	x23, 2
	bls	.L577
	movi	v0.4s, 0
	and	x2, x19, -2
	add	x2, x2, x19, lsr 1
	add	x2, x0, x2, lsl 4
.L517:
	stp	q0, q0, [x0]
	add	x0, x0, 48
	str	q0, [x0, -16]
	cmp	x0, x2
	bne	.L517
	and	x0, x19, -2
	and	x2, x19, 1
	add	x4, x0, x0, lsl 1
	add	x1, x1, x4, lsl 3
	cmp	x19, x0
	beq	.L518
.L516:
	movi	v0.4s, 0
	str	xzr, [x1, 16]
	str	q0, [x1]
	cmp	x2, 1
	beq	.L518
	mov	x0, x1
	str	q0, [x0, 24]!
	str	xzr, [x0, 16]
	cmp	x2, 2
	beq	.L518
	str	q0, [x1, 48]!
	str	xzr, [x1, 16]
.L518:
	ldr	x0, [sp, 120]
	str	x3, [x0, 8]
	mov	x0, x21
.LEHB19:
	bl	_Znwm
	mov	x28, x0
	add	x0, x0, x21
	str	x0, [sp, 112]
	cmp	x23, 2
	bls	.L638
	and	x1, x19, -2
	mov	x0, x28
	movi	v0.4s, 0
	add	x1, x1, x19, lsr 1
	add	x1, x28, x1, lsl 4
.L520:
	stp	q0, q0, [x0]
	add	x0, x0, 48
	str	q0, [x0, -16]
	cmp	x0, x1
	bne	.L520
	and	x2, x19, -2
	and	x1, x19, 1
	add	x0, x2, x2, lsl 1
	add	x0, x28, x0, lsl 3
	cmp	x19, x2
	beq	.L523
.L519:
	movi	v0.4s, 0
	str	xzr, [x0, 16]
	str	q0, [x0]
	cmp	x1, 1
	beq	.L523
	mov	x2, x0
	str	q0, [x2, 24]!
	str	xzr, [x2, 16]
	cmp	x1, 2
	beq	.L523
	str	q0, [x0, 48]!
	str	xzr, [x0, 16]
.L523:
	ldr	x0, [sp, 128]
	cbz	x0, .L521
.L522:
	lsr	x19, x20, 2
	sub	x26, x20, #1
	and	x23, x20, -4
	mov	w0, 2139095039
	lsl	x19, x19, 4
	fmov	s8, w0
	mov	x21, 0
	mov	x27, 0
	.p2align 3,,7
.L545:
	cmp	w24, 0
	ble	.L579
	ldr	x0, [sp, 144]
	fmov	s5, s8
	add	x2, x22, x21, lsl 2
	mov	x3, 0
	mov	w4, 0
	mov	w25, 0
	ldr	x5, [x0]
	.p2align 3,,7
.L534:
	movi	v4.2s, #0
	cbz	x20, .L528
	cmp	x26, 2
	bls	.L581
	add	x1, x5, x3, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L530:
	ldr	q1, [x1, x0]
	ldr	q0, [x2, x0]
	add	x0, x0, 16
	fsub	v0.4s, v0.4s, v1.4s
	fmul	v0.4s, v0.4s, v0.4s
	dup	s3, v0.s[0]
	dup	s2, v0.s[1]
	dup	s1, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s3, s3, s4
	fadd	s2, s2, s3
	fadd	s1, s1, s2
	fadd	s4, s1, s0
	cmp	x0, x19
	bne	.L530
	mov	x0, x23
	cmp	x20, x23
	beq	.L528
.L529:
	add	x7, x21, x0
	add	x6, x3, x0
	add	x1, x0, 1
	ldr	s0, [x22, x7, lsl 2]
	ldr	s1, [x5, x6, lsl 2]
	fsub	s0, s0, s1
	fmadd	s4, s0, s0, s4
	cmp	x1, x20
	bcs	.L528
	add	x6, x1, x21
	add	x1, x1, x3
	add	x0, x0, 2
	ldr	s0, [x22, x6, lsl 2]
	ldr	s1, [x5, x1, lsl 2]
	fsub	s0, s0, s1
	fmadd	s4, s0, s0, s4
	cmp	x20, x0
	bls	.L528
	add	x1, x0, x21
	add	x0, x3, x0
	ldr	s0, [x22, x1, lsl 2]
	ldr	s1, [x5, x0, lsl 2]
	fsub	s0, s0, s1
	fmadd	s4, s0, s0, s4
.L528:
	fcmpe	s5, s4
	bgt	.L591
.L532:
	add	w4, w4, 1
	add	x3, x3, x20
	cmp	w24, w4
	bne	.L534
	mov	w0, 24
	smaddl	x25, w25, w0, x28
.L527:
	ldp	x0, x1, [x25, 8]
	str	w27, [sp, 136]
	cmp	x0, x1
	beq	.L535
	str	w27, [x0], 4
	str	x0, [x25, 8]
.L536:
	ldr	x0, [sp, 128]
	add	x27, x27, 1
	add	x21, x21, x20
	cmp	x0, x27
	bhi	.L545
.L521:
	cmp	w24, 0
	ble	.L525
	mov	w0, 24
	mov	x19, x28
	umaddl	x26, w24, w0, x28
	b	.L561
.L639:
	mov	x1, x22
	mov	x0, x23
	mov	x2, x20
	bl	memmove
	ldr	x0, [x21, 8]
	add	x0, x0, x20
	str	x0, [x21, 8]
.L549:
	add	x19, x19, 24
	cmp	x26, x19
	beq	.L525
.L561:
	ldr	x0, [sp, 120]
	sub	x24, x19, x28
	ldp	x22, x20, [x19]
	ldr	x25, [x0]
	add	x21, x25, x24
	ldr	x23, [x21, 8]
	cmp	x22, x20
	beq	.L549
	ldr	x0, [x21, 16]
	sub	x20, x20, x22
	sub	x0, x0, x23
	cmp	x0, x20
	bcs	.L639
	ldr	x3, [x25, x24]
	mov	x4, 2305843009213693951
	asr	x0, x20, 2
	sub	x2, x23, x3
	asr	x1, x2, 2
	sub	x4, x4, x1
	cmp	x0, x4
	bhi	.L640
	cmp	x0, x1
	csel	x0, x0, x1, cs
	adds	x0, x0, x1
	bcs	.L553
	mov	x5, 0
	mov	x4, 0
	cbnz	x0, .L641
.L555:
	add	x6, x4, x2
	add	x27, x6, x20
	cmp	x23, x3
	beq	.L556
	mov	x1, x3
	mov	x0, x4
	stp	x4, x3, [sp, 128]
	stp	x5, x6, [sp, 144]
	bl	memmove
	mov	x1, x22
	ldr	x6, [sp, 152]
	mov	x2, x20
	mov	x0, x6
	bl	memcpy
	ldr	x1, [x21, 8]
	ldp	x4, x3, [sp, 128]
	subs	x0, x1, x23
	ldr	x5, [sp, 144]
	beq	.L642
.L557:
	mov	x20, x0
	mov	x2, x0
	mov	x1, x23
	mov	x0, x27
	stp	x3, x4, [sp, 128]
	add	x27, x27, x20
	str	x5, [sp, 144]
	bl	memcpy
	ldp	x3, x4, [sp, 128]
	ldr	x5, [sp, 144]
	cbnz	x3, .L643
.L560:
	str	x4, [x25, x24]
	add	x19, x19, 24
	stp	x27, x5, [x21, 8]
	cmp	x26, x19
	bne	.L561
.L525:
	ldr	x0, [sp, 112]
	mov	x19, x28
	cmp	x0, x28
	beq	.L563
	.p2align 3,,7
.L546:
	ldr	x0, [x19]
	cbz	x0, .L562
	ldr	x1, [x19, 16]
	add	x19, x19, 24
	sub	x1, x1, x0
	bl	_ZdlPvm
	ldr	x0, [sp, 112]
	cmp	x19, x0
	bne	.L546
.L563:
	cbz	x28, .L548
	ldr	x0, [sp, 112]
	sub	x1, x0, x28
	mov	x0, x28
	bl	_ZdlPvm
.L548:
	adrp	x1, .LC11
	adrp	x0, _ZSt4cerr
	add	x1, x1, :lo12:.LC11
	add	x0, x0, :lo12:_ZSt4cerr
	mov	x2, 59
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x0, _ZSt4cerr
	adrp	x1, _ZSt4cerr
	add	x1, x1, :lo12:_ZSt4cerr
	ldr	x0, [x0, #:lo12:_ZSt4cerr]
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	x19, [x0, 240]
	cbz	x19, .L644
	ldrb	w0, [x19, 56]
	cbz	w0, .L566
	ldrb	w1, [x19, 67]
.L567:
	adrp	x0, _ZSt4cerr
	add	x0, x0, :lo12:_ZSt4cerr
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
.LEHE19:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	.cfi_remember_state
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldr	d8, [sp, 96]
	ldr	x0, [sp, 120]
	ldp	x29, x30, [sp], 176
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L591:
	.cfi_restore_state
	fmov	s5, s4
	mov	w25, w4
	b	.L532
.L581:
	mov	x0, 0
	b	.L529
.L535:
	ldr	x1, [x25]
	mov	x2, x1
	str	x2, [sp, 136]
	sub	x0, x0, x2
	str	x0, [sp, 152]
	mov	x1, 2305843009213693951
	asr	x0, x0, 2
	cmp	x0, x1
	beq	.L645
	cmp	x0, 0
	csinc	x2, x0, xzr, ne
	adds	x0, x0, x2
	bcs	.L539
	mov	x5, 0
	mov	x3, 0
	cbnz	x0, .L646
.L541:
	ldr	x2, [sp, 152]
	add	x4, x2, 4
	str	w27, [x3, x2]
	add	x4, x3, x4
	cmp	x2, 0
	bgt	.L647
	ldr	x0, [sp, 136]
	cbnz	x0, .L648
.L544:
	stp	x3, x4, [x25]
	str	x5, [x25, 16]
	b	.L536
.L562:
	ldr	x0, [sp, 112]
	add	x19, x19, 24
	cmp	x0, x19
	bne	.L546
	b	.L563
.L556:
	mov	x2, x20
	mov	x1, x22
	mov	x0, x6
	stp	x3, x4, [sp, 128]
	mov	x20, 0
	str	x5, [sp, 144]
	bl	memcpy
	ldr	x1, [x21, 8]
	ldp	x3, x4, [sp, 128]
	subs	x0, x1, x23
	ldr	x5, [sp, 144]
	bne	.L557
	add	x27, x27, x20
	cbz	x3, .L560
.L643:
	ldr	x1, [x21, 16]
	sub	x1, x1, x3
.L574:
	mov	x0, x3
	stp	x4, x5, [sp, 128]
	bl	_ZdlPvm
	ldp	x4, x5, [sp, 128]
	b	.L560
.L579:
	mov	x25, x28
	b	.L527
.L647:
	ldr	x1, [sp, 136]
	mov	x0, x3
	stp	x5, x4, [sp, 152]
	bl	memmove
	mov	x3, x0
	ldr	x1, [x25, 16]
	ldr	x0, [sp, 136]
	ldp	x5, x4, [sp, 152]
	sub	x1, x1, x0
.L543:
	stp	x5, x3, [sp, 152]
	str	x4, [sp, 168]
	bl	_ZdlPvm
	ldp	x5, x3, [sp, 152]
	ldr	x4, [sp, 168]
	b	.L544
.L512:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	mov	x0, x19
.LEHB20:
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x19]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	mov	w1, 10
	ldr	x2, [x2, 48]
	cmp	x2, x0
	beq	.L513
	mov	x0, x19
	blr	x2
.LEHE20:
	and	w1, w0, 255
	b	.L513
.L566:
	.cfi_offset 25, -112
	.cfi_offset 26, -104
	.cfi_offset 27, -96
	.cfi_offset 28, -88
	mov	x0, x19
.LEHB21:
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x2, [x19]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	mov	w1, 10
	ldr	x2, [x2, 48]
	cmp	x2, x0
	beq	.L567
	mov	x0, x19
	blr	x2
.LEHE21:
	and	w1, w0, 255
	b	.L567
.L642:
	ldr	x1, [x21, 16]
	add	x27, x27, x0
	sub	x1, x1, x3
	b	.L574
.L641:
	mov	x1, 2305843009213693951
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x27, x0, 2
.L554:
	mov	x0, x27
.LEHB22:
	bl	_Znwm
	ldr	x3, [x25, x24]
	mov	x4, x0
	add	x5, x0, x27
	sub	x2, x23, x3
	b	.L555
.L646:
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x0, x0, 2
	str	x0, [sp, 160]
.L540:
	bl	_Znwm
.LEHE22:
	mov	x3, x0
	ldr	x0, [sp, 160]
	add	x5, x3, x0
	b	.L541
.L648:
	ldr	x1, [x25, 16]
	sub	x1, x1, x0
	b	.L543
.L515:
	ldr	x0, [sp, 128]
	stp	xzr, xzr, [x25]
	str	xzr, [x25, 16]
	cbz	x0, .L548
	mov	x28, 0
	str	xzr, [sp, 112]
	b	.L522
.L638:
	mov	x1, x19
	mov	x0, x28
	b	.L519
.L577:
	mov	x2, x19
	b	.L516
.L636:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -104
	.cfi_offset 25, -112
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -88
	.cfi_offset 27, -96
.LEHB23:
	bl	_ZSt16__throw_bad_castv
.LEHE23:
.L539:
	mov	x0, 9223372036854775804
	str	x0, [sp, 160]
	b	.L540
.L645:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB24:
	bl	_ZSt20__throw_length_errorPKc
.LEHE24:
.L644:
.LEHB25:
	bl	_ZSt16__throw_bad_castv
.LEHE25:
.L637:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB26:
	bl	_ZSt20__throw_length_errorPKc
.LEHE26:
.L553:
	mov	x27, 9223372036854775804
	b	.L554
.L640:
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
.LEHB27:
	bl	_ZSt20__throw_length_errorPKc
.LEHE27:
.L589:
	mov	x20, x28
	mov	x19, x0
.L571:
	ldr	x0, [sp, 112]
	cmp	x0, x20
	bne	.L649
	ldr	x0, [sp, 112]
	sub	x1, x0, x28
	cbz	x28, .L573
	mov	x0, x28
	bl	_ZdlPvm
.L573:
	ldr	x0, [sp, 120]
	bl	_ZNSt6vectorI7IVFListSaIS0_EED1Ev
	mov	x0, x19
.LEHB28:
	bl	_Unwind_Resume
.LEHE28:
.L590:
	mov	x19, x0
	b	.L573
.L649:
	ldr	x0, [x20]
	ldr	x1, [x20, 16]
	sub	x1, x1, x0
	cbz	x0, .L570
	bl	_ZdlPvm
.L570:
	add	x20, x20, 24
	b	.L571
	.cfi_endproc
.LFE10568:
	.section	.gcc_except_table._Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,"aG",@progbits,_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,comdat
.LLSDA10568:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10568-.LLSDACSB10568
.LLSDACSB10568:
	.uleb128 .LEHB18-.LFB10568
	.uleb128 .LEHE18-.LEHB18
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB19-.LFB10568
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L590-.LFB10568
	.uleb128 0
	.uleb128 .LEHB20-.LFB10568
	.uleb128 .LEHE20-.LEHB20
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB21-.LFB10568
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L590-.LFB10568
	.uleb128 0
	.uleb128 .LEHB22-.LFB10568
	.uleb128 .LEHE22-.LEHB22
	.uleb128 .L589-.LFB10568
	.uleb128 0
	.uleb128 .LEHB23-.LFB10568
	.uleb128 .LEHE23-.LEHB23
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB24-.LFB10568
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L589-.LFB10568
	.uleb128 0
	.uleb128 .LEHB25-.LFB10568
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L590-.LFB10568
	.uleb128 0
	.uleb128 .LEHB26-.LFB10568
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB27-.LFB10568
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L589-.LFB10568
	.uleb128 0
	.uleb128 .LEHB28-.LFB10568
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
.LLSDACSE10568:
	.section	.text._Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,"axG",@progbits,_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE,comdat
	.size	_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE, .-_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE
	.section	.text._ZNSt11unique_lockISt5mutexE6unlockEv,"axG",@progbits,_ZNSt11unique_lockISt5mutexE6unlockEv,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt11unique_lockISt5mutexE6unlockEv
	.type	_ZNSt11unique_lockISt5mutexE6unlockEv, %function
_ZNSt11unique_lockISt5mutexE6unlockEv:
.LFB11411:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldrb	w0, [x0, 8]
	cbz	w0, .L661
	ldr	x0, [x19]
	cbz	x0, .L650
	adrp	x1, .LC12
	ldr	x1, [x1, #:lo12:.LC12]
	cbz	x1, .L653
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L653:
	strb	wzr, [x19, 8]
.L650:
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
.L661:
	.cfi_restore_state
	mov	w0, 1
	bl	_ZSt20__throw_system_errori
	.cfi_endproc
.LFE11411:
	.size	_ZNSt11unique_lockISt5mutexE6unlockEv, .-_ZNSt11unique_lockISt5mutexE6unlockEv
	.section	.text._ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev,"axG",@progbits,_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev
	.type	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev, %function
_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev:
.LFB11632:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	ldr	x22, [x0]
	cbz	x22, .L662
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -40
	.cfi_offset 19, -48
	add	x19, x22, 48
	str	x23, [sp, 48]
	.cfi_offset 23, -16
	add	x23, x22, 16
.L669:
	ldp	x4, x20, [x23, 16]
	ldr	x3, [x23]
	.p2align 3,,7
.L667:
	sub	x1, x4, x3
	ldp	x2, x6, [x19]
	sub	x7, x4, #8
	ldr	x5, [x19, 24]
	sub	x0, x5, x20
	sub	x2, x2, x6
	asr	x0, x0, 3
	sub	x0, x0, #1
	asr	x2, x2, 3
	add	x0, x2, x0, lsl 6
	add	x0, x0, x1, asr 3
	cbz	x0, .L664
	ldr	x21, [x3]
	cmp	x3, x7
	beq	.L665
	add	x3, x3, 8
	str	x3, [x22, 16]
	cbz	x21, .L667
.L683:
	ldr	x0, [x21, 8]
	cbz	x0, .L668
	bl	_ZdaPv
.L668:
	mov	x0, x21
	mov	x1, 24
	bl	_ZdlPvm
	b	.L669
	.p2align 2,,3
.L665:
	ldr	x0, [x22, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x22, 40]
	add	x20, x0, 8
	ldr	x3, [x0, 8]
	str	x20, [x23, 24]
	add	x4, x3, 512
	stp	x3, x4, [x23, 8]
	str	x3, [x22, 16]
	cbz	x21, .L667
	b	.L683
	.p2align 2,,3
.L664:
	ldr	x0, [x22]
	cbz	x0, .L670
	add	x19, x5, 8
	cmp	x19, x20
	bls	.L671
	.p2align 3,,7
.L672:
	ldr	x0, [x20], 8
	mov	x1, 512
	bl	_ZdlPvm
	cmp	x19, x20
	bhi	.L672
	ldr	x0, [x22]
.L671:
	ldr	x1, [x22, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L670:
	mov	x0, x22
	mov	x1, 136
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	.cfi_restore 23
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.p2align 2,,3
.L662:
	.cfi_def_cfa_offset 64
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11632:
	.size	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev, .-_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev
	.weak	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED1Ev
	.set	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED1Ev,_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED2Ev
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev,"axG",@progbits,_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED5Ev,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev
	.type	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev, %function
_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev:
.LFB11668:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x20, x0
	ldr	x19, [x0, 16]
	cbz	x19, .L685
	.p2align 3,,7
.L686:
	mov	x0, x19
	mov	x1, 16
	ldr	x19, [x19]
	bl	_ZdlPvm
	cbnz	x19, .L686
.L685:
	ldp	x0, x2, [x20]
	mov	w1, 0
	lsl	x2, x2, 3
	bl	memset
	ldp	x0, x1, [x20]
	add	x2, x20, 48
	stp	xzr, xzr, [x20, 16]
	cmp	x0, x2
	beq	.L684
	ldp	x19, x20, [sp, 16]
	lsl	x1, x1, 3
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.p2align 2,,3
.L684:
	.cfi_restore_state
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11668:
	.size	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev, .-_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev
	.weak	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED1Ev
	.set	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED1Ev,_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED2Ev
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, %function
_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB11209:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11209
	sub	sp, sp, #624
	.cfi_def_cfa_offset 624
	stp	x29, x30, [sp]
	.cfi_offset 29, -624
	.cfi_offset 30, -616
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -608
	.cfi_offset 20, -600
	mov	x19, x1
	mov	x20, x0
	add	x0, sp, 352
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -592
	.cfi_offset 22, -584
	.cfi_offset 23, -576
	.cfi_offset 24, -568
	adrp	x23, _ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	add	x23, x23, :lo12:_ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -560
	.cfi_offset 26, -552
	bl	_ZNSt8ios_baseC2Ev
	adrp	x0, _ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	add	x0, x0, :lo12:_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	add	x1, sp, 512
	movi	v0.4s, 0
	add	x2, sp, 512
	strh	wzr, [sp, 576]
	add	x3, sp, 96
	ldp	x22, x26, [x0, 8]
	add	x0, sp, 96
	str	q0, [x1, 72]
	mov	x1, 0
	str	q0, [x2, 88]
	ldr	x2, [x22, -24]
	str	x22, [sp, 96]
	str	x23, [sp, 352]
	str	xzr, [sp, 568]
	add	x0, x0, x2
	str	x26, [x3, x2]
.LEHB29:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE29:
	adrp	x25, _ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24
	adrp	x24, _ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64
	add	x25, x25, :lo12:_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24
	add	x24, x24, :lo12:_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64
	add	x0, sp, 104
	str	x25, [sp, 96]
	str	x24, [sp, 352]
.LEHB30:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE30:
	add	x0, sp, 96
	add	x1, sp, 104
	add	x0, x0, 256
.LEHB31:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
	ldr	x1, [x19]
	add	x0, sp, 104
	mov	w2, 20
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	mov	x2, x0
	ldr	x0, [sp, 96]
	ldr	x1, [x0, -24]
	add	x0, sp, 96
	add	x0, x0, x1
	cbz	x2, .L720
	mov	w1, 0
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE31:
.L695:
	add	x1, x20, 240
	add	x0, sp, 96
	mov	x2, 8
.LEHB32:
	bl	_ZNSo5writeEPKcl
	mov	x2, 8
	add	x0, sp, 96
	add	x1, x20, x2
	bl	_ZNSo5writeEPKcl
	add	x21, x20, 16
	add	x0, sp, 96
	mov	x1, x21
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 24
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 248
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 232
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 104
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 216
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 56
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 64
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 48
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 88
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x20, 72
	add	x0, sp, 96
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	ldr	x1, [x20, 256]
	ldar	x3, [x21]
	ldr	x2, [x20, 24]
	add	x0, sp, 96
	mul	x2, x3, x2
	bl	_ZNSo5writeEPKcl
	mov	x19, 0
	ldar	x0, [x21]
	cmp	x19, x0
	bcs	.L700
	.p2align 3,,7
.L722:
	ldr	x0, [x20, 272]
	mov	w3, 0
	ldr	w0, [x0, x19, lsl 2]
	cmp	w0, 0
	ble	.L701
	ldr	x3, [x20, 32]
	mul	w3, w0, w3
.L701:
	add	x1, sp, 92
	add	x0, sp, 96
	mov	x2, 4
	str	w3, [sp, 92]
	bl	_ZNSo5writeEPKcl
	ldr	w2, [sp, 92]
	cbnz	w2, .L721
	add	x19, x19, 1
.L724:
	ldar	x0, [x21]
	cmp	x19, x0
	bcc	.L722
.L700:
	add	x0, sp, 104
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE32:
	cbz	x0, .L723
.L704:
	adrp	x1, _ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x0, sp, 104
	stp	x25, x1, [sp, 96]
	str	x24, [sp, 352]
.LEHB33:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE33:
.L706:
	add	x0, sp, 216
	bl	_ZNSt12__basic_fileIcED1Ev
	adrp	x1, _ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x0, sp, 160
	str	x1, [sp, 104]
	bl	_ZNSt6localeD1Ev
	ldr	x1, [x22, -24]
	add	x2, sp, 96
	str	x22, [sp, 96]
	add	x0, sp, 352
	str	x26, [x2, x1]
	str	x23, [sp, 352]
	bl	_ZNSt8ios_baseD2Ev
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	add	sp, sp, 624
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L721:
	.cfi_restore_state
	ldr	x1, [x20, 264]
	uxtw	x2, w2
	add	x0, sp, 96
	ldr	x1, [x1, x19, lsl 3]
.LEHB34:
	bl	_ZNSo5writeEPKcl
.LEHE34:
	add	x19, x19, 1
	b	.L724
	.p2align 2,,3
.L720:
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB35:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE35:
	b	.L695
	.p2align 2,,3
.L723:
	ldr	x0, [sp, 96]
	add	x1, sp, 96
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB36:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE36:
	b	.L704
.L713:
	bl	__cxa_begin_catch
	bl	__cxa_end_catch
	b	.L706
.L709:
	mov	x19, x0
	add	x0, sp, 96
	bl	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	mov	x0, x19
.LEHB37:
	bl	_Unwind_Resume
.L712:
	mov	x19, x0
	add	x0, sp, 104
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L698:
	ldr	x0, [x22, -24]
	add	x1, sp, 96
	str	x22, [sp, 96]
	str	x26, [x1, x0]
.L699:
	add	x0, sp, 352
	str	x23, [sp, 352]
	bl	_ZNSt8ios_baseD2Ev
	mov	x0, x19
	bl	_Unwind_Resume
.LEHE37:
.L711:
	mov	x19, x0
	b	.L698
.L710:
	mov	x19, x0
	b	.L699
	.cfi_endproc
.LFE11209:
	.section	.gcc_except_table._ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"aG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.align	2
.LLSDA11209:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT11209-.LLSDATTD11209
.LLSDATTD11209:
	.byte	0x1
	.uleb128 .LLSDACSE11209-.LLSDACSB11209
.LLSDACSB11209:
	.uleb128 .LEHB29-.LFB11209
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L710-.LFB11209
	.uleb128 0
	.uleb128 .LEHB30-.LFB11209
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L711-.LFB11209
	.uleb128 0
	.uleb128 .LEHB31-.LFB11209
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L712-.LFB11209
	.uleb128 0
	.uleb128 .LEHB32-.LFB11209
	.uleb128 .LEHE32-.LEHB32
	.uleb128 .L709-.LFB11209
	.uleb128 0
	.uleb128 .LEHB33-.LFB11209
	.uleb128 .LEHE33-.LEHB33
	.uleb128 .L713-.LFB11209
	.uleb128 0x1
	.uleb128 .LEHB34-.LFB11209
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L709-.LFB11209
	.uleb128 0
	.uleb128 .LEHB35-.LFB11209
	.uleb128 .LEHE35-.LEHB35
	.uleb128 .L712-.LFB11209
	.uleb128 0
	.uleb128 .LEHB36-.LFB11209
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L709-.LFB11209
	.uleb128 0
	.uleb128 .LEHB37-.LFB11209
	.uleb128 .LEHE37-.LEHB37
	.uleb128 0
	.uleb128 0
.LLSDACSE11209:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT11209:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.rodata._Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_.str1.8,"aMS",@progbits,1
	.align	3
.LC13:
	.string	"load data "
	.align	3
.LC14:
	.string	"\n"
	.align	3
.LC15:
	.string	"dimension: "
	.align	3
.LC16:
	.string	"  number:"
	.align	3
.LC17:
	.string	"  size_per_element:"
	.section	.text._Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"axG",@progbits,_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.align	2
	.p2align 4,,11
	.weak	_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
	.type	_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_, %function
_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_:
.LFB11234:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11234
	sub	sp, sp, #624
	.cfi_def_cfa_offset 624
	stp	x29, x30, [sp]
	.cfi_offset 29, -624
	.cfi_offset 30, -616
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -608
	.cfi_offset 20, -600
	mov	x20, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -592
	.cfi_offset 22, -584
	mov	x21, x2
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -576
	.cfi_offset 24, -568
	mov	x24, x0
	add	x0, sp, 360
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -560
	.cfi_offset 26, -552
	adrp	x25, _ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	add	x25, x25, :lo12:_ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -544
	.cfi_offset 28, -536
	bl	_ZNSt8ios_baseC2Ev
	adrp	x0, _ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	add	x0, x0, :lo12:_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	strh	wzr, [sp, 584]
	movi	v0.4s, 0
	str	x25, [sp, 360]
	mov	x1, 0
	ldp	x23, x28, [x0, 8]
	add	x0, sp, 96
	stp	q0, q0, [sp, 592]
	str	x23, [sp, 96]
	ldr	x2, [x23, -24]
	str	xzr, [sp, 576]
	str	x28, [x0, x2]
	add	x2, sp, 96
	str	xzr, [sp, 104]
	ldr	x0, [x23, -24]
	add	x0, x2, x0
.LEHB38:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE38:
	adrp	x27, _ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+24
	adrp	x26, _ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+64
	add	x27, x27, :lo12:_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+24
	add	x26, x26, :lo12:_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+64
	add	x0, sp, 112
	str	x27, [sp, 96]
	str	x26, [sp, 360]
.LEHB39:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE39:
	add	x0, sp, 96
	add	x1, sp, 112
	add	x0, x0, 264
.LEHB40:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE40:
	ldr	x1, [x24]
	add	x0, sp, 112
	mov	w2, 12
.LEHB41:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	mov	x2, x0
	ldr	x0, [sp, 96]
	ldr	x1, [x0, -24]
	add	x0, sp, 96
	add	x0, x0, x1
	cbz	x2, .L752
	mov	w1, 0
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.L731:
	mov	x1, x20
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSi4readEPcl
	mov	x1, x21
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSi4readEPcl
	ldr	x0, [x20]
	mov	x1, 2305843009213693950
	ldr	x2, [x21]
	mul	x0, x0, x2
	cmp	x0, x1
	bhi	.L732
	lsl	x0, x0, 2
	bl	_Znam
	ldr	x1, [x20]
	mov	x22, x0
	mov	x19, 0
	cbz	x1, .L736
	.p2align 3,,7
.L734:
	ldr	x2, [x21]
	add	x0, sp, 96
	lsl	x2, x2, 2
	madd	x1, x2, x19, x22
	bl	_ZNSi4readEPcl
	ldr	x0, [x20]
	add	x19, x19, 1
	cmp	x0, x19
	bhi	.L734
.L736:
	add	x0, sp, 112
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
	cbz	x0, .L753
.L737:
	adrp	x19, _ZSt4cerr
	add	x19, x19, :lo12:_ZSt4cerr
	adrp	x1, .LC13
	mov	x0, x19
	add	x1, x1, :lo12:.LC13
	mov	x2, 10
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldp	x1, x2, [x24]
	mov	x0, x19
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x24, .LC14
	add	x24, x24, :lo12:.LC14
	mov	x1, x24
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x1, .LC15
	mov	x0, x19
	add	x1, x1, :lo12:.LC15
	mov	x2, 11
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [x21]
	mov	x0, x19
	bl	_ZNSo9_M_insertImEERSoT_
	adrp	x1, .LC16
	mov	x19, x0
	add	x1, x1, :lo12:.LC16
	mov	x2, 9
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [x20]
	mov	x0, x19
	bl	_ZNSo9_M_insertImEERSoT_
	adrp	x1, .LC17
	mov	x19, x0
	add	x1, x1, :lo12:.LC17
	mov	x2, 19
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x19
	mov	x1, 4
	bl	_ZNSo9_M_insertImEERSoT_
	mov	x1, x24
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.LEHE41:
	adrp	x1, _ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x0, sp, 112
	str	x27, [sp, 96]
	str	x1, [sp, 112]
	str	x26, [sp, 360]
.LEHB42:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE42:
.L739:
	add	x0, sp, 224
	bl	_ZNSt12__basic_fileIcED1Ev
	adrp	x1, _ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x0, sp, 168
	str	x1, [sp, 112]
	bl	_ZNSt6localeD1Ev
	ldr	x1, [x23, -24]
	add	x2, sp, 96
	str	x23, [sp, 96]
	add	x0, sp, 360
	str	x28, [x2, x1]
	str	xzr, [sp, 104]
	str	x25, [sp, 360]
	bl	_ZNSt8ios_baseD2Ev
	mov	x0, x22
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	add	sp, sp, 624
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L752:
	.cfi_restore_state
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB43:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	b	.L731
	.p2align 2,,3
.L753:
	ldr	x0, [sp, 96]
	add	x1, sp, 96
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE43:
	b	.L737
.L746:
	bl	__cxa_begin_catch
	bl	__cxa_end_catch
	b	.L739
.L745:
	mov	x19, x0
	add	x0, sp, 112
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L728:
	ldr	x0, [x23, -24]
	add	x1, sp, 96
	str	x23, [sp, 96]
	str	x28, [x1, x0]
	str	xzr, [sp, 104]
.L729:
	add	x0, sp, 360
	str	x25, [sp, 360]
	bl	_ZNSt8ios_baseD2Ev
	mov	x0, x19
.LEHB44:
	bl	_Unwind_Resume
.LEHE44:
.L744:
	mov	x19, x0
	b	.L728
.L732:
.LEHB45:
	bl	__cxa_throw_bad_array_new_length
.LEHE45:
.L743:
	mov	x19, x0
	b	.L729
.L742:
	mov	x19, x0
	add	x0, sp, 96
	bl	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	mov	x0, x19
.LEHB46:
	bl	_Unwind_Resume
.LEHE46:
	.cfi_endproc
.LFE11234:
	.section	.gcc_except_table._Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"aG",@progbits,_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.align	2
.LLSDA11234:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT11234-.LLSDATTD11234
.LLSDATTD11234:
	.byte	0x1
	.uleb128 .LLSDACSE11234-.LLSDACSB11234
.LLSDACSB11234:
	.uleb128 .LEHB38-.LFB11234
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L743-.LFB11234
	.uleb128 0
	.uleb128 .LEHB39-.LFB11234
	.uleb128 .LEHE39-.LEHB39
	.uleb128 .L744-.LFB11234
	.uleb128 0
	.uleb128 .LEHB40-.LFB11234
	.uleb128 .LEHE40-.LEHB40
	.uleb128 .L745-.LFB11234
	.uleb128 0
	.uleb128 .LEHB41-.LFB11234
	.uleb128 .LEHE41-.LEHB41
	.uleb128 .L742-.LFB11234
	.uleb128 0
	.uleb128 .LEHB42-.LFB11234
	.uleb128 .LEHE42-.LEHB42
	.uleb128 .L746-.LFB11234
	.uleb128 0x1
	.uleb128 .LEHB43-.LFB11234
	.uleb128 .LEHE43-.LEHB43
	.uleb128 .L742-.LFB11234
	.uleb128 0
	.uleb128 .LEHB44-.LFB11234
	.uleb128 .LEHE44-.LEHB44
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB45-.LFB11234
	.uleb128 .LEHE45-.LEHB45
	.uleb128 .L742-.LFB11234
	.uleb128 0
	.uleb128 .LEHB46-.LFB11234
	.uleb128 .LEHE46-.LEHB46
	.uleb128 0
	.uleb128 0
.LLSDACSE11234:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT11234:
	.section	.text._Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"axG",@progbits,_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.size	_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_, .-_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
	.section	.text._Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"axG",@progbits,_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.align	2
	.p2align 4,,11
	.weak	_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
	.type	_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_, %function
_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_:
.LFB11235:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11235
	sub	sp, sp, #624
	.cfi_def_cfa_offset 624
	stp	x29, x30, [sp]
	.cfi_offset 29, -624
	.cfi_offset 30, -616
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -608
	.cfi_offset 20, -600
	mov	x20, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -592
	.cfi_offset 22, -584
	mov	x21, x2
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -576
	.cfi_offset 24, -568
	mov	x24, x0
	add	x0, sp, 360
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -560
	.cfi_offset 26, -552
	adrp	x25, _ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	add	x25, x25, :lo12:_ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -544
	.cfi_offset 28, -536
	bl	_ZNSt8ios_baseC2Ev
	adrp	x0, _ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	add	x0, x0, :lo12:_ZTTSt14basic_ifstreamIcSt11char_traitsIcEE
	strh	wzr, [sp, 584]
	movi	v0.4s, 0
	str	x25, [sp, 360]
	mov	x1, 0
	ldp	x23, x28, [x0, 8]
	add	x0, sp, 96
	stp	q0, q0, [sp, 592]
	str	x23, [sp, 96]
	ldr	x2, [x23, -24]
	str	xzr, [sp, 576]
	str	x28, [x0, x2]
	add	x2, sp, 96
	str	xzr, [sp, 104]
	ldr	x0, [x23, -24]
	add	x0, x2, x0
.LEHB47:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE47:
	adrp	x27, _ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+24
	adrp	x26, _ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+64
	add	x27, x27, :lo12:_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+24
	add	x26, x26, :lo12:_ZTVSt14basic_ifstreamIcSt11char_traitsIcEE+64
	add	x0, sp, 112
	str	x27, [sp, 96]
	str	x26, [sp, 360]
.LEHB48:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE48:
	add	x0, sp, 96
	add	x1, sp, 112
	add	x0, x0, 264
.LEHB49:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE49:
	ldr	x1, [x24]
	add	x0, sp, 112
	mov	w2, 12
.LEHB50:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	mov	x2, x0
	ldr	x0, [sp, 96]
	ldr	x1, [x0, -24]
	add	x0, sp, 96
	add	x0, x0, x1
	cbz	x2, .L781
	mov	w1, 0
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.L760:
	mov	x1, x20
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSi4readEPcl
	mov	x1, x21
	add	x0, sp, 96
	mov	x2, 4
	bl	_ZNSi4readEPcl
	ldr	x0, [x20]
	mov	x1, 2305843009213693950
	ldr	x2, [x21]
	mul	x0, x0, x2
	cmp	x0, x1
	bhi	.L761
	lsl	x0, x0, 2
	bl	_Znam
	ldr	x1, [x20]
	mov	x22, x0
	mov	x19, 0
	cbz	x1, .L765
	.p2align 3,,7
.L763:
	ldr	x2, [x21]
	add	x0, sp, 96
	lsl	x2, x2, 2
	madd	x1, x2, x19, x22
	bl	_ZNSi4readEPcl
	ldr	x0, [x20]
	add	x19, x19, 1
	cmp	x0, x19
	bhi	.L763
.L765:
	add	x0, sp, 112
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
	cbz	x0, .L782
.L766:
	adrp	x19, _ZSt4cerr
	add	x19, x19, :lo12:_ZSt4cerr
	adrp	x1, .LC13
	mov	x0, x19
	add	x1, x1, :lo12:.LC13
	mov	x2, 10
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldp	x1, x2, [x24]
	mov	x0, x19
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x24, .LC14
	add	x24, x24, :lo12:.LC14
	mov	x1, x24
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x1, .LC15
	mov	x0, x19
	add	x1, x1, :lo12:.LC15
	mov	x2, 11
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [x21]
	mov	x0, x19
	bl	_ZNSo9_M_insertImEERSoT_
	adrp	x1, .LC16
	mov	x19, x0
	add	x1, x1, :lo12:.LC16
	mov	x2, 9
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [x20]
	mov	x0, x19
	bl	_ZNSo9_M_insertImEERSoT_
	adrp	x1, .LC17
	mov	x19, x0
	add	x1, x1, :lo12:.LC17
	mov	x2, 19
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x19
	mov	x1, 4
	bl	_ZNSo9_M_insertImEERSoT_
	mov	x1, x24
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.LEHE50:
	adrp	x1, _ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x0, sp, 112
	str	x27, [sp, 96]
	str	x1, [sp, 112]
	str	x26, [sp, 360]
.LEHB51:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE51:
.L768:
	add	x0, sp, 224
	bl	_ZNSt12__basic_fileIcED1Ev
	adrp	x1, _ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x0, sp, 168
	str	x1, [sp, 112]
	bl	_ZNSt6localeD1Ev
	ldr	x1, [x23, -24]
	add	x2, sp, 96
	str	x23, [sp, 96]
	add	x0, sp, 360
	str	x28, [x2, x1]
	str	xzr, [sp, 104]
	str	x25, [sp, 360]
	bl	_ZNSt8ios_baseD2Ev
	mov	x0, x22
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	add	sp, sp, 624
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L781:
	.cfi_restore_state
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB52:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	b	.L760
	.p2align 2,,3
.L782:
	ldr	x0, [sp, 96]
	add	x1, sp, 96
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE52:
	b	.L766
.L775:
	bl	__cxa_begin_catch
	bl	__cxa_end_catch
	b	.L768
.L774:
	mov	x19, x0
	add	x0, sp, 112
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L757:
	ldr	x0, [x23, -24]
	add	x1, sp, 96
	str	x23, [sp, 96]
	str	x28, [x1, x0]
	str	xzr, [sp, 104]
.L758:
	add	x0, sp, 360
	str	x25, [sp, 360]
	bl	_ZNSt8ios_baseD2Ev
	mov	x0, x19
.LEHB53:
	bl	_Unwind_Resume
.LEHE53:
.L773:
	mov	x19, x0
	b	.L757
.L761:
.LEHB54:
	bl	__cxa_throw_bad_array_new_length
.LEHE54:
.L772:
	mov	x19, x0
	b	.L758
.L771:
	mov	x19, x0
	add	x0, sp, 96
	bl	_ZNSt14basic_ifstreamIcSt11char_traitsIcEED1Ev
	mov	x0, x19
.LEHB55:
	bl	_Unwind_Resume
.LEHE55:
	.cfi_endproc
.LFE11235:
	.section	.gcc_except_table._Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"aG",@progbits,_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.align	2
.LLSDA11235:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT11235-.LLSDATTD11235
.LLSDATTD11235:
	.byte	0x1
	.uleb128 .LLSDACSE11235-.LLSDACSB11235
.LLSDACSB11235:
	.uleb128 .LEHB47-.LFB11235
	.uleb128 .LEHE47-.LEHB47
	.uleb128 .L772-.LFB11235
	.uleb128 0
	.uleb128 .LEHB48-.LFB11235
	.uleb128 .LEHE48-.LEHB48
	.uleb128 .L773-.LFB11235
	.uleb128 0
	.uleb128 .LEHB49-.LFB11235
	.uleb128 .LEHE49-.LEHB49
	.uleb128 .L774-.LFB11235
	.uleb128 0
	.uleb128 .LEHB50-.LFB11235
	.uleb128 .LEHE50-.LEHB50
	.uleb128 .L771-.LFB11235
	.uleb128 0
	.uleb128 .LEHB51-.LFB11235
	.uleb128 .LEHE51-.LEHB51
	.uleb128 .L775-.LFB11235
	.uleb128 0x1
	.uleb128 .LEHB52-.LFB11235
	.uleb128 .LEHE52-.LEHB52
	.uleb128 .L771-.LFB11235
	.uleb128 0
	.uleb128 .LEHB53-.LFB11235
	.uleb128 .LEHE53-.LEHB53
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB54-.LFB11235
	.uleb128 .LEHE54-.LEHB54
	.uleb128 .L771-.LFB11235
	.uleb128 0
	.uleb128 .LEHB55-.LFB11235
	.uleb128 .LEHE55-.LEHB55
	.uleb128 0
	.uleb128 0
.LLSDACSE11235:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT11235:
	.section	.text._Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,"axG",@progbits,_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_,comdat
	.size	_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_, .-_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
	.section	.text._ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb,"axG",@progbits,_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb
	.type	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb, %function
_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb:
.LFB12304:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x22, x1
	ldr	x1, [x0, 40]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	and	w24, w2, 255
	ldr	x3, [x0, 72]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x20, x0
	sub	x23, x3, x1
	ldr	x0, [x0, 8]
	asr	x19, x23, 3
	add	x19, x19, 1
	add	x19, x19, x22
	cmp	x0, x19, lsl 1
	bls	.L784
	sub	x0, x0, x19
	cmp	w24, 0
	ldr	x19, [x20]
	lsr	x0, x0, 1
	add	x3, x3, 8
	lsl	x0, x0, 3
	sub	x2, x3, x1
	add	x22, x0, x22, lsl 3
	csel	x0, x22, x0, ne
	add	x19, x19, x0
	cmp	x1, x19
	bls	.L786
	cmp	x1, x3
	beq	.L787
	mov	x0, x19
	bl	memmove
	b	.L787
	.p2align 2,,3
.L784:
	cmp	x0, x22
	add	x2, x0, 2
	csel	x0, x0, x22, cs
	mov	x1, 1152921504606846975
	add	x21, x0, x2
	cmp	x21, x1
	bhi	.L796
	sub	x19, x21, x19
	lsl	x0, x21, 3
	bl	_Znwm
	lsr	x19, x19, 1
	cmp	w24, 0
	ldr	x3, [x20, 72]
	lsl	x19, x19, 3
	ldr	x1, [x20, 40]
	add	x22, x19, x22, lsl 3
	csel	x19, x22, x19, ne
	add	x3, x3, 8
	mov	x24, x0
	add	x19, x0, x19
	cmp	x1, x3
	beq	.L790
	sub	x2, x3, x1
	mov	x0, x19
	bl	memmove
.L790:
	ldp	x0, x1, [x20]
	lsl	x1, x1, 3
	bl	_ZdlPvm
	stp	x24, x21, [x20]
.L787:
	add	x2, x19, x23
	ldr	x0, [x19]
	ldp	x21, x22, [sp, 32]
	str	x0, [x20, 24]
	add	x0, x0, 512
	str	x0, [x20, 32]
	str	x19, [x20, 40]
	ldr	x0, [x19, x23]
	ldp	x23, x24, [sp, 48]
	str	x0, [x20, 56]
	add	x0, x0, 512
	str	x0, [x20, 64]
	str	x2, [x20, 72]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L786:
	.cfi_restore_state
	cmp	x1, x3
	beq	.L787
	add	x0, x23, 8
	sub	x0, x0, x2
	add	x0, x19, x0
	bl	memmove
	b	.L787
.L796:
	bl	_ZSt17__throw_bad_allocv
	.cfi_endproc
.LFE12304:
	.size	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb, .-_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb
	.section	.rodata._ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_.str1.8,"aMS",@progbits,1
	.align	3
.LC18:
	.string	"cannot create std::deque larger than max_size()"
	.section	.text._ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_,"axG",@progbits,_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_
	.type	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_, %function
_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_:
.LFB11418:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x4, 1152921504606846975
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	add	x21, x0, 16
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, x1
	ldp	x3, x22, [x21, 16]
	ldp	x1, x6, [x0, 48]
	ldr	x2, [x0, 72]
	ldr	x5, [x0, 16]
	sub	x2, x2, x22
	sub	x1, x1, x6
	asr	x2, x2, 3
	sub	x3, x3, x5
	sub	x2, x2, #1
	asr	x1, x1, 3
	add	x2, x1, x2, lsl 6
	add	x2, x2, x3, asr 3
	cmp	x2, x4
	beq	.L801
	ldr	x1, [x0]
	mov	x19, x0
	cmp	x22, x1
	beq	.L802
.L799:
	mov	x0, 512
	bl	_Znwm
	ldr	x1, [x19, 40]
	ldr	x2, [x20]
	str	x0, [x22, -8]
	sub	x3, x1, #8
	ldr	x0, [x1, -8]
	str	x3, [x21, 24]
	add	x1, x0, 512
	stp	x0, x1, [x21, 8]
	add	x1, x0, 504
	ldp	x21, x22, [sp, 32]
	str	x1, [x19, 16]
	ldp	x19, x20, [sp, 16]
	str	x2, [x0, 504]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L802:
	.cfi_restore_state
	mov	w2, 1
	mov	x1, 1
	bl	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb
	ldr	x22, [x19, 40]
	b	.L799
.L801:
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE11418:
	.size	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_, .-_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi
	.type	_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi, %function
_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi:
.LFB12076:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12076
	stp	x29, x30, [sp, -288]!
	.cfi_def_cfa_offset 288
	.cfi_offset 29, -288
	.cfi_offset 30, -280
	adrp	x4, .LC12
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -272
	.cfi_offset 20, -264
	mov	w20, w1
	ldr	x19, [x0, 112]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -256
	.cfi_offset 22, -248
	mov	x21, x0
	ldr	x4, [x4, #:lo12:.LC12]
	add	x0, x19, 80
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -240
	.cfi_offset 24, -232
	.cfi_offset 25, -224
	.cfi_offset 26, -216
	mov	x26, x8
	stp	x27, x28, [sp, 80]
	stp	x2, x4, [sp, 168]
	str	w3, [sp, 188]
	str	x0, [sp, 272]
	strb	wzr, [sp, 280]
	stp	d8, d9, [sp, 96]
	str	d10, [sp, 112]
	.cfi_offset 27, -208
	.cfi_offset 28, -200
	.cfi_offset 72, -192
	.cfi_offset 73, -184
	.cfi_offset 74, -176
	cbz	x4, .L804
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L1033
.L804:
	mov	w0, 1
	add	x22, x19, 16
	ldp	x1, x3, [x19, 48]
	ldr	x2, [x19, 16]
	ldr	x4, [x22, 24]
	strb	w0, [sp, 280]
	ldr	x0, [x19, 72]
	sub	x1, x1, x3
	sub	x0, x0, x4
	asr	x1, x1, 3
	ldr	x4, [x22, 16]
	asr	x0, x0, 3
	sub	x0, x0, #1
	sub	x3, x4, x2
	add	x0, x1, x0, lsl 6
	add	x0, x0, x3, asr 3
	cbz	x0, .L805
	ldr	x0, [x2]
	sub	x4, x4, #8
	str	x0, [sp, 232]
	cmp	x2, x4
	beq	.L806
	add	x2, x2, 8
	str	x2, [x19, 16]
.L807:
	ldr	x0, [sp, 272]
	cbz	x0, .L809
	ldr	x1, [sp, 176]
	cbz	x1, .L809
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L809:
	ldr	x1, [sp, 232]
	ldrh	w0, [x1]
	add	w0, w0, 1
	and	w0, w0, 65535
	strh	w0, [x1]
	str	w0, [sp, 184]
	cbz	w0, .L1034
.L811:
	ldr	x2, [x21, 24]
	uxtw	x22, w20
	ldr	x3, [x21, 256]
	mul	x2, x22, x2
	ldr	x4, [sp, 232]
	add	x0, x3, x2
	ldr	x1, [x21, 240]
	ldr	x4, [x4, 8]
	add	x0, x0, x1
	stp	xzr, xzr, [x26]
	str	xzr, [x26, 16]
	str	x4, [sp, 160]
	ldrb	w0, [x0, 2]
	tbnz	x0, 0, .L1035
	ldr	x1, [x21, 232]
	ldr	x0, [sp, 168]
	add	x1, x2, x1
	ldr	x4, [x21, 304]
	add	x1, x3, x1
	ldr	x2, [x21, 312]
.LEHB56:
	blr	x4
	ldp	x19, x24, [x26]
	fmov	s10, s0
	ldr	x1, [x26, 16]
	cmp	x24, x1
	beq	.L817
	add	x1, x24, 8
	fmov	s1, s0
	sub	x25, x1, x19
	mov	w4, w20
	sub	x28, x25, #8
	str	s0, [x24]
	asr	x25, x25, 3
	add	x28, x19, x28
	sub	x0, x25, #2
	sub	x25, x25, #1
	str	w20, [x24, 4]
	add	x0, x0, x0, lsr 63
	str	x1, [x26, 8]
	asr	x24, x0, 1
.L818:
	cmp	x25, 0
	ble	.L827
	.p2align 3,,7
.L829:
	lsl	x0, x24, 3
	lsl	x25, x25, 3
	add	x1, x19, x0
	add	x28, x19, x25
	ldr	s0, [x19, x0]
	fcmpe	s1, s0
	bgt	.L943
.L827:
	fneg	s8, s10
	str	w4, [x28, 4]
	mov	x0, 8
	str	s1, [x28]
	bl	_Znwm
.LEHE56:
	mov	x19, x0
	add	x0, x0, 8
	str	w20, [x19, 4]
	str	s8, [x19]
.L830:
	ldr	x1, [sp, 160]
	ldrh	w2, [sp, 184]
	strh	w2, [x1, x22, lsl 1]
	cmp	x0, x19
	beq	.L921
	ldr	w1, [sp, 188]
	str	x0, [sp, 128]
	sub	w1, w1, #1
	sxtw	x1, w1
	str	x1, [sp, 224]
	.p2align 3,,7
.L899:
	fneg	s0, s8
	fcmpe	s0, s10
	bgt	.L944
	sub	x1, x0, x19
	sub	x24, x0, #8
	cmp	x1, 8
	ble	.L834
.L1038:
	sub	x2, x24, x19
	ldr	w6, [x0, -4]
	str	w20, [x0, -4]
	asr	x8, x2, 3
	ldr	s2, [x0, -8]
	sub	x1, x8, #1
	str	s8, [x0, -8]
	and	x9, x8, 1
	add	x7, x1, x1, lsr 63
	asr	x7, x7, 1
	cmp	x2, 16
	ble	.L835
	mov	x1, 0
	b	.L839
	.p2align 2,,3
.L1036:
	mov	x1, x0
.L839:
	add	x2, x1, 1
	lsl	x0, x2, 1
	lsl	x2, x2, 4
	sub	x5, x0, #1
	add	x4, x19, x2
	lsl	x3, x5, 3
	ldr	s0, [x19, x2]
	add	x2, x19, x3
	ldr	s1, [x19, x3]
	fcmpe	s1, s0
	bgt	.L945
.L836:
	lsl	x1, x1, 3
	ldr	w3, [x4, 4]
	add	x2, x19, x1
	str	s0, [x19, x1]
	str	w3, [x2, 4]
	cmp	x7, x0
	bgt	.L1036
	lsl	x2, x0, 3
	cbnz	x9, .L842
	sub	x8, x8, #2
	add	x8, x8, x8, lsr 63
	cmp	x0, x8, asr 1
	beq	.L841
	sub	x1, x0, #1
	lsl	x2, x0, 3
	asr	x0, x1, 1
	.p2align 3,,7
.L845:
	lsl	x1, x0, 3
	add	x3, x19, x2
	add	x4, x19, x1
	ldr	s0, [x19, x1]
	fcmpe	s0, s2
	bmi	.L946
.L840:
	str	s2, [x3]
	str	w6, [x3, 4]
	b	.L834
	.p2align 2,,3
.L943:
	sub	x0, x24, #1
	ldr	w2, [x1, 4]
	str	s0, [x19, x25]
	mov	x25, x24
	add	x0, x0, x0, lsr 63
	str	w2, [x28, 4]
	asr	x24, x0, 1
	cmp	x25, 0
	bgt	.L829
	mov	x28, x1
	b	.L827
	.p2align 2,,3
.L944:
	ldp	x3, x1, [x26]
	ldr	x2, [x21, 72]
	sub	x1, x1, x3
	cmp	x2, x1, asr 3
	beq	.L1037
	sub	x1, x0, x19
	sub	x24, x0, #8
	cmp	x1, 8
	bgt	.L1038
.L834:
	ldr	x0, [x21, 192]
	mov	w1, 48
	strb	wzr, [sp, 280]
	uxtw	x22, w20
	umaddl	x0, w20, w1, x0
	str	x0, [sp, 272]
	cbz	x0, .L1039
	ldr	x1, [sp, 176]
	cbz	x1, .L847
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L1040
.L847:
	mov	w0, 1
	strb	w0, [sp, 280]
	ldr	w0, [sp, 188]
	cbnz	w0, .L848
	ldr	x0, [x21, 24]
	mov	x25, 0
	ldr	x2, [x21, 240]
	ldr	x1, [x21, 256]
	madd	x0, x22, x0, x2
	add	x0, x1, x0
	str	x0, [sp, 136]
	ldrh	w0, [x0]
	str	x0, [sp, 144]
	cbnz	x0, .L850
	b	.L1041
	.p2align 2,,3
.L1042:
	fcmpe	s0, s10
	bmi	.L854
.L853:
	ldr	x0, [sp, 144]
	cmp	x0, x25
	beq	.L852
.L850:
	ldr	x0, [sp, 128]
	add	x25, x25, 1
	ldr	x2, [sp, 160]
	sub	x27, x0, x19
	ldr	x0, [sp, 136]
	str	x27, [sp, 152]
	ldr	w3, [sp, 184]
	ldr	w23, [x0, x25, lsl 2]
	uxtw	x28, w23
	ubfiz	x0, x23, 1, 32
	ldrh	w1, [x2, x0]
	cmp	w1, w3
	beq	.L853
	ldr	x1, [x21, 24]
	ldr	x4, [x21, 232]
	strh	w3, [x2, x0]
	ldp	x3, x2, [x21, 304]
	madd	x1, x28, x1, x4
	ldr	x0, [sp, 168]
	ldr	x4, [x21, 256]
	add	x1, x4, x1
.LEHB57:
	blr	x3
	ldp	x20, x22, [x26]
	fmov	s9, s0
	ldr	x0, [x21, 72]
	sub	x1, x22, x20
	cmp	x0, x1, asr 3
	bls	.L1042
.L854:
	ldr	x0, [sp, 128]
	fneg	s8, s9
	cmp	x24, x0
	beq	.L856
	add	x24, x24, 8
	str	s8, [x24, -8]
	str	w23, [x24, -4]
	sub	x3, x24, x19
	sub	x5, x3, #8
	mov	w6, w23
	asr	x3, x3, 3
	add	x5, x19, x5
	sub	x2, x3, #2
	sub	x3, x3, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
.L857:
	cmp	x3, 0
	ble	.L866
	.p2align 3,,7
.L868:
	lsl	x0, x2, 3
	lsl	x3, x3, 3
	add	x1, x19, x0
	add	x5, x19, x3
	ldr	s1, [x19, x0]
	fcmpe	s1, s8
	bmi	.L947
.L866:
	ldr	x0, [x21, 24]
	str	w6, [x5, 4]
	ldr	x2, [x21, 256]
	str	s8, [x5]
	ldr	x1, [x21, 240]
	madd	x0, x28, x0, x2
	add	x0, x0, x1
	ldrb	w0, [x0, 2]
	tbz	x0, 0, .L869
	sub	x3, x22, x20
	asr	x28, x3, 3
.L870:
	ldr	x0, [x21, 72]
	cmp	x0, x28
	bcc	.L1043
.L884:
	cmp	x20, x22
	beq	.L853
	ldr	x0, [sp, 144]
	ldr	s10, [x20]
	cmp	x0, x25
	bne	.L850
.L852:
	ldrb	w0, [sp, 280]
	cbnz	w0, .L851
.L897:
	cmp	x24, x19
	beq	.L831
.L1047:
	ldr	w20, [x19, 4]
	mov	x0, x24
	ldr	s8, [x19]
	b	.L899
	.p2align 2,,3
.L947:
	sub	x0, x2, #1
	ldr	w4, [x1, 4]
	str	s1, [x19, x3]
	mov	x3, x2
	add	x0, x0, x0, lsr 63
	str	w4, [x5, 4]
	asr	x2, x0, 1
	cmp	x3, 0
	bgt	.L868
	mov	x5, x1
	b	.L866
	.p2align 2,,3
.L1043:
	sub	x6, x22, #8
	cmp	x3, 8
	bgt	.L1044
.L885:
	mov	x22, x6
	str	x6, [x26, 8]
	b	.L884
	.p2align 2,,3
.L869:
	ldr	x0, [x26, 16]
	cmp	x0, x22
	beq	.L871
	add	x22, x22, 8
	str	s9, [x22, -8]
	str	w23, [x22, -4]
	sub	x3, x22, x20
	sub	x5, x3, #8
	str	x22, [x26, 8]
	asr	x28, x3, 3
	add	x5, x20, x5
	sub	x27, x28, #2
	sub	x4, x28, #1
	add	x27, x27, x27, lsr 63
	asr	x27, x27, 1
.L872:
	cmp	x4, 0
	ble	.L881
	mov	x0, x4
	.p2align 3,,7
.L883:
	lsl	x1, x27, 3
	lsl	x0, x0, 3
	add	x2, x20, x1
	add	x5, x20, x0
	ldr	s0, [x20, x1]
	fcmpe	s0, s9
	bmi	.L948
.L881:
	str	s9, [x5]
	str	w23, [x5, 4]
	b	.L870
	.p2align 2,,3
.L948:
	sub	x1, x27, #1
	ldr	w4, [x2, 4]
	str	s0, [x20, x0]
	mov	x0, x27
	add	x1, x1, x1, lsr 63
	str	w4, [x5, 4]
	asr	x27, x1, 1
	cmp	x0, 0
	bgt	.L883
	mov	x5, x2
	str	s9, [x5]
	str	w23, [x5, 4]
	b	.L870
	.p2align 2,,3
.L856:
	asr	x0, x27, 3
	mov	x1, 1152921504606846975
	cmp	x0, x1
	beq	.L1045
	cmp	x0, 0
	csinc	x1, x0, xzr, ne
	adds	x0, x0, x1
	bcs	.L860
	cbnz	x0, .L1046
	mov	x22, 0
	add	x0, x22, x27
	str	xzr, [sp, 128]
	mov	x1, 8
	str	s8, [x22, x27]
	mov	x6, 0
	str	w23, [x0, 4]
	cmp	x24, x19
	beq	.L928
.L1054:
	mov	x2, x22
	mov	x1, x19
	.p2align 3,,7
.L864:
	ldr	x0, [x1], 8
	str	x0, [x2], 8
	cmp	x1, x24
	bne	.L864
	sub	x4, x24, x19
	add	x4, x22, x4
	add	x24, x4, 8
	sub	x3, x24, x22
	sub	x5, x3, #8
	asr	x3, x3, 3
	add	x5, x22, x5
	sub	x2, x3, #2
	sub	x3, x3, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cbz	x19, .L865
.L863:
	mov	x1, x27
	mov	x0, x19
	str	x3, [sp, 152]
	stp	x4, x6, [sp, 192]
	stp	x2, x5, [sp, 208]
	bl	_ZdlPvm
	ldp	x4, x6, [sp, 192]
	ldp	x2, x5, [sp, 208]
	ldr	x3, [sp, 152]
.L865:
	mov	x19, x22
	str	x6, [sp, 152]
	ldr	w6, [x4, 4]
	ldp	x20, x22, [x26]
	ldr	s8, [x4]
	b	.L857
	.p2align 2,,3
.L848:
	ldr	x0, [x21, 264]
	mov	x25, 0
	ldr	x1, [x21, 32]
	ldr	x0, [x0, x22, lsl 3]
	ldr	x2, [sp, 224]
	madd	x0, x2, x1, x0
	str	x0, [sp, 136]
	ldrh	w0, [x0]
	str	x0, [sp, 144]
	cbnz	x0, .L850
.L1041:
	ldr	x0, [sp, 128]
	sub	x0, x0, x19
	str	x0, [sp, 152]
.L851:
	ldr	x0, [sp, 272]
	cbz	x0, .L897
	ldr	x1, [sp, 176]
	cbz	x1, .L897
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	cmp	x24, x19
	bne	.L1047
.L831:
	ldr	x20, [x21, 112]
	strb	wzr, [sp, 280]
	ldr	x1, [sp, 176]
	ldr	x0, [sp, 232]
	str	x0, [sp, 264]
	add	x0, x20, 80
	str	x0, [sp, 272]
	cbz	x1, .L900
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L1048
.L900:
	ldp	x0, x1, [x20, 16]
	mov	w2, 1
	strb	w2, [sp, 280]
	cmp	x0, x1
	beq	.L901
	ldr	x1, [sp, 264]
	str	x1, [x0, -8]!
	str	x0, [x20, 16]
.L902:
	ldr	x0, [sp, 272]
	cbz	x0, .L903
	ldr	x1, [sp, 176]
	cbz	x1, .L903
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L903:
	cbz	x19, .L803
	ldr	x1, [sp, 152]
	mov	x0, x19
	bl	_ZdlPvm
.L803:
	mov	x0, x26
	ldr	d10, [sp, 112]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 288
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 74
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1044:
	.cfi_restore_state
	sub	x1, x6, x20
	ldr	s0, [x20]
	ldr	w2, [x20, 4]
	asr	x9, x1, 3
	ldr	w7, [x22, -4]
	sub	x0, x9, #1
	str	w2, [x22, -4]
	ldr	s2, [x22, -8]
	and	x10, x9, 1
	add	x8, x0, x0, lsr 63
	str	s0, [x22, -8]
	asr	x8, x8, 1
	cmp	x1, 16
	ble	.L886
	mov	x2, 0
	b	.L890
	.p2align 2,,3
.L1049:
	mov	x2, x0
.L890:
	add	x1, x2, 1
	lsl	x0, x1, 1
	lsl	x1, x1, 4
	sub	x5, x0, #1
	add	x4, x20, x1
	lsl	x3, x5, 3
	ldr	s0, [x20, x1]
	add	x1, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L949
.L887:
	lsl	x1, x2, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x8, x0
	bgt	.L1049
	lsl	x2, x0, 3
	cbnz	x10, .L893
	sub	x9, x9, #2
	add	x9, x9, x9, lsr 63
	cmp	x0, x9, asr 1
	beq	.L892
	sub	x1, x0, #1
	lsl	x2, x0, 3
	asr	x0, x1, 1
	.p2align 3,,7
.L896:
	lsl	x1, x0, 3
	add	x3, x20, x2
	add	x4, x20, x1
	ldr	s0, [x20, x1]
	fcmpe	s2, s0
	bgt	.L950
.L891:
	str	s2, [x3]
	str	w7, [x3, 4]
	b	.L885
	.p2align 2,,3
.L950:
	sub	x1, x0, #1
	ldr	w5, [x4, 4]
	str	s0, [x20, x2]
	mov	x2, x0
	add	x1, x1, x1, lsr 63
	str	w5, [x3, 4]
	asr	x0, x1, 1
	cbz	x2, .L1050
	lsl	x2, x2, 3
	b	.L896
	.p2align 2,,3
.L949:
	fmov	s0, s1
	mov	x4, x1
	mov	x0, x5
	b	.L887
	.p2align 2,,3
.L946:
	sub	x1, x0, #1
	ldr	w5, [x4, 4]
	str	s0, [x19, x2]
	mov	x2, x0
	add	x1, x1, x1, lsr 63
	str	w5, [x3, 4]
	asr	x0, x1, 1
	cbz	x2, .L1051
	lsl	x2, x2, 3
	b	.L845
	.p2align 2,,3
.L945:
	fmov	s0, s1
	mov	x4, x2
	mov	x0, x5
	b	.L836
.L886:
	mov	x3, x20
	cbnz	x10, .L891
	cmp	x0, 2
	bhi	.L891
	mov	x4, x20
	mov	x0, 0
.L892:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x2, x0, 3
	add	x1, x20, x2
	ldr	s0, [x20, x2]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
.L893:
	sub	x0, x0, #1
	asr	x0, x0, 1
	b	.L896
.L871:
	sub	x28, x22, x20
	mov	x0, 1152921504606846975
	asr	x1, x28, 3
	cmp	x1, x0
	beq	.L1052
	cmp	x1, 0
	csinc	x0, x1, xzr, ne
	adds	x0, x0, x1
	bcs	.L875
	cbnz	x0, .L1053
	mov	x6, 0
	add	x0, x6, x28
	mov	x1, x22
	mov	x2, 8
	str	s9, [x6, x28]
	mov	x8, 0
	str	w23, [x0, 4]
	cmp	x22, x20
	beq	.L932
.L1055:
	mov	x3, x6
	mov	x2, x20
	.p2align 3,,7
.L879:
	ldr	x0, [x2], 8
	str	x0, [x3], 8
	cmp	x2, x22
	bne	.L879
	add	x7, x6, x28
	add	x22, x7, 8
	sub	x3, x22, x6
	sub	x5, x3, #8
	asr	x28, x3, 3
	add	x5, x6, x5
	sub	x2, x28, #2
	sub	x4, x28, #1
	add	x2, x2, x2, lsr 63
	asr	x27, x2, 1
.L878:
	cbz	x20, .L880
	sub	x1, x1, x20
	mov	x0, x20
	stp	x4, x6, [sp, 192]
	stp	x7, x8, [sp, 208]
	stp	x5, x3, [sp, 240]
	bl	_ZdlPvm
	ldp	x4, x6, [sp, 192]
	ldp	x7, x8, [sp, 208]
	ldp	x5, x3, [sp, 240]
.L880:
	mov	x20, x6
	ldr	w23, [x7, 4]
	stp	x6, x22, [x26]
	ldr	s9, [x7]
	str	x8, [x26, 16]
	b	.L872
.L1050:
	mov	x3, x4
	str	s2, [x3]
	str	w7, [x3, 4]
	b	.L885
.L835:
	mov	x3, x19
	cbnz	x9, .L840
	cmp	x1, 2
	bhi	.L840
	mov	x4, x19
	mov	x0, 0
.L841:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x2, x0, 3
	add	x1, x19, x2
	ldr	s0, [x19, x2]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
.L842:
	sub	x0, x0, #1
	asr	x0, x0, 1
	b	.L845
.L1046:
	mov	x1, 1152921504606846975
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x20, x0, 3
.L861:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x0, x0, x20
	str	x0, [sp, 128]
	add	x0, x22, x27
	mov	x6, x20
	add	x1, x22, 8
	str	s8, [x22, x27]
	str	w23, [x0, 4]
	cmp	x24, x19
	bne	.L1054
.L928:
	mov	x24, x1
	mov	x5, x22
	mov	x4, x22
	mov	x2, 0
	mov	x3, 0
	b	.L863
.L1051:
	mov	x3, x4
	str	s2, [x3]
	str	w6, [x3, 4]
	b	.L834
.L1053:
	mov	x1, 1152921504606846975
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x0, x0, 3
	str	x0, [sp, 192]
.L876:
	ldr	x0, [sp, 128]
	sub	x27, x0, x19
	ldr	x0, [sp, 192]
	bl	_Znwm
.LEHE57:
	mov	x6, x0
	add	x2, x0, 8
	ldr	x0, [sp, 192]
	str	s9, [x6, x28]
	add	x8, x6, x0
	add	x0, x6, x28
	ldr	x1, [x26, 16]
	str	w23, [x0, 4]
	cmp	x22, x20
	bne	.L1055
.L932:
	mov	x22, x2
	mov	x5, x6
	mov	x7, x6
	mov	x28, 1
	mov	x27, 0
	mov	x4, 0
	mov	x3, 8
	b	.L878
.L1037:
	ldr	x0, [sp, 128]
	sub	x0, x0, x19
	str	x0, [sp, 152]
	b	.L831
.L1034:
	ldr	x0, [x1, 8]
	mov	x19, x1
	ldr	w2, [x1, 16]
	mov	w1, 0
	lsl	x2, x2, 1
	bl	memset
	ldrh	w0, [x19]
	add	w0, w0, 1
	and	w0, w0, 65535
	strh	w0, [x19]
	str	w0, [sp, 184]
	b	.L811
.L805:
	mov	x0, 24
.LEHB58:
	bl	_Znwm
.LEHE58:
	ldr	w1, [x19, 128]
	mov	x19, x0
	mov	w2, -1
	str	x19, [sp, 232]
	strh	w2, [x19]
	ubfiz	x0, x1, 1, 32
	str	w1, [x19, 16]
.LEHB59:
	bl	_Znam
.LEHE59:
	str	x0, [x19, 8]
.L808:
	ldrb	w0, [sp, 280]
	cbz	w0, .L809
	b	.L807
	.p2align 2,,3
.L901:
	mov	x0, x20
	add	x1, sp, 264
.LEHB60:
	bl	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_
.LEHE60:
	ldrb	w0, [sp, 280]
	cbz	w0, .L903
	b	.L902
	.p2align 2,,3
.L817:
	sub	x23, x24, x19
	mov	x2, 1152921504606846975
	asr	x0, x23, 3
	cmp	x0, x2
	beq	.L1056
	cmp	x0, 0
	csinc	x3, x0, xzr, ne
	adds	x0, x0, x3
	bcs	.L821
	cbnz	x0, .L1057
	mov	x2, 8
	mov	x3, 0
	mov	x27, 0
.L823:
	add	x0, x27, x23
	str	s10, [x27, x23]
	str	w20, [x0, 4]
	cmp	x24, x19
	beq	.L919
	mov	x2, x27
	mov	x0, x19
.L825:
	ldr	x4, [x0], 8
	str	x4, [x2], 8
	cmp	x24, x0
	bne	.L825
	add	x23, x27, x23
	add	x2, x23, 8
	sub	x25, x2, x27
	sub	x28, x25, #8
	asr	x25, x25, 3
	add	x28, x27, x28
	sub	x0, x25, #2
	sub	x25, x25, #1
	add	x0, x0, x0, lsr 63
	asr	x24, x0, 1
.L824:
	cbz	x19, .L826
	sub	x1, x1, x19
	mov	x0, x19
	stp	x2, x3, [sp, 128]
	bl	_ZdlPvm
	ldp	x2, x3, [sp, 128]
.L826:
	mov	x19, x27
	ldr	w4, [x23, 4]
	stp	x27, x2, [x26]
	ldr	s1, [x23]
	str	x3, [x26, 16]
	b	.L818
.L806:
	ldr	x0, [x19, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x19, 40]
	add	x1, x0, 8
	ldr	x0, [x0, 8]
	str	x0, [x22, 8]
	str	x1, [x22, 24]
	add	x1, x0, 512
	str	x1, [x22, 16]
	str	x0, [x19, 16]
	b	.L808
.L1035:
	mov	x0, 8
.LEHB61:
	bl	_Znwm
	mvni	v0.2s, 0x80, lsl 16
	mov	x19, x0
	mov	w1, 2139095039
	add	x0, x0, 8
	fmov	s10, w1
	str	w20, [x19, 4]
	fmov	s8, s0
	str	s0, [x19]
	b	.L830
.L921:
	mov	x0, 8
	str	x19, [sp, 128]
	str	x0, [sp, 152]
	b	.L831
.L1057:
	cmp	x0, x2
	csel	x0, x0, x2, ls
	lsl	x25, x0, 3
.L822:
	mov	x0, x25
	bl	_Znwm
	mov	x27, x0
	add	x3, x0, x25
	add	x2, x0, 8
	ldr	x1, [x26, 16]
	b	.L823
.L821:
	mov	x25, 9223372036854775800
	b	.L822
.L1056:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.LEHE61:
.L1033:
.LEHB62:
	bl	_ZSt20__throw_system_errori
.LEHE62:
	.p2align 2,,3
.L860:
	mov	x20, 9223372036854775800
	b	.L861
.L1045:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB63:
	bl	_ZSt20__throw_length_errorPKc
.L875:
	mov	x0, 9223372036854775800
	str	x0, [sp, 192]
	b	.L876
.L1052:
	ldr	x0, [sp, 128]
	sub	x27, x0, x19
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.LEHE63:
.L1040:
.LEHB64:
	bl	_ZSt20__throw_system_errori
.L1039:
	mov	w0, 1
	bl	_ZSt20__throw_system_errori
.L1048:
	bl	_ZSt20__throw_system_errori
.LEHE64:
	.p2align 2,,3
.L919:
	mov	x28, x27
	mov	x23, x27
	mov	x24, 0
	mov	x25, 0
	b	.L824
.L940:
	mov	x19, x0
	mov	x1, 24
	ldr	x0, [sp, 232]
	bl	_ZdlPvm
.L815:
	ldrb	w0, [sp, 280]
	cbz	w0, .L816
	add	x0, sp, 272
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L816:
	mov	x0, x19
.LEHB65:
	bl	_Unwind_Resume
.L942:
	ldr	x1, [sp, 128]
	mov	x20, x0
	sub	x27, x1, x19
.L908:
	cbz	x19, .L911
.L1058:
	mov	x1, x27
	mov	x0, x19
	bl	_ZdlPvm
.L911:
	ldr	x0, [x26]
	ldr	x1, [x26, 16]
	sub	x1, x1, x0
	cbz	x0, .L912
	bl	_ZdlPvm
.L912:
	mov	x0, x20
	bl	_Unwind_Resume
.LEHE65:
.L941:
	ldrb	w1, [sp, 280]
	mov	x20, x0
	cbz	w1, .L907
	add	x0, sp, 272
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L907:
	ldr	x0, [sp, 128]
	sub	x27, x0, x19
	cbnz	x19, .L1058
	b	.L911
.L937:
	mov	x20, x0
	b	.L911
.L938:
	ldrb	w1, [sp, 280]
	mov	x20, x0
	cbz	w1, .L908
	add	x0, sp, 272
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	cbnz	x19, .L1058
	b	.L911
.L939:
	mov	x19, x0
	b	.L815
	.cfi_endproc
.LFE12076:
	.section	.gcc_except_table._ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,"aG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,comdat
.LLSDA12076:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12076-.LLSDACSB12076
.LLSDACSB12076:
	.uleb128 .LEHB56-.LFB12076
	.uleb128 .LEHE56-.LEHB56
	.uleb128 .L937-.LFB12076
	.uleb128 0
	.uleb128 .LEHB57-.LFB12076
	.uleb128 .LEHE57-.LEHB57
	.uleb128 .L938-.LFB12076
	.uleb128 0
	.uleb128 .LEHB58-.LFB12076
	.uleb128 .LEHE58-.LEHB58
	.uleb128 .L939-.LFB12076
	.uleb128 0
	.uleb128 .LEHB59-.LFB12076
	.uleb128 .LEHE59-.LEHB59
	.uleb128 .L940-.LFB12076
	.uleb128 0
	.uleb128 .LEHB60-.LFB12076
	.uleb128 .LEHE60-.LEHB60
	.uleb128 .L941-.LFB12076
	.uleb128 0
	.uleb128 .LEHB61-.LFB12076
	.uleb128 .LEHE61-.LEHB61
	.uleb128 .L937-.LFB12076
	.uleb128 0
	.uleb128 .LEHB62-.LFB12076
	.uleb128 .LEHE62-.LEHB62
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB63-.LFB12076
	.uleb128 .LEHE63-.LEHB63
	.uleb128 .L938-.LFB12076
	.uleb128 0
	.uleb128 .LEHB64-.LFB12076
	.uleb128 .LEHE64-.LEHB64
	.uleb128 .L942-.LFB12076
	.uleb128 0
	.uleb128 .LEHB65-.LFB12076
	.uleb128 .LEHE65-.LEHB65
	.uleb128 0
	.uleb128 0
.LLSDACSE12076:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi, .-_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi
	.section	.text._ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB12313:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x25, x26, [x0]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x1
	sub	x3, x26, x25
	str	x27, [sp, 80]
	.cfi_offset 27, -16
	mov	x1, 1152921504606846975
	asr	x3, x3, 3
	cmp	x3, x1
	beq	.L1077
	cmp	x3, 0
	mov	x22, x0
	csinc	x0, x3, xzr, ne
	mov	x27, x2
	sub	x21, x23, x25
	adds	x3, x3, x0
	bcs	.L1070
	cbnz	x3, .L1064
	mov	x19, 8
	mov	x20, 0
	mov	x24, 0
.L1069:
	ldr	x0, [x27]
	str	x0, [x24, x21]
	cmp	x23, x25
	beq	.L1065
	add	x6, x24, x21
	mov	x3, x24
	mov	x4, x25
	.p2align 3,,7
.L1066:
	ldr	x5, [x4], 8
	str	x5, [x3], 8
	cmp	x3, x6
	bne	.L1066
	add	x19, x3, 8
.L1065:
	cmp	x23, x26
	beq	.L1067
	sub	x2, x26, x23
	mov	x0, x19
	mov	x1, x23
	add	x19, x19, x2
	bl	memcpy
.L1067:
	cbz	x25, .L1068
	ldr	x1, [x22, 16]
	mov	x0, x25
	sub	x1, x1, x25
	bl	_ZdlPvm
.L1068:
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	stp	x24, x19, [x22]
	str	x20, [x22, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1064:
	.cfi_restore_state
	cmp	x3, x1
	csel	x3, x3, x1, ls
	lsl	x20, x3, 3
.L1063:
	mov	x0, x20
	bl	_Znwm
	mov	x24, x0
	add	x20, x0, x20
	add	x19, x0, 8
	b	.L1069
	.p2align 2,,3
.L1070:
	mov	x20, 9223372036854775800
	b	.L1063
.L1077:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE12313:
	.size	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.text
	.align	2
	.p2align 4,,11
	.global	_Z11flat_searchPfS_mmm
	.type	_Z11flat_searchPfS_mmm, %function
_Z11flat_searchPfS_mmm:
.LFB6223:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA6223
	stp	x29, x30, [sp, -144]!
	.cfi_def_cfa_offset 144
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -80
	.cfi_offset 26, -72
	mov	x25, x8
	stp	xzr, xzr, [x8]
	str	xzr, [x8, 16]
	cbz	x2, .L1078
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -120
	.cfi_offset 19, -128
	lsr	x20, x3, 2
	mov	x19, x1
	lsl	x20, x20, 4
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -104
	.cfi_offset 21, -112
	mov	x21, x3
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -56
	.cfi_offset 27, -64
	mov	x28, x4
	mov	x27, x2
	and	x26, x3, -4
	mov	x22, 0
	mov	x1, 0
	mov	x2, 0
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -88
	.cfi_offset 23, -96
	mov	x24, x0
	mov	x23, 0
	sub	x0, x3, #1
	str	d8, [sp, 96]
	.cfi_offset 72, -48
	fmov	s8, 1.0e+0
	str	x0, [sp, 112]
	str	w26, [sp, 124]
	.p2align 3,,7
.L1121:
	cbz	x21, .L1125
	ldr	x0, [sp, 112]
	movi	v1.2s, #0
	cmp	x0, 2
	bls	.L1126
	add	x3, x24, x22, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L1082:
	ldr	q2, [x3, x0]
	ldr	q0, [x19, x0]
	add	x0, x0, 16
	fmul	v0.4s, v0.4s, v2.4s
	dup	s4, v0.s[0]
	dup	s3, v0.s[1]
	dup	s2, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s1, s1, s4
	fadd	s1, s3, s1
	fadd	s1, s2, s1
	fadd	s1, s1, s0
	cmp	x20, x0
	bne	.L1082
	cmp	x21, x26
	beq	.L1083
	ldr	w3, [sp, 124]
	mov	x4, x26
.L1081:
	add	x5, x22, x4
	add	w0, w3, 1
	ldr	s0, [x19, x4, lsl 2]
	sxtw	x0, w0
	ldr	s2, [x24, x5, lsl 2]
	fmadd	s1, s2, s0, s1
	cmp	x21, x0
	bls	.L1083
	add	x4, x22, x0
	add	w3, w3, 2
	ldr	s0, [x19, x0, lsl 2]
	lsl	x0, x0, 2
	sxtw	x3, w3
	ldr	s2, [x24, x4, lsl 2]
	fmadd	s1, s2, s0, s1
	cmp	x21, x3
	bls	.L1083
	add	x0, x19, x0
	add	x3, x3, x22
	ldr	s0, [x24, x3, lsl 2]
	ldr	s2, [x0, 4]
	fmadd	s1, s2, s0, s1
.L1083:
	fsub	s1, s8, s1
.L1080:
	sub	x0, x1, x2
	cmp	x28, x0, asr 3
	bhi	.L1156
	ldr	s0, [x2]
	fcmpe	s0, s1
	bgt	.L1136
.L1093:
	add	x23, x23, 1
	add	x22, x22, x21
	cmp	x27, x23
	bne	.L1121
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldr	d8, [sp, 96]
	.cfi_restore 72
.L1078:
	mov	x0, x25
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 144
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1156:
	.cfi_def_cfa_offset 144
	.cfi_offset 19, -128
	.cfi_offset 20, -120
	.cfi_offset 21, -112
	.cfi_offset 22, -104
	.cfi_offset 23, -96
	.cfi_offset 24, -88
	.cfi_offset 25, -80
	.cfi_offset 26, -72
	.cfi_offset 27, -64
	.cfi_offset 28, -56
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	.cfi_offset 72, -48
	ldr	x0, [x25, 16]
	str	s1, [sp, 136]
	str	w23, [sp, 140]
	cmp	x0, x1
	beq	.L1085
	ldr	x0, [sp, 136]
	str	x0, [x1], 8
	str	x1, [x25, 8]
.L1086:
	sub	x4, x1, x2
	ldr	w9, [x1, -4]
	ldr	s1, [x1, -8]
	asr	x3, x4, 3
	sub	x4, x4, #8
	sub	x0, x3, #2
	sub	x3, x3, #1
	add	x4, x2, x4
	add	x0, x0, x0, lsr 63
	asr	x0, x0, 1
	cmp	x3, 0
	ble	.L1088
.L1087:
	lsl	x5, x0, 3
	add	x4, x2, x5
	ldr	s0, [x2, x5]
	fcmpe	s0, s1
	bmi	.L1089
	bgt	.L1153
	ldr	w7, [x4, 4]
	cmp	w7, w9
	bcc	.L1092
.L1153:
	add	x4, x2, x3, lsl 3
.L1088:
	str	s1, [x4]
	str	w9, [x4, 4]
	b	.L1093
	.p2align 2,,3
.L1089:
	ldr	w7, [x4, 4]
.L1092:
	lsl	x6, x3, 3
	sub	x5, x0, #1
	add	x8, x2, x6
	mov	x3, x0
	add	x5, x5, x5, lsr 63
	str	s0, [x2, x6]
	str	w7, [x8, 4]
	asr	x0, x5, 1
	cmp	x3, 0
	bgt	.L1087
	b	.L1088
	.p2align 2,,3
.L1136:
	ldr	x0, [x25, 16]
	str	s1, [sp, 136]
	str	w23, [sp, 140]
	cmp	x0, x1
	beq	.L1095
	mov	x4, x1
	ldr	x0, [sp, 136]
	str	x0, [x4], 8
	str	x4, [x25, 8]
.L1096:
	sub	x9, x4, x2
	ldr	w11, [x4, -4]
	sub	x6, x9, #8
	ldr	s1, [x4, -8]
	asr	x3, x9, 3
	add	x6, x2, x6
	sub	x0, x3, #2
	sub	x3, x3, #1
	add	x0, x0, x0, lsr 63
	asr	x0, x0, 1
	cmp	x3, 0
	ble	.L1098
.L1097:
	lsl	x5, x0, 3
	add	x6, x2, x5
	ldr	s0, [x2, x5]
	fcmpe	s0, s1
	bmi	.L1099
	bgt	.L1154
	ldr	w8, [x6, 4]
	cmp	w11, w8
	bhi	.L1102
.L1154:
	add	x6, x2, x3, lsl 3
.L1098:
	str	s1, [x6]
	str	w11, [x6, 4]
	cmp	x9, 8
	bgt	.L1157
	str	x1, [x25, 8]
	b	.L1093
	.p2align 2,,3
.L1099:
	ldr	w8, [x6, 4]
.L1102:
	lsl	x7, x3, 3
	sub	x5, x0, #1
	add	x10, x2, x7
	mov	x3, x0
	add	x5, x5, x5, lsr 63
	str	s0, [x2, x7]
	str	w8, [x10, 4]
	asr	x0, x5, 1
	cmp	x3, 0
	bgt	.L1097
	b	.L1098
.L1157:
	sub	x3, x1, x2
	ldr	s0, [x2]
	ldr	w5, [x2, 4]
	asr	x11, x3, 3
	ldr	w10, [x4, -4]
	sub	x0, x11, #1
	str	w5, [x4, -4]
	ldr	s2, [x4, -8]
	and	x12, x11, 1
	add	x9, x0, x0, lsr 63
	str	s0, [x4, -8]
	asr	x9, x9, 1
	cmp	x3, 16
	ble	.L1105
	mov	x0, 0
	b	.L1110
.L1130:
	mov	w3, w5
.L1108:
	lsl	x0, x0, 3
	add	x5, x2, x0
	str	s0, [x2, x0]
	str	w3, [x5, 4]
	cmp	x9, x4
	ble	.L1109
.L1158:
	mov	x0, x4
.L1110:
	add	x3, x0, 1
	lsl	x6, x3, 1
	lsl	x3, x3, 4
	sub	x4, x6, #1
	add	x8, x2, x3
	lsl	x5, x4, 3
	ldr	s1, [x2, x3]
	add	x7, x2, x5
	ldr	s0, [x2, x5]
	fcmpe	s0, s1
	bgt	.L1138
	ldr	w3, [x8, 4]
	bmi	.L1129
	ldr	w5, [x7, 4]
	cmp	w5, w3
	bhi	.L1130
.L1129:
	fmov	s0, s1
	lsl	x0, x0, 3
	add	x5, x2, x0
	mov	x4, x6
	mov	x7, x8
	str	s0, [x2, x0]
	str	w3, [x5, 4]
	cmp	x9, x4
	bgt	.L1158
.L1109:
	lsl	x5, x4, 3
	cbz	x12, .L1159
.L1113:
	sub	x4, x4, #1
	asr	x0, x4, 1
.L1119:
	lsl	x3, x0, 3
	add	x6, x2, x3
	ldr	s0, [x2, x3]
	fcmpe	s2, s0
	bgt	.L1115
	bmi	.L1155
	ldr	w7, [x6, 4]
	cmp	w7, w10
	bcs	.L1155
	.p2align 3,,7
.L1118:
	add	x8, x2, x5
	sub	x3, x0, #1
	str	s0, [x2, x5]
	mov	x4, x0
	add	x3, x3, x3, lsr 63
	str	w7, [x8, 4]
	asr	x0, x3, 1
	cbz	x4, .L1111
	lsl	x5, x4, 3
	b	.L1119
	.p2align 2,,3
.L1138:
	ldr	w3, [x7, 4]
	b	.L1108
	.p2align 2,,3
.L1125:
	fmov	s1, 1.0e+0
	b	.L1080
.L1126:
	mov	w3, 0
	mov	x4, 0
	b	.L1081
.L1159:
	sub	x11, x11, #2
	add	x11, x11, x11, lsr 63
	cmp	x4, x11, asr 1
	beq	.L1112
	sub	x0, x4, #1
	lsl	x5, x4, 3
	asr	x0, x0, 1
	b	.L1119
.L1155:
	add	x6, x2, x5
.L1111:
	str	s2, [x6]
	str	w10, [x6, 4]
	str	x1, [x25, 8]
	b	.L1093
.L1115:
	ldr	w7, [x6, 4]
	b	.L1118
.L1085:
	add	x2, sp, 136
	mov	x0, x25
.LEHB66:
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	ldp	x2, x1, [x25]
	b	.L1086
.L1095:
	add	x2, sp, 136
	mov	x0, x25
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE66:
	ldp	x2, x4, [x25]
	sub	x1, x4, #8
	b	.L1096
.L1105:
	mov	x6, x2
	cbnz	x12, .L1111
	cmp	x0, 2
	bhi	.L1111
	mov	x7, x2
	mov	x4, 0
.L1112:
	lsl	x4, x4, 1
	add	x4, x4, 1
	lsl	x5, x4, 3
	add	x0, x2, x5
	ldr	s0, [x2, x5]
	ldr	w0, [x0, 4]
	str	w0, [x7, 4]
	str	s0, [x7]
	b	.L1113
.L1134:
	ldr	x2, [x25]
	mov	x19, x0
	ldr	x1, [x25, 16]
	sub	x1, x1, x2
	cbz	x2, .L1123
	mov	x0, x2
	bl	_ZdlPvm
.L1123:
	mov	x0, x19
.LEHB67:
	bl	_Unwind_Resume
.LEHE67:
	.cfi_endproc
.LFE6223:
	.section	.gcc_except_table,"a",@progbits
.LLSDA6223:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE6223-.LLSDACSB6223
.LLSDACSB6223:
	.uleb128 .LEHB66-.LFB6223
	.uleb128 .LEHE66-.LEHB66
	.uleb128 .L1134-.LFB6223
	.uleb128 0
	.uleb128 .LEHB67-.LFB6223
	.uleb128 .LEHE67-.LEHB67
	.uleb128 0
	.uleb128 0
.LLSDACSE6223:
	.text
	.size	_Z11flat_searchPfS_mmm, .-_Z11flat_searchPfS_mmm
	.section	.text._ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB12354:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	ldp	x23, x24, [x0]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	sub	x1, x24, x23
	str	x27, [sp, 80]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	mov	x27, x2
	asr	x1, x1, 3
	mov	x2, 1152921504606846975
	cmp	x1, x2
	beq	.L1178
	cmp	x1, 0
	mov	x21, x0
	csinc	x0, x1, xzr, ne
	sub	x26, x19, x23
	adds	x1, x1, x0
	bcs	.L1171
	cbnz	x1, .L1165
	mov	x25, 8
	mov	x20, 0
	mov	x22, 0
.L1170:
	ldr	x0, [x27]
	str	x0, [x22, x26]
	cmp	x19, x23
	beq	.L1166
	mov	x4, x22
	mov	x3, x23
	.p2align 3,,7
.L1167:
	ldr	x5, [x3], 8
	str	x5, [x4], 8
	cmp	x3, x19
	bne	.L1167
	add	x26, x26, 8
	add	x25, x22, x26
.L1166:
	cmp	x19, x24
	beq	.L1168
	sub	x2, x24, x19
	mov	x0, x25
	mov	x1, x19
	add	x25, x25, x2
	bl	memcpy
.L1168:
	cbz	x23, .L1169
	ldr	x1, [x21, 16]
	mov	x0, x23
	sub	x1, x1, x23
	bl	_ZdlPvm
.L1169:
	ldp	x23, x24, [sp, 48]
	ldr	x27, [sp, 80]
	stp	x22, x25, [x21]
	str	x20, [x21, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1165:
	.cfi_restore_state
	cmp	x1, x2
	csel	x1, x1, x2, ls
	lsl	x20, x1, 3
.L1164:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x20, x0, x20
	add	x25, x0, 8
	b	.L1170
	.p2align 2,,3
.L1171:
	mov	x20, 9223372036854775800
	b	.L1164
.L1178:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE12354:
	.size	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.text
	.align	2
	.p2align 4,,11
	.type	_Z13ivf_pq_searchRKSt6vectorIfSaIfEERKS_I7IVFListSaIS4_EEPKhPKfSC_mmiiS3_m.constprop.0, %function
_Z13ivf_pq_searchRKSt6vectorIfSaIfEERKS_I7IVFListSaIS4_EEPKhPKfSC_mmiiS3_m.constprop.0:
.LFB13660:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13660
	mov	x12, 4368
	sub	sp, sp, x12
	.cfi_def_cfa_offset 4368
	mov	x7, -6148914691236517206
	movk	x7, 0xaaab, lsl 0
	stp	x29, x30, [sp]
	.cfi_offset 29, -4368
	.cfi_offset 30, -4360
	mov	x29, sp
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -4288
	.cfi_offset 28, -4280
	mov	x27, x1
	mov	x28, x0
	ldp	x9, x1, [x1]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -4352
	.cfi_offset 20, -4344
	mov	x19, x2
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -4336
	.cfi_offset 22, -4328
	mov	x21, x5
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -4320
	.cfi_offset 24, -4312
	mov	x23, x4
	sub	x1, x1, x9
	stp	x25, x26, [sp, 64]
	asr	x1, x1, 3
	str	d8, [sp, 96]
	.cfi_offset 25, -4304
	.cfi_offset 26, -4296
	.cfi_offset 72, -4272
	str	x8, [sp, 128]
	mul	x0, x1, x7
	str	x3, [sp, 152]
	str	w0, [sp, 120]
	str	x6, [sp, 168]
	stp	xzr, xzr, [sp, 176]
	str	xzr, [sp, 192]
	cmp	w0, 0
	ble	.L1180
	lsr	x22, x5, 2
	and	x26, x5, -4
	sub	x0, x5, #1
	mov	x24, 0
	lsl	x20, x22, 4
	mov	x3, 0
	mov	x1, 0
	mov	w25, 0
	mov	x4, 0
	str	x0, [sp, 136]
	.p2align 3,,7
.L1220:
	ldr	x5, [x28]
	cbz	x21, .L1368
	ldr	x0, [sp, 136]
	movi	v1.2s, #0
	cmp	x0, 2
	bls	.L1369
	add	x2, x5, x24, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L1183:
	ldr	q2, [x2, x0]
	ldr	q0, [x23, x0]
	add	x0, x0, 16
	fsub	v0.4s, v0.4s, v2.4s
	fmul	v0.4s, v0.4s, v0.4s
	dup	s2, v0.s[0]
	dup	s4, v0.s[1]
	dup	s3, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s1, s1, s2
	fadd	s1, s4, s1
	fadd	s1, s3, s1
	fadd	s1, s1, s0
	cmp	x20, x0
	bne	.L1183
	mov	x0, x26
	cmp	x21, x26
	beq	.L1181
.L1182:
	add	x7, x0, x24
	ldr	s0, [x23, x0, lsl 2]
	add	x2, x0, 1
	lsl	x6, x0, 2
	ldr	s2, [x5, x7, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x21, x2
	bls	.L1181
	add	x6, x23, x6
	add	x2, x2, x24
	add	x0, x0, 2
	ldr	s2, [x5, x2, lsl 2]
	ldr	s0, [x6, 4]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x21, x0
	bls	.L1181
	add	x0, x0, x24
	ldr	s0, [x6, 8]
	ldr	s2, [x5, x0, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
.L1181:
	cmp	x4, 392
	bls	.L1519
	ldr	s0, [x3]
	fcmpe	s0, s1
	bgt	.L1412
.L1194:
	ldr	w0, [sp, 120]
	add	w25, w25, 1
	add	x24, x24, x21
	cmp	w0, w25
	bne	.L1220
	cmp	x3, x1
	beq	.L1377
	mov	x26, 0
	mov	x20, 0
	str	xzr, [sp, 136]
	b	.L1248
	.p2align 2,,3
.L1222:
	mov	w1, 24
	ldr	x2, [sp, 136]
	smull	x8, w8, w1
	ldr	x0, [x27]
	sub	x1, x2, x20
	mov	x28, x1
	str	x28, [sp, 144]
	add	x1, x0, x8
	ldr	x25, [x0, x8]
	ldr	x24, [x1, 8]
	str	x5, [sp, 184]
	cmp	x25, x24
	beq	.L1383
	sub	x24, x24, x25
	sub	x0, x2, x26
	str	x3, [sp, 120]
	str	x5, [sp, 160]
	cmp	x0, x24
	bcc	.L1239
	mov	x1, x25
	mov	x0, x26
	mov	x2, x24
	bl	memmove
	ldr	x5, [sp, 160]
	add	x26, x26, x24
	ldr	x3, [sp, 120]
	mov	x1, x5
.L1238:
	cmp	x3, x1
	beq	.L1221
.L1521:
	sub	x4, x1, x3
.L1248:
	ldr	w8, [x3, 4]
	sub	x5, x1, #8
	cmp	x4, 8
	ble	.L1222
	sub	x2, x5, x3
	ldr	s0, [x3]
	ldr	w9, [x1, -4]
	asr	x12, x2, 3
	str	w8, [x1, -4]
	sub	x0, x12, #1
	ldr	s2, [x1, -8]
	str	s0, [x1, -8]
	and	x13, x12, 1
	add	x11, x0, x0, lsr 63
	asr	x11, x11, 1
	cmp	x2, 16
	ble	.L1223
	mov	x1, 0
	b	.L1228
.L1379:
	mov	w2, w4
.L1226:
	lsl	x1, x1, 3
	add	x4, x3, x1
	str	s0, [x3, x1]
	str	w2, [x4, 4]
	cmp	x11, x0
	ble	.L1227
.L1520:
	mov	x1, x0
.L1228:
	add	x2, x1, 1
	lsl	x6, x2, 1
	lsl	x2, x2, 4
	sub	x0, x6, #1
	add	x10, x3, x2
	lsl	x4, x0, 3
	ldr	s1, [x3, x2]
	add	x7, x3, x4
	ldr	s0, [x3, x4]
	fcmpe	s0, s1
	bgt	.L1416
	ldr	w2, [x10, 4]
	bmi	.L1378
	ldr	w4, [x7, 4]
	cmp	w4, w2
	bgt	.L1379
.L1378:
	fmov	s0, s1
	lsl	x1, x1, 3
	add	x4, x3, x1
	mov	x0, x6
	mov	x7, x10
	str	s0, [x3, x1]
	str	w2, [x4, 4]
	cmp	x11, x0
	bgt	.L1520
.L1227:
	lsl	x2, x0, 3
	cbnz	x13, .L1231
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x0, x12, asr 1
	beq	.L1230
	sub	x1, x0, #1
	lsl	x2, x0, 3
	asr	x0, x1, 1
	.p2align 3,,7
.L1237:
	lsl	x1, x0, 3
	add	x4, x3, x1
	ldr	s0, [x3, x1]
	fcmpe	s0, s2
	bmi	.L1233
	bgt	.L1510
	ldr	w6, [x4, 4]
	cmp	w6, w9
	bge	.L1510
.L1236:
	add	x7, x3, x2
	sub	x1, x0, #1
	str	s0, [x3, x2]
	mov	x2, x0
	add	x1, x1, x1, lsr 63
	str	w6, [x7, 4]
	asr	x0, x1, 1
	cbz	x2, .L1229
	lsl	x2, x2, 3
	b	.L1237
	.p2align 2,,3
.L1416:
	ldr	w2, [x7, 4]
	b	.L1226
.L1519:
	ldr	x0, [sp, 192]
	str	s1, [sp, 272]
	str	w25, [sp, 276]
	cmp	x0, x1
	beq	.L1186
	ldr	x0, [sp, 272]
	str	x0, [x1], 8
	str	x1, [sp, 184]
.L1187:
	sub	x4, x1, x3
	ldr	w10, [x1, -4]
	ldr	s1, [x1, -8]
	asr	x5, x4, 3
	sub	x0, x5, #2
	sub	x5, x5, #1
	add	x0, x0, x0, lsr 63
	asr	x0, x0, 1
	cmp	x5, 0
	ble	.L1517
.L1188:
	lsl	x2, x0, 3
	add	x6, x3, x2
	ldr	s0, [x3, x2]
	fcmpe	s0, s1
	bmi	.L1190
	bgt	.L1509
	ldr	w8, [x6, 4]
	cmp	w10, w8
	ble	.L1509
.L1193:
	lsl	x7, x5, 3
	sub	x2, x0, #1
	add	x9, x3, x7
	mov	x5, x0
	add	x2, x2, x2, lsr 63
	str	s0, [x3, x7]
	str	w8, [x9, 4]
	asr	x0, x2, 1
	cmp	x5, 0
	bgt	.L1188
.L1215:
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1194
	.p2align 2,,3
.L1509:
	add	x6, x3, x5, lsl 3
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1194
.L1190:
	ldr	w8, [x6, 4]
	b	.L1193
.L1383:
	mov	x1, x5
	cmp	x3, x1
	bne	.L1521
.L1221:
	ldr	x0, [sp, 168]
	add	x24, sp, 272
	lsl	x11, x22, 2
	mov	x10, x24
	add	x2, x11, x23
	lsl	x12, x22, 8
	ldr	x13, [x0]
	mov	x7, x23
	mov	x9, 0
	mov	x8, 0
	mov	x6, 256
	.p2align 3,,7
.L1252:
	sub	x3, x6, #256
	add	x4, x13, x9, lsl 10
	mov	x5, x10
	.p2align 3,,7
.L1251:
	movi	v0.4s, 0
	cbz	x22, .L1249
	mov	x1, x4
	mov	x0, x7
	.p2align 3,,7
.L1250:
	ldr	q1, [x1]
	add	x1, x1, 1024
	ld1r	{v2.4s}, [x0], 4
	fmla	v0.4s, v2.4s, v1.4s
	cmp	x2, x0
	bne	.L1250
.L1249:
	add	x3, x3, 4
	str	q0, [x5], 16
	add	x4, x4, 16
	cmp	x6, x3
	bne	.L1251
	add	x8, x8, 256
	add	x6, x6, x12
	add	x10, x10, 1024
	add	x2, x2, x11
	add	x7, x7, x11
	add	x9, x9, x22
	cmp	x8, 1024
	bne	.L1252
	movi	v0.4s, 0
	sub	x1, x26, x20
	str	x1, [sp, 160]
	mov	x0, 9223372036854775804
	asr	x2, x1, 2
	str	x2, [sp, 120]
	str	xzr, [sp, 224]
	str	q0, [sp, 208]
	cmp	x1, x0
	bhi	.L1522
	cbz	x2, .L1254
	mov	x22, x1
	mov	x0, x1
.LEHB68:
	bl	_Znwm
.LEHE68:
	mov	x26, x0
	cbz	x22, .L1255
	mov	x2, x22
	mov	w1, 0
	bl	memset
.L1255:
	ldp	x0, x1, [sp, 208]
	mov	x28, 0
	fmov	s8, 1.0e+0
	.p2align 3,,7
.L1260:
	ldr	x2, [sp, 120]
	mov	x22, x28
	add	x28, x28, 256
	cmp	x2, x28
	csel	x25, x2, x28, ls
	cmp	x22, x25
	bcs	.L1256
	mov	x2, x22
	.p2align 3,,7
.L1258:
	ldr	w3, [x20, x2, lsl 2]
	lsl	w3, w3, 2
	add	x6, x19, x3, sxtw
	ldrb	w3, [x19, w3, sxtw]
	ldrb	w5, [x6, 1]
	ldrb	w4, [x6, 2]
	add	x5, x5, 256
	ldr	s0, [x24, x3, lsl 2]
	add	x4, x4, 512
	ldrb	w3, [x6, 3]
	ldr	s1, [x24, x5, lsl 2]
	add	x3, x3, 768
	ldr	s2, [x24, x4, lsl 2]
	fadd	s0, s0, s1
	ldr	s1, [x24, x3, lsl 2]
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fsub	s0, s8, s0
	str	s0, [x26, x2, lsl 2]
	add	x2, x2, 1
	cmp	x2, x25
	bne	.L1258
	sub	x4, x1, x0
	mov	x27, 11992
	b	.L1257
	.p2align 2,,3
.L1261:
	ldr	s1, [x0]
	fcmpe	s1, s0
	bgt	.L1419
	add	x22, x22, 1
	cmp	x22, x25
	beq	.L1256
.L1257:
	ldr	s0, [x26, x22, lsl 2]
	cmp	x4, x27
	bhi	.L1261
	ldr	x2, [sp, 224]
	str	s0, [sp, 240]
	ldr	w3, [x20, x22, lsl 2]
	str	w3, [sp, 244]
	cmp	x2, x1
	beq	.L1262
	ldr	x2, [sp, 240]
	str	x2, [x1], 8
	str	x1, [sp, 216]
.L1263:
	sub	x4, x1, x0
	ldr	w10, [x1, -4]
	ldr	s1, [x1, -8]
	asr	x5, x4, 3
	sub	x2, x5, #2
	sub	x5, x5, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x5, 0
	ble	.L1518
.L1264:
	lsl	x3, x2, 3
	add	x6, x0, x3
	ldr	s0, [x0, x3]
	fcmpe	s0, s1
	bmi	.L1266
	bgt	.L1513
	ldr	w8, [x6, 4]
	cmp	w8, w10
	bge	.L1513
	.p2align 3,,7
.L1269:
	lsl	x7, x5, 3
	sub	x3, x2, #1
	add	x9, x0, x7
	mov	x5, x2
	add	x3, x3, x3, lsr 63
	str	s0, [x0, x7]
	str	w8, [x9, 4]
	asr	x2, x3, 1
	cmp	x5, 0
	bgt	.L1264
	str	w10, [x6, 4]
	str	s1, [x6]
	.p2align 3,,7
.L1528:
	add	x22, x22, 1
	cmp	x22, x25
	bne	.L1257
.L1256:
	ldr	x2, [sp, 120]
	cmp	x2, x28
	bhi	.L1260
	ldr	x2, [sp, 128]
	fmov	s8, 1.0e+0
	stp	xzr, xzr, [x2]
	str	xzr, [x2, 16]
	cmp	x0, x1
	beq	.L1298
	.p2align 3,,7
.L1297:
	sub	x2, x1, x0
	ldr	w4, [x0, 4]
	sub	x9, x1, #8
	cmp	x2, 8
	bgt	.L1523
	sxtw	x0, w4
	str	x9, [sp, 216]
	movi	v0.4s, 0
	mul	x0, x0, x21
	lsl	x0, x0, 2
	cbz	x21, .L1398
.L1534:
	ldr	x1, [sp, 152]
	add	x2, x23, 16
	mov	v1.16b, v0.16b
	add	x0, x1, x0
	mov	x1, 0
	.p2align 3,,7
.L1316:
	ldr	q5, [x2, -16]
	add	x1, x1, 8
	ldp	q4, q2, [x0]
	add	x0, x0, 32
	ldr	q3, [x2], 32
	fmla	v1.4s, v5.4s, v4.4s
	fmla	v0.4s, v3.4s, v2.4s
	cmp	x21, x1
	bhi	.L1316
.L1315:
	stp	q1, q0, [sp, 240]
	ldr	s4, [sp, 256]
	ldp	s1, s2, [sp, 240]
	ldp	s6, s5, [sp, 248]
	fadd	s1, s1, s2
	ldr	s3, [sp, 260]
	ldr	x1, [sp, 128]
	ldr	s2, [sp, 264]
	fadd	s0, s1, s6
	ldr	s1, [sp, 268]
	ldp	x0, x1, [x1]
	fadd	s0, s0, s5
	sub	x6, x1, x0
	fadd	s0, s0, s4
	fadd	s0, s0, s3
	fadd	s0, s0, s2
	fadd	s0, s0, s1
	fsub	s0, s8, s0
	cmp	x6, 72
	bls	.L1524
	ldr	s1, [x0]
	fcmpe	s1, s0
	bgt	.L1426
.L1326:
	ldp	x0, x1, [sp, 208]
	cmp	x0, x1
	bne	.L1297
.L1298:
	ldr	x1, [sp, 160]
	mov	x0, x26
	bl	_ZdlPvm
	ldr	x0, [sp, 208]
	cbz	x0, .L1296
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L1296:
	cbz	x20, .L1352
	ldr	x1, [sp, 144]
	mov	x0, x20
	bl	_ZdlPvm
.L1352:
	ldr	x0, [sp, 176]
	cbz	x0, .L1179
	ldr	x1, [sp, 192]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L1179:
	mov	x12, 4368
	ldr	d8, [sp, 96]
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	x0, [sp, 128]
	add	sp, sp, x12
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
.L1510:
	.cfi_restore_state
	add	x4, x3, x2
.L1229:
	str	s2, [x4]
	str	w9, [x4, 4]
	b	.L1222
.L1233:
	ldr	w6, [x4, 4]
	b	.L1236
.L1239:
	sub	x0, x26, x20
	str	x0, [sp, 144]
	mov	x2, 2305843009213693951
	asr	x1, x24, 2
	asr	x0, x0, 2
	sub	x2, x2, x0
	cmp	x1, x2
	bhi	.L1525
	cmp	x1, x0
	csel	x1, x1, x0, cs
	adds	x0, x0, x1
	bcs	.L1242
	cbnz	x0, .L1526
	mov	x4, 0
	mov	x3, 0
	str	xzr, [sp, 136]
.L1244:
	str	x4, [sp, 160]
	cmp	x20, x26
	beq	.L1245
	ldr	x2, [sp, 144]
	mov	x0, x3
	mov	x1, x20
	str	x3, [sp, 120]
	add	x5, x3, x2
	str	x5, [sp, 144]
	bl	memmove
	ldr	x5, [sp, 144]
	mov	x1, x25
	mov	x2, x24
	add	x26, x5, x24
	mov	x0, x5
	bl	memcpy
	ldr	x3, [sp, 120]
	ldr	x4, [sp, 160]
.L1246:
	mov	x1, x28
	mov	x0, x20
	str	x3, [sp, 120]
	str	x4, [sp, 144]
	bl	_ZdlPvm
	ldr	x3, [sp, 120]
	ldr	x4, [sp, 144]
.L1247:
	mov	x20, x3
	str	x4, [sp, 144]
	ldp	x3, x1, [sp, 176]
	b	.L1238
.L1412:
	sub	x8, x1, #8
	cmp	x4, 8
	bgt	.L1527
	ldr	x0, [sp, 192]
	str	x8, [sp, 184]
	str	s1, [sp, 272]
	str	w25, [sp, 276]
	cmp	x0, x8
	beq	.L1212
.L1541:
	ldr	x0, [sp, 272]
	str	x0, [x1, -8]
	str	x1, [sp, 184]
.L1213:
	asr	x5, x4, 3
	ldr	w10, [x1, -4]
	sub	x0, x5, #2
	sub	x5, x5, #1
	ldr	s1, [x1, -8]
	add	x0, x0, x0, lsr 63
	asr	x0, x0, 1
	cmp	x5, 0
	ble	.L1517
.L1214:
	lsl	x2, x0, 3
	add	x6, x3, x2
	ldr	s0, [x3, x2]
	fcmpe	s0, s1
	bmi	.L1216
	bgt	.L1509
	ldr	w8, [x6, 4]
	cmp	w8, w10
	bge	.L1509
.L1219:
	lsl	x7, x5, 3
	sub	x2, x0, #1
	add	x9, x3, x7
	mov	x5, x0
	add	x2, x2, x2, lsr 63
	str	s0, [x3, x7]
	str	w8, [x9, 4]
	asr	x0, x2, 1
	cmp	x5, 0
	bgt	.L1214
	b	.L1215
	.p2align 2,,3
.L1216:
	ldr	w8, [x6, 4]
	b	.L1219
.L1223:
	mov	x4, x3
	cbnz	x13, .L1229
	cmp	x0, 2
	bhi	.L1229
	mov	x7, x3
	mov	x0, 0
.L1230:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x2, x0, 3
	add	x1, x3, x2
	ldr	s0, [x3, x2]
	ldr	w1, [x1, 4]
	str	w1, [x7, 4]
	str	s0, [x7]
.L1231:
	sub	x0, x0, #1
	asr	x0, x0, 1
	b	.L1237
	.p2align 2,,3
.L1513:
	add	x6, x0, x5, lsl 3
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1528
	.p2align 2,,3
.L1266:
	ldr	w8, [x6, 4]
	b	.L1269
	.p2align 2,,3
.L1419:
	sub	x9, x1, #8
	cmp	x4, 8
	bgt	.L1529
	ldr	x2, [sp, 224]
	str	x9, [sp, 216]
	ldr	w3, [x20, x22, lsl 2]
	str	s0, [sp, 240]
	str	w3, [sp, 244]
	cmp	x2, x9
	beq	.L1288
.L1531:
	ldr	x2, [sp, 240]
	str	x2, [x1, -8]
	str	x1, [sp, 216]
.L1289:
	asr	x5, x4, 3
	ldr	w10, [x1, -4]
	sub	x2, x5, #2
	sub	x5, x5, #1
	ldr	s1, [x1, -8]
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x5, 0
	ble	.L1518
.L1290:
	lsl	x3, x2, 3
	add	x6, x0, x3
	ldr	s0, [x0, x3]
	fcmpe	s1, s0
	bgt	.L1292
	bmi	.L1513
	ldr	w8, [x6, 4]
	cmp	w8, w10
	bge	.L1513
.L1295:
	lsl	x7, x5, 3
	sub	x3, x2, #1
	add	x9, x0, x7
	mov	x5, x2
	add	x3, x3, x3, lsr 63
	str	s0, [x0, x7]
	str	w8, [x9, 4]
	asr	x2, x3, 1
	cmp	x5, 0
	bgt	.L1290
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1528
	.p2align 2,,3
.L1292:
	ldr	w8, [x6, 4]
	b	.L1295
.L1529:
	sub	x3, x9, x0
	ldr	w5, [x0, 4]
	ldr	w10, [x1, -4]
	asr	x14, x3, 3
	str	w5, [x1, -4]
	sub	x2, x14, #1
	ldr	s2, [x1, -8]
	str	s1, [x1, -8]
	and	x13, x14, 1
	add	x12, x2, x2, lsr 63
	asr	x12, x12, 1
	cmp	x3, 16
	ble	.L1273
	mov	x3, 0
	b	.L1278
.L1389:
	mov	w5, w6
	.p2align 3,,7
.L1276:
	lsl	x3, x3, 3
	add	x6, x0, x3
	str	s0, [x0, x3]
	str	w5, [x6, 4]
	cmp	x12, x2
	ble	.L1277
.L1530:
	mov	x3, x2
.L1278:
	add	x5, x3, 1
	lsl	x7, x5, 1
	lsl	x5, x5, 4
	sub	x2, x7, #1
	add	x11, x0, x5
	lsl	x6, x2, 3
	ldr	s1, [x0, x5]
	add	x8, x0, x6
	ldr	s0, [x0, x6]
	fcmpe	s0, s1
	bgt	.L1420
	ldr	w5, [x11, 4]
	bmi	.L1388
	ldr	w6, [x8, 4]
	cmp	w6, w5
	bgt	.L1389
.L1388:
	fmov	s0, s1
	lsl	x3, x3, 3
	add	x6, x0, x3
	mov	x2, x7
	mov	x8, x11
	str	s0, [x0, x3]
	str	w5, [x6, 4]
	cmp	x12, x2
	bgt	.L1530
.L1277:
	lsl	x5, x2, 3
	cbnz	x13, .L1281
	sub	x3, x14, #2
	add	x3, x3, x3, lsr 63
	cmp	x2, x3, asr 1
	beq	.L1280
	sub	x3, x2, #1
	lsl	x5, x2, 3
	asr	x2, x3, 1
	.p2align 3,,7
.L1287:
	lsl	x3, x2, 3
	add	x6, x0, x3
	ldr	s0, [x0, x3]
	fcmpe	s2, s0
	bgt	.L1283
	bmi	.L1512
	ldr	w7, [x6, 4]
	cmp	w7, w10
	bge	.L1512
.L1286:
	add	x8, x0, x5
	sub	x3, x2, #1
	str	s0, [x0, x5]
	mov	x5, x2
	add	x3, x3, x3, lsr 63
	str	w7, [x8, 4]
	asr	x2, x3, 1
	cbz	x5, .L1279
	lsl	x5, x5, 3
	b	.L1287
	.p2align 2,,3
.L1420:
	ldr	w5, [x8, 4]
	b	.L1276
.L1512:
	add	x6, x0, x5
.L1279:
	str	s2, [x6]
	str	w10, [x6, 4]
	ldr	s0, [x26, x22, lsl 2]
	ldr	x2, [sp, 224]
	str	x9, [sp, 216]
	ldr	w3, [x20, x22, lsl 2]
	str	s0, [sp, 240]
	str	w3, [sp, 244]
	cmp	x2, x9
	bne	.L1531
.L1288:
	mov	x1, x9
	add	x2, sp, 240
	add	x0, sp, 208
.LEHB69:
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	ldp	x0, x1, [sp, 208]
	sub	x4, x1, x0
	b	.L1289
.L1283:
	ldr	w7, [x6, 4]
	b	.L1286
.L1262:
	add	x2, sp, 240
	add	x0, sp, 208
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE69:
	ldp	x0, x1, [sp, 208]
	b	.L1263
.L1273:
	mov	x6, x0
	cbnz	x13, .L1279
	cmp	x2, 2
	bhi	.L1279
	mov	x8, x0
	mov	x2, 0
.L1280:
	lsl	x2, x2, 1
	add	x2, x2, 1
	lsl	x5, x2, 3
	add	x3, x0, x5
	ldr	s0, [x0, x5]
	ldr	w3, [x3, 4]
	str	w3, [x8, 4]
	str	s0, [x8]
.L1281:
	sub	x2, x2, #1
	asr	x2, x2, 1
	b	.L1287
.L1524:
	ldr	x3, [sp, 128]
	str	s0, [sp, 240]
	str	w4, [sp, 244]
	ldr	x2, [x3, 16]
	cmp	x1, x2
	beq	.L1318
	ldr	x2, [sp, 240]
	str	x2, [x1], 8
	str	x1, [x3, 8]
.L1319:
	sub	x2, x1, x0
	ldr	w8, [x1, -4]
	ldr	s1, [x1, -8]
	asr	x3, x2, 3
	sub	x2, x2, #8
	sub	x1, x3, #2
	sub	x3, x3, #1
	add	x4, x0, x2
	add	x1, x1, x1, lsr 63
	asr	x1, x1, 1
	cmp	x3, 0
	ble	.L1347
.L1320:
	lsl	x2, x1, 3
	add	x4, x0, x2
	ldr	s0, [x0, x2]
	fcmpe	s0, s1
	bmi	.L1322
	bgt	.L1516
	ldr	w6, [x4, 4]
	cmp	w6, w8
	bge	.L1516
.L1325:
	lsl	x5, x3, 3
	sub	x2, x1, #1
	add	x7, x0, x5
	mov	x3, x1
	add	x2, x2, x2, lsr 63
	str	s0, [x0, x5]
	str	w6, [x7, 4]
	asr	x1, x2, 1
	cmp	x3, 0
	bgt	.L1320
.L1347:
	str	s1, [x4]
	str	w8, [x4, 4]
	b	.L1326
.L1516:
	add	x4, x0, x3, lsl 3
	str	s1, [x4]
	str	w8, [x4, 4]
	b	.L1326
.L1322:
	ldr	w6, [x4, 4]
	b	.L1325
.L1523:
	sub	x3, x9, x0
	ldr	s0, [x0]
	ldr	w10, [x1, -4]
	asr	x12, x3, 3
	str	w4, [x1, -4]
	sub	x2, x12, #1
	ldr	s2, [x1, -8]
	str	s0, [x1, -8]
	and	x13, x12, 1
	add	x11, x2, x2, lsr 63
	asr	x11, x11, 1
	cmp	x3, 16
	ble	.L1300
	mov	x2, 0
	b	.L1305
.L1395:
	mov	w3, w5
.L1303:
	lsl	x2, x2, 3
	add	x5, x0, x2
	str	s0, [x0, x2]
	str	w3, [x5, 4]
	cmp	x11, x1
	ble	.L1304
.L1532:
	mov	x2, x1
.L1305:
	add	x3, x2, 1
	lsl	x6, x3, 1
	lsl	x3, x3, 4
	sub	x1, x6, #1
	add	x8, x0, x3
	lsl	x5, x1, 3
	ldr	s1, [x0, x3]
	add	x7, x0, x5
	ldr	s0, [x0, x5]
	fcmpe	s0, s1
	bgt	.L1423
	ldr	w3, [x8, 4]
	bmi	.L1394
	ldr	w5, [x7, 4]
	cmp	w5, w3
	bgt	.L1395
.L1394:
	fmov	s0, s1
	lsl	x2, x2, 3
	add	x5, x0, x2
	mov	x1, x6
	mov	x7, x8
	str	s0, [x0, x2]
	str	w3, [x5, 4]
	cmp	x11, x1
	bgt	.L1532
.L1304:
	lsl	x3, x1, 3
	cbnz	x13, .L1308
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x1, x12, asr 1
	beq	.L1307
	sub	x2, x1, #1
	lsl	x3, x1, 3
	asr	x1, x2, 1
	.p2align 3,,7
.L1314:
	lsl	x2, x1, 3
	add	x5, x0, x2
	ldr	s0, [x0, x2]
	fcmpe	s0, s2
	bmi	.L1310
	bgt	.L1514
	ldr	w6, [x5, 4]
	cmp	w10, w6
	ble	.L1514
	add	x7, x0, x3
	sub	x2, x1, #1
	str	s0, [x0, x3]
	mov	x3, x1
	add	x2, x2, x2, lsr 63
	str	w6, [x7, 4]
	asr	x1, x2, 1
	cbz	x3, .L1533
.L1397:
	lsl	x3, x3, 3
	b	.L1314
	.p2align 2,,3
.L1423:
	ldr	w3, [x7, 4]
	b	.L1303
.L1514:
	add	x0, x0, x3
.L1306:
	str	s2, [x0]
	movi	v0.4s, 0
	str	w10, [x0, 4]
	sxtw	x0, w4
	str	x9, [sp, 216]
	mul	x0, x0, x21
	lsl	x0, x0, 2
	cbnz	x21, .L1534
.L1398:
	mov	v1.16b, v0.16b
	b	.L1315
.L1310:
	add	x7, x0, x3
	sub	x2, x1, #1
	ldr	w6, [x5, 4]
	str	s0, [x0, x3]
	add	x2, x2, x2, lsr 63
	str	w6, [x7, 4]
	mov	x3, x1
	asr	x1, x2, 1
	cbnz	x3, .L1397
.L1533:
	mov	x0, x5
	b	.L1306
	.p2align 2,,3
.L1426:
	sub	x9, x1, #8
	cmp	x6, 8
	bgt	.L1535
	ldr	x3, [sp, 128]
	str	s0, [sp, 240]
	str	w4, [sp, 244]
	ldr	x2, [x3, 16]
	str	x9, [x3, 8]
	cmp	x2, x9
	beq	.L1344
.L1540:
	ldr	x2, [sp, 240]
	str	x2, [x1, -8]
	str	x1, [x3, 8]
.L1345:
	asr	x3, x6, 3
	sub	x4, x6, #8
	sub	x2, x3, #2
	sub	x3, x3, #1
	ldr	w8, [x1, -4]
	add	x4, x0, x4
	add	x2, x2, x2, lsr 63
	ldr	s1, [x1, -8]
	asr	x1, x2, 1
	cmp	x3, 0
	ble	.L1347
.L1346:
	lsl	x2, x1, 3
	add	x4, x0, x2
	ldr	s0, [x0, x2]
	fcmpe	s1, s0
	bgt	.L1348
	bmi	.L1516
	ldr	w6, [x4, 4]
	cmp	w8, w6
	ble	.L1516
.L1351:
	lsl	x5, x3, 3
	sub	x2, x1, #1
	add	x7, x0, x5
	mov	x3, x1
	add	x2, x2, x2, lsr 63
	str	s0, [x0, x5]
	str	w6, [x7, 4]
	asr	x1, x2, 1
	cmp	x3, 0
	bgt	.L1346
	b	.L1347
	.p2align 2,,3
.L1348:
	ldr	w6, [x4, 4]
	b	.L1351
.L1300:
	cbnz	x13, .L1306
	cmp	x2, 2
	bhi	.L1306
	mov	x7, x0
	mov	x1, 0
.L1307:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x3, x1, 3
	add	x2, x0, x3
	ldr	s0, [x0, x3]
	ldr	w2, [x2, 4]
	str	w2, [x7, 4]
	str	s0, [x7]
.L1308:
	sub	x1, x1, #1
	asr	x1, x1, 1
	b	.L1314
.L1518:
	sub	x6, x4, #8
	add	x6, x0, x6
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1528
.L1245:
	ldr	x0, [sp, 144]
	mov	x1, x25
	mov	x2, x24
	str	x3, [sp, 120]
	add	x0, x3, x0
	add	x26, x0, x24
	bl	memcpy
	ldr	x3, [sp, 120]
	ldr	x4, [sp, 160]
	cbz	x20, .L1247
	b	.L1246
	.p2align 2,,3
.L1368:
	movi	v1.2s, #0
	b	.L1181
.L1369:
	mov	x0, 0
	b	.L1182
.L1535:
	sub	x3, x9, x0
	ldr	w5, [x0, 4]
	ldr	w10, [x1, -4]
	asr	x13, x3, 3
	str	w5, [x1, -4]
	sub	x2, x13, #1
	ldr	s3, [x1, -8]
	str	s1, [x1, -8]
	and	x14, x13, 1
	add	x12, x2, x2, lsr 63
	asr	x12, x12, 1
	cmp	x3, 16
	ble	.L1329
	mov	x3, 0
	b	.L1334
.L1401:
	mov	w7, w15
.L1332:
	lsl	x3, x3, 3
	add	x8, x0, x3
	str	s1, [x0, x3]
	str	w7, [x8, 4]
	cmp	x12, x2
	ble	.L1333
.L1536:
	mov	x3, x2
.L1334:
	add	x5, x3, 1
	lsl	x8, x5, 1
	lsl	x5, x5, 4
	sub	x2, x8, #1
	add	x11, x0, x5
	lsl	x7, x2, 3
	ldr	s2, [x0, x5]
	add	x5, x0, x7
	ldr	s1, [x0, x7]
	fcmpe	s1, s2
	bgt	.L1427
	ldr	w7, [x11, 4]
	bmi	.L1400
	ldr	w15, [x5, 4]
	cmp	w15, w7
	bgt	.L1401
.L1400:
	fmov	s1, s2
	lsl	x3, x3, 3
	mov	x2, x8
	add	x8, x0, x3
	mov	x5, x11
	str	s1, [x0, x3]
	str	w7, [x8, 4]
	cmp	x12, x2
	bgt	.L1536
.L1333:
	lsl	x3, x2, 3
	cbz	x14, .L1537
.L1337:
	sub	x2, x2, #1
	asr	x2, x2, 1
.L1343:
	lsl	x5, x2, 3
	add	x7, x0, x5
	ldr	s1, [x0, x5]
	fcmpe	s1, s3
	bmi	.L1339
	bgt	.L1515
	ldr	w8, [x7, 4]
	cmp	w8, w10
	bge	.L1515
.L1342:
	add	x11, x0, x3
	str	s1, [x0, x3]
	sub	x3, x2, #1
	mov	x5, x2
	add	x3, x3, x3, lsr 63
	str	w8, [x11, 4]
	asr	x2, x3, 1
	cbz	x5, .L1335
	lsl	x3, x5, 3
	b	.L1343
.L1427:
	ldr	w7, [x5, 4]
	b	.L1332
.L1527:
	sub	x2, x8, x3
	ldr	w5, [x3, 4]
	ldr	w9, [x1, -4]
	asr	x12, x2, 3
	str	w5, [x1, -4]
	sub	x0, x12, #1
	ldr	s3, [x1, -8]
	str	s0, [x1, -8]
	and	x13, x12, 1
	add	x11, x0, x0, lsr 63
	asr	x11, x11, 1
	cmp	x2, 16
	ble	.L1197
	mov	x2, 0
	b	.L1202
.L1372:
	mov	w6, w14
.L1200:
	lsl	x2, x2, 3
	add	x7, x3, x2
	str	s0, [x3, x2]
	str	w6, [x7, 4]
	cmp	x11, x0
	ble	.L1201
.L1538:
	mov	x2, x0
.L1202:
	add	x5, x2, 1
	lsl	x7, x5, 1
	lsl	x5, x5, 4
	sub	x0, x7, #1
	add	x10, x3, x5
	lsl	x6, x0, 3
	ldr	s2, [x3, x5]
	add	x5, x3, x6
	ldr	s0, [x3, x6]
	fcmpe	s0, s2
	bgt	.L1413
	ldr	w6, [x10, 4]
	bmi	.L1371
	ldr	w14, [x5, 4]
	cmp	w14, w6
	bgt	.L1372
.L1371:
	fmov	s0, s2
	lsl	x2, x2, 3
	mov	x0, x7
	add	x7, x3, x2
	mov	x5, x10
	str	s0, [x3, x2]
	str	w6, [x7, 4]
	cmp	x11, x0
	bgt	.L1538
.L1201:
	lsl	x2, x0, 3
	cbz	x13, .L1539
.L1205:
	sub	x0, x0, #1
	asr	x0, x0, 1
.L1211:
	lsl	x5, x0, 3
	add	x6, x3, x5
	ldr	s0, [x3, x5]
	fcmpe	s0, s3
	bmi	.L1207
	bgt	.L1508
	ldr	w7, [x6, 4]
	cmp	w7, w9
	bge	.L1508
.L1210:
	add	x10, x3, x2
	str	s0, [x3, x2]
	sub	x2, x0, #1
	mov	x5, x0
	add	x2, x2, x2, lsr 63
	str	w7, [x10, 4]
	asr	x0, x2, 1
	cbz	x5, .L1203
	lsl	x2, x5, 3
	b	.L1211
.L1413:
	ldr	w6, [x5, 4]
	b	.L1200
.L1539:
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x0, x12, asr 1
	beq	.L1204
	sub	x5, x0, #1
	lsl	x2, x0, 3
	asr	x0, x5, 1
	b	.L1211
.L1537:
	sub	x13, x13, #2
	add	x13, x13, x13, lsr 63
	cmp	x2, x13, asr 1
	beq	.L1336
	sub	x5, x2, #1
	lsl	x3, x2, 3
	asr	x2, x5, 1
	b	.L1343
.L1515:
	add	x7, x0, x3
.L1335:
	ldr	x3, [sp, 128]
	str	w10, [x7, 4]
	str	s3, [x7]
	str	s0, [sp, 240]
	ldr	x2, [x3, 16]
	str	x9, [x3, 8]
	str	w4, [sp, 244]
	cmp	x2, x9
	bne	.L1540
.L1344:
	mov	x19, x3
	mov	x1, x9
	add	x2, sp, 240
	mov	x0, x3
.LEHB70:
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE70:
	ldp	x0, x1, [x19]
	sub	x6, x1, x0
	b	.L1345
.L1508:
	add	x6, x3, x2
.L1203:
	str	w9, [x6, 4]
	ldr	x0, [sp, 192]
	str	s3, [x6]
	str	x8, [sp, 184]
	str	s1, [sp, 272]
	str	w25, [sp, 276]
	cmp	x0, x8
	bne	.L1541
.L1212:
	mov	x1, x8
	add	x2, sp, 272
	add	x0, sp, 176
.LEHB71:
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE71:
	ldp	x3, x1, [sp, 176]
	sub	x4, x1, x3
	b	.L1213
.L1339:
	ldr	w8, [x7, 4]
	b	.L1342
.L1207:
	ldr	w7, [x6, 4]
	b	.L1210
.L1318:
	mov	x19, x3
	add	x2, sp, 240
	mov	x0, x3
.LEHB72:
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE72:
	ldp	x0, x1, [x19]
	b	.L1319
.L1186:
	add	x2, sp, 272
	add	x0, sp, 176
.LEHB73:
	bl	_ZNSt6vectorISt4pairIfiESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE73:
	ldp	x3, x1, [sp, 176]
	b	.L1187
.L1526:
	mov	x1, 2305843009213693951
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x0, x0, 2
	str	x0, [sp, 120]
.L1243:
.LEHB74:
	bl	_Znwm
	ldr	x1, [sp, 120]
	mov	x3, x0
	mov	x4, x1
	add	x0, x0, x1
	str	x0, [sp, 136]
	b	.L1244
.L1254:
	ldr	x0, [sp, 128]
	str	q0, [x0]
	str	xzr, [x0, 16]
	b	.L1296
.L1197:
	mov	x6, x3
	cbnz	x13, .L1203
	cmp	x0, 2
	bhi	.L1203
	mov	x5, x3
	mov	x0, 0
.L1204:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x2, x0, 3
	add	x6, x3, x2
	ldr	s0, [x3, x2]
	ldr	w6, [x6, 4]
	str	w6, [x5, 4]
	str	s0, [x5]
	b	.L1205
.L1329:
	mov	x7, x0
	cbnz	x14, .L1335
	cmp	x2, 2
	bhi	.L1335
	mov	x5, x0
	mov	x2, 0
.L1336:
	lsl	x2, x2, 1
	add	x2, x2, 1
	lsl	x3, x2, 3
	add	x7, x0, x3
	ldr	s1, [x0, x3]
	ldr	w7, [x7, 4]
	str	w7, [x5, 4]
	str	s1, [x5]
	b	.L1337
.L1517:
	sub	x6, x4, #8
	add	x6, x3, x6
	str	s1, [x6]
	str	w10, [x6, 4]
	b	.L1194
.L1180:
	lsr	x22, x5, 2
	mov	x26, 0
	mov	x20, 0
	stp	xzr, xzr, [sp, 136]
	b	.L1221
.L1242:
	mov	x0, 9223372036854775804
	str	x0, [sp, 120]
	b	.L1243
.L1525:
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	_ZSt20__throw_length_errorPKc
.LEHE74:
.L1377:
	mov	x26, 0
	mov	x20, 0
	stp	xzr, xzr, [sp, 136]
	b	.L1221
.L1522:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB75:
	bl	_ZSt20__throw_length_errorPKc
.LEHE75:
.L1409:
	mov	x19, x0
.L1356:
	ldr	x1, [sp, 160]
	mov	x0, x26
	bl	_ZdlPvm
.L1357:
	ldr	x0, [sp, 208]
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	cbz	x0, .L1358
	bl	_ZdlPvm
.L1358:
	ldr	x0, [sp, 136]
	sub	x28, x0, x20
	cbz	x20, .L1361
.L1542:
	mov	x1, x28
	mov	x0, x20
	bl	_ZdlPvm
.L1361:
	ldr	x0, [sp, 176]
	ldr	x1, [sp, 192]
	sub	x1, x1, x0
	cbz	x0, .L1362
	bl	_ZdlPvm
.L1362:
	mov	x0, x19
.LEHB76:
	bl	_Unwind_Resume
.LEHE76:
.L1408:
	mov	x19, x0
	b	.L1357
.L1406:
	mov	x19, x0
	b	.L1361
.L1410:
	ldr	x1, [sp, 128]
	mov	x19, x0
	ldr	x2, [x1]
	ldr	x1, [x1, 16]
	sub	x1, x1, x2
	cbz	x2, .L1356
	mov	x0, x2
	bl	_ZdlPvm
	b	.L1356
.L1407:
	mov	x19, x0
	cbnz	x20, .L1542
	b	.L1361
	.cfi_endproc
.LFE13660:
	.section	.gcc_except_table
.LLSDA13660:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13660-.LLSDACSB13660
.LLSDACSB13660:
	.uleb128 .LEHB68-.LFB13660
	.uleb128 .LEHE68-.LEHB68
	.uleb128 .L1408-.LFB13660
	.uleb128 0
	.uleb128 .LEHB69-.LFB13660
	.uleb128 .LEHE69-.LEHB69
	.uleb128 .L1409-.LFB13660
	.uleb128 0
	.uleb128 .LEHB70-.LFB13660
	.uleb128 .LEHE70-.LEHB70
	.uleb128 .L1410-.LFB13660
	.uleb128 0
	.uleb128 .LEHB71-.LFB13660
	.uleb128 .LEHE71-.LEHB71
	.uleb128 .L1406-.LFB13660
	.uleb128 0
	.uleb128 .LEHB72-.LFB13660
	.uleb128 .LEHE72-.LEHB72
	.uleb128 .L1410-.LFB13660
	.uleb128 0
	.uleb128 .LEHB73-.LFB13660
	.uleb128 .LEHE73-.LEHB73
	.uleb128 .L1406-.LFB13660
	.uleb128 0
	.uleb128 .LEHB74-.LFB13660
	.uleb128 .LEHE74-.LEHB74
	.uleb128 .L1407-.LFB13660
	.uleb128 0
	.uleb128 .LEHB75-.LFB13660
	.uleb128 .LEHE75-.LEHB75
	.uleb128 .L1408-.LFB13660
	.uleb128 0
	.uleb128 .LEHB76-.LFB13660
	.uleb128 .LEHE76-.LEHB76
	.uleb128 0
	.uleb128 0
.LLSDACSE13660:
	.text
	.size	_Z13ivf_pq_searchRKSt6vectorIfSaIfEERKS_I7IVFListSaIS4_EEPKhPKfSC_mmiiS3_m.constprop.0, .-_Z13ivf_pq_searchRKSt6vectorIfSaIfEERKS_I7IVFListSaIS4_EEPKhPKfSC_mmiiS3_m.constprop.0
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	"/anndata/"
	.align	3
.LC20:
	.string	"DEEP100K.query.fbin"
	.align	3
.LC21:
	.string	"DEEP100K.gt.query.100k.top100.bin"
	.align	3
.LC22:
	.string	"DEEP100K.base.100k.fbin"
	.align	3
.LC23:
	.string	"[SQ] Start Symmetric Quantizing Datasets..."
	.align	3
.LC24:
	.string	"[SQ] Symmetric Quantization Finished!"
	.align	3
.LC25:
	.string	"[PQ] Encoding Finished!"
	.align	3
.LC26:
	.string	"average recall: "
	.align	3
.LC27:
	.string	"average latency (us): "
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB10608:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10608
	stp	x29, x30, [sp, -416]!
	.cfi_def_cfa_offset 416
	.cfi_offset 29, -416
	.cfi_offset 30, -408
	adrp	x2, .LC19
	add	x2, x2, :lo12:.LC19
	add	x3, sp, 320
	mov	x29, sp
	mov	x5, 9
	ldr	x4, [x2]
	stp	x19, x20, [sp, 16]
	ldrb	w2, [x2, 8]
	stp	x21, x22, [sp, 32]
	adrp	x1, .LC20
	add	x0, sp, 304
	stp	x23, x24, [sp, 48]
	add	x8, sp, 368
	add	x1, x1, :lo12:.LC20
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	.cfi_offset 19, -400
	.cfi_offset 20, -392
	.cfi_offset 21, -384
	.cfi_offset 22, -376
	.cfi_offset 23, -368
	.cfi_offset 24, -360
	.cfi_offset 25, -352
	.cfi_offset 26, -344
	.cfi_offset 27, -336
	.cfi_offset 28, -328
	.cfi_offset 72, -320
	.cfi_offset 73, -312
	str	x4, [sp, 320]
	strb	wzr, [sp, 329]
	strb	w2, [x3, 8]
	stp	xzr, xzr, [sp, 144]
	stp	xzr, xzr, [sp, 160]
	stp	x3, x5, [sp, 304]
.LEHB77:
	bl	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
.LEHE77:
	add	x2, sp, 168
	add	x1, sp, 144
	add	x0, sp, 368
.LEHB78:
	bl	_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
.LEHE78:
	mov	x27, x0
	add	x1, sp, 384
	ldr	x0, [sp, 368]
	cmp	x0, x1
	beq	.L1544
	ldr	x1, [sp, 384]
	add	x1, x1, 1
	bl	_ZdlPvm
.L1544:
	adrp	x1, .LC21
	add	x8, sp, 368
	add	x1, x1, :lo12:.LC21
	add	x0, sp, 304
.LEHB79:
	bl	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
.LEHE79:
	add	x1, sp, 144
	add	x2, sp, 160
	add	x0, sp, 368
.LEHB80:
	bl	_Z8LoadDataIiEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
.LEHE80:
	mov	x25, x0
	add	x1, sp, 384
	ldr	x0, [sp, 368]
	cmp	x0, x1
	beq	.L1545
	ldr	x1, [sp, 384]
	add	x1, x1, 1
	bl	_ZdlPvm
.L1545:
	adrp	x1, .LC22
	add	x8, sp, 368
	add	x1, x1, :lo12:.LC22
	add	x0, sp, 304
.LEHB81:
	bl	_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_
.LEHE81:
	add	x2, sp, 168
	add	x1, sp, 152
	add	x0, sp, 368
.LEHB82:
	bl	_Z8LoadDataIfEPT_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEERmS8_
.LEHE82:
	mov	x20, x0
	add	x1, sp, 384
	ldr	x0, [sp, 368]
	cmp	x0, x1
	beq	.L1546
	ldr	x1, [sp, 384]
	add	x1, x1, 1
	bl	_ZdlPvm
.L1546:
	mov	x1, 10000
	mov	x0, 28928
	movk	x0, 0x2, lsl 16
	str	x1, [sp, 144]
.LEHB83:
	bl	_Znwm
.LEHE83:
	add	x1, x0, 159744
	mov	x28, x0
	add	x1, x1, 256
.L1548:
	cmp	x0, x1
	beq	.L1547
	add	x0, x0, 16
	str	wzr, [x0, -16]
	str	xzr, [x0, -8]
	b	.L1548
.L1547:
	adrp	x26, _ZSt4cerr
	add	x21, x26, :lo12:_ZSt4cerr
	adrp	x1, .LC23
	mov	x0, x21
	add	x1, x1, :lo12:.LC23
	mov	x2, 43
.LEHB84:
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x21
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	ldr	x19, [sp, 152]
	movi	v0.2s, #0
	ldr	x0, [sp, 168]
	mul	x19, x19, x0
	cbz	x19, .L1549
	mov	x0, x20
	add	x1, x20, x19, lsl 2
.L1552:
	ldr	s1, [x0]
	fabs	s1, s1
	fcmpe	s1, s0
	bgt	.L1737
.L1550:
	add	x0, x0, 4
	cmp	x0, x1
	bne	.L1552
.L1549:
	mov	w0, 14269
	movk	w0, 0x3586, lsl 16
	fmov	s1, w0
	mov	w0, 1123942400
	fmov	s8, w0
	fadd	s0, s0, s1
	mov	x0, x19
	fdiv	s8, s8, s0
	bl	_Znam
	mov	x1, x0
	cbz	x19, .L1558
	sub	x3, x19, #1
	cmp	x3, 14
	bls	.L1685
	adrp	x5, .LC28
	lsr	x2, x19, 4
	dup	v6.4s, v8.s[0]
	mov	x0, x20
	ldr	q5, [x5, #:lo12:.LC28]
	adrp	x5, .LC29
	movi	v19.16b, 0x7f
	mov	x4, x1
	ldr	q4, [x5, #:lo12:.LC29]
	add	x2, x20, x2, lsl 6
	movi	v20.16b, 0xffffffffffffff81
.L1557:
	ldp	q3, q2, [x0]
	ldp	q1, q0, [x0, 32]
	add	x0, x0, 64
	fmul	v3.4s, v3.4s, v6.4s
	fmul	v2.4s, v2.4s, v6.4s
	fmul	v1.4s, v1.4s, v6.4s
	fmul	v0.4s, v0.4s, v6.4s
	fcmgt	v23.4s, v5.4s, v3.4s
	fcmgt	v22.4s, v5.4s, v2.4s
	fcmgt	v21.4s, v5.4s, v1.4s
	fcmgt	v18.4s, v5.4s, v0.4s
	fcmgt	v17.4s, v3.4s, v4.4s
	fcmgt	v16.4s, v2.4s, v4.4s
	fcmgt	v9.4s, v1.4s, v4.4s
	fcmgt	v7.4s, v0.4s, v4.4s
	orr	v27.16b, v23.16b, v17.16b
	orr	v26.16b, v22.16b, v16.16b
	orr	v25.16b, v21.16b, v9.16b
	orr	v24.16b, v18.16b, v7.16b
	not	v27.16b, v27.16b
	bic	v17.16b, v17.16b, v23.16b
	not	v26.16b, v26.16b
	bic	v16.16b, v16.16b, v22.16b
	bic	v9.16b, v9.16b, v21.16b
	bic	v7.16b, v7.16b, v18.16b
	not	v25.16b, v25.16b
	not	v24.16b, v24.16b
	uzp1	v28.8h, v27.8h, v26.8h
	fcvtzs	v3.4s, v3.4s
	uzp1	v26.8h, v17.8h, v16.8h
	fcvtzs	v2.4s, v2.4s
	uzp1	v17.8h, v9.8h, v7.8h
	fcvtzs	v1.4s, v1.4s
	fcvtzs	v0.4s, v0.4s
	uzp1	v27.8h, v25.8h, v24.8h
	uzp1	v16.8h, v3.8h, v2.8h
	uzp1	v7.8h, v23.8h, v22.8h
	uzp1	v9.8h, v1.8h, v0.8h
	uzp1	v1.16b, v28.16b, v27.16b
	uzp1	v0.16b, v26.16b, v17.16b
	uzp1	v3.8h, v21.8h, v18.8h
	uzp1	v2.16b, v16.16b, v9.16b
	bic	v0.16b, v1.16b, v0.16b
	uzp1	v1.16b, v7.16b, v3.16b
	bsl	v0.16b, v2.16b, v19.16b
	bit	v0.16b, v20.16b, v1.16b
	str	q0, [x4], 16
	cmp	x0, x2
	bne	.L1557
	and	x0, x19, -16
	tst	x19, 15
	beq	.L1558
.L1555:
	sub	x3, x3, x0
	sub	x4, x19, x0
	cmp	x3, 6
	bls	.L1560
	lsl	x3, x0, 2
	dup	v0.2s, v8.s[0]
	add	x2, x20, x3
	adrp	x5, .LC30
	movi	v6.8b, 0x7f
	movi	v5.8b, 0xffffffffffffff81
	ldr	d1, [x20, x3]
	and	x3, x4, -8
	ldr	d18, [x5, #:lo12:.LC30]
	adrp	x5, .LC31
	ldp	d19, d4, [x2, 8]
	fmul	v1.2s, v1.2s, v0.2s
	ldr	d3, [x5, #:lo12:.LC31]
	ldr	d9, [x2, 24]
	fmul	v19.2s, v19.2s, v0.2s
	fmul	v4.2s, v4.2s, v0.2s
	fcmgt	v2.2s, v18.2s, v1.2s
	fmul	v9.2s, v9.2s, v0.2s
	fcmgt	v0.2s, v1.2s, v3.2s
	fcvtzs	v1.2s, v1.2s
	fcmgt	v21.2s, v18.2s, v19.2s
	fcmgt	v16.2s, v18.2s, v4.2s
	fcmgt	v22.2s, v19.2s, v3.2s
	fcmgt	v7.2s, v4.2s, v3.2s
	fcmgt	v20.2s, v9.2s, v3.2s
	orr	v3.8b, v2.8b, v0.8b
	fcmgt	v18.2s, v18.2s, v9.2s
	bic	v0.8b, v0.8b, v2.8b
	fcvtzs	v19.2s, v19.2s
	fcvtzs	v4.2s, v4.2s
	orr	v17.8b, v16.8b, v7.8b
	orr	v24.8b, v21.8b, v22.8b
	not	v3.8b, v3.8b
	bic	v22.8b, v22.8b, v21.8b
	bic	v7.8b, v7.8b, v16.8b
	orr	v23.8b, v18.8b, v20.8b
	dup	d0, v0.d[0]
	not	v24.8b, v24.8b
	not	v17.8b, v17.8b
	dup	d3, v3.d[0]
	dup	d1, v1.d[0]
	ins	v0.d[1], v22.d[0]
	bic	v20.8b, v20.8b, v18.8b
	dup	d17, v17.d[0]
	dup	d7, v7.d[0]
	ins	v3.d[1], v24.d[0]
	not	v22.8b, v23.8b
	ins	v1.d[1], v19.d[0]
	fcvtzs	v9.2s, v9.2s
	dup	d2, v2.d[0]
	xtn	v0.4h, v0.4s
	xtn	v3.4h, v3.4s
	dup	d4, v4.d[0]
	ins	v17.d[1], v22.d[0]
	ins	v7.d[1], v20.d[0]
	ins	v2.d[1], v21.d[0]
	xtn	v1.4h, v1.4s
	dup	d3, v3.d[0]
	dup	d0, v0.d[0]
	dup	d16, v16.d[0]
	ins	v4.d[1], v9.d[0]
	xtn	v17.4h, v17.4s
	xtn	v7.4h, v7.4s
	xtn	v2.4h, v2.4s
	dup	d1, v1.d[0]
	ins	v16.d[1], v18.d[0]
	ins	v3.d[1], v17.d[0]
	xtn	v4.4h, v4.4s
	ins	v0.d[1], v7.d[0]
	dup	d2, v2.d[0]
	xtn	v16.4h, v16.4s
	ins	v1.d[1], v4.d[0]
	xtn	v3.8b, v3.8h
	xtn	v0.8b, v0.8h
	ins	v2.d[1], v16.d[0]
	xtn	v1.8b, v1.8h
	bic	v0.8b, v3.8b, v0.8b
	xtn	v2.8b, v2.8h
	bsl	v0.8b, v1.8b, v6.8b
	bit	v0.8b, v5.8b, v2.8b
	str	d0, [x1, x0]
	add	x0, x0, x3
	cmp	x4, x3
	beq	.L1558
.L1560:
	ldr	s0, [x20, x0, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	mov	w2, -127
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1562
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1562
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1562:
	add	x3, x0, 1
	strb	w2, [x1, x0]
	cmp	x19, x3
	bls	.L1558
	ldr	s0, [x20, x3, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1688
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1563
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1563:
	add	x4, x0, 2
	strb	w2, [x1, x3]
	cmp	x19, x4
	bls	.L1558
	ldr	s0, [x20, x4, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1690
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1564
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1564:
	add	x3, x0, 3
	strb	w2, [x1, x4]
	cmp	x19, x3
	bls	.L1558
	ldr	s0, [x20, x3, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1692
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1565
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1565:
	add	x4, x0, 4
	strb	w2, [x1, x3]
	cmp	x19, x4
	bls	.L1558
	ldr	s0, [x20, x4, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1694
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1566
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1566:
	add	x3, x0, 5
	strb	w2, [x1, x4]
	cmp	x19, x3
	bls	.L1558
	ldr	s0, [x20, x3, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1696
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1567
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1567:
	add	x0, x0, 6
	strb	w2, [x1, x3]
	cmp	x19, x0
	bls	.L1558
	ldr	s0, [x20, x0, lsl 2]
	mov	w2, -1023541248
	fmov	s1, w2
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1738
	mov	w2, 1123942400
	fmov	s1, w2
	mov	w2, 127
	fcmpe	s0, s1
	bgt	.L1570
	fcvtzs	w2, s0
	sxtb	w2, w2
.L1570:
	strb	w2, [x1, x0]
.L1558:
	ldr	x19, [sp, 144]
	ldr	x0, [sp, 168]
	mul	x19, x19, x0
	mov	x0, x19
	bl	_Znam
	mov	x2, x0
	cbz	x19, .L1576
	sub	x3, x19, #1
	cmp	x3, 14
	bls	.L1699
	and	x1, x19, -16
	adrp	x5, .LC29
	mov	x4, x0
	add	x1, x1, x0
	dup	v6.4s, v8.s[0]
	adrp	x0, .LC28
	ldr	q4, [x5, #:lo12:.LC29]
	movi	v19.16b, 0x7f
	movi	v20.16b, 0xffffffffffffff81
	ldr	q5, [x0, #:lo12:.LC28]
	mov	x0, x27
.L1575:
	ldp	q3, q2, [x0]
	ldp	q1, q0, [x0, 32]
	add	x0, x0, 64
	fmul	v3.4s, v3.4s, v6.4s
	fmul	v2.4s, v2.4s, v6.4s
	fmul	v1.4s, v1.4s, v6.4s
	fmul	v0.4s, v0.4s, v6.4s
	fcmgt	v23.4s, v5.4s, v3.4s
	fcmgt	v22.4s, v5.4s, v2.4s
	fcmgt	v21.4s, v5.4s, v1.4s
	fcmgt	v18.4s, v5.4s, v0.4s
	fcmgt	v17.4s, v3.4s, v4.4s
	fcmgt	v16.4s, v2.4s, v4.4s
	fcmgt	v9.4s, v1.4s, v4.4s
	fcmgt	v7.4s, v0.4s, v4.4s
	orr	v27.16b, v17.16b, v23.16b
	orr	v26.16b, v16.16b, v22.16b
	orr	v25.16b, v9.16b, v21.16b
	orr	v24.16b, v7.16b, v18.16b
	not	v27.16b, v27.16b
	bic	v17.16b, v17.16b, v23.16b
	not	v26.16b, v26.16b
	bic	v16.16b, v16.16b, v22.16b
	bic	v9.16b, v9.16b, v21.16b
	bic	v7.16b, v7.16b, v18.16b
	not	v25.16b, v25.16b
	not	v24.16b, v24.16b
	uzp1	v28.8h, v27.8h, v26.8h
	fcvtzs	v3.4s, v3.4s
	uzp1	v26.8h, v17.8h, v16.8h
	fcvtzs	v2.4s, v2.4s
	uzp1	v17.8h, v9.8h, v7.8h
	fcvtzs	v1.4s, v1.4s
	fcvtzs	v0.4s, v0.4s
	uzp1	v27.8h, v25.8h, v24.8h
	uzp1	v16.8h, v3.8h, v2.8h
	uzp1	v7.8h, v23.8h, v22.8h
	uzp1	v9.8h, v1.8h, v0.8h
	uzp1	v1.16b, v28.16b, v27.16b
	uzp1	v0.16b, v26.16b, v17.16b
	uzp1	v3.8h, v21.8h, v18.8h
	uzp1	v2.16b, v16.16b, v9.16b
	bic	v0.16b, v1.16b, v0.16b
	uzp1	v1.16b, v7.16b, v3.16b
	bsl	v0.16b, v2.16b, v19.16b
	bit	v0.16b, v20.16b, v1.16b
	str	q0, [x4], 16
	cmp	x4, x1
	bne	.L1575
	and	x0, x19, -16
	tst	x19, 15
	beq	.L1576
.L1573:
	sub	x3, x3, x0
	sub	x4, x19, x0
	cmp	x3, 6
	bls	.L1578
	lsl	x3, x0, 2
	dup	v0.2s, v8.s[0]
	add	x1, x27, x3
	adrp	x5, .LC30
	movi	v6.8b, 0x7f
	movi	v5.8b, 0xffffffffffffff81
	ldr	d1, [x27, x3]
	and	x3, x4, -8
	ldr	d18, [x5, #:lo12:.LC30]
	adrp	x5, .LC31
	ldp	d19, d4, [x1, 8]
	fmul	v1.2s, v1.2s, v0.2s
	ldr	d3, [x5, #:lo12:.LC31]
	ldr	d9, [x1, 24]
	fmul	v19.2s, v19.2s, v0.2s
	fmul	v4.2s, v4.2s, v0.2s
	fcmgt	v2.2s, v18.2s, v1.2s
	fmul	v9.2s, v9.2s, v0.2s
	fcmgt	v0.2s, v1.2s, v3.2s
	fcvtzs	v1.2s, v1.2s
	fcmgt	v21.2s, v18.2s, v19.2s
	fcmgt	v16.2s, v18.2s, v4.2s
	fcmgt	v22.2s, v19.2s, v3.2s
	fcmgt	v7.2s, v4.2s, v3.2s
	fcmgt	v20.2s, v9.2s, v3.2s
	orr	v3.8b, v0.8b, v2.8b
	fcmgt	v18.2s, v18.2s, v9.2s
	bic	v0.8b, v0.8b, v2.8b
	fcvtzs	v19.2s, v19.2s
	fcvtzs	v4.2s, v4.2s
	orr	v17.8b, v7.8b, v16.8b
	orr	v24.8b, v22.8b, v21.8b
	not	v3.8b, v3.8b
	bic	v22.8b, v22.8b, v21.8b
	bic	v7.8b, v7.8b, v16.8b
	orr	v23.8b, v20.8b, v18.8b
	dup	d0, v0.d[0]
	not	v24.8b, v24.8b
	not	v17.8b, v17.8b
	dup	d3, v3.d[0]
	dup	d1, v1.d[0]
	ins	v0.d[1], v22.d[0]
	bic	v20.8b, v20.8b, v18.8b
	dup	d17, v17.d[0]
	dup	d7, v7.d[0]
	ins	v3.d[1], v24.d[0]
	not	v22.8b, v23.8b
	ins	v1.d[1], v19.d[0]
	fcvtzs	v9.2s, v9.2s
	dup	d2, v2.d[0]
	xtn	v0.4h, v0.4s
	xtn	v3.4h, v3.4s
	dup	d4, v4.d[0]
	ins	v17.d[1], v22.d[0]
	ins	v7.d[1], v20.d[0]
	ins	v2.d[1], v21.d[0]
	xtn	v1.4h, v1.4s
	dup	d3, v3.d[0]
	dup	d0, v0.d[0]
	dup	d16, v16.d[0]
	ins	v4.d[1], v9.d[0]
	xtn	v17.4h, v17.4s
	xtn	v7.4h, v7.4s
	xtn	v2.4h, v2.4s
	dup	d1, v1.d[0]
	ins	v16.d[1], v18.d[0]
	ins	v3.d[1], v17.d[0]
	xtn	v4.4h, v4.4s
	ins	v0.d[1], v7.d[0]
	dup	d2, v2.d[0]
	xtn	v16.4h, v16.4s
	ins	v1.d[1], v4.d[0]
	xtn	v3.8b, v3.8h
	xtn	v0.8b, v0.8h
	ins	v2.d[1], v16.d[0]
	xtn	v1.8b, v1.8h
	bic	v0.8b, v3.8b, v0.8b
	xtn	v2.8b, v2.8h
	bsl	v0.8b, v1.8b, v6.8b
	bit	v0.8b, v5.8b, v2.8b
	str	d0, [x2, x0]
	add	x0, x0, x3
	cmp	x3, x4
	beq	.L1576
.L1578:
	ldr	s0, [x27, x0, lsl 2]
	mov	w1, -1023541248
	fmov	s1, w1
	mov	w1, -127
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1580
	mov	w1, 1123942400
	fmov	s1, w1
	mov	w1, 127
	fcmpe	s0, s1
	bgt	.L1580
	fcvtzs	w1, s0
	sxtb	w1, w1
.L1580:
	add	x4, x0, 1
	strb	w1, [x2, x0]
	cmp	x19, x4
	bls	.L1576
	ldr	s0, [x27, x4, lsl 2]
	mov	w1, -1023541248
	fmov	s1, w1
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1702
	mov	w1, 1123942400
	fmov	s1, w1
	mov	w1, 127
	fcmpe	s0, s1
	bgt	.L1581
	fcvtzs	w1, s0
	sxtb	w1, w1
.L1581:
	add	x3, x0, 2
	strb	w1, [x2, x4]
	cmp	x19, x3
	bls	.L1576
	ldr	s0, [x27, x3, lsl 2]
	mov	w1, -1023541248
	fmov	s1, w1
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1704
	mov	w1, 1123942400
	fmov	s1, w1
	mov	w4, 127
	fcmpe	s0, s1
	bgt	.L1582
	fcvtzs	w1, s0
	sxtb	w4, w1
.L1582:
	add	x1, x0, 3
	strb	w4, [x2, x3]
	cmp	x19, x1
	bls	.L1576
	ldr	s0, [x27, x1, lsl 2]
	mov	w3, -1023541248
	fmov	s1, w3
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1706
	mov	w3, 1123942400
	fmov	s1, w3
	mov	w3, 127
	fcmpe	s0, s1
	bgt	.L1583
	fcvtzs	s0, s0
	umov	w3, v0.b[0]
	sxtb	w3, w3
.L1583:
	add	x4, x0, 4
	strb	w3, [x2, x1]
	cmp	x19, x4
	bls	.L1576
	ldr	s0, [x27, x4, lsl 2]
	mov	w1, -1023541248
	fmov	s1, w1
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1708
	mov	w1, 1123942400
	fmov	s1, w1
	mov	w1, 127
	fcmpe	s0, s1
	bgt	.L1584
	fcvtzs	w1, s0
	sxtb	w1, w1
.L1584:
	add	x3, x0, 5
	strb	w1, [x2, x4]
	cmp	x19, x3
	bls	.L1576
	ldr	s0, [x27, x3, lsl 2]
	mov	w1, -1023541248
	fmov	s1, w1
	fmul	s0, s8, s0
	fcmpe	s0, s1
	bmi	.L1710
	mov	w1, 1123942400
	fmov	s1, w1
	mov	w4, 127
	fcmpe	s0, s1
	bgt	.L1585
	fcvtzs	w1, s0
	sxtb	w4, w1
.L1585:
	add	x1, x0, 6
	strb	w4, [x2, x3]
	cmp	x19, x1
	bls	.L1576
	ldr	s1, [x27, x1, lsl 2]
	mov	w0, -1023541248
	fmov	s0, w0
	fmul	s8, s8, s1
	fcmpe	s8, s0
	bmi	.L1739
	mov	w0, 1123942400
	fmov	s0, w0
	mov	w0, 127
	fcmpe	s8, s0
	bgt	.L1588
	fcvtzs	w0, s8
	sxtb	w0, w0
.L1588:
	strb	w0, [x2, x1]
.L1576:
	adrp	x1, .LC24
	mov	x0, x21
	add	x1, x1, :lo12:.LC24
	mov	x2, 37
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	mov	x0, x21
	bl	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	ldr	x3, [sp, 168]
	add	x0, sp, 208
	add	x2, sp, 368
	str	wzr, [sp, 368]
	lsl	x1, x3, 5
	sub	x1, x1, x3
	add	x1, x3, x1, lsl 2
	lsl	x1, x1, 3
	bl	_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0
.LEHE84:
	ldr	x1, [sp, 152]
	add	x4, sp, 208
	ldr	x2, [sp, 168]
	mov	x0, x20
	mov	w3, 1000
.LEHB85:
	bl	_Z9train_ivfPKfmmiRSt6vectorIfSaIfEE
	ldr	x1, [sp, 152]
	add	x8, sp, 232
	ldr	x2, [sp, 168]
	add	x4, sp, 208
	mov	x0, x20
	mov	w3, 1000
	bl	_Z9build_ivfPKfmmiRKSt6vectorIfSaIfEE
.LEHE85:
	ldr	x1, [sp, 168]
	add	x0, sp, 256
	add	x2, sp, 368
	str	wzr, [sp, 368]
	lsr	x1, x1, 2
	lsl	x1, x1, 10
.LEHB86:
	bl	_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0
.LEHE86:
	ldr	x1, [sp, 152]
	add	x5, sp, 256
	ldr	x2, [sp, 168]
	mov	x0, x20
	mov	w4, 256
	mov	w3, 4
.LEHB87:
	bl	_Z8train_pqPKfmmiiRSt6vectorIfSaIfEE
	ldr	x24, [sp, 152]
	ldr	x22, [sp, 168]
	lsl	x23, x24, 2
	mov	x0, x23
	lsr	x19, x22, 2
	bl	_Znam
	str	x0, [sp, 128]
	cbz	x24, .L1599
	lsr	x7, x22, 4
	lsl	x13, x19, 8
	ldr	x5, [sp, 256]
	lsl	x7, x7, 2
	lsl	x12, x19, 2
	sub	x8, x19, #1
	and	x2, x22, -16
	mov	w0, 2139095039
	mov	x16, 0
	fmov	s6, w0
	mov	x15, 0
.L1600:
	ldr	x0, [sp, 128]
	add	x1, x20, x16, lsl 2
	mov	x6, x16
	mov	x11, 0
	add	x14, x0, x15
	mov	x10, 0
	.p2align 3,,7
.L1598:
	fmov	s5, s6
	mov	x3, x11
	mov	w9, 0
	mov	w4, 0
	.p2align 3,,7
.L1597:
	movi	v1.2s, #0
	cbz	x19, .L1591
	cmp	x8, 2
	bls	.L1714
	add	x17, x5, x3, lsl 2
	mov	x0, 0
	.p2align 3,,7
.L1593:
	ldr	q2, [x17, x0]
	ldr	q0, [x1, x0]
	add	x0, x0, 16
	fsub	v0.4s, v0.4s, v2.4s
	fmul	v0.4s, v0.4s, v0.4s
	dup	s4, v0.s[0]
	dup	s3, v0.s[1]
	dup	s2, v0.s[2]
	dup	s0, v0.s[3]
	fadd	s1, s1, s4
	fadd	s1, s3, s1
	fadd	s1, s2, s1
	fadd	s1, s1, s0
	cmp	x0, x2
	bne	.L1593
	mov	x0, x7
	cmp	x19, x7
	beq	.L1591
.L1592:
	add	x24, x0, x6
	add	x18, x0, x3
	add	x17, x0, 1
	ldr	s0, [x20, x24, lsl 2]
	ldr	s2, [x5, x18, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x19, x17
	bls	.L1591
	add	x18, x17, x6
	add	x17, x17, x3
	add	x0, x0, 2
	ldr	s0, [x20, x18, lsl 2]
	ldr	s2, [x5, x17, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
	cmp	x19, x0
	bls	.L1591
	add	x17, x6, x0
	add	x0, x3, x0
	ldr	s0, [x20, x17, lsl 2]
	ldr	s2, [x5, x0, lsl 2]
	fsub	s0, s0, s2
	fmadd	s1, s0, s0, s1
.L1591:
	fcmpe	s1, s5
	bmi	.L1740
.L1595:
	add	w4, w4, 1
	add	x3, x3, x19
	cmp	w4, 256
	bne	.L1597
	strb	w9, [x14, x10]
	add	x10, x10, 1
	add	x11, x11, x13
	add	x6, x6, x19
	add	x1, x1, x12
	cmp	x10, 4
	bne	.L1598
	add	x15, x15, 4
	add	x16, x16, x22
	cmp	x23, x15
	bne	.L1600
.L1599:
	adrp	x1, .LC25
	mov	x0, x21
	add	x1, x1, :lo12:.LC25
	mov	x2, 23
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x0, [x26, #:lo12:_ZSt4cerr]
	ldr	x0, [x0, -24]
	add	x0, x21, x0
	ldr	x19, [x0, 240]
	cbz	x19, .L1815
	ldrb	w0, [x19, 56]
	cbz	w0, .L1602
	ldrb	w1, [x19, 67]
.L1603:
	mov	x0, x21
	bl	_ZNSo3putEc
	bl	_ZNSo5flushEv
	ldp	x3, x1, [sp, 256]
	add	x0, sp, 280
	add	x2, sp, 368
	str	wzr, [sp, 368]
	sub	x1, x1, x3
	asr	x1, x1, 2
	bl	_ZNSt6vectorIfSaIfEEC2EmRKfRKS0_.constprop.0
.LEHE87:
	ldr	x4, [sp, 168]
	ldr	x7, [sp, 256]
	lsr	x4, x4, 2
	ldr	x5, [sp, 280]
	cbz	x4, .L1604
	add	x5, x5, 1024
	lsl	x9, x4, 10
	lsl	x6, x4, 2
	mov	x8, 0
.L1609:
	sub	x2, x5, #1024
	mov	x3, x7
	.p2align 3,,7
.L1607:
	mov	x0, 0
	.p2align 3,,7
.L1605:
	lsl	x1, x0, 10
	ldr	s0, [x3, x0, lsl 2]
	add	x0, x0, 1
	str	s0, [x2, x1]
	cmp	x4, x0
	bne	.L1605
	add	x2, x2, 4
	add	x3, x3, x6
	cmp	x5, x2
	bne	.L1607
	add	x8, x8, 256
	add	x5, x5, x9
	add	x7, x7, x9
	cmp	x8, 1024
	bne	.L1609
.L1604:
	ldr	x0, [sp, 144]
	cbz	x0, .L1612
	add	x22, sp, 376
	mov	x24, 0
	str	x28, [sp, 112]
	str	x28, [sp, 136]
.L1654:
	mov	x1, 0
	add	x0, sp, 176
	bl	gettimeofday
	ldr	x5, [sp, 168]
	add	x8, sp, 336
	ldr	x2, [sp, 128]
	add	x6, sp, 280
	mul	x4, x5, x24
	mov	x3, x20
	add	x1, sp, 232
	add	x0, sp, 208
	add	x4, x27, x4, lsl 2
.LEHB88:
	bl	_Z13ivf_pq_searchRKSt6vectorIfSaIfEERKS_I7IVFListSaIS4_EEPKhPKfSC_mmiiS3_m.constprop.0
.LEHE88:
	mov	x1, 0
	add	x0, sp, 192
	bl	gettimeofday
	mov	x23, 0
	ldp	x0, x3, [sp, 192]
	mov	x2, 16960
	movk	x2, 0xf, lsl 16
	mov	x4, 16960
	ldr	x1, [sp, 176]
	movk	x4, 0xf, lsl 16
	mov	x26, 0
	str	wzr, [sp, 376]
	mul	x0, x0, x2
	stp	xzr, x22, [sp, 384]
	msub	x1, x1, x4, x3
	ldr	x2, [sp, 184]
	stp	x22, xzr, [sp, 400]
	sub	x0, x0, x2
	add	x0, x0, x1
	str	x0, [sp, 120]
	.p2align 3,,7
.L1614:
	ldr	x0, [sp, 160]
	madd	x0, x24, x0, x23
	ldr	w21, [x25, x0, lsl 2]
	cbz	x26, .L1717
	mov	x19, x26
	.p2align 3,,7
.L1621:
	ldr	w0, [x19, 32]
	ldp	x1, x2, [x19, 16]
	cmp	w21, w0
	bcc	.L1618
.L1816:
	cbz	x2, .L1808
	mov	x19, x2
	ldr	w0, [x19, 32]
	ldp	x1, x2, [x19, 16]
	cmp	w21, w0
	bcs	.L1816
.L1618:
	cbz	x1, .L1617
	mov	x19, x1
	b	.L1621
.L1737:
	fmov	s0, s1
	b	.L1550
	.p2align 2,,3
.L1740:
	fmov	s5, s1
	mov	w9, w4
	b	.L1595
.L1717:
	mov	x19, x22
.L1617:
	ldr	x0, [sp, 392]
	cmp	x0, x19
	beq	.L1682
	mov	x0, x19
	bl	_ZSt18_Rb_tree_decrementPSt18_Rb_tree_node_base
	ldr	w0, [x0, 32]
	cmp	w21, w0
.L1808:
	bls	.L1622
.L1682:
	mov	w26, 1
	cmp	x19, x22
	bne	.L1817
.L1623:
	mov	x0, 40
.LEHB89:
	bl	_Znwm
.LEHE89:
	mov	x1, x0
	mov	x2, x19
	mov	w0, w26
	mov	x3, x22
	str	w21, [x1, 32]
	bl	_ZSt29_Rb_tree_insert_and_rebalancebPSt18_Rb_tree_node_baseS0_RS_
	ldr	x0, [sp, 408]
	ldr	x26, [sp, 384]
	add	x0, x0, 1
	str	x0, [sp, 408]
.L1622:
	add	x23, x23, 1
	cmp	x23, 10
	bne	.L1614
	ldp	x0, x6, [sp, 336]
	mov	x8, 0
	cmp	x6, x0
	beq	.L1818
	.p2align 3,,7
.L1615:
	ldr	w5, [x0, 4]
	cbz	x26, .L1625
	mov	x2, x26
	mov	x7, x22
	.p2align 3,,7
.L1629:
	ldr	w1, [x2, 32]
	ldp	x3, x4, [x2, 16]
	cmp	w5, w1
	bls	.L1626
.L1819:
	cbz	x4, .L1627
	mov	x2, x4
	ldr	w1, [x2, 32]
	ldp	x3, x4, [x2, 16]
	cmp	w5, w1
	bhi	.L1819
.L1626:
	mov	x7, x2
	cbz	x3, .L1627
	mov	x2, x3
	b	.L1629
	.p2align 2,,3
.L1627:
	cmp	x7, x22
	beq	.L1625
	ldr	w1, [x7, 32]
	cmp	w5, w1
	cinc	x8, x8, cs
.L1625:
	sub	x1, x6, x0
	sub	x6, x6, #8
	cmp	x1, 8
	bgt	.L1820
.L1631:
	str	x6, [sp, 344]
	cmp	x0, x6
	bne	.L1615
	ucvtf	s0, x8
	fmov	s1, 1.0e+1
	ldp	x1, x2, [sp, 112]
	str	x2, [x1, 8]
	fdiv	s0, s0, s1
	str	s0, [x1]
	cbz	x26, .L1681
.L1650:
	ldr	x0, [x26, 24]
	bl	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	mov	x0, x26
	mov	x1, 40
	ldr	x26, [x26, 16]
	bl	_ZdlPvm
	cbnz	x26, .L1650
	ldr	x0, [sp, 336]
.L1649:
	cbnz	x0, .L1681
	ldr	x1, [sp, 112]
	add	x24, x24, 1
	ldr	x0, [sp, 144]
	add	x1, x1, 16
	str	x1, [sp, 112]
	cmp	x0, x24
	bhi	.L1654
.L1652:
	cbz	x0, .L1612
	movi	v8.2s, #0
	add	x0, x28, x0, lsl 4
	fmov	s9, s8
.L1655:
	ldr	x2, [sp, 136]
	add	x2, x2, 16
	ldr	x1, [x2, -8]
	ldr	s1, [x2, -16]
	scvtf	s0, x1
	str	x2, [sp, 136]
	fadd	s9, s9, s1
	fadd	s8, s8, s0
	cmp	x0, x2
	bne	.L1655
.L1611:
	adrp	x19, _ZSt4cout
	add	x19, x19, :lo12:_ZSt4cout
	adrp	x1, .LC26
	mov	x0, x19
	add	x1, x1, :lo12:.LC26
	mov	x2, 16
.LEHB90:
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [sp, 144]
	mov	x0, x19
	ucvtf	s0, x1
	fdiv	s0, s9, s0
	fcvt	d0, s0
	bl	_ZNSo9_M_insertIdEERSoT_
	adrp	x20, .LC14
	add	x20, x20, :lo12:.LC14
	mov	x1, x20
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	adrp	x1, .LC27
	mov	x0, x19
	add	x1, x1, :lo12:.LC27
	mov	x2, 22
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	ldr	x1, [sp, 144]
	mov	x0, x19
	ucvtf	s0, x1
	fdiv	s0, s8, s0
	fcvt	d0, s0
	bl	_ZNSo9_M_insertIdEERSoT_
	mov	x1, x20
	mov	x2, 1
	bl	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.LEHE90:
	ldr	x0, [sp, 280]
	cbz	x0, .L1656
	ldr	x1, [sp, 296]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L1656:
	ldr	x0, [sp, 256]
	cbz	x0, .L1657
	ldr	x1, [sp, 272]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L1657:
	add	x0, sp, 232
	bl	_ZNSt6vectorI7IVFListSaIS0_EED1Ev
	ldr	x0, [sp, 208]
	cbz	x0, .L1658
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L1658:
	mov	x1, 28928
	mov	x0, x28
	movk	x1, 0x2, lsl 16
	bl	_ZdlPvm
	ldr	x0, [sp, 304]
	add	x1, sp, 320
	cmp	x0, x1
	beq	.L1757
	ldr	x1, [sp, 320]
	add	x1, x1, 1
	bl	_ZdlPvm
.L1757:
	mov	w0, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 416
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L1714:
	.cfi_restore_state
	mov	x0, 0
	b	.L1592
.L1820:
	sub	x2, x6, x0
	ldr	s0, [x0]
	ldr	w11, [x6, 4]
	asr	x12, x2, 3
	str	w5, [x6, 4]
	sub	x1, x12, #1
	ldr	s2, [x6]
	str	s0, [x6]
	and	x13, x12, 1
	add	x10, x1, x1, lsr 63
	asr	x10, x10, 1
	cmp	x2, 16
	ble	.L1632
	mov	x1, 0
	b	.L1637
.L1722:
	mov	w2, w4
.L1635:
	lsl	x1, x1, 3
	add	x4, x0, x1
	str	s0, [x0, x1]
	str	w2, [x4, 4]
	cmp	x10, x3
	ble	.L1636
.L1821:
	mov	x1, x3
.L1637:
	add	x2, x1, 1
	lsl	x5, x2, 1
	lsl	x2, x2, 4
	sub	x3, x5, #1
	add	x9, x0, x2
	lsl	x4, x3, 3
	ldr	s1, [x0, x2]
	add	x7, x0, x4
	ldr	s0, [x0, x4]
	fcmpe	s0, s1
	bgt	.L1741
	ldr	w2, [x9, 4]
	bmi	.L1721
	ldr	w4, [x7, 4]
	cmp	w4, w2
	bgt	.L1722
.L1721:
	fmov	s0, s1
	lsl	x1, x1, 3
	add	x4, x0, x1
	mov	x3, x5
	mov	x7, x9
	str	s0, [x0, x1]
	str	w2, [x4, 4]
	cmp	x10, x3
	bgt	.L1821
.L1636:
	lsl	x4, x3, 3
	cbnz	x13, .L1640
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x3, x12, asr 1
	beq	.L1639
	sub	x1, x3, #1
	lsl	x4, x3, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L1646:
	lsl	x2, x1, 3
	add	x5, x0, x2
	ldr	s0, [x0, x2]
	fcmpe	s0, s2
	bmi	.L1642
	bgt	.L1809
	ldr	w7, [x5, 4]
	cmp	w11, w7
	ble	.L1809
.L1645:
	add	x9, x0, x4
	sub	x2, x1, #1
	str	s0, [x0, x4]
	mov	x3, x1
	add	x2, x2, x2, lsr 63
	str	w7, [x9, 4]
	asr	x1, x2, 1
	cbz	x3, .L1638
	lsl	x4, x3, 3
	b	.L1646
	.p2align 2,,3
.L1741:
	ldr	w2, [x7, 4]
	b	.L1635
.L1809:
	add	x5, x0, x4
.L1638:
	str	s2, [x5]
	str	w11, [x5, 4]
	b	.L1631
.L1642:
	ldr	w7, [x5, 4]
	b	.L1645
.L1632:
	mov	x5, x0
	cbnz	x13, .L1638
	cmp	x1, 2
	bhi	.L1638
	mov	x7, x0
	mov	x3, 0
.L1639:
	lsl	x3, x3, 1
	add	x3, x3, 1
	lsl	x4, x3, 3
	add	x1, x0, x4
	ldr	s0, [x0, x4]
	ldr	w1, [x1, 4]
	str	w1, [x7, 4]
	str	s0, [x7]
.L1640:
	sub	x3, x3, #1
	asr	x1, x3, 1
	b	.L1646
.L1817:
	ldr	w0, [x19, 32]
	cmp	w21, w0
	cset	w26, cc
	b	.L1623
.L1681:
	ldr	x2, [sp, 112]
	add	x24, x24, 1
	ldr	x1, [sp, 352]
	add	x2, x2, 16
	str	x2, [sp, 112]
	sub	x1, x1, x0
	bl	_ZdlPvm
	ldr	x0, [sp, 144]
	cmp	x0, x24
	bhi	.L1654
	b	.L1652
.L1818:
	ldp	x1, x2, [sp, 112]
	str	wzr, [x1]
	str	x2, [x1, 8]
	cbnz	x26, .L1650
	b	.L1649
.L1702:
	mov	w1, -127
	b	.L1581
.L1688:
	mov	w2, -127
	b	.L1563
.L1692:
	mov	w2, -127
	b	.L1565
.L1690:
	mov	w2, -127
	b	.L1564
.L1706:
	mov	w3, -127
	b	.L1583
.L1704:
	mov	w4, -127
	b	.L1582
.L1602:
	mov	x0, x19
.LEHB91:
	bl	_ZNKSt5ctypeIcE13_M_widen_initEv
	ldr	x1, [x19]
	adrp	x0, _ZNKSt5ctypeIcE8do_widenEc
	add	x0, x0, :lo12:_ZNKSt5ctypeIcE8do_widenEc
	ldr	x2, [x1, 48]
	cmp	x2, x0
	bne	.L1822
	mov	w1, 10
	b	.L1603
.L1696:
	mov	w2, -127
	b	.L1567
.L1694:
	mov	w2, -127
	b	.L1566
.L1710:
	mov	w4, -127
	b	.L1585
.L1708:
	mov	w1, -127
	b	.L1584
.L1612:
	movi	v8.2s, #0
	fmov	s9, s8
	b	.L1611
.L1685:
	mov	x0, 0
	b	.L1555
.L1699:
	mov	x0, 0
	b	.L1573
.L1738:
	mov	w2, -127
	strb	w2, [x1, x0]
	b	.L1558
.L1739:
	mov	w0, -127
	strb	w0, [x2, x1]
	b	.L1576
.L1822:
	mov	x0, x19
	mov	w1, 10
	blr	x2
	and	w1, w0, 255
	b	.L1603
.L1815:
	bl	_ZSt16__throw_bad_castv
.LEHE91:
.L1735:
	mov	x19, x0
.L1669:
	ldr	x0, [sp, 280]
	ldr	x1, [sp, 296]
	sub	x1, x1, x0
	cbz	x0, .L1671
	bl	_ZdlPvm
.L1671:
	ldr	x0, [sp, 256]
	ldr	x1, [sp, 272]
	sub	x1, x1, x0
	cbnz	x0, .L1823
.L1673:
	add	x0, sp, 232
	bl	_ZNSt6vectorI7IVFListSaIS0_EED1Ev
.L1674:
	ldr	x0, [sp, 208]
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	cbz	x0, .L1676
	bl	_ZdlPvm
.L1676:
	mov	x1, 28928
	mov	x0, x28
	movk	x1, 0x2, lsl 16
	bl	_ZdlPvm
.L1662:
	ldr	x0, [sp, 304]
	add	x1, sp, 320
	cmp	x0, x1
	beq	.L1678
	ldr	x1, [sp, 320]
	add	x1, x1, 1
	bl	_ZdlPvm
.L1678:
	mov	x0, x19
.LEHB92:
	bl	_Unwind_Resume
.LEHE92:
.L1727:
.L1813:
	ldr	x2, [sp, 368]
	add	x1, sp, 384
	mov	x19, x0
	cmp	x2, x1
	beq	.L1662
	ldr	x1, [sp, 384]
	mov	x0, x2
	add	x1, x1, 1
	bl	_ZdlPvm
	b	.L1662
.L1726:
	mov	x19, x0
	b	.L1662
.L1823:
	bl	_ZdlPvm
	b	.L1673
.L1736:
	mov	x19, x0
	b	.L1662
.L1730:
	mov	x19, x0
	b	.L1676
.L1733:
	mov	x19, x0
	b	.L1671
.L1732:
	mov	x19, x0
	b	.L1673
.L1734:
	mov	x19, x0
	ldr	x0, [sp, 384]
	bl	_ZNSt8_Rb_treeIjjSt9_IdentityIjESt4lessIjESaIjEE8_M_eraseEPSt13_Rb_tree_nodeIjE.isra.0
	ldr	x0, [sp, 336]
	ldr	x1, [sp, 352]
	sub	x1, x1, x0
	cbz	x0, .L1669
	bl	_ZdlPvm
	b	.L1669
.L1731:
	mov	x19, x0
	b	.L1674
.L1729:
	b	.L1813
.L1728:
	b	.L1813
	.cfi_endproc
.LFE10608:
	.section	.gcc_except_table
.LLSDA10608:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE10608-.LLSDACSB10608
.LLSDACSB10608:
	.uleb128 .LEHB77-.LFB10608
	.uleb128 .LEHE77-.LEHB77
	.uleb128 .L1726-.LFB10608
	.uleb128 0
	.uleb128 .LEHB78-.LFB10608
	.uleb128 .LEHE78-.LEHB78
	.uleb128 .L1727-.LFB10608
	.uleb128 0
	.uleb128 .LEHB79-.LFB10608
	.uleb128 .LEHE79-.LEHB79
	.uleb128 .L1726-.LFB10608
	.uleb128 0
	.uleb128 .LEHB80-.LFB10608
	.uleb128 .LEHE80-.LEHB80
	.uleb128 .L1728-.LFB10608
	.uleb128 0
	.uleb128 .LEHB81-.LFB10608
	.uleb128 .LEHE81-.LEHB81
	.uleb128 .L1726-.LFB10608
	.uleb128 0
	.uleb128 .LEHB82-.LFB10608
	.uleb128 .LEHE82-.LEHB82
	.uleb128 .L1729-.LFB10608
	.uleb128 0
	.uleb128 .LEHB83-.LFB10608
	.uleb128 .LEHE83-.LEHB83
	.uleb128 .L1736-.LFB10608
	.uleb128 0
	.uleb128 .LEHB84-.LFB10608
	.uleb128 .LEHE84-.LEHB84
	.uleb128 .L1730-.LFB10608
	.uleb128 0
	.uleb128 .LEHB85-.LFB10608
	.uleb128 .LEHE85-.LEHB85
	.uleb128 .L1731-.LFB10608
	.uleb128 0
	.uleb128 .LEHB86-.LFB10608
	.uleb128 .LEHE86-.LEHB86
	.uleb128 .L1732-.LFB10608
	.uleb128 0
	.uleb128 .LEHB87-.LFB10608
	.uleb128 .LEHE87-.LEHB87
	.uleb128 .L1733-.LFB10608
	.uleb128 0
	.uleb128 .LEHB88-.LFB10608
	.uleb128 .LEHE88-.LEHB88
	.uleb128 .L1735-.LFB10608
	.uleb128 0
	.uleb128 .LEHB89-.LFB10608
	.uleb128 .LEHE89-.LEHB89
	.uleb128 .L1734-.LFB10608
	.uleb128 0
	.uleb128 .LEHB90-.LFB10608
	.uleb128 .LEHE90-.LEHB90
	.uleb128 .L1735-.LFB10608
	.uleb128 0
	.uleb128 .LEHB91-.LFB10608
	.uleb128 .LEHE91-.LEHB91
	.uleb128 .L1733-.LFB10608
	.uleb128 0
	.uleb128 .LEHB92-.LFB10608
	.uleb128 .LEHE92-.LEHB92
	.uleb128 0
	.uleb128 0
.LLSDACSE10608:
	.section	.text.startup
	.size	main, .-main
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj,"axG",@progbits,_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj
	.type	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj, %function
_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj:
.LFB12482:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	ldr	w7, [x2]
	ldr	x1, [x0, 8]
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	uxtw	x0, w7
	udiv	x3, x0, x1
	ldr	x9, [x19]
	msub	x3, x3, x1, x0
	ldr	x6, [x9, x3, lsl 3]
	cbz	x6, .L1835
	ldr	x0, [x6]
	mov	x8, x6
	ldr	w2, [x0, 8]
.L1827:
	cmp	w7, w2
	ldr	x2, [x0]
	beq	.L1826
	mov	x8, x0
	mov	x0, x2
	cbz	x2, .L1835
	ldr	w2, [x2, 8]
	uxtw	x5, w2
	udiv	x4, x5, x1
	msub	x4, x4, x1, x5
	cmp	x4, x3
	beq	.L1827
.L1835:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1826:
	.cfi_restore_state
	cmp	x6, x8
	beq	.L1842
	cbz	x2, .L1829
	ldr	w5, [x2, 8]
	udiv	x4, x5, x1
	msub	x1, x4, x1, x5
	cmp	x3, x1
	beq	.L1829
	str	x8, [x9, x1, lsl 3]
	ldr	x2, [x0]
.L1829:
	str	x2, [x8]
	mov	x1, 16
	bl	_ZdlPvm
	ldr	x1, [x19, 24]
	mov	x0, 1
	sub	x1, x1, #1
	str	x1, [x19, 24]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1842:
	.cfi_restore_state
	cbz	x2, .L1836
	ldr	w5, [x2, 8]
	udiv	x4, x5, x1
	msub	x1, x4, x1, x5
	cmp	x3, x1
	beq	.L1829
	str	x8, [x9, x1, lsl 3]
	ldr	x1, [x9, x3, lsl 3]
.L1828:
	add	x4, x19, 16
	cmp	x1, x4
	beq	.L1843
.L1830:
	str	xzr, [x9, x3, lsl 3]
	ldr	x2, [x0]
	b	.L1829
	.p2align 2,,3
.L1836:
	mov	x1, x8
	b	.L1828
	.p2align 2,,3
.L1843:
	str	x2, [x19, 16]
	b	.L1830
	.cfi_endproc
.LFE12482:
	.size	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj, .-_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj
	.section	.text._ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_,"axG",@progbits,_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_
	.type	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_, %function
_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_:
.LFB12483:
	.cfi_startproc
	ldr	x5, [x2]
	ldr	x2, [x0, 8]
	ldr	x8, [x0]
	udiv	x3, x5, x2
	msub	x3, x3, x2, x5
	ldr	x6, [x8, x3, lsl 3]
	cbz	x6, .L1853
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x7, x6
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldr	x0, [x6]
	ldr	x1, [x0, 8]
.L1847:
	cmp	x5, x1
	ldr	x1, [x0]
	beq	.L1846
	mov	x7, x0
	mov	x0, x1
	cbz	x1, .L1855
	ldr	x1, [x1, 8]
	udiv	x4, x1, x2
	msub	x4, x4, x2, x1
	cmp	x4, x3
	beq	.L1847
.L1855:
	mov	x0, 0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1846:
	.cfi_restore_state
	cmp	x6, x7
	beq	.L1865
	cbz	x1, .L1849
	ldr	x5, [x1, 8]
	udiv	x4, x5, x2
	msub	x2, x4, x2, x5
	cmp	x3, x2
	beq	.L1849
	str	x7, [x8, x2, lsl 3]
	ldr	x1, [x0]
.L1849:
	str	x1, [x7]
	mov	x1, 24
	bl	_ZdlPvm
	ldr	x1, [x19, 24]
	mov	x0, 1
	sub	x1, x1, #1
	str	x1, [x19, 24]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1865:
	.cfi_restore_state
	cbz	x1, .L1856
	ldr	x5, [x1, 8]
	udiv	x4, x5, x2
	msub	x2, x4, x2, x5
	cmp	x3, x2
	beq	.L1849
	str	x7, [x8, x2, lsl 3]
	ldr	x2, [x8, x3, lsl 3]
.L1848:
	add	x4, x19, 16
	cmp	x2, x4
	beq	.L1866
.L1850:
	str	xzr, [x8, x3, lsl 3]
	ldr	x1, [x0]
	b	.L1849
	.p2align 2,,3
.L1853:
	.cfi_def_cfa_offset 0
	.cfi_restore 19
	.cfi_restore 29
	.cfi_restore 30
	mov	x0, 0
	ret
	.p2align 2,,3
.L1856:
	.cfi_def_cfa_offset 32
	.cfi_offset 19, -16
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, x7
	b	.L1848
	.p2align 2,,3
.L1866:
	str	x1, [x19, 16]
	b	.L1850
	.cfi_endproc
.LFE12483:
	.size	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_, .-_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_
	.section	.text._ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,"axG",@progbits,_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.type	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, %function
_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_:
.LFB12753:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x25, x22, [x0]
	stp	x19, x20, [sp, 16]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x24, x1
	mov	x1, 2305843009213693951
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	sub	x3, x22, x25
	asr	x3, x3, 2
	cmp	x3, x1
	beq	.L1886
	cmp	x3, 0
	mov	x20, x0
	csinc	x0, x3, xzr, ne
	mov	x27, x2
	sub	x26, x24, x25
	adds	x3, x3, x0
	bcs	.L1880
	cbnz	x3, .L1872
	mov	x19, 0
	mov	x21, 0
.L1878:
	ldr	w0, [x27]
	add	x23, x26, 4
	sub	x22, x22, x24
	add	x23, x21, x23
	str	w0, [x21, x26]
	add	x27, x23, x22
	ldr	x28, [x20, 16]
	cmp	x26, 0
	bgt	.L1887
	cmp	x22, 0
	bgt	.L1876
	cbnz	x25, .L1888
.L1877:
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	stp	x21, x27, [x20]
	str	x19, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1876:
	.cfi_restore_state
	mov	x2, x22
	mov	x1, x24
	mov	x0, x23
	bl	memcpy
	cbz	x25, .L1877
.L1888:
	sub	x1, x28, x25
	b	.L1879
	.p2align 2,,3
.L1872:
	cmp	x3, x1
	csel	x3, x3, x1, ls
	lsl	x19, x3, 2
.L1871:
	mov	x0, x19
	bl	_Znwm
	mov	x21, x0
	add	x19, x0, x19
	b	.L1878
	.p2align 2,,3
.L1887:
	mov	x1, x25
	mov	x2, x26
	mov	x0, x21
	bl	memmove
	sub	x1, x28, x25
	cmp	x22, 0
	bgt	.L1876
.L1879:
	mov	x0, x25
	bl	_ZdlPvm
	b	.L1877
	.p2align 2,,3
.L1880:
	mov	x19, 9223372036854775804
	b	.L1871
.L1886:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE12753:
	.size	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_, .-_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
	.section	.text._ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_,"axG",@progbits,_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_
	.type	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_, %function
_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_:
.LFB12779:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12779
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
	cmp	x1, 1
	beq	.L1911
	mov	x20, x2
	mov	x0, 1152921504606846975
	cmp	x1, x0
	bhi	.L1912
	lsl	x22, x1, 3
	mov	x0, x22
.LEHB93:
	bl	_Znwm
	mov	x20, x0
	mov	x2, x22
	mov	w1, 0
	bl	memset
	add	x8, x21, 48
.L1891:
	ldr	x4, [x21, 16]
	str	xzr, [x21, 16]
	cbz	x4, .L1894
	add	x7, x21, 16
	mov	x6, 0
	.p2align 3,,7
.L1895:
	ldr	x5, [x4, 8]
	mov	x3, x4
	ldr	x4, [x4]
	udiv	x2, x5, x19
	msub	x2, x2, x19, x5
	ldr	x1, [x20, x2, lsl 3]
	cbz	x1, .L1913
	ldr	x0, [x1]
	str	x0, [x3]
	ldr	x0, [x20, x2, lsl 3]
	str	x3, [x0]
	cbnz	x4, .L1895
.L1894:
	ldp	x0, x1, [x21]
	cmp	x0, x8
	beq	.L1898
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L1898:
	stp	x20, x19, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1913:
	.cfi_restore_state
	ldr	x0, [x21, 16]
	str	x0, [x3]
	str	x3, [x21, 16]
	str	x7, [x20, x2, lsl 3]
	ldr	x0, [x3]
	cbz	x0, .L1900
	str	x3, [x20, x6, lsl 3]
	mov	x6, x2
	cbnz	x4, .L1895
	b	.L1894
	.p2align 2,,3
.L1900:
	mov	x6, x2
	cbnz	x4, .L1895
	b	.L1894
	.p2align 2,,3
.L1911:
	mov	x20, x0
	str	xzr, [x20, 48]!
	mov	x8, x20
	b	.L1891
.L1912:
	bl	_ZSt17__throw_bad_allocv
.LEHE93:
.L1902:
	bl	__cxa_begin_catch
	ldr	x0, [x20]
	str	x0, [x21, 40]
.LEHB94:
	bl	__cxa_rethrow
.LEHE94:
.L1901:
	mov	x19, x0
	bl	__cxa_end_catch
	mov	x0, x19
.LEHB95:
	bl	_Unwind_Resume
.LEHE95:
	.cfi_endproc
.LFE12779:
	.section	.gcc_except_table
	.align	2
.LLSDA12779:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT12779-.LLSDATTD12779
.LLSDATTD12779:
	.byte	0x1
	.uleb128 .LLSDACSE12779-.LLSDACSB12779
.LLSDACSB12779:
	.uleb128 .LEHB93-.LFB12779
	.uleb128 .LEHE93-.LEHB93
	.uleb128 .L1902-.LFB12779
	.uleb128 0x1
	.uleb128 .LEHB94-.LFB12779
	.uleb128 .LEHE94-.LEHB94
	.uleb128 .L1901-.LFB12779
	.uleb128 0
	.uleb128 .LEHB95-.LFB12779
	.uleb128 .LEHE95-.LEHB95
	.uleb128 0
	.uleb128 0
.LLSDACSE12779:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT12779:
	.section	.text._ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_,"axG",@progbits,_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_,comdat
	.size	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_, .-_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_
	.section	.text._ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_,"axG",@progbits,_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_
	.type	_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_, %function
_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_:
.LFB12088:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12088
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	ldr	x21, [x1]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x20, x0
	ldr	x5, [x0, 8]
	str	x23, [sp, 48]
	.cfi_offset 23, -32
	mov	x23, x1
	ldr	x1, [x0]
	udiv	x0, x21, x5
	msub	x0, x0, x5, x21
	lsl	x22, x0, 3
	ldr	x1, [x1, x0, lsl 3]
	cbz	x1, .L1915
	ldr	x2, [x1]
	ldr	x3, [x2, 8]
.L1917:
	cmp	x21, x3
	beq	.L1916
	ldr	x2, [x2]
	cbz	x2, .L1915
	ldr	x3, [x2, 8]
	udiv	x4, x3, x5
	msub	x4, x4, x5, x3
	cmp	x0, x4
	beq	.L1917
.L1915:
	mov	x0, 24
.LEHB96:
	bl	_Znwm
.LEHE96:
	ldr	x4, [x23]
	mov	x19, x0
	ldr	x1, [x20, 8]
	add	x0, x20, 32
	ldr	x2, [x20, 24]
	mov	x3, 1
	ldr	x5, [x20, 40]
	stp	xzr, x4, [x19]
	str	wzr, [x19, 16]
	str	x5, [sp, 72]
.LEHB97:
	bl	_ZNKSt8__detail20_Prime_rehash_policy14_M_need_rehashEmmm
	tst	w0, 255
	bne	.L1939
.L1918:
	ldr	x0, [x20]
	add	x2, x0, x22
	ldr	x1, [x0, x22]
	cbz	x1, .L1919
	ldr	x1, [x1]
	str	x1, [x19]
	ldr	x0, [x0, x22]
	str	x19, [x0]
.L1920:
	ldr	x1, [x20, 24]
	add	x0, x19, 16
	ldp	x21, x22, [sp, 32]
	add	x1, x1, 1
	str	x1, [x20, 24]
	ldp	x19, x20, [sp, 16]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1916:
	.cfi_restore_state
	add	x0, x2, 16
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1939:
	.cfi_restore_state
	add	x2, sp, 72
	mov	x0, x20
	bl	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE9_M_rehashEmRS1_
.LEHE97:
	ldr	x0, [x20, 8]
	udiv	x22, x21, x0
	msub	x22, x22, x0, x21
	lsl	x22, x22, 3
	b	.L1918
	.p2align 2,,3
.L1919:
	ldr	x1, [x20, 16]
	str	x1, [x19]
	str	x19, [x20, 16]
	cbz	x1, .L1921
	ldr	x4, [x1, 8]
	ldr	x3, [x20, 8]
	udiv	x1, x4, x3
	msub	x1, x1, x3, x4
	str	x19, [x0, x1, lsl 3]
.L1921:
	add	x0, x20, 16
	str	x0, [x2]
	b	.L1920
.L1924:
	mov	x1, 24
	mov	x20, x0
	mov	x0, x19
	bl	_ZdlPvm
	mov	x0, x20
.LEHB98:
	bl	_Unwind_Resume
.LEHE98:
	.cfi_endproc
.LFE12088:
	.section	.gcc_except_table
.LLSDA12088:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12088-.LLSDACSB12088
.LLSDACSB12088:
	.uleb128 .LEHB96-.LFB12088
	.uleb128 .LEHE96-.LEHB96
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB97-.LFB12088
	.uleb128 .LEHE97-.LEHB97
	.uleb128 .L1924-.LFB12088
	.uleb128 0
	.uleb128 .LEHB98-.LFB12088
	.uleb128 .LEHE98-.LEHB98
	.uleb128 0
	.uleb128 0
.LLSDACSE12088:
	.section	.text._ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_,"axG",@progbits,_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_,comdat
	.size	_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_, .-_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_
	.section	.text._ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB12816:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x1
	mov	x1, 1152921504606846975
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x24, x25, [x0]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	sub	x4, x25, x24
	asr	x4, x4, 3
	cmp	x4, x1
	beq	.L1958
	cmp	x4, 0
	mov	x21, x0
	csinc	x0, x4, xzr, ne
	mov	x26, x2
	mov	x27, x3
	sub	x28, x23, x24
	adds	x4, x4, x0
	bcs	.L1951
	cbnz	x4, .L1945
	mov	x19, 8
	mov	x20, 0
	mov	x22, 0
.L1950:
	ldr	s0, [x26]
	add	x6, x22, x28
	ldr	w0, [x27]
	str	s0, [x22, x28]
	str	w0, [x6, 4]
	cmp	x23, x24
	beq	.L1946
	mov	x3, x22
	mov	x4, x24
	.p2align 3,,7
.L1947:
	ldr	x5, [x4], 8
	str	x5, [x3], 8
	cmp	x3, x6
	bne	.L1947
	add	x19, x3, 8
.L1946:
	cmp	x23, x25
	beq	.L1948
	sub	x2, x25, x23
	mov	x0, x19
	mov	x1, x23
	add	x19, x19, x2
	bl	memcpy
.L1948:
	cbz	x24, .L1949
	ldr	x1, [x21, 16]
	mov	x0, x24
	sub	x1, x1, x24
	bl	_ZdlPvm
.L1949:
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	stp	x22, x19, [x21]
	str	x20, [x21, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1945:
	.cfi_restore_state
	cmp	x4, x1
	csel	x4, x4, x1, ls
	lsl	x20, x4, 3
.L1944:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x20, x0, x20
	add	x19, x0, 8
	b	.L1950
	.p2align 2,,3
.L1951:
	mov	x20, 9223372036854775800
	b	.L1944
.L1958:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE12816:
	.size	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB12822:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x25, x26, [x0]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x1
	sub	x3, x26, x25
	str	x27, [sp, 80]
	.cfi_offset 27, -16
	mov	x1, 1152921504606846975
	asr	x3, x3, 3
	cmp	x3, x1
	beq	.L1977
	cmp	x3, 0
	mov	x22, x0
	csinc	x0, x3, xzr, ne
	mov	x27, x2
	sub	x21, x23, x25
	adds	x3, x3, x0
	bcs	.L1970
	cbnz	x3, .L1964
	mov	x19, 8
	mov	x20, 0
	mov	x24, 0
.L1969:
	ldr	x0, [x27]
	str	x0, [x24, x21]
	cmp	x23, x25
	beq	.L1965
	add	x6, x24, x21
	mov	x3, x24
	mov	x4, x25
	.p2align 3,,7
.L1966:
	ldr	x5, [x4], 8
	str	x5, [x3], 8
	cmp	x3, x6
	bne	.L1966
	add	x19, x3, 8
.L1965:
	cmp	x23, x26
	beq	.L1967
	sub	x2, x26, x23
	mov	x0, x19
	mov	x1, x23
	add	x19, x19, x2
	bl	memcpy
.L1967:
	cbz	x25, .L1968
	ldr	x1, [x22, 16]
	mov	x0, x25
	sub	x1, x1, x25
	bl	_ZdlPvm
.L1968:
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	stp	x24, x19, [x22]
	str	x20, [x22, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L1964:
	.cfi_restore_state
	cmp	x3, x1
	csel	x3, x3, x1, ls
	lsl	x20, x3, 3
.L1963:
	mov	x0, x20
	bl	_Znwm
	mov	x24, x0
	add	x20, x0, x20
	add	x19, x0, 8
	b	.L1969
	.p2align 2,,3
.L1970:
	mov	x20, 9223372036854775800
	b	.L1963
.L1977:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE12822:
	.size	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm
	.type	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm, %function
_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm:
.LFB12128:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12128
	stp	x29, x30, [sp, -208]!
	.cfi_def_cfa_offset 208
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	mov	x19, x0
	ldp	x20, x0, [x1]
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -144
	.cfi_offset 26, -136
	mov	x26, x1
	str	x2, [sp, 112]
	sub	x1, x0, x20
	cmp	x2, x1, asr 3
	bhi	.L1978
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -168
	.cfi_offset 21, -176
	mov	x25, 1
	mov	x21, 0
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -152
	.cfi_offset 23, -160
	mov	x22, 1152921504606846975
	mov	x23, 0
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -120
	.cfi_offset 27, -128
	mov	x27, 0
	stp	xzr, xzr, [sp, 176]
	str	xzr, [sp, 192]
	cmp	x20, x0
	beq	.L2130
	str	d8, [sp, 96]
	.cfi_offset 72, -112
	.p2align 3,,7
.L1980:
	ldr	s8, [x20]
	sub	x28, x27, x21
	mov	x24, x28
	fneg	s8, s8
	cmp	x27, x23
	beq	.L1984
	ldr	w5, [x20, 4]
	add	x23, x23, 8
	str	s8, [x23, -8]
	str	w5, [x23, -4]
	sub	x2, x23, x21
	sub	x3, x2, #8
	asr	x2, x2, 3
	add	x3, x21, x3
	sub	x20, x2, #2
	sub	x2, x2, #1
	add	x20, x20, x20, lsr 63
	asr	x20, x20, 1
.L1985:
	cmp	x2, 0
	ble	.L1994
.L2001:
	lsl	x0, x20, 3
	add	x3, x21, x0
	ldr	s0, [x21, x0]
	fcmpe	s0, s8
	bmi	.L1995
	bgt	.L2126
	ldr	w4, [x3, 4]
	cmp	w4, w5
	bcc	.L1998
.L2126:
	add	x3, x21, x2, lsl 3
.L1994:
	ldp	x20, x0, [x26]
	str	s8, [x3]
	str	w5, [x3, 4]
	sub	x1, x0, x20
	sub	x6, x0, #8
	cmp	x1, 8
	bgt	.L2131
.L2000:
	str	x6, [x26, 8]
	cmp	x20, x6
	bne	.L1980
	ldr	x22, [sp, 184]
	cmp	x21, x23
	beq	.L2129
	sub	x25, x27, x21
	.p2align 3,,7
.L1982:
	ldr	x20, [sp, 176]
	ldr	x1, [sp, 112]
	sub	x0, x22, x20
	cmp	x1, x0, asr 3
	bls	.L1983
	ldr	x0, [x21]
	str	x0, [sp, 168]
	sub	x0, x23, x21
	sub	x23, x23, #8
	ldr	s8, [sp, 168]
	cmp	x0, 8
	fneg	s8, s8
	bgt	.L2132
.L2015:
	cmp	x20, x22
	beq	.L2031
	.p2align 3,,7
.L2035:
	ldr	w0, [x20, 4]
	mov	x24, x25
	ldr	w1, [sp, 172]
	ldr	x5, [x19, 24]
	ldr	x4, [x19, 232]
	ldp	x6, x2, [x19, 304]
	ldr	x3, [x19, 256]
	madd	x1, x1, x5, x4
	madd	x0, x0, x5, x4
	add	x1, x3, x1
	add	x0, x3, x0
.LEHB99:
	blr	x6
	fcmpe	s8, s0
	bgt	.L2128
	add	x20, x20, 8
	cmp	x20, x22
	bne	.L2035
	ldr	x22, [sp, 184]
.L2031:
	ldr	x0, [sp, 192]
	cmp	x0, x22
	beq	.L2133
	ldr	x0, [sp, 168]
	str	x0, [x22], 8
	str	x22, [sp, 184]
.L2034:
	cmp	x21, x23
	bne	.L1982
.L2129:
	ldr	x20, [sp, 176]
.L1983:
	cmp	x22, x20
	beq	.L2036
	ldp	x19, x23, [x26]
	sub	x0, x27, x21
	ldr	x4, [x26, 16]
	str	x0, [sp, 128]
	.p2align 3,,7
.L2050:
	ldr	s8, [x20]
	ldr	w25, [x20, 4]
	fneg	s8, s8
	cmp	x23, x4
	beq	.L2037
	add	x23, x23, 8
	str	s8, [x23, -8]
	str	w25, [x23, -4]
	sub	x24, x23, x19
	sub	x5, x24, #8
	str	x23, [x26, 8]
	asr	x24, x24, 3
	add	x5, x19, x5
	sub	x2, x24, #2
	sub	x24, x24, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
.L2038:
	cmp	x24, 0
	ble	.L2047
	.p2align 3,,7
.L2049:
	lsl	x0, x2, 3
	lsl	x24, x24, 3
	add	x1, x19, x0
	add	x5, x19, x24
	ldr	s0, [x19, x0]
	fcmpe	s0, s8
	bmi	.L2083
.L2047:
	add	x20, x20, 8
	str	s8, [x5]
	str	w25, [x5, 4]
	cmp	x22, x20
	bne	.L2050
.L2139:
	ldr	x20, [sp, 176]
.L2036:
	cbz	x20, .L2051
	ldr	x1, [sp, 192]
	mov	x0, x20
	sub	x1, x1, x20
	bl	_ZdlPvm
.L2051:
	cbz	x21, .L2125
	mov	x1, x28
	mov	x0, x21
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldr	d8, [sp, 96]
	.cfi_restore 72
	ldp	x29, x30, [sp], 208
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	_ZdlPvm
	.p2align 2,,3
.L1995:
	.cfi_restore_state
	ldr	w4, [x3, 4]
.L1998:
	lsl	x1, x2, 3
	sub	x0, x20, #1
	add	x6, x21, x1
	mov	x2, x20
	add	x0, x0, x0, lsr 63
	str	s0, [x21, x1]
	str	w4, [x6, 4]
	asr	x20, x0, 1
	cmp	x2, 0
	bgt	.L2001
	ldp	x20, x0, [x26]
	str	s8, [x3]
	str	w5, [x3, 4]
	sub	x1, x0, x20
	sub	x6, x0, #8
	cmp	x1, 8
	ble	.L2000
	.p2align 3,,7
.L2131:
	sub	x2, x6, x20
	ldr	s0, [x20]
	ldr	w3, [x20, 4]
	asr	x9, x2, 3
	ldr	w7, [x0, -4]
	sub	x1, x9, #1
	str	w3, [x0, -4]
	ldr	s2, [x0, -8]
	and	x10, x9, 1
	add	x8, x1, x1, lsr 63
	str	s0, [x0, -8]
	asr	x8, x8, 1
	cmp	x2, 16
	ble	.L2002
	mov	x1, 0
	b	.L2006
	.p2align 2,,3
.L2134:
	mov	x1, x0
.L2006:
	add	x2, x1, 1
	lsl	x0, x2, 1
	lsl	x2, x2, 4
	sub	x5, x0, #1
	add	x4, x20, x2
	lsl	x3, x5, 3
	ldr	s0, [x20, x2]
	add	x2, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L2078
.L2003:
	lsl	x1, x1, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x8, x0
	bgt	.L2134
	lsl	x3, x0, 3
	cbnz	x10, .L2009
	sub	x9, x9, #2
	add	x9, x9, x9, lsr 63
	cmp	x0, x9, asr 1
	beq	.L2008
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L2012:
	lsl	x0, x1, 3
	add	x4, x20, x3
	add	x5, x20, x0
	ldr	s0, [x20, x0]
	fcmpe	s0, s2
	bmi	.L2079
.L2007:
	str	s2, [x4]
	str	w7, [x4, 4]
	b	.L2000
.L2133:
	mov	x1, x22
	mov	x24, x25
	add	x2, sp, 168
	add	x0, sp, 176
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.p2align 3,,7
.L2128:
	ldr	x22, [sp, 184]
	b	.L2034
	.p2align 2,,3
.L2132:
	sub	x1, x23, x21
	ldr	s0, [x21]
	ldr	w2, [x21, 4]
	asr	x9, x1, 3
	ldr	w8, [x23, 4]
	sub	x0, x9, #1
	str	w2, [x23, 4]
	ldr	s2, [x23]
	and	x10, x9, 1
	add	x7, x0, x0, lsr 63
	str	s0, [x23]
	asr	x7, x7, 1
	cmp	x1, 16
	ble	.L2016
	mov	x0, 0
	b	.L2021
	.p2align 2,,3
.L2068:
	mov	w1, w2
.L2019:
	lsl	x0, x0, 3
	add	x2, x21, x0
	str	s0, [x21, x0]
	str	w1, [x2, 4]
	cmp	x7, x6
	ble	.L2020
.L2135:
	mov	x0, x6
.L2021:
	add	x1, x0, 1
	lsl	x3, x1, 1
	lsl	x1, x1, 4
	sub	x6, x3, #1
	add	x5, x21, x1
	lsl	x2, x6, 3
	ldr	s1, [x21, x1]
	add	x4, x21, x2
	ldr	s0, [x21, x2]
	fcmpe	s0, s1
	bgt	.L2080
	ldr	w1, [x5, 4]
	bmi	.L2067
	ldr	w2, [x4, 4]
	cmp	w2, w1
	bhi	.L2068
.L2067:
	fmov	s0, s1
	lsl	x0, x0, 3
	add	x2, x21, x0
	mov	x6, x3
	mov	x4, x5
	str	s0, [x21, x0]
	str	w1, [x2, 4]
	cmp	x7, x6
	bgt	.L2135
.L2020:
	lsl	x2, x6, 3
	cbnz	x10, .L2024
	sub	x9, x9, #2
	add	x9, x9, x9, lsr 63
	cmp	x6, x9, asr 1
	beq	.L2023
	sub	x0, x6, #1
	lsl	x2, x6, 3
	asr	x0, x0, 1
	.p2align 3,,7
.L2030:
	lsl	x1, x0, 3
	add	x3, x21, x1
	ldr	s0, [x21, x1]
	fcmpe	s0, s2
	bmi	.L2026
	bgt	.L2127
	ldr	w4, [x3, 4]
	cmp	w8, w4
	bls	.L2127
	.p2align 3,,7
.L2029:
	add	x5, x21, x2
	sub	x1, x0, #1
	str	s0, [x21, x2]
	mov	x6, x0
	add	x1, x1, x1, lsr 63
	str	w4, [x5, 4]
	asr	x0, x1, 1
	cbz	x6, .L2022
	lsl	x2, x6, 3
	b	.L2030
	.p2align 2,,3
.L2080:
	ldr	w1, [x4, 4]
	b	.L2019
	.p2align 2,,3
.L2079:
	sub	x2, x1, #1
	str	s0, [x20, x3]
	ldr	w3, [x5, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x4, 4]
	asr	x1, x2, 1
	cbz	x0, .L2136
	lsl	x3, x0, 3
	b	.L2012
	.p2align 2,,3
.L2078:
	fmov	s0, s1
	mov	x4, x2
	mov	x0, x5
	b	.L2003
	.p2align 2,,3
.L2127:
	add	x3, x21, x2
.L2022:
	str	s2, [x3]
	str	w8, [x3, 4]
	b	.L2015
	.p2align 2,,3
.L2026:
	ldr	w4, [x3, 4]
	b	.L2029
.L2016:
	mov	x3, x21
	cbnz	x10, .L2022
	cmp	x0, 2
	bhi	.L2022
	mov	x4, x21
	mov	x6, 0
.L2023:
	lsl	x0, x6, 1
	add	x6, x0, 1
	lsl	x2, x6, 3
	add	x0, x21, x2
	ldr	s0, [x21, x2]
	ldr	w0, [x0, 4]
	str	w0, [x4, 4]
	str	s0, [x4]
.L2024:
	sub	x0, x6, #1
	asr	x0, x0, 1
	b	.L2030
.L2002:
	mov	x4, x20
	cbnz	x10, .L2007
	cmp	x1, 2
	bhi	.L2007
	mov	x0, 0
.L2008:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x20, x3
	ldr	s0, [x20, x3]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
.L2009:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L2012
	.p2align 2,,3
.L1984:
	asr	x0, x28, 3
	cmp	x0, x22
	beq	.L2137
	cmp	x0, 0
	csel	x1, x0, x25, ne
	adds	x0, x0, x1
	bcs	.L1988
	cbnz	x0, .L2138
	mov	x6, 0
	add	x0, x6, x24
	ldr	w1, [x20, 4]
	mov	x2, 8
	str	s8, [x6, x24]
	mov	x28, 0
	str	w1, [x0, 4]
	mov	x27, 0
	cmp	x23, x21
	beq	.L2062
.L2142:
	sub	x4, x23, x21
	mov	x1, x6
	add	x4, x6, x4
	mov	x2, x21
	.p2align 3,,7
.L1992:
	ldr	x3, [x2], 8
	str	x3, [x1], 8
	cmp	x1, x4
	bne	.L1992
	add	x23, x4, 8
	sub	x2, x23, x6
	sub	x3, x2, #8
	asr	x2, x2, 3
	add	x3, x6, x3
	sub	x20, x2, #2
	sub	x2, x2, #1
	add	x20, x20, x20, lsr 63
	asr	x20, x20, 1
	cbz	x21, .L1993
.L2143:
	mov	x1, x24
	mov	x0, x21
	stp	x6, x4, [sp, 120]
	stp	x2, x3, [sp, 136]
	bl	_ZdlPvm
	ldp	x6, x4, [sp, 120]
	ldp	x2, x3, [sp, 136]
.L1993:
	mov	x21, x6
	ldr	w5, [x4, 4]
	ldr	s8, [x4]
	b	.L1985
	.p2align 2,,3
.L2136:
	mov	x4, x5
	str	s2, [x4]
	str	w7, [x4, 4]
	b	.L2000
.L2125:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldr	d8, [sp, 96]
	.cfi_restore 72
.L1978:
	ldp	x19, x20, [sp, 16]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 208
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2083:
	.cfi_def_cfa_offset 208
	.cfi_offset 19, -192
	.cfi_offset 20, -184
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	.cfi_offset 25, -144
	.cfi_offset 26, -136
	.cfi_offset 27, -128
	.cfi_offset 28, -120
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	.cfi_offset 72, -112
	sub	x0, x2, #1
	ldr	w3, [x1, 4]
	str	s0, [x19, x24]
	mov	x24, x2
	add	x0, x0, x0, lsr 63
	str	w3, [x5, 4]
	asr	x2, x0, 1
	cmp	x24, 0
	bgt	.L2049
	mov	x5, x1
	add	x20, x20, 8
	str	s8, [x5]
	str	w25, [x5, 4]
	cmp	x22, x20
	bne	.L2050
	b	.L2139
	.p2align 2,,3
.L2037:
	sub	x0, x23, x19
	str	x0, [sp, 112]
	asr	x1, x0, 3
	mov	x0, 1152921504606846975
	cmp	x1, x0
	beq	.L2140
	cmp	x1, 0
	csinc	x0, x1, xzr, ne
	adds	x0, x0, x1
	bcs	.L2041
	cbnz	x0, .L2141
	ldr	x3, [sp, 112]
	mov	x6, 0
	mov	x1, x23
	mov	x2, 8
	add	x0, x6, x3
	mov	x4, 0
	str	s8, [x6, x3]
	str	w25, [x0, 4]
	cmp	x23, x19
	beq	.L2074
.L2144:
	mov	x3, x6
	mov	x2, x19
	.p2align 3,,7
.L2045:
	ldr	x5, [x2], 8
	str	x5, [x3], 8
	cmp	x2, x23
	bne	.L2045
	ldr	x0, [sp, 112]
	add	x3, x6, x0
	add	x23, x3, 8
	sub	x24, x23, x6
	sub	x5, x24, #8
	asr	x24, x24, 3
	add	x5, x6, x5
	sub	x2, x24, #2
	sub	x24, x24, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cbz	x19, .L2046
.L2145:
	sub	x1, x1, x19
	mov	x0, x19
	stp	x2, x3, [sp, 112]
	stp	x6, x5, [sp, 136]
	str	x4, [sp, 152]
	bl	_ZdlPvm
	ldp	x2, x3, [sp, 112]
	ldp	x6, x5, [sp, 136]
	ldr	x4, [sp, 152]
.L2046:
	mov	x19, x6
	ldr	w25, [x3, 4]
	stp	x6, x23, [x26]
	ldr	s8, [x3]
	str	x4, [x26, 16]
	b	.L2038
.L2138:
	cmp	x0, x22
	csel	x0, x0, x22, ls
	lsl	x27, x0, 3
.L1989:
	mov	x0, x27
	bl	_Znwm
	mov	x6, x0
	mov	x28, x27
	add	x2, x0, 8
	add	x27, x0, x27
	add	x0, x6, x24
	ldr	w1, [x20, 4]
	str	s8, [x6, x24]
	str	w1, [x0, 4]
	cmp	x23, x21
	bne	.L2142
.L2062:
	mov	x23, x2
	mov	x3, x6
	mov	x4, x6
	mov	x20, 0
	mov	x2, 0
	cbnz	x21, .L2143
	b	.L1993
.L2141:
	mov	x1, 1152921504606846975
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x0, x0, 3
	str	x0, [sp, 120]
.L2042:
	ldr	x24, [sp, 128]
	bl	_Znwm
	mov	x6, x0
	add	x2, x0, 8
	ldr	x3, [sp, 112]
	ldr	x0, [sp, 120]
	str	s8, [x6, x3]
	add	x4, x6, x0
	add	x0, x6, x3
	ldr	x1, [x26, 16]
	str	w25, [x0, 4]
	cmp	x23, x19
	bne	.L2144
.L2074:
	mov	x23, x2
	mov	x5, x6
	mov	x3, x6
	mov	x2, 0
	mov	x24, 0
	cbnz	x19, .L2145
	b	.L2046
.L2130:
	.cfi_restore 72
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	b	.L1978
.L2140:
	.cfi_offset 21, -176
	.cfi_offset 22, -168
	.cfi_offset 23, -160
	.cfi_offset 24, -152
	.cfi_offset 27, -128
	.cfi_offset 28, -120
	.cfi_offset 72, -112
	adrp	x0, .LC9
	sub	x24, x27, x21
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.L2041:
	mov	x0, 9223372036854775800
	str	x0, [sp, 120]
	b	.L2042
.L1988:
	mov	x27, 9223372036854775800
	b	.L1989
.L2137:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.LEHE99:
.L2076:
	ldr	x2, [sp, 176]
	mov	x19, x0
	ldr	x1, [sp, 192]
	sub	x1, x1, x2
	cbz	x2, .L2053
	mov	x0, x2
	bl	_ZdlPvm
.L2053:
	cbz	x21, .L2054
	mov	x1, x24
	mov	x0, x21
	bl	_ZdlPvm
.L2054:
	mov	x0, x19
.LEHB100:
	bl	_Unwind_Resume
.LEHE100:
	.cfi_endproc
.LFE12128:
	.section	.gcc_except_table
.LLSDA12128:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12128-.LLSDACSB12128
.LLSDACSB12128:
	.uleb128 .LEHB99-.LFB12128
	.uleb128 .LEHE99-.LEHB99
	.uleb128 .L2076-.LFB12128
	.uleb128 0
	.uleb128 .LEHB100-.LFB12128
	.uleb128 .LEHE100-.LEHB100
	.uleb128 0
	.uleb128 0
.LLSDACSE12128:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm, .-_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm
	.section	.rodata.str1.8
	.align	3
.LC32:
	.string	"Should be not be more than M_ candidates returned by the heuristic"
	.align	3
.LC33:
	.string	"vector::reserve"
	.align	3
.LC34:
	.string	"The newly inserted element should have blank link list"
	.align	3
.LC35:
	.string	"Possible memory corruption"
	.align	3
.LC36:
	.string	"Trying to make a link on a non-existent level"
	.align	3
.LC37:
	.string	"Bad value of sz_link_list_other"
	.align	3
.LC38:
	.string	"Trying to connect an element to itself"
	.text
	.align	2
	.p2align 4,,11
	.type	_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0, %function
_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0:
.LFB13617:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13617
	stp	x29, x30, [sp, -304]!
	.cfi_def_cfa_offset 304
	.cfi_offset 29, -304
	.cfi_offset 30, -296
	cmp	w3, 0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -288
	.cfi_offset 20, -280
	mov	x19, x2
	mov	x20, x0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -224
	.cfi_offset 28, -216
	mov	w28, w3
	ldp	x2, x3, [x0, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -240
	.cfi_offset 26, -232
	mov	w26, w1
	and	w1, w4, 255
	str	w1, [sp, 216]
	ldr	x1, [x0, 64]
	stp	x21, x22, [sp, 32]
	mov	x4, x1
	mov	x1, x19
	csel	x3, x4, x3, eq
	stp	x23, x24, [sp, 48]
	str	d8, [sp, 96]
	.cfi_offset 21, -272
	.cfi_offset 22, -264
	.cfi_offset 23, -256
	.cfi_offset 24, -248
	.cfi_offset 72, -208
	str	x3, [sp, 112]
.LEHB101:
	bl	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm
.LEHE101:
	ldp	x2, x3, [x19]
	ldr	x1, [x20, 48]
	sub	x0, x3, x2
	cmp	x1, x0, asr 3
	bcc	.L2348
	stp	xzr, xzr, [sp, 240]
	mov	x0, 2305843009213693951
	str	xzr, [sp, 256]
	cmp	x1, x0
	bhi	.L2349
	mov	x0, 0
	mov	x21, 0
	cbnz	x1, .L2350
.L2150:
	cmp	x3, x2
	bne	.L2169
	b	.L2154
	.p2align 2,,3
.L2157:
	str	x7, [x19, 8]
	cmp	x2, x7
	beq	.L2154
.L2352:
	ldr	x0, [sp, 256]
.L2169:
	cmp	x21, x0
	beq	.L2155
	ldr	w0, [x2, 4]
	str	w0, [x21], 4
	str	x21, [sp, 248]
.L2156:
	ldp	x2, x0, [x19]
	sub	x1, x0, x2
	sub	x7, x0, #8
	cmp	x1, 8
	ble	.L2157
	sub	x3, x7, x2
	ldr	s0, [x2]
	ldr	w4, [x2, 4]
	asr	x10, x3, 3
	ldr	w8, [x0, -4]
	sub	x1, x10, #1
	str	w4, [x0, -4]
	ldr	s2, [x0, -8]
	and	x11, x10, 1
	add	x9, x1, x1, lsr 63
	str	s0, [x0, -8]
	asr	x9, x9, 1
	cmp	x3, 16
	ble	.L2158
	mov	x1, 0
	b	.L2162
	.p2align 2,,3
.L2351:
	mov	x1, x0
.L2162:
	add	x3, x1, 1
	lsl	x0, x3, 1
	lsl	x3, x3, 4
	sub	x6, x0, #1
	add	x5, x2, x3
	lsl	x4, x6, 3
	ldr	s0, [x2, x3]
	add	x3, x2, x4
	ldr	s1, [x2, x4]
	fcmpe	s1, s0
	bgt	.L2276
.L2159:
	lsl	x1, x1, 3
	ldr	w4, [x5, 4]
	add	x3, x2, x1
	str	s0, [x2, x1]
	str	w4, [x3, 4]
	cmp	x9, x0
	bgt	.L2351
	lsl	x4, x0, 3
	cbnz	x11, .L2165
	sub	x10, x10, #2
	add	x10, x10, x10, lsr 63
	cmp	x0, x10, asr 1
	beq	.L2164
	sub	x1, x0, #1
	lsl	x4, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L2168:
	lsl	x0, x1, 3
	add	x5, x2, x4
	add	x6, x2, x0
	ldr	s0, [x2, x0]
	fcmpe	s0, s2
	bmi	.L2277
.L2163:
	str	w8, [x5, 4]
	str	s2, [x5]
.L2366:
	str	x7, [x19, 8]
	cmp	x2, x7
	bne	.L2352
.L2154:
	ldr	x1, [x20, 192]
	mov	w0, 48
	ldr	w2, [x21, -4]
	mov	w8, 0
	str	w2, [sp, 220]
	uxtw	x2, w26
	umaddl	x0, w26, w0, x1
	ldr	w1, [sp, 216]
	str	x2, [sp, 176]
	str	x0, [sp, 272]
	strb	wzr, [sp, 280]
	cbnz	w1, .L2353
	cbz	w28, .L2354
.L2173:
	ldr	x0, [x20, 264]
	uxtw	x2, w26
	sub	w3, w28, #1
	ldr	x1, [x20, 32]
	sxtw	x3, w3
	ldr	x0, [x0, x2, lsl 3]
	madd	x3, x3, x1, x0
.L2174:
	ldr	w0, [x3]
	cmp	w0, 0
	ldr	w0, [sp, 216]
	ccmp	w0, 0, 0, ne
	beq	.L2355
	ldp	x1, x7, [sp, 240]
	mov	x2, 1
	sub	x5, x7, x1
	sub	x6, x1, #4
	asr	x5, x5, 2
	strh	w5, [x3]
	cbnz	x5, .L2176
	b	.L2181
	.p2align 2,,3
.L2255:
	mov	x2, x0
.L2176:
	ldr	w0, [x3, x2, lsl 2]
	cmp	w0, 0
	ldr	w0, [sp, 216]
	ccmp	w0, 0, 0, ne
	beq	.L2356
	ldr	w0, [x6, x2, lsl 2]
	ldr	x4, [x20, 272]
	ldr	w4, [x4, w0, uxtw 2]
	cmp	w28, w4
	bgt	.L2357
	str	w0, [x3, x2, lsl 2]
	add	x0, x2, 1
	cmp	x5, x2
	bne	.L2255
.L2181:
	cbnz	w8, .L2358
.L2178:
	cmp	x7, x1
	beq	.L2183
	sub	w0, w28, #1
	add	x2, x20, 192
	mov	x25, 0
	str	x2, [sp, 136]
	sxtw	x0, w0
	str	x0, [sp, 152]
	b	.L2229
	.p2align 2,,3
.L2364:
	ldr	x1, [x20, 24]
	ldr	x2, [x20, 240]
	ldr	x21, [x20, 256]
	madd	x1, x3, x1, x2
	add	x21, x21, x1
.L2188:
	ldr	x2, [sp, 112]
	ldrh	w1, [x21]
	and	x24, x1, 65535
	cmp	x2, x1, uxth
	bcc	.L2359
	cmp	w26, w0
	beq	.L2360
	ldr	x0, [x20, 272]
	ldr	w0, [x0, x3, lsl 2]
	cmp	w28, w0
	bgt	.L2361
	add	x0, x21, 4
	str	x0, [sp, 120]
	ldr	w0, [sp, 216]
	cbnz	w0, .L2362
.L2192:
	ldr	x0, [sp, 112]
	cmp	x24, x0
	bcs	.L2195
	ldr	x2, [sp, 120]
	uxtw	x0, w1
	add	w1, w1, 1
	str	w26, [x2, x0, lsl 2]
	strh	w1, [x21]
.L2193:
	ldr	x0, [sp, 224]
	cbz	x0, .L2228
	ldr	x1, [sp, 128]
	cbz	x1, .L2228
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L2228:
	ldp	x1, x0, [sp, 240]
	add	x25, x25, 1
	sub	x0, x0, x1
	cmp	x25, x0, asr 2
	bcs	.L2183
.L2229:
	ldr	x2, [sp, 136]
	mov	w3, 48
	ldr	w0, [x1, x25, lsl 2]
	lsl	x27, x25, 2
	strb	wzr, [sp, 232]
	ldr	x2, [x2]
	umaddl	x0, w0, w3, x2
	str	x0, [sp, 224]
	cbz	x0, .L2363
	adrp	x2, .LC12
	ldr	x2, [x2, #:lo12:.LC12]
	str	x2, [sp, 128]
	cbz	x2, .L2185
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2186
	ldr	x1, [sp, 240]
.L2185:
	mov	w0, 1
	strb	w0, [sp, 232]
	ldr	w0, [x1, x27]
	uxtw	x3, w0
	cbz	w28, .L2364
	ldr	x1, [x20, 264]
	ldr	x21, [x20, 32]
	ldr	x1, [x1, x3, lsl 3]
	ldr	x2, [sp, 152]
	madd	x21, x2, x21, x1
	b	.L2188
	.p2align 2,,3
.L2277:
	sub	x3, x1, #1
	str	s0, [x2, x4]
	ldr	w4, [x6, 4]
	mov	x0, x1
	add	x3, x3, x3, lsr 63
	str	w4, [x5, 4]
	asr	x1, x3, 1
	cbz	x0, .L2365
	lsl	x4, x0, 3
	b	.L2168
	.p2align 2,,3
.L2276:
	fmov	s0, s1
	mov	x5, x3
	mov	x0, x6
	b	.L2159
.L2158:
	mov	x5, x2
	cbnz	x11, .L2163
	cmp	x1, 2
	bhi	.L2163
	mov	x0, 0
.L2164:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x4, x0, 3
	add	x1, x2, x4
	ldr	s0, [x2, x4]
	ldr	w1, [x1, 4]
	str	w1, [x5, 4]
	str	s0, [x5]
.L2165:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L2168
.L2155:
	add	x2, x2, 4
	mov	x1, x21
	add	x0, sp, 240
.LEHB102:
	bl	_ZNSt6vectorIjSaIjEE17_M_realloc_insertIJRKjEEEvN9__gnu_cxx17__normal_iteratorIPjS1_EEDpOT_
.LEHE102:
	ldr	x21, [sp, 248]
	b	.L2156
.L2365:
	mov	x5, x6
	str	s2, [x5]
	str	w8, [x5, 4]
	b	.L2366
.L2354:
	ldr	x0, [x20, 24]
	uxtw	x2, w26
	ldr	x1, [x20, 240]
	ldr	x3, [x20, 256]
	madd	x0, x2, x0, x1
	add	x3, x3, x0
	b	.L2174
.L2353:
	cbz	x0, .L2367
	adrp	x1, .LC12
	ldr	x1, [x1, #:lo12:.LC12]
	cbz	x1, .L2172
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2368
.L2172:
	mov	w0, 1
	strb	w0, [sp, 280]
	ldr	w8, [sp, 216]
	cbnz	w28, .L2173
	b	.L2354
	.p2align 2,,3
.L2362:
	cbz	x24, .L2192
	mov	x0, 1
	b	.L2194
	.p2align 2,,3
.L2369:
	add	x2, x0, 1
	cmp	x24, x0
	beq	.L2192
	mov	x0, x2
.L2194:
	ldr	w2, [x21, x0, lsl 2]
	cmp	w2, w26
	bne	.L2369
	b	.L2193
	.p2align 2,,3
.L2195:
	ldr	x4, [x20, 24]
	ldr	x5, [x20, 232]
	ldp	x6, x2, [x20, 304]
	madd	x1, x4, x3, x5
	ldr	x3, [sp, 176]
	ldr	x0, [x20, 256]
	madd	x4, x3, x4, x5
	add	x1, x0, x1
	add	x0, x0, x4
.LEHB103:
	blr	x6
.LEHE103:
	fmov	s8, s0
	mov	x0, 8
	stp	xzr, xzr, [sp, 272]
	str	xzr, [sp, 288]
.LEHB104:
	bl	_Znwm
	add	x1, x0, 8
	mov	x22, 1
	str	w26, [x0, 4]
	str	x22, [sp, 168]
	stp	x0, x1, [sp, 272]
	str	x1, [sp, 288]
	str	s8, [x0]
	cbz	x24, .L2211
	.p2align 3,,7
.L2196:
	ldr	x1, [sp, 240]
	ldr	w0, [x21, x22, lsl 2]
	ldr	x5, [x20, 24]
	ldr	w1, [x1, x27]
	ldr	x4, [x20, 232]
	ldp	x6, x2, [x20, 304]
	ldr	x3, [x20, 256]
	madd	x0, x0, x5, x4
	madd	x1, x1, x5, x4
	add	x0, x3, x0
	add	x1, x3, x1
	blr	x6
	ldp	x19, x23, [sp, 272]
	fmov	s8, s0
	ldr	x1, [sp, 288]
	cmp	x23, x1
	beq	.L2198
	add	x1, x23, 8
	ldr	w5, [x21, x22, lsl 2]
	sub	x0, x1, x19
	str	s0, [x23]
	str	w5, [x23, 4]
	sub	x4, x0, #8
	asr	x23, x0, 3
	add	x4, x19, x4
	sub	x2, x23, #2
	sub	x23, x23, #1
	str	x1, [sp, 280]
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
.L2199:
	cmp	x23, 0
	ble	.L2208
	.p2align 3,,7
.L2210:
	lsl	x0, x2, 3
	lsl	x23, x23, 3
	add	x1, x19, x0
	add	x4, x19, x23
	ldr	s1, [x19, x0]
	fcmpe	s1, s8
	bmi	.L2278
.L2208:
	str	s8, [x4]
	add	x0, x22, 1
	str	w5, [x4, 4]
	cmp	x24, x22
	beq	.L2211
.L2370:
	mov	x22, x0
	b	.L2196
	.p2align 2,,3
.L2278:
	sub	x0, x2, #1
	ldr	w3, [x1, 4]
	str	s1, [x19, x23]
	mov	x23, x2
	add	x0, x0, x0, lsr 63
	str	w3, [x4, 4]
	asr	x2, x0, 1
	cmp	x23, 0
	bgt	.L2210
	mov	x4, x1
	add	x0, x22, 1
	str	s8, [x4]
	str	w5, [x4, 4]
	cmp	x24, x22
	bne	.L2370
.L2211:
	ldr	x2, [sp, 112]
	add	x1, sp, 272
	mov	x0, x20
	bl	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm
	ldp	x0, x7, [sp, 272]
	cmp	x7, x0
	beq	.L2212
	mov	x5, x7
	ldr	x6, [sp, 120]
	b	.L2225
	.p2align 2,,3
.L2213:
	str	x5, [sp, 280]
	add	x6, x6, 4
	cmp	x0, x5
	beq	.L2371
.L2225:
	ldr	w2, [x0, 4]
	sub	x1, x5, x0
	str	w2, [x6]
	cmp	x1, 8
	sub	x5, x5, #8
	ble	.L2213
	sub	x3, x5, x0
	ldr	s0, [x0]
	ldr	w8, [x5, 4]
	asr	x12, x3, 3
	str	w2, [x5, 4]
	sub	x1, x12, #1
	ldr	s2, [x5]
	str	s0, [x5]
	and	x13, x12, 1
	add	x11, x1, x1, lsr 63
	asr	x11, x11, 1
	cmp	x3, 16
	ble	.L2214
	mov	x2, 0
	b	.L2218
	.p2align 2,,3
.L2372:
	mov	x2, x1
.L2218:
	add	x3, x2, 1
	lsl	x1, x3, 1
	lsl	x3, x3, 4
	sub	x10, x1, #1
	add	x9, x0, x3
	lsl	x4, x10, 3
	ldr	s0, [x0, x3]
	add	x3, x0, x4
	ldr	s1, [x0, x4]
	fcmpe	s1, s0
	bgt	.L2279
.L2215:
	lsl	x2, x2, 3
	ldr	w4, [x9, 4]
	add	x3, x0, x2
	str	s0, [x0, x2]
	str	w4, [x3, 4]
	cmp	x11, x1
	bgt	.L2372
	lsl	x4, x1, 3
	cbnz	x13, .L2221
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x1, x12, asr 1
	beq	.L2220
	sub	x2, x1, #1
	lsl	x4, x1, 3
	asr	x2, x2, 1
	.p2align 3,,7
.L2224:
	lsl	x1, x2, 3
	add	x9, x0, x4
	add	x10, x0, x1
	ldr	s0, [x0, x1]
	fcmpe	s0, s2
	bmi	.L2280
.L2219:
	str	w8, [x9, 4]
	str	s2, [x9]
.L2376:
	str	x5, [sp, 280]
	add	x6, x6, 4
	cmp	x0, x5
	bne	.L2225
.L2371:
	sub	x1, x7, #8
	sub	x1, x1, x0
	lsr	x1, x1, 3
	add	w1, w1, 1
	strh	w1, [x21]
.L2226:
	ldr	x1, [sp, 288]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L2227:
	ldrb	w0, [sp, 232]
	cbnz	w0, .L2193
	ldp	x1, x0, [sp, 240]
	add	x25, x25, 1
	sub	x0, x0, x1
	cmp	x25, x0, asr 2
	bcc	.L2229
.L2183:
	cbz	x1, .L2146
	ldr	x2, [sp, 256]
	mov	x0, x1
	sub	x1, x2, x1
	bl	_ZdlPvm
.L2146:
	ldr	w0, [sp, 220]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	d8, [sp, 96]
	ldp	x29, x30, [sp], 304
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2198:
	.cfi_restore_state
	sub	x0, x23, x19
	str	x0, [sp, 144]
	mov	x2, 1152921504606846975
	asr	x0, x0, 3
	cmp	x0, x2
	beq	.L2373
	ldr	x2, [sp, 168]
	cmp	x0, 0
	csel	x2, x0, x2, ne
	adds	x0, x0, x2
	bcs	.L2202
	cbnz	x0, .L2374
	ldr	x0, [sp, 144]
	mov	x7, 0
	mov	x3, 8
	mov	x8, 0
	add	x6, x7, x0
	str	s8, [x7, x0]
	ldr	w0, [x21, x22, lsl 2]
	str	w0, [x6, 4]
	cmp	x23, x19
	beq	.L2260
.L2377:
	mov	x2, x7
	mov	x3, x19
	.p2align 3,,7
.L2206:
	ldr	x4, [x3], 8
	str	x4, [x2], 8
	cmp	x2, x6
	bne	.L2206
	add	x3, x6, 8
	sub	x23, x3, x7
	sub	x4, x23, #8
	asr	x23, x23, 3
	add	x4, x7, x4
	sub	x2, x23, #2
	sub	x23, x23, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
.L2205:
	cbz	x19, .L2207
	sub	x1, x1, x19
	mov	x0, x19
	str	x2, [sp, 144]
	str	x6, [sp, 160]
	stp	x7, x8, [sp, 184]
	stp	x3, x4, [sp, 200]
	bl	_ZdlPvm
	ldp	x7, x8, [sp, 184]
	ldp	x3, x4, [sp, 200]
	ldr	x2, [sp, 144]
	ldr	x6, [sp, 160]
.L2207:
	mov	x19, x7
	ldr	w5, [x6, 4]
	stp	x7, x3, [sp, 272]
	ldr	s8, [x6]
	str	x8, [sp, 288]
	b	.L2199
	.p2align 2,,3
.L2280:
	sub	x3, x2, #1
	str	s0, [x0, x4]
	ldr	w4, [x10, 4]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w4, [x9, 4]
	asr	x2, x3, 1
	cbz	x1, .L2375
	lsl	x4, x1, 3
	b	.L2224
	.p2align 2,,3
.L2279:
	fmov	s0, s1
	mov	x9, x3
	mov	x1, x10
	b	.L2215
.L2214:
	mov	x9, x0
	cbnz	x13, .L2219
	cmp	x1, 2
	bhi	.L2219
	mov	x1, 0
.L2220:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x4, x1, 3
	add	x2, x0, x4
	ldr	s0, [x0, x4]
	ldr	w2, [x2, 4]
	str	w2, [x9, 4]
	str	s0, [x9]
.L2221:
	sub	x1, x1, #1
	asr	x2, x1, 1
	b	.L2224
	.p2align 2,,3
.L2375:
	mov	x9, x10
	str	s2, [x9]
	str	w8, [x9, 4]
	b	.L2376
.L2212:
	strh	wzr, [x21]
	cbz	x0, .L2227
	b	.L2226
	.p2align 2,,3
.L2374:
	mov	x1, 1152921504606846975
	cmp	x0, x1
	csel	x0, x0, x1, ls
	lsl	x0, x0, 3
	str	x0, [sp, 160]
.L2203:
	bl	_Znwm
.LEHE104:
	mov	x7, x0
	add	x3, x0, 8
	ldr	x0, [sp, 160]
	ldr	x1, [sp, 288]
	add	x8, x7, x0
	ldr	x0, [sp, 144]
	add	x6, x7, x0
	str	s8, [x7, x0]
	ldr	w0, [x21, x22, lsl 2]
	str	w0, [x6, 4]
	cmp	x23, x19
	bne	.L2377
.L2260:
	mov	x4, x7
	mov	x6, x7
	mov	x2, 0
	mov	x23, 0
	b	.L2205
.L2358:
	ldr	x0, [sp, 272]
	cbz	x0, .L2178
	adrp	x2, .LC12
	ldr	x2, [x2, #:lo12:.LC12]
	cbz	x2, .L2178
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	ldp	x1, x7, [sp, 240]
	b	.L2178
.L2350:
	lsl	x22, x1, 2
	mov	x0, x22
.LEHB105:
	bl	_Znwm
	ldp	x23, x2, [sp, 240]
	mov	x21, x0
	ldr	x24, [sp, 256]
	sub	x2, x2, x23
	cmp	x2, 0
	bgt	.L2378
	cbnz	x23, .L2152
.L2153:
	add	x0, x21, x22
	stp	x21, x21, [sp, 240]
	str	x0, [sp, 256]
	ldp	x2, x3, [x19]
	b	.L2150
.L2378:
	mov	x1, x23
	bl	memmove
.L2152:
	sub	x1, x24, x23
	mov	x0, x23
	bl	_ZdlPvm
	b	.L2153
.L2363:
	mov	w0, 1
	bl	_ZSt20__throw_system_errori
.L2186:
	bl	_ZSt20__throw_system_errori
.LEHE105:
.L2367:
	mov	w0, 1
.LEHB106:
	bl	_ZSt20__throw_system_errori
.L2368:
	bl	_ZSt20__throw_system_errori
.LEHE106:
	.p2align 2,,3
.L2202:
	mov	x0, 9223372036854775800
	str	x0, [sp, 160]
	b	.L2203
.L2349:
	adrp	x0, .LC33
	add	x0, x0, :lo12:.LC33
.LEHB107:
	bl	_ZSt20__throw_length_errorPKc
.LEHE107:
.L2373:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB108:
	bl	_ZSt20__throw_length_errorPKc
.LEHE108:
.L2271:
	mov	x19, x0
.L2233:
	ldrb	w0, [sp, 280]
	cbz	w0, .L2237
	add	x0, sp, 272
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L2237:
	ldr	x0, [sp, 240]
	ldr	x1, [sp, 256]
	sub	x1, x1, x0
	cbz	x0, .L2245
	bl	_ZdlPvm
.L2245:
	mov	x0, x19
.LEHB109:
	bl	_Unwind_Resume
.LEHE109:
.L2360:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC38
	mov	x20, x0
	add	x1, x1, :lo12:.LC38
.LEHB110:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE110:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB111:
	bl	__cxa_throw
.LEHE111:
.L2359:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC37
	mov	x20, x0
	add	x1, x1, :lo12:.LC37
.LEHB112:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE112:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB113:
	bl	__cxa_throw
.LEHE113:
.L2269:
.L2346:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
.L2239:
	ldrb	w0, [sp, 232]
	cbz	w0, .L2237
	add	x0, sp, 224
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2237
.L2270:
	b	.L2346
.L2361:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC36
	mov	x20, x0
	add	x1, x1, :lo12:.LC36
.LEHB114:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE114:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB115:
	bl	__cxa_throw
.LEHE115:
.L2266:
	mov	x19, x0
	b	.L2239
.L2268:
	b	.L2346
.L2267:
	ldr	x2, [sp, 272]
	mov	x19, x0
	ldr	x1, [sp, 288]
	sub	x1, x1, x2
	cbz	x2, .L2239
	mov	x0, x2
	bl	_ZdlPvm
	b	.L2239
.L2265:
	mov	x19, x0
	b	.L2237
.L2348:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC32
	mov	x19, x0
	add	x1, x1, :lo12:.LC32
.LEHB116:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE116:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x19
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB117:
	bl	__cxa_throw
.LEHE117:
.L2355:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC34
	mov	x20, x0
	add	x1, x1, :lo12:.LC34
.LEHB118:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE118:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB119:
	bl	__cxa_throw
.LEHE119:
.L2275:
	mov	x1, x0
	mov	x0, x19
	mov	x19, x1
	bl	__cxa_free_exception
	mov	x0, x19
.LEHB120:
	bl	_Unwind_Resume
.LEHE120:
.L2274:
.L2345:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
	b	.L2233
.L2356:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC35
	mov	x20, x0
	add	x1, x1, :lo12:.LC35
.LEHB121:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE121:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB122:
	bl	__cxa_throw
.LEHE122:
.L2357:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC36
	mov	x20, x0
	add	x1, x1, :lo12:.LC36
.LEHB123:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE123:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB124:
	bl	__cxa_throw
.LEHE124:
.L2273:
	b	.L2345
.L2272:
	b	.L2345
	.cfi_endproc
.LFE13617:
	.section	.gcc_except_table
.LLSDA13617:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13617-.LLSDACSB13617
.LLSDACSB13617:
	.uleb128 .LEHB101-.LFB13617
	.uleb128 .LEHE101-.LEHB101
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB102-.LFB13617
	.uleb128 .LEHE102-.LEHB102
	.uleb128 .L2265-.LFB13617
	.uleb128 0
	.uleb128 .LEHB103-.LFB13617
	.uleb128 .LEHE103-.LEHB103
	.uleb128 .L2266-.LFB13617
	.uleb128 0
	.uleb128 .LEHB104-.LFB13617
	.uleb128 .LEHE104-.LEHB104
	.uleb128 .L2267-.LFB13617
	.uleb128 0
	.uleb128 .LEHB105-.LFB13617
	.uleb128 .LEHE105-.LEHB105
	.uleb128 .L2265-.LFB13617
	.uleb128 0
	.uleb128 .LEHB106-.LFB13617
	.uleb128 .LEHE106-.LEHB106
	.uleb128 .L2271-.LFB13617
	.uleb128 0
	.uleb128 .LEHB107-.LFB13617
	.uleb128 .LEHE107-.LEHB107
	.uleb128 .L2265-.LFB13617
	.uleb128 0
	.uleb128 .LEHB108-.LFB13617
	.uleb128 .LEHE108-.LEHB108
	.uleb128 .L2267-.LFB13617
	.uleb128 0
	.uleb128 .LEHB109-.LFB13617
	.uleb128 .LEHE109-.LEHB109
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB110-.LFB13617
	.uleb128 .LEHE110-.LEHB110
	.uleb128 .L2269-.LFB13617
	.uleb128 0
	.uleb128 .LEHB111-.LFB13617
	.uleb128 .LEHE111-.LEHB111
	.uleb128 .L2266-.LFB13617
	.uleb128 0
	.uleb128 .LEHB112-.LFB13617
	.uleb128 .LEHE112-.LEHB112
	.uleb128 .L2270-.LFB13617
	.uleb128 0
	.uleb128 .LEHB113-.LFB13617
	.uleb128 .LEHE113-.LEHB113
	.uleb128 .L2266-.LFB13617
	.uleb128 0
	.uleb128 .LEHB114-.LFB13617
	.uleb128 .LEHE114-.LEHB114
	.uleb128 .L2268-.LFB13617
	.uleb128 0
	.uleb128 .LEHB115-.LFB13617
	.uleb128 .LEHE115-.LEHB115
	.uleb128 .L2266-.LFB13617
	.uleb128 0
	.uleb128 .LEHB116-.LFB13617
	.uleb128 .LEHE116-.LEHB116
	.uleb128 .L2275-.LFB13617
	.uleb128 0
	.uleb128 .LEHB117-.LFB13617
	.uleb128 .LEHE117-.LEHB117
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB118-.LFB13617
	.uleb128 .LEHE118-.LEHB118
	.uleb128 .L2274-.LFB13617
	.uleb128 0
	.uleb128 .LEHB119-.LFB13617
	.uleb128 .LEHE119-.LEHB119
	.uleb128 .L2271-.LFB13617
	.uleb128 0
	.uleb128 .LEHB120-.LFB13617
	.uleb128 .LEHE120-.LEHB120
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB121-.LFB13617
	.uleb128 .LEHE121-.LEHB121
	.uleb128 .L2273-.LFB13617
	.uleb128 0
	.uleb128 .LEHB122-.LFB13617
	.uleb128 .LEHE122-.LEHB122
	.uleb128 .L2271-.LFB13617
	.uleb128 0
	.uleb128 .LEHB123-.LFB13617
	.uleb128 .LEHE123-.LEHB123
	.uleb128 .L2272-.LFB13617
	.uleb128 0
	.uleb128 .LEHB124-.LFB13617
	.uleb128 .LEHE124-.LEHB124
	.uleb128 .L2271-.LFB13617
	.uleb128 0
.LLSDACSE13617:
	.text
	.size	_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0, .-_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0
	.section	.rodata._ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii.str1.8,"aMS",@progbits,1
	.align	3
.LC39:
	.string	"Level of item to be updated cannot be bigger than max level"
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii
	.type	_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii, %function
_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii:
.LFB12131:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA12131
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -208
	.cfi_offset 20, -200
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -192
	.cfi_offset 22, -184
	.cfi_offset 23, -176
	.cfi_offset 24, -168
	mov	x23, x1
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -160
	.cfi_offset 26, -152
	mov	w26, w3
	stp	x27, x28, [sp, 80]
	str	d8, [sp, 96]
	.cfi_offset 27, -144
	.cfi_offset 28, -136
	.cfi_offset 72, -128
	str	w5, [sp, 112]
	stp	w4, w2, [sp, 120]
	cmp	w4, w5
	bge	.L2380
	ldr	x5, [x19, 24]
	uxtw	x1, w2
	ldr	x4, [x19, 232]
	mov	w24, w2
	ldp	x3, x2, [x19, 304]
	mov	x0, x23
	madd	x1, x1, x5, x4
	add	x28, x19, 192
	ldr	x4, [x19, 256]
	add	x1, x4, x1
.LEHB125:
	blr	x3
.LEHE125:
	fmov	s8, s0
.L2393:
	ldr	w0, [sp, 112]
	sub	w0, w0, #1
	sxtw	x0, w0
	mov	x27, x0
	.p2align 3,,7
.L2391:
	ldr	x0, [x28]
	mov	w1, 48
	strb	wzr, [sp, 200]
	uxtw	x21, w24
	umaddl	x0, w24, w1, x0
	str	x0, [sp, 192]
	cbz	x0, .L2535
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	ldr	x1, [x1]
	cbz	x1, .L2382
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2536
.L2382:
	mov	w0, 1
	strb	w0, [sp, 200]
	ldr	w0, [sp, 112]
	cbnz	w0, .L2383
	ldr	x1, [x19, 24]
	ldr	x0, [x19, 240]
	ldr	x20, [x19, 256]
	madd	x21, x21, x1, x0
	add	x20, x20, x21
	ldrh	w22, [x20]
	cbz	w22, .L2385
.L2543:
	sub	w22, w22, #1
	add	x0, x20, 8
	add	x20, x20, 4
	mov	w25, 0
	add	x22, x0, x22, uxtw 2
	.p2align 3,,7
.L2388:
	ldr	w21, [x20]
	mov	x0, x23
	ldr	x5, [x19, 24]
	uxtw	x1, w21
	ldr	x4, [x19, 232]
	ldp	x3, x2, [x19, 304]
	madd	x1, x1, x5, x4
	ldr	x4, [x19, 256]
	add	x1, x4, x1
.LEHB126:
	blr	x3
.LEHE126:
	fcmpe	s0, s8
	bmi	.L2477
.L2386:
	add	x20, x20, 4
	cmp	x20, x22
	bne	.L2388
	ldrb	w0, [sp, 200]
	cbnz	w0, .L2537
.L2389:
	cbnz	w25, .L2391
.L2457:
	ldr	w0, [sp, 112]
	ldr	w1, [sp, 120]
	sub	w0, w0, #1
	str	w0, [sp, 112]
	cmp	w1, w0
	bne	.L2393
.L2392:
	ldr	w0, [sp, 120]
	tbnz	w0, #31, .L2379
	ldr	w22, [sp, 124]
	mov	x25, 1152921504606846975
	.p2align 3,,7
.L2394:
	ldr	w3, [sp, 120]
	add	x8, sp, 192
	mov	x2, x23
	mov	x0, x19
	mov	w1, w24
.LEHB127:
	bl	_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi
.LEHE127:
	stp	xzr, xzr, [sp, 160]
	ldp	x2, x8, [sp, 192]
	str	xzr, [sp, 176]
	mov	x0, x2
	cmp	x8, x2
	beq	.L2395
	mov	x5, 0
	.p2align 3,,7
.L2415:
	ldr	w0, [x2, 4]
	cmp	w0, w26
	beq	.L2461
	ldr	x0, [sp, 176]
	cmp	x0, x5
	beq	.L2397
	ldr	x0, [x2]
	str	x0, [x5], 8
	mov	x10, x8
	str	x5, [sp, 168]
.L2398:
	ldr	x4, [sp, 160]
	ldr	w8, [x5, -4]
	sub	x0, x5, x4
	ldr	s1, [x5, -8]
	asr	x1, x0, 3
	sub	x2, x1, #2
	sub	x1, x1, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x1, 0
	ble	.L2399
	.p2align 3,,7
.L2402:
	lsl	x3, x2, 3
	lsl	x1, x1, 3
	add	x6, x4, x3
	add	x0, x4, x1
	ldr	s0, [x4, x3]
	fcmpe	s1, s0
	bgt	.L2478
.L2400:
	ldr	x2, [sp, 192]
	str	s1, [x0]
	str	w8, [x0, 4]
	sub	x8, x10, #8
	sub	x0, x10, x2
	cmp	x0, 8
	bgt	.L2538
.L2403:
	str	x8, [sp, 200]
	cmp	x2, x8
	bne	.L2415
	ldr	x0, [sp, 160]
	cmp	x0, x5
	beq	.L2532
	ldr	x2, [x19, 24]
	ldr	x3, [x19, 256]
	mul	x2, x22, x2
	ldr	x1, [x19, 240]
	add	x0, x3, x2
	add	x0, x0, x1
	ldrb	w0, [x0, 2]
	tbz	x0, 0, .L2419
	ldr	x1, [x19, 232]
	mov	x0, x23
	ldr	x4, [x19, 304]
	add	x1, x2, x1
	ldr	x2, [x19, 312]
	add	x1, x3, x1
.LEHB128:
	blr	x4
	ldp	x20, x21, [sp, 160]
	fmov	s8, s0
	ldr	x1, [sp, 176]
	cmp	x21, x1
	beq	.L2420
	add	x3, x21, 8
	ldr	w6, [sp, 124]
	sub	x4, x3, x20
	str	s0, [x21]
	sub	x24, x4, #8
	str	w6, [x21, 4]
	asr	x2, x4, 3
	add	x24, x20, x24
	sub	x0, x2, #2
	sub	x28, x2, #1
	str	x3, [sp, 168]
	add	x0, x0, x0, lsr 63
	asr	x27, x0, 1
.L2421:
	cmp	x28, 0
	ble	.L2430
	.p2align 3,,7
.L2432:
	lsl	x0, x27, 3
	lsl	x28, x28, 3
	add	x1, x20, x0
	add	x24, x20, x28
	ldr	s1, [x20, x0]
	fcmpe	s1, s8
	bmi	.L2481
.L2430:
	ldr	x0, [x19, 72]
	str	s8, [x24]
	str	w6, [x24, 4]
	cmp	x0, x2
	bcc	.L2539
.L2419:
	ldr	w3, [sp, 120]
	add	x2, sp, 160
	mov	w1, w26
	mov	x0, x19
	mov	w4, 1
	bl	_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0
	ldr	x5, [sp, 160]
	mov	w24, w0
.L2532:
	ldr	x0, [sp, 176]
	sub	x1, x0, x5
	cbz	x5, .L2533
	mov	x0, x5
	bl	_ZdlPvm
.L2533:
	ldr	x0, [sp, 192]
.L2395:
	cbz	x0, .L2446
	ldr	w2, [sp, 120]
	ldr	x1, [sp, 208]
	sub	w2, w2, #1
	mov	w20, w2
	str	w2, [sp, 120]
	sub	x1, x1, x0
	bl	_ZdlPvm
	cmn	w20, #1
	bne	.L2394
.L2379:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	d8, [sp, 96]
	ldp	x29, x30, [sp], 224
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2537:
	.cfi_restore_state
	ldr	x0, [sp, 192]
	cbz	x0, .L2389
.L2458:
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	ldr	x1, [x1]
	cbz	x1, .L2389
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	cbnz	w25, .L2391
	b	.L2457
	.p2align 2,,3
.L2478:
	sub	x3, x2, #1
	ldr	w7, [x6, 4]
	str	s0, [x4, x1]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w7, [x0, 4]
	asr	x2, x3, 1
	cmp	x1, 0
	bgt	.L2402
	mov	x0, x6
	b	.L2400
	.p2align 2,,3
.L2481:
	sub	x0, x27, #1
	ldr	w5, [x1, 4]
	str	s1, [x20, x28]
	mov	x28, x27
	add	x0, x0, x0, lsr 63
	str	w5, [x24, 4]
	asr	x27, x0, 1
	cmp	x28, 0
	bgt	.L2432
	mov	x24, x1
	ldr	x0, [x19, 72]
	str	s8, [x24]
	str	w6, [x24, 4]
	cmp	x0, x2
	bcs	.L2419
.L2539:
	cmp	x4, 8
	bgt	.L2540
	str	x21, [sp, 168]
	b	.L2419
	.p2align 2,,3
.L2477:
	fmov	s8, s0
	mov	w24, w21
	mov	w25, 1
	b	.L2386
	.p2align 2,,3
.L2461:
	ldr	x2, [sp, 192]
	mov	x10, x8
	sub	x8, x10, #8
	sub	x0, x10, x2
	cmp	x0, 8
	ble	.L2403
.L2538:
	sub	x3, x8, x2
	ldr	s0, [x2]
	ldr	w4, [x2, 4]
	asr	x11, x3, 3
	ldr	w9, [x10, -4]
	sub	x1, x11, #1
	str	w4, [x10, -4]
	ldr	s2, [x10, -8]
	and	x12, x11, 1
	add	x0, x1, x1, lsr 63
	str	s0, [x10, -8]
	asr	x10, x0, 1
	cmp	x3, 16
	ble	.L2404
	mov	x3, 0
	b	.L2408
	.p2align 2,,3
.L2541:
	mov	x3, x1
.L2408:
	add	x0, x3, 1
	lsl	x1, x0, 1
	lsl	x0, x0, 4
	sub	x7, x1, #1
	add	x6, x2, x0
	lsl	x4, x7, 3
	ldr	s0, [x2, x0]
	add	x0, x2, x4
	ldr	s1, [x2, x4]
	fcmpe	s1, s0
	bgt	.L2479
.L2405:
	lsl	x3, x3, 3
	ldr	w4, [x6, 4]
	add	x0, x2, x3
	str	s0, [x2, x3]
	str	w4, [x0, 4]
	cmp	x10, x1
	bgt	.L2541
	lsl	x4, x1, 3
	cbnz	x12, .L2411
	sub	x0, x11, #2
	add	x0, x0, x0, lsr 63
	cmp	x1, x0, asr 1
	beq	.L2410
	sub	x3, x1, #1
	lsl	x4, x1, 3
	asr	x3, x3, 1
	.p2align 3,,7
.L2414:
	lsl	x0, x3, 3
	add	x6, x2, x4
	add	x7, x2, x0
	ldr	s0, [x2, x0]
	fcmpe	s0, s2
	bmi	.L2480
.L2409:
	str	s2, [x6]
	str	w9, [x6, 4]
	b	.L2403
	.p2align 2,,3
.L2480:
	sub	x0, x3, #1
	str	s0, [x2, x4]
	ldr	w4, [x7, 4]
	mov	x1, x3
	add	x0, x0, x0, lsr 63
	str	w4, [x6, 4]
	asr	x3, x0, 1
	cbz	x1, .L2542
	lsl	x4, x1, 3
	b	.L2414
	.p2align 2,,3
.L2479:
	fmov	s0, s1
	mov	x6, x0
	mov	x1, x7
	b	.L2405
	.p2align 2,,3
.L2383:
	ldr	x0, [x19, 264]
	ldr	x20, [x19, 32]
	ldr	x0, [x0, x21, lsl 3]
	madd	x20, x27, x20, x0
	ldrh	w22, [x20]
	cbnz	w22, .L2543
.L2385:
	ldr	x0, [sp, 192]
	cbz	x0, .L2457
	mov	w25, 0
	b	.L2458
.L2404:
	mov	x6, x2
	cbnz	x12, .L2409
	cmp	x1, 2
	bhi	.L2409
	mov	x1, 0
.L2410:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x4, x1, 3
	add	x0, x2, x4
	ldr	s0, [x2, x4]
	ldr	w0, [x0, 4]
	str	w0, [x6, 4]
	str	s0, [x6]
.L2411:
	sub	x1, x1, #1
	asr	x3, x1, 1
	b	.L2414
	.p2align 2,,3
.L2542:
	mov	x6, x7
	str	s2, [x6]
	str	w9, [x6, 4]
	b	.L2403
	.p2align 2,,3
.L2397:
	mov	x1, x5
	add	x0, sp, 160
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRKS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE128:
	ldr	x5, [sp, 168]
	ldr	x10, [sp, 200]
	b	.L2398
.L2446:
	ldr	w0, [sp, 120]
	sub	w0, w0, #1
	str	w0, [sp, 120]
	cmn	w0, #1
	bne	.L2394
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldr	d8, [sp, 96]
	ldp	x29, x30, [sp], 224
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_def_cfa_offset 0
	ret
.L2399:
	.cfi_restore_state
	sub	x0, x0, #8
	add	x0, x4, x0
	b	.L2400
.L2420:
	sub	x27, x21, x20
	asr	x0, x27, 3
	cmp	x0, x25
	beq	.L2544
	cmp	x0, 0
	csinc	x2, x0, xzr, ne
	adds	x0, x0, x2
	bcs	.L2424
	cbnz	x0, .L2545
	mov	x3, 8
	mov	x7, 0
	mov	x5, 0
.L2426:
	add	x0, x5, x27
	ldr	w2, [sp, 124]
	str	s8, [x5, x27]
	str	w2, [x0, 4]
	cmp	x21, x20
	beq	.L2468
	mov	x21, x0
	mov	x2, x20
	mov	x0, x5
	.p2align 3,,7
.L2428:
	ldr	x3, [x2], 8
	str	x3, [x0], 8
	cmp	x0, x21
	bne	.L2428
	add	x3, x21, 8
	sub	x4, x3, x5
	sub	x24, x4, #8
	asr	x2, x4, 3
	add	x24, x5, x24
	sub	x0, x2, #2
	sub	x28, x2, #1
	add	x0, x0, x0, lsr 63
	asr	x27, x0, 1
.L2427:
	cbz	x20, .L2429
	sub	x1, x1, x20
	mov	x0, x20
	str	x3, [sp, 112]
	stp	x5, x7, [sp, 128]
	stp	x4, x2, [sp, 144]
	bl	_ZdlPvm
	ldp	x5, x7, [sp, 128]
	ldp	x4, x2, [sp, 144]
	ldr	x3, [sp, 112]
.L2429:
	mov	x20, x5
	ldr	w6, [x21, 4]
	stp	x5, x3, [sp, 160]
	ldr	s8, [x21]
	str	x7, [sp, 176]
	b	.L2421
.L2380:
	ldr	w24, [sp, 124]
	ble	.L2392
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC39
	mov	x19, x0
	add	x1, x1, :lo12:.LC39
.LEHB129:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE129:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x19
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB130:
	bl	__cxa_throw
.LEHE130:
	.p2align 2,,3
.L2540:
	sub	x1, x21, x20
	ldr	s0, [x20]
	ldr	w2, [x20, 4]
	asr	x8, x1, 3
	ldr	w6, [x3, -4]
	sub	x0, x8, #1
	str	w2, [x3, -4]
	ldr	s2, [x3, -8]
	and	x9, x8, 1
	add	x7, x0, x0, lsr 63
	str	s0, [x3, -8]
	asr	x7, x7, 1
	cmp	x1, 16
	ble	.L2435
	mov	x1, 0
	b	.L2439
.L2546:
	mov	x1, x0
.L2439:
	add	x2, x1, 1
	lsl	x0, x2, 1
	lsl	x2, x2, 4
	sub	x5, x0, #1
	add	x4, x20, x2
	lsl	x3, x5, 3
	ldr	s0, [x20, x2]
	add	x2, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L2482
.L2436:
	lsl	x1, x1, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x7, x0
	bgt	.L2546
	lsl	x3, x0, 3
	cbz	x9, .L2547
.L2442:
	sub	x0, x0, #1
	asr	x1, x0, 1
.L2445:
	lsl	x0, x1, 3
	add	x4, x20, x3
	add	x5, x20, x0
	ldr	s0, [x20, x0]
	fcmpe	s0, s2
	bmi	.L2483
.L2440:
	str	w6, [x4, 4]
	str	s2, [x4]
.L2549:
	str	x21, [sp, 168]
	b	.L2419
.L2483:
	sub	x2, x1, #1
	str	s0, [x20, x3]
	ldr	w3, [x5, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x4, 4]
	asr	x1, x2, 1
	cbz	x0, .L2548
	lsl	x3, x0, 3
	b	.L2445
.L2482:
	fmov	s0, s1
	mov	x4, x2
	mov	x0, x5
	b	.L2436
.L2545:
	cmp	x0, x25
	csel	x0, x0, x25, ls
	lsl	x24, x0, 3
.L2425:
	mov	x0, x24
.LEHB131:
	bl	_Znwm
.LEHE131:
	mov	x5, x0
	add	x7, x0, x24
	add	x3, x0, 8
	ldr	x1, [sp, 176]
	b	.L2426
.L2547:
	sub	x8, x8, #2
	add	x8, x8, x8, lsr 63
	cmp	x0, x8, asr 1
	beq	.L2441
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	b	.L2445
.L2548:
	mov	x4, x5
	str	s2, [x4]
	str	w6, [x4, 4]
	b	.L2549
.L2468:
	mov	x24, x5
	mov	x21, x5
	mov	x27, 0
	mov	x28, 0
	mov	x2, 1
	mov	x4, 8
	b	.L2427
.L2435:
	mov	x4, x20
	cbnz	x9, .L2440
	cmp	x0, 2
	bhi	.L2440
	mov	x0, 0
.L2441:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x20, x3
	ldr	s0, [x20, x3]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
	b	.L2442
.L2535:
	mov	w0, 1
.LEHB132:
	bl	_ZSt20__throw_system_errori
.LEHE132:
.L2544:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB133:
	bl	_ZSt20__throw_length_errorPKc
.LEHE133:
	.p2align 2,,3
.L2536:
.LEHB134:
	bl	_ZSt20__throw_system_errori
.L2424:
	mov	x24, 9223372036854775800
	b	.L2425
.L2476:
	ldr	x2, [sp, 160]
	mov	x19, x0
	ldr	x1, [sp, 176]
	sub	x1, x1, x2
	cbz	x2, .L2453
	mov	x0, x2
	bl	_ZdlPvm
.L2453:
	ldr	x0, [sp, 192]
	ldr	x1, [sp, 208]
	sub	x1, x1, x0
	cbz	x0, .L2534
	bl	_ZdlPvm
.L2534:
	mov	x0, x19
	bl	_Unwind_Resume
.LEHE134:
.L2474:
	ldrb	w1, [sp, 200]
	mov	x19, x0
	cbz	w1, .L2534
	add	x0, sp, 192
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2534
.L2475:
	mov	x1, x0
	mov	x0, x19
	mov	x19, x1
	bl	__cxa_free_exception
	b	.L2534
	.cfi_endproc
.LFE12131:
	.section	.gcc_except_table
.LLSDA12131:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE12131-.LLSDACSB12131
.LLSDACSB12131:
	.uleb128 .LEHB125-.LFB12131
	.uleb128 .LEHE125-.LEHB125
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB126-.LFB12131
	.uleb128 .LEHE126-.LEHB126
	.uleb128 .L2474-.LFB12131
	.uleb128 0
	.uleb128 .LEHB127-.LFB12131
	.uleb128 .LEHE127-.LEHB127
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB128-.LFB12131
	.uleb128 .LEHE128-.LEHB128
	.uleb128 .L2476-.LFB12131
	.uleb128 0
	.uleb128 .LEHB129-.LFB12131
	.uleb128 .LEHE129-.LEHB129
	.uleb128 .L2475-.LFB12131
	.uleb128 0
	.uleb128 .LEHB130-.LFB12131
	.uleb128 .LEHE130-.LEHB130
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB131-.LFB12131
	.uleb128 .LEHE131-.LEHB131
	.uleb128 .L2476-.LFB12131
	.uleb128 0
	.uleb128 .LEHB132-.LFB12131
	.uleb128 .LEHE132-.LEHB132
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB133-.LFB12131
	.uleb128 .LEHE133-.LEHB133
	.uleb128 .L2476-.LFB12131
	.uleb128 0
	.uleb128 .LEHB134-.LFB12131
	.uleb128 .LEHE134-.LEHB134
	.uleb128 0
	.uleb128 0
.LLSDACSE12131:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii, .-_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm,"axG",@progbits,_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm
	.type	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm, %function
_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm:
.LFB13165:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13165
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -16
	.cfi_offset 22, -8
	mov	x21, x0
	cmp	x1, 1
	beq	.L2572
	mov	x20, x2
	mov	x0, 1152921504606846975
	cmp	x1, x0
	bhi	.L2573
	lsl	x22, x1, 3
	mov	x0, x22
.LEHB135:
	bl	_Znwm
	mov	x20, x0
	mov	x2, x22
	mov	w1, 0
	bl	memset
	add	x8, x21, 48
.L2552:
	ldr	x4, [x21, 16]
	str	xzr, [x21, 16]
	cbz	x4, .L2555
	add	x7, x21, 16
	mov	x6, 0
	.p2align 3,,7
.L2556:
	ldr	w5, [x4, 8]
	mov	x3, x4
	ldr	x4, [x4]
	udiv	x2, x5, x19
	msub	x2, x2, x19, x5
	ldr	x1, [x20, x2, lsl 3]
	cbz	x1, .L2574
	ldr	x0, [x1]
	str	x0, [x3]
	ldr	x0, [x20, x2, lsl 3]
	str	x3, [x0]
	cbnz	x4, .L2556
.L2555:
	ldp	x0, x1, [x21]
	cmp	x0, x8
	beq	.L2559
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L2559:
	stp	x20, x19, [x21]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2574:
	.cfi_restore_state
	ldr	x0, [x21, 16]
	str	x0, [x3]
	str	x3, [x21, 16]
	str	x7, [x20, x2, lsl 3]
	ldr	x0, [x3]
	cbz	x0, .L2561
	str	x3, [x20, x6, lsl 3]
	mov	x6, x2
	cbnz	x4, .L2556
	b	.L2555
	.p2align 2,,3
.L2561:
	mov	x6, x2
	cbnz	x4, .L2556
	b	.L2555
	.p2align 2,,3
.L2572:
	mov	x20, x0
	str	xzr, [x20, 48]!
	mov	x8, x20
	b	.L2552
.L2573:
	bl	_ZSt17__throw_bad_allocv
.LEHE135:
.L2563:
	bl	__cxa_begin_catch
	ldr	x0, [x20]
	str	x0, [x21, 40]
.LEHB136:
	bl	__cxa_rethrow
.LEHE136:
.L2562:
	mov	x19, x0
	bl	__cxa_end_catch
	mov	x0, x19
.LEHB137:
	bl	_Unwind_Resume
.LEHE137:
	.cfi_endproc
.LFE13165:
	.section	.gcc_except_table
	.align	2
.LLSDA13165:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT13165-.LLSDATTD13165
.LLSDATTD13165:
	.byte	0x1
	.uleb128 .LLSDACSE13165-.LLSDACSB13165
.LLSDACSB13165:
	.uleb128 .LEHB135-.LFB13165
	.uleb128 .LEHE135-.LEHB135
	.uleb128 .L2563-.LFB13165
	.uleb128 0x1
	.uleb128 .LEHB136-.LFB13165
	.uleb128 .LEHE136-.LEHB136
	.uleb128 .L2562-.LFB13165
	.uleb128 0
	.uleb128 .LEHB137-.LFB13165
	.uleb128 .LEHE137-.LEHB137
	.uleb128 0
	.uleb128 0
.LLSDACSE13165:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT13165:
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm,"axG",@progbits,_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm,comdat
	.size	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm, .-_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,comdat
	.align	2
	.p2align 4,,11
	.type	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0, %function
_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0:
.LFB13661:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13661
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	ldr	w7, [x1]
	ldr	x5, [x0, 8]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	uxtw	x21, w7
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x20, x0
	udiv	x2, x21, x5
	ldr	x0, [x0]
	msub	x2, x2, x5, x21
	lsl	x22, x2, 3
	ldr	x0, [x0, x2, lsl 3]
	str	x23, [sp, 48]
	.cfi_offset 23, -32
	mov	x23, x1
	cbz	x0, .L2576
	ldr	x0, [x0]
	ldr	w3, [x0, 8]
.L2578:
	cmp	w7, w3
	beq	.L2577
	ldr	x0, [x0]
	cbz	x0, .L2576
	ldr	w3, [x0, 8]
	uxtw	x6, w3
	udiv	x4, x6, x5
	msub	x4, x4, x5, x6
	cmp	x2, x4
	beq	.L2578
.L2576:
	mov	x0, 16
.LEHB138:
	bl	_Znwm
.LEHE138:
	ldr	w4, [x23]
	mov	x19, x0
	ldr	x1, [x20, 8]
	add	x0, x20, 32
	ldr	x2, [x20, 24]
	mov	x3, 1
	ldr	x5, [x20, 40]
	str	xzr, [x19]
	str	w4, [x19, 8]
	str	x5, [sp, 72]
.LEHB139:
	bl	_ZNKSt8__detail20_Prime_rehash_policy14_M_need_rehashEmmm
	tst	w0, 255
	bne	.L2601
.L2579:
	ldr	x0, [x20]
	add	x2, x0, x22
	ldr	x1, [x0, x22]
	cbz	x1, .L2580
	ldr	x1, [x1]
	str	x1, [x19]
	ldr	x0, [x0, x22]
	str	x19, [x0]
.L2581:
	ldr	x2, [x20, 24]
	mov	x3, 1
	mov	x1, 0
	mov	x0, x19
	add	x2, x2, x3
	str	x2, [x20, 24]
	bfi	x1, x3, 0, 8
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2577:
	.cfi_restore_state
	mov	x1, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldr	x23, [sp, 48]
	ldp	x29, x30, [sp], 80
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2601:
	.cfi_restore_state
	add	x2, sp, 72
	mov	x0, x20
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_rehashEmRKm
.LEHE139:
	ldr	x0, [x20, 8]
	udiv	x22, x21, x0
	msub	x22, x22, x0, x21
	lsl	x22, x22, 3
	b	.L2579
	.p2align 2,,3
.L2580:
	ldr	x1, [x20, 16]
	str	x1, [x19]
	str	x19, [x20, 16]
	cbz	x1, .L2582
	ldr	w4, [x1, 8]
	ldr	x3, [x20, 8]
	udiv	x1, x4, x3
	msub	x1, x1, x3, x4
	str	x19, [x0, x1, lsl 3]
.L2582:
	add	x0, x20, 16
	str	x0, [x2]
	b	.L2581
.L2585:
	mov	x1, 16
	mov	x20, x0
	mov	x0, x19
	bl	_ZdlPvm
	mov	x0, x20
.LEHB140:
	bl	_Unwind_Resume
.LEHE140:
	.cfi_endproc
.LFE13661:
	.section	.gcc_except_table
.LLSDA13661:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13661-.LLSDACSB13661
.LLSDACSB13661:
	.uleb128 .LEHB138-.LFB13661
	.uleb128 .LEHE138-.LEHB138
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB139-.LFB13661
	.uleb128 .LEHE139-.LEHB139
	.uleb128 .L2585-.LFB13661
	.uleb128 0
	.uleb128 .LEHB140-.LFB13661
	.uleb128 .LEHE140-.LEHB140
	.uleb128 0
	.uleb128 0
.LLSDACSE13661:
	.section	.text._ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,comdat
	.size	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0, .-_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf
	.type	_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf, %function
_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf:
.LFB11697:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11697
	stp	x29, x30, [sp, -336]!
	.cfi_def_cfa_offset 336
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	uxtw	x3, w2
	mov	x29, sp
	ldr	x5, [x0, 24]
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -240
	.cfi_offset 73, -232
	fmov	s8, s0
	ldr	x4, [x0, 232]
	str	w2, [sp, 172]
	ldr	x2, [x0, 296]
	stp	x19, x20, [sp, 16]
	madd	x3, x3, x5, x4
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	mov	x20, x0
	str	x1, [sp, 160]
	ldr	x0, [x0, 256]
	add	x0, x0, x3
	bl	memcpy
	ldr	w1, [x20, 104]
	ldr	w0, [x20, 216]
	ldr	w3, [sp, 172]
	str	w1, [sp, 156]
	str	w0, [sp, 168]
	cmp	w3, w0
	beq	.L2843
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -296
	.cfi_offset 21, -304
.L2603:
	uxtw	x21, w3
	ldr	x0, [x20, 272]
	ldr	w0, [x0, x21, lsl 2]
	str	w0, [sp, 152]
	tbnz	w0, #31, .L2605
	movi	v9.2s, 0x30, lsl 24
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -248
	.cfi_offset 27, -256
	add	x28, x20, 192
	mov	x0, -1
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -280
	.cfi_offset 23, -288
	mov	w24, 0
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -264
	.cfi_offset 25, -272
	str	x0, [sp, 128]
	stp	d10, d11, [sp, 112]
	.cfi_offset 75, -216
	.cfi_offset 74, -224
	.p2align 3,,7
.L2623:
	mov	w5, 48
	ldr	x0, [x28]
	fmov	s0, 1.0e+0
	mov	x4, 1
	add	x2, sp, 272
	add	x1, sp, 328
	strb	wzr, [sp, 200]
	umaddl	x0, w3, w5, x0
	stp	x2, x4, [sp, 224]
	str	x0, [sp, 192]
	stp	xzr, xzr, [sp, 240]
	stp	xzr, xzr, [sp, 264]
	stp	x1, x4, [sp, 280]
	stp	xzr, xzr, [sp, 296]
	stp	xzr, xzr, [sp, 320]
	str	s0, [sp, 256]
	str	s0, [sp, 312]
	cbz	x0, .L2844
	adrp	x1, .LC12
	ldr	x25, [x1, #:lo12:.LC12]
	cbz	x25, .L2607
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2845
.L2607:
	mov	w0, 1
	strb	w0, [sp, 200]
	cbnz	w24, .L2608
	ldr	x0, [x20, 24]
	ldr	x1, [x20, 240]
	ldr	x19, [x20, 256]
	madd	x0, x21, x0, x1
	add	x19, x19, x0
	ldrh	w0, [x19]
	ldrh	w27, [x19]
	cbz	w0, .L2610
.L2863:
	ubfiz	x27, x0, 2, 16
	mov	x0, x27
.LEHB141:
	bl	_Znwm
.LEHE141:
	mov	x26, x0
	mov	x2, x27
	mov	w1, 0
	bl	memset
	mov	x2, x27
	add	x1, x19, 4
	mov	x0, x26
	bl	memcpy
	ldrb	w0, [sp, 200]
	add	x21, x26, x27
	cbnz	w0, .L2846
.L2611:
	cmp	x26, x21
	beq	.L2847
	add	x1, sp, 172
	add	x0, sp, 224
.LEHB142:
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0
	movi	v11.2s, #0
	mov	x19, x26
	mov	w0, 1065353215
	fmov	s10, w0
.L2641:
	mov	x1, x19
	add	x0, sp, 224
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0
	ldr	x1, [x20, 432]
	mov	x0, 16807
	fmov	s1, 1.0e+0
	mul	x1, x1, x0
	mov	x0, 5
	movk	x0, 0x2, lsl 32
	umulh	x2, x1, x0
	sub	x0, x1, x2
	add	x0, x2, x0, lsr 1
	lsr	x0, x0, 30
	lsl	x2, x0, 31
	sub	x0, x2, x0
	sub	x0, x1, x0
	str	x0, [x20, 432]
	sub	x0, x0, #1
	ucvtf	s0, x0
	fadd	s0, s0, s11
	fmul	s0, s0, s9
	fcmpe	s0, s1
	bge	.L2723
	fadd	s0, s0, s11
.L2624:
	fcmpe	s8, s0
	bmi	.L2627
	mov	x1, x19
	add	x0, sp, 280
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0
.LEHE142:
	ldr	w0, [x19]
	mov	w2, 48
	ldr	x1, [x28]
	uxtw	x22, w0
	strb	wzr, [sp, 200]
	umaddl	x0, w0, w2, x1
	str	x0, [sp, 192]
	cbz	x0, .L2848
	cbz	x25, .L2629
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2849
.L2629:
	mov	w0, 1
	strb	w0, [sp, 200]
	cbnz	w24, .L2630
	ldr	x2, [x20, 24]
	ldr	x1, [x20, 240]
	ldr	x0, [x20, 256]
	madd	x22, x22, x2, x1
	add	x22, x0, x22
	ldrh	w0, [x22]
	ldrh	w23, [x22]
	cbz	w0, .L2632
.L2864:
	ubfiz	x23, x0, 2, 16
	mov	x0, x23
.LEHB143:
	bl	_Znwm
.LEHE143:
	mov	x2, x23
	mov	w1, 0
	str	x0, [sp, 144]
	bl	memset
	add	x1, x22, 4
	mov	x2, x23
	ldr	x22, [sp, 144]
	mov	x0, x22
	bl	memcpy
	ldrb	w0, [sp, 200]
	add	x1, x22, x23
	str	x1, [sp, 136]
	cbnz	w0, .L2850
.L2633:
	ldp	x1, x0, [sp, 136]
	mov	x22, x0
	cmp	x1, x0
	beq	.L2636
.L2640:
	mov	x1, x22
	add	x0, sp, 224
.LEHB144:
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE9_M_insertIRKjNS1_10_AllocNodeISaINS1_10_Hash_nodeIjLb0EEEEEEEESt4pairINS1_14_Node_iteratorIjLb1ELb0EEEbEOT_RKT0_St17integral_constantIbLb1EEm.constprop.0
.LEHE144:
	ldr	x0, [sp, 136]
	add	x22, x22, 4
	cmp	x0, x22
	bne	.L2640
.L2636:
	ldr	x0, [sp, 144]
	mov	x1, x23
	bl	_ZdlPvm
.L2627:
	add	x19, x19, 4
	cmp	x21, x19
	bne	.L2641
	ldr	x21, [sp, 296]
	cbz	x21, .L2704
	.p2align 3,,7
.L2642:
	ldp	x2, x3, [sp, 224]
	ldr	w0, [x21, 8]
	stp	xzr, xzr, [sp, 192]
	uxtw	x1, w0
	udiv	x5, x1, x3
	msub	x5, x5, x3, x1
	ldr	x1, [x2, x5, lsl 3]
	str	xzr, [sp, 208]
	cbz	x1, .L2645
	ldr	x1, [x1]
	ldr	w2, [x1, 8]
.L2647:
	cmp	w0, w2
	beq	.L2646
	ldr	x1, [x1]
	cbz	x1, .L2645
	ldr	w2, [x1, 8]
	uxtw	x6, w2
	udiv	x4, x6, x3
	msub	x4, x4, x3, x6
	cmp	x5, x4
	beq	.L2647
.L2645:
	ldr	x1, [sp, 248]
.L2713:
	ldr	x22, [x20, 72]
	ldr	x19, [sp, 240]
	cmp	x22, x1
	csel	x22, x22, x1, ls
	cbnz	x19, .L2678
	b	.L2648
	.p2align 2,,3
.L2651:
	ldr	s1, [x0]
	fcmpe	s1, s0
	bgt	.L2742
.L2658:
	ldr	x19, [x19]
	cbz	x19, .L2648
.L2650:
	ldr	w0, [x21, 8]
.L2678:
	ldr	w1, [x19, 8]
	add	x23, x19, 8
	cmp	w1, w0
	beq	.L2658
	ldr	x5, [x20, 24]
	uxtw	x1, w1
	ldr	x4, [x20, 232]
	uxtw	x0, w0
	ldp	x6, x2, [x20, 304]
	ldr	x3, [x20, 256]
	madd	x1, x1, x5, x4
	madd	x0, x0, x5, x4
	add	x1, x3, x1
	add	x0, x3, x0
.LEHB145:
	blr	x6
	ldp	x0, x1, [sp, 192]
	str	s0, [sp, 188]
	sub	x2, x1, x0
	cmp	x22, x2, asr 3
	bls	.L2651
	ldr	x2, [sp, 208]
	cmp	x1, x2
	beq	.L2652
	add	x2, x1, 8
	ldr	w7, [x19, 8]
	sub	x3, x2, x0
	str	s0, [x1]
	str	w7, [x1, 4]
	asr	x1, x3, 3
	str	x2, [sp, 200]
	sub	x2, x1, #2
	sub	x1, x1, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x1, 0
	ble	.L2654
	.p2align 3,,7
.L2657:
	lsl	x3, x2, 3
	lsl	x1, x1, 3
	add	x5, x0, x3
	add	x4, x0, x1
	ldr	s1, [x0, x3]
	fcmpe	s1, s0
	bmi	.L2741
	str	w7, [x4, 4]
	str	s0, [x4]
.L2854:
	ldr	x19, [x19]
	cbnz	x19, .L2650
.L2648:
	ldp	x3, x2, [x20, 56]
	cmp	w24, 0
	add	x1, sp, 192
	mov	x0, x20
	csel	x2, x3, x2, ne
	bl	_ZN7hnswlib15HierarchicalNSWIfE24getNeighborsByHeuristic2ERSt14priority_queueISt4pairIfjESt6vectorIS4_SaIS4_EENS1_14CompareByFirstEEm
	ldr	w19, [x21, 8]
	mov	w2, 48
	ldr	x1, [x28]
	uxtw	x0, w19
	umaddl	x19, w19, w2, x1
	cbz	x19, .L2851
	cbz	x25, .L2681
	mov	x0, x19
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L2682
	ldr	w0, [x21, 8]
.L2681:
	cbnz	w24, .L2683
	ldr	x3, [x20, 24]
	ldr	x1, [x20, 240]
	ldr	x2, [x20, 256]
	madd	x0, x0, x3, x1
	add	x2, x2, x0
.L2684:
	ldp	x0, x5, [sp, 192]
	mov	x6, x2
	sub	x1, x5, x0
	asr	x3, x1, 3
	strh	w3, [x2]
	add	x7, x2, x3, lsl 2
	cbnz	x3, .L2701
	b	.L2700
	.p2align 2,,3
.L2688:
	add	x6, x6, 4
	str	x5, [sp, 200]
	cmp	x6, x7
	beq	.L2700
.L2853:
	sub	x1, x5, x0
.L2701:
	ldr	w2, [x0, 4]
	sub	x5, x5, #8
	str	w2, [x6, 4]
	cmp	x1, 8
	ble	.L2688
	sub	x1, x5, x0
	ldr	s0, [x0]
	ldr	w8, [x5, 4]
	asr	x13, x1, 3
	str	w2, [x5, 4]
	sub	x3, x13, #1
	ldr	s2, [x5]
	str	s0, [x5]
	and	x12, x13, 1
	add	x11, x3, x3, lsr 63
	asr	x11, x11, 1
	cmp	x1, 16
	ble	.L2689
	mov	x2, 0
	b	.L2693
	.p2align 2,,3
.L2852:
	mov	x2, x1
.L2693:
	add	x3, x2, 1
	lsl	x1, x3, 1
	lsl	x3, x3, 4
	sub	x9, x1, #1
	add	x10, x0, x3
	lsl	x4, x9, 3
	ldr	s0, [x0, x3]
	add	x3, x0, x4
	ldr	s1, [x0, x4]
	fcmpe	s1, s0
	bgt	.L2746
.L2690:
	lsl	x2, x2, 3
	ldr	w4, [x10, 4]
	add	x3, x0, x2
	str	s0, [x0, x2]
	str	w4, [x3, 4]
	cmp	x11, x1
	bgt	.L2852
	lsl	x4, x1, 3
	cbnz	x12, .L2696
	sub	x13, x13, #2
	add	x13, x13, x13, lsr 63
	cmp	x1, x13, asr 1
	beq	.L2695
	sub	x2, x1, #1
	lsl	x4, x1, 3
	asr	x2, x2, 1
	.p2align 3,,7
.L2699:
	lsl	x1, x2, 3
	add	x9, x0, x4
	add	x10, x0, x1
	ldr	s0, [x0, x1]
	fcmpe	s2, s0
	bgt	.L2747
.L2694:
	str	w8, [x9, 4]
	str	s2, [x9]
.L2858:
	add	x6, x6, 4
	str	x5, [sp, 200]
	cmp	x6, x7
	bne	.L2853
.L2700:
	cbz	x25, .L2687
	mov	x0, x19
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	ldr	x0, [sp, 192]
.L2687:
	cbz	x0, .L2702
	ldr	x1, [sp, 208]
	sub	x1, x1, x0
	bl	_ZdlPvm
	ldr	x21, [x21]
	cbnz	x21, .L2642
.L2704:
	mov	x1, x27
	mov	x0, x26
	bl	_ZdlPvm
	ldr	x19, [sp, 296]
	cbz	x19, .L2643
	.p2align 3,,7
.L2644:
	mov	x0, x19
	mov	x1, 16
	ldr	x19, [x19]
	bl	_ZdlPvm
	cbnz	x19, .L2644
.L2643:
	ldp	x0, x2, [sp, 280]
	mov	w1, 0
	lsl	x2, x2, 3
	bl	memset
	ldp	x0, x1, [sp, 280]
	add	x2, sp, 328
	stp	xzr, xzr, [sp, 296]
	cmp	x0, x2
	beq	.L2705
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L2705:
	ldr	x19, [sp, 240]
	cbz	x19, .L2709
	.p2align 3,,7
.L2707:
	mov	x0, x19
	mov	x1, 16
	ldr	x19, [x19]
	bl	_ZdlPvm
	cbnz	x19, .L2707
.L2709:
	ldp	x0, x2, [sp, 224]
	mov	w1, 0
	lsl	x2, x2, 3
	bl	memset
	ldp	x0, x1, [sp, 224]
	add	x2, sp, 272
	stp	xzr, xzr, [sp, 240]
	cmp	x0, x2
	beq	.L2622
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L2622:
	ldr	x0, [sp, 128]
	add	w24, w24, 1
	ldr	w3, [sp, 172]
	add	x0, x0, 1
	str	x0, [sp, 128]
	ldr	w0, [sp, 152]
	cmp	w0, w24
	blt	.L2840
	uxtw	x21, w3
	b	.L2623
	.p2align 2,,3
.L2741:
	sub	x3, x2, #1
	ldr	w6, [x5, 4]
	str	s1, [x0, x1]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w6, [x4, 4]
	asr	x2, x3, 1
	cmp	x1, 0
	bgt	.L2657
	mov	x4, x5
.L2856:
	str	s0, [x4]
	str	w7, [x4, 4]
	b	.L2854
	.p2align 2,,3
.L2742:
	sub	x6, x1, #8
	cmp	x2, 8
	bgt	.L2855
	ldr	x0, [sp, 208]
	str	x6, [sp, 200]
	cmp	x0, x6
	beq	.L2672
.L2860:
	ldr	w7, [x19, 8]
	str	s0, [x1, -8]
	str	w7, [x1, -4]
	str	x1, [sp, 200]
.L2673:
	ldr	x3, [sp, 192]
	sub	x2, x1, x3
	asr	x0, x2, 3
	sub	x1, x0, #2
	sub	x0, x0, #1
	add	x1, x1, x1, lsr 63
	asr	x1, x1, 1
	cmp	x0, 0
	ble	.L2674
	.p2align 3,,7
.L2677:
	lsl	x2, x1, 3
	lsl	x0, x0, 3
	add	x5, x3, x2
	add	x4, x3, x0
	ldr	s1, [x3, x2]
	fcmpe	s1, s0
	bmi	.L2745
	str	s0, [x4]
	str	w7, [x4, 4]
	b	.L2854
	.p2align 2,,3
.L2745:
	sub	x2, x1, #1
	ldr	w6, [x5, 4]
	str	s1, [x3, x0]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w6, [x4, 4]
	asr	x1, x2, 1
	cmp	x0, 0
	bgt	.L2677
	mov	x4, x5
	b	.L2856
	.p2align 2,,3
.L2747:
	sub	x3, x2, #1
	str	s0, [x0, x4]
	ldr	w4, [x10, 4]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w4, [x9, 4]
	asr	x2, x3, 1
	cbz	x1, .L2857
	lsl	x4, x1, 3
	b	.L2699
	.p2align 2,,3
.L2746:
	fmov	s0, s1
	mov	x10, x3
	mov	x1, x9
	b	.L2690
	.p2align 2,,3
.L2689:
	mov	x9, x0
	cbnz	x12, .L2694
	cmp	x3, 2
	bhi	.L2694
	mov	x10, x0
	mov	x1, 0
	.p2align 3,,7
.L2695:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x4, x1, 3
	add	x2, x0, x4
	ldr	s0, [x0, x4]
	ldr	w2, [x2, 4]
	str	w2, [x10, 4]
	str	s0, [x10]
.L2696:
	sub	x1, x1, #1
	asr	x2, x1, 1
	b	.L2699
	.p2align 2,,3
.L2857:
	mov	x9, x10
	str	s2, [x9]
	str	w8, [x9, 4]
	b	.L2858
	.p2align 2,,3
.L2646:
	ldr	x1, [sp, 248]
	sub	x1, x1, #1
	b	.L2713
	.p2align 2,,3
.L2683:
	ldr	x1, [x20, 264]
	ldr	x2, [x20, 32]
	ldr	x0, [x1, x0, lsl 3]
	ldr	x1, [sp, 128]
	madd	x2, x1, x2, x0
	b	.L2684
	.p2align 2,,3
.L2855:
	sub	x3, x6, x0
	ldr	w4, [x0, 4]
	ldr	w8, [x1, -4]
	asr	x11, x3, 3
	str	w4, [x1, -4]
	sub	x2, x11, #1
	ldr	s3, [x1, -8]
	str	s1, [x1, -8]
	and	x12, x11, 1
	add	x10, x2, x2, lsr 63
	asr	x10, x10, 1
	cmp	x3, 16
	ble	.L2661
	mov	x4, 0
	b	.L2665
	.p2align 2,,3
.L2859:
	mov	x4, x2
.L2665:
	add	x3, x4, 1
	lsl	x2, x3, 1
	lsl	x3, x3, 4
	sub	x9, x2, #1
	add	x7, x0, x3
	lsl	x5, x9, 3
	ldr	s1, [x0, x3]
	add	x3, x0, x5
	ldr	s2, [x0, x5]
	fcmpe	s2, s1
	bgt	.L2743
.L2662:
	lsl	x3, x4, 3
	ldr	w5, [x7, 4]
	add	x4, x0, x3
	str	s1, [x0, x3]
	str	w5, [x4, 4]
	cmp	x10, x2
	bgt	.L2859
	lsl	x5, x2, 3
	cbnz	x12, .L2668
	sub	x11, x11, #2
	add	x11, x11, x11, lsr 63
	cmp	x2, x11, asr 1
	beq	.L2667
	sub	x3, x2, #1
	lsl	x5, x2, 3
	asr	x3, x3, 1
	.p2align 3,,7
.L2671:
	lsl	x2, x3, 3
	add	x7, x0, x5
	add	x9, x0, x2
	ldr	s1, [x0, x2]
	fcmpe	s1, s3
	bmi	.L2744
.L2666:
	str	w8, [x7, 4]
	str	s3, [x7]
.L2862:
	ldr	x0, [sp, 208]
	str	x6, [sp, 200]
	cmp	x0, x6
	bne	.L2860
.L2672:
	mov	x3, x23
	mov	x1, x6
	add	x2, sp, 188
	add	x0, sp, 192
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	ldr	x1, [sp, 200]
	ldr	w7, [x1, -4]
	ldr	s0, [x1, -8]
	b	.L2673
	.p2align 2,,3
.L2744:
	sub	x4, x3, #1
	str	s1, [x0, x5]
	ldr	w5, [x9, 4]
	mov	x2, x3
	add	x4, x4, x4, lsr 63
	str	w5, [x7, 4]
	asr	x3, x4, 1
	cbz	x2, .L2861
	lsl	x5, x2, 3
	b	.L2671
	.p2align 2,,3
.L2743:
	fmov	s1, s2
	mov	x7, x3
	mov	x2, x9
	b	.L2662
	.p2align 2,,3
.L2702:
	ldr	x21, [x21]
	cbnz	x21, .L2642
	b	.L2704
	.p2align 2,,3
.L2652:
	mov	x3, x23
	add	x2, sp, 188
	add	x0, sp, 192
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRKjEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE145:
	ldp	x0, x2, [sp, 192]
	sub	x3, x2, x0
	ldr	w7, [x2, -4]
	ldr	s0, [x2, -8]
	asr	x1, x3, 3
	sub	x2, x1, #2
	sub	x1, x1, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x1, 0
	bgt	.L2657
.L2654:
	sub	x2, x3, #8
	add	x4, x0, x2
	str	s0, [x4]
	str	w7, [x4, 4]
	b	.L2854
.L2661:
	mov	x7, x0
	cbnz	x12, .L2666
	cmp	x2, 2
	bhi	.L2666
	mov	x2, 0
.L2667:
	lsl	x2, x2, 1
	add	x2, x2, 1
	lsl	x5, x2, 3
	add	x3, x0, x5
	ldr	s1, [x0, x5]
	ldr	w3, [x3, 4]
	str	w3, [x7, 4]
	str	s1, [x7]
.L2668:
	sub	x2, x2, #1
	asr	x3, x2, 1
	b	.L2671
.L2861:
	mov	x7, x9
	str	s3, [x7]
	str	w8, [x7, 4]
	b	.L2862
.L2608:
	ldr	x0, [x20, 264]
	ldr	x19, [x20, 32]
	ldr	x0, [x0, x21, lsl 3]
	ldr	x1, [sp, 128]
	madd	x19, x1, x19, x0
	ldrh	w0, [x19]
	ldrh	w27, [x19]
	cbnz	w0, .L2863
.L2610:
	ldr	x0, [sp, 192]
	mov	x26, 0
	mov	x21, 0
	cbz	x0, .L2715
.L2721:
	cbz	x25, .L2611
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L2611
.L2847:
	mov	x0, x26
.L2715:
	mov	x1, x27
	bl	_ZdlPvm
	ldr	x19, [sp, 296]
	cbz	x19, .L2714
	.p2align 3,,7
.L2616:
	mov	x0, x19
	mov	x1, 16
	ldr	x19, [x19]
	bl	_ZdlPvm
	cbnz	x19, .L2616
.L2714:
	ldp	x0, x2, [sp, 280]
	mov	w1, 0
	lsl	x2, x2, 3
	bl	memset
	ldp	x0, x1, [sp, 280]
	add	x2, sp, 328
	stp	xzr, xzr, [sp, 296]
	cmp	x0, x2
	beq	.L2617
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L2617:
	ldr	x19, [sp, 240]
	cbz	x19, .L2709
	.p2align 3,,7
.L2618:
	mov	x0, x19
	mov	x1, 16
	ldr	x19, [x19]
	bl	_ZdlPvm
	cbnz	x19, .L2618
	b	.L2709
.L2674:
	sub	x1, x2, #8
	add	x4, x3, x1
	str	s0, [x4]
	str	w7, [x4, 4]
	b	.L2854
.L2840:
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldp	d10, d11, [sp, 112]
	.cfi_restore 75
	.cfi_restore 74
.L2605:
	mov	x0, x20
	ldp	w4, w5, [sp, 152]
	ldr	w2, [sp, 168]
	ldr	x1, [sp, 160]
.LEHB146:
	bl	_ZN7hnswlib15HierarchicalNSWIfE26repairConnectionsForUpdateEPKvjjii
.LEHE146:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
.L2602:
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 336
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L2846:
	.cfi_def_cfa_offset 336
	.cfi_offset 19, -320
	.cfi_offset 20, -312
	.cfi_offset 21, -304
	.cfi_offset 22, -296
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	.cfi_offset 29, -336
	.cfi_offset 30, -328
	.cfi_offset 72, -240
	.cfi_offset 73, -232
	.cfi_offset 74, -224
	.cfi_offset 75, -216
	ldr	x0, [sp, 192]
	cbz	x0, .L2611
	b	.L2721
	.p2align 2,,3
.L2630:
	ldr	x0, [x20, 264]
	ldr	x1, [x20, 32]
	ldr	x0, [x0, x22, lsl 3]
	ldr	x2, [sp, 128]
	madd	x22, x2, x1, x0
	ldrh	w0, [x22]
	ldrh	w23, [x22]
	cbnz	w0, .L2864
.L2632:
	ldr	x0, [sp, 192]
	cbz	x0, .L2865
	stp	xzr, xzr, [sp, 136]
.L2719:
	cbz	x25, .L2633
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L2633
.L2843:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 74
	.cfi_restore 75
	add	x0, x20, 16
	ldar	x0, [x0]
	cmp	x0, 1
	beq	.L2602
	ldr	w3, [sp, 172]
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -296
	.cfi_offset 21, -304
	b	.L2603
.L2723:
	.cfi_offset 23, -288
	.cfi_offset 24, -280
	.cfi_offset 25, -272
	.cfi_offset 26, -264
	.cfi_offset 27, -256
	.cfi_offset 28, -248
	.cfi_offset 74, -224
	.cfi_offset 75, -216
	fmov	s0, s10
	b	.L2624
.L2865:
	str	xzr, [sp, 144]
	b	.L2636
	.p2align 2,,3
.L2682:
.LEHB147:
	bl	_ZSt20__throw_system_errori
.L2851:
	mov	w0, 1
	bl	_ZSt20__throw_system_errori
.LEHE147:
.L2845:
.LEHB148:
	bl	_ZSt20__throw_system_errori
.LEHE148:
.L2850:
	ldr	x0, [sp, 192]
	cbz	x0, .L2633
	b	.L2719
.L2848:
	mov	w0, 1
.LEHB149:
	bl	_ZSt20__throw_system_errori
.L2849:
	bl	_ZSt20__throw_system_errori
.LEHE149:
	.p2align 2,,3
.L2844:
	mov	w0, w4
.LEHB150:
	bl	_ZSt20__throw_system_errori
.LEHE150:
.L2738:
	ldr	x2, [sp, 192]
	mov	x19, x0
	ldr	x1, [sp, 208]
	sub	x1, x1, x2
	cbnz	x2, .L2866
.L2639:
	mov	x1, x27
	mov	x0, x26
	bl	_ZdlPvm
.L2615:
	add	x0, sp, 280
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED1Ev
	add	x0, sp, 224
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED1Ev
	mov	x0, x19
.LEHB151:
	bl	_Unwind_Resume
.LEHE151:
.L2735:
	mov	x19, x0
	b	.L2615
.L2866:
	mov	x0, x2
	bl	_ZdlPvm
	b	.L2639
.L2736:
	mov	x19, x0
	b	.L2639
.L2739:
	ldrb	w1, [sp, 200]
	mov	x19, x0
	cbz	w1, .L2615
	add	x0, sp, 192
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2615
.L2737:
	mov	x19, x0
	mov	x1, x23
	ldr	x0, [sp, 144]
	bl	_ZdlPvm
	b	.L2639
.L2740:
	ldrb	w1, [sp, 200]
	mov	x19, x0
	cbz	w1, .L2639
	add	x0, sp, 192
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2639
	.cfi_endproc
.LFE11697:
	.section	.gcc_except_table
.LLSDA11697:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11697-.LLSDACSB11697
.LLSDACSB11697:
	.uleb128 .LEHB141-.LFB11697
	.uleb128 .LEHE141-.LEHB141
	.uleb128 .L2739-.LFB11697
	.uleb128 0
	.uleb128 .LEHB142-.LFB11697
	.uleb128 .LEHE142-.LEHB142
	.uleb128 .L2736-.LFB11697
	.uleb128 0
	.uleb128 .LEHB143-.LFB11697
	.uleb128 .LEHE143-.LEHB143
	.uleb128 .L2740-.LFB11697
	.uleb128 0
	.uleb128 .LEHB144-.LFB11697
	.uleb128 .LEHE144-.LEHB144
	.uleb128 .L2737-.LFB11697
	.uleb128 0
	.uleb128 .LEHB145-.LFB11697
	.uleb128 .LEHE145-.LEHB145
	.uleb128 .L2738-.LFB11697
	.uleb128 0
	.uleb128 .LEHB146-.LFB11697
	.uleb128 .LEHE146-.LEHB146
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB147-.LFB11697
	.uleb128 .LEHE147-.LEHB147
	.uleb128 .L2738-.LFB11697
	.uleb128 0
	.uleb128 .LEHB148-.LFB11697
	.uleb128 .LEHE148-.LEHB148
	.uleb128 .L2735-.LFB11697
	.uleb128 0
	.uleb128 .LEHB149-.LFB11697
	.uleb128 .LEHE149-.LEHB149
	.uleb128 .L2736-.LFB11697
	.uleb128 0
	.uleb128 .LEHB150-.LFB11697
	.uleb128 .LEHE150-.LEHB150
	.uleb128 .L2735-.LFB11697
	.uleb128 0
	.uleb128 .LEHB151-.LFB11697
	.uleb128 .LEHE151-.LEHB151
	.uleb128 0
	.uleb128 0
.LLSDACSE11697:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf, .-_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf
	.section	.rodata._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi.str1.8,"aMS",@progbits,1
	.align	3
.LC40:
	.string	"Can't use addPoint to update deleted elements if replacement of deleted elements is enabled."
	.align	3
.LC41:
	.string	"void hnswlib::HierarchicalNSW<dist_t>::unmarkDeletedInternal(hnswlib::tableint) [with dist_t = float; hnswlib::tableint = unsigned int]"
	.align	3
.LC42:
	.string	"hnswlib/hnswlib/hnswalg.h"
	.align	3
.LC43:
	.string	"internalId < cur_element_count"
	.align	3
.LC44:
	.string	"The requested to undelete element is not deleted"
	.align	3
.LC45:
	.string	"The number of elements exceeds the specified limit"
	.align	3
.LC46:
	.string	"Not enough memory: addPoint failed to allocate linklist"
	.align	3
.LC47:
	.string	"cand error"
	.align	3
.LC48:
	.string	"Level error"
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
	.type	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi, %function
_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi:
.LFB11680:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11680
	stp	x29, x30, [sp, -272]!
	.cfi_def_cfa_offset 272
	.cfi_offset 29, -272
	.cfi_offset 30, -264
	adrp	x4, .LC12
	mov	x29, sp
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -208
	.cfi_offset 26, -200
	ldr	x26, [x4, #:lo12:.LC12]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -256
	.cfi_offset 20, -248
	mov	x19, x0
	add	x0, x0, 320
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -224
	.cfi_offset 24, -216
	mov	x23, x1
	str	x1, [sp, 112]
	uxtw	x1, w3
	str	w1, [sp, 124]
	str	x2, [sp, 200]
	str	x0, [sp, 240]
	strb	wzr, [sp, 248]
	cbz	x26, .L2868
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3143
.L2868:
	ldr	x6, [sp, 200]
	mov	w1, 1
	ldr	x3, [x19, 376]
	strb	w1, [sp, 248]
	ldr	x1, [x19, 368]
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -184
	.cfi_offset 27, -192
	add	x0, x19, 368
	udiv	x5, x6, x3
	msub	x5, x5, x3, x6
	ldr	x1, [x1, x5, lsl 3]
	cbz	x1, .L2869
	ldr	x1, [x1]
	ldr	x2, [x1, 8]
.L2871:
	cmp	x6, x2
	beq	.L2870
	ldr	x1, [x1]
	cbz	x1, .L2869
	ldr	x2, [x1, 8]
	udiv	x4, x2, x3
	msub	x4, x4, x3, x2
	cmp	x5, x4
	beq	.L2871
.L2869:
	add	x1, x19, 16
	ldar	x2, [x1]
	ldr	x3, [x19, 8]
	cmp	x3, x2
	bls	.L3144
	ldar	x20, [x1]
	str	x20, [sp, 160]
	mov	w27, w20
.L3173:
	ldaxr	x2, [x1]
	add	x2, x2, 1
	stlxr	w3, x2, [x1]
	cbnz	w3, .L3173
	add	x1, sp, 200
.LEHB152:
	bl	_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_
.LEHE152:
	ldrb	w1, [sp, 248]
	str	w20, [x0]
	cbnz	w1, .L3145
.L2888:
	ldr	x2, [sp, 160]
	strb	wzr, [sp, 216]
	ldr	x1, [x19, 192]
	and	x20, x2, 4294967295
	ubfiz	x0, x2, 1, 32
	add	x0, x0, x2, uxtw
	add	x0, x1, x0, lsl 4
	str	x0, [sp, 208]
	cbz	x0, .L3146
	cbz	x26, .L2890
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3147
.L2890:
	ldr	x1, [x19, 424]
	mov	x4, 16807
	mov	x3, 5
	mov	x0, 281474968322048
	movk	x3, 0x2, lsl 32
	movk	x0, 0x41df, lsl 48
	mul	x1, x1, x4
	fmov	d3, x0
	mov	x0, 281474959933440
	movi	d4, #0
	movk	x0, 0x43cf, lsl 48
	fmov	d2, x0
	mov	w0, 1
	strb	w0, [sp, 216]
	umulh	x2, x1, x3
	str	d8, [sp, 96]
	.cfi_offset 72, -176
	fmov	d5, 1.0e+0
	ldr	d8, [x19, 88]
	sub	x0, x1, x2
	add	x0, x2, x0, lsr 1
	lsr	x0, x0, 30
	lsl	x2, x0, 31
	sub	x0, x2, x0
	sub	x0, x1, x0
	sub	x2, x0, #1
	mul	x1, x0, x4
	ucvtf	d0, x2
	umulh	x2, x1, x3
	fadd	d1, d0, d4
	sub	x0, x1, x2
	add	x0, x2, x0, lsr 1
	lsr	x0, x0, 30
	lsl	x2, x0, 31
	sub	x0, x2, x0
	sub	x0, x1, x0
	str	x0, [x19, 424]
	sub	x0, x0, #1
	ucvtf	d0, x0
	fmadd	d0, d0, d3, d1
	fdiv	d0, d0, d2
	fcmpe	d0, d5
	bge	.L2975
	fadd	d0, d0, d4
.L2891:
	bl	log
	ldr	w0, [sp, 124]
	cmp	w0, 0
	bgt	.L2892
	fnmul	d0, d0, d8
	fcvtzs	w0, d0
	str	w0, [sp, 124]
.L2892:
	ldr	x1, [x19, 272]
	add	x0, x19, 144
	ldr	w2, [sp, 124]
	str	w2, [x1, x20, lsl 2]
	str	x0, [sp, 224]
	strb	wzr, [sp, 232]
	cbz	x26, .L2894
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3148
.L2894:
	ldr	w0, [x19, 104]
	mov	w1, w0
	mov	w0, 1
	str	w1, [sp, 136]
	strb	w0, [sp, 232]
	mov	w0, w1
	ldr	w1, [sp, 124]
	cmp	w0, w1
	blt	.L2895
	ldr	x0, [sp, 224]
	cbz	x0, .L2895
	cbz	x26, .L2896
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L2896:
	strb	wzr, [sp, 232]
.L2895:
	ldr	x2, [x19, 24]
	mov	w1, 0
	ldr	x0, [x19, 240]
	ldr	w4, [x19, 216]
	ldr	x3, [x19, 256]
	madd	x0, x2, x20, x0
	str	w4, [sp, 140]
	add	x0, x3, x0
	bl	memset
	ldp	x2, x3, [x19, 248]
	mov	x1, x23
	ldr	x0, [x19, 24]
	madd	x0, x20, x0, x3
	ldr	x3, [sp, 200]
	str	x3, [x0, x2]
	ldr	x0, [x19, 24]
	ldr	x4, [x19, 232]
	ldr	x3, [x19, 256]
	ldr	x2, [x19, 296]
	madd	x0, x20, x0, x4
	add	x0, x3, x0
	bl	memcpy
	ldr	w0, [sp, 124]
	cbnz	w0, .L3149
.L2897:
	ldr	w24, [sp, 140]
	cmn	w24, #1
	beq	.L2899
	ldr	x0, [x19, 24]
	uxtw	x1, w24
	ldr	w20, [sp, 136]
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	mul	x2, x1, x0
	ldr	w0, [sp, 124]
	str	x1, [sp, 152]
	ldr	x3, [x19, 256]
	cmp	w20, w0
	ble	.L2900
	ldr	x1, [x19, 232]
	mov	x0, x23
	ldr	x4, [x19, 304]
	add	x1, x2, x1
	ldr	x2, [x19, 312]
	add	x1, x3, x1
.LEHB153:
	blr	x4
.LEHE153:
	sxtw	x0, w20
	fmov	s8, s0
	sub	x0, x0, #1
	add	x28, x19, 192
	str	x0, [sp, 112]
	sub	w0, w20, #1
	str	w0, [sp, 128]
	.p2align 3,,7
.L2912:
	ldr	w0, [sp, 128]
	str	w0, [sp, 144]
	.p2align 3,,7
.L2910:
	ldr	x0, [x28]
	mov	w1, 48
	strb	wzr, [sp, 248]
	umaddl	x0, w24, w1, x0
	str	x0, [sp, 240]
	cbz	x0, .L3150
	cbz	x26, .L2902
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3151
.L2902:
	mov	w1, 1
	strb	w1, [sp, 248]
	ldr	x0, [x19, 32]
	ldr	x2, [sp, 112]
	ldr	x1, [x19, 264]
	mul	x0, x2, x0
	ldr	x1, [x1, w24, uxtw 3]
	add	x20, x1, x0
	ldrh	w22, [x1, x0]
	cbz	w22, .L2903
	sub	w22, w22, #1
	add	x0, x20, 8
	add	x20, x20, 4
	mov	w25, 0
	add	x22, x0, x22, uxtw 2
	.p2align 3,,7
.L2907:
	ldr	w21, [x20]
	ldr	x0, [x19, 8]
	uxtw	x1, w21
	cmp	x1, x0
	bhi	.L3152
	ldr	x5, [x19, 24]
	mov	x0, x23
	ldr	x4, [x19, 232]
	ldp	x3, x2, [x19, 304]
	madd	x1, x1, x5, x4
	ldr	x4, [x19, 256]
	add	x1, x4, x1
.LEHB154:
	blr	x3
.LEHE154:
	fcmpe	s0, s8
	bmi	.L2996
.L2905:
	add	x20, x20, 4
	cmp	x22, x20
	bne	.L2907
	ldrb	w0, [sp, 248]
	cbnz	w0, .L3153
.L2908:
	cbnz	w25, .L2910
.L2972:
	ldr	w0, [sp, 128]
	ldr	w1, [sp, 144]
	sub	w0, w0, #1
	str	w0, [sp, 128]
	ldr	x0, [sp, 112]
	sub	x0, x0, #1
	str	x0, [sp, 112]
	ldr	w0, [sp, 124]
	cmp	w0, w1
	blt	.L2912
	ldr	x0, [x19, 24]
	ldr	x3, [sp, 152]
	ldr	x2, [x19, 256]
	ldr	x1, [x19, 240]
	madd	x0, x3, x0, x2
	add	x0, x0, x1
	ldrb	w0, [x0, 2]
	and	w25, w0, 1
	ldr	w0, [sp, 124]
	tbnz	w0, #31, .L3139
	mov	w21, w0
.L2913:
	mov	x28, 1152921504606846975
	.p2align 3,,7
.L2917:
	mov	w1, w24
	add	x8, sp, 240
	mov	w3, w21
	mov	x2, x23
	mov	x0, x19
.LEHB155:
	bl	_ZN7hnswlib15HierarchicalNSWIfE15searchBaseLayerEjPKvi
.LEHE155:
	cbz	w25, .L2919
	ldr	x1, [x19, 24]
	mov	x0, x23
	ldr	x5, [sp, 152]
	ldr	x4, [x19, 232]
	ldp	x3, x2, [x19, 304]
	madd	x1, x5, x1, x4
	ldr	x4, [x19, 256]
	add	x1, x4, x1
.LEHB156:
	blr	x3
	ldp	x20, x22, [sp, 240]
	fmov	s8, s0
	ldr	x1, [sp, 256]
	cmp	x22, x1
	beq	.L2920
	add	x5, x22, 8
	ldr	w8, [sp, 140]
	sub	x6, x5, x20
	str	s0, [x22]
	sub	x7, x6, #8
	str	w8, [x22, 4]
	asr	x4, x6, 3
	add	x7, x20, x7
	sub	x0, x4, #2
	sub	x24, x4, #1
	str	x5, [sp, 248]
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L2921:
	cmp	x24, 0
	ble	.L2930
	.p2align 3,,7
.L2932:
	lsl	x0, x2, 3
	lsl	x24, x24, 3
	add	x1, x20, x0
	add	x7, x20, x24
	ldr	s1, [x20, x0]
	fcmpe	s1, s8
	bmi	.L2997
.L2930:
	ldr	x0, [x19, 72]
	str	s8, [x7]
	str	w8, [x7, 4]
	cmp	x0, x4
	bcc	.L3154
.L2919:
	mov	w3, w21
	add	x2, sp, 240
	mov	w1, w27
	mov	x0, x19
	mov	w4, 0
	bl	_ZN7hnswlib15HierarchicalNSWIfE25mutuallyConnectNewElementEPKvjRSt14priority_queueISt4pairIfjESt6vectorIS6_SaIS6_EENS1_14CompareByFirstEEib.isra.0
.LEHE156:
	ldr	x1, [sp, 240]
	mov	w24, w0
	cbz	x1, .L2946
	ldr	x2, [sp, 256]
	mov	x0, x1
	sub	x1, x2, x1
	bl	_ZdlPvm
.L2946:
	subs	w21, w21, #1
	bmi	.L3140
	ldr	w0, [sp, 136]
	cmp	w0, w21
	bge	.L2917
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC48
	mov	x20, x0
	add	x1, x1, :lo12:.LC48
.LEHB157:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE157:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB158:
	bl	__cxa_throw
.LEHE158:
	.p2align 2,,3
.L2870:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	ldrb	w0, [x19, 456]
	ldr	w27, [x1, 16]
	uxtw	x20, w27
	cbz	w0, .L3155
	ldr	x0, [x19, 24]
	ldr	x2, [x19, 256]
	ldr	x1, [x19, 240]
	madd	x0, x20, x0, x2
	add	x0, x0, x1
	ldrb	w0, [x0, 2]
	tbnz	x0, 0, .L3156
	ldr	x0, [sp, 240]
	cbz	x0, .L2883
	cbz	x26, .L2876
.L3160:
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L2876:
	strb	wzr, [sp, 248]
.L2875:
	ldr	x0, [x19, 24]
	ldr	x2, [x19, 256]
	ldr	x1, [x19, 240]
	madd	x0, x20, x0, x2
	add	x0, x0, x1
	ldrb	w0, [x0, 2]
	tbz	x0, 0, .L2883
	str	w27, [sp, 224]
	add	x0, x19, 16
	ldar	x0, [x0]
	cmp	x0, x20
	bls	.L3157
	ldr	w1, [sp, 224]
	ldr	x3, [x19, 24]
	ldr	x2, [x19, 240]
	ldr	x0, [x19, 256]
	madd	x1, x1, x3, x2
	add	x0, x0, x1
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L2879
	and	w1, w1, -2
	strb	w1, [x0, 2]
	add	x0, x19, 40
.L3172:
	ldaxr	x1, [x0]
	sub	x1, x1, #1
	stlxr	w2, x1, [x0]
	cbnz	w2, .L3172
	ldrb	w0, [x19, 456]
	cbnz	w0, .L3158
.L2883:
	fmov	s0, 1.0e+0
	mov	x1, x23
	mov	x0, x19
	mov	w2, w27
.LEHB159:
	bl	_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf
.LEHE159:
	ldrb	w0, [sp, 248]
	cbnz	w0, .L3159
.L2867:
	mov	w0, w27
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	.cfi_remember_state
	.cfi_restore 28
	.cfi_restore 27
	ldp	x29, x30, [sp], 272
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L3155:
	.cfi_restore_state
	ldr	x0, [sp, 240]
	cbz	x0, .L2875
	cbnz	x26, .L3160
	b	.L2876
.L3159:
	ldr	x0, [sp, 240]
	cbz	x0, .L2867
	cbz	x26, .L2867
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	mov	w0, w27
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	.cfi_remember_state
	.cfi_restore 28
	.cfi_restore 27
	ldp	x29, x30, [sp], 272
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3158:
	.cfi_restore_state
	add	x20, x19, 464
	cbz	x26, .L2881
	mov	x0, x20
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3161
.L2881:
	add	x2, sp, 224
	add	x0, x19, 512
	mov	w1, 0
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj
	cbz	x26, .L2883
	mov	x0, x20
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L2883
.L3145:
	ldr	x0, [sp, 240]
	cbz	x0, .L2888
	cbz	x26, .L2888
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L2888
	.p2align 2,,3
.L3153:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	.cfi_offset 72, -176
	ldr	x0, [sp, 240]
	cbz	x0, .L2908
.L2973:
	cbz	x26, .L2908
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	cbnz	w25, .L2910
	b	.L2972
	.p2align 2,,3
.L2996:
	fmov	s8, s0
	mov	w24, w21
	mov	w25, 1
	b	.L2905
	.p2align 2,,3
.L2903:
	ldr	x0, [sp, 240]
	cbz	x0, .L2972
	mov	w25, 0
	b	.L2973
.L2900:
	ldr	x1, [x19, 240]
	add	x0, x3, x2
	ldp	w2, w24, [sp, 136]
	add	x0, x0, x1
	mov	w21, w2
	ldrb	w0, [x0, 2]
	and	w25, w0, 1
	tbz	w2, #31, .L2913
.L3140:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
.L2914:
	ldr	w0, [sp, 124]
	ldr	w1, [sp, 136]
	cmp	w1, w0
	bge	.L2950
	str	w0, [x19, 104]
	ldr	w0, [sp, 160]
	str	w0, [x19, 216]
.L2950:
	ldrb	w0, [sp, 232]
	cbnz	w0, .L3162
.L2951:
	ldrb	w0, [sp, 216]
	cbnz	w0, .L3163
.L3138:
	mov	w0, w27
	ldr	d8, [sp, 96]
	.cfi_restore 72
	ldp	x19, x20, [sp, 16]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldp	x29, x30, [sp], 272
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L2997:
	.cfi_def_cfa_offset 272
	.cfi_offset 19, -256
	.cfi_offset 20, -248
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	.cfi_offset 23, -224
	.cfi_offset 24, -216
	.cfi_offset 25, -208
	.cfi_offset 26, -200
	.cfi_offset 27, -192
	.cfi_offset 28, -184
	.cfi_offset 29, -272
	.cfi_offset 30, -264
	.cfi_offset 72, -176
	sub	x0, x2, #1
	ldr	w3, [x1, 4]
	str	s1, [x20, x24]
	mov	x24, x2
	add	x0, x0, x0, lsr 63
	str	w3, [x7, 4]
	asr	x0, x0, 1
	cmp	x2, 0
	ble	.L3164
	mov	x2, x0
	b	.L2932
.L3163:
	.cfi_restore 21
	.cfi_restore 22
	ldr	x0, [sp, 208]
	cbz	x0, .L3138
	cbz	x26, .L3138
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	ldr	d8, [sp, 96]
	.cfi_restore 72
	b	.L2867
	.p2align 2,,3
.L3164:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	.cfi_offset 72, -176
	mov	x7, x1
	ldr	x0, [x19, 72]
	str	s8, [x7]
	str	w8, [x7, 4]
	cmp	x0, x4
	bcs	.L2919
.L3154:
	cmp	x6, 8
	bgt	.L3165
	str	x22, [sp, 248]
	b	.L2919
.L3165:
	sub	x1, x22, x20
	ldr	s0, [x20]
	ldr	w2, [x20, 4]
	asr	x8, x1, 3
	ldr	w6, [x5, -4]
	sub	x0, x8, #1
	str	w2, [x5, -4]
	ldr	s2, [x5, -8]
	and	x9, x8, 1
	add	x7, x0, x0, lsr 63
	str	s0, [x5, -8]
	asr	x7, x7, 1
	cmp	x1, 16
	ble	.L2935
	mov	x2, 0
	b	.L2939
	.p2align 2,,3
.L3166:
	mov	x2, x0
.L2939:
	add	x1, x2, 1
	lsl	x0, x1, 1
	lsl	x1, x1, 4
	sub	x5, x0, #1
	add	x4, x20, x1
	lsl	x3, x5, 3
	ldr	s0, [x20, x1]
	add	x1, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L2998
.L2936:
	lsl	x1, x2, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x7, x0
	bgt	.L3166
	lsl	x3, x0, 3
	cbz	x9, .L3167
.L2942:
	sub	x0, x0, #1
	asr	x1, x0, 1
	.p2align 3,,7
.L2945:
	lsl	x0, x1, 3
	add	x4, x20, x3
	add	x5, x20, x0
	ldr	s0, [x20, x0]
	fcmpe	s0, s2
	bmi	.L2999
.L2940:
	str	s2, [x4]
	str	w6, [x4, 4]
	str	x22, [sp, 248]
	b	.L2919
.L2998:
	fmov	s0, s1
	mov	x4, x1
	mov	x0, x5
	b	.L2936
.L2920:
	sub	x24, x22, x20
	asr	x0, x24, 3
	cmp	x0, x28
	beq	.L3168
	cmp	x0, 0
	csinc	x2, x0, xzr, ne
	adds	x0, x0, x2
	bcs	.L2924
	cbz	x0, .L3169
	cmp	x0, x28
	csel	x0, x0, x28, ls
	lsl	x0, x0, 3
	str	x0, [sp, 112]
.L2925:
.LEHB160:
	bl	_Znwm
.LEHE160:
	mov	x9, x0
	add	x5, x0, 8
	ldr	x0, [sp, 112]
	ldr	x1, [sp, 256]
	add	x10, x9, x0
.L2926:
	add	x0, x9, x24
	ldr	w2, [sp, 140]
	str	s8, [x9, x24]
	str	w2, [x0, 4]
	cmp	x22, x20
	beq	.L2979
	mov	x2, x9
	mov	x0, x20
	.p2align 3,,7
.L2928:
	ldr	x3, [x0], 8
	str	x3, [x2], 8
	cmp	x22, x0
	bne	.L2928
	add	x22, x9, x24
	add	x5, x22, 8
	sub	x6, x5, x9
	sub	x7, x6, #8
	asr	x4, x6, 3
	add	x7, x9, x7
	sub	x0, x4, #2
	sub	x24, x4, #1
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L2927:
	cbz	x20, .L2929
	sub	x1, x1, x20
	mov	x0, x20
	str	x2, [sp, 112]
	str	x5, [sp, 128]
	str	x9, [sp, 144]
	stp	x10, x6, [sp, 168]
	stp	x7, x4, [sp, 184]
	bl	_ZdlPvm
	ldp	x10, x6, [sp, 168]
	ldp	x7, x4, [sp, 184]
	ldr	x2, [sp, 112]
	ldr	x5, [sp, 128]
	ldr	x9, [sp, 144]
.L2929:
	mov	x20, x9
	ldr	w8, [x22, 4]
	stp	x9, x5, [sp, 240]
	ldr	s8, [x22]
	str	x10, [sp, 256]
	b	.L2921
.L3162:
	.cfi_restore 21
	.cfi_restore 22
	ldr	x0, [sp, 224]
	cbz	x0, .L2951
	cbz	x26, .L2951
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L2951
.L2899:
	ldr	w0, [sp, 124]
	str	w0, [x19, 104]
	str	wzr, [x19, 216]
	b	.L2914
.L3149:
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	ldrsw	x21, [sp, 124]
	ldr	x0, [x19, 32]
	ldr	x22, [x19, 264]
	mul	x21, x21, x0
	add	x21, x21, 1
	mov	x0, x21
	bl	malloc
	str	x0, [x22, x20, lsl 3]
	cbz	x0, .L3170
	mov	x2, x21
	mov	w1, 0
	bl	memset
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	b	.L2897
.L3167:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	sub	x8, x8, #2
	add	x8, x8, x8, lsr 63
	cmp	x0, x8, asr 1
	beq	.L2941
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	b	.L2945
.L3139:
	ldp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_restore 22
	.cfi_restore 21
	b	.L2950
	.p2align 2,,3
.L2999:
	.cfi_restore_state
	sub	x2, x1, #1
	str	s0, [x20, x3]
	ldr	w3, [x5, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x4, 4]
	asr	x1, x2, 1
	cbz	x0, .L3171
	lsl	x3, x0, 3
	b	.L2945
.L3171:
	mov	x4, x5
	b	.L2940
.L3169:
	mov	x5, 8
	mov	x10, 0
	mov	x9, 0
	b	.L2926
.L2975:
	.cfi_restore 21
	.cfi_restore 22
	mov	x0, 4607182418800017407
	fmov	d0, x0
	b	.L2891
.L2979:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	mov	x7, x9
	mov	x22, x9
	mov	x2, 0
	mov	x24, 0
	mov	x4, 1
	mov	x6, 8
	b	.L2927
.L2935:
	mov	x4, x20
	cbnz	x9, .L2940
	cmp	x0, 2
	bhi	.L2940
	mov	x0, 0
.L2941:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x20, x3
	ldr	s0, [x20, x3]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
	b	.L2942
.L3146:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	mov	w0, 1
	stp	x21, x22, [sp, 32]
	.cfi_remember_state
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	str	d8, [sp, 96]
	.cfi_offset 72, -176
.LEHB161:
	bl	_ZSt20__throw_system_errori
.LEHE161:
.L3161:
	.cfi_restore_state
.LEHB162:
	bl	_ZSt20__throw_system_errori
.LEHE162:
.L3148:
	.cfi_offset 72, -176
.LEHB163:
	bl	_ZSt20__throw_system_errori
.LEHE163:
.L3147:
	.cfi_restore 72
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	str	d8, [sp, 96]
	.cfi_offset 72, -176
.LEHB164:
	bl	_ZSt20__throw_system_errori
.L3143:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 72
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -184
	.cfi_offset 27, -192
	str	d8, [sp, 96]
	.cfi_offset 72, -176
	bl	_ZSt20__throw_system_errori
.LEHE164:
.L3157:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	adrp	x3, .LC41
	adrp	x1, .LC42
	adrp	x0, .LC43
	add	x3, x3, :lo12:.LC41
	add	x1, x1, :lo12:.LC42
	add	x0, x0, :lo12:.LC43
	mov	w2, 916
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	str	d8, [sp, 96]
	.cfi_offset 72, -176
	bl	__assert_fail
.L2924:
	mov	x0, 9223372036854775800
	str	x0, [sp, 112]
	b	.L2925
.L3168:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB165:
	bl	_ZSt20__throw_length_errorPKc
.LEHE165:
.L3151:
.LEHB166:
	bl	_ZSt20__throw_system_errori
.L3150:
	mov	w0, 1
	bl	_ZSt20__throw_system_errori
.LEHE166:
.L2988:
	.cfi_restore 21
	.cfi_restore 22
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
.L2964:
	ldrb	w0, [sp, 216]
	cbz	w0, .L2965
	add	x0, sp, 208
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L2965:
	mov	x0, x19
.LEHB167:
	bl	_Unwind_Resume
.LEHE167:
.L2992:
	mov	x19, x0
.L2958:
	ldrb	w0, [sp, 248]
	cbz	w0, .L2956
	add	x0, sp, 240
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L2956:
	ldrb	w0, [sp, 232]
	cbz	w0, .L2964
	add	x0, sp, 224
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2964
.L3152:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC47
	mov	x20, x0
	add	x1, x1, :lo12:.LC47
.LEHB168:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE168:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB169:
	bl	__cxa_throw
.LEHE169:
.L2991:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
	b	.L2958
.L3144:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC45
	mov	x20, x0
	add	x1, x1, :lo12:.LC45
.LEHB170:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE170:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB171:
	bl	__cxa_throw
.LEHE171:
.L2879:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC44
	mov	x20, x0
	add	x1, x1, :lo12:.LC44
.LEHB172:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE172:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB173:
	bl	__cxa_throw
.LEHE173:
.L2987:
.L3141:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
.L2885:
	ldrb	w0, [sp, 248]
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -232
	.cfi_offset 21, -240
	str	d8, [sp, 96]
	.cfi_offset 72, -176
	cbz	w0, .L2965
	add	x0, sp, 240
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L2965
.L2995:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	b	.L3141
.L2989:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	.cfi_offset 72, -176
	mov	x19, x0
	b	.L2956
.L3170:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC46
	mov	x20, x0
	add	x1, x1, :lo12:.LC46
.LEHB174:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE174:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB175:
	bl	__cxa_throw
.LEHE175:
.L2990:
.L3142:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
	b	.L2956
.L2985:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	mov	x19, x0
	b	.L2885
.L2994:
	.cfi_offset 21, -240
	.cfi_offset 22, -232
	.cfi_offset 72, -176
	ldr	x2, [sp, 240]
	mov	x19, x0
	ldr	x1, [sp, 256]
	sub	x1, x1, x2
	cbz	x2, .L2956
	mov	x0, x2
	bl	_ZdlPvm
	b	.L2956
.L2993:
	b	.L3142
.L3156:
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 72
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC40
	mov	x20, x0
	add	x1, x1, :lo12:.LC40
.LEHB176:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE176:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB177:
	bl	__cxa_throw
.LEHE177:
.L2986:
	b	.L3141
	.cfi_endproc
.LFE11680:
	.section	.gcc_except_table
.LLSDA11680:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11680-.LLSDACSB11680
.LLSDACSB11680:
	.uleb128 .LEHB152-.LFB11680
	.uleb128 .LEHE152-.LEHB152
	.uleb128 .L2985-.LFB11680
	.uleb128 0
	.uleb128 .LEHB153-.LFB11680
	.uleb128 .LEHE153-.LEHB153
	.uleb128 .L2989-.LFB11680
	.uleb128 0
	.uleb128 .LEHB154-.LFB11680
	.uleb128 .LEHE154-.LEHB154
	.uleb128 .L2992-.LFB11680
	.uleb128 0
	.uleb128 .LEHB155-.LFB11680
	.uleb128 .LEHE155-.LEHB155
	.uleb128 .L2989-.LFB11680
	.uleb128 0
	.uleb128 .LEHB156-.LFB11680
	.uleb128 .LEHE156-.LEHB156
	.uleb128 .L2994-.LFB11680
	.uleb128 0
	.uleb128 .LEHB157-.LFB11680
	.uleb128 .LEHE157-.LEHB157
	.uleb128 .L2993-.LFB11680
	.uleb128 0
	.uleb128 .LEHB158-.LFB11680
	.uleb128 .LEHE158-.LEHB158
	.uleb128 .L2989-.LFB11680
	.uleb128 0
	.uleb128 .LEHB159-.LFB11680
	.uleb128 .LEHE159-.LEHB159
	.uleb128 .L2985-.LFB11680
	.uleb128 0
	.uleb128 .LEHB160-.LFB11680
	.uleb128 .LEHE160-.LEHB160
	.uleb128 .L2994-.LFB11680
	.uleb128 0
	.uleb128 .LEHB161-.LFB11680
	.uleb128 .LEHE161-.LEHB161
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB162-.LFB11680
	.uleb128 .LEHE162-.LEHB162
	.uleb128 .L2985-.LFB11680
	.uleb128 0
	.uleb128 .LEHB163-.LFB11680
	.uleb128 .LEHE163-.LEHB163
	.uleb128 .L2988-.LFB11680
	.uleb128 0
	.uleb128 .LEHB164-.LFB11680
	.uleb128 .LEHE164-.LEHB164
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB165-.LFB11680
	.uleb128 .LEHE165-.LEHB165
	.uleb128 .L2994-.LFB11680
	.uleb128 0
	.uleb128 .LEHB166-.LFB11680
	.uleb128 .LEHE166-.LEHB166
	.uleb128 .L2989-.LFB11680
	.uleb128 0
	.uleb128 .LEHB167-.LFB11680
	.uleb128 .LEHE167-.LEHB167
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB168-.LFB11680
	.uleb128 .LEHE168-.LEHB168
	.uleb128 .L2991-.LFB11680
	.uleb128 0
	.uleb128 .LEHB169-.LFB11680
	.uleb128 .LEHE169-.LEHB169
	.uleb128 .L2992-.LFB11680
	.uleb128 0
	.uleb128 .LEHB170-.LFB11680
	.uleb128 .LEHE170-.LEHB170
	.uleb128 .L2987-.LFB11680
	.uleb128 0
	.uleb128 .LEHB171-.LFB11680
	.uleb128 .LEHE171-.LEHB171
	.uleb128 .L2985-.LFB11680
	.uleb128 0
	.uleb128 .LEHB172-.LFB11680
	.uleb128 .LEHE172-.LEHB172
	.uleb128 .L2995-.LFB11680
	.uleb128 0
	.uleb128 .LEHB173-.LFB11680
	.uleb128 .LEHE173-.LEHB173
	.uleb128 .L2985-.LFB11680
	.uleb128 0
	.uleb128 .LEHB174-.LFB11680
	.uleb128 .LEHE174-.LEHB174
	.uleb128 .L2990-.LFB11680
	.uleb128 0
	.uleb128 .LEHB175-.LFB11680
	.uleb128 .LEHE175-.LEHB175
	.uleb128 .L2989-.LFB11680
	.uleb128 0
	.uleb128 .LEHB176-.LFB11680
	.uleb128 .LEHE176-.LEHB176
	.uleb128 .L2986-.LFB11680
	.uleb128 0
	.uleb128 .LEHB177-.LFB11680
	.uleb128 .LEHE177-.LEHB177
	.uleb128 .L2985-.LFB11680
	.uleb128 0
.LLSDACSE11680:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi, .-_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
	.section	.rodata.str1.8
	.align	3
.LC49:
	.string	"Not enough memory"
	.align	3
.LC50:
	.string	"Not enough memory: HierarchicalNSW failed to allocate linklists"
	.text
	.align	2
	.p2align 4,,11
	.global	_Z11build_indexPfmm
	.type	_Z11build_indexPfmm, %function
_Z11build_indexPfmm:
.LFB10590:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA10590
	sub	sp, sp, #1824
	.cfi_def_cfa_offset 1824
	adrp	x3, _ZTVN7hnswlib17InnerProductSpaceE+16
	add	x3, x3, :lo12:_ZTVN7hnswlib17InnerProductSpaceE+16
	stp	x29, x30, [sp]
	.cfi_offset 29, -1824
	.cfi_offset 30, -1816
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -1792
	.cfi_offset 22, -1784
	mov	x21, x1
	adrp	x1, _ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_
	add	x1, x1, :lo12:_ZN7hnswlibL20InnerProductDistanceEPKvS1_S1_
	stp	x19, x20, [sp, 16]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -1808
	.cfi_offset 20, -1800
	.cfi_offset 23, -1776
	.cfi_offset 24, -1768
	lsl	x23, x2, 2
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	.cfi_offset 25, -1760
	.cfi_offset 26, -1752
	.cfi_offset 27, -1744
	.cfi_offset 28, -1736
	str	x0, [sp, 112]
	mov	x0, 568
	stp	x3, x1, [sp, 208]
	stp	x23, x2, [sp, 224]
.LEHB178:
	bl	_Znwm
.LEHE178:
	mov	x2, x0
	mov	x19, x0
	adrp	x1, _ZTVN7hnswlib15HierarchicalNSWIfEE+16
	movi	v0.4s, 0
	add	x1, x1, :lo12:_ZTVN7hnswlib15HierarchicalNSWIfEE+16
	str	x1, [x2], 8
	add	x0, x0, 88
	stp	xzr, xzr, [x19, 88]
	str	wzr, [x19, 104]
	stp	x0, x2, [sp, 136]
	add	x0, x19, 112
	str	q0, [x19, 8]
	str	q0, [x19, 24]
	str	q0, [x19, 40]
	str	q0, [x19, 56]
	str	q0, [x19, 72]
	stp	q0, q0, [x19, 112]
	str	x0, [sp, 184]
	mov	x0, 3145728
.LEHB179:
	bl	_Znwm
.LEHE179:
	add	x27, x19, 120
	str	x0, [x19, 120]
	add	x20, x0, 3145728
	mov	w1, 0
	mov	x2, 3145728
	str	x20, [x27, 16]
	bl	memset
	str	x20, [x27, 8]
	mov	x1, -6148914691236517206
	stp	xzr, xzr, [x19, 144]
	movk	x1, 0x2aa, lsl 48
	stp	xzr, xzr, [x19, 160]
	stp	xzr, xzr, [x19, 176]
	cmp	x21, x1
	bhi	.L3347
	add	x24, x19, 192
	add	x22, x21, x21, lsl 1
	stp	xzr, xzr, [x24]
	lsl	x22, x22, 4
	str	xzr, [x24, 16]
	str	x24, [sp, 160]
	cbz	x21, .L3176
	mov	x0, x22
.LEHB180:
	bl	_Znwm
.LEHE180:
	str	x0, [x19, 192]
	add	x20, x0, x22
	str	x20, [x24, 16]
	mov	x2, x22
	mov	w1, 0
	add	x26, x19, 272
	bl	memset
	str	x20, [x24, 8]
	movi	v0.4s, 0
	str	wzr, [x19, 216]
	lsl	x20, x21, 2
	mov	x0, x20
	stp	q0, q0, [x19, 224]
	stp	q0, q0, [x19, 256]
	str	xzr, [x26, 16]
.LEHB181:
	bl	_Znwm
.LEHE181:
	str	x0, [x19, 272]
	mov	x2, x20
	add	x20, x0, x20
	str	x20, [x26, 16]
	mov	w1, 0
	bl	memset
.L3256:
	add	x4, x19, 416
	str	x20, [x26, 8]
	mov	x2, 1
	add	x3, x19, 368
	stp	x3, x4, [sp, 168]
	add	x22, x19, 512
	fmov	s0, 1.0e+0
	stp	x4, x2, [x19, 368]
	adrp	x4, .LC52
	add	x1, x19, 560
	ldr	q1, [x4, #:lo12:.LC52]
	str	xzr, [x19, 296]
	str	xzr, [x19, 312]
	stp	xzr, xzr, [x19, 320]
	stp	xzr, xzr, [x19, 336]
	stp	xzr, xzr, [x19, 352]
	stp	xzr, xzr, [x19, 384]
	stp	xzr, xzr, [x19, 408]
	str	s0, [x19, 400]
	str	q1, [x22, -88]
	stp	xzr, xzr, [x22, -72]
	strb	wzr, [x19, 456]
	stp	xzr, xzr, [x19, 464]
	stp	xzr, xzr, [x19, 480]
	stp	xzr, xzr, [x19, 496]
	str	x1, [x19, 512]
	str	x2, [x22, 8]
	str	xzr, [x19, 528]
	str	xzr, [x22, 24]
	str	s0, [x22, 32]
	stp	xzr, xzr, [x22, 40]
	str	x21, [x19, 8]
	add	x0, x19, 40
	stlr	xzr, [x0]
	adrp	x0, .LC53
	adrp	x1, .LC54
	adrp	x2, .LC55
	adrp	x3, .LC56
	ldr	q2, [x0, #:lo12:.LC53]
	add	x0, sp, 232
	ldr	q1, [x1, #:lo12:.LC54]
	mov	x1, 10
	ldr	q0, [x2, #:lo12:.LC55]
	str	x1, [x19, 80]
	ldr	x1, [sp, 216]
	str	x1, [x19, 304]
	ldr	x1, [sp, 224]
	str	x1, [x19, 296]
	str	x0, [x19, 312]
	add	x0, x19, 48
	stp	q2, q1, [x19, 48]
	str	q0, [x22, -88]
	ldr	x2, [x19, 8]
	str	x0, [sp, 128]
	add	x0, x1, 140
	str	x0, [x19, 24]
	ldr	q0, [x3, #:lo12:.LC56]
	add	x1, x1, 132
	mul	x0, x0, x2
	str	xzr, [x19, 240]
	str	x1, [x19, 248]
	str	q0, [x19, 224]
	bl	malloc
	str	x0, [x19, 256]
	cbz	x0, .L3348
	add	x24, x19, 16
	stlr	xzr, [x24]
	mov	x0, 136
.LEHB182:
	bl	_Znwm
.LEHE182:
	mov	x20, x0
	mov	x1, 8
	movi	v0.4s, 0
	mov	x0, 64
	stp	xzr, x1, [x20]
	stp	q0, q0, [x20, 16]
	stp	q0, q0, [x20, 48]
.LEHB183:
	bl	_Znwm
.LEHE183:
	mov	x25, x0
	ldr	x1, [x20, 8]
	str	x25, [x20]
	mov	x0, 512
	sub	x1, x1, #1
	lsr	x1, x1, 1
	str	x1, [sp, 120]
	add	x2, x25, x1, lsl 3
	str	x2, [sp, 104]
.LEHB184:
	bl	_Znwm
.LEHE184:
	mov	x1, x0
	add	x2, x20, 16
	dup	v0.2d, x0
	mov	x3, x2
	ldr	x0, [sp, 120]
	add	x28, x20, 48
	ldr	x4, [sp, 104]
	add	x2, x20, 80
	str	x1, [x25, x0, lsl 3]
	add	x0, x1, 512
	stp	x0, x4, [x3, 16]
	stp	x1, x0, [x28, 8]
	mov	x0, 24
	str	x4, [x28, 24]
	str	x1, [x20, 48]
	str	q0, [x20, 16]
	stp	xzr, xzr, [x20, 80]
	stp	xzr, xzr, [x2, 16]
	stp	xzr, xzr, [x2, 32]
	str	w21, [x20, 128]
	str	x3, [sp, 152]
.LEHB185:
	bl	_Znwm
.LEHE185:
	mov	x25, x0
	ldr	w1, [x20, 128]
	mov	w0, -1
	strh	w0, [x25]
	ubfiz	x0, x1, 1, 32
	str	w1, [x25, 16]
.LEHB186:
	bl	_Znam
.LEHE186:
	ldp	x1, x2, [x20, 16]
	str	x0, [x25, 8]
	cmp	x2, x1
	beq	.L3349
	mov	x0, x1
	str	x25, [x0, -8]!
	str	x0, [x20, 16]
.L3184:
	ldr	x28, [x19, 112]
	str	x20, [x19, 112]
	cbz	x28, .L3187
	add	x20, x28, 16
	add	x25, x28, 48
.L3186:
	ldp	x6, x4, [x20, 16]
	ldr	x3, [x20]
	.p2align 3,,7
.L3198:
	sub	x1, x6, x3
	ldp	x2, x8, [x25]
	ldr	x7, [x25, 24]
	sub	x0, x7, x4
	sub	x2, x2, x8
	asr	x0, x0, 3
	sub	x0, x0, #1
	asr	x2, x2, 3
	add	x0, x2, x0, lsl 6
	add	x0, x0, x1, asr 3
	cbz	x0, .L3195
	sub	x0, x6, #8
	ldr	x2, [x3]
	cmp	x3, x0
	beq	.L3196
	add	x3, x3, 8
	str	x3, [x28, 16]
	cbz	x2, .L3198
.L3350:
	ldr	x0, [x2, 8]
	cbz	x0, .L3199
	str	x2, [sp, 104]
	bl	_ZdaPv
	ldr	x2, [sp, 104]
.L3199:
	mov	x0, x2
	mov	x1, 24
	bl	_ZdlPvm
	b	.L3186
	.p2align 2,,3
.L3196:
	ldr	x0, [x28, 24]
	mov	x1, 512
	str	x2, [sp, 104]
	bl	_ZdlPvm
	ldr	x0, [x28, 40]
	ldr	x2, [sp, 104]
	add	x4, x0, 8
	ldr	x3, [x0, 8]
	str	x4, [x20, 24]
	add	x6, x3, 512
	stp	x3, x6, [x20, 8]
	str	x3, [x28, 16]
	cbz	x2, .L3198
	b	.L3350
	.p2align 2,,3
.L3195:
	ldr	x0, [x28]
	cbz	x0, .L3200
	add	x20, x7, 8
	cmp	x4, x20
	bcs	.L3201
	.p2align 3,,7
.L3202:
	ldr	x0, [x4], 8
	mov	x1, 512
	str	x4, [sp, 104]
	bl	_ZdlPvm
	ldr	x4, [sp, 104]
	cmp	x20, x4
	bhi	.L3202
	ldr	x0, [x28]
.L3201:
	ldr	x1, [x28, 8]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L3200:
	mov	x0, x28
	mov	x1, 136
	bl	_ZdlPvm
.L3187:
	ldr	x0, [x19, 8]
	mov	w1, -1
	str	w1, [x19, 104]
	str	w1, [x19, 216]
	lsl	x0, x0, 3
	bl	malloc
	str	x0, [x19, 264]
	cbz	x0, .L3351
	ldr	d0, [x19, 48]
	ldr	x0, [x19, 56]
	ucvtf	d0, d0
	add	x0, x0, 1
	lsl	x0, x0, 2
	str	x0, [x19, 32]
	bl	log
	strb	wzr, [sp, 280]
	fmov	d1, 1.0e+0
	ldr	x0, [x19, 120]
	str	x0, [sp, 272]
	fdiv	d0, d1, d0
	fdiv	d1, d1, d0
	stp	d0, d1, [x19, 88]
	cbz	x0, .L3204
	adrp	x1, .LC12
	ldr	x20, [x1, #:lo12:.LC12]
	cbz	x20, .L3218
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3346
.L3218:
	ldr	x1, [sp, 112]
	mov	w4, 1
	mov	x0, x19
	mov	w3, -1
	mov	x2, 0
	strb	w4, [sp, 280]
.LEHB187:
	bl	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
.LEHE187:
	ldrb	w0, [sp, 280]
	cbnz	w0, .L3352
.L3219:
	cmp	x21, 1
	bls	.L3220
	ldr	x0, [sp, 112]
	add	x22, x0, x23
	cbz	x20, .L3353
	adrp	x25, _ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	mov	x20, 1
	add	x25, x25, :lo12:_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	mov	w28, 48
	b	.L3237
	.p2align 2,,3
.L3234:
	add	x20, x20, 1
	add	x22, x22, x23
	cmp	x21, x20
	beq	.L3220
.L3237:
	ldr	x0, [x19]
	ldr	x4, [x0]
	cmp	x4, x25
	bne	.L3230
	ldr	x1, [x27]
	and	w0, w20, 65535
	strb	wzr, [sp, 808]
	smaddl	x0, w0, w28, x1
	str	x0, [sp, 800]
	cbz	x0, .L3204
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3346
	mov	w4, 1
	mov	x2, x20
	mov	x1, x22
	mov	x0, x19
	mov	w3, -1
	strb	w4, [sp, 808]
.LEHB188:
	bl	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
.LEHE188:
	ldrb	w0, [sp, 808]
	cbz	w0, .L3234
	ldr	x0, [sp, 800]
	cbz	x0, .L3234
	add	x20, x20, 1
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	add	x22, x22, x23
	cmp	x21, x20
	bne	.L3237
	.p2align 3,,7
.L3220:
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	add	x6, sp, 608
	mov	x2, 1007
	mov	w1, 0
	add	x0, sp, 817
	ldp	x4, x5, [x3]
	stp	x4, x5, [x6, 192]
	ldrb	w3, [x3, 16]
	strb	w3, [sp, 816]
	bl	memset
	ldr	x4, [x19]
	add	x5, sp, 256
	mov	x3, 16
	add	x1, sp, 272
	mov	x2, 0
	add	x0, sp, 240
	str	x5, [sp, 240]
	ldr	x20, [x4, 24]
	str	x3, [sp, 272]
.LEHB189:
	bl	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE189:
	str	x0, [sp, 240]
	ldr	x1, [sp, 272]
	str	x1, [sp, 256]
	add	x1, sp, 608
	ldp	x2, x3, [x1, 192]
	stp	x2, x3, [x0]
	adrp	x0, _ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	ldr	x2, [sp, 240]
	add	x0, x0, :lo12:_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	ldr	x1, [sp, 272]
	str	x1, [sp, 248]
	strb	wzr, [x2, x1]
	cmp	x20, x0
	bne	.L3354
	add	x0, sp, 528
	bl	_ZNSt8ios_baseC2Ev
	adrp	x0, _ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	add	x0, x0, :lo12:_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE
	movi	v0.4s, 0
	add	x1, sp, 608
	add	x2, sp, 608
	strh	wzr, [sp, 752]
	ldp	x20, x23, [x0, 8]
	str	x20, [sp, 272]
	add	x3, sp, 272
	adrp	x21, _ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	str	q0, [x1, 152]
	add	x21, x21, :lo12:_ZTVSt9basic_iosIcSt11char_traitsIcEE+16
	add	x0, sp, 272
	str	q0, [x2, 168]
	mov	x1, 0
	ldr	x2, [x20, -24]
	str	x21, [sp, 528]
	str	xzr, [sp, 744]
	add	x0, x0, x2
	str	x23, [x3, x2]
.LEHB190:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE190:
	adrp	x0, _ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64
	adrp	x22, _ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24
	add	x25, x0, :lo12:_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64
	add	x22, x22, :lo12:_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24
	add	x0, sp, 280
	str	x22, [sp, 272]
	str	x25, [sp, 528]
.LEHB191:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE191:
	add	x0, sp, 272
	add	x1, sp, 280
	add	x0, x0, 256
.LEHB192:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
	ldr	x1, [sp, 240]
	add	x0, sp, 280
	mov	w2, 20
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	mov	x2, x0
	ldr	x0, [sp, 272]
	ldr	x1, [x0, -24]
	add	x0, sp, 272
	add	x0, x0, x1
	cbz	x2, .L3355
	mov	w1, 0
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE192:
.L3239:
	add	x1, x19, 240
	add	x0, sp, 272
	mov	x2, 8
.LEHB193:
	bl	_ZNSo5writeEPKcl
	ldr	x1, [sp, 144]
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	mov	x1, x24
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 24
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 248
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 232
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 104
	add	x0, sp, 272
	mov	x2, 4
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 216
	add	x0, sp, 272
	mov	x2, 4
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 56
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 64
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	ldr	x1, [sp, 128]
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	ldr	x1, [sp, 136]
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	add	x1, x19, 72
	add	x0, sp, 272
	mov	x2, 8
	bl	_ZNSo5writeEPKcl
	ldr	x1, [x19, 256]
	ldar	x3, [x24]
	ldr	x2, [x19, 24]
	add	x0, sp, 272
	mul	x2, x3, x2
	bl	_ZNSo5writeEPKcl
	mov	x27, 0
	ldar	x0, [x24]
	cmp	x0, x27
	bls	.L3245
	.p2align 3,,7
.L3357:
	ldr	x0, [x26]
	mov	w3, 0
	ldr	w0, [x0, x27, lsl 2]
	cmp	w0, 0
	ble	.L3246
	ldr	x3, [x19, 32]
	mul	w3, w0, w3
.L3246:
	add	x1, sp, 204
	add	x0, sp, 272
	mov	x2, 4
	str	w3, [sp, 204]
	bl	_ZNSo5writeEPKcl
	ldr	w2, [sp, 204]
	cbnz	w2, .L3356
	add	x27, x27, 1
.L3359:
	ldar	x0, [x24]
	cmp	x0, x27
	bhi	.L3357
.L3245:
	add	x0, sp, 280
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE193:
	cbz	x0, .L3358
.L3249:
	adrp	x1, _ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt13basic_filebufIcSt11char_traitsIcEE+16
	add	x0, sp, 280
	stp	x22, x1, [sp, 272]
	str	x25, [sp, 528]
.LEHB194:
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE194:
.L3252:
	add	x0, sp, 392
	bl	_ZNSt12__basic_fileIcED1Ev
	adrp	x1, _ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x1, x1, :lo12:_ZTVSt15basic_streambufIcSt11char_traitsIcEE+16
	add	x0, sp, 336
	str	x1, [sp, 280]
	bl	_ZNSt6localeD1Ev
	ldr	x1, [x20, -24]
	add	x2, sp, 272
	str	x20, [sp, 272]
	add	x0, sp, 528
	str	x23, [x2, x1]
	str	x21, [sp, 528]
	bl	_ZNSt8ios_baseD2Ev
.L3250:
	ldr	x0, [sp, 240]
	add	x1, sp, 256
	cmp	x0, x1
	beq	.L3174
	ldr	x1, [sp, 256]
	add	x1, x1, 1
	bl	_ZdlPvm
.L3174:
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	add	sp, sp, 1824
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3230:
	.cfi_restore_state
	mov	x2, x20
	mov	x1, x22
	mov	x0, x19
	mov	w3, 0
.LEHB195:
	blr	x4
.LEHE195:
	b	.L3234
	.p2align 2,,3
.L3356:
	ldr	x1, [x19, 264]
	uxtw	x2, w2
	add	x0, sp, 272
	ldr	x1, [x1, x27, lsl 3]
.LEHB196:
	bl	_ZNSo5writeEPKcl
.LEHE196:
	add	x27, x27, 1
	b	.L3359
	.p2align 2,,3
.L3352:
	ldr	x0, [sp, 272]
	cbz	x0, .L3219
	cbz	x20, .L3219
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L3219
	.p2align 2,,3
.L3176:
	add	x26, x19, 272
	str	xzr, [x19, 192]
	stp	xzr, xzr, [x24, 8]
	mov	x20, 0
	str	wzr, [x19, 216]
	stp	xzr, xzr, [x19, 224]
	stp	xzr, xzr, [x19, 240]
	stp	xzr, xzr, [x19, 256]
	str	xzr, [x19, 272]
	str	xzr, [x26, 16]
	b	.L3256
	.p2align 2,,3
.L3353:
	mov	x20, 1
	adrp	x25, _ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	mov	w28, w20
	add	x25, x25, :lo12:_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	b	.L3229
	.p2align 2,,3
.L3225:
	ldr	x1, [x27]
	and	w0, w20, 65535
	mov	w2, 48
	strb	wzr, [sp, 808]
	smaddl	x0, w0, w2, x1
	str	x0, [sp, 800]
	cbz	x0, .L3204
	mov	x2, x20
	mov	x1, x22
	mov	x0, x19
	mov	w3, -1
	strb	w28, [sp, 808]
.LEHB197:
	bl	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
.LEHE197:
.L3226:
	add	x20, x20, 1
	add	x22, x22, x23
	cmp	x21, x20
	beq	.L3220
.L3229:
	ldr	x0, [x19]
	ldr	x4, [x0]
	cmp	x4, x25
	beq	.L3225
	mov	x2, x20
	mov	x1, x22
	mov	x0, x19
	mov	w3, 0
.LEHB198:
	blr	x4
.LEHE198:
	b	.L3226
	.p2align 2,,3
.L3355:
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB199:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE199:
	b	.L3239
	.p2align 2,,3
.L3354:
	mov	x0, x19
	add	x1, sp, 240
.LEHB200:
	blr	x20
.LEHE200:
	b	.L3250
	.p2align 2,,3
.L3349:
	ldr	x6, [sp, 152]
	mov	x4, 1152921504606846975
	ldr	x1, [x28, 8]
	ldr	x3, [x20, 48]
	ldr	x0, [x28, 24]
	sub	x3, x3, x1
	ldp	x1, x5, [x6, 16]
	asr	x3, x3, 3
	str	x5, [sp, 104]
	sub	x0, x0, x5
	sub	x1, x1, x2
	asr	x0, x0, 3
	sub	x0, x0, #1
	add	x0, x3, x0, lsl 6
	add	x0, x0, x1, asr 3
	cmp	x0, x4
	beq	.L3182
	ldr	x0, [x20]
	cmp	x5, x0
	beq	.L3183
.L3185:
	mov	x0, 512
.LEHB201:
	bl	_Znwm
.LEHE201:
	ldr	x1, [sp, 104]
	ldr	x2, [sp, 152]
	str	x0, [x1, -8]
	ldr	x0, [x20, 40]
	sub	x1, x0, #8
	ldr	x0, [x0, -8]
	str	x0, [x2, 8]
	str	x1, [x2, 24]
	add	x1, x0, 512
	str	x1, [x2, 16]
	add	x1, x0, 504
	str	x1, [x20, 16]
	str	x25, [x0, 504]
	b	.L3184
	.p2align 2,,3
.L3358:
	ldr	x0, [sp, 272]
	add	x1, sp, 272
	ldr	x0, [x0, -24]
	add	x0, x1, x0
	ldr	w1, [x0, 32]
	orr	w1, w1, 4
.LEHB202:
	bl	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE202:
	b	.L3249
.L3183:
	mov	x0, x20
	mov	w2, 1
	mov	x1, 1
.LEHB203:
	bl	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_reallocate_mapEmb
.LEHE203:
	ldr	x0, [x20, 40]
	str	x0, [sp, 104]
	b	.L3185
.L3204:
	mov	w0, 1
.LEHB204:
	bl	_ZSt20__throw_system_errori
.L3346:
	bl	_ZSt20__throw_system_errori
.LEHE204:
.L3182:
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
.LEHB205:
	bl	_ZSt20__throw_length_errorPKc
.LEHE205:
.L3347:
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
.LEHB206:
	bl	_ZSt20__throw_length_errorPKc
.LEHE206:
.L3351:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC50
	mov	x20, x0
	add	x1, x1, :lo12:.LC50
.LEHB207:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE207:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB208:
	bl	__cxa_throw
.LEHE208:
.L3273:
	ldrb	w1, [sp, 280]
	mov	x19, x0
	cbz	w1, .L3255
	add	x0, sp, 272
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L3255:
	mov	x0, x19
.LEHB209:
	bl	_Unwind_Resume
.L3265:
.L3345:
	mov	x1, x0
	mov	x0, x20
	mov	x20, x1
	bl	__cxa_free_exception
.L3207:
	mov	x0, x22
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEED1Ev
	ldr	x0, [sp, 168]
	ldr	x0, [x0, 16]
	cbnz	x0, .L3360
.L3209:
	ldr	x21, [sp, 168]
	mov	w1, 0
	ldr	x0, [x19, 368]
	ldr	x2, [x21, 8]
	lsl	x2, x2, 3
	bl	memset
	ldr	x2, [sp, 176]
	ldr	x0, [x19, 368]
	stp	xzr, xzr, [x21, 16]
	ldr	x1, [x21, 8]
	cmp	x2, x0
	beq	.L3211
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L3211:
	ldr	x0, [x19, 272]
	ldr	x1, [x26, 16]
	sub	x1, x1, x0
	cbz	x0, .L3213
	bl	_ZdlPvm
.L3213:
	ldr	x1, [sp, 160]
	ldr	x0, [x19, 192]
	ldr	x1, [x1, 16]
	sub	x1, x1, x0
	cbz	x0, .L3215
	bl	_ZdlPvm
.L3215:
	ldr	x0, [x19, 120]
	ldr	x1, [x27, 16]
	sub	x1, x1, x0
	cbz	x0, .L3217
	bl	_ZdlPvm
.L3217:
	ldr	x0, [sp, 184]
	bl	_ZNSt10unique_ptrIN7hnswlib15VisitedListPoolESt14default_deleteIS1_EED1Ev
	mov	x1, 568
	mov	x0, x19
	bl	_ZdlPvm
	mov	x0, x20
	bl	_Unwind_Resume
.LEHE209:
.L3260:
	mov	x19, x0
	b	.L3244
.L3266:
	mov	x1, x0
.L3189:
	mov	x0, x20
	mov	x20, x1
	mov	x1, 136
	bl	_ZdlPvm
	b	.L3207
.L3262:
	mov	x20, x0
	b	.L3215
.L3275:
	mov	x19, x0
	add	x0, sp, 272
	bl	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
.L3244:
	ldr	x0, [sp, 240]
	add	x1, sp, 256
	cmp	x0, x1
	beq	.L3255
	ldr	x1, [sp, 256]
	add	x1, x1, 1
	bl	_ZdlPvm
	b	.L3255
.L3268:
	mov	x21, x0
.L3191:
	ldr	x0, [x20]
	cbz	x0, .L3192
	ldr	x23, [x20, 72]
	ldr	x24, [x20, 40]
	add	x23, x23, 8
.L3194:
	cmp	x23, x24
	bhi	.L3361
	ldp	x0, x1, [x20]
	lsl	x1, x1, 3
	bl	_ZdlPvm
.L3192:
	mov	x1, x21
	b	.L3189
.L3348:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC49
	mov	x20, x0
	add	x1, x1, :lo12:.LC49
.LEHB210:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE210:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB211:
	bl	__cxa_throw
.LEHE211:
.L3264:
	mov	x20, x0
	b	.L3207
.L3267:
	b	.L3345
.L3263:
	mov	x20, x0
	b	.L3213
.L3361:
	ldr	x0, [x24], 8
	mov	x1, 512
	bl	_ZdlPvm
	b	.L3194
.L3278:
	mov	x19, x0
	add	x0, sp, 280
	bl	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
.L3242:
	ldr	x0, [x20, -24]
	add	x1, sp, 272
	str	x20, [sp, 272]
	str	x23, [x1, x0]
.L3243:
	add	x0, sp, 528
	str	x21, [sp, 528]
	bl	_ZNSt8ios_baseD2Ev
	b	.L3244
.L3276:
	mov	x19, x0
	b	.L3243
.L3277:
	mov	x19, x0
	b	.L3242
.L3269:
	mov	x21, x0
	mov	x1, 24
	mov	x0, x25
	bl	_ZdlPvm
	b	.L3191
.L3274:
	ldrb	w1, [sp, 808]
	mov	x19, x0
	cbz	w1, .L3255
	add	x0, sp, 800
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L3255
.L3261:
	mov	x20, x0
	b	.L3217
.L3279:
	bl	__cxa_begin_catch
	bl	__cxa_end_catch
	b	.L3252
.L3271:
	bl	__cxa_begin_catch
.LEHB212:
	bl	__cxa_rethrow
.LEHE212:
.L3272:
	mov	x21, x0
	bl	__cxa_end_catch
	mov	x0, x21
	bl	__cxa_begin_catch
	ldp	x0, x1, [x20]
	lsl	x1, x1, 3
	bl	_ZdlPvm
	stp	xzr, xzr, [x20]
.LEHB213:
	bl	__cxa_rethrow
.LEHE213:
.L3360:
	ldr	x21, [x0]
	mov	x1, 24
	bl	_ZdlPvm
	mov	x0, x21
	cbnz	x0, .L3360
	b	.L3209
.L3270:
	mov	x21, x0
	bl	__cxa_end_catch
	mov	x1, x21
	b	.L3189
	.cfi_endproc
.LFE10590:
	.section	.gcc_except_table
	.align	2
.LLSDA10590:
	.byte	0xff
	.byte	0x9b
	.uleb128 .LLSDATT10590-.LLSDATTD10590
.LLSDATTD10590:
	.byte	0x1
	.uleb128 .LLSDACSE10590-.LLSDACSB10590
.LLSDACSB10590:
	.uleb128 .LEHB178-.LFB10590
	.uleb128 .LEHE178-.LEHB178
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB179-.LFB10590
	.uleb128 .LEHE179-.LEHB179
	.uleb128 .L3261-.LFB10590
	.uleb128 0
	.uleb128 .LEHB180-.LFB10590
	.uleb128 .LEHE180-.LEHB180
	.uleb128 .L3262-.LFB10590
	.uleb128 0
	.uleb128 .LEHB181-.LFB10590
	.uleb128 .LEHE181-.LEHB181
	.uleb128 .L3263-.LFB10590
	.uleb128 0
	.uleb128 .LEHB182-.LFB10590
	.uleb128 .LEHE182-.LEHB182
	.uleb128 .L3264-.LFB10590
	.uleb128 0
	.uleb128 .LEHB183-.LFB10590
	.uleb128 .LEHE183-.LEHB183
	.uleb128 .L3266-.LFB10590
	.uleb128 0
	.uleb128 .LEHB184-.LFB10590
	.uleb128 .LEHE184-.LEHB184
	.uleb128 .L3271-.LFB10590
	.uleb128 0x1
	.uleb128 .LEHB185-.LFB10590
	.uleb128 .LEHE185-.LEHB185
	.uleb128 .L3268-.LFB10590
	.uleb128 0
	.uleb128 .LEHB186-.LFB10590
	.uleb128 .LEHE186-.LEHB186
	.uleb128 .L3269-.LFB10590
	.uleb128 0
	.uleb128 .LEHB187-.LFB10590
	.uleb128 .LEHE187-.LEHB187
	.uleb128 .L3273-.LFB10590
	.uleb128 0
	.uleb128 .LEHB188-.LFB10590
	.uleb128 .LEHE188-.LEHB188
	.uleb128 .L3274-.LFB10590
	.uleb128 0
	.uleb128 .LEHB189-.LFB10590
	.uleb128 .LEHE189-.LEHB189
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB190-.LFB10590
	.uleb128 .LEHE190-.LEHB190
	.uleb128 .L3276-.LFB10590
	.uleb128 0
	.uleb128 .LEHB191-.LFB10590
	.uleb128 .LEHE191-.LEHB191
	.uleb128 .L3277-.LFB10590
	.uleb128 0
	.uleb128 .LEHB192-.LFB10590
	.uleb128 .LEHE192-.LEHB192
	.uleb128 .L3278-.LFB10590
	.uleb128 0
	.uleb128 .LEHB193-.LFB10590
	.uleb128 .LEHE193-.LEHB193
	.uleb128 .L3275-.LFB10590
	.uleb128 0
	.uleb128 .LEHB194-.LFB10590
	.uleb128 .LEHE194-.LEHB194
	.uleb128 .L3279-.LFB10590
	.uleb128 0x1
	.uleb128 .LEHB195-.LFB10590
	.uleb128 .LEHE195-.LEHB195
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB196-.LFB10590
	.uleb128 .LEHE196-.LEHB196
	.uleb128 .L3275-.LFB10590
	.uleb128 0
	.uleb128 .LEHB197-.LFB10590
	.uleb128 .LEHE197-.LEHB197
	.uleb128 .L3274-.LFB10590
	.uleb128 0
	.uleb128 .LEHB198-.LFB10590
	.uleb128 .LEHE198-.LEHB198
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB199-.LFB10590
	.uleb128 .LEHE199-.LEHB199
	.uleb128 .L3278-.LFB10590
	.uleb128 0
	.uleb128 .LEHB200-.LFB10590
	.uleb128 .LEHE200-.LEHB200
	.uleb128 .L3260-.LFB10590
	.uleb128 0
	.uleb128 .LEHB201-.LFB10590
	.uleb128 .LEHE201-.LEHB201
	.uleb128 .L3268-.LFB10590
	.uleb128 0
	.uleb128 .LEHB202-.LFB10590
	.uleb128 .LEHE202-.LEHB202
	.uleb128 .L3275-.LFB10590
	.uleb128 0
	.uleb128 .LEHB203-.LFB10590
	.uleb128 .LEHE203-.LEHB203
	.uleb128 .L3268-.LFB10590
	.uleb128 0
	.uleb128 .LEHB204-.LFB10590
	.uleb128 .LEHE204-.LEHB204
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB205-.LFB10590
	.uleb128 .LEHE205-.LEHB205
	.uleb128 .L3268-.LFB10590
	.uleb128 0
	.uleb128 .LEHB206-.LFB10590
	.uleb128 .LEHE206-.LEHB206
	.uleb128 .L3262-.LFB10590
	.uleb128 0
	.uleb128 .LEHB207-.LFB10590
	.uleb128 .LEHE207-.LEHB207
	.uleb128 .L3265-.LFB10590
	.uleb128 0
	.uleb128 .LEHB208-.LFB10590
	.uleb128 .LEHE208-.LEHB208
	.uleb128 .L3264-.LFB10590
	.uleb128 0
	.uleb128 .LEHB209-.LFB10590
	.uleb128 .LEHE209-.LEHB209
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB210-.LFB10590
	.uleb128 .LEHE210-.LEHB210
	.uleb128 .L3267-.LFB10590
	.uleb128 0
	.uleb128 .LEHB211-.LFB10590
	.uleb128 .LEHE211-.LEHB211
	.uleb128 .L3264-.LFB10590
	.uleb128 0
	.uleb128 .LEHB212-.LFB10590
	.uleb128 .LEHE212-.LEHB212
	.uleb128 .L3272-.LFB10590
	.uleb128 0x1
	.uleb128 .LEHB213-.LFB10590
	.uleb128 .LEHE213-.LEHB213
	.uleb128 .L3270-.LFB10590
	.uleb128 0
.LLSDACSE10590:
	.byte	0x1
	.byte	0
	.align	2
	.4byte	0

.LLSDATT10590:
	.text
	.size	_Z11build_indexPfmm, .-_Z11build_indexPfmm
	.section	.rodata._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb.str1.8,"aMS",@progbits,1
	.align	3
.LC57:
	.string	"Replacement of deleted elements is disabled in constructor"
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	.type	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb, %function
_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb:
.LFB11208:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA11208
	stp	x29, x30, [sp, -144]!
	.cfi_def_cfa_offset 144
	.cfi_offset 29, -144
	.cfi_offset 30, -136
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -128
	.cfi_offset 20, -120
	mov	x19, x0
	ldrb	w0, [x0, 456]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -112
	.cfi_offset 22, -104
	and	w22, w3, 255
	eor	w0, w0, 1
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -96
	.cfi_offset 24, -88
	str	x2, [sp, 72]
	tst	w22, w0
	bne	.L3500
	mov	x21, x1
	ubfiz	x0, x2, 1, 16
	ldr	x1, [x19, 120]
	add	x0, x0, x2, uxth
	strb	wzr, [sp, 104]
	add	x0, x1, x0, lsl 4
	str	x0, [sp, 96]
	cbz	x0, .L3501
	adrp	x1, .LC12
	ldr	x20, [x1, #:lo12:.LC12]
	cbz	x20, .L3365
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3502
.L3365:
	mov	w0, 1
	strb	w0, [sp, 104]
	cbz	w22, .L3503
	add	x22, x19, 464
	str	x22, [sp, 112]
	strb	wzr, [sp, 120]
	cbz	x20, .L3369
	mov	x0, x22
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3504
.L3369:
	ldr	x24, [x19, 536]
	mov	w0, 1
	strb	w0, [sp, 120]
	add	x23, x19, 512
	cbnz	x24, .L3505
	ldr	x0, [sp, 112]
	cbz	x0, .L3492
	cbz	x20, .L3506
.L3402:
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	strb	wzr, [sp, 120]
	ldr	x2, [sp, 72]
	cbz	x24, .L3397
.L3372:
	ldp	x4, x3, [x19, 248]
	add	x0, x19, 320
	ldr	w1, [sp, 80]
	ldr	x5, [x19, 24]
	madd	x1, x1, x5, x4
	ldr	x4, [x3, x1]
	str	x4, [sp, 88]
	str	x2, [x3, x1]
	str	x0, [sp, 128]
	strb	wzr, [sp, 136]
	cbz	x20, .L3374
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3507
.L3374:
	mov	w3, 1
	add	x2, sp, 88
	add	x24, x19, 368
	mov	w1, 0
	mov	x0, x24
	strb	w3, [sp, 136]
	bl	_ZNSt10_HashtableImSt4pairIKmjESaIS2_ENSt8__detail10_Select1stESt8equal_toImESt4hashImENS4_18_Mod_range_hashingENS4_20_Default_ranged_hashENS4_20_Prime_rehash_policyENS4_17_Hashtable_traitsILb0ELb0ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERS1_
	mov	x0, x24
	add	x1, sp, 72
.LEHB214:
	bl	_ZNSt8__detail9_Map_baseImSt4pairIKmjESaIS3_ENS_10_Select1stESt8equal_toImESt4hashImENS_18_Mod_range_hashingENS_20_Default_ranged_hashENS_20_Prime_rehash_policyENS_17_Hashtable_traitsILb0ELb0ELb1EEELb1EEixERS2_
	ldrb	w1, [sp, 136]
	ldr	w2, [sp, 80]
	str	w2, [x0]
	cbz	w1, .L3508
	ldr	x0, [sp, 128]
	cbz	x0, .L3376
	cbz	x20, .L3377
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L3377:
	strb	wzr, [sp, 136]
.L3376:
	ldr	w0, [sp, 80]
	str	w0, [sp, 84]
	add	x1, x19, 16
	ldar	x1, [x1]
	cmp	x1, x0, uxtw
	bls	.L3509
	ldr	w1, [sp, 84]
	ldr	x3, [x19, 24]
	ldr	x2, [x19, 240]
	ldr	x0, [x19, 256]
	madd	x1, x1, x3, x2
	add	x0, x0, x1
	ldrb	w1, [x0, 2]
	tbz	x1, 0, .L3379
	and	w1, w1, -2
	strb	w1, [x0, 2]
	add	x0, x19, 40
.L3516:
	ldaxr	x1, [x0]
	sub	x1, x1, #1
	stlxr	w2, x1, [x0]
	cbnz	w2, .L3516
	ldrb	w0, [x19, 456]
	cbnz	w0, .L3510
.L3380:
	ldr	w2, [sp, 80]
	fmov	s0, 1.0e+0
	mov	x1, x21
	mov	x0, x19
	bl	_ZN7hnswlib15HierarchicalNSWIfE11updatePointEPKvjf
.LEHE214:
	ldrb	w0, [sp, 136]
	cbnz	w0, .L3511
.L3373:
	ldrb	w0, [sp, 120]
	cbnz	w0, .L3512
.L3387:
	ldrb	w0, [sp, 104]
	cbnz	w0, .L3513
.L3362:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3505:
	.cfi_restore_state
	ldr	x3, [x23, 16]
	add	x2, sp, 80
	mov	x0, x23
	mov	w1, 0
	ldr	w3, [x3, 8]
	str	w3, [sp, 80]
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj
	ldrb	w0, [sp, 120]
	cbz	w0, .L3514
	ldr	x0, [sp, 112]
	cbz	x0, .L3493
	cbnz	x20, .L3402
	strb	wzr, [sp, 120]
.L3493:
	ldr	x2, [sp, 72]
	b	.L3372
	.p2align 2,,3
.L3503:
	ldr	x2, [sp, 72]
	mov	x1, x21
	mov	x0, x19
	mov	w3, -1
.LEHB215:
	bl	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
.LEHE215:
	ldrb	w0, [sp, 104]
	cbz	w0, .L3362
.L3513:
	ldr	x0, [sp, 96]
	cbz	x0, .L3362
	cbz	x20, .L3362
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 144
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3506:
	.cfi_restore_state
	strb	wzr, [sp, 120]
.L3492:
	ldr	x2, [sp, 72]
.L3397:
	mov	x1, x21
	mov	x0, x19
	mov	w3, -1
.LEHB216:
	bl	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmi
.LEHE216:
	ldrb	w0, [sp, 120]
	cbz	w0, .L3387
.L3512:
	ldr	x0, [sp, 112]
	cbz	x0, .L3387
	cbz	x20, .L3387
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L3387
	.p2align 2,,3
.L3510:
	cbz	x20, .L3381
	mov	x0, x22
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3515
.L3381:
	mov	x0, x23
	add	x2, sp, 84
	mov	w1, 0
	bl	_ZNSt10_HashtableIjjSaIjENSt8__detail9_IdentityESt8equal_toIjESt4hashIjENS1_18_Mod_range_hashingENS1_20_Default_ranged_hashENS1_20_Prime_rehash_policyENS1_17_Hashtable_traitsILb0ELb1ELb1EEEE8_M_eraseESt17integral_constantIbLb1EERKj
	cbz	x20, .L3380
	mov	x0, x22
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L3380
	.p2align 2,,3
.L3511:
	ldr	x0, [sp, 128]
	cbz	x0, .L3373
	cbz	x20, .L3373
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
	b	.L3373
.L3504:
.LEHB217:
	bl	_ZSt20__throw_system_errori
.LEHE217:
.L3501:
	mov	w0, 1
.LEHB218:
	bl	_ZSt20__throw_system_errori
.LEHE218:
.L3514:
	mov	w0, 1
.LEHB219:
	bl	_ZSt20__throw_system_errori
.LEHE219:
.L3502:
.LEHB220:
	bl	_ZSt20__throw_system_errori
.LEHE220:
.L3509:
	adrp	x3, .LC41
	adrp	x1, .LC42
	adrp	x0, .LC43
	add	x3, x3, :lo12:.LC41
	add	x1, x1, :lo12:.LC42
	add	x0, x0, :lo12:.LC43
	mov	w2, 916
	bl	__assert_fail
.L3508:
	mov	w0, 1
.LEHB221:
	bl	_ZSt20__throw_system_errori
.LEHE221:
.L3507:
.LEHB222:
	bl	_ZSt20__throw_system_errori
.LEHE222:
.L3515:
.LEHB223:
	bl	_ZSt20__throw_system_errori
.LEHE223:
.L3406:
	mov	x19, x0
.L3392:
	ldrb	w0, [sp, 104]
	cbz	w0, .L3393
	add	x0, sp, 96
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L3393:
	mov	x0, x19
.LEHB224:
	bl	_Unwind_Resume
.LEHE224:
.L3379:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC44
	mov	x20, x0
	add	x1, x1, :lo12:.LC44
.LEHB225:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE225:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB226:
	bl	__cxa_throw
.LEHE226:
.L3500:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC57
	mov	x19, x0
	add	x1, x1, :lo12:.LC57
.LEHB227:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE227:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x19
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB228:
	bl	__cxa_throw
.LEHE228:
.L3408:
	mov	x19, x0
	b	.L3385
.L3407:
	mov	x19, x0
.L3390:
	ldrb	w0, [sp, 120]
	cbz	w0, .L3392
	add	x0, sp, 112
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L3392
.L3409:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
.L3385:
	ldrb	w0, [sp, 136]
	cbz	w0, .L3390
	add	x0, sp, 128
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L3390
.L3405:
	mov	x1, x0
	mov	x0, x19
	mov	x19, x1
	bl	__cxa_free_exception
	mov	x0, x19
.LEHB229:
	bl	_Unwind_Resume
.LEHE229:
	.cfi_endproc
.LFE11208:
	.section	.gcc_except_table
.LLSDA11208:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE11208-.LLSDACSB11208
.LLSDACSB11208:
	.uleb128 .LEHB214-.LFB11208
	.uleb128 .LEHE214-.LEHB214
	.uleb128 .L3408-.LFB11208
	.uleb128 0
	.uleb128 .LEHB215-.LFB11208
	.uleb128 .LEHE215-.LEHB215
	.uleb128 .L3406-.LFB11208
	.uleb128 0
	.uleb128 .LEHB216-.LFB11208
	.uleb128 .LEHE216-.LEHB216
	.uleb128 .L3407-.LFB11208
	.uleb128 0
	.uleb128 .LEHB217-.LFB11208
	.uleb128 .LEHE217-.LEHB217
	.uleb128 .L3406-.LFB11208
	.uleb128 0
	.uleb128 .LEHB218-.LFB11208
	.uleb128 .LEHE218-.LEHB218
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB219-.LFB11208
	.uleb128 .LEHE219-.LEHB219
	.uleb128 .L3407-.LFB11208
	.uleb128 0
	.uleb128 .LEHB220-.LFB11208
	.uleb128 .LEHE220-.LEHB220
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB221-.LFB11208
	.uleb128 .LEHE221-.LEHB221
	.uleb128 .L3408-.LFB11208
	.uleb128 0
	.uleb128 .LEHB222-.LFB11208
	.uleb128 .LEHE222-.LEHB222
	.uleb128 .L3407-.LFB11208
	.uleb128 0
	.uleb128 .LEHB223-.LFB11208
	.uleb128 .LEHE223-.LEHB223
	.uleb128 .L3408-.LFB11208
	.uleb128 0
	.uleb128 .LEHB224-.LFB11208
	.uleb128 .LEHE224-.LEHB224
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB225-.LFB11208
	.uleb128 .LEHE225-.LEHB225
	.uleb128 .L3409-.LFB11208
	.uleb128 0
	.uleb128 .LEHB226-.LFB11208
	.uleb128 .LEHE226-.LEHB226
	.uleb128 .L3408-.LFB11208
	.uleb128 0
	.uleb128 .LEHB227-.LFB11208
	.uleb128 .LEHE227-.LEHB227
	.uleb128 .L3405-.LFB11208
	.uleb128 0
	.uleb128 .LEHB228-.LFB11208
	.uleb128 .LEHE228-.LEHB228
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB229-.LFB11208
	.uleb128 .LEHE229-.LEHB229
	.uleb128 0
	.uleb128 0
.LLSDACSE11208:
	.section	.text._ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb,"axG",@progbits,_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb,comdat
	.size	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb, .-_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	.section	.rodata._ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm.str1.8,"aMS",@progbits,1
	.align	3
.LC58:
	.string	"vector::_M_default_append"
	.section	.text._ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm,"axG",@progbits,_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm
	.type	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm, %function
_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm:
.LFB13456:
	.cfi_startproc
	cbz	x1, .L3542
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x2, 576460752303423487
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x22, x0
	ldp	x0, x4, [x0]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x20, x1
	ldr	x1, [x22, 16]
	sub	x19, x4, x0
	sub	x3, x1, x4
	asr	x21, x19, 4
	sub	x5, x2, x21
	cmp	x20, x3, asr 4
	bhi	.L3519
	mov	x2, x4
	mov	x3, x20
	.p2align 3,,7
.L3520:
	str	wzr, [x2]
	subs	x3, x3, #1
	str	xzr, [x2, 8]
	add	x2, x2, 16
	bne	.L3520
	add	x4, x4, x20, lsl 4
	str	x4, [x22, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3542:
	ret
	.p2align 2,,3
.L3519:
	.cfi_def_cfa_offset 64
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -8
	.cfi_offset 23, -16
	cmp	x5, x20
	bcc	.L3545
	cmp	x20, x21
	csel	x3, x20, x21, cs
	adds	x3, x21, x3
	bcs	.L3523
	mov	x24, 0
	mov	x23, 0
	cbnz	x3, .L3546
.L3525:
	add	x2, x23, x19
	mov	x3, x20
	.p2align 3,,7
.L3526:
	str	wzr, [x2]
	subs	x3, x3, #1
	str	xzr, [x2, 8]
	add	x2, x2, 16
	bne	.L3526
	cmp	x4, x0
	beq	.L3530
	sub	x4, x4, x0
	mov	x2, x23
	add	x4, x23, x4
	mov	x3, x0
	.p2align 3,,7
.L3531:
	ldp	x6, x7, [x3], 16
	stp	x6, x7, [x2], 16
	cmp	x2, x4
	bne	.L3531
.L3530:
	cbz	x0, .L3529
	sub	x1, x1, x0
	bl	_ZdlPvm
.L3529:
	add	x21, x20, x21
	str	x24, [x22, 16]
	ldp	x19, x20, [sp, 16]
	add	x21, x23, x21, lsl 4
	stp	x23, x21, [x22]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	.cfi_remember_state
	.cfi_restore 24
	.cfi_restore 23
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3546:
	.cfi_restore_state
	cmp	x3, x2
	csel	x3, x3, x2, ls
	lsl	x24, x3, 4
.L3524:
	mov	x0, x24
	bl	_Znwm
	mov	x23, x0
	add	x24, x0, x24
	ldp	x0, x4, [x22]
	ldr	x1, [x22, 16]
	b	.L3525
.L3523:
	mov	x24, 9223372036854775792
	b	.L3524
.L3545:
	adrp	x0, .LC58
	add	x0, x0, :lo12:.LC58
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE13456:
	.size	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm, .-_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm
	.section	.text._ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE,"axG",@progbits,_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE
	.type	_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE, %function
_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE:
.LFB13374:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13374
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	ldr	x4, [x0]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x19, x8
	add	x8, sp, 32
	ldr	x4, [x4, 8]
	stp	xzr, xzr, [x19]
	str	xzr, [x19, 16]
.LEHB230:
	blr	x4
.LEHE230:
	ldp	x2, x0, [sp, 32]
	ldp	x3, x4, [x19]
	sub	x20, x0, x2
	sub	x1, x4, x3
	asr	x5, x20, 4
	cmp	x20, x1
	bhi	.L3598
	bcc	.L3599
.L3549:
	cmp	x2, x0
	beq	.L3550
.L3601:
	ldr	x10, [x19]
	add	x10, x10, x20
	b	.L3566
	.p2align 2,,3
.L3551:
	str	x0, [sp, 40]
	sub	x10, x10, #16
	cmp	x2, x0
	beq	.L3567
.L3566:
	ldr	s0, [x2]
	sub	x1, x0, x2
	ldr	x3, [x2, 8]
	str	x3, [x10, -8]
	str	s0, [x10, -16]
	cmp	x1, 16
	sub	x0, x0, #16
	ble	.L3551
	sub	x3, x0, x2
	ldr	s2, [x0]
	ldr	x4, [x2, 8]
	asr	x12, x3, 4
	sub	x1, x12, #1
	str	s0, [x0]
	ldr	x13, [x0, 8]
	add	x11, x1, x1, lsr 63
	str	x4, [x0, 8]
	and	x14, x12, 1
	asr	x11, x11, 1
	cmp	x3, 32
	ble	.L3552
	mov	x4, 0
	b	.L3556
	.p2align 2,,3
.L3575:
	mov	x1, x3
.L3554:
	lsl	x3, x4, 4
	add	x4, x2, x3
	str	s0, [x2, x3]
	str	x1, [x4, 8]
	cmp	x11, x5
	ble	.L3555
.L3600:
	mov	x4, x5
.L3556:
	add	x3, x4, 1
	lsl	x7, x3, 1
	lsl	x3, x3, 5
	sub	x5, x7, #1
	add	x9, x2, x3
	lsl	x6, x5, 4
	ldr	s1, [x2, x3]
	add	x8, x2, x6
	ldr	s0, [x2, x6]
	fcmpe	s0, s1
	bgt	.L3553
	ldr	x1, [x9, 8]
	bmi	.L3574
	ldr	x3, [x8, 8]
	cmp	x3, x1
	bhi	.L3575
.L3574:
	fmov	s0, s1
	lsl	x3, x4, 4
	add	x4, x2, x3
	mov	x5, x7
	mov	x8, x9
	str	s0, [x2, x3]
	str	x1, [x4, 8]
	cmp	x11, x5
	bgt	.L3600
.L3555:
	lsl	x6, x5, 4
	cbnz	x14, .L3559
	sub	x12, x12, #2
	add	x12, x12, x12, lsr 63
	cmp	x5, x12, asr 1
	beq	.L3558
	sub	x1, x5, #1
	lsl	x6, x5, 4
	asr	x1, x1, 1
	.p2align 3,,7
.L3565:
	lsl	x3, x1, 4
	add	x4, x2, x3
	ldr	s0, [x2, x3]
	fcmpe	s0, s2
	bmi	.L3561
	bgt	.L3596
	ldr	x7, [x4, 8]
	cmp	x13, x7
	bls	.L3596
.L3564:
	add	x8, x2, x6
	sub	x3, x1, #1
	str	s0, [x2, x6]
	mov	x5, x1
	add	x3, x3, x3, lsr 63
	str	x7, [x8, 8]
	asr	x1, x3, 1
	cbz	x5, .L3557
	lsl	x6, x5, 4
	b	.L3565
	.p2align 2,,3
.L3553:
	ldr	x1, [x8, 8]
	b	.L3554
	.p2align 2,,3
.L3596:
	add	x4, x2, x6
.L3557:
	str	s2, [x4]
	sub	x10, x10, #16
	str	x13, [x4, 8]
	str	x0, [sp, 40]
	cmp	x2, x0
	bne	.L3566
.L3567:
	ldr	x1, [sp, 48]
	sub	x1, x1, x0
	bl	_ZdlPvm
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3561:
	.cfi_restore_state
	ldr	x7, [x4, 8]
	b	.L3564
	.p2align 2,,3
.L3552:
	mov	x4, x2
	cbnz	x14, .L3557
	cmp	x1, 2
	bhi	.L3557
	mov	x8, x2
	mov	x5, 0
	.p2align 3,,7
.L3558:
	lsl	x5, x5, 1
	add	x5, x5, 1
	lsl	x6, x5, 4
	add	x1, x2, x6
	ldr	s0, [x2, x6]
	ldr	x1, [x1, 8]
	str	x1, [x8, 8]
	str	s0, [x8]
.L3559:
	sub	x5, x5, #1
	asr	x1, x5, 1
	b	.L3565
	.p2align 2,,3
.L3599:
	add	x3, x3, x20
	cmp	x4, x3
	beq	.L3549
	str	x3, [x19, 8]
	cmp	x2, x0
	bne	.L3601
.L3550:
	cbnz	x0, .L3567
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3598:
	.cfi_restore_state
	sub	x1, x5, x1, asr 4
	mov	x0, x19
.LEHB231:
	bl	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_default_appendEm
.LEHE231:
	ldp	x2, x0, [sp, 32]
	b	.L3549
.L3579:
	mov	x20, x0
.L3571:
	ldr	x0, [x19]
	ldr	x1, [x19, 16]
	sub	x1, x1, x0
	cbz	x0, .L3572
	bl	_ZdlPvm
.L3572:
	mov	x0, x20
.LEHB232:
	bl	_Unwind_Resume
.LEHE232:
.L3580:
	ldr	x2, [sp, 32]
	mov	x20, x0
	ldr	x1, [sp, 48]
	sub	x1, x1, x2
	cbz	x2, .L3571
	mov	x0, x2
	bl	_ZdlPvm
	b	.L3571
	.cfi_endproc
.LFE13374:
	.section	.gcc_except_table
.LLSDA13374:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13374-.LLSDACSB13374
.LLSDACSB13374:
	.uleb128 .LEHB230-.LFB13374
	.uleb128 .LEHE230-.LEHB230
	.uleb128 .L3579-.LFB13374
	.uleb128 0
	.uleb128 .LEHB231-.LFB13374
	.uleb128 .LEHE231-.LEHB231
	.uleb128 .L3580-.LFB13374
	.uleb128 0
	.uleb128 .LEHB232-.LFB13374
	.uleb128 .LEHE232-.LEHB232
	.uleb128 0
	.uleb128 0
.LLSDACSE13374:
	.section	.text._ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE,"axG",@progbits,_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE,comdat
	.size	_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE, .-_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE
	.section	.text._ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB13516:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x1
	mov	x1, 1152921504606846975
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x24, x25, [x0]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	sub	x4, x25, x24
	asr	x4, x4, 3
	cmp	x4, x1
	beq	.L3620
	cmp	x4, 0
	mov	x21, x0
	csinc	x0, x4, xzr, ne
	mov	x26, x2
	mov	x27, x3
	sub	x28, x23, x24
	adds	x4, x4, x0
	bcs	.L3613
	cbnz	x4, .L3607
	mov	x19, 8
	mov	x20, 0
	mov	x22, 0
.L3612:
	ldr	s0, [x26]
	add	x6, x22, x28
	ldr	w0, [x27]
	str	s0, [x22, x28]
	str	w0, [x6, 4]
	cmp	x23, x24
	beq	.L3608
	mov	x3, x22
	mov	x4, x24
	.p2align 3,,7
.L3609:
	ldr	x5, [x4], 8
	str	x5, [x3], 8
	cmp	x3, x6
	bne	.L3609
	add	x19, x3, 8
.L3608:
	cmp	x23, x25
	beq	.L3610
	sub	x2, x25, x23
	mov	x0, x19
	mov	x1, x23
	add	x19, x19, x2
	bl	memcpy
.L3610:
	cbz	x24, .L3611
	ldr	x1, [x21, 16]
	mov	x0, x24
	sub	x1, x1, x24
	bl	_ZdlPvm
.L3611:
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	stp	x22, x19, [x21]
	str	x20, [x21, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3607:
	.cfi_restore_state
	cmp	x4, x1
	csel	x4, x4, x1, ls
	lsl	x20, x4, 3
.L3606:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x20, x0, x20
	add	x19, x0, 8
	b	.L3612
	.p2align 2,,3
.L3613:
	mov	x20, 9223372036854775800
	b	.L3606
.L3620:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE13516:
	.size	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB13518:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x23, x1
	mov	x1, 1152921504606846975
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	ldp	x24, x25, [x0]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x27, x28, [sp, 80]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 27, -16
	.cfi_offset 28, -8
	sub	x4, x25, x24
	asr	x4, x4, 3
	cmp	x4, x1
	beq	.L3639
	cmp	x4, 0
	mov	x21, x0
	csinc	x0, x4, xzr, ne
	mov	x26, x2
	mov	x27, x3
	sub	x28, x23, x24
	adds	x4, x4, x0
	bcs	.L3632
	cbnz	x4, .L3626
	mov	x19, 8
	mov	x20, 0
	mov	x22, 0
.L3631:
	ldr	s0, [x26]
	add	x6, x22, x28
	ldr	w0, [x27]
	str	s0, [x22, x28]
	str	w0, [x6, 4]
	cmp	x23, x24
	beq	.L3627
	mov	x3, x22
	mov	x4, x24
	.p2align 3,,7
.L3628:
	ldr	x5, [x4], 8
	str	x5, [x3], 8
	cmp	x3, x6
	bne	.L3628
	add	x19, x3, 8
.L3627:
	cmp	x23, x25
	beq	.L3629
	sub	x2, x25, x23
	mov	x0, x19
	mov	x1, x23
	add	x19, x19, x2
	bl	memcpy
.L3629:
	cbz	x24, .L3630
	ldr	x1, [x21, 16]
	mov	x0, x24
	sub	x1, x1, x24
	bl	_ZdlPvm
.L3630:
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	stp	x22, x19, [x21]
	str	x20, [x21, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3626:
	.cfi_restore_state
	cmp	x4, x1
	csel	x4, x4, x1, ls
	lsl	x20, x4, 3
.L3625:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x20, x0, x20
	add	x19, x0, 8
	b	.L3631
	.p2align 2,,3
.L3632:
	mov	x20, 9223372036854775800
	b	.L3625
.L3639:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE13518:
	.size	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE,"axG",@progbits,_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE
	.type	_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE, %function
_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE:
.LFB13404:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13404
	stp	x29, x30, [sp, -240]!
	.cfi_def_cfa_offset 240
	.cfi_offset 29, -240
	.cfi_offset 30, -232
	adrp	x4, .LC12
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -224
	.cfi_offset 20, -216
	mov	x20, x8
	ldr	x19, [x0, 112]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -208
	.cfi_offset 22, -200
	mov	x21, x0
	ldr	x4, [x4, #:lo12:.LC12]
	add	x0, x19, 80
	stp	x23, x24, [sp, 48]
	mov	x22, x3
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -192
	.cfi_offset 24, -184
	.cfi_offset 25, -176
	.cfi_offset 26, -168
	mov	x25, x2
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -160
	.cfi_offset 28, -152
	mov	w27, w1
	str	x4, [sp, 112]
	str	x0, [sp, 208]
	strb	wzr, [sp, 216]
	stp	d8, d9, [sp, 96]
	.cfi_offset 72, -144
	.cfi_offset 73, -136
	cbz	x4, .L3641
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3829
.L3641:
	mov	w0, 1
	add	x23, x19, 16
	ldp	x1, x3, [x19, 48]
	ldr	x2, [x19, 16]
	ldr	x4, [x23, 24]
	strb	w0, [sp, 216]
	ldr	x0, [x19, 72]
	sub	x1, x1, x3
	sub	x0, x0, x4
	asr	x1, x1, 3
	ldr	x4, [x23, 16]
	asr	x0, x0, 3
	sub	x0, x0, #1
	sub	x3, x4, x2
	add	x0, x1, x0, lsl 6
	add	x0, x0, x3, asr 3
	cbz	x0, .L3642
	sub	x4, x4, #8
	ldr	x26, [x2]
	cmp	x2, x4
	beq	.L3643
	add	x2, x2, 8
	str	x2, [x19, 16]
.L3644:
	ldr	x0, [sp, 208]
	cbz	x0, .L3646
	ldr	x1, [sp, 112]
	cbz	x1, .L3646
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L3646:
	ldrh	w23, [x26]
	add	w23, w23, 1
	and	w23, w23, 65535
	strh	w23, [x26]
	cbz	w23, .L3830
.L3648:
	movi	v0.4s, 0
	uxtw	x0, w27
	ldr	x1, [x21, 24]
	mov	x4, x0
	ldr	x2, [x21, 232]
	str	x4, [sp, 128]
	ldr	x24, [x26, 8]
	str	xzr, [sp, 224]
	ldr	x3, [x21, 304]
	str	xzr, [x20, 16]
	madd	x1, x4, x1, x2
	str	q0, [x20]
	mov	x0, x25
	ldr	x4, [x21, 256]
	str	q0, [sp, 208]
	ldr	x2, [x21, 312]
	add	x1, x4, x1
.LEHB233:
	blr	x3
	ldp	x19, x28, [x20]
	fmov	s8, s0
	ldr	x1, [x20, 16]
	cmp	x28, x1
	beq	.L3831
	add	x1, x28, 8
	str	s0, [x28]
	sub	x0, x1, x19
	str	w27, [x28, 4]
	sub	x3, x0, #8
	fmov	s1, s0
	asr	x28, x0, 3
	mov	w6, w27
	sub	x0, x28, #2
	add	x3, x19, x3
	sub	x28, x28, #1
	str	x1, [x20, 8]
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L3654:
	cmp	x28, 0
	ble	.L3663
	.p2align 3,,7
.L3665:
	lsl	x0, x2, 3
	lsl	x28, x28, 3
	add	x1, x19, x0
	add	x3, x19, x28
	ldr	s0, [x19, x0]
	fcmpe	s0, s1
	bmi	.L3761
.L3663:
	ldp	x19, x28, [sp, 208]
	fneg	s9, s8
	ldr	x1, [sp, 224]
	str	s1, [x3]
	str	w6, [x3, 4]
	cmp	x28, x1
	beq	.L3666
.L3835:
	add	x2, x28, 8
	str	s9, [x28]
	sub	x0, x2, x19
	str	w27, [x28, 4]
	sub	x3, x0, #8
	mov	w7, w27
	asr	x28, x0, 3
	add	x3, x19, x3
	sub	x0, x28, #2
	sub	x28, x28, #1
	str	x2, [sp, 216]
	add	x0, x0, x0, lsr 63
	asr	x27, x0, 1
.L3667:
	cmp	x28, 0
	ble	.L3676
	.p2align 3,,7
.L3678:
	lsl	x0, x27, 3
	lsl	x28, x28, 3
	add	x1, x19, x0
	add	x3, x19, x28
	ldr	s0, [x19, x0]
	fcmpe	s0, s9
	bmi	.L3762
.L3676:
	ldr	x0, [sp, 128]
	str	s9, [x3]
	str	w7, [x3, 4]
	strh	w23, [x24, x0, lsl 1]
	cmp	x19, x2
	beq	.L3679
	.p2align 3,,7
.L3693:
	ldr	s0, [x19]
	ldr	w4, [x19, 4]
	fneg	s1, s0
	fcmpe	s1, s8
	bgt	.L3679
	sub	x0, x2, x19
	sub	x7, x2, #8
	cmp	x0, 8
	bgt	.L3832
.L3680:
	ldr	x3, [x21, 24]
	uxtw	x0, w4
	ldr	x2, [x21, 240]
	mov	x19, 1
	ldr	x1, [x21, 256]
	madd	x0, x0, x3, x2
	add	x28, x1, x0
	ldrh	w27, [x1, x0]
	str	x7, [sp, 216]
	cbnz	x27, .L3692
	b	.L3833
	.p2align 2,,3
.L3756:
	mov	x19, x0
.L3692:
	ldr	w0, [x28, x19, lsl 2]
	sbfiz	x2, x0, 1, 32
	ldrh	w1, [x24, x2]
	str	w0, [sp, 180]
	cmp	w1, w23
	beq	.L3694
	ldr	x5, [x21, 24]
	uxtw	x1, w0
	ldr	x4, [x21, 232]
	mov	x0, x25
	ldr	x3, [x21, 304]
	strh	w23, [x24, x2]
	madd	x1, x1, x5, x4
	ldr	x4, [x21, 256]
	ldr	x2, [x21, 312]
	add	x1, x4, x1
	blr	x3
	ldp	x0, x1, [x20]
	str	s0, [sp, 184]
	sub	x0, x1, x0
	cmp	x22, x0, asr 3
	bhi	.L3695
	fcmpe	s0, s8
	bmi	.L3695
.L3694:
	add	x0, x19, 1
	cmp	x27, x19
	bne	.L3756
	ldr	x2, [sp, 216]
.L3724:
	ldr	x19, [sp, 208]
	cmp	x19, x2
	bne	.L3693
.L3679:
	ldr	x19, [x21, 112]
	strb	wzr, [sp, 200]
	ldr	x1, [sp, 112]
	add	x0, x19, 80
	stp	x26, x0, [sp, 184]
	cbz	x1, .L3725
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L3834
.L3725:
	ldp	x0, x1, [x19, 16]
	mov	w2, 1
	strb	w2, [sp, 200]
	cmp	x0, x1
	beq	.L3726
	ldr	x1, [sp, 184]
	str	x1, [x0, -8]!
	str	x0, [x19, 16]
.L3727:
	ldr	x0, [sp, 192]
	cbz	x0, .L3728
	ldr	x1, [sp, 112]
	cbz	x1, .L3728
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L3728:
	ldr	x0, [sp, 208]
	cbz	x0, .L3640
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L3640:
	mov	x0, x20
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 240
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3761:
	.cfi_restore_state
	sub	x0, x2, #1
	ldr	w4, [x1, 4]
	str	s0, [x19, x28]
	mov	x28, x2
	add	x0, x0, x0, lsr 63
	str	w4, [x3, 4]
	asr	x2, x0, 1
	cmp	x28, 0
	bgt	.L3665
	ldp	x19, x28, [sp, 208]
	mov	x3, x1
	ldr	x1, [sp, 224]
	fneg	s9, s8
	str	s1, [x3]
	str	w6, [x3, 4]
	cmp	x28, x1
	bne	.L3835
.L3666:
	sub	x0, x28, x19
	str	x0, [sp, 136]
	mov	x3, 1152921504606846975
	asr	x2, x0, 3
	cmp	x2, x3
	beq	.L3836
	cmp	x2, 0
	csinc	x0, x2, xzr, ne
	adds	x0, x0, x2
	bcs	.L3670
	cbnz	x0, .L3837
	mov	x2, 8
	mov	x6, 0
	mov	x4, 0
.L3672:
	ldr	x0, [sp, 136]
	add	x5, x4, x0
	str	s9, [x4, x0]
	str	w27, [x5, 4]
	cmp	x28, x19
	beq	.L3745
	mov	x0, x4
	mov	x2, x19
.L3674:
	ldr	x3, [x2], 8
	str	x3, [x0], 8
	cmp	x0, x5
	bne	.L3674
	add	x2, x5, 8
	sub	x28, x2, x4
	sub	x3, x28, #8
	asr	x28, x28, 3
	add	x3, x4, x3
	sub	x0, x28, #2
	sub	x28, x28, #1
	add	x0, x0, x0, lsr 63
	asr	x27, x0, 1
.L3673:
	cbz	x19, .L3675
	sub	x1, x1, x19
	mov	x0, x19
	str	x4, [sp, 120]
	stp	x5, x2, [sp, 136]
	stp	x6, x3, [sp, 152]
	bl	_ZdlPvm
	ldp	x5, x2, [sp, 136]
	ldp	x6, x3, [sp, 152]
	ldr	x4, [sp, 120]
.L3675:
	mov	x19, x4
	ldr	w7, [x5, 4]
	stp	x4, x2, [sp, 208]
	ldr	s9, [x5]
	str	x6, [sp, 224]
	b	.L3667
	.p2align 2,,3
.L3762:
	sub	x0, x27, #1
	ldr	w4, [x1, 4]
	str	s0, [x19, x28]
	mov	x28, x27
	add	x0, x0, x0, lsr 63
	str	w4, [x3, 4]
	asr	x27, x0, 1
	cmp	x28, 0
	bgt	.L3678
	mov	x3, x1
	b	.L3676
	.p2align 2,,3
.L3695:
	ldp	x2, x0, [sp, 216]
	fneg	s1, s0
	str	s1, [sp, 192]
	cmp	x2, x0
	beq	.L3698
	ldr	w8, [sp, 180]
	add	x0, x2, 8
	str	s1, [x2]
	str	w8, [x2, 4]
	str	x0, [sp, 216]
.L3699:
	ldr	x4, [sp, 208]
	sub	x3, x0, x4
	asr	x0, x3, 3
	sub	x2, x0, #2
	sub	x0, x0, #1
	add	x2, x2, x2, lsr 63
	asr	x2, x2, 1
	cmp	x0, 0
	ble	.L3700
	.p2align 3,,7
.L3703:
	lsl	x3, x2, 3
	lsl	x0, x0, 3
	add	x6, x4, x3
	add	x5, x4, x0
	ldr	s0, [x4, x3]
	fcmpe	s0, s1
	bmi	.L3765
.L3701:
	ldr	x0, [x20, 16]
	str	s1, [x5]
	str	w8, [x5, 4]
	cmp	x0, x1
	beq	.L3704
.L3839:
	ldr	s1, [sp, 184]
	add	x5, x1, 8
	ldr	w10, [sp, 180]
	str	w10, [x1, 4]
	str	s1, [x1]
	str	x5, [x20, 8]
.L3705:
	ldr	x0, [x20]
	sub	x6, x5, x0
	asr	x9, x6, 3
	sub	x1, x9, #2
	sub	x2, x9, #1
	add	x1, x1, x1, lsr 63
	asr	x1, x1, 1
	cmp	x2, 0
	ble	.L3706
	.p2align 3,,7
.L3709:
	lsl	x3, x1, 3
	lsl	x2, x2, 3
	add	x7, x0, x3
	add	x4, x0, x2
	ldr	s0, [x0, x3]
	fcmpe	s0, s1
	bmi	.L3766
.L3707:
	str	s1, [x4]
	str	w10, [x4, 4]
	cmp	x22, x9
	bcc	.L3723
	b	.L3710
	.p2align 2,,3
.L3711:
	str	x5, [x20, 8]
	cmp	x22, x7
	bcs	.L3710
.L3723:
	sub	x5, x5, #8
	mov	x1, x6
	sub	x6, x5, x0
	asr	x7, x6, 3
	cmp	x1, 8
	ble	.L3711
	sub	x1, x7, #1
	ldr	s0, [x0]
	ldr	w2, [x0, 4]
	and	x12, x7, 1
	add	x11, x1, x1, lsr 63
	ldr	w8, [x5, 4]
	str	w2, [x5, 4]
	ldr	s3, [x5]
	asr	x11, x11, 1
	str	s0, [x5]
	cmp	x6, 16
	ble	.L3712
	mov	x2, 0
	b	.L3716
	.p2align 2,,3
.L3838:
	mov	x2, x1
.L3716:
	add	x3, x2, 1
	lsl	x1, x3, 1
	lsl	x3, x3, 4
	sub	x10, x1, #1
	add	x9, x0, x3
	lsl	x4, x10, 3
	ldr	s1, [x0, x3]
	add	x3, x0, x4
	ldr	s2, [x0, x4]
	fcmpe	s2, s1
	bgt	.L3767
.L3713:
	lsl	x2, x2, 3
	ldr	w4, [x9, 4]
	add	x3, x0, x2
	str	s1, [x0, x2]
	str	w4, [x3, 4]
	cmp	x11, x1
	bgt	.L3838
	lsl	x4, x1, 3
	cbnz	x12, .L3719
	sub	x2, x7, #2
	add	x2, x2, x2, lsr 63
	cmp	x1, x2, asr 1
	beq	.L3718
	sub	x2, x1, #1
	lsl	x4, x1, 3
	asr	x2, x2, 1
	.p2align 3,,7
.L3722:
	lsl	x1, x2, 3
	add	x9, x0, x4
	add	x10, x0, x1
	ldr	s1, [x0, x1]
	fcmpe	s3, s1
	bgt	.L3768
.L3717:
	str	w8, [x9, 4]
	str	s3, [x9]
.L3841:
	str	x5, [x20, 8]
	cmp	x22, x7
	bcc	.L3723
.L3710:
	cmp	x0, x5
	beq	.L3694
	ldr	s8, [x0]
	b	.L3694
	.p2align 2,,3
.L3765:
	sub	x3, x2, #1
	ldr	w7, [x6, 4]
	str	s0, [x4, x0]
	mov	x0, x2
	add	x3, x3, x3, lsr 63
	str	w7, [x5, 4]
	asr	x2, x3, 1
	cmp	x0, 0
	bgt	.L3703
	mov	x5, x6
	ldr	x0, [x20, 16]
	str	s1, [x5]
	str	w8, [x5, 4]
	cmp	x0, x1
	bne	.L3839
.L3704:
	add	x3, sp, 180
	add	x2, sp, 184
	mov	x0, x20
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	ldr	x5, [x20, 8]
	ldr	w10, [x5, -4]
	ldr	s1, [x5, -8]
	b	.L3705
	.p2align 2,,3
.L3766:
	sub	x3, x1, #1
	ldr	w8, [x7, 4]
	str	s0, [x0, x2]
	mov	x2, x1
	add	x3, x3, x3, lsr 63
	str	w8, [x4, 4]
	asr	x1, x3, 1
	cmp	x2, 0
	bgt	.L3709
	mov	x4, x7
	b	.L3707
	.p2align 2,,3
.L3768:
	sub	x3, x2, #1
	str	s1, [x0, x4]
	ldr	w4, [x10, 4]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w4, [x9, 4]
	asr	x2, x3, 1
	cbz	x1, .L3840
	lsl	x4, x1, 3
	b	.L3722
	.p2align 2,,3
.L3767:
	fmov	s1, s2
	mov	x9, x3
	mov	x1, x10
	b	.L3713
	.p2align 2,,3
.L3712:
	mov	x9, x0
	cbnz	x12, .L3717
	cmp	x1, 2
	bhi	.L3717
	mov	x1, 0
	.p2align 3,,7
.L3718:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x4, x1, 3
	add	x2, x0, x4
	ldr	s0, [x0, x4]
	ldr	w2, [x2, 4]
	str	w2, [x9, 4]
	str	s0, [x9]
.L3719:
	sub	x1, x1, #1
	asr	x2, x1, 1
	b	.L3722
	.p2align 2,,3
.L3840:
	mov	x9, x10
	str	s3, [x9]
	str	w8, [x9, 4]
	b	.L3841
.L3698:
	mov	x1, x2
	add	x3, sp, 180
	add	x2, sp, 192
	add	x0, sp, 208
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE233:
	ldr	x0, [sp, 216]
	ldr	x1, [x20, 8]
	ldr	w8, [x0, -4]
	ldr	s1, [x0, -8]
	b	.L3699
.L3832:
	sub	x1, x7, x19
	ldr	w8, [x2, -4]
	str	w4, [x2, -4]
	asr	x10, x1, 3
	ldr	s2, [x2, -8]
	sub	x0, x10, #1
	str	s0, [x2, -8]
	and	x11, x10, 1
	add	x9, x0, x0, lsr 63
	asr	x9, x9, 1
	cmp	x1, 16
	ble	.L3681
	mov	x2, 0
	b	.L3685
	.p2align 2,,3
.L3842:
	mov	x2, x0
.L3685:
	add	x1, x2, 1
	lsl	x0, x1, 1
	lsl	x1, x1, 4
	sub	x6, x0, #1
	add	x5, x19, x1
	lsl	x3, x6, 3
	ldr	s0, [x19, x1]
	add	x1, x19, x3
	ldr	s1, [x19, x3]
	fcmpe	s1, s0
	bgt	.L3763
.L3682:
	lsl	x1, x2, 3
	ldr	w3, [x5, 4]
	add	x2, x19, x1
	str	s0, [x19, x1]
	str	w3, [x2, 4]
	cmp	x9, x0
	bgt	.L3842
	lsl	x3, x0, 3
	cbnz	x11, .L3688
	sub	x10, x10, #2
	add	x10, x10, x10, lsr 63
	cmp	x0, x10, asr 1
	beq	.L3687
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L3691:
	lsl	x0, x1, 3
	add	x5, x19, x3
	add	x6, x19, x0
	ldr	s0, [x19, x0]
	fcmpe	s0, s2
	bmi	.L3764
.L3686:
	str	s2, [x5]
	str	w8, [x5, 4]
	b	.L3680
	.p2align 2,,3
.L3764:
	sub	x2, x1, #1
	str	s0, [x19, x3]
	ldr	w3, [x6, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x5, 4]
	asr	x1, x2, 1
	cbz	x0, .L3843
	lsl	x3, x0, 3
	b	.L3691
	.p2align 2,,3
.L3763:
	fmov	s0, s1
	mov	x5, x1
	mov	x0, x6
	b	.L3682
.L3681:
	mov	x5, x19
	cbnz	x11, .L3686
	cmp	x0, 2
	bhi	.L3686
	mov	x0, 0
.L3687:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x19, x3
	ldr	s0, [x19, x3]
	ldr	w1, [x1, 4]
	str	w1, [x5, 4]
	str	s0, [x5]
.L3688:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L3691
.L3843:
	mov	x5, x6
	str	s2, [x5]
	str	w8, [x5, 4]
	b	.L3680
.L3833:
	mov	x2, x7
	b	.L3724
.L3700:
	sub	x0, x3, #8
	add	x5, x4, x0
	b	.L3701
.L3706:
	sub	x4, x6, #8
	add	x4, x0, x4
	b	.L3707
.L3642:
	mov	x0, 24
.LEHB234:
	bl	_Znwm
.LEHE234:
	mov	x26, x0
	ldr	w1, [x19, 128]
	mov	w2, -1
	strh	w2, [x26]
	ubfiz	x0, x1, 1, 32
	str	w1, [x26, 16]
.LEHB235:
	bl	_Znam
.LEHE235:
	str	x0, [x26, 8]
.L3645:
	ldrb	w0, [sp, 216]
	cbnz	w0, .L3644
	ldrh	w23, [x26]
	add	w23, w23, 1
	and	w23, w23, 65535
	strh	w23, [x26]
	cbnz	w23, .L3648
.L3830:
	ldr	x0, [x26, 8]
	mov	w1, 0
	ldr	w2, [x26, 16]
	lsl	x2, x2, 1
	bl	memset
	ldrh	w23, [x26]
	add	w23, w23, 1
	and	w23, w23, 65535
	strh	w23, [x26]
	b	.L3648
.L3831:
	sub	x0, x28, x19
	str	x0, [sp, 136]
	mov	x2, 1152921504606846975
	asr	x0, x0, 3
	cmp	x0, x2
	beq	.L3844
	cmp	x0, 0
	csinc	x3, x0, xzr, ne
	adds	x0, x0, x3
	bcs	.L3657
	cbnz	x0, .L3845
	mov	x8, 8
	mov	x7, 0
	mov	x4, 0
.L3659:
	ldr	x0, [sp, 136]
	add	x5, x4, x0
	str	s8, [x4, x0]
	str	w27, [x5, 4]
	cmp	x28, x19
	beq	.L3741
	mov	x0, x4
	mov	x2, x19
.L3661:
	ldr	x3, [x2], 8
	str	x3, [x0], 8
	cmp	x0, x5
	bne	.L3661
	add	x8, x5, 8
	sub	x28, x8, x4
	sub	x3, x28, #8
	asr	x28, x28, 3
	add	x3, x4, x3
	sub	x0, x28, #2
	sub	x28, x28, #1
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L3660:
	cbz	x19, .L3662
	sub	x1, x1, x19
	mov	x0, x19
	str	x4, [sp, 120]
	stp	x5, x2, [sp, 136]
	stp	x7, x8, [sp, 152]
	str	x3, [sp, 168]
	bl	_ZdlPvm
	ldp	x5, x2, [sp, 136]
	ldp	x7, x8, [sp, 152]
	ldr	x4, [sp, 120]
	ldr	x3, [sp, 168]
.L3662:
	mov	x19, x4
	ldr	w6, [x5, 4]
	stp	x4, x8, [x20]
	ldr	s1, [x5]
	str	x7, [x20, 16]
	b	.L3654
.L3726:
	mov	x0, x19
	add	x1, sp, 184
.LEHB236:
	bl	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_
.LEHE236:
	ldrb	w0, [sp, 200]
	cbz	w0, .L3728
	b	.L3727
	.p2align 2,,3
.L3643:
	ldr	x0, [x19, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x19, 40]
	add	x1, x0, 8
	ldr	x0, [x0, 8]
	str	x0, [x23, 8]
	str	x1, [x23, 24]
	add	x1, x0, 512
	str	x1, [x23, 16]
	str	x0, [x19, 16]
	b	.L3645
.L3837:
	cmp	x0, x3
	csel	x0, x0, x3, ls
	lsl	x0, x0, 3
	str	x0, [sp, 120]
.L3671:
.LEHB237:
	bl	_Znwm
	mov	x4, x0
	add	x2, x0, 8
	ldr	x0, [sp, 120]
	ldr	x1, [sp, 224]
	add	x6, x4, x0
	b	.L3672
.L3845:
	cmp	x0, x2
	csel	x0, x0, x2, ls
	lsl	x0, x0, 3
	str	x0, [sp, 120]
.L3658:
	bl	_Znwm
	mov	x4, x0
	add	x8, x0, 8
	ldr	x0, [sp, 120]
	ldr	x1, [x20, 16]
	add	x7, x4, x0
	b	.L3659
.L3745:
	mov	x3, x4
	mov	x5, x4
	mov	x27, 0
	mov	x28, 0
	b	.L3673
.L3670:
	mov	x0, 9223372036854775800
	str	x0, [sp, 120]
	b	.L3671
.L3836:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.p2align 2,,3
.L3741:
	mov	x3, x4
	mov	x5, x4
	mov	x2, 0
	mov	x28, 0
	b	.L3660
.L3834:
	bl	_ZSt20__throw_system_errori
.LEHE237:
.L3829:
.LEHB238:
	bl	_ZSt20__throw_system_errori
.LEHE238:
.L3657:
	mov	x0, 9223372036854775800
	str	x0, [sp, 120]
	b	.L3658
.L3844:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB239:
	bl	_ZSt20__throw_length_errorPKc
.LEHE239:
.L3760:
	ldrb	w1, [sp, 200]
	mov	x19, x0
	cbz	w1, .L3733
	add	x0, sp, 192
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L3733:
	ldr	x0, [sp, 208]
	ldr	x1, [sp, 224]
	sub	x1, x1, x0
	cbz	x0, .L3734
	bl	_ZdlPvm
.L3734:
	ldr	x0, [x20]
	ldr	x1, [x20, 16]
	sub	x1, x1, x0
	cbz	x0, .L3735
	bl	_ZdlPvm
.L3735:
	mov	x0, x19
.LEHB240:
	bl	_Unwind_Resume
.LEHE240:
.L3757:
	mov	x19, x0
	b	.L3733
.L3758:
	mov	x19, x0
	b	.L3651
.L3759:
	mov	x19, x0
	mov	x1, 24
	mov	x0, x26
	bl	_ZdlPvm
.L3651:
	ldrb	w0, [sp, 216]
	cbz	w0, .L3735
	add	x0, sp, 208
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L3735
	.cfi_endproc
.LFE13404:
	.section	.gcc_except_table
.LLSDA13404:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13404-.LLSDACSB13404
.LLSDACSB13404:
	.uleb128 .LEHB233-.LFB13404
	.uleb128 .LEHE233-.LEHB233
	.uleb128 .L3757-.LFB13404
	.uleb128 0
	.uleb128 .LEHB234-.LFB13404
	.uleb128 .LEHE234-.LEHB234
	.uleb128 .L3758-.LFB13404
	.uleb128 0
	.uleb128 .LEHB235-.LFB13404
	.uleb128 .LEHE235-.LEHB235
	.uleb128 .L3759-.LFB13404
	.uleb128 0
	.uleb128 .LEHB236-.LFB13404
	.uleb128 .LEHE236-.LEHB236
	.uleb128 .L3760-.LFB13404
	.uleb128 0
	.uleb128 .LEHB237-.LFB13404
	.uleb128 .LEHE237-.LEHB237
	.uleb128 .L3757-.LFB13404
	.uleb128 0
	.uleb128 .LEHB238-.LFB13404
	.uleb128 .LEHE238-.LEHB238
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB239-.LFB13404
	.uleb128 .LEHE239-.LEHB239
	.uleb128 .L3757-.LFB13404
	.uleb128 0
	.uleb128 .LEHB240-.LFB13404
	.uleb128 .LEHE240-.LEHB240
	.uleb128 0
	.uleb128 0
.LLSDACSE13404:
	.section	.text._ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE,"axG",@progbits,_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE,comdat
	.size	_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE, .-_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE
	.section	.text._ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,"axG",@progbits,_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.type	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, %function
_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_:
.LFB13526:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	ldp	x23, x24, [x0]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	sub	x1, x24, x23
	str	x27, [sp, 80]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	.cfi_offset 27, -16
	mov	x27, x2
	asr	x1, x1, 4
	mov	x2, 576460752303423487
	cmp	x1, x2
	beq	.L3864
	cmp	x1, 0
	mov	x21, x0
	csinc	x0, x1, xzr, ne
	sub	x26, x19, x23
	adds	x1, x1, x0
	bcs	.L3857
	cbnz	x1, .L3851
	mov	x25, 16
	mov	x20, 0
	mov	x22, 0
.L3856:
	add	x2, x22, x26
	ldp	x0, x1, [x27]
	stp	x0, x1, [x2]
	cmp	x19, x23
	beq	.L3852
	mov	x4, x22
	mov	x3, x23
	.p2align 3,,7
.L3853:
	ldp	x6, x7, [x3], 16
	stp	x6, x7, [x4], 16
	cmp	x3, x19
	bne	.L3853
	add	x26, x26, 16
	add	x25, x22, x26
.L3852:
	cmp	x19, x24
	beq	.L3854
	sub	x2, x24, x19
	mov	x0, x25
	mov	x1, x19
	add	x25, x25, x2
	bl	memcpy
.L3854:
	cbz	x23, .L3855
	ldr	x1, [x21, 16]
	mov	x0, x23
	sub	x1, x1, x23
	bl	_ZdlPvm
.L3855:
	ldp	x23, x24, [sp, 48]
	ldr	x27, [sp, 80]
	stp	x22, x25, [x21]
	str	x20, [x21, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L3851:
	.cfi_restore_state
	cmp	x1, x2
	csel	x1, x1, x2, ls
	lsl	x20, x1, 4
.L3850:
	mov	x0, x20
	bl	_Znwm
	mov	x22, x0
	add	x20, x0, x20
	add	x25, x0, 16
	b	.L3856
	.p2align 2,,3
.L3857:
	mov	x20, 9223372036854775792
	b	.L3850
.L3864:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.cfi_endproc
.LFE13526:
	.size	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_, .-_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	.section	.text._ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE,"axG",@progbits,_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE,comdat
	.align	2
	.p2align 4,,11
	.weak	_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE
	.type	_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE, %function
_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE:
.LFB13343:
	.cfi_startproc
	.cfi_personality 0x9b,DW.ref.__gxx_personality_v0
	.cfi_lsda 0x1b,.LLSDA13343
	stp	x29, x30, [sp, -288]!
	.cfi_def_cfa_offset 288
	.cfi_offset 29, -288
	.cfi_offset 30, -280
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -272
	.cfi_offset 20, -264
	mov	x19, x0
	stp	xzr, xzr, [x8]
	str	xzr, [x8, 16]
	stp	x8, x2, [sp, 120]
	add	x0, x0, 16
	ldar	x0, [x0]
	cbz	x0, .L3865
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -216
	.cfi_offset 25, -224
	mov	x0, x1
	ldr	w25, [x19, 216]
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -232
	.cfi_offset 23, -240
	mov	x23, x1
	uxtw	x20, w25
	ldr	x1, [x19, 24]
	stp	x27, x28, [sp, 80]
	.cfi_offset 28, -200
	.cfi_offset 27, -208
	mov	x28, x3
	ldr	x4, [x19, 232]
	stp	x21, x22, [sp, 32]
	.cfi_offset 22, -248
	.cfi_offset 21, -256
	ldp	x3, x2, [x19, 304]
	madd	x1, x20, x1, x4
	ldr	x4, [x19, 256]
	stp	d8, d9, [sp, 96]
	.cfi_offset 73, -184
	.cfi_offset 72, -192
	add	x1, x4, x1
.LEHB241:
	blr	x3
	ldr	w0, [x19, 104]
	fmov	s8, s0
	cmp	w0, 0
	ble	.L3868
	sxtw	x27, w0
	sub	w0, w0, #1
	sub	x1, x27, #2
	add	x26, x19, 448
	sub	x0, x1, x0
	sub	x27, x27, #1
	str	x0, [sp, 136]
	add	x0, x19, 440
	str	x0, [sp, 112]
	.p2align 3,,7
.L3871:
	ldr	x0, [x19, 32]
	ldr	x1, [x19, 264]
	mul	x0, x27, x0
	ldr	x1, [x1, x20, lsl 3]
	add	x20, x1, x0
	ldrh	w22, [x1, x0]
.L4229:
	ldaxr	x0, [x26]
	add	x0, x0, 1
	stlxr	w1, x0, [x26]
	cbnz	w1, .L4229
	ldr	x1, [sp, 112]
	and	x0, x22, 65535
.L4230:
	ldaxr	x2, [x1]
	add	x2, x2, x0
	stlxr	w3, x2, [x1]
	cbnz	w3, .L4230
	cbz	w22, .L3869
	sub	w22, w22, #1
	add	x0, x20, 8
	add	x20, x20, 4
	mov	w24, 0
	add	x22, x0, x22, uxtw 2
	.p2align 3,,7
.L3876:
	ldr	w21, [x20]
	ldr	x0, [x19, 8]
	uxtw	x1, w21
	cmp	x1, x0
	bhi	.L4199
	ldr	x5, [x19, 24]
	mov	x0, x23
	ldr	x4, [x19, 232]
	ldp	x3, x2, [x19, 304]
	madd	x1, x1, x5, x4
	ldr	x4, [x19, 256]
	add	x1, x4, x1
	blr	x3
.LEHE241:
	fcmpe	s0, s8
	bmi	.L4089
.L3873:
	add	x20, x20, 4
	cmp	x20, x22
	bne	.L3876
	uxtw	x20, w25
	cbnz	w24, .L3871
	.p2align 3,,7
.L3869:
	ldr	x0, [sp, 136]
	sub	x27, x27, #1
	cmp	x0, x27
	beq	.L3868
	uxtw	x20, w25
	b	.L3871
.L3868:
	add	x0, x19, 40
	ldar	x0, [x0]
	orr	x0, x28, x0
	cbz	x0, .L4200
	adrp	x0, .LC12
	strb	wzr, [sp, 264]
	ldr	x20, [x19, 112]
	ldr	x1, [x0, #:lo12:.LC12]
	add	x0, x20, 80
	ldr	x21, [x19, 80]
	str	x1, [sp, 144]
	ldr	x2, [sp, 128]
	str	x0, [sp, 256]
	cmp	x21, x2
	csel	x21, x21, x2, cs
	cbz	x1, .L3881
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L4201
.L3881:
	mov	w0, 1
	add	x22, x20, 16
	ldp	x2, x4, [x20, 48]
	ldr	x1, [x20, 16]
	ldr	x3, [x22, 24]
	strb	w0, [sp, 264]
	ldr	x0, [x20, 72]
	sub	x2, x2, x4
	sub	x0, x0, x3
	asr	x2, x2, 3
	ldr	x3, [x22, 16]
	asr	x0, x0, 3
	sub	x0, x0, #1
	sub	x4, x3, x1
	add	x0, x2, x0, lsl 6
	add	x0, x0, x4, asr 3
	cbz	x0, .L3883
	sub	x3, x3, #8
	ldr	x27, [x1]
	cmp	x1, x3
	beq	.L3884
	add	x1, x1, 8
	str	x1, [x20, 16]
.L3885:
	ldr	x0, [sp, 256]
	cbz	x0, .L3887
	ldr	x1, [sp, 144]
	cbz	x1, .L3887
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L3887:
	ldrh	w24, [x27]
	add	w24, w24, 1
	and	w24, w24, 65535
	strh	w24, [x27]
	cbz	w24, .L4202
.L3889:
	ldr	x2, [x19, 24]
	uxtw	x20, w25
	ldr	x3, [x19, 256]
	mul	x2, x20, x2
	ldr	x0, [x19, 240]
	add	x1, x3, x2
	movi	v0.4s, 0
	add	x0, x1, x0
	ldr	x26, [x27, 8]
	str	xzr, [sp, 240]
	str	xzr, [sp, 272]
	str	q0, [sp, 224]
	str	q0, [sp, 256]
	ldrb	w0, [x0, 2]
	tbnz	x0, 0, .L4203
	cbz	x28, .L3896
	ldr	x4, [x28]
	adrp	x0, _ZN7hnswlib17BaseFilterFunctorclEm
	add	x0, x0, :lo12:_ZN7hnswlib17BaseFilterFunctorclEm
	ldr	x4, [x4]
	cmp	x4, x0
	bne	.L4204
.L3896:
	ldr	x1, [x19, 232]
	mov	x0, x23
	ldr	x4, [x19, 304]
	add	x1, x2, x1
	ldr	x2, [x19, 312]
	add	x1, x3, x1
.LEHB242:
	blr	x4
	ldp	x22, x0, [sp, 224]
	str	x0, [sp, 112]
	ldr	x1, [sp, 240]
	fmov	s8, s0
	cmp	x0, x1
	beq	.L4205
	add	x2, x0, 8
	str	s0, [x0]
	sub	x1, x2, x22
	str	w25, [x0, 4]
	sub	x6, x1, #8
	fmov	s1, s0
	asr	x1, x1, 3
	mov	w9, w25
	sub	x0, x1, #2
	add	x6, x22, x6
	sub	x5, x1, #1
	str	x2, [sp, 232]
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L3914:
	cmp	x5, 0
	ble	.L3923
.L3925:
	lsl	x0, x2, 3
	lsl	x1, x5, 3
	add	x3, x22, x0
	add	x6, x22, x1
	ldr	s0, [x22, x0]
	fcmpe	s0, s1
	bmi	.L4091
.L3923:
	ldp	x22, x0, [sp, 256]
	str	x0, [sp, 136]
	ldr	x1, [sp, 272]
	str	s1, [x6]
	str	w9, [x6, 4]
	fneg	s9, s8
	cmp	x0, x1
	beq	.L3926
	add	x2, x0, 8
	str	s9, [x0]
	sub	x1, x2, x22
	str	w25, [x0, 4]
	sub	x6, x1, #8
	mov	w8, w25
	asr	x1, x1, 3
	add	x6, x22, x6
	sub	x0, x1, #2
	sub	x25, x1, #1
	str	x2, [sp, 264]
	add	x0, x0, x0, lsr 63
	asr	x3, x0, 1
.L3927:
	cmp	x25, 0
	ble	.L3936
.L3938:
	lsl	x0, x3, 3
	lsl	x1, x25, 3
	add	x6, x22, x0
	add	x4, x22, x1
	ldr	s0, [x22, x0]
	fcmpe	s0, s9
	bmi	.L4092
	mov	x6, x4
.L3936:
	str	w8, [x6, 4]
	str	s9, [x6]
.L3912:
	strh	w24, [x26, x20, lsl 1]
	cmp	x2, x22
	beq	.L3939
	.p2align 3,,7
.L3955:
	ldr	s0, [x22]
	ldr	w4, [x22, 4]
	fneg	s1, s0
	fcmpe	s8, s1
	bmi	.L4093
	sub	x0, x2, x22
	sub	x6, x2, #8
	cmp	x0, 8
	bgt	.L4206
.L3942:
	ldr	x3, [x19, 24]
	uxtw	x0, w4
	ldr	x2, [x19, 240]
	mov	x20, 1
	ldr	x1, [x19, 256]
	madd	x0, x0, x3, x2
	add	x25, x1, x0
	ldrh	w22, [x1, x0]
	str	x6, [sp, 264]
	cbnz	x22, .L3954
	b	.L4207
	.p2align 2,,3
.L4209:
	fcmpe	s0, s8
	bmi	.L3957
.L3956:
	add	x0, x20, 1
	cmp	x20, x22
	beq	.L4208
.L4073:
	mov	x20, x0
.L3954:
	ldr	w0, [x25, x20, lsl 2]
	sbfiz	x2, x0, 1, 32
	ldrh	w1, [x26, x2]
	str	w0, [sp, 196]
	cmp	w1, w24
	beq	.L3956
	ldr	x5, [x19, 24]
	uxtw	x1, w0
	ldr	x4, [x19, 232]
	mov	x0, x23
	ldr	x3, [x19, 304]
	strh	w24, [x26, x2]
	madd	x1, x1, x5, x4
	ldr	x4, [x19, 256]
	ldr	x2, [x19, 312]
	add	x1, x4, x1
	blr	x3
.LEHE242:
	ldp	x1, x0, [sp, 224]
	str	s0, [sp, 200]
	sub	x0, x0, x1
	cmp	x21, x0, asr 3
	bls	.L4209
.L3957:
	ldp	x1, x0, [sp, 264]
	fneg	s1, s0
	str	s1, [sp, 208]
	cmp	x1, x0
	beq	.L3960
	ldr	w7, [sp, 196]
	add	x0, x1, 8
	str	s1, [x1]
	mov	w8, w7
	str	w7, [x1, 4]
	str	x0, [sp, 264]
.L3961:
	ldr	x3, [sp, 256]
	sub	x2, x0, x3
	asr	x0, x2, 3
	sub	x1, x0, #2
	sub	x0, x0, #1
	add	x1, x1, x1, lsr 63
	asr	x1, x1, 1
	cmp	x0, 0
	ble	.L3962
	.p2align 3,,7
.L3965:
	lsl	x2, x1, 3
	lsl	x0, x0, 3
	add	x5, x3, x2
	add	x4, x3, x0
	ldr	s0, [x3, x2]
	fcmpe	s0, s1
	bmi	.L4096
.L3963:
	ldr	x2, [x19, 24]
	uxtw	x7, w7
	ldr	x1, [x19, 256]
	ldr	x0, [x19, 240]
	str	w8, [x4, 4]
	madd	x7, x7, x2, x1
	str	s1, [x4]
	add	x0, x7, x0
	ldrb	w0, [x0, 2]
	tbnz	x0, 0, .L4195
	cbz	x28, .L3968
	ldr	x1, [x28]
	adrp	x0, _ZN7hnswlib17BaseFilterFunctorclEm
	add	x0, x0, :lo12:_ZN7hnswlib17BaseFilterFunctorclEm
	ldr	x2, [x1]
	cmp	x2, x0
	bne	.L4210
.L3968:
	ldp	x1, x0, [sp, 232]
	cmp	x1, x0
	beq	.L3969
	ldr	s1, [sp, 200]
	add	x5, x1, 8
	ldr	w10, [sp, 196]
	str	w10, [x1, 4]
	str	s1, [x1]
	str	x5, [sp, 232]
.L3970:
	ldr	x0, [sp, 224]
	sub	x6, x5, x0
	asr	x9, x6, 3
	sub	x1, x9, #2
	sub	x2, x9, #1
	add	x1, x1, x1, lsr 63
	asr	x1, x1, 1
	cmp	x2, 0
	ble	.L3971
	.p2align 3,,7
.L3974:
	lsl	x3, x1, 3
	lsl	x2, x2, 3
	add	x7, x0, x3
	add	x4, x0, x2
	ldr	s0, [x0, x3]
	fcmpe	s0, s1
	bmi	.L4097
.L3972:
	str	w10, [x4, 4]
	str	s1, [x4]
.L3967:
	cmp	x9, x21
	bhi	.L3988
	b	.L3975
	.p2align 2,,3
.L3976:
	str	x5, [sp, 232]
	cmp	x7, x21
	bls	.L3975
.L3988:
	sub	x5, x5, #8
	mov	x1, x6
	sub	x6, x5, x0
	asr	x7, x6, 3
	cmp	x1, 8
	ble	.L3976
	sub	x1, x7, #1
	ldr	s0, [x0]
	ldr	w2, [x0, 4]
	and	x12, x7, 1
	add	x11, x1, x1, lsr 63
	ldr	w8, [x5, 4]
	str	w2, [x5, 4]
	ldr	s2, [x5]
	asr	x11, x11, 1
	str	s0, [x5]
	cmp	x6, 16
	ble	.L3977
	mov	x2, 0
	b	.L3981
	.p2align 2,,3
.L4211:
	mov	x2, x1
.L3981:
	add	x3, x2, 1
	lsl	x1, x3, 1
	lsl	x3, x3, 4
	sub	x10, x1, #1
	add	x9, x0, x3
	lsl	x4, x10, 3
	ldr	s0, [x0, x3]
	add	x3, x0, x4
	ldr	s1, [x0, x4]
	fcmpe	s1, s0
	bgt	.L4098
.L3978:
	lsl	x2, x2, 3
	ldr	w4, [x9, 4]
	add	x3, x0, x2
	str	s0, [x0, x2]
	str	w4, [x3, 4]
	cmp	x11, x1
	bgt	.L4211
	lsl	x4, x1, 3
	cbnz	x12, .L3984
	sub	x2, x7, #2
	add	x2, x2, x2, lsr 63
	cmp	x1, x2, asr 1
	beq	.L3983
	sub	x2, x1, #1
	lsl	x4, x1, 3
	asr	x2, x2, 1
	.p2align 3,,7
.L3987:
	lsl	x1, x2, 3
	add	x9, x0, x4
	add	x10, x0, x1
	ldr	s0, [x0, x1]
	fcmpe	s2, s0
	bgt	.L4099
.L3982:
	str	w8, [x9, 4]
	str	s2, [x9]
.L4218:
	str	x5, [sp, 232]
	cmp	x7, x21
	bhi	.L3988
.L3975:
	cmp	x0, x5
	beq	.L3956
	ldr	s8, [x0]
	add	x0, x20, 1
	cmp	x20, x22
	bne	.L4073
.L4208:
	ldr	x2, [sp, 264]
.L3989:
	ldr	x22, [sp, 256]
	cmp	x22, x2
	bne	.L3955
.L3939:
	ldr	x20, [x19, 112]
	strb	wzr, [sp, 216]
	ldr	x1, [sp, 144]
	add	x0, x20, 80
	stp	x27, x0, [sp, 200]
	cbz	x1, .L3990
	bl	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t
	cbnz	w0, .L4212
.L3990:
	ldp	x0, x1, [x20, 16]
	mov	w2, 1
	strb	w2, [sp, 216]
	cmp	x0, x1
	beq	.L3991
	ldr	x1, [sp, 200]
	str	x1, [x0, -8]!
	str	x0, [x20, 16]
.L3992:
	ldr	x0, [sp, 208]
	cbz	x0, .L3993
	ldr	x1, [sp, 144]
	cbz	x1, .L3993
	bl	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t
.L3993:
	ldr	x0, [sp, 256]
	cbz	x0, .L3995
	ldr	x1, [sp, 272]
	sub	x1, x1, x0
	bl	_ZdlPvm
.L3995:
	ldp	x20, x21, [sp, 224]
	ldr	x22, [sp, 240]
	b	.L3882
.L4017:
	cmp	x21, x20
	beq	.L4213
.L4002:
	ldp	x3, x1, [x19, 248]
	ldr	w0, [x20, 4]
	ldr	x2, [x19, 24]
	ldr	x4, [sp, 120]
	madd	x0, x0, x2, x1
	ldr	s0, [x20]
	ldp	x1, x2, [x4, 8]
	ldr	x0, [x0, x3]
	str	s0, [sp, 256]
	str	x0, [sp, 264]
	cmp	x1, x2
	beq	.L4018
	ldp	x2, x3, [sp, 256]
	stp	x2, x3, [x1], 16
	mov	x0, x4
	str	x1, [x4, 8]
.L4019:
	ldr	x2, [x0]
	ldr	s1, [x1, -16]
	sub	x3, x1, x2
	ldr	x8, [x1, -8]
	asr	x1, x3, 4
	sub	x0, x1, #2
	sub	x3, x3, #16
	sub	x1, x1, #1
	add	x3, x2, x3
	add	x0, x0, x0, lsr 63
	asr	x0, x0, 1
	cmp	x1, 0
	ble	.L4024
.L4023:
	lsl	x4, x0, 4
	add	x3, x2, x4
	ldr	s0, [x2, x4]
	fcmpe	s0, s1
	bmi	.L4025
	bgt	.L4196
	ldr	x6, [x3, 8]
	cmp	x6, x8
	bcc	.L4028
.L4196:
	add	x3, x2, x1, lsl 4
.L4024:
	str	x8, [x3, 8]
	sub	x0, x21, x20
	str	s1, [x3]
	cmp	x0, 8
	sub	x21, x21, #8
	bgt	.L4214
.L4030:
	cmp	x20, x21
	bne	.L4002
.L4003:
	sub	x1, x22, x20
	mov	x0, x20
	bl	_ZdlPvm
.L4194:
	ldp	x21, x22, [sp, 32]
	.cfi_restore 22
	.cfi_restore 21
	ldp	x23, x24, [sp, 48]
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	ldp	x27, x28, [sp, 80]
	.cfi_restore 28
	.cfi_restore 27
	ldp	d8, d9, [sp, 96]
	.cfi_restore 73
	.cfi_restore 72
.L3865:
	ldp	x19, x20, [sp, 16]
	ldr	x0, [sp, 120]
	ldp	x29, x30, [sp], 288
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L4089:
	.cfi_def_cfa_offset 288
	.cfi_offset 19, -272
	.cfi_offset 20, -264
	.cfi_offset 21, -256
	.cfi_offset 22, -248
	.cfi_offset 23, -240
	.cfi_offset 24, -232
	.cfi_offset 25, -224
	.cfi_offset 26, -216
	.cfi_offset 27, -208
	.cfi_offset 28, -200
	.cfi_offset 29, -288
	.cfi_offset 30, -280
	.cfi_offset 72, -192
	.cfi_offset 73, -184
	fmov	s8, s0
	mov	w25, w21
	mov	w24, 1
	b	.L3873
.L4091:
	sub	x0, x2, #1
	str	s0, [x22, x1]
	ldr	w1, [x3, 4]
	mov	x5, x2
	add	x0, x0, x0, lsr 63
	str	w1, [x6, 4]
	asr	x2, x0, 1
	cmp	x5, 0
	bgt	.L3925
	mov	x6, x3
	b	.L3923
	.p2align 2,,3
.L4092:
	sub	x0, x3, #1
	str	s0, [x22, x1]
	ldr	w1, [x6, 4]
	mov	x25, x3
	add	x0, x0, x0, lsr 63
	str	w1, [x4, 4]
	asr	x3, x0, 1
	cmp	x25, 0
	bgt	.L3938
	b	.L3936
	.p2align 2,,3
.L4096:
	sub	x2, x1, #1
	ldr	w6, [x5, 4]
	str	s0, [x3, x0]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w6, [x4, 4]
	asr	x1, x2, 1
	cmp	x0, 0
	bgt	.L3965
	mov	x4, x5
	b	.L3963
	.p2align 2,,3
.L4097:
	sub	x3, x1, #1
	ldr	w8, [x7, 4]
	str	s0, [x0, x2]
	mov	x2, x1
	add	x3, x3, x3, lsr 63
	str	w8, [x4, 4]
	asr	x1, x3, 1
	cmp	x2, 0
	bgt	.L3974
	mov	x4, x7
	b	.L3972
	.p2align 2,,3
.L4099:
	sub	x3, x2, #1
	str	s0, [x0, x4]
	ldr	w4, [x10, 4]
	mov	x1, x2
	add	x3, x3, x3, lsr 63
	str	w4, [x9, 4]
	asr	x2, x3, 1
	cbz	x1, .L4215
	lsl	x4, x1, 3
	b	.L3987
.L4200:
	ldr	x3, [x19, 80]
	mov	x2, x23
	ldr	x0, [sp, 128]
	mov	w1, w25
	add	x8, sp, 256
	mov	x5, 0
	cmp	x3, x0
	mov	x4, 0
	csel	x3, x3, x0, cs
	mov	x0, x19
.LEHB243:
	bl	_ZNK7hnswlib15HierarchicalNSWIfE17searchBaseLayerSTILb1ELb0EEESt14priority_queueISt4pairIfjESt6vectorIS5_SaIS5_EENS1_14CompareByFirstEEjPKvmPNS_17BaseFilterFunctorEPNS_23BaseSearchStopConditionIfEE
.LEHE243:
	ldp	x20, x21, [sp, 256]
	ldr	x22, [sp, 272]
.L3882:
	sub	x6, x21, x20
	ldr	x0, [sp, 128]
	cmp	x0, x6, asr 3
	bcc	.L4001
	b	.L4017
	.p2align 2,,3
.L4005:
	ldr	x0, [sp, 128]
	cmp	x7, x0
	bls	.L4017
.L4001:
	sub	x21, x21, #8
	mov	x0, x6
	sub	x6, x21, x20
	asr	x7, x6, 3
	cmp	x0, 8
	ble	.L4005
	sub	x0, x7, #1
	ldr	s0, [x20]
	ldr	w1, [x20, 4]
	and	x10, x7, 1
	add	x9, x0, x0, lsr 63
	ldr	w8, [x21, 4]
	str	w1, [x21, 4]
	ldr	s2, [x21]
	asr	x9, x9, 1
	str	s0, [x21]
	cmp	x6, 16
	ble	.L4006
	mov	x1, 0
	b	.L4010
	.p2align 2,,3
.L4216:
	mov	x1, x0
.L4010:
	add	x2, x1, 1
	lsl	x0, x2, 1
	lsl	x2, x2, 4
	sub	x5, x0, #1
	add	x4, x20, x2
	lsl	x3, x5, 3
	ldr	s0, [x20, x2]
	add	x2, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L4100
.L4007:
	lsl	x1, x1, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x9, x0
	bgt	.L4216
	lsl	x3, x0, 3
	cbnz	x10, .L4013
	sub	x1, x7, #2
	add	x1, x1, x1, lsr 63
	cmp	x0, x1, asr 1
	beq	.L4012
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L4016:
	lsl	x0, x1, 3
	add	x4, x20, x3
	add	x5, x20, x0
	ldr	s0, [x20, x0]
	fcmpe	s2, s0
	bgt	.L4101
.L4011:
	str	s2, [x4]
	str	w8, [x4, 4]
	b	.L4005
	.p2align 2,,3
.L4101:
	sub	x2, x1, #1
	str	s0, [x20, x3]
	ldr	w3, [x5, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x4, 4]
	asr	x1, x2, 1
	cbz	x0, .L4217
	lsl	x3, x0, 3
	b	.L4016
	.p2align 2,,3
.L4098:
	fmov	s0, s1
	mov	x9, x3
	mov	x1, x10
	b	.L3978
	.p2align 2,,3
.L3977:
	mov	x9, x0
	cbnz	x12, .L3982
	cmp	x1, 2
	bhi	.L3982
	mov	x1, 0
	.p2align 3,,7
.L3983:
	lsl	x1, x1, 1
	add	x1, x1, 1
	lsl	x4, x1, 3
	add	x2, x0, x4
	ldr	s0, [x0, x4]
	ldr	w2, [x2, 4]
	str	w2, [x9, 4]
	str	s0, [x9]
.L3984:
	sub	x1, x1, #1
	asr	x2, x1, 1
	b	.L3987
	.p2align 2,,3
.L4215:
	mov	x9, x10
	str	s2, [x9]
	str	w8, [x9, 4]
	b	.L4218
.L4210:
	ldr	x1, [x19, 248]
	mov	x0, x28
	ldr	x1, [x7, x1]
.LEHB244:
	blr	x2
	tst	w0, 255
	bne	.L3968
	.p2align 3,,7
.L4195:
	ldp	x0, x5, [sp, 224]
	sub	x6, x5, x0
	asr	x9, x6, 3
	b	.L3967
.L4100:
	fmov	s0, s1
	mov	x4, x2
	mov	x0, x5
	b	.L4007
.L3960:
	add	x3, sp, 196
	add	x2, sp, 208
	add	x0, sp, 256
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
	ldr	x0, [sp, 264]
	ldr	w7, [sp, 196]
	ldr	w8, [x0, -4]
	ldr	s1, [x0, -8]
	b	.L3961
.L4093:
	ldp	x1, x0, [sp, 224]
	sub	x0, x0, x1
	cmp	x21, x0, asr 3
	beq	.L3939
	sub	x0, x2, x22
	sub	x6, x2, #8
	cmp	x0, 8
	ble	.L3942
.L4206:
	sub	x1, x6, x22
	ldr	w7, [x2, -4]
	str	w4, [x2, -4]
	asr	x10, x1, 3
	ldr	s2, [x2, -8]
	sub	x0, x10, #1
	str	s0, [x2, -8]
	and	x11, x10, 1
	add	x9, x0, x0, lsr 63
	asr	x9, x9, 1
	cmp	x1, 16
	ble	.L3943
	mov	x2, 0
	b	.L3947
	.p2align 2,,3
.L4219:
	mov	x2, x0
.L3947:
	add	x1, x2, 1
	lsl	x0, x1, 1
	lsl	x1, x1, 4
	sub	x8, x0, #1
	add	x5, x22, x1
	lsl	x3, x8, 3
	ldr	s0, [x22, x1]
	add	x1, x22, x3
	ldr	s1, [x22, x3]
	fcmpe	s1, s0
	bgt	.L4094
.L3944:
	lsl	x1, x2, 3
	ldr	w3, [x5, 4]
	add	x2, x22, x1
	str	s0, [x22, x1]
	str	w3, [x2, 4]
	cmp	x9, x0
	bgt	.L4219
	lsl	x3, x0, 3
	cbnz	x11, .L3950
	sub	x1, x10, #2
	add	x1, x1, x1, lsr 63
	cmp	x0, x1, asr 1
	beq	.L3949
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L3953:
	lsl	x0, x1, 3
	add	x5, x22, x3
	add	x8, x22, x0
	ldr	s0, [x22, x0]
	fcmpe	s0, s2
	bmi	.L4095
.L3948:
	str	s2, [x5]
	str	w7, [x5, 4]
	b	.L3942
	.p2align 2,,3
.L4095:
	sub	x2, x1, #1
	str	s0, [x22, x3]
	ldr	w3, [x8, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x5, 4]
	asr	x1, x2, 1
	cbz	x0, .L4220
	lsl	x3, x0, 3
	b	.L3953
	.p2align 2,,3
.L4094:
	fmov	s0, s1
	mov	x5, x1
	mov	x0, x8
	b	.L3944
.L3962:
	sub	x0, x2, #8
	add	x4, x3, x0
	b	.L3963
.L3969:
	add	x3, sp, 196
	add	x2, sp, 200
	add	x0, sp, 224
	bl	_ZNSt6vectorISt4pairIfjESaIS1_EE17_M_realloc_insertIJRfRiEEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE244:
	ldr	x5, [sp, 232]
	ldr	w10, [x5, -4]
	ldr	s1, [x5, -8]
	b	.L3970
.L3943:
	mov	x5, x22
	cbnz	x11, .L3948
	cmp	x0, 2
	bhi	.L3948
	mov	x0, 0
.L3949:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x22, x3
	ldr	s0, [x22, x3]
	ldr	w1, [x1, 4]
	str	w1, [x5, 4]
	str	s0, [x5]
.L3950:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L3953
.L4220:
	mov	x5, x8
	str	s2, [x5]
	str	w7, [x5, 4]
	b	.L3942
.L4006:
	mov	x4, x20
	cbnz	x10, .L4011
	cmp	x0, 2
	bhi	.L4011
	mov	x0, 0
.L4012:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x20, x3
	ldr	s0, [x20, x3]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
.L4013:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L4016
.L4207:
	mov	x2, x6
	b	.L3989
.L4217:
	mov	x4, x5
	str	s2, [x4]
	str	w8, [x4, 4]
	b	.L4005
.L4025:
	ldr	x6, [x3, 8]
.L4028:
	lsl	x5, x1, 4
	sub	x4, x0, #1
	add	x7, x2, x5
	mov	x1, x0
	add	x4, x4, x4, lsr 63
	str	s0, [x2, x5]
	str	x6, [x7, 8]
	asr	x0, x4, 1
	cmp	x1, 0
	bgt	.L4023
	str	x8, [x3, 8]
	sub	x0, x21, x20
	str	s1, [x3]
	cmp	x0, 8
	sub	x21, x21, #8
	ble	.L4030
.L4214:
	sub	x1, x21, x20
	ldr	s0, [x20]
	ldr	w2, [x20, 4]
	asr	x8, x1, 3
	ldr	w7, [x21, 4]
	sub	x0, x8, #1
	str	w2, [x21, 4]
	ldr	s2, [x21]
	and	x9, x8, 1
	add	x6, x0, x0, lsr 63
	str	s0, [x21]
	asr	x6, x6, 1
	cmp	x1, 16
	ble	.L4031
	mov	x1, 0
	b	.L4035
	.p2align 2,,3
.L4221:
	mov	x1, x0
.L4035:
	add	x2, x1, 1
	lsl	x0, x2, 1
	lsl	x2, x2, 4
	sub	x5, x0, #1
	add	x4, x20, x2
	lsl	x3, x5, 3
	ldr	s0, [x20, x2]
	add	x2, x20, x3
	ldr	s1, [x20, x3]
	fcmpe	s1, s0
	bgt	.L4103
.L4032:
	lsl	x1, x1, 3
	ldr	w3, [x4, 4]
	add	x2, x20, x1
	str	s0, [x20, x1]
	str	w3, [x2, 4]
	cmp	x6, x0
	bgt	.L4221
	lsl	x3, x0, 3
	cbnz	x9, .L4038
	sub	x8, x8, #2
	add	x8, x8, x8, lsr 63
	cmp	x0, x8, asr 1
	beq	.L4037
	sub	x1, x0, #1
	lsl	x3, x0, 3
	asr	x1, x1, 1
	.p2align 3,,7
.L4041:
	lsl	x0, x1, 3
	add	x4, x20, x3
	add	x5, x20, x0
	ldr	s0, [x20, x0]
	fcmpe	s0, s2
	bmi	.L4104
.L4036:
	str	s2, [x4]
	str	w7, [x4, 4]
	b	.L4030
	.p2align 2,,3
.L4104:
	sub	x2, x1, #1
	str	s0, [x20, x3]
	ldr	w3, [x5, 4]
	mov	x0, x1
	add	x2, x2, x2, lsr 63
	str	w3, [x4, 4]
	asr	x1, x2, 1
	cbz	x0, .L4222
	lsl	x3, x0, 3
	b	.L4041
.L4103:
	fmov	s0, s1
	mov	x4, x2
	mov	x0, x5
	b	.L4032
.L4031:
	mov	x4, x20
	cbnz	x9, .L4036
	cmp	x0, 2
	bhi	.L4036
	mov	x0, 0
.L4037:
	lsl	x0, x0, 1
	add	x0, x0, 1
	lsl	x3, x0, 3
	add	x1, x20, x3
	ldr	s0, [x20, x3]
	ldr	w1, [x1, 4]
	str	w1, [x4, 4]
	str	s0, [x4]
.L4038:
	sub	x0, x0, #1
	asr	x1, x0, 1
	b	.L4041
.L4018:
	mov	x0, x4
	add	x2, sp, 256
.LEHB245:
	bl	_ZNSt6vectorISt4pairIfmESaIS1_EE17_M_realloc_insertIJS1_EEEvN9__gnu_cxx17__normal_iteratorIPS1_S3_EEDpOT_
.LEHE245:
	ldr	x0, [sp, 120]
	ldr	x1, [x0, 8]
	b	.L4019
.L4222:
	mov	x4, x5
	str	s2, [x4]
	str	w7, [x4, 4]
	b	.L4030
.L3971:
	sub	x4, x6, #8
	add	x4, x0, x4
	b	.L3972
.L4213:
	cbz	x20, .L4194
	b	.L4003
	.p2align 2,,3
.L4203:
	mov	x22, 0
	mov	x2, 1
	str	xzr, [sp, 112]
	str	xzr, [sp, 152]
.L3890:
	mov	x0, 1152921504606846975
	cmp	x2, x0
	csel	x2, x2, x0, ls
	lsl	x0, x2, 3
	str	x0, [sp, 136]
.L3904:
.LEHB246:
	bl	_Znwm
.LEHE246:
	mov	x4, x0
	add	x2, x0, 8
	ldr	x0, [sp, 136]
	ldr	x1, [sp, 272]
	add	x8, x4, x0
	b	.L3905
.L4202:
	ldr	x0, [x27, 8]
	mov	w1, 0
	ldr	w2, [x27, 16]
	lsl	x2, x2, 1
	bl	memset
	ldrh	w24, [x27]
	add	w24, w24, 1
	and	w24, w24, 65535
	strh	w24, [x27]
	b	.L3889
.L3883:
	mov	x0, 24
.LEHB247:
	bl	_Znwm
.LEHE247:
	mov	x27, x0
	ldr	w1, [x20, 128]
	mov	w2, -1
	strh	w2, [x27]
	ubfiz	x0, x1, 1, 32
	str	w1, [x27, 16]
.LEHB248:
	bl	_Znam
.LEHE248:
	str	x0, [x27, 8]
.L3886:
	ldrb	w0, [sp, 264]
	cbz	w0, .L3887
	b	.L3885
	.p2align 2,,3
.L3991:
	mov	x0, x20
	add	x1, sp, 200
.LEHB249:
	bl	_ZNSt5dequeIPN7hnswlib11VisitedListESaIS2_EE17_M_push_front_auxIJRKS2_EEEvDpOT_
.LEHE249:
	ldrb	w0, [sp, 216]
	cbz	w0, .L3993
	b	.L3992
	.p2align 2,,3
.L4204:
	ldr	x2, [x19, 248]
	mov	x0, x28
	ldr	x1, [x1, x2]
.LEHB250:
	blr	x4
.LEHE250:
	tst	w0, 255
	bne	.L4223
	ldp	x22, x3, [sp, 256]
	str	x3, [sp, 112]
	ldr	x1, [sp, 272]
	cmp	x3, x1
	beq	.L3899
	add	x2, x3, 8
	mvni	v0.2s, 0x80, lsl 16
	sub	x1, x2, x22
	mov	w7, w25
	sub	x6, x1, #8
	str	w25, [x3, 4]
	asr	x1, x1, 3
	add	x6, x22, x6
	sub	x0, x1, #2
	sub	x5, x1, #1
	str	s0, [x3]
	add	x0, x0, x0, lsr 63
	str	x2, [sp, 264]
	asr	x25, x0, 1
.L3900:
	cmp	x5, 0
	ble	.L3909
.L3911:
	lsl	x0, x25, 3
	lsl	x5, x5, 3
	add	x1, x22, x0
	add	x6, x22, x5
	ldr	s1, [x22, x0]
	fcmpe	s1, s0
	bmi	.L4090
.L3909:
	mov	w0, 2139095039
	fmov	s8, w0
	str	s0, [x6]
	str	w7, [x6, 4]
	b	.L3912
.L4090:
	sub	x0, x25, #1
	ldr	w3, [x1, 4]
	str	s1, [x22, x5]
	mov	x5, x25
	add	x0, x0, x0, lsr 63
	str	w3, [x6, 4]
	asr	x25, x0, 1
	cmp	x5, 0
	bgt	.L3911
	mov	x6, x1
	b	.L3909
.L3884:
	ldr	x0, [x20, 24]
	mov	x1, 512
	bl	_ZdlPvm
	ldr	x0, [x20, 40]
	add	x1, x0, 8
	ldr	x0, [x0, 8]
	str	x0, [x22, 8]
	str	x1, [x22, 24]
	add	x1, x0, 512
	str	x1, [x22, 16]
	str	x0, [x20, 16]
	b	.L3886
.L4201:
.LEHB251:
	bl	_ZSt20__throw_system_errori
.LEHE251:
.L3899:
	ldr	x0, [sp, 112]
	sub	x0, x0, x22
	mov	x2, x0
	str	x2, [sp, 152]
	mov	x0, 1152921504606846975
	asr	x2, x2, 3
	cmp	x2, x0
	beq	.L4224
	cmp	x2, 0
	csinc	x0, x2, xzr, ne
	adds	x0, x0, x2
	mov	x2, x0
	bcs	.L4051
	cbnz	x0, .L3890
	mov	x2, 8
	mov	x8, 0
	mov	x4, 0
.L3905:
	ldr	x3, [sp, 152]
	mvni	v0.2s, 0x80, lsl 16
	add	x0, x4, x3
	str	s0, [x4, x3]
	str	w25, [x0, 4]
	ldr	x0, [sp, 112]
	cmp	x22, x0
	beq	.L4053
	sub	x3, x0, x22
	mov	x2, x22
	mov	x0, x4
	add	x3, x4, x3
.L3907:
	ldr	x5, [x2], 8
	str	x5, [x0], 8
	cmp	x0, x3
	bne	.L3907
	add	x2, x3, 8
	sub	x5, x2, x4
	sub	x6, x5, #8
	asr	x5, x5, 3
	add	x6, x4, x6
	sub	x0, x5, #2
	sub	x5, x5, #1
	add	x0, x0, x0, lsr 63
	asr	x25, x0, 1
.L3906:
	cbz	x22, .L3908
	sub	x1, x1, x22
	mov	x0, x22
	str	x2, [sp, 112]
	str	x4, [sp, 136]
	stp	x3, x5, [sp, 152]
	stp	x8, x6, [sp, 168]
	bl	_ZdlPvm
	ldp	x3, x5, [sp, 152]
	ldp	x8, x6, [sp, 168]
	ldr	x2, [sp, 112]
	ldr	x4, [sp, 136]
.L3908:
	mov	x22, x4
	ldr	w7, [x3, 4]
	stp	x4, x2, [sp, 256]
	ldr	s0, [x3]
	str	x8, [sp, 272]
	b	.L3900
.L4053:
	mov	x6, x4
	mov	x3, x4
	mov	x25, 0
	mov	x5, 0
	b	.L3906
.L4051:
	mov	x0, 9223372036854775800
	str	x0, [sp, 136]
	b	.L3904
.L4224:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
.LEHB252:
	bl	_ZSt20__throw_length_errorPKc
	.p2align 2,,3
.L4223:
	ldr	x2, [x19, 24]
	ldr	x3, [x19, 256]
	mul	x2, x20, x2
	b	.L3896
.L4212:
	bl	_ZSt20__throw_system_errori
	.p2align 2,,3
.L3926:
	sub	x0, x0, x22
	str	x0, [sp, 152]
	mov	x2, 1152921504606846975
	asr	x0, x0, 3
	cmp	x0, x2
	beq	.L4225
	cmp	x0, 0
	csinc	x3, x0, xzr, ne
	adds	x0, x0, x3
	bcs	.L3930
	cbz	x0, .L4226
	cmp	x0, x2
	csel	x0, x0, x2, ls
	lsl	x0, x0, 3
	str	x0, [sp, 112]
.L3931:
	bl	_Znwm
	mov	x4, x0
	add	x2, x0, 8
	ldr	x0, [sp, 112]
	ldr	x1, [sp, 272]
	add	x7, x4, x0
.L3932:
	ldr	x0, [sp, 152]
	add	x5, x4, x0
	str	s9, [x4, x0]
	ldr	x0, [sp, 136]
	str	w25, [x5, 4]
	cmp	x0, x22
	beq	.L4061
	mov	x0, x4
	mov	x2, x22
.L3934:
	ldr	x3, [x2], 8
	str	x3, [x0], 8
	cmp	x5, x0
	bne	.L3934
	add	x2, x5, 8
	sub	x25, x2, x4
	sub	x6, x25, #8
	asr	x25, x25, 3
	add	x6, x4, x6
	sub	x0, x25, #2
	sub	x25, x25, #1
	add	x0, x0, x0, lsr 63
	asr	x3, x0, 1
.L3933:
	cbz	x22, .L3935
	sub	x1, x1, x22
	mov	x0, x22
	str	x2, [sp, 112]
	str	x5, [sp, 136]
	stp	x3, x4, [sp, 152]
	stp	x7, x6, [sp, 168]
	bl	_ZdlPvm
	ldp	x3, x4, [sp, 152]
	ldp	x7, x6, [sp, 168]
	ldr	x2, [sp, 112]
	ldr	x5, [sp, 136]
.L3935:
	mov	x22, x4
	ldr	w8, [x5, 4]
	stp	x4, x2, [sp, 256]
	ldr	s9, [x5]
	str	x7, [sp, 272]
	b	.L3927
.L4205:
	sub	x0, x0, x22
	str	x0, [sp, 152]
	mov	x2, 1152921504606846975
	asr	x0, x0, 3
	cmp	x0, x2
	beq	.L4227
	cmp	x0, 0
	csinc	x3, x0, xzr, ne
	adds	x0, x0, x3
	bcs	.L3917
	cbz	x0, .L4228
	cmp	x0, x2
	csel	x0, x0, x2, ls
	lsl	x0, x0, 3
	str	x0, [sp, 136]
.L3918:
	bl	_Znwm
	mov	x3, x0
	add	x7, x0, 8
	ldr	x0, [sp, 136]
	ldr	x1, [sp, 240]
	add	x8, x3, x0
.L3919:
	ldr	x0, [sp, 152]
	add	x4, x3, x0
	str	s8, [x3, x0]
	ldr	x0, [sp, 112]
	str	w25, [x4, 4]
	cmp	x0, x22
	beq	.L4057
	mov	x0, x3
	mov	x2, x22
.L3921:
	ldr	x5, [x2], 8
	str	x5, [x0], 8
	cmp	x0, x4
	bne	.L3921
	add	x7, x4, 8
	sub	x2, x7, x3
	sub	x6, x2, #8
	asr	x2, x2, 3
	add	x6, x3, x6
	sub	x0, x2, #2
	sub	x5, x2, #1
	add	x0, x0, x0, lsr 63
	asr	x2, x0, 1
.L3920:
	cbz	x22, .L3922
	sub	x1, x1, x22
	mov	x0, x22
	str	x3, [sp, 112]
	str	x2, [sp, 136]
	stp	x5, x4, [sp, 152]
	stp	x8, x7, [sp, 168]
	str	x6, [sp, 184]
	bl	_ZdlPvm
	ldp	x5, x4, [sp, 152]
	ldp	x8, x7, [sp, 168]
	ldr	x3, [sp, 112]
	ldr	x2, [sp, 136]
	ldr	x6, [sp, 184]
.L3922:
	mov	x22, x3
	ldr	w9, [x4, 4]
	stp	x3, x7, [sp, 224]
	ldr	s1, [x4]
	str	x8, [sp, 240]
	b	.L3914
.L4226:
	mov	x2, 8
	mov	x7, 0
	mov	x4, 0
	b	.L3932
.L4061:
	mov	x6, x4
	mov	x5, x4
	mov	x3, 0
	mov	x25, 0
	b	.L3933
.L3930:
	mov	x0, 9223372036854775800
	str	x0, [sp, 112]
	b	.L3931
.L4225:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
	.p2align 2,,3
.L4228:
	mov	x7, 8
	mov	x8, 0
	mov	x3, 0
	b	.L3919
.L4057:
	mov	x6, x3
	mov	x4, x3
	mov	x2, 0
	mov	x5, 0
	b	.L3920
.L3917:
	mov	x0, 9223372036854775800
	str	x0, [sp, 136]
	b	.L3918
.L4227:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	_ZSt20__throw_length_errorPKc
.LEHE252:
.L4087:
	ldrb	w1, [sp, 216]
	mov	x19, x0
	cbz	w1, .L3998
	add	x0, sp, 208
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
.L3998:
	ldr	x0, [sp, 256]
	ldr	x1, [sp, 272]
	sub	x1, x1, x0
	cbz	x0, .L3999
	bl	_ZdlPvm
.L3999:
	ldr	x0, [sp, 224]
	ldr	x1, [sp, 240]
	sub	x1, x1, x0
	cbz	x0, .L4043
.L4198:
	bl	_ZdlPvm
.L4043:
	ldr	x1, [sp, 120]
	ldr	x0, [x1]
	ldr	x1, [x1, 16]
	sub	x1, x1, x0
	cbz	x0, .L4044
	bl	_ZdlPvm
.L4044:
	mov	x0, x19
.LEHB253:
	bl	_Unwind_Resume
.LEHE253:
.L4086:
	mov	x19, x0
	mov	x1, 24
	mov	x0, x27
	bl	_ZdlPvm
.L3893:
	ldrb	w0, [sp, 264]
	cbz	w0, .L4043
	add	x0, sp, 256
	bl	_ZNSt11unique_lockISt5mutexE6unlockEv
	b	.L4043
.L4083:
	mov	x19, x0
	sub	x1, x22, x20
	mov	x0, x20
	b	.L4198
.L4084:
	mov	x19, x0
	b	.L3998
.L4085:
	mov	x19, x0
	b	.L3893
.L4088:
	mov	x19, x0
	b	.L4043
.L4199:
	mov	x0, 16
	bl	__cxa_allocate_exception
	adrp	x1, .LC47
	mov	x20, x0
	add	x1, x1, :lo12:.LC47
.LEHB254:
	bl	_ZNSt13runtime_errorC1EPKc
.LEHE254:
	adrp	x2, _ZNSt13runtime_errorD1Ev
	adrp	x1, _ZTISt13runtime_error
	mov	x0, x20
	add	x2, x2, :lo12:_ZNSt13runtime_errorD1Ev
	add	x1, x1, :lo12:_ZTISt13runtime_error
.LEHB255:
	bl	__cxa_throw
.LEHE255:
.L4081:
	mov	x19, x0
	b	.L4043
.L4082:
	mov	x19, x0
	mov	x0, x20
	bl	__cxa_free_exception
	b	.L4043
	.cfi_endproc
.LFE13343:
	.section	.gcc_except_table
.LLSDA13343:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE13343-.LLSDACSB13343
.LLSDACSB13343:
	.uleb128 .LEHB241-.LFB13343
	.uleb128 .LEHE241-.LEHB241
	.uleb128 .L4081-.LFB13343
	.uleb128 0
	.uleb128 .LEHB242-.LFB13343
	.uleb128 .LEHE242-.LEHB242
	.uleb128 .L4084-.LFB13343
	.uleb128 0
	.uleb128 .LEHB243-.LFB13343
	.uleb128 .LEHE243-.LEHB243
	.uleb128 .L4088-.LFB13343
	.uleb128 0
	.uleb128 .LEHB244-.LFB13343
	.uleb128 .LEHE244-.LEHB244
	.uleb128 .L4084-.LFB13343
	.uleb128 0
	.uleb128 .LEHB245-.LFB13343
	.uleb128 .LEHE245-.LEHB245
	.uleb128 .L4083-.LFB13343
	.uleb128 0
	.uleb128 .LEHB246-.LFB13343
	.uleb128 .LEHE246-.LEHB246
	.uleb128 .L4084-.LFB13343
	.uleb128 0
	.uleb128 .LEHB247-.LFB13343
	.uleb128 .LEHE247-.LEHB247
	.uleb128 .L4085-.LFB13343
	.uleb128 0
	.uleb128 .LEHB248-.LFB13343
	.uleb128 .LEHE248-.LEHB248
	.uleb128 .L4086-.LFB13343
	.uleb128 0
	.uleb128 .LEHB249-.LFB13343
	.uleb128 .LEHE249-.LEHB249
	.uleb128 .L4087-.LFB13343
	.uleb128 0
	.uleb128 .LEHB250-.LFB13343
	.uleb128 .LEHE250-.LEHB250
	.uleb128 .L4084-.LFB13343
	.uleb128 0
	.uleb128 .LEHB251-.LFB13343
	.uleb128 .LEHE251-.LEHB251
	.uleb128 .L4088-.LFB13343
	.uleb128 0
	.uleb128 .LEHB252-.LFB13343
	.uleb128 .LEHE252-.LEHB252
	.uleb128 .L4084-.LFB13343
	.uleb128 0
	.uleb128 .LEHB253-.LFB13343
	.uleb128 .LEHE253-.LEHB253
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB254-.LFB13343
	.uleb128 .LEHE254-.LEHB254
	.uleb128 .L4082-.LFB13343
	.uleb128 0
	.uleb128 .LEHB255-.LFB13343
	.uleb128 .LEHE255-.LEHB255
	.uleb128 .L4081-.LFB13343
	.uleb128 0
.LLSDACSE13343:
	.section	.text._ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE,"axG",@progbits,_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE,comdat
	.size	_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE, .-_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE
	.section	.text.startup
	.align	2
	.p2align 4,,11
	.type	_GLOBAL__sub_I__Z11flat_searchPfS_mmm, %function
_GLOBAL__sub_I__Z11flat_searchPfS_mmm:
.LFB13587:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, .LANCHOR1
	add	x19, x19, :lo12:.LANCHOR1
	mov	x0, x19
	bl	_ZNSt8ios_base4InitC1Ev
	mov	x1, x19
	adrp	x2, __dso_handle
	ldr	x19, [sp, 16]
	add	x2, x2, :lo12:__dso_handle
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	adrp	x0, _ZNSt8ios_base4InitD1Ev
	add	x0, x0, :lo12:_ZNSt8ios_base4InitD1Ev
	b	__cxa_atexit
	.cfi_endproc
.LFE13587:
	.size	_GLOBAL__sub_I__Z11flat_searchPfS_mmm, .-_GLOBAL__sub_I__Z11flat_searchPfS_mmm
	.section	.init_array,"aw"
	.align	3
	.xword	_GLOBAL__sub_I__Z11flat_searchPfS_mmm
	.weak	_ZTSN7hnswlib14SpaceInterfaceIfEE
	.section	.rodata._ZTSN7hnswlib14SpaceInterfaceIfEE,"aG",@progbits,_ZTSN7hnswlib14SpaceInterfaceIfEE,comdat
	.align	3
	.type	_ZTSN7hnswlib14SpaceInterfaceIfEE, %object
	.size	_ZTSN7hnswlib14SpaceInterfaceIfEE, 30
_ZTSN7hnswlib14SpaceInterfaceIfEE:
	.string	"N7hnswlib14SpaceInterfaceIfEE"
	.weak	_ZTIN7hnswlib14SpaceInterfaceIfEE
	.section	.rodata._ZTIN7hnswlib14SpaceInterfaceIfEE,"aG",@progbits,_ZTIN7hnswlib14SpaceInterfaceIfEE,comdat
	.align	3
	.type	_ZTIN7hnswlib14SpaceInterfaceIfEE, %object
	.size	_ZTIN7hnswlib14SpaceInterfaceIfEE, 16
_ZTIN7hnswlib14SpaceInterfaceIfEE:
	.xword	_ZTVN10__cxxabiv117__class_type_infoE+16
	.xword	_ZTSN7hnswlib14SpaceInterfaceIfEE
	.weak	_ZTSN7hnswlib17InnerProductSpaceE
	.section	.rodata._ZTSN7hnswlib17InnerProductSpaceE,"aG",@progbits,_ZTSN7hnswlib17InnerProductSpaceE,comdat
	.align	3
	.type	_ZTSN7hnswlib17InnerProductSpaceE, %object
	.size	_ZTSN7hnswlib17InnerProductSpaceE, 30
_ZTSN7hnswlib17InnerProductSpaceE:
	.string	"N7hnswlib17InnerProductSpaceE"
	.weak	_ZTIN7hnswlib17InnerProductSpaceE
	.section	.rodata._ZTIN7hnswlib17InnerProductSpaceE,"aG",@progbits,_ZTIN7hnswlib17InnerProductSpaceE,comdat
	.align	3
	.type	_ZTIN7hnswlib17InnerProductSpaceE, %object
	.size	_ZTIN7hnswlib17InnerProductSpaceE, 24
_ZTIN7hnswlib17InnerProductSpaceE:
	.xword	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.xword	_ZTSN7hnswlib17InnerProductSpaceE
	.xword	_ZTIN7hnswlib14SpaceInterfaceIfEE
	.weak	_ZTSN7hnswlib18AlgorithmInterfaceIfEE
	.section	.rodata._ZTSN7hnswlib18AlgorithmInterfaceIfEE,"aG",@progbits,_ZTSN7hnswlib18AlgorithmInterfaceIfEE,comdat
	.align	3
	.type	_ZTSN7hnswlib18AlgorithmInterfaceIfEE, %object
	.size	_ZTSN7hnswlib18AlgorithmInterfaceIfEE, 34
_ZTSN7hnswlib18AlgorithmInterfaceIfEE:
	.string	"N7hnswlib18AlgorithmInterfaceIfEE"
	.weak	_ZTIN7hnswlib18AlgorithmInterfaceIfEE
	.section	.rodata._ZTIN7hnswlib18AlgorithmInterfaceIfEE,"aG",@progbits,_ZTIN7hnswlib18AlgorithmInterfaceIfEE,comdat
	.align	3
	.type	_ZTIN7hnswlib18AlgorithmInterfaceIfEE, %object
	.size	_ZTIN7hnswlib18AlgorithmInterfaceIfEE, 16
_ZTIN7hnswlib18AlgorithmInterfaceIfEE:
	.xword	_ZTVN10__cxxabiv117__class_type_infoE+16
	.xword	_ZTSN7hnswlib18AlgorithmInterfaceIfEE
	.weak	_ZTSN7hnswlib15HierarchicalNSWIfEE
	.section	.rodata._ZTSN7hnswlib15HierarchicalNSWIfEE,"aG",@progbits,_ZTSN7hnswlib15HierarchicalNSWIfEE,comdat
	.align	3
	.type	_ZTSN7hnswlib15HierarchicalNSWIfEE, %object
	.size	_ZTSN7hnswlib15HierarchicalNSWIfEE, 31
_ZTSN7hnswlib15HierarchicalNSWIfEE:
	.string	"N7hnswlib15HierarchicalNSWIfEE"
	.weak	_ZTIN7hnswlib15HierarchicalNSWIfEE
	.section	.rodata._ZTIN7hnswlib15HierarchicalNSWIfEE,"aG",@progbits,_ZTIN7hnswlib15HierarchicalNSWIfEE,comdat
	.align	3
	.type	_ZTIN7hnswlib15HierarchicalNSWIfEE, %object
	.size	_ZTIN7hnswlib15HierarchicalNSWIfEE, 24
_ZTIN7hnswlib15HierarchicalNSWIfEE:
	.xword	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.xword	_ZTSN7hnswlib15HierarchicalNSWIfEE
	.xword	_ZTIN7hnswlib18AlgorithmInterfaceIfEE
	.weak	_ZTVN7hnswlib17InnerProductSpaceE
	.section	.rodata._ZTVN7hnswlib17InnerProductSpaceE,"aG",@progbits,_ZTVN7hnswlib17InnerProductSpaceE,comdat
	.align	3
	.type	_ZTVN7hnswlib17InnerProductSpaceE, %object
	.size	_ZTVN7hnswlib17InnerProductSpaceE, 56
_ZTVN7hnswlib17InnerProductSpaceE:
	.xword	0
	.xword	_ZTIN7hnswlib17InnerProductSpaceE
	.xword	_ZN7hnswlib17InnerProductSpace13get_data_sizeEv
	.xword	_ZN7hnswlib17InnerProductSpace13get_dist_funcEv
	.xword	_ZN7hnswlib17InnerProductSpace19get_dist_func_paramEv
	.xword	_ZN7hnswlib17InnerProductSpaceD1Ev
	.xword	_ZN7hnswlib17InnerProductSpaceD0Ev
	.weak	_ZTVN7hnswlib15HierarchicalNSWIfEE
	.section	.rodata._ZTVN7hnswlib15HierarchicalNSWIfEE,"aG",@progbits,_ZTVN7hnswlib15HierarchicalNSWIfEE,comdat
	.align	3
	.type	_ZTVN7hnswlib15HierarchicalNSWIfEE, %object
	.size	_ZTVN7hnswlib15HierarchicalNSWIfEE, 64
_ZTVN7hnswlib15HierarchicalNSWIfEE:
	.xword	0
	.xword	_ZTIN7hnswlib15HierarchicalNSWIfEE
	.xword	_ZN7hnswlib15HierarchicalNSWIfE8addPointEPKvmb
	.xword	_ZNK7hnswlib15HierarchicalNSWIfE9searchKnnEPKvmPNS_17BaseFilterFunctorE
	.xword	_ZNK7hnswlib18AlgorithmInterfaceIfE20searchKnnCloserFirstEPKvmPNS_17BaseFilterFunctorE
	.xword	_ZN7hnswlib15HierarchicalNSWIfE9saveIndexERKNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.xword	_ZN7hnswlib15HierarchicalNSWIfED1Ev
	.xword	_ZN7hnswlib15HierarchicalNSWIfED0Ev
	.weakref	_ZL28__gthrw___pthread_key_createPjPFvPvE,__pthread_key_create
	.weakref	_ZL28__gthrw_pthread_mutex_unlockP15pthread_mutex_t,pthread_mutex_unlock
	.weakref	_ZL26__gthrw_pthread_mutex_lockP15pthread_mutex_t,pthread_mutex_lock
	.section	.rodata.cst8,"aM",@progbits,8
	.align	3
.LC12:
	.xword	_ZL28__gthrw___pthread_key_createPjPFvPvE
	.section	.rodata.cst16,"aM",@progbits,16
	.align	4
.LC28:
	.word	-1023541248
	.word	-1023541248
	.word	-1023541248
	.word	-1023541248
	.align	4
.LC29:
	.word	1123942400
	.word	1123942400
	.word	1123942400
	.word	1123942400
	.section	.rodata.cst8
	.align	3
.LC30:
	.word	-1023541248
	.word	-1023541248
	.align	3
.LC31:
	.word	1123942400
	.word	1123942400
	.section	.rodata.cst16
	.align	4
.LC52:
	.xword	1
	.xword	1
	.align	4
.LC53:
	.xword	16
	.xword	16
	.align	4
.LC54:
	.xword	32
	.xword	150
	.align	4
.LC55:
	.xword	100
	.xword	101
	.align	4
.LC56:
	.xword	132
	.xword	132
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
.LC51:
	.string	"files/hnsw.index"
	.zero	1007
	.bss
	.align	3
	.set	.LANCHOR1,. + 0
	.type	_ZStL8__ioinit, %object
	.size	_ZStL8__ioinit, 1
_ZStL8__ioinit:
	.zero	1
	.hidden	DW.ref.__gxx_personality_v0
	.weak	DW.ref.__gxx_personality_v0
	.section	.data.DW.ref.__gxx_personality_v0,"awG",@progbits,DW.ref.__gxx_personality_v0,comdat
	.align	3
	.type	DW.ref.__gxx_personality_v0, %object
	.size	DW.ref.__gxx_personality_v0, 8
DW.ref.__gxx_personality_v0:
	.xword	__gxx_personality_v0
	.hidden	__dso_handle
	.ident	"GCC: (GNU) 10.3.1"
	.section	.note.GNU-stack,"",@progbits
