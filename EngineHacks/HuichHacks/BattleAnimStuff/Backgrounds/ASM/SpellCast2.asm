@ Replace 0x5509C, Procs_efxSpellCast_CallASM.
@ Don't use buffer to update palette.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r0, =CurrentBattleBG
mov   r1, #0x0
ldsh  r0, [r0, r1]
lsl   r1, r0, #0x3
lsl   r0, #0x2
add   r0, r1
ldr   r1, =BattleBGTable
add   r0, #0x8
ldr   r0, [r0, r1]
ldr   r4, =palette_buffer+0x80
mov   r1, r4
mov   r2, #0x60
swi   #0xC                                @ CpuFastSet

sub   r4, #0x80
mov   r0, r4
mov   r1, #0x4
mov   r2, #0xC
mov   r3, #0x8
ldr   r7, =FadeInPalette
bl    GOTO_R7

mov   r0, r5
add   r0, #0x29
ldrb  r0, [r0]
cmp   r0, #0x1
bne   Return

  mov   r0, #0x0
  strh  r0, [r5, #0x2C]
  mov   r0, r5
  ldr   r7, =Break6CLoop
  bl    GOTO_R7


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R7:
bx    r7
