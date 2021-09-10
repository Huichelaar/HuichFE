@ If backupcount decreased, load Suspend2 (save4) instead of Suspend1 (save3),
@ assuming suspend 2 is available, and assuming backupcounter wasn't zero.

.thumb

push  {r4-r5, r14}
mov   r5, #0x3

mov   r0, #0x0
mov   r1, #0x4
ldr   r4, =SaveMetadata_Load
bl    GOTO_R4
cmp   r0, #0x1
bne   L1                              @ Suspend2 unavailable, load Suspend1

ldr   r0, =Procs_SaveMenu
ldr   r4, =Find6C
bl    GOTO_R4
cmp   r0, #0x0
beq   L1                              @ No SaveMenu, load Suspend1

mov   r1, #0xE
lsl   r1, #0x18
add   r1, #0xD4
ldrb  r2, [r1]
cmp   r2, #0x0
beq   L1                              @ No undo's left, load Suspend1

mov   r3, #0x41
ldrb  r3, [r0, r3]
cmp   r2, r3
beq   L1                              @ Value wasn't changed, load Suspend1

strb  r3, [r1]                        @ Decrease undo's
mov   r5, #0x4                        @ Load Suspend2

L1:
mov   r0, r5
ldr   r4, =LoadSuspendedGame
bl    GOTO_R4


@ Previously overwritten by hook.
mov   r0, #0x4
ldr   r4, =0x08009F51
bl    GOTO_R4


pop   {r4-r5}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
