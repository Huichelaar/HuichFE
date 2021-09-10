#include <stdio.h>
#include "Credits.h"
#include "SegmentTitle/SegmentTitle.c"
#include "TraverseM7/TraverseM7.c"
#include "DrawBGSprites/DrawBGSprites.c"
#include "Reel/Reel.c"
#include "Keylistener/Keylistener.c"
#include "Music/Music.c"


const struct ProcInstruction CRE_credits_Proc[] = {
  PROC_SET_NAME("CRE_credits"),
  PROC_CALL_ROUTINE(CRE_init),
  
    PROC_LABEL(0),                              // CRE_segmentEnd jumps to this for next segment.
    PROC_CALL_ROUTINE(CRE_segmentTitleInit),
    PROC_YIELD,
    PROC_CALL_ROUTINE(CRE_segmentInit),
    PROC_YIELD,

    PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x4),
    PROC_WHILE_ROUTINE(FadeOutExists),
      PROC_LABEL(1),                            // keylistener skips to this when skipping segment.
      PROC_CALL_ROUTINE(CRE_segmentEnd),
  
  PROC_CALL_ROUTINE(CRE_end),
  PROC_SLEEP(16),
  PROC_END
};

void CRE_init(struct CRE_ProcStateCredits* proc) {
  
  proc->segmentIndex = 0;
  proc->skipCredits = 0;
  proc->drawBGSpritesProc = NULL;
  proc->traverseM7Proc = NULL;
  
  gLCDIOBuffer.dispControl.bgMode = 2;
  gLCDIOBuffer.dispControl.enableBg0 = false;
  gLCDIOBuffer.dispControl.enableBg1 = false;
  gLCDIOBuffer.dispControl.enableBg2 = false;
  gLCDIOBuffer.dispControl.enableBg3 = false;
  gLCDIOBuffer.dispControl.enableObj = true;
  gLCDIOBuffer.bgControl[2].priority = 1;
  gLCDIOBuffer.bgControl[3].priority = 1;
  gLCDIOBuffer.bgControl[2].tileBaseBlock = 0;
  gLCDIOBuffer.bgControl[3].tileBaseBlock = 2;
  gLCDIOBuffer.bgControl[2].mapBaseBlock = 8;
  gLCDIOBuffer.bgControl[3].mapBaseBlock = 24;
  gLCDIOBuffer.bgControl[2].screenSize = 3;
  gLCDIOBuffer.bgControl[3].screenSize = 3;
  gLCDIOBuffer.blendControl.effect = BLEND_EFFECT_NONE;
  
  // FSR horizon varies between VBA, mGBA, no$gba and GBA.
  // This way I can set an upper limit.
  SetWin0Box(0, 0, 240, 80);
  gLCDIOBuffer.winControl.win0_enableBg0 = true;
  gLCDIOBuffer.winControl.win0_enableBg1 = true;
  gLCDIOBuffer.winControl.win0_enableBg2 = false;
  gLCDIOBuffer.winControl.win0_enableBg3 = false;
  gLCDIOBuffer.winControl.win0_enableObj = true;
  gLCDIOBuffer.winControl.win0_enableBlend = true;
  gLCDIOBuffer.winControl.wout_enableBg0 = true;
  gLCDIOBuffer.winControl.wout_enableBg1 = true;
  gLCDIOBuffer.winControl.wout_enableBg2 = true;
  gLCDIOBuffer.winControl.wout_enableBg3 = true;
  gLCDIOBuffer.winControl.wout_enableObj = true;
  gLCDIOBuffer.winControl.wout_enableBlend = true;
  gLCDIOBuffer.dispControl.enableWin0 = true;
  
  // Ensure fadein & out routine don't
  // enable all BGs & OBJ.
  extraRAMBitfield.fadeKeepDISPCNT = true;
  
  ProcStart(CRE_keylistener_Proc, (Proc*)proc);
  
  if (!gChapterData.muteMusOption) {
    struct CRE_ProcStateMusic* proc2 = (struct CRE_ProcStateMusic*)ProcStart(CRE_music_Proc, (Proc*)proc);
    proc2->index = 0;
    proc2->musicStruct = musicStruct;
  }
}

