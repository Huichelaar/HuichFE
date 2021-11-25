
CSV AdvWeaponLocks/WeaponLockArray.csv
  TABLE WeaponLockArrayPointerTableLABEL AdvWeaponLocks/WeaponLockArray.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 256


CSV Chapters/ChapterDefinition.csv
  TABLE ChapterDataTableLABEL Chapters/ChapterDefinition.nmm
  TABLE EnemyEscapePointTableLABEL Chapters/EnemyEscapePointsPointers.nmm
  TABLE NPCEscapePointTableLABEL Chapters/NPCEscapePointsPointers.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 1

CSV Chapters/MultiSeizeUnits.csv
  TABLE MultiSeizeUnitsTableLABEL Chapters/MultiSeizeUnits.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 256

CSV Chapters/PointerTable.csv
  TABLE PLISTLABEL Chapters/PointerTable.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 236
  
CSV Chapters/WorldMapEventTable.csv
  TABLE WMETableLABEL Chapters/WorldMapEventTable.nmm
  TABLE WMCTableLABEL Chapters/WorldMapCutsceneTable.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 59


CSV WorldMap/Nodes.csv
  TABLE WMNTableLABEL WorldMap/Nodes.nmm FIXED
  TABLE WMPTableLABEL WorldMap/Paralogue.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 28

CSV WorldMap/Roads.csv
  TABLE WMRTableLABEL WorldMap/Roads.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 32
  
CSV WorldMap/SkirmishNodes.csv
  TABLE WMSTableLABEL WorldMap/SkirmishNodes.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 9
  
CSV WorldMap/SkirmishOdds.csv
  TABLE WMOTableLABEL WorldMap/SkirmishOdds.nmm
  TABLE WMHTableLABEL WorldMap/SkirmishChapters.nmm
  INLINE False
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 22


CSV Character/Characters.csv
  TABLE CharacterTableLABEL Character/Characters.nmm FIXED
  TABLE MagCharTableLABEL Character/MagChar.nmm
  TABLE EscapeQuoteTableLABEL Character/Quotes/EscapeQuote.nmm
  TABLE CharLevelUpSkillTableLABEL Character/CharLevelUpSkill.nmm
  TABLE PersonalSkillTableLABEL Character/PersonalSkill.nmm
  TABLE PaletteAssociationTableLABEL Character/PaletteAssociation.nmm FIXED
  TABLE PaletteAssociation2TableLABEL Character/PaletteAssociation2.nmm FIXED
  TABLE AbilityTableLABEL Character/Ability.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 256

CSV Character/BossBGM.csv
  TABLE BossBGMTableLABEL Character/BossBGM.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256
  
CSV Character/Quotes/BattleQuotes.csv
  TABLE BattleQuoteTableLABEL Character/Quotes/BattleQuotes.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256
  
CSV Character/Quotes/DeathQuotes.csv
  TABLE DeathQuoteTableLABEL Character/Quotes/DeathQuotes.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256

CSV Character/Supports/SupportValues.csv
  TABLE SupportValuesTableLABEL Character/Supports/SupportValues.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256

CSV Character/Supports/SupportConvos.csv
  TABLE SupportConvosTableLABEL Character/Supports/SupportConvos.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256

CSV Character/BattlePalette.csv
  TABLE BattlePaletteTableLABEL Character/BattlePalette.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256

CSV Character/RetreatsList.csv
  TABLE RetreatsListLABEL Character/RetreatsList.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 40


CSV Class/Classes.csv
  TABLE ClassTableLABEL Class/Classes.nmm
  TABLE MovingMapSpriteTableLABEL Class/MovingSpriteTable.nmm -1
  TABLE Class_Level_Cap_TableLABEL Class/ClassLevelCapTable.nmm
  TABLE ClassPromoLevelTableLABEL Class/ClassPromoLevel.nmm
  TABLE WalkingSoundsLABEL Class/WalkingSounds.nmm 
  TABLE MagClassTableLABEL Class/MagClass.nmm
  TABLE ModularEXPClassTableLABEL Class/ModularEXPClass.nmm
  TABLE ClassLevelUpSkillTableLABEL Class/ClassLevelUpSkill.nmm
  TABLE ClassSkillTableLABEL Class/ClassSkill.nmm
  TABLE ClassBonusGrowthsTableLABEL Class/ClassBonusGrowths.nmm
  TABLE LanceAnimTableLABEL Class/LanceAnim.nmm
  TABLE AxeAnimTableLABEL Class/AxeAnim.nmm
  TABLE GambitIDTableLABEL Class/GambitIDs.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 256
  
