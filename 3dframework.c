#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <graphics/gfxmacros.h>
#include <hardware/custom.h>
#include <hardware/dmabits.h>
#include <hardware/intbits.h>
#include "support/gcc8_c_support.h"
#include "3dframework.h"
#include "utils.h"
#include "import.h"
#include "data/cubes/abyss.h"
#include "data/cubes/atw.h"
#include "data/cubes/tek.h"
#include "spread.h"
#include "data/cubes/point.h"
#include "data/cubes/flex.h"
#include "data/cubes/desire.h"
#include "data/cubes/mercury.h"
#include "stylesheet.h"

#define BPLWIDTH 40
#define BPLHEIGHT 256
#define BPLSIZE BPLWIDTH*BPLHEIGHT
#define BPLDEPTH 3
#define ZMCPSIZE 340*4
#define COPBPL1HIGH 57
#define COPBPL1LOW 59
#define COPBPL2HIGH 61
#define COPBPL2LOW 63
#define COPBPL3HIGH 65
#define COPBPL3LOW 67
#define COPCOLOR 68
#define COPCOLORDIM 72

#define DIST 386
#define XC 160
#define YC 128

UWORD CubeFinished = 0;
struct Cube Cubes[4];
UWORD *CubeNrReversePtr;
UBYTE *ViewCopper;
UBYTE *DrawCopper;
UBYTE *Bitmap1;
UBYTE *Bitmap2;
UBYTE *Bitmap3;
struct ScreenBuffer ScreenBuffer1;
struct ScreenBuffer ScreenBuffer2;
struct ScreenBuffer ScreenBuffer3;
struct ScreenBuffer *DrawBuffer;
struct ScreenBuffer *ViewBuffer;
struct ScreenBuffer *ClearBuffer;
UBYTE *PrepareBuffer;
UBYTE *LineBuffer;
UBYTE *WorkingMem;
UWORD ScreenBufferOffset = 0;
UWORD DoNotClearDirty = 0;
UWORD YposMinOverWrite = 0;
UWORD YposMaxOverWrite = 0;

ULONG ClsSprites[] = { 0x001200000, 0x001220000,0x001240000,0x001260000, 0x001280000, 
        0x0012a0000, 0x0012c0000, 0x0012e0000, 0x001300000, 0x001320000, 0x001340000,
                 0x001360000, 0x001380000, 0x0013a0000, 0x0013c0000, 0x0013e0000  };

ULONG ClScreen[] = { 0x001fc0000, 0x001060000, 0x0009683ff, 0x0008e2c81, 0x000902cc1,
         0x000920038, 0x0009400d0, 0x001020000, 0x001040000, 0x001080018, 0x0010a0018, 
                                                                  0x001000200 };


//ULONG ClColor[] = { 0x1800101,0x182068a,0x1840658, 0x1860616, 0x18806ee, 0x18a06ee, 0x18c06ee, 0x18e06ee }; //berry

ULONG ClColor[] = { 0x1800000 + BGCOLOR,0x1820000 + SIDE1COLOR,0x1840000 + SIDE2COLOR, 0x1860000 + SIDE3COLOR, 0x1880000 + FONTCOLOR, 0x18a0000 + FONTCOLOR, 0x18c0000 + FONTCOLOR, 0x18e0000 + FONTCOLOR }; //


ULONG ClToggleBitPlanes[] = { 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 
                              0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe, 0xfffffffe };


__attribute__((always_inline)) inline short MouseRight(){return !((*(volatile UWORD*)0xdff016)&(1<<10));}
__attribute__((always_inline)) inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	

struct Interrupt *Vbint;
struct ScreenBuffer *ScreenBufferList[9];

UWORD CubeNrReversePos = 1;
UWORD vectorpos = 0;
UWORD VectorPosLetters = 0;
UWORD VectorPosLettersReversed = 0;
WORD *ptrvectorletters;
WORD *ptrvectorlettersreversed;      
WORD *ptrvector;
UBYTE KeyCode;


