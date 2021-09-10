#include "SegmentTitle.h"
#include "../../../../../Generic/Mosaic/Mosaic.h"


const struct ProcInstruction CRE_segTitle_Proc[] = {
  PROC_SET_NAME("CRE_segmentTitle"),
  PROC_YIELD,
  PROC_CALL_ROUTINE(CRE_segTitleInit),
  PROC_CALL_ROUTINE(CRE_segTitleDrawFirstChar),
  PROC_SLEEP(16),
  PROC_LOOP_ROUTINE(CRE_segTitleDrawChars),
  PROC_SLEEP(20),
  PROC_CALL_ROUTINE(CRE_segSubtitleInit),
  PROC_SLEEP(60),
  PROC_LOOP_ROUTINE(CRE_segTitleRemoveChars),
  PROC_CALL_ROUTINE(CRE_segSubtitleEnd),
  PROC_LOOP_ROUTINE(CRE_waitForChildren),
  PROC_END
};

void CRE_segTitleInit(struct CRE_ProcStateSegTitle* proc) {
  
  void* src,* dest;
  char* string = GetStringFromIndex(proc->titleTextID);
  u8 len1 = strlen(string), len2;
  int i, j, k, temp, temp2, offset;
  
  // Class Reel Font Palette
  CopyToPaletteBuffer(proc->palette, 0x20 * 16, 0x20);
  
  for (i = 0; i < 20; i++)
    ClassReelLetterProcs[i] = NULL;
  
  Decompress(&segmentTitleFont, (void*)0x6014000);
  
  // This loop puts the right characters in VRAM.
  for (i = 0; i < 2; i++) {
    j = 0;
    while (string[j] != 0) {
      temp = (int)string[j];
      if (temp >= 'a')
        temp = (temp - 'a') + 26;
      else
        temp -= 'A';
      temp2 = (0x30 & temp)<<8;
      offset = (temp2 | ((temp & 0xF)<<6));
      src = (void*)0x6014000 + offset;
      dest = (void*)0x6010000+(i<<12)+(j<<6);
      for (k = 0; k < 4; k++)
        CpuFastCopy(src+(k<<10), dest+(k<<10), 0x40);
      j++;
    }
    string = GetStringFromIndex(proc->subtitleTextID);
    len2 = strlen(string);
  }
  
  proc->timer = 3;
  proc->titleLen = len1;
  proc->subtitleLen = len2;
  proc->titleX = (240 - ((len1<<4) - ((len1-1)<<2)))>>1;            // Centers text.
  proc->subtitleX = (240 - ((len2<<4) - ((len2-1)<<2)))>>1;         // Centers text.
  
  // Create subtitle child.
  struct CRE_ProcStateSegSubtitle* proc2 = (struct CRE_ProcStateSegSubtitle*)ProcStart(CRE_segSubtitle_Proc, (Proc*)proc);
  proc->procSegSubtitle = proc2;
  proc2->strlen = len2;
  proc2->stringX = proc->subtitleX;
  proc2->timer = 0;
}

void CRE_segTitleDrawFirstChar(struct CRE_ProcStateSegTitle* proc) {
  ClassReelLetterProcs[0] = opinfoview2_Start((Proc*)proc, 0);
}

void CRE_segTitleDrawChars(struct CRE_ProcStateSegTitle* proc) {
  
  u8 charIndex = proc->timer>>1;
  
  if (charIndex >= proc->titleLen) {
    proc->timer = 0;
    BreakProcLoop((Proc*)(proc));
    return;
  }
  
  if ((proc->timer & 1) == 1)
    ClassReelLetterProcs[charIndex] = opinfoview2_Start((Proc*)proc, charIndex);
  
  proc->timer++;
}

void CRE_segSubtitleInit(struct CRE_ProcStateSegTitle* proc) {
  struct ProcStateBlend* proc3 = (struct ProcStateBlend*)ProcStart(Procs_Blend, (Proc*)proc->procSegSubtitle);
  proc3->eva_incr = 2;
  proc3->evb_incr = -2;
  proc3->updateFrame = 1;
  proc3->bldcnt = 0x2040;
  proc3->eva_init = 0;
  proc3->evb_init = 16;
  proc3->limit = 8;
  
  struct ProcStateMosaic* proc4 = (struct ProcStateMosaic*)ProcStart(Procs_Mosaic, (Proc*)proc->procSegSubtitle);
  proc4->updateFrame = 1;
  proc4->mosInit = 0xC000;
  proc4->mosBGHIncr = 0;
  proc4->mosBGVIncr = 0;
  proc4->mosOBJHIncr = 0x0;
  proc4->mosOBJVIncr = 0xF;
  proc4->limit = 0xD;
  
  BreakProcLoop((Proc*)proc->procSegSubtitle);
}

