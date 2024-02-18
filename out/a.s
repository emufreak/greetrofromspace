
out\a.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	       subq.l #8,sp
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       2:	       move.l #253952,d0
       8:	       subi.l #253952,d0
       e:	       asr.l #2,d0
      10:	       move.l d0,(sp)
	for (i = 0; i < count; i++)
      12:	       clr.l 4(sp)
      16:	   /-- bra.s 32 <_start+0x32>
		__preinit_array_start[i]();
      18:	/--|-> move.l 4(sp),d0
      1c:	|  |   add.l d0,d0
      1e:	|  |   movea.l d0,a1
      20:	|  |   adda.l d0,a1
      22:	|  |   lea 3e000 <LookupSlope.lto_priv.0>,a0
      28:	|  |   movea.l (0,a1,a0.l),a0
      2c:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2e:	|  |   addq.l #1,4(sp)
      32:	|  \-> move.l 4(sp),d0
      36:	|      cmp.l (sp),d0
      38:	\----- bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	       move.l #253952,d0
      40:	       subi.l #253952,d0
      46:	       asr.l #2,d0
      48:	       move.l d0,(sp)
	for (i = 0; i < count; i++)
      4a:	       clr.l 4(sp)
      4e:	   /-- bra.s 6a <_start+0x6a>
		__init_array_start[i]();
      50:	/--|-> move.l 4(sp),d0
      54:	|  |   add.l d0,d0
      56:	|  |   movea.l d0,a1
      58:	|  |   adda.l d0,a1
      5a:	|  |   lea 3e000 <LookupSlope.lto_priv.0>,a0
      60:	|  |   movea.l (0,a1,a0.l),a0
      64:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      66:	|  |   addq.l #1,4(sp)
      6a:	|  \-> move.l 4(sp),d0
      6e:	|      cmp.l (sp),d0
      70:	\----- bcs.s 50 <_start+0x50>

	main();
      72:	       jsr 1172 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	       move.l #253952,d0
      7e:	       subi.l #253952,d0
      84:	       asr.l #2,d0
      86:	       move.l d0,(sp)
	for (i = count; i > 0; i--)
      88:	       move.l (sp),4(sp)
      8c:	   /-- bra.s aa <_start+0xaa>
		__fini_array_start[i - 1]();
      8e:	/--|-> move.l 4(sp),d0
      92:	|  |   subq.l #1,d0
      94:	|  |   add.l d0,d0
      96:	|  |   movea.l d0,a1
      98:	|  |   adda.l d0,a1
      9a:	|  |   lea 3e000 <LookupSlope.lto_priv.0>,a0
      a0:	|  |   movea.l (0,a1,a0.l),a0
      a4:	|  |   jsr (a0)
	for (i = count; i > 0; i--)
      a6:	|  |   subq.l #1,4(sp)
      aa:	|  \-> tst.l 4(sp)
      ae:	\----- bne.s 8e <_start+0x8e>
}
      b0:	       nop
      b2:	       nop
      b4:	       addq.l #8,sp
      b6:	       rts

000000b8 <Utils_FillLong>:
#include "import.h"

__attribute__((always_inline)) inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	

void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
{
      b8:	             subq.l #8,sp
  for( int i=0;i<lines; i++) {
      ba:	             clr.l 4(sp)
      be:	   /-------- bra.s f0 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
      c0:	/--|-------> clr.l (sp)
      c2:	|  |     /-- bra.s d8 <Utils_FillLong+0x20>
      *target++ = pattern;
      c4:	|  |  /--|-> move.l 12(sp),d0
      c8:	|  |  |  |   move.l d0,d1
      ca:	|  |  |  |   addq.l #4,d1
      cc:	|  |  |  |   move.l d1,12(sp)
      d0:	|  |  |  |   movea.l d0,a0
      d2:	|  |  |  |   move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
      d6:	|  |  |  |   addq.l #1,(sp)
      d8:	|  |  |  \-> move.l (sp),d0
      da:	|  |  |      cmp.l 24(sp),d0
      de:	|  |  \----- blt.s c4 <Utils_FillLong+0xc>
    target += mod;
      e0:	|  |         move.l 28(sp),d0
      e4:	|  |         add.l d0,d0
      e6:	|  |         add.l d0,d0
      e8:	|  |         add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
      ec:	|  |         addq.l #1,4(sp)
      f0:	|  \-------> move.l 4(sp),d1
      f4:	|            cmp.l 20(sp),d1
      f8:	\----------- blt.s c0 <Utils_FillLong+0x8>
  }
}
      fa:	             nop
      fc:	             nop
      fe:	             addq.l #8,sp
     100:	             rts

00000102 <Utils_BlitClear>:

void Utils_BlitClear( UBYTE *Target, int lines, int linelength, UWORD mod, UWORD data)
{
     102:	    lea -12(sp),sp
     106:	    move.l 28(sp),d1
     10a:	    move.l 32(sp),d0
     10e:	    move.w d1,d1
     110:	    move.w d1,4(sp)
     114:	    move.w d0,d0
     116:	    move.w d0,2(sp)
  volatile struct Custom *custom = (struct Custom*)0xdff000; 
     11a:	    move.l #14675968,8(sp)
  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     122:	    movea.l 8(sp),a0
     126:	    move.w 2(a0),6(sp)
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     12c:	    nop
     12e:	/-> movea.l 8(sp),a0
     132:	|   move.w 2(a0),d0
     136:	|   move.w d0,d0
     138:	|   andi.l #65535,d0
     13e:	|   andi.l #16384,d0
     144:	\-- bne.s 12e <Utils_BlitClear+0x2c>
  custom->bltcon0 = 0x01f0;
     146:	    movea.l 8(sp),a0
     14a:	    move.w #496,64(a0)
  custom->bltcon1 = 0x0;
     150:	    movea.l 8(sp),a0
     154:	    move.w #0,66(a0)
  custom->bltadat = data;
     15a:	    movea.l 8(sp),a0
     15e:	    move.w 2(sp),116(a0)
  custom->bltdpt = Target;  
     164:	    movea.l 8(sp),a0
     168:	    move.l 16(sp),84(a0)
  custom->bltdmod = mod;
     16e:	    movea.l 8(sp),a0
     172:	    move.w 4(sp),102(a0)
  custom->bltsize = lines*64+linelength;
     178:	    move.l 20(sp),d0
     17c:	    lsl.w #6,d0
     17e:	    move.l 24(sp),d1
     182:	    add.w d1,d0
     184:	    movea.l 8(sp),a0
     188:	    move.w d0,88(a0)
}
     18c:	    nop
     18e:	    lea 12(sp),sp
     192:	    rts

00000194 <Utils_BlitterPrepare>:

void Utils_BlitterPrepare() {
     194:	subq.l #4,sp
     196:	move.l a6,-(sp)
  volatile struct Custom *custom = (struct Custom*)0xdff000;
     198:	move.l #14675968,4(sp)
  WaitBlit();
     1a0:	move.l 96d6e <GfxBase>,d0
     1a6:	movea.l d0,a6
     1a8:	jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     1ac:	movea.l 4(sp),a0
     1b0:	move.w #-1,68(a0)
  custom->bltalwm = 0xffff; //Static
     1b6:	movea.l 4(sp),a0
     1ba:	move.w #-1,70(a0)
}
     1c0:	nop
     1c2:	movea.l (sp)+,a6
     1c4:	addq.l #4,sp
     1c6:	rts

000001c8 <Utils_DrawLinePrepare>:
void Utils_DrawLinePrepare() {
     1c8:	subq.l #4,sp
     1ca:	move.l a6,-(sp)
    volatile struct Custom *custom = (struct Custom*)0xdff000;
     1cc:	move.l #14675968,4(sp)
    WaitBlit();
     1d4:	move.l 96d6e <GfxBase>,d0
     1da:	movea.l d0,a6
     1dc:	jsr -228(a6)
    custom->bltafwm = 0xffff; //Static
     1e0:	movea.l 4(sp),a0
     1e4:	move.w #-1,68(a0)
    custom->bltalwm = 0xffff; //Static
     1ea:	movea.l 4(sp),a0
     1ee:	move.w #-1,70(a0)
    custom->bltadat = 0x8000; //Static
     1f4:	movea.l 4(sp),a0
     1f8:	move.w #-32768,116(a0)
    custom->bltbdat = 0xffff; //Line Pattern
     1fe:	movea.l 4(sp),a0
     202:	move.w #-1,114(a0)
    custom->bltcmod = 40; //Linesize in Bytes
     208:	movea.l 4(sp),a0
     20c:	move.w #40,96(a0)
    custom->bltdmod = 40; //Linesize in Bytes 
     212:	movea.l 4(sp),a0
     216:	move.w #40,102(a0)
}
     21c:	nop
     21e:	movea.l (sp)+,a6
     220:	addq.l #4,sp
     222:	rts

00000224 <Utils_CopyBlit>:

void Utils_CopyBlit(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer) {
     224:	movem.l d2-d5/a6,-(sp)
     228:	move.l 24(sp),d2
     22c:	move.l 28(sp),d5
     230:	move.l 32(sp),d4
  volatile struct Custom *custom = (struct Custom*)0xdff000;

  length = length / 16;
     234:	move.l 36(sp),d3
     238:	lsr.w #4,d3
  length += 2;
     23a:	addq.w #2,d3

  WaitBlit();
     23c:	movea.l 96d6e <GfxBase>,a6
     242:	jsr -228(a6)
  //custom->bltafwm = 0xffff; //Static
  //custom->bltalwm = 0xffff; //Static
  custom->bltcon0 = 0x09fc;
     246:	move.w #2556,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0x0000;      
     24e:	move.w #0,dff042 <_end+0xd67e0e>

  UWORD yoffset = starty*64;
  UWORD xoffset = (startx / 16)*2;
     256:	lsr.w #4,d2
     258:	move.w d2,d0
     25a:	add.w d2,d0
  UWORD yoffset = starty*64;
     25c:	lsl.w #6,d5
  UWORD offset = yoffset+xoffset;
     25e:	add.w d5,d0
  ULONG bltapt = (ULONG) startbuffer + offset;
     260:	andi.l #65535,d0
     266:	move.l 40(sp),d1
     26a:	add.l d0,d1
  ULONG bltdpt = (ULONG) targetbuffer + offset;
  custom->bltapt = (UBYTE *)bltapt;
     26c:	move.l d1,dff050 <_end+0xd67e1c>
  ULONG bltdpt = (ULONG) targetbuffer + offset;
     272:	add.l 44(sp),d0
  custom->bltdpt = (UBYTE *)bltdpt;  
     276:	move.l d0,dff054 <_end+0xd67e20>
  custom->bltamod = 64 - length*2;
     27c:	moveq #32,d0
     27e:	sub.w d3,d0
     280:	lsl.w #1,d0
     282:	move.w d0,dff064 <_end+0xd67e30>
  custom->bltdmod = 64 - length*2;
     288:	move.w d0,dff066 <_end+0xd67e32>
  custom->bltsize = length + 64*height;
     28e:	lsl.w #6,d4
     290:	add.w d4,d3
     292:	move.w d3,dff058 <_end+0xd67e24>
}
     298:	movem.l (sp)+,d2-d5/a6
     29c:	rts

0000029e <Utils_CopyBlitReverse>:

//Word by Word Blit(s) which reverse the Source(s) and Blit it to the destionation (Horizontal Mirroring)
//Length is in Words
void Utils_CopyBlitReverse( UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *preparebuffer, UBYTE *targetbuffer, UWORD bltfmask) {
     29e:	          lea -16(sp),sp
     2a2:	          movem.l d2-d7/a2-a6,-(sp)
     2a6:	          move.l 64(sp),d7
     2aa:	          move.l 68(sp),d5
     2ae:	          movea.l 72(sp),a4
     2b2:	          movea.l 76(sp),a2
     2b6:	          move.l 84(sp),56(sp)
     2bc:	          move.w d5,46(sp)
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     2c0:	          move.w dff002 <_end+0xd67dce>,d0
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     2c6:	      /-> move.w dff002 <_end+0xd67dce>,d0
     2cc:	      |   btst #14,d0
     2d0:	      \-- bne.s 2c6 <Utils_CopyBlitReverse+0x28>

  custom->bltafwm = 0xffff; //Show All
     2d2:	          move.w #-1,dff044 <_end+0xd67e10>
  custom->bltalwm = 0xffff; //Show All
     2da:	          move.w #-1,dff046 <_end+0xd67e12>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
     2e2:	          move.w #255,dff070 <_end+0xd67e3c>
    //1010 2 0
    //1101 4 4
    //1111 8 8 2nd Byte = 13 = d
    //d8

  custom->bltamod = 60;
     2ea:	          move.w #60,dff064 <_end+0xd67e30>
  custom->bltbmod = 60;
     2f2:	          move.w #60,dff062 <_end+0xd67e2e>
  custom->bltdmod = 60;    
     2fa:	          move.w #60,dff066 <_end+0xd67e32>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
     302:	          move.w #-29224,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0x8002; //Ascending
     30a:	          move.w #-32766,dff042 <_end+0xd67e0e>
  UWORD bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  //Blit for every bitplane
  {        

    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
     312:	          moveq #0,d4
     314:	          move.w d7,d4
     316:	          move.l d4,d0
     318:	          subq.l #1,d0
     31a:	          lsl.l #6,d0
     31c:	          move.l d0,52(sp)
    //Position lesserprio byte as major prio
    {
      custom->bltapt = bltapos;
      custom->bltbpt = bltbpos;
      custom->bltdpt = bltdpos;
      custom->bltsize = 2 + height * 64;
     320:	          lsl.w #6,d7
     322:	          move.w d7,d3
     324:	          addq.w #2,d3
    for(int i=0;i<length; i++) 
     326:	          moveq #0,d6
     328:	          move.w d5,d6
     32a:	          lsl.l #6,d4
     32c:	          move.l d6,d0
     32e:	          add.l d6,d0
     330:	          movea.w #2,a3
     334:	          lea -44(a4),a0
     338:	          move.l a0,48(sp)
     33c:	          lea -46(a4),a4
     340:	          lea -62(a2),a5
     344:	          lea (-62,a2,d0.l),a6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
     348:	          movea.l 48(sp),a0
     34c:	          adda.l d4,a0
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
     34e:	          lea (0,a4,d4.l),a1
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
     352:	          move.l a5,d1
     354:	          add.l d4,d1
    for(int i=0;i<length; i++) 
     356:	          move.l a6,d2
     358:	          add.l d4,d2
     35a:	          tst.w 46(sp)
     35e:	/-------- beq.s 394 <Utils_CopyBlitReverse+0xf6>
      custom->bltapt = bltapos;
     360:	|  /----> move.l a0,dff050 <_end+0xd67e1c>
      custom->bltbpt = bltbpos;
     366:	|  |      move.l a1,dff04c <_end+0xd67e18>
      custom->bltdpt = bltdpos;
     36c:	|  |      move.l d1,dff054 <_end+0xd67e20>
      custom->bltsize = 2 + height * 64;
     372:	|  |      move.w d3,dff058 <_end+0xd67e24>
      bltapos -= 2;
     378:	|  |      subq.l #2,a0
      bltbpos -= 2;
     37a:	|  |      subq.l #2,a1
      bltdpos += 2; 
     37c:	|  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     37e:	|  |      move.w dff002 <_end+0xd67dce>,d0
	     (void)tst;
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     384:	|  |  /-> move.w dff002 <_end+0xd67dce>,d0
     38a:	|  |  |   btst #14,d0
     38e:	|  |  \-- bne.s 384 <Utils_CopyBlitReverse+0xe6>
    for(int i=0;i<length; i++) 
     390:	|  |      cmp.l d1,d2
     392:	|  +----- bne.s 360 <Utils_CopyBlitReverse+0xc2>
  for(int i2=0;i2<2;i2++)
     394:	>--|----> addi.l #16384,d4
     39a:	|  |      moveq #1,d0
     39c:	|  |      cmp.l a3,d0
     39e:	|  |  /-- beq.s 3be <Utils_CopyBlitReverse+0x120>
     3a0:	|  |  |   movea.w #1,a3
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
     3a4:	|  |  |   movea.l 48(sp),a0
     3a8:	|  |  |   adda.l d4,a0
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
     3aa:	|  |  |   lea (0,a4,d4.l),a1
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
     3ae:	|  |  |   move.l a5,d1
     3b0:	|  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
     3b2:	|  |  |   move.l a6,d2
     3b4:	|  |  |   add.l d4,d2
     3b6:	|  |  |   tst.w 46(sp)
     3ba:	|  \--|-- bne.s 360 <Utils_CopyBlitReverse+0xc2>
     3bc:	\-----|-- bra.s 394 <Utils_CopyBlitReverse+0xf6>

    bitplaneoffset += 64 * 256;

  }  

  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
     3be:	      \-> move.w #19928,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
     3c6:	          move.w #-16382,dff042 <_end+0xd67e0e>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
     3ce:	          move.w #3855,dff070 <_end+0xd67e3c>
  UWORD mod=64 - length*2-2;
     3d6:	          moveq #31,d1
     3d8:	          sub.l d6,d1
     3da:	          add.w d1,d1
  custom->bltamod = mod;
     3dc:	          move.w d1,dff064 <_end+0xd67e30>
  custom->bltbmod = mod;
     3e2:	          move.w d1,dff062 <_end+0xd67e2e>
  custom->bltdmod = mod;
     3e8:	          move.w d1,dff066 <_end+0xd67e32>

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
     3ee:	          move.l d6,d0
     3f0:	          add.l d6,d0
     3f2:	          movea.l d0,a0
     3f4:	          adda.l 52(sp),a0
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
    custom->bltbpt = bltbpos;
    custom->bltdpt = bltdpos;
    custom->bltsize = length+1 + height * 64;
     3f8:	          add.w d7,d5
     3fa:	          movea.w d5,a1
     3fc:	          addq.w #1,a1
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
     3fe:	          lea (0,a2,a0.l),a3
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
     402:	          move.l a0,d3
     404:	          subq.l #2,d3
     406:	          move.l a2,d4
     408:	          add.l d3,d4
    custom->bltapt = bltapos;
     40a:	          move.l a3,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     410:	          move.l d4,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     416:	          move.l a3,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     41c:	          move.w a1,dff058 <_end+0xd67e24>

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     422:	          move.w dff002 <_end+0xd67dce>,d0
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     428:	      /-> move.w dff002 <_end+0xd67dce>,d0
     42e:	      |   btst #14,d0
     432:	      \-- bne.s 428 <Utils_CopyBlitReverse+0x18a>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
     434:	          move.l a0,d0
     436:	          addi.l #16384,d0
     43c:	          move.l a2,d2
     43e:	          add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
     440:	          lea 16382(a0),a0
     444:	          move.l a2,d7
     446:	          add.l a0,d7
    custom->bltapt = bltapos;
     448:	          move.l d2,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     44e:	          move.l d7,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     454:	          move.l d2,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     45a:	          move.w a1,dff058 <_end+0xd67e24>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     460:	          move.w dff002 <_end+0xd67dce>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     466:	      /-> move.w dff002 <_end+0xd67dce>,d0
     46c:	      |   btst #14,d0
     470:	      \-- bne.s 466 <Utils_CopyBlitReverse+0x1c8>
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x2dd8;
     472:	          move.w #11736,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0xe002;
     47a:	          move.w #-8190,dff042 <_end+0xd67e0e>
  custom->bltcdat = 0x3333;
     482:	          move.w #13107,dff070 <_end+0xd67e3c>
  mod=64 -length*2-2;
  custom->bltamod = mod;
     48a:	          move.w d1,dff064 <_end+0xd67e30>
  custom->bltbmod = mod;
     490:	          move.w d1,dff062 <_end+0xd67e2e>
  custom->bltdmod = mod;
     496:	          move.w d1,dff066 <_end+0xd67e32>
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
     49c:	          move.l a3,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     4a2:	          move.l d4,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     4a8:	          move.l a3,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     4ae:	          move.w a1,dff058 <_end+0xd67e24>

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     4b4:	          move.w dff002 <_end+0xd67dce>,d0
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     4ba:	      /-> move.w dff002 <_end+0xd67dce>,d0
     4c0:	      |   btst #14,d0
     4c4:	      \-- bne.s 4ba <Utils_CopyBlitReverse+0x21c>
    custom->bltapt = bltapos;
     4c6:	          move.l d2,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     4cc:	          move.l d7,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     4d2:	          move.l d2,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     4d8:	          move.w a1,dff058 <_end+0xd67e24>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     4de:	          move.w dff002 <_end+0xd67dce>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     4e4:	      /-> move.w dff002 <_end+0xd67dce>,d0
     4ea:	      |   btst #14,d0
     4ee:	      \-- bne.s 4e4 <Utils_CopyBlitReverse+0x246>
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x1dd8;
     4f0:	          move.w #7640,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0xf002;
     4f8:	          move.w #-4094,dff042 <_end+0xd67e0e>
  custom->bltcdat = 0x5555;
     500:	          move.w #21845,dff070 <_end+0xd67e3c>
  mod=64 -length*2-2;
  custom->bltamod = mod;
     508:	          move.w d1,dff064 <_end+0xd67e30>
  custom->bltbmod = mod;
     50e:	          move.w d1,dff062 <_end+0xd67e2e>
  custom->bltdmod = mod;
     514:	          move.w d1,dff066 <_end+0xd67e32>
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    UBYTE *bltdpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;

    custom->bltapt = bltapos;
     51a:	          move.l a3,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     520:	          move.l d4,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     526:	          move.l a3,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     52c:	          move.w a1,dff058 <_end+0xd67e24>

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     532:	          move.w dff002 <_end+0xd67dce>,d0
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     538:	      /-> move.w dff002 <_end+0xd67dce>,d0
     53e:	      |   btst #14,d0
     542:	      \-- bne.s 538 <Utils_CopyBlitReverse+0x29a>
    custom->bltapt = bltapos;
     544:	          move.l d2,dff050 <_end+0xd67e1c>
    custom->bltbpt = bltbpos;
     54a:	          move.l d7,dff04c <_end+0xd67e18>
    custom->bltdpt = bltdpos;
     550:	          move.l d2,dff054 <_end+0xd67e20>
    custom->bltsize = length+1 + height * 64;
     556:	          move.w a1,dff058 <_end+0xd67e24>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     55c:	          move.w dff002 <_end+0xd67dce>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     562:	      /-> move.w dff002 <_end+0xd67dce>,d0
     568:	      |   btst #14,d0
     56c:	      \-- bne.s 562 <Utils_CopyBlitReverse+0x2c4>
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltcon0 = 0x09f0;
     56e:	          move.w #2544,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0x0002;
     576:	          move.w #2,dff042 <_end+0xd67e0e>
  custom->bltcdat = 0x0;
     57e:	          move.w #0,dff070 <_end+0xd67e3c>
  mod=64 -length*2;
     586:	          moveq #32,d0
     588:	          sub.l d6,d0
     58a:	          add.w d0,d0
  custom->bltamod = mod;  
     58c:	          move.w d0,dff064 <_end+0xd67e30>
  custom->bltdmod = mod;
     592:	          move.w d0,dff066 <_end+0xd67e32>
  custom->bltafwm = bltfmask;
     598:	          move.w 58(sp),dff044 <_end+0xd67e10>

  bitplaneoffset = 0;
  for(int i2=0;i2<2;i2++)
  {
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
     5a0:	          add.l 80(sp),d3

    custom->bltapt = bltapos;
     5a4:	          move.l d4,dff050 <_end+0xd67e1c>
    custom->bltdpt = bltdpos;
     5aa:	          move.l d3,dff054 <_end+0xd67e20>
    custom->bltsize = length + height * 64;
     5b0:	          move.w d5,dff058 <_end+0xd67e24>

    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     5b6:	          move.w dff002 <_end+0xd67dce>,d0
	  (void)tst;
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     5bc:	      /-> move.w dff002 <_end+0xd67dce>,d0
     5c2:	      |   btst #14,d0
     5c6:	      \-- bne.s 5bc <Utils_CopyBlitReverse+0x31e>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
     5c8:	          adda.l a0,a2
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
     5ca:	          move.l 80(sp),d0
     5ce:	          add.l a0,d0
    custom->bltapt = bltapos;
     5d0:	          move.l a2,dff050 <_end+0xd67e1c>
    custom->bltdpt = bltdpos;
     5d6:	          move.l d0,dff054 <_end+0xd67e20>
    custom->bltsize = length + height * 64;
     5dc:	          move.w d5,dff058 <_end+0xd67e24>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     5e2:	          move.w dff002 <_end+0xd67dce>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
     5e8:	      /-> move.w dff002 <_end+0xd67dce>,d0
     5ee:	      |   btst #14,d0
     5f2:	      \-- bne.s 5e8 <Utils_CopyBlitReverse+0x34a>
      
    bitplaneoffset += 64 * 256;

  }

  custom->bltafwm = 0xffff;
     5f4:	          move.w #-1,dff044 <_end+0xd67e10>


}
     5fc:	          movem.l (sp)+,d2-d7/a2-a6
     600:	          lea 16(sp),sp
     604:	          rts

00000606 <Utils_FillPolygon>:


void Utils_FillPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, WORD startfill) {
     606:	    lea -32(sp),sp
     60a:	    move.l a6,-(sp)
     60c:	    move.l d2,-(sp)
     60e:	    move.l 44(sp),d2
     612:	    movea.l 48(sp),a1
     616:	    movea.l 52(sp),a0
     61a:	    move.l 56(sp),d1
     61e:	    move.l 68(sp),d0
     622:	    move.w d2,d2
     624:	    move.w d2,18(sp)
     628:	    movea.w a1,a1
     62a:	    move.w a1,16(sp)
     62e:	    movea.w a0,a0
     630:	    move.w a0,14(sp)
     634:	    move.w d1,d1
     636:	    move.w d1,12(sp)
     63a:	    move.w d0,d0
     63c:	    move.w d0,10(sp)

    volatile struct Custom *custom = (struct Custom*)0xdff000;
     640:	    move.l #14675968,34(sp)

    UWORD bltcon1 = 0x0012;
     648:	    move.w #18,38(sp)
__attribute__((always_inline)) inline short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     64e:	    movea.l #12574721,a0
     654:	    move.b (a0),d0
     656:	    move.b d0,d0
     658:	    andi.l #255,d0
     65e:	    moveq #64,d1
     660:	    and.l d1,d0
     662:	    seq d0
     664:	    neg.b d0
     666:	    move.b d0,d0
     668:	    andi.w #255,d0
    if(MouseLeft()) {
     66c:	/-- beq.s 674 <Utils_FillPolygon+0x6e>
      bltcon1 = 0x0002;
     66e:	|   move.w #2,38(sp)
    }
    if( startfill < 0) {
     674:	\-> tst.w 10(sp)
     678:	/-- bge.s 67e <Utils_FillPolygon+0x78>
      bltcon1 += 4;
     67a:	|   addq.w #4,38(sp)
    }

    UWORD blitendoffset = (height-1)*64+length*2-2;
     67e:	\-> moveq #0,d0
     680:	    move.w 14(sp),d0
     684:	    subq.l #1,d0
     686:	    move.l d0,d1
     688:	    lsl.l #5,d1
     68a:	    moveq #0,d0
     68c:	    move.w 12(sp),d0
     690:	    add.l d1,d0
     692:	    subq.l #1,d0
     694:	    move.l d0,d0
     696:	    add.w d0,d0
     698:	    move.w d0,32(sp)
    UWORD yoffset = starty*64;
     69c:	    move.w 16(sp),d0
     6a0:	    lsl.w #6,d0
     6a2:	    move.w d0,30(sp)
    UWORD offset = yoffset+startx+blitendoffset;
     6a6:	    move.w 30(sp),d0
     6aa:	    add.w 18(sp),d0
     6ae:	    move.w 32(sp),d2
     6b2:	    add.w d0,d2
     6b4:	    move.w d2,28(sp)
    ULONG bltapt = (ULONG) startbuffer + offset;
     6b8:	    moveq #0,d0
     6ba:	    move.w 28(sp),d0
     6be:	    move.l 60(sp),d1
     6c2:	    move.l d0,d2
     6c4:	    add.l d1,d2
     6c6:	    move.l d2,24(sp)
    ULONG bltdpt = (ULONG) targetbuffer + offset;
     6ca:	    moveq #0,d0
     6cc:	    move.w 28(sp),d0
     6d0:	    move.l 64(sp),d1
     6d4:	    move.l d0,d2
     6d6:	    add.l d1,d2
     6d8:	    move.l d2,20(sp)

    WaitBlit();
     6dc:	    move.l 96d6e <GfxBase>,d0
     6e2:	    movea.l d0,a6
     6e4:	    jsr -228(a6)
    //custom->bltafwm = 0xffff; //Static
    //custom->bltalwm = 0xffff; //Static    
    
    custom->bltcon0 = 0x09f0;
     6e8:	    movea.l 34(sp),a0
     6ec:	    move.w #2544,64(a0)
    
    //if( MouseLeft()) {
    custom->bltcon1 = bltcon1;         
     6f2:	    movea.l 34(sp),a0
     6f6:	    move.w 38(sp),66(a0)
      custom->bltcon1 = 0x0002;   
    }  */


    //UWORD xoffset = (startx / 16)*2;
    custom->bltapt = (UBYTE *)bltapt;
     6fc:	    move.l 24(sp),d0
     700:	    movea.l 34(sp),a0
     704:	    move.l d0,80(a0)
    custom->bltdpt = (UBYTE *)bltdpt;  
     708:	    move.l 20(sp),d0
     70c:	    movea.l 34(sp),a0
     710:	    move.l d0,84(a0)
    custom->bltamod = 64 - length*2;
     714:	    moveq #0,d0
     716:	    move.w 12(sp),d0
     71a:	    moveq #32,d1
     71c:	    sub.l d0,d1
     71e:	    move.l d1,d0
     720:	    add.w d0,d0
     722:	    movea.l 34(sp),a0
     726:	    move.w d0,100(a0)
    custom->bltdmod = 64 - length*2;
     72a:	    moveq #0,d0
     72c:	    move.w 12(sp),d0
     730:	    moveq #32,d1
     732:	    sub.l d0,d1
     734:	    move.l d1,d0
     736:	    add.w d0,d0
     738:	    movea.l 34(sp),a0
     73c:	    move.w d0,102(a0)
    custom->bltsize = length + 64*height;
     740:	    move.w 14(sp),d0
     744:	    lsl.w #6,d0
     746:	    add.w 12(sp),d0
     74a:	    movea.l 34(sp),a0
     74e:	    move.w d0,88(a0)
}
     752:	    nop
     754:	    move.l (sp)+,d2
     756:	    movea.l (sp)+,a6
     758:	    lea 32(sp),sp
     75c:	    rts

0000075e <Utils_CopyPolygon>:

void Utils_CopyPolygon(UWORD startx, UWORD starty, UWORD height, UWORD length, UBYTE *startbuffer, UBYTE *targetbuffer, UWORD minterms, UWORD color) {
     75e:	                   movem.l d2-d7,-(sp)
     762:	                   move.l 32(sp),d7
     766:	                   move.l 36(sp),d2
     76a:	                   move.w 58(sp),d3
  /*length = length / 16;
  length += 2;*/

  UWORD yoffset = starty*64;

  UWORD tmp = (startx/16)*2;
     76e:	                   move.l 28(sp),d0
     772:	                   lsr.w #4,d0
     774:	                   movea.w d0,a0
     776:	                   adda.w d0,a0
  UWORD offset = yoffset+tmp;//+blitendoffset;
  ULONG bltapt = (ULONG) startbuffer + offset;
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
     778:	                   moveq #0,d0
     77a:	                   move.w a0,d0
     77c:	                   movea.l 48(sp),a1
     780:	                   adda.l d0,a1
  ULONG bltsize = length + height*64;
     782:	                   moveq #0,d6
     784:	                   move.w 42(sp),d6

  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     788:	                   move.w dff002 <_end+0xd67dce>,d0
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     78e:	               /-> move.w dff002 <_end+0xd67dce>,d0
     794:	               |   move.w d0,d1
     796:	               |   andi.w #16384,d1
     79a:	               |   btst #14,d0
     79e:	               \-- bne.s 78e <Utils_CopyPolygon+0x30>
  //custom->bltafwm = 0xffff; //Static
  //custom->bltalwm = 0xffff; //Static  
  //custom->bltcon1 = 0x0000;      
  custom->bltamod = 64 - length*2;
     7a0:	                   moveq #32,d0
     7a2:	                   sub.l d6,d0
     7a4:	                   add.w d0,d0
     7a6:	                   move.w d0,dff064 <_end+0xd67e30>
  custom->bltbmod = 64 - length*2;
     7ac:	                   move.w d0,dff062 <_end+0xd67e2e>
  custom->bltdmod = 64 - length*2;  
     7b2:	                   move.w d0,dff066 <_end+0xd67e32>

  UWORD bit;
  UWORD planes;
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
     7b8:	                   cmpi.w #3,d3
     7bc:	   /-------------- bls.w 874 <Utils_CopyPolygon+0x116>
  {
    bit = 1;
    planes = 1; //Only Plane 3 to write to
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
     7c0:	   |               adda.l #32768,a1
    planes = 1; //Only Plane 3 to write to
     7c6:	   |               moveq #1,d5
    bit = 1;
     7c8:	   |               moveq #1,d4
  UWORD yoffset = starty*64;
     7ca:	   |               lsl.w #6,d7
  UWORD offset = yoffset+tmp;//+blitendoffset;
     7cc:	   |               move.w d7,d0
     7ce:	   |               add.w a0,d0
  ULONG bltapt = (ULONG) startbuffer + offset;
     7d0:	   |               andi.l #65535,d0
     7d6:	   |               movea.l 44(sp),a0
     7da:	   |               adda.l d0,a0
  ULONG bltsize = length + height*64;
     7dc:	   |               lsl.w #6,d2
    }    
    custom->bltcon0 = 0x0d00 | minterms;
    custom->bltapt = (UBYTE *)bltapt;
    custom->bltbpt = (UBYTE *)bltdpt;
    custom->bltdpt = (UBYTE *)bltdpt;
    custom->bltsize = bltsize;
     7de:	   |               add.w d6,d2
     7e0:	   |               move.w #3520,d6
    if( bit == 1) {
     7e4:	   |               move.w #3535,d7
    if( planes > 1) {
     7e8:	/--|-------------> cmpi.w #2,d5
     7ec:	|  |        /----- beq.s 862 <Utils_CopyPolygon+0x104>
    if( bit == 1) {
     7ee:	|  |        |      move.w d6,d0
     7f0:	|  |        |      cmpi.w #1,d4
     7f4:	|  |  /-----|----- beq.s 836 <Utils_CopyPolygon+0xd8>
    custom->bltcon0 = 0x0d00 | minterms;
     7f6:	|  |  |  /--|----> move.w d0,dff040 <_end+0xd67e0c>
    custom->bltapt = (UBYTE *)bltapt;
     7fc:	|  |  |  |  |      move.l a0,dff050 <_end+0xd67e1c>
    custom->bltbpt = (UBYTE *)bltdpt;
     802:	|  |  |  |  |      move.l a1,dff04c <_end+0xd67e18>
    custom->bltdpt = (UBYTE *)bltdpt;
     808:	|  |  |  |  |      move.l a1,dff054 <_end+0xd67e20>
    custom->bltsize = bltsize;
     80e:	|  |  |  |  |      move.w d2,dff058 <_end+0xd67e24>
    bltdpt += 64*256;
     814:	|  |  |  |  |      lea 16384(a1),a1
    //WaitBlit();
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     818:	|  |  |  |  |      move.w dff002 <_end+0xd67dce>,d0
    (void)tst;
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     81e:	|  |  |  |  |  /-> move.w dff002 <_end+0xd67dce>,d0
     824:	|  |  |  |  |  |   btst #14,d0
     828:	|  |  |  |  |  +-- bne.s 81e <Utils_CopyPolygon+0xc0>
  for(UWORD i = 0;i<planes;i++) 
     82a:	|  |  |  |  |  |   addq.w #1,d1
     82c:	|  |  |  |  |  |   cmp.w d1,d5
     82e:	+--|--|--|--|--|-- bne.s 7e8 <Utils_CopyPolygon+0x8a>
  }

}
     830:	|  |  |  |  |  |   movem.l (sp)+,d2-d7
     834:	|  |  |  |  |  |   rts
    if( bit == 1) {
     836:	|  |  >--|--|--|-> move.w d7,d0
    custom->bltcon0 = 0x0d00 | minterms;
     838:	|  |  |  |  |  |   move.w d0,dff040 <_end+0xd67e0c>
    custom->bltapt = (UBYTE *)bltapt;
     83e:	|  |  |  |  |  |   move.l a0,dff050 <_end+0xd67e1c>
    custom->bltbpt = (UBYTE *)bltdpt;
     844:	|  |  |  |  |  |   move.l a1,dff04c <_end+0xd67e18>
    custom->bltdpt = (UBYTE *)bltdpt;
     84a:	|  |  |  |  |  |   move.l a1,dff054 <_end+0xd67e20>
    custom->bltsize = bltsize;
     850:	|  |  |  |  |  |   move.w d2,dff058 <_end+0xd67e24>
    bltdpt += 64*256;
     856:	|  |  |  |  |  |   lea 16384(a1),a1
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     85a:	|  |  |  |  |  |   move.w dff002 <_end+0xd67dce>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     860:	|  |  |  |  |  \-- bra.s 81e <Utils_CopyPolygon+0xc0>
      bit = color & 1;
     862:	|  |  |  |  \----> move.w d3,d4
     864:	|  |  |  |         andi.w #1,d4
      color = color >> 1;
     868:	|  |  |  |         lsr.w #1,d3
    if( bit == 1) {
     86a:	|  |  |  |         move.w d6,d0
     86c:	|  |  |  |         cmpi.w #1,d4
     870:	|  |  |  \-------- bne.s 7f6 <Utils_CopyPolygon+0x98>
     872:	|  |  \----------- bra.s 836 <Utils_CopyPolygon+0xd8>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
     874:	|  \-------------> tst.w d3
     876:	|              /-- bne.s 8a4 <Utils_CopyPolygon+0x146>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
     878:	|              |   adda.l #32768,a1
    bit = 0;
     87e:	|              |   clr.w d4
    planes = 1; //Only Plane 3 to write to
     880:	|              |   moveq #1,d5
  UWORD yoffset = starty*64;
     882:	|              |   lsl.w #6,d7
  UWORD offset = yoffset+tmp;//+blitendoffset;
     884:	|              |   move.w d7,d0
     886:	|              |   add.w a0,d0
  ULONG bltapt = (ULONG) startbuffer + offset;
     888:	|              |   andi.l #65535,d0
     88e:	|              |   movea.l 44(sp),a0
     892:	|              |   adda.l d0,a0
  ULONG bltsize = length + height*64;
     894:	|              |   lsl.w #6,d2
    custom->bltsize = bltsize;
     896:	|              |   add.w d6,d2
     898:	|              |   move.w #3520,d6
    if( bit == 1) {
     89c:	|              |   move.w #3535,d7
     8a0:	+--------------|-- bra.w 7e8 <Utils_CopyPolygon+0x8a>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
     8a4:	|              \-> moveq #2,d5
  UWORD yoffset = starty*64;
     8a6:	|                  lsl.w #6,d7
  UWORD offset = yoffset+tmp;//+blitendoffset;
     8a8:	|                  move.w d7,d0
     8aa:	|                  add.w a0,d0
  ULONG bltapt = (ULONG) startbuffer + offset;
     8ac:	|                  andi.l #65535,d0
     8b2:	|                  movea.l 44(sp),a0
     8b6:	|                  adda.l d0,a0
  ULONG bltsize = length + height*64;
     8b8:	|                  lsl.w #6,d2
    custom->bltsize = bltsize;
     8ba:	|                  add.w d6,d2
     8bc:	|                  move.w #3520,d6
    if( bit == 1) {
     8c0:	|                  move.w #3535,d7
     8c4:	\----------------- bra.w 7e8 <Utils_CopyPolygon+0x8a>

000008c8 <Utils_DrawLine>:


//Draw Line on Lowres Screen
void Utils_DrawLine(int x1, int y1, int x2, int y2, UBYTE *Buffer, UWORD minterms)
{
     8c8:	       lea -48(sp),sp
     8cc:	       move.l d2,-(sp)
     8ce:	       move.l 76(sp),d0
     8d2:	       move.w d0,d0
     8d4:	       move.w d0,6(sp)
    if(y2<y1) {
     8d8:	       move.l 68(sp),d0
     8dc:	       cmp.l 60(sp),d0
     8e0:	   /-- bge.s 906 <Utils_DrawLine+0x3e>
      int tmp = y2;
     8e2:	   |   move.l 68(sp),38(sp)
      y2 = y1;
     8e8:	   |   move.l 60(sp),68(sp)
      y1 = tmp;
     8ee:	   |   move.l 38(sp),60(sp)
      tmp = x2;
     8f4:	   |   move.l 64(sp),38(sp)
      x2 = x1;
     8fa:	   |   move.l 56(sp),64(sp)
      x1 = tmp;
     900:	   |   move.l 38(sp),56(sp)
    }

    volatile struct Custom *custom = (struct Custom*)0xdff000;
     906:	   \-> move.l #14675968,34(sp)

    UWORD xnegative = 0;
     90e:	       clr.w 50(sp)
    UWORD ynegative = 0;
     912:	       clr.w 48(sp)

    UWORD bltcon1 = 0x3; //LineDrawBit Single Pixel
     916:	       move.w #3,46(sp)
    WORD deltax = x2 - x1;
     91c:	       move.l 64(sp),d1
     920:	       move.l 56(sp),d0
     924:	       sub.w d0,d1
     926:	       move.w d1,44(sp)
    WORD deltay = y2 - y1;
     92a:	       move.l 68(sp),d1
     92e:	       move.l 60(sp),d0
     932:	       sub.w d0,d1
     934:	       move.w d1,42(sp)

    if(deltax < 0) {
     938:	       tst.w 44(sp)
     93c:	   /-- bge.s 94e <Utils_DrawLine+0x86>
      xnegative = 1;
     93e:	   |   move.w #1,50(sp)
      deltax *= -1;
     944:	   |   move.w 44(sp),d0
     948:	   |   neg.w d0
     94a:	   |   move.w d0,44(sp)
    }
    if(deltay < 0) {
     94e:	   \-> tst.w 42(sp)
     952:	   /-- bge.s 964 <Utils_DrawLine+0x9c>
      ynegative = 1;
     954:	   |   move.w #1,48(sp)
      deltay *= -1;
     95a:	   |   move.w 42(sp),d0
     95e:	   |   neg.w d0
     960:	   |   move.w d0,42(sp)
    }

    if( deltay <= deltax) {
     964:	   \-> move.w 44(sp),d1
     968:	       cmp.w 42(sp),d1
     96c:	   /-- blt.s 976 <Utils_DrawLine+0xae>
      //Set SUD Flag if major direction is x
      bltcon1 |= 0x0010;
     96e:	   |   ori.w #16,46(sp)
     974:	/--|-- bra.s 99a <Utils_DrawLine+0xd2>
    } else {
      //Swap DeltaX and Deltay to make y the minor direction no matter the true direction
      WORD tmp = deltax;
     976:	|  \-> move.w 44(sp),32(sp)
      deltax = deltay;
     97c:	|      move.w 42(sp),44(sp)
      deltay = tmp;
     982:	|      move.w 32(sp),42(sp)
      WORD tmp2 = xnegative;
     988:	|      move.w 50(sp),30(sp)
      xnegative = ynegative;
     98e:	|      move.w 48(sp),50(sp)
      ynegative = tmp2; 
     994:	|      move.w 30(sp),48(sp)
    }

    if(ynegative == 1) bltcon1 |= 0x0008; //Set the Sometime up or left flag if minor dir is negative
     99a:	\----> cmpi.w #1,48(sp)
     9a0:	   /-- bne.s 9a8 <Utils_DrawLine+0xe0>
     9a2:	   |   ori.w #8,46(sp)
    if(xnegative == 1) bltcon1 |= 0x0004; //Set the always up or left flag if major dir is negative
     9a8:	   \-> cmpi.w #1,50(sp)
     9ae:	   /-- bne.s 9b6 <Utils_DrawLine+0xee>
     9b0:	   |   ori.w #4,46(sp)
    

    //Initialize Accumulators
    WORD initvalue = 4 * deltay - 2 * deltax;
     9b6:	   \-> movea.w 42(sp),a0
     9ba:	       move.l a0,d0
     9bc:	       add.l a0,d0
     9be:	       movea.w 44(sp),a0
     9c2:	       sub.l a0,d0
     9c4:	       move.l d0,d0
     9c6:	       add.w d0,d0
     9c8:	       move.w d0,28(sp)
    if(initvalue < 0)
     9cc:	   /-- bpl.s 9d4 <Utils_DrawLine+0x10c>
    {      
      bltcon1 |= 0x0040; //Negative Sign Bit
     9ce:	   |   ori.w #64,46(sp)
    }  

    
    UWORD omitfirstpixel = 10;   
     9d4:	   \-> move.w #10,26(sp)

    UWORD bltcon0 = ((x1 & 0xf) << 12) + 0xb00 + minterms;
     9da:	       move.l 56(sp),d0
     9de:	       moveq #12,d2
     9e0:	       lsl.w d2,d0
     9e2:	       add.w 6(sp),d0
     9e6:	       move.w d0,d1
     9e8:	       addi.w #2816,d1
     9ec:	       move.w d1,24(sp)
    ULONG bltcpt = (ULONG) Buffer+y1*64+(x1>>4)*2;
     9f0:	       move.l 60(sp),d0
     9f4:	       lsl.l #6,d0
     9f6:	       move.l d0,d1
     9f8:	       move.l 56(sp),d0
     9fc:	       asr.l #4,d0
     9fe:	       add.l d0,d0
     a00:	       add.l d0,d1
     a02:	       move.l 72(sp),d0
     a06:	       move.l d1,d2
     a08:	       add.l d0,d2
     a0a:	       move.l d2,20(sp)
    ULONG bltdpt = (ULONG) Buffer+y1*64+(x1>>4)*2;
     a0e:	       move.l 60(sp),d0
     a12:	       lsl.l #6,d0
     a14:	       move.l d0,d1
     a16:	       move.l 56(sp),d0
     a1a:	       asr.l #4,d0
     a1c:	       add.l d0,d0
     a1e:	       add.l d0,d1
     a20:	       move.l 72(sp),d0
     a24:	       move.l d1,d2
     a26:	       add.l d0,d2
     a28:	       move.l d2,16(sp)
    WORD bltbmod = 4 * deltay;    WORD bltamod = 4 * (deltay - deltax);
     a2c:	       move.w 42(sp),d0
     a30:	       add.w d0,d0
     a32:	       add.w d0,d0
     a34:	       move.w d0,14(sp)
     a38:	       movea.w 42(sp),a1
     a3c:	       movea.w 44(sp),a0
     a40:	       move.l a1,d0
     a42:	       sub.l a0,d0
     a44:	       move.l d0,d0
     a46:	       add.w d0,d0
     a48:	       add.w d0,d0
     a4a:	       move.w d0,12(sp)
    UWORD bltsize = 2 + 64*(deltax+1);
     a4e:	       movea.w 44(sp),a0
     a52:	       move.l a0,d0
     a54:	       addq.l #1,d0
     a56:	       move.l d0,d0
     a58:	       lsl.w #6,d0
     a5a:	       move.w d0,d1
     a5c:	       addq.w #2,d1
     a5e:	       move.w d1,10(sp)

    //custom->color[0] = 0x0ff0;
    UWORD btst = custom->dmaconr & 0x0040;
     a62:	       movea.l 34(sp),a0
     a66:	       move.w 2(a0),d0
     a6a:	       move.w d0,d2
     a6c:	       andi.w #64,d2
     a70:	       move.w d2,8(sp)
    while( (custom->dmaconr & 0x4000) == 0x4000 ) {
     a74:	       nop
     a76:	   /-> movea.l 34(sp),a0
     a7a:	   |   move.w 2(a0),d0
     a7e:	   |   move.w d0,d0
     a80:	   |   andi.l #65535,d0
     a86:	   |   andi.l #16384,d0
     a8c:	   |   cmpi.l #16384,d0
     a92:	   \-- beq.s a76 <Utils_DrawLine+0x1ae>
    }
    //custom->color[0] = 0x000f;

    custom->bltcpt = (void *) bltcpt; //Startword
     a94:	       move.l 20(sp),d0
     a98:	       movea.l 34(sp),a0
     a9c:	       move.l d0,72(a0)
    custom->bltdpt = (void *) bltdpt; //Startword
     aa0:	       move.l 16(sp),d0
     aa4:	       movea.l 34(sp),a0
     aa8:	       move.l d0,84(a0)
    custom->bltapt =  initvalue; //Init Accumulator
     aac:	       movea.w 28(sp),a0
     ab0:	       move.l a0,d0
     ab2:	       movea.l 34(sp),a0
     ab6:	       move.l d0,80(a0)
    custom->bltcon0 = bltcon0;
     aba:	       movea.l 34(sp),a0
     abe:	       move.w 24(sp),64(a0)
    custom->bltcon1 = bltcon1; 
     ac4:	       movea.l 34(sp),a0
     ac8:	       move.w 46(sp),66(a0)
    custom->bltbmod = bltbmod;
     ace:	       move.w 14(sp),d0
     ad2:	       movea.l 34(sp),a0
     ad6:	       move.w d0,98(a0)
    custom->bltamod = bltamod;
     ada:	       move.w 12(sp),d0
     ade:	       movea.l 34(sp),a0
     ae2:	       move.w d0,100(a0)
    custom->bltsize = bltsize;
     ae6:	       movea.l 34(sp),a0
     aea:	       move.w 10(sp),88(a0)

}
     af0:	       nop
     af2:	       move.l (sp)+,d2
     af4:	       lea 48(sp),sp
     af8:	       rts

00000afa <Utils_DrawPoint>:


//Draw Point in Lowres
void Utils_DrawPoint(UWORD x1, UWORD y1, UBYTE *buffer) {
     afa:	lea -16(sp),sp
     afe:	move.l 20(sp),d1
     b02:	move.l 24(sp),d0
     b06:	move.w d1,d1
     b08:	move.w d1,4(sp)
     b0c:	move.w d0,d0
     b0e:	move.w d0,2(sp)
  UWORD xwidthword = x1 >> 4;
     b12:	move.w 4(sp),d0
     b16:	lsr.w #4,d0
     b18:	move.w d0,14(sp)
  UWORD xwidthrest = x1 - (xwidthword << 4);
     b1c:	move.w 14(sp),d0
     b20:	lsl.w #4,d0
     b22:	move.w 4(sp),d1
     b26:	sub.w d0,d1
     b28:	move.w d1,12(sp)
  UWORD wordvalue = 0x8000 >> (xwidthrest -1);  
     b2c:	moveq #0,d0
     b2e:	move.w 12(sp),d0
     b32:	move.l d0,d1
     b34:	subq.l #1,d1
     b36:	move.l #32768,d0
     b3c:	asr.l d1,d0
     b3e:	move.w d0,10(sp)
  UWORD *destword = (UWORD *) buffer + y1 * 20 + xwidthword;  
     b42:	moveq #0,d1
     b44:	move.w 2(sp),d1
     b48:	move.l d1,d0
     b4a:	add.l d0,d0
     b4c:	add.l d0,d0
     b4e:	add.l d1,d0
     b50:	add.l d0,d0
     b52:	add.l d0,d0
     b54:	move.l d0,d1
     b56:	moveq #0,d0
     b58:	move.w 14(sp),d0
     b5c:	add.l d1,d0
     b5e:	add.l d0,d0
     b60:	move.l 28(sp),d1
     b64:	add.l d0,d1
     b66:	move.l d1,6(sp)
  wordvalue = wordvalue | *destword;
     b6a:	movea.l 6(sp),a0
     b6e:	move.w (a0),d0
     b70:	or.w d0,10(sp)
  *destword = wordvalue;
     b74:	movea.l 6(sp),a0
     b78:	move.w 10(sp),(a0)
}
     b7c:	nop
     b7e:	lea 16(sp),sp
     b82:	rts

00000b84 <Utils_ReadFile>:

void Utils_ReadFile( char *filename, UWORD *target) {
     b84:	lea -44(sp),sp
     b88:	movem.l d2-d3/a6,-(sp)
  BPTR *fh;
  UBYTE *buffer;  
  fh = Open( filename, MODE_OLDFILE);
     b8c:	move.l 60(sp),52(sp)
     b92:	move.l #1005,48(sp)
     b9a:	move.l 96d6a <DOSBase>,d0
     ba0:	movea.l d0,a6
     ba2:	move.l 52(sp),d1
     ba6:	move.l 48(sp),d2
     baa:	jsr -30(a6)
     bae:	move.l d0,44(sp)
     bb2:	move.l 44(sp),d0
     bb6:	move.l d0,40(sp)
  UWORD length = Read( fh, target, 100000);
     bba:	move.l 40(sp),36(sp)
     bc0:	move.l 64(sp),32(sp)
     bc6:	move.l #100000,28(sp)
     bce:	move.l 96d6a <DOSBase>,d0
     bd4:	movea.l d0,a6
     bd6:	move.l 36(sp),d1
     bda:	move.l 32(sp),d2
     bde:	move.l 28(sp),d3
     be2:	jsr -42(a6)
     be6:	move.l d0,24(sp)
     bea:	move.l 24(sp),d0
     bee:	move.w d0,22(sp)
  Close( fh);
     bf2:	move.l 40(sp),18(sp)
     bf8:	move.l 96d6a <DOSBase>,d0
     bfe:	movea.l d0,a6
     c00:	move.l 18(sp),d1
     c04:	jsr -36(a6)
     c08:	move.l d0,14(sp)
}
     c0c:	nop
     c0e:	movem.l (sp)+,d2-d3/a6
     c12:	lea 44(sp),sp
     c16:	rts

00000c18 <Utils_WriteLine>:

UBYTE LetterSize[] = {
    15,18,28,42,36,64,47,15,26,25,33,41,18,25,16,33,36,34,37,36,37,36,36,36,37,36,18,19,41,40,42,31,47,41,38,36,42,34,34,40,40,27,27,42,34,45,40,43,38,43,43,37,35,40,40,57,40,40,36,25,35,24,42,39,27,32,36,30,34,34,25,34,35,16,20,37,16,52,35,35,36,34,27,31,25,35,35,
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
     c18:	       subq.l #4,sp
    
    int x = 0;
     c1a:	       clr.l (sp)
    while(x + LetterSize[*text - 0x20] < 640) 
     c1c:	   /-- bra.s c6a <Utils_WriteLine+0x52>
    {
        Utils_WriteLetter( font, targetbuffer, x, *text);
     c1e:	/--|-> movea.l 16(sp),a0
     c22:	|  |   move.b (a0),d0
     c24:	|  |   ext.w d0
     c26:	|  |   movea.w d0,a0
     c28:	|  |   move.l a0,-(sp)
     c2a:	|  |   move.l 4(sp),-(sp)
     c2e:	|  |   move.l 20(sp),-(sp)
     c32:	|  |   move.l 20(sp),-(sp)
     c36:	|  |   jsr c9c <Utils_WriteLetter>(pc)
     c3a:	|  |   lea 16(sp),sp
        x += LetterSize[*text++ - 0x20];
     c3e:	|  |   move.l 16(sp),d0
     c42:	|  |   move.l d0,d1
     c44:	|  |   addq.l #1,d1
     c46:	|  |   move.l d1,16(sp)
     c4a:	|  |   movea.l d0,a0
     c4c:	|  |   move.b (a0),d0
     c4e:	|  |   ext.w d0
     c50:	|  |   movea.w d0,a0
     c52:	|  |   lea -32(a0),a1
     c56:	|  |   lea 44018 <LetterSize>,a0
     c5c:	|  |   move.b (0,a1,a0.l),d0
     c60:	|  |   move.b d0,d0
     c62:	|  |   andi.l #255,d0
     c68:	|  |   add.l d0,(sp)
    while(x + LetterSize[*text - 0x20] < 640) 
     c6a:	|  \-> movea.l 16(sp),a0
     c6e:	|      move.b (a0),d0
     c70:	|      ext.w d0
     c72:	|      movea.w d0,a0
     c74:	|      lea -32(a0),a1
     c78:	|      lea 44018 <LetterSize>,a0
     c7e:	|      move.b (0,a1,a0.l),d0
     c82:	|      move.b d0,d0
     c84:	|      andi.l #255,d0
     c8a:	|      add.l (sp),d0
     c8c:	|      cmpi.l #639,d0
     c92:	\----- ble.s c1e <Utils_WriteLine+0x6>
    }

}
     c94:	       nop
     c96:	       nop
     c98:	       addq.l #4,sp
     c9a:	       rts

00000c9c <Utils_WriteLetter>:

void Utils_WriteLetter(UWORD *font, ULONG targetbuffer, int x, char letter) {
     c9c:	lea -20(sp),sp
     ca0:	move.l a6,-(sp)
     ca2:	move.l 40(sp),d0
     ca6:	move.b d0,d0
     ca8:	move.b d0,6(sp)

    volatile struct Custom *custom = (struct Custom*)0xdff000; 
     cac:	move.l #14675968,20(sp)

    WaitBlit();
     cb4:	move.l 96d6e <GfxBase>,d0
     cba:	movea.l d0,a6
     cbc:	jsr -228(a6)

    custom->bltamod = 0;
     cc0:	movea.l 20(sp),a0
     cc4:	move.w #0,100(a0)
    custom->bltbmod = 72;
     cca:	movea.l 20(sp),a0
     cce:	move.w #72,98(a0)
    custom->bltdmod = 72;
     cd4:	movea.l 20(sp),a0
     cd8:	move.w #72,102(a0)
    custom->bltafwm = 0xffff;
     cde:	movea.l 20(sp),a0
     ce2:	move.w #-1,68(a0)
    custom->bltalwm = 0xffff;
     ce8:	movea.l 20(sp),a0
     cec:	move.w #-1,70(a0)
    custom->bltcon1 = 0;  
     cf2:	movea.l 20(sp),a0
     cf6:	move.w #0,66(a0)

    int restx = x & 0xf;
     cfc:	moveq #15,d0
     cfe:	and.l 36(sp),d0
     d02:	move.l d0,16(sp)
    custom->bltcon0 = 0xdfc + (restx << 12);
     d06:	move.l 16(sp),d0
     d0a:	moveq #12,d1
     d0c:	lsl.w d1,d0
     d0e:	addi.w #3580,d0
     d12:	movea.l 20(sp),a0
     d16:	move.w d0,64(a0)
    int index = letter - 0x20;
     d1a:	move.b 6(sp),d0
     d1e:	ext.w d0
     d20:	ext.l d0
     d22:	moveq #-32,d1
     d24:	add.l d0,d1
     d26:	move.l d1,12(sp)

    custom->bltapt = font+4*50*index;
     d2a:	move.l 12(sp),d1
     d2e:	move.l d1,d0
     d30:	add.l d0,d0
     d32:	add.l d1,d0
     d34:	lsl.l #3,d0
     d36:	add.l d1,d0
     d38:	lsl.l #4,d0
     d3a:	add.l 28(sp),d0
     d3e:	movea.l 20(sp),a0
     d42:	move.l d0,80(a0)
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
     d46:	move.l 36(sp),d0
     d4a:	asr.l #4,d0
     d4c:	add.l d0,d0
     d4e:	move.l 32(sp),d1
     d52:	add.l d0,d1
     d54:	move.l d1,8(sp)
    custom->bltbpt = targetlocation;
     d58:	move.l 8(sp),d0
     d5c:	movea.l 20(sp),a0
     d60:	move.l d0,76(a0)
    custom->bltdpt = targetlocation;
     d64:	move.l 8(sp),d0
     d68:	movea.l 20(sp),a0
     d6c:	move.l d0,84(a0)
    custom->bltsize = 4+64*50;
     d70:	movea.l 20(sp),a0
     d74:	move.w #3204,88(a0)
}
     d7a:	nop
     d7c:	movea.l (sp)+,a6
     d7e:	lea 20(sp),sp
     d82:	rts

00000d84 <GetVBR>:
static volatile APTR VBR=0;
static APTR SystemIrq;
 
struct View *ActiView;

static APTR GetVBR(void) {
     d84:	    lea -20(sp),sp
     d88:	    move.l a6,-(sp)
     d8a:	    move.l d7,-(sp)
	APTR vbr = 0;
     d8c:	    clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     d90:	    move.w #20090,10(sp)
     d96:	    move.w #2049,12(sp)
     d9c:	    move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
     da2:	    movea.l 96d62 <SysBase>,a0
     da8:	    move.w 296(a0),d0
     dac:	    move.w d0,d0
     dae:	    andi.l #65535,d0
     db4:	    moveq #1,d1
     db6:	    and.l d1,d0
     db8:	/-- beq.s de6 <GetVBR+0x62>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     dba:	|   lea 28(sp),a0
     dbe:	|   lea -18(a0),a0
     dc2:	|   move.l a0,20(sp)
     dc6:	|   move.l 96d62 <SysBase>,d0
     dcc:	|   movea.l d0,a6
     dce:	|   move.l 20(sp),d7
     dd2:	|   exg d7,a5
     dd4:	|   jsr -30(a6)
     dd8:	|   exg d7,a5
     dda:	|   move.l d0,16(sp)
     dde:	|   move.l 16(sp),d0
     de2:	|   move.l d0,24(sp)

	return vbr;
     de6:	\-> move.l 24(sp),d0
}
     dea:	    move.l (sp)+,d7
     dec:	    movea.l (sp)+,a6
     dee:	    lea 20(sp),sp
     df2:	    rts

00000df4 <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     df4:	movea.l 96d78 <VBR>,a0
     dfa:	lea 108(a0),a0
     dfe:	move.l 4(sp),(a0)
}
     e02:	nop
     e04:	rts

00000e06 <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     e06:	movea.l 96d78 <VBR>,a0
     e0c:	move.l 108(a0),d0
}
     e10:	rts

00000e12 <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
     e12:	       subq.l #8,sp

	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     e14:	   /-> movea.l #14675972,a0
     e1a:	   |   move.l (a0),d0
     e1c:	   |   move.l d0,(sp)
		vpos&=0x1ff00;
     e1e:	   |   move.l (sp),d0
     e20:	   |   andi.l #130816,d0
     e26:	   |   move.l d0,(sp)
		if (vpos!=(311<<8))
     e28:	   |   move.l (sp),d0
     e2a:	   |   cmpi.l #79616,d0
     e30:	   \-- beq.s e14 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     e32:	/----> movea.l #14675972,a0
     e38:	|      move.l (a0),d0
     e3a:	|      move.l d0,4(sp)
		vpos&=0x1ff00;
     e3e:	|      move.l 4(sp),d0
     e42:	|      andi.l #130816,d0
     e48:	|      move.l d0,4(sp)
		if (vpos==(311<<8))
     e4c:	|      move.l 4(sp),d0
     e50:	|      cmpi.l #79616,d0
     e56:	|  /-- beq.s e5a <WaitVbl+0x48>
	while (1) {
     e58:	\--|-- bra.s e32 <WaitVbl+0x20>
			break;
     e5a:	   \-> nop
	}
}
     e5c:	       nop
     e5e:	       addq.l #8,sp
     e60:	       rts

00000e62 <WaitLine>:

void WaitLine(USHORT line) {
     e62:	       subq.l #8,sp
     e64:	       move.l 12(sp),d0
     e68:	       move.w d0,d0
     e6a:	       move.w d0,2(sp)
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     e6e:	/----> movea.l #14675972,a0
     e74:	|      move.l (a0),d0
     e76:	|      move.l d0,4(sp)
		if(((vpos >> 8) & 511) == line)
     e7a:	|      move.l 4(sp),d0
     e7e:	|      lsr.l #8,d0
     e80:	|      move.l d0,d1
     e82:	|      andi.l #511,d1
     e88:	|      moveq #0,d0
     e8a:	|      move.w 2(sp),d0
     e8e:	|      cmp.l d1,d0
     e90:	|  /-- beq.s e94 <WaitLine+0x32>
	while (1) {
     e92:	\--|-- bra.s e6e <WaitLine+0xc>
			break;
     e94:	   \-> nop
	}
}
     e96:	       nop
     e98:	       addq.l #8,sp
     e9a:	       rts

00000e9c <TakeSystem>:
	UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
}

void TakeSystem() {
     e9c:	       subq.l #8,sp
     e9e:	       move.l a6,-(sp)
	Forbid();
     ea0:	       move.l 96d62 <SysBase>,d0
     ea6:	       movea.l d0,a6
     ea8:	       jsr -132(a6)
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=custom->adkconr;
     eac:	       movea.l 96d66 <custom>,a0
     eb2:	       move.w 16(a0),d0
     eb6:	       move.w d0,96d76 <SystemADKCON>
	SystemInts=custom->intenar;
     ebc:	       movea.l 96d66 <custom>,a0
     ec2:	       move.w 28(a0),d0
     ec6:	       move.w d0,96d72 <SystemInts>
	SystemDMA=custom->dmaconr;
     ecc:	       movea.l 96d66 <custom>,a0
     ed2:	       move.w 2(a0),d0
     ed6:	       move.w d0,96d74 <SystemDMA>
	ActiView=GfxBase->ActiView; //store current view
     edc:	       movea.l 96d6e <GfxBase>,a0
     ee2:	       move.l 34(a0),d0
     ee6:	       move.l d0,96d80 <ActiView>

	LoadView(0);
     eec:	       clr.l 4(sp)
     ef0:	       move.l 96d6e <GfxBase>,d0
     ef6:	       movea.l d0,a6
     ef8:	       movea.l 4(sp),a1
     efc:	       jsr -222(a6)
	WaitTOF();
     f00:	       move.l 96d6e <GfxBase>,d0
     f06:	       movea.l d0,a6
     f08:	       jsr -270(a6)
	WaitTOF();
     f0c:	       move.l 96d6e <GfxBase>,d0
     f12:	       movea.l d0,a6
     f14:	       jsr -270(a6)

	WaitVbl();
     f18:	       jsr e12 <WaitVbl>(pc)
	WaitVbl();
     f1c:	       jsr e12 <WaitVbl>(pc)

	OwnBlitter();
     f20:	       move.l 96d6e <GfxBase>,d0
     f26:	       movea.l d0,a6
     f28:	       jsr -456(a6)
	WaitBlit();	
     f2c:	       move.l 96d6e <GfxBase>,d0
     f32:	       movea.l d0,a6
     f34:	       jsr -228(a6)
	//Disable();
	
	custom->intena=0x7fff;//disable all interrupts
     f38:	       movea.l 96d66 <custom>,a0
     f3e:	       move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     f44:	       movea.l 96d66 <custom>,a0
     f4a:	       move.w #32767,156(a0)
	
	custom->dmacon=0x3fff;//Clear all DMA channels
     f50:	       movea.l 96d66 <custom>,a0
     f56:	       move.w #16383,150(a0)

	//set all colors black
	for(int a=0;a<32;a++)
     f5c:	       clr.l 8(sp)
     f60:	   /-- bra.s f7e <TakeSystem+0xe2>
		custom->color[a]=0;
     f62:	/--|-> movea.l 96d66 <custom>,a0
     f68:	|  |   move.l 8(sp),d0
     f6c:	|  |   addi.l #192,d0
     f72:	|  |   add.l d0,d0
     f74:	|  |   move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     f7a:	|  |   addq.l #1,8(sp)
     f7e:	|  \-> moveq #31,d0
     f80:	|      cmp.l 8(sp),d0
     f84:	\----- bge.s f62 <TakeSystem+0xc6>



	WaitVbl();
     f86:	       jsr e12 <WaitVbl>(pc)
	WaitVbl();
     f8a:	       jsr e12 <WaitVbl>(pc)

	VBR=GetVBR();
     f8e:	       jsr d84 <GetVBR>(pc)
     f92:	       move.l d0,96d78 <VBR>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     f98:	       jsr e06 <GetInterruptHandler>(pc)
     f9c:	       move.l d0,96d7c <SystemIrq>
}
     fa2:	       nop
     fa4:	       movea.l (sp)+,a6
     fa6:	       addq.l #8,sp
     fa8:	       rts

00000faa <FreeSystem>:

void FreeSystem() { 
     faa:	subq.l #4,sp
     fac:	move.l a6,-(sp)
	WaitVbl();
     fae:	jsr e12 <WaitVbl>(pc)
	WaitBlit();
     fb2:	move.l 96d6e <GfxBase>,d0
     fb8:	movea.l d0,a6
     fba:	jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     fbe:	movea.l 96d66 <custom>,a0
     fc4:	move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     fca:	movea.l 96d66 <custom>,a0
     fd0:	move.w #32767,156(a0)
	custom->dmacon=0x7fff;//Clear all DMA channels
     fd6:	movea.l 96d66 <custom>,a0
     fdc:	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     fe2:	move.l 96d7c <SystemIrq>,d0
     fe8:	move.l d0,-(sp)
     fea:	jsr df4 <SetInterruptHandler>(pc)
     fee:	addq.l #4,sp

	/*Restore system copper list(s). */
	custom->cop1lc=(ULONG)GfxBase->copinit;
     ff0:	movea.l 96d6e <GfxBase>,a0
     ff6:	move.l 38(a0),d0
     ffa:	movea.l 96d66 <custom>,a0
    1000:	move.l d0,128(a0)
	custom->cop2lc=(ULONG)GfxBase->LOFlist;
    1004:	movea.l 96d6e <GfxBase>,a0
    100a:	move.l 50(a0),d0
    100e:	movea.l 96d66 <custom>,a0
    1014:	move.l d0,132(a0)
	custom->copjmp1=0x7fff; //start coppper
    1018:	movea.l 96d66 <custom>,a0
    101e:	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	custom->intena=SystemInts|0x8000;
    1024:	move.w 96d72 <SystemInts>,d0
    102a:	movea.l 96d66 <custom>,a0
    1030:	ori.w #-32768,d0
    1034:	move.w d0,154(a0)
	custom->dmacon=SystemDMA|0x8000;
    1038:	move.w 96d74 <SystemDMA>,d0
    103e:	movea.l 96d66 <custom>,a0
    1044:	ori.w #-32768,d0
    1048:	move.w d0,150(a0)
	custom->adkcon=SystemADKCON|0x8000;
    104c:	move.w 96d76 <SystemADKCON>,d0
    1052:	movea.l 96d66 <custom>,a0
    1058:	ori.w #-32768,d0
    105c:	move.w d0,158(a0)

	WaitBlit();	
    1060:	move.l 96d6e <GfxBase>,d0
    1066:	movea.l d0,a6
    1068:	jsr -228(a6)
	DisownBlitter();
    106c:	move.l 96d6e <GfxBase>,d0
    1072:	movea.l d0,a6
    1074:	jsr -462(a6)
	Enable();
    1078:	move.l 96d62 <SysBase>,d0
    107e:	movea.l d0,a6
    1080:	jsr -126(a6)

	LoadView(ActiView);
    1084:	move.l 96d80 <ActiView>,4(sp)
    108c:	move.l 96d6e <GfxBase>,d0
    1092:	movea.l d0,a6
    1094:	movea.l 4(sp),a1
    1098:	jsr -222(a6)
	WaitTOF();
    109c:	move.l 96d6e <GfxBase>,d0
    10a2:	movea.l d0,a6
    10a4:	jsr -270(a6)
	WaitTOF();
    10a8:	move.l 96d6e <GfxBase>,d0
    10ae:	movea.l d0,a6
    10b0:	jsr -270(a6)

	Permit();
    10b4:	move.l 96d62 <SysBase>,d0
    10ba:	movea.l d0,a6
    10bc:	jsr -138(a6)
}
    10c0:	nop
    10c2:	movea.l (sp)+,a6
    10c4:	addq.l #4,sp
    10c6:	rts

000010c8 <doynaxdepack>:
	0x4f01, 0xff00, offsetof(struct Custom, color[0]), 0x0fff, // line 0x4e
	0xffff, 0xfffe // end copper list
};

void* doynaxdepack(const void* input, void* output) { // returns end of output data, input needs to be 16-bit aligned!
	register volatile const void* _a0 ASM("a0") = input;
    10c8:	movea.l 4(sp),a0
	register volatile       void* _a1 ASM("a1") = output;
    10cc:	movea.l 8(sp),a1
	__asm volatile (
    10d0:	movem.l d0-d7/a2-a6,-(sp)
    10d4:	jsr 6840 <_doynaxdepack_asm>
    10da:	movem.l (sp)+,d0-d7/a2-a6
		"jsr _doynaxdepack_asm\n"
		"movem.l (%%sp)+,%%d0-%%d7/%%a2-%%a6"
	: "+rf"(_a0), "+rf"(_a1)
	:
	: "cc", "memory");
	return (void*)_a1;
    10de:	move.l a1,d0
}
    10e0:	rts

000010e2 <p61Init>:
	// Demo - Module Player - ThePlayer 6.1a: https://www.pouet.net/prod.php?which=19922
	// The Player® 6.1A: Copyright © 1992-95 Jarno Paananen
	// P61.testmod - Module by Skylord/Sector 7 
	INCBIN_CHIP(module, "data/music/p61.mountainbytes")
	
	int p61Init(const void* module) { // returns 0 if success, non-zero otherwise
    10e2:	move.l a2,-(sp)
		register volatile const void* _a0 ASM("a0") = module;
    10e4:	movea.l 8(sp),a0
		register volatile const void* _a1 ASM("a1") = NULL;
    10e8:	suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
    10ea:	suba.l a2,a2
		register                int   _d0 ASM("d0"); // return value
		__asm volatile (
    10ec:	movem.l d1-d7/a3-a6,-(sp)
    10f0:	jsr 77fc <_P61_Init>
    10f6:	movem.l (sp)+,d1-d7/a3-a6
			"movem.l (%%sp)+,%%d1-%%d7/%%a3-%%a6"
		: "=r" (_d0), "+rf"(_a0), "+rf"(_a1), "+rf"(_a2)
		:
		: "cc", "memory");
		return _d0;
	}
    10fa:	movea.l (sp)+,a2
    10fc:	rts

000010fe <p61Music>:

	void p61Music() {
    10fe:	move.l a6,-(sp)
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
    1100:	movea.l #14675968,a6
		__asm volatile (
    1106:	movem.l d0-a5,-(sp)
    110a:	jsr 7b34 <_P61_Music>
    1110:	movem.l (sp)+,d0-a5
			"jsr _P61_Music\n"
			"movem.l (%%sp)+,%%d0-%%d7/%%a0-%%a5"
		: "+rf"(_a6)
		:
		: "cc", "memory");
	}
    1114:	nop
    1116:	movea.l (sp)+,a6
    1118:	rts

0000111a <p61End>:

	void p61End() {
    111a:	move.l a6,-(sp)
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
    111c:	movea.l #14675968,a6
		__asm volatile (
    1122:	movem.l d0-d1/a0-a1,-(sp)
    1126:	jsr 7ace <_P61_End>
    112c:	movem.l (sp)+,d0-d1/a0-a1
			"jsr _P61_End\n"
			"movem.l (%%sp)+,%%d0-%%d1/%%a0-%%a1"
		: "+rf"(_a6)
		:
		: "cc", "memory");
	}
    1130:	nop
    1132:	movea.l (sp)+,a6
    1134:	rts

00001136 <interruptHandler>:
	1,2,2,4,5,7,8,10,
	12,14,16,
};

static __attribute__((interrupt)) void interruptHandler() {
}
    1136:	nop
    1138:	rte

0000113a <Wait10>:
	*copListEnd++ = offsetof(struct Custom, diwstop);
	*copListEnd++ = (xstop-256)+((ystop-256)<<8);
	return copListEnd;
}

static void Wait10() { WaitLine(0x10); }
    113a:	pea 10 <_start+0x10>
    113e:	jsr e62 <WaitLine>(pc)
    1142:	addq.l #4,sp
    1144:	nop
    1146:	rts

00001148 <Wait11>:
static void Wait11() { WaitLine(0x11); }
    1148:	pea 11 <_start+0x11>
    114c:	jsr e62 <WaitLine>(pc)
    1150:	addq.l #4,sp
    1152:	nop
    1154:	rts

00001156 <Wait12>:
static void Wait12() { WaitLine(0x12); }
    1156:	pea 12 <_start+0x12>
    115a:	jsr e62 <WaitLine>(pc)
    115e:	addq.l #4,sp
    1160:	nop
    1162:	rts

00001164 <Wait13>:
static void Wait13() { WaitLine(0x13); }
    1164:	pea 13 <_start+0x13>
    1168:	jsr e62 <WaitLine>(pc)
    116c:	addq.l #4,sp
    116e:	nop
    1170:	rts

00001172 <main>:

int main() {
    1172:	          lea -56(sp),sp
    1176:	          movem.l d2-d3/a6,-(sp)
	SysBase = *((struct ExecBase**)4UL);
    117a:	          movea.w #4,a0
    117e:	          move.l (a0),d0
    1180:	          move.l d0,96d62 <SysBase>
	custom = (struct Custom*)0xdff000;
    1186:	          move.l #14675968,96d66 <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
    1190:	          move.l #34151,64(sp)
    1198:	          clr.l 60(sp)
    119c:	          move.l 96d62 <SysBase>,d0
    11a2:	          movea.l d0,a6
    11a4:	          movea.l 64(sp),a1
    11a8:	          move.l 60(sp),d0
    11ac:	          jsr -552(a6)
    11b0:	          move.l d0,56(sp)
    11b4:	          move.l 56(sp),d0
    11b8:	          move.l d0,96d6e <GfxBase>
	if (!GfxBase)
    11be:	          move.l 96d6e <GfxBase>,d0
    11c4:	      /-- bne.s 11da <main+0x68>
		Exit(0);
    11c6:	      |   clr.l 52(sp)
    11ca:	      |   move.l 96d6a <DOSBase>,d0
    11d0:	      |   movea.l d0,a6
    11d2:	      |   move.l 52(sp),d1
    11d6:	      |   jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
    11da:	      \-> move.l #34168,48(sp)
    11e2:	          clr.l 44(sp)
    11e6:	          move.l 96d62 <SysBase>,d0
    11ec:	          movea.l d0,a6
    11ee:	          movea.l 48(sp),a1
    11f2:	          move.l 44(sp),d0
    11f6:	          jsr -552(a6)
    11fa:	          move.l d0,40(sp)
    11fe:	          move.l 40(sp),d0
    1202:	          move.l d0,96d6a <DOSBase>
	if (!DOSBase)
    1208:	          move.l 96d6a <DOSBase>,d0
    120e:	      /-- bne.s 1224 <main+0xb2>
		Exit(0);
    1210:	      |   clr.l 36(sp)
    1214:	      |   move.l 96d6a <DOSBase>,d0
    121a:	      |   movea.l d0,a6
    121c:	      |   move.l 36(sp),d1
    1220:	      |   jsr -144(a6)

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
    1224:	      \-> pea 8584 <sinus32+0x50>
    122a:	          jsr 605c <KPrintF>(pc)
    122e:	          addq.l #4,sp
#endif
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
    1230:	          move.l 96d6a <DOSBase>,d0
    1236:	          movea.l d0,a6
    1238:	          jsr -60(a6)
    123c:	          move.l d0,32(sp)
    1240:	          move.l 32(sp),d0
    1244:	          move.l d0,28(sp)
    1248:	          move.l #34208,24(sp)
    1250:	          moveq #20,d0
    1252:	          move.l d0,20(sp)
    1256:	          move.l 96d6a <DOSBase>,d0
    125c:	          movea.l d0,a6
    125e:	          move.l 28(sp),d1
    1262:	          move.l 24(sp),d2
    1266:	          move.l 20(sp),d3
    126a:	          jsr -48(a6)
    126e:	          move.l d0,16(sp)
	Delay(50);
    1272:	          moveq #50,d0
    1274:	          move.l d0,12(sp)
    1278:	          move.l 96d6a <DOSBase>,d0
    127e:	          movea.l d0,a6
    1280:	          move.l 12(sp),d1
    1284:	          jsr -198(a6)

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
    1288:	          move.l 44088 <module>,d0
    128e:	          move.l d0,-(sp)
    1290:	          jsr 10e2 <p61Init>(pc)
    1294:	          addq.l #4,sp
    1296:	          tst.l d0
    1298:	      /-- beq.s 12a6 <main+0x134>
		KPrintF("p61Init failed!\n");
    129a:	      |   pea 85b6 <sinus32+0x82>
    12a0:	      |   jsr 605c <KPrintF>(pc)
    12a4:	      |   addq.l #4,sp
#endif
	//warpmode(0);

	TakeSystem();
    12a6:	      \-> jsr e9c <TakeSystem>(pc)
	WaitVbl();
    12aa:	          jsr e12 <WaitVbl>(pc)

	Sw_PrepareDisplay();
    12ae:	          jsr 198e <Sw_PrepareDisplay>(pc)
	custom->dmacon = 0x83f0;	
    12b2:	          movea.l 96d66 <custom>,a0
    12b8:	          move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
    12be:	          movea.l 96d66 <custom>,a0
    12c4:	          move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
    12ca:	      /-- bra.s 12d0 <main+0x15e>
		Sw_Run();
    12cc:	   /--|-> jsr 138a <Sw_Run>(pc)
	while(SwScrollerFinished == 0) {
    12d0:	   |  \-> move.w 96da0 <SwScrollerFinished>,d0
    12d6:	   \----- beq.s 12cc <main+0x15a>
	}
	Sw_Cleanup();
    12d8:	          jsr 1bdc <Sw_Cleanup>(pc)

	WaitBlit();
    12dc:	          move.l 96d6e <GfxBase>,d0
    12e2:	          movea.l d0,a6
    12e4:	          jsr -228(a6)
		
	custom->dmacon = 0x83ff;
    12e8:	          movea.l 96d66 <custom>,a0
    12ee:	          move.w #-31745,150(a0)
	PrepareDisplay();	
    12f4:	          jsr 520a <PrepareDisplay>(pc)
	custom->intena=0xc020;//Enable vblank
    12f8:	          movea.l 96d66 <custom>,a0
    12fe:	          move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
    1304:	          jsr 5cfc <SetBplPointers>(pc)
	//LoadVectors();
	SwapCl();
    1308:	          jsr 5966 <SwapCl>(pc)
	WaitVbl();	
    130c:	          jsr e12 <WaitVbl>(pc)

	while( CubeFinished == 0) {		
    1310:	   /----- bra.s 1358 <main+0x1e6>
		DrawScreen();
    1312:	/--|----> jsr 2296 <DrawScreen>(pc)
		SetBplPointers();
    1316:	|  |      jsr 5cfc <SetBplPointers>(pc)
		debug_start_idle();
    131a:	|  |      jsr 636a <debug_start_idle>(pc)
		while(FrameCounter<2);
    131e:	|  |      nop
    1320:	|  |  /-> move.w 9722e <FrameCounter>,d0
    1326:	|  |  |   cmpi.w #1,d0
    132a:	|  |  \-- bls.s 1320 <main+0x1ae>
		if(FrameCounter >= 3) {
    132c:	|  |      move.w 9722e <FrameCounter>,d0
    1332:	|  |      cmpi.w #2,d0
    1336:	|  |  /-- bls.s 1344 <main+0x1d2>
    		KPrintF("Framerate below 25FPS\n");
    1338:	|  |  |   pea 85c7 <sinus32+0x93>
    133e:	|  |  |   jsr 605c <KPrintF>(pc)
    1342:	|  |  |   addq.l #4,sp
		}
		FrameCounter = 0;
    1344:	|  |  \-> move.w #0,9722e <FrameCounter>
		WaitVbl();
    134c:	|  |      jsr e12 <WaitVbl>(pc)
		debug_stop_idle();
    1350:	|  |      jsr 6382 <debug_stop_idle>(pc)
		SwapCl();
    1354:	|  |      jsr 5966 <SwapCl>(pc)
	while( CubeFinished == 0) {		
    1358:	|  \----> move.w 96e10 <CubeFinished>,d0
    135e:	\-------- beq.s 1312 <main+0x1a0>
	}

	CleanUp( );
    1360:	          jsr 56e0 <CleanUp>(pc)
	WaitVbl();
    1364:	          jsr e12 <WaitVbl>(pc)
	custom->dmacon = 0x83ff;
    1368:	          movea.l 96d66 <custom>,a0
    136e:	          move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
    1374:	          movea.l 96d66 <custom>,a0
    137a:	          move.w #-8160,154(a0)
	
	End_PrepareDisplay();
    1380:	          jsr 2172 <End_PrepareDisplay>(pc)

	while(1) {
		WaitVbl();
    1384:	      /-> jsr e12 <WaitVbl>(pc)
	while(1) {
    1388:	      \-- bra.s 1384 <main+0x212>

0000138a <Sw_Run>:
"                                        "
"                                        ";


void Sw_Run() {                                     
	Sw_WritePlainText();
    138a:	jsr 1392 <Sw_WritePlainText>(pc)
  Sw_DrawScreen3();
    138e:	bra.w 141a <Sw_DrawScreen3>

00001392 <Sw_WritePlainText>:
int Sw_framecountscreen = 0;
int Sw_framecount = 49;
int Sw_textoffset = 0;

void Sw_WritePlainText() {
  if(Sw_framecount == 50) {
    1392:	    move.l 446a0 <Sw_framecount>,d0
    1398:	    moveq #50,d1
    139a:	    cmp.l d0,d1
    139c:	/-- beq.s 13a8 <Sw_WritePlainText+0x16>
    if( Sw_textoffset >= 32*40) {
      Sw_textoffset = 0;
      SwScrollerFinished = 1;
    }    
  }  
  Sw_framecount++;
    139e:	|   addq.l #1,d0
    13a0:	|   move.l d0,446a0 <Sw_framecount>
}
    13a6:	|   rts
    Sw_framecount = 0;
    13a8:	\-> clr.l 446a0 <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
    13ae:	    clr.l -(sp)
    13b0:	    pea 32 <_start+0x32>
    13b4:	    pea 14 <_start+0x14>
    13b8:	    clr.l -(sp)
    13ba:	    move.l 96dac <Sw_FontBuffer>,-(sp)
    13c0:	    jsr b8 <Utils_FillLong>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
    13c4:	    move.l 96db4 <Sw_textoffset>,d0
    13ca:	    addi.l #278862,d0
    13d0:	    move.l d0,-(sp)
    13d2:	    move.l 96dac <Sw_FontBuffer>,-(sp)
    13d8:	    move.l 4408e <Sw_font>,-(sp)
    13de:	    jsr c18 <Utils_WriteLine>(pc)
    Sw_textoffset += 40;
    13e2:	    moveq #40,d0
    13e4:	    add.l 96db4 <Sw_textoffset>,d0
    13ea:	    move.l d0,96db4 <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    13f0:	    lea 32(sp),sp
    13f4:	    cmpi.l #1279,d0
    13fa:	/-- ble.s 140a <Sw_WritePlainText+0x78>
      Sw_textoffset = 0;
    13fc:	|   clr.l 96db4 <Sw_textoffset>
      SwScrollerFinished = 1;
    1402:	|   move.w #1,96da0 <SwScrollerFinished>
  Sw_framecount++;
    140a:	\-> move.l 446a0 <Sw_framecount>,d0
    1410:	    addq.l #1,d0
    1412:	    move.l d0,446a0 <Sw_framecount>
}
    1418:	    rts

0000141a <Sw_DrawScreen3>:

UWORD Sw_CopyLines[] = { 189,	54,	138,	223,	1,	119,	155,	34,	101,	206,	1,	73,	172,	22, 91,	240,	1 };
UWORD Sw_BlitFinished = 0;

void Sw_DrawScreen3() {    
    141a:	    movem.l d2-d3/a2-a4/a6,-(sp)
  
  while ( Sw_BlitFrame == 0)
    141e:	/-> move.w 96da2 <Sw_BlitFrame>,d0
    1424:	\-- beq.s 141e <Sw_DrawScreen3+0x4>
  {
  }
  

  int *bp = 0x200;
  *bp = 0;
    1426:	    clr.l 200 <Utils_DrawLinePrepare+0x38>

  Sw_BlitFinished = 0;
    142a:	    clr.w 96db8 <Sw_BlitFinished>
  Sw_BlitFrame = 0;
    1430:	    move.w #0,96da2 <Sw_BlitFrame>
  
  //Prepare
  WaitBlit();
    1438:	    lea 96d6e <GfxBase>,a2
    143e:	    movea.l (a2),a6
    1440:	    jsr -228(a6)
  custom->bltamod = 0;
    1444:	    movea.l 96d66 <custom>,a0
    144a:	    move.w #0,100(a0)
  custom->bltbmod = 0;
    1450:	    move.w #0,98(a0)
  custom->bltdmod = 0;
    1456:	    move.w #0,102(a0)
  custom->bltafwm = 0xffff;
    145c:	    move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
    1462:	    move.w #-1,70(a0)
  custom->bltcon1 = 0;  
    1468:	    move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
    146e:	    move.w #2544,64(a0)



  //Fontblit  
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
    1474:	    move.l 446a0 <Sw_framecount>,d1
    147a:	    subq.l #1,d1
    147c:	    move.l d1,d0
    147e:	    add.l d1,d0
    1480:	    add.l d0,d0
    1482:	    add.l d1,d0
    1484:	    lsl.l #4,d0
    1486:	    add.l 96dac <Sw_FontBuffer>,d0
    148c:	    move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
    1490:	    move.l 96d90 <Sw_DrawBuffer>,d0
    1496:	    addi.l #20400,d0
    149c:	    move.l d0,84(a0)
  custom->bltsize = 64+40;
    14a0:	    move.w #104,88(a0)

  //Copy
  WaitBlit();
    14a6:	    movea.l (a2),a6
    14a8:	    jsr -228(a6)
  custom->bltamod = 0;
    14ac:	    movea.l 96d66 <custom>,a0
    14b2:	    move.w #0,100(a0)
  custom->bltdmod = 0;
    14b8:	    move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
    14be:	    move.l 96d94 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
    14c6:	    move.l 96d90 <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
    14ce:	    lea 446a4 <Sw_CopyLines>,a3
    14d4:	    move.l 96db0 <Sw_framecountscreen>,d0
    14da:	    add.l d0,d0
    14dc:	    move.w (0,a3,d0.l),d0
    14e0:	    lsl.w #6,d0
    14e2:	    addi.w #40,d0
    14e6:	    move.w d0,88(a0)

  //Generate Right Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMasRight

  WaitBlit();
    14ea:	    movea.l (a2),a6
    14ec:	    jsr -228(a6)

  //custom->color[0] = 0x0f00;

  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
    14f0:	    movea.l 96d66 <custom>,a0
    14f6:	    move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
    14fc:	    move.w #-1,68(a0)

  custom->bltamod = 40; // Skip Left Part of Screen
    1502:	    move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
    1508:	    move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
    150e:	    move.l 96db0 <Sw_framecountscreen>,d0
    1514:	    add.l d0,d0
    1516:	    move.w (0,a3,d0.l),d1
    151a:	    move.w d1,d0
    151c:	    mulu.w #80,d0
    1520:	    movea.l d0,a1
    1522:	    lea 120(a1),a4
    1526:	    move.l 96d94 <Sw_ViewBufferP1>,d0
    152c:	    add.l a4,d0
    152e:	    move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
    1532:	    lea 40(a1),a1
    1536:	    adda.l 96d90 <Sw_DrawBuffer>,a1
    153c:	    move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
    1540:	    move.w d1,d0
    1542:	    mulu.w #40,d0
    1546:	    add.l 44096 <Sw_XMaskRight>,d0
    154c:	    move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
    1550:	    move.w #255,d0
    1554:	    sub.w d1,d0
    1556:	    lsl.w #6,d0
    1558:	    addi.w #20,d0
    155c:	    move.w d0,88(a0)

  //Generate Right Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskRight and merge with unmoved on conflicting pixel
  WaitBlit();
    1560:	    movea.l (a2),a6
    1562:	    jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
    1566:	    movea.l 96d66 <custom>,a0
    156c:	    move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
    1572:	    move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
    1578:	    move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
    157e:	    move.w #38,96(a0)
  custom->bltbmod = -2;
    1584:	    move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
    158a:	    move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
    1590:	    move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
    1596:	    move.l 96db0 <Sw_framecountscreen>,d0
    159c:	    add.l d0,d0
    159e:	    move.w (0,a3,d0.l),d1
    15a2:	    move.w d1,d0
    15a4:	    mulu.w #80,d0
    15a8:	    movea.l d0,a1
    15aa:	    lea 120(a1),a4
    15ae:	    move.l 96d94 <Sw_ViewBufferP1>,d0
    15b4:	    add.l a4,d0
    15b6:	    move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
    15ba:	    move.w d1,d0
    15bc:	    mulu.w #40,d0
    15c0:	    add.l 44096 <Sw_XMaskRight>,d0
    15c6:	    move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
    15ca:	    lea 38(a1),a1
    15ce:	    move.l 96d90 <Sw_DrawBuffer>,d0
    15d4:	    add.l a1,d0
    15d6:	    move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
    15da:	    move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
    15de:	    move.w #255,d0
    15e2:	    sub.w d1,d0
    15e4:	    lsl.w #6,d0
    15e6:	    addi.w #21,d0
    15ea:	    move.w d0,88(a0)

  //Generate Left Part of Screen Part 1
  //Copy unaltered part to screen using Sw_XMaskLeft

  WaitBlit();
    15ee:	    movea.l (a2),a6
    15f0:	    jsr -228(a6)
  custom->bltafwm = 0xffff;
    15f4:	    movea.l 96d66 <custom>,a1
    15fa:	    move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
    1600:	    move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
    1606:	    move.w #3376,64(a1)
  custom->bltbmod = 0;
    160c:	    move.w #0,98(a1)
  custom->bltcon1 = 0;  
    1612:	    move.w #0,66(a1)

  custom->bltamod = 40; // Skip Right Part of Screen
    1618:	    move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
    161e:	    move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
    1624:	    move.l 96db0 <Sw_framecountscreen>,d0
    162a:	    add.l d0,d0
    162c:	    move.w (0,a3,d0.l),d1
    1630:	    moveq #0,d2
    1632:	    move.w d1,d2
    1634:	    movea.l d2,a0
    1636:	    addq.l #1,a0
    1638:	    move.l a0,d0
    163a:	    add.l a0,d0
    163c:	    add.l d0,d0
    163e:	    add.l a0,d0
    1640:	    lsl.l #4,d0
    1642:	    movea.l 96d94 <Sw_ViewBufferP1>,a0
    1648:	    adda.l d0,a0
    164a:	    move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
    164e:	    movea.w #-80,a0
    1652:	    adda.l d0,a0
    1654:	    move.l 96d90 <Sw_DrawBuffer>,d0
    165a:	    add.l a0,d0
    165c:	    move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
    1660:	    mulu.w #40,d1
    1664:	    add.l 44092 <Sw_XMaskLeft>,d1
    166a:	    move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
    166e:	    moveq #0,d0
    1670:	    not.b d0
    1672:	    sub.l d2,d0
    1674:	    lsl.w #6,d0
    1676:	    addi.w #20,d0
    167a:	    move.w d0,88(a1)

  //Generate Left Part of Screen Part 2
  //Copy moved part to screen using Sw_XMaskLeft and merge with unmoved on conflicting pixel
  WaitBlit();
    167e:	    movea.l (a2),a6
    1680:	    jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
    1684:	    movea.l 96d66 <custom>,a1
    168a:	    move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
    1690:	    move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
    1696:	    move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
    169c:	    move.w #40,96(a1)

  custom->bltamod = 40; // Skip Right Part of Screen
    16a2:	    move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
    16a8:	    move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
    16ae:	    move.l 96db0 <Sw_framecountscreen>,d0
    16b4:	    add.l d0,d0
    16b6:	    move.w (0,a3,d0.l),d2
    16ba:	    moveq #0,d3
    16bc:	    move.w d2,d3
    16be:	    movea.l d3,a0
    16c0:	    addq.l #1,a0
    16c2:	    move.l a0,d1
    16c4:	    add.l a0,d1
    16c6:	    move.l d1,d0
    16c8:	    add.l d1,d0
    16ca:	    add.l a0,d0
    16cc:	    lsl.l #4,d0
    16ce:	    move.l 96d94 <Sw_ViewBufferP1>,d1
    16d4:	    add.l d0,d1
    16d6:	    move.l d1,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
    16da:	    mulu.w #40,d2
    16de:	    add.l 44092 <Sw_XMaskLeft>,d2
    16e4:	    move.l d2,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
    16e8:	    movea.w #-80,a0
    16ec:	    adda.l d0,a0
    16ee:	    move.l 96d90 <Sw_DrawBuffer>,d0
    16f4:	    add.l a0,d0
    16f6:	    move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
    16fa:	    move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
    16fe:	    moveq #0,d0
    1700:	    not.b d0
    1702:	    sub.l d3,d0
    1704:	    lsl.w #6,d0
    1706:	    addi.w #20,d0
    170a:	    move.w d0,88(a1)

  WaitBlit();
    170e:	    movea.l (a2),a6
    1710:	    jsr -228(a6)
  
  Sw_BlitFinished = 1;
    1714:	    move.w #1,96db8 <Sw_BlitFinished>

  custom->color[0] = 0x00;
    171c:	    movea.l 96d66 <custom>,a0
    1722:	    move.w #0,384(a0)

  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
    1728:	    move.l 96db0 <Sw_framecountscreen>,d0
    172e:	    addq.l #1,d0
    1730:	    moveq #17,d1
    1732:	    cmp.l d0,d1
    1734:	/-- beq.s 1742 <Sw_DrawScreen3+0x328>
    1736:	|   move.l d0,96db0 <Sw_framecountscreen>

}
    173c:	|   movem.l (sp)+,d2-d3/a2-a4/a6
    1740:	|   rts
    1742:	\-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
    1744:	    move.l d0,96db0 <Sw_framecountscreen>
}
    174a:	    movem.l (sp)+,d2-d3/a2-a4/a6
    174e:	    rts

00001750 <Sw_ClBuild>:

UWORD Sw_ClColorDimPos = 0;
UWORD Sw_ClColorDimLength = 111;

UWORD * Sw_ClBuild() {
    1750:	             movem.l d2-d3/a2-a3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1754:	             movea.l 96d62 <SysBase>,a6
    175a:	             move.l #1360,d0
    1760:	             moveq #2,d1
    1762:	             jsr -198(a6)
    1766:	             movea.l d0,a2
  
  if( retval == 0) {
    1768:	             tst.l d0
    176a:	   /-------- beq.w 18e2 <Sw_ClBuild+0x192>
  }
  ULONG *cl = retval;
  ULONG *clpartinstruction;
  clpartinstruction = Sw_ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    176e:	/--|-------> move.l 4409e <Sw_ClsSprites>,(a2)
    1774:	|  |         move.l 440a2 <Sw_ClsSprites+0x4>,4(a2)
    177c:	|  |         move.l 440a6 <Sw_ClsSprites+0x8>,8(a2)
    1784:	|  |         move.l 440aa <Sw_ClsSprites+0xc>,12(a2)
    178c:	|  |         move.l 440ae <Sw_ClsSprites+0x10>,16(a2)
    1794:	|  |         move.l 440b2 <Sw_ClsSprites+0x14>,20(a2)
    179c:	|  |         move.l 440b6 <Sw_ClsSprites+0x18>,24(a2)
    17a4:	|  |         move.l 440ba <Sw_ClsSprites+0x1c>,28(a2)
    17ac:	|  |         move.l 440be <Sw_ClsSprites+0x20>,32(a2)
    17b4:	|  |         move.l 440c2 <Sw_ClsSprites+0x24>,36(a2)
    17bc:	|  |         move.l 440c6 <Sw_ClsSprites+0x28>,40(a2)
    17c4:	|  |         move.l 440ca <Sw_ClsSprites+0x2c>,44(a2)
    17cc:	|  |         move.l 440ce <Sw_ClsSprites+0x30>,48(a2)
    17d4:	|  |         move.l 440d2 <Sw_ClsSprites+0x34>,52(a2)
    17dc:	|  |         move.l 440d6 <Sw_ClsSprites+0x38>,56(a2)
    17e4:	|  |         move.l 440da <Sw_ClsSprites+0x3c>,60(a2)

  clpartinstruction = Sw_ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    17ec:	|  |         move.l 440de <Sw_ClScreen>,64(a2)
    17f4:	|  |         move.l 440e2 <Sw_ClScreen+0x4>,68(a2)
    17fc:	|  |         move.l 440e6 <Sw_ClScreen+0x8>,72(a2)
    1804:	|  |         move.l 440ea <Sw_ClScreen+0xc>,76(a2)
    180c:	|  |         move.l 440ee <Sw_ClScreen+0x10>,80(a2)
    1814:	|  |         move.l 440f2 <Sw_ClScreen+0x14>,84(a2)
    181c:	|  |         move.l 440f6 <Sw_ClScreen+0x18>,88(a2)
    1824:	|  |         move.l 440fa <Sw_ClScreen+0x1c>,92(a2)
    182c:	|  |         move.l 440fe <Sw_ClScreen+0x20>,96(a2)
    1834:	|  |         move.l 44102 <Sw_ClScreen+0x24>,100(a2)
    183c:	|  |         move.l 44106 <Sw_ClScreen+0x28>,104(a2)
    1844:	|  |         move.l 4410a <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    184c:	|  |         move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    1854:	|  |         move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    185c:	|  |         move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    1864:	|  |         move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    186c:	|  |         move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    1874:	|  |         move.l #15335424,132(a2)
  clpartinstruction = Sw_ClColor;
  for(int i=0; i<4;i++)
  {
    *cl++ = *clpartinstruction++;
    187c:	|  |         move.l 4410e <Sw_ClColor>,136(a2)
    1884:	|  |         move.l 44112 <Sw_ClColor+0x4>,140(a2)
    188c:	|  |         move.l 44116 <Sw_ClColor+0x8>,144(a2)
    1894:	|  |         move.l 4411a <Sw_ClColor+0xc>,148(a2)
  for(int i=0; i<4;i++)
    189c:	|  |         lea 152(a2),a3
  }  

  clpartinstruction = Sw_ClColorDim;
    18a0:	|  |         movea.l 4409a <Sw_ClColorDim>,a0

  for(int i=0; i<Sw_ClColorDimLength;i++) 
    18a6:	|  |         move.w 446c6 <Sw_ClColorDimLength>,d0
    18ac:	|  |  /----- beq.s 18c6 <Sw_ClBuild+0x176>
    18ae:	|  |  |      movea.l a3,a1
    18b0:	|  |  |      andi.l #65535,d0
    18b6:	|  |  |      add.l d0,d0
    18b8:	|  |  |      add.l d0,d0
    18ba:	|  |  |      move.l a0,d1
    18bc:	|  |  |      add.l d0,d1
  {
    *cl++ = *clpartinstruction++;
    18be:	|  |  |  /-> move.l (a0)+,(a1)+
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    18c0:	|  |  |  |   cmp.l a0,d1
    18c2:	|  |  |  \-- bne.s 18be <Sw_ClBuild+0x16e>
    18c4:	|  |  |      adda.l d0,a3
  }
  *cl++ = 0x20bffffe;
    18c6:	|  |  \----> move.l #549453822,(a3)
  *cl++ = 0x009c8010;
    18cc:	|  |         move.l #10256400,4(a3)
  *cl++ = 0xfffffffe;
    18d4:	|  |         moveq #-2,d0
    18d6:	|  |         move.l d0,8(a3)
  return (UWORD *) retval;  
}
    18da:	|  |         move.l a2,d0
    18dc:	|  |         movem.l (sp)+,d2-d3/a2-a3/a6
    18e0:	|  |         rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    18e2:	|  \-------> movea.l 96d6a <DOSBase>,a6
    18e8:	|            jsr -60(a6)
    18ec:	|            movea.l 96d6a <DOSBase>,a6
    18f2:	|            move.l d0,d1
    18f4:	|            move.l #56915,d2
    18fa:	|            moveq #40,d3
    18fc:	|            jsr -48(a6)
    Exit(1);
    1900:	|            movea.l 96d6a <DOSBase>,a6
    1906:	|            moveq #1,d1
    1908:	|            jsr -144(a6)
  for(int i=0; i<16;i++)
    190c:	\----------- bra.w 176e <Sw_ClBuild+0x1e>

00001910 <Sw_VblankHandler>:
UWORD Sw_InitComplete = 0;
UWORD Sw_MusicDelay = 50;

void Sw_VblankHandler() {

  custom->intreq = 0x0020;
    1910:	             movea.l 96d66 <custom>,a0
    1916:	             move.w #32,156(a0)
  if(Sw_MusicDelay > 0) {
    191c:	             move.w 446c8 <Sw_MusicDelay>,d0
    1922:	         /-- beq.s 1932 <Sw_VblankHandler+0x22>
    Sw_MusicDelay--;
    1924:	         |   move.w 446c8 <Sw_MusicDelay>,d0
    192a:	         |   subq.w #1,d0
    192c:	         |   move.w d0,446c8 <Sw_MusicDelay>
  } else {
    //p61Music();
  }

  if( Sw_InitComplete == 1) {
    1932:	         \-> move.w 96dc2 <Sw_InitComplete>,d0
    1938:	             cmpi.w #1,d0
    193c:	/----------- bne.s 198a <Sw_VblankHandler+0x7a>
    if( FrameCountBufferDraw == 2) {
    193e:	|            move.w 4408c <FrameCountBufferDraw>,d0
    1944:	|            cmpi.w #2,d0
    1948:	|  /-------- bne.s 1974 <Sw_VblankHandler+0x64>
      FrameCountBufferDraw = 0;
    194a:	|  |         move.w #0,4408c <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    1952:	|  |         move.w #1,96da2 <Sw_BlitFrame>

      if(Sw_ScreenBufferOffset == 0) { 
    195a:	|  |         move.w 96dc0 <Sw_ScreenBufferOffset>,d0
    1960:	|  |     /-- bne.s 196c <Sw_VblankHandler+0x5c>
        Sw_ScreenBufferOffset = 2; 
    1962:	|  |     |   move.w #2,96dc0 <Sw_ScreenBufferOffset>
    196a:	|  |  /--|-- bra.s 1982 <Sw_VblankHandler+0x72>
      } else {
        Sw_ScreenBufferOffset = 0; 
    196c:	|  |  |  \-> clr.w 96dc0 <Sw_ScreenBufferOffset>
    1972:	|  |  +----- bra.s 1982 <Sw_VblankHandler+0x72>
      }
    } 
    else
    {
      FrameCountBufferDraw++;
    1974:	|  \--|----> move.w 4408c <FrameCountBufferDraw>,d0
    197a:	|     |      addq.w #1,d0
    197c:	|     |      move.w d0,4408c <FrameCountBufferDraw>
    }
    Sw_SetBplPointers();
    1982:	|     \----> jsr 1c7a <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1986:	|            jsr 1cd0 <Sw_SetColors>(pc)
  }
}
    198a:	\----------> nop
    198c:	             rts

0000198e <Sw_PrepareDisplay>:

ULONG *Sw_ScreenBufferList[15];

UWORD debugpal[] = { 0x0000, 0x0fff };

int Sw_PrepareDisplay() {
    198e:	             movem.l d2-d3/a2-a3/a6,-(sp)

  SwScrollerFinished = 0;
    1992:	             clr.w 96da0 <SwScrollerFinished>

  debug_register_palette( debugpal, "debug.pal", 2, 0);
    1998:	             clr.l -(sp)
    199a:	             pea 2 <_start+0x2>
    199e:	             pea de79 <incbin_Sw_ClColorDim_end+0x27>
    19a4:	             pea 446ca <debugpal>
    19aa:	             jsr 64d8 <debug_register_palette>(pc)

  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    19ae:	             movea.l 96d62 <SysBase>,a6
    19b4:	             move.l #4000,d0
    19ba:	             moveq #2,d1
    19bc:	             jsr -198(a6)
    19c0:	             move.l d0,96dac <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    19c6:	             clr.l -(sp)
    19c8:	             pea 1 <_start+0x1>
    19cc:	             pea 32 <_start+0x32>
    19d0:	             pea 200 <Utils_DrawLinePrepare+0x38>
    19d4:	             pea de83 <incbin_Sw_ClColorDim_end+0x31>
    19da:	             move.l d0,-(sp)
    19dc:	             lea 63d6 <debug_register_bitmap>(pc),a3
    19e0:	             jsr (a3)

  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    19e2:	             lea 36(sp),sp
    19e6:	             clr.l (sp)
    19e8:	             pea 14 <_start+0x14>
    19ec:	             pea 32 <_start+0x32>
    19f0:	             clr.l -(sp)
    19f2:	             move.l 96dac <Sw_FontBuffer>,-(sp)
    19f8:	             lea b8 <Utils_FillLong>(pc),a2
    19fc:	             jsr (a2)

  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    19fe:	             movea.l 96d62 <SysBase>,a6
    1a04:	             move.l #20560,d0
    1a0a:	             moveq #2,d1
    1a0c:	             jsr -198(a6)
    1a10:	             move.l d0,96d88 <Sw_ScreenBuffer2>
  
  if(Sw_ScreenBuffer2 == 0) {
    1a16:	             lea 20(sp),sp
    1a1a:	      /----- beq.w 1b5c <Sw_PrepareDisplay+0x1ce>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    1a1e:	      |      clr.l -(sp)
    1a20:	      |      pea 1 <_start+0x1>
    1a24:	      |      pea 101 <Utils_FillLong+0x49>
    1a28:	      |      pea 200 <Utils_DrawLinePrepare+0x38>
    1a2c:	      |      pea deb9 <incbin_Sw_ClColorDim_end+0x67>
    1a32:	      |      move.l d0,-(sp)
    1a34:	      |      jsr (a3)

  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    1a36:	      |      clr.l -(sp)
    1a38:	      |      pea 14 <_start+0x14>
    1a3c:	      |      pea 100 <Utils_FillLong+0x48>
    1a40:	      |      clr.l -(sp)
    1a42:	      |      move.l 96d88 <Sw_ScreenBuffer2>,-(sp)
    1a48:	      |      jsr (a2)
 

  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    1a4a:	      |      movea.l 96d62 <SysBase>,a6
    1a50:	      |      move.l #20560,d0
    1a56:	      |      moveq #2,d1
    1a58:	      |      jsr -198(a6)
    1a5c:	      |      move.l d0,96d8c <Sw_ScreenBuffer1>
  
  if(Sw_ScreenBuffer1 == 0) {
    1a62:	      |      lea 44(sp),sp
    1a66:	/-----|----- beq.w 1b28 <Sw_PrepareDisplay+0x19a>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    1a6a:	|  /--|----> clr.l -(sp)
    1a6c:	|  |  |      pea 1 <_start+0x1>
    1a70:	|  |  |      pea 101 <Utils_FillLong+0x49>
    1a74:	|  |  |      pea 200 <Utils_DrawLinePrepare+0x38>
    1a78:	|  |  |      pea decb <incbin_Sw_ClColorDim_end+0x79>
    1a7e:	|  |  |      move.l d0,-(sp)
    1a80:	|  |  |      jsr (a3)

  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    1a82:	|  |  |      clr.l -(sp)
    1a84:	|  |  |      pea 14 <_start+0x14>
    1a88:	|  |  |      pea 100 <Utils_FillLong+0x48>
    1a8c:	|  |  |      clr.l -(sp)
    1a8e:	|  |  |      move.l 96d8c <Sw_ScreenBuffer1>,-(sp)
    1a94:	|  |  |      jsr (a2)

  Sw_ViewCopper = Sw_ClBuild( );
    1a96:	|  |  |      lea 44(sp),sp
    1a9a:	|  |  |      lea 1750 <Sw_ClBuild>(pc),a2
    1a9e:	|  |  |      jsr (a2)
    1aa0:	|  |  |      move.l d0,96da4 <Sw_ViewCopper>
  Sw_DrawCopper = Sw_ClBuild( );
    1aa6:	|  |  |      jsr (a2)
    1aa8:	|  |  |      move.l d0,96da8 <Sw_DrawCopper>
  Sw_SwapCl();
    1aae:	|  |  |      jsr 1dae <Sw_SwapCl>(pc)

  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    1ab2:	|  |  |      movea.l 96d62 <SysBase>,a6
    1ab8:	|  |  |      moveq #22,d0
    1aba:	|  |  |      move.l #65537,d1
    1ac0:	|  |  |      jsr -198(a6)
    1ac4:	|  |  |      movea.l d0,a1
    1ac6:	|  |  |      move.l d0,96dbc <Sw_Vbint>
    1acc:	|  |  |  /-- beq.s 1ae8 <Sw_PrepareDisplay+0x15a>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1ace:	|  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Pri = -60;
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    1ad4:	|  |  |  |   move.l #57053,10(a1)
    Sw_Vbint->is_Data = NULL;
    1adc:	|  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    1ae0:	|  |  |  |   move.l #6416,18(a1)
  }

  AddIntServer( INTB_COPER, Sw_Vbint);
    1ae8:	|  |  |  \-> movea.l 96d62 <SysBase>,a6
    1aee:	|  |  |      moveq #4,d0
    1af0:	|  |  |      jsr -168(a6)
      0     0     33  66     2   1   1   3
      0     0     0   100    2   1   1   1   
  
  */

  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    1af4:	|  |  |      move.l 96d8c <Sw_ScreenBuffer1>,d0
    1afa:	|  |  |      move.l d0,96dc4 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    1b00:	|  |  |      move.l 96d88 <Sw_ScreenBuffer2>,d1
    1b06:	|  |  |      move.l d1,96dc8 <Sw_ScreenBufferList+0x4>

  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    1b0c:	|  |  |      move.l d1,96dcc <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    1b12:	|  |  |      move.l d0,96dd0 <Sw_ScreenBufferList+0xc>

  Sw_InitComplete = 1;
    1b18:	|  |  |      move.w #1,96dc2 <Sw_InitComplete>

  return 0;
}
    1b20:	|  |  |      moveq #0,d0
    1b22:	|  |  |      movem.l (sp)+,d2-d3/a2-a3/a6
    1b26:	|  |  |      rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1b28:	>--|--|----> movea.l 96d6a <DOSBase>,a6
    1b2e:	|  |  |      jsr -60(a6)
    1b32:	|  |  |      movea.l 96d6a <DOSBase>,a6
    1b38:	|  |  |      move.l d0,d1
    1b3a:	|  |  |      move.l #56978,d2
    1b40:	|  |  |      moveq #38,d3
    1b42:	|  |  |      jsr -48(a6)
    Exit(1);
    1b46:	|  |  |      movea.l 96d6a <DOSBase>,a6
    1b4c:	|  |  |      moveq #1,d1
    1b4e:	|  |  |      jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    1b52:	|  |  |      move.l 96d8c <Sw_ScreenBuffer1>,d0
    1b58:	|  +--|----- bra.w 1a6a <Sw_PrepareDisplay+0xdc>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1b5c:	|  |  \----> movea.l 96d6a <DOSBase>,a6
    1b62:	|  |         jsr -60(a6)
    1b66:	|  |         movea.l 96d6a <DOSBase>,a6
    1b6c:	|  |         move.l d0,d1
    1b6e:	|  |         move.l #56978,d2
    1b74:	|  |         moveq #38,d3
    1b76:	|  |         jsr -48(a6)
    Exit(1);
    1b7a:	|  |         movea.l 96d6a <DOSBase>,a6
    1b80:	|  |         moveq #1,d1
    1b82:	|  |         jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    1b86:	|  |         move.l 96d88 <Sw_ScreenBuffer2>,d0
    1b8c:	|  |         clr.l -(sp)
    1b8e:	|  |         pea 1 <_start+0x1>
    1b92:	|  |         pea 101 <Utils_FillLong+0x49>
    1b96:	|  |         pea 200 <Utils_DrawLinePrepare+0x38>
    1b9a:	|  |         pea deb9 <incbin_Sw_ClColorDim_end+0x67>
    1ba0:	|  |         move.l d0,-(sp)
    1ba2:	|  |         jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    1ba4:	|  |         clr.l -(sp)
    1ba6:	|  |         pea 14 <_start+0x14>
    1baa:	|  |         pea 100 <Utils_FillLong+0x48>
    1bae:	|  |         clr.l -(sp)
    1bb0:	|  |         move.l 96d88 <Sw_ScreenBuffer2>,-(sp)
    1bb6:	|  |         jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    1bb8:	|  |         movea.l 96d62 <SysBase>,a6
    1bbe:	|  |         move.l #20560,d0
    1bc4:	|  |         moveq #2,d1
    1bc6:	|  |         jsr -198(a6)
    1bca:	|  |         move.l d0,96d8c <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    1bd0:	|  |         lea 44(sp),sp
    1bd4:	|  \-------- bne.w 1a6a <Sw_PrepareDisplay+0xdc>
    1bd8:	\----------- bra.w 1b28 <Sw_PrepareDisplay+0x19a>

00001bdc <Sw_Cleanup>:

void Sw_Cleanup() {
    1bdc:	lea -32(sp),sp
    1be0:	move.l a6,-(sp)
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
    1be2:	move.l 96d8c <Sw_ScreenBuffer1>,32(sp)
    1bea:	move.l #20560,28(sp)
    1bf2:	move.l 96d62 <SysBase>,d0
    1bf8:	movea.l d0,a6
    1bfa:	movea.l 32(sp),a1
    1bfe:	move.l 28(sp),d0
    1c02:	jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
    1c06:	move.l 96d88 <Sw_ScreenBuffer2>,24(sp)
    1c0e:	move.l #20560,20(sp)
    1c16:	move.l 96d62 <SysBase>,d0
    1c1c:	movea.l d0,a6
    1c1e:	movea.l 24(sp),a1
    1c22:	move.l 20(sp),d0
    1c26:	jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
    1c2a:	move.l 96dac <Sw_FontBuffer>,16(sp)
    1c32:	move.l #4000,12(sp)
    1c3a:	move.l 96d62 <SysBase>,d0
    1c40:	movea.l d0,a6
    1c42:	movea.l 16(sp),a1
    1c46:	move.l 12(sp),d0
    1c4a:	jsr -210(a6)
  RemIntServer( INTB_COPER, Sw_Vbint);
    1c4e:	moveq #4,d0
    1c50:	move.l d0,8(sp)
    1c54:	move.l 96dbc <Sw_Vbint>,4(sp)
    1c5c:	move.l 96d62 <SysBase>,d0
    1c62:	movea.l d0,a6
    1c64:	move.l 8(sp),d0
    1c68:	movea.l 4(sp),a1
    1c6c:	jsr -174(a6)
}
    1c70:	nop
    1c72:	movea.l (sp)+,a6
    1c74:	lea 32(sp),sp
    1c78:	rts

00001c7a <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    1c7a:	moveq #0,d0
    1c7c:	move.w 96dc0 <Sw_ScreenBufferOffset>,d0
    1c82:	lea 96dc4 <Sw_ScreenBufferList>,a0
    1c88:	move.l d0,d1
    1c8a:	add.l d0,d1
    1c8c:	add.l d1,d1
    1c8e:	move.l (0,a0,d1.l),96d90 <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1c96:	addq.l #1,d0
    1c98:	add.l d0,d0
    1c9a:	add.l d0,d0
    1c9c:	move.l (0,a0,d0.l),d0
    1ca0:	move.l d0,96d94 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    1ca6:	moveq #80,d1
    1ca8:	add.l d0,d1
    1caa:	move.l d1,96d98 <Sw_ViewBufferP2>

  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    1cb0:	movea.l 96da8 <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    1cb6:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    1cba:	clr.w d0
    1cbc:	swap d0
    1cbe:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    1cc2:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    1cc6:	clr.w d1
    1cc8:	swap d1
    1cca:	move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

}
    1cce:	rts

00001cd0 <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
    1cd0:	             move.l d3,-(sp)
    1cd2:	             move.l d2,-(sp)
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    1cd4:	             movea.l 96da8 <Sw_DrawCopper>,a1
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    1cda:	             move.w 4408c <FrameCountBufferDraw>,d0
    1ce0:	             lea 4410e <Sw_ClColor>,a0
    1ce6:	             andi.l #65535,d0
    1cec:	             lsl.l #4,d0
    1cee:	             move.l (0,a0,d0.l),136(a1)
    1cf4:	             move.w 4408c <FrameCountBufferDraw>,d0
    1cfa:	             andi.l #65535,d0
    1d00:	             add.l d0,d0
    1d02:	             add.l d0,d0
    1d04:	             addq.l #1,d0
    1d06:	             add.l d0,d0
    1d08:	             add.l d0,d0
    1d0a:	             move.l (0,a0,d0.l),140(a1)
    1d10:	             move.w 4408c <FrameCountBufferDraw>,d0
    1d16:	             andi.l #65535,d0
    1d1c:	             add.l d0,d0
    1d1e:	             add.l d0,d0
    1d20:	             addq.l #2,d0
    1d22:	             add.l d0,d0
    1d24:	             add.l d0,d0
    1d26:	             move.l (0,a0,d0.l),144(a1)
    1d2c:	             move.w 4408c <FrameCountBufferDraw>,d0
    1d32:	             andi.l #65535,d0
    1d38:	             add.l d0,d0
    1d3a:	             add.l d0,d0
    1d3c:	             addq.l #3,d0
    1d3e:	             add.l d0,d0
    1d40:	             add.l d0,d0
    1d42:	             move.l (0,a0,d0.l),148(a1)
  }
  if( ColPos == 12) {
    1d48:	             cmpi.w #12,96e00 <ColPos>
    1d50:	   /-------- beq.s 1da6 <Sw_SetColors+0xd6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    1d52:	/--|-------> move.w 96dba <Sw_ClColorDimPos>,d1
    1d58:	|  |         moveq #0,d0
    1d5a:	|  |         move.w d1,d0
    1d5c:	|  |         movea.l 4409a <Sw_ClColorDim>,a0
    1d62:	|  |         adda.l d0,a0
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    1d64:	|  |         move.w 446c6 <Sw_ClColorDimLength>,d2
    1d6a:	|  |         move.w d2,d0
    1d6c:	|  |         add.w d2,d0
    1d6e:	|  |         add.w d0,d0
    1d70:	|  |         add.w d1,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    1d72:	|  |         moveq #0,d1
    1d74:	|  |         move.w d2,d1
    1d76:	|  |         moveq #0,d3
    1d78:	|  |         move.w d0,d3
    1d7a:	|  |         mulu.w #204,d2
    1d7e:	|  |         cmp.l d3,d2
    1d80:	|  |     /-- bgt.s 1d84 <Sw_SetColors+0xb4>
    1d82:	|  |     |   clr.w d0
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    1d84:	|  |     \-> move.w d0,96dba <Sw_ClColorDimPos>
    Sw_ClColorDimPos = 0;
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
    1d8a:	|  |         tst.l d1
    1d8c:	|  |  /----- beq.s 1da0 <Sw_SetColors+0xd0>
    1d8e:	|  |  |      lea 152(a1),a1
    1d92:	|  |  |      add.l d1,d1
    1d94:	|  |  |      add.l d1,d1
    1d96:	|  |  |      move.l a0,d0
    1d98:	|  |  |      add.l d1,d0
  {
    *cl++ = *clpartinstruction++;
    1d9a:	|  |  |  /-> move.l (a0)+,(a1)+
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    1d9c:	|  |  |  |   cmp.l a0,d0
    1d9e:	|  |  |  \-- bne.s 1d9a <Sw_SetColors+0xca>

  }
}
    1da0:	|  |  \----> move.l (sp)+,d2
    1da2:	|  |         move.l (sp)+,d3
    1da4:	|  |         rts
    ColPos = 0;
    1da6:	|  \-------> clr.w 96e00 <ColPos>
    1dac:	\----------- bra.s 1d52 <Sw_SetColors+0x82>

00001dae <Sw_SwapCl>:

void Sw_SwapCl() {
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    1dae:	movea.l 96d66 <custom>,a0
    1db4:	move.l 96da8 <Sw_DrawCopper>,128(a0)
}
    1dbc:	rts

00001dbe <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    1dbe:	rts

00001dc0 <End_DrawScreen>:

void End_DrawScreen() {    
}
    1dc0:	rts

00001dc2 <End_ClBuild>:

UWORD * End_ClBuild() {
    1dc2:	       movem.l d2-d5/a2/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1dc6:	       movea.l 96d62 <SysBase>,a6
    1dcc:	       move.l #1360,d0
    1dd2:	       moveq #2,d1
    1dd4:	       jsr -198(a6)
    1dd8:	       movea.l d0,a2
  
  if( retval == 0) {
    1dda:	       tst.l d0
    1ddc:	   /-- beq.w 1f9c <End_ClBuild+0x1da>
  /**cl = 0xfffffffe;
  return retval;*/
  ULONG *clpartinstruction;
  clpartinstruction = End_ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    1de0:	   |   move.l 446d6 <End_ClsSprites>,(a2)
    1de6:	   |   move.l 446da <End_ClsSprites+0x4>,4(a2)
    1dee:	   |   move.l 446de <End_ClsSprites+0x8>,8(a2)
    1df6:	   |   move.l 446e2 <End_ClsSprites+0xc>,12(a2)
    1dfe:	   |   move.l 446e6 <End_ClsSprites+0x10>,16(a2)
    1e06:	   |   move.l 446ea <End_ClsSprites+0x14>,20(a2)
    1e0e:	   |   move.l 446ee <End_ClsSprites+0x18>,24(a2)
    1e16:	   |   move.l 446f2 <End_ClsSprites+0x1c>,28(a2)
    1e1e:	   |   move.l 446f6 <End_ClsSprites+0x20>,32(a2)
    1e26:	   |   move.l 446fa <End_ClsSprites+0x24>,36(a2)
    1e2e:	   |   move.l 446fe <End_ClsSprites+0x28>,40(a2)
    1e36:	   |   move.l 44702 <End_ClsSprites+0x2c>,44(a2)
    1e3e:	   |   move.l 44706 <End_ClsSprites+0x30>,48(a2)
    1e46:	   |   move.l 4470a <End_ClsSprites+0x34>,52(a2)
    1e4e:	   |   move.l 4470e <End_ClsSprites+0x38>,56(a2)
    1e56:	   |   move.l 44712 <End_ClsSprites+0x3c>,60(a2)

  clpartinstruction = End_ClScreen;

  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    1e5e:	   |   move.l 446ce <End_Bitmap>,d0
  UWORD bpl1pointerlow = (ULONG)End_Bitmap & 0xffff;
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    1e64:	   |   move.l d0,d4
    1e66:	   |   addi.l #10240,d4
  UWORD bpl2pointerlow = (ULONG)(End_Bitmap + 10240) & 0xffff;
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    1e6c:	   |   move.l d0,d3
    1e6e:	   |   addi.l #20480,d3
  UWORD bpl3pointerlow = (ULONG)(End_Bitmap + 10240*2) & 0xffff;
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    1e74:	   |   move.l d0,d2
    1e76:	   |   addi.l #30720,d2
  UWORD bpl4pointerlow = (ULONG)(End_Bitmap + 10240*3) & 0xffff;
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    1e7c:	   |   move.l d0,d1
    1e7e:	   |   addi.l #40960,d1
  UWORD bpl5pointerlow = (ULONG)(End_Bitmap + 10240*4) & 0xffff;

  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    1e84:	   |   move.l 44716 <End_ClScreen>,64(a2)
    1e8c:	   |   move.l 4471a <End_ClScreen+0x4>,68(a2)
    1e94:	   |   move.l 4471e <End_ClScreen+0x8>,72(a2)
    1e9c:	   |   move.l 44722 <End_ClScreen+0xc>,76(a2)
    1ea4:	   |   move.l 44726 <End_ClScreen+0x10>,80(a2)
    1eac:	   |   move.l 4472a <End_ClScreen+0x14>,84(a2)
    1eb4:	   |   move.l 4472e <End_ClScreen+0x18>,88(a2)
    1ebc:	   |   move.l 44732 <End_ClScreen+0x1c>,92(a2)
    1ec4:	   |   move.l 44736 <End_ClScreen+0x20>,96(a2)
    1ecc:	   |   move.l 4473a <End_ClScreen+0x24>,100(a2)
    1ed4:	   |   move.l 4473e <End_ClScreen+0x28>,104(a2)
    1edc:	   |   move.l 44742 <End_ClScreen+0x2c>,108(a2)

  UWORD *cw = (UWORD *) cl;

  *cw++ = 0x00e0;
    1ee4:	   |   move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    1eea:	   |   move.l d0,d5
    1eec:	   |   clr.w d5
    1eee:	   |   swap d5
    1ef0:	   |   move.w d5,114(a2)
  *cw++ = bpl1pointerhigh;
  *cw++ = 0x00e2;
    1ef4:	   |   move.w #226,116(a2)
  UWORD bpl1pointerlow = (ULONG)End_Bitmap & 0xffff;
    1efa:	   |   move.w d0,118(a2)
  *cw++ = bpl1pointerlow;
  *cw++ = 0x00e4;
    1efe:	   |   move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    1f04:	   |   move.l d4,d0
    1f06:	   |   clr.w d0
    1f08:	   |   swap d0
    1f0a:	   |   move.w d0,122(a2)
  *cw++ = bpl2pointerhigh;  
  *cw++ = 0x00e6;
    1f0e:	   |   move.w #230,124(a2)
  UWORD bpl2pointerlow = (ULONG)(End_Bitmap + 10240) & 0xffff;
    1f14:	   |   move.w d4,126(a2)
  *cw++ = bpl2pointerlow;
  *cw++ = 0x00e8;
    1f18:	   |   move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    1f1e:	   |   move.l d3,d0
    1f20:	   |   clr.w d0
    1f22:	   |   swap d0
    1f24:	   |   move.w d0,130(a2)
  *cw++ = bpl3pointerhigh;  
  *cw++ = 0x00ea;
    1f28:	   |   move.w #234,132(a2)
  UWORD bpl3pointerlow = (ULONG)(End_Bitmap + 10240*2) & 0xffff;
    1f2e:	   |   move.w d3,134(a2)
  *cw++ = bpl3pointerlow;  
  *cw++ = 0x00ec;
    1f32:	   |   move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    1f38:	   |   move.l d2,d0
    1f3a:	   |   clr.w d0
    1f3c:	   |   swap d0
    1f3e:	   |   move.w d0,138(a2)
  *cw++ = bpl4pointerhigh;  
  *cw++ = 0x00ee;
    1f42:	   |   move.w #238,140(a2)
  UWORD bpl4pointerlow = (ULONG)(End_Bitmap + 10240*3) & 0xffff;
    1f48:	   |   move.w d2,142(a2)
  *cw++ = bpl4pointerlow;  
  *cw++ = 0x00f0;
    1f4c:	   |   move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    1f52:	   |   move.l d1,d0
    1f54:	   |   clr.w d0
    1f56:	   |   swap d0
    1f58:	   |   move.w d0,146(a2)
  *cw++ = bpl5pointerhigh;  
  *cw++ = 0x00f2;
    1f5c:	   |   move.w #242,148(a2)
  UWORD bpl5pointerlow = (ULONG)(End_Bitmap + 10240*4) & 0xffff;
    1f62:	   |   move.w d1,150(a2)
  *cw++ = bpl5pointerlow;  


  cl = (ULONG *) cw;
  clpartinstruction = End_ClColor;
    1f66:	   |   movea.l 446d2 <End_ClColor>,a0
  for(int i=0; i<32;i++)
    1f6c:	   |   lea 152(a2),a1
    1f70:	   |   move.l a0,d0
    1f72:	   |   addi.l #128,d0
  {
    *cl++ = *clpartinstruction++;
    1f78:	/--|-> move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1f7a:	|  |   cmp.l a0,d0
    1f7c:	+--|-- bne.s 1f78 <End_ClBuild+0x1b6>
  }  

  //*cl++ = 0xffdffffe;
  *cl++ = 0x20bffffe;
    1f7e:	|  |   move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    1f86:	|  |   move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    1f8e:	|  |   moveq #-2,d0
    1f90:	|  |   move.l d0,288(a2)
  return (UWORD *) retval;  
}
    1f94:	|  |   move.l a2,d0
    1f96:	|  |   movem.l (sp)+,d2-d5/a2/a6
    1f9a:	|  |   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1f9c:	|  \-> movea.l 96d6a <DOSBase>,a6
    1fa2:	|      jsr -60(a6)
    1fa6:	|      movea.l 96d6a <DOSBase>,a6
    1fac:	|      move.l d0,d1
    1fae:	|      move.l #56915,d2
    1fb4:	|      moveq #40,d3
    1fb6:	|      jsr -48(a6)
    Exit(1);
    1fba:	|      movea.l 96d6a <DOSBase>,a6
    1fc0:	|      moveq #1,d1
    1fc2:	|      jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1fc6:	|      move.l 446d6 <End_ClsSprites>,(a2)
    1fcc:	|      move.l 446da <End_ClsSprites+0x4>,4(a2)
    1fd4:	|      move.l 446de <End_ClsSprites+0x8>,8(a2)
    1fdc:	|      move.l 446e2 <End_ClsSprites+0xc>,12(a2)
    1fe4:	|      move.l 446e6 <End_ClsSprites+0x10>,16(a2)
    1fec:	|      move.l 446ea <End_ClsSprites+0x14>,20(a2)
    1ff4:	|      move.l 446ee <End_ClsSprites+0x18>,24(a2)
    1ffc:	|      move.l 446f2 <End_ClsSprites+0x1c>,28(a2)
    2004:	|      move.l 446f6 <End_ClsSprites+0x20>,32(a2)
    200c:	|      move.l 446fa <End_ClsSprites+0x24>,36(a2)
    2014:	|      move.l 446fe <End_ClsSprites+0x28>,40(a2)
    201c:	|      move.l 44702 <End_ClsSprites+0x2c>,44(a2)
    2024:	|      move.l 44706 <End_ClsSprites+0x30>,48(a2)
    202c:	|      move.l 4470a <End_ClsSprites+0x34>,52(a2)
    2034:	|      move.l 4470e <End_ClsSprites+0x38>,56(a2)
    203c:	|      move.l 44712 <End_ClsSprites+0x3c>,60(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    2044:	|      move.l 446ce <End_Bitmap>,d0
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    204a:	|      move.l d0,d4
    204c:	|      addi.l #10240,d4
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    2052:	|      move.l d0,d3
    2054:	|      addi.l #20480,d3
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    205a:	|      move.l d0,d2
    205c:	|      addi.l #30720,d2
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    2062:	|      move.l d0,d1
    2064:	|      addi.l #40960,d1
    *cl++ = *clpartinstruction++;
    206a:	|      move.l 44716 <End_ClScreen>,64(a2)
    2072:	|      move.l 4471a <End_ClScreen+0x4>,68(a2)
    207a:	|      move.l 4471e <End_ClScreen+0x8>,72(a2)
    2082:	|      move.l 44722 <End_ClScreen+0xc>,76(a2)
    208a:	|      move.l 44726 <End_ClScreen+0x10>,80(a2)
    2092:	|      move.l 4472a <End_ClScreen+0x14>,84(a2)
    209a:	|      move.l 4472e <End_ClScreen+0x18>,88(a2)
    20a2:	|      move.l 44732 <End_ClScreen+0x1c>,92(a2)
    20aa:	|      move.l 44736 <End_ClScreen+0x20>,96(a2)
    20b2:	|      move.l 4473a <End_ClScreen+0x24>,100(a2)
    20ba:	|      move.l 4473e <End_ClScreen+0x28>,104(a2)
    20c2:	|      move.l 44742 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    20ca:	|      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    20d0:	|      move.l d0,d5
    20d2:	|      clr.w d5
    20d4:	|      swap d5
    20d6:	|      move.w d5,114(a2)
  *cw++ = 0x00e2;
    20da:	|      move.w #226,116(a2)
  UWORD bpl1pointerlow = (ULONG)End_Bitmap & 0xffff;
    20e0:	|      move.w d0,118(a2)
  *cw++ = 0x00e4;
    20e4:	|      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    20ea:	|      move.l d4,d0
    20ec:	|      clr.w d0
    20ee:	|      swap d0
    20f0:	|      move.w d0,122(a2)
  *cw++ = 0x00e6;
    20f4:	|      move.w #230,124(a2)
  UWORD bpl2pointerlow = (ULONG)(End_Bitmap + 10240) & 0xffff;
    20fa:	|      move.w d4,126(a2)
  *cw++ = 0x00e8;
    20fe:	|      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    2104:	|      move.l d3,d0
    2106:	|      clr.w d0
    2108:	|      swap d0
    210a:	|      move.w d0,130(a2)
  *cw++ = 0x00ea;
    210e:	|      move.w #234,132(a2)
  UWORD bpl3pointerlow = (ULONG)(End_Bitmap + 10240*2) & 0xffff;
    2114:	|      move.w d3,134(a2)
  *cw++ = 0x00ec;
    2118:	|      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    211e:	|      move.l d2,d0
    2120:	|      clr.w d0
    2122:	|      swap d0
    2124:	|      move.w d0,138(a2)
  *cw++ = 0x00ee;
    2128:	|      move.w #238,140(a2)
  UWORD bpl4pointerlow = (ULONG)(End_Bitmap + 10240*3) & 0xffff;
    212e:	|      move.w d2,142(a2)
  *cw++ = 0x00f0;
    2132:	|      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    2138:	|      move.l d1,d0
    213a:	|      clr.w d0
    213c:	|      swap d0
    213e:	|      move.w d0,146(a2)
  *cw++ = 0x00f2;
    2142:	|      move.w #242,148(a2)
  UWORD bpl5pointerlow = (ULONG)(End_Bitmap + 10240*4) & 0xffff;
    2148:	|      move.w d1,150(a2)
  clpartinstruction = End_ClColor;
    214c:	|      movea.l 446d2 <End_ClColor>,a0
  for(int i=0; i<32;i++)
    2152:	|      lea 152(a2),a1
    2156:	|      move.l a0,d0
    2158:	|      addi.l #128,d0
    215e:	\----- bra.w 1f78 <End_ClBuild+0x1b6>

00002162 <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    2162:	movea.l 96d66 <custom>,a0
    2168:	move.w #32,156(a0)
  //p61Music();
}
    216e:	nop
    2170:	rts

00002172 <End_PrepareDisplay>:

int End_PrepareDisplay() {
    2172:	    move.l a6,-(sp)

  End_DrawCopper = End_ClBuild( );  
    2174:	    jsr 1dc2 <End_ClBuild>(pc)
    2178:	    move.l d0,96e06 <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    217e:	    movea.l 96d62 <SysBase>,a6
    2184:	    moveq #22,d0
    2186:	    move.l #65537,d1
    218c:	    jsr -198(a6)
    2190:	    movea.l d0,a1
    2192:	    move.l d0,96e0a <End_Vbint>
    2198:	/-- beq.s 21b4 <End_PrepareDisplay+0x42>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    219a:	|   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    21a0:	|   move.l #57053,10(a1)
    End_Vbint->is_Data = NULL;
    21a8:	|   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    21ac:	|   move.l #8546,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    21b4:	\-> movea.l 96d62 <SysBase>,a6
    21ba:	    moveq #4,d0
    21bc:	    jsr -168(a6)
  End_SetCl();
    21c0:	    jsr 21f8 <End_SetCl>(pc)

  return 0;
}
    21c4:	    moveq #0,d0
    21c6:	    movea.l (sp)+,a6
    21c8:	    rts

000021ca <End_Cleanup>:

void End_Cleanup() {
    21ca:	subq.l #8,sp
    21cc:	move.l a6,-(sp)
  RemIntServer( INTB_COPER, End_Vbint);
    21ce:	moveq #4,d0
    21d0:	move.l d0,8(sp)
    21d4:	move.l 96e0a <End_Vbint>,4(sp)
    21dc:	move.l 96d62 <SysBase>,d0
    21e2:	movea.l d0,a6
    21e4:	move.l 8(sp),d0
    21e8:	movea.l 4(sp),a1
    21ec:	jsr -174(a6)
}
    21f0:	nop
    21f2:	movea.l (sp)+,a6
    21f4:	addq.l #8,sp
    21f6:	rts

000021f8 <End_SetCl>:

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    21f8:	movea.l 96d66 <custom>,a0
    21fe:	move.l 96e06 <End_DrawCopper>,128(a0)
  //custom->copjmp1 = End_DrawCopper;
}
    2206:	rts

00002208 <Utils_Lz4DepackAsm>:
WORD *ptrvectorletters;
WORD *ptrvectorlettersreversed;      
WORD *ptrvector;
UBYTE KeyCode;

void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
    2208:	subq.l #4,sp
    220a:	move.l 16(sp),d0
    220e:	move.w d0,d0
    2210:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
    2214:	moveq #11,d0
    2216:	add.l 8(sp),d0
    221a:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
    221c:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
    2220:	moveq #0,d0
    2222:	move.w 2(sp),d0
	__asm volatile (
    2226:	movem.l d0-d7/a2-a6,-(sp)
    222a:	jsr 6914 <_lz4_depack>
    2230:	movem.l (sp)+,d0-d7/a2-a6
		"movem.l %%d0-%%d7/%%a2-%%a6,-(%%sp)\n"
		"jsr _lz4_depack\n"
		"movem.l (%%sp)+,%%d0-%%d7/%%a2-%%a6"
	: "+rf"(_a0), "+rf"(_a1), "=r"(_d1)
	);
}
    2234:	nop
    2236:	addq.l #4,sp
    2238:	rts

0000223a <ClearDirtyArea>:

void ClearDirtyArea( ULONG target, WORD bltsize)
{
    223a:	    move.l 8(sp),d1
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    223e:	    move.w dff002 <_end+0xd67dce>,d0
  (void)tst;
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2244:	/-> move.w dff002 <_end+0xd67dce>,d0
    224a:	|   btst #14,d0
    224e:	\-- bne.s 2244 <ClearDirtyArea+0xa>
  //for(int i=0;i<=2;i++) {
    //custom->bltadat = data;
    custom->bltdpt =(ULONG *)target;
    2250:	    move.l 4(sp),dff054 <_end+0xd67e20>
    custom->bltadat = 0x0;
    2258:	    move.w #0,dff074 <_end+0xd67e40>
    custom->bltsize = bltsize;    
    2260:	    move.w d1,dff058 <_end+0xd67e24>
    target += 64*BPLHEIGHT;
  //}
}
    2266:	    rts

00002268 <ClearDirtyAreaPrepare>:

void ClearDirtyAreaPrepare( WORD bltmod)
{
    2268:	move.l a6,-(sp)
    226a:	move.l d2,-(sp)
    226c:	move.l 12(sp),d2
  volatile struct Custom *custom = (struct Custom*)0xdff000; 
  
  WaitBlit();
    2270:	movea.l 96d6e <GfxBase>,a6
    2276:	jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    227a:	move.w #496,dff040 <_end+0xd67e0c>
  custom->bltcon1 = 0x0;
    2282:	move.w #0,dff042 <_end+0xd67e0e>
  custom->bltdmod = bltmod;
    228a:	move.w d2,dff066 <_end+0xd67e32>
}
    2290:	move.l (sp)+,d2
    2292:	movea.l (sp)+,a6
    2294:	rts

00002296 <DrawScreen>:

WORD firsttime = 1;
WORD Scene = 1;

void DrawScreen()
{    
    2296:	       movem.l d2/a2-a3,-(sp)
  volatile struct Custom *custom = (struct Custom*)0xdff000; 

  //SmartLineFillAsm(1,1,1,1,1,1,1);

  Utils_BlitterPrepare();
    229a:	       jsr 194 <Utils_BlitterPrepare>(pc)

  UWORD result = 0;

  switch(Scene) {
    229e:	       cmpi.w #18,72f90 <Scene>
    22a6:	   /-- bhi.s 231a <DrawScreen+0x84>
    22a8:	   |   moveq #0,d0
    22aa:	   |   move.w 72f90 <Scene>,d0
    22b0:	   |   add.l d0,d0
    22b2:	   |   move.w (22ba <DrawScreen+0x24>,pc,d0.l),d0
    22b6:	   |   jmp (22ba <DrawScreen+0x24>,pc,d0.w)
    22ba:	   |   ori.w #116,-(a0)
    22be:	   |   ori.l #20185450,466(a0)
    22c6:	   |   andi.b #108,d4
    22ca:	   |   andi.l #53085024,(a6)+
    22d0:	   |   movep.l d1,1018(a0)
    22d4:	   |   subi.l #79429670,d6
    22da:	   |   btst d2,-(a4)
    22dc:	   |   movep.w d2,102(a4)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
      Scene = 15;
      break;

    case 15:      
      result = DrawDicesSpecial( CubeNrReverseSizeMercury1, LetterMetaDataMercury1, LetterMetaDataMercury1, 13, 0, 4, 0, 1, 135);
    22e0:	   |   pea 87 <_start+0x87>
    22e4:	   |   pea 1 <_start+0x1>
    22e8:	   |   clr.l -(sp)
    22ea:	   |   pea 4 <_start+0x4>
    22ee:	   |   clr.l -(sp)
    22f0:	   |   pea d <_start+0xd>
    22f4:	   |   pea 72e4c <LetterMetaDataMercury1>
    22fa:	   |   pea 72e4c <LetterMetaDataMercury1>
    2300:	   |   pea 72c44 <CubeNrReverseSizeMercury1>
    2306:	   |   jsr 29cc <DrawDicesSpecial>(pc)
      break;
    230a:	   |   lea 36(sp),sp
    case 18:
      CubeFinished = 1;
      break;
  }

  if(result == 1) Scene++;
    230e:	/--|-> cmpi.w #1,d0
    2312:	|  +-- bne.s 231a <DrawScreen+0x84>
    2314:	|  |   addq.w #1,72f90 <Scene>
}
    231a:	|  \-> movem.l (sp)+,d2/a2-a3
    231e:	|      rts
      CubeFinished = 1;
    2320:	|      move.w #1,96e10 <CubeFinished>
}
    2328:	|      movem.l (sp)+,d2/a2-a3
    232c:	|      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    232e:	|      pea c3 <Utils_FillLong+0xb>
    2332:	|      pea 1 <_start+0x1>
    2336:	|      pea 3 <_start+0x3>
    233a:	|      pea 3 <_start+0x3>
    233e:	|      pea 8 <_start+0x8>
    2342:	|      pea a <_start+0xa>
    2346:	|      pea 7255c <LetterMetaDataReversedSpread>
    234c:	|      pea 72536 <LetterMetaDataSpread1>
    2352:	|      pea 72394 <CubeNrReverseSizeSpread>
    2358:	|      jsr 2878 <DrawDices>(pc)
      break;
    235c:	|      lea 36(sp),sp
    2360:	+----- bra.s 230e <DrawScreen+0x78>
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    2362:	|      pea 2bd8 <SetCl>
    2366:	|      move.l 971e6 <WorkingMem>,-(sp)
    236c:	|      move.l 72582 <PointCubeDataLz4>,-(sp)
    2372:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    2376:	|      jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    2378:	|      move.l 971e6 <WorkingMem>,d2
    237e:	|      pea 52294 <VectorBuffer>
    2384:	|      move.l d2,-(sp)
    2386:	|      move.l 7257e <PointCubeData>,-(sp)
    238c:	|      lea 5832 <LoadVectors>(pc),a2
    2390:	|      jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    2392:	|      pea 251e <DrawScreen+0x288>
    2396:	|      move.l d2,-(sp)
    2398:	|      move.l 7258a <PointLetterDataLz4>,-(sp)
    239e:	|      jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    23a0:	|      move.l 971e6 <WorkingMem>,d2
    23a6:	|      lea 32(sp),sp
    23aa:	|      move.l #416626,(sp)
    23b0:	|      move.l d2,-(sp)
    23b2:	|      move.l 72586 <PointLetterData>,-(sp)
    23b8:	|      jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    23ba:	|      pea 20d8 <End_ClBuild+0x316>
    23be:	|      move.l d2,-(sp)
    23c0:	|      move.l 72592 <PointReversedLetterDataLz4>,-(sp)
    23c6:	|      jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    23c8:	|      pea 5bf72 <LetterBuffer2>
    23ce:	|      move.l 971e6 <WorkingMem>,-(sp)
    23d4:	|      move.l 7258e <PointReversedLetterData>,-(sp)
    23da:	|      jsr (a2)
     Scene = 3;
    23dc:	|      move.w #3,72f90 <Scene>
    23e4:	|      lea 36(sp),sp
}
    23e8:	|      movem.l (sp)+,d2/a2-a3
    23ec:	|      rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    23ee:	|      pea d4 <Utils_FillLong+0x1c>
    23f2:	|      pea 1 <_start+0x1>
    23f6:	|      pea 2 <_start+0x2>
    23fa:	|      pea 3 <_start+0x3>
    23fe:	|      pea 5 <_start+0x5>
    2402:	|      pea 6 <_start+0x6>
    2406:	|      pea 727b6 <LetterMetaDataReversedPoint>
    240c:	|      pea 72798 <LetterMetaDataPoint>
    2412:	|      pea 72596 <CubeNrReverseSizePoint>
    2418:	|      jsr 2878 <DrawDices>(pc)
      break;
    241c:	|      lea 36(sp),sp
    2420:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    2424:	|      pea 24cd <DrawScreen+0x237>
    2428:	|      move.l 971e6 <WorkingMem>,-(sp)
    242e:	|      move.l 5205e <TekCubeDataLz4>,-(sp)
    2434:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    2438:	|      jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    243a:	|      move.l 971e6 <WorkingMem>,d2
    2440:	|      pea 52294 <VectorBuffer>
    2446:	|      move.l d2,-(sp)
    2448:	|      move.l 5205a <TekCubeData>,-(sp)
    244e:	|      lea 5832 <LoadVectors>(pc),a2
    2452:	|      jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    2454:	|      pea 2a8f <DrawDicesSpecial+0xc3>
    2458:	|      move.l d2,-(sp)
    245a:	|      move.l 52066 <TekLetterDataLz4>,-(sp)
    2460:	|      jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    2462:	|      lea 32(sp),sp
    2466:	|      move.l #416626,(sp)
    246c:	|      move.l 971e6 <WorkingMem>,-(sp)
    2472:	|      move.l 52062 <TekLetterData>,-(sp)
    2478:	|      jsr (a2)
      Scene = 5;
    247a:	|      move.w #5,72f90 <Scene>
    2482:	|      lea 12(sp),sp
}
    2486:	|      movem.l (sp)+,d2/a2-a3
    248a:	|      rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    248c:	|      pea 98 <_start+0x98>
    2490:	|      pea 1 <_start+0x1>
    2494:	|      clr.l -(sp)
    2496:	|      pea 3 <_start+0x3>
    249a:	|      clr.l -(sp)
    249c:	|      pea 8 <_start+0x8>
    24a0:	|      pea 52272 <LetterMetaDataTek>
    24a6:	|      pea 52272 <LetterMetaDataTek>
    24ac:	|      pea 5206a <CubeNrReverseSizeTek>
    24b2:	|      jsr 2878 <DrawDices>(pc)
      break;
    24b6:	|      lea 36(sp),sp
    24ba:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    24be:	|      pea 2be6 <SetCl+0xe>
    24c2:	|      move.l 971e6 <WorkingMem>,-(sp)
    24c8:	|      move.l 727d0 <FlexCubeDataLz4>,-(sp)
    24ce:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    24d2:	|      jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    24d4:	|      move.l 971e6 <WorkingMem>,d2
    24da:	|      pea 52294 <VectorBuffer>
    24e0:	|      move.l d2,-(sp)
    24e2:	|      move.l 727cc <FlexCubeData>,-(sp)
    24e8:	|      lea 5832 <LoadVectors>(pc),a2
    24ec:	|      jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    24ee:	|      pea 30a1 <SetCl+0x4c9>
    24f2:	|      move.l d2,-(sp)
    24f4:	|      move.l 727d8 <FlexLetterDataLz4>,-(sp)
    24fa:	|      jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    24fc:	|      lea 32(sp),sp
    2500:	|      move.l #416626,(sp)
    2506:	|      move.l 971e6 <WorkingMem>,-(sp)
    250c:	|      move.l 727d4 <FlexLetterData>,-(sp)
    2512:	|      jsr (a2)
      Scene = 7;
    2514:	|      move.w #7,72f90 <Scene>
    251c:	|      lea 12(sp),sp
}
    2520:	|      movem.l (sp)+,d2/a2-a3
    2524:	|      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    2526:	|      pea af <_start+0xaf>
    252a:	|      pea 1 <_start+0x1>
    252e:	|      clr.l -(sp)
    2530:	|      pea 4 <_start+0x4>
    2534:	|      clr.l -(sp)
    2536:	|      pea a <_start+0xa>
    253a:	|      pea 729e4 <LetterMetaDataFlex>
    2540:	|      pea 729e4 <LetterMetaDataFlex>
    2546:	|      pea 72394 <CubeNrReverseSizeSpread>
    254c:	|      jsr 2878 <DrawDices>(pc)
      break;
    2550:	|      lea 36(sp),sp
    2554:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    2558:	|      pea 23ad <DrawScreen+0x117>
    255c:	|      move.l 971e6 <WorkingMem>,-(sp)
    2562:	|      move.l 72a2a <DesireCubeDataLz4>,-(sp)
    2568:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    256c:	|      jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    256e:	|      move.l 971e6 <WorkingMem>,d2
    2574:	|      pea 52294 <VectorBuffer>
    257a:	|      move.l d2,-(sp)
    257c:	|      move.l 72a26 <DesireCubeData>,-(sp)
    2582:	|      lea 5832 <LoadVectors>(pc),a2
    2586:	|      jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    2588:	|      pea 286a <DrawScreen+0x5d4>
    258c:	|      move.l d2,-(sp)
    258e:	|      move.l 72a32 <DesireLetterDataLz4>,-(sp)
    2594:	|      jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    2596:	|      move.l 971e6 <WorkingMem>,d2
    259c:	|      lea 32(sp),sp
    25a0:	|      move.l #416626,(sp)
    25a6:	|      move.l d2,-(sp)
    25a8:	|      move.l 72a2e <DesireLetterData>,-(sp)
    25ae:	|      jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    25b0:	|      pea 27ff <DrawScreen+0x569>
    25b4:	|      move.l d2,-(sp)
    25b6:	|      move.l 72a3a <DesireReversedLetterDataLz4>,-(sp)
    25bc:	|      jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    25be:	|      pea 5bf72 <LetterBuffer2>
    25c4:	|      move.l 971e6 <WorkingMem>,-(sp)
    25ca:	|      move.l 72a36 <DesireReversedLetterData>,-(sp)
    25d0:	|      jsr (a2)
      Scene = 9;
    25d2:	|      move.w #9,72f90 <Scene>
    25da:	|      lea 36(sp),sp
}
    25de:	|      movem.l (sp)+,d2/a2-a3
    25e2:	|      rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    25e4:	|      pea af <_start+0xaf>
    25e8:	|      pea 1 <_start+0x1>
    25ec:	|      pea 3 <_start+0x3>
    25f0:	|      pea 3 <_start+0x3>
    25f4:	|      pea 8 <_start+0x8>
    25f8:	|      pea 8 <_start+0x8>
    25fc:	|      pea 72c02 <LetterMetaDataReversedDesire>
    2602:	|      pea 72be0 <LetterMetaDataDesire>
    2608:	|      pea 72a3e <CubeNrReverseSizeDesire>
    260e:	|      jsr 2878 <DrawDices>(pc)
      break;
    2612:	|      lea 36(sp),sp
    2616:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    261a:	|      pea 24f2 <DrawScreen+0x25c>
    261e:	|      move.l 971e6 <WorkingMem>,-(sp)
    2624:	|      move.l 51e68 <AtwCubeDataLz4>,-(sp)
    262a:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    262e:	|      jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    2630:	|      move.l 971e6 <WorkingMem>,d2
    2636:	|      pea 52294 <VectorBuffer>
    263c:	|      move.l d2,-(sp)
    263e:	|      move.l 51e64 <AtwCubeData>,-(sp)
    2644:	|      lea 5832 <LoadVectors>(pc),a2
    2648:	|      jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    264a:	|      pea 2c5b <SetCl+0x83>
    264e:	|      move.l d2,-(sp)
    2650:	|      move.l 51e70 <AtwLetterDataLz4>,-(sp)
    2656:	|      jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    2658:	|      lea 32(sp),sp
    265c:	|      move.l #416626,(sp)
    2662:	|      move.l 971e6 <WorkingMem>,-(sp)
    2668:	|      move.l 51e6c <AtwLetterData>,-(sp)
    266e:	|      jsr (a2)
      Scene = 11;
    2670:	|      move.w #11,72f90 <Scene>
    2678:	|      lea 12(sp),sp
}
    267c:	|      movem.l (sp)+,d2/a2-a3
    2680:	|      rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    2682:	|      pea c8 <Utils_FillLong+0x10>
    2686:	|      pea 1 <_start+0x1>
    268a:	|      clr.l -(sp)
    268c:	|      pea 3 <_start+0x3>
    2690:	|      clr.l -(sp)
    2692:	|      pea 8 <_start+0x8>
    2696:	|      pea 52038 <LetterMetaDataReversedAtw>
    269c:	|      pea 52016 <LetterMetaDataAtw>
    26a2:	|      pea 51e74 <CubeNrReverseAtw>
    26a8:	|      jsr 2878 <DrawDices>(pc)
      break;
    26ac:	|      lea 36(sp),sp
    26b0:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    26b4:	|      pea 28fa <DrawDices+0x82>
    26b8:	|      move.l 971e6 <WorkingMem>,-(sp)
    26be:	|      move.l 4a772 <AbyssCubeDataLz4>,-(sp)
    26c4:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    26c8:	|      jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    26ca:	|      move.l 971e6 <WorkingMem>,d2
    26d0:	|      pea 52294 <VectorBuffer>
    26d6:	|      move.l d2,-(sp)
    26d8:	|      move.l 4a76e <AbyssCubeData>,-(sp)
    26de:	|      lea 5832 <LoadVectors>(pc),a2
    26e2:	|      jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    26e4:	|      pea 30ff <SetCl+0x527>
    26e8:	|      move.l d2,-(sp)
    26ea:	|      move.l 4a77a <AbyssLetterDataLz4>,-(sp)
    26f0:	|      jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    26f2:	|      move.l 971e6 <WorkingMem>,d2
    26f8:	|      lea 32(sp),sp
    26fc:	|      move.l #416626,(sp)
    2702:	|      move.l d2,-(sp)
    2704:	|      move.l 4a776 <AbyssLetterData>,-(sp)
    270a:	|      jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    270c:	|      pea 229d <DrawScreen+0x7>
    2710:	|      move.l d2,-(sp)
    2712:	|      move.l 4a782 <AbyssReversedLetterDataLz4>,-(sp)
    2718:	|      jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    271a:	|      pea 5bf72 <LetterBuffer2>
    2720:	|      move.l 971e6 <WorkingMem>,-(sp)
    2726:	|      move.l 4a77e <AbyssReversedLetterData>,-(sp)
    272c:	|      jsr (a2)
      Scene = 13;
    272e:	|      move.w #13,72f90 <Scene>
    2736:	|      lea 36(sp),sp
}
    273a:	|      movem.l (sp)+,d2/a2-a3
    273e:	|      rts
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    2740:	|      pea d0 <Utils_FillLong+0x18>
    2744:	|      pea 1 <_start+0x1>
    2748:	|      pea 2 <_start+0x2>
    274c:	|      pea 3 <_start+0x3>
    2750:	|      pea 6 <_start+0x6>
    2754:	|      pea 9 <_start+0x9>
    2758:	|      pea 51e4c <LetterMetaDataReversedAbyss>
    275e:	|      pea 51e28 <LetterMetaDataAbyss>
    2764:	|      pea 4a786 <CubeNrReverseSizeAbyss>
    276a:	|      jsr 2878 <DrawDices>(pc)
      break;  
    276e:	|      lea 36(sp),sp
    2772:	+----- bra.w 230e <DrawScreen+0x78>
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    2776:	|      pea 2003 <End_ClBuild+0x241>
    277a:	|      move.l 971e6 <WorkingMem>,-(sp)
    2780:	|      move.l 72c28 <MercuryCubeData1Lz4>,-(sp)
    2786:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    278a:	|      jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    278c:	|      move.l 971e6 <WorkingMem>,d2
    2792:	|      pea 52294 <VectorBuffer>
    2798:	|      move.l d2,-(sp)
    279a:	|      move.l 72c24 <MercuryCubeData1>,-(sp)
    27a0:	|      lea 5832 <LoadVectors>(pc),a2
    27a4:	|      jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    27a6:	|      pea 2b27 <DrawDicesSpecial+0x15b>
    27aa:	|      move.l d2,-(sp)
    27ac:	|      move.l 72c30 <MercuryLetterData1Lz4>,-(sp)
    27b2:	|      jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    27b4:	|      lea 32(sp),sp
    27b8:	|      move.l #416626,(sp)
    27be:	|      move.l 971e6 <WorkingMem>,-(sp)
    27c4:	|      move.l 72c2c <MercuryLetterData1>,-(sp)
    27ca:	|      jsr (a2)
      Scene = 15;
    27cc:	|      move.w #15,72f90 <Scene>
    27d4:	|      lea 12(sp),sp
}
    27d8:	|      movem.l (sp)+,d2/a2-a3
    27dc:	|      rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    27de:	|      pea 1928 <Sw_VblankHandler+0x18>
    27e2:	|      move.l 971e6 <WorkingMem>,-(sp)
    27e8:	|      move.l 72c38 <MercuryCubeData2Lz4>,-(sp)
    27ee:	|      lea 2208 <Utils_Lz4DepackAsm>(pc),a3
    27f2:	|      jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    27f4:	|      move.l 971e6 <WorkingMem>,d2
    27fa:	|      pea 52294 <VectorBuffer>
    2800:	|      move.l d2,-(sp)
    2802:	|      move.l 72c34 <MercuryCubeData2>,-(sp)
    2808:	|      lea 5832 <LoadVectors>(pc),a2
    280c:	|      jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    280e:	|      pea 1f6b <End_ClBuild+0x1a9>
    2812:	|      move.l d2,-(sp)
    2814:	|      move.l 72c40 <MercuryLetterData2Lz4>,-(sp)
    281a:	|      jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    281c:	|      lea 32(sp),sp
    2820:	|      move.l #416626,(sp)
    2826:	|      move.l 971e6 <WorkingMem>,-(sp)
    282c:	|      move.l 72c3c <MercuryLetterData2>,-(sp)
    2832:	|      jsr (a2)
      Scene = 17;
    2834:	|      move.w #17,72f90 <Scene>
    283c:	|      lea 12(sp),sp
}
    2840:	|      movem.l (sp)+,d2/a2-a3
    2844:	|      rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    2846:	|      pea 84 <_start+0x84>
    284a:	|      pea 6e <_start+0x6e>
    284e:	|      clr.l -(sp)
    2850:	|      pea 4 <_start+0x4>
    2854:	|      clr.l -(sp)
    2856:	|      pea b <_start+0xb>
    285a:	|      pea 72e7e <LetterMetaDataMercury2>
    2860:	|      pea 72e7e <LetterMetaDataMercury2>
    2866:	|      pea 51e74 <CubeNrReverseAtw>
    286c:	|      jsr 2878 <DrawDices>(pc)
      break;
    2870:	|      lea 36(sp),sp
    2874:	\----- bra.w 230e <DrawScreen+0x78>

00002878 <DrawDices>:

UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    2878:	          movem.l d2-d4/a2,-(sp)
    287c:	          move.l 40(sp),d2
    2880:	          move.l 44(sp),d3

  ptrvector = VectorBuffer +  vectorpos;    
    2884:	          moveq #0,d0
    2886:	          move.w 9721a <vectorpos>,d0
    288c:	          add.l d0,d0
    288e:	          addi.l #336532,d0
    2894:	          move.l d0,97228 <ptrvector>
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    289a:	          moveq #0,d1
    289c:	          move.w 9721c <VectorPosLetters>,d1
    28a2:	          add.l d1,d1
    28a4:	          addi.l #416626,d1
    28aa:	          move.l d1,97220 <ptrvectorletters>
  int mirroring = 0;
  if( nrofcubesreversed > 0) mirroring = 1;
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    28b0:	          move.l d2,d4
    28b2:	          andi.l #65535,d4
    28b8:	          move.l d4,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    28ba:	          tst.l d3
    28bc:	          sgt d1
    28be:	          ext.w d1
    28c0:	          ext.l d1
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    28c2:	          neg.l d1
    28c4:	          move.l d1,-(sp)
    28c6:	          move.l d0,-(sp)
    28c8:	          jsr 3f30 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    28cc:	          clr.l -(sp)
    28ce:	          move.l d4,-(sp)
    28d0:	          move.l 971d2 <DrawBuffer>,-(sp)
    28d6:	          move.l 48(sp),-(sp)
    28da:	          move.l 97220 <ptrvectorletters>,-(sp)
    28e0:	          lea 3952 <DrawLetters>(pc),a2
    28e4:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    28e6:	          lea 32(sp),sp
    28ea:	          tst.l d3
    28ec:	   /----- bgt.w 2984 <DrawDices+0x10c>
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
  }

  CubeNrReversePos++;
    28f0:	/--|----> addq.w #1,72f8c <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    28f6:	|  |      move.w d2,d0
    28f8:	|  |      add.w d2,d0
    28fa:	|  |      add.w d2,d0
    28fc:	|  |      lsl.w #3,d0
    28fe:	|  |      add.w d0,9721a <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    2904:	|  |      move.w 34(sp),d0
    2908:	|  |      add.w d0,d0
    290a:	|  |      add.w 34(sp),d0
    290e:	|  |      add.w d0,d0
    2910:	|  |      add.w d0,d0
    2912:	|  |      add.w d0,9721c <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    2918:	|  |      move.w 38(sp),d0
    291c:	|  |      add.w d0,d0
    291e:	|  |      add.w 38(sp),d0
    2922:	|  |      add.w d0,d0
    2924:	|  |      add.w d0,d0
    2926:	|  |      add.w d0,9721e <VectorPosLettersReversed>

  SetCl( clminendpos);
    292c:	|  |      move.w 50(sp),-(sp)
    2930:	|  |      clr.w -(sp)
    2932:	|  |      jsr 2bd8 <SetCl>(pc)

  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    2936:	|  |      moveq #0,d3
    2938:	|  |      move.w 9721a <vectorpos>,d3
    293e:	|  |      move.l 56(sp),-(sp)
    2942:	|  |      move.l d2,-(sp)
    2944:	|  |      jsr 6734 <__mulsi3>
    294a:	|  |      move.l d0,d1
    294c:	|  |      add.l d1,d1
    294e:	|  |      add.l d0,d1
    2950:	|  |      lsl.l #3,d1
    2952:	|  |      lea 12(sp),sp
    2956:	|  |      cmp.l d3,d1
    2958:	|  |  /-- bgt.s 297c <DrawDices+0x104>
  {
    CubeNrReversePos = 1;
    295a:	|  |  |   move.w #1,72f8c <CubeNrReversePos>
    vectorpos = 0;
    2962:	|  |  |   clr.w 9721a <vectorpos>
    VectorPosLetters = 0;
    2968:	|  |  |   clr.w 9721c <VectorPosLetters>
    VectorPosLettersReversed = 0;
    296e:	|  |  |   clr.w 9721e <VectorPosLettersReversed>
    return 1;
    2974:	|  |  |   moveq #1,d0
  } else 
  {
    return 0;  
  }

}
    2976:	|  |  |   movem.l (sp)+,d2-d4/a2
    297a:	|  |  |   rts
    return 0;  
    297c:	|  |  \-> clr.w d0
}
    297e:	|  |      movem.l (sp)+,d2-d4/a2
    2982:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    2984:	|  \----> moveq #0,d0
    2986:	|         move.w 72f8c <CubeNrReversePos>,d0
    298c:	|         add.l d0,d0
    298e:	|         add.l 20(sp),d0
    2992:	|         move.l d0,97112 <CubeNrReversePtr>
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    2998:	|         moveq #0,d0
    299a:	|         move.w 9721e <VectorPosLettersReversed>,d0
    29a0:	|         add.l d0,d0
    29a2:	|         addi.l #376690,d0
    29a8:	|         move.l d0,97224 <ptrvectorlettersreversed>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    29ae:	|         pea 1 <_start+0x1>
    29b2:	|         move.w d3,-(sp)
    29b4:	|         clr.w -(sp)
    29b6:	|         move.l 971d2 <DrawBuffer>,-(sp)
    29bc:	|         move.l 40(sp),-(sp)
    29c0:	|         move.l d0,-(sp)
    29c2:	|         jsr (a2)
    29c4:	|         lea 20(sp),sp
    29c8:	\-------- bra.w 28f0 <DrawDices+0x78>

000029cc <DrawDicesSpecial>:

UWORD DrawDicesSpecial( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    29cc:	          movem.l d2-d4/a2,-(sp)
    29d0:	          move.l 40(sp),d2
    29d4:	          move.l 44(sp),d3

  ptrvector = VectorBuffer +  vectorpos;    
    29d8:	          moveq #0,d0
    29da:	          move.w 9721a <vectorpos>,d0
    29e0:	          add.l d0,d0
    29e2:	          addi.l #336532,d0
    29e8:	          move.l d0,97228 <ptrvector>
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    29ee:	          moveq #0,d1
    29f0:	          move.w 9721c <VectorPosLetters>,d1
    29f6:	          add.l d1,d1
    29f8:	          addi.l #416626,d1
    29fe:	          move.l d1,97220 <ptrvectorletters>
  int mirroring = 0;
  if( nrofcubesreversed > 0) mirroring = 1;
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    2a04:	          move.l d2,d4
    2a06:	          andi.l #65535,d4
    2a0c:	          move.l d4,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    2a0e:	          tst.l d3
    2a10:	          sgt d1
    2a12:	          ext.w d1
    2a14:	          ext.l d1
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    2a16:	          neg.l d1
    2a18:	          move.l d1,-(sp)
    2a1a:	          move.l d0,-(sp)
    2a1c:	          jsr 3f30 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    2a20:	          clr.l -(sp)
    2a22:	          move.l d4,-(sp)
    2a24:	          move.l 971d2 <DrawBuffer>,-(sp)
    2a2a:	          move.l 48(sp),-(sp)
    2a2e:	          move.l 97220 <ptrvectorletters>,-(sp)
    2a34:	          lea 3952 <DrawLetters>(pc),a2
    2a38:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    2a3a:	          lea 32(sp),sp
    2a3e:	          tst.l d3
    2a40:	   /----- bgt.w 2b64 <DrawDicesSpecial+0x198>
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
  }

  CubeNrReversePos++;
    2a44:	/--|----> addq.w #1,72f8c <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    2a4a:	|  |      move.w d2,d0
    2a4c:	|  |      add.w d2,d0
    2a4e:	|  |      add.w d2,d0
    2a50:	|  |      lsl.w #3,d0
    2a52:	|  |      add.w d0,9721a <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    2a58:	|  |      move.w 34(sp),d0
    2a5c:	|  |      add.w d0,d0
    2a5e:	|  |      add.w 34(sp),d0
    2a62:	|  |      add.w d0,d0
    2a64:	|  |      add.w d0,d0
    2a66:	|  |      add.w d0,9721c <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    2a6c:	|  |      move.w 38(sp),d0
    2a70:	|  |      add.w d0,d0
    2a72:	|  |      add.w 38(sp),d0
    2a76:	|  |      add.w d0,d0
    2a78:	|  |      add.w d0,d0
    2a7a:	|  |      add.w d0,9721e <VectorPosLettersReversed>

  SetCl( clminendpos);
    2a80:	|  |      move.w 50(sp),-(sp)
    2a84:	|  |      clr.w -(sp)
    2a86:	|  |      jsr 2bd8 <SetCl>(pc)
  
  if(vectorpos >= 8*3*133*4)
    2a8a:	|  |      move.w 9721a <vectorpos>,d3
    2a90:	|  |      addq.l #4,sp
    2a92:	|  |      cmpi.w #12767,d3
    2a96:	|  |  /-- bls.s 2aa0 <DrawDicesSpecial+0xd4>
  {
    DoNotClearDirty = 1;
    2a98:	|  |  |   move.w #1,971ec <DoNotClearDirty>
  }

  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    2aa0:	|  |  \-> andi.l #65535,d3
    2aa6:	|  |      move.l 52(sp),-(sp)
    2aaa:	|  |      move.l d2,-(sp)
    2aac:	|  |      jsr 6734 <__mulsi3>
    2ab2:	|  |      addq.l #8,sp
    2ab4:	|  |      move.l d0,d1
    2ab6:	|  |      add.l d1,d1
    2ab8:	|  |      add.l d0,d1
    2aba:	|  |      lsl.l #3,d1
    2abc:	|  |      cmp.l d3,d1
    2abe:	|  |  /-- bgt.w 2b5c <DrawDicesSpecial+0x190>
  {
    ClearBuffer->MyDirtyArea[0].Address = 0;
    2ac2:	|  |  |   movea.l 971da <ClearBuffer>,a2
    2ac8:	|  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    2acc:	|  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    2ad0:	|  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    2ad4:	|  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    2ad8:	|  |  |   movea.l 971d2 <DrawBuffer>,a1
    2ade:	|  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    2ae2:	|  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    2ae6:	|  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    2aea:	|  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    2aee:	|  |  |   movea.l 971d6 <ViewBuffer>,a0
    2af4:	|  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    2af8:	|  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    2afc:	|  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    2b00:	|  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    2b04:	|  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    2b08:	|  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    2b0c:	|  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    2b10:	|  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    2b14:	|  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    2b18:	|  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    2b1c:	|  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    2b20:	|  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    2b24:	|  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    2b28:	|  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    2b2c:	|  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    2b30:	|  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    2b34:	|  |  |   clr.w 971ec <DoNotClearDirty>
    CubeNrReversePos = 1;
    2b3a:	|  |  |   move.w #1,72f8c <CubeNrReversePos>
    vectorpos = 0;
    2b42:	|  |  |   clr.w 9721a <vectorpos>
    VectorPosLetters = 0;
    2b48:	|  |  |   clr.w 9721c <VectorPosLetters>
    VectorPosLettersReversed = 0;
    2b4e:	|  |  |   clr.w 9721e <VectorPosLettersReversed>
    return 1;
    2b54:	|  |  |   moveq #1,d0
  } else 
  {
    return 0;  
  }

}
    2b56:	|  |  |   movem.l (sp)+,d2-d4/a2
    2b5a:	|  |  |   rts
    return 0;  
    2b5c:	|  |  \-> clr.w d0
}
    2b5e:	|  |      movem.l (sp)+,d2-d4/a2
    2b62:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    2b64:	|  \----> moveq #0,d0
    2b66:	|         move.w 72f8c <CubeNrReversePos>,d0
    2b6c:	|         add.l d0,d0
    2b6e:	|         add.l 20(sp),d0
    2b72:	|         move.l d0,97112 <CubeNrReversePtr>
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    2b78:	|         moveq #0,d0
    2b7a:	|         move.w 9721e <VectorPosLettersReversed>,d0
    2b80:	|         add.l d0,d0
    2b82:	|         addi.l #376690,d0
    2b88:	|         move.l d0,97224 <ptrvectorlettersreversed>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    2b8e:	|         pea 1 <_start+0x1>
    2b92:	|         move.w d3,-(sp)
    2b94:	|         clr.w -(sp)
    2b96:	|         move.l 971d2 <DrawBuffer>,-(sp)
    2b9c:	|         move.l 40(sp),-(sp)
    2ba0:	|         move.l d0,-(sp)
    2ba2:	|         jsr (a2)
    2ba4:	|         lea 20(sp),sp
    2ba8:	\-------- bra.w 2a44 <DrawDicesSpecial+0x78>

00002bac <VblankHandler>:
#define STARTYBG2 109
#define ENDYBG 120

volatile UWORD FrameCounter = 0;

void VblankHandler() {
    2bac:	subq.l #4,sp

  volatile struct Custom *custom = (struct Custom*)0xdff000;    
    2bae:	move.l #14675968,(sp)

  custom->intreq = 1 << INTB_VERTB;
    2bb4:	movea.l (sp),a0
    2bb6:	move.w #32,156(a0)
  custom->intreq = 1 << INTB_VERTB;
    2bbc:	movea.l (sp),a0
    2bbe:	move.w #32,156(a0)
  //p61Music();
  FrameCounter++;
    2bc4:	move.w 9722e <FrameCounter>,d0
    2bca:	addq.w #1,d0
    2bcc:	move.w d0,9722e <FrameCounter>
}
    2bd2:	nop
    2bd4:	addq.l #4,sp
    2bd6:	rts

00002bd8 <SetCl>:

void SetCl( UWORD minlastdrawline) 
{ //Save Dma Space by disabling bitplanes for black lines  
    2bd8:	                                                             lea -20(sp),sp
    2bdc:	                                                             movem.l d2-d4/a2-a3,-(sp)
    2be0:	                                                             move.l 44(sp),d1

  UWORD *tmp = (UWORD *) DrawCopper + 84;
    2be4:	                                                             movea.l 9711a <DrawCopper>,a2
    2bea:	                                                             lea 168(a2),a3
  UWORD stopbgcolordone = 0;


  UWORD firstdrawline = 0;
  UWORD lastdrawline = 0;
  if(DrawBuffer->maxytotal < 0) {
    2bee:	                                                             movea.l 971d2 <DrawBuffer>,a0
    2bf4:	                                                             move.w 52(a0),d0
    2bf8:	                                             /-------------- bmi.w 2d98 <SetCl+0x1c0>
    firstdrawline = 255;
    lastdrawline = 255;
  } else if(DrawBuffer->minytotal < 0) {
    2bfc:	                                             |               move.w 54(a0),d2
    2c00:	                                             |     /-------- bmi.w 2d54 <SetCl+0x17c>
    firstdrawline = 0;
    lastdrawline = DrawBuffer->maxytotal;
  } else {
    firstdrawline = DrawBuffer->minytotal;
    2c04:	                                             |     |         move.w d2,d3
      case 1: //StartDisplay
        if( firstdrawline + 0x2c > 255) {
          *tmp++ = 0xffdf;
          *tmp++ = 0xfffe;
        }
        line = (firstdrawline + 0x2c - 255) << 8;
    2c06:	                                             |     |         move.w d2,d4
    2c08:	                                             |     |         lsl.w #8,d4
        *tmp++ = line + 0x001;
    2c0a:	                                             |     |         addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    2c0e:	                                             |     |         cmp.w d1,d0
    2c10:	                                       /-----|-----|-------- bhi.w 2e48 <SetCl+0x270>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    2c14:	                                       |     |     |         move.w #70,30(sp)
    2c1a:	                                       |     |     |         move.w d2,32(sp)
    2c1e:	                                       |     |     |         move.w #109,34(sp)
    2c24:	                                       |     |     |         move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    2c2a:	                                       |     |     |         clr.w 20(sp)
    2c2e:	                                       |     |     |         move.w #1,22(sp)
    2c34:	                                       |     |     |         move.w #2,24(sp)
    2c3a:	                                       |     |     |         move.w #3,26(sp)
    2c40:	                                       |     |     |         move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    2c46:	                                       |     |     |         cmpi.w #69,d2
    2c4a:	                                    /--|-----|-----|-------- bhi.w 2dde <SetCl+0x206>
              values[j] = values[j + 1];
    2c4e:	                                    |  |  /--|-----|-------> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    2c52:	                                    |  |  |  |     |         move.w #1,20(sp)
              values[j + 1] = temp;
    2c58:	                                    |  |  |  |     |         move.w #70,32(sp)
              ids[j + 1] = temp2;
    2c5e:	                                    |  |  |  |     |         clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    2c62:	                                    |  |  |  |     |         moveq #70,d0
    2c64:	/-----------------------------------|--|--|--|-----|-------> cmp.w 36(sp),d1
    2c68:	|                                   |  |  |  |     |     /-- bcc.s 2c7a <SetCl+0xa2>
              int temp2 = ids[j];
    2c6a:	|                                   |  |  |  |     |     |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    2c70:	|                                   |  |  |  |     |     |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    2c74:	|                                   |  |  |  |     |     |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    2c7a:	|                                   |  |  |  |     |     \-> movea.w 30(sp),a0
    2c7e:	|                                   |  |  |  |     |         cmp.w a0,d0
    2c80:	|                                   |  |  |  |     |     /-- bcc.s 2c9e <SetCl+0xc6>
              int temp2 = ids[j];
    2c82:	|                                   |  |  |  |     |     |   move.w 20(sp),d2
              values[j] = values[j + 1];
    2c86:	|                                   |  |  |  |     |     |   movea.w d0,a1
    2c88:	|                                   |  |  |  |     |     |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    2c8c:	|                                   |  |  |  |     |     |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    2c92:	|                                   |  |  |  |     |     |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    2c96:	|                                   |  |  |  |     |     |   move.w d2,22(sp)
    2c9a:	|                                   |  |  |  |     |     |   move.w a0,d0
    2c9c:	|                                   |  |  |  |     |     |   movea.w a1,a0
          if (values[j] > values[j + 1]) {
    2c9e:	|                                   |  |  |  |     |     \-> movea.w 34(sp),a1
    2ca2:	|                                   |  |  |  |     |         cmp.w a1,d0
    2ca4:	|                                   |  |  |  |     |     /-- bls.s 2cbe <SetCl+0xe6>
              int temp2 = ids[j];
    2ca6:	|                                   |  |  |  |     |     |   move.w 22(sp),d2
              values[j] = values[j + 1];
    2caa:	|                                   |  |  |  |     |     |   move.w a1,32(sp)
              ids[j] = ids[j + 1];
    2cae:	|                                   |  |  |  |     |     |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    2cb4:	|                                   |  |  |  |     |     |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    2cb8:	|                                   |  |  |  |     |     |   move.w d2,24(sp)
    2cbc:	|                                   |  |  |  |     |     |   move.w a1,d0
          if (values[j] > values[j + 1]) {
    2cbe:	|                                   |  |  |  |     |     \-> move.w 36(sp),d2
    2cc2:	|                                   |  |  |  |     |         cmp.w 34(sp),d2
    2cc6:	|                                   |  |  |  |     |     /-- bcc.s 2cda <SetCl+0x102>
              int temp2 = ids[j];
    2cc8:	|                                   |  |  |  |     |     |   movea.w 24(sp),a1
              values[j] = values[j + 1];
    2ccc:	|                                   |  |  |  |     |     |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    2cd0:	|                                   |  |  |  |     |     |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    2cd6:	|                                   |  |  |  |     |     |   move.w a1,26(sp)
          if (values[j] > values[j + 1]) {
    2cda:	|                                   |  |  |  |     |     \-> cmp.w a0,d0
    2cdc:	|                                   |  |  |  |     |     /-- bcc.s 2cf4 <SetCl+0x11c>
              int temp2 = ids[j];
    2cde:	|                                   |  |  |  |     |     |   movea.w 20(sp),a1
              values[j] = values[j + 1];
    2ce2:	|                                   |  |  |  |     |     |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    2ce6:	|                                   |  |  |  |     |     |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    2cec:	|                                   |  |  |  |     |     |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    2cf0:	|                                   |  |  |  |     |     |   move.w a1,22(sp)
          if (values[j] > values[j + 1]) {
    2cf4:	|                                   |  |  |  |     |     \-> move.w 34(sp),d0
    2cf8:	|                                   |  |  |  |     |         cmp.w 32(sp),d0
    2cfc:	|                                   |  |  |  |     |     /-- bcc.s 2d20 <SetCl+0x148>
              int temp2 = ids[j];
    2cfe:	|                                   |  |  |  |     |     |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    2d02:	|                                   |  |  |  |     |     |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    2d08:	|                                   |  |  |  |     |     |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    2d0c:	|                                   |  |  |  |     |     |   cmp.w 30(sp),d0
    2d10:	|                                   |  |  |  |     |     +-- bcc.s 2d20 <SetCl+0x148>
              int temp2 = ids[j];
    2d12:	|                                   |  |  |  |     |     |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    2d16:	|                                   |  |  |  |     |     |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    2d1c:	|                                   |  |  |  |     |     |   move.w d0,22(sp)
      case 4:
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
          *tmp++ = 0xffdf;
          *tmp++ = 0xfffe;
        }
        line = (lastdrawline + 0x2c - 255) << 8;
    2d20:	|                                   |  |  |  |     |     \-> move.w d1,d0
    2d22:	|                                   |  |  |  |     |         lsl.w #8,d0
        *tmp++ = line + 0x001;
    2d24:	|                                   |  |  |  |     |         addi.w #11521,d0
    2d28:	|                                   |  |  |  |     |         cmpi.w #210,d1
    2d2c:	|                                   |  |  |  |     |  /----- bhi.w 2e24 <SetCl+0x24c>
    switch( ids[i]) 
    2d30:	|                                   |  |  |  |     |  |      cmpi.w #4,20(sp)
    2d36:	|  /--------------------------------|--|--|--|-----|--|----- bhi.w 3630 <SetCl+0xa58>
    2d3a:	|  |                                |  |  |  |     |  |      moveq #0,d1
    2d3c:	|  |                                |  |  |  |     |  |      move.w 20(sp),d1
    2d40:	|  |                                |  |  |  |     |  |      add.l d1,d1
    2d42:	|  |                                |  |  |  |     |  |      move.w (2d4a <SetCl+0x172>,pc,d1.l),d1
    2d46:	|  |                                |  |  |  |     |  |      jmp (2d4a <SetCl+0x172>,pc,d1.w)
    2d4a:	|  |                                |  |  |  |     |  |      andi.l #39060022,d4
    2d50:	|  |                                |  |  |  |     |  |      bset d0,(-60,a6,d0.w:2)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    2d54:	|  |                                |  |  |  |     \--|----> cmp.w d1,d0
    2d56:	|  |                                |  |  |  |  /-----|----- bhi.w 2e88 <SetCl+0x2b0>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    2d5a:	|  |                                |  |  |  |  |     |      move.w #109,34(sp)
    2d60:	|  |                                |  |  |  |  |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    2d66:	|  |                                |  |  |  |  |     |      move.w #2,24(sp)
    2d6c:	|  |                                |  |  |  |  |     |      move.w #3,26(sp)
    2d72:	|  |                                |  |  |  |  |     |      move.w #4,28(sp)
    2d78:	|  |                                |  |  |  |  |     |      move.w #11521,d4
    firstdrawline = 0;
    2d7c:	|  |                                |  |  |  |  |     |      clr.w d3
              values[j] = values[j + 1];
    2d7e:	|  |                                |  |  |  |  |  /--|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    2d82:	|  |                                |  |  |  |  |  |  |      move.w #1,20(sp)
              values[j + 1] = temp;
    2d88:	|  |                                |  |  |  |  |  |  |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    2d8e:	|  |                                |  |  |  |  |  |  |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    2d92:	|  |                                |  |  |  |  |  |  |      moveq #70,d0
    2d94:	+--|--------------------------------|--|--|--|--|--|--|----- bra.w 2c64 <SetCl+0x8c>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    2d98:	|  |                                |  |  |  \--|--|--|----> cmpi.w #255,d1
    2d9c:	|  |                                |  |  |     |  |  |  /-- bcc.s 2da2 <SetCl+0x1ca>
    2d9e:	|  |                                |  |  |     |  |  |  |   move.w #255,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    2da2:	|  |                                |  |  |     |  |  |  \-> move.w #70,30(sp)
    2da8:	|  |                                |  |  |     |  |  |      move.w #255,32(sp)
    2dae:	|  |                                |  |  |     |  |  |      move.w #109,34(sp)
    2db4:	|  |                                |  |  |     |  |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    2dba:	|  |                                |  |  |     |  |  |      clr.w 20(sp)
    2dbe:	|  |                                |  |  |     |  |  |      move.w #1,22(sp)
    2dc4:	|  |                                |  |  |     |  |  |      move.w #2,24(sp)
    2dca:	|  |                                |  |  |     |  |  |      move.w #3,26(sp)
    2dd0:	|  |                                |  |  |     |  |  |      move.w #4,28(sp)
    2dd6:	|  |                                |  |  |     |  |  |      move.w #11265,d4
    firstdrawline = 255;
    2dda:	|  |                                |  |  |     |  |  |      move.w #255,d3
          if (values[j] > values[j + 1]) {
    2dde:	|  |                                >--|--|-----|--|--|----> move.w 32(sp),d0
    2de2:	|  |                                |  |  |     |  |  |      cmpi.w #109,d0
    2de6:	+--|--------------------------------|--|--|-----|--|--|----- bls.w 2c64 <SetCl+0x8c>
              int temp2 = ids[j];
    2dea:	|  |                                |  |  |     |  |  |      movea.w 22(sp),a0
              values[j] = values[j + 1];
    2dee:	|  |                                |  |  |     |  |  |      move.w #109,32(sp)
              ids[j] = ids[j + 1];
    2df4:	|  |                                |  |  |     |  |  |      move.w #2,22(sp)
              values[j + 1] = temp;
    2dfa:	|  |                                |  |  |     |  |  |      move.w d0,34(sp)
              ids[j + 1] = temp2;
    2dfe:	|  |                                |  |  |     |  |  |      move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    2e02:	|  |                                |  |  |     |  |  |      cmpi.w #120,d0
    2e06:	|  |  /-----------------------------|--|--|-----|--|--|----- bls.w 3618 <SetCl+0xa40>
              values[j] = values[j + 1];
    2e0a:	|  |  |                             |  |  |     |  |  |      move.w #120,34(sp)
              ids[j] = ids[j + 1];
    2e10:	|  |  |                             |  |  |     |  |  |      move.w #3,24(sp)
              values[j + 1] = temp;
    2e16:	|  |  |                             |  |  |     |  |  |      move.w d0,36(sp)
              ids[j + 1] = temp2;
    2e1a:	|  |  |                             |  |  |     |  |  |      move.w a0,26(sp)
    2e1e:	|  |  |                             |  |  |     |  |  |      moveq #109,d0
    2e20:	+--|--|-----------------------------|--|--|-----|--|--|----- bra.w 2c64 <SetCl+0x8c>
    switch( ids[i]) 
    2e24:	|  |  |                             |  |  |     |  |  \----> cmpi.w #4,20(sp)
    2e2a:	|  |  |  /--------------------------|--|--|-----|--|-------- bhi.w 361e <SetCl+0xa46>
    2e2e:	|  |  |  |                          |  |  |     |  |         moveq #0,d1
    2e30:	|  |  |  |                          |  |  |     |  |         move.w 20(sp),d1
    2e34:	|  |  |  |                          |  |  |     |  |         add.l d1,d1
    2e36:	|  |  |  |                          |  |  |     |  |         move.w (2e3e <SetCl+0x266>,pc,d1.l),d1
    2e3a:	|  |  |  |                          |  |  |     |  |         jmp (2e3e <SetCl+0x266>,pc,d1.w)
    2e3e:	|  |  |  |                          |  |  |     |  |         .short 0x00c6
    2e40:	|  |  |  |                          |  |  |     |  |         ori.w #432,(-28,a4,d0.w)
    2e46:	|  |  |  |                          |  |  |     |  |         bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    2e4a:	|  |  |  |                          |     |     |  |         move.w #70,30(sp)
    2e50:	|  |  |  |                          |     |     |  |         move.w d2,32(sp)
    2e54:	|  |  |  |                          |     |     |  |         move.w #109,34(sp)
    2e5a:	|  |  |  |                          |     |     |  |         move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    2e60:	|  |  |  |                          |     |     |  |         clr.w 20(sp)
    2e64:	|  |  |  |                          |     |     |  |         move.w #1,22(sp)
    2e6a:	|  |  |  |                          |     |     |  |         move.w #2,24(sp)
    2e70:	|  |  |  |                          |     |     |  |         move.w #3,26(sp)
    2e76:	|  |  |  |                          |     |     |  |         move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    2e7c:	|  |  |  |                          |     |     |  |         cmpi.w #69,d2
    2e80:	|  |  |  |                          |     \-----|--|-------- bls.w 2c4e <SetCl+0x76>
    2e84:	|  |  |  |                          \-----------|--|-------- bra.w 2dde <SetCl+0x206>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    2e88:	|  |  |  |                                      \--|-------> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    2e8a:	|  |  |  |                                         |         move.w #109,34(sp)
    2e90:	|  |  |  |                                         |         move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    2e96:	|  |  |  |                                         |         move.w #2,24(sp)
    2e9c:	|  |  |  |                                         |         move.w #3,26(sp)
    2ea2:	|  |  |  |                                         |         move.w #4,28(sp)
    2ea8:	|  |  |  |                                         |         move.w #11521,d4
    firstdrawline = 0;
    2eac:	|  |  |  |                                         |         clr.w d3
    2eae:	|  |  |  |                                         \-------- bra.w 2d7e <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    2eb2:	|  |  |  |                                                   cmpi.w #211,d3
    2eb6:	|  |  |  |                                               /-- bls.s 2ec8 <SetCl+0x2f0>
          *tmp++ = 0xffdf;
    2eb8:	|  |  |  |                                               |   move.w #-33,168(a2)
          *tmp++ = 0xfffe;
    2ebe:	|  |  |  |                                               |   lea 172(a2),a3
    2ec2:	|  |  |  |                                               |   move.w #-2,170(a2)
        *tmp++ = line + 0x001;
    2ec8:	|  |  |  |                                               \-> move.w d4,(a3)
        *tmp++ = 0xfffe;
    2eca:	|  |  |  |                                                   move.w #-2,2(a3)
        *tmp++ = 0x0100;
    2ed0:	|  |  |  |                                                   move.w #256,4(a3)
        *tmp++ = 0x3200;
    2ed6:	|  |  |  |                                                   lea 8(a3),a0
    2eda:	|  |  |  |                                                   move.w #12800,6(a3)
    switch( ids[i]) 
    2ee0:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    2ee6:	|  |  |  |  /--|-------------------------------------------- bhi.w 3636 <SetCl+0xa5e>
    2eea:	|  |  |  |  |  |                                             moveq #0,d1
    2eec:	|  |  |  |  |  |                                             move.w 22(sp),d1
    2ef0:	|  |  |  |  |  |                                             add.l d1,d1
    2ef2:	|  |  |  |  |  |                                             move.w (2efa <SetCl+0x322>,pc,d1.l),d1
    2ef6:	|  |  |  |  |  |                                             jmp (2efa <SetCl+0x322>,pc,d1.w)
    2efa:	|  |  |  |  |  |                                             bclr d0,18c <Utils_BlitClear+0x8a>
    2efe:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128828,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    2f08:	|  |  |  |  |  |                                             ori.l #897384446,170(a0)
        *tmp++ = 0x0180;
    2f10:	|  |  |  |  |  |                                             move.w #384,172(a2)
        *tmp++ = TABLECOLOR;
    2f16:	|  |  |  |  |  |                                             lea 176(a2),a0
    2f1a:	|  |  |  |  |  |                                             move.w #52,174(a2)
        break;
    2f20:	|  |  |  |  |  +-------------------------------------------- bra.s 2ee0 <SetCl+0x308>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    2f22:	|  |  |  |  |  |                                             move.w #-23551,168(a2)
        *tmp++ = 0xfffe;
    2f28:	|  |  |  |  |  |                                             move.w #-2,170(a2)
        *tmp++ = 0x0180;
    2f2e:	|  |  |  |  |  |                                             move.w #384,172(a2)
        *tmp++ = BGCOLOR;
    2f34:	|  |  |  |  |  |                                             lea 176(a2),a0
    2f38:	|  |  |  |  |  |                                             move.w #18,174(a2)
        break;          
    2f3e:	|  |  |  |  |  +-------------------------------------------- bra.s 2ee0 <SetCl+0x308>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    2f40:	|  |  |  |  |  |                                             move.w #-23551,168(a2)
        *tmp++ = 0xfffe;
    2f46:	|  |  |  |  |  |                                             move.w #-2,170(a2)
        *tmp++ = 0x0180;
    2f4c:	|  |  |  |  |  |                                             move.w #384,172(a2)
        *tmp++ = BGCOLOR;
    2f52:	|  |  |  |  |  |                                             lea 176(a2),a0
    2f56:	|  |  |  |  |  |                                             move.w #18,174(a2)
    switch( ids[i]) 
    2f5c:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    2f62:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 3642 <SetCl+0xa6a>
    2f66:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    2f68:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    2f6c:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    2f6e:	|  |  |  |  |  |  |  |                                       move.w (2f76 <SetCl+0x39e>,pc,d1.l),d1
    2f72:	|  |  |  |  |  |  |  |                                       jmp (2f76 <SetCl+0x39e>,pc,d1.w)
    2f76:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    2f78:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    2f7c:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    2f7e:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    2f80:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a2)
        *tmp++ = 0xfffe;
    2f86:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a2)
        *tmp++ = 0x0180;
    2f8c:	|  |  |  |  |  |  |  |                                       move.w #384,172(a2)
        *tmp++ = TABLECOLOR2;
    2f92:	|  |  |  |  |  |  |  |                                       lea 176(a2),a0
    2f96:	|  |  |  |  |  |  |  |                                       move.w #35,174(a2)
        break;  
    2f9c:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 2f5c <SetCl+0x384>
        if( firstdrawline + 0x2c > 255) {
    2f9e:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    2fa2:	|  |  |  |  |  |  |  |                                   /-- bls.s 2fb4 <SetCl+0x3dc>
          *tmp++ = 0xffdf;
    2fa4:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a2)
          *tmp++ = 0xfffe;
    2faa:	|  |  |  |  |  |  |  |                                   |   lea 172(a2),a3
    2fae:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a2)
        *tmp++ = line + 0x001;
    2fb4:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a3)
        *tmp++ = 0xfffe;
    2fb6:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a3)
        *tmp++ = 0x0100;
    2fbc:	|  |  |  |  |  |  |  |                                       move.w #256,4(a3)
        *tmp++ = 0x3200;
    2fc2:	|  |  |  |  |  |  |  |                                       lea 8(a3),a0
    2fc6:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a3)
        break;
    2fcc:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 2f5c <SetCl+0x384>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    2fce:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a2)
        *tmp++ = 0xfffe;
    2fd4:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a2)
        *tmp++ = 0x0180;
    2fda:	|  |  |  |  |  |  |  |                                       move.w #384,172(a2)
        *tmp++ = TABLECOLOR;
    2fe0:	|  |  |  |  |  |  |  |                                       lea 176(a2),a0
    2fe4:	|  |  |  |  |  |  |  |                                       move.w #52,174(a2)
        break;
    2fea:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 2f5c <SetCl+0x384>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    2fee:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a2)
        *tmp++ = 0xfffe;
    2ff4:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a2)
        *tmp++ = 0x0180;
    2ffa:	|  |  |  |  |  |  |  |                                       move.w #384,172(a2)
        *tmp++ = TABLECOLOR2;
    3000:	|  |  |  |  |  |  |  |                                       lea 176(a2),a0
    3004:	|  |  |  |  |  |  |  |                                       move.w #35,174(a2)
        break;  
    300a:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 2ee0 <SetCl+0x308>
        *tmp++ = line + 0x001;
    300e:	|  |  |  |  |  |  |  |                                       move.w d0,168(a2)
        *tmp++ = 0xfffe;
    3012:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a2)
        *tmp++ = 0x0100;
    3018:	|  |  |  |  |  |  |  |                                       move.w #256,172(a2)
        *tmp++ = 0x0200;
    301e:	|  |  |  |  |  |  |  |                                       lea 176(a2),a0
    3022:	|  |  |  |  |  |  |  |                                       move.w #512,174(a2)
        break;
    3028:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 2f5c <SetCl+0x384>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    302c:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    3030:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3036:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    303c:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    3040:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    3046:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    304c:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 362a <SetCl+0xa52>
    3050:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    3052:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    3056:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    3058:	|  |  |  |  |  |  |  |  |  |                                 move.w (3060 <SetCl+0x488>,pc,d1.l),d1
    305c:	|  |  |  |  |  |  |  |  |  |                                 jmp (3060 <SetCl+0x488>,pc,d1.w)
    3060:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    3062:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    3064:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    306c:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    306e:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3074:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    307a:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    307e:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    3084:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 3046 <SetCl+0x46e>
        if( firstdrawline + 0x2c > 255) {
    3086:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    308a:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 3098 <SetCl+0x4c0>
          *tmp++ = 0xffdf;
    308c:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    3090:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    3096:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    3098:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    309a:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    30a0:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    30a6:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    30aa:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    30b0:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 3046 <SetCl+0x46e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    30b2:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    30b6:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    30bc:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    30c2:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    30c6:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    30cc:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 3046 <SetCl+0x46e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    30d0:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    30d4:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    30da:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    30e0:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    30e4:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    30ea:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    30f0:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 363c <SetCl+0xa64>
    30f4:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    30f6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    30fa:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    30fc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (3104 <SetCl+0x52c>,pc,d1.l),d1
    3100:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (3104 <SetCl+0x52c>,pc,d1.w)
    3104:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    3106:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    3108:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    310a:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    310c:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    310e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    3112:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3118:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    311e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    3122:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    3128:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 30ea <SetCl+0x512>
        if( firstdrawline + 0x2c > 255) {
    312a:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    312e:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 313c <SetCl+0x564>
          *tmp++ = 0xffdf;
    3130:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    3134:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    313a:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    313c:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    313e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    3144:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    314a:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    314e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    3154:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 30ea <SetCl+0x512>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    3156:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    315a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3160:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    3166:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    316a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    3170:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 30ea <SetCl+0x512>
        *tmp++ = line + 0x001;
    3174:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    3176:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    317c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    3182:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    3186:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    318c:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 30ea <SetCl+0x512>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    3190:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    3194:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    319a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    31a0:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    31a4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    31aa:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    31b0:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 365e <SetCl+0xa86>
    31b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    31b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    31ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    31bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (31c4 <SetCl+0x5ec>,pc,d1.l),d1
    31c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (31c4 <SetCl+0x5ec>,pc,d1.w)
    31c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    31c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    31c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    31ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    31cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    31d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    31d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    31d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    31de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    31e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    31e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 31aa <SetCl+0x5d2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    31ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    31ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    31f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    31fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    31fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    3204:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 31aa <SetCl+0x5d2>
        *tmp++ = line + 0x001;
    3206:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    3208:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    320e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    3214:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    3218:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    321e:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 31aa <SetCl+0x5d2>
        if( firstdrawline + 0x2c > 255) {
    3220:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    3224:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 3232 <SetCl+0x65a>
          *tmp++ = 0xffdf;
    3226:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    322a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    3230:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    3232:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    3234:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    323a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    3240:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    3244:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    324a:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 31aa <SetCl+0x5d2>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    324e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    3252:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3258:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    325e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    3262:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    3268:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    326e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 3648 <SetCl+0xa70>
    3272:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    3274:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    3278:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    327a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (3282 <SetCl+0x6aa>,pc,d1.l),d1
    327e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (3282 <SetCl+0x6aa>,pc,d1.w)
    3282:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    3284:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    3286:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    3288:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    328a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    328c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    3290:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3296:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    329c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    32a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    32a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 3268 <SetCl+0x690>
        if( firstdrawline + 0x2c > 255) {
    32a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    32ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 32ba <SetCl+0x6e2>
          *tmp++ = 0xffdf;
    32ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    32b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    32b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    32ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    32bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    32c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    32c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    32cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    32d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 3268 <SetCl+0x690>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    32d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    32d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    32de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    32e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    32e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    32ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 3268 <SetCl+0x690>
        *tmp++ = line + 0x001;
    32f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    32f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    32fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    3300:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    3304:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    330a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 3268 <SetCl+0x690>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    330e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    3312:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    3318:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    331e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    3322:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)

    }
  }

  *tmp++ = 0xffff;
    3328:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    332c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)

}
    3332:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d4/a2-a3
    3336:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    333a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    333c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    3340:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    3346:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    334c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    3350:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    3356:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    335a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    3360:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d4/a2-a3
    3364:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    3368:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    336a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    336e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 337c <SetCl+0x7a4>
          *tmp++ = 0xffdf;
    3370:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    3374:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    337a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    337c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    337e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    3384:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    338a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    338e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    3394:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    3398:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    339e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d4/a2-a3
    33a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    33a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    33a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    33ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    33b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    33b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    33bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    33c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    33c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    33cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d4/a2-a3
    33d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    33d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    33d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    33da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 33e8 <SetCl+0x810>
          *tmp++ = 0xffdf;
    33dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    33e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    33e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    33e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    33ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    33f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    33f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    33fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    3400:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    3404:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    340a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d4/a2-a3
    340e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    3412:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    3414:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    3418:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    341e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    3424:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    3428:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    342e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    3434:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 3624 <SetCl+0xa4c>
    3438:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    343a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    343e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    3440:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (3448 <SetCl+0x870>,pc,d1.l),d1
    3444:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (3448 <SetCl+0x870>,pc,d1.w)
    3448:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    344a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    344c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    3454:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    3456:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    345c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    3462:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    3466:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    346c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 342e <SetCl+0x856>
        if( firstdrawline + 0x2c > 255) {
    346e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    3472:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 3480 <SetCl+0x8a8>
          *tmp++ = 0xffdf;
    3474:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    3478:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    347e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    3480:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    3482:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    3488:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    348e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    3492:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    3498:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 342e <SetCl+0x856>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    349a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    349e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    34a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    34aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    34ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    34b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 342e <SetCl+0x856>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    34b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    34bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    34c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    34c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    34cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    34d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    34d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 3648 <SetCl+0xa70>
    34dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    34de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    34e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    34e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (34ec <SetCl+0x914>,pc,d1.l),d1
    34e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (34ec <SetCl+0x914>,pc,d1.w)
    34ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    34ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    34f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    34f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    34f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    34f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    34fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3500:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    3506:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    350a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    3510:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 34d2 <SetCl+0x8fa>
        if( firstdrawline + 0x2c > 255) {
    3512:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    3516:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 3524 <SetCl+0x94c>
          *tmp++ = 0xffdf;
    3518:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    351c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    3522:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    3524:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    3526:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    352c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    3532:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    3536:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    353c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 34d2 <SetCl+0x8fa>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    353e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    3542:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    3548:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    354e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    3552:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    3558:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 34d2 <SetCl+0x8fa>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    355c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    3560:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 356e <SetCl+0x996>
          *tmp++ = 0xffdf;
    3562:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    3566:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    356c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    356e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    3570:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    3576:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    357c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    3580:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    3586:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 34d2 <SetCl+0x8fa>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    358a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    358e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 359c <SetCl+0x9c4>
          *tmp++ = 0xffdf;
    3590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    3594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    359a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    359c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    359e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    35a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    35aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    35ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    35b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 342e <SetCl+0x856>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    35b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    35bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 35ca <SetCl+0x9f2>
          *tmp++ = 0xffdf;
    35be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    35c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    35c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    35ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    35cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    35d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    35d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    35dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    35e2:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 3046 <SetCl+0x46e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    35e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    35ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 35fc <SetCl+0xa24>
          *tmp++ = 0xffdf;
    35ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a2)
          *tmp++ = 0xfffe;
    35f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a2),a3
    35f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a2)
        *tmp++ = line + 0x001;
    35fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a3)
        *tmp++ = 0xfffe;
    35fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a3)
        *tmp++ = 0x0100;
    3604:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a3)
        *tmp++ = 0x0200;
    360a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a3),a0
    360e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a3)
        break;
    3614:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 2ee0 <SetCl+0x308>
    3618:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    361a:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 2c64 <SetCl+0x8c>
    switch( ids[i]) 
    361e:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a3,a0
    3620:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 2ee0 <SetCl+0x308>
    3624:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    3626:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 34d2 <SetCl+0x8fa>
    362a:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    362c:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 342e <SetCl+0x856>
    3630:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a3,a0
    3632:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 2f5c <SetCl+0x384>
    3636:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    3638:	                  |     \-----|--|--|--|--|--|-------------- bra.w 3046 <SetCl+0x46e>
    363c:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    363e:	                  |           |     |  \--|--|-------------- bra.w 31aa <SetCl+0x5d2>
    3642:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    3644:	                              \-----|-----|--|-------------- bra.w 30ea <SetCl+0x512>
    3648:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    364a:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    364e:	                                    |     |                  move.w #-2,2(a0)
}
    3654:	                                    |     |                  movem.l (sp)+,d2-d4/a2-a3
    3658:	                                    |     |                  lea 20(sp),sp
    365c:	                                    |     |                  rts
    switch( ids[i]) 
    365e:	                                    \-----|----------------> movea.l a0,a1
    3660:	                                          \----------------- bra.w 3268 <SetCl+0x690>

00003664 <PrepareLineBuffer>:


void PrepareLineBuffer( UBYTE *buffer) {
    3664:	                lea -20(sp),sp
    3668:	                movem.l d2-d3/a2,-(sp)
  WORD repeats = 100;
    366c:	                move.w #100,16(sp)
  UBYTE *startbuffer = buffer;
    3672:	                move.l 36(sp),28(sp)
  WORD linesize = 6;
    3678:	                move.w #6,14(sp)

  for( WORD i=0;i <=5;i++) {
    367e:	                clr.w 26(sp)
    3682:	   /----------- bra.w 37f2 <PrepareLineBuffer+0x18e>
    for( WORD i2=1;i2<=16; i2++) {        
    3686:	/--|----------> move.w #1,24(sp)
    368c:	|  |        /-- bra.w 371e <PrepareLineBuffer+0xba>
      UWORD data = 0xffff;
    3690:	|  |     /--|-> move.w #-1,12(sp)
      data = data >> i2;
    3696:	|  |     |  |   moveq #0,d0
    3698:	|  |     |  |   move.w 12(sp),d0
    369c:	|  |     |  |   move.w 24(sp),d1
    36a0:	|  |     |  |   ext.l d1
    36a2:	|  |     |  |   asr.l d1,d0
    36a4:	|  |     |  |   move.w d0,12(sp)
      data = data ^ 0xffff;
    36a8:	|  |     |  |   not.w 12(sp)
      Utils_BlitClear( startbuffer+(i2-1)*repeats*linesize*2+i*2, repeats, 1, linesize*2-2, data);        
    36ac:	|  |     |  |   moveq #0,d3
    36ae:	|  |     |  |   move.w 12(sp),d3
    36b2:	|  |     |  |   movea.w 14(sp),a0
    36b6:	|  |     |  |   move.l a0,d0
    36b8:	|  |     |  |   subq.l #1,d0
    36ba:	|  |     |  |   move.l d0,d0
    36bc:	|  |     |  |   add.w d0,d0
    36be:	|  |     |  |   moveq #0,d2
    36c0:	|  |     |  |   move.w d0,d2
    36c2:	|  |     |  |   movea.w 16(sp),a2
    36c6:	|  |     |  |   movea.w 24(sp),a0
    36ca:	|  |     |  |   move.l a0,d0
    36cc:	|  |     |  |   subq.l #1,d0
    36ce:	|  |     |  |   movea.w 16(sp),a0
    36d2:	|  |     |  |   move.l a0,-(sp)
    36d4:	|  |     |  |   move.l d0,-(sp)
    36d6:	|  |     |  |   jsr 6734 <__mulsi3>
    36dc:	|  |     |  |   addq.l #8,sp
    36de:	|  |     |  |   movea.w 14(sp),a0
    36e2:	|  |     |  |   move.l a0,-(sp)
    36e4:	|  |     |  |   move.l d0,-(sp)
    36e6:	|  |     |  |   jsr 6734 <__mulsi3>
    36ec:	|  |     |  |   addq.l #8,sp
    36ee:	|  |     |  |   add.l d0,d0
    36f0:	|  |     |  |   move.l d0,d1
    36f2:	|  |     |  |   movea.w 26(sp),a0
    36f6:	|  |     |  |   move.l a0,d0
    36f8:	|  |     |  |   add.l a0,d0
    36fa:	|  |     |  |   add.l d1,d0
    36fc:	|  |     |  |   add.l 28(sp),d0
    3700:	|  |     |  |   move.l d3,-(sp)
    3702:	|  |     |  |   move.l d2,-(sp)
    3704:	|  |     |  |   pea 1 <_start+0x1>
    3708:	|  |     |  |   move.l a2,-(sp)
    370a:	|  |     |  |   move.l d0,-(sp)
    370c:	|  |     |  |   jsr 102 <Utils_BlitClear>(pc)
    3710:	|  |     |  |   lea 20(sp),sp
    for( WORD i2=1;i2<=16; i2++) {        
    3714:	|  |     |  |   move.w 24(sp),d0
    3718:	|  |     |  |   addq.w #1,d0
    371a:	|  |     |  |   move.w d0,24(sp)
    371e:	|  |     |  \-> cmpi.w #16,24(sp)
    3724:	|  |     \----- ble.w 3690 <PrepareLineBuffer+0x2c>
    }    
    if( i > 0) {
    3728:	|  |            tst.w 26(sp)
    372c:	|  |  /-------- ble.w 37ce <PrepareLineBuffer+0x16a>
      WORD height = repeats * 16;
    3730:	|  |  |         move.w 16(sp),d0
    3734:	|  |  |         lsl.w #4,d0
    3736:	|  |  |         move.w d0,22(sp)
      ULONG extraoffset = 0;
    373a:	|  |  |         clr.l 18(sp)
      while( height > 512) {
    373e:	|  |  |     /-- bra.s 378c <PrepareLineBuffer+0x128>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
    3740:	|  |  |  /--|-> movea.w 14(sp),a1
    3744:	|  |  |  |  |   movea.w 26(sp),a0
    3748:	|  |  |  |  |   move.l a1,d0
    374a:	|  |  |  |  |   sub.l a0,d0
    374c:	|  |  |  |  |   move.l d0,d0
    374e:	|  |  |  |  |   add.w d0,d0
    3750:	|  |  |  |  |   moveq #0,d1
    3752:	|  |  |  |  |   move.w d0,d1
    3754:	|  |  |  |  |   movea.w 26(sp),a0
    3758:	|  |  |  |  |   move.l 28(sp),d0
    375c:	|  |  |  |  |   add.l 18(sp),d0
    3760:	|  |  |  |  |   move.l #65535,-(sp)
    3766:	|  |  |  |  |   move.l d1,-(sp)
    3768:	|  |  |  |  |   move.l a0,-(sp)
    376a:	|  |  |  |  |   pea 200 <Utils_DrawLinePrepare+0x38>
    376e:	|  |  |  |  |   move.l d0,-(sp)
    3770:	|  |  |  |  |   jsr 102 <Utils_BlitClear>(pc)
    3774:	|  |  |  |  |   lea 20(sp),sp
        height -= 512;
    3778:	|  |  |  |  |   move.w 22(sp),d0
    377c:	|  |  |  |  |   addi.w #-512,d0
    3780:	|  |  |  |  |   move.w d0,22(sp)
        extraoffset += 512*12;
    3784:	|  |  |  |  |   addi.l #6144,18(sp)
      while( height > 512) {
    378c:	|  |  |  |  \-> cmpi.w #512,22(sp)
    3792:	|  |  |  \----- bgt.s 3740 <PrepareLineBuffer+0xdc>
      }
      Utils_BlitClear( startbuffer+extraoffset, height, i, linesize*2-2*i, 0xffff);        
    3794:	|  |  |         movea.w 14(sp),a1
    3798:	|  |  |         movea.w 26(sp),a0
    379c:	|  |  |         move.l a1,d0
    379e:	|  |  |         sub.l a0,d0
    37a0:	|  |  |         move.l d0,d0
    37a2:	|  |  |         add.w d0,d0
    37a4:	|  |  |         moveq #0,d1
    37a6:	|  |  |         move.w d0,d1
    37a8:	|  |  |         movea.w 26(sp),a1
    37ac:	|  |  |         movea.w 22(sp),a0
    37b0:	|  |  |         move.l 28(sp),d0
    37b4:	|  |  |         add.l 18(sp),d0
    37b8:	|  |  |         move.l #65535,-(sp)
    37be:	|  |  |         move.l d1,-(sp)
    37c0:	|  |  |         move.l a1,-(sp)
    37c2:	|  |  |         move.l a0,-(sp)
    37c4:	|  |  |         move.l d0,-(sp)
    37c6:	|  |  |         jsr 102 <Utils_BlitClear>(pc)
    37ca:	|  |  |         lea 20(sp),sp
    }
    startbuffer += repeats*linesize*2*16;
    37ce:	|  |  \-------> movea.w 16(sp),a0
    37d2:	|  |            movea.w 14(sp),a1
    37d6:	|  |            move.l a1,-(sp)
    37d8:	|  |            move.l a0,-(sp)
    37da:	|  |            jsr 6734 <__mulsi3>
    37e0:	|  |            addq.l #8,sp
    37e2:	|  |            lsl.l #5,d0
    37e4:	|  |            add.l d0,28(sp)
  for( WORD i=0;i <=5;i++) {
    37e8:	|  |            move.w 26(sp),d0
    37ec:	|  |            addq.w #1,d0
    37ee:	|  |            move.w d0,26(sp)
    37f2:	|  \----------> cmpi.w #5,26(sp)
    37f8:	\-------------- ble.w 3686 <PrepareLineBuffer+0x22>
  }
}
    37fc:	                nop
    37fe:	                nop
    3800:	                movem.l (sp)+,d2-d3/a2
    3804:	                lea 20(sp),sp
    3808:	                rts

0000380a <DrawRect>:

volatile UWORD BltCon0LineDraw;

void DrawRect(struct Square *square)
{  
    380a:	                      movem.l d2-d5/a2-a4,-(sp)
    380e:	                      movea.l 32(sp),a2
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  //PrepareBuffer,buffer->BitPlane,0xca

  UWORD startbufferoffset = square->YPosMin*64;
    3812:	                      move.w 24(a2),d0

  WORD ypos = 0;
  WORD height = square->Height;
    3816:	                      movea.w 28(a2),a0
  if(square->YPosMin < 0) {
    381a:	      /-------------- bmi.w 3924 <DrawRect+0x11a>
  UWORD startbufferoffset = square->YPosMin*64;
    381e:	      |               move.w d0,d3
    3820:	      |               lsl.w #6,d3
    height += square->YPosMin;
    ypos -= square->YPosMin;
    startbufferoffset = 0;
  } else if(square->YPosMin>256) {
    3822:	      |               cmpi.w #256,d0
    3826:	      |           /-- ble.s 382e <DrawRect+0x24>
    DrawRectSub2(square, 2, 3);
    DrawRectSub2(square, 3, 0);

    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
  }     
}
    3828:	      |        /--|-> movem.l (sp)+,d2-d5/a2-a4
    382c:	      |        |  |   rts
  } else if(square->YPosMin+square->Height > 256) {
    382e:	      |        |  \-> movea.w a0,a1
    3830:	      |        |      lea (0,a1,d0.w),a1
    3834:	      |        |      cmpa.w #256,a1
    3838:	/-----|--------|----- ble.w 394a <DrawRect+0x140>
    height = 256 - square->YPosMin;
    383c:	|     |        |      move.w #256,d4
    3840:	|     |        |      sub.w d0,d4
  WORD ypos = 0;
    3842:	|     |        |      clr.w d5
  WORD xlength = square->XLength + 32;
    3844:	|  /--|--------|----> move.w 26(a2),d1
  WORD xposmin = square->XPosMin;
    3848:	|  |  |        |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    384c:	|  |  |     /--|----- ble.w 393a <DrawRect+0x130>
  WORD xlength = square->XLength + 32;
    3850:	|  |  |     |  |  /-> addi.w #32,d1
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    3854:	|  |  |  /--|--|--|-> tst.w d4
    3856:	|  |  |  |  |  +--|-- ble.s 3828 <DrawRect+0x1e>
    3858:	|  |  |  |  |  |  |   cmpi.w #15,d1
    385c:	|  |  |  |  |  +--|-- ble.s 3828 <DrawRect+0x1e>
    385e:	|  |  |  |  |  |  |   cmpi.w #256,d0
    3862:	|  |  |  |  |  \--|-- beq.s 3828 <DrawRect+0x1e>
  xlength = xlength/16;
    3864:	|  |  |  |  |     |   asr.w #4,d1
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    3866:	|  |  |  |  |     |   movea.w d1,a3
    3868:	|  |  |  |  |     |   clr.l -(sp)
    386a:	|  |  |  |  |     |   moveq #32,d0
    386c:	|  |  |  |  |     |   sub.l a3,d0
    386e:	|  |  |  |  |     |   add.w d0,d0
    3870:	|  |  |  |  |     |   move.w d0,-(sp)
    3872:	|  |  |  |  |     |   clr.w -(sp)
    3874:	|  |  |  |  |     |   move.l a3,-(sp)
    3876:	|  |  |  |  |     |   movea.w a0,a0
    3878:	|  |  |  |  |     |   move.l a0,-(sp)
    387a:	|  |  |  |  |     |   move.w d2,d0
    387c:	|  |  |  |  |     |   asr.w #4,d0
    387e:	|  |  |  |  |     |   movea.w d0,a0
    3880:	|  |  |  |  |     |   adda.l a0,a0
    3882:	|  |  |  |  |     |   adda.l 971de <PrepareBuffer>,a0
    3888:	|  |  |  |  |     |   move.l a0,-(sp)
    388a:	|  |  |  |  |     |   jsr 102 <Utils_BlitClear>(pc)
    custom->bltcon1 = 0x0000;      
    388e:	|  |  |  |  |     |   move.w #0,dff042 <_end+0xd67e0e>
    custom->bltcdat = 0x0;
    3896:	|  |  |  |  |     |   move.w #0,dff070 <_end+0xd67e3c>
    BltCon0LineDraw = 0x0500;
    389e:	|  |  |  |  |     |   move.w #1280,97230 <BltCon0LineDraw>
    DrawRectSub2(square, 0, 1);
    38a6:	|  |  |  |  |     |   pea 1 <_start+0x1>
    38aa:	|  |  |  |  |     |   clr.l -(sp)
    38ac:	|  |  |  |  |     |   move.l a2,-(sp)
    38ae:	|  |  |  |  |     |   lea 3d7e <DrawRectSub2>(pc),a4
    38b2:	|  |  |  |  |     |   jsr (a4)
    BltCon0LineDraw = 0x0700;
    38b4:	|  |  |  |  |     |   move.w #1792,97230 <BltCon0LineDraw>
    DrawRectSub2(square, 1, 2);
    38bc:	|  |  |  |  |     |   lea 32(sp),sp
    38c0:	|  |  |  |  |     |   pea 2 <_start+0x2>
    38c4:	|  |  |  |  |     |   pea 1 <_start+0x1>
    38c8:	|  |  |  |  |     |   move.l a2,-(sp)
    38ca:	|  |  |  |  |     |   jsr (a4)
    DrawRectSub2(square, 2, 3);
    38cc:	|  |  |  |  |     |   pea 3 <_start+0x3>
    38d0:	|  |  |  |  |     |   pea 2 <_start+0x2>
    38d4:	|  |  |  |  |     |   move.l a2,-(sp)
    38d6:	|  |  |  |  |     |   jsr (a4)
    DrawRectSub2(square, 3, 0);
    38d8:	|  |  |  |  |     |   clr.l -(sp)
    38da:	|  |  |  |  |     |   pea 3 <_start+0x3>
    38de:	|  |  |  |  |     |   move.l a2,-(sp)
    38e0:	|  |  |  |  |     |   jsr (a4)
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    38e2:	|  |  |  |  |     |   lea 36(sp),sp
    38e6:	|  |  |  |  |     |   moveq #0,d0
    38e8:	|  |  |  |  |     |   move.w 30(a2),d0
    38ec:	|  |  |  |  |     |   move.l d0,-(sp)
    38ee:	|  |  |  |  |     |   pea cf <Utils_FillLong+0x17>
    38f2:	|  |  |  |  |     |   andi.l #65535,d3
    38f8:	|  |  |  |  |     |   movea.l 971d2 <DrawBuffer>,a0
    38fe:	|  |  |  |  |     |   add.l (a0),d3
    3900:	|  |  |  |  |     |   move.l d3,-(sp)
    3902:	|  |  |  |  |     |   move.l 971de <PrepareBuffer>,-(sp)
    3908:	|  |  |  |  |     |   move.l a3,-(sp)
    390a:	|  |  |  |  |     |   movea.w d4,a0
    390c:	|  |  |  |  |     |   move.l a0,-(sp)
    390e:	|  |  |  |  |     |   move.w d5,-(sp)
    3910:	|  |  |  |  |     |   clr.w -(sp)
    3912:	|  |  |  |  |     |   movea.w d2,a0
    3914:	|  |  |  |  |     |   move.l a0,-(sp)
    3916:	|  |  |  |  |     |   jsr 75e <Utils_CopyPolygon>(pc)
    391a:	|  |  |  |  |     |   lea 32(sp),sp
}
    391e:	|  |  |  |  |     |   movem.l (sp)+,d2-d5/a2-a4
    3922:	|  |  |  |  |     |   rts
    height += square->YPosMin;
    3924:	|  |  \--|--|-----|-> move.w a0,d4
    3926:	|  |     |  |     |   add.w d0,d4
    ypos -= square->YPosMin;
    3928:	|  |     |  |     |   move.w d0,d5
    392a:	|  |     |  |     |   neg.w d5
    startbufferoffset = 0;
    392c:	|  |     |  |     |   clr.w d3
  WORD xlength = square->XLength + 32;
    392e:	|  |     |  |     |   move.w 26(a2),d1
  WORD xposmin = square->XPosMin;
    3932:	|  |     |  |     |   move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    3936:	|  |     |  |     \-- bgt.w 3850 <DrawRect+0x46>
    xlength += xposmin - 16;    
    393a:	|  |     |  \-------> add.w d2,d1
    393c:	|  |     |            addi.w #16,d1
    startbufferoffset -= 12;
    3940:	|  |     |            addi.w #-12,d3
    copymin = 96;
    3944:	|  |     |            moveq #96,d2
    3946:	|  |     \----------- bra.w 3854 <DrawRect+0x4a>
  WORD height = square->Height;
    394a:	\--|----------------> move.w a0,d4
  WORD ypos = 0;
    394c:	   |                  clr.w d5
    394e:	   \----------------- bra.w 3844 <DrawRect+0x3a>

00003952 <DrawLetters>:

void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
{
    3952:	                            lea -52(sp),sp
    3956:	                            movem.l d2-d7/a2-a6,-(sp)
    395a:	                            movea.l 100(sp),a2
    395e:	                            movea.l 104(sp),a4
    3962:	                            move.l 112(sp),d0
    3966:	                            move.w 118(sp),d1

  struct Square square;
  
  for(int i2=0;i2<numcube;i2++)
    396a:	                            moveq #0,d2
    396c:	                            move.w d0,d2
    396e:	                            move.l d2,56(sp)
    3972:	                            tst.w d0
    3974:	/-------------------------- beq.s 39e8 <DrawLetters+0x96>
    3976:	|                           clr.l 48(sp)
    397a:	|                           move.l #618002,60(sp)
    3982:	|                           lea 49576 <zMult.lto_priv.1>,a3
    3988:	|                           cmpi.w #1,d1
    398c:	|  /----------------------- beq.w 3b6a <DrawLetters+0x218>
  {

    UWORD cubenr = metadata[0];
    UWORD facenr = metadata[1];

    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    3990:	|  |  /-------------------> moveq #0,d0
    3992:	|  |  |                     move.w (a4),d0
    3994:	|  |  |                     moveq #0,d3
    3996:	|  |  |                     move.w 2(a4),d3
    399a:	|  |  |                     movea.l d3,a0
    399c:	|  |  |                     move.l d0,d1
    399e:	|  |  |                     add.l d0,d1
    39a0:	|  |  |                     add.l d1,d0
    39a2:	|  |  |                     add.l d0,d0
    39a4:	|  |  |                     adda.l d0,a0
    39a6:	|  |  |                     move.l a0,d4
    39a8:	|  |  |                     lsl.l #5,d4
    39aa:	|  |  |                     movea.l d4,a0
    39ac:	|  |  |                     adda.l 60(sp),a0
    39b0:	|  |  |                     move.l 16(a0),d0
    39b4:	|  |  |                     move.l d0,80(sp)

    if( square.DotProduct > 1) 
    {
      for(int i=0;i<metadata[2];i++)
    39b8:	|  |  |                     move.w 4(a4),46(sp)
    if( square.DotProduct > 1) 
    39be:	|  |  |                     moveq #1,d1
    39c0:	|  |  |                     cmp.l d0,d1
    39c2:	|  |  |     /-------------- blt.w 3bc6 <DrawLetters+0x274>
        vectors += 12;
      }
    }
    else 
    {
      vectors += 12*metadata[2];
    39c6:	|  |  |     |               movea.w 46(sp),a0
    39ca:	|  |  |     |               move.l a0,d0
    39cc:	|  |  |     |               add.l a0,d0
    39ce:	|  |  |     |               add.l a0,d0
    39d0:	|  |  |     |               lsl.l #3,d0
    39d2:	|  |  |     |               adda.l d0,a2
    }
    metadata += 3 + metadata[2];    
    39d4:	|  |  |     |               addq.l #3,a0
    39d6:	|  |  |     |               adda.l a0,a0
    39d8:	|  |  |     |               adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    39da:	|  |  |     |               addq.l #1,48(sp)
    39de:	|  |  |     |               move.l 56(sp),d0
    39e2:	|  |  |     |               cmp.l 48(sp),d0
    39e6:	|  |  +-----|-------------- bne.s 3990 <DrawLetters+0x3e>
  }
}
    39e8:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    39ec:	|  |  |     |               lea 52(sp),sp
    39f0:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    39f2:	|  |  |     |  /----------> tst.w 46(sp)
    39f6:	|  |  |  /--|--|----------- ble.w 3d60 <DrawLetters+0x40e>
    39fa:	|  |  |  |  |  |            lea 6(a4),a6
    39fe:	|  |  |  |  |  |            suba.l a5,a5
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3a00:	|  |  |  |  |  |            lea 20(a0),a0
    3a04:	|  |  |  |  |  |            move.l a0,52(sp)
        square.Color = metadata[3+i];
    3a08:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3a0c:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    3a10:	|  |  |  |  |  |  |         move.l a0,d0
    3a12:	|  |  |  |  |  |  |         subq.l #1,d0
    3a14:	|  |  |  |  |  |  |         add.l d0,d0
    3a16:	|  |  |  |  |  |  |         move.w (0,a3,d0.l),d0
    3a1a:	|  |  |  |  |  |  |         move.w d0,d1
    3a1c:	|  |  |  |  |  |  |         muls.w (a2),d1
    3a1e:	|  |  |  |  |  |  |         moveq #15,d4
    3a20:	|  |  |  |  |  |  |         asr.l d4,d1
    3a22:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    3a26:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    3a2a:	|  |  |  |  |  |  |         asr.l d4,d0
    3a2c:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3a30:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    3a34:	|  |  |  |  |  |  |         subq.l #1,a0
    3a36:	|  |  |  |  |  |  |         adda.l a0,a0
    3a38:	|  |  |  |  |  |  |         move.w (0,a3,a0.l),d2
    3a3c:	|  |  |  |  |  |  |         move.w d2,d7
    3a3e:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    3a42:	|  |  |  |  |  |  |         asr.l d4,d7
    3a44:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3a48:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    3a4c:	|  |  |  |  |  |  |         asr.l d4,d2
    3a4e:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3a52:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    3a56:	|  |  |  |  |  |  |         subq.l #1,a0
    3a58:	|  |  |  |  |  |  |         adda.l a0,a0
    3a5a:	|  |  |  |  |  |  |         move.w (0,a3,a0.l),d3
    3a5e:	|  |  |  |  |  |  |         move.w d3,d6
    3a60:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    3a64:	|  |  |  |  |  |  |         asr.l d4,d6
    3a66:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3a6a:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    3a6e:	|  |  |  |  |  |  |         asr.l d4,d3
    3a70:	|  |  |  |  |  |  |         movea.w d3,a1
    3a72:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3a76:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    3a7a:	|  |  |  |  |  |  |         subq.l #1,a0
    3a7c:	|  |  |  |  |  |  |         adda.l a0,a0
    3a7e:	|  |  |  |  |  |  |         move.w (0,a3,a0.l),d3
    3a82:	|  |  |  |  |  |  |         move.w d3,d5
    3a84:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    3a88:	|  |  |  |  |  |  |         asr.l d4,d5
    3a8a:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    3a8e:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    3a92:	|  |  |  |  |  |  |         asr.l d4,d3
    3a94:	|  |  |  |  |  |  |         movea.w d3,a0
    3a96:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    3a9a:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    3a9e:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    3aa2:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    3aa6:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    3aaa:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    3aae:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    3ab2:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    3ab6:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    3aba:	|  |  |  |  |  |  |         move.w d1,d4
    3abc:	|  |  |  |  |  |  |         cmp.w d1,d7
    3abe:	|  |  |  |  |  |  |     /-- bge.s 3ac2 <DrawLetters+0x170>
    3ac0:	|  |  |  |  |  |  |     |   move.w d7,d4
    3ac2:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    3ac4:	|  |  |  |  |  |  |     /-- bge.s 3ac8 <DrawLetters+0x176>
    3ac6:	|  |  |  |  |  |  |     |   move.w d6,d4
    3ac8:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    3aca:	|  |  |  |  |  |  |     /-- bge.s 3ace <DrawLetters+0x17c>
    3acc:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    3ace:	|  |  |  |  |  |  |     \-> move.w d0,d3
    3ad0:	|  |  |  |  |  |  |         cmp.w d0,d2
    3ad2:	|  |  |  |  |  |  |     /-- bge.s 3ad6 <DrawLetters+0x184>
    3ad4:	|  |  |  |  |  |  |     |   move.w d2,d3
    3ad6:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    3ad8:	|  |  |  |  |  |  |     /-- ble.s 3adc <DrawLetters+0x18a>
    3ada:	|  |  |  |  |  |  |     |   move.w a1,d3
    3adc:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    3ade:	|  |  |  |  |  |  |     /-- ble.s 3ae2 <DrawLetters+0x190>
    3ae0:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    3ae2:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    3ae6:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    3aea:	|  |  |  |  |  |  |         cmp.w d0,d2
    3aec:	|  |  |  |  |  |  |     /-- ble.s 3af0 <DrawLetters+0x19e>
    3aee:	|  |  |  |  |  |  |     |   move.w d2,d0
    3af0:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    3af2:	|  |  |  |  |  |  |     /-- bge.s 3af6 <DrawLetters+0x1a4>
    3af4:	|  |  |  |  |  |  |     |   move.w a1,d0
    3af6:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    3af8:	|  |  |  |  |  |  |     /-- bge.s 3afc <DrawLetters+0x1aa>
    3afa:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    3afc:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    3afe:	|  |  |  |  |  |  |         sub.w d3,d0
    3b00:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    3b04:	|  |  |  |  |  |  |         cmpi.w #1,d0
    3b08:	|  |  |  |  |  |  |  /----- ble.s 3b44 <DrawLetters+0x1f2>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    3b0a:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    3b0c:	|  |  |  |  |  |  |  |  /-- ble.s 3b10 <DrawLetters+0x1be>
    3b0e:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    3b10:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    3b12:	|  |  |  |  |  |  |  |  /-- ble.s 3b16 <DrawLetters+0x1c4>
    3b14:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    3b16:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    3b18:	|  |  |  |  |  |  |  |  /-- ble.s 3b1c <DrawLetters+0x1ca>
    3b1a:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    3b1c:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    3b1e:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    3b22:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    3b26:	|  |  |  |  |  |  |  +----- ble.s 3b44 <DrawLetters+0x1f2>
              square.Clockwise *= -1;
    3b28:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    3b2c:	|  |  |  |  |  |  |  |      move.w (a0),d0
    3b2e:	|  |  |  |  |  |  |  |      neg.w d0
    3b30:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    3b34:	|  |  |  |  |  |  |  |      pea 64(sp)
    3b38:	|  |  |  |  |  |  |  |      jsr 380a <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    3b3c:	|  |  |  |  |  |  |  |      move.w 4(a4),50(sp)
    3b42:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    3b44:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    3b48:	|  |  |  |  |  |  |         addq.l #1,a5
    3b4a:	|  |  |  |  |  |  |         movea.w 46(sp),a0
    3b4e:	|  |  |  |  |  |  |         cmpa.l a0,a5
    3b50:	|  |  |  |  |  |  \-------- blt.w 3a08 <DrawLetters+0xb6>
    metadata += 3 + metadata[2];    
    3b54:	|  |  |  |  |  |            addq.l #3,a0
    3b56:	|  |  |  |  |  |            adda.l a0,a0
    3b58:	|  |  |  |  |  |            adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    3b5a:	|  |  |  |  |  |            addq.l #1,48(sp)
    3b5e:	|  |  |  |  |  |            move.l 56(sp),d0
    3b62:	|  |  |  |  |  |            cmp.l 48(sp),d0
    3b66:	+--|--|--|--|--|----------- beq.w 39e8 <DrawLetters+0x96>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    3b6a:	|  >--|--|--|--|----------> moveq #0,d0
    3b6c:	|  |  |  |  |  |            move.w (a4),d0
    3b6e:	|  |  |  |  |  |            moveq #0,d1
    3b70:	|  |  |  |  |  |            move.w 2(a4),d1
    3b74:	|  |  |  |  |  |            movea.l d1,a0
    3b76:	|  |  |  |  |  |            move.l d0,d1
    3b78:	|  |  |  |  |  |            add.l d0,d1
    3b7a:	|  |  |  |  |  |            add.l d1,d0
    3b7c:	|  |  |  |  |  |            add.l d0,d0
    3b7e:	|  |  |  |  |  |            adda.l d0,a0
    3b80:	|  |  |  |  |  |            move.l a0,d2
    3b82:	|  |  |  |  |  |            lsl.l #5,d2
    3b84:	|  |  |  |  |  |            movea.l d2,a0
    3b86:	|  |  |  |  |  |            adda.l 60(sp),a0
    3b8a:	|  |  |  |  |  |            move.l 16(a0),d0
    3b8e:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    3b92:	|  |  |  |  |  |            move.w 4(a4),46(sp)
    if( square.DotProduct > 1) 
    3b98:	|  |  |  |  |  |            moveq #1,d3
    3b9a:	|  |  |  |  |  |            cmp.l d0,d3
    3b9c:	|  |  |  |  |  \----------- blt.w 39f2 <DrawLetters+0xa0>
      vectors += 12*metadata[2];
    3ba0:	|  |  |  |  |               movea.w 46(sp),a0
    3ba4:	|  |  |  |  |               move.l a0,d0
    3ba6:	|  |  |  |  |               add.l a0,d0
    3ba8:	|  |  |  |  |               add.l a0,d0
    3baa:	|  |  |  |  |               lsl.l #3,d0
    3bac:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    3bae:	|  |  |  |  |               addq.l #3,a0
    3bb0:	|  |  |  |  |               adda.l a0,a0
    3bb2:	|  |  |  |  |               adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    3bb4:	|  |  |  |  |               addq.l #1,48(sp)
    3bb8:	|  |  |  |  |               move.l 56(sp),d0
    3bbc:	|  |  |  |  |               cmp.l 48(sp),d0
    3bc0:	|  +--|--|--|-------------- bne.s 3b6a <DrawLetters+0x218>
    3bc2:	+--|--|--|--|-------------- bra.w 39e8 <DrawLetters+0x96>
      for(int i=0;i<metadata[2];i++)
    3bc6:	|  |  |  |  \-------------> tst.w 46(sp)
    3bca:	|  |  |  |     /----------- ble.w 3d42 <DrawLetters+0x3f0>
    3bce:	|  |  |  |     |            lea 6(a4),a6
    3bd2:	|  |  |  |     |            suba.l a5,a5
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3bd4:	|  |  |  |     |            lea 20(a0),a0
    3bd8:	|  |  |  |     |            move.l a0,52(sp)
        square.Color = metadata[3+i];
    3bdc:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3be0:	|  |  |  |     |  |         movea.w 4(a2),a0
    3be4:	|  |  |  |     |  |         move.l a0,d0
    3be6:	|  |  |  |     |  |         subq.l #1,d0
    3be8:	|  |  |  |     |  |         add.l d0,d0
    3bea:	|  |  |  |     |  |         move.w (0,a3,d0.l),d2
    3bee:	|  |  |  |     |  |         move.w d2,d7
    3bf0:	|  |  |  |     |  |         muls.w (a2),d7
    3bf2:	|  |  |  |     |  |         moveq #15,d3
    3bf4:	|  |  |  |     |  |         asr.l d3,d7
    3bf6:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    3bfa:	|  |  |  |     |  |         muls.w 2(a2),d2
    3bfe:	|  |  |  |     |  |         asr.l d3,d2
    3c00:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3c04:	|  |  |  |     |  |         movea.w 10(a2),a0
    3c08:	|  |  |  |     |  |         move.l a0,d0
    3c0a:	|  |  |  |     |  |         subq.l #1,d0
    3c0c:	|  |  |  |     |  |         add.l d0,d0
    3c0e:	|  |  |  |     |  |         move.w (0,a3,d0.l),d0
    3c12:	|  |  |  |     |  |         move.w d0,d1
    3c14:	|  |  |  |     |  |         muls.w 6(a2),d1
    3c18:	|  |  |  |     |  |         asr.l d3,d1
    3c1a:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3c1e:	|  |  |  |     |  |         muls.w 8(a2),d0
    3c22:	|  |  |  |     |  |         asr.l d3,d0
    3c24:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3c28:	|  |  |  |     |  |         movea.w 16(a2),a0
    3c2c:	|  |  |  |     |  |         subq.l #1,a0
    3c2e:	|  |  |  |     |  |         adda.l a0,a0
    3c30:	|  |  |  |     |  |         move.w (0,a3,a0.l),d3
    3c34:	|  |  |  |     |  |         move.w d3,d6
    3c36:	|  |  |  |     |  |         muls.w 12(a2),d6
    3c3a:	|  |  |  |     |  |         moveq #15,d4
    3c3c:	|  |  |  |     |  |         asr.l d4,d6
    3c3e:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3c42:	|  |  |  |     |  |         muls.w 14(a2),d3
    3c46:	|  |  |  |     |  |         asr.l d4,d3
    3c48:	|  |  |  |     |  |         movea.w d3,a1
    3c4a:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3c4e:	|  |  |  |     |  |         movea.w 22(a2),a0
    3c52:	|  |  |  |     |  |         subq.l #1,a0
    3c54:	|  |  |  |     |  |         adda.l a0,a0
    3c56:	|  |  |  |     |  |         move.w (0,a3,a0.l),d3
    3c5a:	|  |  |  |     |  |         move.w d3,d5
    3c5c:	|  |  |  |     |  |         muls.w 18(a2),d5
    3c60:	|  |  |  |     |  |         asr.l d4,d5
    3c62:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    3c66:	|  |  |  |     |  |         muls.w 20(a2),d3
    3c6a:	|  |  |  |     |  |         asr.l d4,d3
    3c6c:	|  |  |  |     |  |         movea.w d3,a0
    3c6e:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    3c72:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    3c76:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    3c7a:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    3c7e:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    3c82:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    3c86:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    3c8a:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    3c8e:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    3c92:	|  |  |  |     |  |         move.w d1,d4
    3c94:	|  |  |  |     |  |         cmp.w d1,d7
    3c96:	|  |  |  |     |  |     /-- bge.s 3c9a <DrawLetters+0x348>
    3c98:	|  |  |  |     |  |     |   move.w d7,d4
    3c9a:	|  |  |  |     |  |     \-> cmp.w d4,d6
    3c9c:	|  |  |  |     |  |     /-- bge.s 3ca0 <DrawLetters+0x34e>
    3c9e:	|  |  |  |     |  |     |   move.w d6,d4
    3ca0:	|  |  |  |     |  |     \-> cmp.w d4,d5
    3ca2:	|  |  |  |     |  |     /-- bge.s 3ca6 <DrawLetters+0x354>
    3ca4:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    3ca6:	|  |  |  |     |  |     \-> move.w d0,d3
    3ca8:	|  |  |  |     |  |         cmp.w d0,d2
    3caa:	|  |  |  |     |  |     /-- bge.s 3cae <DrawLetters+0x35c>
    3cac:	|  |  |  |     |  |     |   move.w d2,d3
    3cae:	|  |  |  |     |  |     \-> cmp.w a1,d3
    3cb0:	|  |  |  |     |  |     /-- ble.s 3cb4 <DrawLetters+0x362>
    3cb2:	|  |  |  |     |  |     |   move.w a1,d3
    3cb4:	|  |  |  |     |  |     \-> cmp.w a0,d3
    3cb6:	|  |  |  |     |  |     /-- ble.s 3cba <DrawLetters+0x368>
    3cb8:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    3cba:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    3cbe:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    3cc2:	|  |  |  |     |  |         cmp.w d0,d2
    3cc4:	|  |  |  |     |  |     /-- ble.s 3cc8 <DrawLetters+0x376>
    3cc6:	|  |  |  |     |  |     |   move.w d2,d0
    3cc8:	|  |  |  |     |  |     \-> cmp.w a1,d0
    3cca:	|  |  |  |     |  |     /-- bge.s 3cce <DrawLetters+0x37c>
    3ccc:	|  |  |  |     |  |     |   move.w a1,d0
    3cce:	|  |  |  |     |  |     \-> cmp.w a0,d0
    3cd0:	|  |  |  |     |  |     /-- bge.s 3cd4 <DrawLetters+0x382>
    3cd2:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    3cd4:	|  |  |  |     |  |     \-> addq.w #1,d0
    3cd6:	|  |  |  |     |  |         sub.w d3,d0
    3cd8:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    3cdc:	|  |  |  |     |  |         cmpi.w #1,d0
    3ce0:	|  |  |  |     |  |  /----- ble.s 3d18 <DrawLetters+0x3c6>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    3ce2:	|  |  |  |     |  |  |      cmp.w d1,d7
    3ce4:	|  |  |  |     |  |  |  /-- ble.s 3ce8 <DrawLetters+0x396>
    3ce6:	|  |  |  |     |  |  |  |   move.w d7,d1
    3ce8:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    3cea:	|  |  |  |     |  |  |  /-- ble.s 3cee <DrawLetters+0x39c>
    3cec:	|  |  |  |     |  |  |  |   move.w d6,d1
    3cee:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    3cf0:	|  |  |  |     |  |  |  /-- ble.s 3cf4 <DrawLetters+0x3a2>
    3cf2:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    3cf4:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    3cf6:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    3cfa:	|  |  |  |     |  |  |      cmpi.w #1,d1
    3cfe:	|  |  |  |     |  |  +----- ble.s 3d18 <DrawLetters+0x3c6>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3d00:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    3d04:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    3d08:	|  |  |  |     |  |  |      pea 64(sp)
    3d0c:	|  |  |  |     |  |  |      jsr 380a <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    3d10:	|  |  |  |     |  |  |      move.w 4(a4),50(sp)
    3d16:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    3d18:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    3d1c:	|  |  |  |     |  |         addq.l #1,a5
    3d1e:	|  |  |  |     |  |         movea.w 46(sp),a0
    3d22:	|  |  |  |     |  |         cmpa.l a0,a5
    3d24:	|  |  |  |     |  \-------- blt.w 3bdc <DrawLetters+0x28a>
    metadata += 3 + metadata[2];    
    3d28:	|  |  |  |     |            addq.l #3,a0
    3d2a:	|  |  |  |     |            adda.l a0,a0
    3d2c:	|  |  |  |     |            adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    3d2e:	|  |  |  |     |            addq.l #1,48(sp)
    3d32:	|  |  |  |     |            move.l 56(sp),d0
    3d36:	|  |  |  |     |            cmp.l 48(sp),d0
    3d3a:	|  |  +--|-----|----------- bne.w 3990 <DrawLetters+0x3e>
    3d3e:	+--|--|--|-----|----------- bra.w 39e8 <DrawLetters+0x96>
    metadata += 3 + metadata[2];    
    3d42:	|  |  |  |     \----------> movea.w 46(sp),a0
    3d46:	|  |  |  |                  addq.l #3,a0
    3d48:	|  |  |  |                  adda.l a0,a0
    3d4a:	|  |  |  |                  adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    3d4c:	|  |  |  |                  addq.l #1,48(sp)
    3d50:	|  |  |  |                  move.l 56(sp),d0
    3d54:	|  |  |  |                  cmp.l 48(sp),d0
    3d58:	|  |  \--|----------------- bne.w 3990 <DrawLetters+0x3e>
    3d5c:	+--|-----|----------------- bra.w 39e8 <DrawLetters+0x96>
    metadata += 3 + metadata[2];    
    3d60:	|  |     \----------------> movea.w 46(sp),a0
    3d64:	|  |                        addq.l #3,a0
    3d66:	|  |                        adda.l a0,a0
    3d68:	|  |                        adda.l a0,a4
  for(int i2=0;i2<numcube;i2++)
    3d6a:	|  |                        addq.l #1,48(sp)
    3d6e:	|  |                        move.l 56(sp),d0
    3d72:	|  |                        cmp.l 48(sp),d0
    3d76:	|  \----------------------- bne.w 3b6a <DrawLetters+0x218>
    3d7a:	\-------------------------- bra.w 39e8 <DrawLetters+0x96>

00003d7e <DrawRectSub2>:

inline void DrawRectSub2( struct Square *square, UWORD index1, UWORD index2)
{
    3d7e:	                                              movem.l d2-d7/a2-a3,-(sp)
    3d82:	                                              movea.l 36(sp),a2

  WORD x1 = square->Vertices[index1].X;
    3d86:	                                              moveq #0,d1
    3d88:	                                              move.w 42(sp),d1
    3d8c:	                                              add.l d1,d1
    3d8e:	                                              add.l d1,d1
    3d90:	                                              movea.w (0,a2,d1.l),a3
  WORD y1 = square->Vertices[index1].Y;
  WORD x2 = square->Vertices[index2].X;
    3d94:	                                              moveq #0,d0
    3d96:	                                              move.w 46(sp),d0
    3d9a:	                                              add.l d0,d0
    3d9c:	                                              add.l d0,d0
    3d9e:	                                              move.w (0,a2,d0.l),d6
  WORD y2 = square->Vertices[index2].Y;
  WORD xlength = square->XLength;
    3da2:	                                              move.w 26(a2),d3

  WORD height = y1 - y2;
    3da6:	                                              move.w (2,a2,d1.l),d5
    3daa:	                                              move.w (2,a2,d0.l),d4
    3dae:	                                              move.w d5,d2
    3db0:	                                              sub.w d4,d2

  if(height >= 100) {
    3db2:	                                              cmpi.w #99,d2
    3db6:	                                          /-- bgt.s 3dc2 <DrawRectSub2+0x44>
     KPrintF("Cube height is huge.\n");
  }
  
  if(height != 0) {
    3db8:	                                          |   tst.w d2
    3dba:	                                       /--|-- bne.s 3dce <DrawRectSub2+0x50>
      }

      SmartLineFill( startx, startyblitt, height, length, minterm, bltwidth, bltstart);
    }
  }
}
    3dbc:	                                    /--|--|-> movem.l (sp)+,d2-d7/a2-a3
    3dc0:	                                    |  |  |   rts
     KPrintF("Cube height is huge.\n");
    3dc2:	                                    |  |  \-> pea 3d257 <incbin_MercuryLetterData2Lz4_end+0x1>
    3dc8:	                                    |  |      jsr 605c <KPrintF>(pc)
    3dcc:	                                    |  |      addq.l #4,sp
    if(xlength != 0) {
    3dce:	                                    |  \----> tst.w d3
    3dd0:	                                    \-------- beq.s 3dbc <DrawRectSub2+0x3e>
      WORD length = x1 - x2;
    3dd2:	                                              move.w a3,d7
    3dd4:	                                              sub.w d6,d7
      if(length < 0) {
    3dd6:	            /-------------------------------- bmi.w 3e7c <DrawRectSub2+0xfe>
    3dda:	            |                                 moveq #1,d0
      WORD index = 0;
    3ddc:	            |                                 clr.w d1
      length += 1;
    3dde:	            |                                 addq.w #1,d7
      if(height < 0) {
    3de0:	            |                                 tst.w d2
    3de2:	      /-----|-------------------------------- blt.w 3e70 <DrawRectSub2+0xf2>
      height += 1; 
    3de6:	      |     |  /----------------------------> move.w d2,d5
    3de8:	      |     |  |                              addq.w #1,d5
      if(square->Clockwise > 0) index = index ^ 0x3;
    3dea:	      |     |  |                              tst.w 20(a2)
    3dee:	      |     |  |                          /-- ble.s 3df4 <DrawRectSub2+0x76>
    3df0:	      |     |  |                          |   eori.w #3,d1
      WORD xposmin = square->XPosMin;
    3df4:	      |     |  |                          \-> movea.w 22(a2),a0
      WORD yposmin = square->YPosMin;
    3df8:	      |     |  |                              movea.w 24(a2),a1
      if(xposmin <= 0) {
    3dfc:	      |     |  |                              clr.w d0
    3dfe:	      |     |  |                              cmp.w a0,d0
    3e00:	      |     |  |              /-------------- bge.w 3e90 <DrawRectSub2+0x112>
        yposmin += 96;
    3e04:	      |     |  |              |               move.w a1,d0
      if(yposmin <= 0) {
    3e06:	      |     |  |     /--------|-------------- ble.s 3e66 <DrawRectSub2+0xe8>
      WORD startyblitt = starty - yposmin;
    3e08:	      |     |  |     |  /-----|-------------> sub.w d0,d4
      switch(index) {
    3e0a:	      |     |  |     |  |     |               cmpi.w #2,d1
    3e0e:	/-----|-----|--|-----|--|-----|-------------- beq.w 3ec6 <DrawRectSub2+0x148>
    3e12:	|     |     |  |     |  |     |               cmpi.w #3,d1
    3e16:	|     |     |  |  /--|--|-----|-------------- beq.w 3eae <DrawRectSub2+0x130>
    3e1a:	|     |     |  |  |  |  |     |               cmpi.w #1,d1
    3e1e:	|  /--|-----|--|--|--|--|-----|-------------- bne.w 3eca <DrawRectSub2+0x14c>
          height *= -1;
    3e22:	|  |  |     |  |  |  |  |     |               move.w d2,d5
    3e24:	|  |  |     |  |  |  |  |     |               not.w d5
          bltwidth = xlength/16+2;
    3e26:	|  |  |     |  |  |  |  |     |               tst.w d3
    3e28:	|  |  |     |  |  |  |  |     |  /----------- blt.w 3eb4 <DrawRectSub2+0x136>
          bltwidth = xlength/16+2;
    3e2c:	|  |  |     |  |  |  |  |     |  |     /----> asr.w #4,d3
    3e2e:	|  |  |     |  |  |  |  |     |  |     |      move.w d3,d0
    3e30:	|  |  |     |  |  |  |  |     |  |     |      addq.w #2,d0
          bltstart = (startx / 16)*2;
    3e32:	|  |  |     |  |  |  |  |     |  |     |      move.w d6,d1
    3e34:	|  |  |     |  |  |  |  |  /--|--|-----|----- bmi.s 3ea0 <DrawRectSub2+0x122>
    3e36:	|  |  |     |  |  |  |  |  |  |  |  /--|----> asr.w #4,d1
    3e38:	|  |  |     |  |  |  |  |  |  |  |  |  |      add.w d1,d1
    3e3a:	|  |  |     |  |  |  |  |  |  |  |  |  |      movea.w #187,a0
      SmartLineFill( startx, startyblitt, height, length, minterm, bltwidth, bltstart);
    3e3e:	|  |  |     |  |  |  |  |  |  |  |  |  |  /-> move.w d1,-(sp)
    3e40:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   clr.w -(sp)
    3e42:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.w d0,-(sp)
    3e44:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   clr.w -(sp)
    3e46:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
    3e48:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   movea.w d7,a0
    3e4a:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
    3e4c:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   movea.w d5,a0
    3e4e:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
    3e50:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   movea.w d4,a0
    3e52:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
    3e54:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   movea.w d6,a0
    3e56:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   move.l a0,-(sp)
    3e58:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   jsr 508e <SmartLineFill>(pc)
    3e5c:	|  |  |     |  |  |  |  |  |  |  |  |  |  |   lea 28(sp),sp
}
    3e60:	|  |  |  /--|--|--|--|--|--|--|--|--|--|--|-> movem.l (sp)+,d2-d7/a2-a3
    3e64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |   rts
        starty += 96;
    3e66:	|  |  |  |  |  |  |  >--|--|--|--|--|--|--|-> addi.w #96,d4
        yposmin += 96;
    3e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addi.w #96,d0
    3e6e:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|-- bra.s 3e08 <DrawRectSub2+0x8a>
        height = -height;
    3e70:	|  |  >--|--|--|--|--|--|--|--|--|--|--|--|-> move.w d4,d2
    3e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |   sub.w d5,d2
        index +=1;
    3e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d5,d4
    3e76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,d1
    3e78:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|-- bra.w 3de6 <DrawRectSub2+0x68>
        length *= -1;
    3e7c:	|  |  |  |  \--|--|--|--|--|--|--|--|--|--|-> move.w d6,d7
    3e7e:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   sub.w a3,d7
      WORD startx = x1;
    3e80:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   move.w a3,d6
    3e82:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   moveq #3,d0
        index = 2;
    3e84:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   moveq #2,d1
      length += 1;
    3e86:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   addq.w #1,d7
      if(height < 0) {
    3e88:	|  |  |  |     |  |  |  |  |  |  |  |  |  |   tst.w d2
    3e8a:	|  |  |  |     \--|--|--|--|--|--|--|--|--|-- bge.w 3de6 <DrawRectSub2+0x68>
    3e8e:	|  |  \--|--------|--|--|--|--|--|--|--|--|-- bra.s 3e70 <DrawRectSub2+0xf2>
        startx += 96;
    3e90:	|  |     |        |  |  |  |  \--|--|--|--|-> addi.w #96,d6
        xposmin += 96;
    3e94:	|  |     |        |  |  |  |     |  |  |  |   lea 96(a0),a0
        yposmin += 96;
    3e98:	|  |     |        |  |  |  |     |  |  |  |   move.w a1,d0
      if(yposmin <= 0) {
    3e9a:	|  |     |        |  |  \--|-----|--|--|--|-- bgt.w 3e08 <DrawRectSub2+0x8a>
    3e9e:	|  |     |        |  \-----|-----|--|--|--|-- bra.s 3e66 <DrawRectSub2+0xe8>
          bltstart = (startx / 16)*2;
    3ea0:	|  |     |        |        >-----|--|--|--|-> addi.w #15,d1
    3ea4:	|  |     |        |        |     |  |  |  |   asr.w #4,d1
    3ea6:	|  |     |        |        |     |  |  |  |   add.w d1,d1
    3ea8:	|  |     |        |        |     |  |  |  |   movea.w #187,a0
    3eac:	|  |     |        |        |     |  |  |  \-- bra.s 3e3e <DrawRectSub2+0xc0>
          bltwidth = xlength/16+2;
    3eae:	|  |     |        \--------|-----|--|--|----> tst.w d3
    3eb0:	|  |     |                 |     |  |  \----- bge.w 3e2c <DrawRectSub2+0xae>
    3eb4:	|  |     |                 |     \--|-------> addi.w #15,d3
    3eb8:	|  |     |                 |        |         asr.w #4,d3
    3eba:	|  |     |                 |        |         move.w d3,d0
    3ebc:	|  |     |                 |        |         addq.w #2,d0
          bltstart = (startx / 16)*2;
    3ebe:	|  |     |                 |        |         move.w d6,d1
    3ec0:	|  |     |                 |        \-------- bpl.w 3e36 <DrawRectSub2+0xb8>
    3ec4:	|  |     |                 \----------------- bra.s 3ea0 <DrawRectSub2+0x122>
          height *= -1;
    3ec6:	\--|-----|----------------------------------> move.w d2,d5
    3ec8:	   |     |                                    not.w d5
          startx -= 1;
    3eca:	   \-----|----------------------------------> subq.w #1,d6
          bltwidth = length / 16 + 2;
    3ecc:	         |                                    move.w d7,d0
    3ece:	         |                                /-- bmi.s 3f0e <DrawRectSub2+0x190>
    3ed0:	         |                                |   asr.w #4,d0
    3ed2:	         |                                |   addq.w #2,d0
          bltstart = ((xposmin-1)/16)*2;
    3ed4:	         |                                |   move.w a0,d1
    3ed6:	         |                                |   subq.w #1,d1
    3ed8:	         |                                |   movea.w d1,a0
    3eda:	         |                                |   tst.w d1
    3edc:	         |                          /-----|-- bmi.s 3f20 <DrawRectSub2+0x1a2>
    3ede:	         |                          |  /--|-> move.l a0,d1
    3ee0:	         |                          |  |  |   asr.l #4,d1
    3ee2:	         |                          |  |  |   add.w d1,d1
          break;
    3ee4:	         |                          |  |  |   movea.w #238,a0
      SmartLineFill( startx, startyblitt, height, length, minterm, bltwidth, bltstart);
    3ee8:	         |                       /--|--|--|-> move.w d1,-(sp)
    3eea:	         |                       |  |  |  |   clr.w -(sp)
    3eec:	         |                       |  |  |  |   move.w d0,-(sp)
    3eee:	         |                       |  |  |  |   clr.w -(sp)
    3ef0:	         |                       |  |  |  |   move.l a0,-(sp)
    3ef2:	         |                       |  |  |  |   movea.w d7,a0
    3ef4:	         |                       |  |  |  |   move.l a0,-(sp)
    3ef6:	         |                       |  |  |  |   movea.w d5,a0
    3ef8:	         |                       |  |  |  |   move.l a0,-(sp)
    3efa:	         |                       |  |  |  |   movea.w d4,a0
    3efc:	         |                       |  |  |  |   move.l a0,-(sp)
    3efe:	         |                       |  |  |  |   movea.w d6,a0
    3f00:	         |                       |  |  |  |   move.l a0,-(sp)
    3f02:	         |                       |  |  |  |   jsr 508e <SmartLineFill>(pc)
    3f06:	         |                       |  |  |  |   lea 28(sp),sp
    3f0a:	         \-----------------------|--|--|--|-- bra.w 3e60 <DrawRectSub2+0xe2>
          bltwidth = length / 16 + 2;
    3f0e:	                                 |  |  |  \-> addi.w #15,d0
    3f12:	                                 |  |  |      asr.w #4,d0
    3f14:	                                 |  |  |      addq.w #2,d0
          bltstart = ((xposmin-1)/16)*2;
    3f16:	                                 |  |  |      move.w a0,d1
    3f18:	                                 |  |  |      subq.w #1,d1
    3f1a:	                                 |  |  |      movea.w d1,a0
    3f1c:	                                 |  |  |      tst.w d1
    3f1e:	                                 |  |  \----- bpl.s 3ede <DrawRectSub2+0x160>
    3f20:	                                 |  \-------> lea 15(a0),a0
    3f24:	                                 |            move.l a0,d1
    3f26:	                                 |            asr.l #4,d1
    3f28:	                                 |            add.w d1,d1
          break;
    3f2a:	                                 |            movea.w #238,a0
    3f2e:	                                 \----------- bra.s 3ee8 <DrawRectSub2+0x16a>

00003f30 <DrawCube3d>:


void DrawCube3d( WORD *vectors, UWORD mirroring, UWORD cubecount)
{
    3f30:	                                                                                                             lea -88(sp),sp
    3f34:	                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    3f38:	                                                                                                             movea.l 136(sp),a3
    3f3c:	                                                                                                             move.l 144(sp),d0
    3f40:	                                                                                                             move.w 142(sp),112(sp)
    3f46:	                                                                                                             move.w d0,106(sp)

  volatile struct Custom *custom = (struct Custom*)0xdff000;  //xs = 256 * x / (z + 256) + xc
  custom->bltcon1 = 0x0;
    3f4a:	                                                                                                             move.w #0,dff042 <_end+0xd67e0e>
  //struct Cube cube[3];
      //vectors += 792*3;  

  UWORD bltsizereverse;
  UWORD bltfmask;
  for(UWORD i=0;i<cubecount;i++) 
    3f52:	                                                                                                             tst.w 106(sp)
    3f56:	      /----------------------------------------------------------------------------------------------------- beq.w 4b12 <DrawCube3d+0xbe2>
    3f5a:	      |                                                                                                      lea 96e12 <Cubes>,a2
    3f60:	      |                                                                                                      andi.l #65535,d0
    3f66:	      |                                                                                                      cmpi.w #1,112(sp)
    3f6c:	   /--|----------------------------------------------------------------------------------------------------- beq.w 4b28 <DrawCube3d+0xbf8>
    3f70:	   |  |                                                                                                      move.l d0,102(sp)
    3f74:	   |  |                                                                                                      moveq #0,d3
    3f76:	   |  |                                                                                                      move.l #8808,108(sp)
    3f7e:	   |  |                                                                                                      lea 49576 <zMult.lto_priv.1>,a6
    3f84:	   |  |                                                                                                      move.l #26420,82(sp)
  {

      
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    3f8c:	   |  |  /-------------------------------------------------------------------------------------------------> move.l d3,d2
    3f8e:	   |  |  |                                                                                                   add.l d3,d2
    3f90:	   |  |  |                                                                                                   add.l d3,d2
    3f92:	   |  |  |                                                                                                   add.l d2,d2
    3f94:	   |  |  |                                                                                                   add.l d2,d2
    3f96:	   |  |  |                                                                                                   movea.l 971da <ClearBuffer>,a0
    3f9c:	   |  |  |                                                                                                   adda.l d2,a0
    3f9e:	   |  |  |                                                                                                   movea.w 14(a0),a0
    3fa2:	   |  |  |                                                                                                   move.l a0,-(sp)
    3fa4:	   |  |  |                                                                                                   movea.l 112(sp),a0
    3fa8:	   |  |  |                                                                                                   jsr (a0)

    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    3faa:	   |  |  |                                                                                                   move.l 971da <ClearBuffer>,94(sp)
    3fb2:	   |  |  |                                                                                                   movea.l 94(sp),a1
    3fb6:	   |  |  |                                                                                                   movea.l (4,a1,d2.l),a4
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3fba:	   |  |  |                                                                                                   addq.l #4,sp
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3fbc:	   |  |  |                                                                                                   addq.l #1,d3
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3fbe:	   |  |  |                                                                                                   cmpa.w #0,a4
    3fc2:	   |  |  |                                                                                               /-- beq.s 3fce <DrawCube3d+0x9e>
    3fc4:	   |  |  |                                                                                               |   tst.w 971ec <DoNotClearDirty>
    3fca:	   |  |  |     /-----------------------------------------------------------------------------------------|-- beq.w 49de <DrawCube3d+0xaae>
    3fce:	   |  |  |     |                                                                                         \-> move.l d3,86(sp)
      clearpos += 64*BPLHEIGHT;
    }
    WORD x0 = vectors[0];
    3fd2:	   |  |  |  /--|-------------------------------------------------------------------------------------------> move.w (a3),d3
    WORD y0 = vectors[1];
    3fd4:	   |  |  |  |  |                                                                                             move.w 2(a3),d4
    WORD z0 = vectors[2];
    3fd8:	   |  |  |  |  |                                                                                             movea.w 4(a3),a0

    WORD x1 = vectors[3];
    WORD y1 = vectors[4];
    WORD z1 = vectors[5];
    
    WORD x2 = vectors[6];
    3fdc:	   |  |  |  |  |                                                                                             move.w 12(a3),d5
    WORD y2 = vectors[7];
    3fe0:	   |  |  |  |  |                                                                                             move.w 14(a3),d6
    WORD z2 = vectors[8];
    3fe4:	   |  |  |  |  |                                                                                             move.w 16(a3),54(sp)

    WORD x3 = vectors[9];
    3fea:	   |  |  |  |  |                                                                                             move.w 18(a3),94(sp)
    WORD y3 = vectors[10];
    3ff0:	   |  |  |  |  |                                                                                             move.w 20(a3),d2
    WORD z3 = vectors[11];
    3ff4:	   |  |  |  |  |                                                                                             move.w 22(a3),118(sp)
    
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3ffa:	   |  |  |  |  |                                                                                             movea.w a0,a1
    3ffc:	   |  |  |  |  |                                                                                             move.l a1,d0
    3ffe:	   |  |  |  |  |                                                                                             subq.l #1,d0
    4000:	   |  |  |  |  |                                                                                             add.l d0,d0
    4002:	   |  |  |  |  |                                                                                             move.w (0,a6,d0.l),d0
    4006:	   |  |  |  |  |                                                                                             move.w d0,d7
    4008:	   |  |  |  |  |                                                                                             muls.w d3,d7
    400a:	   |  |  |  |  |                                                                                             moveq #15,d1
    400c:	   |  |  |  |  |                                                                                             asr.l d1,d7
    400e:	   |  |  |  |  |                                                                                             addi.w #160,d7
    4012:	   |  |  |  |  |                                                                                             move.w d7,80(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    4016:	   |  |  |  |  |                                                                                             muls.w d4,d0
    4018:	   |  |  |  |  |                                                                                             asr.l d1,d0
    401a:	   |  |  |  |  |                                                                                             addi.w #128,d0
    401e:	   |  |  |  |  |                                                                                             move.w d0,76(sp)

    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4022:	   |  |  |  |  |                                                                                             movea.w 10(a3),a1
    4026:	   |  |  |  |  |                                                                                             move.l a1,d0
    4028:	   |  |  |  |  |                                                                                             subq.l #1,d0
    402a:	   |  |  |  |  |                                                                                             add.l d0,d0
    402c:	   |  |  |  |  |                                                                                             move.w (0,a6,d0.l),d0
    4030:	   |  |  |  |  |                                                                                             move.w d0,d7
    4032:	   |  |  |  |  |                                                                                             muls.w 6(a3),d7
    4036:	   |  |  |  |  |                                                                                             asr.l d1,d7
    4038:	   |  |  |  |  |                                                                                             addi.w #160,d7
    403c:	   |  |  |  |  |                                                                                             move.w d7,72(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    4040:	   |  |  |  |  |                                                                                             muls.w 8(a3),d0
    4044:	   |  |  |  |  |                                                                                             asr.l d1,d0
    4046:	   |  |  |  |  |                                                                                             addi.w #128,d0
    404a:	   |  |  |  |  |                                                                                             move.w d0,68(sp)

    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    404e:	   |  |  |  |  |                                                                                             movea.w 54(sp),a1
    4052:	   |  |  |  |  |                                                                                             move.l a1,d0
    4054:	   |  |  |  |  |                                                                                             subq.l #1,d0
    4056:	   |  |  |  |  |                                                                                             add.l d0,d0
    4058:	   |  |  |  |  |                                                                                             move.w (0,a6,d0.l),d0
    405c:	   |  |  |  |  |                                                                                             move.w d0,d7
    405e:	   |  |  |  |  |                                                                                             muls.w d5,d7
    4060:	   |  |  |  |  |                                                                                             asr.l d1,d7
    4062:	   |  |  |  |  |                                                                                             addi.w #160,d7
    4066:	   |  |  |  |  |                                                                                             move.w d7,66(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    406a:	   |  |  |  |  |                                                                                             muls.w d6,d0
    406c:	   |  |  |  |  |                                                                                             asr.l d1,d0
    406e:	   |  |  |  |  |                                                                                             addi.w #128,d0
    4072:	   |  |  |  |  |                                                                                             move.w d0,64(sp)

    if( clearpos != 0 && DoNotClearDirty == 0) {
    4076:	   |  |  |  |  |                                                                                             cmpa.w #0,a4
    407a:	   |  |  |  |  |  /----------------------------------------------------------------------------------------- beq.s 4086 <DrawCube3d+0x156>
    407c:	   |  |  |  |  |  |                                                                                          tst.w 971ec <DoNotClearDirty>
    4082:	   |  |  |  |  |  |  /-------------------------------------------------------------------------------------- beq.w 4a0e <DrawCube3d+0xade>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4086:	   |  |  |  |  |  >--|-------------------------------------------------------------------------------------> move.w 118(sp),d0
    408a:	   |  |  |  |  |  |  |                                                                                       ext.l d0
    408c:	   |  |  |  |  |  |  |                                                                                       subq.l #1,d0
    408e:	   |  |  |  |  |  |  |                                                                                       add.l d0,d0
    4090:	   |  |  |  |  |  |  |                                                                                       move.w (0,a6,d0.l),d0
    4094:	   |  |  |  |  |  |  |                                                                                       move.w 94(sp),d7
    4098:	   |  |  |  |  |  |  |                                                                                       muls.w d0,d7
    409a:	   |  |  |  |  |  |  |                                                                                       moveq #15,d1
    409c:	   |  |  |  |  |  |  |                                                                                       asr.l d1,d7
    409e:	   |  |  |  |  |  |  |                                                                                       addi.w #160,d7
    40a2:	   |  |  |  |  |  |  |                                                                                       move.w d7,62(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    40a6:	   |  |  |  |  |  |  |                                                                                       muls.w d2,d0
    40a8:	   |  |  |  |  |  |  |                                                                                       asr.l d1,d0
    40aa:	   |  |  |  |  |  |  |                                                                                       addi.w #128,d0
    40ae:	   |  |  |  |  |  |  |                                                                                       move.w d0,58(sp)
    struct Square *squares = cube->Squares;
    //Left Face
    WORD vfx2 = x0 - x2;
    WORD vfy2 = y0 - y2;
    WORD vfz2 = z0 - z2; 
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    40b2:	   |  |  |  |  |  |  |                                                                                       move.l a1,d7
    40b4:	   |  |  |  |  |  |  |                                                                                       addi.l #386,d7
    WORD vfy2 = y0 - y2;
    40ba:	   |  |  |  |  |  |  |                                                                                       sub.w d6,d4
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    40bc:	   |  |  |  |  |  |  |                                                                                       muls.w d6,d4
    WORD vfx2 = x0 - x2;
    40be:	   |  |  |  |  |  |  |                                                                                       sub.w d5,d3
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    40c0:	   |  |  |  |  |  |  |                                                                                       muls.w d5,d3
    40c2:	   |  |  |  |  |  |  |                                                                                       add.l d4,d3
    WORD vfz2 = z0 - z2; 
    40c4:	   |  |  |  |  |  |  |                                                                                       suba.w 54(sp),a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    40c8:	   |  |  |  |  |  |  |                                                                                       move.l d7,-(sp)
    40ca:	   |  |  |  |  |  |  |                                                                                       movea.w a0,a0
    40cc:	   |  |  |  |  |  |  |                                                                                       move.l a0,-(sp)
    40ce:	   |  |  |  |  |  |  |                                                                                       movea.l 90(sp),a0
    40d2:	   |  |  |  |  |  |  |                                                                                       jsr (a0)
    40d4:	   |  |  |  |  |  |  |                                                                                       addq.l #8,sp
    40d6:	   |  |  |  |  |  |  |                                                                                       add.l d0,d3
    40d8:	   |  |  |  |  |  |  |                                                                                       move.l d3,114(sp)
    //Right Face
    WORD vfx3 = x2 - x0;
    WORD vfy3 = y2 - y0;
    WORD vfz3 = z2 - z0; 
    //int vf3dotprod = vfx3 * x0 + vfy3 * y0 + vfz3 * (z0 + DIST);
    int vf3dotprod = vf2dotprod * -1;
    40dc:	   |  |  |  |  |  |  |                                                                                       neg.l d3
    40de:	   |  |  |  |  |  |  |                                                                                       move.l d3,98(sp)

    squares[3].DotProduct = vf3dotprod;

    if( clearpos != 0 && DoNotClearDirty == 0) {
    40e2:	   |  |  |  |  |  |  |                                                                                       cmpa.w #0,a4
    40e6:	   |  |  |  |  |  |  |                                                                                   /-- beq.s 40f2 <DrawCube3d+0x1c2>
    40e8:	   |  |  |  |  |  |  |                                                                                   |   tst.w 971ec <DoNotClearDirty>
    40ee:	   |  |  |  |  |  |  |        /--------------------------------------------------------------------------|-- beq.w 477c <DrawCube3d+0x84c>

    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    

    //Top Face
    WORD vfx4 = x3 - x2;
    WORD vfy4 = y3 - y2;
    40f2:	   |  |  |  |  |  |  |        |                                                                          \-> sub.w d6,d2
    WORD vfz4 = z3 - z2;
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    40f4:	   |  |  |  |  |  |  |        |                                                                              muls.w d6,d2
    WORD vfx4 = x3 - x2;
    40f6:	   |  |  |  |  |  |  |        |                                                                              move.w 94(sp),d0
    40fa:	   |  |  |  |  |  |  |        |                                                                              sub.w d5,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    40fc:	   |  |  |  |  |  |  |        |                                                                              muls.w d5,d0
    40fe:	   |  |  |  |  |  |  |        |                                                                              add.l d0,d2
    WORD vfz4 = z3 - z2;
    4100:	   |  |  |  |  |  |  |        |                                                                              move.w 118(sp),d1
    4104:	   |  |  |  |  |  |  |        |                                                                              sub.w 54(sp),d1
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    4108:	   |  |  |  |  |  |  |        |                                                                              move.l d7,-(sp)
    410a:	   |  |  |  |  |  |  |        |                                                                              movea.w d1,a5
    410c:	   |  |  |  |  |  |  |        |                                                                              move.l a5,-(sp)
    410e:	   |  |  |  |  |  |  |        |                                                                              movea.l 90(sp),a0
    4112:	   |  |  |  |  |  |  |        |                                                                              jsr (a0)
    4114:	   |  |  |  |  |  |  |        |                                                                              addq.l #8,sp
    4116:	   |  |  |  |  |  |  |        |                                                                              movea.l d2,a5
    4118:	   |  |  |  |  |  |  |        |                                                                              adda.l d0,a5
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }

    squares[0].Vertices[0].X = xs2;
    411a:	   |  |  |  |  |  |  |        |                                                                              move.w 66(sp),(a2)
    squares[0].Vertices[0].Y = ys2;
    411e:	   |  |  |  |  |  |  |        |                                                                              move.w 64(sp),2(a2)
    squares[0].Vertices[1].X = xs0;
    4124:	   |  |  |  |  |  |  |        |                                                                              move.w 80(sp),4(a2)
    squares[0].Vertices[1].Y = ys0;
    412a:	   |  |  |  |  |  |  |        |                                                                              move.w 76(sp),6(a2)
    squares[0].Vertices[2].X = xs1;
    4130:	   |  |  |  |  |  |  |        |                                                                              move.w 72(sp),8(a2)
    squares[0].Vertices[2].Y = ys1;
    4136:	   |  |  |  |  |  |  |        |                                                                              move.w 68(sp),10(a2)
    squares[0].Vertices[3].X = xs3;
    413c:	   |  |  |  |  |  |  |        |                                                                              move.w 62(sp),12(a2)
    squares[0].Vertices[3].Y = ys3;
    4142:	   |  |  |  |  |  |  |        |                                                                              move.w 58(sp),14(a2)

    WORD x5 = vectors[15];
    WORD y5 = vectors[16];
    WORD z5 = vectors[17];

    WORD x6 = vectors[18];
    4148:	   |  |  |  |  |  |  |        |                                                                              move.w 36(a3),d4
    WORD y6 = vectors[19];
    414c:	   |  |  |  |  |  |  |        |                                                                              move.w 38(a3),d2
    WORD z6 = vectors[20];
    4150:	   |  |  |  |  |  |  |        |                                                                              movea.w 40(a3),a4
    WORD x7 = vectors[21];
    WORD y7 = vectors[22];
    WORD z7 = vectors[23];

    WORD vfx0 = x6 - x2;
    WORD vfy0 = y6 - y2;
    4154:	   |  |  |  |  |  |  |        |                                                                              move.w d2,d1
    4156:	   |  |  |  |  |  |  |        |                                                                              sub.w d6,d1
    WORD vfz0 = z6 - z2; 
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4158:	   |  |  |  |  |  |  |        |                                                                              muls.w d6,d1
    WORD vfx0 = x6 - x2;
    415a:	   |  |  |  |  |  |  |        |                                                                              move.w d4,d0
    415c:	   |  |  |  |  |  |  |        |                                                                              sub.w d5,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    415e:	   |  |  |  |  |  |  |        |                                                                              muls.w d0,d5
    4160:	   |  |  |  |  |  |  |        |                                                                              add.l d1,d5
    WORD vfz0 = z6 - z2; 
    4162:	   |  |  |  |  |  |  |        |                                                                              move.w a4,d0
    4164:	   |  |  |  |  |  |  |        |                                                                              sub.w 54(sp),d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4168:	   |  |  |  |  |  |  |        |                                                                              move.l d7,-(sp)
    416a:	   |  |  |  |  |  |  |        |                                                                              movea.w d0,a1
    416c:	   |  |  |  |  |  |  |        |                                                                              move.l a1,-(sp)
    416e:	   |  |  |  |  |  |  |        |                                                                              movea.l 90(sp),a0
    4172:	   |  |  |  |  |  |  |        |                                                                              jsr (a0)
    4174:	   |  |  |  |  |  |  |        |                                                                              addq.l #8,sp
    4176:	   |  |  |  |  |  |  |        |                                                                              add.l d5,d0
    4178:	   |  |  |  |  |  |  |        |                                                                              move.l d0,54(sp)
    WORD vfy1 = y2 - y6;
    WORD vfz1 = z2 - z6; 
    //int vf1dotprod = vfx1 * x6 + vfy1 * y6 + vfz1 * (z6 + DIST);
    int vf1dotprod = vf0dotprod*-1;

    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    417c:	   |  |  |  |  |  |  |        |                                                                              movea.w 28(a3),a0
    4180:	   |  |  |  |  |  |  |        |                                                                              move.l a0,d1
    4182:	   |  |  |  |  |  |  |        |                                                                              subq.l #1,d1
    4184:	   |  |  |  |  |  |  |        |                                                                              add.l d1,d1
    4186:	   |  |  |  |  |  |  |        |                                                                              move.w (0,a6,d1.l),d1
    418a:	   |  |  |  |  |  |  |        |                                                                              move.w d1,d6
    418c:	   |  |  |  |  |  |  |        |                                                                              muls.w 24(a3),d6
    4190:	   |  |  |  |  |  |  |        |                                                                              moveq #15,d0
    4192:	   |  |  |  |  |  |  |        |                                                                              asr.l d0,d6
    4194:	   |  |  |  |  |  |  |        |                                                                              addi.w #160,d6
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    4198:	   |  |  |  |  |  |  |        |                                                                              muls.w 26(a3),d1
    419c:	   |  |  |  |  |  |  |        |                                                                              asr.l d0,d1
    419e:	   |  |  |  |  |  |  |        |                                                                              movea.w d1,a1
    41a0:	   |  |  |  |  |  |  |        |                                                                              lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    41a4:	   |  |  |  |  |  |  |        |                                                                              movea.w 34(a3),a0
    41a8:	   |  |  |  |  |  |  |        |                                                                              move.l a0,d1
    41aa:	   |  |  |  |  |  |  |        |                                                                              subq.l #1,d1
    41ac:	   |  |  |  |  |  |  |        |                                                                              add.l d1,d1
    41ae:	   |  |  |  |  |  |  |        |                                                                              move.w (0,a6,d1.l),d1
    41b2:	   |  |  |  |  |  |  |        |                                                                              move.w d1,d5
    41b4:	   |  |  |  |  |  |  |        |                                                                              muls.w 30(a3),d5
    41b8:	   |  |  |  |  |  |  |        |                                                                              asr.l d0,d5
    41ba:	   |  |  |  |  |  |  |        |                                                                              addi.w #160,d5
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    41be:	   |  |  |  |  |  |  |        |                                                                              muls.w 32(a3),d1
    41c2:	   |  |  |  |  |  |  |        |                                                                              asr.l d0,d1
    41c4:	   |  |  |  |  |  |  |        |                                                                              addi.w #128,d1

    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    41c8:	   |  |  |  |  |  |  |        |                                                                              movea.w a4,a4
    41ca:	   |  |  |  |  |  |  |        |                                                                              subq.l #1,a4
    41cc:	   |  |  |  |  |  |  |        |                                                                              adda.l a4,a4
    41ce:	   |  |  |  |  |  |  |        |                                                                              move.w (0,a6,a4.l),d7
    41d2:	   |  |  |  |  |  |  |        |                                                                              move.w d4,d0
    41d4:	   |  |  |  |  |  |  |        |                                                                              muls.w d7,d0
    41d6:	   |  |  |  |  |  |  |        |                                                                              moveq #15,d3
    41d8:	   |  |  |  |  |  |  |        |                                                                              asr.l d3,d0
    41da:	   |  |  |  |  |  |  |        |                                                                              move.w d0,d4
    41dc:	   |  |  |  |  |  |  |        |                                                                              addi.w #160,d4
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    41e0:	   |  |  |  |  |  |  |        |                                                                              muls.w d7,d2
    41e2:	   |  |  |  |  |  |  |        |                                                                              asr.l d3,d2
    41e4:	   |  |  |  |  |  |  |        |                                                                              addi.w #128,d2
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    41e8:	   |  |  |  |  |  |  |        |                                                                              movea.w 46(a3),a0
    41ec:	   |  |  |  |  |  |  |        |                                                                              subq.l #1,a0
    41ee:	   |  |  |  |  |  |  |        |                                                                              adda.l a0,a0
    41f0:	   |  |  |  |  |  |  |        |                                                                              movea.w (0,a6,a0.l),a0
    41f4:	   |  |  |  |  |  |  |        |                                                                              move.w a0,d0
    41f6:	   |  |  |  |  |  |  |        |                                                                              muls.w 42(a3),d0
    41fa:	   |  |  |  |  |  |  |        |                                                                              asr.l d3,d0
    41fc:	   |  |  |  |  |  |  |        |                                                                              move.w d0,d7
    41fe:	   |  |  |  |  |  |  |        |                                                                              addi.w #160,d7
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    4202:	   |  |  |  |  |  |  |        |                                                                              move.w a0,d0
    4204:	   |  |  |  |  |  |  |        |                                                                              muls.w 44(a3),d0
    4208:	   |  |  |  |  |  |  |        |                                                                              asr.l d3,d0
    420a:	   |  |  |  |  |  |  |        |                                                                              movea.l d0,a0
    420c:	   |  |  |  |  |  |  |        |                                                                              lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
      clearpos += 64*BPLHEIGHT;
    }
        
    squares[0].DotProduct = vf0dotprod;
    4210:	   |  |  |  |  |  |  |        |                                                                              move.l 54(sp),16(a2)
    squares[0].Color = 1;
    4216:	   |  |  |  |  |  |  |        |                                                                              move.w #1,30(a2)

    squares[1].Vertices[0].X = xs6;
    421c:	   |  |  |  |  |  |  |        |                                                                              move.w d4,32(a2)
    squares[1].Vertices[0].Y = ys6;
    4220:	   |  |  |  |  |  |  |        |                                                                              move.w d2,34(a2)
    squares[1].Vertices[1].X = xs7;
    4224:	   |  |  |  |  |  |  |        |                                                                              move.w d7,36(a2)
    squares[1].Vertices[1].Y = ys7;
    4228:	   |  |  |  |  |  |  |        |                                                                              move.w a0,38(a2)
    squares[1].Vertices[2].X = xs5;
    422c:	   |  |  |  |  |  |  |        |                                                                              move.w d5,40(a2)
    squares[1].Vertices[2].Y = ys5;
    4230:	   |  |  |  |  |  |  |        |                                                                              move.w d1,42(a2)
    squares[1].Vertices[3].X = xs4;
    4234:	   |  |  |  |  |  |  |        |                                                                              move.w d6,44(a2)
    squares[1].Vertices[3].Y = ys4;
    4238:	   |  |  |  |  |  |  |        |                                                                              move.w a1,46(a2)
    int vf1dotprod = vf0dotprod*-1;
    423c:	   |  |  |  |  |  |  |        |                                                                              move.l 54(sp),d3
    4240:	   |  |  |  |  |  |  |        |                                                                              neg.l d3
    4242:	   |  |  |  |  |  |  |        |                                                                              move.l d3,48(a2)
    squares[1].DotProduct = vf1dotprod;
    squares[1].Color = 1;
    4246:	   |  |  |  |  |  |  |        |                                                                              move.w #1,62(a2)

    squares[2].Vertices[0].X = xs2;
    424c:	   |  |  |  |  |  |  |        |                                                                              move.w 66(sp),64(a2)
    squares[2].Vertices[0].Y = ys2;
    4252:	   |  |  |  |  |  |  |        |                                                                              move.w 64(sp),66(a2)
    squares[2].Vertices[1].X = xs3;
    4258:	   |  |  |  |  |  |  |        |                                                                              move.w 62(sp),68(a2)
    squares[2].Vertices[1].Y = ys3;
    425e:	   |  |  |  |  |  |  |        |                                                                              move.w 58(sp),70(a2)
    squares[2].Vertices[2].X = xs7;
    4264:	   |  |  |  |  |  |  |        |                                                                              move.w d7,72(a2)
    squares[2].Vertices[2].Y = ys7;
    4268:	   |  |  |  |  |  |  |        |                                                                              move.w a0,74(a2)
    squares[2].Vertices[3].X = xs6;
    426c:	   |  |  |  |  |  |  |        |                                                                              move.w d4,76(a2)
    squares[2].Vertices[3].Y = ys6;
    4270:	   |  |  |  |  |  |  |        |                                                                              move.w d2,78(a2)
    squares[2].DotProduct = vf2dotprod;
    4274:	   |  |  |  |  |  |  |        |                                                                              move.l 114(sp),80(a2)
    squares[2].Color = 2;
    427a:	   |  |  |  |  |  |  |        |                                                                              move.w #2,94(a2)

    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    }

    squares[3].Vertices[0].X = xs0;
    4280:	   |  |  |  |  |  |  |        |                                                                              move.w 80(sp),96(a2)
    squares[3].Vertices[0].Y = ys0;
    4286:	   |  |  |  |  |  |  |        |                                                                              move.w 76(sp),98(a2)
    squares[3].Vertices[1].X = xs4;
    428c:	   |  |  |  |  |  |  |        |                                                                              move.w d6,100(a2)
    squares[3].Vertices[1].Y = ys4;
    4290:	   |  |  |  |  |  |  |        |                                                                              move.w a1,102(a2)
    squares[3].Vertices[2].X = xs5;
    4294:	   |  |  |  |  |  |  |        |                                                                              move.w d5,104(a2)
    squares[3].Vertices[2].Y = ys5;
    4298:	   |  |  |  |  |  |  |        |                                                                              move.w d1,106(a2)
    squares[3].Vertices[3].X = xs1;
    429c:	   |  |  |  |  |  |  |        |                                                                              move.w 72(sp),108(a2)
    squares[3].Vertices[3].Y = ys1;
    42a2:	   |  |  |  |  |  |  |        |                                                                              move.w 68(sp),110(a2)
    squares[3].DotProduct = vf3dotprod;
    42a8:	   |  |  |  |  |  |  |        |                                                                              move.l 98(sp),112(a2)
    squares[3].Color = 2;
    42ae:	   |  |  |  |  |  |  |        |                                                                              move.w #2,126(a2)

    squares[4].Vertices[0].X = xs6;
    42b4:	   |  |  |  |  |  |  |        |                                                                              move.w d4,128(a2)
    squares[4].Vertices[0].Y = ys6;
    42b8:	   |  |  |  |  |  |  |        |                                                                              move.w d2,130(a2)
    squares[4].Vertices[1].X = xs4;
    42bc:	   |  |  |  |  |  |  |        |                                                                              move.w d6,132(a2)
    squares[4].Vertices[1].Y = ys4;
    42c0:	   |  |  |  |  |  |  |        |                                                                              move.w a1,134(a2)
    squares[4].Vertices[2].X = xs0;
    42c4:	   |  |  |  |  |  |  |        |                                                                              move.w 80(sp),136(a2)
    squares[4].Vertices[2].Y = ys0;
    42ca:	   |  |  |  |  |  |  |        |                                                                              move.w 76(sp),138(a2)
    squares[4].Vertices[3].X = xs2;
    42d0:	   |  |  |  |  |  |  |        |                                                                              move.w 66(sp),140(a2)
    squares[4].Vertices[3].Y = ys2;
    42d6:	   |  |  |  |  |  |  |        |                                                                              move.w 64(sp),142(a2)
    squares[4].DotProduct = vf4dotprod;
    42dc:	   |  |  |  |  |  |  |        |                                                                              move.l a5,144(a2)
    squares[4].Color = 3;
    42e0:	   |  |  |  |  |  |  |        |                                                                              move.w #3,158(a2)

    squares[5].Vertices[0].X = xs7;
    42e6:	   |  |  |  |  |  |  |        |                                                                              move.w d7,160(a2)
    squares[5].Vertices[0].Y = ys7;
    42ea:	   |  |  |  |  |  |  |        |                                                                              move.w a0,162(a2)
    squares[5].Vertices[1].X = xs3;
    42ee:	   |  |  |  |  |  |  |        |                                                                              move.w 62(sp),164(a2)
    squares[5].Vertices[1].Y = ys3;
    42f4:	   |  |  |  |  |  |  |        |                                                                              move.w 58(sp),166(a2)
    squares[5].Vertices[2].X = xs1;
    42fa:	   |  |  |  |  |  |  |        |                                                                              move.w 72(sp),168(a2)
    squares[5].Vertices[2].Y = ys1;
    4300:	   |  |  |  |  |  |  |        |                                                                              move.w 68(sp),170(a2)
    squares[5].Vertices[3].X = xs5;
    4306:	   |  |  |  |  |  |  |        |                                                                              move.w d5,172(a2)
    squares[5].Vertices[3].Y = ys5;
    430a:	   |  |  |  |  |  |  |        |                                                                              move.w d1,174(a2)
    int vf5dotprod = vf4dotprod * -1;
    430e:	   |  |  |  |  |  |  |        |                                                                              move.l a5,d4
    4310:	   |  |  |  |  |  |  |        |                                                                              neg.l d4
    4312:	   |  |  |  |  |  |  |        |                                                                              move.l d4,176(a2)
    squares[5].DotProduct = vf5dotprod;      
    squares[5].Color = 3; 
    4316:	   |  |  |  |  |  |  |        |                                                                              move.w #3,190(a2)

    vectors += 8*3;  
    431c:	   |  |  |  |  |  |  |        |                                                                              lea 48(a3),a3
  for(UWORD i=0;i<cubecount;i++) 
    4320:	   |  |  |  |  |  |  |        |                                                                              move.l 86(sp),d3
    4324:	   |  |  |  |  |  |  |        |                                                                              lea 192(a2),a2
    4328:	   |  |  |  |  |  |  |        |                                                                              cmp.l 102(sp),d3
    432c:	   |  |  +--|--|--|--|--------|----------------------------------------------------------------------------- bne.w 3f8c <DrawCube3d+0x5c>
    4330:	/--|--|--|--|--|--|--|--------|----------------------------------------------------------------------------> lea 96ed2 <Cubes+0xc0>,a6
    4336:	|  |  |  |  |  |  |  |        |                                                                              clr.l 82(sp)
  }

  WORD minytotal = 256;
  WORD maxytotal = 0;

  for(UWORD i3=0;i3<cubecount;i3++) 
    433a:	|  |  |  |  |  |  |  |        |                                                                              clr.w 86(sp)
  WORD maxytotal = 0;
    433e:	|  |  |  |  |  |  |  |        |                                                                              clr.w 90(sp)
  WORD minytotal = 256;
    4342:	|  |  |  |  |  |  |  |        |                                                                              move.w #256,98(sp)
  {
    cube = (struct Cube *) &Cubes[i3];
    struct Square *squares = cube->Squares;
    4348:	|  |  |  |  |  |  |  |        |        /-------------------------------------------------------------------> lea -192(a6),a0
    434c:	|  |  |  |  |  |  |  |        |        |                                                                     move.l a0,94(sp)
    WORD minycube = 256;
    WORD minxcube = 320;
    WORD maxlengthcube = 0;
    WORD maxheightcube = 0;
    WORD maxycube = 0;
    WORD maxxcube = 0;
    4350:	|  |  |  |  |  |  |  |        |        |                                                                     clr.w 80(sp)
    WORD maxycube = 0;
    4354:	|  |  |  |  |  |  |  |        |        |                                                                     clr.w 64(sp)
    WORD maxheightcube = 0;
    4358:	|  |  |  |  |  |  |  |        |        |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    435a:	|  |  |  |  |  |  |  |        |        |                                                                     clr.w d0
    WORD minxcube = 320;
    435c:	|  |  |  |  |  |  |  |        |        |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    4362:	|  |  |  |  |  |  |  |        |        |                                                                     move.w #256,d6
    for(int i=0; i <= 5; i++)
    {
      if( squares[i].DotProduct > 0) {
    4366:	|  |  |  |  |  |  |  |        |        |                                   /-------------------------------> tst.l 16(a0)
    436a:	|  |  |  |  |  |  |  |        |        |                                   |                          /----- bgt.w 44be <DrawCube3d+0x58e>
    for(int i=0; i <= 5; i++)
    436e:	|  |  |  |  |  |  |  |        |        |                                   |                          |      lea 32(a0),a0
    4372:	|  |  |  |  |  |  |  |        |        |                                   |                          |      cmpa.l a0,a6
    4374:	|  |  |  |  |  |  |  |        |        |                                   +--------------------------|----- bne.s 4366 <DrawCube3d+0x436>

        maxlengthcube = maxxcube - minxcube + 1;
        maxheightcube = maxycube - minycube + 1;
      }
    }
    if(i3 == *CubeNrReversePtr) {
    4376:	|  |  |  |  |  |  |  |        |        |                                   |           /--------------|----> movea.l 97112 <CubeNrReversePtr>,a0
    437c:	|  |  |  |  |  |  |  |        |        |                                   |           |              |      move.w 86(sp),d2
    4380:	|  |  |  |  |  |  |  |        |        |                                   |           |              |      cmp.w (a0),d2
    4382:	|  |  |  |  |  |  |  |        |        |                 /-----------------|-----------|--------------|----- beq.w 46a2 <DrawCube3d+0x772>

    if(minycube < minytotal) minytotal = minycube;
    if(maxycube > maxytotal) maxytotal = maxycube;


    WORD bltwidth = (maxlengthcube/16)+2;
    4386:	|  |  |  |  |  |  |  |        |        |                 |                 |           |              |      tst.w d0
    4388:	|  |  |  |  |  |  |  |        |        |  /--------------|-----------------|-----------|--------------|----- blt.w 4612 <DrawCube3d+0x6e2>
    438c:	|  |  |  |  |  |  |  |        |        |  |  /-----------|-----------------|-----------|--------------|----> asr.w #4,d0
    438e:	|  |  |  |  |  |  |  |        |        |  |  |           |                 |           |              |      addq.w #2,d0
    if(minycube < 0) {      
    4390:	|  |  |  |  |  |  |  |        |        |  |  |           |                 |           |              |      tst.w d6
    4392:	|  |  |  |  |  |  |  |        |        |  |  |           |                 |           |        /-----|----- blt.w 4620 <DrawCube3d+0x6f0>
    }else if(minycube > 256) {
    4396:	|  |  |  |  |  |  |  |        |        |  |  |           |                 |           |        |  /--|----> cmpi.w #256,d6
    439a:	|  |  |  |  |  |  |  |  /-----|--------|--|--|-----------|-----------------|-----------|--------|--|--|----- ble.w 4a98 <DrawCube3d+0xb68>
    if(maxycube > maxytotal) maxytotal = maxycube;
    439e:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |      cmpi.w #255,90(sp)
    43a4:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |  /-- bgt.s 43ac <DrawCube3d+0x47c>
    43a6:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |  |   move.w #256,90(sp)
    43ac:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |  \-> move.w #128,d3
    43b0:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |      movea.w d0,a3
    43b2:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |           |        |  |  |      movea.l 971d2 <DrawBuffer>,a2
    if(maxheightcube > 1) {
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    } else {
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    43b8:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     /-----|--------|--|--|----> movea.l 82(sp),a0
    43bc:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      adda.l a0,a0
    43be:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      move.l 82(sp),d1
    43c2:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      add.l a0,d1
    43c4:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      add.l d1,d1
    43c6:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      add.l d1,d1
    43c8:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      lea (0,a2,d1.l),a1
    43cc:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    43d0:	|  |  |  |  |  |  |  |  |     |        |  |  |           |                 |     |     |        |  |  |      clr.l 8(a1)
    }
   
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    43d4:	|  |  |  |  |  |  |  |  |  /--|--------|--|--|-----------|-----------------|-----|-----|--------|--|--|----> move.l 82(sp),d2
    43d8:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      addq.l #1,d2
    43da:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      move.l d2,d1
    43dc:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.l d2,d1
    43de:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.l d2,d1
    43e0:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.l d1,d1
    43e2:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.l d1,d1
    43e4:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.w d0,d3
    43e6:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    43ea:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      adda.l 82(sp),a0
    43ee:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      adda.l a0,a0
    43f0:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      adda.l a0,a0
    43f2:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      moveq #32,d0
    43f4:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      sub.l a3,d0
    43f6:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      add.w d0,d0
    43f8:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      move.w d0,(14,a2,a0.l)

    for(UWORD i=0; i<=5; i++) {
      if( squares[i].DotProduct > 0) { 
    43fc:	|  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |     |        |  |  |      tst.l -176(a6)
    4400:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  /--------|-----------------|-----|-----|--------|--|--|----- ble.s 4412 <DrawCube3d+0x4e2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    4402:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |        |                 |     |     |        |  |  |      tst.w -166(a6)
    4406:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  +--------|-----------------|-----|-----|--------|--|--|----- ble.s 4412 <DrawCube3d+0x4e2>
    4408:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |        |                 |     |     |        |  |  |      cmpi.w #1,-164(a6)
    440e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |     /--|-----------------|-----|-----|--------|--|--|----- bgt.w 4732 <DrawCube3d+0x802>
      if( squares[i].DotProduct > 0) { 
    4412:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  >-----|--|-----------------|-----|-----|--------|--|--|----> tst.l -144(a6)
    4416:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /--|--|-----------------|-----|-----|--------|--|--|----- ble.s 4428 <DrawCube3d+0x4f8>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    4418:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |                 |     |     |        |  |  |      tst.w -134(a6)
    441c:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +--|--|-----------------|-----|-----|--------|--|--|----- ble.s 4428 <DrawCube3d+0x4f8>
    441e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |                 |     |     |        |  |  |      cmpi.w #1,-132(a6)
    4424:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  /--------------|-----|-----|--------|--|--|----- bgt.w 4740 <DrawCube3d+0x810>
      if( squares[i].DotProduct > 0) { 
    4428:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  >--|--|--|--------------|-----|-----|--------|--|--|----> tst.l -112(a6)
    442c:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  /-----------|-----|-----|--------|--|--|----- ble.s 443e <DrawCube3d+0x50e>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    442e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |           |     |     |        |  |  |      tst.w -102(a6)
    4432:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  +-----------|-----|-----|--------|--|--|----- ble.s 443e <DrawCube3d+0x50e>
    4434:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |           |     |     |        |  |  |      cmpi.w #1,-100(a6)
    443a:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |        /--|-----|-----|--------|--|--|----- bgt.w 46e2 <DrawCube3d+0x7b2>
      if( squares[i].DotProduct > 0) { 
    443e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  >--------|--|-----|-----|--------|--|--|----> tst.l -80(a6)
    4442:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  /-----|--|-----|-----|--------|--|--|----- ble.s 4454 <DrawCube3d+0x524>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    4444:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |     |  |     |     |        |  |  |      tst.w -70(a6)
    4448:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  +-----|--|-----|-----|--------|--|--|----- ble.s 4454 <DrawCube3d+0x524>
    444a:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |     |  |     |     |        |  |  |      cmpi.w #1,-68(a6)
    4450:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |     |  |  /--|-----|--------|--|--|----- bgt.w 46f0 <DrawCube3d+0x7c0>
      if( squares[i].DotProduct > 0) { 
    4454:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----|--------|--|--|----> tst.l -48(a6)
    4458:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----|--------|--|--|----- ble.s 446a <DrawCube3d+0x53a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    445a:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |        |  |  |      tst.w -38(a6)
    445e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----|--------|--|--|----- ble.s 446a <DrawCube3d+0x53a>
    4460:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |        |  |  |      cmpi.w #1,-36(a6)
    4466:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------|--|--|----- bgt.w 46fe <DrawCube3d+0x7ce>
      if( squares[i].DotProduct > 0) { 
    446a:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--------|--|--|----> tst.l -16(a6)
    446e:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  /-- ble.s 4480 <DrawCube3d+0x550>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    4470:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |   tst.w -6(a6)
    4474:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  +-- ble.s 4480 <DrawCube3d+0x550>
    4476:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |   cmpi.w #1,-4(a6)
    447c:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|-- bgt.w 470c <DrawCube3d+0x7dc>
  for(UWORD i3=0;i3<cubecount;i3++) 
    4480:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  \-> addq.w #1,86(sp)
    4484:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |      move.l d2,82(sp)
    4488:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |      lea 192(a6),a6
    448c:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |      move.w 86(sp),d7
    4490:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |      cmp.w 106(sp),d7
    4494:	|  |  |  |  |  |  |  |  |  |  |        +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|----- bne.w 4348 <DrawCube3d+0x418>
        }
      }    
    }
  }
 
  if( mirroring == 1) {
    4498:	|  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|----> cmpi.w #1,112(sp)
    449e:	|  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 4ab6 <DrawCube3d+0xb86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
  }
  
  DrawBuffer->minytotal = minytotal;
    44a2:	|  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l 971d2 <DrawBuffer>,a0
    44a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),54(a0)
  DrawBuffer->maxytotal = maxytotal;
    44ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 90(sp),52(a0)


}
    44b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    44b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 88(sp),sp
    44bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    44be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a0),d0
    44c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a1
    44c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a1,68(sp)
    44c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a0),d4
    44ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a2
    44cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a0),d2
    44d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a5
    44d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a0),54(sp)
    44d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    44dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a0),d3
    44e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a3
    44e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a3,72(sp)
    44e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a0),58(sp)
    44ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 58(sp),a1
    44f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a1,102(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    44f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a0),62(sp)
    44fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 62(sp),a1
    44fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 14(a0),d7
    4502:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
    4504:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a3,76(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    4508:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 68(sp),d1
    450c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a2,d1
    450e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a5,d5
    4510:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a4,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    4512:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    4514:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a3
    4516:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    451a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 68(sp),d1
    451e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 102(sp),a5
    4522:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a5,d5
    4524:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    4526:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a3
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    4528:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a1,a2
    452a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 76(sp),a4
    452e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d5
    4530:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d1
    4532:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    4534:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a3,a2
    4536:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a2
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    4538:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 72(sp),a1
    453c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 102(sp),a3
    4540:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 76(sp),a3
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    4544:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    4546:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    4548:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    454a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a2
    454c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,20(a0)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    4550:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    4552:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    4554:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 4558 <DrawCube3d+0x628>
    4556:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    4558:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    455a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 455e <DrawCube3d+0x62e>
    455c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    455e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 62(sp),d1
    4562:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 4568 <DrawCube3d+0x638>
    4564:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w 62(sp),d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    4568:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w d2,a1
    456a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w 54(sp),d2
    456e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 4574 <DrawCube3d+0x644>
    4570:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w 54(sp),a1
    4574:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 58(sp),d5
    4578:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d5
    457a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 457e <DrawCube3d+0x64e>
    457c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d5,a1
    457e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d7
    4580:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 4584 <DrawCube3d+0x654>
    4582:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    4584:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    4586:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 458a <DrawCube3d+0x65a>
    4588:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    458a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    458c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 4590 <DrawCube3d+0x660>
    458e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    4590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 62(sp),d0
    4594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 459a <DrawCube3d+0x66a>
    4596:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w 62(sp),d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    459a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 54(sp),d2
    459e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 45a4 <DrawCube3d+0x674>
    45a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w 54(sp),d2
    45a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 58(sp),d2
    45a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 45ae <DrawCube3d+0x67e>
    45aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w 58(sp),d2
    45ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d2,d7
    45b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 45b4 <DrawCube3d+0x684>
    45b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d7,d2
        squares[i].YPosMin = yposmin;
    45b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a1,24(a0)
        squares[i].XPosMin = xposmin;
    45b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a0)
        squares[i].XLength = xposmax - xposmin;                
    45bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    45be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    45c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a0)
        squares[i].Height = yposmax - yposmin + 1;    
    45c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,d3
    45c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d3
    45c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a1,d3
    45ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d3,28(a0)
        if(yposmin < minycube) minycube = yposmin;
    45ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    45d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 45d4 <DrawCube3d+0x6a4>
    45d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,d6
        if(xposmin < minxcube) minxcube = xposmin;
    45d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    45d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 45de <DrawCube3d+0x6ae>
    45da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    45de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 64(sp),d2
    45e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 45e8 <DrawCube3d+0x6b8>
    45e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,64(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    45e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 80(sp),d0
    45ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 45f2 <DrawCube3d+0x6c2>
    45ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,80(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    45f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 80(sp),d0
    45f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    45f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    45fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 64(sp),d1
    4600:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    4602:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d6,d1
    for(int i=0; i <= 5; i++)
    4604:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a0),a0
    4608:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l a0,a6
    460a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 4366 <DrawCube3d+0x436>
    460e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|--|--|--|-------- bra.w 4376 <DrawCube3d+0x446>
    WORD bltwidth = (maxlengthcube/16)+2;
    4612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|-----|--|--|--|-------> addi.w #15,d0
    4616:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  |  |         asr.w #4,d0
    4618:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  |  |         addq.w #2,d0
    if(minycube < 0) {      
    461a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  |  |         tst.w d6
    461c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  |  \-------- bge.w 4396 <DrawCube3d+0x466>
      if(maxycube < 0) {
    4620:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  \----------> move.w 64(sp),d1
    4624:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  /----------- bmi.w 4a90 <DrawCube3d+0xb60>
      minycube = 0;
    4628:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |  |  |            clr.w d6
    if(minycube < minytotal) minytotal = minycube;
    462a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--|--|--|----------> cmp.w 98(sp),d6
    462e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 4634 <DrawCube3d+0x704>
    4630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d6,98(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    4634:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 64(sp),d5
    4638:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 90(sp),d5
    463c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- ble.s 4642 <DrawCube3d+0x712>
    463e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,90(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    4642:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    4644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 971d2 <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    464a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    464c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    464e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    4652:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    4656:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 43b8 <DrawCube3d+0x488>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    465a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    465c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    4660:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 4a4e <DrawCube3d+0xb1e>
    4664:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    4666:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    4668:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    466a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w d6,d2
    466c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    466e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    4670:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    4672:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 82(sp),a0
    4676:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    4678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 82(sp),d4
    467c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    467e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    4680:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    4682:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    4684:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    4686:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    4688:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    468c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    4690:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    4692:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    4694:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    4696:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    4698:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    469a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    469e:	|  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 43d4 <DrawCube3d+0x4a4>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    46a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    46a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    46aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    46ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 474e <DrawCube3d+0x81e>
    46b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    46b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    46b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d3
    46b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d3
    46ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d3,122(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    46be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    46c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    46c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    46c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   adda.w d2,a0
      bltfmask = 0xffff << rshift;
    46ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d2
    46cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w a0,d2
    46ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d4
    46d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d4
    46d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d4
    46d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d4,126(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    46d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    46da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 438c <DrawCube3d+0x45c>
    46de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 4612 <DrawCube3d+0x6e2>
          DrawRect( &squares[i]);                  
    46e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    46e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 380a <DrawRect>(pc)
    46ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    46ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 443e <DrawCube3d+0x50e>
    46f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    46f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 380a <DrawRect>(pc)
    46f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    46fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 4454 <DrawCube3d+0x524>
    46fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    4702:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 380a <DrawRect>(pc)
    4706:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    4708:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 446a <DrawCube3d+0x53a>
    470c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |  \--|--|--|--|-> pea -32(a6)
    4710:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   jsr 380a <DrawRect>(pc)
    4714:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    4716:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   addq.w #1,86(sp)
    471a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   move.l d2,82(sp)
    471e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   lea 192(a6),a6
    4722:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   move.w 86(sp),d7
    4726:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  |     |  |  |  |   cmp.w 106(sp),d7
    472a:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|--|-----|--|--|--|-- bne.w 4348 <DrawCube3d+0x418>
    472e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          |  \-----|--|--|--|-- bra.w 4498 <DrawCube3d+0x568>
          DrawRect( &squares[i]);                  
    4732:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------|--------|--|--|--|-> move.l 94(sp),-(sp)
    4736:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                          |        |  |  |  |   jsr 380a <DrawRect>(pc)
    473a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                          |        |  |  |  |   addq.l #4,sp
    473c:	|  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------|--------|--|--|--|-- bra.w 4412 <DrawCube3d+0x4e2>
    4740:	|  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------|--------|--|--|--|-> pea -160(a6)
    4744:	|  |  |  |  |  |  |  |  |  |  |  |  |              |                                   |        |  |  |  |   jsr 380a <DrawRect>(pc)
    4748:	|  |  |  |  |  |  |  |  |  |  |  |  |              |                                   |        |  |  |  |   addq.l #4,sp
    474a:	|  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------|--------|--|--|--|-- bra.w 4428 <DrawCube3d+0x4f8>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    474e:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |  \-> lea 15(a0),a0
    4752:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      move.l a0,d2
    4754:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      asr.l #4,d2
    4756:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      move.w d2,d3
    4758:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      addq.w #1,d3
    475a:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      move.w d3,122(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    475e:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      lsl.w #4,d2
    4760:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      movea.w 66(sp),a0
    4764:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      lea -144(a0),a0
    4768:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      adda.w d2,a0
      bltfmask = 0xffff << rshift;
    476a:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      moveq #0,d2
    476c:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      move.w a0,d2
    476e:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      moveq #0,d4
    4770:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      not.w d4
    4772:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      lsl.l d2,d4
    4774:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  |      move.w d4,126(sp)
    4778:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                  |        |  |  \----- bra.w 46d8 <DrawCube3d+0x7a8>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    477c:	|  |  |  |  |  |  |  |  |  |  \--|--|--------------------------------------------------|--------|--|-------> move.l 86(sp),d0
    4780:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d0,d0
    4782:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l 86(sp),d0
    4786:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d0,d0
    4788:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d0,d0
    478a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.l 90(sp),a1
    478e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w (0,a1,d0.l),a1
    4792:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a1,-(sp)
    4794:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a4,-(sp)
    4796:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         jsr 223a <ClearDirtyArea>(pc)
    479a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addq.l #8,sp
    WORD vfy4 = y3 - y2;
    479c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w d6,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    479e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d6,d2
    WORD vfx4 = x3 - x2;
    47a0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 94(sp),d0
    47a4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w d5,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    47a6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d5,d0
    47a8:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d0,d2
    WORD vfz4 = z3 - z2;
    47aa:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 118(sp),d1
    47ae:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w 54(sp),d1
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    47b2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l d7,-(sp)
    47b4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w d1,a5
    47b6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a5,-(sp)
    47b8:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.l 90(sp),a0
    47bc:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         jsr (a0)
    47be:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addq.l #8,sp
    47c0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.l d2,a5
    47c2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         adda.l d0,a5
    squares[0].Vertices[0].X = xs2;
    47c4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 66(sp),(a2)
    squares[0].Vertices[0].Y = ys2;
    47c8:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 64(sp),2(a2)
    squares[0].Vertices[1].X = xs0;
    47ce:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 80(sp),4(a2)
    squares[0].Vertices[1].Y = ys0;
    47d4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 76(sp),6(a2)
    squares[0].Vertices[2].X = xs1;
    47da:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 72(sp),8(a2)
    squares[0].Vertices[2].Y = ys1;
    47e0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 68(sp),10(a2)
    squares[0].Vertices[3].X = xs3;
    47e6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 62(sp),12(a2)
    squares[0].Vertices[3].Y = ys3;
    47ec:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 58(sp),14(a2)
    WORD x6 = vectors[18];
    47f2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 36(a3),d4
    WORD y6 = vectors[19];
    47f6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 38(a3),d2
    WORD z6 = vectors[20];
    47fa:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w 40(a3),a4
    WORD vfy0 = y6 - y2;
    47fe:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d2,d1
    4800:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w d6,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4802:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d6,d1
    WORD vfx0 = x6 - x2;
    4804:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d4,d0
    4806:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w d5,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4808:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d0,d5
    480a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d1,d5
    WORD vfz0 = z6 - z2; 
    480c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a4,d0
    480e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         sub.w 54(sp),d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4812:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l d7,-(sp)
    4814:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w d0,a1
    4816:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a1,-(sp)
    4818:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.l 90(sp),a0
    481c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         jsr (a0)
    481e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addq.l #8,sp
    4820:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d5,d0
    4822:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l d0,54(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    4826:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w 28(a3),a0
    482a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a0,d1
    482c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         subq.l #1,d1
    482e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d1,d1
    4830:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w (0,a6,d1.l),d1
    4834:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d1,d6
    4836:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 24(a3),d6
    483a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         moveq #15,d0
    483c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d0,d6
    483e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #160,d6
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    4842:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 26(a3),d1
    4846:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d0,d1
    4848:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w d1,a1
    484a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    484e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w 34(a3),a0
    4852:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a0,d1
    4854:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         subq.l #1,d1
    4856:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         add.l d1,d1
    4858:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w (0,a6,d1.l),d1
    485c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d1,d5
    485e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 30(a3),d5
    4862:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d0,d5
    4864:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #160,d5
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    4868:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 32(a3),d1
    486c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d0,d1
    486e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    4872:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w a4,a4
    4874:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         subq.l #1,a4
    4876:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         adda.l a4,a4
    4878:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w (0,a6,a4.l),d7
    487c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d4,d0
    487e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d7,d0
    4880:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         moveq #15,d3
    4882:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d3,d0
    4884:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d0,d4
    4886:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #160,d4
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    488a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w d7,d2
    488c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d3,d2
    488e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #128,d2
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    4892:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w 46(a3),a0
    4896:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         subq.l #1,a0
    4898:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         adda.l a0,a0
    489a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.w (0,a6,a0.l),a0
    489e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a0,d0
    48a0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 42(a3),d0
    48a4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d3,d0
    48a6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d0,d7
    48a8:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         addi.w #160,d7
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    48ac:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a0,d0
    48ae:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         muls.w 44(a3),d0
    48b2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         asr.l d3,d0
    48b4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         movea.l d0,a0
    48b6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         lea 128(a0),a0
    squares[0].DotProduct = vf0dotprod;
    48ba:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l 54(sp),16(a2)
    squares[0].Color = 1;
    48c0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #1,30(a2)
    squares[1].Vertices[0].X = xs6;
    48c6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d4,32(a2)
    squares[1].Vertices[0].Y = ys6;
    48ca:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d2,34(a2)
    squares[1].Vertices[1].X = xs7;
    48ce:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d7,36(a2)
    squares[1].Vertices[1].Y = ys7;
    48d2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a0,38(a2)
    squares[1].Vertices[2].X = xs5;
    48d6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d5,40(a2)
    squares[1].Vertices[2].Y = ys5;
    48da:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d1,42(a2)
    squares[1].Vertices[3].X = xs4;
    48de:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d6,44(a2)
    squares[1].Vertices[3].Y = ys4;
    48e2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a1,46(a2)
    int vf1dotprod = vf0dotprod*-1;
    48e6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l 54(sp),d3
    48ea:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         neg.l d3
    48ec:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l d3,48(a2)
    squares[1].Color = 1;
    48f0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #1,62(a2)
    squares[2].Vertices[0].X = xs2;
    48f6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 66(sp),64(a2)
    squares[2].Vertices[0].Y = ys2;
    48fc:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 64(sp),66(a2)
    squares[2].Vertices[1].X = xs3;
    4902:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 62(sp),68(a2)
    squares[2].Vertices[1].Y = ys3;
    4908:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 58(sp),70(a2)
    squares[2].Vertices[2].X = xs7;
    490e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d7,72(a2)
    squares[2].Vertices[2].Y = ys7;
    4912:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a0,74(a2)
    squares[2].Vertices[3].X = xs6;
    4916:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d4,76(a2)
    squares[2].Vertices[3].Y = ys6;
    491a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d2,78(a2)
    squares[2].DotProduct = vf2dotprod;
    491e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l 114(sp),80(a2)
    squares[2].Color = 2;
    4924:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #2,94(a2)
    squares[3].Vertices[0].X = xs0;
    492a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 80(sp),96(a2)
    squares[3].Vertices[0].Y = ys0;
    4930:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 76(sp),98(a2)
    squares[3].Vertices[1].X = xs4;
    4936:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d6,100(a2)
    squares[3].Vertices[1].Y = ys4;
    493a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a1,102(a2)
    squares[3].Vertices[2].X = xs5;
    493e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d5,104(a2)
    squares[3].Vertices[2].Y = ys5;
    4942:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d1,106(a2)
    squares[3].Vertices[3].X = xs1;
    4946:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 72(sp),108(a2)
    squares[3].Vertices[3].Y = ys1;
    494c:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 68(sp),110(a2)
    squares[3].DotProduct = vf3dotprod;
    4952:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l 98(sp),112(a2)
    squares[3].Color = 2;
    4958:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #2,126(a2)
    squares[4].Vertices[0].X = xs6;
    495e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d4,128(a2)
    squares[4].Vertices[0].Y = ys6;
    4962:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d2,130(a2)
    squares[4].Vertices[1].X = xs4;
    4966:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d6,132(a2)
    squares[4].Vertices[1].Y = ys4;
    496a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a1,134(a2)
    squares[4].Vertices[2].X = xs0;
    496e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 80(sp),136(a2)
    squares[4].Vertices[2].Y = ys0;
    4974:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 76(sp),138(a2)
    squares[4].Vertices[3].X = xs2;
    497a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 66(sp),140(a2)
    squares[4].Vertices[3].Y = ys2;
    4980:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 64(sp),142(a2)
    squares[4].DotProduct = vf4dotprod;
    4986:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a5,144(a2)
    squares[4].Color = 3;
    498a:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #3,158(a2)
    squares[5].Vertices[0].X = xs7;
    4990:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d7,160(a2)
    squares[5].Vertices[0].Y = ys7;
    4994:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w a0,162(a2)
    squares[5].Vertices[1].X = xs3;
    4998:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 62(sp),164(a2)
    squares[5].Vertices[1].Y = ys3;
    499e:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 58(sp),166(a2)
    squares[5].Vertices[2].X = xs1;
    49a4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 72(sp),168(a2)
    squares[5].Vertices[2].Y = ys1;
    49aa:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w 68(sp),170(a2)
    squares[5].Vertices[3].X = xs5;
    49b0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d5,172(a2)
    squares[5].Vertices[3].Y = ys5;
    49b4:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w d1,174(a2)
    int vf5dotprod = vf4dotprod * -1;
    49b8:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l a5,d4
    49ba:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         neg.l d4
    49bc:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l d4,176(a2)
    squares[5].Color = 3; 
    49c0:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.w #3,190(a2)
    vectors += 8*3;  
    49c6:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         lea 48(a3),a3
  for(UWORD i=0;i<cubecount;i++) 
    49ca:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         move.l 86(sp),d3
    49ce:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         lea 192(a2),a2
    49d2:	|  |  |  |  |  |  |  |  |  |     |  |                                                  |        |  |         cmp.l 102(sp),d3
    49d6:	|  |  |  \--|--|--|--|--|--|-----|--|--------------------------------------------------|--------|--|-------- bne.w 3f8c <DrawCube3d+0x5c>
    49da:	+--|--|-----|--|--|--|--|--|-----|--|--------------------------------------------------|--------|--|-------- bra.w 4330 <DrawCube3d+0x400>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    49de:	|  |  |     |  \--|--|--|--|-----|--|--------------------------------------------------|--------|--|-------> move.l d3,86(sp)
    49e2:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         move.l d3,d0
    49e4:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         add.l d3,d0
    49e6:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         add.l d3,d0
    49e8:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         add.l d0,d0
    49ea:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         add.l d0,d0
    49ec:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         movea.l 90(sp),a5
    49f0:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         movea.w (0,a5,d0.l),a5
    49f4:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         move.l a5,-(sp)
    49f6:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         move.l a4,-(sp)
    49f8:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    49fc:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         lea 16384(a4),a4
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4a00:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         move.l 971da <ClearBuffer>,98(sp)
    4a08:	|  |  |     |     |  |  |  |     |  |                                                  |        |  |         addq.l #8,sp
    4a0a:	|  |  |     \-----|--|--|--|-----|--|--------------------------------------------------|--------|--|-------- bra.w 3fd2 <DrawCube3d+0xa2>
    4a0e:	|  |  |           |  \--|--|-----|--|--------------------------------------------------|--------|--|-------> move.l 86(sp),d0
    4a12:	|  |  |           |     |  |     |  |                                                  |        |  |         add.l d0,d0
    4a14:	|  |  |           |     |  |     |  |                                                  |        |  |         add.l 86(sp),d0
    4a18:	|  |  |           |     |  |     |  |                                                  |        |  |         add.l d0,d0
    4a1a:	|  |  |           |     |  |     |  |                                                  |        |  |         add.l d0,d0
    4a1c:	|  |  |           |     |  |     |  |                                                  |        |  |         movea.l 90(sp),a5
    4a20:	|  |  |           |     |  |     |  |                                                  |        |  |         movea.w (0,a5,d0.l),a5
    4a24:	|  |  |           |     |  |     |  |                                                  |        |  |         move.l a5,-(sp)
    4a26:	|  |  |           |     |  |     |  |                                                  |        |  |         move.l a4,-(sp)
    4a28:	|  |  |           |     |  |     |  |                                                  |        |  |         move.l a0,58(sp)
    4a2c:	|  |  |           |     |  |     |  |                                                  |        |  |         move.l a1,54(sp)
    4a30:	|  |  |           |     |  |     |  |                                                  |        |  |         jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    4a34:	|  |  |           |     |  |     |  |                                                  |        |  |         lea 16384(a4),a4
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4a38:	|  |  |           |     |  |     |  |                                                  |        |  |         move.l 971da <ClearBuffer>,98(sp)
    4a40:	|  |  |           |     |  |     |  |                                                  |        |  |         addq.l #8,sp
    4a42:	|  |  |           |     |  |     |  |                                                  |        |  |         movea.l 46(sp),a1
    4a46:	|  |  |           |     |  |     |  |                                                  |        |  |         movea.l 50(sp),a0
    4a4a:	|  |  |           \-----|--|-----|--|--------------------------------------------------|--------|--|-------- bra.w 4086 <DrawCube3d+0x156>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    4a4e:	|  |  |                 |  |     |  |                                                  |        |  \-------> addi.w #15,d1
    4a52:	|  |  |                 |  |     |  |                                                  |        |            asr.w #4,d1
    4a54:	|  |  |                 |  |     |  |                                                  |        |            ext.l d1
    4a56:	|  |  |                 |  |     |  |                                                  |        |            add.l d1,d1
    4a58:	|  |  |                 |  |     |  |                                                  |        |            move.w d6,d2
    4a5a:	|  |  |                 |  |     |  |                                                  |        |            subq.w #1,d2
    4a5c:	|  |  |                 |  |     |  |                                                  |        |            ext.l d2
    4a5e:	|  |  |                 |  |     |  |                                                  |        |            lsl.l #6,d2
    4a60:	|  |  |                 |  |     |  |                                                  |        |            movea.l 82(sp),a0
    4a64:	|  |  |                 |  |     |  |                                                  |        |            adda.l a0,a0
    4a66:	|  |  |                 |  |     |  |                                                  |        |            move.l 82(sp),d4
    4a6a:	|  |  |                 |  |     |  |                                                  |        |            add.l a0,d4
    4a6c:	|  |  |                 |  |     |  |                                                  |        |            add.l d4,d4
    4a6e:	|  |  |                 |  |     |  |                                                  |        |            add.l d4,d4
    4a70:	|  |  |                 |  |     |  |                                                  |        |            move.l a1,d5
    4a72:	|  |  |                 |  |     |  |                                                  |        |            add.l d1,d5
    4a74:	|  |  |                 |  |     |  |                                                  |        |            add.l d2,d5
    4a76:	|  |  |                 |  |     |  |                                                  |        |            move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    4a7a:	|  |  |                 |  |     |  |                                                  |        |            lea 40(a1),a1
    4a7e:	|  |  |                 |  |     |  |                                                  |        |            suba.l d1,a1
    4a80:	|  |  |                 |  |     |  |                                                  |        |            move.l a3,d1
    4a82:	|  |  |                 |  |     |  |                                                  |        |            add.l a3,d1
    4a84:	|  |  |                 |  |     |  |                                                  |        |            suba.l d1,a1
    4a86:	|  |  |                 |  |     |  |                                                  |        |            add.l a1,d2
    4a88:	|  |  |                 |  |     |  |                                                  |        |            move.l d2,(8,a2,d4.l)
    4a8c:	|  |  |                 |  \-----|--|--------------------------------------------------|--------|----------- bra.w 43d4 <DrawCube3d+0x4a4>
      if(maxycube < 0) {
    4a90:	|  |  |                 |        |  |                                                  |        \----------> clr.w d1
      minycube = 0;
    4a92:	|  |  |                 |        |  |                                                  |                     clr.w d6
    4a94:	|  |  |                 |        |  |                                                  +-------------------- bra.w 462a <DrawCube3d+0x6fa>
    } else if(maxycube > 256) {
    4a98:	|  |  |                 \--------|--|--------------------------------------------------|-------------------> cmpi.w #256,64(sp)
    4a9e:	|  |  |                          |  |                                                  |                 /-- bgt.s 4aa6 <DrawCube3d+0xb76>
    maxheightcube+=1;
    4aa0:	|  |  |                          |  |                                                  |                 |   addq.w #1,d1
    4aa2:	|  |  |                          |  |                                                  +-----------------|-- bra.w 462a <DrawCube3d+0x6fa>
      maxheightcube = 256 - 1 - minycube;
    4aa6:	|  |  |                          |  |                                                  |                 \-> move.w #255,d1
    4aaa:	|  |  |                          |  |                                                  |                     sub.w d6,d1
      maxycube = 256;
    4aac:	|  |  |                          |  |                                                  |                     move.w #256,64(sp)
    4ab2:	|  |  |                          |  |                                                  \-------------------- bra.w 462a <DrawCube3d+0x6fa>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    4ab6:	|  |  |                          >--|----------------------------------------------------------------------> movea.l 971d2 <DrawBuffer>,a0
    4abc:	|  |  |                          |  |                                                                        movea.l (a0),a0
    4abe:	|  |  |                          |  |                                                                        move.w 98(sp),d0
    4ac2:	|  |  |                          |  |                                                                        ext.l d0
    4ac4:	|  |  |                          |  |                                                                        lsl.l #6,d0
    4ac6:	|  |  |                          |  |                                                                        move.w 126(sp),-(sp)
    4aca:	|  |  |                          |  |                                                                        clr.w -(sp)
    4acc:	|  |  |                          |  |                                                                        pea (20,a0,d0.l)
    4ad0:	|  |  |                          |  |                                                                        move.l 971de <PrepareBuffer>,-(sp)
    4ad6:	|  |  |                          |  |                                                                        pea (0,a0,d0.l)
    4ada:	|  |  |                          |  |                                                                        move.w 138(sp),-(sp)
    4ade:	|  |  |                          |  |                                                                        clr.w -(sp)
    4ae0:	|  |  |                          |  |                                                                        move.w 110(sp),d0
    4ae4:	|  |  |                          |  |                                                                        addq.w #1,d0
    4ae6:	|  |  |                          |  |                                                                        sub.w 118(sp),d0
    4aea:	|  |  |                          |  |                                                                        move.w d0,-(sp)
    4aec:	|  |  |                          |  |                                                                        clr.w -(sp)
    4aee:	|  |  |                          |  |                                                                        jsr 29e <Utils_CopyBlitReverse>(pc)
    4af2:	|  |  |                          |  |                                                                        lea 24(sp),sp
  DrawBuffer->minytotal = minytotal;
    4af6:	|  |  |                          |  |                                                                        movea.l 971d2 <DrawBuffer>,a0
    4afc:	|  |  |                          |  |                                                                        move.w 98(sp),54(a0)
  DrawBuffer->maxytotal = maxytotal;
    4b02:	|  |  |                          |  |                                                                        move.w 90(sp),52(a0)
}
    4b08:	|  |  |                          |  |                                                                        movem.l (sp)+,d2-d7/a2-a6
    4b0c:	|  |  |                          |  |                                                                        lea 88(sp),sp
    4b10:	|  |  |                          |  |                                                                        rts
  WORD maxytotal = 0;
    4b12:	|  |  \--------------------------|--|----------------------------------------------------------------------> clr.w 90(sp)
  WORD minytotal = 256;
    4b16:	|  |                             |  |                                                                        move.w #256,98(sp)
  if( mirroring == 1) {
    4b1c:	|  |                             |  |                                                                        cmpi.w #1,112(sp)
    4b22:	|  |                             |  \----------------------------------------------------------------------- bne.w 44a2 <DrawCube3d+0x572>
    4b26:	|  |                             \-------------------------------------------------------------------------- bra.s 4ab6 <DrawCube3d+0xb86>
    4b28:	|  \-------------------------------------------------------------------------------------------------------> move.l d0,128(sp)
  for(UWORD i=0;i<cubecount;i++) 
    4b2c:	|                                                                                                            moveq #0,d3
    4b2e:	|                                                                                                            move.l #8808,108(sp)
    4b36:	|                                                                                                            lea 49576 <zMult.lto_priv.1>,a6
    4b3c:	|                                                                                                            move.l #26420,82(sp)
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    4b44:	|                                                                                                            move.l d3,d5
    4b46:	|                                                                                                            add.l d3,d5
    4b48:	|                                                                                                            move.l d5,54(sp)
    4b4c:	|                                                                                                            move.l d5,d2
    4b4e:	|                                                                                                            add.l d3,d2
    4b50:	|                                                                                                            add.l d2,d2
    4b52:	|                                                                                                            add.l d2,d2
    4b54:	|                                                                                                            movea.l 971da <ClearBuffer>,a0
    4b5a:	|                                                                                                            adda.l d2,a0
    4b5c:	|                                                                                                            movea.w 14(a0),a0
    4b60:	|                                                                                                            move.l a0,-(sp)
    4b62:	|                                                                                                            movea.l 112(sp),a0
    4b66:	|                                                                                                            jsr (a0)
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    4b68:	|                                                                                                            movea.l 971da <ClearBuffer>,a5
    4b6e:	|                                                                                                            move.l (4,a5,d2.l),d4
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    4b72:	|                                                                                                            addq.l #4,sp
    4b74:	|                                                                                      /-------------------- bne.w 4fe8 <DrawCube3d+0x10b8>
    4b78:	|                                                                                      |  /----------------> move.l d3,d1
    4b7a:	|                                                                                      |  |                  addq.l #1,d1
    4b7c:	|                                                                                      |  |                  move.l d1,94(sp)
    WORD x0 = vectors[0];
    4b80:	|                                                                                   /--|--|----------------> move.w (a3),d6
    WORD y0 = vectors[1];
    4b82:	|                                                                                   |  |  |                  move.w 2(a3),114(sp)
    WORD z0 = vectors[2];
    4b88:	|                                                                                   |  |  |                  movea.w 4(a3),a1
    WORD x2 = vectors[6];
    4b8c:	|                                                                                   |  |  |                  move.w 12(a3),d7
    WORD y2 = vectors[7];
    4b90:	|                                                                                   |  |  |                  move.w 14(a3),d2
    WORD z2 = vectors[8];
    4b94:	|                                                                                   |  |  |                  movea.w 16(a3),a4
    WORD x3 = vectors[9];
    4b98:	|                                                                                   |  |  |                  move.w 18(a3),90(sp)
    WORD y3 = vectors[10];
    4b9e:	|                                                                                   |  |  |                  move.w 20(a3),98(sp)
    WORD z3 = vectors[11];
    4ba4:	|                                                                                   |  |  |                  move.w 22(a3),102(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4baa:	|                                                                                   |  |  |                  movea.w a1,a0
    4bac:	|                                                                                   |  |  |                  move.l a0,d0
    4bae:	|                                                                                   |  |  |                  subq.l #1,d0
    4bb0:	|                                                                                   |  |  |                  add.l d0,d0
    4bb2:	|                                                                                   |  |  |                  move.w (0,a6,d0.l),d0
    4bb6:	|                                                                                   |  |  |                  move.w d6,d1
    4bb8:	|                                                                                   |  |  |                  muls.w d0,d1
    4bba:	|                                                                                   |  |  |                  moveq #15,d5
    4bbc:	|                                                                                   |  |  |                  asr.l d5,d1
    4bbe:	|                                                                                   |  |  |                  movea.l d1,a0
    4bc0:	|                                                                                   |  |  |                  lea 160(a0),a0
    4bc4:	|                                                                                   |  |  |                  move.w a0,62(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    4bc8:	|                                                                                   |  |  |                  muls.w 114(sp),d0
    4bcc:	|                                                                                   |  |  |                  asr.l d5,d0
    4bce:	|                                                                                   |  |  |                  addi.w #128,d0
    4bd2:	|                                                                                   |  |  |                  move.w d0,64(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4bd6:	|                                                                                   |  |  |                  movea.w 10(a3),a0
    4bda:	|                                                                                   |  |  |                  move.l a0,d0
    4bdc:	|                                                                                   |  |  |                  subq.l #1,d0
    4bde:	|                                                                                   |  |  |                  add.l d0,d0
    4be0:	|                                                                                   |  |  |                  move.w (0,a6,d0.l),d0
    4be4:	|                                                                                   |  |  |                  move.w d0,d1
    4be6:	|                                                                                   |  |  |                  muls.w 6(a3),d1
    4bea:	|                                                                                   |  |  |                  asr.l d5,d1
    4bec:	|                                                                                   |  |  |                  movea.l d1,a0
    4bee:	|                                                                                   |  |  |                  lea 160(a0),a0
    4bf2:	|                                                                                   |  |  |                  move.w a0,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    4bf6:	|                                                                                   |  |  |                  muls.w 8(a3),d0
    4bfa:	|                                                                                   |  |  |                  asr.l d5,d0
    4bfc:	|                                                                                   |  |  |                  addi.w #128,d0
    4c00:	|                                                                                   |  |  |                  move.w d0,68(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    4c04:	|                                                                                   |  |  |                  movea.w a4,a0
    4c06:	|                                                                                   |  |  |                  move.l a0,d0
    4c08:	|                                                                                   |  |  |                  subq.l #1,d0
    4c0a:	|                                                                                   |  |  |                  add.l d0,d0
    4c0c:	|                                                                                   |  |  |                  move.w (0,a6,d0.l),d0
    4c10:	|                                                                                   |  |  |                  move.w d7,d5
    4c12:	|                                                                                   |  |  |                  muls.w d0,d5
    4c14:	|                                                                                   |  |  |                  moveq #15,d1
    4c16:	|                                                                                   |  |  |                  asr.l d1,d5
    4c18:	|                                                                                   |  |  |                  move.l d5,58(sp)
    4c1c:	|                                                                                   |  |  |                  addi.w #160,d5
    4c20:	|                                                                                   |  |  |                  move.w d5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    4c24:	|                                                                                   |  |  |                  muls.w d2,d0
    4c26:	|                                                                                   |  |  |                  asr.l d1,d0
    4c28:	|                                                                                   |  |  |                  addi.w #128,d0
    4c2c:	|                                                                                   |  |  |                  move.w d0,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    4c30:	|                                                                                   |  |  |                  tst.l d4
    4c32:	|                                                                                   |  |  |  /-------------- beq.s 4c3e <DrawCube3d+0xd0e>
    4c34:	|                                                                                   |  |  |  |               tst.w 971ec <DoNotClearDirty>
    4c3a:	|                                                                                   |  |  |  |  /----------- beq.w 5022 <DrawCube3d+0x10f2>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4c3e:	|                                                                                   |  |  |  >--|----------> move.w 102(sp),d0
    4c42:	|                                                                                   |  |  |  |  |            ext.l d0
    4c44:	|                                                                                   |  |  |  |  |            subq.l #1,d0
    4c46:	|                                                                                   |  |  |  |  |            add.l d0,d0
    4c48:	|                                                                                   |  |  |  |  |            move.w (0,a6,d0.l),d0
    4c4c:	|                                                                                   |  |  |  |  |            move.w 90(sp),d5
    4c50:	|                                                                                   |  |  |  |  |            muls.w d0,d5
    4c52:	|                                                                                   |  |  |  |  |            moveq #15,d1
    4c54:	|                                                                                   |  |  |  |  |            asr.l d1,d5
    4c56:	|                                                                                   |  |  |  |  |            addi.w #160,d5
    4c5a:	|                                                                                   |  |  |  |  |            move.w d5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    4c5e:	|                                                                                   |  |  |  |  |            muls.w 98(sp),d0
    4c62:	|                                                                                   |  |  |  |  |            asr.l d1,d0
    4c64:	|                                                                                   |  |  |  |  |            addi.w #128,d0
    4c68:	|                                                                                   |  |  |  |  |            move.w d0,86(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    4c6c:	|                                                                                   |  |  |  |  |            lea 386(a0),a0
    4c70:	|                                                                                   |  |  |  |  |            move.l a0,58(sp)
    WORD vfx2 = x0 - x2;
    4c74:	|                                                                                   |  |  |  |  |            sub.w d7,d6
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    4c76:	|                                                                                   |  |  |  |  |            muls.w d7,d6
    WORD vfy2 = y0 - y2;
    4c78:	|                                                                                   |  |  |  |  |            move.w 114(sp),d5
    4c7c:	|                                                                                   |  |  |  |  |            sub.w d2,d5
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    4c7e:	|                                                                                   |  |  |  |  |            muls.w d2,d5
    4c80:	|                                                                                   |  |  |  |  |            add.l d5,d6
    WORD vfz2 = z0 - z2; 
    4c82:	|                                                                                   |  |  |  |  |            suba.w a4,a1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    4c84:	|                                                                                   |  |  |  |  |            move.l a0,-(sp)
    4c86:	|                                                                                   |  |  |  |  |            movea.w a1,a1
    4c88:	|                                                                                   |  |  |  |  |            move.l a1,-(sp)
    4c8a:	|                                                                                   |  |  |  |  |            movea.l 90(sp),a0
    4c8e:	|                                                                                   |  |  |  |  |            jsr (a0)
    4c90:	|                                                                                   |  |  |  |  |            addq.l #8,sp
    4c92:	|                                                                                   |  |  |  |  |            add.l d0,d6
    4c94:	|                                                                                   |  |  |  |  |            move.l d6,114(sp)
    int vf3dotprod = vf2dotprod * -1;
    4c98:	|                                                                                   |  |  |  |  |            move.l d6,d1
    4c9a:	|                                                                                   |  |  |  |  |            neg.l d1
    4c9c:	|                                                                                   |  |  |  |  |            move.l d1,118(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    4ca0:	|                                                                                   |  |  |  |  |            tst.l d4
    4ca2:	|                                                                                   |  |  |  |  |  /-------- beq.s 4cae <DrawCube3d+0xd7e>
    4ca4:	|                                                                                   |  |  |  |  |  |         tst.w 971ec <DoNotClearDirty>
    4caa:	|                                                                                   |  |  |  |  |  |  /----- beq.w 4ffc <DrawCube3d+0x10cc>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    4cae:	|                                                                                   |  |  |  |  |  >--|----> move.l 54(sp),d0
    4cb2:	|                                                                                   |  |  |  |  |  |  |      add.l d3,d0
    4cb4:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d0
    4cb6:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d0
    4cb8:	|                                                                                   |  |  |  |  |  |  |      move.l (8,a5,d0.l),54(sp)
    WORD vfx4 = x3 - x2;
    4cbe:	|                                                                                   |  |  |  |  |  |  |      move.w 90(sp),d3
    4cc2:	|                                                                                   |  |  |  |  |  |  |      sub.w d7,d3
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    4cc4:	|                                                                                   |  |  |  |  |  |  |      muls.w d7,d3
    WORD vfy4 = y3 - y2;
    4cc6:	|                                                                                   |  |  |  |  |  |  |      move.w 98(sp),d0
    4cca:	|                                                                                   |  |  |  |  |  |  |      sub.w d2,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    4ccc:	|                                                                                   |  |  |  |  |  |  |      muls.w d2,d0
    4cce:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d3
    WORD vfz4 = z3 - z2;
    4cd0:	|                                                                                   |  |  |  |  |  |  |      move.w 102(sp),d0
    4cd4:	|                                                                                   |  |  |  |  |  |  |      sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    4cd6:	|                                                                                   |  |  |  |  |  |  |      move.l 58(sp),-(sp)
    4cda:	|                                                                                   |  |  |  |  |  |  |      movea.w d0,a0
    4cdc:	|                                                                                   |  |  |  |  |  |  |      move.l a0,-(sp)
    4cde:	|                                                                                   |  |  |  |  |  |  |      movea.l 90(sp),a1
    4ce2:	|                                                                                   |  |  |  |  |  |  |      jsr (a1)
    4ce4:	|                                                                                   |  |  |  |  |  |  |      addq.l #8,sp
    4ce6:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d3
    4ce8:	|                                                                                   |  |  |  |  |  |  |      move.l d3,90(sp)
    int vf5dotprod = vf4dotprod * -1;
    4cec:	|                                                                                   |  |  |  |  |  |  |      neg.l d3
    4cee:	|                                                                                   |  |  |  |  |  |  |      move.l d3,98(sp)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    4cf2:	|                                                                                   |  |  |  |  |  |  |      tst.l 54(sp)
    4cf6:	|                                                                                   |  |  |  |  |  |  |  /-- beq.s 4d26 <DrawCube3d+0xdf6>
    4cf8:	|                                                                                   |  |  |  |  |  |  |  |   tst.w 971ec <DoNotClearDirty>
    4cfe:	|                                                                                   |  |  |  |  |  |  |  +-- bne.s 4d26 <DrawCube3d+0xdf6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4d00:	|                                                                                   |  |  |  |  |  |  |  |   move.l 94(sp),d0
    4d04:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4d06:	|                                                                                   |  |  |  |  |  |  |  |   add.l 94(sp),d0
    4d0a:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4d0c:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4d0e:	|                                                                                   |  |  |  |  |  |  |  |   movea.w (0,a5,d0.l),a5
    4d12:	|                                                                                   |  |  |  |  |  |  |  |   move.l a5,-(sp)
    4d14:	|                                                                                   |  |  |  |  |  |  |  |   move.l 58(sp),-(sp)
    4d18:	|                                                                                   |  |  |  |  |  |  |  |   jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    4d1c:	|                                                                                   |  |  |  |  |  |  |  |   addi.l #16384,62(sp)
    4d24:	|                                                                                   |  |  |  |  |  |  |  |   addq.l #8,sp
    squares[0].Vertices[0].X = xs2;
    4d26:	|                                                                                   |  |  |  |  |  |  |  \-> move.w 72(sp),(a2)
    squares[0].Vertices[0].Y = ys2;
    4d2a:	|                                                                                   |  |  |  |  |  |  |      move.w 76(sp),2(a2)
    squares[0].Vertices[1].X = xs0;
    4d30:	|                                                                                   |  |  |  |  |  |  |      move.w 62(sp),4(a2)
    squares[0].Vertices[1].Y = ys0;
    4d36:	|                                                                                   |  |  |  |  |  |  |      move.w 64(sp),6(a2)
    squares[0].Vertices[2].X = xs1;
    4d3c:	|                                                                                   |  |  |  |  |  |  |      move.w 66(sp),8(a2)
    squares[0].Vertices[2].Y = ys1;
    4d42:	|                                                                                   |  |  |  |  |  |  |      move.w 68(sp),10(a2)
    squares[0].Vertices[3].X = xs3;
    4d48:	|                                                                                   |  |  |  |  |  |  |      move.w 80(sp),12(a2)
    squares[0].Vertices[3].Y = ys3;
    4d4e:	|                                                                                   |  |  |  |  |  |  |      move.w 86(sp),14(a2)
    WORD x6 = vectors[18];
    4d54:	|                                                                                   |  |  |  |  |  |  |      move.w 36(a3),d6
    WORD y6 = vectors[19];
    4d58:	|                                                                                   |  |  |  |  |  |  |      move.w 38(a3),d5
    WORD z6 = vectors[20];
    4d5c:	|                                                                                   |  |  |  |  |  |  |      move.w 40(a3),d3
    WORD vfx0 = x6 - x2;
    4d60:	|                                                                                   |  |  |  |  |  |  |      move.w d6,d0
    4d62:	|                                                                                   |  |  |  |  |  |  |      sub.w d7,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4d64:	|                                                                                   |  |  |  |  |  |  |      muls.w d0,d7
    WORD vfy0 = y6 - y2;
    4d66:	|                                                                                   |  |  |  |  |  |  |      move.w d5,d0
    4d68:	|                                                                                   |  |  |  |  |  |  |      sub.w d2,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4d6a:	|                                                                                   |  |  |  |  |  |  |      muls.w d2,d0
    4d6c:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d7
    WORD vfz0 = z6 - z2; 
    4d6e:	|                                                                                   |  |  |  |  |  |  |      move.w d3,d0
    4d70:	|                                                                                   |  |  |  |  |  |  |      sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    4d72:	|                                                                                   |  |  |  |  |  |  |      move.l 58(sp),-(sp)
    4d76:	|                                                                                   |  |  |  |  |  |  |      movea.w d0,a5
    4d78:	|                                                                                   |  |  |  |  |  |  |      move.l a5,-(sp)
    4d7a:	|                                                                                   |  |  |  |  |  |  |      movea.l 90(sp),a0
    4d7e:	|                                                                                   |  |  |  |  |  |  |      jsr (a0)
    4d80:	|                                                                                   |  |  |  |  |  |  |      addq.l #8,sp
    4d82:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d7
    int vf1dotprod = vf0dotprod*-1;
    4d84:	|                                                                                   |  |  |  |  |  |  |      move.l d7,d0
    4d86:	|                                                                                   |  |  |  |  |  |  |      neg.l d0
    4d88:	|                                                                                   |  |  |  |  |  |  |      move.l d0,58(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    4d8c:	|                                                                                   |  |  |  |  |  |  |      movea.w 28(a3),a0
    4d90:	|                                                                                   |  |  |  |  |  |  |      move.l a0,d0
    4d92:	|                                                                                   |  |  |  |  |  |  |      subq.l #1,d0
    4d94:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d0
    4d96:	|                                                                                   |  |  |  |  |  |  |      move.w (0,a6,d0.l),d4
    4d9a:	|                                                                                   |  |  |  |  |  |  |      move.w d4,d0
    4d9c:	|                                                                                   |  |  |  |  |  |  |      muls.w 24(a3),d0
    4da0:	|                                                                                   |  |  |  |  |  |  |      moveq #15,d1
    4da2:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d0
    4da4:	|                                                                                   |  |  |  |  |  |  |      movea.w d0,a1
    4da6:	|                                                                                   |  |  |  |  |  |  |      lea 160(a1),a1
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    4daa:	|                                                                                   |  |  |  |  |  |  |      muls.w 26(a3),d4
    4dae:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d4
    4db0:	|                                                                                   |  |  |  |  |  |  |      addi.w #128,d4
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    4db4:	|                                                                                   |  |  |  |  |  |  |      movea.w 34(a3),a0
    4db8:	|                                                                                   |  |  |  |  |  |  |      move.l a0,d0
    4dba:	|                                                                                   |  |  |  |  |  |  |      subq.l #1,d0
    4dbc:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d0
    4dbe:	|                                                                                   |  |  |  |  |  |  |      move.w (0,a6,d0.l),d2
    4dc2:	|                                                                                   |  |  |  |  |  |  |      move.w d2,d0
    4dc4:	|                                                                                   |  |  |  |  |  |  |      muls.w 30(a3),d0
    4dc8:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d0
    4dca:	|                                                                                   |  |  |  |  |  |  |      movea.w d0,a4
    4dcc:	|                                                                                   |  |  |  |  |  |  |      lea 160(a4),a4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    4dd0:	|                                                                                   |  |  |  |  |  |  |      muls.w 32(a3),d2
    4dd4:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d2
    4dd6:	|                                                                                   |  |  |  |  |  |  |      addi.w #128,d2
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    4dda:	|                                                                                   |  |  |  |  |  |  |      movea.w d3,a0
    4ddc:	|                                                                                   |  |  |  |  |  |  |      move.l a0,d3
    4dde:	|                                                                                   |  |  |  |  |  |  |      subq.l #1,d3
    4de0:	|                                                                                   |  |  |  |  |  |  |      add.l d3,d3
    4de2:	|                                                                                   |  |  |  |  |  |  |      move.w (0,a6,d3.l),d0
    4de6:	|                                                                                   |  |  |  |  |  |  |      muls.w d0,d6
    4de8:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d6
    4dea:	|                                                                                   |  |  |  |  |  |  |      addi.w #160,d6
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    4dee:	|                                                                                   |  |  |  |  |  |  |      muls.w d5,d0
    4df0:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d0
    4df2:	|                                                                                   |  |  |  |  |  |  |      move.w d0,d5
    4df4:	|                                                                                   |  |  |  |  |  |  |      addi.w #128,d5
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    4df8:	|                                                                                   |  |  |  |  |  |  |      movea.w 46(a3),a0
    4dfc:	|                                                                                   |  |  |  |  |  |  |      move.l a0,d0
    4dfe:	|                                                                                   |  |  |  |  |  |  |      subq.l #1,d0
    4e00:	|                                                                                   |  |  |  |  |  |  |      add.l d0,d0
    4e02:	|                                                                                   |  |  |  |  |  |  |      move.w (0,a6,d0.l),d3
    4e06:	|                                                                                   |  |  |  |  |  |  |      move.w d3,d0
    4e08:	|                                                                                   |  |  |  |  |  |  |      muls.w 42(a3),d0
    4e0c:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d0
    4e0e:	|                                                                                   |  |  |  |  |  |  |      movea.w d0,a5
    4e10:	|                                                                                   |  |  |  |  |  |  |      lea 160(a5),a5
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    4e14:	|                                                                                   |  |  |  |  |  |  |      muls.w 44(a3),d3
    4e18:	|                                                                                   |  |  |  |  |  |  |      asr.l d1,d3
    4e1a:	|                                                                                   |  |  |  |  |  |  |      addi.w #128,d3
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    4e1e:	|                                                                                   |  |  |  |  |  |  |      tst.l 54(sp)
    4e22:	|                                                                                   |  |  |  |  |  |  |  /-- beq.s 4e60 <DrawCube3d+0xf30>
    4e24:	|                                                                                   |  |  |  |  |  |  |  |   tst.w 971ec <DoNotClearDirty>
    4e2a:	|                                                                                   |  |  |  |  |  |  |  +-- bne.s 4e60 <DrawCube3d+0xf30>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4e2c:	|                                                                                   |  |  |  |  |  |  |  |   move.l 94(sp),d0
    4e30:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4e32:	|                                                                                   |  |  |  |  |  |  |  |   add.l 94(sp),d0
    4e36:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4e38:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4e3a:	|                                                                                   |  |  |  |  |  |  |  |   movea.l 971da <ClearBuffer>,a0
    4e40:	|                                                                                   |  |  |  |  |  |  |  |   movea.w (0,a0,d0.l),a0
    4e44:	|                                                                                   |  |  |  |  |  |  |  |   move.l a0,-(sp)
    4e46:	|                                                                                   |  |  |  |  |  |  |  |   move.l 58(sp),-(sp)
    4e4a:	|                                                                                   |  |  |  |  |  |  |  |   move.l a1,54(sp)
    4e4e:	|                                                                                   |  |  |  |  |  |  |  |   jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    4e52:	|                                                                                   |  |  |  |  |  |  |  |   addi.l #16384,62(sp)
    4e5a:	|                                                                                   |  |  |  |  |  |  |  |   addq.l #8,sp
    4e5c:	|                                                                                   |  |  |  |  |  |  |  |   movea.l 46(sp),a1
    squares[0].DotProduct = vf0dotprod;
    4e60:	|                                                                                   |  |  |  |  |  |  |  \-> move.l d7,16(a2)
    squares[0].Color = 1;
    4e64:	|                                                                                   |  |  |  |  |  |  |      move.w #1,30(a2)
    squares[1].Vertices[0].X = xs6;
    4e6a:	|                                                                                   |  |  |  |  |  |  |      move.w d6,32(a2)
    squares[1].Vertices[0].Y = ys6;
    4e6e:	|                                                                                   |  |  |  |  |  |  |      move.w d5,34(a2)
    squares[1].Vertices[1].X = xs7;
    4e72:	|                                                                                   |  |  |  |  |  |  |      move.w a5,36(a2)
    squares[1].Vertices[1].Y = ys7;
    4e76:	|                                                                                   |  |  |  |  |  |  |      move.w d3,38(a2)
    squares[1].Vertices[2].X = xs5;
    4e7a:	|                                                                                   |  |  |  |  |  |  |      move.w a4,40(a2)
    squares[1].Vertices[2].Y = ys5;
    4e7e:	|                                                                                   |  |  |  |  |  |  |      move.w d2,42(a2)
    squares[1].Vertices[3].X = xs4;
    4e82:	|                                                                                   |  |  |  |  |  |  |      move.w a1,44(a2)
    squares[1].Vertices[3].Y = ys4;
    4e86:	|                                                                                   |  |  |  |  |  |  |      move.w d4,46(a2)
    squares[1].DotProduct = vf1dotprod;
    4e8a:	|                                                                                   |  |  |  |  |  |  |      move.l 58(sp),48(a2)
    squares[1].Color = 1;
    4e90:	|                                                                                   |  |  |  |  |  |  |      move.w #1,62(a2)
    squares[2].Vertices[0].X = xs2;
    4e96:	|                                                                                   |  |  |  |  |  |  |      move.w 72(sp),64(a2)
    squares[2].Vertices[0].Y = ys2;
    4e9c:	|                                                                                   |  |  |  |  |  |  |      move.w 76(sp),66(a2)
    squares[2].Vertices[1].X = xs3;
    4ea2:	|                                                                                   |  |  |  |  |  |  |      move.w 80(sp),68(a2)
    squares[2].Vertices[1].Y = ys3;
    4ea8:	|                                                                                   |  |  |  |  |  |  |      move.w 86(sp),70(a2)
    squares[2].Vertices[2].X = xs7;
    4eae:	|                                                                                   |  |  |  |  |  |  |      move.w a5,72(a2)
    squares[2].Vertices[2].Y = ys7;
    4eb2:	|                                                                                   |  |  |  |  |  |  |      move.w d3,74(a2)
    squares[2].Vertices[3].X = xs6;
    4eb6:	|                                                                                   |  |  |  |  |  |  |      move.w d6,76(a2)
    squares[2].Vertices[3].Y = ys6;
    4eba:	|                                                                                   |  |  |  |  |  |  |      move.w d5,78(a2)
    squares[2].DotProduct = vf2dotprod;
    4ebe:	|                                                                                   |  |  |  |  |  |  |      move.l 114(sp),80(a2)
    squares[2].Color = 2;
    4ec4:	|                                                                                   |  |  |  |  |  |  |      move.w #2,94(a2)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    4eca:	|                                                                                   |  |  |  |  |  |  |      tst.l 54(sp)
    4ece:	|                                                                                   |  |  |  |  |  |  |  /-- beq.s 4f04 <DrawCube3d+0xfd4>
    4ed0:	|                                                                                   |  |  |  |  |  |  |  |   tst.w 971ec <DoNotClearDirty>
    4ed6:	|                                                                                   |  |  |  |  |  |  |  +-- bne.s 4f04 <DrawCube3d+0xfd4>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    4ed8:	|                                                                                   |  |  |  |  |  |  |  |   move.l 94(sp),d0
    4edc:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4ede:	|                                                                                   |  |  |  |  |  |  |  |   add.l 94(sp),d0
    4ee2:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4ee4:	|                                                                                   |  |  |  |  |  |  |  |   add.l d0,d0
    4ee6:	|                                                                                   |  |  |  |  |  |  |  |   movea.l 971da <ClearBuffer>,a0
    4eec:	|                                                                                   |  |  |  |  |  |  |  |   movea.w (0,a0,d0.l),a0
    4ef0:	|                                                                                   |  |  |  |  |  |  |  |   move.l a0,-(sp)
    4ef2:	|                                                                                   |  |  |  |  |  |  |  |   move.l 58(sp),-(sp)
    4ef6:	|                                                                                   |  |  |  |  |  |  |  |   move.l a1,54(sp)
    4efa:	|                                                                                   |  |  |  |  |  |  |  |   jsr 223a <ClearDirtyArea>(pc)
    4efe:	|                                                                                   |  |  |  |  |  |  |  |   addq.l #8,sp
    4f00:	|                                                                                   |  |  |  |  |  |  |  |   movea.l 46(sp),a1
    squares[3].Vertices[0].X = xs0;
    4f04:	|                                                                                   |  |  |  |  |  |  |  \-> move.w 62(sp),96(a2)
    squares[3].Vertices[0].Y = ys0;
    4f0a:	|                                                                                   |  |  |  |  |  |  |      move.w 64(sp),98(a2)
    squares[3].Vertices[1].X = xs4;
    4f10:	|                                                                                   |  |  |  |  |  |  |      move.w a1,100(a2)
    squares[3].Vertices[1].Y = ys4;
    4f14:	|                                                                                   |  |  |  |  |  |  |      move.w d4,102(a2)
    squares[3].Vertices[2].X = xs5;
    4f18:	|                                                                                   |  |  |  |  |  |  |      move.w a4,104(a2)
    squares[3].Vertices[2].Y = ys5;
    4f1c:	|                                                                                   |  |  |  |  |  |  |      move.w d2,106(a2)
    squares[3].Vertices[3].X = xs1;
    4f20:	|                                                                                   |  |  |  |  |  |  |      move.w 66(sp),108(a2)
    squares[3].Vertices[3].Y = ys1;
    4f26:	|                                                                                   |  |  |  |  |  |  |      move.w 68(sp),110(a2)
    squares[3].DotProduct = vf3dotprod;
    4f2c:	|                                                                                   |  |  |  |  |  |  |      move.l 118(sp),112(a2)
    squares[3].Color = 2;
    4f32:	|                                                                                   |  |  |  |  |  |  |      move.w #2,126(a2)
    squares[4].Vertices[0].X = xs6;
    4f38:	|                                                                                   |  |  |  |  |  |  |      move.w d6,128(a2)
    squares[4].Vertices[0].Y = ys6;
    4f3c:	|                                                                                   |  |  |  |  |  |  |      move.w d5,130(a2)
    squares[4].Vertices[1].X = xs4;
    4f40:	|                                                                                   |  |  |  |  |  |  |      move.w a1,132(a2)
    squares[4].Vertices[1].Y = ys4;
    4f44:	|                                                                                   |  |  |  |  |  |  |      move.w d4,134(a2)
    squares[4].Vertices[2].X = xs0;
    4f48:	|                                                                                   |  |  |  |  |  |  |      move.w 62(sp),136(a2)
    squares[4].Vertices[2].Y = ys0;
    4f4e:	|                                                                                   |  |  |  |  |  |  |      move.w 64(sp),138(a2)
    squares[4].Vertices[3].X = xs2;
    4f54:	|                                                                                   |  |  |  |  |  |  |      move.w 72(sp),140(a2)
    squares[4].Vertices[3].Y = ys2;
    4f5a:	|                                                                                   |  |  |  |  |  |  |      move.w 76(sp),142(a2)
    squares[4].DotProduct = vf4dotprod;
    4f60:	|                                                                                   |  |  |  |  |  |  |      move.l 90(sp),144(a2)
    squares[4].Color = 3;
    4f66:	|                                                                                   |  |  |  |  |  |  |      move.w #3,158(a2)
    squares[5].Vertices[0].X = xs7;
    4f6c:	|                                                                                   |  |  |  |  |  |  |      move.w a5,160(a2)
    squares[5].Vertices[0].Y = ys7;
    4f70:	|                                                                                   |  |  |  |  |  |  |      move.w d3,162(a2)
    squares[5].Vertices[1].X = xs3;
    4f74:	|                                                                                   |  |  |  |  |  |  |      move.w 80(sp),164(a2)
    squares[5].Vertices[1].Y = ys3;
    4f7a:	|                                                                                   |  |  |  |  |  |  |      move.w 86(sp),166(a2)
    squares[5].Vertices[2].X = xs1;
    4f80:	|                                                                                   |  |  |  |  |  |  |      move.w 66(sp),168(a2)
    squares[5].Vertices[2].Y = ys1;
    4f86:	|                                                                                   |  |  |  |  |  |  |      move.w 68(sp),170(a2)
    squares[5].Vertices[3].X = xs5;
    4f8c:	|                                                                                   |  |  |  |  |  |  |      move.w a4,172(a2)
    squares[5].Vertices[3].Y = ys5;
    4f90:	|                                                                                   |  |  |  |  |  |  |      move.w d2,174(a2)
    squares[5].DotProduct = vf5dotprod;      
    4f94:	|                                                                                   |  |  |  |  |  |  |      move.l 98(sp),176(a2)
    squares[5].Color = 3; 
    4f9a:	|                                                                                   |  |  |  |  |  |  |      move.w #3,190(a2)
    vectors += 8*3;  
    4fa0:	|                                                                                   |  |  |  |  |  |  |      lea 48(a3),a3
  for(UWORD i=0;i<cubecount;i++) 
    4fa4:	|                                                                                   |  |  |  |  |  |  |      move.l 94(sp),d3
    4fa8:	|                                                                                   |  |  |  |  |  |  |      lea 192(a2),a2
    4fac:	|                                                                                   |  |  |  |  |  |  |      cmp.l 128(sp),d3
    4fb0:	\-----------------------------------------------------------------------------------|--|--|--|--|--|--|----- beq.w 4330 <DrawCube3d+0x400>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    4fb4:	                                                                                    |  |  |  |  |  |  |      move.l d3,d5
    4fb6:	                                                                                    |  |  |  |  |  |  |      add.l d3,d5
    4fb8:	                                                                                    |  |  |  |  |  |  |      move.l d5,54(sp)
    4fbc:	                                                                                    |  |  |  |  |  |  |      move.l d5,d2
    4fbe:	                                                                                    |  |  |  |  |  |  |      add.l d3,d2
    4fc0:	                                                                                    |  |  |  |  |  |  |      add.l d2,d2
    4fc2:	                                                                                    |  |  |  |  |  |  |      add.l d2,d2
    4fc4:	                                                                                    |  |  |  |  |  |  |      movea.l 971da <ClearBuffer>,a0
    4fca:	                                                                                    |  |  |  |  |  |  |      adda.l d2,a0
    4fcc:	                                                                                    |  |  |  |  |  |  |      movea.w 14(a0),a0
    4fd0:	                                                                                    |  |  |  |  |  |  |      move.l a0,-(sp)
    4fd2:	                                                                                    |  |  |  |  |  |  |      movea.l 112(sp),a0
    4fd6:	                                                                                    |  |  |  |  |  |  |      jsr (a0)
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    4fd8:	                                                                                    |  |  |  |  |  |  |      movea.l 971da <ClearBuffer>,a5
    4fde:	                                                                                    |  |  |  |  |  |  |      move.l (4,a5,d2.l),d4
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    4fe2:	                                                                                    |  |  |  |  |  |  |      addq.l #4,sp
    4fe4:	                                                                                    |  |  \--|--|--|--|----- beq.w 4b78 <DrawCube3d+0xc48>
    4fe8:	                                                                                    |  \-----|--|--|--|----> tst.w 971ec <DoNotClearDirty>
    4fee:	                                                                                    |        |  |  |  |  /-- beq.s 505e <DrawCube3d+0x112e>
    4ff0:	                                                                                    |        |  |  |  |  |   move.l d3,d2
    4ff2:	                                                                                    |        |  |  |  |  |   addq.l #1,d2
    4ff4:	                                                                                    |        |  |  |  |  |   move.l d2,94(sp)
    4ff8:	                                                                                    +--------|--|--|--|--|-- bra.w 4b80 <DrawCube3d+0xc50>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4ffc:	                                                                                    |        |  |  |  \--|-> move.l 94(sp),d0
    5000:	                                                                                    |        |  |  |     |   add.l d0,d0
    5002:	                                                                                    |        |  |  |     |   add.l 94(sp),d0
    5006:	                                                                                    |        |  |  |     |   add.l d0,d0
    5008:	                                                                                    |        |  |  |     |   add.l d0,d0
    500a:	                                                                                    |        |  |  |     |   movea.w (0,a5,d0.l),a5
    500e:	                                                                                    |        |  |  |     |   move.l a5,-(sp)
    5010:	                                                                                    |        |  |  |     |   move.l d4,-(sp)
    5012:	                                                                                    |        |  |  |     |   jsr 223a <ClearDirtyArea>(pc)
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    5016:	                                                                                    |        |  |  |     |   movea.l 971da <ClearBuffer>,a5
    501c:	                                                                                    |        |  |  |     |   addq.l #8,sp
    501e:	                                                                                    |        |  |  \-----|-- bra.w 4cae <DrawCube3d+0xd7e>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    5022:	                                                                                    |        |  \--------|-> move.l 94(sp),d0
    5026:	                                                                                    |        |           |   add.l d0,d0
    5028:	                                                                                    |        |           |   add.l 94(sp),d0
    502c:	                                                                                    |        |           |   add.l d0,d0
    502e:	                                                                                    |        |           |   add.l d0,d0
    5030:	                                                                                    |        |           |   movea.w (0,a5,d0.l),a5
    5034:	                                                                                    |        |           |   move.l a5,-(sp)
    5036:	                                                                                    |        |           |   move.l d4,-(sp)
    5038:	                                                                                    |        |           |   move.l a0,58(sp)
    503c:	                                                                                    |        |           |   move.l a1,54(sp)
    5040:	                                                                                    |        |           |   jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    5044:	                                                                                    |        |           |   addi.l #16384,d4
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    504a:	                                                                                    |        |           |   movea.l 971da <ClearBuffer>,a5
    5050:	                                                                                    |        |           |   addq.l #8,sp
    5052:	                                                                                    |        |           |   movea.l 46(sp),a1
    5056:	                                                                                    |        |           |   movea.l 50(sp),a0
    505a:	                                                                                    |        \-----------|-- bra.w 4c3e <DrawCube3d+0xd0e>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    505e:	                                                                                    |                    \-> move.l d3,d5
    5060:	                                                                                    |                        addq.l #1,d5
    5062:	                                                                                    |                        move.l d5,94(sp)
    5066:	                                                                                    |                        move.l d5,d0
    5068:	                                                                                    |                        add.l d5,d0
    506a:	                                                                                    |                        add.l d5,d0
    506c:	                                                                                    |                        add.l d0,d0
    506e:	                                                                                    |                        add.l d0,d0
    5070:	                                                                                    |                        movea.w (0,a5,d0.l),a5
    5074:	                                                                                    |                        move.l a5,-(sp)
    5076:	                                                                                    |                        move.l d4,-(sp)
    5078:	                                                                                    |                        jsr 223a <ClearDirtyArea>(pc)
      clearpos += 64*BPLHEIGHT;
    507c:	                                                                                    |                        addi.l #16384,d4
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    5082:	                                                                                    |                        movea.l 971da <ClearBuffer>,a5
    5088:	                                                                                    |                        addq.l #8,sp
    508a:	                                                                                    \----------------------- bra.w 4b80 <DrawCube3d+0xc50>

0000508e <SmartLineFill>:

inline void SmartLineFill(UWORD startx, UWORD starty, WORD height, UWORD length, UWORD minterm,  UWORD bltwidth, UWORD bltstart) {
    508e:	             movem.l d2-d7/a2-a3,-(sp)
    5092:	             movea.l 36(sp),a0
    5096:	             move.l 44(sp),d3
    509a:	             move.l 48(sp),d1
    509e:	             movea.l 52(sp),a3
    50a2:	             move.l 56(sp),d4
    50a6:	             move.l 60(sp),d2
    50aa:	             move.w d3,d7
  
  volatile struct Custom *custom = (struct Custom*)0xdff000;  

  UWORD startyoffset = starty*64;
    50ac:	             move.l 40(sp),d0
    50b0:	             lsl.w #6,d0
  WORD direction = 64;
  if( height < 0) {
    direction = -64;   
    startyoffset -= (height + 1) * 64;    
    height *= -1;
    50b2:	             move.w d3,d5
  if( height < 0) {
    50b4:	      /----- bmi.w 5194 <SmartLineFill+0x106>
    50b8:	      |      movea.w #64,a1
  }
  
  UWORD targetbufferoffset = bltstart + startyoffset;
    50bc:	      |      move.w d0,d3
    50be:	      |      add.w d2,d3
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    50c0:	      |      moveq #0,d0
    50c2:	      |      move.w a0,d0
    50c4:	      |      andi.l #65535,d2
    50ca:	      |      lsl.l #3,d2
    50cc:	      |      movea.l d0,a0
    50ce:	      |      suba.l d2,a0
    50d0:	      |      move.l a0,d0
    50d2:	      |      add.l a0,d0
    50d4:	      |      add.l d0,d0
    50d6:	      |      add.l a0,d0
    50d8:	      |      move.l d0,d2
    50da:	      |      lsl.l #4,d2
    50dc:	      |      sub.l d0,d2
    50de:	      |      lsl.l #4,d2
  
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    50e0:	      |      andi.l #65535,d1
    50e6:	      |      subq.l #1,d1
    50e8:	      |      move.l d1,d0
    50ea:	      |      add.l d1,d0
    50ec:	      |      add.l d1,d0
    50ee:	      |      move.l d0,d6
    50f0:	      |      lsl.l #5,d6
    50f2:	      |      add.l d6,d0
    50f4:	      |      movea.l d0,a0
    50f6:	      |      adda.l d1,a0
    50f8:	      |      lea (-1,a0,d7.w),a0
    50fc:	      |      adda.l a0,a0
    50fe:	      |      lea 44756 <LookupSlope.lto_priv.1>,a2
    5104:	      |      move.w d4,d0
    5106:	      |      add.w d4,d0
    5108:	      |      movea.w (0,a0,a2.l),a2
    510c:	      |      suba.w d0,a2
  WORD bltdmod = direction - 2 * bltwidth;
    510e:	      |      move.w a1,d7
    5110:	      |      sub.w d0,d7

  if( bltbmod < 0 ) {
    5112:	      |      clr.w d0
    5114:	      |      cmp.w a2,d0
    5116:	/-----|----- bgt.s 5180 <SmartLineFill+0xf2>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
  }  

  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    5118:	|  /--|----> move.w dff002 <_end+0xd67dce>,d0
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    511e:	|  |  |  /-> move.w dff002 <_end+0xd67dce>,d0
    5124:	|  |  |  |   btst #14,d0
    5128:	|  |  |  +-- bne.s 511e <SmartLineFill+0x90>

  custom->bltcon0 = BltCon0LineDraw | minterm;
    512a:	|  |  |  |   move.w 97230 <BltCon0LineDraw>,d0
    5130:	|  |  |  |   move.w a3,d1
    5132:	|  |  |  |   or.w d1,d0
    5134:	|  |  |  |   move.w d0,dff040 <_end+0xd67e0c>

  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    513a:	|  |  |  |   andi.l #65535,d3
    5140:	|  |  |  |   add.l 971de <PrepareBuffer>,d3
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    5146:	|  |  |  |   add.l 971e2 <LineBuffer>,d2
  custom->bltbpt = (UBYTE *)bltbpt;
    514c:	|  |  |  |   move.l d2,dff04c <_end+0xd67e18>
  custom->bltcpt = (UBYTE *)bltdpt;
    5152:	|  |  |  |   move.l d3,dff048 <_end+0xd67e14>
  custom->bltdpt = (UBYTE *)bltdpt;  
    5158:	|  |  |  |   move.l d3,dff054 <_end+0xd67e20>
  custom->bltbmod = bltbmod;
    515e:	|  |  |  |   move.w a2,dff062 <_end+0xd67e2e>
  custom->bltcmod = bltdmod;
    5164:	|  |  |  |   move.w d7,dff060 <_end+0xd67e2c>
  custom->bltdmod = bltdmod;
    516a:	|  |  |  |   move.w d7,dff066 <_end+0xd67e32>

  custom->bltsize = bltwidth + 64*height;
    5170:	|  |  |  |   lsl.w #6,d5
    5172:	|  |  |  |   add.w d5,d4
    5174:	|  |  |  |   move.w d4,dff058 <_end+0xd67e24>
}
    517a:	|  |  |  |   movem.l (sp)+,d2-d7/a2-a3
    517e:	|  |  |  |   rts
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    5180:	>--|--|--|-> pea 3d26d <incbin_MercuryLetterData2Lz4_end+0x17>
    5186:	|  |  |  |   jsr 605c <KPrintF>(pc)
    518a:	|  |  |  |   addq.l #4,sp
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    518c:	|  |  |  |   move.w dff002 <_end+0xd67dce>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    5192:	|  |  |  \-- bra.s 511e <SmartLineFill+0x90>
    startyoffset -= (height + 1) * 64;    
    5194:	|  |  \----> lsl.w #6,d5
    5196:	|  |         movea.w d5,a1
    5198:	|  |         lea 64(a1),a1
    519c:	|  |         sub.w a1,d0
    height *= -1;
    519e:	|  |         move.w d3,d5
    51a0:	|  |         neg.w d5
    51a2:	|  |         move.w d5,d7
    51a4:	|  |         movea.w #-64,a1
  UWORD targetbufferoffset = bltstart + startyoffset;
    51a8:	|  |         move.w d0,d3
    51aa:	|  |         add.w d2,d3
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    51ac:	|  |         moveq #0,d0
    51ae:	|  |         move.w a0,d0
    51b0:	|  |         andi.l #65535,d2
    51b6:	|  |         lsl.l #3,d2
    51b8:	|  |         movea.l d0,a0
    51ba:	|  |         suba.l d2,a0
    51bc:	|  |         move.l a0,d0
    51be:	|  |         add.l a0,d0
    51c0:	|  |         add.l d0,d0
    51c2:	|  |         add.l a0,d0
    51c4:	|  |         move.l d0,d2
    51c6:	|  |         lsl.l #4,d2
    51c8:	|  |         sub.l d0,d2
    51ca:	|  |         lsl.l #4,d2
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    51cc:	|  |         andi.l #65535,d1
    51d2:	|  |         subq.l #1,d1
    51d4:	|  |         move.l d1,d0
    51d6:	|  |         add.l d1,d0
    51d8:	|  |         add.l d1,d0
    51da:	|  |         move.l d0,d6
    51dc:	|  |         lsl.l #5,d6
    51de:	|  |         add.l d6,d0
    51e0:	|  |         movea.l d0,a0
    51e2:	|  |         adda.l d1,a0
    51e4:	|  |         lea (-1,a0,d7.w),a0
    51e8:	|  |         adda.l a0,a0
    51ea:	|  |         lea 44756 <LookupSlope.lto_priv.1>,a2
    51f0:	|  |         move.w d4,d0
    51f2:	|  |         add.w d4,d0
    51f4:	|  |         movea.w (0,a0,a2.l),a2
    51f8:	|  |         suba.w d0,a2
  WORD bltdmod = direction - 2 * bltwidth;
    51fa:	|  |         move.w a1,d7
    51fc:	|  |         sub.w d0,d7
  if( bltbmod < 0 ) {
    51fe:	|  |         clr.w d0
    5200:	|  |         cmp.w a2,d0
    5202:	|  \-------- ble.w 5118 <SmartLineFill+0x8a>
    5206:	\----------- bra.w 5180 <SmartLineFill+0xf2>

0000520a <PrepareDisplay>:


int PrepareDisplay() {
    520a:	    lea -164(sp),sp
    520e:	    movem.l d2-d3/a6,-(sp)

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
    5212:	    moveq #22,d0
    5214:	    move.l d0,172(sp)
    5218:	    move.l #65537,168(sp)
    5220:	    move.l 96d62 <SysBase>,d0
    5226:	    movea.l d0,a6
    5228:	    move.l 172(sp),d0
    522c:	    move.l 168(sp),d1
    5230:	    jsr -198(a6)
    5234:	    move.l d0,164(sp)
    5238:	    move.l 164(sp),d0
    523c:	    move.l d0,971f2 <Vbint>
    5242:	    move.l 971f2 <Vbint>,d0
    5248:	/-- beq.s 5288 <PrepareDisplay+0x7e>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    524a:	|   movea.l 971f2 <Vbint>,a0
    5250:	|   move.b #2,8(a0)
    Vbint->is_Node.ln_Pri = -60;
    5256:	|   movea.l 971f2 <Vbint>,a0
    525c:	|   move.b #-60,9(a0)
    Vbint->is_Node.ln_Name = "VertB-Example";
    5262:	|   movea.l 971f2 <Vbint>,a0
    5268:	|   move.l #57053,10(a0)
    Vbint->is_Data = NULL;
    5270:	|   movea.l 971f2 <Vbint>,a0
    5276:	|   clr.l 14(a0)
    Vbint->is_Code = VblankHandler;
    527a:	|   movea.l 971f2 <Vbint>,a0
    5280:	|   move.l #11180,18(a0)
  }

  AddIntServer( INTB_VERTB, Vbint); 
    5288:	\-> moveq #5,d0
    528a:	    move.l d0,160(sp)
    528e:	    move.l 971f2 <Vbint>,156(sp)
    5296:	    move.l 96d62 <SysBase>,d0
    529c:	    movea.l d0,a6
    529e:	    move.l 160(sp),d0
    52a2:	    movea.l 156(sp),a1
    52a6:	    jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
    52aa:	    move.l #25000,152(sp)
    52b2:	    clr.l 148(sp)
    52b6:	    move.l 96d62 <SysBase>,d0
    52bc:	    movea.l d0,a6
    52be:	    move.l 152(sp),d0
    52c2:	    move.l 148(sp),d1
    52c6:	    jsr -198(a6)
    52ca:	    move.l d0,144(sp)
    52ce:	    move.l 144(sp),d0
    52d2:	    move.l d0,971e6 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
    52d8:	    move.l #120000,140(sp)
    52e0:	    moveq #2,d0
    52e2:	    move.l d0,136(sp)
    52e6:	    move.l 96d62 <SysBase>,d0
    52ec:	    movea.l d0,a6
    52ee:	    move.l 140(sp),d0
    52f2:	    move.l 136(sp),d1
    52f6:	    jsr -198(a6)
    52fa:	    move.l d0,132(sp)
    52fe:	    move.l 132(sp),d0
    5302:	    move.l d0,971e2 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
    5308:	    move.l 971e2 <LineBuffer>,d0
    530e:	    clr.l -(sp)
    5310:	    pea 3 <_start+0x3>
    5314:	    pea 2710 <DrawScreen+0x47a>
    5318:	    clr.l -(sp)
    531a:	    move.l d0,-(sp)
    531c:	    jsr b8 <Utils_FillLong>(pc)
    5320:	    lea 20(sp),sp
  Utils_BlitterPrepare();
    5324:	    jsr 194 <Utils_BlitterPrepare>(pc)
  PrepareLineBuffer( LineBuffer);
    5328:	    move.l 971e2 <LineBuffer>,d0
    532e:	    move.l d0,-(sp)
    5330:	    jsr 3664 <PrepareLineBuffer>(pc)
    5334:	    addq.l #4,sp

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
    5336:	    move.l #33024,128(sp)
    533e:	    moveq #2,d0
    5340:	    move.l d0,124(sp)
    5344:	    move.l 96d62 <SysBase>,d0
    534a:	    movea.l d0,a6
    534c:	    move.l 128(sp),d0
    5350:	    move.l 124(sp),d1
    5354:	    jsr -198(a6)
    5358:	    move.l d0,120(sp)
    535c:	    move.l 120(sp),d0
    5360:	    move.l d0,971de <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
    5366:	    move.l 971de <PrepareBuffer>,d0
    536c:	    clr.l -(sp)
    536e:	    pea 10 <_start+0x10>
    5372:	    pea 204 <Utils_DrawLinePrepare+0x3c>
    5376:	    clr.l -(sp)
    5378:	    move.l d0,-(sp)
    537a:	    jsr b8 <Utils_FillLong>(pc)
    537e:	    lea 20(sp),sp
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
    5382:	    move.l 971de <PrepareBuffer>,d0
    5388:	    clr.l -(sp)
    538a:	    pea 2 <_start+0x2>
    538e:	    pea 100 <Utils_FillLong+0x48>
    5392:	    pea 200 <Utils_DrawLinePrepare+0x38>
    5396:	    pea 3d29e <incbin_MercuryLetterData2Lz4_end+0x48>
    539c:	    move.l d0,-(sp)
    539e:	    jsr 63d6 <debug_register_bitmap>(pc)
    53a2:	    lea 24(sp),sp

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
    53a6:	    move.l #49536,116(sp)
    53ae:	    moveq #2,d0
    53b0:	    move.l d0,112(sp)
    53b4:	    move.l 96d62 <SysBase>,d0
    53ba:	    movea.l d0,a6
    53bc:	    move.l 116(sp),d0
    53c0:	    move.l 112(sp),d1
    53c4:	    jsr -198(a6)
    53c8:	    move.l d0,108(sp)
    53cc:	    move.l 108(sp),d0
    53d0:	    move.l d0,9711e <Bitmap1>
  if(Bitmap1 == 0) {
    53d6:	    move.l 9711e <Bitmap1>,d0
    53dc:	/-- bne.s 5436 <PrepareDisplay+0x22c>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    53de:	|   move.l 96d6a <DOSBase>,d0
    53e4:	|   movea.l d0,a6
    53e6:	|   jsr -60(a6)
    53ea:	|   move.l d0,104(sp)
    53ee:	|   move.l 104(sp),d0
    53f2:	|   move.l d0,100(sp)
    53f6:	|   move.l #250538,96(sp)
    53fe:	|   moveq #38,d0
    5400:	|   move.l d0,92(sp)
    5404:	|   move.l 96d6a <DOSBase>,d0
    540a:	|   movea.l d0,a6
    540c:	|   move.l 100(sp),d1
    5410:	|   move.l 96(sp),d2
    5414:	|   move.l 92(sp),d3
    5418:	|   jsr -48(a6)
    541c:	|   move.l d0,88(sp)
    Exit(1);
    5420:	|   moveq #1,d0
    5422:	|   move.l d0,84(sp)
    5426:	|   move.l 96d6a <DOSBase>,d0
    542c:	|   movea.l d0,a6
    542e:	|   move.l 84(sp),d1
    5432:	|   jsr -144(a6)
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
    5436:	\-> move.l 9711e <Bitmap1>,d0
    543c:	    clr.l -(sp)
    543e:	    pea 3 <_start+0x3>
    5442:	    pea 100 <Utils_FillLong+0x48>
    5446:	    pea 200 <Utils_DrawLinePrepare+0x38>
    544a:	    pea 3d2cf <incbin_MercuryLetterData2Lz4_end+0x79>
    5450:	    move.l d0,-(sp)
    5452:	    jsr 63d6 <debug_register_bitmap>(pc)
    5456:	    lea 24(sp),sp
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
    545a:	    move.l 9711e <Bitmap1>,d0
    5460:	    clr.l -(sp)
    5462:	    pea 10 <_start+0x10>
    5466:	    pea 306 <Utils_CopyBlitReverse+0x68>
    546a:	    clr.l -(sp)
    546c:	    move.l d0,-(sp)
    546e:	    jsr b8 <Utils_FillLong>(pc)
    5472:	    lea 20(sp),sp

  ScreenBuffer1.BitPlane = Bitmap1;
    5476:	    move.l 9711e <Bitmap1>,d0
    547c:	    move.l d0,9712a <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
    5482:	    clr.l 9712e <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
    5488:	    clr.l 9713a <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
    548e:	    move.l #49536,80(sp)
    5496:	    moveq #2,d0
    5498:	    move.l d0,76(sp)
    549c:	    move.l 96d62 <SysBase>,d0
    54a2:	    movea.l d0,a6
    54a4:	    move.l 80(sp),d0
    54a8:	    move.l 76(sp),d1
    54ac:	    jsr -198(a6)
    54b0:	    move.l d0,72(sp)
    54b4:	    move.l 72(sp),d0
    54b8:	    move.l d0,97122 <Bitmap2>
  if(Bitmap2 == 0) {
    54be:	    move.l 97122 <Bitmap2>,d0
    54c4:	/-- bne.s 551e <PrepareDisplay+0x314>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    54c6:	|   move.l 96d6a <DOSBase>,d0
    54cc:	|   movea.l d0,a6
    54ce:	|   jsr -60(a6)
    54d2:	|   move.l d0,68(sp)
    54d6:	|   move.l 68(sp),d0
    54da:	|   move.l d0,64(sp)
    54de:	|   move.l #250587,60(sp)
    54e6:	|   moveq #38,d0
    54e8:	|   move.l d0,56(sp)
    54ec:	|   move.l 96d6a <DOSBase>,d0
    54f2:	|   movea.l d0,a6
    54f4:	|   move.l 64(sp),d1
    54f8:	|   move.l 60(sp),d2
    54fc:	|   move.l 56(sp),d3
    5500:	|   jsr -48(a6)
    5504:	|   move.l d0,52(sp)
    Exit(1);
    5508:	|   moveq #1,d0
    550a:	|   move.l d0,48(sp)
    550e:	|   move.l 96d6a <DOSBase>,d0
    5514:	|   movea.l d0,a6
    5516:	|   move.l 48(sp),d1
    551a:	|   jsr -144(a6)
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
    551e:	\-> move.l 97122 <Bitmap2>,d0
    5524:	    clr.l -(sp)
    5526:	    pea 3 <_start+0x3>
    552a:	    pea 100 <Utils_FillLong+0x48>
    552e:	    pea 200 <Utils_DrawLinePrepare+0x38>
    5532:	    pea 3d300 <incbin_MercuryLetterData2Lz4_end+0xaa>
    5538:	    move.l d0,-(sp)
    553a:	    jsr 63d6 <debug_register_bitmap>(pc)
    553e:	    lea 24(sp),sp
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
    5542:	    move.l 97122 <Bitmap2>,d0
    5548:	    clr.l -(sp)
    554a:	    pea 10 <_start+0x10>
    554e:	    pea 306 <Utils_CopyBlitReverse+0x68>
    5552:	    clr.l -(sp)
    5554:	    move.l d0,-(sp)
    5556:	    jsr b8 <Utils_FillLong>(pc)
    555a:	    lea 20(sp),sp

  ScreenBuffer2.BitPlane = Bitmap2;
    555e:	    move.l 97122 <Bitmap2>,d0
    5564:	    move.l d0,97162 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
    556a:	    clr.l 97166 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
    5570:	    clr.l 97172 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
    5576:	    move.l #49536,44(sp)
    557e:	    moveq #2,d0
    5580:	    move.l d0,40(sp)
    5584:	    move.l 96d62 <SysBase>,d0
    558a:	    movea.l d0,a6
    558c:	    move.l 44(sp),d0
    5590:	    move.l 40(sp),d1
    5594:	    jsr -198(a6)
    5598:	    move.l d0,36(sp)
    559c:	    move.l 36(sp),d0
    55a0:	    move.l d0,97126 <Bitmap3>
  if(Bitmap3 == 0) {
    55a6:	    move.l 97126 <Bitmap3>,d0
    55ac:	/-- bne.s 5606 <PrepareDisplay+0x3fc>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    55ae:	|   move.l 96d6a <DOSBase>,d0
    55b4:	|   movea.l d0,a6
    55b6:	|   jsr -60(a6)
    55ba:	|   move.l d0,32(sp)
    55be:	|   move.l 32(sp),d0
    55c2:	|   move.l d0,28(sp)
    55c6:	|   move.l #250636,24(sp)
    55ce:	|   moveq #38,d0
    55d0:	|   move.l d0,20(sp)
    55d4:	|   move.l 96d6a <DOSBase>,d0
    55da:	|   movea.l d0,a6
    55dc:	|   move.l 28(sp),d1
    55e0:	|   move.l 24(sp),d2
    55e4:	|   move.l 20(sp),d3
    55e8:	|   jsr -48(a6)
    55ec:	|   move.l d0,16(sp)
    Exit(1);
    55f0:	|   moveq #1,d0
    55f2:	|   move.l d0,12(sp)
    55f6:	|   move.l 96d6a <DOSBase>,d0
    55fc:	|   movea.l d0,a6
    55fe:	|   move.l 12(sp),d1
    5602:	|   jsr -144(a6)
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
    5606:	\-> move.l 97126 <Bitmap3>,d0
    560c:	    clr.l -(sp)
    560e:	    pea 3 <_start+0x3>
    5612:	    pea 100 <Utils_FillLong+0x48>
    5616:	    pea 200 <Utils_DrawLinePrepare+0x38>
    561a:	    pea 3d331 <incbin_MercuryLetterData2Lz4_end+0xdb>
    5620:	    move.l d0,-(sp)
    5622:	    jsr 63d6 <debug_register_bitmap>(pc)
    5626:	    lea 24(sp),sp
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
    562a:	    move.l 97126 <Bitmap3>,d0
    5630:	    clr.l -(sp)
    5632:	    pea 10 <_start+0x10>
    5636:	    pea 306 <Utils_CopyBlitReverse+0x68>
    563a:	    clr.l -(sp)
    563c:	    move.l d0,-(sp)
    563e:	    jsr b8 <Utils_FillLong>(pc)
    5642:	    lea 20(sp),sp

  ScreenBuffer3.BitPlane = Bitmap3;
    5646:	    move.l 97126 <Bitmap3>,d0
    564c:	    move.l d0,9719a <ScreenBuffer3>
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
    5652:	    clr.l 9719e <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
    5658:	    clr.l 971aa <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
    565e:	    jsr 599c <Clbuild>(pc)
    5662:	    move.l d0,97116 <ViewCopper>
  DrawCopper = Clbuild( );
    5668:	    jsr 599c <Clbuild>(pc)
    566c:	    move.l d0,9711a <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
    5672:	    move.l #618794,971f6 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
    567c:	    move.l #618850,971fa <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
    5686:	    move.l #618906,971fe <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
    5690:	    move.l #618906,97202 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
    569a:	    move.l #618794,97206 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
    56a4:	    move.l #618850,9720a <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
    56ae:	    move.l #618850,9720e <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
    56b8:	    move.l #618906,97212 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
    56c2:	    move.l #618794,97216 <ScreenBufferList+0x20>

  SetBplPointers(); 
    56cc:	    jsr 5cfc <SetBplPointers>(pc)
  SwapCl();
    56d0:	    jsr 5966 <SwapCl>(pc)
  //ptrvector = VectorsMercury1;  

  /*Utils_ReadFile(&"tek_cube_data.bin", VectorBuffer );
  Utils_ReadFile(&"tek_letter_data.bin", LetterBuffer);*/

  return 0;
    56d4:	    moveq #0,d0
}
    56d6:	    movem.l (sp)+,d2-d3/a6
    56da:	    lea 164(sp),sp
    56de:	    rts

000056e0 <CleanUp>:

void CleanUp() {
    56e0:	lea -72(sp),sp
    56e4:	move.l a6,-(sp)
  FreeMem(WorkingMem, 25000);
    56e6:	move.l 971e6 <WorkingMem>,72(sp)
    56ee:	move.l #25000,68(sp)
    56f6:	move.l 96d62 <SysBase>,d0
    56fc:	movea.l d0,a6
    56fe:	movea.l 72(sp),a1
    5702:	move.l 68(sp),d0
    5706:	jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
    570a:	move.l 971e2 <LineBuffer>,64(sp)
    5712:	move.l #120000,60(sp)
    571a:	move.l 96d62 <SysBase>,d0
    5720:	movea.l d0,a6
    5722:	movea.l 64(sp),a1
    5726:	move.l 60(sp),d0
    572a:	jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
    572e:	move.l 971de <PrepareBuffer>,56(sp)
    5736:	move.l #33024,52(sp)
    573e:	move.l 96d62 <SysBase>,d0
    5744:	movea.l d0,a6
    5746:	movea.l 56(sp),a1
    574a:	move.l 52(sp),d0
    574e:	jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
    5752:	move.l 9711e <Bitmap1>,48(sp)
    575a:	move.l #49536,44(sp)
    5762:	move.l 96d62 <SysBase>,d0
    5768:	movea.l d0,a6
    576a:	movea.l 48(sp),a1
    576e:	move.l 44(sp),d0
    5772:	jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
    5776:	move.l 97122 <Bitmap2>,40(sp)
    577e:	move.l #49536,36(sp)
    5786:	move.l 96d62 <SysBase>,d0
    578c:	movea.l d0,a6
    578e:	movea.l 40(sp),a1
    5792:	move.l 36(sp),d0
    5796:	jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
    579a:	move.l 97126 <Bitmap3>,32(sp)
    57a2:	move.l #49536,28(sp)
    57aa:	move.l 96d62 <SysBase>,d0
    57b0:	movea.l d0,a6
    57b2:	movea.l 32(sp),a1
    57b6:	move.l 28(sp),d0
    57ba:	jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
    57be:	move.l 9711a <DrawCopper>,24(sp)
    57c6:	move.l #1360,20(sp)
    57ce:	move.l 96d62 <SysBase>,d0
    57d4:	movea.l d0,a6
    57d6:	movea.l 24(sp),a1
    57da:	move.l 20(sp),d0
    57de:	jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
    57e2:	move.l 97116 <ViewCopper>,16(sp)
    57ea:	move.l #1360,12(sp)
    57f2:	move.l 96d62 <SysBase>,d0
    57f8:	movea.l d0,a6
    57fa:	movea.l 16(sp),a1
    57fe:	move.l 12(sp),d0
    5802:	jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
    5806:	moveq #5,d0
    5808:	move.l d0,8(sp)
    580c:	move.l 971f2 <Vbint>,4(sp)
    5814:	move.l 96d62 <SysBase>,d0
    581a:	movea.l d0,a6
    581c:	move.l 8(sp),d0
    5820:	movea.l 4(sp),a1
    5824:	jsr -174(a6)
}
    5828:	nop
    582a:	movea.l (sp)+,a6
    582c:	lea 72(sp),sp
    5830:	rts

00005832 <LoadVectors>:


void LoadVectors( WORD *source, BYTE *source2, WORD *target)
{
    5832:	       move.l a3,-(sp)
    5834:	       move.l a2,-(sp)
    5836:	       movea.l 12(sp),a2
    583a:	       movea.l 16(sp),a1
    583e:	       movea.l 20(sp),a3
  WORD *targetstart = target;

  while( *source != 127) {
    5842:	       move.w (a2),d0
    5844:	       movea.l a3,a0
    5846:	       cmpi.w #127,d0
    584a:	/----- beq.s 58a0 <LoadVectors+0x6e>
    *target++ = *source++;
    584c:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    584e:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    5854:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    585a:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    5860:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    5866:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    586c:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    5872:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    5878:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    587e:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    5884:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    588a:	|  |   lea 24(a2),a2
    588e:	|  |   lea 24(a0),a0
    5892:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    5898:	|  |   move.w (a2),d0
    589a:	|  |   cmpi.w #127,d0
    589e:	|  \-- bne.s 584c <LoadVectors+0x1a>
  }
  
  WORD *base = targetstart;

  while( *source2 != 127) {  
    58a0:	\----> move.b (a1),d0
    58a2:	       cmpi.b #127,d0
    58a6:	/----- beq.w 5960 <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    58aa:	|  /-> ext.w d0
    58ac:	|  |   add.w (a3),d0
    58ae:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    58b0:	|  |   move.b 1(a1),d0
    58b4:	|  |   ext.w d0
    58b6:	|  |   add.w 2(a3),d0
    58ba:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    58be:	|  |   move.b 2(a1),d0
    58c2:	|  |   ext.w d0
    58c4:	|  |   add.w 4(a3),d0
    58c8:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    58cc:	|  |   move.b 3(a1),d0
    58d0:	|  |   ext.w d0
    58d2:	|  |   add.w 6(a3),d0
    58d6:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    58da:	|  |   move.b 4(a1),d0
    58de:	|  |   ext.w d0
    58e0:	|  |   add.w 8(a3),d0
    58e4:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    58e8:	|  |   move.b 5(a1),d0
    58ec:	|  |   ext.w d0
    58ee:	|  |   add.w 10(a3),d0
    58f2:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    58f6:	|  |   move.b 6(a1),d0
    58fa:	|  |   ext.w d0
    58fc:	|  |   add.w 12(a3),d0
    5900:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    5904:	|  |   move.b 7(a1),d0
    5908:	|  |   ext.w d0
    590a:	|  |   add.w 14(a3),d0
    590e:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    5912:	|  |   move.b 8(a1),d0
    5916:	|  |   ext.w d0
    5918:	|  |   add.w 16(a3),d0
    591c:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    5920:	|  |   move.b 9(a1),d0
    5924:	|  |   ext.w d0
    5926:	|  |   add.w 18(a3),d0
    592a:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    592e:	|  |   move.b 10(a1),d0
    5932:	|  |   ext.w d0
    5934:	|  |   add.w 20(a3),d0
    5938:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    593c:	|  |   lea 24(a3),a3
    5940:	|  |   lea 12(a1),a1
    5944:	|  |   lea 24(a0),a0
    5948:	|  |   move.b -1(a1),d0
    594c:	|  |   ext.w d0
    594e:	|  |   add.w -2(a3),d0
    5952:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    5956:	|  |   move.b (a1),d0
    5958:	|  |   cmpi.b #127,d0
    595c:	|  \-- bne.w 58aa <LoadVectors+0x78>
  }

}
    5960:	\----> movea.l (sp)+,a2
    5962:	       movea.l (sp)+,a3
    5964:	       rts

00005966 <SwapCl>:

void SwapCl() 
{
    5966:	subq.l #8,sp

  volatile struct Custom *custom = (struct Custom*)0xdff000;
    5968:	move.l #14675968,4(sp)
  UBYTE *tmp = DrawCopper;
    5970:	move.l 9711a <DrawCopper>,(sp)
  DrawCopper = ViewCopper;
    5976:	move.l 97116 <ViewCopper>,d0
    597c:	move.l d0,9711a <DrawCopper>
  ViewCopper = tmp;
    5982:	move.l (sp),97116 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
    5988:	move.l 97116 <ViewCopper>,d0
    598e:	movea.l 4(sp),a0
    5992:	move.l d0,128(a0)
  //custom->copjmp1 = tmp;
}
    5996:	nop
    5998:	addq.l #8,sp
    599a:	rts

0000599c <Clbuild>:

UBYTE * Clbuild() {
    599c:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    59a0:	    movea.l 96d62 <SysBase>,a6
    59a6:	    move.l #1360,d0
    59ac:	    moveq #2,d1
    59ae:	    jsr -198(a6)
    59b2:	    movea.l d0,a2
  
  if( retval == 0) {
    59b4:	    tst.l d0
    59b6:	/-- beq.w 5b46 <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    59ba:	|   move.l 72eac <ClsSprites>,(a2)
    59c0:	|   move.l 72eb0 <ClsSprites+0x4>,4(a2)
    59c8:	|   move.l 72eb4 <ClsSprites+0x8>,8(a2)
    59d0:	|   move.l 72eb8 <ClsSprites+0xc>,12(a2)
    59d8:	|   move.l 72ebc <ClsSprites+0x10>,16(a2)
    59e0:	|   move.l 72ec0 <ClsSprites+0x14>,20(a2)
    59e8:	|   move.l 72ec4 <ClsSprites+0x18>,24(a2)
    59f0:	|   move.l 72ec8 <ClsSprites+0x1c>,28(a2)
    59f8:	|   move.l 72ecc <ClsSprites+0x20>,32(a2)
    5a00:	|   move.l 72ed0 <ClsSprites+0x24>,36(a2)
    5a08:	|   move.l 72ed4 <ClsSprites+0x28>,40(a2)
    5a10:	|   move.l 72ed8 <ClsSprites+0x2c>,44(a2)
    5a18:	|   move.l 72edc <ClsSprites+0x30>,48(a2)
    5a20:	|   move.l 72ee0 <ClsSprites+0x34>,52(a2)
    5a28:	|   move.l 72ee4 <ClsSprites+0x38>,56(a2)
    5a30:	|   move.l 72ee8 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    5a38:	|   move.l 72eec <ClScreen>,64(a2)
    5a40:	|   move.l 72ef0 <ClScreen+0x4>,68(a2)
    5a48:	|   move.l 72ef4 <ClScreen+0x8>,72(a2)
    5a50:	|   move.l 72ef8 <ClScreen+0xc>,76(a2)
    5a58:	|   move.l 72efc <ClScreen+0x10>,80(a2)
    5a60:	|   move.l 72f00 <ClScreen+0x14>,84(a2)
    5a68:	|   move.l 72f04 <ClScreen+0x18>,88(a2)
    5a70:	|   move.l 72f08 <ClScreen+0x1c>,92(a2)
    5a78:	|   move.l 72f0c <ClScreen+0x20>,96(a2)
    5a80:	|   move.l 72f10 <ClScreen+0x24>,100(a2)
    5a88:	|   move.l 72f14 <ClScreen+0x28>,104(a2)
    5a90:	|   move.l 72f18 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    5a98:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    5aa0:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    5aa8:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    5ab0:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    5ab8:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    5ac0:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    5ac8:	|   move.l 72f1c <ClColor>,136(a2)
    5ad0:	|   move.l 72f20 <ClColor+0x4>,140(a2)
    5ad8:	|   move.l 72f24 <ClColor+0x8>,144(a2)
    5ae0:	|   move.l 72f28 <ClColor+0xc>,148(a2)
    5ae8:	|   move.l 72f2c <ClColor+0x10>,152(a2)
    5af0:	|   move.l 72f30 <ClColor+0x14>,156(a2)
    5af8:	|   move.l 72f34 <ClColor+0x18>,160(a2)
    5b00:	|   move.l 72f38 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    5b08:	|   move.l 72f3c <ClToggleBitPlanes>,168(a2)
    5b10:	|   move.l 72f40 <ClToggleBitPlanes+0x4>,172(a2)
    5b18:	|   move.l 72f44 <ClToggleBitPlanes+0x8>,176(a2)
    5b20:	|   move.l 72f48 <ClToggleBitPlanes+0xc>,180(a2)
    5b28:	|   move.l 72f4c <ClToggleBitPlanes+0x10>,184(a2)
    5b30:	|   move.l 72f50 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    5b38:	|   moveq #-2,d0
    5b3a:	|   move.l d0,192(a2)
  return retval;  
}
    5b3e:	|   move.l a2,d0
    5b40:	|   movem.l (sp)+,d2-d3/a2/a6
    5b44:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    5b46:	\-> movea.l 96d6a <DOSBase>,a6
    5b4c:	    jsr -60(a6)
    5b50:	    movea.l 96d6a <DOSBase>,a6
    5b56:	    move.l d0,d1
    5b58:	    move.l #56915,d2
    5b5e:	    moveq #40,d3
    5b60:	    jsr -48(a6)
    Exit(1);
    5b64:	    movea.l 96d6a <DOSBase>,a6
    5b6a:	    moveq #1,d1
    5b6c:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    5b70:	    move.l 72eac <ClsSprites>,(a2)
    5b76:	    move.l 72eb0 <ClsSprites+0x4>,4(a2)
    5b7e:	    move.l 72eb4 <ClsSprites+0x8>,8(a2)
    5b86:	    move.l 72eb8 <ClsSprites+0xc>,12(a2)
    5b8e:	    move.l 72ebc <ClsSprites+0x10>,16(a2)
    5b96:	    move.l 72ec0 <ClsSprites+0x14>,20(a2)
    5b9e:	    move.l 72ec4 <ClsSprites+0x18>,24(a2)
    5ba6:	    move.l 72ec8 <ClsSprites+0x1c>,28(a2)
    5bae:	    move.l 72ecc <ClsSprites+0x20>,32(a2)
    5bb6:	    move.l 72ed0 <ClsSprites+0x24>,36(a2)
    5bbe:	    move.l 72ed4 <ClsSprites+0x28>,40(a2)
    5bc6:	    move.l 72ed8 <ClsSprites+0x2c>,44(a2)
    5bce:	    move.l 72edc <ClsSprites+0x30>,48(a2)
    5bd6:	    move.l 72ee0 <ClsSprites+0x34>,52(a2)
    5bde:	    move.l 72ee4 <ClsSprites+0x38>,56(a2)
    5be6:	    move.l 72ee8 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    5bee:	    move.l 72eec <ClScreen>,64(a2)
    5bf6:	    move.l 72ef0 <ClScreen+0x4>,68(a2)
    5bfe:	    move.l 72ef4 <ClScreen+0x8>,72(a2)
    5c06:	    move.l 72ef8 <ClScreen+0xc>,76(a2)
    5c0e:	    move.l 72efc <ClScreen+0x10>,80(a2)
    5c16:	    move.l 72f00 <ClScreen+0x14>,84(a2)
    5c1e:	    move.l 72f04 <ClScreen+0x18>,88(a2)
    5c26:	    move.l 72f08 <ClScreen+0x1c>,92(a2)
    5c2e:	    move.l 72f0c <ClScreen+0x20>,96(a2)
    5c36:	    move.l 72f10 <ClScreen+0x24>,100(a2)
    5c3e:	    move.l 72f14 <ClScreen+0x28>,104(a2)
    5c46:	    move.l 72f18 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    5c4e:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    5c56:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    5c5e:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    5c66:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    5c6e:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    5c76:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    5c7e:	    move.l 72f1c <ClColor>,136(a2)
    5c86:	    move.l 72f20 <ClColor+0x4>,140(a2)
    5c8e:	    move.l 72f24 <ClColor+0x8>,144(a2)
    5c96:	    move.l 72f28 <ClColor+0xc>,148(a2)
    5c9e:	    move.l 72f2c <ClColor+0x10>,152(a2)
    5ca6:	    move.l 72f30 <ClColor+0x14>,156(a2)
    5cae:	    move.l 72f34 <ClColor+0x18>,160(a2)
    5cb6:	    move.l 72f38 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    5cbe:	    move.l 72f3c <ClToggleBitPlanes>,168(a2)
    5cc6:	    move.l 72f40 <ClToggleBitPlanes+0x4>,172(a2)
    5cce:	    move.l 72f44 <ClToggleBitPlanes+0x8>,176(a2)
    5cd6:	    move.l 72f48 <ClToggleBitPlanes+0xc>,180(a2)
    5cde:	    move.l 72f4c <ClToggleBitPlanes+0x10>,184(a2)
    5ce6:	    move.l 72f50 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    5cee:	    moveq #-2,d0
    5cf0:	    move.l d0,192(a2)
}
    5cf4:	    move.l a2,d0
    5cf6:	    movem.l (sp)+,d2-d3/a2/a6
    5cfa:	    rts

00005cfc <SetBplPointers>:

void SetBplPointers() {
    5cfc:	    lea -12(sp),sp

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    5d00:	    move.w 971ea <ScreenBufferOffset>,d0
    5d06:	    move.w d0,d0
    5d08:	    andi.l #65535,d0
    5d0e:	    add.l d0,d0
    5d10:	    movea.l d0,a1
    5d12:	    adda.l d0,a1
    5d14:	    lea 971f6 <ScreenBufferList>,a0
    5d1a:	    move.l (0,a1,a0.l),d0
    5d1e:	    move.l d0,971d2 <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    5d24:	    move.w 971ea <ScreenBufferOffset>,d0
    5d2a:	    move.w d0,d0
    5d2c:	    andi.l #65535,d0
    5d32:	    addq.l #1,d0
    5d34:	    add.l d0,d0
    5d36:	    movea.l d0,a1
    5d38:	    adda.l d0,a1
    5d3a:	    lea 971f6 <ScreenBufferList>,a0
    5d40:	    move.l (0,a1,a0.l),d0
    5d44:	    move.l d0,971d6 <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    5d4a:	    move.w 971ea <ScreenBufferOffset>,d0
    5d50:	    move.w d0,d0
    5d52:	    andi.l #65535,d0
    5d58:	    addq.l #2,d0
    5d5a:	    add.l d0,d0
    5d5c:	    movea.l d0,a1
    5d5e:	    adda.l d0,a1
    5d60:	    lea 971f6 <ScreenBufferList>,a0
    5d66:	    move.l (0,a1,a0.l),d0
    5d6a:	    move.l d0,971da <ClearBuffer>

  ScreenBufferOffset += 3;
    5d70:	    move.w 971ea <ScreenBufferOffset>,d0
    5d76:	    addq.w #3,d0
    5d78:	    move.w d0,971ea <ScreenBufferOffset>
  if(ScreenBufferOffset >= 9) { 
    5d7e:	    move.w 971ea <ScreenBufferOffset>,d0
    5d84:	    cmpi.w #8,d0
    5d88:	/-- bls.s 5d90 <SetBplPointers+0x94>
      ScreenBufferOffset = 0;   
    5d8a:	|   clr.w 971ea <ScreenBufferOffset>
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    5d90:	\-> movea.l 971d6 <ViewBuffer>,a0
    5d96:	    move.l (a0),d1
    5d98:	    movea.l 971d6 <ViewBuffer>,a0
    5d9e:	    move.w 54(a0),d0
    5da2:	    ext.l d0
    5da4:	    lsl.l #6,d0
    5da6:	    add.l d1,d0
    5da8:	    move.l d0,8(sp)
  UWORD highword = ptr >> 16;
    5dac:	    move.l 8(sp),d0
    5db0:	    clr.w d0
    5db2:	    swap d0
    5db4:	    move.w d0,6(sp)
  UWORD lowword = ptr & 0xffff;  
    5db8:	    move.w 10(sp),4(sp)

  UWORD *copword = (UWORD *) DrawCopper;
    5dbe:	    move.l 9711a <DrawCopper>,(sp)
  copword[COPBPL1LOW] = lowword;
    5dc4:	    movea.w #118,a0
    5dc8:	    adda.l (sp),a0
    5dca:	    move.w 4(sp),(a0)
  copword[COPBPL1HIGH] = highword;
    5dce:	    movea.w #114,a0
    5dd2:	    adda.l (sp),a0
    5dd4:	    move.w 6(sp),(a0)

  ptr +=  64*BPLHEIGHT;
    5dd8:	    addi.l #16384,8(sp)
  highword = ptr >> 16;
    5de0:	    move.l 8(sp),d0
    5de4:	    clr.w d0
    5de6:	    swap d0
    5de8:	    move.w d0,6(sp)
  lowword = ptr & 0xffff;  
    5dec:	    move.w 10(sp),4(sp)
  copword[COPBPL2LOW] = lowword;
    5df2:	    movea.w #126,a0
    5df6:	    adda.l (sp),a0
    5df8:	    move.w 4(sp),(a0)
  copword[COPBPL2HIGH] = highword;
    5dfc:	    movea.w #122,a0
    5e00:	    adda.l (sp),a0
    5e02:	    move.w 6(sp),(a0)

  ptr +=  64*BPLHEIGHT;
    5e06:	    addi.l #16384,8(sp)
  highword = ptr >> 16;
    5e0e:	    move.l 8(sp),d0
    5e12:	    clr.w d0
    5e14:	    swap d0
    5e16:	    move.w d0,6(sp)
  lowword = ptr & 0xffff;  
    5e1a:	    move.w 10(sp),4(sp)
  copword[COPBPL3LOW] = lowword;
    5e20:	    movea.l (sp),a0
    5e22:	    lea 134(a0),a0
    5e26:	    move.w 4(sp),(a0)
  copword[COPBPL3HIGH] = highword;
    5e2a:	    movea.l (sp),a0
    5e2c:	    lea 130(a0),a0
    5e30:	    move.w 6(sp),(a0)

    5e34:	    nop
    5e36:	    lea 12(sp),sp
    5e3a:	    rts

00005e3c <strlen>:
unsigned long strlen(const char* s) {
    5e3c:	       subq.l #4,sp
	unsigned long t=0;
    5e3e:	       clr.l (sp)
	while(*s++)
    5e40:	   /-- bra.s 5e44 <strlen+0x8>
		t++;
    5e42:	/--|-> addq.l #1,(sp)
	while(*s++)
    5e44:	|  \-> move.l 8(sp),d0
    5e48:	|      move.l d0,d1
    5e4a:	|      addq.l #1,d1
    5e4c:	|      move.l d1,8(sp)
    5e50:	|      movea.l d0,a0
    5e52:	|      move.b (a0),d0
    5e54:	\----- bne.s 5e42 <strlen+0x6>
	return t;
    5e56:	       move.l (sp),d0
}
    5e58:	       addq.l #4,sp
    5e5a:	       rts

00005e5c <memclr>:
void memclr(void* dest, unsigned long len) { // dest: 16bit-aligned, len: multiple of 2
    5e5c:	       movem.l d2-d4,-(sp)
	__asm volatile (
    5e60:	       move.l 16(sp),d1
    5e64:	       move.l 20(sp),d0
    5e68:	       movea.l d1,a0
    5e6a:	       move.l d0,d4
    5e6c:	       cmpi.l #256,d4
    5e72:	/----- blt.w 5ed0 <memclr+0x74>
    5e76:	|      adda.l d4,a0
    5e78:	|      moveq #0,d0
    5e7a:	|      moveq #0,d1
    5e7c:	|      moveq #0,d2
    5e7e:	|      moveq #0,d3
    5e80:	|  /-> movem.l d0-d3,-(a0)
    5e84:	|  |   movem.l d0-d3,-(a0)
    5e88:	|  |   movem.l d0-d3,-(a0)
    5e8c:	|  |   movem.l d0-d3,-(a0)
    5e90:	|  |   movem.l d0-d3,-(a0)
    5e94:	|  |   movem.l d0-d3,-(a0)
    5e98:	|  |   movem.l d0-d3,-(a0)
    5e9c:	|  |   movem.l d0-d3,-(a0)
    5ea0:	|  |   movem.l d0-d3,-(a0)
    5ea4:	|  |   movem.l d0-d3,-(a0)
    5ea8:	|  |   movem.l d0-d3,-(a0)
    5eac:	|  |   movem.l d0-d3,-(a0)
    5eb0:	|  |   movem.l d0-d3,-(a0)
    5eb4:	|  |   movem.l d0-d3,-(a0)
    5eb8:	|  |   movem.l d0-d3,-(a0)
    5ebc:	|  |   movem.l d0-d3,-(a0)
    5ec0:	|  |   subi.l #256,d4
    5ec6:	|  |   cmpi.l #256,d4
    5ecc:	|  \-- bge.w 5e80 <memclr+0x24>
    5ed0:	>----> cmpi.w #64,d4
    5ed4:	|  /-- blt.w 5ef0 <memclr+0x94>
    5ed8:	|  |   movem.l d0-d3,-(a0)
    5edc:	|  |   movem.l d0-d3,-(a0)
    5ee0:	|  |   movem.l d0-d3,-(a0)
    5ee4:	|  |   movem.l d0-d3,-(a0)
    5ee8:	|  |   subi.w #64,d4
    5eec:	\--|-- bra.w 5ed0 <memclr+0x74>
    5ef0:	   \-> lsr.w #2,d4
    5ef2:	   /-- bcc.w 5ef8 <memclr+0x9c>
    5ef6:	   |   clr.w -(a0)
    5ef8:	   \-> moveq #16,d0
    5efa:	       sub.w d4,d0
    5efc:	       add.w d0,d0
    5efe:	       jmp (5f02 <memclr+0xa6>,pc,d0.w)
    5f02:	       clr.l -(a0)
    5f04:	       clr.l -(a0)
    5f06:	       clr.l -(a0)
    5f08:	       clr.l -(a0)
    5f0a:	       clr.l -(a0)
    5f0c:	       clr.l -(a0)
    5f0e:	       clr.l -(a0)
    5f10:	       clr.l -(a0)
    5f12:	       clr.l -(a0)
    5f14:	       clr.l -(a0)
    5f16:	       clr.l -(a0)
    5f18:	       clr.l -(a0)
    5f1a:	       clr.l -(a0)
    5f1c:	       clr.l -(a0)
    5f1e:	       clr.l -(a0)
    5f20:	       clr.l -(a0)
    5f22:	       move.l a0,16(sp)
    5f26:	       move.l d4,20(sp)
}
    5f2a:	       nop
    5f2c:	       movem.l (sp)+,d2-d4
    5f30:	       rts

00005f32 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    5f32:	       subq.l #4,sp
	unsigned char *ptr = (unsigned char *)dest;
    5f34:	       move.l 8(sp),(sp)
	while(len-- > 0)
    5f38:	   /-- bra.s 5f4a <memset+0x18>
		*ptr++ = val;
    5f3a:	/--|-> move.l (sp),d0
    5f3c:	|  |   move.l d0,d1
    5f3e:	|  |   addq.l #1,d1
    5f40:	|  |   move.l d1,(sp)
    5f42:	|  |   move.l 12(sp),d1
    5f46:	|  |   movea.l d0,a0
    5f48:	|  |   move.b d1,(a0)
	while(len-- > 0)
    5f4a:	|  \-> move.l 16(sp),d0
    5f4e:	|      move.l d0,d1
    5f50:	|      subq.l #1,d1
    5f52:	|      move.l d1,16(sp)
    5f56:	|      tst.l d0
    5f58:	\----- bne.s 5f3a <memset+0x8>
	return dest;
    5f5a:	       move.l 8(sp),d0
}
    5f5e:	       addq.l #4,sp
    5f60:	       rts

00005f62 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5f62:	       subq.l #8,sp
    5f64:	       move.l d2,-(sp)
	char *d = (char *)dest;
    5f66:	       move.l 16(sp),8(sp)
	const char *s = (const char *)src;
    5f6c:	       move.l 20(sp),4(sp)
	while(len--)
    5f72:	   /-- bra.s 5f94 <memcpy+0x32>
		*d++ = *s++;
    5f74:	/--|-> move.l 4(sp),d1
    5f78:	|  |   move.l d1,d0
    5f7a:	|  |   addq.l #1,d0
    5f7c:	|  |   move.l d0,4(sp)
    5f80:	|  |   move.l 8(sp),d0
    5f84:	|  |   move.l d0,d2
    5f86:	|  |   addq.l #1,d2
    5f88:	|  |   move.l d2,8(sp)
    5f8c:	|  |   movea.l d1,a0
    5f8e:	|  |   move.b (a0),d1
    5f90:	|  |   movea.l d0,a0
    5f92:	|  |   move.b d1,(a0)
	while(len--)
    5f94:	|  \-> move.l 24(sp),d0
    5f98:	|      move.l d0,d1
    5f9a:	|      subq.l #1,d1
    5f9c:	|      move.l d1,24(sp)
    5fa0:	|      tst.l d0
    5fa2:	\----- bne.s 5f74 <memcpy+0x12>
	return dest;
    5fa4:	       move.l 16(sp),d0
}
    5fa8:	       move.l (sp)+,d2
    5faa:	       addq.l #8,sp
    5fac:	       rts

00005fae <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5fae:	             lea -16(sp),sp
    5fb2:	             move.l d2,-(sp)
	char *d = dest;
    5fb4:	             move.l 24(sp),16(sp)
	const char *s = src;
    5fba:	             move.l 28(sp),12(sp)
	if (d < s) {
    5fc0:	             move.l 16(sp),d0
    5fc4:	             cmp.l 12(sp),d0
    5fc8:	   /-------- bcc.s 5ffe <memmove+0x50>
		while (len--)
    5fca:	   |     /-- bra.s 5fec <memmove+0x3e>
			*d++ = *s++;
    5fcc:	   |  /--|-> move.l 12(sp),d1
    5fd0:	   |  |  |   move.l d1,d2
    5fd2:	   |  |  |   addq.l #1,d2
    5fd4:	   |  |  |   move.l d2,12(sp)
    5fd8:	   |  |  |   move.l 16(sp),d0
    5fdc:	   |  |  |   move.l d0,d2
    5fde:	   |  |  |   addq.l #1,d2
    5fe0:	   |  |  |   move.l d2,16(sp)
    5fe4:	   |  |  |   movea.l d1,a0
    5fe6:	   |  |  |   move.b (a0),d1
    5fe8:	   |  |  |   movea.l d0,a0
    5fea:	   |  |  |   move.b d1,(a0)
		while (len--)
    5fec:	   |  |  \-> move.l 32(sp),d0
    5ff0:	   |  |      move.l d0,d1
    5ff2:	   |  |      subq.l #1,d1
    5ff4:	   |  |      move.l d1,32(sp)
    5ff8:	   |  |      tst.l d0
    5ffa:	   |  \----- bne.s 5fcc <memmove+0x1e>
    5ffc:	/--|-------- bra.s 6050 <memmove+0xa2>
		const char *lasts = s + (len - 1);
    5ffe:	|  \-------> move.l 32(sp),d0
    6002:	|            subq.l #1,d0
    6004:	|            move.l 12(sp),d2
    6008:	|            add.l d0,d2
    600a:	|            move.l d2,8(sp)
		char *lastd = d + (len - 1);
    600e:	|            move.l 32(sp),d0
    6012:	|            subq.l #1,d0
    6014:	|            move.l 16(sp),d1
    6018:	|            add.l d0,d1
    601a:	|            move.l d1,4(sp)
		while (len--)
    601e:	|        /-- bra.s 6040 <memmove+0x92>
			*lastd-- = *lasts--;
    6020:	|     /--|-> move.l 8(sp),d1
    6024:	|     |  |   move.l d1,d2
    6026:	|     |  |   subq.l #1,d2
    6028:	|     |  |   move.l d2,8(sp)
    602c:	|     |  |   move.l 4(sp),d0
    6030:	|     |  |   move.l d0,d2
    6032:	|     |  |   subq.l #1,d2
    6034:	|     |  |   move.l d2,4(sp)
    6038:	|     |  |   movea.l d1,a0
    603a:	|     |  |   move.b (a0),d1
    603c:	|     |  |   movea.l d0,a0
    603e:	|     |  |   move.b d1,(a0)
		while (len--)
    6040:	|     |  \-> move.l 32(sp),d0
    6044:	|     |      move.l d0,d1
    6046:	|     |      subq.l #1,d1
    6048:	|     |      move.l d1,32(sp)
    604c:	|     |      tst.l d0
    604e:	|     \----- bne.s 6020 <memmove+0x72>
	return dest;
    6050:	\----------> move.l 24(sp),d0
}
    6054:	             move.l (sp)+,d2
    6056:	             lea 16(sp),sp
    605a:	             rts

0000605c <KPrintF>:
void KPrintF(const char* fmt, ...) {
    605c:	       lea -128(sp),sp
    6060:	       movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    6064:	       move.w f0ff60 <_end+0xe78d2c>,d0
    606a:	       cmpi.w #20153,d0
    606e:	   /-- beq.s 6092 <KPrintF+0x36>
    6070:	   |   cmpi.w #-24562,d0
    6074:	   +-- beq.s 6092 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    6076:	   |   movea.l 96d62 <SysBase>,a6
    607c:	   |   movea.l 144(sp),a0
    6080:	   |   lea 148(sp),a1
    6084:	   |   lea 682e <KPutCharX>,a2
    608a:	   |   suba.l a3,a3
    608c:	   |   jsr -522(a6)
}
    6090:	/--|-- bra.s 60bc <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    6092:	|  \-> movea.l 96d62 <SysBase>,a6
    6098:	|      movea.l 144(sp),a0
    609c:	|      lea 148(sp),a1
    60a0:	|      lea 683c <PutChar>,a2
    60a6:	|      lea 12(sp),a3
    60aa:	|      jsr -522(a6)
		UaeDbgLog(86, temp);
    60ae:	|      move.l a3,-(sp)
    60b0:	|      pea 56 <_start+0x56>
    60b4:	|      jsr f0ff60 <_end+0xe78d2c>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    60ba:	|      addq.l #8,sp
}
    60bc:	\----> movem.l (sp)+,a2-a3/a6
    60c0:	       lea 128(sp),sp
    60c4:	       rts

000060c6 <warpmode>:

void warpmode(int on) { // bool
    60c6:	          subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
    60c8:	          move.l #15794016,4(sp)
	if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    60d0:	          movea.l 4(sp),a0
    60d4:	          move.w (a0),d0
    60d6:	          cmpi.w #20153,d0
    60da:	      /-- beq.s 60ea <warpmode+0x24>
    60dc:	      |   movea.l 4(sp),a0
    60e0:	      |   move.w (a0),d0
    60e2:	      |   cmpi.w #-24562,d0
    60e6:	/-----|-- bne.w 61ee <warpmode+0x128>
		char outbuf;
		UaeConf(82, -1, on ? "cpu_speed max" : "cpu_speed real", 0, &outbuf, 1);
    60ea:	|     \-> tst.l 12(sp)
    60ee:	|  /----- beq.s 60f8 <warpmode+0x32>
    60f0:	|  |      move.l #250685,d0
    60f6:	|  |  /-- bra.s 60fe <warpmode+0x38>
    60f8:	|  \--|-> move.l #250699,d0
    60fe:	|     \-> pea 1 <_start+0x1>
    6102:	|         move.l sp,d1
    6104:	|         addq.l #7,d1
    6106:	|         move.l d1,-(sp)
    6108:	|         clr.l -(sp)
    610a:	|         move.l d0,-(sp)
    610c:	|         pea ffffffff <_end+0xfff68dcb>
    6110:	|         pea 52 <_start+0x52>
    6114:	|         movea.l 28(sp),a0
    6118:	|         jsr (a0)
    611a:	|         lea 24(sp),sp
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
    611e:	|         tst.l 12(sp)
    6122:	|  /----- beq.s 612c <warpmode+0x66>
    6124:	|  |      move.l #250714,d0
    612a:	|  |  /-- bra.s 6132 <warpmode+0x6c>
    612c:	|  \--|-> move.l #250736,d0
    6132:	|     \-> pea 1 <_start+0x1>
    6136:	|         move.l sp,d1
    6138:	|         addq.l #7,d1
    613a:	|         move.l d1,-(sp)
    613c:	|         clr.l -(sp)
    613e:	|         move.l d0,-(sp)
    6140:	|         pea ffffffff <_end+0xfff68dcb>
    6144:	|         pea 52 <_start+0x52>
    6148:	|         movea.l 28(sp),a0
    614c:	|         jsr (a0)
    614e:	|         lea 24(sp),sp
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
    6152:	|         tst.l 12(sp)
    6156:	|  /----- beq.s 6160 <warpmode+0x9a>
    6158:	|  |      move.l #250757,d0
    615e:	|  |  /-- bra.s 6166 <warpmode+0xa0>
    6160:	|  \--|-> move.l #250786,d0
    6166:	|     \-> pea 1 <_start+0x1>
    616a:	|         move.l sp,d1
    616c:	|         addq.l #7,d1
    616e:	|         move.l d1,-(sp)
    6170:	|         clr.l -(sp)
    6172:	|         move.l d0,-(sp)
    6174:	|         pea ffffffff <_end+0xfff68dcb>
    6178:	|         pea 52 <_start+0x52>
    617c:	|         movea.l 28(sp),a0
    6180:	|         jsr (a0)
    6182:	|         lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    6186:	|         tst.l 12(sp)
    618a:	|  /----- beq.s 6194 <warpmode+0xce>
    618c:	|  |      move.l #250814,d0
    6192:	|  |  /-- bra.s 619a <warpmode+0xd4>
    6194:	|  \--|-> move.l #250840,d0
    619a:	|     \-> pea 1 <_start+0x1>
    619e:	|         move.l sp,d1
    61a0:	|         addq.l #7,d1
    61a2:	|         move.l d1,-(sp)
    61a4:	|         clr.l -(sp)
    61a6:	|         move.l d0,-(sp)
    61a8:	|         pea ffffffff <_end+0xfff68dcb>
    61ac:	|         pea 52 <_start+0x52>
    61b0:	|         movea.l 28(sp),a0
    61b4:	|         jsr (a0)
    61b6:	|         lea 24(sp),sp
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    61ba:	|         tst.l 12(sp)
    61be:	|  /----- beq.s 61c8 <warpmode+0x102>
    61c0:	|  |      move.l #250865,d0
    61c6:	|  |  /-- bra.s 61ce <warpmode+0x108>
    61c8:	|  \--|-> move.l #250875,d0
    61ce:	|     \-> pea 1 <_start+0x1>
    61d2:	|         move.l sp,d1
    61d4:	|         addq.l #7,d1
    61d6:	|         move.l d1,-(sp)
    61d8:	|         clr.l -(sp)
    61da:	|         move.l d0,-(sp)
    61dc:	|         pea ffffffff <_end+0xfff68dcb>
    61e0:	|         pea 52 <_start+0x52>
    61e4:	|         movea.l 28(sp),a0
    61e8:	|         jsr (a0)
    61ea:	|         lea 24(sp),sp
	}
}
    61ee:	\-------> nop
    61f0:	          addq.l #8,sp
    61f2:	          rts

000061f4 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
    61f4:	       subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
    61f6:	       move.l #15794016,(sp)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    61fc:	       movea.l (sp),a0
    61fe:	       move.w (a0),d0
    6200:	       cmpi.w #20153,d0
    6204:	   /-- beq.s 6210 <debug_cmd+0x1c>
    6206:	   |   movea.l (sp),a0
    6208:	   |   move.w (a0),d0
    620a:	   |   cmpi.w #-24562,d0
    620e:	/--|-- bne.s 622e <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
    6210:	|  \-> move.l 20(sp),-(sp)
    6214:	|      move.l 20(sp),-(sp)
    6218:	|      move.l 20(sp),-(sp)
    621c:	|      move.l 20(sp),-(sp)
    6220:	|      pea 58 <_start+0x58>
    6224:	|      movea.l 20(sp),a0
    6228:	|      jsr (a0)
    622a:	|      lea 20(sp),sp
	}
}
    622e:	\----> nop
    6230:	       addq.l #4,sp
    6232:	       rts

00006234 <debug_clear>:
	};
};

// debug overlay
void debug_clear() {
	debug_cmd(barto_cmd_clear, 0, 0, 0);
    6234:	clr.l -(sp)
    6236:	clr.l -(sp)
    6238:	clr.l -(sp)
    623a:	clr.l -(sp)
    623c:	jsr 61f4 <debug_cmd>(pc)
    6240:	lea 16(sp),sp
}
    6244:	nop
    6246:	rts

00006248 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color) {
    6248:	subq.l #8,sp
    624a:	move.l d2,-(sp)
    624c:	movea.l 16(sp),a1
    6250:	movea.l 20(sp),a0
    6254:	move.l 24(sp),d1
    6258:	move.l 28(sp),d0
    625c:	movea.w a1,a1
    625e:	move.w a1,10(sp)
    6262:	movea.w a0,a0
    6264:	move.w a0,8(sp)
    6268:	move.w d1,d1
    626a:	move.w d1,6(sp)
    626e:	move.w d0,d0
    6270:	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    6274:	move.w 6(sp),d0
    6278:	ext.l d0
    627a:	swap d0
    627c:	clr.w d0
    627e:	move.w 4(sp),d1
    6282:	ext.l d1
    6284:	or.l d0,d1
    6286:	move.w 10(sp),d0
    628a:	ext.l d0
    628c:	swap d0
    628e:	clr.w d0
    6290:	movea.w 8(sp),a0
    6294:	move.l a0,d2
    6296:	or.l d2,d0
    6298:	move.l 32(sp),-(sp)
    629c:	move.l d1,-(sp)
    629e:	move.l d0,-(sp)
    62a0:	pea 1 <_start+0x1>
    62a4:	jsr 61f4 <debug_cmd>(pc)
    62a8:	lea 16(sp),sp
}
    62ac:	nop
    62ae:	move.l (sp)+,d2
    62b0:	addq.l #8,sp
    62b2:	rts

000062b4 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color) {
    62b4:	subq.l #8,sp
    62b6:	move.l d2,-(sp)
    62b8:	movea.l 16(sp),a1
    62bc:	movea.l 20(sp),a0
    62c0:	move.l 24(sp),d1
    62c4:	move.l 28(sp),d0
    62c8:	movea.w a1,a1
    62ca:	move.w a1,10(sp)
    62ce:	movea.w a0,a0
    62d0:	move.w a0,8(sp)
    62d4:	move.w d1,d1
    62d6:	move.w d1,6(sp)
    62da:	move.w d0,d0
    62dc:	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
    62e0:	move.w 6(sp),d0
    62e4:	ext.l d0
    62e6:	swap d0
    62e8:	clr.w d0
    62ea:	move.w 4(sp),d1
    62ee:	ext.l d1
    62f0:	or.l d0,d1
    62f2:	move.w 10(sp),d0
    62f6:	ext.l d0
    62f8:	swap d0
    62fa:	clr.w d0
    62fc:	movea.w 8(sp),a0
    6300:	move.l a0,d2
    6302:	or.l d2,d0
    6304:	move.l 32(sp),-(sp)
    6308:	move.l d1,-(sp)
    630a:	move.l d0,-(sp)
    630c:	pea 2 <_start+0x2>
    6310:	jsr 61f4 <debug_cmd>(pc)
    6314:	lea 16(sp),sp
}
    6318:	nop
    631a:	move.l (sp)+,d2
    631c:	addq.l #8,sp
    631e:	rts

00006320 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color) {
    6320:	subq.l #4,sp
    6322:	move.l d2,-(sp)
    6324:	move.l 12(sp),d1
    6328:	move.l 16(sp),d0
    632c:	move.w d1,d1
    632e:	move.w d1,6(sp)
    6332:	move.w d0,d0
    6334:	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
    6338:	move.l 20(sp),d0
    633c:	move.w 6(sp),d1
    6340:	ext.l d1
    6342:	swap d1
    6344:	clr.w d1
    6346:	movea.w 4(sp),a0
    634a:	move.l a0,d2
    634c:	or.l d2,d1
    634e:	move.l 24(sp),-(sp)
    6352:	move.l d0,-(sp)
    6354:	move.l d1,-(sp)
    6356:	pea 3 <_start+0x3>
    635a:	jsr 61f4 <debug_cmd>(pc)
    635e:	lea 16(sp),sp
}
    6362:	nop
    6364:	move.l (sp)+,d2
    6366:	addq.l #4,sp
    6368:	rts

0000636a <debug_start_idle>:

// profiler
void debug_start_idle() {
	debug_cmd(barto_cmd_set_idle, 1, 0, 0);
    636a:	clr.l -(sp)
    636c:	clr.l -(sp)
    636e:	pea 1 <_start+0x1>
    6372:	pea 5 <_start+0x5>
    6376:	jsr 61f4 <debug_cmd>(pc)
    637a:	lea 16(sp),sp
}
    637e:	nop
    6380:	rts

00006382 <debug_stop_idle>:

void debug_stop_idle() {
	debug_cmd(barto_cmd_set_idle, 0, 0, 0);
    6382:	clr.l -(sp)
    6384:	clr.l -(sp)
    6386:	clr.l -(sp)
    6388:	pea 5 <_start+0x5>
    638c:	jsr 61f4 <debug_cmd>(pc)
    6390:	lea 16(sp),sp
}
    6394:	nop
    6396:	rts

00006398 <my_strncpy>:

// gfx debugger
static void my_strncpy(char* destination, const char* source, unsigned long num) {
    6398:	       move.l d2,-(sp)
	while(*source && --num > 0)
    639a:	   /-- bra.s 63bc <my_strncpy+0x24>
		*destination++ = *source++;
    639c:	/--|-> move.l 12(sp),d1
    63a0:	|  |   move.l d1,d0
    63a2:	|  |   addq.l #1,d0
    63a4:	|  |   move.l d0,12(sp)
    63a8:	|  |   move.l 8(sp),d0
    63ac:	|  |   move.l d0,d2
    63ae:	|  |   addq.l #1,d2
    63b0:	|  |   move.l d2,8(sp)
    63b4:	|  |   movea.l d1,a0
    63b6:	|  |   move.b (a0),d1
    63b8:	|  |   movea.l d0,a0
    63ba:	|  |   move.b d1,(a0)
	while(*source && --num > 0)
    63bc:	|  \-> movea.l 12(sp),a0
    63c0:	|      move.b (a0),d0
    63c2:	|  /-- beq.s 63ca <my_strncpy+0x32>
    63c4:	|  |   subq.l #1,16(sp)
    63c8:	\--|-- bne.s 639c <my_strncpy+0x4>
	*destination = '\0';
    63ca:	   \-> movea.l 8(sp),a0
    63ce:	       clr.b (a0)
}
    63d0:	       nop
    63d2:	       move.l (sp)+,d2
    63d4:	       rts

000063d6 <debug_register_bitmap>:

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    63d6:	    lea -60(sp),sp
    63da:	    movea.l 72(sp),a1
    63de:	    movea.l 76(sp),a0
    63e2:	    move.l 80(sp),d1
    63e6:	    move.l 84(sp),d0
    63ea:	    movea.w a1,a1
    63ec:	    move.w a1,8(sp)
    63f0:	    movea.w a0,a0
    63f2:	    move.w a0,6(sp)
    63f6:	    move.w d1,d1
    63f8:	    move.w d1,4(sp)
    63fc:	    move.w d0,d0
    63fe:	    move.w d0,2(sp)
	struct debug_resource resource = {
    6402:	    lea 10(sp),a0
    6406:	    clr.l (a0)
    6408:	    addq.l #4,a0
    640a:	    clr.l (a0)
    640c:	    addq.l #4,a0
    640e:	    clr.l (a0)
    6410:	    addq.l #4,a0
    6412:	    clr.l (a0)
    6414:	    addq.l #4,a0
    6416:	    clr.l (a0)
    6418:	    addq.l #4,a0
    641a:	    clr.l (a0)
    641c:	    addq.l #4,a0
    641e:	    clr.l (a0)
    6420:	    addq.l #4,a0
    6422:	    clr.l (a0)
    6424:	    addq.l #4,a0
    6426:	    clr.l (a0)
    6428:	    addq.l #4,a0
    642a:	    clr.l (a0)
    642c:	    addq.l #4,a0
    642e:	    clr.l (a0)
    6430:	    addq.l #4,a0
    6432:	    clr.l (a0)
    6434:	    addq.l #4,a0
    6436:	    clr.w (a0)
    6438:	    addq.l #2,a0
		.address = (unsigned int)addr,
    643a:	    move.l 64(sp),d0
	struct debug_resource resource = {
    643e:	    move.l d0,10(sp)
		.size = width / 8 * height * numPlanes,
    6442:	    move.w 8(sp),d0
    6446:	/-- bpl.s 644a <debug_register_bitmap+0x74>
    6448:	|   addq.w #7,d0
    644a:	\-> asr.w #3,d0
    644c:	    movea.w d0,a0
    644e:	    movea.w 6(sp),a1
    6452:	    move.l a1,-(sp)
    6454:	    move.l a0,-(sp)
    6456:	    jsr 6734 <__mulsi3>
    645c:	    addq.l #8,sp
    645e:	    movea.w 4(sp),a0
    6462:	    move.l a0,-(sp)
    6464:	    move.l d0,-(sp)
    6466:	    jsr 6734 <__mulsi3>
    646c:	    addq.l #8,sp
	struct debug_resource resource = {
    646e:	    move.l d0,14(sp)
    6472:	    move.w 2(sp),52(sp)
    6478:	    move.w 8(sp),54(sp)
    647e:	    move.w 6(sp),56(sp)
    6484:	    move.w 4(sp),58(sp)
		.type = debug_resource_type_bitmap,
		.flags = flags,
		.bitmap = { width, height, numPlanes }
	};

	if (flags & debug_resource_bitmap_masked)
    648a:	    moveq #0,d0
    648c:	    move.w 2(sp),d0
    6490:	    moveq #2,d1
    6492:	    and.l d1,d0
    6494:	/-- beq.s 64a0 <debug_register_bitmap+0xca>
		resource.size *= 2;
    6496:	|   move.l 14(sp),d0
    649a:	|   add.l d0,d0
    649c:	|   move.l d0,14(sp)

	my_strncpy(resource.name, name, sizeof(resource.name));
    64a0:	\-> pea 20 <_start+0x20>
    64a4:	    move.l 72(sp),-(sp)
    64a8:	    lea 18(sp),a0
    64ac:	    move.l a0,d0
    64ae:	    addq.l #8,d0
    64b0:	    move.l d0,-(sp)
    64b2:	    jsr 6398 <my_strncpy>(pc)
    64b6:	    lea 12(sp),sp
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
    64ba:	    lea 10(sp),a0
    64be:	    clr.l -(sp)
    64c0:	    clr.l -(sp)
    64c2:	    move.l a0,-(sp)
    64c4:	    pea 4 <_start+0x4>
    64c8:	    jsr 61f4 <debug_cmd>(pc)
    64cc:	    lea 16(sp),sp
}
    64d0:	    nop
    64d2:	    lea 60(sp),sp
    64d6:	    rts

000064d8 <debug_register_palette>:

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
    64d8:	lea -56(sp),sp
    64dc:	move.l 68(sp),d1
    64e0:	move.l 72(sp),d0
    64e4:	move.w d1,d1
    64e6:	move.w d1,4(sp)
    64ea:	move.w d0,d0
    64ec:	move.w d0,2(sp)
	struct debug_resource resource = {
    64f0:	lea 6(sp),a0
    64f4:	clr.l (a0)
    64f6:	addq.l #4,a0
    64f8:	clr.l (a0)
    64fa:	addq.l #4,a0
    64fc:	clr.l (a0)
    64fe:	addq.l #4,a0
    6500:	clr.l (a0)
    6502:	addq.l #4,a0
    6504:	clr.l (a0)
    6506:	addq.l #4,a0
    6508:	clr.l (a0)
    650a:	addq.l #4,a0
    650c:	clr.l (a0)
    650e:	addq.l #4,a0
    6510:	clr.l (a0)
    6512:	addq.l #4,a0
    6514:	clr.l (a0)
    6516:	addq.l #4,a0
    6518:	clr.l (a0)
    651a:	addq.l #4,a0
    651c:	clr.l (a0)
    651e:	addq.l #4,a0
    6520:	clr.l (a0)
    6522:	addq.l #4,a0
    6524:	clr.w (a0)
    6526:	addq.l #2,a0
		.address = (unsigned int)addr,
    6528:	move.l 60(sp),d0
	struct debug_resource resource = {
    652c:	move.l d0,6(sp)
		.size = numEntries * 2,
    6530:	movea.w 4(sp),a0
    6534:	move.l a0,d0
    6536:	add.l a0,d0
	struct debug_resource resource = {
    6538:	move.l d0,10(sp)
    653c:	move.w #1,46(sp)
    6542:	move.w 2(sp),48(sp)
    6548:	move.w 4(sp),50(sp)
		.type = debug_resource_type_palette,
		.flags = flags,
		.palette = { numEntries }
	};
	my_strncpy(resource.name, name, sizeof(resource.name));
    654e:	pea 20 <_start+0x20>
    6552:	move.l 68(sp),-(sp)
    6556:	lea 14(sp),a0
    655a:	move.l a0,d0
    655c:	addq.l #8,d0
    655e:	move.l d0,-(sp)
    6560:	jsr 6398 <my_strncpy>(pc)
    6564:	lea 12(sp),sp
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
    6568:	lea 6(sp),a0
    656c:	clr.l -(sp)
    656e:	clr.l -(sp)
    6570:	move.l a0,-(sp)
    6572:	pea 4 <_start+0x4>
    6576:	jsr 61f4 <debug_cmd>(pc)
    657a:	lea 16(sp),sp
}
    657e:	nop
    6580:	lea 56(sp),sp
    6584:	rts

00006586 <debug_register_copperlist>:

void debug_register_copperlist(const void* addr, const char* name, unsigned int size, unsigned short flags) {
    6586:	lea -52(sp),sp
    658a:	move.l 68(sp),d0
    658e:	move.w d0,d0
    6590:	move.w d0,(sp)
	struct debug_resource resource = {
    6592:	lea 2(sp),a0
    6596:	clr.l (a0)
    6598:	addq.l #4,a0
    659a:	clr.l (a0)
    659c:	addq.l #4,a0
    659e:	clr.l (a0)
    65a0:	addq.l #4,a0
    65a2:	clr.l (a0)
    65a4:	addq.l #4,a0
    65a6:	clr.l (a0)
    65a8:	addq.l #4,a0
    65aa:	clr.l (a0)
    65ac:	addq.l #4,a0
    65ae:	clr.l (a0)
    65b0:	addq.l #4,a0
    65b2:	clr.l (a0)
    65b4:	addq.l #4,a0
    65b6:	clr.l (a0)
    65b8:	addq.l #4,a0
    65ba:	clr.l (a0)
    65bc:	addq.l #4,a0
    65be:	clr.l (a0)
    65c0:	addq.l #4,a0
    65c2:	clr.l (a0)
    65c4:	addq.l #4,a0
    65c6:	clr.w (a0)
    65c8:	addq.l #2,a0
		.address = (unsigned int)addr,
    65ca:	move.l 56(sp),d0
	struct debug_resource resource = {
    65ce:	move.l d0,2(sp)
    65d2:	move.l 64(sp),6(sp)
    65d8:	move.w #2,42(sp)
    65de:	move.w (sp),44(sp)
		.size = size,
		.type = debug_resource_type_copperlist,
		.flags = flags,
	};
	my_strncpy(resource.name, name, sizeof(resource.name));
    65e2:	pea 20 <_start+0x20>
    65e6:	move.l 64(sp),-(sp)
    65ea:	lea 10(sp),a0
    65ee:	move.l a0,d0
    65f0:	addq.l #8,d0
    65f2:	move.l d0,-(sp)
    65f4:	jsr 6398 <my_strncpy>(pc)
    65f8:	lea 12(sp),sp
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
    65fc:	lea 2(sp),a0
    6600:	clr.l -(sp)
    6602:	clr.l -(sp)
    6604:	move.l a0,-(sp)
    6606:	pea 4 <_start+0x4>
    660a:	jsr 61f4 <debug_cmd>(pc)
    660e:	lea 16(sp),sp
}
    6612:	nop
    6614:	lea 52(sp),sp
    6618:	rts

0000661a <debug_unregister>:

void debug_unregister(const void* addr) {
	debug_cmd(barto_cmd_unregister_resource, (unsigned int)addr, 0, 0);
    661a:	move.l 4(sp),d0
    661e:	clr.l -(sp)
    6620:	clr.l -(sp)
    6622:	move.l d0,-(sp)
    6624:	pea 6 <_start+0x6>
    6628:	jsr 61f4 <debug_cmd>(pc)
    662c:	lea 16(sp),sp
}
    6630:	nop
    6632:	rts

00006634 <debug_load>:

// load/save
unsigned int debug_load(const void* addr, const char* name) {
    6634:	lea -52(sp),sp
	struct debug_resource resource = {
    6638:	lea 2(sp),a0
    663c:	clr.l (a0)
    663e:	addq.l #4,a0
    6640:	clr.l (a0)
    6642:	addq.l #4,a0
    6644:	clr.l (a0)
    6646:	addq.l #4,a0
    6648:	clr.l (a0)
    664a:	addq.l #4,a0
    664c:	clr.l (a0)
    664e:	addq.l #4,a0
    6650:	clr.l (a0)
    6652:	addq.l #4,a0
    6654:	clr.l (a0)
    6656:	addq.l #4,a0
    6658:	clr.l (a0)
    665a:	addq.l #4,a0
    665c:	clr.l (a0)
    665e:	addq.l #4,a0
    6660:	clr.l (a0)
    6662:	addq.l #4,a0
    6664:	clr.l (a0)
    6666:	addq.l #4,a0
    6668:	clr.l (a0)
    666a:	addq.l #4,a0
    666c:	clr.w (a0)
    666e:	addq.l #2,a0
		.address = (unsigned int)addr,
    6670:	move.l 56(sp),d0
	struct debug_resource resource = {
    6674:	move.l d0,2(sp)
		.size = 0,
	};
	my_strncpy(resource.name, name, sizeof(resource.name));
    6678:	pea 20 <_start+0x20>
    667c:	move.l 64(sp),-(sp)
    6680:	lea 10(sp),a0
    6684:	move.l a0,d0
    6686:	addq.l #8,d0
    6688:	move.l d0,-(sp)
    668a:	jsr 6398 <my_strncpy>(pc)
    668e:	lea 12(sp),sp
	debug_cmd(barto_cmd_load, (unsigned int)&resource, 0, 0);
    6692:	lea 2(sp),a0
    6696:	clr.l -(sp)
    6698:	clr.l -(sp)
    669a:	move.l a0,-(sp)
    669c:	pea 7 <_start+0x7>
    66a0:	jsr 61f4 <debug_cmd>(pc)
    66a4:	lea 16(sp),sp
	return resource.size;
    66a8:	move.l 6(sp),d0
}
    66ac:	lea 52(sp),sp
    66b0:	rts

000066b2 <debug_save>:

void debug_save(const void* addr, unsigned int size, const char* name) {
    66b2:	lea -52(sp),sp
	struct debug_resource resource = {
    66b6:	lea 2(sp),a0
    66ba:	clr.l (a0)
    66bc:	addq.l #4,a0
    66be:	clr.l (a0)
    66c0:	addq.l #4,a0
    66c2:	clr.l (a0)
    66c4:	addq.l #4,a0
    66c6:	clr.l (a0)
    66c8:	addq.l #4,a0
    66ca:	clr.l (a0)
    66cc:	addq.l #4,a0
    66ce:	clr.l (a0)
    66d0:	addq.l #4,a0
    66d2:	clr.l (a0)
    66d4:	addq.l #4,a0
    66d6:	clr.l (a0)
    66d8:	addq.l #4,a0
    66da:	clr.l (a0)
    66dc:	addq.l #4,a0
    66de:	clr.l (a0)
    66e0:	addq.l #4,a0
    66e2:	clr.l (a0)
    66e4:	addq.l #4,a0
    66e6:	clr.l (a0)
    66e8:	addq.l #4,a0
    66ea:	clr.w (a0)
    66ec:	addq.l #2,a0
		.address = (unsigned int)addr,
    66ee:	move.l 56(sp),d0
	struct debug_resource resource = {
    66f2:	move.l d0,2(sp)
    66f6:	move.l 60(sp),6(sp)
		.size = size,
	};
	my_strncpy(resource.name, name, sizeof(resource.name));
    66fc:	pea 20 <_start+0x20>
    6700:	move.l 68(sp),-(sp)
    6704:	lea 10(sp),a0
    6708:	move.l a0,d0
    670a:	addq.l #8,d0
    670c:	move.l d0,-(sp)
    670e:	jsr 6398 <my_strncpy>(pc)
    6712:	lea 12(sp),sp
	debug_cmd(barto_cmd_save, (unsigned int)&resource, 0, 0);
    6716:	lea 2(sp),a0
    671a:	clr.l -(sp)
    671c:	clr.l -(sp)
    671e:	move.l a0,-(sp)
    6720:	pea 8 <_start+0x8>
    6724:	jsr 61f4 <debug_cmd>(pc)
    6728:	lea 16(sp),sp
}
    672c:	nop
    672e:	lea 52(sp),sp
    6732:	rts

00006734 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    6734:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    6738:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    673c:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    6740:	mulu.w 8(sp),d1
	addw	d1, d0
    6744:	add.w d1,d0
	swap	d0
    6746:	swap d0
	clrw	d0
    6748:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    674a:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    674e:	mulu.w 10(sp),d1
	addl	d1, d0
    6752:	add.l d1,d0
	rts
    6754:	rts

00006756 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    6756:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    6758:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    675c:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    6760:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    6766:	   /-- bcc.s 677e <__udivsi3+0x28>
	movel	d0, d2
    6768:	   |   move.l d0,d2
	clrw	d2
    676a:	   |   clr.w d2
	swap	d2
    676c:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    676e:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    6770:	   |   move.w d2,d0
	swap	d0
    6772:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    6774:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    6778:	   |   divu.w d1,d2
	movew	d2, d0
    677a:	   |   move.w d2,d0
	jra	6f
    677c:	/--|-- bra.s 67ae <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    677e:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    6780:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    6782:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    6784:	|  |   cmpi.l #65536,d1
	jcc	4b
    678a:	|  \-- bcc.s 6780 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    678c:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    678e:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    6794:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    6796:	|      mulu.w d0,d1
	swap	d2
    6798:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    679a:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    679c:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    679e:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    67a0:	|  /-- bne.s 67ac <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    67a2:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    67a4:	|  +-- bcs.s 67ac <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    67a6:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    67aa:	+--|-- bls.s 67ae <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    67ac:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    67ae:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    67b0:	       rts

000067b2 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    67b2:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    67b4:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    67b6:	    move.l 12(sp),d1
	jpl	1f
    67ba:	/-- bpl.s 67c0 <__divsi3+0xe>
	negl	d1
    67bc:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    67be:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    67c0:	\-> move.l 8(sp),d0
	jpl	2f
    67c4:	/-- bpl.s 67ca <__divsi3+0x18>
	negl	d0
    67c6:	|   neg.l d0
	negb	d2
    67c8:	|   neg.b d2

2:	movel	d1, sp@-
    67ca:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    67cc:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    67ce:	    bsr.s 6756 <__udivsi3>
	addql	#8, sp
    67d0:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    67d2:	    tst.b d2
	jpl	3f
    67d4:	/-- bpl.s 67d8 <__divsi3+0x26>
	negl	d0
    67d6:	|   neg.l d0

3:	movel	sp@+, d2
    67d8:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    67da:	    rts

000067dc <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    67dc:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    67e0:	move.l 4(sp),d0
	movel	d1, sp@-
    67e4:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    67e6:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    67e8:	bsr.s 67b2 <__divsi3>
	addql	#8, sp
    67ea:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    67ec:	move.l 8(sp),d1
	movel	d1, sp@-
    67f0:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    67f2:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    67f4:	bsr.w 6734 <__mulsi3>
	addql	#8, sp
    67f8:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    67fa:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    67fe:	sub.l d0,d1
	movel	d1, d0
    6800:	move.l d1,d0
	rts
    6802:	rts

00006804 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    6804:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    6808:	move.l 4(sp),d0
	movel	d1, sp@-
    680c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    680e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    6810:	bsr.w 6756 <__udivsi3>
	addql	#8, sp
    6814:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    6816:	move.l 8(sp),d1
	movel	d1, sp@-
    681a:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    681c:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    681e:	bsr.w 6734 <__mulsi3>
	addql	#8, sp
    6822:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    6824:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    6828:	sub.l d0,d1
	movel	d1, d0
    682a:	move.l d1,d0
	rts
    682c:	rts

0000682e <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    682e:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    6830:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    6834:	jsr -516(a6)
    move.l (sp)+, a6
    6838:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    683a:	rts

0000683c <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    683c:	move.b d0,(a3)+
	rts
    683e:	rts

00006840 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    6840:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    6842:	                         adda.l a0,a2
	move.l	a2,a3
    6844:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    6846:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    6848:	                         moveq #56,d4
	moveq	#8,d5
    684a:	                         moveq #8,d5
	bra.s	.Lliteral
    684c:	   /-------------------- bra.s 68b6 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    684e:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    6850:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    6852:	+--|-------------------- dbf d1,684e <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    6856:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    6858:	|  |     /-------------- bcc.s 685c <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    685a:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    685c:	|  |  |  >-------------> tst.w d0
    685e:	|  |  |  |           /-- bne.s 6868 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    6860:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    6862:	|  |  |  |           |   bls.s 68da <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    6864:	|  |  |  |           |   move.w (a0)+,d0
    6866:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    6868:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    686a:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    686c:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    686e:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    6870:	|  |  |  |               movem.w (68d4 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    6876:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    6878:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    687a:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    687c:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    687e:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    6880:	|  |  |  |               tst.w d0
    6882:	|  |  |  |           /-- bne.s 6888 <_doynaxdepack_asm+0x48>
    6884:	|  |  |  |           |   move.w (a0)+,d0
    6886:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    6888:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    688a:	|  |  |  |  /----------- beq.s 68a2 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    688c:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    688e:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    6890:	|  |  |  |  |  /-------- bpl.s 689e <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    6892:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    6894:	|  |  |  |  |  |  /----- bpl.s 689c <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    6896:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    6898:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    689a:	|  |  |  |  |  |  |  \-- bmi.s 6896 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    689c:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    689e:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    68a0:	|  |  |  |  |        /-- bcc.s 68a4 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    68a2:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    68a4:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    68a6:	|  |  |  |  \----------- dbf d1,68a2 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    68aa:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    68ac:	|  |  |  \-------------- bcc.s 685c <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    68ae:	|  |  |                  tst.w d0
    68b0:	|  +--|----------------- bne.s 68b6 <_doynaxdepack_asm+0x76>
    68b2:	|  |  |                  move.w (a0)+,d0
    68b4:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    68b6:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    68b8:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    68ba:	|     \----------------- bcc.s 685a <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    68bc:	|                 /----- bpl.s 68c4 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    68be:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    68c0:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    68c2:	|                 |  \-- bmi.s 68be <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    68c4:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    68c6:	\--------------------/-X dbv.s d1,684e <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    68ca:	                     |   add.l d0,d0
	eor.w	d1,d0		
    68cc:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    68ce:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    68d0:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    68d2:	                     \-- bra.s 68c6 <_doynaxdepack_asm+0x86>

000068d4 <doy_table>:
    68d4:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    68e4:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    68f4:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    6904:	.............oNq

00006914 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    6914:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    6918:	moveq #0,d1
			moveq	#0,d2
    691a:	moveq #0,d2
			moveq	#0,d3
    691c:	moveq #0,d3
			moveq	#16,d7
    691e:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    6920:	lea 759e <lz4jmp>(pc),a3
		moveq	#0,d0
    6924:	moveq #0,d0
		move.b	(a0)+,d0
    6926:	move.b (a0)+,d0
		add.w	d0,d0
    6928:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    692a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    692e:	jmp (0,a3,d0.w)

00006932 <lz4Rts0>:
lz4Rts0:	rts
    6932:	rts

00006934 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    6934:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6936:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6938:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    693a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    693c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    693e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6940:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6942:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6944:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6946:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6948:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    694a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    694c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    694e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6950:	cmpa.l a0,a4
		beq.s	lz4Rts1
    6952:	beq.s 6976 <lz4Rts1>
		move.b	(a0)+,d0
    6954:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6956:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6958:	move.w (sp)+,d3
		move.b	d0,d3
    695a:	move.b d0,d3
		move.l	a1,a2
    695c:	movea.l a1,a2
		sub.l	d3,a2
    695e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6960:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6962:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6964:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6966:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6968:	moveq #0,d0
		move.b	(a0)+,d0
    696a:	move.b (a0)+,d0
		add.w	d0,d0
    696c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    696e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6972:	jmp (0,a3,d0.w)

00006976 <lz4Rts1>:
lz4Rts1:	rts
    6976:	rts

00006978 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    6978:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    697a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    697c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    697e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6980:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6982:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6984:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6986:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6988:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    698a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    698c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    698e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6990:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6992:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6994:	cmpa.l a0,a4
		beq.s	lz4Rts2
    6996:	beq.s 69bc <lz4Rts2>
		move.b	(a0)+,d0
    6998:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    699a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    699c:	move.w (sp)+,d3
		move.b	d0,d3
    699e:	move.b d0,d3
		move.l	a1,a2
    69a0:	movea.l a1,a2
		sub.l	d3,a2
    69a2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    69a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69ac:	move.b (a2)+,(a1)+
		moveq	#0,d0
    69ae:	moveq #0,d0
		move.b	(a0)+,d0
    69b0:	move.b (a0)+,d0
		add.w	d0,d0
    69b2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    69b4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    69b8:	jmp (0,a3,d0.w)

000069bc <lz4Rts2>:
lz4Rts2:	rts
    69bc:	rts

000069be <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    69be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69d8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    69da:	cmpa.l a0,a4
		beq.s	lz4Rts3
    69dc:	beq.s 6a04 <lz4Rts3>
		move.b	(a0)+,d0
    69de:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    69e0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    69e2:	move.w (sp)+,d3
		move.b	d0,d3
    69e4:	move.b d0,d3
		move.l	a1,a2
    69e6:	movea.l a1,a2
		sub.l	d3,a2
    69e8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    69ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69f4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    69f6:	moveq #0,d0
		move.b	(a0)+,d0
    69f8:	move.b (a0)+,d0
		add.w	d0,d0
    69fa:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    69fc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6a00:	jmp (0,a3,d0.w)

00006a04 <lz4Rts3>:
lz4Rts3:	rts
    6a04:	rts

00006a06 <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    6a06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a20:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6a22:	cmpa.l a0,a4
		beq.s	lz4Rts4
    6a24:	beq.s 6a4e <lz4Rts4>
		move.b	(a0)+,d0
    6a26:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6a28:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6a2a:	move.w (sp)+,d3
		move.b	d0,d3
    6a2c:	move.b d0,d3
		move.l	a1,a2
    6a2e:	movea.l a1,a2
		sub.l	d3,a2
    6a30:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6a32:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a34:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a36:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a38:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a3a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a3e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6a40:	moveq #0,d0
		move.b	(a0)+,d0
    6a42:	move.b (a0)+,d0
		add.w	d0,d0
    6a44:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6a46:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6a4a:	jmp (0,a3,d0.w)

00006a4e <lz4Rts4>:
lz4Rts4:	rts
    6a4e:	rts

00006a50 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    6a50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a6a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6a6c:	cmpa.l a0,a4
		beq.s	lz4Rts5
    6a6e:	beq.s 6a9a <lz4Rts5>
		move.b	(a0)+,d0
    6a70:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6a72:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6a74:	move.w (sp)+,d3
		move.b	d0,d3
    6a76:	move.b d0,d3
		move.l	a1,a2
    6a78:	movea.l a1,a2
		sub.l	d3,a2
    6a7a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6a7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a8a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6a8c:	moveq #0,d0
		move.b	(a0)+,d0
    6a8e:	move.b (a0)+,d0
		add.w	d0,d0
    6a90:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6a92:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6a96:	jmp (0,a3,d0.w)

00006a9a <lz4Rts5>:
lz4Rts5:	rts
    6a9a:	rts

00006a9c <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    6a9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aa0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aa2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aa4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aa6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aa8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aaa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ab0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ab2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ab4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ab6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6ab8:	cmpa.l a0,a4
		beq.s	lz4Rts6
    6aba:	beq.s 6ae8 <lz4Rts6>
		move.b	(a0)+,d0
    6abc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6abe:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6ac0:	move.w (sp)+,d3
		move.b	d0,d3
    6ac2:	move.b d0,d3
		move.l	a1,a2
    6ac4:	movea.l a1,a2
		sub.l	d3,a2
    6ac6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6ac8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6aca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6acc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ace:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ad0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ad2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ad4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ad6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ad8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6ada:	moveq #0,d0
		move.b	(a0)+,d0
    6adc:	move.b (a0)+,d0
		add.w	d0,d0
    6ade:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6ae0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6ae4:	jmp (0,a3,d0.w)

00006ae8 <lz4Rts6>:
lz4Rts6:	rts
    6ae8:	rts

00006aea <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    6aea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6af0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6af2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6af4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6af6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6af8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6afa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6afc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6afe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b04:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6b06:	cmpa.l a0,a4
		beq.s	lz4Rts7
    6b08:	beq.s 6b38 <lz4Rts7>
		move.b	(a0)+,d0
    6b0a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6b0c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6b0e:	move.w (sp)+,d3
		move.b	d0,d3
    6b10:	move.b d0,d3
		move.l	a1,a2
    6b12:	movea.l a1,a2
		sub.l	d3,a2
    6b14:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6b16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b28:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6b2a:	moveq #0,d0
		move.b	(a0)+,d0
    6b2c:	move.b (a0)+,d0
		add.w	d0,d0
    6b2e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6b30:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6b34:	jmp (0,a3,d0.w)

00006b38 <lz4Rts7>:
lz4Rts7:	rts
    6b38:	rts

00006b3a <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    6b3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b54:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6b56:	cmpa.l a0,a4
		beq.s	lz4Rts8
    6b58:	beq.s 6b8a <lz4Rts8>
		move.b	(a0)+,d0
    6b5a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6b5c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6b5e:	move.w (sp)+,d3
		move.b	d0,d3
    6b60:	move.b d0,d3
		move.l	a1,a2
    6b62:	movea.l a1,a2
		sub.l	d3,a2
    6b64:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6b66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b7a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6b7c:	moveq #0,d0
		move.b	(a0)+,d0
    6b7e:	move.b (a0)+,d0
		add.w	d0,d0
    6b80:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6b82:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6b86:	jmp (0,a3,d0.w)

00006b8a <lz4Rts8>:
lz4Rts8:	rts
    6b8a:	rts

00006b8c <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    6b8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ba0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ba2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ba4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ba6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6ba8:	cmpa.l a0,a4
		beq.s	lz4Rts9
    6baa:	beq.s 6bde <lz4Rts9>
		move.b	(a0)+,d0
    6bac:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6bae:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6bb0:	move.w (sp)+,d3
		move.b	d0,d3
    6bb2:	move.b d0,d3
		move.l	a1,a2
    6bb4:	movea.l a1,a2
		sub.l	d3,a2
    6bb6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6bb8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bc8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bcc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6bce:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6bd0:	moveq #0,d0
		move.b	(a0)+,d0
    6bd2:	move.b (a0)+,d0
		add.w	d0,d0
    6bd4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6bd6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6bda:	jmp (0,a3,d0.w)

00006bde <lz4Rts9>:
lz4Rts9:	rts
    6bde:	rts

00006be0 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    6be0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6be2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6be4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6be6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6be8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bf0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bf2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bf4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bf6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bf8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6bfa:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6bfc:	cmpa.l a0,a4
		beq.s	lz4Rts10
    6bfe:	beq.s 6c34 <lz4Rts10>
		move.b	(a0)+,d0
    6c00:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6c02:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6c04:	move.w (sp)+,d3
		move.b	d0,d3
    6c06:	move.b d0,d3
		move.l	a1,a2
    6c08:	movea.l a1,a2
		sub.l	d3,a2
    6c0a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6c0c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c0e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c10:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c12:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c24:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6c26:	moveq #0,d0
		move.b	(a0)+,d0
    6c28:	move.b (a0)+,d0
		add.w	d0,d0
    6c2a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6c2c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6c30:	jmp (0,a3,d0.w)

00006c34 <lz4Rts10>:
lz4Rts10:	rts
    6c34:	rts

00006c36 <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    6c36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c50:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6c52:	cmpa.l a0,a4
		beq.s	lz4Rts11
    6c54:	beq.s 6c8c <lz4Rts11>
		move.b	(a0)+,d0
    6c56:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6c58:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6c5a:	move.w (sp)+,d3
		move.b	d0,d3
    6c5c:	move.b d0,d3
		move.l	a1,a2
    6c5e:	movea.l a1,a2
		sub.l	d3,a2
    6c60:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6c62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6c7c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6c7e:	moveq #0,d0
		move.b	(a0)+,d0
    6c80:	move.b (a0)+,d0
		add.w	d0,d0
    6c82:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6c84:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6c88:	jmp (0,a3,d0.w)

00006c8c <lz4Rts11>:
lz4Rts11:	rts
    6c8c:	rts

00006c8e <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    6c8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6c9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ca0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ca2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ca4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ca6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ca8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6caa:	cmpa.l a0,a4
		beq.s	lz4Rts12
    6cac:	beq.s 6ce6 <lz4Rts12>
		move.b	(a0)+,d0
    6cae:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6cb0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6cb2:	move.w (sp)+,d3
		move.b	d0,d3
    6cb4:	move.b d0,d3
		move.l	a1,a2
    6cb6:	movea.l a1,a2
		sub.l	d3,a2
    6cb8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6cba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cc8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ccc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6cd6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6cd8:	moveq #0,d0
		move.b	(a0)+,d0
    6cda:	move.b (a0)+,d0
		add.w	d0,d0
    6cdc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6cde:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6ce2:	jmp (0,a3,d0.w)

00006ce6 <lz4Rts12>:
lz4Rts12:	rts
    6ce6:	rts

00006ce8 <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    6ce8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cf0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cf2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cf4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cf6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cf8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cfa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6cfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d02:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6d04:	cmpa.l a0,a4
		beq.s	lz4Rts13
    6d06:	beq.s 6d42 <lz4Rts13>
		move.b	(a0)+,d0
    6d08:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6d0a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6d0c:	move.w (sp)+,d3
		move.b	d0,d3
    6d0e:	move.b d0,d3
		move.l	a1,a2
    6d10:	movea.l a1,a2
		sub.l	d3,a2
    6d12:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6d14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d30:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d32:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6d34:	moveq #0,d0
		move.b	(a0)+,d0
    6d36:	move.b (a0)+,d0
		add.w	d0,d0
    6d38:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6d3a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6d3e:	jmp (0,a3,d0.w)

00006d42 <lz4Rts13>:
lz4Rts13:	rts
    6d42:	rts

00006d44 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    6d44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6d5e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6d60:	cmpa.l a0,a4
		beq.s	lz4Rts14
    6d62:	beq.s 6da0 <lz4Rts14>
		move.b	(a0)+,d0
    6d64:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6d66:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6d68:	move.w (sp)+,d3
		move.b	d0,d3
    6d6a:	move.b d0,d3
		move.l	a1,a2
    6d6c:	movea.l a1,a2
		sub.l	d3,a2
    6d6e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6d70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d8c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d8e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6d90:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6d92:	moveq #0,d0
		move.b	(a0)+,d0
    6d94:	move.b (a0)+,d0
		add.w	d0,d0
    6d96:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6d98:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6d9c:	jmp (0,a3,d0.w)

00006da0 <lz4Rts14>:
lz4Rts14:	rts
    6da0:	rts

00006da2 <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    6da2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6da4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6da6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6da8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6daa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6dac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6dae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6db0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6db2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6db4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6db6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6db8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6dba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6dbc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6dbe:	cmpa.l a0,a4
		beq.s	lz4Rts15
    6dc0:	beq.s 6e00 <lz4Rts15>
		move.b	(a0)+,d0
    6dc2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6dc4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6dc6:	move.w (sp)+,d3
		move.b	d0,d3
    6dc8:	move.b d0,d3
		move.l	a1,a2
    6dca:	movea.l a1,a2
		sub.l	d3,a2
    6dcc:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6dce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dd6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dd8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dda:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ddc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dde:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6de0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6de2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6de4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6de6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6de8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6dee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6df0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6df2:	moveq #0,d0
		move.b	(a0)+,d0
    6df4:	move.b (a0)+,d0
		add.w	d0,d0
    6df6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6df8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6dfc:	jmp (0,a3,d0.w)

00006e00 <lz4Rts15>:
lz4Rts15:	rts
    6e00:	rts

00006e02 <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    6e02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e1c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6e1e:	cmpa.l a0,a4
		beq.s	lz4Rts16
    6e20:	beq.s 6e76 <lz4Rts16>
		move.b	(a0)+,d0
    6e22:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6e24:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6e26:	move.w (sp)+,d3
		move.b	d0,d3
    6e28:	move.b d0,d3
		move.l	a1,a2
    6e2a:	movea.l a1,a2
		sub.l	d3,a2
    6e2c:	suba.l d3,a2
		moveq	#15+4,d1
    6e2e:	moveq #19,d1

00006e30 <.cl0>:
.cl0:	move.b	(a0)+,d2
    6e30:	/-> move.b (a0)+,d2
		add.l d2,d1
    6e32:	|   add.l d2,d1
		not.b	d2
    6e34:	|   not.b d2
		beq.s	.cl0
    6e36:	\-- beq.s 6e30 <.cl0>
		moveq	#15,d5
    6e38:	    moveq #15,d5
		and.w	d1,d5
    6e3a:	    and.w d1,d5
		add.w	d5,d5
    6e3c:	    add.w d5,d5
		neg.w	d5
    6e3e:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    6e40:	    jmp (6e64 <.eloop1>,pc,d5.w)

00006e44 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    6e44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e50:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e52:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e54:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e5a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6e62:	move.b (a2)+,(a1)+

00006e64 <.eloop1>:
.eloop1:	sub.l	d7,d1
    6e64:	sub.l d7,d1
		bpl.s	.tloop1
    6e66:	bpl.s 6e44 <.tloop1>
		moveq	#0,d0
    6e68:	moveq #0,d0
		move.b	(a0)+,d0
    6e6a:	move.b (a0)+,d0
		add.w	d0,d0
    6e6c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6e6e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6e72:	jmp (0,a3,d0.w)

00006e76 <lz4Rts16>:
lz4Rts16:	rts
    6e76:	rts

00006e78 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    6e78:	moveq #15,d1

00006e7a <.cl2>:
.cl2:	move.b	(a0)+,d2
    6e7a:	/-> move.b (a0)+,d2
		add.l d2,d1
    6e7c:	|   add.l d2,d1
		not.b	d2
    6e7e:	|   not.b d2
		beq.s	.cl2
    6e80:	\-- beq.s 6e7a <.cl2>
		moveq	#15,d5
    6e82:	    moveq #15,d5
		and.w	d1,d5
    6e84:	    and.w d1,d5
		add.w	d5,d5
    6e86:	    add.w d5,d5
		neg.w	d5
    6e88:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    6e8a:	    jmp (6eae <.eloop3>,pc,d5.w)

00006e8e <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    6e8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6e9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ea0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ea2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ea4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ea6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ea8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6eaa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6eac:	move.b (a0)+,(a1)+

00006eae <.eloop3>:
.eloop3:	sub.l	d7,d1
    6eae:	sub.l d7,d1
		bpl.s	.tloop3
    6eb0:	bpl.s 6e8e <.tloop3>
		cmpa.l	a0,a4
    6eb2:	cmpa.l a0,a4
		beq.s	lz4Rts17
    6eb4:	beq.s 6ed8 <lz4Rts17>
		move.b	(a0)+,d0
    6eb6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6eb8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6eba:	move.w (sp)+,d3
		move.b	d0,d3
    6ebc:	move.b d0,d3
		move.l	a1,a2
    6ebe:	movea.l a1,a2
		sub.l	d3,a2
    6ec0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6ec2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ec4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ec6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ec8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6eca:	moveq #0,d0
		move.b	(a0)+,d0
    6ecc:	move.b (a0)+,d0
		add.w	d0,d0
    6ece:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6ed0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6ed4:	jmp (0,a3,d0.w)

00006ed8 <lz4Rts17>:
lz4Rts17:	rts
    6ed8:	rts

00006eda <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    6eda:	moveq #15,d1

00006edc <.cl4>:
.cl4:	move.b	(a0)+,d2
    6edc:	/-> move.b (a0)+,d2
		add.l d2,d1
    6ede:	|   add.l d2,d1
		not.b	d2
    6ee0:	|   not.b d2
		beq.s	.cl4
    6ee2:	\-- beq.s 6edc <.cl4>
		moveq	#15,d5
    6ee4:	    moveq #15,d5
		and.w	d1,d5
    6ee6:	    and.w d1,d5
		add.w	d5,d5
    6ee8:	    add.w d5,d5
		neg.w	d5
    6eea:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    6eec:	    jmp (6f10 <.eloop5>,pc,d5.w)

00006ef0 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    6ef0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ef2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ef4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ef6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ef8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6efa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6efc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6efe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f0e:	move.b (a0)+,(a1)+

00006f10 <.eloop5>:
.eloop5:	sub.l	d7,d1
    6f10:	sub.l d7,d1
		bpl.s	.tloop5
    6f12:	bpl.s 6ef0 <.tloop5>
		cmpa.l	a0,a4
    6f14:	cmpa.l a0,a4
		beq.s	lz4Rts18
    6f16:	beq.s 6f3c <lz4Rts18>
		move.b	(a0)+,d0
    6f18:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6f1a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6f1c:	move.w (sp)+,d3
		move.b	d0,d3
    6f1e:	move.b d0,d3
		move.l	a1,a2
    6f20:	movea.l a1,a2
		sub.l	d3,a2
    6f22:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6f24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f2c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6f2e:	moveq #0,d0
		move.b	(a0)+,d0
    6f30:	move.b (a0)+,d0
		add.w	d0,d0
    6f32:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6f34:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6f38:	jmp (0,a3,d0.w)

00006f3c <lz4Rts18>:
lz4Rts18:	rts
    6f3c:	rts

00006f3e <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    6f3e:	moveq #15,d1

00006f40 <.cl6>:
.cl6:	move.b	(a0)+,d2
    6f40:	/-> move.b (a0)+,d2
		add.l d2,d1
    6f42:	|   add.l d2,d1
		not.b	d2
    6f44:	|   not.b d2
		beq.s	.cl6
    6f46:	\-- beq.s 6f40 <.cl6>
		moveq	#15,d5
    6f48:	    moveq #15,d5
		and.w	d1,d5
    6f4a:	    and.w d1,d5
		add.w	d5,d5
    6f4c:	    add.w d5,d5
		neg.w	d5
    6f4e:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    6f50:	    jmp (6f74 <.eloop7>,pc,d5.w)

00006f54 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    6f54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6f72:	move.b (a0)+,(a1)+

00006f74 <.eloop7>:
.eloop7:	sub.l	d7,d1
    6f74:	sub.l d7,d1
		bpl.s	.tloop7
    6f76:	bpl.s 6f54 <.tloop7>
		cmpa.l	a0,a4
    6f78:	cmpa.l a0,a4
		beq.s	lz4Rts19
    6f7a:	beq.s 6fa2 <lz4Rts19>
		move.b	(a0)+,d0
    6f7c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6f7e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6f80:	move.w (sp)+,d3
		move.b	d0,d3
    6f82:	move.b d0,d3
		move.l	a1,a2
    6f84:	movea.l a1,a2
		sub.l	d3,a2
    6f86:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6f88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f8c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f8e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6f92:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6f94:	moveq #0,d0
		move.b	(a0)+,d0
    6f96:	move.b (a0)+,d0
		add.w	d0,d0
    6f98:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6f9a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6f9e:	jmp (0,a3,d0.w)

00006fa2 <lz4Rts19>:
lz4Rts19:	rts
    6fa2:	rts

00006fa4 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    6fa4:	moveq #15,d1

00006fa6 <.cl8>:
.cl8:	move.b	(a0)+,d2
    6fa6:	/-> move.b (a0)+,d2
		add.l d2,d1
    6fa8:	|   add.l d2,d1
		not.b	d2
    6faa:	|   not.b d2
		beq.s	.cl8
    6fac:	\-- beq.s 6fa6 <.cl8>
		moveq	#15,d5
    6fae:	    moveq #15,d5
		and.w	d1,d5
    6fb0:	    and.w d1,d5
		add.w	d5,d5
    6fb2:	    add.w d5,d5
		neg.w	d5
    6fb4:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    6fb6:	    jmp (6fda <.eloop9>,pc,d5.w)

00006fba <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    6fba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fc4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fd2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fd4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fd6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6fd8:	move.b (a0)+,(a1)+

00006fda <.eloop9>:
.eloop9:	sub.l	d7,d1
    6fda:	sub.l d7,d1
		bpl.s	.tloop9
    6fdc:	bpl.s 6fba <.tloop9>
		cmpa.l	a0,a4
    6fde:	cmpa.l a0,a4
		beq.s	lz4Rts20
    6fe0:	beq.s 700a <lz4Rts20>
		move.b	(a0)+,d0
    6fe2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6fe4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6fe6:	move.w (sp)+,d3
		move.b	d0,d3
    6fe8:	move.b d0,d3
		move.l	a1,a2
    6fea:	movea.l a1,a2
		sub.l	d3,a2
    6fec:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6fee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ff0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ff2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ff4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ff6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ff8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ffa:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6ffc:	moveq #0,d0
		move.b	(a0)+,d0
    6ffe:	move.b (a0)+,d0
		add.w	d0,d0
    7000:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7002:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7006:	jmp (0,a3,d0.w)

0000700a <lz4Rts20>:
lz4Rts20:	rts
    700a:	rts

0000700c <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    700c:	moveq #15,d1

0000700e <.cl10>:
.cl10:	move.b	(a0)+,d2
    700e:	/-> move.b (a0)+,d2
		add.l d2,d1
    7010:	|   add.l d2,d1
		not.b	d2
    7012:	|   not.b d2
		beq.s	.cl10
    7014:	\-- beq.s 700e <.cl10>
		moveq	#15,d5
    7016:	    moveq #15,d5
		and.w	d1,d5
    7018:	    and.w d1,d5
		add.w	d5,d5
    701a:	    add.w d5,d5
		neg.w	d5
    701c:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    701e:	    jmp (7042 <.eloop11>,pc,d5.w)

00007022 <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    7022:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7024:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7026:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7028:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    702a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    702c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    702e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7030:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7032:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7034:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7036:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7038:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    703a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    703c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    703e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7040:	move.b (a0)+,(a1)+

00007042 <.eloop11>:
.eloop11:	sub.l	d7,d1
    7042:	sub.l d7,d1
		bpl.s	.tloop11
    7044:	bpl.s 7022 <.tloop11>
		cmpa.l	a0,a4
    7046:	cmpa.l a0,a4
		beq.s	lz4Rts21
    7048:	beq.s 7074 <lz4Rts21>
		move.b	(a0)+,d0
    704a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    704c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    704e:	move.w (sp)+,d3
		move.b	d0,d3
    7050:	move.b d0,d3
		move.l	a1,a2
    7052:	movea.l a1,a2
		sub.l	d3,a2
    7054:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    7056:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7058:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    705a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    705c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    705e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7060:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7062:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7064:	move.b (a2)+,(a1)+
		moveq	#0,d0
    7066:	moveq #0,d0
		move.b	(a0)+,d0
    7068:	move.b (a0)+,d0
		add.w	d0,d0
    706a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    706c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7070:	jmp (0,a3,d0.w)

00007074 <lz4Rts21>:
lz4Rts21:	rts
    7074:	rts

00007076 <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    7076:	moveq #15,d1

00007078 <.cl12>:
.cl12:	move.b	(a0)+,d2
    7078:	/-> move.b (a0)+,d2
		add.l d2,d1
    707a:	|   add.l d2,d1
		not.b	d2
    707c:	|   not.b d2
		beq.s	.cl12
    707e:	\-- beq.s 7078 <.cl12>
		moveq	#15,d5
    7080:	    moveq #15,d5
		and.w	d1,d5
    7082:	    and.w d1,d5
		add.w	d5,d5
    7084:	    add.w d5,d5
		neg.w	d5
    7086:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    7088:	    jmp (70ac <.eloop13>,pc,d5.w)

0000708c <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    708c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    708e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7090:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7092:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7094:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7096:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7098:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    709a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    709c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    709e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70aa:	move.b (a0)+,(a1)+

000070ac <.eloop13>:
.eloop13:	sub.l	d7,d1
    70ac:	sub.l d7,d1
		bpl.s	.tloop13
    70ae:	bpl.s 708c <.tloop13>
		cmpa.l	a0,a4
    70b0:	cmpa.l a0,a4
		beq.s	lz4Rts22
    70b2:	beq.s 70e0 <lz4Rts22>
		move.b	(a0)+,d0
    70b4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    70b6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    70b8:	move.w (sp)+,d3
		move.b	d0,d3
    70ba:	move.b d0,d3
		move.l	a1,a2
    70bc:	movea.l a1,a2
		sub.l	d3,a2
    70be:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    70c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    70d0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    70d2:	moveq #0,d0
		move.b	(a0)+,d0
    70d4:	move.b (a0)+,d0
		add.w	d0,d0
    70d6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    70d8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    70dc:	jmp (0,a3,d0.w)

000070e0 <lz4Rts22>:
lz4Rts22:	rts
    70e0:	rts

000070e2 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    70e2:	moveq #15,d1

000070e4 <.cl14>:
.cl14:	move.b	(a0)+,d2
    70e4:	/-> move.b (a0)+,d2
		add.l d2,d1
    70e6:	|   add.l d2,d1
		not.b	d2
    70e8:	|   not.b d2
		beq.s	.cl14
    70ea:	\-- beq.s 70e4 <.cl14>
		moveq	#15,d5
    70ec:	    moveq #15,d5
		and.w	d1,d5
    70ee:	    and.w d1,d5
		add.w	d5,d5
    70f0:	    add.w d5,d5
		neg.w	d5
    70f2:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    70f4:	    jmp (7118 <.eloop15>,pc,d5.w)

000070f8 <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    70f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    70fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7100:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7102:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7104:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7106:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7108:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    710a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    710c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    710e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7110:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7112:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7114:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7116:	move.b (a0)+,(a1)+

00007118 <.eloop15>:
.eloop15:	sub.l	d7,d1
    7118:	sub.l d7,d1
		bpl.s	.tloop15
    711a:	bpl.s 70f8 <.tloop15>
		cmpa.l	a0,a4
    711c:	cmpa.l a0,a4
		beq.s	lz4Rts23
    711e:	beq.s 714e <lz4Rts23>
		move.b	(a0)+,d0
    7120:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    7122:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    7124:	move.w (sp)+,d3
		move.b	d0,d3
    7126:	move.b d0,d3
		move.l	a1,a2
    7128:	movea.l a1,a2
		sub.l	d3,a2
    712a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    712c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    712e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7130:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7132:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7134:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7136:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7138:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    713a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    713c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    713e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    7140:	moveq #0,d0
		move.b	(a0)+,d0
    7142:	move.b (a0)+,d0
		add.w	d0,d0
    7144:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7146:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    714a:	jmp (0,a3,d0.w)

0000714e <lz4Rts23>:
lz4Rts23:	rts
    714e:	rts

00007150 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    7150:	moveq #15,d1

00007152 <.cl16>:
.cl16:	move.b	(a0)+,d2
    7152:	/-> move.b (a0)+,d2
		add.l d2,d1
    7154:	|   add.l d2,d1
		not.b	d2
    7156:	|   not.b d2
		beq.s	.cl16
    7158:	\-- beq.s 7152 <.cl16>
		moveq	#15,d5
    715a:	    moveq #15,d5
		and.w	d1,d5
    715c:	    and.w d1,d5
		add.w	d5,d5
    715e:	    add.w d5,d5
		neg.w	d5
    7160:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    7162:	    jmp (7186 <.eloop17>,pc,d5.w)

00007166 <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    7166:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7168:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    716a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    716c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    716e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7170:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7172:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7174:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7176:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7178:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    717a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    717c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    717e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7180:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7182:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7184:	move.b (a0)+,(a1)+

00007186 <.eloop17>:
.eloop17:	sub.l	d7,d1
    7186:	sub.l d7,d1
		bpl.s	.tloop17
    7188:	bpl.s 7166 <.tloop17>
		cmpa.l	a0,a4
    718a:	cmpa.l a0,a4
		beq.s	lz4Rts24
    718c:	beq.s 71be <lz4Rts24>
		move.b	(a0)+,d0
    718e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    7190:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    7192:	move.w (sp)+,d3
		move.b	d0,d3
    7194:	move.b d0,d3
		move.l	a1,a2
    7196:	movea.l a1,a2
		sub.l	d3,a2
    7198:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    719a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    719c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    719e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    71ae:	move.b (a2)+,(a1)+
		moveq	#0,d0
    71b0:	moveq #0,d0
		move.b	(a0)+,d0
    71b2:	move.b (a0)+,d0
		add.w	d0,d0
    71b4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    71b6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    71ba:	jmp (0,a3,d0.w)

000071be <lz4Rts24>:
lz4Rts24:	rts
    71be:	rts

000071c0 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    71c0:	moveq #15,d1

000071c2 <.cl18>:
.cl18:	move.b	(a0)+,d2
    71c2:	/-> move.b (a0)+,d2
		add.l d2,d1
    71c4:	|   add.l d2,d1
		not.b	d2
    71c6:	|   not.b d2
		beq.s	.cl18
    71c8:	\-- beq.s 71c2 <.cl18>
		moveq	#15,d5
    71ca:	    moveq #15,d5
		and.w	d1,d5
    71cc:	    and.w d1,d5
		add.w	d5,d5
    71ce:	    add.w d5,d5
		neg.w	d5
    71d0:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    71d2:	    jmp (71f6 <.eloop19>,pc,d5.w)

000071d6 <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    71d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    71f4:	move.b (a0)+,(a1)+

000071f6 <.eloop19>:
.eloop19:	sub.l	d7,d1
    71f6:	sub.l d7,d1
		bpl.s	.tloop19
    71f8:	bpl.s 71d6 <.tloop19>
		cmpa.l	a0,a4
    71fa:	cmpa.l a0,a4
		beq.s	lz4Rts25
    71fc:	beq.s 7230 <lz4Rts25>
		move.b	(a0)+,d0
    71fe:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    7200:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    7202:	move.w (sp)+,d3
		move.b	d0,d3
    7204:	move.b d0,d3
		move.l	a1,a2
    7206:	movea.l a1,a2
		sub.l	d3,a2
    7208:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    720a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    720c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    720e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7210:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7212:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7214:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7216:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7218:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    721a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    721c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    721e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7220:	move.b (a2)+,(a1)+
		moveq	#0,d0
    7222:	moveq #0,d0
		move.b	(a0)+,d0
    7224:	move.b (a0)+,d0
		add.w	d0,d0
    7226:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7228:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    722c:	jmp (0,a3,d0.w)

00007230 <lz4Rts25>:
lz4Rts25:	rts
    7230:	rts

00007232 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    7232:	moveq #15,d1

00007234 <.cl20>:
.cl20:	move.b	(a0)+,d2
    7234:	/-> move.b (a0)+,d2
		add.l d2,d1
    7236:	|   add.l d2,d1
		not.b	d2
    7238:	|   not.b d2
		beq.s	.cl20
    723a:	\-- beq.s 7234 <.cl20>
		moveq	#15,d5
    723c:	    moveq #15,d5
		and.w	d1,d5
    723e:	    and.w d1,d5
		add.w	d5,d5
    7240:	    add.w d5,d5
		neg.w	d5
    7242:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    7244:	    jmp (7268 <.eloop21>,pc,d5.w)

00007248 <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    7248:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    724a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    724c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    724e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7250:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7252:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7254:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7256:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7258:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    725a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    725c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    725e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7260:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7262:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7264:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7266:	move.b (a0)+,(a1)+

00007268 <.eloop21>:
.eloop21:	sub.l	d7,d1
    7268:	sub.l d7,d1
		bpl.s	.tloop21
    726a:	bpl.s 7248 <.tloop21>
		cmpa.l	a0,a4
    726c:	cmpa.l a0,a4
		beq.s	lz4Rts26
    726e:	beq.s 72a4 <lz4Rts26>
		move.b	(a0)+,d0
    7270:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    7272:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    7274:	move.w (sp)+,d3
		move.b	d0,d3
    7276:	move.b d0,d3
		move.l	a1,a2
    7278:	movea.l a1,a2
		sub.l	d3,a2
    727a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    727c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    727e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7280:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7282:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7284:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7286:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7288:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    728a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    728c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    728e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7290:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7292:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7294:	move.b (a2)+,(a1)+
		moveq	#0,d0
    7296:	moveq #0,d0
		move.b	(a0)+,d0
    7298:	move.b (a0)+,d0
		add.w	d0,d0
    729a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    729c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    72a0:	jmp (0,a3,d0.w)

000072a4 <lz4Rts26>:
lz4Rts26:	rts
    72a4:	rts

000072a6 <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    72a6:	moveq #15,d1

000072a8 <.cl22>:
.cl22:	move.b	(a0)+,d2
    72a8:	/-> move.b (a0)+,d2
		add.l d2,d1
    72aa:	|   add.l d2,d1
		not.b	d2
    72ac:	|   not.b d2
		beq.s	.cl22
    72ae:	\-- beq.s 72a8 <.cl22>
		moveq	#15,d5
    72b0:	    moveq #15,d5
		and.w	d1,d5
    72b2:	    and.w d1,d5
		add.w	d5,d5
    72b4:	    add.w d5,d5
		neg.w	d5
    72b6:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    72b8:	    jmp (72dc <.eloop23>,pc,d5.w)

000072bc <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    72bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    72da:	move.b (a0)+,(a1)+

000072dc <.eloop23>:
.eloop23:	sub.l	d7,d1
    72dc:	sub.l d7,d1
		bpl.s	.tloop23
    72de:	bpl.s 72bc <.tloop23>
		cmpa.l	a0,a4
    72e0:	cmpa.l a0,a4
		beq.s	lz4Rts27
    72e2:	beq.s 731a <lz4Rts27>
		move.b	(a0)+,d0
    72e4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    72e6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    72e8:	move.w (sp)+,d3
		move.b	d0,d3
    72ea:	move.b d0,d3
		move.l	a1,a2
    72ec:	movea.l a1,a2
		sub.l	d3,a2
    72ee:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    72f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    72fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7300:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7302:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7304:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7306:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7308:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    730a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    730c:	moveq #0,d0
		move.b	(a0)+,d0
    730e:	move.b (a0)+,d0
		add.w	d0,d0
    7310:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7312:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7316:	jmp (0,a3,d0.w)

0000731a <lz4Rts27>:
lz4Rts27:	rts
    731a:	rts

0000731c <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    731c:	moveq #15,d1

0000731e <.cl24>:
.cl24:	move.b	(a0)+,d2
    731e:	/-> move.b (a0)+,d2
		add.l d2,d1
    7320:	|   add.l d2,d1
		not.b	d2
    7322:	|   not.b d2
		beq.s	.cl24
    7324:	\-- beq.s 731e <.cl24>
		moveq	#15,d5
    7326:	    moveq #15,d5
		and.w	d1,d5
    7328:	    and.w d1,d5
		add.w	d5,d5
    732a:	    add.w d5,d5
		neg.w	d5
    732c:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    732e:	    jmp (7352 <.eloop25>,pc,d5.w)

00007332 <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    7332:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7334:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7336:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7338:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    733a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    733c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    733e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7340:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7342:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7344:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7346:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7348:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    734a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    734c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    734e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7350:	move.b (a0)+,(a1)+

00007352 <.eloop25>:
.eloop25:	sub.l	d7,d1
    7352:	sub.l d7,d1
		bpl.s	.tloop25
    7354:	bpl.s 7332 <.tloop25>
		cmpa.l	a0,a4
    7356:	cmpa.l a0,a4
		beq.s	lz4Rts28
    7358:	beq.s 7392 <lz4Rts28>
		move.b	(a0)+,d0
    735a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    735c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    735e:	move.w (sp)+,d3
		move.b	d0,d3
    7360:	move.b d0,d3
		move.l	a1,a2
    7362:	movea.l a1,a2
		sub.l	d3,a2
    7364:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    7366:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7368:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    736a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    736c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    736e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7370:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7372:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7374:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7376:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7378:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    737a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    737c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    737e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7380:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7382:	move.b (a2)+,(a1)+
		moveq	#0,d0
    7384:	moveq #0,d0
		move.b	(a0)+,d0
    7386:	move.b (a0)+,d0
		add.w	d0,d0
    7388:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    738a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    738e:	jmp (0,a3,d0.w)

00007392 <lz4Rts28>:
lz4Rts28:	rts
    7392:	rts

00007394 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    7394:	moveq #15,d1

00007396 <.cl26>:
.cl26:	move.b	(a0)+,d2
    7396:	/-> move.b (a0)+,d2
		add.l d2,d1
    7398:	|   add.l d2,d1
		not.b	d2
    739a:	|   not.b d2
		beq.s	.cl26
    739c:	\-- beq.s 7396 <.cl26>
		moveq	#15,d5
    739e:	    moveq #15,d5
		and.w	d1,d5
    73a0:	    and.w d1,d5
		add.w	d5,d5
    73a2:	    add.w d5,d5
		neg.w	d5
    73a4:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    73a6:	    jmp (73ca <.eloop27>,pc,d5.w)

000073aa <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    73aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    73c8:	move.b (a0)+,(a1)+

000073ca <.eloop27>:
.eloop27:	sub.l	d7,d1
    73ca:	sub.l d7,d1
		bpl.s	.tloop27
    73cc:	bpl.s 73aa <.tloop27>
		cmpa.l	a0,a4
    73ce:	cmpa.l a0,a4
		beq.s	lz4Rts29
    73d0:	beq.s 740c <lz4Rts29>
		move.b	(a0)+,d0
    73d2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    73d4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    73d6:	move.w (sp)+,d3
		move.b	d0,d3
    73d8:	move.b d0,d3
		move.l	a1,a2
    73da:	movea.l a1,a2
		sub.l	d3,a2
    73dc:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    73de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    73fc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    73fe:	moveq #0,d0
		move.b	(a0)+,d0
    7400:	move.b (a0)+,d0
		add.w	d0,d0
    7402:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7404:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7408:	jmp (0,a3,d0.w)

0000740c <lz4Rts29>:
lz4Rts29:	rts
    740c:	rts

0000740e <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    740e:	moveq #15,d1

00007410 <.cl28>:
.cl28:	move.b	(a0)+,d2
    7410:	/-> move.b (a0)+,d2
		add.l d2,d1
    7412:	|   add.l d2,d1
		not.b	d2
    7414:	|   not.b d2
		beq.s	.cl28
    7416:	\-- beq.s 7410 <.cl28>
		moveq	#15,d5
    7418:	    moveq #15,d5
		and.w	d1,d5
    741a:	    and.w d1,d5
		add.w	d5,d5
    741c:	    add.w d5,d5
		neg.w	d5
    741e:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    7420:	    jmp (7444 <.eloop29>,pc,d5.w)

00007424 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    7424:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7426:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7428:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    742a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    742c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    742e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7430:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7432:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7434:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7436:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7438:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    743a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    743c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    743e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7440:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7442:	move.b (a0)+,(a1)+

00007444 <.eloop29>:
.eloop29:	sub.l	d7,d1
    7444:	sub.l d7,d1
		bpl.s	.tloop29
    7446:	bpl.s 7424 <.tloop29>
		cmpa.l	a0,a4
    7448:	cmpa.l a0,a4
		beq.s	lz4Rts30
    744a:	beq.s 7488 <lz4Rts30>
		move.b	(a0)+,d0
    744c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    744e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    7450:	move.w (sp)+,d3
		move.b	d0,d3
    7452:	move.b d0,d3
		move.l	a1,a2
    7454:	movea.l a1,a2
		sub.l	d3,a2
    7456:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    7458:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    745a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    745c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    745e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7460:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7462:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7464:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7466:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7468:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    746a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    746c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    746e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7470:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7472:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7474:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7476:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7478:	move.b (a2)+,(a1)+
		moveq	#0,d0
    747a:	moveq #0,d0
		move.b	(a0)+,d0
    747c:	move.b (a0)+,d0
		add.w	d0,d0
    747e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7480:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7484:	jmp (0,a3,d0.w)

00007488 <lz4Rts30>:
lz4Rts30:	rts
    7488:	rts

0000748a <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    748a:	moveq #15,d1

0000748c <.cl30>:
.cl30:	move.b	(a0)+,d2
    748c:	/-> move.b (a0)+,d2
		add.l d2,d1
    748e:	|   add.l d2,d1
		not.b	d2
    7490:	|   not.b d2
		beq.s	.cl30
    7492:	\-- beq.s 748c <.cl30>
		moveq	#15,d5
    7494:	    moveq #15,d5
		and.w	d1,d5
    7496:	    and.w d1,d5
		add.w	d5,d5
    7498:	    add.w d5,d5
		neg.w	d5
    749a:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    749c:	    jmp (74c0 <.eloop31>,pc,d5.w)

000074a0 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    74a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    74be:	move.b (a0)+,(a1)+

000074c0 <.eloop31>:
.eloop31:	sub.l	d7,d1
    74c0:	sub.l d7,d1
		bpl.s	.tloop31
    74c2:	bpl.s 74a0 <.tloop31>
		cmpa.l	a0,a4
    74c4:	cmpa.l a0,a4
		beq.s	lz4Rts31
    74c6:	beq.s 7506 <lz4Rts31>
		move.b	(a0)+,d0
    74c8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    74ca:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    74cc:	move.w (sp)+,d3
		move.b	d0,d3
    74ce:	move.b d0,d3
		move.l	a1,a2
    74d0:	movea.l a1,a2
		sub.l	d3,a2
    74d2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    74d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    74f6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    74f8:	moveq #0,d0
		move.b	(a0)+,d0
    74fa:	move.b (a0)+,d0
		add.w	d0,d0
    74fc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    74fe:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7502:	jmp (0,a3,d0.w)

00007506 <lz4Rts31>:
lz4Rts31:	rts
    7506:	rts

00007508 <ll_lm>:

ll_lm:
		moveq	#15,d1
    7508:	moveq #15,d1

0000750a <.cl32>:
.cl32:	move.b	(a0)+,d2
    750a:	/-> move.b (a0)+,d2
		add.l d2,d1
    750c:	|   add.l d2,d1
		not.b	d2
    750e:	|   not.b d2
		beq.s	.cl32
    7510:	\-- beq.s 750a <.cl32>
		moveq	#15,d5
    7512:	    moveq #15,d5
		and.w	d1,d5
    7514:	    and.w d1,d5
		add.w	d5,d5
    7516:	    add.w d5,d5
		neg.w	d5
    7518:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    751a:	    jmp (753e <.eloop33>,pc,d5.w)

0000751e <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    751e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7520:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7522:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7524:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7526:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7528:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    752a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    752c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    752e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7530:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7532:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7534:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7536:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    7538:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    753a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    753c:	move.b (a0)+,(a1)+

0000753e <.eloop33>:
.eloop33:	sub.l	d7,d1
    753e:	sub.l d7,d1
		bpl.s	.tloop33
    7540:	bpl.s 751e <.tloop33>
		cmpa.l	a0,a4
    7542:	cmpa.l a0,a4
		beq.s	lz4Rts32
    7544:	beq.s 759a <lz4Rts32>
		move.b	(a0)+,d0
    7546:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    7548:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    754a:	move.w (sp)+,d3
		move.b	d0,d3
    754c:	move.b d0,d3
		move.l	a1,a2
    754e:	movea.l a1,a2
		sub.l	d3,a2
    7550:	suba.l d3,a2
		moveq	#15+4,d1
    7552:	moveq #19,d1

00007554 <.cl34>:
.cl34:	move.b	(a0)+,d2
    7554:	/-> move.b (a0)+,d2
		add.l d2,d1
    7556:	|   add.l d2,d1
		not.b	d2
    7558:	|   not.b d2
		beq.s	.cl34
    755a:	\-- beq.s 7554 <.cl34>
		moveq	#15,d5
    755c:	    moveq #15,d5
		and.w	d1,d5
    755e:	    and.w d1,d5
		add.w	d5,d5
    7560:	    add.w d5,d5
		neg.w	d5
    7562:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    7564:	    jmp (7588 <.eloop35>,pc,d5.w)

00007568 <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    7568:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    756a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    756c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    756e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7570:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7572:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7574:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7576:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7578:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    757a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    757c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    757e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7580:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7582:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7584:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    7586:	move.b (a2)+,(a1)+

00007588 <.eloop35>:
.eloop35:	sub.l	d7,d1
    7588:	sub.l d7,d1
		bpl.s	.tloop35
    758a:	bpl.s 7568 <.tloop35>
		moveq	#0,d0
    758c:	moveq #0,d0
		move.b	(a0)+,d0
    758e:	move.b (a0)+,d0
		add.w	d0,d0
    7590:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    7592:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    7596:	jmp (0,a3,d0.w)

0000759a <lz4Rts32>:
lz4Rts32:				
			rts
    759a:	rts

0000759c <lz4Over>:

lz4Over:	rts
    759c:	rts

0000759e <lz4jmp>:
    759e:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    75a0:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    75a2:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    75a4:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    75a6:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    75a8:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    75aa:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    75ac:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    75ae:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    75b0:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    75b2:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    75b4:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    75b6:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    75b8:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    75ba:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    75bc:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    75be:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    75c0:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    75c2:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    75c4:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    75c6:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    75c8:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    75ca:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    75cc:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    75ce:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    75d0:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    75d2:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    75d4:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    75d6:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    75d8:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    75da:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    75dc:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    75de:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    75e0:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    75e2:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    75e4:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    75e6:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    75e8:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    75ea:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    75ec:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    75ee:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    75f0:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    75f2:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    75f4:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    75f6:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    75f8:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    75fa:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    75fc:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    75fe:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    7600:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    7602:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    7604:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    7606:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    7608:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    760a:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    760c:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    760e:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    7610:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    7612:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    7614:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    7616:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    7618:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    761a:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    761c:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    761e:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    7620:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    7622:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    7624:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    7626:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    7628:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    762a:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    762c:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    762e:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    7630:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    7632:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    7634:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    7636:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    7638:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    763a:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    763c:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    763e:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    7640:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    7642:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    7644:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    7646:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    7648:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    764a:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    764c:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    764e:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    7650:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    7652:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    7654:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    7656:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    7658:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    765a:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    765c:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    765e:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    7660:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    7662:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    7664:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    7666:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    7668:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    766a:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    766c:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    766e:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    7670:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    7672:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    7674:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    7676:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    7678:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    767a:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    767c:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    767e:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    7680:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    7682:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    7684:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    7686:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    7688:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    768a:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    768c:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    768e:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    7690:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    7692:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    7694:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    7696:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    7698:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    769a:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    769c:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    769e:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    76a0:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    76a2:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    76a4:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    76a6:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    76a8:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    76aa:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    76ac:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    76ae:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    76b0:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    76b2:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    76b4:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    76b6:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    76b8:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    76ba:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    76bc:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    76be:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    76c0:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    76c2:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    76c4:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    76c6:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    76c8:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    76ca:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    76cc:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    76ce:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    76d0:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    76d2:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    76d4:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    76d6:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    76d8:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    76da:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    76dc:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    76de:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    76e0:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    76e2:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    76e4:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    76e6:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    76e8:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    76ea:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    76ec:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    76ee:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    76f0:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    76f2:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    76f4:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    76f6:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    76f8:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    76fa:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    76fc:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    76fe:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    7700:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    7702:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    7704:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    7706:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    7708:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    770a:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    770c:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    770e:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    7710:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    7712:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    7714:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    7716:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    7718:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    771a:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    771c:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    771e:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    7720:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    7722:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    7724:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    7726:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    7728:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    772a:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    772c:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    772e:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    7730:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    7732:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    7734:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    7736:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    7738:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    773a:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    773c:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    773e:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    7740:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    7742:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    7744:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    7746:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    7748:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    774a:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    774c:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    774e:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    7750:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    7752:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    7754:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    7756:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    7758:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    775a:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    775c:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    775e:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    7760:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    7762:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    7764:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    7766:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    7768:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    776a:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    776c:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    776e:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    7770:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    7772:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    7774:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    7776:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    7778:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    777a:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    777c:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    777e:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    7780:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    7782:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    7784:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    7786:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    7788:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    778a:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    778c:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    778e:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    7790:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    7792:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    7794:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    7796:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    7798:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    779a:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    779c:	.short 0xff6a

Disassembly of section CODE:

0000779e <P61B>:

	endc	;ifne asmonereport

P61B:
P61_motuuli:
	jmp P61_Init(PC)
    779e:	jmp 77fc <_P61_Init>(pc)

	ifeq p61cia
	jmp P61_Music(PC)
	else
	rts
    77a2:	rts
	rts
    77a4:	rts
	endc

	jmp P61_End(PC)
    77a6:	jmp 7ace <_P61_End>(pc)

	rts				;no P61_SetRepeat
    77aa:	rts
	rts
    77ac:	rts

	ifne p61jump
	jmp P61_SetPosition(PC)
	else
	rts
    77ae:	rts
	rts
    77b0:	rts

000077b2 <P61_Master>:
    77b2:	Address 0x77b4 is out of bounds.


000077b4 <P61_Tempo>:
    77b4:	Address 0x77b6 is out of bounds.


000077b6 <P61_Play>:
    77b6:	Address 0x77b8 is out of bounds.


000077b8 <P61_E8>:
	...

000077ba <P61_VBR>:
    77ba:	ori.b #0,d0

000077be <P61_Pos>:
	...

000077c0 <P61_Patt>:
	...

000077c2 <P61_CRow>:
	...

000077c4 <P61_Temp0Offset>:
    77c4:	ori.b #-124,d0

000077c8 <P61_Temp1Offset>:
    77c8:	ori.b #-60,d0

000077cc <P61_Temp2Offset>:
    77cc:	ori.b #4,d0

000077d0 <P61_Temp3Offset>:
    77d0:	ori.b #68,d0

000077d4 <P61_intti>:
.nonote:
	endm
	ifeq p61system
	ifne p61cia
P61_intti:
	movem.l d0-a6,-(sp)
    77d4:	movem.l d0-a6,-(sp)
	tst.b $bfdd00
    77d8:	tst.b bfdd00 <_end+0xb66acc>
	lea $dff000+C,a6
    77de:	lea dff000 <_end+0xd67dcc>,a6
	move #$2000,$9c-C(a6)
    77e4:	move.w #8192,156(a6)
	move #$2000,$9c-C(a6)
    77ea:	move.w #8192,156(a6)
	bsr P61_Music
    77f0:	bsr.w 7b34 <_P61_Music>
	movem.l (sp)+,d0-a6
    77f4:	movem.l (sp)+,d0-a6
	nop
    77f8:	nop
	rte
    77fa:	rte

000077fc <_P61_Init>:
* Returns:	D0=0 if okay (i.e. P61 module!). No need to change D0.l.
* NOTE: the define 'start' has been made runtime. move.w #<startpos>,P61_InitPos instead.

_P61_Init:
P61_Init:
	lea $dff000+C,a6
    77fc:	    lea dff000 <_end+0xd67dcc>,a6
	addq.w #4,a5
	dbf d5,.choffl
	endc
	endc

	cmp.l #"P61A",(a0)+
    7802:	    cmpi.l #1345728833,(a0)+
	beq.b .modok
    7808:	/-- beq.s 780c <_P61_Init+0x10>
	subq.l #4,a0
    780a:	|   subq.l #4,a0
.modok:
	ifne p61cia
	move d0,-(sp)
    780c:	\-> move.w d0,-(sp)
	endc
	moveq #0,d0
    780e:	    moveq #0,d0
	cmp.l d0,a1
    7810:	    cmpa.l d0,a1
	bne.b .redirect
    7812:	/-- bne.s 781a <_P61_Init+0x1e>
	move (a0),d0
    7814:	|   move.w (a0),d0
	lea (a0,d0.l),a1
    7816:	|   lea (0,a0,d0.l),a1
.redirect:
	move.l a2,a6
    781a:	\-> movea.l a2,a6
	lea 8(a0),a2
    781c:	    lea 8(a0),a2
	moveq #$40,d0
    7820:	    moveq #64,d0
	and.b 3(a0),d0
    7822:	    and.b 3(a0),d0
	bne.b .buffer
    7826:	/-- bne.s 782c <_P61_Init+0x30>
	move.l a1,a6
    7828:	|   movea.l a1,a6
	subq.l #4,a2
    782a:	|   subq.l #4,a2
.buffer:

	lea P61_cn(pc),a3
    782c:	\-> lea 8222 <P61_cn>(pc),a3

	move.w #$ff00,d1
    7830:	    move.w #-256,d1
	move.w d1,P61_OnOff+P61_temp0-P61_cn(a3)	;stop active decsteps
    7834:	    move.w d1,-248(a3)
	move.w d1,P61_OnOff+P61_temp1-P61_cn(a3)
    7838:	    move.w d1,-184(a3)
	move.w d1,P61_OnOff+P61_temp2-P61_cn(a3)
    783c:	    move.w d1,-120(a3)
	move.w d1,P61_OnOff+P61_temp3-P61_cn(a3)
    7840:	    move.w d1,-56(a3)

	ifne copdma
	move.l a4,p61_DMApokeAddr-P61_cn(a3)
	endc

	moveq #$1f,d1
    7844:	    moveq #31,d1
	and.b 3(a0),d1
    7846:	    and.b 3(a0),d1
	move.l a0,-(sp)
    784a:	    move.l a0,-(sp)
;;    ---  insert pan/echo in this loop  ---
	lea P61_samples(pc),a4
    784c:	    lea 8298 <P61_samples>(pc),a4
	subq #1,d1
    7850:	    subq.w #1,d1
	moveq #0,d4
    7852:	    moveq #0,d4

00007854 <P61_lopos>:
P61_lopos:
	move.l a6,(a4)+
    7854:	move.l a6,(a4)+
	move (a2)+,d4
    7856:	move.w (a2)+,d4
	bpl.b P61_kook
    7858:	bpl.s 7874 <P61_kook>
	neg d4
    785a:	neg.w d4
	lea P61_samples-16(pc),a5
    785c:	lea 8288 <P61_timers>(pc),a5
	ifeq opt020
	asl #4,d4
    7860:	asl.w #4,d4
	move.l (a5,d4),d6
    7862:	move.l (0,a5,d4.w),d6
	else
	add d4,d4
	move.l (a5,d4*8),d6
	endc
	move.l d6,-4(a4)
    7866:	move.l d6,-4(a4)
	ifeq opt020
	move 4(a5,d4),d4
    786a:	move.w (4,a5,d4.w),d4
	else
	move 4(a5,d4*8),d4
	endc
	sub.l d4,a6
    786e:	suba.l d4,a6
	sub.l d4,a6
    7870:	suba.l d4,a6
	bra.b P61_jatk
    7872:	bra.s 789a <P61_jatk>

00007874 <P61_kook>:
P61_kook:
	move.l a6,d6
    7874:	    move.l a6,d6
	tst.b 3(a0)
    7876:	    tst.b 3(a0)
	bpl.b P61_jatk
    787a:	    bpl.s 789a <P61_jatk>
	tst.b (a2)
    787c:	    tst.b (a2)
	bmi.b P61_jatk
    787e:	    bmi.s 789a <P61_jatk>
	move d4,d0
    7880:	    move.w d4,d0
	subq #2,d0
    7882:	    subq.w #2,d0
	bmi.b P61_jatk
    7884:	    bmi.s 789a <P61_jatk>
	move.l a1,a5
    7886:	    movea.l a1,a5
	move.b (a5)+,d2
    7888:	    move.b (a5)+,d2
	sub.b (a5),d2
    788a:	    sub.b (a5),d2
	move.b d2,(a5)+
    788c:	    move.b d2,(a5)+
.loop:sub.b (a5),d2
    788e:	/-> sub.b (a5),d2
	move.b d2,(a5)+
    7890:	|   move.b d2,(a5)+
	sub.b (a5),d2
    7892:	|   sub.b (a5),d2
	move.b d2,(a5)+
    7894:	|   move.b d2,(a5)+
	dbf d0,.loop
    7896:	\-- dbf d0,788e <P61_kook+0x1a>

0000789a <P61_jatk>:
P61_jatk:
	move d4,(a4)+
    789a:	    move.w d4,(a4)+
	moveq #0,d2
    789c:	    moveq #0,d2
	move.b (a2)+,d2
    789e:	    move.b (a2)+,d2
	moveq #0,d3
    78a0:	    moveq #0,d3
	move.b (a2)+,d3
    78a2:	    move.b (a2)+,d3
	moveq #0,d0
    78a4:	    moveq #0,d0
	move (a2)+,d0
    78a6:	    move.w (a2)+,d0
	bmi.b .norepeat
    78a8:	/-- bmi.s 78ba <P61_jatk+0x20>
	move d4,d5
    78aa:	|   move.w d4,d5
	sub d0,d5
    78ac:	|   sub.w d0,d5
	move.l d6,a5
    78ae:	|   movea.l d6,a5
	add.l d0,a5
    78b0:	|   adda.l d0,a5
	add.l d0,a5
    78b2:	|   adda.l d0,a5
	move.l a5,(a4)+
    78b4:	|   move.l a5,(a4)+
	move d5,(a4)+
    78b6:	|   move.w d5,(a4)+
	bra.b P61_gene
    78b8:	|   bra.s 78c0 <P61_gene>
.norepeat:
	move.l d6,(a4)+
    78ba:	\-> move.l d6,(a4)+
	move #1,(a4)+
    78bc:	    move.w #1,(a4)+

000078c0 <P61_gene>:
P61_gene:
	move d3,(a4)+
    78c0:	             move.w d3,(a4)+
	moveq #$f,d0
    78c2:	             moveq #15,d0
	and d2,d0
    78c4:	             and.w d2,d0
	mulu #74,d0
    78c6:	             mulu.w #74,d0
	move d0,(a4)+
    78ca:	             move.w d0,(a4)+
	tst -6(a2)
    78cc:	             tst.w -6(a2)
	bmi.b .nobuffer
    78d0:	/----------- bmi.s 791c <P61_gene+0x5c>
	moveq #$40,d0
    78d2:	|            moveq #64,d0
	and.b 3(a0),d0
    78d4:	|            and.b 3(a0),d0
	beq.b .nobuffer
    78d8:	+----------- beq.s 791c <P61_gene+0x5c>
	move d4,d7
    78da:	|            move.w d4,d7
	tst.b d2
    78dc:	|            tst.b d2
	bpl.b .copy
    78de:	|     /----- bpl.s 7900 <P61_gene+0x40>
	subq #1,d7
    78e0:	|     |      subq.w #1,d7
	moveq #0,d5
    78e2:	|     |      moveq #0,d5
	moveq #0,d4
    78e4:	|     |      moveq #0,d4
.lo:	move.b (a1)+,d4
    78e6:	|     |  /-> move.b (a1)+,d4
	moveq #$f,d3
    78e8:	|     |  |   moveq #15,d3
	and d4,d3
    78ea:	|     |  |   and.w d4,d3
	lsr #4,d4
    78ec:	|     |  |   lsr.w #4,d4
	sub.b .table(pc,d4),d5
    78ee:	|     |  |   sub.b (790c <P61_gene+0x4c>,pc,d4.w),d5
	move.b d5,(a6)+
    78f2:	|     |  |   move.b d5,(a6)+
	sub.b .table(pc,d3),d5
    78f4:	|     |  |   sub.b (790c <P61_gene+0x4c>,pc,d3.w),d5
	move.b d5,(a6)+
    78f8:	|     |  |   move.b d5,(a6)+
	dbf d7,.lo
    78fa:	|     |  \-- dbf d7,78e6 <P61_gene+0x26>
	bra.b .kop
    78fe:	|  /--|----- bra.s 7924 <P61_gene+0x64>
.copy:
	add d7,d7
    7900:	|  |  \----> add.w d7,d7
	subq #1,d7
    7902:	|  |         subq.w #1,d7
.cob:
	move.b (a1)+,(a6)+
    7904:	|  |     /-> move.b (a1)+,(a6)+
	dbf d7,.cob
    7906:	|  |     \-- dbf d7,7904 <P61_gene+0x44>
	bra.b .kop
    790a:	|  +-------- bra.s 7924 <P61_gene+0x64>
    790c:	|  |         ori.b #4,d1
    7910:	|  |         btst #64,(a0)
    7914:	|  |         divu.w d0,d0
    7916:	|  |         asr.w (-4,a0,sp.l)
    791a:	|  |         .short 0xfeff
.table:
	dc.b 0,1,2,4,8,16,32,64,128,-64,-32,-16,-8,-4,-2,-1
.nobuffer:
	move.l d4,d6
    791c:	\--|-------> move.l d4,d6
	add.l d6,d6
    791e:	   |         add.l d6,d6
	add.l d6,a6
    7920:	   |         adda.l d6,a6
	add.l d6,a1
    7922:	   |         adda.l d6,a1
.kop:
	dbf d1,P61_lopos
    7924:	   \-------> dbf d1,7854 <P61_lopos>
	move.l (sp)+,a0
    7928:	             movea.l (sp)+,a0
	and.b #$7f,3(a0)
    792a:	             andi.b #127,3(a0)
	move.l a2,-(sp)
    7930:	             move.l a2,-(sp)
	lea P61_temp0(pc),a1
    7932:	             lea 8122 <P61_temp0>(pc),a1
	lea P61_temp1(pc),a2
    7936:	             lea 8162 <P61_temp1>(pc),a2
	lea P61_temp2(pc),a4
    793a:	             lea 81a2 <P61_temp2>(pc),a4
	lea P61_temp3(pc),a5
    793e:	             lea 81e2 <P61_temp3>(pc),a5
	moveq #Channel_Block_Size/2-2,d0
    7942:	             moveq #30,d0
	moveq #0,d1
    7944:	             moveq #0,d1
.cl:	move d1,(a1)+
    7946:	         /-> move.w d1,(a1)+
	move d1,(a2)+
    7948:	         |   move.w d1,(a2)+
	move d1,(a4)+
    794a:	         |   move.w d1,(a4)+
	move d1,(a5)+
    794c:	         |   move.w d1,(a5)+
	dbf d0,.cl
    794e:	         \-- dbf d0,7946 <P61_gene+0x86>
	lea P61_temp0-P61_cn(a3),a1
    7952:	             lea -256(a3),a1
	lea P61_emptysample-P61_cn(a3),a2
    7956:	             lea 614(a3),a2
	moveq #channels-1,d0
    795a:	             moveq #3,d0
.loo:
	move.l a2,P61_Sample(a1)
    795c:	         /-> move.l a2,4(a1)
	lea Channel_Block_Size(a1),a1
    7960:	         |   lea 64(a1),a1
	dbf d0,.loo
    7964:	         \-- dbf d0,795c <P61_gene+0x9c>
	move.l (sp)+,a2
    7968:	             movea.l (sp)+,a2
	move.l a2,P61_positionbase-P61_cn(a3)
    796a:	             move.l a2,630(a3)
	moveq #$7f,d1
    796e:	             moveq #127,d1
	and.b 2(a0),d1
    7970:	             and.b 2(a0),d1
	ifeq opt020
	lsl #3,d1
    7974:	             lsl.w #3,d1
	lea (a2,d1.l),a4
    7976:	             lea (0,a2,d1.l),a4
	else
	lea (a2,d1.l*8),a4
	endc
	move.l a4,P61_possibase-P61_cn(a3)	;base to pos. indices.
    797a:	             move.l a4,634(a3)
	move.l a4,a1
    797e:	             movea.l a4,a1
	moveq #-1,d0
    7980:	             moveq #-1,d0
.search:
	cmp.b (a1)+,d0
    7982:	         /-> cmp.b (a1)+,d0
	bne.b .search
    7984:	         \-- bne.s 7982 <P61_gene+0xc2>
	move.l a1,P61_patternbase-P61_cn(a3)
    7986:	             move.l a1,638(a3)
	move.l a1,d0
    798a:	             move.l a1,d0
	sub.l a4,d0
    798c:	             sub.l a4,d0
	subq.w #1,d0			;this is the * BUGFIX! whoa!
    798e:	             subq.w #1,d0
	move d0,P61_slen-P61_cn(a3)
    7990:	             move.w d0,80(a3)
;;    ---  Bugfix: P61_Init gives P61_slen=actual songlength +1.
;;    ---  This did not affect NextPattern, because it looks for endbyte flag.
;;    ---  It did affect Bxx/Dxx, but I guess nobody has tried to jump or 
;;    ---  break to Last Pattern, ever. Now fixed to set correct SLen and 
;;    ---  suddenly Bxx/Dxx/Setposition works as they should. //Photon
	add.w P61_InitPos(pc),a4	;position from which to start playing the song
    7994:	             adda.w 84a8 <P61_InitPos>(pc),a4

	moveq #0,d0
    7998:	             moveq #0,d0
	move.b (a4)+,d0
    799a:	             move.b (a4)+,d0
	move.l a4,P61_spos-P61_cn(a3)
    799c:	             move.l a4,88(a3)
	lsl #3,d0
    79a0:	             lsl.w #3,d0
	add.l d0,a2
    79a2:	             adda.l d0,a2
	move.l a1,a4
    79a4:	             movea.l a1,a4
	moveq #0,d0	;hi word must be clear to manage >32K of patterns
    79a6:	             moveq #0,d0
	move (a2)+,d0	;and no movem-signextend. This code is correct.
    79a8:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    79aa:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp0-P61_cn(a3)
    79ae:	             move.l a1,-246(a3)
	move (a2)+,d0
    79b2:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    79b4:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp1-P61_cn(a3)
    79b8:	             move.l a1,-182(a3)
	move (a2)+,d0
    79bc:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    79be:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp2-P61_cn(a3)
    79c2:	             move.l a1,-118(a3)
	move (a2)+,d0
    79c6:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    79c8:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp3-P61_cn(a3)
    79cc:	             move.l a1,-54(a3)

	ifeq nowaveforms
	lea P61_setrepeat(pc),a0
    79d0:	             lea 80c2 <P61_setrepeat>(pc),a0
	move.l a0,P61_intaddr-P61_cn(a3)
    79d4:	             move.l a0,642(a3)
	endc

	move #63,P61_rowpos-P61_cn(a3)
    79d8:	             move.w #63,78(a3)
	move #6,P61_speed-P61_cn(a3)
    79de:	             move.w #6,82(a3)
	move #5,P61_speed2-P61_cn(a3)
    79e4:	             move.w #5,84(a3)
	clr P61_speedis1-P61_cn(a3)
    79ea:	             clr.w 86(a3)
	endc
	ifne P61_pde
	clr P61_pdelay-P61_cn(a3)
	clr P61_pdflag-P61_cn(a3)
	endc
	clr (a3)		;start frame of very first song note.
    79ee:	             clr.w (a3)
;"reused" patterns with effects coming out of nowhere
;at start of song require 0. Otherwise F0x speed-2 is 
;ok, except if split4=1, set to F-speed - #channels.
;Don't change if you don't need 'the very quickest click to start' speed.
	moveq #2,d0
    79f0:	             moveq #2,d0
	and.b $bfe001,d0
    79f2:	             and.b bfe001 <_end+0xb66dcd>,d0
	move.b d0,P61_ofilter-P61_cn(a3)
    79f8:	             move.b d0,100(a3)
	bset #1,$bfe001
    79fc:	             bset #1,bfe001 <_end+0xb66dcd>
	lea P61_liko(pc),a5
	jsr -$1e(a6)
.no68010:
	move.l d0,P61_VBR-P61_cn(a3)
	endc
	move.l P61_VBR-P61_cn(a3),a0
    7a04:	             movea.l -2664(a3),a0
	lea $78(a0),a0
    7a08:	             lea 120(a0),a0
	move.l a0,P61_vektori-P61_cn(a3)
    7a0c:	             move.l a0,92(a3)
	move.l (a0),P61_oldlev6-P61_cn(a3)
    7a10:	             move.l (a0),96(a3)
	ifeq copdma
	lea P61_dmason(pc),a1		;set 'dma-on-interrupt'.
    7a14:	             lea 808c <P61_dmason>(pc),a1
	move.l a1,(a0)
    7a18:	             move.l a1,(a0)
	endc
	endc
	moveq #$f,d0
    7a1a:	             moveq #15,d0
	lea $dff000+C,a6		;a6 trashed above.
    7a1c:	             lea dff000 <_end+0xd67dcc>,a6
	ifeq quietstart
	moveq #$0,d1			;original code
    7a22:	             moveq #0,d1
	move d1,$a8-C(a6)
    7a24:	             move.w d1,168(a6)
	move d1,$b8-C(a6)
    7a28:	             move.w d1,184(a6)
	move d1,$c8-C(a6)
    7a2c:	             move.w d1,200(a6)
	move d1,$d8-C(a6)
    7a30:	             move.w d1,216(a6)
	move d0,$96-C(a6)
    7a34:	             move.w d0,150(a6)
	move.w d0,P61_NewDMA-P61_cn(a3)	;"NEXTframe setloop" to be triggered
	endc

	ifeq p61system
	ifeq copdma
	lea P61_dmason(pc),a1		;again?
    7a38:	             lea 808c <P61_dmason>(pc),a1
	move.l a1,(a0)
    7a3c:	             move.l a1,(a0)
	endc
	move #$2000,$9a-C(a6)		;old timerb OFF
    7a3e:	             move.w #8192,154(a6)
	lea $bfd000,a0
    7a44:	             lea bfd000 <_end+0xb65dcc>,a0
	lea P61_timers(pc),a1
    7a4a:	             lea 8288 <P61_timers>(pc),a1
	move.b #$7f,$d00(a0)
    7a4e:	             move.b #127,3328(a0)

	ifne p61cia			;only affect cia if actually used
	move.b #$10,$e00(a0)
    7a54:	             move.b #16,3584(a0)
	endc
	move.b #$10,$f00(a0)
    7a5a:	             move.b #16,3840(a0)
	ifne p61cia
	move.b $400(a0),(a1)+
    7a60:	             move.b 1024(a0),(a1)+
	move.b $500(a0),(a1)+
    7a64:	             move.b 1280(a0),(a1)+
	else
	addq.w #2,a1	
	endc

	move.b $600(a0),(a1)+
    7a68:	             move.b 1536(a0),(a1)+
	move.b $700(a0),(a1)
    7a6c:	             move.b 1792(a0),(a1)
	endc
	ifeq (p61system+p61cia)
	move.b #$82,$d00(a0)
	endc
	ifne p61cia
	move (sp)+,d0
    7a70:	             move.w (sp)+,d0
	subq #1,d0
    7a72:	             subq.w #1,d0
	beq.b P61_ForcePAL
    7a74:	             beq.s 7a7a <P61_ForcePAL>
	subq #1,d0
    7a76:	             subq.w #1,d0
	beq.b P61_NTSC
    7a78:	             beq.s 7a82 <P61_NTSC>

00007a7a <P61_ForcePAL>:
	move.l 4.w,a1
	cmp.b #60,$213(a1)
	beq.b P61_NTSC
	endc
P61_ForcePAL:
	move.l #1773447,d0
    7a7a:	move.l #1773447,d0
	bra.b P61_setcia
    7a80:	bra.s 7a88 <P61_setcia>

00007a82 <P61_NTSC>:
P61_NTSC:
	move.l #1789773,d0
    7a82:	move.l #1789773,d0

00007a88 <P61_setcia>:
P61_setcia:
	move.l d0,P61_timer-P61_cn(a3)
    7a88:	move.l d0,114(a3)
	divu #125,d0
    7a8c:	divu.w #125,d0
	move d0,P61_thi2-P61_cn(a3)
    7a90:	move.w d0,112(a3)
	sub #$1f0*2,d0
    7a94:	sub.w #992,d0
	move d0,P61_thi-P61_cn(a3)
    7a98:	move.w d0,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d0
    7a9c:	move.w 112(a3),d0
	move.b d0,$400(a0)
    7aa0:	move.b d0,1024(a0)
	lsr #8,d0
    7aa4:	lsr.w #8,d0
	move.b d0,$500(a0)
    7aa6:	move.b d0,1280(a0)
	lea P61_intti(pc),a1
    7aaa:	lea 77d4 <P61_intti>(pc),a1
	move.l a1,P61_tintti-P61_cn(a3)
    7aae:	move.l a1,106(a3)
	move.l P61_vektori(pc),a2
    7ab2:	movea.l 827e <P61_vektori>(pc),a2
	move.l a1,(a2)
    7ab6:	move.l a1,(a2)
	move.b #$83,$d00(a0)
    7ab8:	move.b #-125,3328(a0)
	move.b #$11,$e00(a0)
    7abe:	move.b #17,3584(a0)
	endc
	endc

	ifeq p61system
	ifeq copdma
	move #$e000,$9a-C(a6)	;level 6 timer B int, at least for setloop
    7ac4:	move.w #-8192,154(a6)
	endc
	ifne quietstart
	move.w #$800f,$96-C(A6)	;make all used channels start a quiet loop.
	endc

	moveq #0,d0
    7aca:	moveq #0,d0
	rts
    7acc:	rts

00007ace <_P61_End>:
* Input:	none.
* Uses:		D0-D1/A0-A1/A3/A6, A6 set to $dff000+C (your custombase) at exit.

_P61_End:
P61_End:
	lea $dff000+C,a6
    7ace:	lea dff000 <_end+0xd67dcc>,a6
	moveq #0,d0
    7ad4:	moveq #0,d0
	move d0,$a8-C(a6)
    7ad6:	move.w d0,168(a6)
	move d0,$b8-C(a6)
    7ada:	move.w d0,184(a6)
	move d0,$c8-C(a6)
    7ade:	move.w d0,200(a6)
	move d0,$d8-C(a6)
    7ae2:	move.w d0,216(a6)
	move #$f,$96-C(a6)
    7ae6:	move.w #15,150(a6)
	and.b #%11111101,$bfe001
    7aec:	andi.b #-3,bfe001 <_end+0xb66dcd>
	move.b P61_ofilter(pc),d0
    7af4:	move.b 8286 <P61_ofilter>(pc),d0
	or.b d0,$bfe001
    7af8:	or.b d0,bfe001 <_end+0xb66dcd>
	ifeq p61system
	move #$2000,$9a-C(a6)
    7afe:	move.w #8192,154(a6)
	move.l P61_vektori(pc),a0
    7b04:	movea.l 827e <P61_vektori>(pc),a0
	move.l P61_oldlev6(pc),(a0)
    7b08:	move.l 8282 <P61_oldlev6>(pc),(a0)
	lea $bfd000,a0
    7b0c:	lea bfd000 <_end+0xb65dcc>,a0
	lea P61_timers(pc),a1
    7b12:	lea 8288 <P61_timers>(pc),a1

	ifne p61cia			;only affect cia if used
	move.b (a1)+,$400(a0)
    7b16:	move.b (a1)+,1024(a0)
	move.b (a1)+,$500(a0)
    7b1a:	move.b (a1)+,1280(a0)
	else
	addq.w #2,a1
	endc
	move.b (a1)+,$600(a0)
    7b1e:	move.b (a1)+,1536(a0)
	move.b (a1)+,$700(a0)
    7b22:	move.b (a1)+,1792(a0)
	ifne p61cia
	move.b #$10,$e00(a0)
    7b26:	move.b #16,3584(a0)
	endc

	move.b #$10,$f00(a0)
    7b2c:	move.b #16,3840(a0)
	jsr -$150(a6)
	st P61_sigbit-P61_cn(a3)
P61_rem3:
	move.l (sp)+,a6
	endc
	rts
    7b32:	rts

00007b34 <_P61_Music>:
********** Main entry point from CIA/VB int or frame loop **********
* Input:	A6=your custombase ("$dff000")
* Uses:		D0-A7, A6 set to $dff000+C (your custombase) at exit.
_P61_Music:
P61_Music:
	lea P61_cn(pc),a3
    7b34:	lea 8222 <P61_cn>(pc),a3
	moveq #0,d7			;replaced clr.* with move.* d7,
    7b38:	moveq #0,d7
	lea $a0-C(a6),a4		;Aud Chan Base.
    7b3a:	lea 160(a6),a4

00007b3e <P61_ohitaaa>:
	rts
	endc

P61_ohitaaa:
	ifne visuctrs				;easy visualizer counters.
	addq.w #1,P61_visuctr0-P61_cn(a3)	;inc elapsed #calls since last
    7b3e:	addq.w #1,650(a3)
	addq.w #1,P61_visuctr1-P61_cn(a3)
    7b42:	addq.w #1,652(a3)
	addq.w #1,P61_visuctr2-P61_cn(a3)
    7b46:	addq.w #1,654(a3)
	addq.w #1,P61_visuctr3-P61_cn(a3)
    7b4a:	addq.w #1,656(a3)
	
	ifne p61fade
	pea P61_mfade(pc)
	endc

	move.w (a3),d4
    7b4e:	move.w (a3),d4
	cmp.w P61_speed2(pc),d4	;Really compares with P61_speed, 1 added later.
    7b50:	cmp.w 8276 <P61_speed2>(pc),d4
	beq.w P61_playtime	;if new note frame, handle
    7b54:	beq.w 7e78 <P61_playtime>

00007b58 <P61_nowrap>:
	move d0,P61_CRow-P61_cn(a3)
	endc
;;    ---  end of rolled over code  ---

P61_nowrap:
	addq.w #1,d4			;NOW I do!
    7b58:	addq.w #1,d4
	move d4,(a3)
    7b5a:	move.w d4,(a3)

00007b5c <P61_delay>:
	move.b P61_tlo2(pc),(a0)
	move.b P61_thi2(pc),$100(a0)
	endc
	endc
********** mainfx handling **********
	lea P61_temp0(pc),a5
    7b5c:	lea 8122 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    7b60:	moveq #3,d5

00007b62 <P61_lopas>:
P61_lopas:
	tst.b P61_OnOff+1(a5)
    7b62:	tst.b 9(a5)
	beq.w P61_contfxdone
    7b66:	beq.w 7bd2 <P61_contfxdone>
	moveq #$f,d0
    7b6a:	moveq #15,d0
	and (a5),d0
    7b6c:	and.w (a5),d0
	ifeq opt020
	add d0,d0
    7b6e:	add.w d0,d0
	move P61_jtab2(pc,d0),d0
    7b70:	move.w (7b78 <P61_jtab2>,pc,d0.w),d0
	else
	move P61_jtab2(pc,d0*2),d0
	endc
	jmp P61_jtab2(pc,d0)
    7b74:	jmp (7b78 <P61_jtab2>,pc,d0.w)

00007b78 <P61_jtab2>:
    7b78:	ori.w #90,(a2)+
    7b7c:	ori.w #90,(a2)+
    7b80:	ori.w #90,(a2)+
    7b84:	ori.w #90,(a2)+
    7b88:	ori.w #90,(a2)+
    7b8c:	ori.b #90,-(a0)
    7b90:	ori.w #90,(a2)+
    7b94:	ori.w #90,(a2)+

00007b98 <P61_volslide>:
	bra.w P61_contfxdone
	endc
;;    ---  period table move to before P61_cn  ---
	ifne P61_vs
P61_volslide:
	move.b P61_Info(a5),d0
    7b98:	    move.b 2(a5),d0
	sub.b d0,P61_Volume+1(a5)
    7b9c:	    sub.b d0,25(a5)
	bpl.b .test
    7ba0:	/-- bpl.s 7bae <P61_volslide+0x16>
	move d7,P61_Volume(a5)
    7ba2:	|   move.w d7,24(a5)
	ifeq p61fade
	move d7,8(a4)
    7ba6:	|   move.w d7,8(a4)
	else
	move d7,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    7baa:	|   bra.w 7bd2 <P61_contfxdone>
.test:
	moveq #64,d0
    7bae:	\-> moveq #64,d0
	cmp P61_Volume(a5),d0
    7bb0:	    cmp.w 24(a5),d0
	bge.b .ncs
    7bb4:	/-- bge.s 7bc2 <P61_volslide+0x2a>
	move d0,P61_Volume(a5)
    7bb6:	|   move.w d0,24(a5)
	ifeq p61fade
	move d0,8(a4)
    7bba:	|   move.w d0,8(a4)
	else
	move d0,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    7bbe:	|   bra.w 7bd2 <P61_contfxdone>
.ncs:
	ifeq p61fade
	move P61_Volume(a5),8(a4)
    7bc2:	\-> move.w 24(a5),8(a4)
	else
	move P61_Volume(a5),P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    7bc8:	    bra.w 7bd2 <P61_contfxdone>
	move d0,P61_Period(a5)
	move d7,P61_ToPeriod(a5)
.setper:
	move P61_Period(a5),6(a4)
	else
	nop
    7bcc:	    nop
	endc
	bra.w P61_contfxdone
    7bce:	    bra.w 7bd2 <P61_contfxdone>

00007bd2 <P61_contfxdone>:
********** MainFX returns here from all fx **********
P61_contfxdone:
	ifne P61_il
	bsr.w P61_funk2
	endc
	lea Channel_Block_Size(a5),a5
    7bd2:	lea 64(a5),a5
	lea Custom_Block_Size(a4),a4
    7bd6:	lea 16(a4),a4
	dbf d5,P61_lopas
    7bda:	dbf d5,7b62 <P61_lopas>
;;    ---  splitchans or normal decrunch  ---
	ifeq split4
	cmp P61_speed2(PC),d4		;'decrunch frame'? (1 before playtime)
    7bde:	cmp.w 8276 <P61_speed2>(pc),d4
	bne.w P61_ret2
    7be2:	bne.w 7e76 <P61_ret2>

00007be6 <P61_preplay2>:
P61_preplay2:

.pr:	ifle (channels-splitchans)
	printt "splitchans >= channels! Must be less."
	else
	moveq #(channels-splitchans)-1,d5	;do preplay "first" half
    7be6:	moveq #2,d5
	lea P61_temp0(pc),a5
    7be8:	lea 8122 <P61_temp0>(pc),a5
	bra.w P61_preplay
    7bec:	bra.w 7d66 <P61_preplay>

00007bf0 <P61_MyJpt>:

	endc				;if split4
********** My Jump Table **********
P61_MyJpt:;jump table,%x1111xxx,%x111xxxx,%x11xxxxx=note,cmd,all - else empty
;	REPT 12
	jmp P61_all(PC)
    7bf0:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7bf4:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7bf8:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7bfc:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c00:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c04:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c08:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c0c:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c10:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c14:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c18:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c1c:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c20:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c24:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c28:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c2c:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c30:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c34:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c38:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c3c:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c40:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c44:	jmp 7de2 <P61_all2>(pc)
	jmp P61_all(PC)
    7c48:	jmp 7d96 <P61_all>(pc)
	jmp P61_all2(PC)
    7c4c:	jmp 7de2 <P61_all2>(pc)
;	ENDR
	jmp P61_cmd(PC)
    7c50:	jmp 7da0 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    7c54:	jmp 7dee <P61_cmd2>(pc)
	jmp P61_cmd(PC)
    7c58:	jmp 7da0 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    7c5c:	jmp 7dee <P61_cmd2>(pc)
	jmp P61_noote(PC)
    7c60:	jmp 7dac <P61_noote>(pc)
	jmp P61_note2(PC)
    7c64:	jmp 7dfc <P61_note2>(pc)
	jmp P61_empty(PC)
    7c68:	jmp 7d8e <P61_empty>(pc)
	jmp P61_empty2(PC)
    7c6c:	jmp 7dd8 <P61_empty2>(pc)

;	REPT 12
	jmp P61_allS(PC)
    7c70:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c74:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7c78:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c7c:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7c80:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c84:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7c88:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c8c:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7c90:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c94:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7c98:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7c9c:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7ca0:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7ca4:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7ca8:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7cac:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7cb0:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7cb4:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7cb8:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7cbc:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7cc0:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7cc4:	jmp 7e22 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7cc8:	jmp 7dc6 <P61_allS>(pc)
	jmp P61_all2S(PC)
    7ccc:	jmp 7e22 <P61_all2S>(pc)
;	ENDR
	jmp P61_cmdS(PC)
    7cd0:	jmp 7dce <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    7cd4:	jmp 7e2c <P61_cmd2S>(pc)
	jmp P61_cmdS(PC)
    7cd8:	jmp 7dce <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    7cdc:	jmp 7e2c <P61_cmd2S>(pc)
	jmp P61_noteS(PC)
    7ce0:	jmp 7e38 <P61_noteS>(pc)
	jmp P61_note2S(PC)
    7ce4:	jmp 7e10 <P61_note2S>(pc)
	jmp P61_emptyS(PC)
    7ce8:	jmp 7dbe <P61_emptyS>(pc)

00007cec <P61_empty2S>:
;	jmp P61_empty2S(PC)
********** END OF MYJPT **********
P61_empty2S:
	move d7,(a5)+
    7cec:	move.w d7,(a5)+
	move.b d7,(a5)+
    7cee:	move.b d7,(a5)+

00007cf0 <P61_proccompS>:
;;    ---  alt exit  ---
P61_proccompS:
	move.b (a0)+,d1
    7cf0:	    move.b (a0)+,d1
	move.b d1,d0
    7cf2:	    move.b d1,d0

	add.b d1,d1
    7cf4:	    add.b d1,d1
	bpl.b P61_permexit		;bit 6 was 0
    7cf6:	    bpl.s 7d5c <P61_permexit>
;;    ---  stay in chan, repeat  ---
.b6set:	bcs.b .bit16
    7cf8:	/-- bcs.s 7d16 <P61_proccompS+0x26>

.bit8:	move.b d7,(a5)
    7cfa:	|   move.b d7,(a5)
	subq.l #3,a5			;stay tuned to this channel!
    7cfc:	|   subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    7cfe:	|   and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    7d00:	|   move.b d0,19(a5)
	move.b (a0)+,d0			;hi word is clear. (constant)
    7d04:	|   move.b (a0)+,d0
	move.l a0,P61_ChaPos(a5)	;dupe of above
    7d06:	|   move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    7d0a:	|   suba.l d0,a0
.jedi1:	move.b (a0)+,d0			;used in .empty etc
    7d0c:	|   move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7d0e:	|   moveq #-8,d1
	and.b d0,d1
    7d10:	|   and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    7d12:	|   jmp (7cf0 <P61_proccompS>,pc,d1.w)

.bit16:	move.b d7,(a5)
    7d16:	\-> move.b d7,(a5)
	subq.l #3,a5
    7d18:	    subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    7d1a:	    and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    7d1c:	    move.b d0,19(a5)
	ifeq opt020
	move.b (a0)+,d0			;hi word is clear. (constant)
    7d20:	    move.b (a0)+,d0
	lsl #8,d0
    7d22:	    lsl.w #8,d0
	move.b (a0)+,d0
    7d24:	    move.b (a0)+,d0
	else
	move.w (a0)+,d0			;(potentially) odd-address word-read.
	endc
	move.l a0,P61_ChaPos(a5)	;dupe of above
    7d26:	    move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    7d2a:	    suba.l d0,a0
.jedi2:	move.b (a0)+,d0			;used in .empty etc
    7d2c:	    move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7d2e:	    moveq #-8,d1
	and.b d0,d1
    7d30:	    and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    7d32:	    jmp (7cf0 <P61_proccompS>,pc,d1.w)

00007d36 <P61_Take>:

P61_Take:
	tst.b P61_TempLen+1(a5)		;faster than subq + addq!
    7d36:	tst.b 19(a5)
	bne.b P61_takeone
    7d3a:	bne.s 7d4a <P61_takeone>

00007d3c <P61_TakeNorm>:
P61_TakeNorm:				;this is more frequent than takeone
	move.l P61_ChaPos(a5),a0	;dflt - if takenorm
    7d3c:	movea.l 10(a5),a0
	move.b (a0)+,d0			;used in .empty etc
    7d40:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7d42:	moveq #-8,d1
	and.b d0,d1
    7d44:	and.b d0,d1
	jmp P61_MyJpt+256+4(PC,d1.w)	;first call can be this...
    7d46:	jmp (7cf4 <P61_proccompS+0x4>,pc,d1.w)

00007d4a <P61_takeone>:
P61_takeone:
	subq.b #1,P61_TempLen+1(a5)
    7d4a:	subq.b #1,19(a5)
	move.l P61_TempPos(a5),a0
    7d4e:	movea.l 14(a5),a0

00007d52 <P61_Jedi>:
P61_Jedi:	;temp/repeat. copy below proccompS.
	move.b (a0)+,d0			;used in .empty etc
    7d52:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7d54:	moveq #-8,d1
	and.b d0,d1
    7d56:	and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)	;but rest is always this
    7d58:	jmp (7cf0 <P61_proccompS>,pc,d1.w)

00007d5c <P61_permexit>:
;;    ---  alt (perm) exit  ---		;does not affect maxtime.
P61_permexit:
	move.b d0,(a5)
    7d5c:	move.b d0,(a5)
	move.l a0,P61_ChaPos-3(a5)
    7d5e:	move.l a0,7(a5)
	bra.w P61_permdko
    7d62:	bra.w 7e4c <P61_permdko>

00007d66 <P61_preplay>:

;;    ---  The hipper wilderbeest run gnu linux at midnight!  ---
	ifne P61_ft
	lea (P61_samples-16)-P61_cn(a3),a2
	endc
	moveq #$3f,d4
    7d66:	moveq #63,d4
	moveq #-$10,d6			;intelligent on/off-flag
    7d68:	moveq #-16,d6
	moveq #0,d0			;clear hi word, never dirtied below.
    7d6a:	moveq #0,d0

00007d6c <P61_loaps>:
	move.l P61_ChaPos(a5),(a1)+
	move.l P61_TempPos(a5),(a1)+
	move P61_TempLen(a5),(a1)
	endc

	moveq #-65,d1			;%10111111 const
    7d6c:	moveq #-65,d1
	and.b P61_Pack(a5),d1
    7d6e:	and.b 3(a5),d1
	add.b d1,d1			;sign in carry
    7d72:	add.b d1,d1
	beq.b P61_Take			;6 lsb bits 0?
    7d74:	beq.s 7d36 <P61_Take>
	bcc.b P61_nodko
    7d76:	bcc.s 7d80 <P61_nodko>
	addq #3,a5
    7d78:	addq.w #3,a5
	subq.b #1,(a5)
    7d7a:	subq.b #1,(a5)
	bra.w P61_permdko
    7d7c:	bra.w 7e4c <P61_permdko>

00007d80 <P61_nodko>:
P61_nodko:
	move.b d7,P61_OnOff+1(a5)
    7d80:	move.b d7,9(a5)
	subq.b #1,P61_Pack(a5)
    7d84:	subq.b #1,3(a5)
	addq #3,a5
    7d88:	addq.w #3,a5
	bra.w P61_koto
    7d8a:	bra.w 7e6e <P61_koto>

00007d8e <P61_empty>:

;;    ---  routines  ---
P61_empty:
	move d7,(a5)+
    7d8e:	move.w d7,(a5)+
	move.b d7,(a5)+
    7d90:	move.b d7,(a5)+
	bra.w P61_ex
    7d92:	bra.w 7e48 <P61_ex>

00007d96 <P61_all>:
P61_all:
	move.b d0,(a5)+		;but this can't...
    7d96:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7d98:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7d9a:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_ex
    7d9c:	bra.w 7e48 <P61_ex>

00007da0 <P61_cmd>:
P61_cmd:
	moveq #$f,d1
    7da0:	moveq #15,d1
	and d0,d1
    7da2:	and.w d0,d1
	move d1,(a5)+
    7da4:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    7da6:	move.b (a0)+,(a5)+
	bra.w P61_ex
    7da8:	bra.w 7e48 <P61_ex>

00007dac <P61_noote>:
P61_noote:
	moveq #7,d1
    7dac:	moveq #7,d1
	and d0,d1
    7dae:	and.w d0,d1
	lsl #8,d1
    7db0:	lsl.w #8,d1
	move.b (a0)+,d1
    7db2:	move.b (a0)+,d1
	lsl #4,d1
    7db4:	lsl.w #4,d1
	move d1,(a5)+
    7db6:	move.w d1,(a5)+
	move.b d7,(a5)+
    7db8:	move.b d7,(a5)+
	bra.w P61_ex
    7dba:	bra.w 7e48 <P61_ex>

00007dbe <P61_emptyS>:
;;    ---  copyS  ---
P61_emptyS:
	move d7,(a5)+
    7dbe:	move.w d7,(a5)+
	move.b d7,(a5)+
    7dc0:	move.b d7,(a5)+
	bra.w P61_exS
    7dc2:	bra.w 7e46 <P61_exS>

00007dc6 <P61_allS>:
P61_allS:
	move.b d0,(a5)+		;but this can't...
    7dc6:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7dc8:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7dca:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.b P61_exS
    7dcc:	bra.s 7e46 <P61_exS>

00007dce <P61_cmdS>:
P61_cmdS:
	moveq #$f,d1
    7dce:	moveq #15,d1
	and d0,d1
    7dd0:	and.w d0,d1
	move d1,(a5)+
    7dd2:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    7dd4:	move.b (a0)+,(a5)+
	bra.b P61_exS
    7dd6:	bra.s 7e46 <P61_exS>

00007dd8 <P61_empty2>:
;;    ---    ---
********** copy, perm exit **********
P61_empty2:
	move d7,(a5)+
    7dd8:	move.w d7,(a5)+
	move.b d7,(a5)+
    7dda:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    7ddc:	move.l a0,7(a5)
	bra.b P61_permdko
    7de0:	bra.s 7e4c <P61_permdko>

00007de2 <P61_all2>:
P61_all2:
	move.b d0,(a5)+
    7de2:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7de4:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7de6:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	move.l a0,P61_ChaPos-3(a5)
    7de8:	move.l a0,7(a5)
	bra.b P61_permdko
    7dec:	bra.s 7e4c <P61_permdko>

00007dee <P61_cmd2>:
P61_cmd2:
	moveq #$f,d1
    7dee:	moveq #15,d1
	and d0,d1
    7df0:	and.w d0,d1
	move d1,(a5)+
    7df2:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7df4:	move.b (a0)+,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    7df6:	move.l a0,7(a5)
	bra.b P61_permdko
    7dfa:	bra.s 7e4c <P61_permdko>

00007dfc <P61_note2>:
P61_note2:
	moveq #7,d1
    7dfc:	moveq #7,d1
	and d0,d1
    7dfe:	and.w d0,d1
	lsl #8,d1
    7e00:	lsl.w #8,d1
	move.b (a0)+,d1
    7e02:	move.b (a0)+,d1
	lsl #4,d1
    7e04:	lsl.w #4,d1
	move d1,(a5)+
    7e06:	move.w d1,(a5)+
	move.b d7,(a5)+
    7e08:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    7e0a:	move.l a0,7(a5)
	bra.b P61_permdko
    7e0e:	bra.s 7e4c <P61_permdko>

00007e10 <P61_note2S>:
;;    ---  copyS, diff exit  ---
P61_note2S:
	moveq #7,d1
    7e10:	moveq #7,d1
	and d0,d1
    7e12:	and.w d0,d1
	lsl #8,d1
    7e14:	lsl.w #8,d1
	move.b (a0)+,d1
    7e16:	move.b (a0)+,d1
	lsl #4,d1
    7e18:	lsl.w #4,d1
	move d1,(a5)+
    7e1a:	move.w d1,(a5)+
	move.b d7,(a5)+
    7e1c:	move.b d7,(a5)+
	bra.w P61_proccompS
    7e1e:	bra.w 7cf0 <P61_proccompS>

00007e22 <P61_all2S>:
P61_all2S:
	move.b d0,(a5)+
    7e22:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7e24:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7e26:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_proccompS
    7e28:	bra.w 7cf0 <P61_proccompS>

00007e2c <P61_cmd2S>:
P61_cmd2S:
	moveq #$f,d1
    7e2c:	moveq #15,d1
	and d0,d1
    7e2e:	and.w d0,d1
	move d1,(a5)+
    7e30:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7e32:	move.b (a0)+,(a5)+
	bra.w P61_proccompS
    7e34:	bra.w 7cf0 <P61_proccompS>

00007e38 <P61_noteS>:
;;    ---    ---
P61_noteS:
	moveq #7,d1
    7e38:	moveq #7,d1
	and d0,d1
    7e3a:	and.w d0,d1
	lsl #8,d1
    7e3c:	lsl.w #8,d1
	move.b (a0)+,d1
    7e3e:	move.b (a0)+,d1
	lsl #4,d1
    7e40:	lsl.w #4,d1
	move d1,(a5)+
    7e42:	move.w d1,(a5)+
	move.b d7,(a5)+
    7e44:	move.b d7,(a5)+

00007e46 <P61_exS>:
;;    ---  norm (temp) exit  ---
;This exit is called when you have max rastertime.
P61_exS:
	move.b (a0)+,(a5)
    7e46:	move.b (a0)+,(a5)

00007e48 <P61_ex>:
P61_ex:
	move.l a0,P61_TempPos-3(a5)
    7e48:	move.l a0,11(a5)

00007e4c <P61_permdko>:
P61_permdko:
	move.w d6,P61_OnOff-3(a5)		;was byte size in word var...
    7e4c:	move.w d6,5(a5)
	move -3(a5),d0
    7e50:	move.w -3(a5),d0
	and #$1f0,d0
    7e54:	and.w #496,d0
	beq.b .koto
    7e58:	beq.s 7e6e <P61_koto>
	ifne P61_ft
	lea (a2,d0),a1			;this is not the same a2 as the fix.
	else
	lea (P61_samples-16)-P61_cn(a3),a1
    7e5a:	lea 102(a3),a1
	add d0,a1
    7e5e:	adda.w d0,a1
	endc
	move.l a1,P61_Sample-3(a5)
    7e60:	move.l a1,1(a5)
	ifne P61_ft
	move.l P61_SampleVolume(a1),P61_Volume-3(a5)
	else
	move P61_SampleVolume(a1),P61_Volume-3(a5)
    7e64:	move.w 12(a1),21(a5)
	endc
	ifne P61_il
	move.l P61_RepeatOffset(a1),P61_Wave-3(a5)
	endc
	ifne P61_sof
	move d7,P61_Offset-3(a5)
    7e6a:	move.w d7,25(a5)

00007e6e <P61_koto>:
	endc
.koto:
P61_koto:
	ifeq split4			;split4 means only do once.
	lea Channel_Block_Size-3(a5),a5
    7e6e:	lea 61(a5),a5
	dbf d5,P61_loaps
    7e72:	dbf d5,7d6c <P61_loaps>

00007e76 <P61_ret2>:
	endc
P61_ret2:
	rts
    7e76:	rts

00007e78 <P61_playtime>:

********** END OF LOAPS LOOP **********
********** here comes another :) **********
	ifeq dupedec
P61_playtime:
	addq.w #1,(a3)	;inc framecount past _Speed for detection+reset later
    7e78:	addq.w #1,(a3)
	ifeq split4
	ifgt splitchans
	moveq #splitchans-1,d5		;channels split off?(optimization flag)
    7e7a:	moveq #0,d5
	lea P61_temp0+Channel_Block_Size*(channels-splitchans)(PC),a5
    7e7c:	lea 81e2 <P61_temp3>(pc),a5
	bsr P61_preplay
    7e80:	bsr.w 7d66 <P61_preplay>

00007e84 <P61_playtimeCont>:
.djdj:
	move d7,P61_pdflag-P61_cn(a3)
	endc

	ifne suppF01
	tst P61_speedis1-P61_cn(a3)
    7e84:	       tst.w 86(a3)
	beq.b .mo
    7e88:	/----- beq.s 7e9c <P61_playtimeCont+0x18>

	lea P61_temp0(pc),a5
    7e8a:	|      lea 8122 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    7e8e:	|      moveq #3,d5
.chl:	bsr.w P61_preplay		;then do the remaining from prev frame
    7e90:	|  /-> bsr.w 7d66 <P61_preplay>
	ifeq split4		;split4 means preplay is one-shot. So ext loop.
	lea Channel_Block_Size-3(a5),a5
    7e94:	|  |   lea 61(a5),a5
	dbf d5,.chl
    7e98:	|  \-- dbf d5,7e90 <P61_playtimeCont+0xc>
.mo:
	endc	;suppF01

	ifeq copdma&nowaveforms		;both must be off to skip int.
	ifeq p61system		;main 'new note' int starter.
	lea P61_dmason(pc),a1
    7e9c:	\----> lea 808c <P61_dmason>(pc),a1
	move.l P61_vektori(pc),a0
    7ea0:	       movea.l 827e <P61_vektori>(pc),a0
	move.l a1,(a0)
    7ea4:	       move.l a1,(a0)
	move.b #$f0,$bfd600		;496 ticks=11.000677 scanlines,
    7ea6:	       move.b #-16,bfd600 <_end+0xb663cc>
	move.b #$01,$bfd700		;dmaoff $1.38 scanlines later on 68000.
    7eae:	       move.b #1,bfd700 <_end+0xb664cc>
	move.b #$19,$bfdf00		;With unlucky timing and max period 856
    7eb6:	       move.b #25,bfdf00 <_end+0xb66ccc>
	move.b #$f0,(a1)
	move.b #1,$100(a1)
	endc
	endc

	moveq #0,d4			;clr dmamask accumulator
    7ebe:	       moveq #0,d4
	moveq #channels-1,d5
    7ec0:	       moveq #3,d5
	lea P61_temp0(pc),a5
    7ec2:	       lea 8122 <P61_temp0>(pc),a5
	bra.w P61_loscont		;I'd trade a bra for 2 Leias any day!
    7ec6:	       bra.w 7ef2 <P61_loscont>
    7eca:	       ori.b #28,(a4)+
    7ece:	       ori.b #28,(a4)+
    7ed2:	       ori.b #28,(a4)+
    7ed6:	       ori.b #28,(a4)+
    7eda:	       ori.b #-42,(a4)+
    7ede:	       ori.b #28,(a4)+
    7ee2:	       btst d0,(28,a6,d0.w)
    7ee6:	       ori.b #64,(a4)+

00007eea <P61_jtab>:
	endc
.j:
P61_jtab:
;;    ---  end of table  ---
P61_los:
	lea Custom_Block_Size(a4),a4
    7eea:	lea 16(a4),a4
	lea Channel_Block_Size(a5),a5
    7eee:	lea 64(a5),a5

00007ef2 <P61_loscont>:
P61_loscont:
	move P61_OnOff(a5),d0		;$ff00/$ffff? if off, will goto nocha.
    7ef2:	move.w 8(a5),d0
	ifeq p61bigjtab
	tst.b d0
    7ef6:	tst.b d0
	beq.s P61_nocha
    7ef8:	beq.s 7f2c <P61_nocha>
	endc
	or (a5),d0
    7efa:	or.w (a5),d0
	add d0,d0			;->$fe00..$fffe (if big jtab)
    7efc:	add.w d0,d0
	move P61_jtab(PC,d0),d0
    7efe:	move.w (7eea <P61_jtab>,pc,d0.w),d0
	jmp P61_jtab(PC,d0)
    7f02:	jmp (7eea <P61_jtab>,pc,d0.w)

00007f06 <P61_fxdone>:

P61_fxdone:				;this sets dma and paula values
	moveq #$7e,d0
    7f06:	moveq #126,d0
	and.b (a5),d0
    7f08:	and.b (a5),d0
	beq.b P61_nocha
    7f0a:	beq.s 7f2c <P61_nocha>
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    7f0c:	move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    7f10:	move.w (2,a3,d0.w),22(a5)

00007f16 <P61_zample>:
P61_zample:				;also direct target for finetune retrig
	ifne P61_sof
	tst P61_Offset(a5)
    7f16:	tst.w 28(a5)
	bne.w P61_pek
    7f1a:	bne.w 7ff6 <P61_pek>
	endc
;;    ---  check DMA-mask for pan/echo samplestarts, modify it, mix.  ---
;	bsr P61_Synth		;synth/pan/echo cpu-mix routine. Not done yet.
;;   --- modify below code to not touch synth/pan/echo fixchans ---
	or P61_DMABit(a5),d4		;accumulate channels touched
    7f1e:	or.w 62(a5),d4
	move.l P61_Sample(a5),a1	;skipped if nocha
    7f22:	movea.l 4(a5),a1
	ifeq oscillo
	move.l (a1)+,(a4)
    7f26:	move.l (a1)+,(a4)
	move (a1),4(a4)
    7f28:	move.w (a1),4(a4)

00007f2c <P61_nocha>:
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo
P61_nocha:
	ifeq p61fade
	move.l P61_Period(a5),6(a4)
    7f2c:	move.l 22(a5),6(a4)

00007f32 <P61_skip>:
	endc
P61_skip:
	ifne P61_il
	bsr.w P61_funk2
	endc
	DBF d5,P61_los
    7f32:	dbf d5,7eea <P61_jtab>

00007f36 <P61_chansdone>:
	bpl.b .noch0
	move.w d7,$aa-C(A6)		;clear AUDxDAT
.noch0:
	endc

	move d4,$96-C(a6)	;DMAclear - changed to not be written 4 times
    7f36:	       move.w d4,150(a6)

	ifne visuctrs
	lea P61_visuctr0+channels*2(PC),a0
    7f3a:	       lea 84b4 <P61E>(pc),a0
	moveq #channels-1,d5
    7f3e:	       moveq #3,d5
.visul:	subq.w #2,a0
    7f40:	/----> subq.w #2,a0
	btst d5,d4
    7f42:	|      btst d5,d4
	beq.s .noctr0
    7f44:	|  /-- beq.s 7f48 <P61_chansdone+0x12>
	move.w d7,(a0)
    7f46:	|  |   move.w d7,(a0)
.noctr0:
	dbf d5,.visul
    7f48:	\--\-X dbf d5,7f40 <P61_chansdone+0xa>

	ifne copdma
	move.l p61_DMApokeAddr(PC),a0
	move.b d4,(a0)		;only the low byte is poked, allowing other dma
	endc
	move.b d4,P61_dma+1-P61_cn(a3)
    7f4c:	       move.b d4,77(a3)
;;    ---  non-rolled over code  --- compatible with F01.
	ifne suppF01				;moved to here in P6110.
	ifne nowaveforms
	move.b d4,P61_NewDMA+1-P61_cn(a3)	;or set by fx
	endc
	move.w d7,(a3)				;clr p61_cn
    7f50:	       move.w d7,(a3)
	move d0,P61_CRow-P61_cn(a3)
	rts
P61_ohittaa:					;nextrow
	endc

	subq #1,P61_rowpos-P61_cn(a3)		;next pattern-step
    7f52:	       subq.w #1,78(a3)
	bpl.b P61_nonewpatt
    7f56:	       bpl.s 7fb4 <P61_nonewpatt>

00007f58 <P61_nextpattern>:

P61_nextpattern:
	ifne P61_pl
	move d7,P61_plflag-P61_cn(a3)
	endc
	move.l P61_patternbase(pc),a0
    7f58:	movea.l 84a0 <P61_patternbase>(pc),a0
	moveq #63,d0
    7f5c:	moveq #63,d0
	move d0,P61_rowpos-P61_cn(a3)
    7f5e:	move.w d0,78(a3)
	move d7,P61_CRow-P61_cn(a3)
    7f62:	move.w d7,-2656(a3)
	move.l P61_spos(pc),a1
    7f66:	movea.l 827a <P61_spos>(pc),a1
	addq #1,P61_Pos-P61_cn(a3)
    7f6a:	addq.w #1,-2660(a3)
	move.b (a1)+,d0
    7f6e:	move.b (a1)+,d0
	bpl.b P61_dk
    7f70:	bpl.s 7f7c <P61_dk>
	move.l P61_possibase(pc),a1
    7f72:	movea.l 849c <P61_possibase>(pc),a1
	move.b (a1)+,d0
    7f76:	move.b (a1)+,d0
	move d7,P61_Pos-P61_cn(a3)
    7f78:	move.w d7,-2660(a3)

00007f7c <P61_dk>:
P61_dk:
	move.l a1,P61_spos-P61_cn(a3)
    7f7c:	move.l a1,88(a3)
	move d0,P61_Patt-P61_cn(a3)
    7f80:	move.w d0,-2658(a3)
	lsl #3,d0
    7f84:	lsl.w #3,d0
	move.l P61_positionbase(pc),a1
    7f86:	movea.l 8498 <P61_positionbase>(pc),a1
	add.l d0,a1
    7f8a:	adda.l d0,a1
	move.w (a1)+,d0			;no movem sign-extend... check.
    7f8c:	move.w (a1)+,d0
	add.l a0,d0
    7f8e:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp0-P61_cn(a3)
    7f90:	move.l d0,-246(a3)
	moveq #0,d0			;actually faster than lea (a0,d0.l)
    7f94:	moveq #0,d0
	move.w (a1)+,d0			;for some reason this code doesn't 
    7f96:	move.w (a1)+,d0
	add.l a0,d0			;use 'ifgt channels-1' etc. Kept as is.
    7f98:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp1-P61_cn(a3)
    7f9a:	move.l d0,-182(a3)
	moveq #0,d0
    7f9e:	moveq #0,d0
	move.w (a1)+,d0
    7fa0:	move.w (a1)+,d0
	add.l a0,d0
    7fa2:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp2-P61_cn(a3)
    7fa4:	move.l d0,-118(a3)
	moveq #0,d0
    7fa8:	moveq #0,d0
	move.w (a1)+,d0
    7faa:	move.w (a1)+,d0
	add.l a0,d0
    7fac:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp3-P61_cn(a3)
    7fae:	move.l d0,-54(a3)
	rts
    7fb2:	rts

00007fb4 <P61_nonewpatt>:
P61_nonewpatt:
	moveq #63,d0
    7fb4:	moveq #63,d0
	sub P61_rowpos-P61_cn(a3),d0
    7fb6:	sub.w 78(a3),d0
	move d0,P61_CRow-P61_cn(a3)
    7fba:	move.w d0,-2656(a3)
;;    ---  end of non-rolled over code  ---
	endc	;suppF01
	rts				;end of P61_playtime.
    7fbe:	rts

00007fc0 <P61_sampleoffse>:
	bra.w P61_nocha
	endc

	ifne P61_sof
P61_sampleoffse:
	moveq #0,d1
    7fc0:	    moveq #0,d1
	move #$ff00,d1
    7fc2:	    move.w #-256,d1
	and 2(a5),d1
    7fc6:	    and.w 2(a5),d1
	bne.b .deq
    7fca:	/-- bne.s 7fd0 <P61_sampleoffse+0x10>
	move P61_LOffset(a5),d1
    7fcc:	|   move.w 30(a5),d1
.deq:
	move d1,P61_LOffset(a5)
    7fd0:	\-> move.w d1,30(a5)
	add d1,P61_Offset(a5)
    7fd4:	    add.w d1,28(a5)

	moveq #$7e,d0
    7fd8:	    moveq #126,d0
	and.b (a5),d0
    7fda:	    and.b (a5),d0
	beq.w P61_nocha
    7fdc:	    beq.w 7f2c <P61_nocha>
	move P61_Offset(a5),d2
    7fe0:	    move.w 28(a5),d2
	add d1,P61_Offset(a5)
    7fe4:	    add.w d1,28(a5)
	move d2,d1
    7fe8:	    move.w d2,d1
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    7fea:	    move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    7fee:	    move.w (2,a3,d0.w),22(a5)
	bra.b P61_hup
    7ff4:	    bra.s 7ffc <P61_hup>

00007ff6 <P61_pek>:
P61_pek:
	moveq #0,d1
    7ff6:	moveq #0,d1
	move P61_Offset(a5),d1
    7ff8:	move.w 28(a5),d1

00007ffc <P61_hup>:
P61_hup:
	or P61_DMABit(a5),d4			;don't write 4 times, please.
    7ffc:	or.w 62(a5),d4

	move.l P61_Sample(a5),a1
    8000:	movea.l 4(a5),a1
	move.l (a1)+,d0
    8004:	move.l (a1)+,d0
	add.l d1,d0
    8006:	add.l d1,d0
	move.l d0,(a4)
    8008:	move.l d0,(a4)
	lsr #1,d1
    800a:	lsr.w #1,d1
	move (a1),d6
    800c:	move.w (a1),d6
	sub d1,d6
    800e:	sub.w d1,d6
	bpl.b P61_offok
    8010:	bpl.s 8018 <P61_offok>
	move.l -4(a1),(a4)
    8012:	move.l -4(a1),(a4)
	moveq #1,d6
    8016:	moveq #1,d6

00008018 <P61_offok>:
P61_offok:
	move d6,4(a4)
    8018:	move.w d6,4(a4)
	lsl.l #3,d1
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo

	bra.w P61_nocha			;continues to where ints etc is handled
    801c:	bra.w 7f2c <P61_nocha>

00008020 <P61_volum>:
	endc

	ifne P61_vl
P61_volum:
	move.b P61_Info(a5),P61_Volume+1(a5)
    8020:	move.b 2(a5),25(a5)
	bra.w P61_fxdone
    8026:	bra.w 7f06 <P61_fxdone>

0000802a <P61_cspeed>:
	st P61_pdflag-P61_cn(a3)
	bra.w P61_fxdone
	endc
	ifne P61_sd
P61_cspeed:
	moveq #0,d0
    802a:	moveq #0,d0
	move.b P61_Info(a5),d0
    802c:	move.b 2(a5),d0
	ifne p61cia
	tst P61_Tempo-P61_cn(a3)
    8030:	tst.w -2670(a3)
	beq.b P61_VBlank
    8034:	beq.s 803c <P61_VBlank>
	cmp.b #32,d0
    8036:	cmp.b #32,d0
	bhs.b P61_STempo
    803a:	bcc.s 8064 <P61_STempo>

0000803c <P61_VBlank>:
	endc
P61_VBlank:
	cmp.b #1,d0
    803c:	cmp.b #1,d0
	beq.b P61_jkd
    8040:	beq.s 8054 <P61_jkd>
	move.b d0,P61_speed+1-P61_cn(a3)
    8042:	move.b d0,83(a3)
	subq.b #1,d0
    8046:	subq.b #1,d0
	move.b d0,P61_speed2+1-P61_cn(a3)
    8048:	move.b d0,85(a3)
	move d7,P61_speedis1-P61_cn(a3)
    804c:	move.w d7,86(a3)
	bra.w P61_fxdone
    8050:	bra.w 7f06 <P61_fxdone>

00008054 <P61_jkd>:
P61_jkd:
	move.b d0,P61_speed+1-P61_cn(a3)
    8054:	move.b d0,83(a3)
	move.b d0,P61_speed2+1-P61_cn(a3)
    8058:	move.b d0,85(a3)
	st P61_speedis1-P61_cn(a3)
    805c:	st 86(a3)
	bra.w P61_fxdone
    8060:	bra.w 7f06 <P61_fxdone>

00008064 <P61_STempo>:
	ifne p61cia
P61_STempo:
	move.l P61_timer(pc),d1
    8064:	move.l 8294 <P61_timer>(pc),d1
	divu d0,d1
    8068:	divu.w d0,d1
	move d1,P61_thi2-P61_cn(a3)
    806a:	move.w d1,112(a3)
	sub #$1f0*2,d1
    806e:	sub.w #992,d1
	move d1,P61_thi-P61_cn(a3)
    8072:	move.w d1,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d1
    8076:	move.w 112(a3),d1
	move.b d1,$bfd400
    807a:	move.b d1,bfd400 <_end+0xb661cc>
	lsr #8,d1
    8080:	lsr.w #8,d1
	move.b d1,$bfd500
    8082:	move.b d1,bfd500 <_end+0xb662cc>
	endc
	bra P61_fxdone
    8088:	bra.w 7f06 <P61_fxdone>

0000808c <P61_dmason>:
********** timing interrupt entry point **********
;;    ---  first int, DMAs on again.  ---
	ifeq copdma
P61_dmason:
	ifeq p61system
	tst.b $bfdd00
    808c:	tst.b bfdd00 <_end+0xb66acc>
	move #$2000,$dff09c
    8092:	move.w #8192,dff09c <_end+0xd67e68>
	move #$2000,$dff09c
    809a:	move.w #8192,dff09c <_end+0xd67e68>

	ifeq nowaveforms
	move.b #$19,$bfdf00		;retrigger to chain replen int.
    80a2:	move.b #25,bfdf00 <_end+0xb66ccc>
	move.l a0,-(sp)
    80aa:	move.l a0,-(sp)
	move.l P61_vektori(pc),a0	;put another int in '$78.w'
    80ac:	movea.l 827e <P61_vektori>(pc),a0
	move.l P61_intaddr(pc),(a0)
    80b0:	move.l 84a4 <P61_intaddr>(pc),(a0)
	move.l (sp)+,a0
    80b4:	movea.l (sp)+,a0
	endc

	move P61_dma(pc),$dff096	;on only. includes $8200.
    80b6:	move.w 826e <P61_dma>(pc),dff096 <_end+0xd67e62>
	nop
    80be:	nop
	rte
    80c0:	rte

000080c2 <P61_setrepeat>:
	endc				;ifeq copdma
;;    ---  second chained int, replen  ---
	ifeq nowaveforms
P61_setrepeat:
	ifeq p61system
	tst.b $bfdd00
    80c2:	tst.b bfdd00 <_end+0xb66acc>
	movem.l a0/a1,-(sp)
    80c8:	movem.l a0-a1,-(sp)
	lea $dff0a0,a1
    80cc:	lea dff0a0 <_end+0xd67e6c>,a1
	move #$2000,-4(a1)
    80d2:	move.w #8192,-4(a1)
	move #$2000,-4(a1)
    80d8:	move.w #8192,-4(a1)
	else
	lea $dff0a0,a1
	endc

	move.l P61_Sample+P61_temp0(pc),a0
    80de:	movea.l 8126 <P61_temp0+0x4>(pc),a0
	addq.l #6,a0
    80e2:	addq.l #6,a0
	move.l (a0)+,(a1)+
    80e4:	move.l (a0)+,(a1)+
	move (a0),(a1)
    80e6:	move.w (a0),(a1)
	ifgt channels-1
	move.l P61_Sample+P61_temp1(pc),a0
    80e8:	movea.l 8166 <P61_temp1+0x4>(pc),a0
	addq.l #6,a0
    80ec:	addq.l #6,a0
	move.l (a0)+,12(a1)
    80ee:	move.l (a0)+,12(a1)
	move (a0),16(a1)
    80f2:	move.w (a0),16(a1)
	endc
	ifgt channels-2
	move.l P61_Sample+P61_temp2(pc),a0
    80f6:	movea.l 81a6 <P61_temp2+0x4>(pc),a0
	addq.l #6,a0
    80fa:	addq.l #6,a0
	move.l (a0)+,28(a1)
    80fc:	move.l (a0)+,28(a1)
	move (a0),32(a1)
    8100:	move.w (a0),32(a1)
	endc
	ifgt channels-3
	move.l P61_Sample+P61_temp3(pc),a0
    8104:	movea.l 81e6 <P61_temp3+0x4>(pc),a0
	addq.l #6,a0
    8108:	addq.l #6,a0
	move.l (a0)+,44(a1)
    810a:	move.l (a0)+,44(a1)
	move (a0),48(a1)
    810e:	move.w (a0),48(a1)
	endc
	bra P61_ohi
	endc
	ifeq p61system
	ifne p61cia
	move.l P61_vektori(pc),a0
    8112:	movea.l 827e <P61_vektori>(pc),a0
	move.l P61_tintti(pc),(a0)
    8116:	move.l 828c <P61_tintti>(pc),(a0)
	endc
	movem.l (sp)+,a0/a1
    811a:	movem.l (sp)+,a0-a1
	nop
    811e:	nop
	rte
    8120:	rte

00008122 <P61_temp0>:
	...
    815e:	ori.b #1,d0

00008162 <P61_temp1>:
	...
    819e:	ori.b #2,d0

000081a2 <P61_temp2>:
	...
    81de:	ori.b #4,d0

000081e2 <P61_temp3>:
	...
    821e:	ori.b #8,d0

00008222 <P61_cn>:
	...

00008224 <P61_periods>:
    8224:	bchg d1,(a0)+
    8226:	bchg d1,(a0)+
    8228:	btst d1,762(a0)
    822c:	.short 0x02d0
    822e:	andi.l #41943644,-(a6)
    8234:	.short 0x023a
    8236:	andi.b #-4,(a2)+
    823a:	bset d0,-(a0)
    823c:	bset d0,d5
    823e:	bclr d0,404(a4)
    8242:	.short 0x017d
    8244:	bchg d0,339(a0)
    8248:	bchg d0,d0
    824a:	btst d0,285(a6)
    824e:	movep.w 254(a5),d0
    8252:	.short 0x00f0
    8254:	.short 0x00e2
    8256:	.short 0x00d6
    8258:	.short 0x00ca
    825a:	.short 0x00be
    825c:	ori.l #11141280,(-105,a4,d0.w)
    8264:	.short 0x008f
    8266:	ori.l #8323192,d7
    826c:	Address 0x826e is out of bounds.


0000826e <P61_dma>:
    826e:	or.b d0,d1

00008270 <P61_rowpos>:
	...

00008272 <P61_slen>:
	...

00008274 <P61_speed>:
	...

00008276 <P61_speed2>:
	...

00008278 <P61_speedis1>:
	...

0000827a <P61_spos>:
    827a:	ori.b #0,d0

0000827e <P61_vektori>:
    827e:	ori.b #0,d0

00008282 <P61_oldlev6>:
    8282:	ori.b #0,d0

00008286 <P61_ofilter>:
	...

00008288 <P61_timers>:
    8288:	ori.b #0,d0

0000828c <P61_tintti>:
    828c:	ori.b #0,d0

00008290 <P61_thi>:
	...

00008291 <P61_tlo>:
	...

00008292 <P61_thi2>:
	...

00008293 <P61_tlo2>:
	...

00008294 <P61_timer>:
    8294:	ori.b #0,d0

00008298 <P61_samples>:
	...

00008488 <P61_emptysample>:
	...

00008498 <P61_positionbase>:
    8498:	ori.b #0,d0

0000849c <P61_possibase>:
    849c:	ori.b #0,d0

000084a0 <P61_patternbase>:
    84a0:	ori.b #0,d0

000084a4 <P61_intaddr>:
    84a4:	ori.b #0,d0

000084a8 <P61_InitPos>:
	...

000084aa <P61_PattFlag>:
	...

000084ac <P61_etu>:
    84ac:	negx.b d0

000084ae <P61_visuctr1>:
    84ae:	negx.b d0

000084b0 <P61_visuctr2>:
    84b0:	negx.b d0

000084b2 <P61_visuctr3>:
    84b2:	negx.b d0
