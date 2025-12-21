	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 15, 2	sdk_version 15, 2
	.globl	__Z18constantVectorLoopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE ; -- Begin function _Z18constantVectorLoopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE
	.p2align	2
__Z18constantVectorLoopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE: ; @_Z18constantVectorLoopR14ConstantVectorIiNSt3__19allocatorIiEENS1_IPiEEE
	.cfi_startproc
; %bb.0:
	ldr	x8, [x0, #8]
	cbz	x8, LBB0_6
; %bb.1:
	ldr	x9, [x0]
	ldr	x12, [x0, #64]
	add	x8, x9, x12, lsl #3
	ldr	x13, [x8]
	ldp	x11, x10, [x0, #40]
	lsl	x10, x10, #32
	add	x10, x13, x10, asr #30
	ldr	x14, [x0, #24]
	ldr	x9, [x9, x14, lsl #3]
	add	x9, x9, x11, lsl #2
	add	x9, x9, #4
	cmp	x10, x9
	b.eq	LBB0_6
; %bb.2:
	mov	x11, #0                         ; =0x0
	mov	w14, #256                       ; =0x100
	lsl	x12, x14, x12
	add	x12, x13, x12, lsl #2
LBB0_3:                                 ; =>This Inner Loop Header: Depth=1
	ldrsw	x13, [x10], #4
	add	x11, x11, x13
	; InlineAsm Start
	; InlineAsm End
	cmp	x10, x12
	b.eq	LBB0_5
; %bb.4:                                ;   in Loop: Header=BB0_3 Depth=1
	cmp	x10, x9
	b.ne	LBB0_3
	b	LBB0_6
LBB0_5:                                 ;   in Loop: Header=BB0_3 Depth=1
	ldr	x13, [x8]
	ldr	x10, [x8, #8]!
	sub	x12, x12, x13
	add	x12, x10, x12, lsl #1
	cmp	x10, x9
	b.ne	LBB0_3
LBB0_6:
	ret
	.cfi_endproc
                                        ; -- End function
	.globl	__Z13stlVectorLoopR9STLVectorIiNSt3__19allocatorIiEEE ; -- Begin function _Z13stlVectorLoopR9STLVectorIiNSt3__19allocatorIiEEE
	.p2align	2
__Z13stlVectorLoopR9STLVectorIiNSt3__19allocatorIiEEE: ; @_Z13stlVectorLoopR9STLVectorIiNSt3__19allocatorIiEEE
	.cfi_startproc
; %bb.0:
	ldrsw	x10, [x0, #8]
	cbz	w10, LBB1_3
; %bb.1:
	mov	x8, #0                          ; =0x0
	ldr	x9, [x0]
	lsl	x10, x10, #2
LBB1_2:                                 ; =>This Inner Loop Header: Depth=1
	ldrsw	x11, [x9], #4
	add	x8, x8, x11
	; InlineAsm Start
	; InlineAsm End
	subs	x10, x10, #4
	b.ne	LBB1_2
LBB1_3:
	ret
	.cfi_endproc
                                        ; -- End function
.subsections_via_symbols