void SmartLineFillAsm(UWORD startx, UWORD starty, WORD height, UWORD length, UWORD minterm,  UWORD bltwidth, UWORD bltstart) { // returns end of output data, input needs to be 16-bit aligned!
	register volatile void* _d0 ASM("d0") = startx;
	register volatile void* _d1 ASM("d1") = starty;
  register volatile void* _d2 ASM("d2") = height;
  register volatile void* _d3 ASM("d3") = length;
  register volatile void* _d4 ASM("d4") = minterm;
  register volatile void* _d5 ASM("d5") = bltwidth;
  register volatile void* _d6 ASM("d6") = bltstart;
	__asm volatile (
		"jsr _smartlinefillasm");
}

void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
	register volatile void* _a1 ASM("a1") = dst;
  register volatile void* _d1 ASM("d0") = size;  
	__asm volatile (
		"movem.l %%d0-%%d7/%%a2-%%a6,-(%%sp)\n"
		"jsr _lz4_depack\n"
		"movem.l (%%sp)+,%%d0-%%d7/%%a2-%%a6"
	: "+rf"(_a0), "+rf"(_a1), "=r"(_d1)
	);
}

void ClearDirtyArea( ULONG target, WORD bltsize)
{
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
  (void)tst;
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
  //for(int i=0;i<=2;i++) {
    //custom->bltadat = data;
    custom->bltdpt =(ULONG *)target;
    custom->bltadat = 0x0;
    custom->bltsize = bltsize;    
    target += 64*BPLHEIGHT;
  //}
}

void ClearDirtyAreaPrepare( WORD bltmod)
{
  volatile struct Custom *custom = (struct Custom*)0xdff000; 
  
  WaitBlit();
  custom->bltcon0 = 0x01f0;
  custom->bltcon1 = 0x0;
  custom->bltdmod = bltmod;
}

WORD firsttime = 1;
WORD Scene = 1;

void DrawScreen()
{    
  volatile struct Custom *custom = (struct Custom*)0xdff000; 

  //SmartLineFillAsm(1,1,1,1,1,1,1);

  Utils_BlitterPrepare();

  UWORD result = 0;

  switch(Scene) {

    case 1:
      //Spred
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
      break;

    case 2:
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
     Scene = 3;
     break;

    case 3:
      //Point
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
      break;

    case 4:
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
      Scene = 5;
      break;    

    case 5:      
      //Tek
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
      break;

    case 6:    
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
      Scene = 7;
      break;

    case 7:
      //Flex
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
      break;

    case 8:
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
      Scene = 9;
      break;
    
    case 9:
      //Desire
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
      break;

    case 10:
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
      Scene = 11;
      break;

    case 11:
      //Atw
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
      break;
    
    case 12:
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
      Scene = 13;
      break;

    case 13:
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
      break;  

    case 14:
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
      Scene = 15;
      break;

    case 15:      
      result = DrawDicesSpecial( CubeNrReverseSizeMercury1, LetterMetaDataMercury1, LetterMetaDataMercury1, 13, 0, 4, 0, 1, 135);
      break;

    case 16:
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
      Scene = 17;
      break;

    case 17:
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
      break;
    case 18:
      CubeFinished = 1;
      break;
  }

  if(result == 1) Scene++;
}

UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {

  ptrvector = VectorBuffer +  vectorpos;    
  ptrvectorletters = LetterBuffer + VectorPosLetters;
  int mirroring = 0;
  if( nrofcubesreversed > 0) mirroring = 1;
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
  if( nrofcubesreversed > 0) {
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
  }

  CubeNrReversePos++;
  vectorpos += 3*8*nrofcubes;
  VectorPosLetters += 4*3*nrofvertsletter;
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;

  SetCl( clminendpos);

  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
  {
    CubeNrReversePos = 1;
    vectorpos = 0;
    VectorPosLetters = 0;
    VectorPosLettersReversed = 0;
    return 1;
  } else 
  {
    return 0;  
  }

}

