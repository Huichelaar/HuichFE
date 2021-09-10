#include "M7.h"

__attribute__((target("arm")))
void M7HBlank(void)
{
	int vc = VCOUNT;

	if (vc >= SCREEN_HEIGHT || vc < m7World->horizon) {
    DISPCNT.enableBg2 = 0;              // I do this because I'm getting BG2 & BG3 flickering, probably
    DISPCNT.enableBg3 = 0;              // due to not reaching VBlankIntrwait in one screen refresh.
		return;
  }

  if (vc == m7World->horizon)
	{
		DISPCNT.bgMode = 2;
    DISPCNT.enableBg2 = 1;
    DISPCNT.enableBg3 = 1;
		BG2CNT = m7World->bg2cnt;
    BG3CNT = m7World->bg3cnt;
	}
  
	int lam = m7World->lam[vc+1];

	int lcf = lam*M7_GET_CF >> 8;
	int lsf = lam*M7_GET_SF >> 8;

	int zb = (vc-M7_TOP)*M7_GET_ST - M7_D*M7_GET_CT;

	BG2PA = lcf >> 4;
	BG2PC = lsf >> 4;
	BG2X  = m7World->cam->data.pos.x + (lcf >> 4)*M7_LEFT - (lsf*zb >> 12);
	BG2Y  = m7World->cam->data.pos.z + (lsf >> 4)*M7_LEFT + (lcf*zb >> 12);
  
  BG3PA = BG2PA;
  BG3PC = BG2PC;
  BG3X = BG2X;
  BG3Y = BG2Y;

	// A distance fogging with high marks for hack-value
	// Remember that we used pb to store the scale in, 
	// so the blend is basically lambda/64 = distance * 2
	// which will do nicely
  /*
	unsigned ey = lam*6>>12;

	if (ey > 16)
    ey = 16;

	BLDY = ey;
  //BLDALPHA = (struct BlendAlpha){ey, 16-ey};    // this line ends up consuming too much space. 
                                                  // starts overwriting not-unused RAM Space.
  */
}
