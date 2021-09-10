@ Executed on B press. Mimics default destructor, 0801BCCC,
@ but doesn't clear BG0, BG1 and doesn't call 0x08005758, DeleteFaceByIndex.
@ Also unsets extraRAMBitfield.dontBufferMinimug.
.thumb

push  {r4, r14}
mov   r4, r0

@ Unset dontBufferMinimug bit.
ldr   r0, =extraRAMBitfield
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r1, [r0]
mov   r2, #0x2
bic   r1, r2
strb  r1, [r0]

@ End menu.
mov   r0, r4
ldr   r4, =EndMenu
bl    GOTO_R4
mov   r0, #0x9

pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
