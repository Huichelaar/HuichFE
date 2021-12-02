@ Growth is class + char growth.
.thumb


@r0=battle struct or char data ptr.
ldr		r1, [r0]
add		r1, #0x22
ldrb	r1, [r1]		                  @ Character Luk growth.

@ Add class growth.
ldr 	r2, [r0, #4]
add   r2, #0x21
ldrb  r2, [r2]                      @ Class Luk growth.
add 	r1, r2
cmp   r1, #0x0
bge   GetExtraGrowthBoost
  mov   r1, #0x0

GetExtraGrowthBoost:
mov		r2, #16		                    @ Index of Luk boost.
ldr		r3, =Extra_Growth_Boosts+1
bx		r3