CSV Class/StandingSpriteTable.csv @ Standing map sprites.
	TABLE StandingMapSpriteTableLABEL Class/StandingSpriteTable.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 256


CSV BGs/ConvoBGs.csv @ Conversation Backgrounds.
	TABLE ConvoBackgroundTableLABEL BGs/ConvoBGs.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 256

CSV BGs/BattleBGs.csv @ Battle Backgrounds.
	TABLE BattleBGTableLABEL BGs/BattleBGs.nmm
	INLINE True
	WRITE_SEQUENTIALLY True
	MAX_ENTRIES 69

CSV BGs/BattleBGTerrainMap.csv @ Battle Backgrounds mapped to terrain.
	TABLE BattleBGTerrainMapTableLABEL BGs/BattleBGTerrainMap.nmm
	INLINE False
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 21


CSV Guide/GuideSort1.csv
	TABLE GuideSort1TableLABEL Guide/GuideSort1.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 256 @ TODO, reduce. This is overkill. Remember to update 0xCEB96 (in QoL/UI/UI.event) to match.

CSV Guide/GuideSort2.csv
	TABLE GuideSort2TableLABEL Guide/GuideSort2.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 9

CSV Guide/GuideEntries.csv
	TABLE GuideEntriesTableLABEL Guide/GuideEntries.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 256 @ TODO, reduce. This is overkill.


CSV Items/ItemTable.csv  @Things indexed by item.
	TABLE ItemTableLABEL Items/ItemTable.nmm
	TABLE ItemUsabilityTableLABEL Items/ItemUsabilityTable.nmm -0x4B
	TABLE ItemEffectTableLABEL Items/ItemEffectTable.nmm -0x4B
	TABLE PrepScreenUsabilityTableLABEL Items/ItemPrepScreenUsabilityTable.nmm -0x5B
	TABLE ItemTargetTableLABEL Items/ItemTargetTable.nmm -0x4B
  TABLE GambitTargetStructTableLABEL Items/GambitTargetStruct.nmm
	INLINE True
	WRITE_SEQUENTIALLY False
	MAX_ENTRIES 256

CSV Items/SpellAssociationTable.csv  @This is a list: Links item IDs to spell animations (among other things).
	TABLE SpellAssociationTableLABEL Items/SpellAssociationTable.nmm
	INLINE True
	WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256
  
  
CSV IERevamp/EffectAnimAssociation.csv
  TABLE UseEffectAnimTableLABEL IERevamp/EffectAnimAssociation.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 60

CSV IERevamp/ItemAITable.csv
  TABLE AI_ItemArrayLABEL IERevamp/ItemAITable.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 5

CSV IERevamp/ItemBoxEffect.csv
  TABLE IBArrayLABEL IERevamp/ItemBoxEffect.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 81

CSV IERevamp/PromotionItemTable.csv
  TABLE PromotionItemTableLABEL IERevamp/PromotionItemTable.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 11

CSV IERevamp/StaffAiTable.csv
  TABLE AI_StaffArrayLABEL IERevamp/StaffAiTable.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 13

CSV IERevamp/StatboosterText.csv
  TABLE StatBoosterTextTableLABEL IERevamp/StatboosterText.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 10

CSV IERevamp/Item_Effect_Revamp.csv
  TABLE IERevampTableLABEL IERevamp/Item_Effect_Revamp.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 81


CSV Misc/ModularPreBattleTable.csv
  TABLE ModularPreBattleTable Misc/ModularPreBattleTable.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 64


CSV Forts/Forts.csv
  TABLE FortsTableLABEL Forts/Forts.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 22

CSV Forts/Produce.csv
  TABLE ProduceTableLABEL Forts/Produce.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 21

CSV Forts/AbilityBonus.csv
  TABLE AbilityBonusTableLABEL Forts/AbilityBonus.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 256

CSV Forts/AffinityMatchupBonus.csv
  TABLE AffinityMatchupBonusTableLABEL Forts/AffinityMatchupBonus.nmm
  INLINE True
  WRITE_SEQUENTIALLY False
  MAX_ENTRIES 8


CSV Spells/Spells.csv
  TABLE SpellTableLABEL Spells/Spells.nmm
  INLINE True
  WRITE_SEQUENTIALLY True
  MAX_ENTRIES 256