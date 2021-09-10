@ Destructor to FortMenu2. De-allocates FortMenu2's texttiles & removes hover bar.
@ Alternatively, if DrawFortMenu2's +0x29 is 0x3 it sets it to 0x2 and doesn't end FortMenu2,
@ but resets the current fort's fortmaster.
.thumb

push  {r4-r6, r14}
sub   sp, #0x4
mov   r5, r0

ldr   r0, [r5, #0x14]
ldr   r6, [r0, #0x1C]           @ Aunt/Uncle is Proc_DrawFortMenu2
mov   r1, #0x29
ldrb  r2, [r6, r1]              @ MenuMode, indicates whether gather, upgrade, etc.
cmp   r2, #0x3
bne   L1


@ Set mode back to 0x2
mov   r2, #0x2
strb  r2, [r6, r1]

@ Reset current fort's fortmaster
mov   r1, #0x54
ldrb  r1, [r6, r1]
mov   r2, #0x50
ldrb  r2, [r6, r2]
mov   r3, #0x5
mul   r2, r3
ldr   r3, =FortRAM
lsl   r3, #0x5
lsr   r3, #0x5
strb  r1, [r3, r2]

mov   r0, r1
ldr   r4, =GetUnitByCharId
bl    GOTO_R4
cmp   r0, #0x0
beq   L2
  ldr   r1, [r0, #0xC]
  ldr   r3, =0x4010000            @ Mimic REMU, 0x1032E
  orr   r1, r3
  str   r1, [r0, #0xC]            @ Disappear/REMU current unit.
L2:
mov   r0, #0x4C
ldr   r0, [r6, r0]
cmp   r0, #0x0
beq   L3
  ldr   r1, [r0, #0xC]
  ldr   r2, =0x4010000            @ Mimic REVEAL, 0x1033A
  mvn   r2, r2
  and   r1, r2
  str   r1, [r0, #0xC]            @ Reappear previous unit.
L3:

@ Reset screen stuff
mov   r0, r6
bl    DeselectChange
b     Return
L1:


@ Reset prev & current command
mov   r1, #0x0
mov   r2, #0x55
strb  r1, [r6, r2]
add   r2, #0x1
strb  r1, [r6, r2]
bl    ClearMatPreview
mov   r0, #0x0
ldr   r4, =EnableBackgroundSyncById 
bl    GOTO_R4


@ End the menu.
mov   r0, r5
ldr   r4, =EndMenu
bl    GOTO_R4

@ Remove hover bar from selected option.
mov   r0, #0x62
ldrb  r1, [r5, r0]              @ Last command index (selected command)
mov   r0, r5
mov   r2, #0x0                  @ Remove
bl    FortMenu2DrawHoverThing

Return:
mov   r0, #0x9
add   sp, #0x4
pop   {r4-r6}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
