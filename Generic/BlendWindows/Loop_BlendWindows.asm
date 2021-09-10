@ Blends and uses windows.
@ Procvars:
@   +0x29 through +0x31 are the parameters given to Procs_Blend.
@     +0x29: signed byte, value to add to 1st targets every loop iteration.
@     +0x2A: signed byte, value to add to 2nd targets every loop iteration.
@     +0x2B: byte, the amount of frames per blend update.
@     +0x2C: short, BLDCNT
@     +0x2E: byte, initial 1st targets value.
@     +0x2F: byte, initial 2nd targets value.
@     +0x30: byte, timer. increased every frame. End proc if this is equal to limit.
@     +0x31: byte, limit. End proc if this is equal to timer.
@
@   +0x32: short, timer.
@   +0x34: short, time before next entry.
@   +0x36: byte, lower byte of WINOUT (don't care about OBJ window).
@   +0x38: word, Pointer to Window dimensions table.
@   +0x3C: short, WININ
.thumb

push  {r4-r7,r14}
mov   r5, r0


@ Update timer.
ldrh  r0, [r5, #0x32]
add   r0, #0x1
strh  r0, [r5, #0x32]
ldrh  r1, [r5, #0x34]
cmp   r0, r1
blt   Return
  
  @ Grab next window dimensions entry.
  mov   r0, #0x0
  strh  r0, [r5, #0x32]                 @ Reset timer.
  ldr   r0, [r5, #0x38]
  ldr   r1, [r0]
  ldr   r2, [r0, #0x4]
  add   r0, #0x8
  str   r0, [r5, #0x38]                 @ Increment window dimensions table pointer.
  mov   r0, r1
  orr   r0, r2
  cmp   r0, #0x0
  bne   L1
  
    @ Next entry is all zeroes, terminate.
    mov   r0, r5
    ldr   r4, =Break6CLoop
    bl    GOTO_R4
    b     Return
    
  L1:
  ldr   r0, =gpDISPCNTbuffer
  str   r1, [r0, #0x2C]
  str   r2, [r0, #0x30]
  
  @ Start blend proc.
  ldr   r0, =Procs_Blend
  mov   r1, r5
  ldr   r4, =NewBlocking6C
  bl    GOTO_R4
  mov   r2, #0x29
  mov   r3, #0x31

  Loop:
    ldrb  r1, [r5, r2]
    strb  r1, [r0, r2]                  @ Put parameters in blend proc.
    add   r2, #0x1
    cmp   r2, r3
    ble   Loop


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
