@ We changed this so it grabs class growths from a different table.
@ This allows us to use different class growths for units that use both
@ character & class growths whereas generic enemies will use the usual
@ class growths for autolevel.
.thumb


@r0=battle struct or char data ptr
ldr		r1, [r0]
ldrb	r1, [r1, #0x4]                @ Unit ID growth
ldr 	r2, =MagCharTable
lsl 	r1, #0x1                      @ Index in mag char table
add 	r1, #0x1                      @ Growth
ldrb 	r1, [r2, r1]
ldr 	r2, =USE_CHAR_AND_CLASS_GROWTHS
lsl   r2, #0x1F
lsr   r2, #0x1F
cmp		r2, #0x0
beq		GetExtraGrowthBoost

  @ Apply class bonus growth
  ldr 	r2, [r0,#4]
  ldrb  r2, [r2, #0x4]
  lsl   r2, #0x3
  ldr   r3, =ClassBonusGrowthsTable
  add   r2, r3
  mov   r3, #0x2
  ldsb  r2, [r2, r3]                @ Mag bonus growth
  add 	r1, r2
  cmp   r1, #0x0
  bge   GetExtraGrowthBoost
    mov   r1, #0x0

GetExtraGrowthBoost:
mov		r2, #11		                    @ Index of str boost
ldr		r3, =Extra_Growth_Boosts+1
bx		r3
