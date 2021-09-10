@ Draws effectiveness arrows over affinities.
.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
mov   r6, r10
mov   r7, r11
push  {r4-r7}
sub   sp, #0x4
mov   r5, r0                    @ ProcState.


@ Prepare variables.
ldr   r4, =GetGameClock
bl    GOTO_R4
mov   r1, #0x18
swi   #0x6                      @ mod
lsr   r0, r1, #0x3
mov   r9, r0                    @ Spritechanges
ldr   r4, =RegisterObject
mov   r0, #0x2A
ldrb  r6, [r5, r0]              @ Top displayed fort.
mov   r0, #0x0
ldr   r1, [r5, #0x18]
cmp   r1, #0x0
beq   L1
  mov   r2, #0x29
  ldrb  r2, [r1, r2]            @ BGScroller counter.
  lsr   r2, #0x1
  cmp   r2, #0x0
  beq   L1
    ldr   r0, [r1, #0x2C]
    cmp   r0, #0x0
    ble   L1
      sub   r6, #0x1            @ Take previous fort as top displayed fort.
      neg   r0, r0

L1:
mov   r8, r0                    @ Scroll direction.
ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
mov   r10, r0                   @ RAM fortsdata.
ldr   r0, =AbilityTable
mov   r11, r0
mov   r0, #0x56
ldrb  r1, [r5, r0]              @ Current command.
mov   r0, #0x29
ldrb  r2, [r5, r0]              @ Menu mode.
mov   r0, #0x50
ldrb  r3, [r5, r0]              @ Fort we're currently hovering over.


@ Determine what to draw.
cmp   r2, #0x2
beq   L2                        @ 'Assign' mode.
  cmp   r2, #0x3
  beq   L3                      @ 'Selected' mode.
    b     Return                @ Only draw when in 'Assign' or 'Selected' mode.


@ Mode 2, 'Assign'.
L2:
mov   r0, #0x5
mul   r0, r6
add   r10, r0
mov   r7, #0x0

Loop:

  @ Unit Affinity
  mov   r0, r10
  ldrb  r0, [r0]
  mov   r1, r11
  ldrb  r1, [r1, r0]
  cmp   r1, #0x1
  bls   L4                        @ No unit or enemy, don't draw.
    mov   r1, r6
    bl    GetAffinityBonus
  
    mov   r2, r9
    add   r3, r2, #0x1
    lsr   r3, #0x1                @ TID changes
    lsr   r2, #0x1                @ Y changes
    
    cmp   r0, #0x1
    beq   L4                      @ Don't draw for neutral
      cmp   r0, #0x0
      bne   L5
        mov   r0, #0x12           @ Negative
        b     L6
      L5:
        mov   r0, #0x10           @ Positive
        neg   r2, r2
      L6:
      add   r0, r3
      str   r0, [sp]              @ TID
      mov   r0, #0x1              @ Root node index
      mov   r1, #0x72             @ X
      lsl   r3, r7, #0x5
      add   r2, r3
      add   r2, #0x49
      add   r2, r8                @ Y
      cmp   r2, #0x37
      blt   L4                    @ Offscreen
        cmp   r2, #0x8A
        bgt   L4                  @ Offscreen
          ldr   r3, =OAM_8x16
          bl    GOTO_R4
    
  L4:
  mov   r0, #0x5
  add   r10, r0
  add   r6, #0x1
  add   r7, #0x1
  cmp   r7, #0x4
  blt   Loop
b     Return


@ Mode 3, 'Selected'.
@ r1: Current command.
@ r3: Fort we're currently hovering over.
L3:
mov   r6, r1

@ Unit Affinity
mov   r0, r10
mov   r1, #0x5
mul   r1, r3
ldrb  r0, [r0, r1]
mov   r1, r11
ldrb  r1, [r1, r0]
cmp   r1, #0x1
bls   Return                    @ No unit or enemy, don't draw.
  mov   r1, r3
  bl    GetAffinityBonus

  mov   r2, r9
  add   r3, r2, #0x1
  lsr   r3, #0x1                @ TID changes
  lsr   r2, #0x1                @ Y changes
  
  cmp   r0, #0x1
  beq   Return                  @ Don't draw for neutral
    cmp   r0, #0x0
    bne   L7
      mov   r0, #0x12           @ Negative
      b     L8
    L7:
      mov   r0, #0x10           @ Positive
      neg   r2, r2
    L8:
    add   r0, r3
    str   r0, [sp]              @ TID
    mov   r0, #0x1              @ Root node index
    mov   r1, #0x72             @ X
    lsl   r3, r6, #0x4
    add   r2, r3
    add   r2, #0x49             @ Y
    ldr   r3, =OAM_8x16
    bl    GOTO_R4


Return:
add   sp, #0x4
pop   {r4-r7}
mov   r8, r4
mov   r9, r5
mov   r10, r6
mov   r11, r7
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
