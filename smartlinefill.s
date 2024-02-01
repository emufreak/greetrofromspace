
	|Entry point
	.type __smartlinefillasm,function
	.globl _smartlinefillasm
|D0 = startx  
|D1 = startyoffset <- starty
|D2 = height
|D3 = length    
|D5 = bltwidth  
|D6 = bltstart   
|D7 = direction     
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    |WORD direction = 64;
    move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    bgt.s br1
    |{
    |direction = -64;  
    neg.w d7    
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    lsl.l   #6,d2
    sub.w   d2,d1
    |height *= -1;
    neg.w d2        
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    sub.w d6,d0
    mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    subq.w #1,d0
    mulu.w #100,d0
    subq.w #1,d3
    add.w d3,d0
    add.w d0,a0
    move.w (a0),d0
    sub.w  d5,d0
    sub.w  d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    add.w d5,d2
    lea   0xdff000,a3
    tst.w 0x2(a3)
waitblit:
    btst #6,2(a3)
    bne.s waitblit
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    movem.l (sp)+,d0-d7/a0-a3
    rts

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    add.l #zmult,a1



  









    
    



    



