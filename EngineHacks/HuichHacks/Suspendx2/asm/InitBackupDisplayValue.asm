@ Mimics 0xA8A9C, but also inits the Backupcounter and loads BackupBox into VRAM.
.thumb

push  {r4-r7, r14}
sub   sp, #0x4
mov   r7, r0


@ Routine 0xA8A9C
mov   r0, #0xAC
lsl   r0, #0x4
ldr   r3, =0x08089679
bl    GOTO_R3

mov   r4, #0x0
ldr   r6, =0x1FFFF
mov   r5, #0xB4
lsl   r5, #0x9

Loop:
  mov   r0, r7
  add   r0, #0x37
  add   r1, r0, r4
  ldrb  r0, [r1]
  cmp   r0, #0xFF
  beq   L1

    mov   r0, r5
    and   r0, r6
    lsr   r0, #0x5
    ldrb  r1, [r1]
    ldr   r3, =0x08089625
    bl    GOTO_R3
    b     L2

  L1:
  mov   r0, r5
  and   r0, r6
  lsr   r0, #0x5
  mov   r1, #0x1
  neg   r1, r1
  ldr   r3, =0x08089625
  bl    GOTO_R3

  L2:
  mov   r0, #0x80
  lsl   r0, #0x4
  add   r5, r0
  add   r4, #0x1
  cmp   r4, #0x1
  ble   Loop


@ Init the backupcount value
mov   r0, #0xE
lsl   r0, #0x18
add   r0, #0xD4
ldrb  r0, [r0]
mov   r1, #0x41
strb  r0, [r7, r1]


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R3:
bx    r3
GOTO_R4:
bx    r4