UWORD DrawDicesSpecial( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {

  ptrvector = VectorBuffer +  vectorpos;    
  ptrvectorletters = LetterBuffer + VectorPosLetters;
  int mirroring = 0;
  if( nrofcubesreversed > 0) mirroring = 1;
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
  if( nrofcubesreversed > 0) {
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
  }

  CubeNrReversePos++;
  vectorpos += 3*8*nrofcubes;
  VectorPosLetters += 4*3*nrofvertsletter;
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;

  SetCl( clminendpos);
  
  if(vectorpos >= 8*3*133*4)
  {
    DoNotClearDirty = 1;
  }

  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
  {
    ClearBuffer->MyDirtyArea[0].Address = 0;
    ClearBuffer->MyDirtyArea[1].Address = 0;
    ClearBuffer->MyDirtyArea[2].Address = 0;
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    DrawBuffer->MyDirtyArea[0].Address = 0;
    DrawBuffer->MyDirtyArea[1].Address = 0;
    DrawBuffer->MyDirtyArea[2].Address = 0;
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    ViewBuffer->MyDirtyArea[0].Address = 0;
    ViewBuffer->MyDirtyArea[1].Address = 0;
    ViewBuffer->MyDirtyArea[2].Address = 0;
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    DoNotClearDirty = 0;    
    CubeNrReversePos = 1;
    vectorpos = 0;
    VectorPosLetters = 0;
    VectorPosLettersReversed = 0;
    return 1;
  } else 
  {
    return 0;  
  }

}

#define STARTYBG 70
#define STARTYBG2 109
#define ENDYBG 120

volatile UWORD FrameCounter = 0;

void VblankHandler() {

  volatile struct Custom *custom = (struct Custom*)0xdff000;    

  custom->intreq = 1 << INTB_VERTB;
  custom->intreq = 1 << INTB_VERTB;
  //p61Music();
  FrameCounter++;
}

void SetCl( UWORD minlastdrawline) 
{ //Save Dma Space by disabling bitplanes for black lines  

  UWORD *tmp = (UWORD *) DrawCopper + 84;

  UWORD startdisplaydone = 0;
  UWORD stopdisplaydone = 0;
  UWORD startbgcolordone = 0;
  UWORD stopbgcolordone = 0;


  UWORD firstdrawline = 0;
  UWORD lastdrawline = 0;
  if(DrawBuffer->maxytotal < 0) {
    firstdrawline = 255;
    lastdrawline = 255;
  } else if(DrawBuffer->minytotal < 0) {
    firstdrawline = 0;
    lastdrawline = DrawBuffer->maxytotal;
  } else {
    firstdrawline = DrawBuffer->minytotal;
    lastdrawline = DrawBuffer->maxytotal;
  }

  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;

  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
  UWORD size = 5;
  UWORD i, j;
  UWORD line;
  for (i = 0; i < size - 1; i++) {
      for (j = 0; j < size - i - 1; j++) {
          if (values[j] > values[j + 1]) {
              int temp = values[j];
              int temp2 = ids[j];
              values[j] = values[j + 1];
              ids[j] = ids[j + 1];
              values[j + 1] = temp;
              ids[j + 1] = temp2;
          }
      }
  }

  for (i = 0; i < size; i++) 
  {
    switch( ids[i]) 
    {
      case 0: //StartYBG
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
        *tmp++ = 0xfffe;
        *tmp++ = 0x0180;
        *tmp++ = TABLECOLOR;
        break;
      
      case 1: //StartDisplay
        if( firstdrawline + 0x2c > 255) {
          *tmp++ = 0xffdf;
          *tmp++ = 0xfffe;
        }
        line = (firstdrawline + 0x2c - 255) << 8;
        *tmp++ = line + 0x001;
        *tmp++ = 0xfffe;
        *tmp++ = 0x0100;
        *tmp++ = 0x3200;
        break;

      case 2:
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
        *tmp++ = 0xfffe;
        *tmp++ = 0x0180;
        *tmp++ = TABLECOLOR2;
        break;  
      case 3:
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
        *tmp++ = 0xfffe;
        *tmp++ = 0x0180;
        *tmp++ = BGCOLOR;
        break;          

      case 4:
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
          *tmp++ = 0xffdf;
          *tmp++ = 0xfffe;
        }
        line = (lastdrawline + 0x2c - 255) << 8;
        *tmp++ = line + 0x001;
        *tmp++ = 0xfffe;
        *tmp++ = 0x0100;
        *tmp++ = 0x0200;
        break;

    }
  }

  *tmp++ = 0xffff;
  *tmp = 0xfffe;

}


