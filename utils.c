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
#include "utils.h"
#include "import.h"

__attribute__((always_inline)) inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	

void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
{
  for( int i=0;i<lines; i++) {
    for( int i2=0;i2<linelength;i2++) 
      *target++ = pattern;
    target += mod;
  }
}

void Utils_BlitClear( UBYTE *Target, int lines, int linelength, UWORD mod, UWORD data)
{
  volatile struct Custom *custom = (struct Custom*)0xdff000; 
  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
  custom->bltcon0 = 0x01f0;
  custom->bltcon1 = 0x0;
  custom->bltadat = data;
  custom->bltdpt = Target;  
  custom->bltdmod = mod;
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
  custom->bltafwm = 0xffff; //Static
  custom->bltalwm = 0xffff; //Static
}
void Utils_DrawLinePrepare() {
    volatile struct Custom *custom = (struct Custom*)0xdff000;
    WaitBlit();
    custom->bltafwm = 0xffff; //Static
    custom->bltalwm = 0xffff; //Static
    custom->bltadat = 0x8000; //Static
    custom->bltbdat = 0xffff; //Line Pattern
    custom->bltcmod = 40; //Linesize in Bytes
    custom->bltdmod = 40; //Linesize in Bytes 
}

void Utils_CopyBlit(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer) {
  volatile struct Custom *custom = (struct Custom*)0xdff000;

  length = length / 16;
  length += 2;

  WaitBlit();
  //custom->bltafwm = 0xffff; //Static
  //custom->bltalwm = 0xffff; //Static
  custom->bltcon0 = 0x09fc;
  custom->bltcon1 = 0x0000;      

  UWORD yoffset = starty*64;
  UWORD xoffset = (startx / 16)*2;
  UWORD offset = yoffset+xoffset;
  ULONG bltapt = (ULONG) startbuffer + offset;
  ULONG bltdpt = (ULONG) targetbuffer + offset;
  custom->bltapt = (UBYTE *)bltapt;
  custom->bltdpt = (UBYTE *)bltdpt;  
  custom->bltamod = 64 - length*2;
  custom->bltdmod = 64 - length*2;
  custom->bltsize = length + 64*height;
}

//Word by Word Blit(s) which reverse the Source(s) and Blit it to the destionation (Horizontal Mirroring)
//Length is in Words
void Utils_CopyBlitReverse( UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *preparebuffer, UBYTE *targetbuffer, UWORD bltfmask) {
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait

  custom->bltafwm = 0xffff; //Show All
  custom->bltalwm = 0xffff; //Show All
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
  //custom->bltcon1 = 0x8002; //Descending
    //Move 1st Byte to bottom and 2nd Byte to top (Swap)
    //bltcdat contains mask for this to work
    //ABCD
    //0000 1 0 
    //0010 2 0
    //0100 4 0
    //0111 8 8 1st Byte = 8
    //1001 1 1
    //1010 2 0
    //1101 4 4
    //1111 8 8 2nd Byte = 13 = d
    //d8

  custom->bltamod = 60;
  custom->bltbmod = 60;
  custom->bltdmod = 60;    
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
  custom->bltcon1 = 0x8002; //Ascending

  UWORD bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  //Blit for every bitplane
  {        

    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    

    for(int i=0;i<length; i++) 
    //Position lesserprio byte as major prio
    {
      custom->bltapt = bltapos;
      custom->bltbpt = bltbpos;
      custom->bltdpt = bltdpos;
      custom->bltsize = 2 + height * 64;
      bltapos -= 2;
      bltbpos -= 2;
      bltdpos += 2; 
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	     (void)tst;
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    }

    bitplaneoffset += 64 * 256;

  }  

  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
  UWORD mod=64 - length*2-2;
  custom->bltamod = mod;
  custom->bltbmod = mod;
  custom->bltdmod = mod;

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
    custom->bltbpt = bltbpos;
    custom->bltdpt = bltdpos;
    custom->bltsize = length+1 + height * 64;

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x2dd8;
  custom->bltcon1 = 0xe002;
  custom->bltcdat = 0x3333;
  mod=64 -length*2-2;
  custom->bltamod = mod;
  custom->bltbmod = mod;
  custom->bltdmod = mod;

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
    custom->bltbpt = bltbpos;
    custom->bltdpt = bltdpos;
    custom->bltsize = length+1 + height * 64;

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x1dd8;
  custom->bltcon1 = 0xf002;
  custom->bltcdat = 0x5555;
  mod=64 -length*2-2;
  custom->bltamod = mod;
  custom->bltbmod = mod;
  custom->bltdmod = mod;

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
    custom->bltbpt = bltbpos;
    custom->bltdpt = bltdpos;
    custom->bltsize = length+1 + height * 64;

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x09f0;
  custom->bltcon1 = 0x0002;
  custom->bltcdat = 0x0;
  mod=64 -length*2;
  custom->bltamod = mod;  
  custom->bltdmod = mod;
  custom->bltafwm = bltfmask;

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;

    custom->bltapt = bltapos;
    custom->bltdpt = bltdpos;
    custom->bltsize = length + height * 64;

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltafwm = 0xffff;


}


