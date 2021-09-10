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
	.file	"M7RamFunc.c"
	.text
	.align	2
	.global	M7HBlank
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	M7HBlank, %function
M7HBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	ldrh	r2, [r1, #6]
	cmp	r2, #159
	bgt	.L2
	ldr	r3, .L9
	ldr	r0, [r3]
	ldrsh	r3, [r0, #16]
	cmp	r3, r2
	ble	.L3
.L2:
	mov	r2, #67108864
	ldrb	r3, [r2, #1]	@ zero_extendqisi2
	bic	r3, r3, #12
	strb	r3, [r2, #1]
	bx	lr
.L3:
	push	{r4, r5, r6, r7, lr}
	bne	.L5
	ldrh	r3, [r1]
	bic	r3, r3, #3072
	bic	r3, r3, #7
	orr	r3, r3, #3072
	orr	r3, r3, #2
	strh	r3, [r1]	@ movhi
	ldr	r3, [r0, #8]
	str	r3, [r1, #12]
	ldr	r3, [r0, #12]
	strh	r3, [r1, #14]	@ movhi
	lsr	r3, r3, #16
	strh	r3, [r1, #16]	@ movhi
.L5:
	ldr	r6, [r0]
	add	r3, r0, r2, lsl #1
	ldr	r1, [r6, #72]
	ldrsh	r3, [r3, #20]
	ldr	r0, [r6, #64]
	mul	r0, r3, r0
	mul	r3, r1, r3
	ldr	r1, [r6, #92]
	mvn	r7, #119
	sub	r2, r2, #80
	mul	r2, r1, r2
	ldr	r1, [r6, #80]
	sub	r2, r2, r1, lsl #8
	mov	r1, #67108864
	ldr	lr, [r6, #44]
	ldr	ip, [r6, #52]
	asr	r5, r0, #12
	asr	r4, r3, #12
	asr	r0, r0, #8
	asr	r3, r3, #8
	mla	lr, r7, r5, lr
	mul	r3, r2, r3
	mla	ip, r7, r4, ip
	mul	r2, r0, r2
	sub	r3, lr, r3, asr #12
	add	r2, ip, r2, asr #12
	strh	r5, [r1, #32]	@ movhi
	strh	r4, [r1, #36]	@ movhi
	strh	r5, [r1, #48]	@ movhi
	strh	r4, [r1, #52]	@ movhi
	str	r3, [r1, #40]
	str	r2, [r1, #44]
	str	r3, [r1, #56]
	str	r2, [r1, #60]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	m7World
	.size	M7HBlank, .-M7HBlank
	.ident	"GCC: (devkitARM release 55) 10.2.0"
