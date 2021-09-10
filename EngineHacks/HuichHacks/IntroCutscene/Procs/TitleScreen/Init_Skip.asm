@ Unset +0x29.
@ Procvars:
@   +0x29, byte, if 0 skip titlescreen buildup. Otherwise, don't skip.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Unset +0x29
mov   r0, #0x29
mov   r1, #0x0
strb  r1, [r5, r0]


@ Clear palettes
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000100
swi   #0xC                            @ CpuFastSet


@ Clear BG
ldr   r0, =0x460046
str   r0, [sp]
mov   r0, sp
ldr   r1, =gpBG0MapBuffer
ldr   r2, =0x1000800
swi   #0xC                            @ CpuFastSet


mov   r0, #0xF
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4


@ Switch to titlescreen without intro BGM
ldr   r4, =AcquirePlayingBGM
bl    GOTO_R4
cmp   r0, #0x2
beq   Return

  mov   r0, #0x43                       @ SongID
  mov   r1, #0x0                        @ Fadeout & Fadein rate?
  mov   r2, #0x0                        @ No idea
  ldr   r4, =Switch_BGM
  bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
