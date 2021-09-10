.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Pick a random labour animation
mov   r0, #0x0                  @ Change this to however many different sprites there are
ldr   r4, =NextRN_N
bl    GOTO_R4
mov   r6, r0
mov   r1, #0x29
strb  r6, [r5, r1]              @ Sprite ID, indicates which sprites we're drawing
mov   r0, #0x0
add   r1, #0x1
strh  r0, [r5, r1]              @ Timer, indicating what part of the animation to draw


@ Prepare Button palette
ldr   r0, =ButtonPromptsPalette
ldr   r1, =0x2C0
mov   r2, #0x20
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4

@ Draw R:Info Sprite
ldr   r0, =Procs_DrawRInfoButton
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
mov   r1, #0x0
str   r1, [r0, #0x2C]           @ X
mov   r1, #0x90
str   r1, [r0, #0x30]           @ Y
ldr   r1, =0x6000
str   r1, [r0, #0x34]           @ TID


@ Prepare plateau
lsl   r0, r6, #0x2
add   pc, r0
lsl   r0, #0x0                  @ nop. We need to pad.

mov   r0, #0x10
b     LoadPlateau
@mov   r0, PlateauID
@b     LoadPlateau
@ Etc. Insert further plateaus for different labourer sprites

LoadPlateau:
ldr   r1, =BattlePlateaus
lsl   r2, r0, #0x4
lsl   r0, #0x3
add   r0, r2
add   r7, r1, r0

ldr   r0, [r7, #0xC]
mov   r1, #0x6
lsl   r1, #0x18
mov   r2, #0x12
lsl   r2, #0xC
add   r1, r2
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

ldr   r0, [r7, #0x10]
mov   r1, #0x24                           
lsl   r1, #0x4                  @ Overwrite OBJ palette 2
mov   r2, #0x20                 @ Load only one palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Prepare Object
lsl   r0, r6, #0x2
lsl   r1, r6, #0x1
add   r0, r1
add   pc, r0
lsl   r0, #0x0                  @ nop. We need to pad.

ldr   r0, =Tree
ldr   r7, =TreePalette
b     LoadObject
@ldr   r0, =Object2
@ldr   r7, =Object2Palette
@b     LoadObject
@ Etc. Insert further objects for different labourer sprites

LoadObject:
mov   r1, #0x6
lsl   r1, #0x18
mov   r2, #0x25
lsl   r2, #0xB
add   r1, r2
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

mov   r0, r7
mov   r1, #0x26                           
lsl   r1, #0x4                  @ Overwrite OBJ palette 3
mov   r2, #0x20                 @ Load only one palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


@ Prepare labourer animation sheet
lsl   r0, r6, #0x2
lsl   r1, r6, #0x1
add   r0, r1
add   pc, r0
lsl   r0, #0x0                  @ nop. We need to pad.

ldr   r0, =PirateSheet
ldr   r7, =PiratePalette
b     LoadLabourer
@ldr   r0, =Labourer2
@ldr   r7, =Labourer2Palette
@b     LoadLabourer
@ Etc. Insert further labourers for different labourer sprites

LoadLabourer:
mov   r1, #0x6
lsl   r1, #0x18
mov   r2, #0x14
lsl   r2, #0xC
add   r1, r2
ldr   r4, =UnLZ77Decompress
bl    GOTO_R4

mov   r0, r7
mov   r1, #0x28                           
lsl   r1, #0x4                  @ Overwrite OBJ palette 4
mov   r2, #0x20                 @ Load only one palette (1 short per colour)
ldr   r4, =CopyToPaletteBuffer
bl    GOTO_R4


pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
