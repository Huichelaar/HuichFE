@ Prepare LCDIO & other stuff
.thumb

push  {r4-r7,r14}
sub   sp, #0x4


@ Make BG0 use Tiles1
mov   r1, #0x0                              @ Use Tiles1
mov   r0, #0x0
ldr   r4, =SetBackgroundTileDataOffset
bl    GOTO_R4


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
