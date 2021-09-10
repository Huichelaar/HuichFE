@ Calculates & sets the amount of material the player has. Arguments:
@   r0: Material index.
@   r1: Material amount.
@ Returns:
@   r0: 10-bit number containing the amount of this material owned.
.thumb

push  {r4-r7}
mov   r4, r0
mov   r5, r1


@ Return if invalid materialID
@ or invalid amount value.
ldr   r0, =MaterialCount
lsl   r0, #0x5
lsr   r0, #0x5
cmp   r4, r0
bge   Return
  ldr   r0, =0x3E7
  cmp   r5, r0
  bhi   Return


@ Calculate material value.
ldr   r0, =MaterialRAM
lsl   r0, #0x5
lsr   r0, #0x5

mov   r7, #0x6
lsl   r1, r4, #0x1
and   r7, r1                  @ r7: index of first bit which holds material value.
lsr   r6, r4, #0x2
add   r6, r4                  @ r6: index of first byte which holds material value.

@ First byte.
ldrb  r1, [r0, r6]
mov   r2, #0x20
sub   r2, r7
lsl   r1, r2
lsr   r1, r2
mov   r2, r5
lsl   r2, r7
orr   r1, r2
strb  r1, [r0, r6]

@ Second byte.
add   r0, #0x1
ldrb  r1, [r0, r6]
add   r2, r7, #0x2
lsr   r1, r2
lsl   r1, r2
mov   r2, #0x8
sub   r7, r2, r7
mov   r2, r5
lsr   r2, r7
orr   r1, r2
strb  r1, [r0, r6]


Return:
pop   {r4-r7}
bx    r14
