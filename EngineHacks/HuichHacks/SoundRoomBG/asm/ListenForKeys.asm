@ End if any key is pressed.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r0, =KeyStatusBuffer
ldrh  r0, [r0, #0x8]
cmp   r0, #0x0
beq   Return

  @ Key was pressed. End proc.
  mov   r0, r5
  ldr   r4, =Break6CLoop
  bl    GOTO_R4
  ldr   r0, =gpDISPCNTbuffer
  mov   r1, #0x3F
  strb  r1, [r0, #0x1]


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
