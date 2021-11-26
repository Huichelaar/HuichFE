#include <limits.h>
#include "Autolevel.h"


// For generic units.
void SCU_autolevel(Unit* unit) {
  struct UnitDefinition* unitDefinition;
  unitDefinition = *(struct UnitDefinition**)((u32)&FirstUNITCommand << 5 >> 5);
  u8 level = 1;
  u8 levelCount;
  
  // Tier 1
  unit->pClassData = &ClassTableLABEL[unitDefinition->classIndex];    // Set class to match autolevels.
  levelCount = SCU_min(ClassPromoLevelTableLABEL[unitDefinition->classIndex], unit->level) - level;
  UnitAutolevelCore(unit, unitDefinition->classIndex, (s8)levelCount);
  level += levelCount;
  if (level == unit->level)
    return;
  
  // Tier 2
  unitDefinition += 1;
  unit->pClassData = &ClassTableLABEL[unitDefinition->classIndex];    // Set class to match autolevels.
  SCU_autoPromoteUnit(unit);                                          // Add promotion bonuses.
  levelCount = SCU_min(ClassPromoLevelTableLABEL[unitDefinition->classIndex], unit->level) - level;
  UnitAutolevelCore(unit, unitDefinition->classIndex, (s8)levelCount);
  level += levelCount;
  if (level == unit->level)
    return;
  
  // Tier 3
  unitDefinition += 1;
  unit->pClassData = &ClassTableLABEL[unitDefinition->classIndex];    // Set class to match autolevels.
  SCU_autoPromoteUnit(unit);                                          // Add promotion bonuses.
  levelCount = unit->level - level;
  UnitAutolevelCore(unit, unitDefinition->classIndex, (s8)levelCount);
  return;
}

// For units <0x40 and those with boss-bit set in their class or char.
void SCU_autolevelRealistic(Unit* unit) {
  struct UnitDefinition* unitDefinition;
  unitDefinition = *(struct UnitDefinition**)((u32)&FirstUNITCommand << 5 >> 5);
  
  // Copying vanilla.
  struct BattleUnit battleUnit;
  battleUnit.expGain = 0;
  
  s8 lvDiff = unit->level - unit->pCharacterData->baseLevel;      // Levels remaining until target level.
  if (!lvDiff)                                // If level == ROM Unit struct Lv.: Return.
    return;
  unit->level = unit->level - lvDiff;         // Current level before autolevelling.
  if (lvDiff <= 0)                            // If level <= ROM Unit struct Lv.: Return.
    return;
  
  // Set class to match pre-autolevelled level.
  // No need to set T3 class; Unit will already be that class.
  u8 tier;
  for (tier = 0; tier < 2; tier++) {
    if (unit->level < ClassPromoLevelTableLABEL[(unitDefinition+tier)->classIndex]) {
      unit->pClassData = &ClassTableLABEL[(unitDefinition+tier)->classIndex];
      break;
    }
  }
  unitDefinition += tier;
  
  // Autolevel loop.
  while (lvDiff > 0) {
    // Promote unit if they can.
    unitDefinition = SCU_promoteUnitIfNecessary(unitDefinition, unit);
    
    // Copying vanilla.
    battleUnit = *InitBattleUnit(&battleUnit, unit);
    battleUnit.unit.exp = 100;
    CheckBattleUnitLevelUp(&battleUnit);
    UpdateUnitFromBattle(unit, &battleUnit);
    
    lvDiff -= 1;
  }
}

// Check if unit can promote, and do so if they can.
struct UnitDefinition* SCU_promoteUnitIfNecessary(struct UnitDefinition* unitDefinition, Unit* unit) {
  s8 promoLevel = ClassPromoLevelTableLABEL[unit->pClassData->number];
  if (!promoLevel)                  // T3 classes don't promote. Indicated by having 0 as promo level.
    return unitDefinition;
  if (unit->level < promoLevel)     // Return if we can't promote yet.
    return unitDefinition;
  
  unitDefinition += 1;
  unit->pClassData = &ClassTableLABEL[unitDefinition->classIndex];
  SCU_autoPromoteUnit(unit);
  unitDefinition = SCU_promoteUnitIfNecessary(unitDefinition, unit);  // Check if unit can already promote again.
  
  return unitDefinition;
}

// Add promotion bonuses of unit's currently set class.
void SCU_autoPromoteUnit(Unit* unit) {
  u8* classStats = (u8*)unit->pClassData;
  u8* unitStats = (u8*)unit;
  
  // Increase HP, POW, SKL, SPD, DEF, RES.
  u8 temp;
  for (u8 i = 0; i < 6; i++) {
    temp = unitStats[13+i] + classStats[22+i];
    if (temp > classStats[13+i])                  // If unit stat + promo bonus > max stat,
      unitStats[13+i] = classStats[13+i];         // unit stat := max stat.
    else                                          // Else
      unitStats[13+i] = temp;                     // unit stat := unit stat + promo bonus.
  }
  unitStats[12] = unitStats[13];                  // Set max hp to current hp.
  
  // Increase MGC (separate due to Str/Mag split).
  struct MagClass magClass = MagClassTableLABEL[unit->pClassData->number];
  temp = unit->unk3A + magClass.promotionMag;
  if (temp > (u8)magClass.maxMag)
    unit->unk3A = (u8)magClass.maxMag;
  else
    unit->unk3A = temp;
}

// I needed one.
u8 SCU_min(u8 u, s8 s) {
  if (u < (u8)s)
    return u;
  return (u8)s;
}