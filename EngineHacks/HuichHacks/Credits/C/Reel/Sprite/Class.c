#include "Class.h"


void CRE_classSegConstructor(struct CRE_CreditStruct* creditStruct) {
  // Prepare battle animation stuff.
  StartEkrAnimeDrvProc();
  
  gAISBuffer.genericPalID = 0;
  gAISBuffer.xPos = 260;          // start offscreen.
  gAISBuffer.yPos = 0;
  gAISBuffer.animID = 1;          // Default anim.
  gAISBuffer.charPalID = 0;
  gAISBuffer.AISMode = 6;
  gAISBuffer.state2 = 1;
  gAISBuffer.tileOffset = 0x200;
  gAISBuffer.palOffset = 3;
  gAISBuffer.AIS1 = 0;
  gAISBuffer.AIS2 = 0;
  gAISBuffer.sheet = (void *)0x2000038;
  gAISBuffer.pal = (void *)0x2007838;
  gAISBuffer.rtlOAM = (void *)0x2002038;
  gAISBuffer.frameData = (void *)0x20078D8;
  gAISBuffer.sheetPointer = (void *)0;
  gAISBuffer.magicEffects = (void *)0x200A2D8;          // We're not using this though.
  
  StartEkrUnitMainMini(&gAISBuffer);                    // This also sets AIS1 and AIS2.
  
  // Enable mosaic on battle anim.
  gAISBuffer.AIS1->oam0base |= 0x1000;
  gAISBuffer.AIS2->oam0base |= 0x1000;
}

void CRE_classSegDestructor(struct CRE_CreditStruct* creditStruct) {
  EndEkrAnimeDrvProc();
  if (ProcFind(gProc_ekrUnitMainMini))
    EndEkrUnitMainMini(&gAISBuffer);
}

void CRE_spriteInitClass(struct CRE_SpriteClassStruct* spriteClassStruct, struct CRE_ProcStateSprite* proc) {
  CRE_spriteInitCC(spriteClassStruct->classID1);
  
  proc->drawSpriteProc = (struct CRE_ProcStateDrawSprite*)ProcStart(CRE_drawSprite_Proc, (Proc*)proc);
  proc->drawSpriteProc->node = 8;        // Behind authors.
  proc->drawSpriteProc->OAM0 = 0x1000;   // Mosaic enabled.
  proc->drawSpriteProc->OAM1 = 0xF0;     // Offscreen.
  proc->drawSpriteProc->OAM2 = 0x3A00;   // palette 3, priority 2, tile 0x200.
  proc->drawSpriteProc->OAMData = &ccOAM;
}

// Puts class card into OBJ VRAM.
void CRE_spriteInitCC(u8 classID) {
  const ClassData* classData = GetClassData(classID);
  const PortraitData* classCard = GetPortraitData((int)classData->defaultPortraitId);
  
  CopyToPaletteBuffer(classCard->pPortraitPalette, 0x20 * 19, 0x20);
  
  Decompress(classCard->unk10, gGenericBuffer);
  CpuFastFill(0, gBg0MapBuffer, 0x2000);                      // We'll use the mapbuffers to buffer the tiles
  CopyTileGfxForObj(gGenericBuffer, gBg0MapBuffer, 10, 8);    // as these aren't being used rn anyways.
  CopyTileGfxForObj(gGenericBuffer+0xA00, (void*)gBg0MapBuffer+0x140, 10, 1);
  RegisterTileGraphics(gBg0MapBuffer, (void*)0x6014000, 0x2000);
}

