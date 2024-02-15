#include "swscroller.h"
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

ULONG *Sw_ScreenBuffer2;
ULONG *Sw_ScreenBuffer1;
ULONG *Sw_ScreenBuffer3;
UWORD *Sw_DrawBuffer;
UWORD *Sw_ViewBufferP1;
UWORD *Sw_ViewBufferP2;
UWORD *Sw_ViewBufferP3;
UWORD SwScrollerFinished = 0;
volatile UWORD FrameCountBufferDraw = 2;
volatile UWORD Sw_BlitFrame = 0;

UWORD *Sw_ViewCopper;
UWORD *Sw_DrawCopper;

UWORD *Sw_FontBuffer;

INCBIN_CHIP( Sw_font, "data/swscroller/font.fnt");
INCBIN_CHIP( Sw_XMaskLeft, "data/swscroller/xmaskleft.raw")
INCBIN_CHIP( Sw_XMaskRight, "data/swscroller/xmaskright.raw")
INCBIN( Sw_ClColorDim, "data/swscroller/clcolordim.raw")
//INCBIN_CHIP( theend, "data/theend/voidlogo2.raw")

ULONG Sw_ClsSprites[] = { 0x001200000, 0x001220000,0x001240000,0x001260000, 0x001280000, 
        0x0012a0000, 0x0012c0000, 0x0012e0000, 0x001300000, 0x001320000, 0x001340000,
                 0x001360000, 0x001380000, 0x0013a0000, 0x0013c0000, 0x0013e0000  };

ULONG Sw_ClScreen[] = { 0x001fc0000, 0x001060000, 0x0009683ff, 0x0008e2c81, 0x000902ac1,
         0x00092003c, 0x0009400d4, 0x001020000, 0x001040000, 0x001080000, 0x0010a0000, 
                                                                  0x00100a200 };


ULONG Sw_ClColor[] = { 0x1800000,0x1820ff0,0x1840000, 0x1860ff0, 
                    0x1800000,0x1820aa0,0x1840550, 0x1860ff0,
                    0x1800000,0x1820550,0x1840aa0, 0x1860ff0,
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     

char Sw_text[] =   
"Void proudly presents                   "
"this     Greetro      from              "    
"Space.      Too       many              "
"times we  left  out  the                "
"Greetings       in       our            "
"Productions.  Time   to                 "
"fix this!  Greetings  go                "
"to       the         mighty:            "
"                                        "
"          ALCATRAZ                      "
"         ANDROMEDA                      "
"          DEKADENCE                     "
"          GHOSTOWN                      "
"           LOGICOMA                     "
"             PACIFIC                    "
"         PLANET JAZZ                    "
"             RAM JAM                    "
"                                        "
"               AND....                  "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        "
"                                        ";


void Sw_Run() {                                     
	Sw_WritePlainText();
  Sw_DrawScreen3();
}

int Sw_framecountscreen = 0;
int Sw_framecount = 49;
int Sw_textoffset = 0;

void Sw_WritePlainText() {
  if(Sw_framecount == 50) {
    Sw_framecount = 0;
    
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);

    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);

    Sw_textoffset += 40;
    if( Sw_textoffset >= 32*40) {
      Sw_textoffset = 0;
      SwScrollerFinished = 1;
    }    
  }  
  Sw_framecount++;
}

UWORD Sw_CopyLines[] = { 189,	54,	138,	223,	1,	119,	155,	34,	101,	206,	1,	73,	172,	22, 91,	240,	1 };
UWORD Sw_BlitFinished = 0;

