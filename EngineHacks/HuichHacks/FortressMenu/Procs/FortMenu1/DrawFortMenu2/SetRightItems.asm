@ Sets Proc +0x29, byte holding ID [0-2] indicating which things to draw. Arguments:
@   r0 = value to set in Proc +0x29
@   r1 = Proc
.thumb

add   r1, #0x29
strb  r0, [r1]
bx    r14
