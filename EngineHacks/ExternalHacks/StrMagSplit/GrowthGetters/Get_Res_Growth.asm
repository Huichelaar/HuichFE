@ Growth is class + char growth.
.thumb


@r0=battle struct or char data ptr.
ldr		r1, [r0]
add		r1, #0x21
ldrb	r1, [r1]		                  @ Character Res growth.

@ Add class growth.
ldr 	r2, [r0, #4]
add   r2, #0x20
ldrb  r2, [r2]                      @ Class Res growth.
add 	r1, r2
cmp   r1, #0x0
bge   GetExtraGrowthBoost
  mov   r1, #0x0

GetExtraGrowthBoost:
mov		r2, #15		                    @ Index of Res boost.
ldr		r3, =Extra_Growth_Boosts+1
bx		r3
