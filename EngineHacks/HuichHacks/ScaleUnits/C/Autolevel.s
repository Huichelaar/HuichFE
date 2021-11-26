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
	push	{r4, r5, r6, lr}
	ldr	r4, [r0, #4]
	movs	r6, r4
	movs	r2, #13
	adds	r6, r6, #9
.L3:
	ldrb	r1, [r0, r2]
	ldrb	r3, [r6, r2]
	ldrb	r5, [r4, r2]
	adds	r3, r3, r1
	adds	r1, r3, #0
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, r5
	bls	.L2
	adds	r1, r5, #0
.L2:
	strb	r1, [r0, r2]
	adds	r2, r2, #1
	cmp	r2, #19
	bne	.L3
	ldrb	r3, [r0, #13]
	strb	r3, [r0, #12]
	ldr	r3, [r0, #4]
	ldrb	r3, [r3, #4]
	ldr	r2, .L6
	lsls	r3, r3, #2
	adds	r2, r2, r3
	adds	r0, r0, #58
	ldrb	r3, [r2, #3]
	ldrb	r1, [r0]
	adds	r3, r3, r1
	ldrb	r1, [r2, #2]
	adds	r2, r3, #0
	lsls	r3, r3, #24
	lsrs	r3, r3, #24
	cmp	r3, r1
	bls	.L4
	adds	r2, r1, #0
.L4:
	strb	r2, [r0]
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L7:
	.align	2
.L6:
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
.L10:
	ldr	r3, [r5, #4]
	ldr	r2, .L14
	ldrb	r3, [r3, #4]
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L8
	movs	r2, #8
	ldrsb	r2, [r5, r2]
	cmp	r2, r3
	blt	.L8
	ldrb	r3, [r4, #21]
	muls	r3, r6
	ldr	r2, .L14+4
	adds	r3, r3, r2
	movs	r0, r5
	str	r3, [r5, #4]
	adds	r4, r4, #20
	bl	SCU_autoPromoteUnit
	b	.L10
.L8:
	movs	r0, r4
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L15:
	.align	2
.L14:
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
	ldr	r3, .L28
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
	beq	.L16
	strb	r7, [r4, #8]
	cmp	r5, r3
	ble	.L16
	ldrb	r1, [r0, #1]
	ldr	r2, .L28+4
	ldrb	r6, [r2, r1]
	cmp	r7, r6
	blt	.L18
	ldrb	r1, [r0, #21]
	ldrb	r2, [r2, r1]
	adds	r3, r3, #2
	cmp	r7, r2
	bge	.L19
	subs	r3, r3, #1
.L18:
	movs	r2, #84
	muls	r2, r1
	ldr	r1, .L28+8
	adds	r2, r2, r1
	str	r2, [r4, #4]
.L19:
	movs	r6, #20
	movs	r7, #100
	muls	r6, r3
	adds	r6, r0, r6
.L20:
	movs	r1, r4
	movs	r0, r6
	bl	SCU_promoteUnitIfNecessary
	movs	r1, r4
	ldr	r3, .L28+12
	movs	r6, r0
	mov	r0, sp
	bl	.L30
	movs	r2, #128
	movs	r1, r0
	ldr	r3, .L28+16
	mov	r0, sp
	bl	.L30
	mov	r3, sp
	mov	r0, sp
	strb	r7, [r3, #9]
	ldr	r3, .L28+20
	bl	.L30
	subs	r5, r5, #1
	ldr	r3, .L28+24
	mov	r1, sp
	movs	r0, r4
	bl	.L30
	lsls	r3, r5, #24
	lsls	r5, r5, #24
	lsrs	r3, r3, #24
	asrs	r5, r5, #24
	cmp	r3, #0
	bne	.L20
.L16:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L29:
	.align	2
.L28:
	.word	FirstUNITCommand
	.word	ClassPromoLevelTableLABEL
	.word	ClassTableLABEL
	.word	InitBattleUnit
	.word	memcpy
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
	ldr	r3, .L37
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	ldr	r7, [r3]
	movs	r3, #84
	ldrb	r1, [r7, #1]
	muls	r3, r1
	ldr	r2, .L37+4
	adds	r3, r3, r2
	str	r3, [r0, #4]
	ldr	r2, .L37+8
	ldrb	r3, [r0, #8]
	ldrb	r2, [r2, r1]
	movs	r4, r0
	adds	r5, r2, #0
	cmp	r2, r3
	bls	.L32
	adds	r5, r3, #0
.L32:
	lsls	r5, r5, #24
	lsrs	r5, r5, #24
	subs	r2, r5, #1
	lsls	r2, r2, #24
	ldr	r3, .L37+12
	movs	r0, r4
	asrs	r2, r2, #24
	bl	.L30
	movs	r3, #8
	ldrsb	r3, [r4, r3]
	cmp	r5, r3
	beq	.L31
	movs	r3, #84
	ldrb	r2, [r7, #21]
	muls	r3, r2
	ldr	r2, .L37+4
	adds	r3, r2, r3
	str	r3, [r4, #4]
	movs	r0, r4
	bl	SCU_autoPromoteUnit
	ldrb	r1, [r7, #21]
	ldr	r2, .L37+8
	ldrb	r3, [r4, #8]
	ldrb	r2, [r2, r1]
	adds	r6, r2, #0
	cmp	r2, r3
	bls	.L35
	adds	r6, r3, #0
.L35:
	lsls	r6, r6, #24
	lsrs	r6, r6, #24
	subs	r2, r6, r5
	lsls	r2, r2, #24
	movs	r0, r4
	ldr	r5, .L37+12
	asrs	r2, r2, #24
	bl	.L39
	movs	r3, #8
	ldrsb	r3, [r4, r3]
	cmp	r6, r3
	beq	.L31
	movs	r3, #84
	adds	r7, r7, #40
	ldrb	r2, [r7, #1]
	muls	r3, r2
	ldr	r2, .L37+4
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
	bl	.L39
.L31:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L38:
	.align	2
.L37:
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
	bls	.L41
	adds	r3, r0, #0
.L41:
	lsls	r0, r3, #24
	lsrs	r0, r0, #24
	@ sp needed
	bx	lr
	.size	SCU_min, .-SCU_min
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L30:
	bx	r3
.L39:
	bx	r5
