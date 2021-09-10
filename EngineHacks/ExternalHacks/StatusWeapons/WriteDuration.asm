@ Keep original duration nibble,
@ or set to 5 if it's 0.
.thumb

add   r0, #0x30
cmp   r1, #0x0
beq   L1                      @ Branch if no status
  mov   r2, #0xF0
  tst   r2, r1
  bne   L1                    @ Branch if duration has been set already.

    @ Duration not set yet. Set to 5.
    mov   r2, #0x50
    orr   r1, r2

L1:
strb  r1, [r0]