void PrepareLineBuffer( UBYTE *buffer) {
  WORD repeats = 100;
  UBYTE *startbuffer = buffer;
  WORD linesize = 6;

  for( WORD i=0;i <=5;i++) {
    for( WORD i2=1;i2<=16; i2++) {        
      UWORD data = 0xffff;
      data = data >> i2;
      data = data ^ 0xffff;
      Utils_BlitClear( startbuffer+(i2-1)*repeats*linesize*2+i*2, repeats, 1, linesize*2-2, data);        
    }    
    if( i > 0) {
      WORD height = repeats * 16;
      ULONG extraoffset = 0;
      while( height > 512) {
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
        height -= 512;
        extraoffset += 512*12;
      }
      Utils_BlitClear( startbuffer+extraoffset, height, i, linesize*2-2*i, 0xffff);        
    }
    startbuffer += repeats*linesize*2*16;
  }
}

volatile UWORD BltCon0LineDraw;

void DrawRect(struct Square *square)
{  
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  //PrepareBuffer,buffer->BitPlane,0xca

  UWORD startbufferoffset = square->YPosMin*64;

  WORD ypos = 0;
  WORD height = square->Height;
  if(square->YPosMin < 0) {
    height += square->YPosMin;
    ypos -= square->YPosMin;
    startbufferoffset = 0;
  } else if(square->YPosMin>256) {
    height = 0;
  } else if(square->YPosMin+square->Height > 256) {
    height = 256 - square->YPosMin;
  } 
  

  WORD copymin;
  WORD xlength = square->XLength + 32;
  WORD xposmin = square->XPosMin;
  if(square->XPosMin <= 0) {
    xlength += xposmin - 16;    
    copymin = 96;
    xposmin += 96;
    startbufferoffset -= 12;
  } else {
    copymin = xposmin;
  }

  xlength = xlength/16;
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    custom->bltcon1 = 0x0000;      
    custom->bltcdat = 0x0;
    BltCon0LineDraw = 0x0500;
    DrawRectSub2(square, 0, 1);
    BltCon0LineDraw = 0x0700;
    DrawRectSub2(square, 1, 2);
    DrawRectSub2(square, 2, 3);
    DrawRectSub2(square, 3, 0);

    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
  }     
}

void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
{

  struct Square square;
  
  for(int i2=0;i2<numcube;i2++)
  {

    UWORD cubenr = metadata[0];
    UWORD facenr = metadata[1];

    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  

    if( square.DotProduct > 1) 
    {
      for(int i=0;i<metadata[2];i++)
      {              
        square.Color = metadata[3+i];

        WORD x0 = vectors[0];
        WORD y0 = vectors[1];
        WORD z0 = vectors[2];

        WORD x1 = vectors[3];
        WORD y1 = vectors[4];
        WORD z1 = vectors[5];
        
        WORD x2 = vectors[6];
        WORD y2 = vectors[7];
        WORD z2 = vectors[8];

        WORD x3 = vectors[9];
        WORD y3 = vectors[10];
        WORD z3 = vectors[11];

        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  

        square.Vertices[0].X = xs0;
        square.Vertices[0].Y = ys0;
        square.Vertices[1].X = xs1;
        square.Vertices[1].Y = ys1;
        square.Vertices[2].X = xs2;
        square.Vertices[2].Y = ys2;
        square.Vertices[3].X = xs3;
        square.Vertices[3].Y = ys3;

        WORD yposmin = square.Vertices[0].Y; 
        WORD yposmax = square.Vertices[0].Y;
        WORD xposmin = square.Vertices[0].X;
        WORD xposmax = square.Vertices[0].X;
        
        for( int i2=1; i2 <= 3;i2++)
        {
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
        }
        
        square.YPosMin = yposmin;
        square.XPosMin = xposmin;      
        square.Height = yposmax - yposmin + 1;

        if(square.Height > 1)
        {          
          square.XLength = xposmax - xposmin;
          if(square.XLength > 1) {
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    

            if(reversed == 1) {
              square.Clockwise *= -1;
            }            

            DrawRect( &square);  
          }
        }

        vectors += 12;
      }
    }
    else 
    {
      vectors += 12*metadata[2];
    }
    metadata += 3 + metadata[2];    
  }
}

