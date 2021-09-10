@ Called every frame. Updates the FortMenu2 tiles when necessary.
.thumb

push  {r4-r7, r14}
mov   r5, r0

@mov   r0, r5
bl    DrawArrows

@ Check whether to change Material Preview
mov   r0, #0x55
ldrb  r1, [r5, r0]
add   r2, r0, #0x1
ldrb  r3, [r5, r2]
cmp   r1, r3
beq   L2
strb  r3, [r5, r0]
b     MatPreview
L2:

@ Check whether we could be scrolling
mov   r1, #0x2B
ldrb  r6, [r5, r1]
cmp   r6, #0x0
beq   Return

mov   r3, #0x0
strb  r3, [r5, r1]                @ Disable scroll again
ldr   r1, [r5, #0x18]
cmp   r1, #0x0                    @ Don't scroll if you have a child (which can only be BGscroller)
bne   Return

@ Check if we're in mode 0x3 (submenu)
mov   r0, #0x29
ldrb  r0, [r5, r0]
cmp   r0, #0x3
bne   L1
mov   r0, r5
mov   r1, r6
bl    DrawIdleChange              @ If mode is 0x3, Draw the same fort instead
mov   r6, r0
b     SetupBGScroller
L1:


@ Prepare next fort and scroll up/down the screen
mov   r0, #0x2A
ldrb  r1, [r5, r0]                @ Load top fort
mov   r0, #0x0
mov   r2, #0x0
ldr   r3, =FortCount
lsl   r3, #0x5
lsr   r3, #0x5
sub   r3, #0x3
mov   r4, #0x0
sub   r7, r1, #0x1
cmp   r6, #0x1
beq   ScrollUp

  @ ScrollDown
  mov   r0, #0x20
  mov   r2, r3                    @ Switch limits
  add   r4, #0x2
  add   r7, r1, #0x3              @ Offscreen fort tiles

ScrollUp:
sub   r0, #0x10
sub   r4, #0x1
mov   r6, r0

cmp   r1, r2
beq   Return                      @ End of list, nothing to scroll to

add   r1, r4
mov   r0, #0x2A
strb  r1, [r5, r0]                @ New top fort

mov   r0, r7
mov   r1, #0x8
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r4, r0

bl    ClearEntity
mov   r1, r4
mov   r2, r7
mov   r0, r5
add   r0, #0x2C
mov   r3, r5
bl    DrawEntityLeft
mov   r1, r4
mov   r2, r7
mov   r0, #0x29
ldrb  r3, [r5, r0]
mov   r0, r5
add   r0, #0x2C
bl    DrawEntityRight


SetupBGScroller:
ldr   r0, =Proc_BGScroller
mov   r1, r5
ldr   r4, =New6C
bl    GOTO_R4
mov   r1, #0x29
mov   r2, #0x2
strb  r2, [r0, r1]
add   r1, #0x3
str   r6, [r0, r1]

mov   r0, #0x66                 @ We play menu-move-sound when scrolling.
bl    PlaySFX


MatPreview:
bl    ClearMatPreview
mov   r0, r5
bl    DrawMatPreview

mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4

Return:
mov   r0, r5
bl    DrawEffectivenessArrows
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
