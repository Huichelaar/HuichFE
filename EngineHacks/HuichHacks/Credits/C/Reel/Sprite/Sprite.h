#ifndef CREDITS_SPRITE_H
#define CREDITS_SPRITE_H

struct CRE_ProcStateSprite {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 spriteType;                 // 0 = class, 1 = portrait, 2 = other.
  /* 2A */ u16 timer;
	/* 2C */ const void* spriteStruct;
  /* 30 */ struct CRE_ProcStateDrawSprite* drawSpriteProc;
  
};
extern const struct ProcInstruction CRE_sprite_Proc[];
void CRE_spriteInit(struct CRE_ProcStateSprite* proc);
void CRE_spriteMoveIn(struct CRE_ProcStateSprite* proc);
void CRE_spriteMoveOut(struct CRE_ProcStateSprite* proc);

struct CRE_ProcStateDrawSprite {
  
  /* 00 */ PROC_HEADER;
  /* 29 */ u8 node;
  /* 2A */ u16 OAM0;
  /* 2C */ u16 OAM1;
  /* 2E */ u16 OAM2;
  /* 30 */ struct ObjData* OAMData;
  
};
extern const struct ProcInstruction CRE_drawSprite_Proc[];
void CRE_drawSprite(struct CRE_ProcStateDrawSprite* proc);

// Used by Class, Portrait and other sprites.
void CRE_increaseMosaic(Proc* proc);
void CRE_decreaseMosaic(Proc* proc);

#endif // CREDITS_SPRITE_H