.thumb
.org 0x0

@ r0 has char data,
@ r1 has slot number (-1 means check all slots)
@ and r2 has the address to bx to to check whether item can be equipped.
push  {r4-r7,r14}
mov   r7, r8
push  {r7}
sub   sp, #0x4


cmp   r1, #0x0
blt   CheckAllItems

  @ Slot 5 means gambit
  cmp   r1, #0x5
  bne   L2
    mov   r6, r0
    bl    GAM_GetGambit
    mov   r1, r0
    mov   r0, r6
    b     L3
  L2:
    lsl   r1, r1, #0x1
    add   r1, #0x1E
    add   r1, r0
    ldrh  r1, [r1]
  L3:
  bl    Get_Item_Range
  b     RetBitfield
  
CheckAllItems:
mov   r6, r0                    @ char data.
mov   r7, #0x0                  @ bitfield.
mov   r5, #0x1E                 @ item slot + 1E.
mov   r8, r7
str   r2, [sp]

LoopThroughItems:
  ldrh  r4, [r6, r5]
  cmp   r4, #0x0
  beq   GambitCheck
    L1:
    mov   r0, r6
    mov   r1, r4
    ldr   r2, [sp]
    bl    GOTO_R2               @ returns bool regarding whether item can be used.
    cmp   r0, #0x0
    beq   GetNextItem
      mov   r0, r6
      mov   r1, r4
      bl    Get_Item_Range      @ returns bitfield in r0 and min/max halfword in r1.
      orr   r7, r0              @ combine bitfields.
      cmp   r1, #0x0            @ if mag/2<0x10, this will be true. So, most of the time
      beq   GetNextItem         @ (unless you have staff/bow-range boosting items or a str booster).
        mov   r0, r8
        lsr   r3, r0, #0x8      @ old min.
        cmp   r3, #0x0
        bne   NoSwitch
          mov   r3, #0xFF
        NoSwitch:
        lsr   r2, r1, #0x8      @ new min.
        cmp   r2, r3
        bge   NoNewMin
          mov   r3, r2          @ r3 has min.
        NoNewMin:
        mov   r2, #0xFF
        and   r0, r2            @ old max.
        and   r1, r2            @ new max.
        cmp   r1, r0
        ble   NoNewMax
          mov   r0, r1          @ r0 has max.
        NoNewMax:
        lsl   r3, r3, #0x8
        orr   r0, r3
        mov   r8, r0
    GetNextItem:
    add   r5, #0x2
    cmp   r5, #0x26
    ble   LoopThroughItems
    
    @ Huichelaar edit, I added this part.
    @ Check for gambit.
    cmp   r5, #0x28
    bgt   CompareBitfield
    
      GambitCheck:
      mov   r5, #0x28
      ldr   r1, =GambitID
      mov   r0, #0xFF
      and   r1, r0
      mov   r0, r6
      bl    SkillTester
      cmp   r0, #0x0
      beq   CompareBitfield

        @ Get gambit.
        mov   r0, r6
        bl    GAM_GetGambit
        lsr   r1, r0, #0x8
        cmp   r1, #0x0
        beq   CompareBitfield
          mov   r4, r0
          b     L1

CompareBitfield:
mov   r0, r7
mov   r1, r8
cmp   r1, #0x0
beq   RetBitfield
  ldr   r2, =0xFFFF
  lsr   r3, r1, #0x8            @ We want to strip out the bits in the bitfield that are covered by the short.
  lsl   r2, r3                  @ Not *absolutely* necessary, but we're doing it anyway.
  mvn   r2, r2                  @ Ones complement.
  and   r0, r2


RetBitfield:
add   sp, #0x4
pop   {r7}
mov   r8, r7
pop   {r4-r7}
pop   {r2}
GOTO_R2:
bx    r2
