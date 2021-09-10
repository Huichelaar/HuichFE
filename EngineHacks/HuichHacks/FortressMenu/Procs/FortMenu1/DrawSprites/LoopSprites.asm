.thumb

push  {r14}

mov   r1, #0x29
ldrb  r2, [r0, r1]
lsl   r1, r2, #0x2
lsl   r2, #0x1
add   r1, r2
add   pc, r1
lsl   r0, #0x0                  @ nop. We need to pad.

bl    LabourLumber
b     Return
@bl    LabourLumber
@b     Return
@ Etc. Insert further animroutines for different labour.

Return:
pop   {r0}
bx    r0
