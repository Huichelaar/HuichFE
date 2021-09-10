Things I changed in SkillSys to get this working:
  Changed UnitMenu UM_Attack to use GAM_AttackCommandUsability.
  Added check to UnitActionRework/prNewActionApplication for equipslot 9 (and 8).
  Added check to ItemRangefix/ReturnRangeBitfield for gambits.
  Added GAM_GambitHitTargets to PostBattleCalcLoop.
  Added update to debufftable entry to PostBattleCalcLoop.
  Changed ProcessDebuffsMag to leave top 3 msb of debufftable byte 5 unaffected.
  Made StatusWeapon.s overwrite target's existing status with new status.
Technically more related to CannotCrit:
  Added another routine to CannotCrit to ensure battle crit is 0 during ComputeCrit.
  Changed QoL/NegativeWStatDisplay/asm/NegativeDisplay.s to draw a dash when weapon crit is 0xFF.

Gambit uses the top three bits of a unit's debufftable entry byte 5 to keep track of how many times that unit 
has used their gambit. Once the value stored here is equal to the gambit's durability, the unit won't be able to 
use their gambit anymore. As it's the debufftable, this number will reset in-between chapters. As NPC and 
Enemies don't use gambits, these bits can still be repurposed for units of these allegiances.

Gambit effect is applied post-battle by checking miss-bit of round immediately before currentround. Assumption 
is that only one round of combat happened (gambits can't double and are uncounterable). This round is used to 
determine whether gambit hit or missed. If miss, don't apply gambit effect. Regardless of hit or miss, a charge 
is consumed.

Gambits apply status stored in item+0x22 (like StatusWeapons). This status is applied to all enemy units in 
range. Gambits deal full damage to the main target. All other enemies in range will get half damage, but this 
damage ignores just about anything that can influence damage other than weapon might, str/mag and def/res. 
Gambits can't kill anyone but target, will leave other enemies at 1 hp at best. Existing statuses are overwritten.

To determine the Area-of-Effect (enemy units in which will be affected by the gambit) I'm using the 
GambitTargetStruct. This struct consists of four pointers, each corresponding to the direction the actor is 
facing. Each pointer then points to a series of coordinates of all tiles that are targeted. These coordinates 
are relative to the position of the main target. non-target enemy units on targeted tiles will be affected as 
mentioned in the paragraph directly above this one. To check whether an item is a gambit, its GambitTargetStruct 
is compared against 0.
  Alternatively, these pointers can be values between 0-255. In that case they're interpreted as radii which 
  determine which tiles are targeted. This can be useful for ranged gambits.

GambitTargetStruct:
POIN FaceW    0     if <= 0xFF, not a pointer, but radius.
POIN FaceE    1     as above.
POIN FaceS    2     as above.
POIN FaceN    3     as above.


  FaceN:
  BYTE Target0X
  BYTE Target0Y

  BYTE Target1X
  BYTE Target1Y

  .
  .
  .

  BYTE Terminator(0x7F)
  BYTE Terminator(0x7F)


16/6/2021. Seems I created the Gambit directory on 8/6/2021. Hardest part was figuring out how to add the gambit 
item to the menu of weapons to select when attacking an enemy, and have this set up the battle correctly.
~Huichelaar