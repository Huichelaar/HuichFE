@ Executed when new menu option is selected. Mimics 0x80BC7F4
.thumb

push  {r4, r14}
ldr   r1, =gSomeWMEventRelatedStruct
add   r0, #0x61
ldrb  r0, [r0]
add   r1, #0xCD
strb  r0, [r1]
ldr   r0, =Proc_WorldMap
ldr   r4, =Find6C
bl    GOTO_R4

mov   r1, #0x1A             @ This is the label of our option in the worldmap proc.
ldr   r4, =Goto6CLabel
bl    GOTO_R4

mov   r0, #0x17
pop   {r4}
pop   {r1}
bx    r1
GOTO_R4:
bx  r4
