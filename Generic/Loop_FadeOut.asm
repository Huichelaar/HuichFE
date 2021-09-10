.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r5, r0


@ If necessary, decrement FadeInOutByte & BLDY
ldr   r7, =FadeInOutByte
ldrb  r1, [r7]
lsl   r1, #0x18
asr   r1, #0x18
mov   r2, #0x20
neg   r2, r2

@ BLDY Check
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x3C
ldrb  r0, [r4, r0]
lsr   r0, #0x6
cmp   r0, #0x2
bne   FadeInOutByteCheck

  @ Brightness increase, so decrement.
  mov   r6, #0x46
  ldrh  r3, [r4, r6]          @ BLDY
  cmp   r3, #0x0
  ble   FadeInOutByteCheck
  
    @ BLDY not yet 0
    sub   r3, #0x1
    strh  r3, [r4, r6]
    cmp   r1, r2
    ble   Return
      b     UpdateFade

FadeInOutByteCheck:
cmp   r1, r2
ble   BreakLoop
  b     UpdateFade


BreakLoop:
mov   r0, r5
ldr   r4, =Break6CLoop
bl    GOTO_R4

@ Clear Palettes
mov   r0, #0x0
str   r0, [sp]
mov   r0, sp
ldr   r1, =palette_buffer
ldr   r2, =0x1000100
swi   #0xC                    @ CpuFastSet

@ Disable display
ldr   r4, =gpDISPCNTbuffer
mov   r0, #0x0
strb  r0, [r4, #0x1]

mov   r1, #0x2

UpdateFade:
sub   r1, #0x2
strb  r1, [r7]

@ PaletteSync
ldr   r4, =EnablePaletteSync
bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
