@ Disables BG2. We need to do this to avoid showing a frame of garbage.
@ Immediately ends proc if screen is already being blacked out, to
@ avoid a visual glitch where the WM pops in for a frame.
@ Procstate vars. Format: <location>: <size>, <range>, <description>.
@   +0x2A: byte, [0, 240], PrevX. Initialized to 0
@   +0x2B: byte, [0, 160], PrevY. Initialized to 0
@   +0x2C: byte, [0, ??], Timer.
.thumb

push  {r4-r7,r14}
sub   sp, #0x4
mov   r5, r0


@ Don't slide if screen is being blacked out.
ldr   r0, =Procs_FadeOutBlack_Alt
ldr   r4, =Find6C
bl    GOTO_R4
cmp   r0, #0x0
beq   L1

  @ Screen is being blacked out,
  @ delete proc.
  mov   r0, r5
  ldr   r4, =Delete6C
  bl    GOTO_R4
  b     Return


L1:
@ Disable BG2
ldr   r4, =gpDISPCNTbuffer
ldrb  r0, [r4, #0x1]
mov   r1, #0xFB
and   r0, r1
strb  r0, [r4, #0x1]


Return:
add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