const struct ProcInstruction CRE_classSprite_Proc[] = {
  PROC_SET_NAME("CRE_classSprite"),
  PROC_SLEEP(45),
  PROC_CALL_ROUTINE_2(CRE_ccCheckIfMosaic),
    PROC_CALL_ROUTINE(CRE_increaseMosaic),
    PROC_YIELD,
    PROC_CALL_ROUTINE(CRE_ccSetVariant),
    PROC_CALL_ROUTINE(CRE_decreaseMosaic),
    PROC_SLEEP(45),
  PROC_LABEL(0),
  PROC_CALL_ROUTINE(CRE_increaseMosaic),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_initMapSprites1),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_initMapSprites2),
  PROC_CALL_ROUTINE(CRE_decreaseMosaic),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_SMSLoop),
  PROC_LOOP_ROUTINE(CRE_MMSLoop),
  PROC_CALL_ROUTINE(CRE_increaseMosaic),
  PROC_YIELD,
  PROC_END_ALL(CRE_drawSprite_Proc),
  PROC_YIELD,
  PROC_CALL_ROUTINE_ARG(CRE_doAnim, 0x0006),
  PROC_CALL_ROUTINE(CRE_decreaseMosaic),
  PROC_YIELD,
    
  // Regular attack, melee.
  PROC_CALL_ROUTINE_ARG(CRE_doAnim, 0x0000),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_waitUntilFinished),
  PROC_SLEEP(30),
  PROC_CALL_ROUTINE(CRE_doReturn),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_waitUntilFinished),
  
  // Mosaic sprite.
  PROC_CALL_ROUTINE(CRE_baCheckIfMosaic),
    PROC_SLEEP(10),
    PROC_CALL_ROUTINE(CRE_increaseMosaic),
    PROC_YIELD,
    PROC_CALL_ROUTINE_ARG(CRE_doAnim, 0x0106),
    PROC_CALL_ROUTINE(CRE_decreaseMosaic),
    PROC_SLEEP(10),
  
  // Critical hit, melee.
  PROC_LABEL(1),
  PROC_YIELD,
  PROC_CALL_ROUTINE_ARG(CRE_doAnim, 0x0101),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_waitUntilFinished),
  PROC_SLEEP(30),
  PROC_CALL_ROUTINE(CRE_doReturn),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_waitUntilFinished),
  PROC_SLEEP(15),
  
  PROC_END
};

int CRE_ccCheckIfMosaic(struct CRE_ProcStateSpriteClass* proc) {
  // No mosaic if sprite remains the same.
  if (proc->spriteClassStruct->classID1 == proc->spriteClassStruct->classID2) {
    ProcGoto((Proc*)proc, 0);
    proc->sleepTime = 30;
    proc->onCycle =_ProcSleepCallback;
  }
  return 0;         // Yield.
}

void CRE_ccSetVariant(struct CRE_ProcStateSpriteClass* proc) {
  CRE_spriteInitCC(proc->spriteClassStruct->classID2);
}

// Change OAM
void CRE_initMapSprites1(struct CRE_ProcStateSpriteClass* proc) {
  proc->timer = 0;
  proc->drawSpriteProc->node = 8;         // Behind authors.
  proc->drawSpriteProc->OAM0 = 0x1008;    // Mosaic enabled.
  proc->drawSpriteProc->OAM1 = 0xA0;
  proc->drawSpriteProc->OAM2 = 0x3A00;    // palette 3, priority 2, tile 0x200.
  proc->drawSpriteProc->OAMData = &msOAM;
}

