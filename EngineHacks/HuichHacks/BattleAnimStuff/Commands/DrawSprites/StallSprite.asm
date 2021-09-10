@ If phasetimer is below threshold,
@ stall sprite.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r0, =Procs_BACDrawSprites
ldr   r4, =Find6C
bl    GOTO_R4
mov   r6, r0
cmp   r6, #0x0
beq   Return


  mov   r0, #0x2A
  ldsh  r0, [r6, r0]
  cmp   r0, #0x0
  blt   Return                  @ If timer is stalled, return.
    cmp   r0, #0x20
    bge   Return                @ If timer over threhold, return.
      ldrh  r0, [r5]
      mov   r1, #0x8
      orr   r0, r1
      strh  r0, [r5]            @ Stall indefinitely.
  

Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
