@ Draws the initial FortMenu2 items (faces, person names, fortnames, etc.)
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
push  {r4-r5}
mov   r9, r0


mov   r7, r0
add   r7, #0x29
ldrb  r6, [r7, #0x1]            @ Top Fort
mov   r0, r6
mov   r1, #0x8
ldr   r4, =_umodsi3
bl    GOTO_R4
mov   r5, r0                    @ [0,7], ID indicating which tiles should be overwritten.
add   r4, r7, #0x3              @ Pointers to start tile indices for strings
ldrb  r0, [r7]
mov   r8, r0                    @ [0-2], value indicating which right-items to draw.

mov   r7, #0x0                  @ Iterator
Loop:
  mov   r0, r5
  bl    ClearEntity
  mov   r0, r4
  mov   r1, r5
  mov   r2, r6
  mov   r3, r9
  bl    DrawEntityLeft
  mov   r0, r4
  mov   r1, r5
  mov   r2, r6
  mov   r3, r8
  bl    DrawEntityRight

  add   r6, #0x1
  add   r5, #0x1
  cmp   r5, #0x7
  ble   L1
  sub   r5, #0x8
  L1:
  add   r7, #0x1
  cmp   r7, #0x2
  ble   Loop

mov   r0, #0x2
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4
ldr   r4, =EnablePaletteSync
bl    GOTO_R4

pop   {r4-r5}
mov   r9, r5
mov   r8, r4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