// Put SMS in VRAM and buffer MMS.
void CRE_initMapSprites2(struct CRE_ProcStateSpriteClass* proc) {
  CpuFastFill(0, gGenericBuffer, 0x2000);           // We'll use the mapbuffers to buffer the tiles
  CpuFastFill(0, gBg0MapBuffer, 0x2000);            // as these aren't being used rn anyways.
  RegisterTileGraphics(gBg0MapBuffer, (void*)0x6014000, 0x2000);
  CopyToPaletteBuffer(gPal_MapSprite, 0x20 * 19, 0x60);
  CopyToPaletteBuffer(gPal_MapSprite+0x60, 0x20 * 22, 0x20);
  
  struct SMSData smsData;
  u16 size, offset;
  u8 width, height, smsID = GetClassSMSId(proc->spriteClassStruct->classID1);
  for (u8 i = 0; i < 2; i++) {
    smsData = StandingMapSpriteTable[smsID];
    Decompress(smsData.pGraphics, gGenericBuffer);
    
    size = 1 << (smsData.size + 7);
    width = 2 + (smsData.size&2);
    height = 2 + ((smsData.size&1)<<1) + (smsData.size&2);
    offset = ((((smsData.size+2)&3)>>1)<<4) + ((((~smsData.size)+3)>>1)<<10);
    
    CopyTileGfxForObj(gGenericBuffer, gBg0MapBuffer+(i<<11)+offset, width, height);
    CopyTileGfxForObj(gGenericBuffer, gBg0MapBuffer+(i<<11)+offset+0x40, width, height);
    CopyTileGfxForObj(gGenericBuffer+size, gBg0MapBuffer+(i<<11)+offset+0x80, width, height);
    CopyTileGfxForObj(gGenericBuffer+size, gBg0MapBuffer+(i<<11)+offset+0xC0, width, height);
    CopyTileGfxForObj(gGenericBuffer+(size<<1), gBg0MapBuffer+(i<<11)+offset+0x100, width, height);
    CopyTileGfxForObj(gGenericBuffer+(size<<1), gBg0MapBuffer+(i<<11)+offset+0x140, width, height);
    
    smsID = GetClassSMSId(proc->spriteClassStruct->classID2);
  }
  
  Decompress(MMS_GetGfx(proc->spriteClassStruct->classID1), gSMSGfxBuffer_Frame1);   // These buffers are
  Decompress(MMS_GetGfx(proc->spriteClassStruct->classID2), gSMSGfxBuffer_Frame2);   // also unused.
}

// Goes through one SMS cycle.
void CRE_SMSLoop (struct CRE_ProcStateSpriteClass* proc) {
  
  proc->timer++;
  
  switch(proc->timer) {
    case 32 :
      proc->drawSpriteProc->OAM2 = 0x3A08;
      break;
    case 36 :
      proc->drawSpriteProc->OAM2 = 0x3A10;
      break;
    case 68 :
      proc->drawSpriteProc->OAM2 = 0x3A08;
      break;
    case 72 :
      proc->drawSpriteProc->OAM2 = 0x3A00;
      break;
    case 104 :
      proc->timer = 0;
      BreakProcLoop((Proc*)(proc));
      break;
  }
}

