@ Re-load button palette when viewing map during preps.
@ Without this, opening then exiting statscreen will
@ make button prompts use the wrong palette.
.thumb

push  {r4-r7, r14}


@ Vanilla
mov   r0, #0x88
strh  r0, [r1]
add   r1, #0x2
mov   r0, #0x8C
strh  r0, [r1]


@ Reload button prompt palette
ldr   r0, =ButtonPromptsPalette
ldr   r1, =0x240
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
