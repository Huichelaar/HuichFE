@ Mimic 0x22D84, but use gambit item.
@ Also do SkillSys Range Stuff but without equipped weapon slot.
.thumb

push  {r4-r7, r14}
mov   r5, r1
add   r5, #0x3C
ldr   r4, =ActiveUnit
ldr   r4, [r4]


@ Get gambit
mov   r0, r4
bl    GAM_GetGambit
mov   r6, r0


bl    UpdateMenuItemPanelAlt

ldr   r0, =gMapMovement
ldr   r0, [r0]
mov   r1, #0x1
neg   r1, r1
ldr   r7, =ClearMapWith
bl    GOTO_R7
ldr   r0, =gMapRange
ldr   r0, [r0]
mov   r1, #0x0
bl    GOTO_R7


mov   r1, r6
mov   r0, r4
ldr   r4, =ActiveUnit
bl    Show_Red_Squares


mov   r0, #0x2
ldr   r7, =DisplayMoveRangeGraphics
bl    GOTO_R7


mov   r0, #0x0
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R7:
bx    r7
GOTO_R3:
bx    r3
GOTO_R12:
bx    r12


@ Mimic UpdateMenuItemPanel, but use equip slot 9.
UpdateMenuItemPanelAlt:
push  {r4-r7, r14}
mov   r7, r10
mov   r6, r9
mov   r5, r8
push  {r5-r7}
sub   sp, #0xC
mov   r5, r0


ldr   r0, =Procs_MenuItemPanel
ldr   r3, =Find6C
bl    GOTO_R3
mov   r7, r0
ldr   r0, =gpBG0MapBuffer
mov   r4, r7
add   r4, #0x30
ldrb  r1, [r4]
lsl   r1, #0x1
add   r0, r1
mov   r1, #0x31
add   r1, r7
mov   r8, r1
ldrb  r1, [r1]
lsl   r1, #0x6
add   r0, r1
str   r0, [sp, #0x4]

mov   r6, r7
add   r6, #0x34
ldr   r2, [r7, #0x2C]
mov   r9, r2
mov   r0, r7
add   r0, #0x32
ldrb  r0, [r0]
str   r0, [sp, #0x8]

mov   r0, r6
ldr   r3, =Text_Clear
bl    GOTO_R3
mov   r0, r7
add   r0, #0x3C
ldr   r3, =Text_Clear
bl    GOTO_R3
mov   r0, r7
add   r0, #0x44
ldr   r3, =Text_Clear
bl    GOTO_R3

ldrb  r0, [r4]
mov   r2, r8
ldrb  r1, [r2]
mov   r2, #0x0
str   r2, [sp]
mov   r2, #0xE
ldr   r3, =MakeUIWindowTileMap_BG0BG1
mov   r12, r3
mov   r3, #0x8
bl    GOTO_R12

mov   r4, r5
mov   r5, #0x9
ldr   r0, =0x801E7E5
bx    r0
