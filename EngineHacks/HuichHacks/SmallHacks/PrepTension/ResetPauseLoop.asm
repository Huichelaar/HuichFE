@ Delete yourself when there's no prepscreen.
@ Now dramatic pauses are allowed again.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r0, =GameState
ldrb  r0, [r0, #0x4]
mov   r1, #0x10
tst   r0, r1
bne   Return

  @ Prepflag unset; End proc.
  mov   r0, r5
  ldr   r4, =Delete6C
  bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
