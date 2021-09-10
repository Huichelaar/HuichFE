#include "Reel.h"
#include "Sprite/Sprite.c"
#include "Title/Title.c"
#include "Authors/Authors.c"


const struct ProcInstruction CRE_creditReel_Proc[] = {
  PROC_SET_NAME("CRE_creditReel"),
  PROC_CALL_ROUTINE_ARG(NewFadeIn, 0x8),
  PROC_WHILE_ROUTINE(FadeInExists),
  PROC_SLEEP(90),
    PROC_LABEL(0),
    PROC_CALL_ROUTINE(CRE_reelInit),
    PROC_LOOP_ROUTINE(CRE_reelLoop),
    PROC_SLEEP(60),
    PROC_LOOP_ROUTINE(CRE_waitForChildren),
    PROC_CALL_ROUTINE(CRE_nextEntry),
  PROC_END
};

void CRE_reelInit(struct CRE_ProcStateReel* proc) {
  
  proc->bitfield = 0;
  
  // Title proc.
  Proc* temp = ProcStart(CRE_title_Proc, (Proc*)proc);
  struct CRE_ProcStateTitle* titleProc = (struct CRE_ProcStateTitle*) temp;
  titleProc->textID = proc->reelStruct->textID;
  proc->titleProc = temp;
  
  // Sprite proc.
  temp = ProcStart(CRE_sprite_Proc, (Proc*)proc);
  struct CRE_ProcStateSprite* spriteProc = (struct CRE_ProcStateSprite*) temp;
  spriteProc->spriteType = proc->reelStruct->spriteType;
  spriteProc->spriteStruct = proc->reelStruct->spriteStruct;
  proc->spriteProc = temp;
  
  // Authors proc.
  temp = ProcStart(CRE_authors_Proc, (Proc*)proc);
  struct CRE_ProcStateAuthors* authorsProc = (struct CRE_ProcStateAuthors*) temp;
  authorsProc->iterator = 0;
  authorsProc->authorArray = proc->reelStruct->authors;
  proc->authorProc = temp;
}

// orr CRE_ProcStateReel proc->bitfield with arg bitfield.
// used by CRE_title_Proc, CRE_sprite_Proc and CRE_authors_Proc.
int CRE_setBitfield(u16 bitfield, Proc* proc) {
  
  struct CRE_ProcStateReel* temp = (struct CRE_ProcStateReel*)proc->parent;
  temp->bitfield |= (u8)bitfield;
  
  return 1;     // Dont yield.
}

// Wait until all children have finished their task and unblock them.
void CRE_reelLoop(struct CRE_ProcStateReel* proc) {
  
  if ((proc->bitfield & 0x7) == 0x7) {
    BreakProcLoop((Proc*)proc);
    proc->titleProc->codeNext++;
    proc->spriteProc->codeNext++;
    proc->authorProc->lockCount--;
  }
}

// Repeat if next credit exists.
void CRE_nextEntry(struct CRE_ProcStateReel* proc) {

  proc->reelStruct++;
  if (proc->reelStruct->textID != 0)
    ProcGoto((Proc*)proc, 0);
}