inline void DrawRectSub2( struct Square *square, UWORD index1, UWORD index2)
{

  WORD x1 = square->Vertices[index1].X;
  WORD y1 = square->Vertices[index1].Y;
  WORD x2 = square->Vertices[index2].X;
  WORD y2 = square->Vertices[index2].Y;
  WORD xlength = square->XLength;

  WORD height = y1 - y2;

  if(height >= 100) {
     KPrintF("Cube height is huge.\n");
  }
  
  if(height != 0) {
    if(xlength != 0) {

      WORD starty = y1;
      WORD startx = x1;

      WORD length = x1 - x2;
      WORD index = 0;
      if(length < 0) {
        length *= -1;
        index = 2;
      } else {
        startx = x2;
      }
      length += 1;

      if(height < 0) {
        height = -height;
        index +=1;
      } else {
        starty =  y2;
      }
      height += 1; 
      
      if(square->Clockwise > 0) index = index ^ 0x3;

      WORD xposmin = square->XPosMin;
      WORD yposmin = square->YPosMin;
      //Clipping preparation (draw complete Polygon in correct range)
      if(xposmin <= 0) {
        startx += 96;
        xposmin += 96;
      }

      if(yposmin <= 0) {
        starty += 96;
        yposmin += 96;
      }

      WORD startyblitt = starty - yposmin;

      UWORD bltwidth;
      UWORD bltstart;
      UWORD minterm;
      
      switch(index) {
        case 0:
          minterm = 0xee;
          startx -= 1;
          bltwidth = length / 16 + 2;
          bltstart = ((xposmin-1)/16)*2;
          break;
        case 1:
          minterm = 0xbb;
          height *= -1;
          bltwidth = xlength/16+2;
          bltstart = (startx / 16)*2;
          break;
        case 2:
          minterm = 0xee;
          height *= -1;
          startx -= 1;
          bltwidth = length / 16 + 2;
          bltstart = ((xposmin-1)/16)*2;
          break;
        case 3:
          minterm = 0xbb;
          bltwidth = xlength/16+2;
          bltstart = (startx / 16)*2;
      }

      SmartLineFill( startx, startyblitt, height, length, minterm, bltwidth, bltstart);
    }
  }
}


