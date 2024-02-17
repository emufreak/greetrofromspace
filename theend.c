#include "theend.h"
#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/graphics.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
//#include "utilsasm.h"
#include <hardware/intbits.h>
#include "utils.h"

#define BPLSIZE 80*257
#define BPLDEPTH 1 
#define ZMCPSIZE 340*4
#define COPBPL1HIGH 57
#define COPBPL1LOW 59
#define COPBPL2HIGH 61
#define COPBPL2LOW 63
#define COPBPL3HIGH 65
#define COPBPL3LOW 67
#define COPCOLOR 68
#define COPCOLORDIM 72

UWORD *End_ViewCopper;
UWORD *End_DrawCopper;

INCBIN_CHIP( End_Bitmap, "data/theend/theend.raw.BPL")
INCBIN( End_ClColor, "data/theend/theend.raw.COP")

ULONG End_ClsSprites[] = { 0x001200000, 0x001220000,0x001240000,0x001260000, 0x001280000, 
        0x0012a0000, 0x0012c0000, 0x0012e0000, 0x001300000, 0x001320000, 0x001340000,
                 0x001360000, 0x001380000, 0x0013a0000, 0x0013c0000, 0x0013e0000  };

ULONG End_ClScreen[] = { 0x001fc0000, 0x001060000, 0x0009683ff, 0x0008e2c81, 0x000902cc1,
         0x000920038, 0x0009400d0, 0x001020000, 0x001040000, 0x001080000, 0x0010a0000, 
                                                                  0x001005200 };  

/*ULONG End_ClColor[] = { 0x1800709,0x1820306,0x184006c, 0x1860036, 
                    0x1880090,0x1820000,0x1840550, 0x1860ff0,
                    0x1800000,0x1820550,0x1840aa0, 0x1860ff0,
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}

void End_DrawScreen() {    
}

UWORD * End_ClBuild() {
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
  
  if( retval == 0) {
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    Exit(1);
  }
  ULONG *cl = retval;
  /**cl = 0xfffffffe;
  return retval;*/
  ULONG *clpartinstruction;
  clpartinstruction = End_ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;

  clpartinstruction = End_ClScreen;

  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
  UWORD bpl1pointerlow = (ULONG)End_Bitmap & 0xffff;
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
  UWORD bpl2pointerlow = (ULONG)(End_Bitmap + 10240) & 0xffff;
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
  UWORD bpl3pointerlow = (ULONG)(End_Bitmap + 10240*2) & 0xffff;
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
  UWORD bpl4pointerlow = (ULONG)(End_Bitmap + 10240*3) & 0xffff;
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
  UWORD bpl5pointerlow = (ULONG)(End_Bitmap + 10240*4) & 0xffff;

  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;

  UWORD *cw = (UWORD *) cl;

  *cw++ = 0x00e0;
  *cw++ = bpl1pointerhigh;
  *cw++ = 0x00e2;
  *cw++ = bpl1pointerlow;
  *cw++ = 0x00e4;
  *cw++ = bpl2pointerhigh;  
  *cw++ = 0x00e6;
  *cw++ = bpl2pointerlow;
  *cw++ = 0x00e8;
  *cw++ = bpl3pointerhigh;  
  *cw++ = 0x00ea;
  *cw++ = bpl3pointerlow;  
  *cw++ = 0x00ec;
  *cw++ = bpl4pointerhigh;  
  *cw++ = 0x00ee;
  *cw++ = bpl4pointerlow;  
  *cw++ = 0x00f0;
  *cw++ = bpl5pointerhigh;  
  *cw++ = 0x00f2;
  *cw++ = bpl5pointerlow;  


  cl = (ULONG *) cw;
  clpartinstruction = End_ClColor;
  for(int i=0; i<32;i++)
  {
    *cl++ = *clpartinstruction++;
  }  

  //*cl++ = 0xffdffffe;
  *cl++ = 0x20bffffe;
  *cl++ = 0x009c8010;
  *cl++ = 0xfffffffe;
  return (UWORD *) retval;  
}

struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
  //p61Music();
}

int End_PrepareDisplay() {

  End_DrawCopper = End_ClBuild( );  

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    End_Vbint->is_Data = NULL;
    End_Vbint->is_Code = End_VblankHandler;
  }

  AddIntServer( INTB_COPER, End_Vbint);
  End_SetCl();

  return 0;
}

void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
  //custom->copjmp1 = End_DrawCopper;
}

