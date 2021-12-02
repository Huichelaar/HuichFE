@ Growth is class + char growth.
.thumb


@r0=battle struct or char data ptr.
ldr		r1, [r0]
ldrb	r1, [r1, #0x1E]		            @ Character Skl growth.

@ Add class growth.
ldr 	r2, [r0, #4]
ldrb  r2, [r2, #0x1D]               @ Class Skl growth.
add 	r1, r2
cmp   r1, #0x0
bge   GetExtraGrowthBoost
  mov   r1, #0x0

GetExtraGrowthBoost:
mov		r2, #12		                    @ Index of Skl boost.
ldr		r3, =Extra_Growth_Boosts+1
bx		r3
