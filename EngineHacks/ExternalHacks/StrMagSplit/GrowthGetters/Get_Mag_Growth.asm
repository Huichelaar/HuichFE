@ Growth is class + char growth.
.thumb


@r0=battle struct or char data ptr.
ldr		r1, [r0]
ldrb	r1, [r1, #0x4]                @ Unit ID growth.
ldr 	r2, =MagCharTable
lsl 	r1, #0x1                      @ Index in mag char table.
add 	r1, #0x1                      @ Growth.
ldrb 	r1, [r2, r1]                  @ Character Mag growth.

@ Add class growth.
ldr 	r2, [r0,#4]
ldrb  r2, [r2, #0x4]
ldr   r3, =MagClassTable
lsl   r2, #0x2
add   r2, r3
ldrb  r2, [r2, #0x1]                @ Class Mag growth.
add 	r1, r2
cmp   r1, #0x0
bge   GetExtraGrowthBoost
  mov   r1, #0x0

GetExtraGrowthBoost:
mov		r2, #11		                    @ Index of str boost
ldr		r3, =Extra_Growth_Boosts+1
bx		r3
