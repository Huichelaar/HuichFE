#include "DrawBGSprites.h"


const struct ProcInstruction CRE_drawBGSprites_Proc[] = {
  PROC_SET_NAME("CRE_drawBGSprites"),
  PROC_LOOP_ROUTINE(CRE_loopDrawBGSprites),
  PROC_END
};

void CRE_loopDrawBGSprites() {
  PushToHiOAM(0, 0, (const ObjData*)&ClassReelBGOAM, 0x100);
}