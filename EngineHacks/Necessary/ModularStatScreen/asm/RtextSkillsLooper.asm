@ Determines whether to display "Skills" RText, or to move to next item.
.thumb

push  {r4-r7, r14}
mov   r5, r0


@ Check if unit is generic
ldr   r4, =StatScreenStruct
ldr   r4, [r4, #0xC]                @ Pointer to Unit RAM of current unit
ldrb  r0, [r4, #0xB]
mov   r1, #0xC0
tst   r0, r1
beq   Return                      @ Check if unit is Enemy/NPC.

  ldr   r1, [r4]
  ldrb  r0, [r1, #0x4]
  cmp   r0, #0x3F
  ble   Return                    @ Enemy/NPC units above #0x3F are generic, unless boss flag is set.

    ldr   r0, [r1, #0x28]
    mov   r1, #0x80
    lsl   r1, #0x8
    tst   r0, r1
    bne   Return                  @ Check if unit is boss


@ Don't display for generics
mov   r0, r5
add   r0, #0x50
ldrh  r0, [r0]                    @ Last pressed key?

@ CheckRight
mov   r1, #0x10
tst   r1, r0
beq   CheckLeft
  ldr   r4, =MoveCursorRight
  b     L2
    CheckLeft:
    mov   r1, #0x20
    tst   r1, r0
    beq   CheckUp
      ldr   r4, =MoveCursorLeft
      b     L2
        CheckUp:
        mov   r1, #0x40
        tst   r1, r0
        beq   Down
          ldr   r4, =MoveCursorUp
          b     L2
            Down:
            ldr   r4, =MoveCursorDown
L2:
mov   r0, r5
bl    GOTO_R4


Return:
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