void DrawCube3d( WORD *vectors, UWORD mirroring, UWORD cubecount)
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;  //xs = 256 * x / (z + 256) + xc
  custom->bltcon1 = 0x0;
  struct Cube *cube;
  //struct Cube cube[3];
      //vectors += 792*3;  

  UWORD bltsizereverse;
  UWORD bltfmask;
  for(UWORD i=0;i<cubecount;i++) 
  {

      
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);

    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    if( clearpos != 0 && DoNotClearDirty == 0) {      
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }
    WORD x0 = vectors[0];
    WORD y0 = vectors[1];
    WORD z0 = vectors[2];

    WORD x1 = vectors[3];
    WORD y1 = vectors[4];
    WORD z1 = vectors[5];
    
    WORD x2 = vectors[6];
    WORD y2 = vectors[7];
    WORD z2 = vectors[8];

    WORD x3 = vectors[9];
    WORD y3 = vectors[10];
    WORD z3 = vectors[11];
    
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;

    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;

    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;

    if( clearpos != 0 && DoNotClearDirty == 0) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 

    cube = (struct Cube *) &Cubes[i];
    struct Square *squares = cube->Squares;
    //Left Face
    WORD vfx2 = x0 - x2;
    WORD vfy2 = y0 - y2;
    WORD vfz2 = z0 - z2; 
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    squares[2].DotProduct = vf2dotprod;

    //Right Face
    WORD vfx3 = x2 - x0;
    WORD vfy3 = y2 - y0;
    WORD vfz3 = z2 - z0; 
    //int vf3dotprod = vfx3 * x0 + vfy3 * y0 + vfz3 * (z0 + DIST);
    int vf3dotprod = vf2dotprod * -1;

    squares[3].DotProduct = vf3dotprod;

    if( clearpos != 0 && DoNotClearDirty == 0) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      //clearpos += BPLSIZE;
    }

    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    

    //Top Face
    WORD vfx4 = x3 - x2;
    WORD vfy4 = y3 - y2;
    WORD vfz4 = z3 - z2;
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    squares[4].DotProduct = vf4dotprod;

    //Bottom Face
    WORD vfx5 = x2 - x3;
    WORD vfy5 = y2 - y3;
    WORD vfz5 = z2 - z3;
    //int vf5dotprod = vfx5 * x3 + vfy5 * y3 + vfz5 * (z3 + DIST);
    int vf5dotprod = vf4dotprod * -1;
    squares[5].DotProduct = vf5dotprod;

    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }

    squares[0].Vertices[0].X = xs2;
    squares[0].Vertices[0].Y = ys2;
    squares[0].Vertices[1].X = xs0;
    squares[0].Vertices[1].Y = ys0;
    squares[0].Vertices[2].X = xs1;
    squares[0].Vertices[2].Y = ys1;
    squares[0].Vertices[3].X = xs3;
    squares[0].Vertices[3].Y = ys3;

    WORD x4 = vectors[12];
    WORD y4 = vectors[13];
    WORD z4 = vectors[14];

    WORD x5 = vectors[15];
    WORD y5 = vectors[16];
    WORD z5 = vectors[17];

    WORD x6 = vectors[18];
    WORD y6 = vectors[19];
    WORD z6 = vectors[20];

    WORD x7 = vectors[21];
    WORD y7 = vectors[22];
    WORD z7 = vectors[23];

    WORD vfx0 = x6 - x2;
    WORD vfy0 = y6 - y2;
    WORD vfz0 = z6 - z2; 
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);

    //Back Face
    WORD vfx1 = x2 - x6;
    WORD vfy1 = y2 - y6;
    WORD vfz1 = z2 - z6; 
    //int vf1dotprod = vfx1 * x6 + vfy1 * y6 + vfz1 * (z6 + DIST);
    int vf1dotprod = vf0dotprod*-1;

    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;

    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;

    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }
        
    squares[0].DotProduct = vf0dotprod;
    squares[0].Color = 1;

    squares[1].Vertices[0].X = xs6;
    squares[1].Vertices[0].Y = ys6;
    squares[1].Vertices[1].X = xs7;
    squares[1].Vertices[1].Y = ys7;
    squares[1].Vertices[2].X = xs5;
    squares[1].Vertices[2].Y = ys5;
    squares[1].Vertices[3].X = xs4;
    squares[1].Vertices[3].Y = ys4;
    squares[1].DotProduct = vf1dotprod;
    squares[1].Color = 1;

    squares[2].Vertices[0].X = xs2;
    squares[2].Vertices[0].Y = ys2;
    squares[2].Vertices[1].X = xs3;
    squares[2].Vertices[1].Y = ys3;
    squares[2].Vertices[2].X = xs7;
    squares[2].Vertices[2].Y = ys7;
    squares[2].Vertices[3].X = xs6;
    squares[2].Vertices[3].Y = ys6;
    squares[2].DotProduct = vf2dotprod;
    squares[2].Color = 2;

    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    }

    squares[3].Vertices[0].X = xs0;
    squares[3].Vertices[0].Y = ys0;
    squares[3].Vertices[1].X = xs4;
    squares[3].Vertices[1].Y = ys4;
    squares[3].Vertices[2].X = xs5;
    squares[3].Vertices[2].Y = ys5;
    squares[3].Vertices[3].X = xs1;
    squares[3].Vertices[3].Y = ys1;
    squares[3].DotProduct = vf3dotprod;
    squares[3].Color = 2;

    squares[4].Vertices[0].X = xs6;
    squares[4].Vertices[0].Y = ys6;
    squares[4].Vertices[1].X = xs4;
    squares[4].Vertices[1].Y = ys4;
    squares[4].Vertices[2].X = xs0;
    squares[4].Vertices[2].Y = ys0;
    squares[4].Vertices[3].X = xs2;
    squares[4].Vertices[3].Y = ys2;
    squares[4].DotProduct = vf4dotprod;
    squares[4].Color = 3;

    squares[5].Vertices[0].X = xs7;
    squares[5].Vertices[0].Y = ys7;
    squares[5].Vertices[1].X = xs3;
    squares[5].Vertices[1].Y = ys3;
    squares[5].Vertices[2].X = xs1;
    squares[5].Vertices[2].Y = ys1;
    squares[5].Vertices[3].X = xs5;
    squares[5].Vertices[3].Y = ys5;
    squares[5].DotProduct = vf5dotprod;      
    squares[5].Color = 3; 

    vectors += 8*3;  
  }

  WORD minytotal = 256;
  WORD maxytotal = 0;

  for(UWORD i3=0;i3<cubecount;i3++) 
  {
    cube = (struct Cube *) &Cubes[i3];
    struct Square *squares = cube->Squares;

    WORD minycube = 256;
    WORD minxcube = 320;
    WORD maxlengthcube = 0;
    WORD maxheightcube = 0;
    WORD maxycube = 0;
    WORD maxxcube = 0;
    for(int i=0; i <= 5; i++)
    {
      if( squares[i].DotProduct > 0) {

        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);

        squares[i].Clockwise = cw;

        WORD yposmin = squares[i].Vertices[0].Y; 
        WORD yposmax = squares[i].Vertices[0].Y;
        WORD xposmin = squares[i].Vertices[0].X;
        WORD xposmax = squares[i].Vertices[0].X;
        
        for( int i2=1; i2 <= 3;i2++)
        {
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
        }

        squares[i].YPosMin = yposmin;
        squares[i].XPosMin = xposmin;
        squares[i].XLength = xposmax - xposmin;                
        squares[i].Height = yposmax - yposmin + 1;    

        if(yposmin < minycube) minycube = yposmin;
        if(xposmin < minxcube) minxcube = xposmin;
        if(yposmax > maxycube) maxycube = yposmax;
        if(xposmax > maxxcube) maxxcube = xposmax;


        maxlengthcube = maxxcube - minxcube + 1;
        maxheightcube = maxycube - minycube + 1;
      }
    }
    if(i3 == *CubeNrReversePtr) {
      bltsizereverse = (160 - minxcube) / 16 + 1;
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
      bltfmask = 0xffff << rshift;
    }

    maxheightcube+=1;

    if(minycube < 0) {      
      minycube = 0;
      if(maxycube < 0) {
        maxheightcube = 0;
      } else {
        maxheightcube = maxycube;
      }
    }else if(minycube > 256) {
      maxycube = 256;
      minycube = 256;
      maxheightcube = 0;
    } else if(maxycube > 256) {
      maxycube = 256;
      maxheightcube = 256 - 1 - minycube;
    }


    if(minycube < minytotal) minytotal = minycube;
    if(maxycube > maxytotal) maxytotal = maxycube;


    WORD bltwidth = (maxlengthcube/16)+2;
    if(maxheightcube > 1) {
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    } else {
      DrawBuffer->MyDirtyArea[i3].Address = 0;
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    }
   
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;

    for(UWORD i=0; i<=5; i++) {
      if( squares[i].DotProduct > 0) { 
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
         ///squares[i].XLength = squares[i].XLength / 16 + 2;
          DrawRect( &squares[i]);                  
        }
      }    
    }
  }
 
  if( mirroring == 1) {
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
  }
  
  DrawBuffer->minytotal = minytotal;
  DrawBuffer->maxytotal = maxytotal;


}

