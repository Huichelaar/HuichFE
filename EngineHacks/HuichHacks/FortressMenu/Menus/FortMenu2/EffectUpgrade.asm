@ Executed when any FortMenu2 command is selected
@ after FortMenu1's "Upgrade" command was selected. Arguments:
@   r0 = FortMenu2 proc pointer
@   r1 = DrawFortMenu2 proc pointer
.thumb

push  {r4-r7, r14}
sub   sp, #0x4


mov   r2, #0x61
ldrb  r2, [r0, r2]                  @ Current command index
mov   r3, #0x2A
ldrb  r3, [r1, r3]                  @ Top fort
lsr   r2, #0x1
add   r5, r2, r3                    @ Selected fort


@ Re-draw entries & preview
mov   r0, #0x55
mov   r2, #0xFF
strb  r2, [r1, r0]                  @ Preview is re-drawn if prev command =/= current command
mov   r0, r1
mov   r1, #0x0
ldr   r4, =Goto6CLabel
bl    GOTO_R4                       @ Re-draw FortMenu2 entries


@ Check if fort is controlled by enemy
mov   r0, #0x5
mov   r1, r5
mul   r1, r0
ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r2, [r0, r1]                  @ Fort's Fortmaster
ldr   r3, =AbilityTable
ldrb  r2, [r3, r2]
cmp   r2, #0x0
beq   L4                            @ Unit isn't controllable


@ Check if fort is max lvl
add   r1, #0x1
ldrb  r0, [r0, r1]
lsr   r0, #0x6                      @ Fort's level
cmp   r0, #0x3
bge   L4                            @ Fort's level is maxed


@ Check if we have enough materials to upgrade fort
lsl   r0, #0x2
ldr   r1, =FortsTable
lsl   r2, r5, #0x5
add   r1, r2
add   r1, #0x8
add   r4, r1, r0                    @ ROM Fort Struct, upgrade materials

mov   r7, #0x0
Loop:
  mov   r0, r5
  mov   r1, r7
  bl    GetFortUpgradeMatCount
  mov   r6, r0
  lsl   r0, r7, #0x1
  ldrb  r0, [r4, r0]
  bl    GetMatCount
  cmp   r6, r0
  bgt   L4                          @ Branch if we don't have enough materials
  
  sub   r0, r6
  mov   r1, sp
  lsl   r2, r7, #0x1
  strh  r0, [r1, r2]
  add   r7, #0x1
  cmp   r7, #0x1
  ble   Loop
  

@ Upgrade Fort
mov   r0, #0x5
mov   r1, r5
mul   r1, r0
add   r1, #0x1
ldr   r0, =FortRAM
lsl   r0, #0x5
lsr   r0, #0x5
ldrb  r2, [r0, r1]                  @ Level & exp
lsr   r2, #0x6
add   r2, #0x1
lsl   r2, #0x6                      @ Increase level & set exp to 0
strb  r2, [r0, r1]


@ Remove materials
mov   r6, sp
mov   r7, #0x0
Loop2:
  lsl   r0, r7, #0x1
  ldrh  r1, [r6, r0]
  ldrb  r0, [r4, r0]
  bl    SetMatCount
  add   r7, #0x1
  cmp   r7, #0x1
  ble   Loop2

mov   r0, #0x4
b     Return


L4:
@ Fortmaster isn't controllable, Fort level is max or we didn't have enough materials
mov   r0, #0x6C
bl    PlaySFX
mov   r0, #0x0


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
