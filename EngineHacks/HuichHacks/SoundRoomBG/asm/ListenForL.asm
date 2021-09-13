@ Display only BG3 when L is pressed.
@ Hooked at 0xAF8A4.
.thumb

push  {r4-r7}
mov   r5, r0


ldr   r0, =KeyStatusBuffer
ldrh  r0, [r0, #0x8]
ldr   r1, =0x200
tst   r0, r1
beq   L1

  @ L was pressed.
  ldr   r0, =SBG_SoundRoomShowBG3_Proc
  mov   r1, r5
  ldr   r4, =NewBlocking6C
  bl    GOTO_R4
  ldr   r0, =gpDISPCNTbuffer
  mov   r1, #0x8
  strb  r1, [r0, #0x1]
  ldr   r1, =0x80AFA5D
  b     Return

L1:


@ Vanilla overwritten stuff
add   r5, #0x37
mov   r0, #0x0
ldsb  r0, [r5, r0]

ldr   r1, =0x80AF8AD


Return:
pop   {r4-r7}
bx    r1
GOTO_R4:
bx    r4
