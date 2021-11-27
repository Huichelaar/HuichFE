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
	.file	"Autolevel.c"
	.text
	.align	1
	.global	SCU_autoPromoteUnit
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SCU_autoPromoteUnit, %function
SCU_autoPromoteUnit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldrb	r3, [r0, #18]
	movs	r4, r0
	strb	r3, [r0, #19]
	movs	r3, r0
	ldr	r2, [r0, #4]
	adds	r3, r3, #19
	adds	r2, r2, #34
	adds	r4, r4, #25
.L2:
	ldrb	r1, [r3]
	ldrb	r5, [r2]
	adds	r1, r1, r5
	strb	r1, [r3]
	adds	r3, r3, #1
	adds	r2, r2, #1
	cmp	r3, r4
	bne	.L2
	@ sp needed
	ldrb	r3, [r0, #19]
	strb	r3, [r0, #18]
	ldr	r3, [r0, #4]
	ldrb	r2, [r3, #4]
	ldr	r3, .L4
	lsls	r2, r2, #2
	adds	r0, r0, #58
	adds	r3, r3, r2
	ldrb	r3, [r3, #3]
	ldrb	r2, [r0]
	adds	r3, r3, r2
	strb	r3, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L5:
	.align	2
.L4:
	.word	MagClassTableLABEL
	.size	SCU_autoPromoteUnit, .-SCU_autoPromoteUnit
	.align	1
	.global	SCU_promoteUnitIfNecessary
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SCU_promoteUnitIfNecessary, %function
SCU_promoteUnitIfNecessary:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	movs	r5, r1
	movs	r4, r0
	movs	r6, #84
.L8:
	ldr	r3, [r5, #4]
	ldr	r2, .L12
	ldrb	r3, [r3, #4]
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L6
	movs	r2, #8
	ldrsb	r2, [r5, r2]
	cmp	r2, r3
	blt	.L6
	ldrb	r3, [r4, #21]
	muls	r3, r6
	ldr	r2, .L12+4
	adds	r3, r3, r2
	movs	r0, r5
	str	r3, [r5, #4]
	adds	r4, r4, #20
	bl	SCU_autoPromoteUnit
	b	.L8
.L6:
	movs	r0, r4
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L13:
	.align	2
.L12:
	.word	ClassPromoLevelTableLABEL
	.word	ClassTableLABEL
	.size	SCU_promoteUnitIfNecessary, .-SCU_promoteUnitIfNecessary
	.align	1
	.global	SCU_autolevelRealistic
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SCU_autolevelRealistic, %function
SCU_autolevelRealistic:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	movs	r2, #110
	push	{r4, r5, r6, r7, lr}
	movs	r4, r0
	ldr	r0, [r3]
	movs	r3, #0
	movs	r7, #11
	sub	sp, sp, #132
	add	r2, r2, sp
	strb	r3, [r2]
	ldr	r2, [r4]
	ldrsb	r7, [r2, r7]
	ldrb	r2, [r4, #8]
	subs	r2, r2, r7
	lsls	r2, r2, #24
	asrs	r5, r2, #24
	cmp	r2, r3
	beq	.L14
	strb	r7, [r4, #8]
	cmp	r5, r3
	ble	.L14
	ldrb	r1, [r0, #1]
	ldr	r2, .L26+4
	ldrb	r6, [r2, r1]
	cmp	r7, r6
	blt	.L16
	ldrb	r1, [r0, #21]
	ldrb	r2, [r2, r1]
	adds	r3, r3, #2
	cmp	r7, r2
	bge	.L17
	subs	r3, r3, #1
.L16:
	movs	r2, #84
	muls	r2, r1
	ldr	r1, .L26+8
	adds	r2, r2, r1
	str	r2, [r4, #4]
.L17:
	movs	r6, #20
	movs	r7, #100
	muls	r6, r3
	adds	r6, r0, r6
.L18:
	movs	r1, r4
	movs	r0, r6
	bl	SCU_promoteUnitIfNecessary
	movs	r1, r4
	ldr	r3, .L26+12
	movs	r6, r0
	mov	r0, sp
	bl	.L28
	mov	r3, sp
	mov	r0, sp
	strb	r7, [r3, #9]
	ldr	r3, .L26+16
	bl	.L28
	subs	r5, r5, #1
	ldr	r3, .L26+20
	mov	r1, sp
	movs	r0, r4
	bl	.L28
	lsls	r3, r5, #24
	lsls	r5, r5, #24
	lsrs	r3, r3, #24
	asrs	r5, r5, #24
	cmp	r3, #0
	bne	.L18
.L14:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L27:
	.align	2
.L26:
	.word	FirstUNITCommand
	.word	ClassPromoLevelTableLABEL
	.word	ClassTableLABEL
	.word	InitBattleUnit
	.word	CheckBattleUnitLevelUp
	.word	UpdateUnitFromBattle
	.size	SCU_autolevelRealistic, .-SCU_autolevelRealistic
	.align	1
	.global	SCU_autolevel
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SCU_autolevel, %function
SCU_autolevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}
	ldr	r3, .L35
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	ldr	r7, [r3]
	movs	r3, #84
	ldrb	r1, [r7, #1]
	muls	r3, r1
	ldr	r2, .L35+4
	adds	r3, r3, r2
	str	r3, [r0, #4]
	ldr	r2, .L35+8
	ldrb	r3, [r0, #8]
	ldrb	r2, [r2, r1]
	movs	r4, r0
	adds	r5, r2, #0
	cmp	r2, r3
	bls	.L30
	adds	r5, r3, #0
.L30:
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	subs	r2, r5, #1
	lsls	r2, r2, #24
	ldr	r3, .L35+12
	movs	r0, r4
	asrs	r2, r2, #24
	bl	.L28
	movs	r3, #8
	ldrsb	r3, [r4, r3]
	cmp	r5, r3
	beq	.L29
	movs	r3, #84
	ldrb	r2, [r7, #21]
	muls	r3, r2
	ldr	r2, .L35+4
	adds	r3, r2, r3
	str	r3, [r4, #4]
	movs	r0, r4
	bl	SCU_autoPromoteUnit
	ldrb	r1, [r7, #21]
	ldr	r2, .L35+8
	ldrb	r3, [r4, #8]
	ldrb	r2, [r2, r1]
	adds	r6, r2, #0
	cmp	r2, r3
	bls	.L33
	adds	r6, r3, #0
.L33:
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	subs	r2, r6, r5
	lsls	r2, r2, #24
	movs	r0, r4
	ldr	r5, .L35+12
	asrs	r2, r2, #24
	bl	.L37
	movs	r3, #8
	ldrsb	r3, [r4, r3]
	cmp	r6, r3
	beq	.L29
	movs	r3, #84
	adds	r7, r7, #40
	ldrb	r2, [r7, #1]
	muls	r3, r2
	ldr	r2, .L35+4
	adds	r3, r2, r3
	movs	r0, r4
	str	r3, [r4, #4]
	bl	SCU_autoPromoteUnit
	ldrb	r2, [r4, #8]
	subs	r2, r2, r6
	lsls	r2, r2, #24
	movs	r0, r4
	ldrb	r1, [r7, #1]
	asrs	r2, r2, #24
	bl	.L37
.L29:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L36:
	.align	2
.L35:
	.word	FirstUNITCommand
	.word	ClassTableLABEL
	.word	ClassPromoLevelTableLABEL
	.word	UnitAutolevelCore
	.size	SCU_autolevel, .-SCU_autolevel
	.align	1
	.global	SCU_min
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SCU_min, %function
SCU_min:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	adds	r3, r1, #0
	lsls	r1, r1, #24
	lsrs	r1, r1, #24
	cmp	r1, r0
	bls	.L39
	adds	r3, r0, #0
.L39:
	lsls	r0, r3, #24
	lsrs	r0, r0, #24
	@ sp needed
	bx	lr
	.size	SCU_min, .-SCU_min
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L28:
	bx	r3
.L37:
	bx	r5