// Display segment's title & subtitle.
void CRE_segmentTitleInit(struct CRE_ProcStateCredits* proc) {
  
  struct CRE_ProcStateSegTitle* proc2 = (struct CRE_ProcStateSegTitle*)ProcStartBlocking(CRE_segTitle_Proc, (ProcState*)proc);
  proc2->titleTextID = creditStruct[proc->segmentIndex].titleTextID;
  proc2->subtitleTextID = creditStruct[proc->segmentIndex].subtitleTextID;
  proc2->palette = creditStruct[proc->segmentIndex].titlePalette;
}

// Prepare the setup for credits.
void CRE_segmentInit(struct CRE_ProcStateCredits* proc) {
  
  // Class Reel BG emulated in sprites.
  Decompress(&ClassReelBGTiles, gGenericBuffer);
  CopyToPaletteBuffer(ClassReelBGPalette, 0x20 * 17, 0x20);
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 8; j++) {
      CpuFastSet(gGenericBuffer+(i<<9)+(j<<6), (void*)0x6012000+(i<<8)+(j<<10), 16);
      CpuFastSet((void*)0x6012000+(i<<8)+(j<<10), (void*)0x6012040+(i<<8)+(j<<10), 48);
    }
  }
  
  // Class Reel Font Palette
  CopyToPaletteBuffer(gPal_ClassReelGlyphs2, 0x20 * 16, 0x20);
  // Authors Palette
  CopyToPaletteBuffer(authorPalette, 0x20 * 18, 0x20);
  
  m7Init();
  m7World->bg2cnt = gLCDIOBuffer.bgControl[2];
  m7World->bg3cnt = gLCDIOBuffer.bgControl[3];
  m7World->bg2cnt.screenSize = 3;
  m7World->bg3cnt.screenSize = 3;
	m7World->bg2cnt.tileBaseBlock = 0;
  m7World->bg3cnt.tileBaseBlock = 2;
	m7World->bg2cnt.wrap = true;
  m7World->bg3cnt.wrap = true;
  
  u8 id = proc->segmentIndex;
  
  if (creditStruct[id].constructor)
    creditStruct[id].constructor(&creditStruct[id]);
  
  Decompress(creditStruct[id].tilesetBG, (void*)0x6000000);
  CopyToPaletteBuffer(creditStruct[id].tilesetPalette, 0, 0x200);
  gPaletteBuffer[0] = 0;
  
  m7World->cam->data = creditStruct[id].startCam;
  
  proc->traverseM7Proc = (struct CRE_ProcStateTraverseM7*)ProcStart(CRE_traverseM7_Proc, (Proc*)proc);
  proc->traverseM7Proc->timer = 0;
  proc->traverseM7Proc->travelStruct = creditStruct[id].travelStruct;
  proc->drawBGSpritesProc = ProcStart(CRE_drawBGSprites_Proc, ROOT_PROC_4);     // Ensures this is drawn last.

  struct CRE_ProcStateReel* reelProc = (struct CRE_ProcStateReel*)ProcStartBlocking(CRE_creditReel_Proc, (ProcState*) proc);
  reelProc->reelStruct = creditStruct[id].reelStruct;
}

// Call segment-specific destructor and end other procs.
void CRE_segmentEnd(struct CRE_ProcStateCredits* proc) {
  
  u8 id = proc->segmentIndex;
  
  if (creditStruct[id].destructor)
    creditStruct[id].destructor(&creditStruct[id]);
  
  EndProc(proc->drawBGSpritesProc);
  proc->drawBGSpritesProc = NULL;
  EndProc((Proc*)proc->traverseM7Proc);
  proc->traverseM7Proc = NULL;
  
  m7End();
  
  proc->segmentIndex++;
  if (creditStruct[proc->segmentIndex].titleTextID && !proc->skipCredits)
    ProcGoto((Proc*)proc, 0);
}

void CRE_end() {
  EndEachProc(CRE_music_Proc);
  gLCDIOBuffer.dispControl.enableWin0 = false;
  
  // Ensure fadein & out routines act vanilla
  extraRAMBitfield.fadeKeepDISPCNT = false;
}

// Wait until all children have ended.
void CRE_waitForChildren(Proc* proc) {
  
  if (proc->child == NULL)
    BreakProcLoop(proc);
}