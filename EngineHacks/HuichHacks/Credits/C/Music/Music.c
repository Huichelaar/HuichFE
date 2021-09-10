#include "Music.h"


const struct ProcInstruction CRE_music_Proc[] = {
  PROC_SET_NAME("CRE_music"),
  PROC_SET_DESTRUCTOR(CRE_musicDestructor),
  PROC_YIELD,
  
  PROC_LABEL(0),
  PROC_CALL_ROUTINE(CRE_musicInit),
  PROC_SLEEP(300),
  PROC_LOOP_ROUTINE(CRE_musicLoop),
  
  PROC_END
};

void CRE_musicDestructor() {
  Sound_FadeSongOut(1);
}

void CRE_musicInit(struct CRE_ProcStateMusic* proc) {
  Sound_SongTransition(proc->musicStruct[proc->index].songID, 0x100, 0x100, 0x40, 0);
  
  u16 songID = proc->musicStruct[proc->index].songID;
  u8 priority = (u8)(gSongTable[songID].priority>>14);        // We shift like this because this makes
  switch(priority) {                                          // gcc hesitant to using some function
    case 0 :                                                  // we don't have.
      proc->musicPlayer = &gMusicPlayerInfo0;
      break;
    case 4 :
      proc->musicPlayer = &gMusicPlayerInfo1;
      break;
    case 8 :
      proc->musicPlayer = &gMusicSEPlayerInfo2;
      break;
    case 12 :
      proc->musicPlayer = &gMusicSEPlayerInfo3;
      break;
    case 16 :
      proc->musicPlayer = &gMusicSEPlayerInfoUnk1;
      break;
    case 20 :
      proc->musicPlayer = &gMusicSEPlayerInfoUnk2;
      break;
    case 24 :
      proc->musicPlayer = &gMusicSEPlayerInfoUnk3;
      break;
    case 28 :
      proc->musicPlayer = &gMusicSEPlayerInfo4;
      break;
    default :
      proc->musicPlayer = &gMusicSEPlayerInfo5;
  }
}

void CRE_musicLoop(struct CRE_ProcStateMusic* proc) {
  if (proc->musicPlayer->clock >= (u32)proc->musicStruct[proc->index].playTime) {
    BreakProcLoop((Proc*)(proc));
    proc->index++;
    if (proc->musicStruct[proc->index].songID)
      ProcGoto((Proc*)proc, 0);
    else
      Sound_SongTransition(0, 0x100, 0x100, 0x40, 0);
  }
}