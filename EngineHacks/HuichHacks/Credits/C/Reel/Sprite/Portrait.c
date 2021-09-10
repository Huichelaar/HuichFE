#include "Portrait.h"


void CRE_portraitSegConstructor(struct CRE_CreditStruct* creditStruct) {
  Face_Init();
  const FaceGfxDefinition defaultFaceGfx[4] = {{(void*)0x4000, 3}, {(void*)0x4000, 3}, {(void*)0x4000, 3}, {(void*)0x4000, 3}};
  SetFaceGfxConfig(defaultFaceGfx);
  StartFace(0, 1, 288, 0, 0x80000002);        // Offscreen, mosaic enabled, show entire portrait.
}

void CRE_portraitSegDestructor(struct CRE_CreditStruct* creditStruct) {
  Face_Init();      // Deletes all portraits.
}

void CRE_spriteInitPortrait(u16 portraitID[], u8 variantIndex) {
  const PortraitData* portraitData = GetPortraitData((int)portraitID[variantIndex]);
  
  gpFaceProcs[0]->pPortraitData = portraitData;
  gpFaceProcs[0]->portraitIndex = portraitID[variantIndex];
  SetFaceDisplayBits(gpFaceProcs[0], 0x80000002);
  
  Decompress(portraitData->pPortraitGraphics, gGenericBuffer);
  RegisterTileGraphics(gGenericBuffer, 0x6010000+(void*)gFaceGfxData[0].pTileRoot, 0x1000);
  CopyToPaletteBuffer(portraitData->pPortraitPalette, 0x20 * (gFaceGfxData[0].paletteIndex + 16), 0x20);
}

const struct ProcInstruction CRE_portraitSprite_Proc[] = {
  PROC_SET_NAME("CRE_portraitSprite"),
  
  PROC_LABEL(0),
  PROC_SLEEP(31),
  PROC_CALL_ROUTINE_ARG(CRE_setFaceDisplayBits, 0x0012),
  PROC_SLEEP(60),
  PROC_CALL_ROUTINE_ARG(CRE_setFaceDisplayBits, 0x001A),
  PROC_SLEEP(60),
  PROC_CALL_ROUTINE_ARG(CRE_setFaceDisplayBits, 0x000A),
  PROC_SLEEP(60),
  
  PROC_CALL_ROUTINE(CRE_portraitCheckIfMosaic),
  PROC_CALL_ROUTINE(CRE_increaseMosaic),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_setPortraitVariant),
  PROC_CALL_ROUTINE_ARG(CRE_setFaceDisplayBits, 0x0002),
  PROC_CALL_ROUTINE(CRE_decreaseMosaic),
  PROC_GOTO(0),

  PROC_END
};

int CRE_setFaceDisplayBits(u16 faceDisplayBits, struct CRE_ProcStateSpritePortrait* proc) {
  u32 displayBits = GetFaceDisplayBits(gpFaceProcs[0]);
  displayBits &= 0xFFFF0000;
  displayBits |= (u32)faceDisplayBits;
  SetFaceDisplayBits(gpFaceProcs[0], displayBits);
  return 1;
}

void CRE_portraitCheckIfMosaic(struct CRE_ProcStateSpritePortrait* proc) {
  proc->variantIndex++;
  if (!proc->portraitID[proc->variantIndex])
    EndProc((Proc*)proc);
}

void CRE_setPortraitVariant(struct CRE_ProcStateSpritePortrait* proc) {
  CRE_spriteInitPortrait(proc->portraitID, proc->variantIndex);
}