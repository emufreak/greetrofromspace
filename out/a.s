
out\a.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	       movem.l d2-d3/a2,-(sp)
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       4:	       move.l #256480,d3
       a:	       subi.l #256480,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #256480,d0
      18:	       cmpi.l #256480,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 3e9e0 <ClToggleBitPlanes>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #256480,d3
      38:	       subi.l #256480,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #256480,d0
      46:	       cmpi.l #256480,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 3e9e0 <ClToggleBitPlanes>,a2
      54:	|      moveq #0,d2
		__init_array_start[i]();
      56:	|  /-> movea.l (a2)+,a0
      58:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      5a:	|  |   addq.l #1,d2
      5c:	|  |   cmp.l d3,d2
      5e:	|  \-- bcs.s 56 <_start+0x56>

	main();
      60:	\----> jsr 66 <main>

00000066 <main>:
static void Wait10() { WaitLine(0x10); }
static void Wait11() { WaitLine(0x11); }
static void Wait12() { WaitLine(0x12); }
static void Wait13() { WaitLine(0x13); }

int main() {
      66:	                                                          subq.l #8,sp
      68:	                                                          movem.l d2-d7/a2-a6,-(sp)
	SysBase = *((struct ExecBase**)4UL);
      6c:	                                                          movea.l 4 <_start+0x4>,a6
      70:	                                                          move.l a6,610de <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                          move.l #14675968,610da <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                          lea 368a9 <incbin_MercuryLetterData2Lz4_end+0x137>,a1
      86:	                                                          moveq #0,d0
      88:	                                                          jsr -552(a6)
      8c:	                                                          move.l d0,610d6 <GfxBase>
	if (!GfxBase)
      92:	            /-------------------------------------------- beq.w 78e <main+0x728>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	            |                                             movea.l 610de <SysBase>,a6
      9c:	            |                                             lea 368ba <incbin_MercuryLetterData2Lz4_end+0x148>,a1
      a2:	            |                                             moveq #0,d0
      a4:	            |                                             jsr -552(a6)
      a8:	            |                                             move.l d0,610d2 <DOSBase>
	if (!DOSBase)
      ae:	      /-----|-------------------------------------------- beq.w 71c <main+0x6b6>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	      |  /--|-------------------------------------------> pea 368c6 <incbin_MercuryLetterData2Lz4_end+0x154>
      b8:	      |  |  |                                             lea 19dc <KPrintF>,a4
      be:	      |  |  |                                             jsr (a4)
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      c0:	      |  |  |                                             movea.l 610d2 <DOSBase>,a6
      c6:	      |  |  |                                             jsr -60(a6)
      ca:	      |  |  |                                             movea.l 610d2 <DOSBase>,a6
      d0:	      |  |  |                                             move.l d0,d1
      d2:	      |  |  |                                             move.l #223458,d2
      d8:	      |  |  |                                             moveq #15,d3
      da:	      |  |  |                                             jsr -48(a6)
	Delay(50);
      de:	      |  |  |                                             movea.l 610d2 <DOSBase>,a6
      e4:	      |  |  |                                             moveq #50,d1
      e6:	      |  |  |                                             jsr -198(a6)

	warpmode(1);
      ea:	      |  |  |                                             pea 1 <_start+0x1>
      ee:	      |  |  |                                             lea 38c6 <warpmode>,a5
      f4:	      |  |  |                                             jsr (a5)
		register volatile const void* _a0 ASM("a0") = module;
      f6:	      |  |  |                                             lea 5f844 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      fc:	      |  |  |                                             suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      fe:	      |  |  |                                             suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     100:	      |  |  |                                             lea 5b22 <incbin_player_start>,a3
		__asm volatile (
     106:	      |  |  |                                             movem.l d1-d7/a4-a6,-(sp)
     10a:	      |  |  |                                             jsr (a3)
     10c:	      |  |  |                                             movem.l (sp)+,d1-d7/a4-a6
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     110:	      |  |  |                                             addq.l #8,sp
     112:	      |  |  |                                             tst.l d0
     114:	      |  |  |  /----------------------------------------- bne.w 694 <main+0x62e>
		KPrintF("p61Init failed!\n");
#endif
	warpmode(0);
     118:	      |  |  |  |  /-------------------------------------> clr.l -(sp)
     11a:	      |  |  |  |  |                                       jsr (a5)
	Forbid();
     11c:	      |  |  |  |  |                                       movea.l 610de <SysBase>,a6
     122:	      |  |  |  |  |                                       jsr -132(a6)
	SystemADKCON=custom->adkconr;
     126:	      |  |  |  |  |                                       movea.l 610da <custom>,a0
     12c:	      |  |  |  |  |                                       move.w 16(a0),d0
	SystemInts=custom->intenar;
     130:	      |  |  |  |  |                                       move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     134:	      |  |  |  |  |                                       move.w 2(a0),d0
	LoadView(0);
     138:	      |  |  |  |  |                                       movea.l 610d6 <GfxBase>,a6
     13e:	      |  |  |  |  |                                       suba.l a1,a1
     140:	      |  |  |  |  |                                       jsr -222(a6)
	WaitTOF();
     144:	      |  |  |  |  |                                       movea.l 610d6 <GfxBase>,a6
     14a:	      |  |  |  |  |                                       jsr -270(a6)
	WaitTOF();
     14e:	      |  |  |  |  |                                       movea.l 610d6 <GfxBase>,a6
     154:	      |  |  |  |  |                                       jsr -270(a6)
	WaitVbl();
     158:	      |  |  |  |  |                                       lea 9c2 <WaitVbl>,a2
     15e:	      |  |  |  |  |                                       jsr (a2)
	WaitVbl();
     160:	      |  |  |  |  |                                       jsr (a2)
	OwnBlitter();
     162:	      |  |  |  |  |                                       movea.l 610d6 <GfxBase>,a6
     168:	      |  |  |  |  |                                       jsr -456(a6)
	WaitBlit();	
     16c:	      |  |  |  |  |                                       movea.l 610d6 <GfxBase>,a6
     172:	      |  |  |  |  |                                       jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     176:	      |  |  |  |  |                                       movea.l 610da <custom>,a0
     17c:	      |  |  |  |  |                                       move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     182:	      |  |  |  |  |                                       move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     188:	      |  |  |  |  |                                       move.w #16383,150(a0)
     18e:	      |  |  |  |  |                                       addq.l #4,sp
	for(int a=0;a<32;a++)
     190:	      |  |  |  |  |                                       moveq #0,d1
		custom->color[a]=0;
     192:	      |  |  |  |  |  /----------------------------------> move.l d1,d0
     194:	      |  |  |  |  |  |                                    addi.l #192,d0
     19a:	      |  |  |  |  |  |                                    add.l d0,d0
     19c:	      |  |  |  |  |  |                                    move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     1a2:	      |  |  |  |  |  |                                    addq.l #1,d1
     1a4:	      |  |  |  |  |  |                                    moveq #32,d0
     1a6:	      |  |  |  |  |  |                                    cmp.l d1,d0
     1a8:	      |  |  |  |  |  +----------------------------------- bne.s 192 <main+0x12c>
	WaitVbl();
     1aa:	      |  |  |  |  |  |                                    jsr (a2)
	WaitVbl();
     1ac:	      |  |  |  |  |  |                                    jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     1ae:	      |  |  |  |  |  |                                    move.w #20090,46(sp)
     1b4:	      |  |  |  |  |  |                                    move.w #2049,48(sp)
     1ba:	      |  |  |  |  |  |                                    move.w #20083,50(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     1c0:	      |  |  |  |  |  |                                    movea.l 610de <SysBase>,a6
     1c6:	      |  |  |  |  |  |                                    btst #0,297(a6)
     1cc:	/-----|--|--|--|--|--|----------------------------------- beq.w 8fa <main+0x894>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1d0:	|     |  |  |  |  |  |                                    moveq #46,d7
     1d2:	|     |  |  |  |  |  |                                    add.l sp,d7
     1d4:	|     |  |  |  |  |  |                                    exg d7,a5
     1d6:	|     |  |  |  |  |  |                                    jsr -30(a6)
     1da:	|     |  |  |  |  |  |                                    exg d7,a5
	VBR=GetVBR();
     1dc:	|     |  |  |  |  |  |                                    move.l d0,60fe0 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1e2:	|     |  |  |  |  |  |                                    movea.l 60fe0 <VBR>,a0
     1e8:	|     |  |  |  |  |  |                                    move.l 108(a0),d0

	TakeSystem();
	WaitVbl();
     1ec:	|     |  |  |  |  |  |                                    jsr (a2)

		
	custom->dmacon = 0x87ff;
     1ee:	|     |  |  |  |  |  |                                    movea.l 610da <custom>,a0
     1f4:	|     |  |  |  |  |  |                                    move.w #-30721,150(a0)
}


int PrepareDisplay() {

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     1fa:	|     |  |  |  |  |  |                                    movea.l 610de <SysBase>,a6
     200:	|     |  |  |  |  |  |                                    move.l #25000,d0
     206:	|     |  |  |  |  |  |                                    moveq #0,d1
     208:	|     |  |  |  |  |  |                                    jsr -198(a6)
     20c:	|     |  |  |  |  |  |                                    move.l d0,610c4 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     212:	|     |  |  |  |  |  |                                    movea.l 610de <SysBase>,a6
     218:	|     |  |  |  |  |  |                                    move.l #120000,d0
     21e:	|     |  |  |  |  |  |                                    moveq #2,d1
     220:	|     |  |  |  |  |  |                                    jsr -198(a6)
     224:	|     |  |  |  |  |  |                                    move.l d0,610c0 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     22a:	|     |  |  |  |  |  |                                    pea 3 <_start+0x3>
     22e:	|     |  |  |  |  |  |                                    pea 2710 <DrawRect+0xcc2>
     232:	|     |  |  |  |  |  |                                    move.l d0,-(sp)
     234:	|     |  |  |  |  |  |                                    lea 3ada <Utils_FillLong.constprop.0>,a3
     23a:	|     |  |  |  |  |  |                                    jsr (a3)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     23c:	|     |  |  |  |  |  |                                    movea.l 610d6 <GfxBase>,a6
     242:	|     |  |  |  |  |  |                                    jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     246:	|     |  |  |  |  |  |                                    move.w #-1,dff044 <_end+0xd9df60>
  custom->bltalwm = 0xffff; //Static
     24e:	|     |  |  |  |  |  |                                    move.w #-1,dff046 <_end+0xd9df62>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     256:	|     |  |  |  |  |  |                                    movea.l 610c0 <LineBuffer>,a5
  for( WORD i=0;i <=5;i++) {
     25c:	|     |  |  |  |  |  |                                    movea.l a5,a1
     25e:	|     |  |  |  |  |  |                                    lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     262:	|     |  |  |  |  |  |                                    moveq #0,d5
  for( WORD i=0;i <=5;i++) {
     264:	|     |  |  |  |  |  |                                    clr.w d4
      data = data >> i2;
     266:	|     |  |  |  |  |  |                                    moveq #0,d3
     268:	|     |  |  |  |  |  |                                    not.w d3
	APTR vbr = 0;
     26a:	|  /--|--|--|--|--|--|----------------------------------> movea.l a1,a0
     26c:	|  |  |  |  |  |  |  |                                    moveq #1,d1
     26e:	|  |  |  |  |  |  |  |                          /-------> move.l d3,d2
     270:	|  |  |  |  |  |  |  |                          |         asr.l d1,d2
      data = data ^ 0xffff;
     272:	|  |  |  |  |  |  |  |                          |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     274:	|  |  |  |  |  |  |  |                          |         move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     27a:	|  |  |  |  |  |  |  |                          |     /-> move.w dff002 <_end+0xd9df1e>,d0
     280:	|  |  |  |  |  |  |  |                          |     |   btst #14,d0
     284:	|  |  |  |  |  |  |  |                          |     \-- bne.s 27a <main+0x214>
  custom->bltcon0 = 0x01f0;
     286:	|  |  |  |  |  |  |  |                          |         move.w #496,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0;
     28e:	|  |  |  |  |  |  |  |                          |         move.w #0,dff042 <_end+0xd9df5e>
  custom->bltadat = data;
     296:	|  |  |  |  |  |  |  |                          |         move.w d2,dff074 <_end+0xd9df90>
  custom->bltdpt = Target;  
     29c:	|  |  |  |  |  |  |  |                          |         move.l a0,dff054 <_end+0xd9df70>
  custom->bltdmod = mod;
     2a2:	|  |  |  |  |  |  |  |                          |         move.w #10,dff066 <_end+0xd9df82>
  custom->bltsize = lines*64+linelength;
     2aa:	|  |  |  |  |  |  |  |                          |         move.w #6401,dff058 <_end+0xd9df74>
    for( WORD i2=1;i2<=16; i2++) {        
     2b2:	|  |  |  |  |  |  |  |                          |         addq.l #1,d1
     2b4:	|  |  |  |  |  |  |  |                          |         lea 1200(a0),a0
     2b8:	|  |  |  |  |  |  |  |                          |         moveq #17,d0
     2ba:	|  |  |  |  |  |  |  |                          |         cmp.l d1,d0
     2bc:	|  |  |  |  |  |  |  |                          +-------- bne.s 26e <main+0x208>
    if( i > 0) {
     2be:	|  |  |  |  |  |  |  |                          |         tst.w d4
     2c0:	|  |  |  |  |  |  |  |                          |     /-- bne.s 2d4 <main+0x26e>
    startbuffer += repeats*linesize*2*16;
     2c2:	|  |  |  |  |  |  |  |                          |     |   lea 19200(a5),a5
  for( WORD i=0;i <=5;i++) {
     2c6:	|  |  |  |  |  |  |  |                          |     |   lea 19202(a1),a1
     2ca:	|  |  |  |  |  |  |  |                          |     |   addq.l #2,d5
     2cc:	|  |  |  |  |  |  |  |                          |     |   moveq #1,d4
     2ce:	|  |  |  |  |  |  |  |                          |     |   movea.l a1,a0
     2d0:	|  |  |  |  |  |  |  |                          |     |   moveq #1,d1
     2d2:	|  |  |  |  |  |  |  |                          +-----|-- bra.s 26e <main+0x208>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     2d4:	|  |  |  |  |  |  |  |                          |     \-> moveq #12,d0
     2d6:	|  |  |  |  |  |  |  |                          |         sub.w d5,d0
     2d8:	|  |  |  |  |  |  |  |                          |         movea.w d0,a0
     2da:	|  |  |  |  |  |  |  |                          |         move.w d4,d6
     2dc:	|  |  |  |  |  |  |  |                          |         addi.w #-32768,d6
     2e0:	|  |  |  |  |  |  |  |                          |         move.l a5,d1
     2e2:	|  |  |  |  |  |  |  |                          |         move.l a5,d2
     2e4:	|  |  |  |  |  |  |  |                          |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     2ea:	|  |  |  |  |  |  |  |                          |  /----> move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     2f0:	|  |  |  |  |  |  |  |                          |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
     2f6:	|  |  |  |  |  |  |  |                          |  |  |   btst #14,d0
     2fa:	|  |  |  |  |  |  |  |                          |  |  \-- bne.s 2f0 <main+0x28a>
  custom->bltcon0 = 0x01f0;
     2fc:	|  |  |  |  |  |  |  |                          |  |      move.w #496,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0;
     304:	|  |  |  |  |  |  |  |                          |  |      move.w #0,dff042 <_end+0xd9df5e>
  custom->bltadat = data;
     30c:	|  |  |  |  |  |  |  |                          |  |      move.w #-1,dff074 <_end+0xd9df90>
  custom->bltdpt = Target;  
     314:	|  |  |  |  |  |  |  |                          |  |      move.l d1,dff054 <_end+0xd9df70>
  custom->bltdmod = mod;
     31a:	|  |  |  |  |  |  |  |                          |  |      move.w a0,dff066 <_end+0xd9df82>
  custom->bltsize = lines*64+linelength;
     320:	|  |  |  |  |  |  |  |                          |  |      move.w d6,dff058 <_end+0xd9df74>
      while( height > 512) {
     326:	|  |  |  |  |  |  |  |                          |  |      addi.l #6144,d1
     32c:	|  |  |  |  |  |  |  |                          |  |      cmp.l d2,d1
     32e:	|  |  |  |  |  |  |  |                          |  \----- bne.s 2ea <main+0x284>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     330:	|  |  |  |  |  |  |  |                          |         move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     336:	|  |  |  |  |  |  |  |                          |     /-> move.w dff002 <_end+0xd9df1e>,d0
     33c:	|  |  |  |  |  |  |  |                          |     |   btst #14,d0
     340:	|  |  |  |  |  |  |  |                          |     \-- bne.s 336 <main+0x2d0>
  custom->bltcon0 = 0x01f0;
     342:	|  |  |  |  |  |  |  |                          |         move.w #496,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0;
     34a:	|  |  |  |  |  |  |  |                          |         move.w #0,dff042 <_end+0xd9df5e>
  custom->bltadat = data;
     352:	|  |  |  |  |  |  |  |                          |         move.w #-1,dff074 <_end+0xd9df90>
  custom->bltdpt = Target;  
     35a:	|  |  |  |  |  |  |  |                          |         move.l d1,dff054 <_end+0xd9df70>
  custom->bltdmod = mod;
     360:	|  |  |  |  |  |  |  |                          |         move.w a0,dff066 <_end+0xd9df82>
  custom->bltsize = lines*64+linelength;
     366:	|  |  |  |  |  |  |  |                          |         move.w d4,d0
     368:	|  |  |  |  |  |  |  |                          |         addi.w #4096,d0
     36c:	|  |  |  |  |  |  |  |                          |         move.w d0,dff058 <_end+0xd9df74>
  for( WORD i=0;i <=5;i++) {
     372:	|  |  |  |  |  |  |  |                          |         addi.w #-4095,d0
     376:	|  |  |  |  |  |  |  |                          |         cmpi.w #5,d4
     37a:	|  |  |  |  |  |  |  |                          |     /-- beq.s 390 <main+0x32a>
    startbuffer += repeats*linesize*2*16;
     37c:	|  |  |  |  |  |  |  |                          |     |   lea 19200(a5),a5
  for( WORD i=0;i <=5;i++) {
     380:	|  |  |  |  |  |  |  |                          |     |   move.w d0,d4
     382:	|  |  |  |  |  |  |  |                          |     |   lea 19202(a1),a1
     386:	|  |  |  |  |  |  |  |                          |     |   addq.l #2,d5
     388:	|  |  |  |  |  |  |  |                          |     |   movea.l a1,a0
     38a:	|  |  |  |  |  |  |  |                          |     |   moveq #1,d1
     38c:	|  |  |  |  |  |  |  |                          \-----|-- bra.w 26e <main+0x208>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     390:	|  |  |  |  |  |  |  |                                \-> movea.l 610de <SysBase>,a6
     396:	|  |  |  |  |  |  |  |                                    move.l #33024,d0
     39c:	|  |  |  |  |  |  |  |                                    moveq #2,d1
     39e:	|  |  |  |  |  |  |  |                                    jsr -198(a6)
     3a2:	|  |  |  |  |  |  |  |                                    move.l d0,d2
     3a4:	|  |  |  |  |  |  |  |                                    move.l d0,610bc <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     3aa:	|  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     3ae:	|  |  |  |  |  |  |  |                                    pea 204 <main+0x19e>
     3b2:	|  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     3b4:	|  |  |  |  |  |  |  |                                    jsr (a3)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     3b6:	|  |  |  |  |  |  |  |                                    pea 2 <_start+0x2>
     3ba:	|  |  |  |  |  |  |  |                                    pea 36903 <incbin_MercuryLetterData2Lz4_end+0x191>
     3c0:	|  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     3c2:	|  |  |  |  |  |  |  |                                    lea 3a22 <debug_register_bitmap.constprop.0>,a5
     3c8:	|  |  |  |  |  |  |  |                                    jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     3ca:	|  |  |  |  |  |  |  |                                    movea.l 610de <SysBase>,a6
     3d0:	|  |  |  |  |  |  |  |                                    move.l #49536,d0
     3d6:	|  |  |  |  |  |  |  |                                    moveq #2,d1
     3d8:	|  |  |  |  |  |  |  |                                    jsr -198(a6)
     3dc:	|  |  |  |  |  |  |  |                                    move.l d0,610b8 <Bitmap1>
  if(Bitmap1 == 0) {
     3e2:	|  |  |  |  |  |  |  |                                    lea 24(sp),sp
     3e6:	|  |  |  |  |  |  |  |        /-------------------------- beq.w 874 <main+0x80e>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     3ea:	|  |  |  |  |  |  |  |        |                           pea 3 <_start+0x3>
     3ee:	|  |  |  |  |  |  |  |        |                           pea 36934 <incbin_MercuryLetterData2Lz4_end+0x1c2>
     3f4:	|  |  |  |  |  |  |  |        |                           move.l d0,-(sp)
     3f6:	|  |  |  |  |  |  |  |        |                           jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     3f8:	|  |  |  |  |  |  |  |        |                           move.l 610b8 <Bitmap1>,d2
     3fe:	|  |  |  |  |  |  |  |        |                           pea 10 <_start+0x10>
     402:	|  |  |  |  |  |  |  |        |                           pea 306 <main+0x2a0>
     406:	|  |  |  |  |  |  |  |        |                           move.l d2,-(sp)
     408:	|  |  |  |  |  |  |  |        |                           jsr (a3)

  ScreenBuffer1.BitPlane = Bitmap1;
     40a:	|  |  |  |  |  |  |  |        |                           move.l d2,61080 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     410:	|  |  |  |  |  |  |  |        |                           clr.l 61084 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     416:	|  |  |  |  |  |  |  |        |                           clr.l 61090 <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     41c:	|  |  |  |  |  |  |  |        |                           movea.l 610de <SysBase>,a6
     422:	|  |  |  |  |  |  |  |        |                           move.l #49536,d0
     428:	|  |  |  |  |  |  |  |        |                           moveq #2,d1
     42a:	|  |  |  |  |  |  |  |        |                           jsr -198(a6)
     42e:	|  |  |  |  |  |  |  |        |                           move.l d0,6107c <Bitmap2>
  if(Bitmap2 == 0) {
     434:	|  |  |  |  |  |  |  |        |                           lea 24(sp),sp
     438:	|  |  |  |  |  |  |  |  /-----|-------------------------- beq.w 7ee <main+0x788>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     43c:	|  |  |  |  |  |  |  |  |  /--|-------------------------> pea 3 <_start+0x3>
     440:	|  |  |  |  |  |  |  |  |  |  |                           pea 36965 <incbin_MercuryLetterData2Lz4_end+0x1f3>
     446:	|  |  |  |  |  |  |  |  |  |  |                           move.l d0,-(sp)
     448:	|  |  |  |  |  |  |  |  |  |  |                           jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     44a:	|  |  |  |  |  |  |  |  |  |  |                           move.l 6107c <Bitmap2>,d2
     450:	|  |  |  |  |  |  |  |  |  |  |                           pea 10 <_start+0x10>
     454:	|  |  |  |  |  |  |  |  |  |  |                           pea 306 <main+0x2a0>
     458:	|  |  |  |  |  |  |  |  |  |  |                           move.l d2,-(sp)
     45a:	|  |  |  |  |  |  |  |  |  |  |                           jsr (a3)

  ScreenBuffer2.BitPlane = Bitmap2;
     45c:	|  |  |  |  |  |  |  |  |  |  |                           move.l d2,61044 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     462:	|  |  |  |  |  |  |  |  |  |  |                           clr.l 61048 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     468:	|  |  |  |  |  |  |  |  |  |  |                           clr.l 61054 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     46e:	|  |  |  |  |  |  |  |  |  |  |                           movea.l 610de <SysBase>,a6
     474:	|  |  |  |  |  |  |  |  |  |  |                           move.l #49536,d0
     47a:	|  |  |  |  |  |  |  |  |  |  |                           moveq #2,d1
     47c:	|  |  |  |  |  |  |  |  |  |  |                           jsr -198(a6)
     480:	|  |  |  |  |  |  |  |  |  |  |                           move.l d0,61040 <Bitmap3>
  if(Bitmap3 == 0) {
     486:	|  |  |  |  |  |  |  |  |  |  |                           lea 24(sp),sp
     48a:	|  |  |  |  |  |  |  |  |  |  |  /----------------------- beq.w 7ba <main+0x754>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     48e:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------> pea 3 <_start+0x3>
     492:	|  |  |  |  |  |  |  |  |  |  |  |  |                     pea 36996 <incbin_MercuryLetterData2Lz4_end+0x224>
     498:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,-(sp)
     49a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     49c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 61040 <Bitmap3>,d2
     4a2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     pea 10 <_start+0x10>
     4a6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     pea 306 <main+0x2a0>
     4aa:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,-(sp)
     4ac:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)

  ScreenBuffer3.BitPlane = Bitmap3;
     4ae:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 61008 <ScreenBuffer3>,a3
     4b4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     4b6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     clr.l 6100c <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     4bc:	|  |  |  |  |  |  |  |  |  |  |  |  |                     clr.l 61018 <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     4c2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 15e0 <Clbuild>,a5
     4c8:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
     4ca:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,d3
  DrawCopper = Clbuild( );
     4cc:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
     4ce:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,d2
     4d0:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,610cc <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     4d6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397440,60fe4 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     4e0:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397380,60fe8 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     4ea:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,60fec <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     4f0:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,60ff0 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     4f6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397440,60ff4 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     500:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397380,60ff8 <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     50a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397380,60ffc <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     514:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l a3,61000 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     51a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #397440,61004 <ScreenBufferList+0x20>

  SetBplPointers(); 
     524:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 1940 <SetBplPointers>,a3
     52a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     52c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d3,610cc <DrawCopper>
  ViewCopper = tmp;
     532:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,610c8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     538:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d2,dff080 <_end+0xd9df9c>
  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     53e:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610de <SysBase>,a6
     544:	|  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #22,d0
     546:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l #65537,d1
     54c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -198(a6)
     550:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l d0,a1
     552:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 24(sp),sp
     556:	|  |  |  |  |  |  |  |  |  |  |  |  |                     tst.l d0
     558:	|  |  |  |  |  |  |  |  |  |  |  |  |                 /-- beq.s 574 <main+0x50e>
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     55a:	|  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #708,8(a1)
    Vbint->is_Node.ln_Name = "VertB-Example";
     560:	|  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.l #223650,10(a1)
    Vbint->is_Data = NULL;
     568:	|  |  |  |  |  |  |  |  |  |  |  |  |                 |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     56c:	|  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.l #2568,18(a1)
  AddIntServer( INTB_VERTB, Vbint); 
     574:	|  |  |  |  |  |  |  |  |  |  |  |  |                 \-> movea.l 610de <SysBase>,a6
     57a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #5,d0
     57c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -168(a6)
	PrepareDisplay();	
	custom->intena=0xc010;//Enable vblank
     580:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610da <custom>,a0
     586:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-16368,154(a0)

	//WarmUp
	SetBplPointers();
     58c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
  UBYTE *tmp = DrawCopper;
     58e:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 610cc <DrawCopper>,d0
  DrawCopper = ViewCopper;
     594:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l 610c8 <ViewCopper>,610cc <DrawCopper>
  ViewCopper = tmp;
     59e:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,610c8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     5a4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.l d0,dff080 <_end+0xd9df9c>
	//LoadVectors();
	SwapCl();
	WaitVbl();
     5aa:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
     5ac:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 4072 <DrawScreen>,a5

	

	while(1 == 1) {		
		DrawScreen();
     5b2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
		SetBplPointers();
     5b4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a3)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     5b6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w f0ff60 <_end+0xeaee7c>,d0
     5bc:	|  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #20153,d0
     5c0:	|  |  |  |  |  |  |  |  |  |  |  |  |        /----------- beq.s 632 <main+0x5cc>
     5c2:	|  |  |  |  |  |  |  |  |  |  |  |  |        |     /----> cmpi.w #-24562,d0
     5c6:	|  |  |  |  |  |  |  |  |  |  |  |  |        +-----|----- beq.s 632 <main+0x5cc>
		debug_start_idle();
		while(FrameCounter<2);
     5c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----|----> move.w 610d0 <FrameCounter>,d0
     5ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |      cmpi.w #1,d0
     5d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-----|----- bls.s 5c8 <main+0x562>
		if(FrameCounter >= 3) {
     5d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----|----> move.w 610d0 <FrameCounter>,d0
     5da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      cmpi.w #2,d0
     5de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  /-- bls.s 5ea <main+0x584>
    		KPrintF("Framerate below 25FPS\n");
     5e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   pea 369b0 <incbin_MercuryLetterData2Lz4_end+0x23e>
     5e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   jsr (a4)
     5e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   addq.l #4,sp
		}
		FrameCounter = 0;
     5ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \-> move.w #0,610d0 <FrameCounter>
		WaitVbl();
     5f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      jsr (a2)
     5f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      move.w f0ff60 <_end+0xeaee7c>,d0
     5fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |      cmpi.w #20153,d0
     5fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  /-- beq.s 65e <main+0x5f8>
     600:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   cmpi.w #-24562,d0
     604:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  +-- beq.s 65e <main+0x5f8>
  UBYTE *tmp = DrawCopper;
     606:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l 610cc <DrawCopper>,d0
  DrawCopper = ViewCopper;
     60c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l 610c8 <ViewCopper>,610cc <DrawCopper>
  ViewCopper = tmp;
     616:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l d0,610c8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     61c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |   move.l d0,dff080 <_end+0xd9df9c>
		DrawScreen();
     622:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-> jsr (a5)
		SetBplPointers();
     624:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a3)
     626:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w f0ff60 <_end+0xeaee7c>,d0
     62c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmpi.w #20153,d0
     630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-- bne.s 5c2 <main+0x55c>
		UaeLib(88, arg1, arg2, arg3, arg4);
     632:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-----|-> clr.l -(sp)
     634:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   clr.l -(sp)
     636:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 1 <_start+0x1>
     63a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 5 <_start+0x5>
     63e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   pea 58 <_start+0x58>
     642:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   jsr f0ff60 <_end+0xeaee7c>
	}
}
     648:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   lea 20(sp),sp
		while(FrameCounter<2);
     64c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   move.w 610d0 <FrameCounter>,d0
     652:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |   cmpi.w #1,d0
     656:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|-----|-----|-- bls.w 5c8 <main+0x562>
     65a:	|  |  |  |  |  |  |  |  |  |  |  |  |     \-----|-----|-- bra.w 5d4 <main+0x56e>
		UaeLib(88, arg1, arg2, arg3, arg4);
     65e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |     \-> clr.l -(sp)
     660:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.l -(sp)
     662:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.l -(sp)
     664:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         pea 5 <_start+0x5>
     668:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         pea 58 <_start+0x58>
     66c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         jsr f0ff60 <_end+0xeaee7c>
}
     672:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     676:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l 610cc <DrawCopper>,d0
  DrawCopper = ViewCopper;
     67c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l 610c8 <ViewCopper>,610cc <DrawCopper>
  ViewCopper = tmp;
     686:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l d0,610c8 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     68c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |         move.l d0,dff080 <_end+0xd9df9c>
	while(1 == 1) {		
     692:	|  |  |  |  |  |  |  |  |  |  |  |  |           \-------- bra.s 622 <main+0x5bc>
		KPrintF("p61Init failed!\n");
     694:	|  |  |  |  |  >--|--|--|--|--|--|--|-------------------> pea 368f2 <incbin_MercuryLetterData2Lz4_end+0x180>
     69a:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a4)
     69c:	|  |  |  |  |  |  |  |  |  |  |  |  |                     addq.l #4,sp
	warpmode(0);
     69e:	|  |  |  |  |  |  |  |  |  |  |  |  |                     clr.l -(sp)
     6a0:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a5)
	Forbid();
     6a2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610de <SysBase>,a6
     6a8:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -132(a6)
	SystemADKCON=custom->adkconr;
     6ac:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610da <custom>,a0
     6b2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 16(a0),d0
	SystemInts=custom->intenar;
     6b6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     6ba:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 2(a0),d0
	LoadView(0);
     6be:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610d6 <GfxBase>,a6
     6c4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     suba.l a1,a1
     6c6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -222(a6)
	WaitTOF();
     6ca:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610d6 <GfxBase>,a6
     6d0:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -270(a6)
	WaitTOF();
     6d4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610d6 <GfxBase>,a6
     6da:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -270(a6)
	WaitVbl();
     6de:	|  |  |  |  |  |  |  |  |  |  |  |  |                     lea 9c2 <WaitVbl>,a2
     6e4:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
	WaitVbl();
     6e6:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr (a2)
	OwnBlitter();
     6e8:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610d6 <GfxBase>,a6
     6ee:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -456(a6)
	WaitBlit();	
     6f2:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610d6 <GfxBase>,a6
     6f8:	|  |  |  |  |  |  |  |  |  |  |  |  |                     jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     6fc:	|  |  |  |  |  |  |  |  |  |  |  |  |                     movea.l 610da <custom>,a0
     702:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     708:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     70e:	|  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #16383,150(a0)
     714:	|  |  |  |  |  |  |  |  |  |  |  |  |                     addq.l #4,sp
	for(int a=0;a<32;a++)
     716:	|  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
     718:	|  |  |  |  |  |  |  \--|--|--|--|--|-------------------- bra.w 192 <main+0x12c>
		Exit(0);
     71c:	|  |  >--|--|--|--|-----|--|--|--|--|-------------------> suba.l a6,a6
     71e:	|  |  |  |  |  |  |     |  |  |  |  |                     moveq #0,d1
     720:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     724:	|  |  |  |  |  |  |     |  |  |  |  |                     pea 368c6 <incbin_MercuryLetterData2Lz4_end+0x154>
     72a:	|  |  |  |  |  |  |     |  |  |  |  |                     lea 19dc <KPrintF>,a4
     730:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr (a4)
	Write(Output(), (APTR)"Hello console!\n", 15);
     732:	|  |  |  |  |  |  |     |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     738:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr -60(a6)
     73c:	|  |  |  |  |  |  |     |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     742:	|  |  |  |  |  |  |     |  |  |  |  |                     move.l d0,d1
     744:	|  |  |  |  |  |  |     |  |  |  |  |                     move.l #223458,d2
     74a:	|  |  |  |  |  |  |     |  |  |  |  |                     moveq #15,d3
     74c:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr -48(a6)
	Delay(50);
     750:	|  |  |  |  |  |  |     |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     756:	|  |  |  |  |  |  |     |  |  |  |  |                     moveq #50,d1
     758:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr -198(a6)
	warpmode(1);
     75c:	|  |  |  |  |  |  |     |  |  |  |  |                     pea 1 <_start+0x1>
     760:	|  |  |  |  |  |  |     |  |  |  |  |                     lea 38c6 <warpmode>,a5
     766:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr (a5)
		register volatile const void* _a0 ASM("a0") = module;
     768:	|  |  |  |  |  |  |     |  |  |  |  |                     lea 5f844 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     76e:	|  |  |  |  |  |  |     |  |  |  |  |                     suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     770:	|  |  |  |  |  |  |     |  |  |  |  |                     suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     772:	|  |  |  |  |  |  |     |  |  |  |  |                     lea 5b22 <incbin_player_start>,a3
		__asm volatile (
     778:	|  |  |  |  |  |  |     |  |  |  |  |                     movem.l d1-d7/a4-a6,-(sp)
     77c:	|  |  |  |  |  |  |     |  |  |  |  |                     jsr (a3)
     77e:	|  |  |  |  |  |  |     |  |  |  |  |                     movem.l (sp)+,d1-d7/a4-a6
	if(p61Init(module) != 0)
     782:	|  |  |  |  |  |  |     |  |  |  |  |                     addq.l #8,sp
     784:	|  |  |  |  |  |  |     |  |  |  |  |                     tst.l d0
     786:	|  |  |  |  |  |  \-----|--|--|--|--|-------------------- beq.w 118 <main+0xb2>
     78a:	|  |  |  |  |  \--------|--|--|--|--|-------------------- bra.w 694 <main+0x62e>
		Exit(0);
     78e:	|  |  |  |  \-----------|--|--|--|--|-------------------> movea.l 610d2 <DOSBase>,a6
     794:	|  |  |  |              |  |  |  |  |                     moveq #0,d1
     796:	|  |  |  |              |  |  |  |  |                     jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     79a:	|  |  |  |              |  |  |  |  |                     movea.l 610de <SysBase>,a6
     7a0:	|  |  |  |              |  |  |  |  |                     lea 368ba <incbin_MercuryLetterData2Lz4_end+0x148>,a1
     7a6:	|  |  |  |              |  |  |  |  |                     moveq #0,d0
     7a8:	|  |  |  |              |  |  |  |  |                     jsr -552(a6)
     7ac:	|  |  |  |              |  |  |  |  |                     move.l d0,610d2 <DOSBase>
	if (!DOSBase)
     7b2:	|  |  |  \--------------|--|--|--|--|-------------------- bne.w b2 <main+0x4c>
     7b6:	|  |  \-----------------|--|--|--|--|-------------------- bra.w 71c <main+0x6b6>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     7ba:	|  |                    |  |  |  >--|-------------------> movea.l 610d2 <DOSBase>,a6
     7c0:	|  |                    |  |  |  |  |                     jsr -60(a6)
     7c4:	|  |                    |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     7ca:	|  |                    |  |  |  |  |                     move.l d0,d1
     7cc:	|  |                    |  |  |  |  |                     move.l #223601,d2
     7d2:	|  |                    |  |  |  |  |                     moveq #38,d3
     7d4:	|  |                    |  |  |  |  |                     jsr -48(a6)
    Exit(1);
     7d8:	|  |                    |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     7de:	|  |                    |  |  |  |  |                     moveq #1,d1
     7e0:	|  |                    |  |  |  |  |                     jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     7e4:	|  |                    |  |  |  |  |                     move.l 61040 <Bitmap3>,d0
     7ea:	|  |                    |  |  |  |  +-------------------- bra.w 48e <main+0x428>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     7ee:	|  |                    >--|--|--|--|-------------------> movea.l 610d2 <DOSBase>,a6
     7f4:	|  |                    |  |  |  |  |                     jsr -60(a6)
     7f8:	|  |                    |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     7fe:	|  |                    |  |  |  |  |                     move.l d0,d1
     800:	|  |                    |  |  |  |  |                     move.l #223552,d2
     806:	|  |                    |  |  |  |  |                     moveq #38,d3
     808:	|  |                    |  |  |  |  |                     jsr -48(a6)
    Exit(1);
     80c:	|  |                    |  |  |  |  |                     movea.l 610d2 <DOSBase>,a6
     812:	|  |                    |  |  |  |  |                     moveq #1,d1
     814:	|  |                    |  |  |  |  |                     jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     818:	|  |                    |  |  |  |  |                     move.l 6107c <Bitmap2>,d0
     81e:	|  |                    |  |  |  |  |                     pea 3 <_start+0x3>
     822:	|  |                    |  |  |  |  |                     pea 36965 <incbin_MercuryLetterData2Lz4_end+0x1f3>
     828:	|  |                    |  |  |  |  |                     move.l d0,-(sp)
     82a:	|  |                    |  |  |  |  |                     jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     82c:	|  |                    |  |  |  |  |                     move.l 6107c <Bitmap2>,d2
     832:	|  |                    |  |  |  |  |                     pea 10 <_start+0x10>
     836:	|  |                    |  |  |  |  |                     pea 306 <main+0x2a0>
     83a:	|  |                    |  |  |  |  |                     move.l d2,-(sp)
     83c:	|  |                    |  |  |  |  |                     jsr (a3)
  ScreenBuffer2.BitPlane = Bitmap2;
     83e:	|  |                    |  |  |  |  |                     move.l d2,61044 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     844:	|  |                    |  |  |  |  |                     clr.l 61048 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     84a:	|  |                    |  |  |  |  |                     clr.l 61054 <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     850:	|  |                    |  |  |  |  |                     movea.l 610de <SysBase>,a6
     856:	|  |                    |  |  |  |  |                     move.l #49536,d0
     85c:	|  |                    |  |  |  |  |                     moveq #2,d1
     85e:	|  |                    |  |  |  |  |                     jsr -198(a6)
     862:	|  |                    |  |  |  |  |                     move.l d0,61040 <Bitmap3>
  if(Bitmap3 == 0) {
     868:	|  |                    |  |  |  |  |                     lea 24(sp),sp
     86c:	|  |                    |  |  |  |  \-------------------- bne.w 48e <main+0x428>
     870:	|  |                    |  |  |  \----------------------- bra.w 7ba <main+0x754>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     874:	|  |                    |  |  \-------------------------> movea.l 610d2 <DOSBase>,a6
     87a:	|  |                    |  |                              jsr -60(a6)
     87e:	|  |                    |  |                              movea.l 610d2 <DOSBase>,a6
     884:	|  |                    |  |                              move.l d0,d1
     886:	|  |                    |  |                              move.l #223503,d2
     88c:	|  |                    |  |                              moveq #38,d3
     88e:	|  |                    |  |                              jsr -48(a6)
    Exit(1);
     892:	|  |                    |  |                              movea.l 610d2 <DOSBase>,a6
     898:	|  |                    |  |                              moveq #1,d1
     89a:	|  |                    |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     89e:	|  |                    |  |                              move.l 610b8 <Bitmap1>,d0
     8a4:	|  |                    |  |                              pea 3 <_start+0x3>
     8a8:	|  |                    |  |                              pea 36934 <incbin_MercuryLetterData2Lz4_end+0x1c2>
     8ae:	|  |                    |  |                              move.l d0,-(sp)
     8b0:	|  |                    |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     8b2:	|  |                    |  |                              move.l 610b8 <Bitmap1>,d2
     8b8:	|  |                    |  |                              pea 10 <_start+0x10>
     8bc:	|  |                    |  |                              pea 306 <main+0x2a0>
     8c0:	|  |                    |  |                              move.l d2,-(sp)
     8c2:	|  |                    |  |                              jsr (a3)
  ScreenBuffer1.BitPlane = Bitmap1;
     8c4:	|  |                    |  |                              move.l d2,61080 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     8ca:	|  |                    |  |                              clr.l 61084 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     8d0:	|  |                    |  |                              clr.l 61090 <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     8d6:	|  |                    |  |                              movea.l 610de <SysBase>,a6
     8dc:	|  |                    |  |                              move.l #49536,d0
     8e2:	|  |                    |  |                              moveq #2,d1
     8e4:	|  |                    |  |                              jsr -198(a6)
     8e8:	|  |                    |  |                              move.l d0,6107c <Bitmap2>
  if(Bitmap2 == 0) {
     8ee:	|  |                    |  |                              lea 24(sp),sp
     8f2:	|  |                    |  \----------------------------- bne.w 43c <main+0x3d6>
     8f6:	|  |                    \-------------------------------- bra.w 7ee <main+0x788>
	APTR vbr = 0;
     8fa:	\--|----------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     8fc:	   |                                                      move.l d0,60fe0 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     902:	   |                                                      movea.l 60fe0 <VBR>,a0
     908:	   |                                                      move.l 108(a0),d0
	WaitVbl();
     90c:	   |                                                      jsr (a2)
	custom->dmacon = 0x87ff;
     90e:	   |                                                      movea.l 610da <custom>,a0
     914:	   |                                                      move.w #-30721,150(a0)
  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     91a:	   |                                                      movea.l 610de <SysBase>,a6
     920:	   |                                                      move.l #25000,d0
     926:	   |                                                      moveq #0,d1
     928:	   |                                                      jsr -198(a6)
     92c:	   |                                                      move.l d0,610c4 <WorkingMem>
  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     932:	   |                                                      movea.l 610de <SysBase>,a6
     938:	   |                                                      move.l #120000,d0
     93e:	   |                                                      moveq #2,d1
     940:	   |                                                      jsr -198(a6)
     944:	   |                                                      move.l d0,610c0 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     94a:	   |                                                      pea 3 <_start+0x3>
     94e:	   |                                                      pea 2710 <DrawRect+0xcc2>
     952:	   |                                                      move.l d0,-(sp)
     954:	   |                                                      lea 3ada <Utils_FillLong.constprop.0>,a3
     95a:	   |                                                      jsr (a3)
  WaitBlit();
     95c:	   |                                                      movea.l 610d6 <GfxBase>,a6
     962:	   |                                                      jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     966:	   |                                                      move.w #-1,dff044 <_end+0xd9df60>
  custom->bltalwm = 0xffff; //Static
     96e:	   |                                                      move.w #-1,dff046 <_end+0xd9df62>
  PrepareLineBuffer( LineBuffer);
     976:	   |                                                      movea.l 610c0 <LineBuffer>,a5
  for( WORD i=0;i <=5;i++) {
     97c:	   |                                                      movea.l a5,a1
     97e:	   |                                                      lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     982:	   |                                                      moveq #0,d5
  for( WORD i=0;i <=5;i++) {
     984:	   |                                                      clr.w d4
      data = data >> i2;
     986:	   |                                                      moveq #0,d3
     988:	   |                                                      not.w d3
     98a:	   \----------------------------------------------------- bra.w 26a <main+0x204>
     98e:	                                                          nop

00000990 <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     990:	subq.l #4,sp
     992:	move.l 16(sp),d0
     996:	move.w d0,d0
     998:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     99c:	moveq #11,d0
     99e:	add.l 8(sp),d0
     9a2:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     9a4:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     9a8:	moveq #0,d0
     9aa:	move.w 2(sp),d0
	__asm volatile (
     9ae:	movem.l d0-d7/a2-a6,-(sp)
     9b2:	jsr 4c98 <_lz4_depack>
     9b8:	movem.l (sp)+,d0-d7/a2-a6
}
     9bc:	nop
     9be:	addq.l #4,sp
     9c0:	rts

000009c2 <WaitVbl>:
void WaitVbl() {
     9c2:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     9c4:	/-> move.l dff004 <_end+0xd9df20>,d0
     9ca:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     9cc:	|   move.l (sp),d0
     9ce:	|   andi.l #130816,d0
     9d4:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     9d6:	|   move.l (sp),d0
     9d8:	|   cmpi.l #79616,d0
     9de:	\-- beq.s 9c4 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     9e0:	/-> move.l dff004 <_end+0xd9df20>,d0
     9e6:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     9ea:	|   move.l 4(sp),d0
     9ee:	|   andi.l #130816,d0
     9f4:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     9f8:	|   move.l 4(sp),d0
     9fc:	|   cmpi.l #79616,d0
     a02:	\-- bne.s 9e0 <WaitVbl+0x1e>
}
     a04:	    addq.l #8,sp
     a06:	    rts

00000a08 <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     a08:	move.w #32,dff09c <_end+0xd9dfb8>
  custom->intreq = 1 << INTB_VERTB;
     a10:	move.w #32,dff09c <_end+0xd9dfb8>
  FrameCounter++;
     a18:	move.w 610d0 <FrameCounter>,d0
     a1e:	addq.w #1,d0
     a20:	move.w d0,610d0 <FrameCounter>
}
     a26:	rts

00000a28 <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
     a28:	                                                             lea -20(sp),sp
     a2c:	                                                             movem.l d2-d5/a2,-(sp)
     a30:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
     a34:	                                                             movea.l 610cc <DrawCopper>,a1
     a3a:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
     a3e:	                                                             movea.l 60fd4 <DrawBuffer>,a0
     a44:	                                                             move.w 52(a0),d0
     a48:	                                                /----------- bmi.w be8 <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
     a4c:	                                                |            move.w 54(a0),d2
     a50:	                                                |     /----- bmi.w ba4 <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
     a54:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
     a56:	                                                |     |      move.w d2,d4
     a58:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
     a5a:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
     a5e:	                                                |     |      cmp.w d1,d0
     a60:	                                          /-----|-----|----- bhi.w c90 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
     a64:	                                          |     |     |      move.w #70,30(sp)
     a6a:	                                          |     |     |      move.w d2,32(sp)
     a6e:	                                          |     |     |      move.w #109,34(sp)
     a74:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
     a7a:	                                          |     |     |      clr.w 20(sp)
     a7e:	                                          |     |     |      move.w #1,22(sp)
     a84:	                                          |     |     |      move.w #2,24(sp)
     a8a:	                                          |     |     |      move.w #3,26(sp)
     a90:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
     a96:	                                          |     |     |      cmpi.w #69,d2
     a9a:	                                       /--|-----|-----|----- bhi.w c26 <SetCl+0x1fe>
              values[j] = values[j + 1];
     a9e:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
     aa2:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
     aa8:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
     aae:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
     ab2:	                                       |  |  |  |     |      moveq #70,d0
     ab4:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
     ab8:	|                                      |  |  |  |     |  /-- bcc.s aca <SetCl+0xa2>
              int temp2 = ids[j];
     aba:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
     ac0:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
     ac4:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
     aca:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
     ace:	|                                      |  |  |  |     |      cmp.w a0,d0
     ad0:	|                                      |  |  |  |     |  /-- bcc.s aee <SetCl+0xc6>
              int temp2 = ids[j];
     ad2:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
     ad6:	|                                      |  |  |  |     |  |   move.w d0,d2
     ad8:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
     adc:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
     ae2:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
     ae6:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
     aea:	|                                      |  |  |  |     |  |   move.w a0,d0
     aec:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
     aee:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
     af2:	|                                      |  |  |  |     |      cmp.w d0,d2
     af4:	|                                      |  |  |  |     |  /-- bcc.s b0e <SetCl+0xe6>
              int temp2 = ids[j];
     af6:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
     afa:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
     afe:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
     b04:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
     b08:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
     b0c:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
     b0e:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
     b12:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
     b16:	|                                      |  |  |  |     |  /-- bcc.s b2a <SetCl+0x102>
              int temp2 = ids[j];
     b18:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
     b1c:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
     b20:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
     b26:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
     b2a:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
     b2c:	|                                      |  |  |  |     |  /-- bcc.s b44 <SetCl+0x11c>
              int temp2 = ids[j];
     b2e:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
     b32:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
     b36:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
     b3c:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
     b40:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
     b44:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
     b48:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
     b4c:	|                                      |  |  |  |     |  /-- bcc.s b70 <SetCl+0x148>
              int temp2 = ids[j];
     b4e:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
     b52:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
     b58:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
     b5c:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
     b60:	|                                      |  |  |  |     |  +-- bcc.s b70 <SetCl+0x148>
              int temp2 = ids[j];
     b62:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
     b66:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
     b6c:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
     b70:	|                                      |  |  |  |     |  \-> move.w d1,d0
     b72:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
     b74:	|                                      |  |  |  |     |      addi.w #11521,d0
     b78:	|                                      |  |  |  |     |      cmpi.w #210,d1
     b7c:	|                                      |  |  |  |     |  /-- bhi.w c6c <SetCl+0x244>
    switch( ids[i]) 
     b80:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
     b86:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 1478 <SetCl+0xa50>
     b8a:	|  |                                   |  |  |  |     |  |   moveq #0,d1
     b8c:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
     b90:	|  |                                   |  |  |  |     |  |   add.l d1,d1
     b92:	|  |                                   |  |  |  |     |  |   move.w (b9a <SetCl+0x172>,pc,d1.l),d1
     b96:	|  |                                   |  |  |  |     |  |   jmp (b9a <SetCl+0x172>,pc,d1.w)
     b9a:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
     b9e:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
     ba4:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
     ba6:	|  |                                   |  |  |  |  /-----|-- bhi.w cd0 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
     baa:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
     bb0:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
     bb6:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
     bbc:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
     bc2:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
     bc8:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
     bcc:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
     bce:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
     bd2:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
     bd8:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
     bde:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
     be2:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
     be4:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w ab4 <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
     be8:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
     bee:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
     bf4:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
     bfa:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
     c00:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
     c04:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
     c0a:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
     c10:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
     c16:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
     c1c:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
     c20:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
     c24:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
     c26:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
     c2a:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
     c2e:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w ab4 <SetCl+0x8c>
              int temp2 = ids[j];
     c32:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
     c36:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
     c3c:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
     c42:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
     c46:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
     c4a:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
     c4e:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 1460 <SetCl+0xa38>
              values[j] = values[j + 1];
     c52:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
     c58:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
     c5e:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
     c62:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
     c66:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
     c68:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w ab4 <SetCl+0x8c>
    switch( ids[i]) 
     c6c:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
     c72:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 1466 <SetCl+0xa3e>
     c76:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
     c78:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
     c7c:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
     c7e:	|  |  |  |                             |  |  |     |  |      move.w (c86 <SetCl+0x25e>,pc,d1.l),d1
     c82:	|  |  |  |                             |  |  |     |  |      jmp (c86 <SetCl+0x25e>,pc,d1.w)
     c86:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
     c88:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
     c8e:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
     c92:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
     c98:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
     c9c:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
     ca2:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
     ca8:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
     cac:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
     cb2:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
     cb8:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
     cbe:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
     cc4:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
     cc8:	|  |  |  |                             |     \-----|--|----- bls.w a9e <SetCl+0x76>
     ccc:	|  |  |  |                             \-----------|--|----- bra.w c26 <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
     cd0:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
     cd2:	|  |  |  |                                            |      move.w #109,34(sp)
     cd8:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
     cde:	|  |  |  |                                            |      move.w #2,24(sp)
     ce4:	|  |  |  |                                            |      move.w #3,26(sp)
     cea:	|  |  |  |                                            |      move.w #4,28(sp)
     cf0:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
     cf4:	|  |  |  |                                            |      clr.w d3
     cf6:	|  |  |  |                                            \----- bra.w bce <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
     cfa:	|  |  |  |                                                   cmpi.w #211,d3
     cfe:	|  |  |  |                                               /-- bls.s d10 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
     d00:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
     d06:	|  |  |  |                                               |   lea 172(a1),a2
     d0a:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
     d10:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
     d12:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
     d18:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
     d1e:	|  |  |  |                                                   lea 8(a2),a0
     d22:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
     d28:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
     d2e:	|  |  |  |  /--|-------------------------------------------- bhi.w 147e <SetCl+0xa56>
     d32:	|  |  |  |  |  |                                             moveq #0,d1
     d34:	|  |  |  |  |  |                                             move.w 22(sp),d1
     d38:	|  |  |  |  |  |                                             add.l d1,d1
     d3a:	|  |  |  |  |  |                                             move.w (d42 <SetCl+0x31a>,pc,d1.l),d1
     d3e:	|  |  |  |  |  |                                             jmp (d42 <SetCl+0x31a>,pc,d1.w)
     d42:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
     d46:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
     d50:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
     d58:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
     d5e:	|  |  |  |  |  |                                             lea 176(a1),a0
     d62:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
     d68:	|  |  |  |  |  +-------------------------------------------- bra.s d28 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
     d6a:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
     d70:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
     d76:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
     d7c:	|  |  |  |  |  |                                             lea 176(a1),a0
     d80:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
     d86:	|  |  |  |  |  +-------------------------------------------- bra.s d28 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
     d88:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
     d8e:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
     d94:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
     d9a:	|  |  |  |  |  |                                             lea 176(a1),a0
     d9e:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
     da4:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
     daa:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 148a <SetCl+0xa62>
     dae:	|  |  |  |  |  |  |  |                                       moveq #0,d1
     db0:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
     db4:	|  |  |  |  |  |  |  |                                       add.l d1,d1
     db6:	|  |  |  |  |  |  |  |                                       move.w (dbe <SetCl+0x396>,pc,d1.l),d1
     dba:	|  |  |  |  |  |  |  |                                       jmp (dbe <SetCl+0x396>,pc,d1.w)
     dbe:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
     dc0:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
     dc4:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
     dc6:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
     dc8:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
     dce:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
     dd4:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
     dda:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
     dde:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
     de4:	|  |  |  |  |  |  |  +-------------------------------------- bra.s da4 <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
     de6:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
     dea:	|  |  |  |  |  |  |  |                                   /-- bls.s dfc <SetCl+0x3d4>
          *tmp++ = 0xffdf;
     dec:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
     df2:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
     df6:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
     dfc:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
     dfe:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
     e04:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
     e0a:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
     e0e:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
     e14:	|  |  |  |  |  |  |  +-------------------------------------- bra.s da4 <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
     e16:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
     e1c:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
     e22:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
     e28:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
     e2c:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
     e32:	|  |  |  |  |  |  |  +-------------------------------------- bra.w da4 <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
     e36:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
     e3c:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
     e42:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
     e48:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
     e4c:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
     e52:	|  |  |  |  |  +--|--|-------------------------------------- bra.w d28 <SetCl+0x300>
        *tmp++ = line + 0x001;
     e56:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
     e5a:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
     e60:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
     e66:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
     e6a:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
     e70:	|  |  |  |  |  |  |  +-------------------------------------- bra.w da4 <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
     e74:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
     e78:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
     e7e:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
     e84:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
     e88:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
     e8e:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
     e94:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 1472 <SetCl+0xa4a>
     e98:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
     e9a:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
     e9e:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
     ea0:	|  |  |  |  |  |  |  |  |  |                                 move.w (ea8 <SetCl+0x480>,pc,d1.l),d1
     ea4:	|  |  |  |  |  |  |  |  |  |                                 jmp (ea8 <SetCl+0x480>,pc,d1.w)
     ea8:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
     eaa:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
     eac:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
     eb4:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
     eb6:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
     ebc:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
     ec2:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
     ec6:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
     ecc:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s e8e <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
     ece:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
     ed2:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s ee0 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
     ed4:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
     ed8:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
     ede:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
     ee0:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
     ee2:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
     ee8:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
     eee:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
     ef2:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
     ef8:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s e8e <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
     efa:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
     efe:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
     f04:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
     f0a:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
     f0e:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
     f14:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w e8e <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
     f18:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
     f1c:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
     f22:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
     f28:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
     f2c:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
     f32:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
     f38:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 1484 <SetCl+0xa5c>
     f3c:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
     f3e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
     f42:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
     f44:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (f4c <SetCl+0x524>,pc,d1.l),d1
     f48:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (f4c <SetCl+0x524>,pc,d1.w)
     f4c:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
     f4e:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
     f50:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
     f52:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
     f54:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
     f56:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
     f5a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
     f60:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
     f66:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
     f6a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
     f70:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s f32 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
     f72:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
     f76:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s f84 <SetCl+0x55c>
          *tmp++ = 0xffdf;
     f78:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
     f7c:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
     f82:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
     f84:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
     f86:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
     f8c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
     f92:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
     f96:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
     f9c:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s f32 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
     f9e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
     fa2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
     fa8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
     fae:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
     fb2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
     fb8:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w f32 <SetCl+0x50a>
        *tmp++ = line + 0x001;
     fbc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
     fbe:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
     fc4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
     fca:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
     fce:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
     fd4:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w f32 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
     fd8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
     fdc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
     fe2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
     fe8:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
     fec:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
     ff2:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
     ff8:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 14a6 <SetCl+0xa7e>
     ffc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
     ffe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1002:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1004:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (100c <SetCl+0x5e4>,pc,d1.l),d1
    1008:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (100c <SetCl+0x5e4>,pc,d1.w)
    100c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    100e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1010:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1012:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1014:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1018:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    101a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1020:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1026:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    102a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1030:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s ff2 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    103c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1042:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1046:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    104c:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s ff2 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    104e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1050:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1056:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    105c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1060:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1066:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s ff2 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1068:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    106c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 107a <SetCl+0x652>
          *tmp++ = 0xffdf;
    106e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1072:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1078:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    107a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    107c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1082:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1088:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    108c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1092:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w ff2 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1096:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    109a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    10a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    10a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    10aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    10b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    10b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 1490 <SetCl+0xa68>
    10ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    10bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    10c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    10c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (10ca <SetCl+0x6a2>,pc,d1.l),d1
    10c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (10ca <SetCl+0x6a2>,pc,d1.w)
    10ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    10cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    10ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    10d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    10d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    10d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    10d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    10de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    10e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    10e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    10ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 10b0 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    10f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    10f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1102 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    10f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    10fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1100:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1102:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1104:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    110a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1110:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1114:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    111a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 10b0 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    111c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1120:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1126:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    112c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1130:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1136:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 10b0 <SetCl+0x688>
        *tmp++ = line + 0x001;
    113a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    113c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1142:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1148:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    114c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1152:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 10b0 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1156:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    115a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1160:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1166:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    116a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1174:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    117a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    117e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1182:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1184:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1188:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    118e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1194:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1198:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    119e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    11a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    11a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    11ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    11b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    11b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    11b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 11c4 <SetCl+0x79c>
          *tmp++ = 0xffdf;
    11b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    11bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    11c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    11c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    11c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    11cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    11d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    11d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    11dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    11e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    11e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    11ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    11ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    11f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    11f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    11fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1200:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1204:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    120a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    120e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1214:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1218:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    121c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    121e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1222:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1230 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1224:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1228:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    122e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1230:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1232:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1238:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    123e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1242:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1248:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    124c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1252:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1256:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    125a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    125c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1260:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1266:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    126c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1270:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1276:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    127c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 146c <SetCl+0xa44>
    1280:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1282:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1286:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1288:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1290 <SetCl+0x868>,pc,d1.l),d1
    128c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1290 <SetCl+0x868>,pc,d1.w)
    1290:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1292:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1294:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    129c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    129e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    12a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    12aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    12ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    12b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1276 <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    12b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    12ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 12c8 <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    12bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    12c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    12c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    12c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    12ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    12d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    12d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    12da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    12e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1276 <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    12e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    12e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    12ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    12f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    12f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    12fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1276 <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1300:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1304:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    130a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1310:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1314:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    131a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1320:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 1490 <SetCl+0xa68>
    1324:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1326:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    132a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    132c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1334 <SetCl+0x90c>,pc,d1.l),d1
    1330:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1334 <SetCl+0x90c>,pc,d1.w)
    1334:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1336:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1338:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    133a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    133c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    133e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1342:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1348:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    134e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1352:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1358:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 131a <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    135a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    135e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 136c <SetCl+0x944>
          *tmp++ = 0xffdf;
    1360:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1364:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    136a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    136c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    136e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1374:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    137a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    137e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1384:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 131a <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1386:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    138a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1390:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1396:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    139a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    13a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 131a <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    13a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    13a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 13b6 <SetCl+0x98e>
          *tmp++ = 0xffdf;
    13aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    13ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    13b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    13b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    13b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    13be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    13c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    13c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    13ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 131a <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    13d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    13d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 13e4 <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    13d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    13dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    13e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    13e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    13e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    13ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    13f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    13f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    13fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1276 <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1400:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1404:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1412 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1406:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    140a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1410:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1412:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1414:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    141a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1420:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1424:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    142a:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w e8e <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    142e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1432:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1444 <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1434:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    143a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    143e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1444:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1446:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    144c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1452:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1456:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    145c:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w d28 <SetCl+0x300>
    1460:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    1462:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w ab4 <SetCl+0x8c>
    switch( ids[i]) 
    1466:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    1468:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w d28 <SetCl+0x300>
    146c:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    146e:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 131a <SetCl+0x8f2>
    1472:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    1474:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1276 <SetCl+0x84e>
    1478:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    147a:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w da4 <SetCl+0x37c>
    147e:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    1480:	                  |     \-----|--|--|--|--|--|-------------- bra.w e8e <SetCl+0x466>
    1484:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    1486:	                  |           |     |  \--|--|-------------- bra.w ff2 <SetCl+0x5ca>
    148a:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    148c:	                              \-----|-----|--|-------------- bra.w f32 <SetCl+0x50a>
    1490:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    1492:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    1496:	                                    |     |                  move.w #-2,2(a0)
}
    149c:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    14a0:	                                    |     |                  lea 20(sp),sp
    14a4:	                                    |     |                  rts
    switch( ids[i]) 
    14a6:	                                    \-----|----------------> movea.l a0,a1
    14a8:	                                          \----------------- bra.w 10b0 <SetCl+0x688>

000014ac <LoadVectors>:
{
    14ac:	       move.l a3,-(sp)
    14ae:	       move.l a2,-(sp)
    14b0:	       movea.l 12(sp),a2
    14b4:	       movea.l 16(sp),a1
    14b8:	       movea.l 20(sp),a3
  while( *source != 127) {
    14bc:	       move.w (a2),d0
    14be:	       movea.l a3,a0
    14c0:	       cmpi.w #127,d0
    14c4:	/----- beq.s 151a <LoadVectors+0x6e>
    *target++ = *source++;
    14c6:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    14c8:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    14ce:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    14d4:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    14da:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    14e0:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    14e6:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    14ec:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    14f2:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    14f8:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    14fe:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    1504:	|  |   lea 24(a2),a2
    1508:	|  |   lea 24(a0),a0
    150c:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    1512:	|  |   move.w (a2),d0
    1514:	|  |   cmpi.w #127,d0
    1518:	|  \-- bne.s 14c6 <LoadVectors+0x1a>
  while( *source2 != 127) {  
    151a:	\----> move.b (a1),d0
    151c:	       cmpi.b #127,d0
    1520:	/----- beq.w 15da <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    1524:	|  /-> ext.w d0
    1526:	|  |   add.w (a3),d0
    1528:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    152a:	|  |   move.b 1(a1),d0
    152e:	|  |   ext.w d0
    1530:	|  |   add.w 2(a3),d0
    1534:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    1538:	|  |   move.b 2(a1),d0
    153c:	|  |   ext.w d0
    153e:	|  |   add.w 4(a3),d0
    1542:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    1546:	|  |   move.b 3(a1),d0
    154a:	|  |   ext.w d0
    154c:	|  |   add.w 6(a3),d0
    1550:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    1554:	|  |   move.b 4(a1),d0
    1558:	|  |   ext.w d0
    155a:	|  |   add.w 8(a3),d0
    155e:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    1562:	|  |   move.b 5(a1),d0
    1566:	|  |   ext.w d0
    1568:	|  |   add.w 10(a3),d0
    156c:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    1570:	|  |   move.b 6(a1),d0
    1574:	|  |   ext.w d0
    1576:	|  |   add.w 12(a3),d0
    157a:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    157e:	|  |   move.b 7(a1),d0
    1582:	|  |   ext.w d0
    1584:	|  |   add.w 14(a3),d0
    1588:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    158c:	|  |   move.b 8(a1),d0
    1590:	|  |   ext.w d0
    1592:	|  |   add.w 16(a3),d0
    1596:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    159a:	|  |   move.b 9(a1),d0
    159e:	|  |   ext.w d0
    15a0:	|  |   add.w 18(a3),d0
    15a4:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    15a8:	|  |   move.b 10(a1),d0
    15ac:	|  |   ext.w d0
    15ae:	|  |   add.w 20(a3),d0
    15b2:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    15b6:	|  |   lea 24(a3),a3
    15ba:	|  |   lea 12(a1),a1
    15be:	|  |   lea 24(a0),a0
    15c2:	|  |   move.b -1(a1),d0
    15c6:	|  |   ext.w d0
    15c8:	|  |   add.w -2(a3),d0
    15cc:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    15d0:	|  |   move.b (a1),d0
    15d2:	|  |   cmpi.b #127,d0
    15d6:	|  \-- bne.w 1524 <LoadVectors+0x78>
}
    15da:	\----> movea.l (sp)+,a2
    15dc:	       movea.l (sp)+,a3
    15de:	       rts

000015e0 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    15e0:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    15e4:	    movea.l 610de <SysBase>,a6
    15ea:	    move.l #1360,d0
    15f0:	    moveq #2,d1
    15f2:	    jsr -198(a6)
    15f6:	    movea.l d0,a2
  
  if( retval == 0) {
    15f8:	    tst.l d0
    15fa:	/-- beq.w 178a <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    15fe:	|   move.l 3ea80 <ClsSprites>,(a2)
    1604:	|   move.l 3ea84 <ClsSprites+0x4>,4(a2)
    160c:	|   move.l 3ea88 <ClsSprites+0x8>,8(a2)
    1614:	|   move.l 3ea8c <ClsSprites+0xc>,12(a2)
    161c:	|   move.l 3ea90 <ClsSprites+0x10>,16(a2)
    1624:	|   move.l 3ea94 <ClsSprites+0x14>,20(a2)
    162c:	|   move.l 3ea98 <ClsSprites+0x18>,24(a2)
    1634:	|   move.l 3ea9c <ClsSprites+0x1c>,28(a2)
    163c:	|   move.l 3eaa0 <ClsSprites+0x20>,32(a2)
    1644:	|   move.l 3eaa4 <ClsSprites+0x24>,36(a2)
    164c:	|   move.l 3eaa8 <ClsSprites+0x28>,40(a2)
    1654:	|   move.l 3eaac <ClsSprites+0x2c>,44(a2)
    165c:	|   move.l 3eab0 <ClsSprites+0x30>,48(a2)
    1664:	|   move.l 3eab4 <ClsSprites+0x34>,52(a2)
    166c:	|   move.l 3eab8 <ClsSprites+0x38>,56(a2)
    1674:	|   move.l 3eabc <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    167c:	|   move.l 3ea50 <ClScreen>,64(a2)
    1684:	|   move.l 3ea54 <ClScreen+0x4>,68(a2)
    168c:	|   move.l 3ea58 <ClScreen+0x8>,72(a2)
    1694:	|   move.l 3ea5c <ClScreen+0xc>,76(a2)
    169c:	|   move.l 3ea60 <ClScreen+0x10>,80(a2)
    16a4:	|   move.l 3ea64 <ClScreen+0x14>,84(a2)
    16ac:	|   move.l 3ea68 <ClScreen+0x18>,88(a2)
    16b4:	|   move.l 3ea6c <ClScreen+0x1c>,92(a2)
    16bc:	|   move.l 3ea70 <ClScreen+0x20>,96(a2)
    16c4:	|   move.l 3ea74 <ClScreen+0x24>,100(a2)
    16cc:	|   move.l 3ea78 <ClScreen+0x28>,104(a2)
    16d4:	|   move.l 3ea7c <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    16dc:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    16e4:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    16ec:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    16f4:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    16fc:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    1704:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    170c:	|   move.l 3ea30 <ClColor>,136(a2)
    1714:	|   move.l 3ea34 <ClColor+0x4>,140(a2)
    171c:	|   move.l 3ea38 <ClColor+0x8>,144(a2)
    1724:	|   move.l 3ea3c <ClColor+0xc>,148(a2)
    172c:	|   move.l 3ea40 <ClColor+0x10>,152(a2)
    1734:	|   move.l 3ea44 <ClColor+0x14>,156(a2)
    173c:	|   move.l 3ea48 <ClColor+0x18>,160(a2)
    1744:	|   move.l 3ea4c <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    174c:	|   move.l 3e9e0 <ClToggleBitPlanes>,168(a2)
    1754:	|   move.l 3e9e4 <ClToggleBitPlanes+0x4>,172(a2)
    175c:	|   move.l 3e9e8 <ClToggleBitPlanes+0x8>,176(a2)
    1764:	|   move.l 3e9ec <ClToggleBitPlanes+0xc>,180(a2)
    176c:	|   move.l 3e9f0 <ClToggleBitPlanes+0x10>,184(a2)
    1774:	|   move.l 3e9f4 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    177c:	|   moveq #-2,d0
    177e:	|   move.l d0,192(a2)
  return retval;  
}
    1782:	|   move.l a2,d0
    1784:	|   movem.l (sp)+,d2-d3/a2/a6
    1788:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    178a:	\-> movea.l 610d2 <DOSBase>,a6
    1790:	    jsr -60(a6)
    1794:	    movea.l 610d2 <DOSBase>,a6
    179a:	    move.l d0,d1
    179c:	    move.l #223091,d2
    17a2:	    moveq #40,d3
    17a4:	    jsr -48(a6)
    Exit(1);
    17a8:	    movea.l 610d2 <DOSBase>,a6
    17ae:	    moveq #1,d1
    17b0:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    17b4:	    move.l 3ea80 <ClsSprites>,(a2)
    17ba:	    move.l 3ea84 <ClsSprites+0x4>,4(a2)
    17c2:	    move.l 3ea88 <ClsSprites+0x8>,8(a2)
    17ca:	    move.l 3ea8c <ClsSprites+0xc>,12(a2)
    17d2:	    move.l 3ea90 <ClsSprites+0x10>,16(a2)
    17da:	    move.l 3ea94 <ClsSprites+0x14>,20(a2)
    17e2:	    move.l 3ea98 <ClsSprites+0x18>,24(a2)
    17ea:	    move.l 3ea9c <ClsSprites+0x1c>,28(a2)
    17f2:	    move.l 3eaa0 <ClsSprites+0x20>,32(a2)
    17fa:	    move.l 3eaa4 <ClsSprites+0x24>,36(a2)
    1802:	    move.l 3eaa8 <ClsSprites+0x28>,40(a2)
    180a:	    move.l 3eaac <ClsSprites+0x2c>,44(a2)
    1812:	    move.l 3eab0 <ClsSprites+0x30>,48(a2)
    181a:	    move.l 3eab4 <ClsSprites+0x34>,52(a2)
    1822:	    move.l 3eab8 <ClsSprites+0x38>,56(a2)
    182a:	    move.l 3eabc <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1832:	    move.l 3ea50 <ClScreen>,64(a2)
    183a:	    move.l 3ea54 <ClScreen+0x4>,68(a2)
    1842:	    move.l 3ea58 <ClScreen+0x8>,72(a2)
    184a:	    move.l 3ea5c <ClScreen+0xc>,76(a2)
    1852:	    move.l 3ea60 <ClScreen+0x10>,80(a2)
    185a:	    move.l 3ea64 <ClScreen+0x14>,84(a2)
    1862:	    move.l 3ea68 <ClScreen+0x18>,88(a2)
    186a:	    move.l 3ea6c <ClScreen+0x1c>,92(a2)
    1872:	    move.l 3ea70 <ClScreen+0x20>,96(a2)
    187a:	    move.l 3ea74 <ClScreen+0x24>,100(a2)
    1882:	    move.l 3ea78 <ClScreen+0x28>,104(a2)
    188a:	    move.l 3ea7c <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    1892:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    189a:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    18a2:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    18aa:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    18b2:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    18ba:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    18c2:	    move.l 3ea30 <ClColor>,136(a2)
    18ca:	    move.l 3ea34 <ClColor+0x4>,140(a2)
    18d2:	    move.l 3ea38 <ClColor+0x8>,144(a2)
    18da:	    move.l 3ea3c <ClColor+0xc>,148(a2)
    18e2:	    move.l 3ea40 <ClColor+0x10>,152(a2)
    18ea:	    move.l 3ea44 <ClColor+0x14>,156(a2)
    18f2:	    move.l 3ea48 <ClColor+0x18>,160(a2)
    18fa:	    move.l 3ea4c <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    1902:	    move.l 3e9e0 <ClToggleBitPlanes>,168(a2)
    190a:	    move.l 3e9e4 <ClToggleBitPlanes+0x4>,172(a2)
    1912:	    move.l 3e9e8 <ClToggleBitPlanes+0x8>,176(a2)
    191a:	    move.l 3e9ec <ClToggleBitPlanes+0xc>,180(a2)
    1922:	    move.l 3e9f0 <ClToggleBitPlanes+0x10>,184(a2)
    192a:	    move.l 3e9f4 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    1932:	    moveq #-2,d0
    1934:	    move.l d0,192(a2)
}
    1938:	    move.l a2,d0
    193a:	    movem.l (sp)+,d2-d3/a2/a6
    193e:	    rts

00001940 <SetBplPointers>:

void SetBplPointers() {
    1940:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    1942:	    movea.w 60cc0 <ScreenBufferOffset>,a0
    1948:	    moveq #0,d0
    194a:	    move.w a0,d0
    194c:	    lea 60fe4 <ScreenBufferList>,a2
    1952:	    move.l d0,d1
    1954:	    add.l d0,d1
    1956:	    add.l d1,d1
    1958:	    move.l (0,a2,d1.l),60fd4 <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    1960:	    move.l d0,d1
    1962:	    addq.l #1,d1
    1964:	    add.l d1,d1
    1966:	    add.l d1,d1
    1968:	    movea.l (0,a2,d1.l),a1
    196c:	    move.l a1,60fc4 <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    1972:	    addq.l #2,d0
    1974:	    add.l d0,d0
    1976:	    add.l d0,d0
    1978:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    197c:	    move.w a0,d0
    197e:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    1980:	    cmpi.w #8,d0
    1984:	/-- bls.s 1988 <SetBplPointers+0x48>
    1986:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    1988:	\-> move.l d1,60fc8 <ClearBuffer>
  ScreenBufferOffset += 3;
    198e:	    move.w d0,60cc0 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    1994:	    move.w 54(a1),d0
    1998:	    ext.l d0
    199a:	    lsl.l #6,d0
    199c:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    199e:	    movea.l 610cc <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    19a4:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    19a8:	    move.l d0,d1
    19aa:	    clr.w d1
    19ac:	    swap d1
    19ae:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    19b2:	    move.l d0,d1
    19b4:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    19ba:	    move.w d1,126(a0)
  highword = ptr >> 16;
    19be:	    clr.w d1
    19c0:	    swap d1
    19c2:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    19c6:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    19cc:	    move.w d0,134(a0)
  highword = ptr >> 16;
    19d0:	    clr.w d0
    19d2:	    swap d0
    19d4:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    19d8:	    movea.l (sp)+,a2
    19da:	    rts

000019dc <KPrintF>:
void KPrintF(const char* fmt, ...) {
    19dc:	    lea -128(sp),sp
    19e0:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    19e4:	    move.w f0ff60 <_end+0xeaee7c>,d0
    19ea:	    cmpi.w #20153,d0
    19ee:	/-- beq.s 1a1a <KPrintF+0x3e>
    19f0:	|   cmpi.w #-24562,d0
    19f4:	+-- beq.s 1a1a <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    19f6:	|   movea.l 610de <SysBase>,a6
    19fc:	|   movea.l 144(sp),a0
    1a00:	|   lea 148(sp),a1
    1a04:	|   lea 4b2a <KPutCharX>,a2
    1a0a:	|   suba.l a3,a3
    1a0c:	|   jsr -522(a6)
}
    1a10:	|   movem.l (sp)+,a2-a3/a6
    1a14:	|   lea 128(sp),sp
    1a18:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    1a1a:	\-> movea.l 610de <SysBase>,a6
    1a20:	    movea.l 144(sp),a0
    1a24:	    lea 148(sp),a1
    1a28:	    lea 4b38 <PutChar>,a2
    1a2e:	    lea 12(sp),a3
    1a32:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    1a36:	    move.l a3,-(sp)
    1a38:	    pea 56 <_start+0x56>
    1a3c:	    jsr f0ff60 <_end+0xeaee7c>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    1a42:	    addq.l #8,sp
}
    1a44:	    movem.l (sp)+,a2-a3/a6
    1a48:	    lea 128(sp),sp
    1a4c:	    rts

00001a4e <DrawRect>:
{  
    1a4e:	                                                                                                                                                             lea -24(sp),sp
    1a52:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    1a56:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    1a5a:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    1a5e:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    1a62:	                                                                                                                                                             tst.w d0
    1a64:	                                                                                                               /-------------------------------------------- blt.w 1c7e <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    1a68:	                                                                                                               |                                             move.w d0,d4
    1a6a:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    1a6c:	                                                                                                               |                                             cmpi.w #256,d0
    1a70:	                                                                                                               |                                         /-- ble.s 1a7c <DrawRect+0x2e>
}
    1a72:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    1a76:	                                                                                                               |        |                                |   lea 24(sp),sp
    1a7a:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    1a7c:	                                                                                                               |        |                                \-> movea.w d1,a0
    1a7e:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    1a82:	                                                                                                               |        |                                    cmpa.w #256,a0
    1a86:	                                                                                                            /--|--------|----------------------------------- ble.w 1ca6 <DrawRect+0x258>
    height = 256 - square->YPosMin;
    1a8a:	                                                                                                            |  |        |                                    move.w #256,d5
    1a8e:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    1a90:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    1a92:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    1a96:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    1a9a:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 1c94 <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    1a9e:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    1aa0:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    1aa4:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    1aa6:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 1a72 <DrawRect+0x24>
    1aa8:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    1aac:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 1a72 <DrawRect+0x24>
    1aae:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    1ab2:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 1a72 <DrawRect+0x24>
  xlength = xlength/16;
    1ab4:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    1ab6:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    1ab8:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    1aba:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    1abe:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    1ac0:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    1ac2:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    1ac4:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    1ac6:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    1ac8:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    1aca:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    1acc:	                                                                                                            |  |  |  |  |  |  |                              movea.l 610bc <PrepareBuffer>,a1
    1ad2:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1ad4:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd9df1e>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    1ada:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd9df1e>,d0
    1ae0:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    1ae4:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 1ada <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    1ae6:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0;
    1aee:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd9df5e>
  custom->bltadat = data;
    1af6:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd9df90>
  custom->bltdpt = Target;  
    1afe:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd9df70>
  custom->bltdmod = mod;
    1b04:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd9df82>
  custom->bltsize = lines*64+linelength;
    1b0a:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    1b0c:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    1b0e:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd9df74>
    custom->bltcon1 = 0x0000;      
    1b14:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd9df5e>
    custom->bltcdat = 0x0;
    1b1c:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd9df8c>
    BltCon0LineDraw = 0x0500;
    1b24:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,60cc2 <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    1b2c:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    1b2e:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    1b32:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    1b36:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    1b3a:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    1b3c:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    1b3e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    1b42:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 239a <DrawRect+0x94c>
  if(height != 0) {
    1b46:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    1b48:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 23ae <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    1b4c:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,60cc2 <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    1b54:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    1b58:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    1b5c:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    1b5e:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    1b60:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    1b64:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2172 <DrawRect+0x724>
  if(height != 0) {
    1b68:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    1b6a:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2186 <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    1b6e:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    1b72:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    1b76:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    1b78:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    1b7a:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    1b7e:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 1f62 <DrawRect+0x514>
  if(height != 0) {
    1b82:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    1b84:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 1f76 <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    1b88:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    1b8a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    1b8e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    1b90:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    1b92:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    1b96:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 1d20 <DrawRect+0x2d2>
  if(height != 0) {
    1b9a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    1b9c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 1d34 <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    1ba0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 610bc <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    1ba6:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  /*length = length / 16;
  length += 2;*/

  UWORD yoffset = starty*64;

  UWORD tmp = (startx/16)*2;
    1baa:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    1bac:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    1bae:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    1bb4:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 60fd4 <DrawBuffer>,a0
    1bba:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  UWORD offset = yoffset+tmp;//+blitendoffset;
  ULONG bltapt = (ULONG) startbuffer + offset;
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    1bbc:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1bbe:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    1bc0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    1bc2:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  ULONG bltsize = length + height*64;

  //WaitBlit();
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1bc4:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd9df1e>,d1
	(void)tst;
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    1bca:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd9df1e>,d1
    1bd0:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    1bd2:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    1bd6:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    1bda:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 1bca <DrawRect+0x17c>
  //custom->bltafwm = 0xffff; //Static
  //custom->bltalwm = 0xffff; //Static  
  //custom->bltcon1 = 0x0000;      
  custom->bltamod = 64 - length*2;
    1bdc:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd9df80>
  custom->bltbmod = 64 - length*2;
    1be2:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd9df7e>
  custom->bltdmod = 64 - length*2;  
    1be8:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd9df82>

  UWORD bit;
  UWORD planes;
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    1bee:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    1bf2:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 1cae <DrawRect+0x260>
  {
    bit = 1;
    planes = 1; //Only Plane 3 to write to
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
  }
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    1bf6:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    1bf8:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 25aa <DrawRect+0xb5c>
  {
    bit = 0;
    planes = 1; //Only Plane 3 to write to
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    1bfc:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    1c02:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    1c06:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    1c08:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    1c0a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    1c0c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    1c12:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    1c14:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    }    
    custom->bltcon0 = 0x0d00 | minterms;
    custom->bltapt = (UBYTE *)bltapt;
    custom->bltbpt = (UBYTE *)bltdpt;
    custom->bltdpt = (UBYTE *)bltdpt;
    custom->bltsize = bltsize;
    1c16:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    1c1a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    1c1e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    1c22:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    1c26:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    1c2a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 1d0c <DrawRect+0x2be>
    1c2e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    1c30:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    1c34:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 1cde <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    1c38:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd9df5c>
    custom->bltapt = (UBYTE *)bltapt;
    1c3e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd9df6c>
    custom->bltbpt = (UBYTE *)bltdpt;
    1c44:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd9df68>
    custom->bltdpt = (UBYTE *)bltdpt;
    1c4a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd9df70>
    custom->bltsize = bltsize;
    1c50:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd9df74>
    bltdpt += 64*256;
    1c56:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    //WaitBlit();
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1c5a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd9df1e>,d0
    (void)tst;
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    1c60:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd9df1e>,d0
    1c66:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    1c6a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 1c60 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    1c6c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    1c6e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    1c70:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 1a72 <DrawRect+0x24>
    if( planes > 1) {
    1c74:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    1c78:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 1c2e <DrawRect+0x1e0>
    1c7a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 1d0c <DrawRect+0x2be>
    height += square->YPosMin;
    1c7e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    1c80:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    1c82:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    1c84:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    1c86:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    1c88:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    1c8c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    1c90:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 1a9e <DrawRect+0x50>
    xlength += xposmin - 16;    
    1c94:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    1c96:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    1c98:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    1c9c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    1ca0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    1ca2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 1aa4 <DrawRect+0x56>
  WORD height = square->Height;
    1ca6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    1ca8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    1caa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 1a92 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    1cae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    1cb4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    1cba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    1cbc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    1cbe:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    1cc0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    1cc6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    1cc8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    1cca:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    1cce:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    1cd2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    1cd6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    1cda:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 1c26 <DrawRect+0x1d8>
    1cde:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    1ce0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd9df5c>
    custom->bltapt = (UBYTE *)bltapt;
    1ce6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd9df6c>
    custom->bltbpt = (UBYTE *)bltdpt;
    1cec:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd9df68>
    custom->bltdpt = (UBYTE *)bltdpt;
    1cf2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd9df70>
    custom->bltsize = bltsize;
    1cf8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd9df74>
    bltdpt += 64*256;
    1cfe:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1d02:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd9df1e>,d0
    1d08:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 1c60 <DrawRect+0x212>
      bit = color & 1;
    1d0c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    1d0e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    1d12:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    1d14:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    1d16:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    1d1a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 1c38 <DrawRect+0x1ea>
    1d1e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 1cde <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    1d20:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 36799 <incbin_MercuryLetterData2Lz4_end+0x27>
    1d26:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    1d2a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 19dc <KPrintF>(pc)
    1d2e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    1d30:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    1d34:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    1d36:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 1ba0 <DrawRect+0x152>
      WORD length = x1 - x2;
    1d3a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    1d3e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    1d40:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    1d42:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    1d44:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    1d46:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 266c <DrawRect+0xc1e>
    1d4a:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    1d4e:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    1d52:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    1d54:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    1d56:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 1ee0 <DrawRect+0x492>
      height += 1; 
    1d5a:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    1d5c:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    1d5e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    1d62:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 1d6a <DrawRect+0x31c>
    1d64:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    1d6a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    1d6e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    1d72:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    1d74:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    1d76:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 1eee <DrawRect+0x4a0>
      if(yposmin <= 0) {
    1d7a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    1d7c:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    1d7e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 1ed4 <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    1d82:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    1d84:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    1d8a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 1f3a <DrawRect+0x4ec>
    1d8e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    1d94:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 2964 <DrawRect+0xf16>
    1d98:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    1d9e:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 2934 <DrawRect+0xee6>
          startx -= 1;
    1da2:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    1da6:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    1da8:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    1daa:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    1dac:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 1f4c <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    1db0:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    1db2:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    1db4:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    1db6:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    1db8:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    1dba:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    1dbc:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 1f26 <DrawRect+0x4d8>
    1dc0:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    1dc2:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    1dc4:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    1dc6:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    1dcc:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    1dce:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    1dd0:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    1dd2:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    1dd4:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    1dd6:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2874 <DrawRect+0xe26>
    1dda:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    1dde:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    1de0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    1de2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    1de4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    1de8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    1dee:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    1df0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    1df2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    1df4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    1df6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    1df8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    1dfa:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    1dfc:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    1dfe:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    1e00:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    1e02:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    1e04:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    1e06:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    1e08:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    1e0a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    1e0c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    1e0e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    1e10:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    1e12:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    1e14:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    1e16:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    1e18:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    1e1a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    1e1c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    1e1e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    1e20:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    1e24:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    1e26:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    1e28:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 369c8 <LookupSlope>,a1
    1e2e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    1e30:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    1e32:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    1e36:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    1e38:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    1e3a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    1e3c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    1e3e:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 1f06 <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1e42:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd9df1e>,d0
    1e48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    1e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
    1e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    1e54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 1e4a <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    1e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    1e58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 60cc2 <BltCon0LineDraw>,d0
    1e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    1e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd9df5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    1e68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 610bc <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    1e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 610c0 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    1e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd9df68>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    1e7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    1e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    1e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    1e80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    1e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd9df64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    1e88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd9df70>
  custom->bltbmod = bltbmod;
    1e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd9df7e>
  custom->bltcmod = bltdmod;
    1e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd9df7c>
  custom->bltdmod = bltdmod;
    1e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd9df82>
  custom->bltsize = bltwidth + 64*height;
    1ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    1ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    1ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    1ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd9df74>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    1eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    1eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    1eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    1eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    1eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 60fd4 <DrawBuffer>,a0
    1ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    1ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    1ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    1ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    1ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd9df1e>,d1
    1ed0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 1bca <DrawRect+0x17c>
        starty += 96;
    1ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    1ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    1edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 1d82 <DrawRect+0x334>
        height = -height;
    1ee0:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    1ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    1ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    1ee6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    1eea:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 1d5a <DrawRect+0x30c>
        startx += 96;
    1eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    1ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    1ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    1efc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    1efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    1f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 1d82 <DrawRect+0x334>
    1f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 1ed4 <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    1f06:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 367af <incbin_MercuryLetterData2Lz4_end+0x3d>
    1f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    1f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 19dc <KPrintF>(pc)
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    1f16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    1f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd9df1e>,d0
    1f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    1f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 1e4a <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    1f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    1f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    1f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    1f2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    1f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    1f36:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 1dcc <DrawRect+0x37e>
          height *= -1;
    1f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    1f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    1f3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    1f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    1f44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    1f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 1db0 <DrawRect+0x362>
    1f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    1f50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    1f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    1f54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    1f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    1f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    1f5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    1f5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 1dc0 <DrawRect+0x372>
    1f60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 1f26 <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    1f62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 36799 <incbin_MercuryLetterData2Lz4_end+0x27>
    1f68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    1f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 19dc <KPrintF>(pc)
    1f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    1f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    1f76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    1f78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 20ea <DrawRect+0x69c>
      WORD length = x1 - x2;
    1f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    1f80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    1f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    1f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    1f86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    1f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 27ce <DrawRect+0xd80>
    1f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    1f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    1f92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    1f94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    1f96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    1f9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    1f9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 211e <DrawRect+0x6d0>
      height += 1; 
    1fa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    1fa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    1fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    1fa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 1fb2 <DrawRect+0x564>
    1faa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    1fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    1fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    1fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    1fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    1fba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    1fbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    1fbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2106 <DrawRect+0x6b8>
      if(yposmin <= 0) {
    1fc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    1fc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    1fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 20fa <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    1fca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    1fcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    1fce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    1fd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 261e <DrawRect+0xbd0>
    1fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    1fd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    1fd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 215c <DrawRect+0x70e>
    1fdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    1fde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    1fe0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 2622 <DrawRect+0xbd4>
          height *= -1;
    1fe4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    1fe6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    1fe8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    1fea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2162 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    1fee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    1ff0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    1ff2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    1ff4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 214c <DrawRect+0x6fe>
    1ff8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    1ffa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    1ffc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2000:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2002:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2004:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2006:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2008:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    200a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 27f2 <DrawRect+0xda4>
    200e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2012:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2014:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2016:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    201a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2020:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2022:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2024:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2026:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2028:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    202a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    202c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    202e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2030:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2034:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2038:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    203c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    203e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2040:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2042:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2044:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2048:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    204a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    204c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2050:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2052:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2054:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2056:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    205a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    205c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    205e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 369c8 <LookupSlope>,a0
    2064:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2066:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2068:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    206c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    206e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2072:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2074:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2076:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 212a <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    207a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd9df1e>,d0
    2080:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2084:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
    208a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    208e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2084 <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2090:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2094:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 60cc2 <BltCon0LineDraw>,a0
    209a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    209c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    209e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    20a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd9df5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    20a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    20a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    20aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 610bc <PrepareBuffer>,a5
    20b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    20b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 610c0 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    20b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd9df68>
  custom->bltcpt = (UBYTE *)bltdpt;
    20be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd9df64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    20c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd9df70>
  custom->bltbmod = bltbmod;
    20ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd9df7e>
  custom->bltcmod = bltdmod;
    20d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd9df7c>
  custom->bltdmod = bltdmod;
    20d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd9df82>
  custom->bltsize = bltwidth + 64*height;
    20de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    20e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    20e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    20e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd9df74>
  WORD x1 = square->Vertices[index1].X;
    20ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    20ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    20f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    20f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 1b88 <DrawRect+0x13a>
        starty += 96;
    20fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    20fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2102:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 1fca <DrawRect+0x57c>
        startx += 96;
    2106:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    210c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2110:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2114:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2116:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2118:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 1fca <DrawRect+0x57c>
    211c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 20fa <DrawRect+0x6ac>
        height = -height;
    211e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2120:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2122:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2124:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2126:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 1fa0 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    212a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 367af <incbin_MercuryLetterData2Lz4_end+0x3d>
    2130:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2134:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 19dc <KPrintF>(pc)
    2138:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    213a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    213e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd9df1e>,d0
    2144:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2148:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2084 <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    214c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2150:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2152:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2154:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2158:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2000 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    215c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    215e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 1fee <DrawRect+0x5a0>
    2162:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2166:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2168:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    216a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    216c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 1ff8 <DrawRect+0x5aa>
    2170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 214c <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2172:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 36799 <incbin_MercuryLetterData2Lz4_end+0x27>
    2178:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    217c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 19dc <KPrintF>(pc)
    2180:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2182:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2186:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2188:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 22f6 <DrawRect+0x8a8>
      WORD length = x1 - x2;
    218c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2190:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2192:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2194:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2196:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2198:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 2732 <DrawRect+0xce4>
    219c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    21a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    21a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    21a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    21a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 232a <DrawRect+0x8dc>
      height += 1; 
    21ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    21ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    21b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    21b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 21bc <DrawRect+0x76e>
    21b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    21bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    21c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    21c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    21c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    21c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2312 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    21cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    21ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    21d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2306 <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    21d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    21d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    21dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2372 <DrawRect+0x924>
    21e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    21e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 2922 <DrawRect+0xed4>
    21ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    21f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 28f2 <DrawRect+0xea4>
          startx -= 1;
    21f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    21f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    21fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    21fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    21fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2384 <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2202:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2204:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2206:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2208:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    220a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    220c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    220e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 235e <DrawRect+0x910>
    2212:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2214:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2216:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2218:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    221e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2220:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2222:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2224:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2226:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2228:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 2752 <DrawRect+0xd04>
    222c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2230:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2232:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2234:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2236:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    223a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2240:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2242:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2244:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2246:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2248:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    224a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    224c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    224e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2250:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2252:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2254:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2256:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2258:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    225a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    225c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    225e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2260:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2262:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2264:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2266:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2268:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    226a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    226c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    226e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2270:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2272:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2276:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2278:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    227a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 369c8 <LookupSlope>,a1
    2280:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2282:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2284:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2288:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    228a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    228c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    228e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2338 <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2292:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2298:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
    229e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    22a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2298 <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    22a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 60cc2 <BltCon0LineDraw>,d0
    22aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    22ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd9df5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    22b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    22b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    22b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 610bc <PrepareBuffer>,a5
    22be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    22c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 610c0 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    22c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd9df68>
  custom->bltcpt = (UBYTE *)bltdpt;
    22cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd9df64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    22d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd9df70>
  custom->bltbmod = bltbmod;
    22d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd9df7e>
  custom->bltcmod = bltdmod;
    22de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd9df7c>
  custom->bltdmod = bltdmod;
    22e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd9df82>
  custom->bltsize = bltwidth + 64*height;
    22ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    22ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    22ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    22f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd9df74>
  WORD x1 = square->Vertices[index1].X;
    22f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    22fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    22fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2302:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 1b6e <DrawRect+0x120>
        starty += 96;
    2306:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    230a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    230e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 21d4 <DrawRect+0x786>
        startx += 96;
    2312:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2318:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    231c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2320:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2322:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2324:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 21d4 <DrawRect+0x786>
    2328:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2306 <DrawRect+0x8b8>
        height = -height;
    232a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    232c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    232e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2330:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2334:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 21ac <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2338:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 367af <incbin_MercuryLetterData2Lz4_end+0x3d>
    233e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2342:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2346:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 19dc <KPrintF>(pc)
    234a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    234c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2350:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2354:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    235a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2298 <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    235e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2362:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2364:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2366:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2368:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    236e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 221e <DrawRect+0x7d0>
          height *= -1;
    2372:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2374:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2376:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    237a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    237c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    237e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2380:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2202 <DrawRect+0x7b4>
    2384:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2388:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    238a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    238c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    238e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2390:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2392:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2394:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2212 <DrawRect+0x7c4>
    2398:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 235e <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    239a:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 36799 <incbin_MercuryLetterData2Lz4_end+0x27>
    23a0:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    23a4:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 19dc <KPrintF>(pc)
    23a8:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    23aa:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    23ae:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    23b0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 2522 <DrawRect+0xad4>
      WORD length = x1 - x2;
    23b4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    23b8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    23ba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    23bc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    23be:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    23c0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 268c <DrawRect+0xc3e>
    23c4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    23c8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    23ca:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    23cc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    23ce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    23d2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    23d4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 2556 <DrawRect+0xb08>
      height += 1; 
    23d8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    23da:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    23dc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    23e0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 23ea <DrawRect+0x99c>
    23e2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    23e4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    23e8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    23ea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    23ee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    23f2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    23f4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    23f6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 253e <DrawRect+0xaf0>
      if(yposmin <= 0) {
    23fa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    23fc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    23fe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 2532 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2402:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2404:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2406:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2408:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 25ce <DrawRect+0xb80>
    240c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    240e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2410:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 2594 <DrawRect+0xb46>
    2414:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2416:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2418:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 25d2 <DrawRect+0xb84>
          height *= -1;
    241c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    241e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2420:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2422:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 259a <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2426:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2428:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    242a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    242c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 2584 <DrawRect+0xb36>
    2430:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2432:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2434:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2438:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    243a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    243c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    243e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2440:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2442:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 26b0 <DrawRect+0xc62>
    2446:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    244a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    244c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    244e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2452:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2458:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    245a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    245c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    245e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2460:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    2462:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2464:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2466:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2468:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    246a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    246c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    246e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    2470:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2474:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2476:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2478:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    247a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    247c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2480:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2482:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2484:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2488:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    248a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    248c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    248e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2492:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    2494:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2496:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 369c8 <LookupSlope>,a0
    249c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    249e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    24a0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    24a4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    24a6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    24aa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    24ac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    24ae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 2562 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    24b2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd9df1e>,d0
    24b8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    24bc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
    24c2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    24c6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 24bc <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    24c8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    24cc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 60cc2 <BltCon0LineDraw>,a0
    24d2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    24d4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    24d6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    24d8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd9df5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    24de:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    24e0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    24e2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 610bc <PrepareBuffer>,a5
    24e8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    24ea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 610c0 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    24f0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd9df68>
  custom->bltcpt = (UBYTE *)bltdpt;
    24f6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd9df64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    24fc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd9df70>
  custom->bltbmod = bltbmod;
    2502:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd9df7e>
  custom->bltcmod = bltdmod;
    250a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd9df7c>
  custom->bltdmod = bltdmod;
    2510:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd9df82>
  custom->bltsize = bltwidth + 64*height;
    2516:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2518:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    251a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    251c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd9df74>
  WORD x1 = square->Vertices[index1].X;
    2522:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    2526:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    252a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    252e:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 1b4c <DrawRect+0xfe>
        starty += 96;
    2532:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2536:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    253a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2402 <DrawRect+0x9b4>
        startx += 96;
    253e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2544:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2548:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    254c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    254e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    2550:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2402 <DrawRect+0x9b4>
    2554:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 2532 <DrawRect+0xae4>
        height = -height;
    2556:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    2558:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    255a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    255c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    255e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 23d8 <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2562:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 367af <incbin_MercuryLetterData2Lz4_end+0x3d>
    2568:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    256c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 19dc <KPrintF>(pc)
    2570:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    2572:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2576:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd9df1e>,d0
    257c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    2580:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 24bc <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    2584:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    2588:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    258a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    258c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    2590:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2438 <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    2594:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    2596:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2426 <DrawRect+0x9d8>
    259a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    259e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    25a0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    25a2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    25a4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2430 <DrawRect+0x9e2>
    25a8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 2584 <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    25aa:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    25ac:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    25ae:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    25b0:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    25b6:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    25b8:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    25ba:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    25be:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    25c2:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    25c6:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    25ca:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 1c26 <DrawRect+0x1d8>
          height *= -1;
    25ce:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    25d0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    25d2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    25d6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    25da:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 260a <DrawRect+0xbbc>
    25dc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    25de:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    25e0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    25e2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    25e4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    25e6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    25e8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 25f8 <DrawRect+0xbaa>
    25ea:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    25ec:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    25ee:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    25f0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    25f4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2438 <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    25f8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    25fc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    25fe:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    2600:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    2602:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    2606:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2438 <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    260a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    260e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    2610:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2612:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    2614:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    2616:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    2618:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    261a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 25ea <DrawRect+0xb9c>
    261c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 25f8 <DrawRect+0xbaa>
          height *= -1;
    261e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    2620:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    2622:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    2626:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    262a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 2648 <DrawRect+0xbfa>
    262c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    262e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2630:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    2632:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    2634:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    2636:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    2638:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 265a <DrawRect+0xc0c>
    263a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    263c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    263e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    2640:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    2644:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2000 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    2648:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    264c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    264e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2650:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    2652:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    2654:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    2656:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    2658:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 263a <DrawRect+0xbec>
    265a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    265e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    2660:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    2662:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    2664:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    2668:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2000 <DrawRect+0x5b2>
        length *= -1;
    266c:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    266e:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    2670:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    2672:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    2676:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    267a:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    2680:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    2682:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    2684:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 1d5a <DrawRect+0x30c>
    2688:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 1ee0 <DrawRect+0x492>
        length *= -1;
    268c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    268e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    2690:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    2692:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    2696:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    269a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    269e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    26a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    26a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    26a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    26a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 23d8 <DrawRect+0x98a>
    26ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 2556 <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    26b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    26b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    26b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    26b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    26ba:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    26bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    26be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    26c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    26c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    26c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    26c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    26ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    26ce:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    26d4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    26d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    26d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    26da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    26dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    26de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    26e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    26e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    26e4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    26e6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    26e8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    26ea:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    26ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    26f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    26f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    26f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    26f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    26f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    26fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    26fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    2700:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    2704:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    2706:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    2708:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    270a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    270e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    2710:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    2712:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 369c8 <LookupSlope>,a0
    2718:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    271a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    271c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    2720:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    2722:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2726:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    2728:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    272a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 24b2 <DrawRect+0xa64>
    272e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 2562 <DrawRect+0xb14>
        length *= -1;
    2732:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    2734:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    2736:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    2738:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    273c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    2740:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    2746:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    2748:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    274a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 21ac <DrawRect+0x75e>
    274e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 232a <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    2752:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    2754:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    2756:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    2758:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    275c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    275e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    2760:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    2762:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    2764:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2768:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    276a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    276c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    276e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    2772:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    2778:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    277a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    277c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    277e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    2780:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    2782:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    2784:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    2786:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    2788:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    278a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    278c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    278e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    2790:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    2792:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    2794:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    2796:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    2798:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    279a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    279c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    279e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    27a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    27a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    27a4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    27a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    27a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    27aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    27ae:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    27b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    27b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 369c8 <LookupSlope>,a1
    27b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    27ba:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    27bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    27c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    27c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    27c4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    27c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2292 <DrawRect+0x844>
    27ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2338 <DrawRect+0x8ea>
        length *= -1;
    27ce:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    27d0:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    27d2:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    27d4:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    27d8:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    27dc:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    27e0:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    27e2:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    27e4:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    27e8:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    27ea:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 1fa0 <DrawRect+0x552>
    27ee:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 211e <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    27f2:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    27f4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    27f6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    27f8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    27fc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    27fe:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    2800:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    2802:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    2804:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2808:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    280a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    280c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    2810:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    2816:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    2818:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    281a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    281c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    281e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    2820:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    2822:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    2824:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    2826:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    2828:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    282a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    282c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    282e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    2832:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    2834:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    2836:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    2838:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    283a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    283e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    2840:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    2842:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    2846:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    2848:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    284a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    284c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    2850:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    2852:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    2854:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 369c8 <LookupSlope>,a0
    285a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    285c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    285e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    2862:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    2864:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2868:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    286a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    286c:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 207a <DrawRect+0x62c>
    2870:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 212a <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    2874:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    2876:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    2878:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    287a:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    287e:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    2880:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    2882:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    2884:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    2886:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    288a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    288c:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    288e:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    2890:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    2894:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    289a:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    289c:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    289e:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    28a0:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    28a2:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    28a4:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    28a6:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    28a8:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    28aa:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    28ac:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    28ae:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    28b0:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    28b2:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    28b4:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    28b6:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    28b8:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    28ba:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    28bc:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    28be:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    28c0:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    28c2:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    28c4:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    28c6:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    28c8:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    28ca:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    28cc:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    28d0:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    28d2:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    28d4:	|  |  |  |  |                                                  |  |  |                                                                                       lea 369c8 <LookupSlope>,a1
    28da:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    28dc:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    28de:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    28e2:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    28e4:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    28e6:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    28e8:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    28ea:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 1e42 <DrawRect+0x3f4>
    28ee:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 1f06 <DrawRect+0x4b8>
          height *= -1;
    28f2:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    28f4:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    28f6:	|  |  |                                                        |     |                                                                                       tst.w d3
    28f8:	|  |  |                                                        |     |                                                                                /----- blt.s 2926 <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    28fa:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    28fc:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    28fe:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    2900:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 2910 <DrawRect+0xec2>
    2902:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    2904:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    2906:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    290c:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 221e <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    2910:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    2914:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    2916:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    2918:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    291e:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 221e <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    2922:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    2924:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 28fa <DrawRect+0xeac>
    2926:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    292a:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    292c:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    292e:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    2930:	|  |  |                                                                                                                                         |  \-------- bpl.s 2902 <DrawRect+0xeb4>
    2932:	|  |  |                                                                                                                                         \----------- bra.s 2910 <DrawRect+0xec2>
          height *= -1;
    2934:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    2936:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    2938:	|     |                                                                                                                                                      tst.w d3
    293a:	|     |                                                                                                                                               /----- blt.s 2968 <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    293c:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    293e:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    2940:	|     |                                                                                                                                               |  |   move.w a4,d0
    2942:	|     |                                                                                                                                         /-----|--|-- bmi.s 2952 <DrawRect+0xf04>
    2944:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    2946:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    2948:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    294e:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 1dcc <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    2952:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    2956:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    2958:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    295a:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    2960:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 1dcc <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    2964:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    2966:	                                                                                                                                                |  |  |  \-- bge.s 293c <DrawRect+0xeee>
    2968:	                                                                                                                                                |  |  \----> addi.w #15,d3
    296c:	                                                                                                                                                |  |         asr.w #4,d3
    296e:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    2970:	                                                                                                                                                |  |         move.w a4,d0
    2972:	                                                                                                                                                |  \-------- bpl.s 2944 <DrawRect+0xef6>
    2974:	                                                                                                                                                \----------- bra.s 2952 <DrawRect+0xf04>

00002976 <DrawCube3d>:
{
    2976:	                                                                                                                      lea -72(sp),sp
    297a:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    297e:	                                                                                                                      movea.l 120(sp),a2
    2982:	                                                                                                                      move.w 126(sp),108(sp)
    2988:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    298e:	                                                                                                                      move.w #0,dff042 <_end+0xd9df5e>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    2996:	                                                                                                                      move.l 60fc8 <ClearBuffer>,54(sp)
    299e:	                                                                                                                      lea 60cc4 <Cubes>,a3
    29a4:	                                                                                                                      moveq #0,d5
    29a6:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    29a8:	|                                                                                                                     add.l d5,d2
    29aa:	|                                                                                                                     move.l d2,102(sp)
    29ae:	|                                                                                                                     add.l d5,d2
    29b0:	|                                                                                                                     add.l d2,d2
    29b2:	|                                                                                                                     add.l d2,d2
    29b4:	|                                                                                                                     movea.l 54(sp),a0
    29b8:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    29bc:	|                                                                                                                     movea.l 610d6 <GfxBase>,a6
    29c2:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    29c6:	|                                                                                                                     move.w #496,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0;
    29ce:	|                                                                                                                     move.w #0,dff042 <_end+0xd9df5e>
  custom->bltdmod = bltmod;
    29d6:	|                                                                                                                     move.w d3,dff066 <_end+0xd9df82>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    29dc:	|                                                                                                                     move.l 60fc8 <ClearBuffer>,54(sp)
    29e4:	|                                                                                                                     movea.l 54(sp),a4
    29e8:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    29ec:	|                                                                                                                     cmpa.w #0,a6
    29f0:	|                       /-------------------------------------------------------------------------------------------- bne.w 32fa <DrawCube3d+0x984>
    29f4:	|                       |                                                                                             move.l d5,d1
    29f6:	|                       |                                                                                             addq.l #1,d1
    29f8:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    29fc:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    29fe:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    2a04:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    2a08:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    2a0c:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    2a10:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    2a14:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    2a18:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    2a1c:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    2a22:	|                    |  |                                                                                             movea.w a0,a1
    2a24:	|                    |  |                                                                                             subq.l #1,a1
    2a26:	|                    |  |                                                                                             adda.l a1,a1
    2a28:	|                    |  |                                                                                             lea 3b7e8 <zMult>,a5
    2a2e:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    2a34:	|                    |  |                                                                                             move.w 62(sp),d0
    2a38:	|                    |  |                                                                                             muls.w d1,d0
    2a3a:	|                    |  |                                                                                             moveq #15,d7
    2a3c:	|                    |  |                                                                                             asr.l d7,d0
    2a3e:	|                    |  |                                                                                             movea.l d0,a1
    2a40:	|                    |  |                                                                                             lea 160(a1),a1
    2a44:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    2a48:	|                    |  |                                                                                             move.w 62(sp),d7
    2a4c:	|                    |  |                                                                                             muls.w 86(sp),d7
    2a50:	|                    |  |                                                                                             moveq #15,d0
    2a52:	|                    |  |                                                                                             asr.l d0,d7
    2a54:	|                    |  |                                                                                             addi.w #128,d7
    2a58:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    2a5c:	|                    |  |                                                                                             movea.w 10(a2),a1
    2a60:	|                    |  |                                                                                             subq.l #1,a1
    2a62:	|                    |  |                                                                                             adda.l a1,a1
    2a64:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    2a6a:	|                    |  |                                                                                             move.w 70(sp),d7
    2a6e:	|                    |  |                                                                                             muls.w 6(a2),d7
    2a72:	|                    |  |                                                                                             asr.l d0,d7
    2a74:	|                    |  |                                                                                             movea.l d7,a1
    2a76:	|                    |  |                                                                                             lea 160(a1),a1
    2a7a:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    2a7e:	|                    |  |                                                                                             move.w 70(sp),d7
    2a82:	|                    |  |                                                                                             muls.w 8(a2),d7
    2a86:	|                    |  |                                                                                             asr.l d0,d7
    2a88:	|                    |  |                                                                                             addi.w #128,d7
    2a8c:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    2a90:	|                    |  |                                                                                             movea.w a4,a1
    2a92:	|                    |  |                                                                                             move.l a1,d7
    2a94:	|                    |  |                                                                                             subq.l #1,d7
    2a96:	|                    |  |                                                                                             add.l d7,d7
    2a98:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    2a9e:	|                    |  |                                                                                             move.w 76(sp),d0
    2aa2:	|                    |  |                                                                                             muls.w d4,d0
    2aa4:	|                    |  |                                                                                             moveq #15,d7
    2aa6:	|                    |  |                                                                                             asr.l d7,d0
    2aa8:	|                    |  |                                                                                             movea.l d0,a5
    2aaa:	|                    |  |                                                                                             lea 160(a5),a5
    2aae:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    2ab2:	|                    |  |                                                                                             move.w 76(sp),d7
    2ab6:	|                    |  |                                                                                             muls.w d3,d7
    2ab8:	|                    |  |                                                                                             moveq #15,d0
    2aba:	|                    |  |                                                                                             asr.l d0,d7
    2abc:	|                    |  |                                                                                             addi.w #128,d7
    2ac0:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    2ac4:	|                    |  |                                                                                             cmpa.w #0,a6
    2ac8:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 2ad4 <DrawCube3d+0x15e>
    2aca:	|                    |  |  |                                                                                          tst.w 60fcc <DoNotClearDirty>
    2ad0:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 32a8 <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    2ad4:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    2ad8:	|                    |  |  |  |                                                                                       move.l a5,d7
    2ada:	|                    |  |  |  |                                                                                       subq.l #1,d7
    2adc:	|                    |  |  |  |                                                                                       add.l d7,d7
    2ade:	|                    |  |  |  |                                                                                       lea 3b7e8 <zMult>,a5
    2ae4:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    2aea:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    2aee:	|                    |  |  |  |                                                                                       muls.w d2,d0
    2af0:	|                    |  |  |  |                                                                                       moveq #15,d7
    2af2:	|                    |  |  |  |                                                                                       asr.l d7,d0
    2af4:	|                    |  |  |  |                                                                                       movea.l d0,a5
    2af6:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    2afa:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    2afe:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    2b02:	|                    |  |  |  |                                                                                       muls.w d6,d7
    2b04:	|                    |  |  |  |                                                                                       moveq #15,d0
    2b06:	|                    |  |  |  |                                                                                       asr.l d0,d7
    2b08:	|                    |  |  |  |                                                                                       addi.w #128,d7
    2b0c:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    2b10:	|                    |  |  |  |                                                                                       move.l a1,d7
    2b12:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    2b18:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    2b1a:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    2b1c:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    2b20:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    2b22:	|                    |  |  |  |                                                                                       muls.w d3,d0
    2b24:	|                    |  |  |  |                                                                                       movea.l d1,a5
    2b26:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    2b28:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    2b2a:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    2b2c:	|                    |  |  |  |                                                                                       movea.w a0,a0
    2b2e:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    2b30:	|                    |  |  |  |                                                                                       jsr 4a30 <__mulsi3>
    2b36:	|                    |  |  |  |                                                                                       addq.l #8,sp
    2b38:	|                    |  |  |  |                                                                                       add.l a5,d0
    2b3a:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    2b3e:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    2b42:	|                    |  |  |  |                                                                                       neg.l d0
    2b44:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    2b48:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    2b4c:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    2b50:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 2b5c <DrawCube3d+0x1e6>
    2b52:	|                    |  |  |  |  |                                                                                    tst.w 60fcc <DoNotClearDirty>
    2b58:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3268 <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    2b5c:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    2b60:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    2b62:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    2b64:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    2b66:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    2b6a:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    2b6e:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    2b70:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    2b72:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    2b74:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    2b76:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    2b78:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    2b7c:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    2b7e:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    2b80:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    2b82:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    2b84:	|                    |  |  |  |  |  |                                                                                 jsr 4a30 <__mulsi3>
    2b8a:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    2b8c:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    2b8e:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    2b92:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    2b94:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    2b96:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    2b9a:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    2b9e:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    2ba2:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 2bb6 <DrawCube3d+0x240>
    2ba4:	|  |                 |  |  |  |  |  |                                                                                 tst.w 60fcc <DoNotClearDirty>
    2baa:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 2bb6 <DrawCube3d+0x240>
    2bac:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    2bb2:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 3798 <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    2bb6:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    2bba:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    2bc0:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    2bc6:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    2bcc:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    2bd2:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    2bd8:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    2bde:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    2be4:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    2be8:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    2bec:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    2bf0:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    2bf2:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    2bf4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    2bf6:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    2bf8:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    2bfa:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    2bfc:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    2bfe:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    2c00:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    2c02:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    2c04:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    2c06:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    2c08:	|  |  |              |  |  |  |  |  |                                                                                 jsr 4a30 <__mulsi3>
    2c0e:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    2c10:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    2c12:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    2c16:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    2c18:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    2c1c:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    2c20:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    2c22:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    2c24:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    2c26:	|  |  |              |  |  |  |  |  |                                                                                 lea 3b7e8 <zMult>,a4
    2c2c:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    2c30:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    2c32:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    2c36:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    2c38:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    2c3a:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    2c3e:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    2c42:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    2c44:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    2c46:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    2c4a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    2c4e:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    2c50:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    2c52:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    2c54:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    2c58:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    2c5a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    2c5e:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    2c60:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    2c64:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    2c68:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    2c6a:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    2c6e:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    2c70:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    2c72:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    2c74:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    2c76:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    2c7a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    2c7c:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    2c7e:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    2c82:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    2c84:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    2c86:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    2c88:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    2c8c:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    2c90:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    2c92:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    2c94:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    2c98:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    2c9a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    2c9e:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    2ca0:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    2ca2:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    2ca4:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    2ca8:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    2caa:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    2cae:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    2cb0:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    2cb2:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    2cb4:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    2cb8:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    2cbc:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 2cd0 <DrawCube3d+0x35a>
    2cbe:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 60fcc <DoNotClearDirty>
    2cc4:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 2cd0 <DrawCube3d+0x35a>
    2cc6:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    2ccc:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 3740 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    2cd0:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    2cd6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    2cdc:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    2ce0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    2ce4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    2ce8:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    2cec:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    2cf0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    2cf4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    2cf8:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    2cfc:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    2d02:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    2d08:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    2d0e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    2d14:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    2d1a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    2d20:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    2d24:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    2d28:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    2d2c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    2d30:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    2d36:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    2d3c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    2d40:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 2d54 <DrawCube3d+0x3de>
    2d42:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 60fcc <DoNotClearDirty>
    2d48:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 2d54 <DrawCube3d+0x3de>
    2d4a:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    2d50:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 37d8 <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    2d54:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    2d5a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    2d60:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    2d64:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    2d68:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    2d6c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    2d70:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    2d76:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    2d7c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    2d82:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    2d88:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    2d8c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    2d90:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    2d94:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    2d98:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    2d9e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    2da4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    2daa:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    2db0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    2db4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    2dba:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    2dbe:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    2dc2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    2dc8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    2dce:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    2dd4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    2dda:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    2dde:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    2de2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    2de8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    2dee:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    2df2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    2df6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    2dfa:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    2dfe:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 29a6 <DrawCube3d+0x30>
    2e02:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 60d84 <Cubes+0xc0>,a6
    2e08:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    2e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    2e10:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    2e1a:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    2e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    2e22:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    2e26:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    2e28:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    2e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    2e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    2e38:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    2e3c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    2e40:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    2e44:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 2fa6 <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    2e48:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    2e4c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    2e50:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 2e40 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    2e52:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    2e56:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    2e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 60fd0 <CubeNrReversePtr>,a0
    2e60:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    2e64:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    2e66:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 318a <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    2e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    2e6c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 30f0 <DrawCube3d+0x77a>
    2e70:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    2e74:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    2e78:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3100 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    2e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    2e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 335c <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    2e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    2e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 2e94 <DrawCube3d+0x51e>
    2e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    2e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    2e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    2e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 60fd4 <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    2ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    2ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    2ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    2eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    2eae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    2eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    2eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    2eb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    2ebc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    2ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    2ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    2ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    2ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    2eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    2ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    2ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    2ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    2ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    2edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    2ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    2ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    2ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    2ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 2efa <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    2eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 2efa <DrawCube3d+0x584>
    2ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    2ef6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 321c <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    2efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    2efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 2f10 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 2f10 <DrawCube3d+0x59a>
    2f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    2f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 322a <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    2f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    2f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 2f26 <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2f16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    2f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 2f26 <DrawCube3d+0x5b0>
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    2f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 31cc <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    2f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    2f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 2f3c <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    2f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 2f3c <DrawCube3d+0x5c6>
    2f32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 31da <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    2f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 2f52 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    2f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 2f52 <DrawCube3d+0x5dc>
    2f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 31e8 <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    2f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    2f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 2f68 <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    2f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    2f5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 2f68 <DrawCube3d+0x5f2>
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    2f64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 31f6 <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    2f68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    2f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    2f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    2f78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    2f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 2e1a <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    2f80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 60fd4 <DrawBuffer>,a2
  if( mirroring == 1) {
    2f86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    2f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 33be <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    2f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    2f96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    2f9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    2fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    2fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    2faa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    2fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    2fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    2fb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    2fba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    2fbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    2fc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    2fc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    2fc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    2fca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    2fd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    2fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    2fd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    2fdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    2fde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    2fe2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    2fe4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    2fec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    2fee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    2ff0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    2ff2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    2ff6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    2ffa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    2ffe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3002:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3004:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3006:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3008:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    300a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    300e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3010:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3012:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3014:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3016:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3018:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    301c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3020:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3024:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3026:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3028:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    302a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    302c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3030:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3034:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3038 <DrawCube3d+0x6c2>
    3036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3038:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    303a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 303e <DrawCube3d+0x6c8>
    303c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    303e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3040:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3044 <DrawCube3d+0x6ce>
    3042:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3044:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3048:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    304a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 304e <DrawCube3d+0x6d8>
    304c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    304e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3050:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3054 <DrawCube3d+0x6de>
    3052:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3054:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3056:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3058:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 305c <DrawCube3d+0x6e6>
    305a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    305c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    305e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3062 <DrawCube3d+0x6ec>
    3060:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3062:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3064:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3068 <DrawCube3d+0x6f2>
    3066:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3068:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    306a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 306e <DrawCube3d+0x6f8>
    306c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    306e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3072:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3074:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3078 <DrawCube3d+0x702>
    3076:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3078:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    307a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 307e <DrawCube3d+0x708>
    307c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    307e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3080:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3082:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3086 <DrawCube3d+0x710>
    3084:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3086:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    308a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    308e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3090:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3092:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3096:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3098:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    309a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    309c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    30a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    30a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    30a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 30ac <DrawCube3d+0x736>
    30a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    30ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    30b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 30b6 <DrawCube3d+0x740>
    30b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    30b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    30ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    30bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 30c2 <DrawCube3d+0x74c>
    30be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    30c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    30c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 30cc <DrawCube3d+0x756>
    30c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    30cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    30d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    30d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    30d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    30da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    30dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    30e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    30e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    30e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 2e40 <DrawCube3d+0x4ca>
    30ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 2e52 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    30f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    30f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    30f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    30f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    30fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 2e7c <DrawCube3d+0x506>
      if(maxycube < 0) {
    3100:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3102:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3104:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3106:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3352 <DrawCube3d+0x9dc>
      minycube = 0;
    310a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    310e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3112:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3116:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 311c <DrawCube3d+0x7a6>
    3118:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    311c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3120:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3122:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3128 <DrawCube3d+0x7b2>
    3124:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3128:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    312a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 60fd4 <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3130:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3132:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3134:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3138:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    313c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 2ea0 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3140:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3142:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3146:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 330e <DrawCube3d+0x998>
    314a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    314c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    314e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3150:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3154:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3156:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3158:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    315a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    315e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3160:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3164:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3166:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3168:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    316a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    316c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    316e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3174:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3178:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    317a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    317c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    317e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3180:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3182:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3186:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 2ebc <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    318a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    318e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3192:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3196:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3238 <DrawCube3d+0x8c2>
    319a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    319c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    319e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    31a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    31a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    31a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    31a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    31ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    31b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    31b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    31b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    31ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    31bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    31be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    31c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    31c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 2e70 <DrawCube3d+0x4fa>
    31c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 30f0 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    31cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    31d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    31d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    31d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 2f26 <DrawCube3d+0x5b0>
    31da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    31de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    31e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    31e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 2f3c <DrawCube3d+0x5c6>
    31e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    31ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    31f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    31f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 2f52 <DrawCube3d+0x5dc>
    31f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    31fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    31fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3200:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3204:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3208:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    320c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3210:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3214:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 2e1a <DrawCube3d+0x4a4>
    3218:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 2f80 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    321c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3220:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    3224:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3226:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 2efa <DrawCube3d+0x584>
    322a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    322e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 1a4e <DrawRect>(pc)
    3232:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3234:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 2f10 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3238:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    323c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    323e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3240:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3242:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3244:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3248:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    324a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    324e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3252:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3254:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    325a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    325c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    325e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3260:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3264:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 31c2 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3268:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    326c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    326e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3272:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3274:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3276:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    327a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    327e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd9df1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3284:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd9df1e>,d0
    328a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    328e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3284 <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3290:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    3296:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    329e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd9df74>
}
    32a4:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 2b5c <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    32a8:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    32ac:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    32ae:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    32b2:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    32b4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    32b6:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    32ba:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    32c0:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd9df1e>,d7
    32c6:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    32ca:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    32ce:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd9df1e>,d7
    32d4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    32d8:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 32ce <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    32da:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    32de:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    32e4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    32ec:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd9df74>
      clearpos += 64*BPLHEIGHT;
    32f2:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    32f6:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 2ad4 <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    32fa:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 60fcc <DoNotClearDirty>
    3300:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 337a <DrawCube3d+0xa04>
    3302:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3304:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3306:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    330a:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 29fc <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    330e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3312:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3314:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3316:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3318:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    331c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    331e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3320:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3322:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3326:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3328:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    332c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    332e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3330:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3332:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3334:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3336:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3338:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    333c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3340:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3342:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3344:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3346:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3348:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    334a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    334e:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 2ebc <DrawCube3d+0x546>
      if(maxycube < 0) {
    3352:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3354:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3358:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 310e <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    335c:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3360:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3362:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 336a <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3364:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3366:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 310e <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    336a:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    336e:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3372:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3376:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 310e <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    337a:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    337c:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    337e:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3382:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3384:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3386:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3388:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    338a:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    338c:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3390:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd9df1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3396:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd9df1e>,d0
    339c:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    33a0:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3396 <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    33a2:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    33a8:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    33b0:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd9df74>
      clearpos += 64*BPLHEIGHT;
    33b6:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    33ba:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 29fc <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    33be:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    33c2:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    33c6:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    33c8:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    33ca:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    33cc:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    33d0:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    33d4:	|  |  |  |  |  |  |                                                                                                   movea.l 610bc <PrepareBuffer>,a6
    33da:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    33de:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    33e2:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    33e4:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    33e8:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    33ee:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    33f4:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    33f8:	|  |  |  |  |  |  |                                                                                               \-- bne.s 33ee <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    33fa:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd9df60>
  custom->bltalwm = 0xffff; //Show All
    3402:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd9df62>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    340a:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd9df8c>
  custom->bltamod = 60;
    3412:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd9df80>
  custom->bltbmod = 60;
    341a:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd9df7e>
  custom->bltdmod = 60;    
    3422:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd9df82>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    342a:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x8002; //Ascending
    3432:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd9df5e>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    343a:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    343c:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    343e:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3440:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3442:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3444:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3448:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    344a:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    344c:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    344e:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3450:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3454:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3456:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3458:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    345c:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    3460:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    3464:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3466:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3468:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    346a:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    346e:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    3472:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    3476:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    3478:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    347a:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    347e:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    3480:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    3484:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 34ba <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    3486:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd9df6c>
      custom->bltbpt = bltbpos;
    348c:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd9df68>
      custom->bltdpt = bltdpos;
    3492:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd9df70>
      custom->bltsize = 2 + height * 64;
    3498:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd9df74>
      bltapos -= 2;
    349e:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    34a0:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    34a2:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    34a4:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd9df1e>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    34aa:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd9df1e>,d0
    34b0:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    34b4:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 34aa <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    34b6:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    34b8:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 3486 <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    34ba:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    34c0:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    34c2:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 34e0 <DrawCube3d+0xb6a>
    34c4:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    34c6:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    34ca:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    34ce:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    34d0:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    34d2:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    34d6:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    34d8:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    34dc:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 3486 <DrawCube3d+0xb10>
    34de:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 34ba <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    34e0:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    34e8:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd9df5e>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    34f0:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd9df8c>
  UWORD mod=64 - length*2-2;
    34f8:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    34fa:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    34fc:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    34fe:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd9df80>
  custom->bltbmod = mod;
    3504:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd9df7e>
  custom->bltdmod = mod;
    350a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd9df82>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3510:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3512:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3514:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    3518:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    351c:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    351e:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3520:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    3522:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    3524:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3526:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    3528:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    352a:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    352c:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    3532:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    3538:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    353e:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3544:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd9df1e>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    354a:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d4
    3550:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    3554:	|  |  |  |  |  |  |                                                                                               \-- bne.s 354a <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    3556:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    3558:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    355c:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    3560:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    3562:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    3568:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    356a:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    356c:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    3572:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    3578:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    357e:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3584:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    358a:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    3590:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3594:	|  |  |  |  |  |  |                                                                                               \-- bne.s 358a <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    3596:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0xe002;
    359e:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd9df5e>
  custom->bltcdat = 0x3333;
    35a6:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd9df8c>
  custom->bltamod = mod;
    35ae:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd9df80>
  custom->bltbmod = mod;
    35b4:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd9df7e>
  custom->bltdmod = mod;
    35ba:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd9df82>
    custom->bltapt = bltapos;
    35c0:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    35c6:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    35cc:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    35d2:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    35d8:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    35de:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    35e4:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    35e8:	|  |  |  |  |  |  |                                                                                               \-- bne.s 35de <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    35ea:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    35f0:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    35f6:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    35fc:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3602:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3608:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    360e:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3612:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3608 <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    3614:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0xf002;
    361c:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd9df5e>
  custom->bltcdat = 0x5555;
    3624:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd9df8c>
  custom->bltamod = mod;
    362c:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd9df80>
  custom->bltbmod = mod;
    3632:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd9df7e>
  custom->bltdmod = mod;
    3638:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd9df82>
    custom->bltapt = bltapos;
    363e:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    3644:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    364a:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    3650:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3656:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    365c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    3662:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3666:	|  |  |  |  |  |  |                                                                                               \-- bne.s 365c <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    3668:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd9df6c>
    custom->bltbpt = bltbpos;
    366e:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd9df68>
    custom->bltdpt = bltdpos;
    3674:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd9df70>
    custom->bltsize = length+1 + height * 64;
    367a:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3680:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3686:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    368c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3690:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3686 <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    3692:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd9df5c>
  custom->bltcon1 = 0x0002;
    369a:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd9df5e>
  custom->bltcdat = 0x0;
    36a2:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd9df8c>
  mod=64 -length*2;
    36aa:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    36ac:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    36ae:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    36b0:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd9df80>
  custom->bltdmod = mod;
    36b6:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd9df82>
  custom->bltafwm = bltfmask;
    36bc:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd9df60>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    36c4:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    36c8:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    36ca:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    36ce:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd9df6c>
    custom->bltdpt = bltdpos;
    36d4:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd9df70>
    custom->bltsize = length + height * 64;
    36da:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    36e0:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    36e6:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    36ec:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    36f0:	|  |  |  |  |  |  |                                                                                               \-- bne.s 36e6 <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    36f2:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    36f4:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    36f8:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    36fa:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    36fe:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd9df6c>
    custom->bltdpt = bltdpos;
    3704:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd9df70>
    custom->bltsize = length + height * 64;
    370a:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd9df74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3710:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd9df1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    3716:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd9df1e>,d0
    371c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3720:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3716 <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    3722:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd9df60>
  DrawBuffer->minytotal = minytotal;
    372a:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3730:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    3736:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    373a:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    373e:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3740:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    3744:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    3746:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    374a:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    374c:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    374e:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    3752:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3758:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd9df1e>,d6
    375e:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    3762:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3766:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd9df1e>,d6
    376c:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    3770:	|  |  |  |  |  |                                                                                                  \-- bne.s 3766 <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    3772:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    3776:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    377a:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    3780:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    3788:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd9df74>
      clearpos += 64*BPLHEIGHT;
    3790:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    3794:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 2cd0 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3798:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    379c:	|  |        |  |                                                                                                      add.l d0,d0
    379e:	|  |        |  |                                                                                                      add.l 94(sp),d0
    37a2:	|  |        |  |                                                                                                      add.l d0,d0
    37a4:	|  |        |  |                                                                                                      add.l d0,d0
    37a6:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    37aa:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd9df1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    37b0:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd9df1e>,d0
    37b6:	|  |        |  |                                                                                                  |   btst #14,d0
    37ba:	|  |        |  |                                                                                                  \-- bne.s 37b0 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    37bc:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    37c2:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    37ca:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd9df74>
      clearpos += 64*BPLHEIGHT;
    37d0:	|  |        |  |                                                                                                      lea 16384(a5),a5
    37d4:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 2bb6 <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    37d8:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    37dc:	|           |                                                                                                         add.l d0,d0
    37de:	|           |                                                                                                         add.l 94(sp),d0
    37e2:	|           |                                                                                                         add.l d0,d0
    37e4:	|           |                                                                                                         add.l d0,d0
    37e6:	|           |                                                                                                         movea.l 54(sp),a4
    37ea:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    37ee:	|           |                                                                                                         move.w dff002 <_end+0xd9df1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    37f4:	|           |                                                                                                     /-> move.w dff002 <_end+0xd9df1e>,d0
    37fa:	|           |                                                                                                     |   btst #14,d0
    37fe:	|           |                                                                                                     \-- bne.s 37f4 <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    3800:	|           |                                                                                                         move.l a5,dff054 <_end+0xd9df70>
    custom->bltadat = 0x0;
    3806:	|           |                                                                                                         move.w #0,dff074 <_end+0xd9df90>
    custom->bltsize = bltsize;    
    380e:	|           |                                                                                                         move.w d6,dff058 <_end+0xd9df74>
    squares[3].Vertices[0].X = xs0;
    3814:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    381a:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    3820:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    3824:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    3828:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    382c:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    3830:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    3836:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    383c:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    3842:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    3848:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    384c:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3850:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    3854:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    3858:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    385e:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    3864:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    386a:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3870:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    3874:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    387a:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    387e:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3882:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    3888:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    388e:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    3894:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    389a:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    389e:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    38a2:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    38a8:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    38ae:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    38b2:	|           |                                                                                                         move.l 94(sp),d5
    38b6:	|           |                                                                                                         lea 192(a3),a3
    38ba:	|           |                                                                                                         cmp.w 106(sp),d5
    38be:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 29a6 <DrawCube3d+0x30>
    38c2:	            \-------------------------------------------------------------------------------------------------------- bra.w 2e02 <DrawCube3d+0x48c>

000038c6 <warpmode>:
void warpmode(int on) { // bool
    38c6:	       subq.l #4,sp
    38c8:	       move.l a2,-(sp)
    38ca:	       move.l d2,-(sp)
	if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
    38cc:	       move.w f0ff60 <_end+0xeaee7c>,d0
    38d2:	       cmpi.w #20153,d0
    38d6:	   /-- beq.s 38e6 <warpmode+0x20>
    38d8:	   |   cmpi.w #-24562,d0
    38dc:	   +-- beq.s 38e6 <warpmode+0x20>
}
    38de:	   |   move.l (sp)+,d2
    38e0:	   |   movea.l (sp)+,a2
    38e2:	   |   addq.l #4,sp
    38e4:	   |   rts
		UaeConf(82, -1, on ? "cpu_speed max" : "cpu_speed real", 0, &outbuf, 1);
    38e6:	   \-> tst.l 16(sp)
    38ea:	/----- beq.w 398a <warpmode+0xc4>
    38ee:	|      pea 1 <_start+0x1>
    38f2:	|      moveq #15,d2
    38f4:	|      add.l sp,d2
    38f6:	|      move.l d2,-(sp)
    38f8:	|      clr.l -(sp)
    38fa:	|      pea 3684e <incbin_MercuryLetterData2Lz4_end+0xdc>
    3900:	|      pea ffffffff <_end+0xfff9ef1b>
    3904:	|      pea 52 <_start+0x52>
    3908:	|      movea.l #15794016,a2
    390e:	|      jsr (a2)
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
    3910:	|      pea 1 <_start+0x1>
    3914:	|      move.l d2,-(sp)
    3916:	|      clr.l -(sp)
    3918:	|      pea 3685c <incbin_MercuryLetterData2Lz4_end+0xea>
    391e:	|      pea ffffffff <_end+0xfff9ef1b>
    3922:	|      pea 52 <_start+0x52>
    3926:	|      jsr (a2)
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
    3928:	|      lea 48(sp),sp
    392c:	|      pea 1 <_start+0x1>
    3930:	|      move.l d2,-(sp)
    3932:	|      clr.l -(sp)
    3934:	|      pea 36872 <incbin_MercuryLetterData2Lz4_end+0x100>
    393a:	|      pea ffffffff <_end+0xfff9ef1b>
    393e:	|      pea 52 <_start+0x52>
    3942:	|      jsr (a2)
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    3944:	|      pea 1 <_start+0x1>
    3948:	|      move.l d2,-(sp)
    394a:	|      clr.l -(sp)
    394c:	|      pea 3688f <incbin_MercuryLetterData2Lz4_end+0x11d>
    3952:	|      pea ffffffff <_end+0xfff9ef1b>
    3956:	|      pea 52 <_start+0x52>
    395a:	|      jsr (a2)
    395c:	|      lea 48(sp),sp
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    3960:	|      move.l #223200,d0
    3966:	|      pea 1 <_start+0x1>
    396a:	|      move.l d2,-(sp)
    396c:	|      clr.l -(sp)
    396e:	|      move.l d0,-(sp)
    3970:	|      pea ffffffff <_end+0xfff9ef1b>
    3974:	|      pea 52 <_start+0x52>
    3978:	|      jsr f0ff60 <_end+0xeaee7c>
}
    397e:	|      lea 24(sp),sp
    3982:	|  /-> move.l (sp)+,d2
    3984:	|  |   movea.l (sp)+,a2
    3986:	|  |   addq.l #4,sp
    3988:	|  |   rts
		UaeConf(82, -1, on ? "cpu_speed max" : "cpu_speed real", 0, &outbuf, 1);
    398a:	\--|-> pea 1 <_start+0x1>
    398e:	   |   moveq #15,d2
    3990:	   |   add.l sp,d2
    3992:	   |   move.l d2,-(sp)
    3994:	   |   clr.l -(sp)
    3996:	   |   pea 367f5 <incbin_MercuryLetterData2Lz4_end+0x83>
    399c:	   |   pea ffffffff <_end+0xfff9ef1b>
    39a0:	   |   pea 52 <_start+0x52>
    39a4:	   |   movea.l #15794016,a2
    39aa:	   |   jsr (a2)
		UaeConf(82, -1, on ? "cpu_cycle_exact false" : "cpu_cycle_exact true", 0, &outbuf, 1);
    39ac:	   |   pea 1 <_start+0x1>
    39b0:	   |   move.l d2,-(sp)
    39b2:	   |   clr.l -(sp)
    39b4:	   |   pea 36804 <incbin_MercuryLetterData2Lz4_end+0x92>
    39ba:	   |   pea ffffffff <_end+0xfff9ef1b>
    39be:	   |   pea 52 <_start+0x52>
    39c2:	   |   jsr (a2)
		UaeConf(82, -1, on ? "cpu_memory_cycle_exact false" : "cpu_memory_cycle_exact true", 0, &outbuf, 1);
    39c4:	   |   lea 48(sp),sp
    39c8:	   |   pea 1 <_start+0x1>
    39cc:	   |   move.l d2,-(sp)
    39ce:	   |   clr.l -(sp)
    39d0:	   |   pea 36819 <incbin_MercuryLetterData2Lz4_end+0xa7>
    39d6:	   |   pea ffffffff <_end+0xfff9ef1b>
    39da:	   |   pea 52 <_start+0x52>
    39de:	   |   jsr (a2)
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    39e0:	   |   pea 1 <_start+0x1>
    39e4:	   |   move.l d2,-(sp)
    39e6:	   |   clr.l -(sp)
    39e8:	   |   pea 36835 <incbin_MercuryLetterData2Lz4_end+0xc3>
    39ee:	   |   pea ffffffff <_end+0xfff9ef1b>
    39f2:	   |   pea 52 <_start+0x52>
    39f6:	   |   jsr (a2)
    39f8:	   |   lea 48(sp),sp
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    39fc:	   |   move.l #223210,d0
    3a02:	   |   pea 1 <_start+0x1>
    3a06:	   |   move.l d2,-(sp)
    3a08:	   |   clr.l -(sp)
    3a0a:	   |   move.l d0,-(sp)
    3a0c:	   |   pea ffffffff <_end+0xfff9ef1b>
    3a10:	   |   pea 52 <_start+0x52>
    3a14:	   |   jsr f0ff60 <_end+0xeaee7c>
}
    3a1a:	   |   lea 24(sp),sp
    3a1e:	   \-- bra.w 3982 <warpmode+0xbc>

00003a22 <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    3a22:	       link.w a5,#-52
    3a26:	       move.l a2,-(sp)
    3a28:	       move.l d2,-(sp)
    3a2a:	       movea.l 12(a5),a1
    3a2e:	       move.l 16(a5),d1
	struct debug_resource resource = {
    3a32:	       clr.l -42(a5)
    3a36:	       clr.l -38(a5)
    3a3a:	       clr.l -34(a5)
    3a3e:	       clr.l -30(a5)
    3a42:	       clr.l -26(a5)
    3a46:	       clr.l -22(a5)
    3a4a:	       clr.l -18(a5)
    3a4e:	       clr.l -14(a5)
    3a52:	       clr.w -10(a5)
    3a56:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    3a5c:	       move.w d1,d0
    3a5e:	       ext.l d0
    3a60:	       moveq #14,d2
    3a62:	       lsl.l d2,d0
	struct debug_resource resource = {
    3a64:	       move.l d0,-46(a5)
    3a68:	       clr.w -8(a5)
    3a6c:	       move.w #512,-6(a5)
    3a72:	       move.w #256,-4(a5)
    3a78:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    3a7c:	       move.b (a1),d0
    3a7e:	       lea -42(a5),a0
    3a82:	/----- beq.s 3a94 <debug_register_bitmap.constprop.0+0x72>
    3a84:	|      lea -11(a5),a2
		*destination++ = *source++;
    3a88:	|  /-> addq.l #1,a1
    3a8a:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    3a8c:	|  |   move.b (a1),d0
    3a8e:	+--|-- beq.s 3a94 <debug_register_bitmap.constprop.0+0x72>
    3a90:	|  |   cmpa.l a0,a2
    3a92:	|  \-- bne.s 3a88 <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    3a94:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    3a96:	       move.w f0ff60 <_end+0xeaee7c>,d0
    3a9c:	       cmpi.w #20153,d0
    3aa0:	   /-- beq.s 3ab4 <debug_register_bitmap.constprop.0+0x92>
    3aa2:	   |   cmpi.w #-24562,d0
    3aa6:	   +-- beq.s 3ab4 <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    3aa8:	   |   move.l -60(a5),d2
    3aac:	   |   movea.l -56(a5),a2
    3ab0:	   |   unlk a5
    3ab2:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    3ab4:	   \-> clr.l -(sp)
    3ab6:	       clr.l -(sp)
    3ab8:	       pea -50(a5)
    3abc:	       pea 4 <_start+0x4>
    3ac0:	       pea 58 <_start+0x58>
    3ac4:	       jsr f0ff60 <_end+0xeaee7c>
}
    3aca:	       lea 20(sp),sp
}
    3ace:	       move.l -60(a5),d2
    3ad2:	       movea.l -56(a5),a2
    3ad6:	       unlk a5
    3ad8:	       rts

00003ada <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
    3ada:	    movem.l d2-d5/a2,-(sp)
    3ade:	    move.l 24(sp),d3
    3ae2:	    move.l 28(sp),d5
      *target++ = pattern;
    3ae6:	    move.l 32(sp),d4
    3aea:	    add.l d4,d4
    3aec:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
    3aee:	    moveq #0,d2
    3af0:	    lea 49a4 <memset>(pc),a2
      *target++ = pattern;
    3af4:	/-> move.l d4,-(sp)
    3af6:	|   clr.l -(sp)
    3af8:	|   move.l d3,-(sp)
    3afa:	|   jsr (a2)
    3afc:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
    3afe:	|   addq.l #1,d2
    3b00:	|   lea 12(sp),sp
    3b04:	|   cmp.l d2,d5
    3b06:	\-- bne.s 3af4 <Utils_FillLong.constprop.0+0x1a>
}
    3b08:	    movem.l (sp)+,d2-d5/a2
    3b0c:	    rts

00003b0e <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    3b0e:	                            lea -52(sp),sp
    3b12:	                            movem.l d2-d7/a2-a6,-(sp)
    3b16:	                            movea.l 100(sp),a2
    3b1a:	                            movea.l 104(sp),a5
    3b1e:	                            move.l 108(sp),d0
    3b22:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    3b26:	                            moveq #0,d2
    3b28:	                            move.w d0,d2
    3b2a:	                            move.l d2,56(sp)
    3b2e:	                            tst.w d0
    3b30:	/-------------------------- beq.s 3ba0 <DrawLetters.isra.0+0x92>
    3b32:	|                           clr.l 44(sp)
    3b36:	|                           move.l #396484,60(sp)
    3b3e:	|                           lea 3b7e8 <zMult>,a4
    3b44:	|                           cmpi.w #1,d1
    3b48:	|  /----------------------- beq.w 3d2a <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    3b4c:	|  |  /-------------------> moveq #0,d0
    3b4e:	|  |  |                     move.w (a5),d0
    3b50:	|  |  |                     moveq #0,d3
    3b52:	|  |  |                     move.w 2(a5),d3
    3b56:	|  |  |                     movea.l d3,a0
    3b58:	|  |  |                     move.l d0,d1
    3b5a:	|  |  |                     add.l d0,d1
    3b5c:	|  |  |                     add.l d1,d0
    3b5e:	|  |  |                     add.l d0,d0
    3b60:	|  |  |                     adda.l d0,a0
    3b62:	|  |  |                     move.l a0,d4
    3b64:	|  |  |                     lsl.l #5,d4
    3b66:	|  |  |                     movea.l d4,a0
    3b68:	|  |  |                     adda.l 60(sp),a0
    3b6c:	|  |  |                     move.l 16(a0),d0
    3b70:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    3b74:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    3b78:	|  |  |                     moveq #1,d2
    3b7a:	|  |  |                     cmp.l d0,d2
    3b7c:	|  |  |     /-------------- blt.w 3d82 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    3b80:	|  |  |     |               movea.w d1,a0
    3b82:	|  |  |     |               move.l a0,d0
    3b84:	|  |  |     |               add.l a0,d0
    3b86:	|  |  |     |               add.l a0,d0
    3b88:	|  |  |     |               lsl.l #3,d0
    3b8a:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    3b8c:	|  |  |     |               addq.l #3,a0
    3b8e:	|  |  |     |               adda.l a0,a0
    3b90:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3b92:	|  |  |     |               addq.l #1,44(sp)
    3b96:	|  |  |     |               move.l 56(sp),d0
    3b9a:	|  |  |     |               cmp.l 44(sp),d0
    3b9e:	|  |  +-----|-------------- bne.s 3b4c <DrawLetters.isra.0+0x3e>
}
    3ba0:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    3ba4:	|  |  |     |               lea 52(sp),sp
    3ba8:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    3baa:	|  |  |     |  /----------> tst.w d1
    3bac:	|  |  |  /--|--|----------- ble.w 3f22 <DrawLetters.isra.0+0x414>
    3bb0:	|  |  |  |  |  |            lea 6(a5),a6
    3bb4:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3bb6:	|  |  |  |  |  |            lea 20(a0),a0
    3bba:	|  |  |  |  |  |            move.l a0,52(sp)
    3bbe:	|  |  |  |  |  |            move.l a5,48(sp)
    3bc2:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    3bc4:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3bc8:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    3bcc:	|  |  |  |  |  |  |         move.l a0,d0
    3bce:	|  |  |  |  |  |  |         subq.l #1,d0
    3bd0:	|  |  |  |  |  |  |         add.l d0,d0
    3bd2:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    3bd6:	|  |  |  |  |  |  |         move.w d0,d1
    3bd8:	|  |  |  |  |  |  |         muls.w (a2),d1
    3bda:	|  |  |  |  |  |  |         moveq #15,d4
    3bdc:	|  |  |  |  |  |  |         asr.l d4,d1
    3bde:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    3be2:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    3be6:	|  |  |  |  |  |  |         asr.l d4,d0
    3be8:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3bec:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    3bf0:	|  |  |  |  |  |  |         subq.l #1,a0
    3bf2:	|  |  |  |  |  |  |         adda.l a0,a0
    3bf4:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    3bf8:	|  |  |  |  |  |  |         move.w d2,d7
    3bfa:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    3bfe:	|  |  |  |  |  |  |         asr.l d4,d7
    3c00:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3c04:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    3c08:	|  |  |  |  |  |  |         asr.l d4,d2
    3c0a:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3c0e:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    3c12:	|  |  |  |  |  |  |         subq.l #1,a0
    3c14:	|  |  |  |  |  |  |         adda.l a0,a0
    3c16:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    3c1a:	|  |  |  |  |  |  |         move.w d3,d6
    3c1c:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    3c20:	|  |  |  |  |  |  |         asr.l d4,d6
    3c22:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3c26:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    3c2a:	|  |  |  |  |  |  |         asr.l d4,d3
    3c2c:	|  |  |  |  |  |  |         movea.w d3,a1
    3c2e:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3c32:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    3c36:	|  |  |  |  |  |  |         subq.l #1,a0
    3c38:	|  |  |  |  |  |  |         adda.l a0,a0
    3c3a:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    3c3e:	|  |  |  |  |  |  |         move.w d3,d5
    3c40:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    3c44:	|  |  |  |  |  |  |         asr.l d4,d5
    3c46:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    3c4a:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    3c4e:	|  |  |  |  |  |  |         asr.l d4,d3
    3c50:	|  |  |  |  |  |  |         movea.w d3,a0
    3c52:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    3c56:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    3c5a:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    3c5e:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    3c62:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    3c66:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    3c6a:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    3c6e:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    3c72:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    3c76:	|  |  |  |  |  |  |         move.w d1,d4
    3c78:	|  |  |  |  |  |  |         cmp.w d1,d7
    3c7a:	|  |  |  |  |  |  |     /-- bge.s 3c7e <DrawLetters.isra.0+0x170>
    3c7c:	|  |  |  |  |  |  |     |   move.w d7,d4
    3c7e:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    3c80:	|  |  |  |  |  |  |     /-- bge.s 3c84 <DrawLetters.isra.0+0x176>
    3c82:	|  |  |  |  |  |  |     |   move.w d6,d4
    3c84:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    3c86:	|  |  |  |  |  |  |     /-- bge.s 3c8a <DrawLetters.isra.0+0x17c>
    3c88:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    3c8a:	|  |  |  |  |  |  |     \-> move.w d0,d3
    3c8c:	|  |  |  |  |  |  |         cmp.w d0,d2
    3c8e:	|  |  |  |  |  |  |     /-- bge.s 3c92 <DrawLetters.isra.0+0x184>
    3c90:	|  |  |  |  |  |  |     |   move.w d2,d3
    3c92:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    3c94:	|  |  |  |  |  |  |     /-- ble.s 3c98 <DrawLetters.isra.0+0x18a>
    3c96:	|  |  |  |  |  |  |     |   move.w a1,d3
    3c98:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    3c9a:	|  |  |  |  |  |  |     /-- ble.s 3c9e <DrawLetters.isra.0+0x190>
    3c9c:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    3c9e:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    3ca2:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    3ca6:	|  |  |  |  |  |  |         cmp.w d0,d2
    3ca8:	|  |  |  |  |  |  |     /-- ble.s 3cac <DrawLetters.isra.0+0x19e>
    3caa:	|  |  |  |  |  |  |     |   move.w d2,d0
    3cac:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    3cae:	|  |  |  |  |  |  |     /-- bge.s 3cb2 <DrawLetters.isra.0+0x1a4>
    3cb0:	|  |  |  |  |  |  |     |   move.w a1,d0
    3cb2:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    3cb4:	|  |  |  |  |  |  |     /-- bge.s 3cb8 <DrawLetters.isra.0+0x1aa>
    3cb6:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    3cb8:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    3cba:	|  |  |  |  |  |  |         sub.w d3,d0
    3cbc:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    3cc0:	|  |  |  |  |  |  |         cmpi.w #1,d0
    3cc4:	|  |  |  |  |  |  |  /----- ble.s 3d02 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    3cc6:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    3cc8:	|  |  |  |  |  |  |  |  /-- ble.s 3ccc <DrawLetters.isra.0+0x1be>
    3cca:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    3ccc:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    3cce:	|  |  |  |  |  |  |  |  /-- ble.s 3cd2 <DrawLetters.isra.0+0x1c4>
    3cd0:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    3cd2:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    3cd4:	|  |  |  |  |  |  |  |  /-- ble.s 3cd8 <DrawLetters.isra.0+0x1ca>
    3cd6:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    3cd8:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    3cda:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    3cde:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    3ce2:	|  |  |  |  |  |  |  +----- ble.s 3d02 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    3ce4:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    3ce8:	|  |  |  |  |  |  |  |      move.w (a0),d0
    3cea:	|  |  |  |  |  |  |  |      neg.w d0
    3cec:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    3cf0:	|  |  |  |  |  |  |  |      pea 64(sp)
    3cf4:	|  |  |  |  |  |  |  |      jsr 1a4e <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    3cf8:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    3cfc:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    3d00:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    3d02:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    3d06:	|  |  |  |  |  |  |         addq.l #1,a3
    3d08:	|  |  |  |  |  |  |         movea.w a5,a0
    3d0a:	|  |  |  |  |  |  |         cmpa.l a3,a0
    3d0c:	|  |  |  |  |  |  \-------- bgt.w 3bc4 <DrawLetters.isra.0+0xb6>
    3d10:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    3d14:	|  |  |  |  |  |            addq.l #3,a0
    3d16:	|  |  |  |  |  |            adda.l a0,a0
    3d18:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3d1a:	|  |  |  |  |  |            addq.l #1,44(sp)
    3d1e:	|  |  |  |  |  |            move.l 56(sp),d0
    3d22:	|  |  |  |  |  |            cmp.l 44(sp),d0
    3d26:	+--|--|--|--|--|----------- beq.w 3ba0 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    3d2a:	|  >--|--|--|--|----------> moveq #0,d0
    3d2c:	|  |  |  |  |  |            move.w (a5),d0
    3d2e:	|  |  |  |  |  |            moveq #0,d1
    3d30:	|  |  |  |  |  |            move.w 2(a5),d1
    3d34:	|  |  |  |  |  |            movea.l d1,a0
    3d36:	|  |  |  |  |  |            move.l d0,d1
    3d38:	|  |  |  |  |  |            add.l d0,d1
    3d3a:	|  |  |  |  |  |            add.l d1,d0
    3d3c:	|  |  |  |  |  |            add.l d0,d0
    3d3e:	|  |  |  |  |  |            adda.l d0,a0
    3d40:	|  |  |  |  |  |            move.l a0,d2
    3d42:	|  |  |  |  |  |            lsl.l #5,d2
    3d44:	|  |  |  |  |  |            movea.l d2,a0
    3d46:	|  |  |  |  |  |            adda.l 60(sp),a0
    3d4a:	|  |  |  |  |  |            move.l 16(a0),d0
    3d4e:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    3d52:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    3d56:	|  |  |  |  |  |            moveq #1,d3
    3d58:	|  |  |  |  |  |            cmp.l d0,d3
    3d5a:	|  |  |  |  |  \----------- blt.w 3baa <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    3d5e:	|  |  |  |  |               movea.w d1,a0
    3d60:	|  |  |  |  |               move.l a0,d0
    3d62:	|  |  |  |  |               add.l a0,d0
    3d64:	|  |  |  |  |               add.l a0,d0
    3d66:	|  |  |  |  |               lsl.l #3,d0
    3d68:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    3d6a:	|  |  |  |  |               addq.l #3,a0
    3d6c:	|  |  |  |  |               adda.l a0,a0
    3d6e:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3d70:	|  |  |  |  |               addq.l #1,44(sp)
    3d74:	|  |  |  |  |               move.l 56(sp),d0
    3d78:	|  |  |  |  |               cmp.l 44(sp),d0
    3d7c:	|  +--|--|--|-------------- bne.s 3d2a <DrawLetters.isra.0+0x21c>
    3d7e:	+--|--|--|--|-------------- bra.w 3ba0 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    3d82:	|  |  |  |  \-------------> tst.w d1
    3d84:	|  |  |  |     /----------- ble.w 3f06 <DrawLetters.isra.0+0x3f8>
    3d88:	|  |  |  |     |            lea 6(a5),a6
    3d8c:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3d8e:	|  |  |  |     |            lea 20(a0),a0
    3d92:	|  |  |  |     |            move.l a0,52(sp)
    3d96:	|  |  |  |     |            move.l a5,48(sp)
    3d9a:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    3d9c:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3da0:	|  |  |  |     |  |         movea.w 4(a2),a0
    3da4:	|  |  |  |     |  |         move.l a0,d0
    3da6:	|  |  |  |     |  |         subq.l #1,d0
    3da8:	|  |  |  |     |  |         add.l d0,d0
    3daa:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    3dae:	|  |  |  |     |  |         move.w d2,d7
    3db0:	|  |  |  |     |  |         muls.w (a2),d7
    3db2:	|  |  |  |     |  |         moveq #15,d3
    3db4:	|  |  |  |     |  |         asr.l d3,d7
    3db6:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    3dba:	|  |  |  |     |  |         muls.w 2(a2),d2
    3dbe:	|  |  |  |     |  |         asr.l d3,d2
    3dc0:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3dc4:	|  |  |  |     |  |         movea.w 10(a2),a0
    3dc8:	|  |  |  |     |  |         move.l a0,d0
    3dca:	|  |  |  |     |  |         subq.l #1,d0
    3dcc:	|  |  |  |     |  |         add.l d0,d0
    3dce:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    3dd2:	|  |  |  |     |  |         move.w d0,d1
    3dd4:	|  |  |  |     |  |         muls.w 6(a2),d1
    3dd8:	|  |  |  |     |  |         asr.l d3,d1
    3dda:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3dde:	|  |  |  |     |  |         muls.w 8(a2),d0
    3de2:	|  |  |  |     |  |         asr.l d3,d0
    3de4:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3de8:	|  |  |  |     |  |         movea.w 16(a2),a0
    3dec:	|  |  |  |     |  |         subq.l #1,a0
    3dee:	|  |  |  |     |  |         adda.l a0,a0
    3df0:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    3df4:	|  |  |  |     |  |         move.w d3,d6
    3df6:	|  |  |  |     |  |         muls.w 12(a2),d6
    3dfa:	|  |  |  |     |  |         moveq #15,d4
    3dfc:	|  |  |  |     |  |         asr.l d4,d6
    3dfe:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3e02:	|  |  |  |     |  |         muls.w 14(a2),d3
    3e06:	|  |  |  |     |  |         asr.l d4,d3
    3e08:	|  |  |  |     |  |         movea.w d3,a1
    3e0a:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3e0e:	|  |  |  |     |  |         movea.w 22(a2),a0
    3e12:	|  |  |  |     |  |         subq.l #1,a0
    3e14:	|  |  |  |     |  |         adda.l a0,a0
    3e16:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    3e1a:	|  |  |  |     |  |         move.w d3,d5
    3e1c:	|  |  |  |     |  |         muls.w 18(a2),d5
    3e20:	|  |  |  |     |  |         asr.l d4,d5
    3e22:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    3e26:	|  |  |  |     |  |         muls.w 20(a2),d3
    3e2a:	|  |  |  |     |  |         asr.l d4,d3
    3e2c:	|  |  |  |     |  |         movea.w d3,a0
    3e2e:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    3e32:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    3e36:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    3e3a:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    3e3e:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    3e42:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    3e46:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    3e4a:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    3e4e:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    3e52:	|  |  |  |     |  |         move.w d1,d4
    3e54:	|  |  |  |     |  |         cmp.w d1,d7
    3e56:	|  |  |  |     |  |     /-- bge.s 3e5a <DrawLetters.isra.0+0x34c>
    3e58:	|  |  |  |     |  |     |   move.w d7,d4
    3e5a:	|  |  |  |     |  |     \-> cmp.w d4,d6
    3e5c:	|  |  |  |     |  |     /-- bge.s 3e60 <DrawLetters.isra.0+0x352>
    3e5e:	|  |  |  |     |  |     |   move.w d6,d4
    3e60:	|  |  |  |     |  |     \-> cmp.w d4,d5
    3e62:	|  |  |  |     |  |     /-- bge.s 3e66 <DrawLetters.isra.0+0x358>
    3e64:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    3e66:	|  |  |  |     |  |     \-> move.w d0,d3
    3e68:	|  |  |  |     |  |         cmp.w d0,d2
    3e6a:	|  |  |  |     |  |     /-- bge.s 3e6e <DrawLetters.isra.0+0x360>
    3e6c:	|  |  |  |     |  |     |   move.w d2,d3
    3e6e:	|  |  |  |     |  |     \-> cmp.w a1,d3
    3e70:	|  |  |  |     |  |     /-- ble.s 3e74 <DrawLetters.isra.0+0x366>
    3e72:	|  |  |  |     |  |     |   move.w a1,d3
    3e74:	|  |  |  |     |  |     \-> cmp.w a0,d3
    3e76:	|  |  |  |     |  |     /-- ble.s 3e7a <DrawLetters.isra.0+0x36c>
    3e78:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    3e7a:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    3e7e:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    3e82:	|  |  |  |     |  |         cmp.w d0,d2
    3e84:	|  |  |  |     |  |     /-- ble.s 3e88 <DrawLetters.isra.0+0x37a>
    3e86:	|  |  |  |     |  |     |   move.w d2,d0
    3e88:	|  |  |  |     |  |     \-> cmp.w a1,d0
    3e8a:	|  |  |  |     |  |     /-- bge.s 3e8e <DrawLetters.isra.0+0x380>
    3e8c:	|  |  |  |     |  |     |   move.w a1,d0
    3e8e:	|  |  |  |     |  |     \-> cmp.w a0,d0
    3e90:	|  |  |  |     |  |     /-- bge.s 3e94 <DrawLetters.isra.0+0x386>
    3e92:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    3e94:	|  |  |  |     |  |     \-> addq.w #1,d0
    3e96:	|  |  |  |     |  |         sub.w d3,d0
    3e98:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    3e9c:	|  |  |  |     |  |         cmpi.w #1,d0
    3ea0:	|  |  |  |     |  |  /----- ble.s 3eda <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    3ea2:	|  |  |  |     |  |  |      cmp.w d1,d7
    3ea4:	|  |  |  |     |  |  |  /-- ble.s 3ea8 <DrawLetters.isra.0+0x39a>
    3ea6:	|  |  |  |     |  |  |  |   move.w d7,d1
    3ea8:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    3eaa:	|  |  |  |     |  |  |  /-- ble.s 3eae <DrawLetters.isra.0+0x3a0>
    3eac:	|  |  |  |     |  |  |  |   move.w d6,d1
    3eae:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    3eb0:	|  |  |  |     |  |  |  /-- ble.s 3eb4 <DrawLetters.isra.0+0x3a6>
    3eb2:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    3eb4:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    3eb6:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    3eba:	|  |  |  |     |  |  |      cmpi.w #1,d1
    3ebe:	|  |  |  |     |  |  +----- ble.s 3eda <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    3ec0:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    3ec4:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    3ec8:	|  |  |  |     |  |  |      pea 64(sp)
    3ecc:	|  |  |  |     |  |  |      jsr 1a4e <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    3ed0:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    3ed4:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    3ed8:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    3eda:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    3ede:	|  |  |  |     |  |         addq.l #1,a3
    3ee0:	|  |  |  |     |  |         movea.w a5,a0
    3ee2:	|  |  |  |     |  |         cmpa.l a0,a3
    3ee4:	|  |  |  |     |  \-------- blt.w 3d9c <DrawLetters.isra.0+0x28e>
    3ee8:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    3eec:	|  |  |  |     |            addq.l #3,a0
    3eee:	|  |  |  |     |            adda.l a0,a0
    3ef0:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3ef2:	|  |  |  |     |            addq.l #1,44(sp)
    3ef6:	|  |  |  |     |            move.l 56(sp),d0
    3efa:	|  |  |  |     |            cmp.l 44(sp),d0
    3efe:	|  |  +--|-----|----------- bne.w 3b4c <DrawLetters.isra.0+0x3e>
    3f02:	+--|--|--|-----|----------- bra.w 3ba0 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    3f06:	|  |  |  |     \----------> movea.w d1,a0
    3f08:	|  |  |  |                  addq.l #3,a0
    3f0a:	|  |  |  |                  adda.l a0,a0
    3f0c:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3f0e:	|  |  |  |                  addq.l #1,44(sp)
    3f12:	|  |  |  |                  move.l 56(sp),d0
    3f16:	|  |  |  |                  cmp.l 44(sp),d0
    3f1a:	|  |  \--|----------------- bne.w 3b4c <DrawLetters.isra.0+0x3e>
    3f1e:	+--|-----|----------------- bra.w 3ba0 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    3f22:	|  |     \----------------> movea.w d1,a0
    3f24:	|  |                        addq.l #3,a0
    3f26:	|  |                        adda.l a0,a0
    3f28:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    3f2a:	|  |                        addq.l #1,44(sp)
    3f2e:	|  |                        move.l 56(sp),d0
    3f32:	|  |                        cmp.l 44(sp),d0
    3f36:	|  \----------------------- bne.w 3d2a <DrawLetters.isra.0+0x21c>
    3f3a:	\-------------------------- bra.w 3ba0 <DrawLetters.isra.0+0x92>

00003f3e <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    3f3e:	          movem.l d2-d3/a2,-(sp)
    3f42:	          move.l 36(sp),d3
    3f46:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    3f4a:	          moveq #0,d1
    3f4c:	          move.w 60fde <vectorpos>,d1
    3f52:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    3f54:	          moveq #0,d0
    3f56:	          move.w 60fdc <VectorPosLetters>,d0
    3f5c:	          add.l d0,d0
    3f5e:	          addi.l #299352,d0
    3f64:	          move.l d0,60fd8 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    3f6a:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    3f6c:	          tst.l d2
    3f6e:	          sne d0
    3f70:	          ext.w d0
    3f72:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    3f74:	          neg.l d0
    3f76:	          move.l d0,-(sp)
    3f78:	          addi.l #350586,d1
    3f7e:	          move.l d1,-(sp)
    3f80:	          jsr 2976 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    3f84:	          clr.l -(sp)
    3f86:	          move.l d3,-(sp)
    3f88:	          move.l 40(sp),-(sp)
    3f8c:	          move.l 60fd8 <ptrvectorletters>,-(sp)
    3f92:	          lea 3b0e <DrawLetters.isra.0>(pc),a2
    3f96:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    3f98:	          lea 28(sp),sp
    3f9c:	          tst.l d2
    3f9e:	   /----- bne.w 4038 <DrawDices+0xfa>
  CubeNrReversePos++;
    3fa2:	/--|----> addq.w #1,3eac0 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    3fa8:	|  |      move.w d3,d2
    3faa:	|  |      add.w d3,d2
    3fac:	|  |      add.w d3,d2
    3fae:	|  |      lsl.w #3,d2
    3fb0:	|  |      add.w 60fde <vectorpos>,d2
    3fb6:	|  |      move.w d2,60fde <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    3fbc:	|  |      move.w 30(sp),d0
    3fc0:	|  |      add.w d0,d0
    3fc2:	|  |      add.w 30(sp),d0
    3fc6:	|  |      add.w d0,d0
    3fc8:	|  |      add.w d0,d0
    3fca:	|  |      add.w d0,60fdc <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    3fd0:	|  |      move.w 34(sp),d0
    3fd4:	|  |      add.w d0,d0
    3fd6:	|  |      add.w 34(sp),d0
    3fda:	|  |      add.w d0,d0
    3fdc:	|  |      add.w d0,d0
    3fde:	|  |      add.w d0,60fce <VectorPosLettersReversed>
  SetCl( clminendpos);
    3fe4:	|  |      move.l 44(sp),-(sp)
    3fe8:	|  |      jsr a28 <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    3fec:	|  |      andi.l #65535,d2
    3ff2:	|  |      move.l 52(sp),-(sp)
    3ff6:	|  |      move.l d3,-(sp)
    3ff8:	|  |      jsr 4a30 <__mulsi3>
    3ffe:	|  |      move.l d0,d1
    4000:	|  |      add.l d1,d1
    4002:	|  |      add.l d0,d1
    4004:	|  |      lsl.l #3,d1
    4006:	|  |      lea 12(sp),sp
    400a:	|  |      cmp.l d2,d1
    400c:	|  |  /-- bgt.s 4030 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    400e:	|  |  |   move.w #1,3eac0 <CubeNrReversePos>
    vectorpos = 0;
    4016:	|  |  |   clr.w 60fde <vectorpos>
    VectorPosLetters = 0;
    401c:	|  |  |   clr.w 60fdc <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4022:	|  |  |   clr.w 60fce <VectorPosLettersReversed>
    return 1;
    4028:	|  |  |   moveq #1,d0
}
    402a:	|  |  |   movem.l (sp)+,d2-d3/a2
    402e:	|  |  |   rts
    return 0;  
    4030:	|  |  \-> clr.w d0
}
    4032:	|  |      movem.l (sp)+,d2-d3/a2
    4036:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4038:	|  \----> moveq #0,d0
    403a:	|         move.w 3eac0 <CubeNrReversePos>,d0
    4040:	|         add.l d0,d0
    4042:	|         add.l 16(sp),d0
    4046:	|         move.l d0,60fd0 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    404c:	|         pea 1 <_start+0x1>
    4050:	|         move.l d2,-(sp)
    4052:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4056:	|         moveq #0,d0
    4058:	|         move.w 60fce <VectorPosLettersReversed>,d0
    405e:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4060:	|         addi.l #259416,d0
    4066:	|         move.l d0,-(sp)
    4068:	|         jsr (a2)
    406a:	|         lea 16(sp),sp
    406e:	\-------- bra.w 3fa2 <DrawDices+0x64>

00004072 <DrawScreen>:
{    
    4072:	                   lea -44(sp),sp
    4076:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    407a:	                   movea.l 610d6 <GfxBase>,a6
    4080:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    4084:	                   move.w #-1,dff044 <_end+0xd9df60>
  custom->bltalwm = 0xffff; //Static
    408c:	                   move.w #-1,dff046 <_end+0xd9df62>
  switch(Scene) {
    4094:	                   cmpi.w #17,5f842 <Scene>
    409c:	         /-------- bhi.s 410a <DrawScreen+0x98>
    409e:	         |         moveq #0,d0
    40a0:	         |         move.w 5f842 <Scene>,d0
    40a6:	         |         add.l d0,d0
    40a8:	         |         move.w (40b0 <DrawScreen+0x3e>,pc,d0.l),d0
    40ac:	         |         jmp (40b0 <DrawScreen+0x3e>,pc,d0.w)
    40b0:	         |         ori.w #156,(a2)+
    40b4:	         |         andi.w #742,(a6)
    40b8:	         |         btst d1,-(a4)
    40ba:	         |         bclr d1,(a0)
    40bc:	         |         movep.l d1,1078(a2)
    40c0:	         |         ([,1594)subi.w #1280,([2360746,a0],d0.w:4,1594)
    40cc:	         |         addi.w #216,6e4 <main+0x67e>
    40d2:	         |         ori.w #18552,-(a4)
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    40d6:	         |         .short 0x00c8
    40d8:	         |         pea 1 <_start+0x1>
    40dc:	         |         clr.l -(sp)
    40de:	         |         pea 3 <_start+0x3>
    40e2:	         |         clr.l -(sp)
    40e4:	         |         pea 8 <_start+0x8>
    40e8:	         |         pea 3ed00 <LetterMetaDataReversedAtw>
    40ee:	         |         pea 3ed22 <LetterMetaDataAtw>
    40f4:	         |         pea 3ed44 <CubeNrReverseAtw>
    40fa:	         |         jsr 3f3e <DrawDices>(pc)
      break;
    40fe:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    4102:	         |         cmpi.w #1,d0
    4106:	         |  /----- beq.w 42f6 <DrawScreen+0x284>
}
    410a:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    410e:	         |  |      lea 44(sp),sp
    4112:	         |  |      rts
      DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);
    4114:	         |  |      pea 84 <main+0x1e>
    4118:	         |  |      pea 6e <main+0x8>
    411c:	         |  |      clr.l -(sp)
    411e:	         |  |      pea 4 <_start+0x4>
    4122:	         |  |      clr.l -(sp)
    4124:	         |  |      pea b <_start+0xb>
    4128:	         |  |      pea 3eac2 <LetterMetaDataMercury2>
    412e:	         |  |      pea 3eac2 <LetterMetaDataMercury2>
    4134:	         |  |      pea 3ed44 <CubeNrReverseAtw>
    413a:	         |  |      jsr 3f3e <DrawDices>(pc)
    413e:	         |  |      lea 36(sp),sp
}
    4142:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    4146:	         |  |      lea 44(sp),sp
    414a:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    414c:	         |  |      pea c3 <main+0x5d>
    4150:	         |  |      pea 1 <_start+0x1>
    4154:	         |  |      pea 3 <_start+0x3>
    4158:	         |  |      pea 3 <_start+0x3>
    415c:	         |  |      pea 8 <_start+0x8>
    4160:	         |  |      pea a <_start+0xa>
    4164:	         |  |      pea 5f658 <LetterMetaDataReversedSpread>
    416a:	         |  |      pea 5f67a <LetterMetaDataSpread1>
    4170:	         |  |      pea 5f6a0 <CubeNrReverseSizeSpread>
    4176:	         |  |      jsr 3f3e <DrawDices>(pc)
      break;
    417a:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    417e:	         |  |      cmpi.w #1,d0
    4182:	         +--|----- bne.s 410a <DrawScreen+0x98>
    4184:	         |  +----- bra.w 42f6 <DrawScreen+0x284>
  ptrvector = VectorBuffer +  vectorpos;    
    4188:	         |  |      moveq #0,d0
    418a:	         |  |      move.w 60fde <vectorpos>,d0
    4190:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4192:	         |  |      moveq #0,d1
    4194:	         |  |      move.w 60fdc <VectorPosLetters>,d1
    419a:	         |  |      add.l d1,d1
    419c:	         |  |      addi.l #299352,d1
    41a2:	         |  |      move.l d1,60fd8 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    41a8:	         |  |      pea 4 <_start+0x4>
    41ac:	         |  |      clr.l -(sp)
    41ae:	         |  |      addi.l #350586,d0
    41b4:	         |  |      move.l d0,-(sp)
    41b6:	         |  |      jsr 2976 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    41ba:	         |  |      movea.l 60fd8 <ptrvectorletters>,a2
    41c0:	         |  |      lea 12(sp),sp
    41c4:	         |  |      moveq #4,d0
    41c6:	         |  |      move.l d0,44(sp)
    41ca:	         |  |      lea 3eaf0 <LetterMetaDataMercury1>,a5
    41d0:	         |  |      lea 3b7e8 <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    41d6:	/--------|--|----> moveq #0,d0
    41d8:	|        |  |      move.w (a5),d0
    41da:	|        |  |      moveq #0,d1
    41dc:	|        |  |      move.w 2(a5),d1
    41e0:	|        |  |      movea.l d1,a0
    41e2:	|        |  |      move.l d0,d1
    41e4:	|        |  |      add.l d0,d1
    41e6:	|        |  |      add.l d1,d0
    41e8:	|        |  |      add.l d0,d0
    41ea:	|        |  |      adda.l d0,a0
    41ec:	|        |  |      move.l a0,d2
    41ee:	|        |  |      lsl.l #5,d2
    41f0:	|        |  |      movea.l d2,a0
    41f2:	|        |  |      adda.l #396484,a0
    41f8:	|        |  |      move.l 16(a0),d0
    41fc:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    4200:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4204:	|        |  |      moveq #1,d3
    4206:	|        |  |      cmp.l d0,d3
    4208:	|        |  |  /-- blt.w 4800 <DrawScreen+0x78e>
      vectors += 12*metadata[2];
    420c:	|        |  |  |   movea.w d1,a0
    420e:	|        |  |  |   move.l a0,d0
    4210:	|        |  |  |   add.l a0,d0
    4212:	|        |  |  |   add.l a0,d0
    4214:	|        |  |  |   lsl.l #3,d0
    4216:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    4218:	|        |  |  |   addq.l #3,a0
    421a:	|        |  |  |   adda.l a0,a0
    421c:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    421e:	|        |  |  |   subq.l #1,44(sp)
    4222:	+--------|--|--|-- bne.s 41d6 <DrawScreen+0x164>
  CubeNrReversePos++;
    4224:	|  /-----|--|--|-> addq.w #1,3eac0 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    422a:	|  |     |  |  |   move.w 60fde <vectorpos>,d2
    4230:	|  |     |  |  |   addi.w #96,d2
    4234:	|  |     |  |  |   move.w d2,60fde <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    423a:	|  |     |  |  |   addi.w #156,60fdc <VectorPosLetters>
  SetCl( clminendpos);
    4242:	|  |     |  |  |   pea 1 <_start+0x1>
    4246:	|  |     |  |  |   jsr a28 <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    424a:	|  |     |  |  |   addq.l #4,sp
    424c:	|  |     |  |  |   cmpi.w #12767,d2
    4250:	|  |     +--|--|-- bls.w 410a <DrawScreen+0x98>
    DoNotClearDirty = 1;
    4254:	|  |     |  |  |   move.w #1,60fcc <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    425c:	|  |     |  |  |   cmpi.w #12959,d2
    4260:	|  |     +--|--|-- bls.w 410a <DrawScreen+0x98>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    4264:	|  |     |  |  |   movea.l 60fc8 <ClearBuffer>,a2
    426a:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    426e:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    4272:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    4276:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    427a:	|  |     |  |  |   movea.l 60fd4 <DrawBuffer>,a1
    4280:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    4284:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    4288:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    428c:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    4290:	|  |     |  |  |   movea.l 60fc4 <ViewBuffer>,a0
    4296:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    429a:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    429e:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    42a2:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    42a6:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    42aa:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    42ae:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    42b2:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    42b6:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    42ba:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    42be:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    42c2:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    42c6:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    42ca:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    42ce:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    42d2:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    42d6:	|  |     |  |  |   clr.w 60fcc <DoNotClearDirty>
    CubeNrReversePos = 1;
    42dc:	|  |     |  |  |   move.w #1,3eac0 <CubeNrReversePos>
    vectorpos = 0;
    42e4:	|  |     |  |  |   clr.w 60fde <vectorpos>
    VectorPosLetters = 0;
    42ea:	|  |     |  |  |   clr.w 60fdc <VectorPosLetters>
    VectorPosLettersReversed = 0;
    42f0:	|  |     |  |  |   clr.w 60fce <VectorPosLettersReversed>
  if(result == 1) Scene++;
    42f6:	|  |     |  >--|-> addq.w #1,5f842 <Scene>
}
    42fc:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4300:	|  |     |  |  |   lea 44(sp),sp
    4304:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    4306:	|  |     |  |  |   pea 2bd8 <DrawCube3d+0x262>
    430a:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4310:	|  |     |  |  |   pea 197a2 <incbin_PointCubeDataLz4_start>
    4316:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    431a:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    431c:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    4322:	|  |     |  |  |   pea 5597a <VectorBuffer>
    4328:	|  |     |  |  |   move.l d2,-(sp)
    432a:	|  |     |  |  |   pea 1970e <incbin_PointCubeData_start>
    4330:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    4334:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    4336:	|  |     |  |  |   pea 251e <DrawRect+0xad0>
    433a:	|  |     |  |  |   move.l d2,-(sp)
    433c:	|  |     |  |  |   pea 1c422 <incbin_PointLetterDataLz4_start>
    4342:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    4344:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    434a:	|  |     |  |  |   lea 32(sp),sp
    434e:	|  |     |  |  |   move.l #299352,(sp)
    4354:	|  |     |  |  |   move.l d2,-(sp)
    4356:	|  |     |  |  |   pea 1c38e <incbin_PointLetterData_start>
    435c:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    435e:	|  |     |  |  |   pea 20d8 <DrawRect+0x68a>
    4362:	|  |     |  |  |   move.l d2,-(sp)
    4364:	|  |     |  |  |   pea 1e9d0 <incbin_PointReversedLetterDataLz4_start>
    436a:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    436c:	|  |     |  |  |   pea 3f558 <LetterBuffer2>
    4372:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4378:	|  |     |  |  |   pea 1e954 <incbin_PointReversedLetterData_start>
    437e:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    4380:	|  |     |  |  |   move.w #3,5f842 <Scene>
    4388:	|  |     |  |  |   lea 36(sp),sp
}
    438c:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4390:	|  |     |  |  |   lea 44(sp),sp
    4394:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    4396:	|  |     |  |  |   pea d4 <main+0x6e>
    439a:	|  |     |  |  |   pea 1 <_start+0x1>
    439e:	|  |     |  |  |   pea 2 <_start+0x2>
    43a2:	|  |     |  |  |   pea 3 <_start+0x3>
    43a6:	|  |     |  |  |   pea 5 <_start+0x5>
    43aa:	|  |     |  |  |   pea 6 <_start+0x6>
    43ae:	|  |     |  |  |   pea 3f322 <LetterMetaDataReversedPoint>
    43b4:	|  |     |  |  |   pea 3f338 <LetterMetaDataPoint>
    43ba:	|  |     |  |  |   pea 3f356 <CubeNrReverseSizePoint>
    43c0:	|  |     |  |  |   jsr 3f3e <DrawDices>(pc)
      break;
    43c4:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    43c8:	|  |     |  |  |   cmpi.w #1,d0
    43cc:	|  |     +--|--|-- bne.w 410a <DrawScreen+0x98>
    43d0:	|  |     |  +--|-- bra.w 42f6 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    43d4:	|  |     |  |  |   pea 24cd <DrawRect+0xa7f>
    43d8:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    43de:	|  |     |  |  |   pea 146c4 <incbin_TekCubeDataLz4_start>
    43e4:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    43e8:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    43ea:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    43f0:	|  |     |  |  |   pea 5597a <VectorBuffer>
    43f6:	|  |     |  |  |   move.l d2,-(sp)
    43f8:	|  |     |  |  |   pea 14630 <incbin_TekCubeData_start>
    43fe:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    4402:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    4404:	|  |     |  |  |   pea 2a8f <DrawCube3d+0x119>
    4408:	|  |     |  |  |   move.l d2,-(sp)
    440a:	|  |     |  |  |   pea 16c6a <incbin_TekLetterDataLz4_start>
    4410:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    4412:	|  |     |  |  |   lea 32(sp),sp
    4416:	|  |     |  |  |   move.l #299352,(sp)
    441c:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4422:	|  |     |  |  |   pea 16ba6 <incbin_TekLetterData_start>
    4428:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    442a:	|  |     |  |  |   move.w #5,5f842 <Scene>
    4432:	|  |     |  |  |   lea 12(sp),sp
}
    4436:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    443a:	|  |     |  |  |   lea 44(sp),sp
    443e:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    4440:	|  |     |  |  |   pea 98 <main+0x32>
    4444:	|  |     |  |  |   pea 1 <_start+0x1>
    4448:	|  |     |  |  |   clr.l -(sp)
    444a:	|  |     |  |  |   pea 3 <_start+0x3>
    444e:	|  |     |  |  |   clr.l -(sp)
    4450:	|  |     |  |  |   pea 8 <_start+0x8>
    4454:	|  |     |  |  |   pea 3f0f8 <LetterMetaDataTek>
    445a:	|  |     |  |  |   pea 3f0f8 <LetterMetaDataTek>
    4460:	|  |     |  |  |   pea 3f11a <CubeNrReverseSizeTek>
    4466:	|  |     |  |  |   jsr 3f3e <DrawDices>(pc)
      break;
    446a:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    446e:	|  |     |  |  |   cmpi.w #1,d0
    4472:	|  |     +--|--|-- bne.w 410a <DrawScreen+0x98>
    4476:	|  |     |  +--|-- bra.w 42f6 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    447a:	|  |     |  |  |   pea 2be6 <DrawCube3d+0x270>
    447e:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4484:	|  |     |  |  |   pea 20b80 <incbin_FlexCubeDataLz4_start>
    448a:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    448e:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    4490:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    4496:	|  |     |  |  |   pea 5597a <VectorBuffer>
    449c:	|  |     |  |  |   move.l d2,-(sp)
    449e:	|  |     |  |  |   pea 20abc <incbin_FlexCubeData_start>
    44a4:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    44a8:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    44aa:	|  |     |  |  |   pea 30a1 <DrawCube3d+0x72b>
    44ae:	|  |     |  |  |   move.l d2,-(sp)
    44b0:	|  |     |  |  |   pea 2386e <incbin_FlexLetterDataLz4_start>
    44b6:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    44b8:	|  |     |  |  |   lea 32(sp),sp
    44bc:	|  |     |  |  |   move.l #299352,(sp)
    44c2:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    44c8:	|  |     |  |  |   pea 2377a <incbin_FlexLetterData_start>
    44ce:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    44d0:	|  |     |  |  |   move.w #7,5f842 <Scene>
    44d8:	|  |     |  |  |   lea 12(sp),sp
}
    44dc:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    44e0:	|  |     |  |  |   lea 44(sp),sp
    44e4:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    44e6:	|  |     |  |  |   pea af <main+0x49>
    44ea:	|  |     |  |  |   pea 1 <_start+0x1>
    44ee:	|  |     |  |  |   clr.l -(sp)
    44f0:	|  |     |  |  |   pea 4 <_start+0x4>
    44f4:	|  |     |  |  |   clr.l -(sp)
    44f6:	|  |     |  |  |   pea a <_start+0xa>
    44fa:	|  |     |  |  |   pea 3f0cc <LetterMetaDataFlex>
    4500:	|  |     |  |  |   pea 3f0cc <LetterMetaDataFlex>
    4506:	|  |     |  |  |   pea 5f6a0 <CubeNrReverseSizeSpread>
    450c:	|  |     |  |  |   jsr 3f3e <DrawDices>(pc)
      break;
    4510:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    4514:	|  |     |  |  |   cmpi.w #1,d0
    4518:	|  |     +--|--|-- bne.w 410a <DrawScreen+0x98>
    451c:	|  |     |  +--|-- bra.w 42f6 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    4520:	|  |     |  |  |   pea 23ad <DrawRect+0x95f>
    4524:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    452a:	|  |     |  |  |   pea 269b8 <incbin_DesireCubeDataLz4_start>
    4530:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    4534:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    4536:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    453c:	|  |     |  |  |   pea 5597a <VectorBuffer>
    4542:	|  |     |  |  |   move.l d2,-(sp)
    4544:	|  |     |  |  |   pea 26924 <incbin_DesireCubeData_start>
    454a:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    454e:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    4550:	|  |     |  |  |   pea 286a <DrawRect+0xe1c>
    4554:	|  |     |  |  |   move.l d2,-(sp)
    4556:	|  |     |  |  |   pea 28e3e <incbin_DesireLetterDataLz4_start>
    455c:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    455e:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    4564:	|  |     |  |  |   lea 32(sp),sp
    4568:	|  |     |  |  |   move.l #299352,(sp)
    456e:	|  |     |  |  |   move.l d2,-(sp)
    4570:	|  |     |  |  |   pea 28d7a <incbin_DesireLetterData_start>
    4576:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    4578:	|  |     |  |  |   pea 27ff <DrawRect+0xdb1>
    457c:	|  |     |  |  |   move.l d2,-(sp)
    457e:	|  |     |  |  |   pea 2b780 <incbin_DesireReversedLetterDataLz4_start>
    4584:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    4586:	|  |     |  |  |   pea 3f558 <LetterBuffer2>
    458c:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4592:	|  |     |  |  |   pea 2b6bc <incbin_DesireReversedLetterData_start>
    4598:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    459a:	|  |     |  |  |   move.w #9,5f842 <Scene>
    45a2:	|  |     |  |  |   lea 36(sp),sp
}
    45a6:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    45aa:	|  |     |  |  |   lea 44(sp),sp
    45ae:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    45b0:	|  |     |  |  |   pea af <main+0x49>
    45b4:	|  |     |  |  |   pea 1 <_start+0x1>
    45b8:	|  |     |  |  |   pea 3 <_start+0x3>
    45bc:	|  |     |  |  |   pea 3 <_start+0x3>
    45c0:	|  |     |  |  |   pea 8 <_start+0x8>
    45c4:	|  |     |  |  |   pea 8 <_start+0x8>
    45c8:	|  |     |  |  |   pea 3eee6 <LetterMetaDataReversedDesire>
    45ce:	|  |     |  |  |   pea 3ef08 <LetterMetaDataDesire>
    45d4:	|  |     |  |  |   pea 3ef2a <CubeNrReverseSizeDesire>
    45da:	|  |     |  |  |   jsr 3f3e <DrawDices>(pc)
      break;
    45de:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    45e2:	|  |     |  |  |   cmpi.w #1,d0
    45e6:	|  |     +--|--|-- bne.w 410a <DrawScreen+0x98>
    45ea:	|  |     |  +--|-- bra.w 42f6 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    45ee:	|  |     |  |  |   pea 24f2 <DrawRect+0xaa4>
    45f2:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    45f8:	|  |     |  |  |   pea f3f6 <incbin_AtwCubeDataLz4_start>
    45fe:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    4602:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    4604:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    460a:	|  |     |  |  |   pea 5597a <VectorBuffer>
    4610:	|  |     |  |  |   move.l d2,-(sp)
    4612:	|  |     |  |  |   pea f362 <incbin_AtwCubeData_start>
    4618:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    461c:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    461e:	|  |     |  |  |   pea 2c5b <DrawCube3d+0x2e5>
    4622:	|  |     |  |  |   move.l d2,-(sp)
    4624:	|  |     |  |  |   pea 119c0 <incbin_AtwLetterDataLz4_start>
    462a:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    462c:	|  |     |  |  |   lea 32(sp),sp
    4630:	|  |     |  |  |   move.l #299352,(sp)
    4636:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    463c:	|  |     |  |  |   pea 118fc <incbin_AtwLetterData_start>
    4642:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    4644:	|  |     |  |  |   move.w #11,5f842 <Scene>
    464c:	|  |     |  |  |   lea 12(sp),sp
}
    4650:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    4654:	|  |     |  |  |   lea 44(sp),sp
    4658:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    465a:	|  |     |  |  |   pea 28fa <DrawRect+0xeac>
    465e:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    4664:	|  |     |  |  |   pea 751e <incbin_AbyssCubeDataLz4_start>
    466a:	|  |     |  |  |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    466e:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    4670:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    4676:	|  |     |  |  |   pea 5597a <VectorBuffer>
    467c:	|  |     |  |  |   move.l d2,-(sp)
    467e:	|  |     |  |  |   pea 748a <incbin_AbyssCubeData_start>
    4684:	|  |     |  |  |   lea 14ac <LoadVectors>(pc),a2
    4688:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    468a:	|  |     |  |  |   pea 30ff <DrawCube3d+0x789>
    468e:	|  |     |  |  |   move.l d2,-(sp)
    4690:	|  |     |  |  |   pea 9f08 <incbin_AbyssLetterDataLz4_start>
    4696:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    4698:	|  |     |  |  |   move.l 610c4 <WorkingMem>,d2
    469e:	|  |     |  |  |   lea 32(sp),sp
    46a2:	|  |     |  |  |   move.l #299352,(sp)
    46a8:	|  |     |  |  |   move.l d2,-(sp)
    46aa:	|  |     |  |  |   pea 9e2c <incbin_AbyssLetterData_start>
    46b0:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    46b2:	|  |     |  |  |   pea 229d <DrawRect+0x84f>
    46b6:	|  |     |  |  |   move.l d2,-(sp)
    46b8:	|  |     |  |  |   pea d0b0 <incbin_AbyssReversedLetterDataLz4_start>
    46be:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    46c0:	|  |     |  |  |   pea 3f558 <LetterBuffer2>
    46c6:	|  |     |  |  |   move.l 610c4 <WorkingMem>,-(sp)
    46cc:	|  |     |  |  |   pea d01c <incbin_AbyssReversedLetterData_start>
    46d2:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    46d4:	|  |     |  |  |   move.w #13,5f842 <Scene>
    46dc:	|  |     |  |  |   lea 36(sp),sp
}
    46e0:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    46e4:	|  |     |  |  |   lea 44(sp),sp
    46e8:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    46ea:	|  |     |  |  |   pea d0 <main+0x6a>
    46ee:	|  |     |  |  |   pea 1 <_start+0x1>
    46f2:	|  |     |  |  |   pea 2 <_start+0x2>
    46f6:	|  |     |  |  |   pea 3 <_start+0x3>
    46fa:	|  |     |  |  |   pea 6 <_start+0x6>
    46fe:	|  |     |  |  |   pea 9 <_start+0x9>
    4702:	|  |     |  |  |   pea 3eb22 <LetterMetaDataReversedAbyss>
    4708:	|  |     |  |  |   pea 3eb3a <LetterMetaDataAbyss>
    470e:	|  |     |  |  |   pea 3eb5e <CubeNrReverseSizeAbyss>
    4714:	|  |     |  |  |   jsr 3f3e <DrawDices>(pc)
      break;  
    4718:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    471c:	|  |     |  |  |   cmpi.w #1,d0
    4720:	|  |     \--|--|-- bne.w 410a <DrawScreen+0x98>
    4724:	|  |        \--|-- bra.w 42f6 <DrawScreen+0x284>
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    4728:	|  |           |   pea 2003 <DrawRect+0x5b5>
    472c:	|  |           |   move.l 610c4 <WorkingMem>,-(sp)
    4732:	|  |           |   pea 2e058 <incbin_MercuryCubeData1Lz4_start>
    4738:	|  |           |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    473c:	|  |           |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    473e:	|  |           |   move.l 610c4 <WorkingMem>,d2
    4744:	|  |           |   pea 5597a <VectorBuffer>
    474a:	|  |           |   move.l d2,-(sp)
    474c:	|  |           |   pea 2df94 <incbin_MercuryCubeData1_start>
    4752:	|  |           |   lea 14ac <LoadVectors>(pc),a2
    4756:	|  |           |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    4758:	|  |           |   pea 2b27 <DrawCube3d+0x1b1>
    475c:	|  |           |   move.l d2,-(sp)
    475e:	|  |           |   pea 301ac <incbin_MercuryLetterData1Lz4_start>
    4764:	|  |           |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    4766:	|  |           |   lea 32(sp),sp
    476a:	|  |           |   move.l #299352,(sp)
    4770:	|  |           |   move.l 610c4 <WorkingMem>,-(sp)
    4776:	|  |           |   pea 30070 <incbin_MercuryLetterData1_start>
    477c:	|  |           |   jsr (a2)
      Scene = 15;
    477e:	|  |           |   move.w #15,5f842 <Scene>
    4786:	|  |           |   lea 12(sp),sp
}
    478a:	|  |           |   movem.l (sp)+,d2-d7/a2-a6
    478e:	|  |           |   lea 44(sp),sp
    4792:	|  |           |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    4794:	|  |           |   pea 1928 <Clbuild+0x348>
    4798:	|  |           |   move.l 610c4 <WorkingMem>,-(sp)
    479e:	|  |           |   pea 32dac <incbin_MercuryCubeData2Lz4_start>
    47a4:	|  |           |   lea 990 <Utils_Lz4DepackAsm>(pc),a3
    47a8:	|  |           |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    47aa:	|  |           |   move.l 610c4 <WorkingMem>,d2
    47b0:	|  |           |   pea 5597a <VectorBuffer>
    47b6:	|  |           |   move.l d2,-(sp)
    47b8:	|  |           |   pea 32ce8 <incbin_MercuryCubeData2_start>
    47be:	|  |           |   lea 14ac <LoadVectors>(pc),a2
    47c2:	|  |           |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    47c4:	|  |           |   pea 1f6b <DrawRect+0x51d>
    47c8:	|  |           |   move.l d2,-(sp)
    47ca:	|  |           |   pea 347f4 <incbin_MercuryLetterData2Lz4_start>
    47d0:	|  |           |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    47d2:	|  |           |   lea 32(sp),sp
    47d6:	|  |           |   move.l #299352,(sp)
    47dc:	|  |           |   move.l 610c4 <WorkingMem>,-(sp)
    47e2:	|  |           |   pea 346e8 <incbin_MercuryLetterData2_start>
    47e8:	|  |           |   jsr (a2)
      Scene = 17;
    47ea:	|  |           |   move.w #17,5f842 <Scene>
    47f2:	|  |           |   lea 12(sp),sp
}
    47f6:	|  |           |   movem.l (sp)+,d2-d7/a2-a6
    47fa:	|  |           |   lea 44(sp),sp
    47fe:	|  |           |   rts
      for(int i=0;i<metadata[2];i++)
    4800:	|  |           \-> tst.w d1
    4802:	|  |  /----------- ble.w 4978 <DrawScreen+0x906>
    4806:	|  |  |            lea 6(a5),a6
    480a:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    480c:	|  |  |            lea 20(a0),a0
    4810:	|  |  |            move.l a0,52(sp)
    4814:	|  |  |            move.l a5,48(sp)
    4818:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    481a:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    481e:	|  |  |  |         movea.w 4(a2),a0
    4822:	|  |  |  |         move.l a0,d0
    4824:	|  |  |  |         subq.l #1,d0
    4826:	|  |  |  |         add.l d0,d0
    4828:	|  |  |  |         move.w (0,a4,d0.l),d0
    482c:	|  |  |  |         move.w d0,d1
    482e:	|  |  |  |         muls.w (a2),d1
    4830:	|  |  |  |         moveq #15,d4
    4832:	|  |  |  |         asr.l d4,d1
    4834:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    4838:	|  |  |  |         muls.w 2(a2),d0
    483c:	|  |  |  |         asr.l d4,d0
    483e:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4842:	|  |  |  |         movea.w 10(a2),a0
    4846:	|  |  |  |         subq.l #1,a0
    4848:	|  |  |  |         adda.l a0,a0
    484a:	|  |  |  |         move.w (0,a4,a0.l),d2
    484e:	|  |  |  |         move.w d2,d7
    4850:	|  |  |  |         muls.w 6(a2),d7
    4854:	|  |  |  |         asr.l d4,d7
    4856:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    485a:	|  |  |  |         muls.w 8(a2),d2
    485e:	|  |  |  |         asr.l d4,d2
    4860:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    4864:	|  |  |  |         movea.w 16(a2),a0
    4868:	|  |  |  |         subq.l #1,a0
    486a:	|  |  |  |         adda.l a0,a0
    486c:	|  |  |  |         move.w (0,a4,a0.l),d3
    4870:	|  |  |  |         move.w d3,d6
    4872:	|  |  |  |         muls.w 12(a2),d6
    4876:	|  |  |  |         asr.l d4,d6
    4878:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    487c:	|  |  |  |         muls.w 14(a2),d3
    4880:	|  |  |  |         asr.l d4,d3
    4882:	|  |  |  |         movea.w d3,a1
    4884:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4888:	|  |  |  |         movea.w 22(a2),a0
    488c:	|  |  |  |         subq.l #1,a0
    488e:	|  |  |  |         adda.l a0,a0
    4890:	|  |  |  |         move.w (0,a4,a0.l),d3
    4894:	|  |  |  |         move.w d3,d5
    4896:	|  |  |  |         muls.w 18(a2),d5
    489a:	|  |  |  |         asr.l d4,d5
    489c:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    48a0:	|  |  |  |         muls.w 20(a2),d3
    48a4:	|  |  |  |         asr.l d4,d3
    48a6:	|  |  |  |         movea.w d3,a0
    48a8:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    48ac:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    48b0:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    48b4:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    48b8:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    48bc:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    48c0:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    48c4:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    48c8:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    48cc:	|  |  |  |         move.w d1,d4
    48ce:	|  |  |  |         cmp.w d1,d7
    48d0:	|  |  |  |     /-- bge.s 48d4 <DrawScreen+0x862>
    48d2:	|  |  |  |     |   move.w d7,d4
    48d4:	|  |  |  |     \-> cmp.w d4,d6
    48d6:	|  |  |  |     /-- bge.s 48da <DrawScreen+0x868>
    48d8:	|  |  |  |     |   move.w d6,d4
    48da:	|  |  |  |     \-> cmp.w d4,d5
    48dc:	|  |  |  |     /-- bge.s 48e0 <DrawScreen+0x86e>
    48de:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    48e0:	|  |  |  |     \-> move.w d0,d3
    48e2:	|  |  |  |         cmp.w d0,d2
    48e4:	|  |  |  |     /-- bge.s 48e8 <DrawScreen+0x876>
    48e6:	|  |  |  |     |   move.w d2,d3
    48e8:	|  |  |  |     \-> cmp.w a1,d3
    48ea:	|  |  |  |     /-- ble.s 48ee <DrawScreen+0x87c>
    48ec:	|  |  |  |     |   move.w a1,d3
    48ee:	|  |  |  |     \-> cmp.w a0,d3
    48f0:	|  |  |  |     /-- ble.s 48f4 <DrawScreen+0x882>
    48f2:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    48f4:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    48f8:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    48fc:	|  |  |  |         cmp.w d0,d2
    48fe:	|  |  |  |     /-- ble.s 4902 <DrawScreen+0x890>
    4900:	|  |  |  |     |   move.w d2,d0
    4902:	|  |  |  |     \-> cmp.w a1,d0
    4904:	|  |  |  |     /-- bge.s 4908 <DrawScreen+0x896>
    4906:	|  |  |  |     |   move.w a1,d0
    4908:	|  |  |  |     \-> cmp.w a0,d0
    490a:	|  |  |  |     /-- bge.s 490e <DrawScreen+0x89c>
    490c:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    490e:	|  |  |  |     \-> addq.w #1,d0
    4910:	|  |  |  |         sub.w d3,d0
    4912:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    4916:	|  |  |  |         cmpi.w #1,d0
    491a:	|  |  |  |  /----- ble.s 4954 <DrawScreen+0x8e2>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    491c:	|  |  |  |  |      cmp.w d1,d7
    491e:	|  |  |  |  |  /-- ble.s 4922 <DrawScreen+0x8b0>
    4920:	|  |  |  |  |  |   move.w d7,d1
    4922:	|  |  |  |  |  \-> cmp.w d1,d6
    4924:	|  |  |  |  |  /-- ble.s 4928 <DrawScreen+0x8b6>
    4926:	|  |  |  |  |  |   move.w d6,d1
    4928:	|  |  |  |  |  \-> cmp.w d1,d5
    492a:	|  |  |  |  |  /-- ble.s 492e <DrawScreen+0x8bc>
    492c:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    492e:	|  |  |  |  |  \-> sub.w d4,d1
    4930:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    4934:	|  |  |  |  |      cmpi.w #1,d1
    4938:	|  |  |  |  +----- ble.s 4954 <DrawScreen+0x8e2>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    493a:	|  |  |  |  |      movea.l 52(sp),a0
    493e:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    4942:	|  |  |  |  |      pea 56(sp)
    4946:	|  |  |  |  |      jsr 1a4e <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    494a:	|  |  |  |  |      movea.l 52(sp),a0
    494e:	|  |  |  |  |      movea.w 4(a0),a5
    4952:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    4954:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    4958:	|  |  |  |         addq.l #1,a3
    495a:	|  |  |  |         movea.w a5,a0
    495c:	|  |  |  |         cmpa.l a3,a0
    495e:	|  |  |  \-------- bgt.w 481a <DrawScreen+0x7a8>
    4962:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    4966:	|  |  |            addq.l #3,a0
    4968:	|  |  |            adda.l a0,a0
    496a:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    496c:	|  |  |            subq.l #1,44(sp)
    4970:	+--|--|----------- bne.w 41d6 <DrawScreen+0x164>
    4974:	|  +--|----------- bra.w 4224 <DrawScreen+0x1b2>
    metadata += 3 + metadata[2];    
    4978:	|  |  \----------> movea.w d1,a0
    497a:	|  |               addq.l #3,a0
    497c:	|  |               adda.l a0,a0
    497e:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4980:	|  |               subq.l #1,44(sp)
    4984:	\--|-------------- bne.w 41d6 <DrawScreen+0x164>
    4988:	   \-------------- bra.w 4224 <DrawScreen+0x1b2>

0000498c <strlen>:
	while(*s++)
    498c:	   /-> movea.l 4(sp),a0
    4990:	   |   tst.b (a0)+
    4992:	/--|-- beq.s 49a0 <strlen+0x14>
    4994:	|  |   move.l a0,-(sp)
    4996:	|  \-- jsr 498c <strlen>(pc)
    499a:	|      addq.l #4,sp
    499c:	|      addq.l #1,d0
}
    499e:	|      rts
	unsigned long t=0;
    49a0:	\----> moveq #0,d0
}
    49a2:	       rts

000049a4 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    49a4:	       move.l d2,-(sp)
    49a6:	       move.l 8(sp),d0
	while(len-- > 0)
    49aa:	       tst.l 16(sp)
    49ae:	/----- beq.s 49c2 <memset+0x1e>
		*ptr++ = val;
    49b0:	|      move.b 15(sp),d2
    49b4:	|      move.l 16(sp),d1
    49b8:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    49ba:	|      movea.l d0,a0
		*ptr++ = val;
    49bc:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    49be:	|  |   cmpa.l d1,a0
    49c0:	|  \-- bne.s 49bc <memset+0x18>
}
    49c2:	\----> move.l (sp)+,d2
    49c4:	       rts

