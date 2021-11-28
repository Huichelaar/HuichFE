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
	.global	SCU_autolevel
	.arch armv4t
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
	ldr	r3, .L7
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	ldr	r5, [r3]
	movs	r7, r5
	movs	r6, r0
	movs	r2, #1
	adds	r7, r7, #60
.L5:
	ldrb	r1, [r5, #1]
	ldr	r3, .L7+4
	ldrb	r3, [r3, r1]
	cmp	r3, #0
	bne	.L2
	ldr	r3, .L7+8
	ldrb	r3, [r3, r1]
.L2:
	ldrb	r0, [r6, #8]
	adds	r4, r0, #0
	cmp	r0, r3
	bls	.L3
	adds	r4, r3, #0
.L3:
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	subs	r2, r4, r2
	lsls	r2, r2, #24
	ldr	r3, .L7+12
	movs	r0, r6
	asrs	r2, r2, #24
	bl	.L9
	movs	r3, #8
	ldrsb	r3, [r6, r3]
	cmp	r4, r3
	beq	.L1
	adds	r5, r5, #20
	cmp	r5, r7
	bne	.L6
.L1:
	@ sp needed
	pop	{r3, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	movs	r2, r4
	b	.L5
.L8:
	.align	2
.L7:
	.word	FirstUNITCommand
	.word	ClassPromoLevelTableLABEL
	.word	Class_Level_Cap_TableLABEL
	.word	UnitAutolevelCore
	.size	SCU_autolevel, .-SCU_autolevel
	.align	1
	.global	SCU_autoPromoteUnit
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
.L11:
	ldrb	r1, [r3]
	ldrb	r5, [r2]
	adds	r1, r1, r5
	strb	r1, [r3]
	adds	r3, r3, #1
	adds	r2, r2, #1
	cmp	r3, r4
	bne	.L11
	@ sp needed
	ldrb	r3, [r0, #19]
	strb	r3, [r0, #18]
	ldr	r3, [r0, #4]
	ldrb	r2, [r3, #4]
	ldr	r3, .L13
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
.L14:
	.align	2
.L13:
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
.L17:
	ldr	r3, [r5, #4]
	ldr	r2, .L21
	ldrb	r3, [r3, #4]
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L15
	movs	r2, #8
	ldrsb	r2, [r5, r2]
	cmp	r2, r3
	blt	.L15
	ldrb	r3, [r4, #21]
	muls	r3, r6
	ldr	r2, .L21+4
	adds	r3, r3, r2
	movs	r0, r5
	str	r3, [r5, #4]
	adds	r4, r4, #20
	bl	SCU_autoPromoteUnit
	b	.L17
.L15:
	movs	r0, r4
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L22:
	.align	2
.L21:
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
	ldr	r3, .L37
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	push	{r4, r5, r6, r7, lr}
	movs	r4, r0
	ldr	r0, [r3]
	movs	r3, #110
	movs	r2, #0
	sub	sp, sp, #132
	add	r3, r3, sp
	strb	r2, [r3]
	movs	r2, #11
	ldr	r3, [r4]
	ldrsb	r2, [r3, r2]
	ldrb	r3, [r4, #8]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	asrs	r5, r3, #24
	cmp	r3, #0
	beq	.L23
	strb	r2, [r4, #8]
	cmp	r5, #0
	ble	.L23
	ldrb	r3, [r0, #1]
	ldr	r6, .L37+4
	ldrb	r1, [r6, r3]
	cmp	r1, #0
	bne	.L25
	ldr	r1, .L37+8
	ldrb	r1, [r1, r3]
.L25:
	cmp	r2, r1
	blt	.L31
	ldrb	r3, [r0, #21]
	ldrb	r6, [r6, r3]
	cmp	r6, #0
	bne	.L27
	ldr	r1, .L37+8
	ldrb	r6, [r1, r3]
.L27:
	movs	r1, #2
	cmp	r2, r6
	bge	.L28
	subs	r1, r1, #1
.L26:
	movs	r2, #84
	muls	r3, r2
	ldr	r2, .L37+12
	adds	r3, r3, r2
	str	r3, [r4, #4]
.L28:
	movs	r6, #20
	movs	r7, #100
	muls	r6, r1
	adds	r6, r0, r6
.L29:
	movs	r1, r4
	mov	r0, sp
	ldr	r3, .L37+16
	bl	.L9
	mov	r3, sp
	mov	r0, sp
	strb	r7, [r3, #9]
	ldr	r3, .L37+20
	bl	.L9
	ldr	r3, .L37+24
	mov	r1, sp
	movs	r0, r4
	bl	.L9
	movs	r0, r6
	movs	r1, r4
	bl	SCU_promoteUnitIfNecessary
	subs	r5, r5, #1
	lsls	r3, r5, #24
	lsls	r5, r5, #24
	movs	r6, r0
	lsrs	r3, r3, #24
	asrs	r5, r5, #24
	cmp	r3, #0
	bne	.L29
.L23:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L31:
	movs	r1, #0
	b	.L26
.L38:
	.align	2
.L37:
	.word	FirstUNITCommand
	.word	ClassPromoLevelTableLABEL
	.word	Class_Level_Cap_TableLABEL
	.word	ClassTableLABEL
	.word	InitBattleUnit
	.word	CheckBattleUnitLevelUp
	.word	UpdateUnitFromBattle
	.size	SCU_autolevelRealistic, .-SCU_autolevelRealistic
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
	bls	.L40
	adds	r3, r0, #0
.L40:
	lsls	r0, r3, #24
	lsrs	r0, r0, #24
	@ sp needed
	bx	lr
	.size	SCU_min, .-SCU_min
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L9:
	bx	r3
