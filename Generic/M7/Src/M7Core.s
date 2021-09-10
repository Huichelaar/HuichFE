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
	.file	"M7Core.c"
	.text
	.align	1
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7SortedMerge, %function
m7SortedMerge:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r4, r0
	movs	r5, r1
	cmp	r0, #0
	beq	.L4
	cmp	r1, #0
	beq	.L2
	ldr	r3, [r0, #20]
	ldr	r2, [r1, #20]
	cmp	r3, r2
	bge	.L3
	ldr	r1, [r1, #36]
	bl	m7SortedMerge
	str	r0, [r4, #36]
.L2:
	@ sp needed
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L3:
	ldr	r0, [r0, #36]
	bl	m7SortedMerge
	str	r0, [r5, #36]
.L4:
	movs	r4, r5
	b	.L2
	.size	m7SortedMerge, .-m7SortedMerge
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7VSync, %function
m7VSync:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L20
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r5, [r3]
	ldr	r7, [r5]
	ldr	r3, [r7, #80]
	ldr	r6, [r7, #92]
	str	r3, [sp, #4]
	cmp	r3, #0
	beq	.L9
	movs	r0, #192
	movs	r1, r3
	lsls	r0, r0, #2
	muls	r1, r0
	muls	r0, r6
	ldr	r3, [r7, #48]
	subs	r0, r0, r3
	lsls	r0, r0, #8
	ldr	r3, .L20+4
	bl	.L22
	movs	r3, #80
	subs	r3, r3, r0
.L19:
	strh	r3, [r5, #16]
	movs	r2, #16
	ldrsh	r3, [r5, r2]
	cmp	r3, #0
	bge	.L12
	movs	r3, #0
	strh	r3, [r5, #16]
.L12:
	movs	r3, #16
	ldrsh	r4, [r5, r3]
	lsls	r3, r4, #16
	lsrs	r3, r3, #16
	cmp	r3, #159
	bhi	.L8
	movs	r3, r4
	ldr	r2, [sp, #4]
	subs	r3, r3, #80
	muls	r2, r3
	ldr	r7, [r7, #48]
	lsls	r6, r6, #8
	lsls	r7, r7, #12
	adds	r6, r2, r6
	adds	r5, r5, #18
.L15:
	subs	r1, r6, #0
	bne	.L14
	movs	r1, #1
.L14:
	ldr	r3, .L20+4
	movs	r0, r7
	bl	.L22
	lsls	r3, r4, #1
	strh	r0, [r5, r3]
	ldr	r3, [sp, #4]
	adds	r4, r4, #1
	adds	r6, r6, r3
	cmp	r4, #160
	bne	.L15
.L8:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	subs	r3, r6, #1
	ldr	r2, .L20+8
	orrs	r3, r6
	asrs	r3, r3, #31
	adds	r3, r3, r2
	b	.L19
.L21:
	.align	2
.L20:
	.word	m7World
	.word	Div
	.word	-32768
	.size	m7VSync, .-m7VSync
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7MergeSort, %function
m7MergeSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0]
	push	{r0, r1, r4, lr}
	movs	r4, r0
	cmp	r2, #0
	beq	.L23
	ldr	r1, [r2, #36]
	movs	r3, r2
	cmp	r1, #0
	beq	.L23
.L25:
	ldr	r1, [r1, #36]
	cmp	r1, #0
	beq	.L27
	ldr	r1, [r1, #36]
	ldr	r3, [r3, #36]
	cmp	r1, #0
	bne	.L25
.L27:
	str	r2, [sp]
	ldr	r2, [r3, #36]
	str	r2, [sp, #4]
	movs	r2, #0
	mov	r0, sp
	str	r2, [r3, #36]
	bl	m7MergeSort
	add	r0, sp, #4
	bl	m7MergeSort
	ldr	r1, [sp, #4]
	ldr	r0, [sp]
	bl	m7SortedMerge
	str	r0, [r4]
.L23:
	@ sp needed
	pop	{r0, r1, r4}
	pop	{r0}
	bx	r0
	.size	m7MergeSort, .-m7MergeSort
	.align	1
	.global	m7End
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7End, %function
m7End:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L38
	@ sp needed
	ldr	r5, .L38+4
	movs	r0, r4
	bl	.L40
	movs	r0, r4
	adds	r0, r0, #8
	bl	.L40
	movs	r0, #0
	ldr	r3, .L38+8
	bl	.L22
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L39:
	.align	2
.L38:
	.word	.LANCHOR0
	.word	EndEachProc
	.word	SetSecondaryHBlankCallback
	.size	m7End, .-m7End
	.align	1
	.global	m7SortSprites
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7SortSprites, %function
m7SortSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L42
	@ sp needed
	ldr	r0, [r3]
	adds	r0, r0, #4
	bl	m7MergeSort
	pop	{r4}
	pop	{r0}
	bx	r0
.L43:
	.align	2
.L42:
	.word	m7World
	.size	m7SortSprites, .-m7SortSprites
	.align	1
	.global	m7DisplaySprites
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7DisplaySprites, %function
m7DisplaySprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r4, r5, r6, lr}
	movs	r5, #1
	ldr	r3, .L47
	ldr	r3, [r3]
	ldr	r4, [r3, #4]
.L45:
	cmp	r4, #0
	bne	.L46
	@ sp needed
	pop	{r0, r1, r4, r5, r6}
	pop	{r0}
	bx	r0
.L46:
	mov	r3, sp
	mov	r2, sp
	strh	r5, [r3]
	ldrh	r3, [r4, #24]
	strh	r3, [r2, #2]
	ldrh	r3, [r4, #26]
	strh	r3, [r2, #4]
	ldrh	r3, [r4, #28]
	strh	r3, [r2, #6]
	movs	r3, #0
	ldr	r6, .L47+4
	movs	r1, r3
	movs	r0, r3
	bl	.L49
	ldr	r4, [r4, #36]
	b	.L45
.L48:
	.align	2
.L47:
	.word	m7World
	.word	PushToLoOAM
	.size	m7DisplaySprites, .-m7DisplaySprites
	.align	1
	.global	m7InitSprite
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7InitSprite, %function
m7InitSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L51
	@ sp needed
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	str	r2, [r0, #36]
	str	r0, [r3, #4]
	bx	lr
.L52:
	.align	2
.L51:
	.word	m7World
	.size	m7InitSprite, .-m7InitSprite
	.align	1
	.global	m7Identity
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7Identity, %function
m7Identity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L54
	push	{r4, lr}
	ldr	r3, [r3]
	@ sp needed
	ldr	r0, [r3]
	ldr	r1, .L54+4
	movs	r2, #56
	ldr	r3, .L54+8
	adds	r0, r0, #44
	adds	r1, r1, #32
	bl	.L22
	pop	{r4}
	pop	{r0}
	bx	r0
.L55:
	.align	2
.L54:
	.word	m7World
	.word	.LANCHOR0
	.word	memcpy
	.size	m7Identity, .-m7Identity
	.align	1
	.global	m7Init
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7Init, %function
m7Init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L57
	@ sp needed
	ldr	r3, .L57+4
	movs	r1, #7
	ldr	r5, .L57+8
	movs	r0, r4
	ldr	r6, [r3]
	bl	.L40
	movs	r3, #80
	str	r0, [r6]
	strh	r3, [r6, #16]
	bl	m7Identity
	movs	r0, r4
	movs	r1, #0
	adds	r0, r0, #8
	bl	.L40
	ldr	r3, .L57+12
	ldr	r5, [r3]
	ldr	r3, .L57+16
	ldr	r2, [r3]
	movs	r3, #128
	movs	r4, r0
	lsls	r2, r2, #9
	lsls	r3, r3, #19
	lsrs	r2, r2, #11
	orrs	r2, r3
	ldr	r3, .L57+20
	movs	r1, r5
	ldr	r0, [r3]
	ldr	r3, .L57+24
	bl	.L22
	movs	r0, r5
	ldr	r3, .L57+28
	bl	.L22
	movs	r0, r4
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	m7World
	.word	ProcStart
	.word	m7RamFunc
	.word	m7RamFuncSize
	.word	m7RamFuncRom
	.word	CpuSet
	.word	SetSecondaryHBlankCallback
	.size	m7Init, .-m7Init
	.align	1
	.global	m7Rotate
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7Rotate, %function
m7Rotate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	movs	r6, #255
	@ sp needed
	ldr	r3, .L60
	ldr	r3, [r3]
	ldr	r3, [r3]
	ldr	r7, .L60+4
	ldr	r5, .L60+8
	str	r0, [r3, #60]
	ands	r0, r6
	ands	r6, r1
	lsls	r0, r0, #1
	lsls	r6, r6, #1
	ldrsh	r4, [r0, r7]
	str	r1, [r3, #56]
	ldrsh	r2, [r0, r5]
	ldrsh	r1, [r6, r7]
	ldrsh	r0, [r6, r5]
	movs	r5, #0
	asrs	r0, r0, #4
	asrs	r2, r2, #4
	str	r5, [r3, #68]
	movs	r5, r0
	muls	r5, r2
	asrs	r4, r4, #4
	asrs	r5, r5, #8
	asrs	r1, r1, #4
	str	r2, [r3, #72]
	str	r5, [r3, #76]
	rsbs	r2, r2, #0
	rsbs	r5, r4, #0
	muls	r5, r0
	muls	r2, r1
	str	r1, [r3, #80]
	muls	r1, r4
	asrs	r5, r5, #8
	asrs	r2, r2, #8
	asrs	r1, r1, #8
	str	r5, [r3, #84]
	str	r4, [r3, #64]
	str	r2, [r3, #88]
	str	r0, [r3, #92]
	str	r1, [r3, #96]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L61:
	.align	2
.L60:
	.word	m7World
	.word	gCosLookup
	.word	gSinLookup
	.size	m7Rotate, .-m7Rotate
	.align	1
	.global	m7TranslateLevel
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7TranslateLevel, %function
m7TranslateLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L63
	ldr	r3, [r3]
	ldr	r3, [r3]
	push	{r4, r5, r6, r7, lr}
	ldr	r5, [r3, #64]
	@ sp needed
	ldr	r6, [r3, #72]
	movs	r4, r0
	muls	r4, r5
	movs	r7, r2
	muls	r7, r6
	muls	r0, r6
	muls	r2, r5
	subs	r4, r4, r7
	ldr	r7, [r3, #44]
	asrs	r4, r4, #8
	adds	r4, r7, r4
	str	r4, [r3, #44]
	adds	r0, r0, r2
	ldr	r4, [r3, #48]
	ldr	r2, [r3, #52]
	asrs	r0, r0, #8
	adds	r1, r4, r1
	adds	r0, r2, r0
	str	r1, [r3, #48]
	str	r0, [r3, #52]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L64:
	.align	2
.L63:
	.word	m7World
	.size	m7TranslateLevel, .-m7TranslateLevel
	.align	1
	.global	m7TranslateLocal
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7TranslateLocal, %function
m7TranslateLocal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	movs	r5, r2
	@ sp needed
	ldr	r3, .L66
	ldr	r3, [r3]
	ldr	r3, [r3]
	ldr	r4, [r3, #64]
	ldr	r2, [r3, #76]
	muls	r4, r0
	muls	r2, r1
	adds	r4, r4, r2
	ldr	r2, [r3, #88]
	muls	r2, r5
	adds	r4, r4, r2
	ldr	r2, [r3, #44]
	asrs	r4, r4, #8
	adds	r4, r2, r4
	str	r4, [r3, #44]
	ldr	r2, [r3, #80]
	ldr	r4, [r3, #92]
	muls	r2, r1
	muls	r4, r5
	adds	r2, r2, r4
	ldr	r4, [r3, #48]
	asrs	r2, r2, #8
	adds	r2, r4, r2
	str	r2, [r3, #48]
	ldr	r2, [r3, #72]
	muls	r2, r0
	ldr	r0, [r3, #84]
	muls	r0, r1
	ldr	r1, [r3, #96]
	muls	r1, r5
	adds	r2, r2, r0
	adds	r2, r2, r1
	ldr	r1, [r3, #52]
	asrs	r2, r2, #8
	adds	r2, r1, r2
	str	r2, [r3, #52]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L67:
	.align	2
.L66:
	.word	m7World
	.size	m7TranslateLocal, .-m7TranslateLocal
	.align	1
	.global	m7TranslateGlobal
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	m7TranslateGlobal, %function
m7TranslateGlobal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L69
	ldr	r3, [r3]
	ldr	r3, [r3]
	push	{r4, lr}
	ldr	r4, [r3, #44]
	@ sp needed
	adds	r0, r4, r0
	str	r0, [r3, #44]
	ldr	r0, [r3, #48]
	adds	r1, r0, r1
	str	r1, [r3, #48]
	ldr	r1, [r3, #52]
	adds	r2, r1, r2
	str	r2, [r3, #52]
	pop	{r4}
	pop	{r0}
	bx	r0
.L70:
	.align	2
.L69:
	.word	m7World
	.size	m7TranslateGlobal, .-m7TranslateGlobal
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC28:
	.ascii	"m7 VSync\000"
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	sM7DataProc, %object
	.size	sM7DataProc, 8
sM7DataProc:
	.short	16
	.short	0
	.word	0
	.type	sM7VSyncProc, %object
	.size	sM7VSyncProc, 24
sM7VSyncProc:
	.short	1
	.short	0
	.word	.LC28
	.short	3
	.short	0
	.word	m7VSync
	.short	0
	.short	0
	.word	0
	.type	sDefaultCam.0, %object
	.size	sDefaultCam.0, 56
sDefaultCam.0:
	.word	53504
	.word	6400
	.word	231424
	.word	2560
	.word	9728
	.word	256
	.word	0
	.word	0
	.word	0
	.word	256
	.word	0
	.word	0
	.word	0
	.word	256
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.text
	.code 16
	.align	1
.L22:
	bx	r3
.L40:
	bx	r5
.L49:
	bx	r6
