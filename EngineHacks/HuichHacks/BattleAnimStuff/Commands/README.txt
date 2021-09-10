Hiya. This thing can be used to assign new effects to battle animation commands 0x7C and up. You can add your 
command to the list in "Commands/Commands.event". There's another list for playing sound effects here as well. 
Take a look at some vanilla command implementations to see how it works. If you add any commands, make sure to 
increase the value of the CommandCount variable in "BattleAnimCommands.event"

This version comes with two new commands taking up slot 0x7C and 0x7D. C7C is basically the same as C2E, but 
the rune's palette is more reddish instead of blue. Analogous for C7D and C2F.


When drawing sprites to the screen I use the Procs_BattleAnimDrawSprites proc and the PhaseStruct and 
UnitPhaseStruct structs. Here's how they work:


Procs_BattleAnimDrawSprites. Draws sprites during BattleAnims. Procvars:
  +0x2A, short.       Time left until next phase.
  +0x2C, poin.        Current phasestruct.
  +0x30, poin.        Main linked (parent?) AIStruct.
  +0x34, poin array.  Array[14] of pointers to AIStructs used by the sprites.


PHASESTRUCT:
  +0x00, poin.        Palette. If NULL, don't update palette.
  +0x04, poin.        Spritesheet. If NULL don't update sheet.
  +0x08, poin.        Next PhaseStruct. If NULL, deallocate AIStructs and end proc.
  +0x0C, short.       Phasetime. Determines when to move to next phase. If -1, don't decrement, but stall.
  +0x0E, short.       Bitfield.
                        Bit 0: if set, don't decrement timer if HP is changing, unit dying, spell active, etc.
  
  +0x10, poin.        Pointer to UnitPhaseStruct 1.
  +0x14, poin.        Pointer to UnitPhaseStruct 2.
  .
  .
  .
  +0xNN, poin.        Pointer to last UnitPhaseStruct.
  +0xNN+4, word.      Terminator, NULL, 0x0.


UNITPHASESTRUCT. Data used when initializing a unit's AIS:
  +0x00, poin.        Pointer to FrameData
  +0x04, short.       OAM0 mask.
  +0x06, short.       OAM1 mask.
  +0x08, short.       OAM2 mask.
  +0x0A, short.       Initial delay before handling AIS.
  +0x0C, sshort.      X relative to main linked AIStruct.
  +0x0E, sshort.      Y relative to main linked AIStruct.
  +0x10, byte.        AIS depth.




Procs_BattleAnimDrawSprites is actually a child of Tree 6, to ensure it's executed after the main linked AIS' X and Y get updated. This means we're also executing Tree 6 in the main game and battle animation update loops.

We're making the left and right weapon icons use the same palette, this frees up OBJ palette 14. We're using at most 5 palettes: OBJ palettes 2, 3, 4, 14, 15.


21/5/2021. This fortunately only took a day. I had fun making this. I'll try experimenting with more custom 
commands at some other point in time.

7/6/2021. Added a command that draws bonewalkers that gang up on the enemy target. These use a framework (PhaseStruct) that should make it easier to create more of these animated "gambit" attacks.

Credits to me, Huichelaar.