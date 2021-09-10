@ Initializes the backgrounds & sprites
.thumb

push  {r4, r14}


@ TitleBG TSA
ldr   r0, =TitleBGTSA
ldr   r1, =gGenericBuffer
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, =gpBG2MapBuffer
ldr   r2, =0x2C0
ldr   r1, =gGenericBuffer
ldr   r4, =FillTileRect
bl    GOTO_R4


@ MapSprites
bl    Load_MapSprites


@ Load TitleBG tiles
ldr   r0, =TitleBG
ldr   r1, =0x6005800
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4


@ Load TitleBG palette
bl    GetBGPalette
lsl   r0, #0x5
ldr   r1, =TitleBGPalette
add   r0, r1                              @ Change TitleBG palette based on BGPalette table
mov   r1, #0x0                            @ Overwrite BG palette 0
mov   r2, #0x20                           @ Load only one palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Relief
bl    Init_Relief


@ Gem Tiles
bl    Init_Gem


mov   r0, #0x7
ldr   r4, =EnableBackgroundSyncByMask
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4

pop   {r4}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
