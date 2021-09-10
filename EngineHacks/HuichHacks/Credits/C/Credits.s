	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 4
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"Credits.c"
	.text
	.align	1
	.global	CRE_initMapSprites1
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_initMapSprites1, %function
CRE_initMapSprites1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #0
	@ sp needed
	strh	r3, [r0, #42]
	ldr	r3, [r0, #48]
	movs	r2, r3
	movs	r1, #8
	adds	r2, r2, #41
	strb	r1, [r2]
	ldr	r2, .L2
	strh	r2, [r3, #42]
	ldr	r2, .L2+4
	str	r2, [r3, #44]
	ldr	r2, .L2+8
	str	r2, [r3, #48]
	bx	lr
.L3:
	.align	2
.L2:
	.word	4104
	.word	973078688
	.word	msOAM
	.size	CRE_initMapSprites1, .-CRE_initMapSprites1
	.align	1
	.global	CRE_doReturn
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_doReturn, %function
CRE_doReturn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, #8
	@ sp needed
	ldr	r1, .L5
	ldr	r0, [r1, #20]
	ldrh	r2, [r0, #16]
	orrs	r2, r3
	strh	r2, [r0, #16]
	ldr	r2, [r1, #24]
	ldrh	r1, [r2, #16]
	orrs	r3, r1
	strh	r3, [r2, #16]
	bx	lr
.L6:
	.align	2
.L5:
	.word	gAISBuffer
	.size	CRE_doReturn, .-CRE_doReturn
	.align	1
	.global	CRE_setBitfield
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_setBitfield, %function
CRE_setBitfield:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r1, #20]
	@ sp needed
	adds	r3, r3, #41
	ldrb	r2, [r3]
	orrs	r2, r0
	strb	r2, [r3]
	movs	r0, #1
	bx	lr
	.size	CRE_setBitfield, .-CRE_setBitfield
	.align	1
	.global	CRE_authorsInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_authorsInit, %function
CRE_authorsInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, r5, r6, lr}
	str	r3, [r0, #48]
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	movs	r3, r0
	movs	r4, r0
	adds	r3, r3, #41
	ldrb	r5, [r3]
	ldr	r6, .L15
	lsls	r5, r5, #2
.L10:
	ldr	r3, [r4, #44]
	ldr	r0, [r3, r5]
	cmp	r0, #0
	beq	.L8
	movs	r1, r6
	ldr	r3, .L15+4
	bl	.L17
	movs	r3, #128
	lsls	r3, r3, #4
	adds	r6, r6, r3
	ldr	r3, .L15+8
	adds	r5, r5, #4
	cmp	r6, r3
	bne	.L10
.L8:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L16:
	.align	2
.L15:
	.word	100753408
	.word	Decompress
	.word	100759552
	.size	CRE_authorsInit, .-CRE_authorsInit
	.align	1
	.global	CRE_segTitleInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segTitleInit, %function
CRE_segTitleInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L27
	sub	sp, sp, #28
	movs	r4, r0
	ldrh	r0, [r0, #48]
	bl	.L17
	ldr	r3, .L27+4
	movs	r5, r0
	bl	.L17
	movs	r1, #128
	lsls	r3, r0, #24
	lsrs	r3, r3, #24
	movs	r2, #32
	str	r0, [sp, #16]
	str	r3, [sp, #8]
	ldr	r0, [r4, #56]
	ldr	r3, .L27+8
	lsls	r1, r1, #2
	bl	.L17
	movs	r2, #80
	movs	r1, #0
	ldr	r3, .L27+12
	ldr	r0, .L27+16
	bl	.L17
	ldr	r1, .L27+20
	ldr	r0, .L27+24
	ldr	r3, .L27+28
	bl	.L17
	ldr	r7, .L27+32
.L19:
	str	r5, [sp, #12]
	str	r7, [sp, #4]
	b	.L25
.L23:
	movs	r3, r6
	subs	r3, r3, #65
	cmp	r6, #96
	bls	.L21
	subs	r3, r3, #6
.L21:
	movs	r2, #240
	lsls	r5, r3, #6
	lsls	r2, r2, #2
	ands	r5, r2
	movs	r2, #192
	lsls	r3, r3, #8
	lsls	r2, r2, #6
	ands	r3, r2
	ldr	r2, .L27+20
	orrs	r3, r5
	adds	r6, r3, r2
	ldr	r2, .L27+36
	adds	r3, r3, r2
	str	r3, [sp, #20]
	ldr	r5, [sp, #4]
.L22:
	movs	r1, r5
	movs	r0, r6
	ldr	r3, .L27+40
	movs	r2, #16
	bl	.L17
	movs	r3, #128
	lsls	r3, r3, #3
	adds	r6, r6, r3
	adds	r5, r5, r3
	ldr	r3, [sp, #20]
	cmp	r3, r6
	bne	.L22
	ldr	r3, [sp, #12]
	adds	r3, r3, #1
	str	r3, [sp, #12]
	ldr	r3, [sp, #4]
	adds	r3, r3, #64
	str	r3, [sp, #4]
.L25:
	ldr	r3, [sp, #12]
	ldrb	r6, [r3]
	cmp	r6, #0
	bne	.L23
	ldr	r3, .L27
	ldrh	r0, [r4, #50]
	bl	.L17
	movs	r3, #128
	lsls	r3, r3, #5
	adds	r7, r7, r3
	ldr	r3, .L27+44
	movs	r5, r0
	cmp	r7, r3
	bne	.L19
	ldr	r3, .L27+4
	bl	.L17
	movs	r3, #3
	strh	r3, [r4, #42]
	movs	r3, r4
	ldr	r2, [sp, #8]
	lsls	r5, r0, #24
	lsrs	r5, r5, #24
	adds	r3, r3, #52
	strb	r2, [r3]
	strb	r5, [r3, #1]
	ldr	r3, [sp, #16]
	lsls	r2, r3, #4
	movs	r3, #255
	movs	r1, #255
	movs	r7, #240
	lsls	r3, r3, #4
	ands	r3, r2
	ldr	r2, [sp, #16]
	ands	r2, r1
	subs	r2, r2, #1
	lsls	r2, r2, #2
	subs	r3, r3, r2
	subs	r3, r7, r3
	ands	r0, r1
	asrs	r3, r3, #1
	strh	r3, [r4, #44]
	lsls	r3, r0, #4
	subs	r0, r0, #1
	lsls	r0, r0, #2
	subs	r0, r3, r0
	subs	r7, r7, r0
	asrs	r7, r7, #1
	movs	r1, r4
	strh	r7, [r4, #46]
	ldr	r3, .L27+48
	ldr	r0, .L27+52
	bl	.L17
	movs	r3, r0
	adds	r3, r3, #41
	str	r0, [r4, #60]
	strb	r5, [r3]
	ldrh	r3, [r4, #46]
	adds	r0, r0, #42
	strh	r3, [r0, #2]
	strb	r6, [r0]
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L28:
	.align	2
.L27:
	.word	GetStringFromIndex
	.word	strlen
	.word	CopyToPaletteBuffer
	.word	memset
	.word	ClassReelLetterProcs
	.word	100745216
	.word	segmentTitleFont
	.word	Decompress
	.word	100728832
	.word	100749312
	.word	CpuFastSet
	.word	100737024
	.word	ProcStart
	.word	.LANCHOR0
	.size	CRE_segTitleInit, .-CRE_segTitleInit
	.align	1
	.global	CRE_reelInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_reelInit, %function
CRE_reelInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r3, r0
	@ sp needed
	movs	r4, r0
	movs	r5, #0
	ldr	r0, .L30
	adds	r3, r3, #41
	ldr	r7, .L30+4
	strb	r5, [r3]
	movs	r1, r4
	adds	r0, r0, #48
	bl	.L32
	ldr	r3, [r4, #44]
	ldr	r6, .L30+8
	ldrh	r3, [r3]
	movs	r1, r4
	strh	r3, [r0, #46]
	str	r0, [r4, #48]
	movs	r0, r6
	bl	.L32
	movs	r2, r0
	ldr	r3, [r4, #44]
	ldrb	r1, [r3, #2]
	adds	r2, r2, #41
	strb	r1, [r2]
	ldr	r3, [r3, #4]
	str	r3, [r0, #44]
	str	r0, [r4, #52]
	movs	r0, r6
	movs	r1, r4
	adds	r0, r0, #80
	bl	.L32
	movs	r3, r0
	adds	r3, r3, #41
	strb	r5, [r3]
	ldr	r3, [r4, #44]
	ldr	r3, [r3, #8]
	str	r3, [r0, #44]
	str	r0, [r4, #56]
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L31:
	.align	2
.L30:
	.word	.LANCHOR0
	.word	ProcStart
	.word	.LANCHOR1
	.size	CRE_reelInit, .-CRE_reelInit
	.align	1
	.global	CRE_init
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_init, %function
CRE_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r3, #0
	adds	r2, r2, #41
	strb	r3, [r2]
	strb	r3, [r2, #1]
	str	r3, [r0, #44]
	str	r3, [r0, #48]
	ldr	r3, .L35
	ldr	r1, .L35+4
	ldrh	r2, [r3, #24]
	ldrh	r5, [r3, #20]
	ands	r5, r1
	ands	r1, r2
	ldr	r2, .L35+8
	movs	r4, r0
	orrs	r2, r1
	ldr	r0, .L35+12
	movs	r1, r3
	orrs	r0, r5
	strh	r0, [r3, #20]
	movs	r0, #63
	adds	r1, r1, #60
	strh	r2, [r3, #24]
	ldrb	r2, [r1]
	ands	r2, r0
	strb	r2, [r1]
	movs	r2, #240
	movs	r6, #1
	strh	r2, [r3, #44]
	subs	r2, r2, #160
	strh	r2, [r3, #48]
	ldr	r1, .L35+16
	ldr	r2, [r3, #52]
	ands	r1, r2
	ldr	r2, .L35+20
	orrs	r2, r1
	str	r2, [r3, #52]
	ldr	r1, .L35+24
	ldrh	r2, [r3]
	ands	r1, r2
	ldr	r2, .L35+28
	orrs	r2, r1
	strh	r2, [r3]
	ldr	r2, .L35+32
	ldrb	r3, [r2]
	movs	r1, r4
	orrs	r3, r6
	ldr	r0, .L35+36
	ldr	r7, .L35+40
	strb	r3, [r2]
	bl	.L32
	ldr	r3, .L35+44
	adds	r3, r3, #65
	ldrb	r3, [r3]
	movs	r5, r3
	ands	r5, r6
	tst	r3, r6
	bne	.L33
	ldr	r0, .L35+48
	movs	r1, r4
	adds	r0, r0, #72
	bl	.L32
	movs	r3, r0
	adds	r3, r3, #41
	strb	r5, [r3]
	ldr	r3, .L35+52
	str	r3, [r0, #44]
.L33:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L36:
	.align	2
.L35:
	.word	gLCDIOBuffer
	.word	8432
	.word	-10231
	.word	-14335
	.word	-4128832
	.word	4128819
	.word	-16136
	.word	12290
	.word	extraRAMBitfield
	.word	CRE_keylistener_Proc
	.word	ProcStart
	.word	gChapterData
	.word	.LANCHOR2
	.word	musicStruct
	.size	CRE_init, .-CRE_init
	.align	1
	.global	CRE_segTitleDrawFirstChar
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segTitleDrawFirstChar, %function
CRE_segTitleDrawFirstChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L38
	@ sp needed
	movs	r1, #0
	bl	.L17
	ldr	r3, .L38+4
	str	r0, [r3]
	pop	{r4}
	pop	{r0}
	bx	r0
.L39:
	.align	2
.L38:
	.word	opinfoview2_Start
	.word	ClassReelLetterProcs
	.size	CRE_segTitleDrawFirstChar, .-CRE_segTitleDrawFirstChar
	.align	1
	.global	CRE_segTitleDrawChars
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segTitleDrawChars, %function
CRE_segTitleDrawChars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r0
	push	{r4, r5, r6, lr}
	ldrh	r3, [r0, #42]
	adds	r2, r2, #52
	lsrs	r5, r3, #1
	ldrb	r2, [r2]
	lsls	r5, r5, #24
	movs	r4, r0
	lsrs	r5, r5, #24
	cmp	r2, r5
	bhi	.L41
	movs	r3, #0
	strh	r3, [r0, #42]
	ldr	r3, .L47
	bl	.L17
.L40:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L41:
	lsls	r3, r3, #31
	bpl	.L43
	movs	r1, r5
	ldr	r3, .L47+4
	bl	.L17
	ldr	r3, .L47+8
	lsls	r5, r5, #2
	str	r0, [r3, r5]
.L43:
	ldrh	r3, [r4, #42]
	adds	r3, r3, #1
	strh	r3, [r4, #42]
	b	.L40
.L48:
	.align	2
.L47:
	.word	BreakProcLoop
	.word	opinfoview2_Start
	.word	ClassReelLetterProcs
	.size	CRE_segTitleDrawChars, .-CRE_segTitleDrawChars
	.align	1
	.global	CRE_segSubtitleInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segSubtitleInit, %function
CRE_segSubtitleInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, [r0, #60]
	@ sp needed
	movs	r4, r0
	ldr	r5, .L50
	ldr	r0, .L50+4
	bl	.L52
	movs	r3, r0
	movs	r2, #2
	adds	r3, r3, #41
	strb	r2, [r3]
	movs	r3, #255
	lsls	r3, r3, #1
	strh	r3, [r0, #42]
	ldr	r3, .L50+8
	str	r3, [r0, #44]
	movs	r3, #8
	adds	r0, r0, #49
	strb	r3, [r0]
	ldr	r0, .L50+12
	ldr	r1, [r4, #60]
	bl	.L52
	movs	r3, r0
	movs	r2, #1
	adds	r3, r3, #41
	strb	r2, [r3]
	ldr	r3, .L50+16
	strh	r3, [r0, #42]
	movs	r3, #240
	lsls	r3, r3, #20
	str	r3, [r0, #44]
	movs	r3, #13
	adds	r0, r0, #49
	strb	r3, [r0]
	ldr	r3, .L50+20
	ldr	r0, [r4, #60]
	bl	.L17
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L51:
	.align	2
.L50:
	.word	ProcStart
	.word	Procs_Blend
	.word	268443712
	.word	Procs_Mosaic
	.word	-16384
	.word	BreakProcLoop
	.size	CRE_segSubtitleInit, .-CRE_segSubtitleInit
	.align	1
	.global	CRE_segSubtitleEnd
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segSubtitleEnd, %function
CRE_segSubtitleEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, [r0, #60]
	@ sp needed
	movs	r4, r0
	ldr	r5, .L54
	ldr	r0, .L54+4
	bl	.L52
	movs	r3, r0
	movs	r2, #255
	adds	r3, r3, #41
	strb	r2, [r3]
	movs	r3, #2
	adds	r3, r3, #255
	strh	r3, [r0, #42]
	ldr	r3, .L54+8
	str	r3, [r0, #44]
	movs	r3, #16
	adds	r0, r0, #49
	strb	r3, [r0]
	ldr	r0, .L54+12
	ldr	r1, [r4, #60]
	bl	.L52
	movs	r3, r0
	movs	r2, #2
	adds	r3, r3, #41
	strb	r2, [r3]
	movs	r3, #0
	strh	r3, [r0, #42]
	movs	r3, #128
	lsls	r3, r3, #17
	str	r3, [r0, #44]
	movs	r3, #13
	adds	r0, r0, #49
	strb	r3, [r0]
	ldr	r3, .L54+16
	ldr	r0, [r4, #60]
	bl	.L17
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L55:
	.align	2
.L54:
	.word	ProcStart
	.word	Procs_Blend
	.word	1056832
	.word	Procs_Mosaic
	.word	BreakProcLoop
	.size	CRE_segSubtitleEnd, .-CRE_segSubtitleEnd
	.align	1
	.global	CRE_segTitleRemoveChars
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segTitleRemoveChars, %function
CRE_segTitleRemoveChars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrh	r3, [r0, #42]
	movs	r4, r0
	lsls	r2, r3, #31
	bpl	.L57
	movs	r2, r0
	adds	r2, r2, #52
	ldrb	r1, [r2]
	lsrs	r3, r3, #1
	ldr	r2, .L63
	cmp	r1, r3
	bhi	.L58
	bl	.L65
.L56:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L58:
	ldr	r1, .L63+4
	lsls	r3, r3, #2
	ldr	r0, [r3, r1]
	bl	.L65
.L57:
	ldrh	r3, [r4, #42]
	adds	r3, r3, #1
	strh	r3, [r4, #42]
	b	.L56
.L64:
	.align	2
.L63:
	.word	BreakProcLoop
	.word	ClassReelLetterProcs
	.size	CRE_segTitleRemoveChars, .-CRE_segTitleRemoveChars
	.align	1
	.global	CRE_SMSLoop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_SMSLoop, %function
CRE_SMSLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldrh	r3, [r0, #42]
	adds	r3, r3, #1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r0, #42]
	cmp	r3, #68
	beq	.L67
	bhi	.L68
	cmp	r3, #32
	beq	.L67
	cmp	r3, #36
	beq	.L70
.L66:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L68:
	cmp	r3, #72
	beq	.L72
	cmp	r3, #104
	bne	.L66
	movs	r3, #0
	strh	r3, [r0, #42]
	ldr	r3, .L75
	bl	.L17
	b	.L66
.L70:
	ldr	r3, [r0, #48]
	ldr	r2, .L75+4
.L74:
	strh	r2, [r3, #46]
	b	.L66
.L67:
	ldr	r3, [r0, #48]
	ldr	r2, .L75+8
	b	.L74
.L72:
	movs	r2, #232
	ldr	r3, [r0, #48]
	lsls	r2, r2, #6
	b	.L74
.L76:
	.align	2
.L75:
	.word	BreakProcLoop
	.word	14864
	.word	14856
	.size	CRE_SMSLoop, .-CRE_SMSLoop
	.align	1
	.global	CRE_waitUntilFinished
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_waitUntilFinished, %function
CRE_waitUntilFinished:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L79
	ldr	r3, [r3, #20]
	ldrh	r2, [r3, #14]
	ldr	r3, .L79+4
	cmp	r2, r3
	bls	.L77
	ldr	r3, .L79+8
	bl	.L17
.L77:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L80:
	.align	2
.L79:
	.word	gAISBuffer
	.word	65533
	.word	BreakProcLoop
	.size	CRE_waitUntilFinished, .-CRE_waitUntilFinished
	.align	1
	.global	CRE_titleRemoveChars
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_titleRemoveChars, %function
CRE_titleRemoveChars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldrh	r3, [r0, #42]
	movs	r4, r0
	lsls	r2, r3, #31
	bpl	.L82
	movs	r2, r0
	adds	r2, r2, #48
	ldrb	r1, [r2]
	lsrs	r3, r3, #1
	ldr	r2, .L88
	cmp	r1, r3
	bhi	.L83
	bl	.L65
.L81:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L83:
	ldr	r1, .L88+4
	lsls	r3, r3, #2
	ldr	r0, [r3, r1]
	bl	.L65
.L82:
	ldrh	r3, [r4, #42]
	adds	r3, r3, #1
	strh	r3, [r4, #42]
	b	.L81
.L89:
	.align	2
.L88:
	.word	BreakProcLoop
	.word	ClassReelLetterProcs
	.size	CRE_titleRemoveChars, .-CRE_titleRemoveChars
	.align	1
	.global	CRE_waitForChildren
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_waitForChildren, %function
CRE_waitForChildren:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	push	{r4, lr}
	cmp	r3, #0
	bne	.L90
	ldr	r3, .L92
	bl	.L17
.L90:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L93:
	.align	2
.L92:
	.word	BreakProcLoop
	.size	CRE_waitForChildren, .-CRE_waitForChildren
	.align	1
	.global	CRE_LoopBar
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_LoopBar, %function
CRE_LoopBar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	adds	r0, r0, #42
	ldrb	r7, [r0]
	cmp	r7, #11
	bhi	.L98
	adds	r3, r7, #1
	strb	r3, [r0]
.L95:
	movs	r0, #14
	movs	r3, #226
	ldr	r6, .L99
	subs	r0, r0, r7
	ldr	r4, .L99+4
	movs	r2, r6
	movs	r1, #76
	lsls	r0, r0, #3
	lsls	r3, r3, #2
	bl	.L101
	movs	r0, r7
	movs	r3, #128
	adds	r0, r0, #15
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	lsls	r3, r3, #5
	lsls	r0, r0, #3
	orrs	r0, r3
	movs	r3, #226
	movs	r2, r6
	lsls	r3, r3, #2
	movs	r1, #76
	bl	.L101
	movs	r4, #15
	subs	r4, r4, r7
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	lsls	r3, r4, #3
	adds	r7, r7, #14
	lsls	r7, r7, #24
	str	r3, [sp, #4]
	lsrs	r7, r7, #24
.L96:
	cmp	r4, r7
	bls	.L97
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L98:
	movs	r7, #12
	b	.L95
.L97:
	ldr	r3, .L99+8
	movs	r2, r6
	movs	r1, #76
	ldr	r0, [sp, #4]
	ldr	r5, .L99+4
	bl	.L52
	ldr	r3, [sp, #4]
	adds	r4, r4, #1
	lsls	r4, r4, #24
	adds	r3, r3, #8
	str	r3, [sp, #4]
	lsrs	r4, r4, #24
	b	.L96
.L100:
	.align	2
.L99:
	.word	gObj_8x8
	.word	PushToHiOAM
	.word	905
	.size	CRE_LoopBar, .-CRE_LoopBar
	.align	1
	.global	CRE_segSubtitleDrawChars
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segSubtitleDrawChars, %function
CRE_segSubtitleDrawChars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r4, r0
	bl	CRE_LoopBar
	movs	r3, r4
	adds	r3, r3, #41
	ldrb	r3, [r3]
	str	r3, [sp, #4]
	movs	r6, #12
	movs	r3, #44
	ldrsh	r5, [r4, r3]
	movs	r4, #0
.L103:
	ldr	r3, [sp, #4]
	cmp	r3, r4
	bgt	.L104
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L104:
	movs	r2, #136
	movs	r0, r6
	muls	r0, r4
	lsls	r3, r4, #1
	lsls	r2, r2, #4
	adds	r3, r3, r2
	ldr	r1, .L105
	ldr	r2, .L105+4
	ldr	r7, .L105+8
	adds	r0, r0, r5
	bl	.L32
	adds	r4, r4, #1
	b	.L103
.L106:
	.align	2
.L105:
	.word	5204
	.word	gObj_16x32
	.word	PushToHiOAM
	.size	CRE_segSubtitleDrawChars, .-CRE_segSubtitleDrawChars
	.align	1
	.global	CRE_loopDrawBGSprites
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_loopDrawBGSprites, %function
CRE_loopDrawBGSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r1, #0
	movs	r3, #128
	push	{r4, lr}
	movs	r0, r1
	@ sp needed
	ldr	r2, .L108
	ldr	r4, .L108+4
	lsls	r3, r3, #1
	bl	.L101
	pop	{r4}
	pop	{r0}
	bx	r0
.L109:
	.align	2
.L108:
	.word	ClassReelBGOAM
	.word	PushToHiOAM
	.size	CRE_loopDrawBGSprites, .-CRE_loopDrawBGSprites
	.align	1
	.global	CRE_increaseMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_increaseMosaic, %function
CRE_increaseMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r1, r0
	push	{r4, lr}
	ldr	r3, .L111
	@ sp needed
	ldr	r0, .L111+4
	bl	.L17
	movs	r3, r0
	movs	r2, #1
	adds	r3, r3, #41
	strb	r2, [r3]
	movs	r3, #0
	strh	r3, [r0, #42]
	ldr	r3, .L111+8
	str	r3, [r0, #44]
	movs	r3, #6
	adds	r0, r0, #49
	strb	r3, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L112:
	.align	2
.L111:
	.word	ProcStartBlocking
	.word	Procs_Mosaic
	.word	16842752
	.size	CRE_increaseMosaic, .-CRE_increaseMosaic
	.align	1
	.global	CRE_decreaseMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_decreaseMosaic, %function
CRE_decreaseMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r1, r0
	push	{r4, lr}
	ldr	r3, .L114
	@ sp needed
	ldr	r0, .L114+4
	bl	.L17
	movs	r3, r0
	movs	r2, #1
	adds	r3, r3, #41
	strb	r2, [r3]
	ldr	r3, .L114+8
	ldrh	r3, [r3, #56]
	strh	r3, [r0, #42]
	ldr	r3, .L114+12
	str	r3, [r0, #44]
	movs	r3, #6
	adds	r0, r0, #49
	strb	r3, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L115:
	.align	2
.L114:
	.word	ProcStartBlocking
	.word	Procs_Mosaic
	.word	gLCDIOBuffer
	.word	252641280
	.size	CRE_decreaseMosaic, .-CRE_decreaseMosaic
	.align	1
	.global	CRE_createAuthChild
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_createAuthChild, %function
CRE_createAuthChild:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r1
	push	{r4, r5, r6, lr}
	movs	r5, r1
	adds	r2, r2, #41
	ldrb	r3, [r2]
	movs	r4, r0
	ldr	r0, [r5, #44]
	lsls	r1, r3, #2
	ldr	r1, [r1, r0]
	movs	r0, #1
	cmp	r1, #0
	beq	.L116
	adds	r3, r3, r0
	ldr	r0, .L121
	strb	r3, [r2]
	movs	r1, r5
	ldr	r3, .L121+4
	adds	r0, r0, #8
	bl	.L17
	movs	r3, r0
	movs	r2, #0
	adds	r3, r3, #41
	strb	r2, [r3]
	adds	r2, r4, #5
	strb	r2, [r3, #7]
	movs	r2, #132
	lsls	r3, r4, #4
	lsls	r2, r2, #3
	adds	r3, r3, r2
	strh	r3, [r0, #42]
	movs	r2, #172
	movs	r3, #16
	lsls	r2, r2, #6
	strh	r3, [r0, #44]
	lsls	r3, r4, #6
	lsls	r4, r4, #2
	adds	r3, r3, r2
	adds	r4, r5, r4
	strh	r3, [r0, #46]
	ldr	r1, .L121+8
	str	r0, [r4, #48]
.L118:
	cmp	r5, r4
	bne	.L119
	ldr	r3, .L121+12
	movs	r1, r5
	ldr	r0, .L121+16
	bl	.L17
	movs	r3, r0
	movs	r2, #1
	adds	r3, r3, #41
	strb	r2, [r3]
	ldr	r3, .L121+20
	strh	r3, [r0, #42]
	ldr	r3, .L121+24
	str	r3, [r0, #44]
	movs	r3, #16
	adds	r0, r0, #49
	strb	r3, [r0]
	movs	r0, #0
.L116:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L119:
	ldr	r2, [r4, #44]
	ldrh	r3, [r2, #42]
	ands	r3, r1
	strh	r3, [r2, #42]
	subs	r4, r4, #4
	b	.L118
.L122:
	.align	2
.L121:
	.word	.LANCHOR3
	.word	ProcStart
	.word	-1025
	.word	ProcStartBlocking
	.word	Procs_Blend
	.word	511
	.word	268443712
	.size	CRE_createAuthChild, .-CRE_createAuthChild
	.align	1
	.global	CRE_blendOutAuth
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_blendOutAuth, %function
CRE_blendOutAuth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r3, r0
	movs	r4, r0
	movs	r6, #128
	movs	r1, r0
	movs	r5, #0
	adds	r3, r3, #48
	adds	r4, r4, #60
	lsls	r6, r6, #3
.L125:
	ldr	r2, [r3]
	cmp	r2, #0
	beq	.L124
	ldrh	r0, [r2, #42]
	orrs	r0, r6
	strh	r0, [r2, #42]
	stmia	r3!, {r5}
	cmp	r3, r4
	bne	.L125
.L124:
	@ sp needed
	ldr	r3, .L130
	ldr	r0, .L130+4
	bl	.L17
	movs	r3, r0
	movs	r2, #255
	adds	r3, r3, #41
	strb	r2, [r3]
	movs	r3, #2
	adds	r3, r3, #255
	strh	r3, [r0, #42]
	ldr	r3, .L130+8
	str	r3, [r0, #44]
	movs	r3, #16
	adds	r0, r0, #49
	strb	r3, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L131:
	.align	2
.L130:
	.word	ProcStartBlocking
	.word	Procs_Blend
	.word	1056832
	.size	CRE_blendOutAuth, .-CRE_blendOutAuth
	.align	1
	.global	CRE_segmentTitleInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segmentTitleInit, %function
CRE_segmentTitleInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r0
	@ sp needed
	ldr	r0, .L133
	movs	r1, r4
	ldr	r3, .L133+4
	adds	r0, r0, #48
	bl	.L17
	movs	r3, #88
	adds	r4, r4, #41
	ldrb	r2, [r4]
	muls	r3, r2
	ldr	r2, .L133+8
	adds	r3, r3, r2
	ldr	r2, [r3]
	ldr	r3, [r3, #4]
	str	r2, [r0, #48]
	str	r3, [r0, #56]
	pop	{r4}
	pop	{r0}
	bx	r0
.L134:
	.align	2
.L133:
	.word	.LANCHOR3
	.word	ProcStartBlocking
	.word	creditStruct
	.size	CRE_segmentTitleInit, .-CRE_segmentTitleInit
	.align	1
	.global	CRE_end
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_end, %function
CRE_end:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L136
	push	{r4, lr}
	ldr	r3, .L136+4
	@ sp needed
	adds	r0, r0, #72
	bl	.L17
	movs	r1, #32
	ldr	r2, .L136+8
	ldrb	r3, [r2, #1]
	bics	r3, r1
	strb	r3, [r2, #1]
	ldr	r2, .L136+12
	ldrb	r3, [r2]
	subs	r1, r1, #31
	bics	r3, r1
	strb	r3, [r2]
	pop	{r4}
	pop	{r0}
	bx	r0
.L137:
	.align	2
.L136:
	.word	.LANCHOR2
	.word	EndEachProc
	.word	gLCDIOBuffer
	.word	extraRAMBitfield
	.size	CRE_end, .-CRE_end
	.align	1
	.global	CRE_traverseM7Loop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_traverseM7Loop, %function
CRE_traverseM7Loop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r5, [r0, #48]
	ldr	r3, [r5, #12]
	movs	r4, r0
	sub	sp, sp, #36
	adds	r2, r3, #1
	bne	.L139
	ldr	r3, .L157
	bl	.L17
.L138:
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L139:
	movs	r2, #1
	movs	r6, r3
	ands	r6, r2
	tst	r3, r2
	beq	.L141
	adds	r5, r5, #16
	str	r5, [r0, #48]
	b	.L138
.L141:
	ldr	r3, .L157+4
	ldr	r3, [r3]
	ldr	r7, [r3]
	ldr	r1, [r5]
	ldr	r0, [r7, #44]
	str	r3, [sp, #4]
	ldr	r2, [r5, #8]
	ldr	r3, [r7, #52]
	cmp	r0, r1
	bne	.L142
	subs	r3, r3, r2
	asrs	r2, r3, #31
	adds	r3, r3, r2
.L156:
	eors	r3, r2
	str	r3, [sp]
.L143:
	ldr	r3, [sp]
	ldr	r2, [r5, #4]
	str	r3, [sp, #20]
	ldr	r3, [r7, #48]
	subs	r3, r3, r2
	asrs	r2, r3, #31
	adds	r3, r3, r2
	eors	r3, r2
	str	r3, [sp, #24]
	ldr	r3, [sp]
	str	r3, [sp, #28]
.L146:
	add	r3, sp, #20
	ldr	r3, [r6, r3]
	str	r3, [sp, #8]
	cmp	r3, #0
	beq	.L145
	ldr	r0, .L157+8
	movs	r1, r4
	ldr	r3, .L157+12
	adds	r0, r0, #24
	bl	.L17
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	movs	r7, r3
	adds	r7, r7, #44
	adds	r7, r7, r6
	str	r3, [sp, #12]
	ldr	r3, [r7]
	str	r3, [r0, #44]
	ldr	r3, [r4, #48]
	ldr	r3, [r3, r6]
	str	r3, [r0, #48]
	movs	r3, #0
	movs	r5, r0
	str	r3, [r0, #52]
	movs	r1, #128
	ldr	r0, [sp, #8]
	ldr	r3, .L157+16
	bl	.L17
	str	r7, [r5, #60]
	str	r0, [r5, #56]
.L145:
	adds	r6, r6, #4
	cmp	r6, #12
	bne	.L146
	ldr	r3, [sp]
	cmp	r3, #0
	beq	.L147
	ldr	r5, .L157+8
	adds	r5, r5, #56
	movs	r0, r5
	ldr	r3, .L157+20
	bl	.L17
	movs	r1, r4
	movs	r0, r5
	ldr	r3, .L157+24
	bl	.L17
	ldr	r3, [sp, #4]
	ldr	r3, [r3]
	ldr	r2, [r4, #48]
	ldr	r6, [r3, #60]
	ldr	r1, [r3, #44]
	movs	r5, r0
	str	r6, [r0, #44]
	ldr	r0, [r2]
	subs	r1, r1, r0
	asrs	r0, r1, #31
	adds	r1, r1, r0
	eors	r1, r0
	ldr	r0, [r3, #52]
	ldr	r3, [r2, #8]
	subs	r0, r0, r3
	asrs	r3, r0, #31
	subs	r0, r3, r0
	eors	r0, r3
	ldr	r3, .L157+28
	bl	.L17
	movs	r2, #0
	asrs	r0, r0, #8
	str	r0, [r5, #48]
	subs	r0, r0, r6
	asrs	r3, r0, #31
	adds	r0, r0, r3
	eors	r0, r3
	movs	r1, #1
	str	r2, [r5, #52]
	ldr	r3, .L157+16
	bl	.L17
	str	r0, [r5, #56]
.L147:
	ldr	r3, [r4, #48]
	adds	r3, r3, #16
	str	r3, [r4, #48]
	b	.L138
.L142:
	subs	r0, r0, r1
	cmp	r3, r2
	bne	.L144
	asrs	r2, r0, #31
	adds	r3, r0, r2
	b	.L156
.L144:
	subs	r3, r3, r2
	movs	r2, r0
	muls	r2, r0
	movs	r0, r2
	movs	r2, r3
	muls	r2, r3
	ldr	r3, .L157+32
	adds	r0, r0, r2
	bl	.L17
	str	r0, [sp]
	b	.L143
.L158:
	.align	2
.L157:
	.word	BreakProcLoop
	.word	m7World
	.word	.LANCHOR4
	.word	ProcStartBlocking
	.word	Div
	.word	EndEachProc
	.word	ProcStart
	.word	ArcTan2
	.word	Sqrt
	.size	CRE_traverseM7Loop, .-CRE_traverseM7Loop
	.align	1
	.global	CRE_moveCam
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_moveCam, %function
CRE_moveCam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	ldr	r3, [r0, #52]
	ldr	r2, [r0, #56]
	adds	r3, r3, #1
	str	r3, [r0, #52]
	ldr	r5, [r0, #60]
	str	r2, [sp]
	movs	r4, r0
	ldr	r2, [r0, #48]
	ldr	r1, [r0, #44]
	ldr	r6, .L161
	movs	r0, #0
	bl	.L163
	str	r0, [r5]
	ldr	r3, [r4, #52]
	ldr	r2, [r4, #56]
	cmp	r3, r2
	blt	.L159
	movs	r0, r4
	ldr	r3, .L161+4
	bl	.L17
.L159:
	@ sp needed
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L162:
	.align	2
.L161:
	.word	GetValueFromEasingFunction
	.word	BreakProcLoop
	.size	CRE_moveCam, .-CRE_moveCam
	.align	1
	.global	CRE_spriteMoveIn
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteMoveIn, %function
CRE_spriteMoveIn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	movs	r2, r0
	ldrh	r3, [r0, #42]
	adds	r3, r3, #1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	strh	r3, [r0, #42]
	adds	r2, r2, #41
	ldrb	r2, [r2]
	movs	r4, r0
	cmp	r2, #1
	beq	.L165
	cmp	r2, #2
	beq	.L166
	cmp	r2, #0
	bne	.L164
	cmp	r3, #30
	bls	.L168
	strh	r2, [r0, #42]
	ldr	r3, .L173
	bl	.L17
	movs	r1, r4
	ldr	r0, .L173+4
	ldr	r3, .L173+8
	bl	.L17
.L171:
	ldr	r3, [r4, #44]
	str	r3, [r0, #44]
	ldr	r3, [r4, #48]
	str	r3, [r0, #48]
	b	.L164
.L168:
	movs	r2, #30
	movs	r1, #130
	str	r2, [sp]
	lsls	r1, r1, #1
	adds	r2, r2, #130
.L172:
	movs	r0, #5
	ldr	r5, .L173+12
	bl	.L52
	ldr	r2, [r4, #48]
	ldrh	r3, [r2, #44]
	lsls	r0, r0, #23
	lsrs	r3, r3, #9
	lsls	r3, r3, #9
	lsrs	r0, r0, #23
	orrs	r3, r0
	strh	r3, [r2, #44]
	b	.L164
.L165:
	cmp	r3, #29
	bls	.L169
	movs	r5, #0
	ldr	r3, .L173
	strh	r5, [r0, #42]
	bl	.L17
	ldr	r3, .L173+8
	movs	r1, r4
	ldr	r0, .L173+16
	bl	.L17
	movs	r3, r0
	adds	r3, r3, #41
	strb	r5, [r3]
	ldr	r3, [r4, #44]
	str	r3, [r0, #44]
.L164:
	@ sp needed
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L169:
	movs	r2, #30
	movs	r1, #144
	str	r2, [sp]
	movs	r0, #5
	ldr	r4, .L173+12
	adds	r2, r2, #162
	lsls	r1, r1, #1
	bl	.L101
	ldr	r3, .L173+20
	ldr	r3, [r3]
	strh	r0, [r3, #52]
	b	.L164
.L166:
	cmp	r3, #29
	bls	.L170
	movs	r5, #0
	ldr	r3, .L173
	strh	r5, [r0, #42]
	bl	.L17
	ldr	r0, .L173+24
	ldr	r3, .L173+8
	movs	r1, r4
	adds	r0, r0, #88
	bl	.L17
	movs	r3, r0
	adds	r3, r3, #41
	strb	r5, [r3]
	b	.L171
.L170:
	ldr	r2, [r0, #44]
	movs	r1, #12
	ldrsh	r2, [r2, r1]
	movs	r1, #30
	str	r1, [sp]
	adds	r1, r1, #210
	b	.L172
.L174:
	.align	2
.L173:
	.word	BreakProcLoop
	.word	CRE_classSprite_Proc
	.word	ProcStartBlocking
	.word	GetValueFromEasingFunction
	.word	CRE_portraitSprite_Proc
	.word	gpFaceProcs
	.word	.LANCHOR4
	.size	CRE_spriteMoveIn, .-CRE_spriteMoveIn
	.align	1
	.global	CRE_spriteMoveOut
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteMoveOut, %function
CRE_spriteMoveOut:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	ldrh	r3, [r0, #42]
	adds	r3, r3, #1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	movs	r4, r0
	strh	r3, [r0, #42]
	cmp	r3, #30
	bls	.L176
	movs	r3, #0
	strh	r3, [r0, #42]
	ldr	r3, .L180
	bl	.L17
.L175:
	@ sp needed
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L176:
	movs	r2, r0
	adds	r2, r2, #41
	ldrb	r2, [r2]
	cmp	r2, #1
	beq	.L178
	cmp	r2, #2
	beq	.L179
	cmp	r2, #0
	bne	.L175
	ldr	r2, [r0, #44]
	movs	r1, #14
	ldrsh	r1, [r2, r1]
	movs	r0, #30
	movs	r2, r1
	str	r0, [sp]
	adds	r2, r2, #100
	ldr	r4, .L180+4
	subs	r0, r0, #27
	bl	.L101
	ldr	r3, .L180+8
	lsls	r0, r0, #16
	ldr	r2, [r3, #20]
	asrs	r0, r0, #16
	strh	r0, [r2, #2]
	ldr	r2, [r3, #24]
	strh	r0, [r2, #2]
	strh	r0, [r3, #2]
	b	.L175
.L178:
	movs	r2, #30
	str	r2, [sp]
	adds	r2, r2, #3
	movs	r1, #192
	movs	r0, #3
	ldr	r4, .L180+4
	adds	r2, r2, #255
	bl	.L101
	ldr	r3, .L180+12
	ldr	r3, [r3]
	strh	r0, [r3, #52]
	b	.L175
.L179:
	ldr	r2, [r0, #44]
	movs	r1, #12
	ldrsh	r1, [r2, r1]
	movs	r2, #30
	movs	r0, #3
	str	r2, [sp]
	ldr	r5, .L180+4
	adds	r2, r2, #210
	bl	.L52
	ldr	r2, [r4, #48]
	ldrh	r3, [r2, #44]
	lsls	r0, r0, #23
	lsrs	r3, r3, #9
	lsls	r3, r3, #9
	lsrs	r0, r0, #23
	orrs	r3, r0
	strh	r3, [r2, #44]
	b	.L175
.L181:
	.align	2
.L180:
	.word	BreakProcLoop
	.word	GetValueFromEasingFunction
	.word	gAISBuffer
	.word	gpFaceProcs
	.size	CRE_spriteMoveOut, .-CRE_spriteMoveOut
	.align	1
	.global	CRE_rotateCam
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_rotateCam, %function
CRE_rotateCam:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	movs	r4, r0
	ldr	r3, [r0, #52]
	ldr	r2, [r0, #56]
	adds	r3, r3, #1
	str	r3, [r0, #52]
	str	r2, [sp]
	ldr	r5, .L184
	ldr	r2, [r0, #48]
	ldr	r1, [r0, #44]
	movs	r0, #1
	bl	.L52
	ldr	r3, .L184+4
	ldr	r3, [r3]
	ldr	r3, [r3]
	ldr	r1, [r3, #56]
	ldr	r3, .L184+8
	bl	.L17
	ldr	r3, [r4, #52]
	ldr	r2, [r4, #56]
	cmp	r3, r2
	blt	.L182
	movs	r0, r4
	ldr	r3, .L184+12
	bl	.L17
.L182:
	@ sp needed
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L185:
	.align	2
.L184:
	.word	GetValueFromEasingFunction
	.word	m7World
	.word	m7Rotate
	.word	BreakProcLoop
	.size	CRE_rotateCam, .-CRE_rotateCam
	.align	1
	.global	CRE_MMSLoop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_MMSLoop, %function
CRE_MMSLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldrh	r4, [r0, #42]
	adds	r4, r4, #1
	lsls	r4, r4, #16
	lsrs	r4, r4, #16
	strh	r4, [r0, #42]
	cmp	r4, #96
	beq	.L198
	bhi	.L188
	cmp	r4, #52
	bne	.LCB1924
	b	.L199	@long jump
.LCB1924:
	bhi	.L189
	cmp	r4, #20
	bne	.LCB1928
	b	.L200	@long jump
.LCB1928:
	bhi	.L190
	cmp	r4, #1
	beq	.L191
	cmp	r4, #14
	bne	.LCB1934
	b	.L201	@long jump
.LCB1934:
.L186:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L190:
	cmp	r4, #33
	beq	.L202
	cmp	r4, #39
	bne	.L186
.L203:
	movs	r4, #16
	movs	r5, #8
	b	.L187
.L189:
	cmp	r4, #77
	beq	.L204
	bhi	.L193
	cmp	r4, #58
	beq	.L205
	cmp	r4, #71
	bne	.L186
	movs	r4, #6
	b	.L217
.L193:
	cmp	r4, #90
	bne	.L186
	movs	r4, #10
	movs	r5, #18
	b	.L187
.L188:
	cmp	r4, #172
	beq	.L216
	bhi	.L194
	cmp	r4, #128
	beq	.L215
	bhi	.L195
	cmp	r4, #109
	beq	.L210
	cmp	r4, #115
	bne	.L186
	movs	r4, #8
	movs	r5, #16
	b	.L187
.L195:
	cmp	r4, #148
	beq	.L216
	cmp	r4, #152
	bne	.L186
.L214:
	movs	r4, #28
	b	.L217
.L194:
	cmp	r4, #200
	beq	.L214
	bhi	.L196
	cmp	r4, #176
	beq	.L215
	cmp	r4, #196
	bne	.L186
.L216:
	movs	r4, #26
	b	.L217
.L196:
	cmp	r4, #219
	bne	.L186
	movs	r4, #0
	ldr	r3, .L218
	strh	r4, [r0, #42]
	bl	.L17
	ldr	r2, .L218+4
	ldr	r1, .L218+8
	ldr	r3, .L218+12
	add	r0, sp, #4
	str	r4, [sp, #4]
	bl	.L17
	b	.L186
.L191:
	ldr	r3, [r0, #48]
	ldr	r2, .L218+16
	strh	r2, [r3, #46]
	b	.L203
.L198:
	movs	r4, #12
	movs	r5, #20
.L187:
	movs	r3, #4
	ldr	r7, .L218+8
	lsls	r5, r5, #8
	ldr	r6, .L218+20
	adds	r0, r5, r7
	movs	r2, r3
	ldr	r1, .L218+24
	bl	.L163
	movs	r3, #4
	lsls	r4, r4, #24
	lsrs	r4, r4, #16
	adds	r0, r4, r7
	movs	r2, r3
	ldr	r1, .L218+28
	bl	.L163
	movs	r3, #4
	ldr	r7, .L218+32
	movs	r2, r3
	adds	r0, r5, r7
	ldr	r1, .L218+36
	bl	.L163
	movs	r3, #4
	ldr	r1, .L218+40
	movs	r2, r3
	adds	r0, r4, r7
	bl	.L163
	b	.L186
.L199:
	movs	r4, #2
.L217:
	movs	r5, r4
	b	.L187
.L200:
	movs	r5, #12
	b	.L187
.L201:
	movs	r4, #18
	movs	r5, #10
	b	.L187
.L202:
	movs	r4, #22
	movs	r5, #14
	b	.L187
.L204:
	movs	r4, #0
	b	.L217
.L205:
	movs	r4, #4
	b	.L217
.L210:
	movs	r4, #14
	movs	r5, #22
	b	.L187
.L215:
	movs	r4, #24
	b	.L217
.L219:
	.align	2
.L218:
	.word	BreakProcLoop
	.word	16781312
	.word	gSMSGfxBuffer_Frame1
	.word	CpuFastSet
	.word	14872
	.word	CopyTileGfxForObj
	.word	100745984
	.word	100746112
	.word	gSMSGfxBuffer_Frame2
	.word	100750080
	.word	100750208
	.size	CRE_MMSLoop, .-CRE_MMSLoop
	.align	1
	.global	CRE_titleInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_titleInit, %function
CRE_titleInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L224
	movs	r4, r0
	ldrh	r0, [r0, #46]
	bl	.L17
	movs	r2, #80
	movs	r5, r0
	movs	r1, #0
	ldr	r0, .L224+4
	ldr	r3, .L224+8
	bl	.L17
	movs	r6, #0
.L221:
	ldrb	r3, [r5, r6]
	cmp	r3, #0
	bne	.L223
	@ sp needed
	strh	r3, [r4, #42]
	adds	r3, r3, #2
	movs	r0, r5
	strh	r3, [r4, #44]
	ldr	r3, .L224+12
	bl	.L17
	adds	r4, r4, #48
	strb	r0, [r4]
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L223:
	ldr	r2, .L224+16
	lsls	r3, r3, #2
	ldr	r0, [r3, r2]
	cmp	r0, #0
	bne	.L222
	adds	r2, r2, #252
	ldr	r0, [r2, #100]
.L222:
	ldr	r7, .L224+20
	ldr	r3, .L224+24
	movs	r1, r7
	bl	.L17
	ldr	r3, .L224+28
	lsls	r1, r6, #6
	movs	r0, r7
	adds	r1, r1, r3
	movs	r2, #2
	movs	r3, #4
	ldr	r7, .L224+32
	bl	.L32
	adds	r6, r6, #1
	b	.L221
.L225:
	.align	2
.L224:
	.word	GetStringFromIndex
	.word	ClassReelLetterProcs
	.word	memset
	.word	strlen
	.word	op_class_font_address
	.word	gGenericBuffer
	.word	Decompress
	.word	100728832
	.word	CopyTileGfxForObj
	.size	CRE_titleInit, .-CRE_titleInit
	.align	1
	.global	CRE_setOtherVariant
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_setOtherVariant, %function
CRE_setOtherVariant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r3, [r5]
	ldr	r2, [r0, #44]
	lsls	r3, r3, #4
	adds	r3, r2, r3
	ldr	r2, [r3, #4]
	movs	r4, r0
	cmp	r2, #0
	beq	.L227
	ldr	r1, [r0, #48]
	str	r2, [r1, #48]
.L227:
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L228
	ldr	r6, .L239
	ldr	r3, .L239+4
	movs	r1, r6
	bl	.L17
	movs	r2, #128
	movs	r0, r6
	ldr	r1, .L239+8
	ldr	r3, .L239+12
	lsls	r2, r2, #6
	bl	.L17
.L228:
	ldrb	r2, [r5]
	ldr	r3, [r4, #44]
	lsls	r2, r2, #4
	adds	r3, r3, r2
	ldr	r0, [r3, #8]
	cmp	r0, #0
	beq	.L226
	movs	r2, #208
	movs	r1, #152
	ldr	r3, .L239+16
	lsls	r2, r2, #1
	lsls	r1, r1, #2
	bl	.L17
.L226:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L240:
	.align	2
.L239:
	.word	gGenericBuffer
	.word	Decompress
	.word	100745216
	.word	RegisterTileGraphics
	.word	CopyToPaletteBuffer
	.size	CRE_setOtherVariant, .-CRE_setOtherVariant
	.align	1
	.global	CRE_nextEntry
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_nextEntry, %function
CRE_nextEntry:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	movs	r2, r3
	ldrh	r3, [r3, #12]
	adds	r2, r2, #12
	push	{r4, lr}
	str	r2, [r0, #44]
	cmp	r3, #0
	beq	.L241
	movs	r1, #0
	ldr	r3, .L246
	bl	.L17
.L241:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L247:
	.align	2
.L246:
	.word	ProcGoto
	.size	CRE_nextEntry, .-CRE_nextEntry
	.align	1
	.global	CRE_skipSegment
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_skipSegment, %function
CRE_skipSegment:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	@ sp needed
	ldr	r0, .L249
	ldr	r5, .L249+4
	adds	r0, r0, #48
	bl	.L52
	ldr	r0, .L249+8
	adds	r0, r0, #40
	bl	.L52
	movs	r1, #1
	ldr	r0, [r4, #20]
	ldr	r3, .L249+12
	bl	.L17
	ldr	r3, [r4, #20]
	adds	r3, r3, #40
	ldrb	r2, [r3]
	subs	r2, r2, #1
	strb	r2, [r3]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L250:
	.align	2
.L249:
	.word	.LANCHOR3
	.word	EndEachProc
	.word	.LANCHOR5
	.word	ProcGoto
	.size	CRE_skipSegment, .-CRE_skipSegment
	.align	1
	.global	CRE_skipCredits
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_skipCredits, %function
CRE_skipCredits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r0
	@ sp needed
	bl	CRE_skipSegment
	movs	r2, #1
	ldr	r3, [r4, #20]
	adds	r3, r3, #42
	strb	r2, [r3]
	pop	{r4}
	pop	{r0}
	bx	r0
	.size	CRE_skipCredits, .-CRE_skipCredits
	.align	1
	.global	CRE_initMapSprites2
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_initMapSprites2, %function
CRE_initMapSprites2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r4, #0
	sub	sp, sp, #28
	str	r0, [sp, #8]
	ldr	r2, .L255
	ldr	r1, .L255+4
	ldr	r7, .L255+8
	add	r0, sp, #16
	str	r4, [sp, #16]
	bl	.L32
	ldr	r5, .L255+12
	ldr	r2, .L255
	movs	r1, r5
	add	r0, sp, #20
	str	r4, [sp, #20]
	bl	.L32
	movs	r2, #128
	ldr	r3, .L255+16
	movs	r0, r5
	ldr	r1, .L255+20
	lsls	r2, r2, #6
	bl	.L17
	movs	r1, #152
	movs	r2, #96
	ldr	r0, .L255+24
	ldr	r5, .L255+28
	lsls	r1, r1, #2
	bl	.L52
	movs	r1, #176
	movs	r2, #32
	ldr	r0, .L255+32
	lsls	r1, r1, #2
	bl	.L52
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #44]
	ldrb	r0, [r3]
	ldr	r3, .L255+36
	bl	.L17
	str	r4, [sp, #4]
.L253:
	ldr	r3, .L255+40
	lsls	r0, r0, #3
	adds	r0, r3, r0
	ldrh	r7, [r0, #2]
	ldr	r1, .L255+4
	ldr	r0, [r0, #4]
	ldr	r3, .L255+44
	bl	.L17
	movs	r3, #2
	movs	r2, #16
	lsls	r4, r7, #1
	adds	r1, r7, r3
	ands	r4, r3
	subs	r3, r3, r7
	lsls	r1, r1, #3
	asrs	r3, r3, #1
	ands	r1, r2
	lsls	r3, r3, #10
	adds	r1, r1, r3
	lsls	r1, r1, r2
	movs	r5, #2
	lsrs	r1, r1, r2
	ldr	r3, [sp, #4]
	ands	r5, r7
	adds	r5, r5, #2
	ldr	r2, .L255+12
	adds	r1, r1, r3
	adds	r4, r5, r4
	lsls	r3, r1, #1
	adds	r1, r3, r2
	str	r3, [sp]
	movs	r2, r5
	movs	r3, r4
	ldr	r0, .L255+4
	ldr	r6, .L255+48
	bl	.L163
	ldr	r1, [sp]
	ldr	r3, .L255+12
	adds	r1, r1, #128
	adds	r1, r1, r3
	movs	r2, r5
	movs	r3, r4
	ldr	r0, .L255+4
	ldr	r6, .L255+48
	bl	.L163
	movs	r3, #128
	adds	r7, r7, #7
	lsls	r3, r3, #9
	lsls	r3, r3, r7
	ldr	r2, .L255+4
	lsrs	r3, r3, #16
	adds	r7, r3, r2
	str	r3, [sp, #12]
	ldr	r3, [sp]
	adds	r1, r3, #1
	ldr	r3, .L255+12
	adds	r1, r1, #255
	movs	r0, r7
	adds	r1, r1, r3
	movs	r2, r5
	movs	r3, r4
	ldr	r6, .L255+48
	bl	.L163
	ldr	r1, [sp]
	ldr	r3, .L255+12
	adds	r1, r1, #129
	adds	r1, r1, #255
	movs	r0, r7
	adds	r1, r1, r3
	movs	r2, r5
	movs	r3, r4
	ldr	r6, .L255+48
	bl	.L163
	movs	r2, #128
	ldr	r3, [sp, #12]
	lsls	r7, r3, #1
	ldr	r3, .L255+4
	adds	r7, r7, r3
	ldr	r3, [sp]
	lsls	r2, r2, #2
	adds	r1, r3, r2
	ldr	r3, .L255+12
	movs	r2, r5
	adds	r1, r1, r3
	movs	r0, r7
	movs	r3, r4
	ldr	r6, .L255+48
	bl	.L163
	movs	r2, #160
	lsls	r2, r2, #2
	mov	ip, r2
	ldr	r3, [sp]
	add	r3, r3, ip
	movs	r1, r3
	ldr	r3, .L255+12
	movs	r2, r5
	adds	r1, r1, r3
	movs	r0, r7
	movs	r3, r4
	ldr	r4, .L255+48
	bl	.L101
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #44]
	ldrb	r0, [r3, #1]
	ldr	r3, .L255+36
	bl	.L17
	movs	r2, #128
	lsls	r2, r2, #4
	mov	ip, r2
	ldr	r3, [sp, #4]
	add	r3, r3, ip
	str	r3, [sp, #4]
	movs	r3, #128
	ldr	r2, [sp, #4]
	lsls	r3, r3, #5
	cmp	r2, r3
	bne	.L253
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #44]
	ldr	r4, .L255+52
	ldrb	r0, [r3]
	bl	.L101
	ldr	r1, .L255+56
	ldr	r3, .L255+44
	bl	.L17
	ldr	r3, [sp, #8]
	ldr	r3, [r3, #44]
	ldrb	r0, [r3, #1]
	bl	.L101
	ldr	r1, .L255+60
	ldr	r3, .L255+44
	bl	.L17
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L256:
	.align	2
.L255:
	.word	16779264
	.word	gGenericBuffer
	.word	CpuFastSet
	.word	gBg0MapBuffer
	.word	RegisterTileGraphics
	.word	100745216
	.word	gPal_MapSprite
	.word	CopyToPaletteBuffer
	.word	gPal_MapSprite+192
	.word	GetClassSMSId
	.word	StandingMapSpriteTable
	.word	Decompress
	.word	CopyTileGfxForObj
	.word	MMS_GetGfx
	.word	gSMSGfxBuffer_Frame1
	.word	gSMSGfxBuffer_Frame2
	.size	CRE_initMapSprites2, .-CRE_initMapSprites2
	.align	1
	.global	CRE_doAnim
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_doAnim, %function
CRE_doAnim:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	lsls	r4, r0, #24
	lsrs	r2, r0, #8
	ldr	r3, [r1, #44]
	ldr	r0, .L261
	lsrs	r4, r4, #24
	cmp	r2, #0
	bne	.L258
	ldrb	r2, [r3, #2]
	strb	r2, [r0, #1]
	ldrh	r2, [r3, #12]
	strh	r2, [r0, #2]
	ldrh	r2, [r3, #16]
	strh	r2, [r0, #4]
	ldrh	r2, [r3, #8]
	strh	r2, [r0, #6]
	ldrh	r3, [r3, #4]
.L260:
	@ sp needed
	strh	r3, [r0, #8]
	ldr	r3, .L261+4
	strh	r4, [r0, #10]
	bl	.L17
	movs	r0, #1
	pop	{r4}
	pop	{r1}
	bx	r1
.L258:
	ldrb	r2, [r3, #3]
	strb	r2, [r0, #1]
	ldrh	r2, [r3, #14]
	strh	r2, [r0, #2]
	ldrh	r2, [r3, #18]
	strh	r2, [r0, #4]
	ldrh	r2, [r3, #10]
	strh	r2, [r0, #6]
	ldrh	r3, [r3, #6]
	b	.L260
.L262:
	.align	2
.L261:
	.word	gAISBuffer
	.word	LoadBufferIntoAIS
	.size	CRE_doAnim, .-CRE_doAnim
	.align	1
	.global	CRE_setFaceDisplayBits
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_setFaceDisplayBits, %function
CRE_setFaceDisplayBits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L264
	@ sp needed
	movs	r4, r0
	ldr	r3, .L264+4
	ldr	r0, [r5]
	bl	.L17
	lsrs	r1, r0, #16
	lsls	r1, r1, #16
	ldr	r0, [r5]
	ldr	r3, .L264+8
	orrs	r1, r4
	bl	.L17
	movs	r0, #1
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L265:
	.align	2
.L264:
	.word	gpFaceProcs
	.word	GetFaceDisplayBits
	.word	SetFaceDisplayBits
	.size	CRE_setFaceDisplayBits, .-CRE_setFaceDisplayBits
	.align	1
	.global	CRE_portraitCheckIfMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_portraitCheckIfMosaic, %function
CRE_portraitCheckIfMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r0
	push	{r4, lr}
	adds	r2, r2, #41
	ldrb	r3, [r2]
	adds	r3, r3, #1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r2]
	ldr	r2, [r0, #44]
	lsls	r3, r3, #1
	ldrh	r3, [r3, r2]
	cmp	r3, #0
	bne	.L266
	ldr	r3, .L268
	bl	.L17
.L266:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L269:
	.align	2
.L268:
	.word	EndProc
	.size	CRE_portraitCheckIfMosaic, .-CRE_portraitCheckIfMosaic
	.align	1
	.global	CRE_otherCheckIfMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_otherCheckIfMosaic, %function
CRE_otherCheckIfMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r0
	push	{r4, lr}
	adds	r2, r2, #41
	ldrb	r3, [r2]
	adds	r3, r3, #1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r2]
	ldr	r2, [r0, #44]
	lsls	r3, r3, #4
	adds	r3, r2, r3
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L270
	ldr	r2, [r3, #4]
	cmp	r2, #0
	bne	.L270
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L270
	ldr	r3, .L272
	bl	.L17
.L270:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L273:
	.align	2
.L272:
	.word	EndProc
	.size	CRE_otherCheckIfMosaic, .-CRE_otherCheckIfMosaic
	.align	1
	.global	CRE_drawSprite
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_drawSprite, %function
CRE_drawSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r0, r1, r4, lr}
	ldrh	r4, [r3, #46]
	@ sp needed
	ldrh	r2, [r0, #42]
	ldrh	r1, [r0, #44]
	adds	r0, r0, #41
	ldrb	r0, [r0]
	str	r4, [sp]
	ldr	r4, .L275
	ldr	r3, [r3, #48]
	bl	.L101
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L276:
	.align	2
.L275:
	.word	ObjInsert
	.size	CRE_drawSprite, .-CRE_drawSprite
	.align	1
	.global	CRE_moveAuth
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_moveAuth, %function
CRE_moveAuth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	movs	r5, r0
	ldrh	r3, [r0, #42]
	adds	r5, r5, #41
	ldrb	r2, [r5]
	subs	r3, r3, #16
	adds	r2, r2, r3
	movs	r3, r0
	movs	r4, r0
	adds	r3, r3, #48
	ldrh	r1, [r0, #44]
	ldrb	r0, [r3]
	ldrh	r3, [r4, #46]
	lsls	r2, r2, #16
	str	r3, [sp]
	ldr	r6, .L279
	ldr	r3, .L279+4
	lsrs	r2, r2, #16
	bl	.L163
	ldrb	r3, [r5]
	adds	r3, r3, #1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r5]
	cmp	r3, #15
	bls	.L277
	movs	r0, r4
	ldr	r3, .L279+8
	bl	.L17
.L277:
	@ sp needed
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L280:
	.align	2
.L279:
	.word	ObjInsert
	.word	authorOAM
	.word	BreakProcLoop
	.size	CRE_moveAuth, .-CRE_moveAuth
	.align	1
	.global	CRE_drawAuth
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_drawAuth, %function
CRE_drawAuth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r0, r1, r4, lr}
	ldrh	r3, [r3, #46]
	@ sp needed
	ldrh	r2, [r0, #42]
	ldrh	r1, [r0, #44]
	adds	r0, r0, #48
	ldrb	r0, [r0]
	ldr	r4, .L282
	str	r3, [sp]
	ldr	r3, .L282+4
	bl	.L101
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
.L283:
	.align	2
.L282:
	.word	ObjInsert
	.word	authorOAM
	.size	CRE_drawAuth, .-CRE_drawAuth
	.align	1
	.global	CRE_titleDrawChars
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_titleDrawChars, %function
CRE_titleDrawChars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, r0
	push	{r4, r5, r6, lr}
	ldrh	r3, [r0, #42]
	adds	r2, r2, #48
	lsrs	r5, r3, #1
	ldrb	r2, [r2]
	lsls	r5, r5, #24
	movs	r4, r0
	lsrs	r5, r5, #24
	cmp	r2, r5
	bhi	.L285
	movs	r3, #0
	strh	r3, [r0, #42]
	ldr	r3, .L291
	bl	.L17
.L284:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L285:
	lsls	r3, r3, #31
	bpl	.L287
	movs	r1, r5
	ldr	r3, .L291+4
	bl	.L17
	ldr	r3, .L291+8
	lsls	r5, r5, #2
	str	r0, [r3, r5]
.L287:
	ldrh	r3, [r4, #42]
	adds	r3, r3, #1
	strh	r3, [r4, #42]
	b	.L284
.L292:
	.align	2
.L291:
	.word	BreakProcLoop
	.word	startopinfoview
	.word	ClassReelLetterProcs
	.size	CRE_titleDrawChars, .-CRE_titleDrawChars
	.align	1
	.global	CRE_musicDestructor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_musicDestructor, %function
CRE_musicDestructor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r0, #1
	@ sp needed
	ldr	r3, .L294
	bl	.L17
	pop	{r4}
	pop	{r0}
	bx	r0
.L295:
	.align	2
.L294:
	.word	Sound_FadeSongOut
	.size	CRE_musicDestructor, .-CRE_musicDestructor
	.align	1
	.global	CRE_musicInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_musicInit, %function
CRE_musicInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r3, [r5]
	ldr	r2, [r0, #44]
	lsls	r3, r3, #2
	movs	r4, r0
	ldrh	r0, [r3, r2]
	movs	r2, #128
	movs	r3, #0
	lsls	r2, r2, #1
	movs	r1, r2
	str	r3, [sp]
	ldr	r6, .L310
	adds	r3, r3, #64
	bl	.L163
	ldrb	r3, [r5]
	ldr	r2, [r4, #44]
	lsls	r3, r3, #2
	ldrh	r2, [r3, r2]
	ldr	r3, .L310+4
	lsls	r2, r2, #3
	adds	r3, r3, r2
	ldr	r3, [r3, #4]
	lsrs	r3, r3, #14
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, #16
	beq	.L297
	bhi	.L298
	cmp	r3, #8
	beq	.L299
	bhi	.L300
	cmp	r3, #0
	beq	.L301
	cmp	r3, #4
	beq	.L302
.L303:
	ldr	r3, .L310+8
	b	.L309
.L300:
	cmp	r3, #12
	bne	.L303
	ldr	r3, .L310+12
	b	.L309
.L298:
	cmp	r3, #24
	beq	.L305
	cmp	r3, #28
	beq	.L306
	cmp	r3, #20
	bne	.L303
	ldr	r3, .L310+16
	b	.L309
.L301:
	ldr	r3, .L310+20
.L309:
	@ sp needed
	str	r3, [r4, #48]
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L302:
	ldr	r3, .L310+24
	b	.L309
.L299:
	ldr	r3, .L310+28
	b	.L309
.L297:
	ldr	r3, .L310+32
	b	.L309
.L305:
	ldr	r3, .L310+36
	b	.L309
.L306:
	ldr	r3, .L310+40
	b	.L309
.L311:
	.align	2
.L310:
	.word	Sound_SongTransition
	.word	gSongTable
	.word	gMusicSEPlayerInfo5
	.word	gMusicSEPlayerInfo3
	.word	gMusicSEPlayerInfoUnk2
	.word	gMusicPlayerInfo0
	.word	gMusicPlayerInfo1
	.word	gMusicSEPlayerInfo2
	.word	gMusicSEPlayerInfoUnk1
	.word	gMusicSEPlayerInfoUnk3
	.word	gMusicSEPlayerInfo4
	.size	CRE_musicInit, .-CRE_musicInit
	.align	1
	.global	CRE_segmentInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segmentInit, %function
CRE_segmentInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r6, .L321
	str	r0, [sp, #4]
	movs	r1, r6
	ldr	r0, .L321+4
	ldr	r3, .L321+8
	bl	.L17
	movs	r1, #136
	movs	r2, #32
	ldr	r0, .L321+12
	ldr	r3, .L321+16
	lsls	r1, r1, #2
	bl	.L17
	movs	r5, #0
.L313:
	ldr	r3, .L321+20
	lsls	r7, r5, #1
	adds	r7, r6, r7
	adds	r4, r5, r3
.L314:
	movs	r1, r4
	movs	r0, r7
	movs	r2, #16
	ldr	r3, .L321+24
	bl	.L17
	movs	r1, r4
	movs	r0, r4
	ldr	r3, .L321+24
	movs	r2, #48
	adds	r1, r1, #64
	bl	.L17
	movs	r3, #128
	lsls	r3, r3, #3
	adds	r4, r4, r3
	ldr	r3, .L321+28
	adds	r3, r5, r3
	adds	r7, r7, #64
	cmp	r4, r3
	bne	.L314
	movs	r3, #192
	adds	r5, r5, #1
	adds	r5, r5, #255
	lsls	r3, r3, #2
	cmp	r5, r3
	bne	.L313
	movs	r1, #128
	movs	r2, #32
	ldr	r0, .L321+32
	ldr	r3, .L321+16
	lsls	r1, r1, #2
	bl	.L17
	movs	r1, #144
	movs	r6, #88
	movs	r2, #32
	lsls	r1, r1, #2
	ldr	r0, .L321+36
	ldr	r3, .L321+16
	bl	.L17
	ldr	r3, .L321+40
	bl	.L17
	ldr	r3, .L321+44
	ldr	r5, [r3]
	ldr	r3, .L321+48
	ldr	r2, [r3, #20]
	ldr	r3, [r3, #24]
	str	r2, [r5, #8]
	str	r3, [r5, #12]
	ldrh	r0, [r5, #8]
	ldrh	r3, [r5, #12]
	ldr	r2, .L321+52
	ands	r0, r2
	ands	r2, r3
	ldr	r3, .L321+56
	ldr	r1, .L321+60
	orrs	r3, r2
	strh	r3, [r5, #12]
	orrs	r1, r0
	ldr	r3, [sp, #4]
	strh	r1, [r5, #8]
	adds	r3, r3, #41
	ldrb	r7, [r3]
	movs	r0, r6
	muls	r0, r7
	ldr	r4, .L321+64
	adds	r0, r4, r0
	ldr	r3, [r0, #80]
	cmp	r3, #0
	beq	.L316
	bl	.L17
.L316:
	@ sp needed
	movs	r1, #192
	muls	r6, r7
	adds	r4, r4, r6
	ldr	r0, [r4, #8]
	ldr	r3, .L321+8
	lsls	r1, r1, #19
	bl	.L17
	movs	r2, #128
	ldr	r0, [r4, #12]
	movs	r1, #0
	ldr	r3, .L321+16
	lsls	r2, r2, #2
	bl	.L17
	movs	r6, #0
	movs	r1, r4
	ldr	r3, .L321+68
	ldr	r0, [r5]
	movs	r2, #56
	strh	r6, [r3]
	adds	r1, r1, #16
	ldr	r3, .L321+72
	adds	r0, r0, #44
	bl	.L17
	ldr	r5, .L321+76
	ldr	r7, .L321+80
	movs	r0, r5
	ldr	r1, [sp, #4]
	bl	.L32
	ldr	r3, [sp, #4]
	str	r0, [r3, #48]
	ldr	r3, [r4, #72]
	str	r6, [r0, #44]
	str	r3, [r0, #48]
	movs	r0, r5
	movs	r1, #4
	adds	r0, r0, #32
	bl	.L32
	ldr	r3, [sp, #4]
	str	r0, [r3, #44]
	ldr	r0, .L321+84
	movs	r1, r3
	adds	r0, r0, #40
	ldr	r3, .L321+88
	bl	.L17
	ldr	r3, [r4, #76]
	str	r3, [r0, #44]
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L322:
	.align	2
.L321:
	.word	gGenericBuffer
	.word	ClassReelBGTiles
	.word	Decompress
	.word	ClassReelBGPalette
	.word	CopyToPaletteBuffer
	.word	100737024
	.word	CpuFastSet
	.word	100745216
	.word	gPal_ClassReelGlyphs2
	.word	authorPalette
	.word	m7Init
	.word	m7World
	.word	gLCDIOBuffer
	.word	8179
	.word	-8184
	.word	-8192
	.word	creditStruct
	.word	gPaletteBuffer
	.word	memcpy
	.word	.LANCHOR6
	.word	ProcStart
	.word	.LANCHOR5
	.word	ProcStartBlocking
	.size	CRE_segmentInit, .-CRE_segmentInit
	.align	1
	.global	CRE_segmentEnd
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segmentEnd, %function
CRE_segmentEnd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r5, r0
	movs	r4, r0
	movs	r0, #88
	adds	r5, r5, #41
	ldrb	r3, [r5]
	muls	r0, r3
	ldr	r3, .L332
	adds	r0, r3, r0
	ldr	r3, [r0, #84]
	cmp	r3, #0
	beq	.L324
	bl	.L17
.L324:
	movs	r6, #0
	ldr	r0, [r4, #44]
	ldr	r7, .L332+4
	bl	.L32
	ldr	r0, [r4, #48]
	str	r6, [r4, #44]
	bl	.L32
	ldr	r3, .L332+8
	str	r6, [r4, #48]
	bl	.L17
	movs	r2, #88
	ldrb	r3, [r5]
	adds	r3, r3, #1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r5]
	muls	r3, r2
	ldr	r2, .L332
	ldrh	r3, [r2, r3]
	cmp	r3, r6
	beq	.L323
	movs	r3, r4
	adds	r3, r3, #42
	ldrb	r1, [r3]
	cmp	r1, r6
	bne	.L323
	movs	r0, r4
	ldr	r3, .L332+12
	bl	.L17
.L323:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L333:
	.align	2
.L332:
	.word	creditStruct
	.word	EndProc
	.word	m7End
	.word	ProcGoto
	.size	CRE_segmentEnd, .-CRE_segmentEnd
	.align	1
	.global	CRE_reelLoop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_reelLoop, %function
CRE_reelLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	adds	r3, r3, #41
	ldrb	r3, [r3]
	mvns	r3, r3
	movs	r4, r0
	lsls	r3, r3, #29
	bne	.L334
	ldr	r3, .L336
	bl	.L17
	ldr	r2, [r4, #48]
	ldr	r3, [r2, #4]
	adds	r3, r3, #8
	str	r3, [r2, #4]
	ldr	r2, [r4, #52]
	ldr	r3, [r2, #4]
	adds	r3, r3, #8
	str	r3, [r2, #4]
	ldr	r3, [r4, #56]
	adds	r3, r3, #40
	ldrb	r2, [r3]
	subs	r2, r2, #1
	strb	r2, [r3]
.L334:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L337:
	.align	2
.L336:
	.word	BreakProcLoop
	.size	CRE_reelLoop, .-CRE_reelLoop
	.align	1
	.global	CRE_ccCheckIfMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_ccCheckIfMosaic, %function
CRE_ccCheckIfMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #44]
	ldrb	r2, [r3]
	ldrb	r3, [r3, #1]
	movs	r4, r0
	cmp	r2, r3
	bne	.L339
	ldr	r3, .L340
	movs	r1, #0
	bl	.L17
	movs	r3, #30
	strh	r3, [r4, #36]
	ldr	r3, .L340+4
	str	r3, [r4, #12]
.L339:
	@ sp needed
	movs	r0, #0
	pop	{r4}
	pop	{r1}
	bx	r1
.L341:
	.align	2
.L340:
	.word	ProcGoto
	.word	_ProcSleepCallback
	.size	CRE_ccCheckIfMosaic, .-CRE_ccCheckIfMosaic
	.align	1
	.global	CRE_baCheckIfMosaic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_baCheckIfMosaic, %function
CRE_baCheckIfMosaic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #44]
	ldrb	r1, [r3, #2]
	ldrb	r2, [r3, #3]
	movs	r4, r0
	cmp	r1, r2
	bne	.L342
	ldrh	r1, [r3, #8]
	ldrh	r2, [r3, #10]
	cmp	r1, r2
	bne	.L342
	ldrh	r2, [r3, #4]
	ldrh	r3, [r3, #6]
	cmp	r2, r3
	bne	.L342
	ldr	r3, .L344
	movs	r1, #1
	bl	.L17
	movs	r3, #30
	strh	r3, [r4, #36]
	ldr	r3, .L344+4
	str	r3, [r4, #12]
.L342:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L345:
	.align	2
.L344:
	.word	ProcGoto
	.word	_ProcSleepCallback
	.size	CRE_baCheckIfMosaic, .-CRE_baCheckIfMosaic
	.align	1
	.global	CRE_blockWhenDone
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_blockWhenDone, %function
CRE_blockWhenDone:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	adds	r3, r3, #41
	ldrb	r3, [r3]
	ldr	r2, [r0, #44]
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	movs	r4, r0
	cmp	r3, #0
	beq	.L347
	bl	CRE_blendOutAuth
	movs	r1, #0
	movs	r0, r4
	ldr	r3, .L349
	bl	.L17
.L348:
	@ sp needed
	movs	r0, #0
	pop	{r4}
	pop	{r1}
	bx	r1
.L347:
	movs	r2, r0
	adds	r2, r2, #40
	ldrb	r3, [r2]
	adds	r3, r3, #1
	movs	r1, r0
	strb	r3, [r2]
	movs	r0, #4
	bl	CRE_setBitfield
	b	.L348
.L350:
	.align	2
.L349:
	.word	ProcGoto
	.size	CRE_blockWhenDone, .-CRE_blockWhenDone
	.align	1
	.global	CRE_listenForKeys
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_listenForKeys, %function
CRE_listenForKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	movs	r2, r3
	push	{r4, lr}
	adds	r2, r2, #41
	ldrb	r1, [r2]
	movs	r2, #88
	muls	r2, r1
	ldr	r1, .L368
	ldrh	r2, [r2, r1]
	movs	r4, r0
	cmp	r2, #0
	beq	.L352
	adds	r3, r3, #42
	ldrb	r3, [r3]
	cmp	r3, #0
	beq	.L353
.L352:
	movs	r0, r4
	ldr	r3, .L368+4
	bl	.L17
.L351:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L353:
	ldr	r3, .L368+8
	ldrh	r2, [r3, #4]
	movs	r3, #9
	tst	r2, r3
	beq	.L351
	movs	r1, #1
	ldr	r3, .L368+12
	tst	r2, r1
	beq	.L355
.L367:
	movs	r0, r4
	bl	.L17
	movs	r0, r4
	ldr	r3, .L368+16
	bl	.L17
	ldr	r3, [r4, #20]
	adds	r3, r3, #40
	ldrb	r2, [r3]
	ldr	r0, .L368+20
	adds	r2, r2, #1
	strb	r2, [r3]
	adds	r0, r0, #40
	ldr	r3, .L368+24
	bl	.L17
	cmp	r0, #0
	beq	.L357
	adds	r0, r0, #40
	ldrb	r3, [r0]
	adds	r3, r3, #1
	strb	r3, [r0]
.L357:
	ldr	r0, .L368+28
	ldr	r4, .L368+32
	bl	.L101
	ldr	r0, .L368+36
	bl	.L101
	b	.L351
.L355:
	movs	r1, #2
	b	.L367
.L369:
	.align	2
.L368:
	.word	creditStruct
	.word	EndProc
	.word	gKeyState
	.word	ProcGoto
	.word	BreakProcLoop
	.word	.LANCHOR5
	.word	ProcFind
	.word	gProc_FadeOut
	.word	EndEachProc
	.word	gProc_FadeIn
	.size	CRE_listenForKeys, .-CRE_listenForKeys
	.align	1
	.global	CRE_musicLoop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_musicLoop, %function
CRE_musicLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	movs	r5, r0
	adds	r5, r5, #41
	ldrb	r3, [r5]
	ldr	r1, [r0, #44]
	ldr	r2, [r0, #48]
	lsls	r3, r3, #2
	adds	r3, r1, r3
	ldrh	r3, [r3, #2]
	ldr	r2, [r2, #12]
	movs	r4, r0
	cmp	r2, r3
	bcc	.L370
	ldr	r3, .L373
	bl	.L17
	ldrb	r3, [r5]
	adds	r3, r3, #1
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	strb	r3, [r5]
	ldr	r2, [r4, #44]
	lsls	r3, r3, #2
	ldrh	r0, [r3, r2]
	cmp	r0, #0
	beq	.L372
	movs	r1, #0
	movs	r0, r4
	ldr	r3, .L373+4
	bl	.L17
.L370:
	@ sp needed
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L372:
	movs	r2, #128
	lsls	r2, r2, #1
	movs	r3, #64
	movs	r1, r2
	str	r0, [sp]
	ldr	r4, .L373+8
	bl	.L101
	b	.L370
.L374:
	.align	2
.L373:
	.word	BreakProcLoop
	.word	ProcGoto
	.word	Sound_SongTransition
	.size	CRE_musicLoop, .-CRE_musicLoop
	.align	1
	.global	CRE_LoopBarBlend
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_LoopBarBlend, %function
CRE_LoopBarBlend:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	adds	r0, r0, #42
	ldrb	r7, [r0]
	cmp	r7, #11
	bhi	.L379
	adds	r3, r7, #1
	strb	r3, [r0]
.L376:
	movs	r0, #14
	movs	r3, #226
	ldr	r6, .L380
	subs	r0, r0, r7
	ldr	r4, .L380+4
	movs	r2, r6
	ldr	r1, .L380+8
	lsls	r0, r0, #3
	lsls	r3, r3, #2
	bl	.L101
	movs	r0, r7
	movs	r3, #128
	adds	r0, r0, #15
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	lsls	r3, r3, #5
	lsls	r0, r0, #3
	orrs	r0, r3
	movs	r3, #226
	movs	r2, r6
	lsls	r3, r3, #2
	ldr	r1, .L380+8
	bl	.L101
	movs	r4, #15
	subs	r4, r4, r7
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	lsls	r3, r4, #3
	adds	r7, r7, #14
	lsls	r7, r7, #24
	str	r3, [sp, #4]
	lsrs	r7, r7, #24
.L377:
	cmp	r4, r7
	bls	.L378
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L379:
	movs	r7, #12
	b	.L376
.L378:
	ldr	r3, .L380+12
	movs	r2, r6
	ldr	r1, .L380+8
	ldr	r0, [sp, #4]
	ldr	r5, .L380+4
	bl	.L52
	ldr	r3, [sp, #4]
	adds	r4, r4, #1
	lsls	r4, r4, #24
	adds	r3, r3, #8
	str	r3, [sp, #4]
	lsrs	r4, r4, #24
	b	.L377
.L381:
	.align	2
.L380:
	.word	gObj_8x8
	.word	PushToHiOAM
	.word	1100
	.word	905
	.size	CRE_LoopBarBlend, .-CRE_LoopBarBlend
	.align	1
	.global	CRE_segSubtitleDrawChars2
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_segSubtitleDrawChars2, %function
CRE_segSubtitleDrawChars2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r4, r0
	bl	CRE_LoopBarBlend
	movs	r3, r4
	movs	r5, #0
	movs	r6, #12
	adds	r3, r3, #41
	ldrb	r3, [r3]
	str	r3, [sp, #4]
	movs	r2, #44
	ldrsh	r3, [r4, r2]
	str	r3, [sp]
.L383:
	ldr	r3, [sp, #4]
	cmp	r3, r5
	bgt	.L384
	ldr	r5, [r4, #24]
	cmp	r5, #0
	bne	.L382
	ldr	r3, .L386
	movs	r0, r4
	bl	.L17
	ldr	r3, .L386+4
	strh	r5, [r3, #56]
.L382:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L384:
	movs	r2, #136
	movs	r0, r6
	muls	r0, r5
	lsls	r3, r5, #1
	lsls	r2, r2, #4
	adds	r3, r3, r2
	ldr	r2, [sp]
	ldr	r1, .L386+8
	adds	r0, r0, r2
	ldr	r7, .L386+12
	ldr	r2, .L386+16
	bl	.L32
	adds	r5, r5, #1
	b	.L383
.L387:
	.align	2
.L386:
	.word	BreakProcLoop
	.word	gLCDIOBuffer
	.word	5204
	.word	PushToHiOAM
	.word	gObj_16x32
	.size	CRE_segSubtitleDrawChars2, .-CRE_segSubtitleDrawChars2
	.align	1
	.global	CRE_classSegConstructor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_classSegConstructor, %function
CRE_classSegConstructor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L389
	@ sp needed
	bl	.L17
	movs	r2, #130
	ldr	r4, .L389+4
	lsls	r2, r2, #1
	strh	r2, [r4, #2]
	movs	r2, #128
	lsls	r2, r2, #9
	str	r2, [r4, #4]
	movs	r2, #192
	lsls	r2, r2, #11
	str	r2, [r4, #8]
	ldr	r2, .L389+8
	str	r2, [r4, #12]
	movs	r2, #3
	movs	r3, #0
	strh	r2, [r4, #16]
	ldr	r2, .L389+12
	str	r2, [r4, #28]
	ldr	r2, .L389+16
	str	r2, [r4, #32]
	ldr	r2, .L389+20
	strb	r3, [r4, #1]
	str	r3, [r4, #20]
	str	r3, [r4, #24]
	str	r3, [r4, #44]
	ldr	r3, .L389+24
	str	r2, [r4, #36]
	ldr	r2, .L389+28
	str	r3, [r4, #48]
	movs	r0, r4
	ldr	r3, .L389+32
	str	r2, [r4, #40]
	bl	.L17
	movs	r3, #128
	ldr	r1, [r4, #20]
	ldrh	r2, [r1, #28]
	lsls	r3, r3, #5
	orrs	r2, r3
	strh	r2, [r1, #28]
	ldr	r2, [r4, #24]
	ldrh	r1, [r2, #28]
	orrs	r3, r1
	strh	r3, [r2, #28]
	pop	{r4}
	pop	{r0}
	bx	r0
.L390:
	.align	2
.L389:
	.word	StartEkrAnimeDrvProc
	.word	gAISBuffer
	.word	33554433
	.word	33554488
	.word	33585208
	.word	33562680
	.word	33596120
	.word	33585368
	.word	StartEkrUnitMainMini
	.size	CRE_classSegConstructor, .-CRE_classSegConstructor
	.align	1
	.global	CRE_classSegDestructor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_classSegDestructor, %function
CRE_classSegDestructor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L396
	bl	.L17
	ldr	r0, .L396+4
	ldr	r3, .L396+8
	bl	.L17
	cmp	r0, #0
	beq	.L391
	ldr	r0, .L396+12
	ldr	r3, .L396+16
	bl	.L17
.L391:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L397:
	.align	2
.L396:
	.word	EndEkrAnimeDrvProc
	.word	gProc_ekrUnitMainMini
	.word	ProcFind
	.word	gAISBuffer
	.word	EndEkrUnitMainMini
	.size	CRE_classSegDestructor, .-CRE_classSegDestructor
	.align	1
	.global	CRE_spriteInitCC
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteInitCC, %function
CRE_spriteInitCC:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, lr}
	ldr	r3, .L399
	@ sp needed
	bl	.L17
	ldr	r3, .L399+4
	ldrh	r0, [r0, #8]
	bl	.L17
	movs	r1, #152
	movs	r4, r0
	movs	r2, #32
	ldr	r0, [r0, #8]
	ldr	r3, .L399+8
	lsls	r1, r1, #2
	bl	.L17
	ldr	r5, .L399+12
	ldr	r0, [r4, #16]
	movs	r1, r5
	ldr	r3, .L399+16
	bl	.L17
	movs	r3, #0
	ldr	r4, .L399+20
	str	r3, [sp, #4]
	movs	r1, r4
	add	r0, sp, #4
	ldr	r2, .L399+24
	ldr	r3, .L399+28
	bl	.L17
	movs	r1, r4
	movs	r0, r5
	movs	r3, #8
	ldr	r5, .L399+32
	movs	r2, #10
	bl	.L52
	movs	r3, #1
	movs	r2, #10
	ldr	r1, .L399+36
	ldr	r0, .L399+40
	bl	.L52
	movs	r2, #128
	movs	r0, r4
	ldr	r1, .L399+44
	ldr	r3, .L399+48
	lsls	r2, r2, #6
	bl	.L17
	pop	{r0, r1, r2, r4, r5}
	pop	{r0}
	bx	r0
.L400:
	.align	2
.L399:
	.word	GetClassData
	.word	GetPortraitData
	.word	CopyToPaletteBuffer
	.word	gGenericBuffer
	.word	Decompress
	.word	gBg0MapBuffer
	.word	16779264
	.word	CpuFastSet
	.word	CopyTileGfxForObj
	.word	gBg0MapBuffer+320
	.word	gGenericBuffer+2560
	.word	100745216
	.word	RegisterTileGraphics
	.size	CRE_spriteInitCC, .-CRE_spriteInitCC
	.align	1
	.global	CRE_spriteInitClass
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteInitClass, %function
CRE_spriteInitClass:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	movs	r4, r1
	@ sp needed
	ldrb	r0, [r0]
	bl	CRE_spriteInitCC
	ldr	r0, .L402
	movs	r1, r4
	ldr	r3, .L402+4
	adds	r0, r0, #56
	bl	.L17
	movs	r3, r0
	movs	r2, #8
	adds	r3, r3, #41
	str	r0, [r4, #48]
	strb	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #5
	strh	r3, [r0, #42]
	ldr	r3, .L402+8
	str	r3, [r0, #44]
	ldr	r3, .L402+12
	str	r3, [r0, #48]
	pop	{r4}
	pop	{r0}
	bx	r0
.L403:
	.align	2
.L402:
	.word	.LANCHOR6
	.word	ProcStart
	.word	973078768
	.word	ccOAM
	.size	CRE_spriteInitClass, .-CRE_spriteInitClass
	.align	1
	.global	CRE_ccSetVariant
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_ccSetVariant, %function
CRE_ccSetVariant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #44]
	@ sp needed
	ldrb	r0, [r3, #1]
	bl	CRE_spriteInitCC
	pop	{r4}
	pop	{r0}
	bx	r0
	.size	CRE_ccSetVariant, .-CRE_ccSetVariant
	.align	1
	.global	CRE_portraitSegConstructor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_portraitSegConstructor, %function
CRE_portraitSegConstructor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L406
	sub	sp, sp, #44
	bl	.L17
	add	r0, sp, #8
	movs	r2, r0
	ldr	r3, .L406+4
	adds	r3, r3, #88
	ldmia	r3!, {r1, r4, r5}
	stmia	r2!, {r1, r4, r5}
	ldmia	r3!, {r1, r4, r5}
	stmia	r2!, {r1, r4, r5}
	ldmia	r3!, {r1, r4}
	stmia	r2!, {r1, r4}
	ldr	r3, .L406+8
	bl	.L17
	ldr	r3, .L406+12
	movs	r2, #144
	str	r3, [sp]
	movs	r3, #0
	movs	r1, #1
	movs	r0, r3
	ldr	r4, .L406+16
	lsls	r2, r2, #1
	bl	.L101
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L407:
	.align	2
.L406:
	.word	Face_Init
	.word	.LANCHOR6
	.word	SetFaceGfxConfig
	.word	-2147483646
	.word	StartFace
	.size	CRE_portraitSegConstructor, .-CRE_portraitSegConstructor
	.align	1
	.global	CRE_portraitSegDestructor
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_portraitSegDestructor, %function
CRE_portraitSegDestructor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L409
	@ sp needed
	bl	.L17
	pop	{r4}
	pop	{r0}
	bx	r0
.L410:
	.align	2
.L409:
	.word	Face_Init
	.size	CRE_portraitSegDestructor, .-CRE_portraitSegDestructor
	.align	1
	.global	CRE_spriteInitPortrait
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteInitPortrait, %function
CRE_spriteInitPortrait:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	lsls	r1, r1, #1
	push	{r4, r5, r6, lr}
	ldr	r3, .L412
	@ sp needed
	adds	r5, r0, r1
	ldrh	r0, [r0, r1]
	bl	.L17
	movs	r4, r0
	ldr	r3, .L412+4
	ldr	r0, [r3]
	ldrh	r3, [r5]
	str	r4, [r0, #44]
	strh	r3, [r0, #62]
	ldr	r1, .L412+8
	ldr	r3, .L412+12
	bl	.L17
	ldr	r6, .L412+16
	ldr	r0, [r4]
	movs	r1, r6
	ldr	r3, .L412+20
	bl	.L17
	movs	r2, #128
	ldr	r5, .L412+24
	ldr	r1, .L412+28
	ldr	r3, [r5]
	movs	r0, r6
	adds	r1, r3, r1
	lsls	r2, r2, #5
	ldr	r3, .L412+32
	bl	.L17
	ldrh	r1, [r5, #4]
	adds	r1, r1, #16
	movs	r2, #32
	ldr	r0, [r4, #8]
	ldr	r3, .L412+36
	lsls	r1, r1, #5
	bl	.L17
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L413:
	.align	2
.L412:
	.word	GetPortraitData
	.word	gpFaceProcs
	.word	-2147483646
	.word	SetFaceDisplayBits
	.word	gGenericBuffer
	.word	Decompress
	.word	gFaceGfxData
	.word	100728832
	.word	RegisterTileGraphics
	.word	CopyToPaletteBuffer
	.size	CRE_spriteInitPortrait, .-CRE_spriteInitPortrait
	.align	1
	.global	CRE_setPortraitVariant
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_setPortraitVariant, %function
CRE_setPortraitVariant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, lr}
	adds	r3, r3, #41
	ldrb	r1, [r3]
	@ sp needed
	ldr	r0, [r0, #44]
	bl	CRE_spriteInitPortrait
	pop	{r4}
	pop	{r0}
	bx	r0
	.size	CRE_setPortraitVariant, .-CRE_setPortraitVariant
	.align	1
	.global	CRE_spriteInitOther
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteInitOther, %function
CRE_spriteInitOther:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	movs	r7, r0
	@ sp needed
	ldr	r0, .L416
	ldr	r3, .L416+4
	adds	r0, r0, #56
	movs	r6, r1
	movs	r4, r2
	bl	.L17
	movs	r3, r0
	movs	r2, #8
	adds	r3, r3, #41
	str	r0, [r6, #48]
	strb	r2, [r3]
	movs	r3, #0
	strh	r3, [r0, #42]
	movs	r3, #232
	lsls	r4, r4, #4
	adds	r4, r7, r4
	lsls	r3, r3, #22
	ldr	r5, .L416+8
	str	r3, [r0, #44]
	ldr	r3, [r4, #4]
	movs	r1, r5
	str	r3, [r0, #48]
	ldr	r0, [r4]
	ldr	r3, .L416+12
	bl	.L17
	movs	r2, #128
	movs	r0, r5
	ldr	r1, .L416+16
	ldr	r3, .L416+20
	lsls	r2, r2, #6
	bl	.L17
	movs	r2, #208
	movs	r1, #152
	ldr	r0, [r4, #8]
	ldr	r3, .L416+24
	lsls	r2, r2, #1
	lsls	r1, r1, #2
	bl	.L17
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L417:
	.align	2
.L416:
	.word	.LANCHOR6
	.word	ProcStart
	.word	gGenericBuffer
	.word	Decompress
	.word	100745216
	.word	RegisterTileGraphics
	.word	CopyToPaletteBuffer
	.size	CRE_spriteInitOther, .-CRE_spriteInitOther
	.align	1
	.global	CRE_spriteInit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CRE_spriteInit, %function
CRE_spriteInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r2, #0
	movs	r3, r0
	push	{r4, lr}
	strh	r2, [r0, #42]
	adds	r3, r3, #41
	ldrb	r3, [r3]
	cmp	r3, #1
	beq	.L419
	cmp	r3, #2
	beq	.L420
	cmp	r3, r2
	bne	.L418
	movs	r1, r0
	ldr	r0, [r0, #44]
	bl	CRE_spriteInitClass
.L418:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L419:
	movs	r1, r2
	ldr	r0, [r0, #44]
	bl	CRE_spriteInitPortrait
	b	.L418
.L420:
	movs	r1, r0
	ldr	r0, [r0, #44]
	bl	CRE_spriteInitOther
	b	.L418
	.size	CRE_spriteInit, .-CRE_spriteInit
	.global	CRE_credits_Proc
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC253:
	.ascii	"CRE_credits\000"
	.global	CRE_music_Proc
.LC254:
	.ascii	"CRE_music\000"
	.global	CRE_keylistener_Proc
.LC255:
	.ascii	"CRE_keylistener\000"
	.global	CRE_creditReel_Proc
.LC256:
	.ascii	"CRE_creditReel\000"
	.global	CRE_author_Proc
.LC257:
	.ascii	"CRE_author\000"
	.global	CRE_authors_Proc
.LC258:
	.ascii	"CRE_authors\000"
	.global	CRE_title_Proc
.LC259:
	.ascii	"CRE_title\000"
	.global	CRE_drawSprite_Proc
.LC260:
	.ascii	"CRE_drawSprite\000"
	.global	CRE_sprite_Proc
.LC261:
	.ascii	"CRE_sprite\000"
	.global	CRE_otherSprite_Proc
.LC262:
	.ascii	"CRE_otherSprite\000"
	.global	CRE_portraitSprite_Proc
.LC263:
	.ascii	"CRE_portraitSprite\000"
	.global	CRE_classSprite_Proc
.LC264:
	.ascii	"CRE_classSprite\000"
	.global	CRE_drawBGSprites_Proc
.LC265:
	.ascii	"CRE_drawBGSprites\000"
	.global	CRE_traverseM7Rot_Proc
.LC266:
	.ascii	"CRE_traverseM7Rot\000"
	.global	CRE_traverseM7Dim_Proc
.LC267:
	.ascii	"CRE_traverseM7Dim\000"
	.global	CRE_traverseM7_Proc
.LC268:
	.ascii	"CRE_traverseM7\000"
	.global	CRE_segSubtitle_Proc
.LC269:
	.ascii	"CRE_segmentSubtitle\000"
	.global	CRE_segTitle_Proc
.LC270:
	.ascii	"CRE_segmentTitle\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR1,. + 128
	.set	.LANCHOR2,. + 256
	.set	.LANCHOR3,. + 384
	.set	.LANCHOR4,. + 512
	.set	.LANCHOR5,. + 640
	.set	.LANCHOR6,. + 768
	.type	CRE_segSubtitle_Proc, %object
	.size	CRE_segSubtitle_Proc, 48
CRE_segSubtitle_Proc:
	.short	1
	.short	0
	.word	.LC269
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_LoopBar
	.short	3
	.short	0
	.word	CRE_segSubtitleDrawChars
	.short	3
	.short	0
	.word	CRE_segSubtitleDrawChars2
	.short	0
	.short	0
	.word	0
	.type	CRE_title_Proc, %object
	.size	CRE_title_Proc, 80
CRE_title_Proc:
	.short	1
	.short	0
	.word	.LC259
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_titleInit
	.short	3
	.short	0
	.word	CRE_titleDrawChars
	.short	14
	.short	60
	.word	0
	.short	24
	.short	1
	.word	CRE_setBitfield
	.short	16
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_titleRemoveChars
	.short	3
	.short	0
	.word	CRE_waitForChildren
	.short	0
	.short	0
	.word	0
	.type	CRE_sprite_Proc, %object
	.size	CRE_sprite_Proc, 80
CRE_sprite_Proc:
	.short	1
	.short	0
	.word	.LC261
	.short	14
	.short	0
	.word	0
	.short	14
	.short	30
	.word	0
	.short	2
	.short	0
	.word	CRE_spriteInit
	.short	3
	.short	0
	.word	CRE_spriteMoveIn
	.short	14
	.short	31
	.word	0
	.short	24
	.short	2
	.word	CRE_setBitfield
	.short	16
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_spriteMoveOut
	.short	0
	.short	0
	.word	0
	.type	CRE_authors_Proc, %object
	.size	CRE_authors_Proc, 120
CRE_authors_Proc:
	.short	1
	.short	0
	.word	.LC258
	.short	14
	.short	0
	.word	0
	.short	14
	.short	45
	.word	0
	.short	11
	.short	0
	.word	0
	.short	9
	.short	0
	.word	CRE_author_Proc
	.short	14
	.short	15
	.word	0
	.short	2
	.short	0
	.word	CRE_authorsInit
	.short	24
	.short	0
	.word	CRE_createAuthChild
	.short	24
	.short	1
	.word	CRE_createAuthChild
	.short	24
	.short	2
	.word	CRE_createAuthChild
	.short	14
	.short	90
	.word	0
	.short	22
	.short	0
	.word	CRE_blockWhenDone
	.short	2
	.short	0
	.word	CRE_blendOutAuth
	.short	14
	.short	0
	.word	0
	.short	0
	.short	0
	.word	0
	.type	CRE_music_Proc, %object
	.size	CRE_music_Proc, 64
CRE_music_Proc:
	.short	1
	.short	0
	.word	.LC254
	.short	4
	.short	0
	.word	CRE_musicDestructor
	.short	14
	.short	0
	.word	0
	.short	11
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_musicInit
	.short	14
	.short	300
	.word	0
	.short	3
	.short	0
	.word	CRE_musicLoop
	.short	0
	.short	0
	.word	0
	.type	CRE_author_Proc, %object
	.size	CRE_author_Proc, 40
CRE_author_Proc:
	.short	1
	.short	0
	.word	.LC257
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_moveAuth
	.short	3
	.short	0
	.word	CRE_drawAuth
	.short	0
	.short	0
	.word	0
	.type	CRE_segTitle_Proc, %object
	.size	CRE_segTitle_Proc, 104
CRE_segTitle_Proc:
	.short	1
	.short	0
	.word	.LC270
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_segTitleInit
	.short	2
	.short	0
	.word	CRE_segTitleDrawFirstChar
	.short	14
	.short	16
	.word	0
	.short	3
	.short	0
	.word	CRE_segTitleDrawChars
	.short	14
	.short	20
	.word	0
	.short	2
	.short	0
	.word	CRE_segSubtitleInit
	.short	14
	.short	60
	.word	0
	.short	3
	.short	0
	.word	CRE_segTitleRemoveChars
	.short	2
	.short	0
	.word	CRE_segSubtitleEnd
	.short	3
	.short	0
	.word	CRE_waitForChildren
	.short	0
	.short	0
	.word	0
	.type	CRE_traverseM7Dim_Proc, %object
	.size	CRE_traverseM7Dim_Proc, 32
CRE_traverseM7Dim_Proc:
	.short	1
	.short	0
	.word	.LC267
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_moveCam
	.short	0
	.short	0
	.word	0
	.type	CRE_traverseM7Rot_Proc, %object
	.size	CRE_traverseM7Rot_Proc, 32
CRE_traverseM7Rot_Proc:
	.short	1
	.short	0
	.word	.LC266
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_rotateCam
	.short	0
	.short	0
	.word	0
	.type	CRE_otherSprite_Proc, %object
	.size	CRE_otherSprite_Proc, 80
CRE_otherSprite_Proc:
	.short	1
	.short	0
	.word	.LC262
	.short	11
	.short	0
	.word	0
	.short	14
	.short	121
	.word	0
	.short	2
	.short	0
	.word	CRE_otherCheckIfMosaic
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_setOtherVariant
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	12
	.short	0
	.word	0
	.short	0
	.short	0
	.word	0
	.type	CRE_creditReel_Proc, %object
	.size	CRE_creditReel_Proc, 88
CRE_creditReel_Proc:
	.short	1
	.short	0
	.word	.LC256
	.short	24
	.short	8
	.word	NewFadeIn
	.short	20
	.short	0
	.word	FadeInExists
	.short	14
	.short	90
	.word	0
	.short	11
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_reelInit
	.short	3
	.short	0
	.word	CRE_reelLoop
	.short	14
	.short	60
	.word	0
	.short	3
	.short	0
	.word	CRE_waitForChildren
	.short	2
	.short	0
	.word	CRE_nextEntry
	.short	0
	.short	0
	.word	0
	.type	CRE_traverseM7_Proc, %object
	.size	CRE_traverseM7_Proc, 32
CRE_traverseM7_Proc:
	.short	1
	.short	0
	.word	.LC268
	.short	14
	.short	31
	.word	0
	.short	3
	.short	0
	.word	CRE_traverseM7Loop
	.short	0
	.short	0
	.word	0
	.type	CRE_drawBGSprites_Proc, %object
	.size	CRE_drawBGSprites_Proc, 24
CRE_drawBGSprites_Proc:
	.short	1
	.short	0
	.word	.LC265
	.short	3
	.short	0
	.word	CRE_loopDrawBGSprites
	.short	0
	.short	0
	.word	0
	.type	CRE_drawSprite_Proc, %object
	.size	CRE_drawSprite_Proc, 32
CRE_drawSprite_Proc:
	.short	1
	.short	0
	.word	.LC260
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_drawSprite
	.short	0
	.short	0
	.word	0
.LC0:
	.word	16384
	.short	3
	.space	2
	.word	16384
	.short	3
	.space	2
	.word	16384
	.short	3
	.space	2
	.word	16384
	.short	3
	.space	2
	.type	CRE_credits_Proc, %object
	.size	CRE_credits_Proc, 112
CRE_credits_Proc:
	.short	1
	.short	0
	.word	.LC253
	.short	2
	.short	0
	.word	CRE_init
	.short	11
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_segmentTitleInit
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_segmentInit
	.short	14
	.short	0
	.word	0
	.short	24
	.short	4
	.word	NewFadeOut
	.short	20
	.short	0
	.word	FadeOutExists
	.short	11
	.short	1
	.word	0
	.short	2
	.short	0
	.word	CRE_segmentEnd
	.short	2
	.short	0
	.word	CRE_end
	.short	14
	.short	16
	.word	0
	.short	0
	.short	0
	.word	0
	.type	CRE_keylistener_Proc, %object
	.size	CRE_keylistener_Proc, 128
CRE_keylistener_Proc:
	.short	1
	.short	0
	.word	.LC255
	.short	11
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_listenForKeys
	.short	11
	.short	1
	.word	0
	.short	24
	.short	8
	.word	NewFadeOut
	.short	20
	.short	0
	.word	FadeOutExists
	.short	2
	.short	0
	.word	CRE_skipSegment
	.short	14
	.short	0
	.word	0
	.short	12
	.short	0
	.word	0
	.short	11
	.short	2
	.word	0
	.short	24
	.short	8
	.word	NewFadeOut
	.short	20
	.short	0
	.word	FadeOutExists
	.short	2
	.short	0
	.word	CRE_skipCredits
	.short	14
	.short	0
	.word	0
	.short	12
	.short	0
	.word	0
	.short	0
	.short	0
	.word	0
	.type	CRE_portraitSprite_Proc, %object
	.size	CRE_portraitSprite_Proc, 136
CRE_portraitSprite_Proc:
	.short	1
	.short	0
	.word	.LC263
	.short	11
	.short	0
	.word	0
	.short	14
	.short	31
	.word	0
	.short	24
	.short	18
	.word	CRE_setFaceDisplayBits
	.short	14
	.short	60
	.word	0
	.short	24
	.short	26
	.word	CRE_setFaceDisplayBits
	.short	14
	.short	60
	.word	0
	.short	24
	.short	10
	.word	CRE_setFaceDisplayBits
	.short	14
	.short	60
	.word	0
	.short	2
	.short	0
	.word	CRE_portraitCheckIfMosaic
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_setPortraitVariant
	.short	24
	.short	2
	.word	CRE_setFaceDisplayBits
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	12
	.short	0
	.word	0
	.short	0
	.short	0
	.word	0
	.type	CRE_classSprite_Proc, %object
	.size	CRE_classSprite_Proc, 400
CRE_classSprite_Proc:
	.short	1
	.short	0
	.word	.LC264
	.short	14
	.short	45
	.word	0
	.short	22
	.short	0
	.word	CRE_ccCheckIfMosaic
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_ccSetVariant
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	14
	.short	45
	.word	0
	.short	11
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_initMapSprites1
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	CRE_initMapSprites2
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_SMSLoop
	.short	3
	.short	0
	.word	CRE_MMSLoop
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	9
	.short	0
	.word	CRE_drawSprite_Proc
	.short	14
	.short	0
	.word	0
	.short	24
	.short	6
	.word	CRE_doAnim
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	14
	.short	0
	.word	0
	.short	24
	.short	0
	.word	CRE_doAnim
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_waitUntilFinished
	.short	14
	.short	30
	.word	0
	.short	2
	.short	0
	.word	CRE_doReturn
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_waitUntilFinished
	.short	2
	.short	0
	.word	CRE_baCheckIfMosaic
	.short	14
	.short	10
	.word	0
	.short	2
	.short	0
	.word	CRE_increaseMosaic
	.short	14
	.short	0
	.word	0
	.short	24
	.short	262
	.word	CRE_doAnim
	.short	2
	.short	0
	.word	CRE_decreaseMosaic
	.short	14
	.short	10
	.word	0
	.short	11
	.short	1
	.word	0
	.short	14
	.short	0
	.word	0
	.short	24
	.short	257
	.word	CRE_doAnim
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_waitUntilFinished
	.short	14
	.short	30
	.word	0
	.short	2
	.short	0
	.word	CRE_doReturn
	.short	14
	.short	0
	.word	0
	.short	3
	.short	0
	.word	CRE_waitUntilFinished
	.short	14
	.short	15
	.word	0
	.short	0
	.short	0
	.word	0
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.text
	.code 16
	.align	1
.L65:
	bx	r2
.L17:
	bx	r3
.L101:
	bx	r4
.L52:
	bx	r5
.L163:
	bx	r6
.L32:
	bx	r7
