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
	.file	"Mosaic.c"
	.text
	.align	1
	.global	mosaicInit
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	mosaicInit, %function
mosaicInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	movs	r3, r0
	movs	r2, #0
	adds	r3, r3, #48
	strb	r2, [r3]
	ldr	r3, .L3
	ldrh	r2, [r0, #42]
	strh	r2, [r3, #56]
	adds	r0, r0, #41
	ldrb	r3, [r0]
	cmp	r3, #0
	bne	.L1
	adds	r3, r3, #1
	strb	r3, [r0]
.L1:
	@ sp needed
	bx	lr
.L4:
	.align	2
.L3:
	.word	gLCDIOBuffer
	.size	mosaicInit, .-mosaicInit
	.global	__aeabi_uidivmod
	.global	__aeabi_idivmod
	.align	1
	.global	mosaicLoop
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	mosaicLoop, %function
mosaicLoop:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	movs	r3, r0
	push	{r4, r5, r6, lr}
	adds	r3, r3, #48
	movs	r4, r0
	ldrb	r0, [r3]
	adds	r0, r0, #1
	lsls	r0, r0, #24
	lsrs	r0, r0, #24
	strb	r0, [r3]
	adds	r3, r3, #1
	ldrb	r3, [r3]
	cmp	r3, r0
	bne	.L6
	movs	r0, r4
	ldr	r3, .L11
	bl	.L13
.L5:
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	rsbs	r3, r0, #0
	adcs	r0, r0, r3
	movs	r3, r4
	adds	r3, r3, #41
	ldrb	r1, [r3]
	ldr	r3, .L11+4
	bl	.L13
	cmp	r1, #0
	beq	.L5
	movs	r2, r4
	movs	r0, #240
	ldr	r1, .L11+8
	adds	r2, r2, #45
	ldrb	r2, [r2]
	ldrh	r3, [r1, #56]
	lsls	r2, r2, #4
	adds	r2, r3, r2
	ands	r0, r2
	movs	r2, r4
	movs	r5, #240
	adds	r2, r2, #46
	ldrb	r2, [r2]
	lsls	r2, r2, #8
	adds	r2, r3, r2
	lsls	r5, r5, #4
	ands	r2, r5
	orrs	r2, r0
	movs	r0, r4
	movs	r5, #15
	adds	r0, r0, #44
	ldrb	r0, [r0]
	adds	r0, r3, r0
	ands	r0, r5
	adds	r4, r4, #47
	orrs	r0, r2
	ldrb	r2, [r4]
	lsls	r2, r2, #12
	adds	r3, r3, r2
	lsrs	r3, r3, #12
	lsls	r3, r3, #12
	orrs	r3, r0
	strh	r3, [r1, #56]
	b	.L5
.L12:
	.align	2
.L11:
	.word	BreakProcLoop
	.word	__aeabi_idivmod
	.word	gLCDIOBuffer
	.size	mosaicLoop, .-mosaicLoop
	.global	Procs_Mosaic
	.section	.rodata.str1.1,"aMS",%progbits,1
.LC5:
	.ascii	"Procs_Mosaic\000"
	.section	.rodata
	.align	2
	.type	Procs_Mosaic, %object
	.size	Procs_Mosaic, 40
Procs_Mosaic:
	.short	1
	.short	0
	.word	.LC5
	.short	14
	.short	0
	.word	0
	.short	2
	.short	0
	.word	mosaicInit
	.short	3
	.short	0
	.word	mosaicLoop
	.short	0
	.short	0
	.word	0
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.text
	.code 16
	.align	1
.L13:
	bx	r3
