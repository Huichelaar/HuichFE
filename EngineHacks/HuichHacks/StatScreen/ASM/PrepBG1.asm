@ This function prepares BG1s UI
.thumb

push  {r4-r7,r14}


@ Prepare BG1 UI palette

@ Unit Allegiance
ldr   r1, =StatScreenStruct
ldr   r1, [r1, #0xC]
ldrb  r1, [r1, #0xB]
lsr   r1, #0x6

@ Calculate corresponding palette
ldr   r0, =SSMainUIPalette
lsl   r1, #0x7
add   r0, r1
mov   r1, #0x20
mov   r2, #0x60
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
