.thumb

push  {r4-r7, r14}
mov   r4, r8
mov   r5, r9
push  {r4-r5}


ldr   r0, =FortCount
lsl   r0, #0x5
lsr   r0, #0x5
mov   r8, r0
ldr   r0, =FortExpGainUpper
ldr   r0, [r0]
ldr   r5, =FortExpGainLower
ldr   r5, [r5]
cmp   r0, r5
ble   L2
  sub   r0, r5
L2:
mov   r9, r0

ldr   r7, =AbilityTable
ldr   r4, =FortRAM
lsl   r4, #0x5
lsr   r4, #0x5
mov   r6, #0x0

Loop:
  
  @ Don't increase exp for empty forts or enemy controlled forts
  ldrb  r0, [r4]
  cmp   r0, #0x0
  beq   L1
  ldrb  r0, [r7, r0]
  cmp   r0, #0x0
  beq   L1

    mov   r0, r9
    ldr   r3, =NextRN_N
    bl    GOTO_R3
    add   r2, r5, r0
    
    ldrb  r0, [r4, #0x1]
    mov   r1, #0xC0
    and   r1, r0                      @ Level
    cmp   r1, #0xC0
    beq   L1                          @ Level is max, skip
      lsl   r0, #0x1A
      lsr   r0, #0x1A
      add   r0, r2
      cmp   r0, #0x32
      blt   L3
        @ Level up
        sub   r0, #0x32
        cmp   r0, #0x32
        blt   L4
          mov   r0, #0x31             @ One level up at a time
        L4:
        add   r1, #0x40
        cmp   r1, #0xC0
        blt   L3
          mov   r0, #0x0              @ set exp to 0 if new level is max
      L3:
      orr   r0, r1
      strb  r0, [r4, #0x1]

  L1:
  add   r4, #0x5
  add   r6, #0x1
  cmp   r6, r8
  blt   Loop


pop   {r4-r5}
mov   r8, r4
mov   r9, r5
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