000049c6 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    49c6:	       move.l 4(sp),d0
    49ca:	       movea.l 8(sp),a0
	while(len--)
    49ce:	       tst.l 12(sp)
    49d2:	/----- beq.s 49e2 <memcpy+0x1c>
    49d4:	|      movea.l d0,a1
    49d6:	|      move.l 12(sp),d1
    49da:	|      add.l a0,d1
		*d++ = *s++;
    49dc:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    49de:	|  |   cmp.l a0,d1
    49e0:	|  \-- bne.s 49dc <memcpy+0x16>
}
    49e2:	\----> rts

000049e4 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    49e4:	          move.l d2,-(sp)
    49e6:	          move.l 8(sp),d0
    49ea:	          movea.l 12(sp),a0
    49ee:	          move.l 16(sp),d2
	if (d < s) {
    49f2:	          cmpa.l d0,a0
    49f4:	   /----- bls.s 4a0a <memmove+0x26>
		while (len--)
    49f6:	   |      tst.l d2
    49f8:	/--|----- beq.s 4a06 <memmove+0x22>
    49fa:	|  |      movea.l d0,a1
    49fc:	|  |      move.l a0,d1
    49fe:	|  |      add.l d2,d1
			*d++ = *s++;
    4a00:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    4a02:	|  |  |   cmp.l a0,d1
    4a04:	|  |  \-- bne.s 4a00 <memmove+0x1c>
}
    4a06:	>--|----> move.l (sp)+,d2
    4a08:	|  |      rts
		while (len--)
    4a0a:	|  \----> movea.l d2,a1
    4a0c:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    4a0e:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    4a10:	|         adda.l d0,a1
		while (len--)
    4a12:	|         tst.l d2
    4a14:	+-------- beq.s 4a06 <memmove+0x22>
    4a16:	|         move.l a0,d1
    4a18:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    4a1a:	|     /-> move.b (a0),(a1)
		while (len--)
    4a1c:	|     |   subq.l #1,a0
    4a1e:	|     |   subq.l #1,a1
    4a20:	|     |   cmpa.l d1,a0
    4a22:	+-----|-- beq.s 4a06 <memmove+0x22>
			*lastd-- = *lasts--;
    4a24:	|     |   move.b (a0),(a1)
		while (len--)
    4a26:	|     |   subq.l #1,a0
    4a28:	|     |   subq.l #1,a1
    4a2a:	|     |   cmpa.l d1,a0
    4a2c:	|     \-- bne.s 4a1a <memmove+0x36>
    4a2e:	\-------- bra.s 4a06 <memmove+0x22>

