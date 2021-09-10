@ Ends the target's dodge.
.thumb

push  {r4-r7, r14}


ldr   r0, =Procs_BACDrawSprites
ldr   r4, =Find6C
bl    GOTO_R4
mov   r5, r0
cmp   r5, #0x0
beq   Return


  @ AIStructs
  ldr   r0, [r5, #0x30]
  mov   r6, r0
  ldr   r4, =GetTargetAIS
  bl    GOTO_R4
  mov   r7, r0
  
  
  @ End target dodge.
  ldrh  r0, [r7, #0x10]
  mov   r1, #0x8
  orr   r0, r1
  strh  r0, [r7, #0x10]
  

Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
