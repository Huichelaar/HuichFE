.thumb

push  {r4, r14}

ldr   r0, =Arrows
mov   r1, #0x6
lsl   r1, #0x18
mov   r2, #0x81
lsl   r2, #0x9
add   r2, #0x80
add   r1, r2
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =ArrowsPalette
mov   r1, #0x22                           
lsl   r1, #0x4                            @ Overwrite OBJ palette 1
mov   r2, #0x20                           @ Load only one palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

ldr   r4, =EnablePaletteSync
bl    GOTO_R4

pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
