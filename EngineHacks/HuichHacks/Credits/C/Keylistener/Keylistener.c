#include "Keylistener.h"


const struct ProcInstruction CRE_keylistener_Proc[] = {
  PROC_SET_NAME("CRE_keylistener"),
  
  PROC_LABEL(0),
  PROC_LOOP_ROUTINE(CRE_listenForKeys),
  
  PROC_LABEL(1),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x8),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_CALL_ROUTINE(CRE_skipSegment),
  PROC_YIELD,
  PROC_GOTO(0),
  
  PROC_LABEL(2),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x8),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_CALL_ROUTINE(CRE_skipCredits),
  PROC_YIELD,
  PROC_GOTO(0),
  
  PROC_END
};

void CRE_listenForKeys(Proc* proc) {
  // Don't listen for keys when we're already finished.
  struct CRE_ProcStateCredits* parent = (struct CRE_ProcStateCredits*)proc->parent;
  if (!creditStruct[parent->segmentIndex].titleTextID || parent->skipCredits) {
    EndProc(proc);
    return;
  }
  
  if (!(gKeyState.heldKeys & (KEY_BUTTON_A | KEY_BUTTON_START)))
    return;
  else if (gKeyState.heldKeys & KEY_BUTTON_A)
    ProcGoto(proc, 1);        // Skip segment.
  else
    ProcGoto(proc, 2);        // Skip credits.
  
  BreakProcLoop(proc);
  proc->parent->lockCount++;
  Proc* proc2 = ProcFind(CRE_creditReel_Proc);
  if (proc2)
    proc2->lockCount++;
  
  EndEachProc(gProc_FadeOut);
  EndEachProc(gProc_FadeIn);
}

void CRE_skipSegment(Proc* proc) {
  EndEachProc(CRE_segTitle_Proc);
  EndEachProc(CRE_creditReel_Proc);
  ProcGoto(proc->parent, 1);
  proc->parent->lockCount--;
}

void CRE_skipCredits(Proc* proc) {
  CRE_skipSegment(proc);
  struct CRE_ProcStateCredits* proc2 = (struct CRE_ProcStateCredits*)proc->parent;
  proc2->skipCredits = 1;
}

