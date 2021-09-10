@ Mostly mimics 0x080225D0, but calls a different event
.thumb

push  {r4, r14}


mov   r2, r0
add   r1, #0x3D
ldrb  r0, [r1]
cmp   r0, #0x2
beq   Tutorial

  ldr   r0, =BackupEvent
  mov   r1, #0x1
  ldr   r4, =CallEventEngine
  bl    GOTO_R4
  mov   r0, #0x17
  b     Return

Tutorial:
ldr   r1, =0x864
mov   r0, r2
ldr   r4, =0x0804F581
bl    GOTO_R4
mov   r0, #0x8


Return:
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