00004a30 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    4a30:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4a34:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4a38:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4a3c:	mulu.w 8(sp),d1
	addw	d1, d0
    4a40:	add.w d1,d0
	swap	d0
    4a42:	swap d0
	clrw	d0
    4a44:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4a46:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    4a4a:	mulu.w 10(sp),d1
	addl	d1, d0
    4a4e:	add.l d1,d0
	rts
    4a50:	rts

00004a52 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    4a52:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    4a54:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    4a58:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    4a5c:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4a62:	   /-- bcc.s 4a7a <__udivsi3+0x28>
	movel	d0, d2
    4a64:	   |   move.l d0,d2
	clrw	d2
    4a66:	   |   clr.w d2
	swap	d2
    4a68:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    4a6a:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4a6c:	   |   move.w d2,d0
	swap	d0
    4a6e:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4a70:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4a74:	   |   divu.w d1,d2
	movew	d2, d0
    4a76:	   |   move.w d2,d0
	jra	6f
    4a78:	/--|-- bra.s 4aaa <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4a7a:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    4a7c:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    4a7e:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    4a80:	|  |   cmpi.l #65536,d1
	jcc	4b
    4a86:	|  \-- bcc.s 4a7c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4a88:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    4a8a:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4a90:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4a92:	|      mulu.w d0,d1
	swap	d2
    4a94:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    4a96:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4a98:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    4a9a:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4a9c:	|  /-- bne.s 4aa8 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4a9e:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4aa0:	|  +-- bcs.s 4aa8 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4aa2:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4aa6:	+--|-- bls.s 4aaa <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    4aa8:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    4aaa:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    4aac:	       rts

