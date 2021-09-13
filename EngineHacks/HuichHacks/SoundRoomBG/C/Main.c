#include <stdio.h>
#include "Main.h"


struct SBG_SongBGStruct* SBG_DetermineSongBGStruct(u32 songID) {
  struct SBG_SongBGStruct* result = NULL;
  
  for (int i = 0; i < 1000; i++) {
    if (SBG_songBGList[i].songID == 0)
      break;
    if (SBG_songBGList[i].songID == songID) {
      result = SBG_songBGList[i].songBGStruct;
      break;
    }
  }
  return result;
}

const struct ProcInstruction SBG_Main_Proc[] = {
  PROC_SET_NAME("SBG_Main"),
  PROC_LOOP_ROUTINE(SBG_waitForSongSwitch)


};

void SBG_waitForSongSwitch(struct SBG_ProcStateMain* proc) {
  if (proc->currentSongID == proc->nextSongID)
    return;
  // No need to change anything if songs use the same songBGStruct
  else if (proc->currentSongBGStruct == proc->nextSongBGStruct) {
    proc->currentSongID = proc->nextSongID;
    return;
  }
  
  EndEachProc(SBG_ChangeSongBG_Proc);
  struct SBG_ProcStateChangeSongBG* proc2 = (struct SBG_ProcStateChangeSongBG*)ProcStart(SBG_ChangeSongBG_Proc, (Proc*)proc);
  proc2->songBGStruct = proc->nextSongBGStruct;
  
  proc->currentSongID = proc->nextSongID;
  proc->currentSongBGStruct = proc->nextSongBGStruct;
}


const struct ProcInstruction SBG_ChangeSongBG_Proc[] = {
  PROC_SET_NAME("SBG_ChangeSongBG"),
  PROC_YIELD,
  PROC_CALL_ROUTINE(SBG_InitChangeSongBG),
  
  PROC_LABEL(0),
  PROC_LOOP_ROUTINE(SBG_fadePals),
  PROC_CALL_ROUTINE(SBG_DrawBG),
  PROC_LOOP_ROUTINE(SBG_fadePals),
  PROC_CALL_ROUTINE(SBG_SetupNextBG),
  PROC_SLEEP(300),
  PROC_GOTO(0),
  
  PROC_END
};

void SBG_InitChangeSongBG(struct SBG_ProcStateChangeSongBG* proc) {
  proc->timer = 0;
  proc->fadeIn = false;
  CpuFastCopy(gPaletteBuffer+0x20, gPaletteFadeBuffer, 0x1C0);      // Buffer palettes.
}

void SBG_fadePals(struct SBG_ProcStateChangeSongBG* proc) {
  CpuFastCopy(gPaletteFadeBuffer, gPaletteBuffer+0x20, 0x1C0);      // Buffered palettes.
  
  if (!proc->fadeIn)
    FadePalette(gPaletteBuffer, 2, 14, proc->timer);
  else
    FadePalette(gPaletteBuffer, 2, 14, 0x10-proc->timer);
  
  if (proc->timer >= 0x10)
    BreakProcLoop((Proc*)proc);
  else
    proc->timer++;
}

void SBG_DrawBG(struct SBG_ProcStateChangeSongBG* proc) {
  if (proc->songBGStruct == NULL) {
    CpuFastFill(0xBF00BF, (void*)0x600F800, 0x800)            // Clear screen entries by using empty tile.
    ProcStart(Procs_ScrollMural, proc->parent->parent);       // Grandparent is SoundRoomUI proc.
    CpuFastCopy(gPaletteBuffer+0x20, gPaletteFadeBuffer, 0x1C0);
    gLCDIOBuffer.bgControl[3].colorMode = 0;
  }
  else {
    EndEachProc(Procs_ScrollMural);
    gLCDIOBuffer.bgOffset[3].x = 0;
    gLCDIOBuffer.bgOffset[3].y = 0;
    CpuFastFill(0, (void*)0x6002FC0, 0x40)                    // Empty tile.
    Decompress(proc->songBGStruct->BGTiles, (void*)0x6004A00);
    for (int i = 0; i < 20; i++) {
      for (int j = 0; j < 30; j++) {
        gBg3MapBuffer[i*32+j] = j+i*30+0x128;
      }
    }
    EnableBgSyncByIndex(3);
    CpuFastCopy(proc->songBGStruct->BGPalette+0x20, gPaletteFadeBuffer, 0x1C0);
    gLCDIOBuffer.bgControl[3].colorMode = 1;
  }
  proc->timer = 0;
  proc->fadeIn = true;
}

void SBG_SetupNextBG(struct SBG_ProcStateChangeSongBG* proc) {
  // End if mural or no next BG
  if (proc->songBGStruct == NULL || proc->songBGStruct->next == NULL) {
    EndProc((Proc*)proc);
    return;
  }
  
  proc->timer = 0;
  proc->fadeIn = false;
  proc->songBGStruct = proc->songBGStruct->next;
}