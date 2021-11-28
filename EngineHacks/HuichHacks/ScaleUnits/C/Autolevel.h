#ifndef SCALEUNITS_H
#define SCALEUNITS_H
#include "gbafeext.h"

// From Tables/Class/MagClass.nmm
// Signed & Unsigned convention is not my fault. I'm mimicking FEClib's.
struct MagClass {
  s8 baseMag;
  s8 growthMag;
  s8 maxMag;
  u8 promotionMag;
};
extern struct MagClass MagClassTableLABEL[];
extern struct UnitDefinition** FirstUNITCommand[3];
extern struct ClassData ClassTableLABEL[];
extern u8 ClassPromoLevelTableLABEL[];
extern u8 Class_Level_Cap_TableLABEL[];

void SCU_autolevel(Unit* unit);
void SCU_autolevelRealistic(Unit* unit);
struct UnitDefinition* SCU_promoteUnitIfNecessary(struct UnitDefinition* unitDefinition, Unit* unit);
void SCU_autoPromoteUnit(Unit* unit);
u8 SCU_min(u8 u, s8 s);
#endif // SCALEUNITS_H