#include "Other.h"


void CRE_spriteInitOther(struct CRE_SpriteOtherStruct spriteOtherStruct[], struct CRE_ProcStateSprite* proc, u8 variantIndex) {
  proc->drawSpriteProc = (struct CRE_ProcStateDrawSprite*)ProcStart(CRE_drawSprite_Proc, (Proc*)proc);
  proc->drawSpriteProc->node = 8;        // Behind authors.
  proc->drawSpriteProc->OAM0 = 0;
  proc->drawSpriteProc->OAM1 = 0;
  proc->drawSpriteProc->OAM2 = 0x3A00;   // palette 3, priority 2, tile 0x200.
  proc->drawSpriteProc->OAMData = spriteOtherStruct[variantIndex].OAMData;
  
  Decompress(spriteOtherStruct[variantIndex].tiles, gGenericBuffer);
  RegisterTileGraphics(gGenericBuffer, (void*)0x6014000, 0x2000);
  CopyToPaletteBuffer(spriteOtherStruct[variantIndex].palette, 0x20 * 19, 0x20 * 13);
}

const struct ProcInstruction CRE_otherSprite_Proc[] = {
  PROC_SET_NAME("CRE_otherSprite"),
  
  PROC_LABEL(0),
  PROC_SLEEP(121),
  PROC_CALL_ROUTINE(CRE_otherCheckIfMosaic),
  PROC_CALL_ROUTINE(CRE_increaseMosaic),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_setOtherVariant),
  PROC_CALL_ROUTINE(CRE_decreaseMosaic),
  PROC_GOTO(0),
  
  PROC_END
};

// Only ends proc if next entry doesn't have tiles, OAMData OR palette!
void CRE_otherCheckIfMosaic(struct CRE_ProcStateSpriteOther* proc) {
  proc->variantIndex++;
  if (!proc->spriteOtherStruct[proc->variantIndex].tiles && !proc->spriteOtherStruct[proc->variantIndex].OAMData && !proc->spriteOtherStruct[proc->variantIndex].palette)
    EndProc((Proc*)proc);
}

// Only changes data that's different.
void CRE_setOtherVariant(struct CRE_ProcStateSpriteOther* proc) {
  
  if (proc->spriteOtherStruct[proc->variantIndex].OAMData)
    proc->drawSpriteProc->OAMData = proc->spriteOtherStruct[proc->variantIndex].OAMData;
  if (proc->spriteOtherStruct[proc->variantIndex].tiles) {
    Decompress(proc->spriteOtherStruct[proc->variantIndex].tiles, gGenericBuffer);
    RegisterTileGraphics(gGenericBuffer, (void*)0x6014000, 0x2000);
  }
  if (proc->spriteOtherStruct[proc->variantIndex].palette)
    CopyToPaletteBuffer(proc->spriteOtherStruct[proc->variantIndex].palette, 0x20 * 19, 0x20 * 13);
}