void Utils_FillPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, WORD startfill) {

    volatile struct Custom *custom = (struct Custom*)0xdff000;

    UWORD bltcon1 = 0x0012;
    if(MouseLeft()) {
      bltcon1 = 0x0002;
    }
    if( startfill < 0) {
      bltcon1 += 4;
    }

    UWORD blitendoffset = (height-1)*64+length*2-2;
    UWORD yoffset = starty*64;
    UWORD offset = yoffset+startx+blitendoffset;
    ULONG bltapt = (ULONG) startbuffer + offset;
    ULONG bltdpt = (ULONG) targetbuffer + offset;

    WaitBlit();
    //custom->bltafwm = 0xffff; //Static
    //custom->bltalwm = 0xffff; //Static    
    
    custom->bltcon0 = 0x09f0;
    
    //if( MouseLeft()) {
    custom->bltcon1 = bltcon1;         
    /*} else {
      custom->bltcon1 = 0x0002;   
    }  */


    //UWORD xoffset = (startx / 16)*2;
    custom->bltapt = (UBYTE *)bltapt;
    custom->bltdpt = (UBYTE *)bltdpt;  
    custom->bltamod = 64 - length*2;
    custom->bltdmod = 64 - length*2;
    custom->bltsize = length + 64*height;
}

void Utils_CopyPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, UWORD minterms, UWORD color) {

  volatile struct Custom *custom = (struct Custom*)0xdff000;

  /*length = length / 16;
  length += 2;*/

  UWORD yoffset = starty*64;

  UWORD tmp = (startx/16)*2;
  UWORD offset = yoffset+tmp;//+blitendoffset;
  ULONG bltapt = (ULONG) startbuffer + offset;
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
  ULONG bltsize = length + height*64;

  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
  //custom->bltafwm = 0xffff; //Static
  //custom->bltalwm = 0xffff; //Static  
  //custom->bltcon1 = 0x0000;      
  custom->bltamod = 64 - length*2;
  custom->bltbmod = 64 - length*2;
  custom->bltdmod = 64 - length*2;  

  UWORD bit;
  UWORD planes;
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
  {
    bit = 1;
    planes = 1; //Only Plane 3 to write to
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
  }
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
  {
    bit = 0;
    planes = 1; //Only Plane 3 to write to
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
  }
  else {
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
  }

  for(UWORD i = 0;i<planes;i++) 
  {    
    if( planes > 1) {
      bit = color & 1;
      color = color >> 1;
    }
    if( bit == 1) {
      minterms = 0xcf;
    } else {
      minterms = 0xc0;
    }    
    custom->bltcon0 = 0x0d00 | minterms;
    custom->bltapt = (UBYTE *)bltapt;
    custom->bltbpt = (UBYTE *)bltdpt;
    custom->bltdpt = (UBYTE *)bltdpt;
    custom->bltsize = bltsize;
    bltdpt += 64*256;
    //WaitBlit();
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    (void)tst;
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
  }

}


