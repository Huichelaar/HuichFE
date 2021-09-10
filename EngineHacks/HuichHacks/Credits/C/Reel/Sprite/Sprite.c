#include "Sprite.h"
#include "../../../../../../Generic/Mosaic/Mosaic.h"
#include "Class.c"
#include "Portrait.c"
#include "Other.c"


const struct ProcInstruction CRE_sprite_Proc[] = {
  PROC_SET_NAME("CRE_sprite"),
  PROC_YIELD,
  PROC_SLEEP(30),
  PROC_CALL_ROUTINE(CRE_spriteInit),
  PROC_LOOP_ROUTINE(CRE_spriteMoveIn),
  PROC_SLEEP(31),
  PROC_CALL_ROUTINE_ARG(CRE_setBitfield, 0x2),
  PROC_BLOCK,
  PROC_LOOP_ROUTINE(CRE_spriteMoveOut),
  PROC_END
};

void CRE_spriteInit(struct CRE_ProcStateSprite* proc) {
  proc->timer = 0;
  
  switch(proc->spriteType) {
    case 0 :
      CRE_spriteInitClass((struct CRE_SpriteClassStruct*)proc->spriteStruct, proc);
      break;
    case 1 :
      CRE_spriteInitPortrait((u16*)proc->spriteStruct, 0);
      break;
    case 2 :
      CRE_spriteInitOther((struct CRE_SpriteOtherStruct*)proc->spriteStruct, proc, 0);
  }
}

const struct ProcInstruction CRE_drawSprite_Proc[] = {
  PROC_SET_NAME("CRE_drawSprite"),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_drawSprite),
  PROC_END
};

void CRE_drawSprite(struct CRE_ProcStateDrawSprite* proc) {
  ObjInsert(proc->node, proc->OAM1, proc->OAM0, proc->OAMData, proc->OAM2);
}

void CRE_spriteMoveIn(struct CRE_ProcStateSprite* proc) {
  proc->timer++;
  
  int startX, currentX, endX;
  u16 startT = proc->timer, endT = 30;
  struct CRE_ProcStateSpriteClass* classChild;
  struct CRE_ProcStateSpritePortrait* portraitChild;
  struct CRE_ProcStateSpriteOther* otherChild;
  
  switch(proc->spriteType) {
    case 0 :
      if (proc->timer > endT) {
        proc->timer = 0;
        BreakProcLoop((Proc*)(proc));
        classChild = (struct CRE_ProcStateSpriteClass*)ProcStartBlocking(CRE_classSprite_Proc, (Proc*)proc);
        classChild->spriteClassStruct = (struct CRE_SpriteClassStruct*)proc->spriteStruct;
        classChild->drawSpriteProc = proc->drawSpriteProc;
        return;
      }
      endX = 160;
      startX = endX + 100;
      currentX = GetValueFromEasingFunction(5, startX, endX, (u32)startT, (u32)endT);
      proc->drawSpriteProc->OAM1 &= 0xFE00;
      proc->drawSpriteProc->OAM1 |= (currentX & 0x1FF);
      break;
    case 1 :
      if (proc->timer >= endT) {
        proc->timer = 0;
        BreakProcLoop((Proc*)(proc));
        portraitChild = (struct CRE_ProcStateSpritePortrait*)ProcStartBlocking(CRE_portraitSprite_Proc, (Proc*)proc);
        portraitChild->variantIndex = 0;
        portraitChild->portraitID = (u16*)proc->spriteStruct;
        return;
      }
      endX = 192;
      startX = endX + 96;
      currentX = GetValueFromEasingFunction(5, startX, endX, (u32)startT, (u32)endT);
      gpFaceProcs[0]->xPosition = currentX;
      break;
    case 2 :
      if (proc->timer >= endT) {
        proc->timer = 0;
        BreakProcLoop((Proc*)(proc));
        otherChild = (struct CRE_ProcStateSpriteOther*)ProcStartBlocking(CRE_otherSprite_Proc, (Proc*)proc);
        otherChild->variantIndex = 0;
        otherChild->spriteOtherStruct = (struct CRE_SpriteOtherStruct*)proc->spriteStruct;
        otherChild->drawSpriteProc = proc->drawSpriteProc;
        return;
      }
      endX = (int)((struct CRE_SpriteOtherStruct*)proc->spriteStruct)->xPos;
      startX = 240;
      currentX = GetValueFromEasingFunction(5, startX, endX, (u32)startT, (u32)endT);
      proc->drawSpriteProc->OAM1 &= 0xFE00;
      proc->drawSpriteProc->OAM1 |= (currentX & 0x1FF);
  }
}

void CRE_spriteMoveOut(struct CRE_ProcStateSprite* proc) {
  proc->timer++;
  
  int startX, currentX, endX;
  u16 startT = proc->timer, endT = 30;
  
  if (proc->timer > endT) {
    proc->timer = 0;
    BreakProcLoop((Proc*)(proc));
    return;
  }
  
  switch(proc->spriteType) {
    case 0 :
      startX = (int)((struct CRE_SpriteClassStruct*)proc->spriteStruct)->baXPos2;
      endX = startX + 100;
      currentX = GetValueFromEasingFunction(3, startX, endX, (u32)startT, (u32)endT);
      gAISBuffer.AIS1->xPosition = currentX;
      gAISBuffer.AIS2->xPosition = currentX;
      gAISBuffer.xPos = currentX;
      break;
    case 1 :
      startX = 192;
      endX = startX + 96;
      currentX = GetValueFromEasingFunction(3, startX, endX, (u32)startT, (u32)endT);
      gpFaceProcs[0]->xPosition =currentX;
      break;
    case 2 :
      startX = (int)((struct CRE_SpriteOtherStruct*)proc->spriteStruct)->xPos;
      endX = 240;
      currentX = GetValueFromEasingFunction(3, startX, endX, (u32)startT, (u32)endT);
      proc->drawSpriteProc->OAM1 &= 0xFE00;
      proc->drawSpriteProc->OAM1 |= (currentX & 0x1FF);
      break;
  }
}

void CRE_increaseMosaic(Proc* proc) {
  struct ProcStateMosaic* mosaicProc = (struct ProcStateMosaic*)ProcStartBlocking(Procs_Mosaic, proc);
  mosaicProc->updateFrame = 1;
  mosaicProc->mosInit = 0;
  mosaicProc->mosBGHIncr = 0;
  mosaicProc->mosBGVIncr = 0;
  mosaicProc->mosOBJHIncr = 1;
  mosaicProc->mosOBJVIncr = 1;
  mosaicProc->limit = 6;
}

void CRE_decreaseMosaic(Proc* proc) {
  struct ProcStateMosaic* mosaicProc = (struct ProcStateMosaic*)ProcStartBlocking(Procs_Mosaic, proc);
  mosaicProc->updateFrame = 1;
  mosaicProc->mosInit = gLCDIOBuffer.mosaic;
  mosaicProc->mosBGHIncr = 0;
  mosaicProc->mosBGVIncr = 0;
  mosaicProc->mosOBJHIncr = 0xF;
  mosaicProc->mosOBJVIncr = 0xF;
  mosaicProc->limit = 6;
}