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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r0, r1, r2, r4, r5, r6, r7, lr}
	ldr	r3, .L15
	ldr	r7, .L15+4
	movs	r6, r0
	lsls	r3, r3, #5
	ldr	r0, [r7]
	lsrs	r3, r3, #5
	ldr	r5, [r3]
	lsls	r3, r0, #31
	bpl	.L2
	ldr	r3, .L15+8
	lsrs	r0, r0, #16
	bl	.L17
.L2:
	movs	r3, r5
	movs	r2, #1
	adds	r3, r3, #60
	str	r3, [sp, #4]
.L6:
	ldrb	r1, [r5, #1]
	ldr	r3, .L15+12
	ldrb	r3, [r3, r1]
	cmp	r3, #0
	bne	.L3
	ldr	r3, .L15+16
	ldrb	r3, [r3, r1]
.L3:
	ldrb	r0, [r6, #8]
	adds	r4, r0, #0
	cmp	r0, r3
	bls	.L4
	adds	r4, r3, #0
.L4:
	lsls	r4, r4, #24
	lsrs	r4, r4, #24
	subs	r2, r4, r2
	lsls	r2, r2, #24
	ldr	r3, .L15+20
	movs	r0, r6
	asrs	r2, r2, #24
	bl	.L17
	movs	r3, #8
	ldrsb	r3, [r6, r3]
	cmp	r4, r3
	beq	.L5
	ldr	r3, [sp, #4]
	adds	r5, r5, #20
	cmp	r5, r3
	bne	.L8
.L5:
	ldr	r0, [r7]
	lsls	r3, r0, #31
	bpl	.L1
	ldr	r3, .L15+24
	lsrs	r0, r0, #16
	bl	.L17
.L1:
	@ sp needed
	pop	{r0, r1, r2, r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8:
	movs	r2, r4
	b	.L6
.L16:
	.align	2
.L15:
	.word	FirstUNITCommand
	.word	Growth_OptionsLABEL
	.word	SetEventId
	.word	ClassPromoLevelTableLABEL
	.word	Class_Level_Cap_TableLABEL
	.word	UnitAutolevelCore
	.word	UnsetEventId
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
.L19:
	ldrb	r1, [r3]
	ldrb	r5, [r2]
	adds	r1, r1, r5
	strb	r1, [r3]
	adds	r3, r3, #1
	adds	r2, r2, #1
	cmp	r3, r4
	bne	.L19
	@ sp needed
	ldrb	r3, [r0, #19]
	strb	r3, [r0, #18]
	ldr	r3, [r0, #4]
	ldrb	r2, [r3, #4]
	ldr	r3, .L21
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
.L22:
	.align	2
.L21:
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
.L25:
	ldr	r3, [r5, #4]
	ldr	r2, .L29
	ldrb	r3, [r3, #4]
	ldrsb	r3, [r2, r3]
	cmp	r3, #0
	beq	.L23
	movs	r2, #8
	ldrsb	r2, [r5, r2]
	cmp	r2, r3
	blt	.L23
	ldrb	r3, [r4, #21]
	muls	r3, r6
	ldr	r2, .L29+4
	adds	r3, r3, r2
	movs	r0, r5
	str	r3, [r5, #4]
	adds	r4, r4, #20
	bl	SCU_autoPromoteUnit
	b	.L25
.L23:
	movs	r0, r4
	@ sp needed
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L30:
	.align	2
.L29:
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
	ldr	r3, .L52
	lsls	r3, r3, #5
	lsrs	r3, r3, #5
	push	{r4, r5, r6, r7, lr}
	ldr	r6, [r3]
	movs	r3, #110
	movs	r2, #0
	sub	sp, sp, #132
	add	r3, r3, sp
	strb	r2, [r3]
	movs	r2, #11
	ldr	r3, [r0]
	ldrsb	r2, [r3, r2]
	ldrb	r3, [r0, #8]
	subs	r3, r3, r2
	lsls	r3, r3, #24
	movs	r4, r0
	asrs	r5, r3, #24
	cmp	r3, #0
	beq	.L31
	strb	r2, [r0, #8]
	cmp	r5, #0
	ble	.L31
	ldrb	r3, [r6, #1]
	ldr	r0, .L52+4
	ldrb	r1, [r0, r3]
	cmp	r1, #0
	bne	.L33
	ldr	r1, .L52+8
	ldrb	r1, [r1, r3]
.L33:
	cmp	r2, r1
	blt	.L40
	ldrb	r3, [r6, #21]
	ldrb	r1, [r0, r3]
	cmp	r1, #0
	bne	.L35
	ldr	r1, .L52+8
	ldrb	r1, [r1, r3]
.L35:
	movs	r0, #2
	cmp	r2, r1
	bge	.L36
	subs	r0, r0, #1
.L34:
	movs	r2, #84
	muls	r3, r2
	ldr	r2, .L52+12
	adds	r3, r3, r2
	str	r3, [r4, #4]
.L36:
	movs	r3, #20
	muls	r0, r3
	ldr	r7, .L52+16
	adds	r6, r6, r0
	ldr	r0, [r7]
	lsls	r3, r0, #31
	bpl	.L38
	ldr	r3, .L52+20
	lsrs	r0, r0, #16
	bl	.L17
.L38:
	movs	r1, r4
	mov	r0, sp
	ldr	r3, .L52+24
	bl	.L17
	movs	r2, #100
	mov	r3, sp
	mov	r0, sp
	strb	r2, [r3, #9]
	ldr	r3, .L52+28
	bl	.L17
	ldr	r3, .L52+32
	mov	r1, sp
	movs	r0, r4
	bl	.L17
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
	bne	.L38
	ldr	r0, [r7]
	lsls	r3, r0, #31
	bpl	.L31
	ldr	r3, .L52+36
	lsrs	r0, r0, #16
	bl	.L17
.L31:
	add	sp, sp, #132
	@ sp needed
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L40:
	movs	r0, #0
	b	.L34
.L53:
	.align	2
.L52:
	.word	FirstUNITCommand
	.word	ClassPromoLevelTableLABEL
	.word	Class_Level_Cap_TableLABEL
	.word	ClassTableLABEL
	.word	Growth_OptionsLABEL
	.word	SetEventId
	.word	InitBattleUnit
	.word	CheckBattleUnitLevelUp
	.word	UpdateUnitFromBattle
	.word	UnsetEventId
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
	bls	.L55
	adds	r3, r0, #0
.L55:
	lsls	r0, r3, #24
	lsrs	r0, r0, #24
	@ sp needed
	bx	lr
	.size	SCU_min, .-SCU_min
	.ident	"GCC: (devkitARM release 55) 10.2.0"
	.code 16
	.align	1
.L17:
	bx	r3
