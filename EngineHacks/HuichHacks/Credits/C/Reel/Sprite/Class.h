#ifndef CREDITS_SPRITE_CLASS_H
#define CREDITS_SPRITE_CLASS_H
#include "Sprite.h"

// Sprite type 0
// every var comes with a twin for the male/female variant.
struct CRE_SpriteClassStruct {
  
  u8 classID1;
  u8 classID2;
  u8 genericPalID1;
  u8 genericPalID2;
  u16 charPalID1;
  u16 charPalID2;
  u16 animID1;
  u16 animID2;
  s16 baXPos1;
  s16 baXPos2;
  s16 baYPos1;
  s16 baYPos2;
  
};

void CRE_classSegConstructor(struct CRE_CreditStruct* creditStruct);
void CRE_classSegDestructor(struct CRE_CreditStruct* creditStruct);
void CRE_spriteInitClass(struct CRE_SpriteClassStruct* spriteClassStruct, struct CRE_ProcStateSprite* proc);
void CRE_spriteInitCC(u8 classID);

struct CRE_ProcStateSpriteClass {
  
	/* 00 */ PROC_HEADER;
  /* 2A */ u16 timer;
	/* 2C */ struct CRE_SpriteClassStruct* spriteClassStruct;
  /* 30 */ struct CRE_ProcStateDrawSprite* drawSpriteProc;
  
};
extern const struct ProcInstruction CRE_classSprite_Proc[];

// Class card.
int CRE_ccCheckIfMosaic(struct CRE_ProcStateSpriteClass* proc);
void CRE_ccSetVariant(struct CRE_ProcStateSpriteClass* proc);

// Map sprites.
void CRE_initMapSprites1(struct CRE_ProcStateSpriteClass* proc);
void CRE_initMapSprites2(struct CRE_ProcStateSpriteClass* proc);
void CRE_SMSLoop (struct CRE_ProcStateSpriteClass* proc);
void CRE_MMSLoop (struct CRE_ProcStateSpriteClass* proc);

// Battle anim.
int CRE_doAnim(u16 indexMode, struct CRE_ProcStateSpriteClass* proc);
void CRE_waitUntilFinished(Proc* proc);
void CRE_doReturn();
void CRE_baCheckIfMosaic(struct CRE_ProcStateSpriteClass* proc);

// Graphics
extern ObjData ccOAM;
extern ObjData msOAM;

#endif // CREDITS_SPRITE_CLASS_H