00004aae <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    4aae:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    4ab0:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4ab2:	    move.l 12(sp),d1
	jpl	1f
    4ab6:	/-- bpl.s 4abc <__divsi3+0xe>
	negl	d1
    4ab8:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4aba:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4abc:	\-> move.l 8(sp),d0
	jpl	2f
    4ac0:	/-- bpl.s 4ac6 <__divsi3+0x18>
	negl	d0
    4ac2:	|   neg.l d0
	negb	d2
    4ac4:	|   neg.b d2

2:	movel	d1, sp@-
    4ac6:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    4ac8:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    4aca:	    bsr.s 4a52 <__udivsi3>
	addql	#8, sp
    4acc:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    4ace:	    tst.b d2
	jpl	3f
    4ad0:	/-- bpl.s 4ad4 <__divsi3+0x26>
	negl	d0
    4ad2:	|   neg.l d0

3:	movel	sp@+, d2
    4ad4:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    4ad6:	    rts

00004ad8 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    4ad8:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4adc:	move.l 4(sp),d0
	movel	d1, sp@-
    4ae0:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    4ae2:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    4ae4:	bsr.s 4aae <__divsi3>
	addql	#8, sp
    4ae6:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    4ae8:	move.l 8(sp),d1
	movel	d1, sp@-
    4aec:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    4aee:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    4af0:	bsr.w 4a30 <__mulsi3>
	addql	#8, sp
    4af4:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    4af6:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4afa:	sub.l d0,d1
	movel	d1, d0
    4afc:	move.l d1,d0
	rts
    4afe:	rts

