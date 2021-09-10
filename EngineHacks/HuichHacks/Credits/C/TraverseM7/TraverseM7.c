#include "TraverseM7.h"
#include "../../../../../Generic/M7/Src/M7.h"

#define TRAVEL_VELOCITY 128   // Don't change this to 0 or you'll get a divide by zero.
#define ROTATE_VELOCITY 1     // Don't change this to 0 or you'll get a divide by zero.

const struct ProcInstruction CRE_traverseM7_Proc[] = {
  PROC_SET_NAME("CRE_traverseM7"),
  PROC_SLEEP(31),
  PROC_LOOP_ROUTINE(CRE_traverseM7Loop),
  PROC_END
};

// Move camera based on key input.
/*
void CRE_traverseM7Loop(struct CRE_ProcStateTraverseM7* proc) {
  int A = ((gKeyState.heldKeys & KEY_BUTTON_A) ? 256 : 0);
  int B = ((gKeyState.heldKeys & KEY_BUTTON_B) ? -256 : 0);
  int RIGHT = ((gKeyState.heldKeys & KEY_DPAD_RIGHT) ? 1 : 0);
  int LEFT = ((gKeyState.heldKeys & KEY_DPAD_LEFT) ? -1 : 0);
  int UP = ((gKeyState.heldKeys & KEY_DPAD_UP) ? -1 : 0);
  int DOWN = ((gKeyState.heldKeys & KEY_DPAD_DOWN) ? 1 : 0);
  
  // TODO limits
  m7World->cam->data.pos.x += (RIGHT+LEFT) * M7_GET_CF - (DOWN+UP) * M7_GET_SF;
  m7World->cam->data.pos.y += (A+B);
  m7World->cam->data.pos.z += (RIGHT+LEFT) * M7_GET_SF + (DOWN+UP) * M7_GET_CF;
  
  if (gKeyState.heldKeys & KEY_BUTTON_L)
    m7Rotate(m7World->cam->data.phi-1, m7World->cam->data.theta);
  if (gKeyState.heldKeys & KEY_BUTTON_R)
    m7Rotate(m7World->cam->data.phi+1, m7World->cam->data.theta);
  if (gKeyState.heldKeys & KEY_BUTTON_START)
    m7Rotate(m7World->cam->data.phi, m7World->cam->data.theta+1);
  if (gKeyState.heldKeys & KEY_BUTTON_SELECT)
    m7Rotate(m7World->cam->data.phi, m7World->cam->data.theta-1);
  
  // End if START + SELECT are held.
  if (gKeyState.heldKeys == (KEY_BUTTON_START | KEY_BUTTON_SELECT))
    BreakProcLoop((Proc*)proc);
}*/

void CRE_traverseM7Loop(struct CRE_ProcStateTraverseM7* proc) {
  if (proc->travelStruct->bitfield == (u32)-1) {
    //TODO, Loop back to first element again.
    BreakProcLoop((Proc*)proc);
    return;
  }
  if ((proc->travelStruct->bitfield & 1) != 0) {
    //TODO, Travel instantly.
    proc->travelStruct++;
    return;
  }
  
  // Calculate distance for x, y and z.
  int dist2D, dist[3];
  if (m7World->cam->data.pos.x == proc->travelStruct->x)
    dist2D = ABS(m7World->cam->data.pos.z - proc->travelStruct->z);
  else if (m7World->cam->data.pos.z == proc->travelStruct->z)
    dist2D = ABS(m7World->cam->data.pos.x - proc->travelStruct->x);
  else {
    int a = ABS(m7World->cam->data.pos.x - proc->travelStruct->x);
    int b = ABS(m7World->cam->data.pos.z - proc->travelStruct->z);
    dist2D = Sqrt(a*a + b*b);     // Pythagoras theorem.
  }
  dist[0] = dist2D;
  dist[1] = ABS(m7World->cam->data.pos.y - proc->travelStruct->y);
  dist[2] = dist2D;
  
  // Create traverseM7Dim procs that move camera.
  for (int i = 0; i < 3; i++) {
    if (dist[i]) {
      struct CRE_ProcStateTraverseM7Dim* dimProc = (struct CRE_ProcStateTraverseM7Dim*)ProcStartBlocking(CRE_traverseM7Dim_Proc, (Proc*)proc);
      dimProc->startPos = *(&(m7World->cam->data.pos.x) + i);
      dimProc->endPos = *(&(proc->travelStruct->x) + i);
      dimProc->currentT = 0;
      dimProc->endT = Div(dist[i], TRAVEL_VELOCITY);
      dimProc->dim = &(*(&(m7World->cam->data.pos.x) + i));
    }
  }
  
  // Rotate the camera to follow the direction of movement.
  if (!(dist[0] == 0 && dist[2] == 0)) {
    EndEachProc(CRE_traverseM7Rot_Proc);
    struct CRE_ProcStateTraverseM7Rot* rotProc = (struct CRE_ProcStateTraverseM7Rot*)ProcStart(CRE_traverseM7Rot_Proc, (Proc*)proc);
    rotProc->startPos = m7World->cam->data.phi;
    int adjacentDist = ABS(m7World->cam->data.pos.x - proc->travelStruct->x);
    int oppositeDist = ABS(m7World->cam->data.pos.z - proc->travelStruct->z);
    rotProc->endPos = (ArcTan2(-oppositeDist, adjacentDist)>>8);
    rotProc->currentT = 0;
    rotProc->endT = Div(ABS(rotProc->endPos - rotProc->startPos), ROTATE_VELOCITY);
  }
  
  proc->travelStruct++;
}

const struct ProcInstruction CRE_traverseM7Dim_Proc[] = {
  PROC_SET_NAME("CRE_traverseM7Dim"),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_moveCam),
  PROC_END
};

void CRE_moveCam(struct CRE_ProcStateTraverseM7Dim* proc) {
  proc->currentT++;
  
  *proc->dim = GetValueFromEasingFunction(0, proc->startPos, proc->endPos, proc->currentT, proc->endT);
  
  if (proc->currentT >= proc->endT)
    BreakProcLoop((Proc*)proc);
}

const struct ProcInstruction CRE_traverseM7Rot_Proc[] = {
  PROC_SET_NAME("CRE_traverseM7Rot"),
  PROC_YIELD,
  PROC_LOOP_ROUTINE(CRE_rotateCam),
  PROC_END
};

void CRE_rotateCam(struct CRE_ProcStateTraverseM7Rot* proc) {
  proc->currentT++;
  
  int phi = GetValueFromEasingFunction(1, proc->startPos, proc->endPos, proc->currentT, proc->endT);
  m7Rotate(phi, m7World->cam->data.theta);
  
  if (proc->currentT >= proc->endT)
    BreakProcLoop((Proc*)proc);
}