void Sw_DrawScreen3() {    
  
  while ( Sw_BlitFrame == 0)
  {
    /* code */
  }
  

  int *bp = 0x200;
  *bp = 0;

  Sw_BlitFinished = 0;
  Sw_BlitFrame = 0;
  
  //Prepare
  WaitBlit();
  custom->bltamod = 0;
  custom->bltbmod = 0;
  custom->bltdmod = 0;
  custom->bltafwm = 0xffff;
  custom->bltalwm = 0xffff;
  custom->bltcon1 = 0;  
  custom->bltcon0 = 0x09f0;



  //Fontblit  
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
  custom->bltdpt = Sw_DrawBuffer+40*255;
  custom->bltsize = 64+40;

  //Copy
  WaitBlit();
  custom->bltamod = 0;
  custom->bltdmod = 0;
  custom->bltapt = Sw_ViewBufferP1;
  custom->bltdpt = Sw_DrawBuffer;  
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  

  //Generate Right Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMaskLeft

  WaitBlit();

  //custom->color[0] = 0x0f00;

  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
  custom->bltafwm = 0xffff;

  custom->bltamod = 40; // Skip Left Part of Screen
  custom->bltdmod = 40; // Skip Left Part of Screen
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;

  //Generate Right Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskLeft and merge with unmoved on conflicting pixel
  WaitBlit();
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
  custom->bltalwm = 0xfffe;
  custom->bltcmod = 38; // Skip Left Part of Screen
  custom->bltbmod = -2;
  custom->bltamod = 38; // Skip Left Part of Screen
  custom->bltdmod = 38; // Skip Left Part of Screen
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;

  //Generate Left Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMaskLeft

  WaitBlit();
  custom->bltafwm = 0xffff;
  custom->bltalwm = 0xffff;
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
  custom->bltbmod = 0;
  custom->bltcon1 = 0;  

  custom->bltamod = 40; // Skip Right Part of Screen
  custom->bltdmod = 40; // Skip Right Part of Screen
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;

  //Generate Left Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskLeft and merge with unmoved on conflicting pixel
  WaitBlit();
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
  custom->bltcon1 = 0x1000; // Shift B Channel 1
  custom->bltafwm = 0x7fff;
  custom->bltcmod = 40; // Skip Right Part of Screen

  custom->bltamod = 40; // Skip Right Part of Screen
  custom->bltdmod = 40; // Skip Right Part of Screen
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;

  WaitBlit();
  
  Sw_BlitFinished = 1;

  custom->color[0] = 0x00;

  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;

}

UWORD Sw_ClColorDimPos = 0;
UWORD Sw_ClColorDimLength = 111;

UWORD * Sw_ClBuild() {
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
  
  if( retval == 0) {
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    Exit(1);
  }
  ULONG *cl = retval;
  /**cl = 0xfffffffe;
  return retval;*/
  ULONG *clpartinstruction;
  clpartinstruction = Sw_ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;

  clpartinstruction = Sw_ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
  *cl++ = 0x00e00000;
  *cl++ = 0x00e20000;
  *cl++ = 0x00e40000;
  *cl++ = 0x00e60000;
  *cl++ = 0x00e80000;
  *cl++ = 0x00ea0000;
  clpartinstruction = Sw_ClColor;
  for(int i=0; i<4;i++)
  {
    *cl++ = *clpartinstruction++;
  }  

  clpartinstruction = Sw_ClColorDim;

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
  }
  //*cl++ = 0xffdffffe;
  *cl++ = 0x20bffffe;
  *cl++ = 0x009c8010;
  *cl++ = 0xfffffffe;
  return (UWORD *) retval;  
}

struct Interrupt *Sw_Vbint;
UWORD Sw_ScreenBufferOffset = 0;
UWORD Sw_InitComplete = 0;

void Sw_VblankHandler() {

  custom->intreq = 0x0020;
  //p61Music();

  if( Sw_InitComplete == 1) {
    if( FrameCountBufferDraw == 2) {
      FrameCountBufferDraw = 0;
      Sw_BlitFrame = 1;

      if(Sw_ScreenBufferOffset == 0) { 
        Sw_ScreenBufferOffset = 2; 
      } else {
        Sw_ScreenBufferOffset = 0; 
      }
    } 
    else
    {
      FrameCountBufferDraw++;
    }
    Sw_SetBplPointers();
    Sw_SetColors();   
  }
}