// Goes through the MMS cycles.
void CRE_MMSLoop (struct CRE_ProcStateSpriteClass* proc) {
  u16 offset1, offset2;
  
  proc->timer++;
  
  switch(proc->timer) {
    // move up & down.
    case 1 :
      proc->drawSpriteProc->OAM2 = 0x3A18;
      offset1 = 0x8;
      offset2 = 0x10;
      break;
    case 14 :
      offset1 = 0xA;
      offset2 = 0x12;
      break;
    case 20 :
      offset1 = 0xC;
      offset2 = 0x14;
      break;
    case 33 :
      offset1 = 0xE;
      offset2 = 0x16;
      break;
    case 39 :
      offset1 = 0x8;
      offset2 = 0x10;
      break;
    // move left & right.
    case 52 :
      offset1 = 0x2;
      offset2 = 0x2;
      break;
    case 58 :
      offset1 = 0x4;
      offset2 = 0x4;
      break;
    case 71 :
      offset1 = 0x6;
      offset2 = 0x6;
      break;
    case 77 :
      offset1 = 0x0;
      offset2 = 0x0;
      break;
    // move down & up.
    case 90 :
      offset1 = 0x12;
      offset2 = 0xA;
      break;
    case 96 :
      offset1 = 0x14;
      offset2 = 0xC;
      break;
    case 109 :
      offset1 = 0x16;
      offset2 = 0xE;
      break;
    case 115 :
      offset1 = 0x10;
      offset2 = 0x8;
      break;
    // Hover animation.
    case 128 :
      offset1 = 0x18;
      offset2 = 0x18;
      break;
    case 148 :
      offset1 = 0x1A;
      offset2 = 0x1A;
      break;
    case 152 :
      offset1 = 0x1C;
      offset2 = 0x1C;
      break;
    case 172 :
      offset1 = 0x1A;
      offset2 = 0x1A;
      break;
    case 176 :
      offset1 = 0x18;
      offset2 = 0x18;
      break;
    case 196 :
      offset1 = 0x1A;
      offset2 = 0x1A;
      break;
    case 200 :
      offset1 = 0x1C;
      offset2 = 0x1C;
      break;
    case 219 :
      proc->timer = 0;
      BreakProcLoop((Proc*)proc);
      CpuFastFill(0, gSMSGfxBuffer_Frame1, 0x4000);       // These don't get cleaned by vanilla.
    default :
      return;
  }
  offset1 <<= 8;
  offset2 <<= 8;
  
  CopyTileGfxForObj(gSMSGfxBuffer_Frame1+offset1, (void*)0x6014300, 4, 4);
  CopyTileGfxForObj(gSMSGfxBuffer_Frame1+offset2, (void*)0x6014380, 4, 4);
  CopyTileGfxForObj(gSMSGfxBuffer_Frame2+offset1, (void*)0x6015300, 4, 4);
  CopyTileGfxForObj(gSMSGfxBuffer_Frame2+offset2, (void*)0x6015380, 4, 4);
}

// sarg is anim (index << 8) | anim mode. Where index is 0 or 1.
int CRE_doAnim(u16 indexMode, struct CRE_ProcStateSpriteClass* proc) {
  u8 index = (u8)(indexMode>>8);
  u16 mode = indexMode & 0xFF;
  
  if (!index) {
    gAISBuffer.genericPalID = proc->spriteClassStruct->genericPalID1;
    gAISBuffer.xPos = proc->spriteClassStruct->baXPos1;
    gAISBuffer.yPos = proc->spriteClassStruct->baYPos1;
    gAISBuffer.animID = proc->spriteClassStruct->animID1;
    gAISBuffer.charPalID = proc->spriteClassStruct->charPalID1;
  }
  else {
    gAISBuffer.genericPalID = proc->spriteClassStruct->genericPalID2;
    gAISBuffer.xPos = proc->spriteClassStruct->baXPos2;
    gAISBuffer.yPos = proc->spriteClassStruct->baYPos2;
    gAISBuffer.animID = proc->spriteClassStruct->animID2;
    gAISBuffer.charPalID = proc->spriteClassStruct->charPalID2;
  }
  
  gAISBuffer.AISMode = mode;
  
  LoadBufferIntoAIS(&gAISBuffer);
  return 1;               // Ensures we don't yield.
}

void CRE_waitUntilFinished(Proc* proc) {
  if (gAISBuffer.AIS1->nextRoundId == (u16)-1 || gAISBuffer.AIS1->nextRoundId == (u16)-2)
    BreakProcLoop(proc);
}

void CRE_doReturn() {
  gAISBuffer.AIS1->state3 |= 0x8;
  gAISBuffer.AIS2->state3 |= 0x8;
}

void CRE_baCheckIfMosaic(struct CRE_ProcStateSpriteClass* proc) {
  // No mosaic if sprite remains the same.
  if (proc->spriteClassStruct->genericPalID1 == proc->spriteClassStruct->genericPalID2 &&
      proc->spriteClassStruct->animID1 == proc->spriteClassStruct->animID2 &&
      proc->spriteClassStruct->charPalID1 == proc->spriteClassStruct->charPalID2) {
    ProcGoto((Proc*)proc, 1);
    proc->sleepTime = 30;
    proc->onCycle =_ProcSleepCallback;
  }
}