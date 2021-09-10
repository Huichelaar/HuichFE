#include "Title.h"


const struct ProcInstruction CRE_title_Proc[] = {
  PROC_SET_NAME("CRE_title"),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_titleInit),
  PROC_LOOP_ROUTINE(CRE_titleDrawChars),
  PROC_SLEEP(60),
  PROC_CALL_ROUTINE_ARG(CRE_setBitfield, 0x1),
  PROC_BLOCK,
  PROC_LOOP_ROUTINE(CRE_titleRemoveChars),
  PROC_LOOP_ROUTINE(CRE_waitForChildren),
  PROC_END
};


void CRE_titleInit(struct CRE_ProcStateTitle* proc) {
  
  void* src;
  char* string = GetStringFromIndex(proc->textID);
  int i;
  
  for (i = 0; i < 20; i++)
    ClassReelLetterProcs[i] = NULL;
  
  i = 0;
  while (string[i] != 0) {
    src = &op_class_font_address[(int)string[i]];
    if (*(void**)src == NULL)
      src = &op_class_font_address[88];
    
    Decompress(*(void**)src, gGenericBuffer);
    CopyTileGfxForObj(gGenericBuffer, (void*)0x6010000+(i<<6), 2, 4);
    i++;
  }
  
  proc->timer = 0;
  proc->stringX = 2;
  proc->strlen = strlen(string);

}

void CRE_titleDrawChars(struct CRE_ProcStateTitle* proc) {
  
  u8 charIndex = proc->timer>>1;
  
  if (charIndex >= proc->strlen) {
    proc->timer = 0;
    BreakProcLoop((Proc*)(proc));
    return;
  }
  
  if ((proc->timer & 1) == 1)
    ClassReelLetterProcs[charIndex] = startopinfoview((Proc*)proc, charIndex);
  
  proc->timer++;
  
}

// Break each letter's loop. 2 frames in-between each letter breaking the loop.
void CRE_titleRemoveChars(struct CRE_ProcStateTitle* proc) {
  
  if ((proc->timer&0x1) == 0x1) {
    if (proc->timer>>1 >= proc->strlen) {
      BreakProcLoop((Proc*)proc);
      return;
    }
    BreakProcLoop(ClassReelLetterProcs[proc->timer>>1]);
  }
  proc->timer++;
}