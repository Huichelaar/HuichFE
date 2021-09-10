@ Hooked at 0xAF81C. Executed when
@ switching songs in the soundroom.
.thumb

push  {r4-r7, r14}
mov   r6, r4                  @ SoundRoomUI proc.
sub   sp, #0x4


@ Vanilla overwritten stuff
ldr   r0, [r0]
mov   r5, r0
str   r3, [sp]
mov   r3, r1
ldr   r2, =0x100
mov   r1, r2
ldr   r4, =Sound_SongTransition
bl    GOTO_R4


@ r5 contains SongID of song to be played.
ldr   r0, =SBG_Main_Proc
ldr   r4, =Find6C
bl    GOTO_R4
mov   r7, r0
cmp   r7, #0x0
bne   L1

  ldr   r0, =SBG_Main_Proc
  mov   r1, r6
  ldr   r4, =New6C
  bl    GOTO_R4
  mov   r7, r0
  mov   r0, #0x0
  str   r0, [r7, #0x2C]       @ SBG_Main_Proc->currentSongID.
  bl    SBG_DetermineSongBGStruct
  str   r0, [r7, #0x34]       @ SBG_Main_Proc->currentSongBGStruct.
  

L1:
mov   r0, r5
str   r0, [r7, #0x30]         @ SBG_Main_Proc->nextSongID.
bl    SBG_DetermineSongBGStruct
str   r0, [r7, #0x38]         @ SBG_Main_Proc->nextSongBGStruct.


add   sp, #0x4
pop   {r4-r7}
pop   {r0}
bx    r0
GOTO_R4:
bx    r4
