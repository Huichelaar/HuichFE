@ Blends and uses windows.
@ Procvars:
@   +0x29 through +0x31 are the parameters given to Procs_Blend.
@     +0x29: signed byte, value to add to 1st targets every loop iteration.
@     +0x2A: signed byte, value to add to 2nd targets every loop iteration.
@     +0x2B: byte, the amount of frames per blend update.
@     +0x2C: short, BLDCNT
@     +0x2E: byte, initial 1st targets value.
@     +0x2F: byte, initial 2nd targets value.
@     +0x30: byte, timer. increased every frame. End proc if this is equal to limit.
@     +0x31: byte, limit. End proc if this is equal to timer.
@
@   +0x32: short, timer.
@   +0x34: short, time before next entry.
@   +0x36: byte, lower byte of WINOUT (don't care about OBJ window).
@   +0x38: word, Pointer to Window dimensions table.
@   +0x3C: short, WININ
.thumb


@ Setup WININ and WINOUT.
@ Ignore OBJ Window WINOUT Byte.
ldr   r1, =gpDISPCNTbuffer
ldrb  r2, [r1, #0x1]
mov   r3, #0x60
orr   r2, r3
strb  r2, [r1, #0x1]
mov   r2, #0x36
ldrb  r3, [r0, r2]
strb  r3, [r1, r2]
ldrh  r3, [r0, #0x3C]
strh  r3, [r1, #0x34]


bx    r14