inline void SmartLineFill(UWORD startx, UWORD starty, WORD height, UWORD length, UWORD minterm,  UWORD bltwidth, UWORD bltstart) {
  
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  UWORD startyoffset = starty*64;
  WORD direction = 64;
  if( height < 0) {
    direction = -64;   
    startyoffset -= (height + 1) * 64;    
    height *= -1;
  }
  
  UWORD targetbufferoffset = bltstart + startyoffset;
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
  
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
  WORD bltdmod = direction - 2 * bltwidth;

  if( bltbmod < 0 ) {
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
  }  

  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait

  custom->bltcon0 = BltCon0LineDraw | minterm;

  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
  custom->bltbpt = (UBYTE *)bltbpt;
  custom->bltcpt = (UBYTE *)bltdpt;
  custom->bltdpt = (UBYTE *)bltdpt;  
  custom->bltbmod = bltbmod;
  custom->bltcmod = bltdmod;
  custom->bltdmod = bltdmod;

  custom->bltsize = bltwidth + 64*height;
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
    Vbint->is_Data = NULL;
    Vbint->is_Code = VblankHandler;
  }

  AddIntServer( INTB_VERTB, Vbint); 

  WorkingMem =  AllocMem( 25000, MEMF_ANY);

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
  if(Bitmap1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);

  ScreenBuffer1.BitPlane = Bitmap1;
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
  ScreenBuffer1.MyDirtyArea[1].Address = 0;

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
  if(Bitmap2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);

  ScreenBuffer2.BitPlane = Bitmap2;
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
  ScreenBuffer2.MyDirtyArea[1].Address = 0;

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
  if(Bitmap3 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);

  ScreenBuffer3.BitPlane = Bitmap3;
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
  ScreenBuffer3.MyDirtyArea[1].Address = 0;

  ViewCopper = Clbuild( );
  DrawCopper = Clbuild( );

  ScreenBufferList[0] = &ScreenBuffer1;
  ScreenBufferList[1] = &ScreenBuffer2;   
  ScreenBufferList[2] = &ScreenBuffer3;  

  ScreenBufferList[3] = &ScreenBuffer3;
  ScreenBufferList[4] = &ScreenBuffer1;
  ScreenBufferList[5] = &ScreenBuffer2;

  ScreenBufferList[6] = &ScreenBuffer2;
  ScreenBufferList[7] = &ScreenBuffer3;
  ScreenBufferList[8] = &ScreenBuffer1;

  SetBplPointers(); 
  SwapCl();

  //ptrvector = VectorsMercury1;  

  /*Utils_ReadFile(&"tek_cube_data.bin", VectorBuffer );
  Utils_ReadFile(&"tek_letter_data.bin", LetterBuffer);*/

  return 0;
}

void CleanUp() {
  FreeMem(WorkingMem, 25000);
  FreeMem(LineBuffer, 12*100*100);
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
  FreeMem(DrawCopper, ZMCPSIZE);
  FreeMem(ViewCopper, ZMCPSIZE);
  RemIntServer( INTB_VERTB, Vbint);
}


void LoadVectors( WORD *source, BYTE *source2, WORD *target)
{
  WORD *targetstart = target;

  while( *source != 127) {
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++;
    *target++ = *source++; 
  }
  
  WORD *base = targetstart;

  while( *source2 != 127) {  
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
    *target++ = *base++ + *source2++;
  }

}

void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
  
  if( retval == 0) {
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    Exit(1);
  }
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
  *cl++ = 0x000e00000;
  *cl++ = 0x000e20000;
  *cl++ = 0x000e40000;
  *cl++ = 0x000e60000;
  *cl++ = 0x000e80000;
  *cl++ = 0x000ea0000;
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
  }    

  *cl++ = 0xfffffffe;
  return retval;  
}

void SetBplPointers() {

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  

  ScreenBufferOffset += 3;
  if(ScreenBufferOffset >= 9) { 
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

}