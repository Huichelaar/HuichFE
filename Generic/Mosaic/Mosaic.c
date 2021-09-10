// For using the mosaic effect.
#include "gbafeext.h"
#include "Mosaic.h"

const struct ProcInstruction Procs_Mosaic[] = {
  PROC_SET_NAME("Procs_Mosaic"),
  PROC_YIELD,
  PROC_CALL_ROUTINE(mosaicInit),
  PROC_LOOP_ROUTINE(mosaicLoop),
  PROC_END
};

void mosaicInit(struct ProcStateMosaic* proc) {
  
  proc->timer = 0;
  gLCDIOBuffer.mosaic = proc->mosInit;
  if (proc->updateFrame == 0)
    proc->updateFrame = 1;          // No divide by zero, please.
}

void mosaicLoop(struct ProcStateMosaic* proc) {
  
  u16 mos, mosBGH, mosBGV, mosOBJH, mosOBJV;
  
  proc->timer++;
  if (proc->timer == proc->limit) {
    BreakProcLoop((Proc*)proc);
    return;
  }
  
  if (!proc->timer % proc->updateFrame) {
    mos = gLCDIOBuffer.mosaic;
    mosBGH = (mos + proc->mosBGHIncr) & 0xF;
    mosBGV = (mos + (proc->mosBGVIncr<<4)) & 0xF0;
    mosOBJH = (mos + (proc->mosOBJHIncr<<8)) & 0xF00;
    mosOBJV = (mos + (proc->mosOBJVIncr<<12)) & 0xF000;
    gLCDIOBuffer.mosaic = mosBGH | mosBGV | mosOBJH | mosOBJV;
  }
}