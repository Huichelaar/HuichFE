#ifndef CREDITS_REEL_H
#define CREDITS_REEL_H


struct CRE_ReelStruct {
  
  const u16 textID;
  const u8 spriteType;                  // 0 = class, 1 = portrait, 2 = other.
  const void* spriteStruct;
  const void** authors;
  
};

struct CRE_ProcStateReel {
  
	/* 00 */ PROC_HEADER;
  /* 29 */ u8 bitfield;
  /* 2A */ u16 index;
	/* 2C */ const struct CRE_ReelStruct* reelStruct;             // Array of CRE_ReelStruct pointers.
  /* 30 */ Proc* titleProc;
  /* 34 */ Proc* spriteProc;
  /* 38 */ Proc* authorProc;
  
};
extern const ProcInstruction CRE_creditReel_Proc[];
void CRE_reelInit(struct CRE_ProcStateReel* proc);
int CRE_setBitfield(u16 bitfield, Proc* proc);
void CRE_reelLoop(struct CRE_ProcStateReel* proc);
void CRE_nextEntry(struct CRE_ProcStateReel* proc);

#endif // CREDITS_REEL_H