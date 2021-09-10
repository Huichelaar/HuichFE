#ifndef CREDITS_SPRITE_OTHER_H
#define CREDITS_SPRITE_OTHER_H

// Sprite type 2
struct CRE_SpriteOtherStruct {
  
  void* tiles;
  void* OAMData;
  u16* palette;
  s16 xPos;
  s16 yPos;
  
};

//void CRE_otherSegConstructor(struct CRE_SegmentStruct* segmentStruct);
//void CRE_otherSegDestructor(struct CRE_SegmentStruct* segmentStruct);
void CRE_spriteInitOther(struct CRE_SpriteOtherStruct spriteOtherStruct[], struct CRE_ProcStateSprite* proc, u8 variantIndex);

struct CRE_ProcStateSpriteOther {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 variantIndex;
	/* 2C */ struct CRE_SpriteOtherStruct* spriteOtherStruct;
  /* 30 */ struct CRE_ProcStateDrawSprite* drawSpriteProc;
  
};
extern const struct ProcInstruction CRE_otherSprite_Proc[];
void CRE_otherCheckIfMosaic(struct CRE_ProcStateSpriteOther* proc);
void CRE_setOtherVariant(struct CRE_ProcStateSpriteOther* proc);

#endif // CREDITS_SPRITE_OTHER_H