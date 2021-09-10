@ Mimics Startopinfoview, 0x80B305C. Args:
@   r0:   Proc* parentProc.
@   r1:   u8 charIndex.
@ Returns:
@   r0:   Proc* charProc.
.thumb
.global opinfoview2_Start
.type   opinfoview2_Start, function
opinfoview2_Start:

push  {r4-r5, r14}
mov   r5, r1


mov   r1, r0
ldr   r0, =Procs_opinfoview2
ldr   r4, =New6C
bl    GOTO_R4
mov   r1, r0
add   r1, #0x2C
strh  r5, [r1]


pop   {r4-r5}
pop   {r1}
bx    r1
GOTO_R4:
bx    r4
