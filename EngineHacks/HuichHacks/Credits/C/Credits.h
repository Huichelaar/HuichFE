#ifndef CREDITS_H
#define CREDITS_H
#include "gbafeext.h"
#include "../../../../Generic/M7/Src/M7.h"


struct CRE_CreditStruct {
  
  // Title & subtitle
  const u16 titleTextID;
  const u16 subtitleTextID;
  const u16* titlePalette;
  
  // Graphics
  const void* tilesetBG;
  const u16* tilesetPalette;
  
  // M7
  const struct M7Camera startCam;
  struct CRE_M7TravelStruct* travelStruct;
  
  const struct CRE_ReelStruct* reelStruct;
  
  // Constructor & destructor
  const void (*constructor)(const struct CRE_CreditStruct* creditStruct);
  const void (*destructor)(const struct CRE_CreditStruct* creditStruct);
  
};
extern const struct CRE_CreditStruct creditStruct[];

struct CRE_ProcStateCredits {
  
	/* 00 */ PROC_HEADER;
	/* 29 */ u8 segmentIndex;
  /* 2A */ u8 skipCredits;              // Bool set by keylistener.
  /* 2C */ Proc* drawBGSpritesProc;
  /* 30 */ struct CRE_ProcStateTraverseM7* traverseM7Proc;
  
};
extern const ProcInstruction CRE_credits_Proc[];
void CRE_init();
void CRE_segmentTitleInit(struct CRE_ProcStateCredits* proc);
void CRE_segmentInit(struct CRE_ProcStateCredits* proc);
void CRE_segmentEnd(struct CRE_ProcStateCredits* proc);
void CRE_end();

void CRE_waitForChildren(Proc* proc);

#endif // CREDITS_H