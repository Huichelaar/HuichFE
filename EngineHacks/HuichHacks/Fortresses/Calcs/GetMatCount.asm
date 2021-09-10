@ Calculates & returns the amount of material the player has. Arguments:
@   r0: Material index.
@ Returns:
@   r0: 10-bit number containing the amount of this material owned.
.thumb

push  {r4-r7}
mov   r4, r0


@ Return 0 if invalid materialID.
ldr   r0, =MaterialCount
lsl   r0, #0x5
lsr   r0, #0x5
cmp   r4, r0
blt   L1
  mov   r0, #0x0
  b     Return
L1:


@ Calculate material amount.
ldr   r0, =MaterialRAM
lsl   r0, #0x5
lsr   r0, #0x5

mov   r5, #0x6
lsl   r1, r4, #0x1
and   r5, r1                  @ r5: index of first bit which holds material amount.
lsr   r6, r4, #0x2
add   r6, r4                  @ r6: index of first byte which holds material amount.
mov   r7, #0x16
sub   r7, r5

ldrb  r1, [r0, r6]
add   r0, #0x1
ldrb  r0, [r0, r6]
lsl   r0, #0x8
add   r0, r1
lsl   r0, r7
add   r1, r7, r5
lsr   r0, r1


Return:
pop   {r4-r7}
bx    r14
