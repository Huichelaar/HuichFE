@ Stores a 256x64 image to the BGSpellAnim buffer
@ to be moved to 0x6010000 on VBlank,
@ as this buffer has enough space for it.
.thumb

push  {r4-r7, r14}
mov   r6, r1
ldr   r5, =0x6010000
ldr   r4, =SpellBGBuffer


@ Put image in buffer.
mov   r1, r4
swi   #0x11                           @ LZ77UnCompWRAM

@ Move to OBJ VRAM on VBlank.
mov   r0, r4
mov   r1, r5
mov   r2, r6
ldr   r4, =RegisterTileGraphics
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