ULONG *Sw_ScreenBufferList[15];

UWORD debugpal[] = { 0x0000, 0x0fff };

int Sw_PrepareDisplay() {

  SwScrollerFinished = 0;

  debug_register_palette( debugpal, "debug.pal", 2, 0);

  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);

  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
  
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
  if(Sw_ScreenBuffer3 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);

  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   

  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
  
  if(Sw_ScreenBuffer2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);

  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
 

  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
  
  if(Sw_ScreenBuffer1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);

  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  

  Sw_ViewCopper = Sw_ClBuild( );
  Sw_DrawCopper = Sw_ClBuild( );
  //SetBplPointers(); //Set Buffer 1
  Sw_SwapCl();

  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    Sw_Vbint->is_Node.ln_Pri = -60;
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    Sw_Vbint->is_Data = NULL;
    Sw_Vbint->is_Code = Sw_VblankHandler;
  }

  AddIntServer( INTB_COPER, Sw_Vbint);
  //SetBplPointers(); //Set Buffer 2  

  /*
      Fr1   Fr2   Fr3 Fr4    dB  bp1 bp2 bp3
      66%   33%              3   2   1   1
      33%   66%              3   2   2   1 
      0%    100%             3   2   2   2
      0%    66    33         1   3   2   2
      0     33    66         1   3   3   2
      0     0     100        1   3   3   3
      0     0     66  33     2   1   3   3
      0     0     33  66     2   1   1   3
      0     0     0   100    2   1   1   1   
  
  */

  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    

  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   

  Sw_InitComplete = 1;

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
  FreeMem( Sw_ScreenBuffer3, BPLSIZE*BPLDEPTH);
  FreeMem( Sw_FontBuffer,  80*50);
  FreeMem( Sw_font, 38000);
  RemIntServer( INTB_COPER, Sw_Vbint);
}


/*INCBIN_CHIP( Sw_font, "data/swscroller/font.fnt");
INCBIN_CHIP( Sw_XMaskLeft, "data/swscroller/xmaskleft.raw")
INCBIN_CHIP( Sw_XMaskRight, "data/swscroller/xmaskright.raw")
INCBIN( Sw_ClColorDim, "data/swscroller/clcolordim.raw")*/

void Sw_SetBplPointers() {

  /* Frame Movement 
  Dim   Full  LDr LP1(Dim) LP2(Full)  LDr LP1(Dim) LP2(Full)
                                      Bf3 Bf2      Bf1
                                      Bf3 Bf2      Bf2
  Fr1   x     Fr2  Fr1      x         Bf1 Bf3      Bf2              
  x     Fr1   Fr2  Fr1      Fr1       Bf1 Bf3      Bf3
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
 //Sw_Sw_ViewBufferP3 = Sw_ScreenBufferList[Sw_ScreenBufferOffset+3];

  /*Sw_ScreenBufferOffset += 2;
  if(Sw_ScreenBufferOffset == 12) { Sw_ScreenBufferOffset = 0; }*/

  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;
  
  /*highword = (ULONG)Sw_ViewBufferP3 >> 16;
  lowword = (ULONG)Sw_ViewBufferP3 & 0xffff;
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;*/

}

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
  }
  if( ColPos == 12) {
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    Sw_ClColorDimPos = 0;
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;

  }
}

void Sw_SwapCl() {

  /*ULONG tmp = (ULONG) Sw_DrawCopper;
  Sw_DrawCopper = Sw_ViewCopper;
  Sw_ViewCopper = (UWORD *)tmp;*/
  custom->cop1lc = (ULONG) Sw_DrawCopper;
  //custom->copjmp1 = tmp;
}

/*void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
  for( int i=0;i<lines; i++) {
    for( int i2=0;i2<linelength;i2++) 
      *target++ = pattern;
    target += mod;
  }
}*/
