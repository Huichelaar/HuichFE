#ifndef CREDITS_SPRITE_PORTRAIT_H
#define CREDITS_SPRITE_PORTRAIT_H

void CRE_portraitSegConstructor(struct CRE_CreditStruct* creditStruct);
void CRE_portraitSegDestructor(struct CRE_CreditStruct* creditStruct);
void CRE_spriteInitPortrait(u16 portraitID[], u8 variantIndex);

struct CRE_ProcStateSpritePortrait {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 variantIndex;
	/* 2C */ u16* portraitID;
  
};
extern const struct ProcInstruction CRE_portraitSprite_Proc[];
int CRE_setFaceDisplayBits(u16 faceDisplayBits, struct CRE_ProcStateSpritePortrait* proc);
void CRE_portraitCheckIfMosaic(struct CRE_ProcStateSpritePortrait* proc);
void CRE_setPortraitVariant(struct CRE_ProcStateSpritePortrait* proc);

#endif // CREDITS_SPRITE_PORTRAIT_H