//Draw Line on Lowres Screen
void Utils_DrawLine(int x1, int y1, int x2, int y2, UBYTE *Buffer, UWORD minterms)
{
    if(y2<y1) {
      int tmp = y2;
      y2 = y1;
      y1 = tmp;
      tmp = x2;
      x2 = x1;
      x1 = tmp;
    }

    volatile struct Custom *custom = (struct Custom*)0xdff000;

    UWORD xnegative = 0;
    UWORD ynegative = 0;

    UWORD bltcon1 = 0x3; //LineDrawBit Single Pixel
    WORD deltax = x2 - x1;
    WORD deltay = y2 - y1;

    if(deltax < 0) {
      xnegative = 1;
      deltax *= -1;
    }
    if(deltay < 0) {
      ynegative = 1;
      deltay *= -1;
    }

    if( deltay <= deltax) {
      //Set SUD Flag if major direction is x
      bltcon1 |= 0x0010;
    } else {
      //Swap DeltaX and Deltay to make y the minor direction no matter the true direction
      WORD tmp = deltax;
      deltax = deltay;
      deltay = tmp;
      WORD tmp2 = xnegative;
      xnegative = ynegative;
      ynegative = tmp2; 
    }

    if(ynegative == 1) bltcon1 |= 0x0008; //Set the Sometime up or left flag if minor dir is negative
    if(xnegative == 1) bltcon1 |= 0x0004; //Set the always up or left flag if major dir is negative
    

    //Initialize Accumulators
    WORD initvalue = 4 * deltay - 2 * deltax;
    if(initvalue < 0)
    {      
      bltcon1 |= 0x0040; //Negative Sign Bit
    }  

    
    UWORD omitfirstpixel = 10;   

    UWORD bltcon0 = ((x1 & 0xf) << 12) + 0xb00 + minterms;
    ULONG bltcpt = (ULONG) Buffer+y1*64+(x1>>4)*2;
    ULONG bltdpt = (ULONG) Buffer+y1*64+(x1>>4)*2;
    WORD bltbmod = 4 * deltay;    WORD bltamod = 4 * (deltay - deltax);
    UWORD bltsize = 2 + 64*(deltax+1);

    //custom->color[0] = 0x0ff0;
    UWORD btst = custom->dmaconr & 0x0040;
    while( (custom->dmaconr & 0x4000) == 0x4000 ) {
    }
    //custom->color[0] = 0x000f;

    custom->bltcpt = (void *) bltcpt; //Startword
    custom->bltdpt = (void *) bltdpt; //Startword
    custom->bltapt =  initvalue; //Init Accumulator
    custom->bltcon0 = bltcon0;
    custom->bltcon1 = bltcon1; 
    custom->bltbmod = bltbmod;
    custom->bltamod = bltamod;
    custom->bltsize = bltsize;

}


//Draw Point in Lowres
void Utils_DrawPoint(UWORD x1, UWORD y1, UBYTE *buffer) {
  UWORD xwidthword = x1 >> 4;
  UWORD xwidthrest = x1 - (xwidthword << 4);
  UWORD wordvalue = 0x8000 >> (xwidthrest -1);  
  UWORD *destword = (UWORD *) buffer + y1 * 20 + xwidthword;  
  wordvalue = wordvalue | *destword;
  *destword = wordvalue;
}

void Utils_ReadFile( char *filename, UWORD *target) {
  BPTR *fh;
  UBYTE *buffer;  
  fh = Open( filename, MODE_OLDFILE);
  UWORD length = Read( fh, target, 100000);
  Close( fh);
}