00004b00 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    4b00:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4b04:	move.l 4(sp),d0
	movel	d1, sp@-
    4b08:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    4b0a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    4b0c:	bsr.w 4a52 <__udivsi3>
	addql	#8, sp
    4b10:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    4b12:	move.l 8(sp),d1
	movel	d1, sp@-
    4b16:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    4b18:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    4b1a:	bsr.w 4a30 <__mulsi3>
	addql	#8, sp
    4b1e:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    4b20:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4b24:	sub.l d0,d1
	movel	d1, d0
    4b26:	move.l d1,d0
	rts
    4b28:	rts

00004b2a <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    4b2a:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    4b2c:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4b30:	jsr -516(a6)
    move.l (sp)+, a6
    4b34:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    4b36:	rts

00004b38 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    4b38:	move.b d0,(a3)+
	rts
    4b3a:	rts

00004b3c <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    4b3c:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    4b3e:	                         adda.l a0,a2
	move.l	a2,a3
    4b40:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    4b42:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    4b44:	                         moveq #56,d4
	moveq	#8,d5
    4b46:	                         moveq #8,d5
	bra.s	.Lliteral
    4b48:	   /-------------------- bra.s 4bb2 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    4b4a:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    4b4c:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    4b4e:	+--|-------------------- dbf d1,4b4a <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    4b52:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    4b54:	|  |     /-------------- bcc.s 4b58 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    4b56:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    4b58:	|  |  |  >-------------> tst.w d0
    4b5a:	|  |  |  |           /-- bne.s 4b64 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    4b5c:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    4b5e:	|  |  |  |           |   bls.s 4bd6 <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    4b60:	|  |  |  |           |   move.w (a0)+,d0
    4b62:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    4b64:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    4b66:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    4b68:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    4b6a:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    4b6c:	|  |  |  |               movem.w (4bd0 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    4b72:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    4b74:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    4b76:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    4b78:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    4b7a:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    4b7c:	|  |  |  |               tst.w d0
    4b7e:	|  |  |  |           /-- bne.s 4b84 <_doynaxdepack_asm+0x48>
    4b80:	|  |  |  |           |   move.w (a0)+,d0
    4b82:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    4b84:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    4b86:	|  |  |  |  /----------- beq.s 4b9e <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    4b88:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    4b8a:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    4b8c:	|  |  |  |  |  /-------- bpl.s 4b9a <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    4b8e:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    4b90:	|  |  |  |  |  |  /----- bpl.s 4b98 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    4b92:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    4b94:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    4b96:	|  |  |  |  |  |  |  \-- bmi.s 4b92 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    4b98:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    4b9a:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    4b9c:	|  |  |  |  |        /-- bcc.s 4ba0 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    4b9e:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    4ba0:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    4ba2:	|  |  |  |  \----------- dbf d1,4b9e <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    4ba6:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    4ba8:	|  |  |  \-------------- bcc.s 4b58 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    4baa:	|  |  |                  tst.w d0
    4bac:	|  +--|----------------- bne.s 4bb2 <_doynaxdepack_asm+0x76>
    4bae:	|  |  |                  move.w (a0)+,d0
    4bb0:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    4bb2:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    4bb4:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    4bb6:	|     \----------------- bcc.s 4b56 <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    4bb8:	|                 /----- bpl.s 4bc0 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    4bba:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    4bbc:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    4bbe:	|                 |  \-- bmi.s 4bba <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    4bc0:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    4bc2:	\--------------------/-X dbv.s d1,4b4a <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    4bc6:	                     |   add.l d0,d0
	eor.w	d1,d0		
    4bc8:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    4bca:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    4bcc:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    4bce:	                     \-- bra.s 4bc2 <_doynaxdepack_asm+0x86>

00004bd0 <doy_table>:
    4bd0:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    4be0:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    4bf0:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    4c00:	.............oNq

00004c10 <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    4c10:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    4c14:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    4c16:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    4c1a:	cmpi.w #0,d2
    bgt.s br1
    4c1e:	bgt.s 4c2a <br1>
    |{
    |direction = -64;  
    neg.w d7    
    4c20:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    4c22:	addq.w #1,d2
    lsl.l   #6,d2
    4c24:	lsl.l #6,d2
    sub.w   d2,d1
    4c26:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    4c28:	neg.w d2

00004c2a <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    4c2a:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    4c2c:	lsl.w #3,d6
    sub.w d6,d0
    4c2e:	sub.w d6,d0
    mulu.w #1200,d6
    4c30:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    4c34:	move.w d2,d0
    subq.w #1,d0
    4c36:	subq.w #1,d0
    mulu.w #100,d0
    4c38:	mulu.w #100,d0
    subq.w #1,d3
    4c3c:	subq.w #1,d3
    add.w d3,d0
    4c3e:	add.w d3,d0
    add.w d0,a0
    4c40:	adda.w d0,a0
    move.w (a0),d0
    4c42:	move.w (a0),d0
    sub.w  d5,d0
    4c44:	sub.w d5,d0
    sub.w  d5,d0
    4c46:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    4c48:	sub.w d5,d7
    sub.w d5,d7
    4c4a:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    4c4c:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    4c4e:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    4c50:	lsl.w #6,d2
    add.w d5,d2
    4c52:	add.w d5,d2
    lea   0xdff000,a3
    4c54:	lea dff000 <_end+0xd9df1c>,a3
    tst.w 0x2(a3)
    4c5a:	tst.w 2(a3)

00004c5e <waitblit>:
waitblit:
    btst #6,2(a3)
    4c5e:	/-> btst #6,2(a3)
    bne.s waitblit
    4c64:	\-- bne.s 4c5e <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    4c66:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    4c6a:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    4c6e:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    4c72:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    4c76:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    4c7a:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    4c7e:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    4c82:	    movem.l (sp)+,d0-a3
    rts
    4c86:	    rts

00004c88 <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    4c88:	lea 4c88 <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    4c8c:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    4c90:	adda.l a1,a1
    add.l #zmult,a1
    4c92:	adda.l #19592,a1

00004c98 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    4c98:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    4c9c:	moveq #0,d1
			moveq	#0,d2
    4c9e:	moveq #0,d2
			moveq	#0,d3
    4ca0:	moveq #0,d3
			moveq	#16,d7
    4ca2:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    4ca4:	lea 5922 <lz4jmp>(pc),a3
		moveq	#0,d0
    4ca8:	moveq #0,d0
		move.b	(a0)+,d0
    4caa:	move.b (a0)+,d0
		add.w	d0,d0
    4cac:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4cae:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4cb2:	jmp (0,a3,d0.w)

00004cb6 <lz4Rts0>:
lz4Rts0:	rts
    4cb6:	rts

00004cb8 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    4cb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cc4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ccc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cd2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4cd4:	cmpa.l a0,a4
		beq.s	lz4Rts1
    4cd6:	beq.s 4cfa <lz4Rts1>
		move.b	(a0)+,d0
    4cd8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4cda:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4cdc:	move.w (sp)+,d3
		move.b	d0,d3
    4cde:	move.b d0,d3
		move.l	a1,a2
    4ce0:	movea.l a1,a2
		sub.l	d3,a2
    4ce2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4ce4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ce6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ce8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4cea:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4cec:	moveq #0,d0
		move.b	(a0)+,d0
    4cee:	move.b (a0)+,d0
		add.w	d0,d0
    4cf0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4cf2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4cf6:	jmp (0,a3,d0.w)

00004cfa <lz4Rts1>:
lz4Rts1:	rts
    4cfa:	rts

00004cfc <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    4cfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4cfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d16:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4d18:	cmpa.l a0,a4
		beq.s	lz4Rts2
    4d1a:	beq.s 4d40 <lz4Rts2>
		move.b	(a0)+,d0
    4d1c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4d1e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4d20:	move.w (sp)+,d3
		move.b	d0,d3
    4d22:	move.b d0,d3
		move.l	a1,a2
    4d24:	movea.l a1,a2
		sub.l	d3,a2
    4d26:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4d28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d30:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4d32:	moveq #0,d0
		move.b	(a0)+,d0
    4d34:	move.b (a0)+,d0
		add.w	d0,d0
    4d36:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4d38:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4d3c:	jmp (0,a3,d0.w)

00004d40 <lz4Rts2>:
lz4Rts2:	rts
    4d40:	rts

00004d42 <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    4d42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d5c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4d5e:	cmpa.l a0,a4
		beq.s	lz4Rts3
    4d60:	beq.s 4d88 <lz4Rts3>
		move.b	(a0)+,d0
    4d62:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4d64:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4d66:	move.w (sp)+,d3
		move.b	d0,d3
    4d68:	move.b d0,d3
		move.l	a1,a2
    4d6a:	movea.l a1,a2
		sub.l	d3,a2
    4d6c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4d6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4d78:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4d7a:	moveq #0,d0
		move.b	(a0)+,d0
    4d7c:	move.b (a0)+,d0
		add.w	d0,d0
    4d7e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4d80:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4d84:	jmp (0,a3,d0.w)

00004d88 <lz4Rts3>:
lz4Rts3:	rts
    4d88:	rts

00004d8a <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    4d8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4d9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4da0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4da2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4da4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4da6:	cmpa.l a0,a4
		beq.s	lz4Rts4
    4da8:	beq.s 4dd2 <lz4Rts4>
		move.b	(a0)+,d0
    4daa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4dac:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4dae:	move.w (sp)+,d3
		move.b	d0,d3
    4db0:	move.b d0,d3
		move.l	a1,a2
    4db2:	movea.l a1,a2
		sub.l	d3,a2
    4db4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4db6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4db8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4dba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4dbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4dbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4dc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4dc2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4dc4:	moveq #0,d0
		move.b	(a0)+,d0
    4dc6:	move.b (a0)+,d0
		add.w	d0,d0
    4dc8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4dca:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4dce:	jmp (0,a3,d0.w)

00004dd2 <lz4Rts4>:
lz4Rts4:	rts
    4dd2:	rts

00004dd4 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    4dd4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dd6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dd8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ddc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4de0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4de2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4de4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4de6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4de8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4dee:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4df0:	cmpa.l a0,a4
		beq.s	lz4Rts5
    4df2:	beq.s 4e1e <lz4Rts5>
		move.b	(a0)+,d0
    4df4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4df6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4df8:	move.w (sp)+,d3
		move.b	d0,d3
    4dfa:	move.b d0,d3
		move.l	a1,a2
    4dfc:	movea.l a1,a2
		sub.l	d3,a2
    4dfe:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4e00:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e02:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e04:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e06:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e08:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e0a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e0c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e0e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4e10:	moveq #0,d0
		move.b	(a0)+,d0
    4e12:	move.b (a0)+,d0
		add.w	d0,d0
    4e14:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4e16:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4e1a:	jmp (0,a3,d0.w)

00004e1e <lz4Rts5>:
lz4Rts5:	rts
    4e1e:	rts

00004e20 <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    4e20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e3a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4e3c:	cmpa.l a0,a4
		beq.s	lz4Rts6
    4e3e:	beq.s 4e6c <lz4Rts6>
		move.b	(a0)+,d0
    4e40:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4e42:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4e44:	move.w (sp)+,d3
		move.b	d0,d3
    4e46:	move.b d0,d3
		move.l	a1,a2
    4e48:	movea.l a1,a2
		sub.l	d3,a2
    4e4a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4e4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e50:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e52:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e54:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e5a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e5c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4e5e:	moveq #0,d0
		move.b	(a0)+,d0
    4e60:	move.b (a0)+,d0
		add.w	d0,d0
    4e62:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4e64:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4e68:	jmp (0,a3,d0.w)

00004e6c <lz4Rts6>:
lz4Rts6:	rts
    4e6c:	rts

00004e6e <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    4e6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4e88:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4e8a:	cmpa.l a0,a4
		beq.s	lz4Rts7
    4e8c:	beq.s 4ebc <lz4Rts7>
		move.b	(a0)+,d0
    4e8e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4e90:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4e92:	move.w (sp)+,d3
		move.b	d0,d3
    4e94:	move.b d0,d3
		move.l	a1,a2
    4e96:	movea.l a1,a2
		sub.l	d3,a2
    4e98:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4e9a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e9c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4e9e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ea0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ea2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ea4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ea6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ea8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4eaa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4eac:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4eae:	moveq #0,d0
		move.b	(a0)+,d0
    4eb0:	move.b (a0)+,d0
		add.w	d0,d0
    4eb2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4eb4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4eb8:	jmp (0,a3,d0.w)

00004ebc <lz4Rts7>:
lz4Rts7:	rts
    4ebc:	rts

00004ebe <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    4ebe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ec0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ec2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ec4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ec6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ec8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4eca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ecc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ece:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ed0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ed2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ed4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ed6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4ed8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4eda:	cmpa.l a0,a4
		beq.s	lz4Rts8
    4edc:	beq.s 4f0e <lz4Rts8>
		move.b	(a0)+,d0
    4ede:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4ee0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4ee2:	move.w (sp)+,d3
		move.b	d0,d3
    4ee4:	move.b d0,d3
		move.l	a1,a2
    4ee6:	movea.l a1,a2
		sub.l	d3,a2
    4ee8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4eea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4eec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4eee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ef0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ef2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ef4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ef6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ef8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4efa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4efc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4efe:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4f00:	moveq #0,d0
		move.b	(a0)+,d0
    4f02:	move.b (a0)+,d0
		add.w	d0,d0
    4f04:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4f06:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4f0a:	jmp (0,a3,d0.w)

00004f0e <lz4Rts8>:
lz4Rts8:	rts
    4f0e:	rts

00004f10 <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    4f10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f2a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4f2c:	cmpa.l a0,a4
		beq.s	lz4Rts9
    4f2e:	beq.s 4f62 <lz4Rts9>
		move.b	(a0)+,d0
    4f30:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4f32:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4f34:	move.w (sp)+,d3
		move.b	d0,d3
    4f36:	move.b d0,d3
		move.l	a1,a2
    4f38:	movea.l a1,a2
		sub.l	d3,a2
    4f3a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4f3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f3e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f40:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f42:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f50:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f52:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4f54:	moveq #0,d0
		move.b	(a0)+,d0
    4f56:	move.b (a0)+,d0
		add.w	d0,d0
    4f58:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4f5a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4f5e:	jmp (0,a3,d0.w)

00004f62 <lz4Rts9>:
lz4Rts9:	rts
    4f62:	rts

00004f64 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    4f64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4f7e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4f80:	cmpa.l a0,a4
		beq.s	lz4Rts10
    4f82:	beq.s 4fb8 <lz4Rts10>
		move.b	(a0)+,d0
    4f84:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4f86:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4f88:	move.w (sp)+,d3
		move.b	d0,d3
    4f8a:	move.b d0,d3
		move.l	a1,a2
    4f8c:	movea.l a1,a2
		sub.l	d3,a2
    4f8e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4f90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f92:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f94:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f96:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f98:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f9a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f9c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4f9e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fa0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fa2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fa4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fa6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fa8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    4faa:	moveq #0,d0
		move.b	(a0)+,d0
    4fac:	move.b (a0)+,d0
		add.w	d0,d0
    4fae:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    4fb0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    4fb4:	jmp (0,a3,d0.w)

00004fb8 <lz4Rts10>:
lz4Rts10:	rts
    4fb8:	rts

00004fba <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    4fba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fc4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fd2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    4fd4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    4fd6:	cmpa.l a0,a4
		beq.s	lz4Rts11
    4fd8:	beq.s 5010 <lz4Rts11>
		move.b	(a0)+,d0
    4fda:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    4fdc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    4fde:	move.w (sp)+,d3
		move.b	d0,d3
    4fe0:	move.b d0,d3
		move.l	a1,a2
    4fe2:	movea.l a1,a2
		sub.l	d3,a2
    4fe4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    4fe6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fe8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4fee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ff0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ff2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ff4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ff6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ff8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ffa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ffc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    4ffe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5000:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5002:	moveq #0,d0
		move.b	(a0)+,d0
    5004:	move.b (a0)+,d0
		add.w	d0,d0
    5006:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5008:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    500c:	jmp (0,a3,d0.w)

00005010 <lz4Rts11>:
lz4Rts11:	rts
    5010:	rts

00005012 <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    5012:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5014:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5016:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5018:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    501a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    501c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    501e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5020:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5022:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5024:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5026:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5028:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    502a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    502c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    502e:	cmpa.l a0,a4
		beq.s	lz4Rts12
    5030:	beq.s 506a <lz4Rts12>
		move.b	(a0)+,d0
    5032:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5034:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5036:	move.w (sp)+,d3
		move.b	d0,d3
    5038:	move.b d0,d3
		move.l	a1,a2
    503a:	movea.l a1,a2
		sub.l	d3,a2
    503c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    503e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5040:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5042:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5044:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5046:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5048:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    504a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    504c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    504e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5050:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5052:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5054:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5056:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5058:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    505a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    505c:	moveq #0,d0
		move.b	(a0)+,d0
    505e:	move.b (a0)+,d0
		add.w	d0,d0
    5060:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5062:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5066:	jmp (0,a3,d0.w)

0000506a <lz4Rts12>:
lz4Rts12:	rts
    506a:	rts

0000506c <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    506c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    506e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5070:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5072:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5074:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5076:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5078:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    507a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    507c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    507e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5080:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5082:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5084:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5086:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5088:	cmpa.l a0,a4
		beq.s	lz4Rts13
    508a:	beq.s 50c6 <lz4Rts13>
		move.b	(a0)+,d0
    508c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    508e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5090:	move.w (sp)+,d3
		move.b	d0,d3
    5092:	move.b d0,d3
		move.l	a1,a2
    5094:	movea.l a1,a2
		sub.l	d3,a2
    5096:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5098:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    509a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    509c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    509e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50b6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    50b8:	moveq #0,d0
		move.b	(a0)+,d0
    50ba:	move.b (a0)+,d0
		add.w	d0,d0
    50bc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    50be:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    50c2:	jmp (0,a3,d0.w)

000050c6 <lz4Rts13>:
lz4Rts13:	rts
    50c6:	rts

000050c8 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    50c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    50e2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    50e4:	cmpa.l a0,a4
		beq.s	lz4Rts14
    50e6:	beq.s 5124 <lz4Rts14>
		move.b	(a0)+,d0
    50e8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    50ea:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    50ec:	move.w (sp)+,d3
		move.b	d0,d3
    50ee:	move.b d0,d3
		move.l	a1,a2
    50f0:	movea.l a1,a2
		sub.l	d3,a2
    50f2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    50f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    50fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5100:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5102:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5104:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5106:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5108:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    510a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    510c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    510e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5110:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5112:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5114:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5116:	moveq #0,d0
		move.b	(a0)+,d0
    5118:	move.b (a0)+,d0
		add.w	d0,d0
    511a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    511c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5120:	jmp (0,a3,d0.w)

00005124 <lz4Rts14>:
lz4Rts14:	rts
    5124:	rts

00005126 <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    5126:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5128:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    512a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    512c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    512e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5130:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5132:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5134:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5136:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5138:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    513a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    513c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    513e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5140:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5142:	cmpa.l a0,a4
		beq.s	lz4Rts15
    5144:	beq.s 5184 <lz4Rts15>
		move.b	(a0)+,d0
    5146:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5148:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    514a:	move.w (sp)+,d3
		move.b	d0,d3
    514c:	move.b d0,d3
		move.l	a1,a2
    514e:	movea.l a1,a2
		sub.l	d3,a2
    5150:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5152:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5154:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5156:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5158:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    515a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    515c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    515e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5160:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5162:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5164:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5166:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5168:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    516a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    516c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    516e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5170:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5172:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5174:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5176:	moveq #0,d0
		move.b	(a0)+,d0
    5178:	move.b (a0)+,d0
		add.w	d0,d0
    517a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    517c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5180:	jmp (0,a3,d0.w)

00005184 <lz4Rts15>:
lz4Rts15:	rts
    5184:	rts

00005186 <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    5186:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5188:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    518a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    518c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    518e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5190:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5192:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5194:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5196:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5198:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    519a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    519c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    519e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    51a0:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    51a2:	cmpa.l a0,a4
		beq.s	lz4Rts16
    51a4:	beq.s 51fa <lz4Rts16>
		move.b	(a0)+,d0
    51a6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    51a8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    51aa:	move.w (sp)+,d3
		move.b	d0,d3
    51ac:	move.b d0,d3
		move.l	a1,a2
    51ae:	movea.l a1,a2
		sub.l	d3,a2
    51b0:	suba.l d3,a2
		moveq	#15+4,d1
    51b2:	moveq #19,d1

000051b4 <.cl0>:
.cl0:	move.b	(a0)+,d2
    51b4:	/-> move.b (a0)+,d2
		add.l d2,d1
    51b6:	|   add.l d2,d1
		not.b	d2
    51b8:	|   not.b d2
		beq.s	.cl0
    51ba:	\-- beq.s 51b4 <.cl0>
		moveq	#15,d5
    51bc:	    moveq #15,d5
		and.w	d1,d5
    51be:	    and.w d1,d5
		add.w	d5,d5
    51c0:	    add.w d5,d5
		neg.w	d5
    51c2:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    51c4:	    jmp (51e8 <.eloop1>,pc,d5.w)

000051c8 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    51c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    51e6:	move.b (a2)+,(a1)+

000051e8 <.eloop1>:
.eloop1:	sub.l	d7,d1
    51e8:	sub.l d7,d1
		bpl.s	.tloop1
    51ea:	bpl.s 51c8 <.tloop1>
		moveq	#0,d0
    51ec:	moveq #0,d0
		move.b	(a0)+,d0
    51ee:	move.b (a0)+,d0
		add.w	d0,d0
    51f0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    51f2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    51f6:	jmp (0,a3,d0.w)

000051fa <lz4Rts16>:
lz4Rts16:	rts
    51fa:	rts

000051fc <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    51fc:	moveq #15,d1

000051fe <.cl2>:
.cl2:	move.b	(a0)+,d2
    51fe:	/-> move.b (a0)+,d2
		add.l d2,d1
    5200:	|   add.l d2,d1
		not.b	d2
    5202:	|   not.b d2
		beq.s	.cl2
    5204:	\-- beq.s 51fe <.cl2>
		moveq	#15,d5
    5206:	    moveq #15,d5
		and.w	d1,d5
    5208:	    and.w d1,d5
		add.w	d5,d5
    520a:	    add.w d5,d5
		neg.w	d5
    520c:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    520e:	    jmp (5232 <.eloop3>,pc,d5.w)

00005212 <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    5212:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5214:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5216:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5218:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    521a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    521c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    521e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5220:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5222:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5224:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5226:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5228:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    522a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    522c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    522e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5230:	move.b (a0)+,(a1)+

00005232 <.eloop3>:
.eloop3:	sub.l	d7,d1
    5232:	sub.l d7,d1
		bpl.s	.tloop3
    5234:	bpl.s 5212 <.tloop3>
		cmpa.l	a0,a4
    5236:	cmpa.l a0,a4
		beq.s	lz4Rts17
    5238:	beq.s 525c <lz4Rts17>
		move.b	(a0)+,d0
    523a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    523c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    523e:	move.w (sp)+,d3
		move.b	d0,d3
    5240:	move.b d0,d3
		move.l	a1,a2
    5242:	movea.l a1,a2
		sub.l	d3,a2
    5244:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5246:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5248:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    524a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    524c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    524e:	moveq #0,d0
		move.b	(a0)+,d0
    5250:	move.b (a0)+,d0
		add.w	d0,d0
    5252:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5254:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5258:	jmp (0,a3,d0.w)

0000525c <lz4Rts17>:
lz4Rts17:	rts
    525c:	rts

0000525e <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    525e:	moveq #15,d1

00005260 <.cl4>:
.cl4:	move.b	(a0)+,d2
    5260:	/-> move.b (a0)+,d2
		add.l d2,d1
    5262:	|   add.l d2,d1
		not.b	d2
    5264:	|   not.b d2
		beq.s	.cl4
    5266:	\-- beq.s 5260 <.cl4>
		moveq	#15,d5
    5268:	    moveq #15,d5
		and.w	d1,d5
    526a:	    and.w d1,d5
		add.w	d5,d5
    526c:	    add.w d5,d5
		neg.w	d5
    526e:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    5270:	    jmp (5294 <.eloop5>,pc,d5.w)

00005274 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    5274:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5276:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5278:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    527a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    527c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    527e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5280:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5282:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5284:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5286:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5288:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    528a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    528c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    528e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5290:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5292:	move.b (a0)+,(a1)+

00005294 <.eloop5>:
.eloop5:	sub.l	d7,d1
    5294:	sub.l d7,d1
		bpl.s	.tloop5
    5296:	bpl.s 5274 <.tloop5>
		cmpa.l	a0,a4
    5298:	cmpa.l a0,a4
		beq.s	lz4Rts18
    529a:	beq.s 52c0 <lz4Rts18>
		move.b	(a0)+,d0
    529c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    529e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    52a0:	move.w (sp)+,d3
		move.b	d0,d3
    52a2:	move.b d0,d3
		move.l	a1,a2
    52a4:	movea.l a1,a2
		sub.l	d3,a2
    52a6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    52a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    52aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    52ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    52ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    52b0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    52b2:	moveq #0,d0
		move.b	(a0)+,d0
    52b4:	move.b (a0)+,d0
		add.w	d0,d0
    52b6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    52b8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    52bc:	jmp (0,a3,d0.w)

000052c0 <lz4Rts18>:
lz4Rts18:	rts
    52c0:	rts

000052c2 <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    52c2:	moveq #15,d1

000052c4 <.cl6>:
.cl6:	move.b	(a0)+,d2
    52c4:	/-> move.b (a0)+,d2
		add.l d2,d1
    52c6:	|   add.l d2,d1
		not.b	d2
    52c8:	|   not.b d2
		beq.s	.cl6
    52ca:	\-- beq.s 52c4 <.cl6>
		moveq	#15,d5
    52cc:	    moveq #15,d5
		and.w	d1,d5
    52ce:	    and.w d1,d5
		add.w	d5,d5
    52d0:	    add.w d5,d5
		neg.w	d5
    52d2:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    52d4:	    jmp (52f8 <.eloop7>,pc,d5.w)

000052d8 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    52d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    52f6:	move.b (a0)+,(a1)+

000052f8 <.eloop7>:
.eloop7:	sub.l	d7,d1
    52f8:	sub.l d7,d1
		bpl.s	.tloop7
    52fa:	bpl.s 52d8 <.tloop7>
		cmpa.l	a0,a4
    52fc:	cmpa.l a0,a4
		beq.s	lz4Rts19
    52fe:	beq.s 5326 <lz4Rts19>
		move.b	(a0)+,d0
    5300:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5302:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5304:	move.w (sp)+,d3
		move.b	d0,d3
    5306:	move.b d0,d3
		move.l	a1,a2
    5308:	movea.l a1,a2
		sub.l	d3,a2
    530a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    530c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    530e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5310:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5312:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5314:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5316:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5318:	moveq #0,d0
		move.b	(a0)+,d0
    531a:	move.b (a0)+,d0
		add.w	d0,d0
    531c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    531e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5322:	jmp (0,a3,d0.w)

00005326 <lz4Rts19>:
lz4Rts19:	rts
    5326:	rts

00005328 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    5328:	moveq #15,d1

0000532a <.cl8>:
.cl8:	move.b	(a0)+,d2
    532a:	/-> move.b (a0)+,d2
		add.l d2,d1
    532c:	|   add.l d2,d1
		not.b	d2
    532e:	|   not.b d2
		beq.s	.cl8
    5330:	\-- beq.s 532a <.cl8>
		moveq	#15,d5
    5332:	    moveq #15,d5
		and.w	d1,d5
    5334:	    and.w d1,d5
		add.w	d5,d5
    5336:	    add.w d5,d5
		neg.w	d5
    5338:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    533a:	    jmp (535e <.eloop9>,pc,d5.w)

0000533e <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    533e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5340:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5342:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5344:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5346:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5348:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    534a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    534c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    534e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5350:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5352:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5354:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5356:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5358:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    535a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    535c:	move.b (a0)+,(a1)+

0000535e <.eloop9>:
.eloop9:	sub.l	d7,d1
    535e:	sub.l d7,d1
		bpl.s	.tloop9
    5360:	bpl.s 533e <.tloop9>
		cmpa.l	a0,a4
    5362:	cmpa.l a0,a4
		beq.s	lz4Rts20
    5364:	beq.s 538e <lz4Rts20>
		move.b	(a0)+,d0
    5366:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5368:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    536a:	move.w (sp)+,d3
		move.b	d0,d3
    536c:	move.b d0,d3
		move.l	a1,a2
    536e:	movea.l a1,a2
		sub.l	d3,a2
    5370:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5372:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5374:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5376:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5378:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    537a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    537c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    537e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5380:	moveq #0,d0
		move.b	(a0)+,d0
    5382:	move.b (a0)+,d0
		add.w	d0,d0
    5384:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5386:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    538a:	jmp (0,a3,d0.w)

0000538e <lz4Rts20>:
lz4Rts20:	rts
    538e:	rts

00005390 <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    5390:	moveq #15,d1

00005392 <.cl10>:
.cl10:	move.b	(a0)+,d2
    5392:	/-> move.b (a0)+,d2
		add.l d2,d1
    5394:	|   add.l d2,d1
		not.b	d2
    5396:	|   not.b d2
		beq.s	.cl10
    5398:	\-- beq.s 5392 <.cl10>
		moveq	#15,d5
    539a:	    moveq #15,d5
		and.w	d1,d5
    539c:	    and.w d1,d5
		add.w	d5,d5
    539e:	    add.w d5,d5
		neg.w	d5
    53a0:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    53a2:	    jmp (53c6 <.eloop11>,pc,d5.w)

000053a6 <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    53a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    53c4:	move.b (a0)+,(a1)+

000053c6 <.eloop11>:
.eloop11:	sub.l	d7,d1
    53c6:	sub.l d7,d1
		bpl.s	.tloop11
    53c8:	bpl.s 53a6 <.tloop11>
		cmpa.l	a0,a4
    53ca:	cmpa.l a0,a4
		beq.s	lz4Rts21
    53cc:	beq.s 53f8 <lz4Rts21>
		move.b	(a0)+,d0
    53ce:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    53d0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    53d2:	move.w (sp)+,d3
		move.b	d0,d3
    53d4:	move.b d0,d3
		move.l	a1,a2
    53d6:	movea.l a1,a2
		sub.l	d3,a2
    53d8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    53da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    53e8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    53ea:	moveq #0,d0
		move.b	(a0)+,d0
    53ec:	move.b (a0)+,d0
		add.w	d0,d0
    53ee:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    53f0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    53f4:	jmp (0,a3,d0.w)

000053f8 <lz4Rts21>:
lz4Rts21:	rts
    53f8:	rts

000053fa <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    53fa:	moveq #15,d1

000053fc <.cl12>:
.cl12:	move.b	(a0)+,d2
    53fc:	/-> move.b (a0)+,d2
		add.l d2,d1
    53fe:	|   add.l d2,d1
		not.b	d2
    5400:	|   not.b d2
		beq.s	.cl12
    5402:	\-- beq.s 53fc <.cl12>
		moveq	#15,d5
    5404:	    moveq #15,d5
		and.w	d1,d5
    5406:	    and.w d1,d5
		add.w	d5,d5
    5408:	    add.w d5,d5
		neg.w	d5
    540a:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    540c:	    jmp (5430 <.eloop13>,pc,d5.w)

00005410 <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    5410:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5412:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5414:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5416:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5418:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    541a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    541c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    541e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5420:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5422:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5424:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5426:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5428:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    542a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    542c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    542e:	move.b (a0)+,(a1)+

00005430 <.eloop13>:
.eloop13:	sub.l	d7,d1
    5430:	sub.l d7,d1
		bpl.s	.tloop13
    5432:	bpl.s 5410 <.tloop13>
		cmpa.l	a0,a4
    5434:	cmpa.l a0,a4
		beq.s	lz4Rts22
    5436:	beq.s 5464 <lz4Rts22>
		move.b	(a0)+,d0
    5438:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    543a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    543c:	move.w (sp)+,d3
		move.b	d0,d3
    543e:	move.b d0,d3
		move.l	a1,a2
    5440:	movea.l a1,a2
		sub.l	d3,a2
    5442:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5444:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5446:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5448:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    544a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    544c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    544e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5450:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5452:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5454:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5456:	moveq #0,d0
		move.b	(a0)+,d0
    5458:	move.b (a0)+,d0
		add.w	d0,d0
    545a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    545c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5460:	jmp (0,a3,d0.w)

00005464 <lz4Rts22>:
lz4Rts22:	rts
    5464:	rts

00005466 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    5466:	moveq #15,d1

00005468 <.cl14>:
.cl14:	move.b	(a0)+,d2
    5468:	/-> move.b (a0)+,d2
		add.l d2,d1
    546a:	|   add.l d2,d1
		not.b	d2
    546c:	|   not.b d2
		beq.s	.cl14
    546e:	\-- beq.s 5468 <.cl14>
		moveq	#15,d5
    5470:	    moveq #15,d5
		and.w	d1,d5
    5472:	    and.w d1,d5
		add.w	d5,d5
    5474:	    add.w d5,d5
		neg.w	d5
    5476:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    5478:	    jmp (549c <.eloop15>,pc,d5.w)

0000547c <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    547c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    547e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5480:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5482:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5484:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5486:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5488:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    548a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    548c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    548e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5490:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5492:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5494:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5496:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5498:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    549a:	move.b (a0)+,(a1)+

0000549c <.eloop15>:
.eloop15:	sub.l	d7,d1
    549c:	sub.l d7,d1
		bpl.s	.tloop15
    549e:	bpl.s 547c <.tloop15>
		cmpa.l	a0,a4
    54a0:	cmpa.l a0,a4
		beq.s	lz4Rts23
    54a2:	beq.s 54d2 <lz4Rts23>
		move.b	(a0)+,d0
    54a4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    54a6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    54a8:	move.w (sp)+,d3
		move.b	d0,d3
    54aa:	move.b d0,d3
		move.l	a1,a2
    54ac:	movea.l a1,a2
		sub.l	d3,a2
    54ae:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    54b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    54c2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    54c4:	moveq #0,d0
		move.b	(a0)+,d0
    54c6:	move.b (a0)+,d0
		add.w	d0,d0
    54c8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    54ca:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    54ce:	jmp (0,a3,d0.w)

000054d2 <lz4Rts23>:
lz4Rts23:	rts
    54d2:	rts

000054d4 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    54d4:	moveq #15,d1

000054d6 <.cl16>:
.cl16:	move.b	(a0)+,d2
    54d6:	/-> move.b (a0)+,d2
		add.l d2,d1
    54d8:	|   add.l d2,d1
		not.b	d2
    54da:	|   not.b d2
		beq.s	.cl16
    54dc:	\-- beq.s 54d6 <.cl16>
		moveq	#15,d5
    54de:	    moveq #15,d5
		and.w	d1,d5
    54e0:	    and.w d1,d5
		add.w	d5,d5
    54e2:	    add.w d5,d5
		neg.w	d5
    54e4:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    54e6:	    jmp (550a <.eloop17>,pc,d5.w)

000054ea <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    54ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    54fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5500:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5502:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5504:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5506:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5508:	move.b (a0)+,(a1)+

0000550a <.eloop17>:
.eloop17:	sub.l	d7,d1
    550a:	sub.l d7,d1
		bpl.s	.tloop17
    550c:	bpl.s 54ea <.tloop17>
		cmpa.l	a0,a4
    550e:	cmpa.l a0,a4
		beq.s	lz4Rts24
    5510:	beq.s 5542 <lz4Rts24>
		move.b	(a0)+,d0
    5512:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5514:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5516:	move.w (sp)+,d3
		move.b	d0,d3
    5518:	move.b d0,d3
		move.l	a1,a2
    551a:	movea.l a1,a2
		sub.l	d3,a2
    551c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    551e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5520:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5522:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5524:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5526:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5528:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    552a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    552c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    552e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5530:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5532:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5534:	moveq #0,d0
		move.b	(a0)+,d0
    5536:	move.b (a0)+,d0
		add.w	d0,d0
    5538:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    553a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    553e:	jmp (0,a3,d0.w)

00005542 <lz4Rts24>:
lz4Rts24:	rts
    5542:	rts

00005544 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    5544:	moveq #15,d1

00005546 <.cl18>:
.cl18:	move.b	(a0)+,d2
    5546:	/-> move.b (a0)+,d2
		add.l d2,d1
    5548:	|   add.l d2,d1
		not.b	d2
    554a:	|   not.b d2
		beq.s	.cl18
    554c:	\-- beq.s 5546 <.cl18>
		moveq	#15,d5
    554e:	    moveq #15,d5
		and.w	d1,d5
    5550:	    and.w d1,d5
		add.w	d5,d5
    5552:	    add.w d5,d5
		neg.w	d5
    5554:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    5556:	    jmp (557a <.eloop19>,pc,d5.w)

0000555a <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    555a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    555c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    555e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5560:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5562:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5564:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5566:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5568:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    556a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    556c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    556e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5570:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5572:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5574:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5576:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5578:	move.b (a0)+,(a1)+

0000557a <.eloop19>:
.eloop19:	sub.l	d7,d1
    557a:	sub.l d7,d1
		bpl.s	.tloop19
    557c:	bpl.s 555a <.tloop19>
		cmpa.l	a0,a4
    557e:	cmpa.l a0,a4
		beq.s	lz4Rts25
    5580:	beq.s 55b4 <lz4Rts25>
		move.b	(a0)+,d0
    5582:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5584:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5586:	move.w (sp)+,d3
		move.b	d0,d3
    5588:	move.b d0,d3
		move.l	a1,a2
    558a:	movea.l a1,a2
		sub.l	d3,a2
    558c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    558e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5590:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5592:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5594:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5596:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5598:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    559a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    559c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    559e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    55a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    55a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    55a4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    55a6:	moveq #0,d0
		move.b	(a0)+,d0
    55a8:	move.b (a0)+,d0
		add.w	d0,d0
    55aa:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    55ac:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    55b0:	jmp (0,a3,d0.w)

000055b4 <lz4Rts25>:
lz4Rts25:	rts
    55b4:	rts

000055b6 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    55b6:	moveq #15,d1

000055b8 <.cl20>:
.cl20:	move.b	(a0)+,d2
    55b8:	/-> move.b (a0)+,d2
		add.l d2,d1
    55ba:	|   add.l d2,d1
		not.b	d2
    55bc:	|   not.b d2
		beq.s	.cl20
    55be:	\-- beq.s 55b8 <.cl20>
		moveq	#15,d5
    55c0:	    moveq #15,d5
		and.w	d1,d5
    55c2:	    and.w d1,d5
		add.w	d5,d5
    55c4:	    add.w d5,d5
		neg.w	d5
    55c6:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    55c8:	    jmp (55ec <.eloop21>,pc,d5.w)

000055cc <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    55cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    55ea:	move.b (a0)+,(a1)+

000055ec <.eloop21>:
.eloop21:	sub.l	d7,d1
    55ec:	sub.l d7,d1
		bpl.s	.tloop21
    55ee:	bpl.s 55cc <.tloop21>
		cmpa.l	a0,a4
    55f0:	cmpa.l a0,a4
		beq.s	lz4Rts26
    55f2:	beq.s 5628 <lz4Rts26>
		move.b	(a0)+,d0
    55f4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    55f6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    55f8:	move.w (sp)+,d3
		move.b	d0,d3
    55fa:	move.b d0,d3
		move.l	a1,a2
    55fc:	movea.l a1,a2
		sub.l	d3,a2
    55fe:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5600:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5602:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5604:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5606:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5608:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    560a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    560c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    560e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5610:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5612:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5614:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5616:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5618:	move.b (a2)+,(a1)+
		moveq	#0,d0
    561a:	moveq #0,d0
		move.b	(a0)+,d0
    561c:	move.b (a0)+,d0
		add.w	d0,d0
    561e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5620:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5624:	jmp (0,a3,d0.w)

00005628 <lz4Rts26>:
lz4Rts26:	rts
    5628:	rts

0000562a <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    562a:	moveq #15,d1

0000562c <.cl22>:
.cl22:	move.b	(a0)+,d2
    562c:	/-> move.b (a0)+,d2
		add.l d2,d1
    562e:	|   add.l d2,d1
		not.b	d2
    5630:	|   not.b d2
		beq.s	.cl22
    5632:	\-- beq.s 562c <.cl22>
		moveq	#15,d5
    5634:	    moveq #15,d5
		and.w	d1,d5
    5636:	    and.w d1,d5
		add.w	d5,d5
    5638:	    add.w d5,d5
		neg.w	d5
    563a:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    563c:	    jmp (5660 <.eloop23>,pc,d5.w)

00005640 <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    5640:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5642:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5644:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5646:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5648:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    564a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    564c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    564e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5650:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5652:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5654:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5656:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5658:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    565a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    565c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    565e:	move.b (a0)+,(a1)+

00005660 <.eloop23>:
.eloop23:	sub.l	d7,d1
    5660:	sub.l d7,d1
		bpl.s	.tloop23
    5662:	bpl.s 5640 <.tloop23>
		cmpa.l	a0,a4
    5664:	cmpa.l a0,a4
		beq.s	lz4Rts27
    5666:	beq.s 569e <lz4Rts27>
		move.b	(a0)+,d0
    5668:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    566a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    566c:	move.w (sp)+,d3
		move.b	d0,d3
    566e:	move.b d0,d3
		move.l	a1,a2
    5670:	movea.l a1,a2
		sub.l	d3,a2
    5672:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5674:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5676:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5678:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    567a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    567c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    567e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5680:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5682:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5684:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5686:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5688:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    568a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    568c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    568e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5690:	moveq #0,d0
		move.b	(a0)+,d0
    5692:	move.b (a0)+,d0
		add.w	d0,d0
    5694:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5696:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    569a:	jmp (0,a3,d0.w)

0000569e <lz4Rts27>:
lz4Rts27:	rts
    569e:	rts

000056a0 <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    56a0:	moveq #15,d1

000056a2 <.cl24>:
.cl24:	move.b	(a0)+,d2
    56a2:	/-> move.b (a0)+,d2
		add.l d2,d1
    56a4:	|   add.l d2,d1
		not.b	d2
    56a6:	|   not.b d2
		beq.s	.cl24
    56a8:	\-- beq.s 56a2 <.cl24>
		moveq	#15,d5
    56aa:	    moveq #15,d5
		and.w	d1,d5
    56ac:	    and.w d1,d5
		add.w	d5,d5
    56ae:	    add.w d5,d5
		neg.w	d5
    56b0:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    56b2:	    jmp (56d6 <.eloop25>,pc,d5.w)

000056b6 <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    56b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    56d4:	move.b (a0)+,(a1)+

000056d6 <.eloop25>:
.eloop25:	sub.l	d7,d1
    56d6:	sub.l d7,d1
		bpl.s	.tloop25
    56d8:	bpl.s 56b6 <.tloop25>
		cmpa.l	a0,a4
    56da:	cmpa.l a0,a4
		beq.s	lz4Rts28
    56dc:	beq.s 5716 <lz4Rts28>
		move.b	(a0)+,d0
    56de:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    56e0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    56e2:	move.w (sp)+,d3
		move.b	d0,d3
    56e4:	move.b d0,d3
		move.l	a1,a2
    56e6:	movea.l a1,a2
		sub.l	d3,a2
    56e8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    56ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    56fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5700:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5702:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5704:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5706:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5708:	moveq #0,d0
		move.b	(a0)+,d0
    570a:	move.b (a0)+,d0
		add.w	d0,d0
    570c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    570e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5712:	jmp (0,a3,d0.w)

00005716 <lz4Rts28>:
lz4Rts28:	rts
    5716:	rts

00005718 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    5718:	moveq #15,d1

0000571a <.cl26>:
.cl26:	move.b	(a0)+,d2
    571a:	/-> move.b (a0)+,d2
		add.l d2,d1
    571c:	|   add.l d2,d1
		not.b	d2
    571e:	|   not.b d2
		beq.s	.cl26
    5720:	\-- beq.s 571a <.cl26>
		moveq	#15,d5
    5722:	    moveq #15,d5
		and.w	d1,d5
    5724:	    and.w d1,d5
		add.w	d5,d5
    5726:	    add.w d5,d5
		neg.w	d5
    5728:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    572a:	    jmp (574e <.eloop27>,pc,d5.w)

0000572e <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    572e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5730:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5732:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5734:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5736:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5738:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    573a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    573c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    573e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5740:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5742:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5744:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5746:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5748:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    574a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    574c:	move.b (a0)+,(a1)+

0000574e <.eloop27>:
.eloop27:	sub.l	d7,d1
    574e:	sub.l d7,d1
		bpl.s	.tloop27
    5750:	bpl.s 572e <.tloop27>
		cmpa.l	a0,a4
    5752:	cmpa.l a0,a4
		beq.s	lz4Rts29
    5754:	beq.s 5790 <lz4Rts29>
		move.b	(a0)+,d0
    5756:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5758:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    575a:	move.w (sp)+,d3
		move.b	d0,d3
    575c:	move.b d0,d3
		move.l	a1,a2
    575e:	movea.l a1,a2
		sub.l	d3,a2
    5760:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5762:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5764:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5766:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5768:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    576a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    576c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    576e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5770:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5772:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5774:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5776:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5778:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    577a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    577c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    577e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5780:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5782:	moveq #0,d0
		move.b	(a0)+,d0
    5784:	move.b (a0)+,d0
		add.w	d0,d0
    5786:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5788:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    578c:	jmp (0,a3,d0.w)

00005790 <lz4Rts29>:
lz4Rts29:	rts
    5790:	rts

00005792 <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    5792:	moveq #15,d1

00005794 <.cl28>:
.cl28:	move.b	(a0)+,d2
    5794:	/-> move.b (a0)+,d2
		add.l d2,d1
    5796:	|   add.l d2,d1
		not.b	d2
    5798:	|   not.b d2
		beq.s	.cl28
    579a:	\-- beq.s 5794 <.cl28>
		moveq	#15,d5
    579c:	    moveq #15,d5
		and.w	d1,d5
    579e:	    and.w d1,d5
		add.w	d5,d5
    57a0:	    add.w d5,d5
		neg.w	d5
    57a2:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    57a4:	    jmp (57c8 <.eloop29>,pc,d5.w)

000057a8 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    57a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    57c6:	move.b (a0)+,(a1)+

000057c8 <.eloop29>:
.eloop29:	sub.l	d7,d1
    57c8:	sub.l d7,d1
		bpl.s	.tloop29
    57ca:	bpl.s 57a8 <.tloop29>
		cmpa.l	a0,a4
    57cc:	cmpa.l a0,a4
		beq.s	lz4Rts30
    57ce:	beq.s 580c <lz4Rts30>
		move.b	(a0)+,d0
    57d0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    57d2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    57d4:	move.w (sp)+,d3
		move.b	d0,d3
    57d6:	move.b d0,d3
		move.l	a1,a2
    57d8:	movea.l a1,a2
		sub.l	d3,a2
    57da:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    57dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    57fc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    57fe:	moveq #0,d0
		move.b	(a0)+,d0
    5800:	move.b (a0)+,d0
		add.w	d0,d0
    5802:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5804:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5808:	jmp (0,a3,d0.w)

0000580c <lz4Rts30>:
lz4Rts30:	rts
    580c:	rts

0000580e <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    580e:	moveq #15,d1

00005810 <.cl30>:
.cl30:	move.b	(a0)+,d2
    5810:	/-> move.b (a0)+,d2
		add.l d2,d1
    5812:	|   add.l d2,d1
		not.b	d2
    5814:	|   not.b d2
		beq.s	.cl30
    5816:	\-- beq.s 5810 <.cl30>
		moveq	#15,d5
    5818:	    moveq #15,d5
		and.w	d1,d5
    581a:	    and.w d1,d5
		add.w	d5,d5
    581c:	    add.w d5,d5
		neg.w	d5
    581e:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    5820:	    jmp (5844 <.eloop31>,pc,d5.w)

00005824 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    5824:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5826:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5828:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    582a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    582c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    582e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5830:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5832:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5834:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5836:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5838:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    583a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    583c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    583e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5840:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5842:	move.b (a0)+,(a1)+

00005844 <.eloop31>:
.eloop31:	sub.l	d7,d1
    5844:	sub.l d7,d1
		bpl.s	.tloop31
    5846:	bpl.s 5824 <.tloop31>
		cmpa.l	a0,a4
    5848:	cmpa.l a0,a4
		beq.s	lz4Rts31
    584a:	beq.s 588a <lz4Rts31>
		move.b	(a0)+,d0
    584c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    584e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5850:	move.w (sp)+,d3
		move.b	d0,d3
    5852:	move.b d0,d3
		move.l	a1,a2
    5854:	movea.l a1,a2
		sub.l	d3,a2
    5856:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5858:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    585a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    585c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    585e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5860:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5862:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5864:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5866:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5868:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    586a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    586c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    586e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5870:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5872:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5874:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5876:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5878:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    587a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    587c:	moveq #0,d0
		move.b	(a0)+,d0
    587e:	move.b (a0)+,d0
		add.w	d0,d0
    5880:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5882:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5886:	jmp (0,a3,d0.w)

0000588a <lz4Rts31>:
lz4Rts31:	rts
    588a:	rts

0000588c <ll_lm>:

ll_lm:
		moveq	#15,d1
    588c:	moveq #15,d1

0000588e <.cl32>:
.cl32:	move.b	(a0)+,d2
    588e:	/-> move.b (a0)+,d2
		add.l d2,d1
    5890:	|   add.l d2,d1
		not.b	d2
    5892:	|   not.b d2
		beq.s	.cl32
    5894:	\-- beq.s 588e <.cl32>
		moveq	#15,d5
    5896:	    moveq #15,d5
		and.w	d1,d5
    5898:	    and.w d1,d5
		add.w	d5,d5
    589a:	    add.w d5,d5
		neg.w	d5
    589c:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    589e:	    jmp (58c2 <.eloop33>,pc,d5.w)

000058a2 <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    58a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    58c0:	move.b (a0)+,(a1)+

000058c2 <.eloop33>:
.eloop33:	sub.l	d7,d1
    58c2:	sub.l d7,d1
		bpl.s	.tloop33
    58c4:	bpl.s 58a2 <.tloop33>
		cmpa.l	a0,a4
    58c6:	cmpa.l a0,a4
		beq.s	lz4Rts32
    58c8:	beq.s 591e <lz4Rts32>
		move.b	(a0)+,d0
    58ca:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    58cc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    58ce:	move.w (sp)+,d3
		move.b	d0,d3
    58d0:	move.b d0,d3
		move.l	a1,a2
    58d2:	movea.l a1,a2
		sub.l	d3,a2
    58d4:	suba.l d3,a2
		moveq	#15+4,d1
    58d6:	moveq #19,d1

000058d8 <.cl34>:
.cl34:	move.b	(a0)+,d2
    58d8:	/-> move.b (a0)+,d2
		add.l d2,d1
    58da:	|   add.l d2,d1
		not.b	d2
    58dc:	|   not.b d2
		beq.s	.cl34
    58de:	\-- beq.s 58d8 <.cl34>
		moveq	#15,d5
    58e0:	    moveq #15,d5
		and.w	d1,d5
    58e2:	    and.w d1,d5
		add.w	d5,d5
    58e4:	    add.w d5,d5
		neg.w	d5
    58e6:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    58e8:	    jmp (590c <.eloop35>,pc,d5.w)

000058ec <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    58ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    58fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5900:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5902:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5904:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5906:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5908:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    590a:	move.b (a2)+,(a1)+

0000590c <.eloop35>:
.eloop35:	sub.l	d7,d1
    590c:	sub.l d7,d1
		bpl.s	.tloop35
    590e:	bpl.s 58ec <.tloop35>
		moveq	#0,d0
    5910:	moveq #0,d0
		move.b	(a0)+,d0
    5912:	move.b (a0)+,d0
		add.w	d0,d0
    5914:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5916:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    591a:	jmp (0,a3,d0.w)

0000591e <lz4Rts32>:
lz4Rts32:				
			rts
    591e:	rts

00005920 <lz4Over>:

lz4Over:	rts
    5920:	rts

00005922 <lz4jmp>:
    5922:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    5924:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    5926:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    5928:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    592a:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    592c:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    592e:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    5930:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    5932:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    5934:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    5936:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    5938:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    593a:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    593c:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    593e:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    5940:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    5942:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    5944:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    5946:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    5948:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    594a:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    594c:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    594e:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    5950:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    5952:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    5954:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    5956:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    5958:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    595a:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    595c:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    595e:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    5960:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    5962:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    5964:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    5966:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    5968:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    596a:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    596c:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    596e:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    5970:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    5972:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    5974:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    5976:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    5978:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    597a:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    597c:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    597e:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    5980:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    5982:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    5984:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    5986:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    5988:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    598a:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    598c:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    598e:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    5990:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    5992:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    5994:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    5996:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    5998:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    599a:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    599c:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    599e:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    59a0:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    59a2:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    59a4:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    59a6:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    59a8:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    59aa:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    59ac:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    59ae:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    59b0:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    59b2:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    59b4:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    59b6:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    59b8:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    59ba:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    59bc:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    59be:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    59c0:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    59c2:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    59c4:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    59c6:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    59c8:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    59ca:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    59cc:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    59ce:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    59d0:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    59d2:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    59d4:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    59d6:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    59d8:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    59da:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    59dc:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    59de:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    59e0:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    59e2:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    59e4:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    59e6:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    59e8:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    59ea:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    59ec:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    59ee:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    59f0:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    59f2:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    59f4:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    59f6:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    59f8:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    59fa:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    59fc:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    59fe:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    5a00:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    5a02:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    5a04:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    5a06:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    5a08:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    5a0a:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    5a0c:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    5a0e:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    5a10:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    5a12:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    5a14:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    5a16:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    5a18:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    5a1a:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    5a1c:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    5a1e:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    5a20:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    5a22:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    5a24:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    5a26:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    5a28:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    5a2a:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    5a2c:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    5a2e:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    5a30:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    5a32:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    5a34:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    5a36:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    5a38:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    5a3a:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    5a3c:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    5a3e:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    5a40:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    5a42:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    5a44:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    5a46:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    5a48:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    5a4a:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    5a4c:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    5a4e:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    5a50:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    5a52:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    5a54:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    5a56:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    5a58:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    5a5a:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    5a5c:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    5a5e:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    5a60:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    5a62:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    5a64:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    5a66:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    5a68:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    5a6a:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    5a6c:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    5a6e:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    5a70:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    5a72:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    5a74:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    5a76:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    5a78:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    5a7a:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    5a7c:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    5a7e:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    5a80:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    5a82:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    5a84:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    5a86:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    5a88:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    5a8a:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    5a8c:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    5a8e:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    5a90:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    5a92:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    5a94:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    5a96:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    5a98:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    5a9a:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    5a9c:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    5a9e:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    5aa0:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    5aa2:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    5aa4:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    5aa6:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    5aa8:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    5aaa:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    5aac:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    5aae:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    5ab0:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    5ab2:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    5ab4:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    5ab6:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    5ab8:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    5aba:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    5abc:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    5abe:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    5ac0:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    5ac2:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    5ac4:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    5ac6:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    5ac8:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    5aca:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    5acc:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    5ace:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    5ad0:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    5ad2:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    5ad4:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    5ad6:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    5ad8:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    5ada:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    5adc:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    5ade:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    5ae0:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    5ae2:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    5ae4:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    5ae6:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    5ae8:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    5aea:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    5aec:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    5aee:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    5af0:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    5af2:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    5af4:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    5af6:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    5af8:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    5afa:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    5afc:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    5afe:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    5b00:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    5b02:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    5b04:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    5b06:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    5b08:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    5b0a:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    5b0c:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    5b0e:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    5b10:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    5b12:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    5b14:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    5b16:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    5b18:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    5b1a:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    5b1c:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    5b1e:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    5b20:	.short 0xff6a
