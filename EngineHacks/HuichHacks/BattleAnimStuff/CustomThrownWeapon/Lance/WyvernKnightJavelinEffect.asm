@ Mimics 0x5C72C, but uses a different lance.
@ Also re-uses attacker's palette for lance.
.thumb

push  {r4-r7, r14}
mov   r5, r0


ldr   r6, =SetSomethingSpellFxToTrue
bl    GOTO_R6
ldr   r6, =ClearBG1Setup
bl    GOTO_R6
ldr   r0, =Procs_efxTeyari
mov   r1, #0x3
ldr   r6, =New6C
bl    GOTO_R6
mov   r4, r0

str   r5, [r4, #0x5C]
mov   r0, #0x0
strh  r0, [r4, #0x2C]
mov   r0, r5
ldr   r6, =GetSomeAISRelatedIndexMaybe
bl    GOTO_R6
lsl   r0, #0x10
asr   r0, #0x10
ldr   r6, =GetSomeBoolean
bl    GOTO_R6
add   r4, #0x29
strb  r0, [r4]
mov   r0, r5
mov   r1, #0x1
ldr   r6, =PrepLanceOBJ
bl    GOTO_R6


@ Graphics
@ Grab palette from attacking unit
mov   r0, r5
ldr   r6, =GetAISSubjectID
bl    GOTO_R6
mov   r1, #0x7
lsl   r0, #0x1
add   r1, r0
lsl   r1, #0x5
ldr   r0, =palette_buffer+0x200
add   r0, r1
ldr   r1, =0x240
mov   r2, #0x20
ldr   r6, =CopyToPaletteBuffer
bl    GOTO_R6

@ Tiles
ldr   r0, =WyvernKnightJavelinTiles
ldr   r1, =0x1000
ldr   r6, =SomeImageStoringRoutine_SpellAnim
bl    GOTO_R6


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R6:
bx    r6
