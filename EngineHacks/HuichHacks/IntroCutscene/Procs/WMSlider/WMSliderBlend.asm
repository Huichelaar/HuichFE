@ Blend in one background, blend out the other.
.thumb

push  {r4-r7,r14}
mov   r5, r0

@ Transition index determines direction of blend
mov   r0, #0x2C
ldrb  r0, [r5, r0]
mov   r3, #0x1
and   r3, r0

@ Use timer for blending.
mov   r0, #0x29
ldrb  r0, [r5, r0]
cmp   r0, #0x20
bgt   Return

  lsr   r0, #0x1
  mov   r1, r0
  mov   r2, #0x10
  sub   r2, r0
  cmp   r3, #0x0
  beq   L3
    mov   r3, r1
    mov   r1, r2
    mov   r2, r3
  L3:
  
  mov   r0, #0x1
  mov   r3, #0x0
  ldr   r4, =SetSpecialColourEffectsParam
  bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
