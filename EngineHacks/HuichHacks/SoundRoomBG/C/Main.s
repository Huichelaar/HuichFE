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
	.file	"Main.c"
	.text
	.align	1
	.global	SBG_InitChangeSongBG
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_InitChangeSongBG, %function
SBG_InitChangeSongBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, #0
	push	{r4, lr}
	strh	r3, [r0, #42]
	@ sp needed
	adds	r0, r0, #41
	strb	r3, [r0]
	movs	r2, #112
	ldr	r1, .L2
	ldr	r0, .L2+4
	ldr	r3, .L2+8
	bl	.L4
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2
.L2:
	.word	gPaletteFadeBuffer
	.word	gPaletteBuffer+64
	.word	CpuFastSet
	.size	SBG_InitChangeSongBG, .-SBG_InitChangeSongBG
	.align	1
	.global	SBG_fadePals
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_fadePals, %function
SBG_fadePals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	movs	r2, #112
	ldr	r0, .L11
	ldr	r3, .L11+4
	ldr	r1, .L11+8
	bl	.L4
	movs	r3, r4
	adds	r3, r3, #41
	ldrb	r3, [r3]
	ldrh	r2, [r4, #42]
	ldr	r0, .L11+12
	ldr	r5, .L11+16
	cmp	r3, #0
	bne	.L6
	lsls	r3, r2, #24
.L10:
	lsrs	r3, r3, #24
	movs	r2, #14
	movs	r1, #2
	bl	.L13
	ldrh	r3, [r4, #42]
	cmp	r3, #15
	bls	.L8
	movs	r0, r4
	ldr	r3, .L11+20
	bl	.L4
.L5:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	movs	r3, #16
	subs	r3, r3, r2
	lsls	r3, r3, #24
	b	.L10
.L8:
	adds	r3, r3, #1
	strh	r3, [r4, #42]
	b	.L5
.L12:
	.align	2
.L11:
	.word	gPaletteFadeBuffer
	.word	CpuFastSet
	.word	gPaletteBuffer+64
	.word	gPaletteBuffer
	.word	FadePalette
	.word	BreakProcLoop
	.size	SBG_fadePals, .-SBG_fadePals
	.align	1
	.global	SBG_DrawBG
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_DrawBG, %function
SBG_DrawBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	movs	r4, r0
	ldr	r6, .L22
	ldr	r7, .L22+4
	ldr	r5, .L22+8
	cmp	r3, #0
	bne	.L15
	ldr	r3, .L22+12
	ldr	r2, .L22+16
	mov	r0, sp
	ldr	r1, .L22+20
	str	r3, [sp]
	bl	.L24
	ldr	r3, [r4, #20]
	movs	r0, r7
	ldr	r1, [r3, #20]
	ldr	r3, .L22+24
	bl	.L4
	movs	r2, #112
	ldr	r1, .L22+28
	ldr	r0, .L22+32
	bl	.L24
	movs	r2, #127
	ldrb	r3, [r5, #24]
	ands	r3, r2
.L21:
	strb	r3, [r5, #24]
	@ sp needed
	movs	r3, #0
	strh	r3, [r4, #42]
	adds	r4, r4, #41
	adds	r3, r3, #1
	strb	r3, [r4]
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L15:
	movs	r0, r7
	movs	r7, #0
	ldr	r3, .L22+36
	bl	.L4
	ldr	r2, .L22+40
	ldr	r1, .L22+44
	add	r0, sp, #4
	str	r7, [r5, #40]
	str	r7, [sp, #4]
	bl	.L24
	ldr	r3, [r4, #44]
	ldr	r1, .L22+48
	ldr	r0, [r3]
	ldr	r3, .L22+52
	bl	.L4
	movs	r1, r7
	ldr	r0, .L22+56
.L17:
	movs	r2, #30
	movs	r3, #148
	movs	r7, #163
	mov	ip, r0
	muls	r2, r1
	lsls	r3, r3, #17
	lsls	r2, r2, #16
	lsls	r7, r7, #17
	adds	r3, r2, r3
	adds	r2, r2, r7
	lsrs	r3, r3, #16
	lsrs	r2, r2, #16
.L18:
	mov	r7, ip
	strh	r3, [r7]
	movs	r7, #2
	adds	r3, r3, #1
	lsls	r3, r3, #16
	lsrs	r3, r3, #16
	add	ip, ip, r7
	cmp	r3, r2
	bne	.L18
	adds	r1, r1, #1
	adds	r0, r0, #64
	cmp	r1, #20
	bne	.L17
	movs	r0, #3
	ldr	r3, .L22+60
	bl	.L4
	ldr	r3, [r4, #44]
	ldr	r0, [r3, #4]
	movs	r2, #112
	ldr	r1, .L22+28
	adds	r0, r0, #64
	bl	.L24
	movs	r3, #128
	ldrb	r2, [r5, #24]
	rsbs	r3, r3, #0
	orrs	r3, r2
	b	.L21
.L23:
	.align	2
.L22:
	.word	CpuFastSet
	.word	Procs_ScrollMural
	.word	gLCDIOBuffer
	.word	12517567
	.word	16777728
	.word	100726784
	.word	ProcStart
	.word	gPaletteFadeBuffer
	.word	gPaletteBuffer+64
	.word	EndEachProc
	.word	16777232
	.word	100675520
	.word	100682240
	.word	Decompress
	.word	gBg3MapBuffer
	.word	EnableBgSyncByIndex
	.size	SBG_DrawBG, .-SBG_DrawBG
	.align	1
	.global	SBG_SetupNextBG
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_SetupNextBG, %function
SBG_SetupNextBG:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	push	{r4, lr}
	cmp	r3, #0
	beq	.L26
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L27
.L26:
	ldr	r3, .L32
	bl	.L4
.L25:
	@ sp needed
	pop	{r4}
	pop	{r0}
	bx	r0
.L27:
	movs	r1, r0
	movs	r2, #0
	adds	r1, r1, #41
	strh	r2, [r0, #42]
	strb	r2, [r1]
	str	r3, [r0, #44]
	b	.L25
.L33:
	.align	2
.L32:
	.word	EndProc
	.size	SBG_SetupNextBG, .-SBG_SetupNextBG
	.align	1
	.global	SBG_waitForSongSwitch
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_waitForSongSwitch, %function
SBG_waitForSongSwitch:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #48]
	ldr	r2, [r0, #44]
	push	{r4, r5, r6, lr}
	movs	r4, r0
	cmp	r2, r3
	beq	.L34
	ldr	r2, [r0, #52]
	ldr	r1, [r0, #56]
	cmp	r2, r1
	bne	.L36
	str	r3, [r0, #44]
.L34:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L36:
	ldr	r5, .L37
	ldr	r3, .L37+4
	movs	r0, r5
	bl	.L4
	ldr	r3, .L37+8
	movs	r1, r4
	movs	r0, r5
	bl	.L4
	ldr	r3, [r4, #56]
	ldr	r2, [r4, #48]
	str	r3, [r0, #44]
	str	r2, [r4, #44]
	str	r3, [r4, #52]
	b	.L34
.L38:
	.align	2
.L37:
	.word	.LANCHOR0
	.word	EndEachProc
	.word	ProcStart
	.size	SBG_waitForSongSwitch, .-SBG_waitForSongSwitch
	.align	1
	.global	SBG_DetermineSongBGStruct
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SBG_DetermineSongBGStruct, %function
SBG_DetermineSongBGStruct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	movs	r4, #250
	movs	r1, r0
	movs	r3, #0
	ldr	r5, .L45
	lsls	r4, r4, #2
.L42:
	lsls	r2, r3, #3
	adds	r2, r2, r5
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L39
	cmp	r0, r1
	bne	.L41
	ldr	r0, [r2, #4]
.L39:
	@ sp needed
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L41:
	adds	r3, r3, #1
	cmp	r3, r4
	bne	.L42
	movs	r0, #0
	b	.L39
.L46:
	.align	2
.L45:
	.word	songBGList
	.size	SBG_DetermineSongBGStruct, .-SBG_DetermineSongBGStruct
	.global	SBG_ChangeSongBG_Proc
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC24:
	.ascii	"SBG_ChangeSongBG\000"
	.global	SBG_Main_Proc
.LC25:
	.ascii	"SBG_Main\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	SBG_ChangeSongBG_Proc, %object
	.size	SBG_ChangeSongBG_Proc, 88
SBG_ChangeSongBG_Proc:
	.short	1
	.short	0
	.word	.LC24
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	SBG_InitChangeSongBG
	.short	11
	.short	0
	.word	0
	.short	3
	.short	0
	.word	SBG_fadePals
	.short	2
	.short	0
	.word	SBG_DrawBG
	.short	3
	.short	0
	.word	SBG_fadePals
	.short	2
	.short	0
	.word	SBG_SetupNextBG
	.short	14
	.short	300
	.word	0
	.short	12
	.short	0
	.word	0
	.short	0
	.short	0
	.word	0
	.type	SBG_Main_Proc, %object
	.size	SBG_Main_Proc, 16
SBG_Main_Proc:
	.short	1
	.short	0
	.word	.LC25
	.short	3
	.short	0
	.word	SBG_waitForSongSwitch
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.text
	.code 16
	.align	1
.L4:
	bx	r3
.L13:
	bx	r5
.L24:
	bx	r6