void CRE_segSubtitleEnd(struct CRE_ProcStateSegTitle* proc) {
  struct ProcStateBlend* proc3 = (struct ProcStateBlend*)ProcStart(Procs_Blend, (Proc*)proc->procSegSubtitle);
  proc3->eva_incr = -1;
  proc3->evb_incr = 1;
  proc3->updateFrame = 1;
  proc3->bldcnt = 0x2040;
  proc3->eva_init = 16;
  proc3->evb_init = 0;
  proc3->limit = 16;
  
  struct ProcStateMosaic* proc4 = (struct ProcStateMosaic*)ProcStart(Procs_Mosaic, (Proc*)proc->procSegSubtitle);
  proc4->updateFrame = 2;
  proc4->mosInit = 0x0000;
  proc4->mosBGHIncr = 0;
  proc4->mosBGVIncr = 0;
  proc4->mosOBJHIncr = 0x0;
  proc4->mosOBJVIncr = 0x1;
  proc4->limit = 0xD;
  
  BreakProcLoop((Proc*)proc->procSegSubtitle);
}

// Break each letter's loop. 2 frames in-between each letter breaking the loop.
void CRE_segTitleRemoveChars(struct CRE_ProcStateSegTitle* proc) {
  
  if (proc->timer&0x1) {
    if (proc->timer>>1 >= proc->titleLen) {
      BreakProcLoop((Proc*)proc);
      return;
    }
    BreakProcLoop(ClassReelLetterProcs[proc->timer>>1]);
  }
  proc->timer++;
}


const struct ProcInstruction CRE_segSubtitle_Proc[] = {
  PROC_SET_NAME("CRE_segmentSubtitle"),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_LoopBar),
  PROC_LOOP_ROUTINE(CRE_segSubtitleDrawChars),
  PROC_LOOP_ROUTINE(CRE_segSubtitleDrawChars2),
  PROC_END
};

// Draws subtitle bar.
void CRE_LoopBar(struct CRE_ProcStateSegSubtitle* proc) {
  u8 len = proc->timer;
  
  if (len >= 12)
    len = 12;
  else
    proc->timer++;
  
  PushToHiOAM((14-len)<<3, 0x4C, &gObj_8x8, 0x388);
  PushToHiOAM(0x1000|((15+len)<<3), 0x4C, &gObj_8x8, 0x388);
  
  for (u8 i = 15-len; i < 15+len; i++)
    PushToHiOAM(i<<3, 0x4C, &gObj_8x8, 0x389);
}

// Draws subtitle bar with blend. Had to be a separate function, yes.
void CRE_LoopBarBlend(struct CRE_ProcStateSegSubtitle* proc) {
  u8 len = proc->timer;
  
  if (len >= 12)
    len = 12;
  else
    proc->timer++;
  
  PushToHiOAM((14-len)<<3, 0x44C, &gObj_8x8, 0x388);
  PushToHiOAM(0x1000|((15+len)<<3), 0x44C, &gObj_8x8, 0x388);
  
  for (u8 i = 15-len; i < 15+len; i++)
    PushToHiOAM(i<<3, 0x44C, &gObj_8x8, 0x389);
}

// Draws subtitle characters to screen. Also draws subtitle bar.
void CRE_segSubtitleDrawChars(struct CRE_ProcStateSegSubtitle* proc) {
  CRE_LoopBar(proc);
  
  u8 strlen = proc->strlen;
  int x = (int)proc->stringX;
  
  for (int i = 0; i < (int)strlen; i++) {
    PushToHiOAM(x+(i*12), 0x1454, &gObj_16x32, 0x880+(i<<1));
  }
}

// Same as before, but ends if no children and draws bar with blend.
void CRE_segSubtitleDrawChars2(struct CRE_ProcStateSegSubtitle* proc) {
  CRE_LoopBarBlend(proc);
  
  u8 strlen = proc->strlen;
  int x = (int)proc->stringX;
  
  for (int i = 0; i < (int)strlen; i++) {
    PushToHiOAM(x+(i*12), 0x1454, &gObj_16x32, 0x880+(i<<1));
  }
  
  if (!proc->child) {
    BreakProcLoop((Proc*)proc);
    gLCDIOBuffer.mosaic = 0;
  }
}