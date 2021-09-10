#include "Authors.h"


const struct ProcInstruction CRE_authors_Proc[] = {
  PROC_SET_NAME("CRE_authors"),
  PROC_YIELD,
  PROC_SLEEP(45),
    PROC_LABEL(0),
    PROC_END_ALL(CRE_author_Proc),
    PROC_SLEEP(15),
    PROC_CALL_ROUTINE(CRE_authorsInit),
    PROC_CALL_ROUTINE_ARG(CRE_createAuthChild, 0),
    PROC_CALL_ROUTINE_ARG(CRE_createAuthChild, 1),
    PROC_CALL_ROUTINE_ARG(CRE_createAuthChild, 2),
    PROC_SLEEP(90),
    PROC_CALL_ROUTINE_2(CRE_blockWhenDone),
  PROC_CALL_ROUTINE(CRE_blendOutAuth),
  PROC_YIELD,
  PROC_END
};

void CRE_authorsInit(struct CRE_ProcStateAuthors* proc) {
  
  *(&proc->authorProc0) = NULL;
  *(&proc->authorProc1) = NULL;
  *(&proc->authorProc2) = NULL;
  
  int i = proc->iterator;
  
  for (int j = 0; j < 3; j++) {
    if (proc->authorArray[j+i] == NULL)
      break;
    Decompress(proc->authorArray[j+i], (void*)0x6016000+(j<<11));
  }
  
}

int CRE_createAuthChild(u16 childID, struct CRE_ProcStateAuthors* proc) {
  
  if (proc->authorArray[proc->iterator] == NULL)
    return 1;     // Dont yield.
  
  proc->iterator++;
  
  struct CRE_ProcStateAuthor* author = (struct CRE_ProcStateAuthor*)ProcStart(CRE_author_Proc, (Proc*)proc);
  author->timer = 0;
  author->node = 5 + (u8)childID;
  author->OAM0 = 0x400 + 0x20 + (childID << 4);
  author->OAM1 = 0x10;
  author->OAM2 = 0x2B00 + (childID << 6);
  
  *(&proc->authorProc0+childID) = author;
  
  // Disable alphablend on previous author children.
  struct CRE_ProcStateAuthor* temp;
  while (childID > 0) {
    temp = *(&proc->authorProc0+(childID-1));
    temp->OAM0 &= 0xFBFF;
    childID--;
  }
  
  struct ProcStateBlend* blend = (struct ProcStateBlend*)ProcStartBlocking(Procs_Blend, (ProcState*)proc);
  blend->eva_incr = 1;
  blend->evb_incr = -1;
  blend->updateFrame = 1;
  blend->bldcnt = 0x2040;
  blend->eva_init = 0;
  blend->evb_init = 16;
  blend->limit = 16;
  
  return 0;     // Yield.
}

// Either start at label 0 again, or block the proc.
int CRE_blockWhenDone(struct CRE_ProcStateAuthors* proc) {
  
  if (proc->authorArray[proc->iterator] != NULL) {
    CRE_blendOutAuth(proc);
    ProcGoto((Proc*)proc, 0);
  }
  else {
    proc->lockCount++;
    CRE_setBitfield(0x4, (Proc*)proc);
  }
  
  return 0;     // Yield.
}

void CRE_blendOutAuth(struct CRE_ProcStateAuthors* proc) {
  struct CRE_ProcStateAuthor* temp;
  struct ProcStateBlend* blend;
  
  for (int i = 0; i < 3; i++) {
    temp = *(&proc->authorProc0+i);
    if (temp == NULL)
      break;
    temp->OAM0 |= 0x400;
    *(&proc->authorProc0+i) = NULL;
  }
  
  blend = (struct ProcStateBlend*)ProcStartBlocking(Procs_Blend, (ProcState*)proc);
  blend->eva_incr = -1;
  blend->evb_incr = 1;
  blend->updateFrame = 1;
  blend->bldcnt = 0x2040;
  blend->eva_init = 16;
  blend->evb_init = 0;
  blend->limit = 16;
}


const struct ProcInstruction CRE_author_Proc[] = {
  PROC_SET_NAME("CRE_author"),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_moveAuth),
  PROC_LOOP_ROUTINE(CRE_drawAuth),
  PROC_END
};

void CRE_moveAuth(struct CRE_ProcStateAuthor* proc) {
  
  ObjInsert(proc->node, proc->OAM1, proc->OAM0+(proc->timer-16), (const struct ObjData*)&authorOAM, proc->OAM2);
  
  proc->timer++;
  
  if (proc->timer >= 16)
    BreakProcLoop((Proc*)proc);
  
}

void CRE_drawAuth(struct CRE_ProcStateAuthor* proc) {
  
  ObjInsert(proc->node, proc->OAM1, proc->OAM0, (const struct ObjData*)&authorOAM, proc->OAM2);
  
}