@ Replace 0x55038, Procs_efxSpellCast_CallASM.
@ Don't use buffer to update palette.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r6, r0


mov   r0, #0x2C
ldsh  r3, [r6, r0]
mov   r1, #0x2E
ldsh  r0, [r6, r1]
str   r0, [sp]
mov   r0, #0x0
mov   r1, #0x0
mov   r2, #0x8
ldr   r7, =0x08012DCD
bl    GOTO_R7
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
mov   r3, r5
ldr   r7, =FadeInPalette
bl    GOTO_R7
ldr   r7, =EnablePaletteSync
bl    GOTO_R7

ldrh  r1, [r6, #0x2C]
add   r1, #0x1
strh  r1, [r6, #0x2c]
lsl   r1, r1, #0x10
asr   r1, r1, #0x10
mov   r2, #0x2E
ldsh  r0, [r6, r2]
add   r0, #0x1
cmp   r1, r0
bne   Return

  mov   r0, r6
  ldr   r7, =Break6CLoop
  bl    GOTO_R7


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R7:
bx    r7
