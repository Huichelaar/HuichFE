Allies, NPC, Enemies, everyone basically, has fixed growths.

During UNIT LOADing, We're using eight bytes at 0x3003F48 for storing some stuff we need.

Seems Vanilla's load limit is 31 units per group. UNIT_Filter, 0x800F914, puts these units and one more byte in a buffer at 0x203ED40. When LOADing UNITs, one of every three UNITs will be picked. We should be fine loading 10 units per group. Maybe more, considering our debufftable starts at 0x203FA70, but idk if we're bleeding into vanilla stuff at that point.

If autolevel is turned off, the first UNIT will be picked. If not:
  Which of every three UNITs will be picked depends on the class of the UNIT and the absolute level the loaded unit will have. Unit's absolute level = relative level (the 5 bits indicating level in the UNIT. [-16, 15]) + Player army level (level of the highest-levelled non-dead player unit). If the unit's absolute level >= the level at which the first UNIT's class can promote, the next UNIT is picked, unless unit's absolute level >= the level at which that UNIT's class can promote, in which case the third UNIT is picked. The first UNIT whose class the unit can't promote past yet, due to absolute level < the level at which that UNIT's class can promote, will be picked. If a UNIT's class doesn't promote (promolevel == 0), the next UNIT will be picked, unless this UNIT is already the third.
  
lv255 autolearn for promoted units doesn't work anymore. Level doesn't reset upon promotion. Levels can go beyond 31, to 127 potentially, but I'd stick to 99 as max to avoid having to change how Lv is drawn in stat screen (triple digits). Not to mention, 99 should really be enough levels.
  - Generic NPCs and enemies don't get any skills.
  - Enemies with boss flag set will use char-level up skills. Class-level up skills won't work, as their class can differ, and level-up skills aren't saved for units with no BWL data.
  - Allies and non-generic NPCs have BWL and will learn class-level up skills as they autolevel. Note: if char A has class B, which can promote at level C and learns class-lv-up skill D at level E > C, D will not be learned if A is autolevelled to C or beyond. Recruit this unit before they promote due to autolevel if you want their class-lvup skill.

Some other stuff:
  - Changed EngineHacks\SkillSystem\Internals\asm\GetUnitLevelSkills.s to not give class level up skills to units > 0x3F (generics/noBWL).
  
  - Changed EngineHacks/Necessary\ExpandedModularSave\SrcModules\SaveUnitExpanded.s to save two more level bits, sacrificing two rescue bits in the unit state.
  
  - Changed EngineHacks\SkillSystem\Internals\asm\GetUnitLevelSkills.s GetInitialSkillList, AutoloadSkills to match how skills are loaded to new units.
  
  - Changed EngineHacks\Necessary\ModularStatScreen\asm\Write_Growths_To_Battle_Struct.asm to not add levels when promotion bit is set.

  - Promoted bit is unset for every class. Might not be necessary anymore, but no need to change atm anyways, & is safer to keep this way.

Haphazard (maybe outdated) notes:
  Check out how to get to 800FC34 & 800F604, calls to UNITs_LoadInstant_800F698

  LoadUnitStats is called in 2 places. During regular load units & when setting up an arena opponent.

  Autolevel flag checked at 8017C18. LSBit is autolevel flag. Enemy faction is (10)b. 0x8017c24: Difference between NPC Enemy & Ally fsr.
    - AutolevelRealistic, 0x8018160, is only called in LoadUnit function which takes a *UNIT.
    - AutolevelUnit, 0x8018120, is called in 3 places:
      - LoadUnit, 0x8017AC4. This is the place we care about.
      - StoreUnitStats, 0x8018064. This routine seems to be called by neither proc nor routine. Unused?
      - LoadArenaOpponentStruct, 0x8031A84. Guess we'll have to just not have arenas for the time being.

  8017C48: Bosses use different growths for autolevel. Seems AutolevelRealistic is for bosses & non-generics, whereas AutolevelUnit is for generics.

  8017FD4, class growths are signed.

  8017BEA call to StoreNewUnitFromCode, need to hook in this. StoreNewUnitFromCode is called only by LoadUnit and LoadArenaOpponentStruct.