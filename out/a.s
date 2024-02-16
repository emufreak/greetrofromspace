
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
       4:	       move.l #278528,d3
       a:	       subi.l #278528,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #278528,d0
      18:	       cmpi.l #278528,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 44000 <debugpal>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #278528,d3
      38:	       subi.l #278528,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #278528,d0
      46:	       cmpi.l #278528,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 44000 <debugpal>,a2
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
      66:	                                                                      subq.l #8,sp
      68:	                                                                      movem.l d2-d7/a2-a6,-(sp)
	SysBase = *((struct ExecBase**)4UL);
      6c:	                                                                      movea.l 4 <_start+0x4>,a6
      70:	                                                                      move.l a6,89598 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                                      move.l #14675968,89594 <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                                      lea 3d1d7 <incbin_MercuryLetterData2Lz4_end+0x119>,a1
      86:	                                                                      moveq #0,d0
      88:	                                                                      jsr -552(a6)
      8c:	                                                                      move.l d0,89590 <GfxBase>
	if (!GfxBase)
      92:	               /----------------------------------------------------- beq.w 93c <main+0x8d6>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                                      movea.l 89598 <SysBase>,a6
      9c:	               |                                                      lea 3d1e8 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
      a2:	               |                                                      moveq #0,d0
      a4:	               |                                                      jsr -552(a6)
      a8:	               |                                                      move.l d0,8958c <DOSBase>
	if (!DOSBase)
      ae:	         /-----|----------------------------------------------------- beq.w 8d6 <main+0x870>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|----------------------------------------------------> pea 3d1f4 <incbin_MercuryLetterData2Lz4_end+0x136>
      b8:	         |  |  |                                                      lea 2582 <KPrintF>,a4
      be:	         |  |  |                                                      jsr (a4)
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      c0:	         |  |  |                                                      movea.l 8958c <DOSBase>,a6
      c6:	         |  |  |                                                      jsr -60(a6)
      ca:	         |  |  |                                                      movea.l 8958c <DOSBase>,a6
      d0:	         |  |  |                                                      move.l d0,d1
      d2:	         |  |  |                                                      move.l #250384,d2
      d8:	         |  |  |                                                      moveq #15,d3
      da:	         |  |  |                                                      jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                                      movea.l 8958c <DOSBase>,a6
      e4:	         |  |  |                                                      moveq #50,d1
      e6:	         |  |  |                                                      jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
      ea:	         |  |  |                                                      lea 65494 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      f0:	         |  |  |                                                      suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      f2:	         |  |  |                                                      suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
      f4:	         |  |  |                                                      lea 6b76 <incbin_player_start>,a3
		__asm volatile (
      fa:	         |  |  |                                                      movem.l d1-d7/a4-a6,-(sp)
      fe:	         |  |  |                                                      jsr (a3)
     100:	         |  |  |                                                      movem.l (sp)+,d1-d7/a4-a6

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     104:	         |  |  |                                                      addq.l #4,sp
     106:	         |  |  |                                                      tst.l d0
     108:	         |  |  |  /-------------------------------------------------- bne.w 854 <main+0x7ee>
	Forbid();
     10c:	         |  |  |  |  /----------------------------------------------> movea.l 89598 <SysBase>,a6
     112:	         |  |  |  |  |                                                jsr -132(a6)
	SystemADKCON=custom->adkconr;
     116:	         |  |  |  |  |                                                movea.l 89594 <custom>,a0
     11c:	         |  |  |  |  |                                                move.w 16(a0),d0
	SystemInts=custom->intenar;
     120:	         |  |  |  |  |                                                move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     124:	         |  |  |  |  |                                                move.w 2(a0),d0
	LoadView(0);
     128:	         |  |  |  |  |                                                movea.l 89590 <GfxBase>,a6
     12e:	         |  |  |  |  |                                                suba.l a1,a1
     130:	         |  |  |  |  |                                                jsr -222(a6)
	WaitTOF();
     134:	         |  |  |  |  |                                                movea.l 89590 <GfxBase>,a6
     13a:	         |  |  |  |  |                                                jsr -270(a6)
	WaitTOF();
     13e:	         |  |  |  |  |                                                movea.l 89590 <GfxBase>,a6
     144:	         |  |  |  |  |                                                jsr -270(a6)
	WaitVbl();
     148:	         |  |  |  |  |                                                lea c06 <WaitVbl>,a2
     14e:	         |  |  |  |  |                                                jsr (a2)
	WaitVbl();
     150:	         |  |  |  |  |                                                jsr (a2)
	OwnBlitter();
     152:	         |  |  |  |  |                                                movea.l 89590 <GfxBase>,a6
     158:	         |  |  |  |  |                                                jsr -456(a6)
	WaitBlit();	
     15c:	         |  |  |  |  |                                                movea.l 89590 <GfxBase>,a6
     162:	         |  |  |  |  |                                                jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     166:	         |  |  |  |  |                                                movea.l 89594 <custom>,a0
     16c:	         |  |  |  |  |                                                move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     172:	         |  |  |  |  |                                                move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     178:	         |  |  |  |  |                                                move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     17e:	         |  |  |  |  |                                                moveq #0,d1
		custom->color[a]=0;
     180:	         |  |  |  |  |  /-------------------------------------------> move.l d1,d0
     182:	         |  |  |  |  |  |                                             addi.l #192,d0
     188:	         |  |  |  |  |  |                                             add.l d0,d0
     18a:	         |  |  |  |  |  |                                             move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     190:	         |  |  |  |  |  |                                             addq.l #1,d1
     192:	         |  |  |  |  |  |                                             moveq #32,d0
     194:	         |  |  |  |  |  |                                             cmp.l d1,d0
     196:	         |  |  |  |  |  +-------------------------------------------- bne.s 180 <main+0x11a>
	WaitVbl();
     198:	         |  |  |  |  |  |                                             jsr (a2)
	WaitVbl();
     19a:	         |  |  |  |  |  |                                             jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     19c:	         |  |  |  |  |  |                                             move.w #20090,46(sp)
     1a2:	         |  |  |  |  |  |                                             move.w #2049,48(sp)
     1a8:	         |  |  |  |  |  |                                             move.w #20083,50(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     1ae:	         |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     1b4:	         |  |  |  |  |  |                                             btst #0,297(a6)
     1ba:	/--------|--|--|--|--|--|-------------------------------------------- beq.w b94 <main+0xb2e>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1be:	|        |  |  |  |  |  |                                             moveq #46,d7
     1c0:	|        |  |  |  |  |  |                                             add.l sp,d7
     1c2:	|        |  |  |  |  |  |                                             exg d7,a5
     1c4:	|        |  |  |  |  |  |                                             jsr -30(a6)
     1c8:	|        |  |  |  |  |  |                                             exg d7,a5
	VBR=GetVBR();
     1ca:	|        |  |  |  |  |  |                                             move.l d0,8947e <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1d0:	|        |  |  |  |  |  |                                             movea.l 8947e <VBR>,a0
     1d6:	|        |  |  |  |  |  |                                             move.l 108(a0),d0
		KPrintF("p61Init failed!\n");
#endif
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     1da:	|        |  |  |  |  |  |                                             jsr (a2)

	Sw_PrepareDisplay();
     1dc:	|        |  |  |  |  |  |                                             jsr 4cea <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     1e2:	|        |  |  |  |  |  |                                             movea.l 89594 <custom>,a0
     1e8:	|        |  |  |  |  |  |                                             move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     1ee:	|        |  |  |  |  |  |                                             move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
     1f4:	|        |  |  |  |  |  |                                             lea cc6 <Sw_Run>,a3
     1fa:	|        |  |  |  |  |  |                                             tst.w 8958a <SwScrollerFinished>
     200:	|  /-----|--|--|--|--|--|-------------------------------------------- bne.s 20c <main+0x1a6>
		Sw_Run();
     202:	|  |  /--|--|--|--|--|--|-------------------------------------------> jsr (a3)
	while(SwScrollerFinished == 0) {
     204:	|  |  |  |  |  |  |  |  |                                             tst.w 8958a <SwScrollerFinished>
     20a:	|  |  +--|--|--|--|--|--|-------------------------------------------- beq.s 202 <main+0x19c>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     20c:	|  >--|--|--|--|--|--|--|-------------------------------------------> movea.l 89598 <SysBase>,a6
     212:	|  |  |  |  |  |  |  |  |                                             movea.l 89492 <Sw_ScreenBuffer1>,a1
     218:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     21e:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     222:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     228:	|  |  |  |  |  |  |  |  |                                             movea.l 8948e <Sw_ScreenBuffer2>,a1
     22e:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     234:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer3, BPLSIZE*BPLDEPTH);
     238:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     23e:	|  |  |  |  |  |  |  |  |                                             movea.l 8948a <Sw_ScreenBuffer3>,a1
     244:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     24a:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     24e:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     254:	|  |  |  |  |  |  |  |  |                                             movea.l 89486 <Sw_FontBuffer>,a1
     25a:	|  |  |  |  |  |  |  |  |                                             move.l #4000,d0
     260:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_font, 38000);
     264:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     26a:	|  |  |  |  |  |  |  |  |                                             lea 6e486 <incbin_Sw_font_start>,a1
     270:	|  |  |  |  |  |  |  |  |                                             move.l #38000,d0
     276:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  RemIntServer( INTB_COPER, Sw_Vbint);
     27a:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     280:	|  |  |  |  |  |  |  |  |                                             moveq #4,d0
     282:	|  |  |  |  |  |  |  |  |                                             movea.l 89482 <Sw_Vbint>,a1
     288:	|  |  |  |  |  |  |  |  |                                             jsr -174(a6)
	}
	Sw_Cleanup();

	WaitBlit();
     28c:	|  |  |  |  |  |  |  |  |                                             movea.l 89590 <GfxBase>,a6
     292:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
		
	custom->dmacon = 0x83ff;
     296:	|  |  |  |  |  |  |  |  |                                             movea.l 89594 <custom>,a0
     29c:	|  |  |  |  |  |  |  |  |                                             move.w #-31745,150(a0)
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     2a2:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     2a8:	|  |  |  |  |  |  |  |  |                                             moveq #22,d0
     2aa:	|  |  |  |  |  |  |  |  |                                             move.l #65537,d1
     2b0:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2b4:	|  |  |  |  |  |  |  |  |                                             movea.l d0,a1
     2b6:	|  |  |  |  |  |  |  |  |                                             move.l d0,89562 <Vbint>
     2bc:	|  |  |  |  |  |  |  |  |                                         /-- beq.s 2d8 <main+0x272>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     2be:	|  |  |  |  |  |  |  |  |                                         |   move.w #708,8(a1)
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
     2c4:	|  |  |  |  |  |  |  |  |                                         |   move.l #250156,10(a1)
    Vbint->is_Data = NULL;
     2cc:	|  |  |  |  |  |  |  |  |                                         |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     2d0:	|  |  |  |  |  |  |  |  |                                         |   move.l #3182,18(a1)
  }

  AddIntServer( INTB_VERTB, Vbint); 
     2d8:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89598 <SysBase>,a6
     2de:	|  |  |  |  |  |  |  |  |                                             moveq #5,d0
     2e0:	|  |  |  |  |  |  |  |  |                                             jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     2e4:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     2ea:	|  |  |  |  |  |  |  |  |                                             move.l #25000,d0
     2f0:	|  |  |  |  |  |  |  |  |                                             moveq #0,d1
     2f2:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2f6:	|  |  |  |  |  |  |  |  |                                             move.l d0,89582 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     2fc:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     302:	|  |  |  |  |  |  |  |  |                                             move.l #120000,d0
     308:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     30a:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     30e:	|  |  |  |  |  |  |  |  |                                             move.l d0,8957e <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     314:	|  |  |  |  |  |  |  |  |                                             pea 3 <_start+0x3>
     318:	|  |  |  |  |  |  |  |  |                                             pea 2710 <DrawRect+0x11c>
     31c:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     31e:	|  |  |  |  |  |  |  |  |                                             lea c92 <Utils_FillLong.constprop.0>,a3
     324:	|  |  |  |  |  |  |  |  |                                             jsr (a3)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     326:	|  |  |  |  |  |  |  |  |                                             movea.l 89590 <GfxBase>,a6
     32c:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     330:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff044 <_end+0xd75aa8>
  custom->bltalwm = 0xffff; //Static
     338:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff046 <_end+0xd75aaa>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     340:	|  |  |  |  |  |  |  |  |                                             move.l 8957e <LineBuffer>,d5
  for( WORD i=0;i <=5;i++) {
     346:	|  |  |  |  |  |  |  |  |                                             movea.l d5,a1
     348:	|  |  |  |  |  |  |  |  |                                             lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     34c:	|  |  |  |  |  |  |  |  |                                             moveq #0,d6
  for( WORD i=0;i <=5;i++) {
     34e:	|  |  |  |  |  |  |  |  |                                             clr.w d4
      data = data >> i2;
     350:	|  |  |  |  |  |  |  |  |                                             moveq #0,d3
     352:	|  |  |  |  |  |  |  |  |                                             not.w d3
	APTR vbr = 0;
     354:	|  |  |  |  |  |  |  |  |                                             movea.l a1,a0
     356:	|  |  |  |  |  |  |  |  |                                             moveq #1,d1
     358:	|  |  |  |  |  |  |  |  |                                   /-------> move.l d3,d2
     35a:	|  |  |  |  |  |  |  |  |                                   |         asr.l d1,d2
      data = data ^ 0xffff;
     35c:	|  |  |  |  |  |  |  |  |                                   |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     35e:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     364:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd75a66>,d0
     36a:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     36e:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 364 <main+0x2fe>
  custom->bltcon0 = 0x01f0;
     370:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0;
     378:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd75aa6>
  custom->bltadat = data;
     380:	|  |  |  |  |  |  |  |  |                                   |         move.w d2,dff074 <_end+0xd75ad8>
  custom->bltdpt = Target;  
     386:	|  |  |  |  |  |  |  |  |                                   |         move.l a0,dff054 <_end+0xd75ab8>
  custom->bltdmod = mod;
     38c:	|  |  |  |  |  |  |  |  |                                   |         move.w #10,dff066 <_end+0xd75aca>
  custom->bltsize = lines*64+linelength;
     394:	|  |  |  |  |  |  |  |  |                                   |         move.w #6401,dff058 <_end+0xd75abc>
    for( WORD i2=1;i2<=16; i2++) {        
     39c:	|  |  |  |  |  |  |  |  |                                   |         addq.l #1,d1
     39e:	|  |  |  |  |  |  |  |  |                                   |         lea 1200(a0),a0
     3a2:	|  |  |  |  |  |  |  |  |                                   |         moveq #17,d0
     3a4:	|  |  |  |  |  |  |  |  |                                   |         cmp.l d1,d0
     3a6:	|  |  |  |  |  |  |  |  |                                   +-------- bne.s 358 <main+0x2f2>
    if( i > 0) {
     3a8:	|  |  |  |  |  |  |  |  |                                   |         tst.w d4
     3aa:	|  |  |  |  |  |  |  |  |                                   |     /-- bne.s 3c0 <main+0x35a>
    startbuffer += repeats*linesize*2*16;
     3ac:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     3b2:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     3b6:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     3b8:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d4
     3ba:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     3bc:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     3be:	|  |  |  |  |  |  |  |  |                                   +-----|-- bra.s 358 <main+0x2f2>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     3c0:	|  |  |  |  |  |  |  |  |                                   |     \-> moveq #12,d0
     3c2:	|  |  |  |  |  |  |  |  |                                   |         sub.w d6,d0
     3c4:	|  |  |  |  |  |  |  |  |                                   |         movea.w d0,a0
     3c6:	|  |  |  |  |  |  |  |  |                                   |         movea.w d4,a5
     3c8:	|  |  |  |  |  |  |  |  |                                   |         lea -32768(a5),a5
     3cc:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d1
     3ce:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d2
     3d0:	|  |  |  |  |  |  |  |  |                                   |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     3d6:	|  |  |  |  |  |  |  |  |                                   |  /----> move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3dc:	|  |  |  |  |  |  |  |  |                                   |  |  /-> move.w dff002 <_end+0xd75a66>,d0
     3e2:	|  |  |  |  |  |  |  |  |                                   |  |  |   btst #14,d0
     3e6:	|  |  |  |  |  |  |  |  |                                   |  |  \-- bne.s 3dc <main+0x376>
  custom->bltcon0 = 0x01f0;
     3e8:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #496,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0;
     3f0:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #0,dff042 <_end+0xd75aa6>
  custom->bltadat = data;
     3f8:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #-1,dff074 <_end+0xd75ad8>
  custom->bltdpt = Target;  
     400:	|  |  |  |  |  |  |  |  |                                   |  |      move.l d1,dff054 <_end+0xd75ab8>
  custom->bltdmod = mod;
     406:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a0,dff066 <_end+0xd75aca>
  custom->bltsize = lines*64+linelength;
     40c:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a5,dff058 <_end+0xd75abc>
      while( height > 512) {
     412:	|  |  |  |  |  |  |  |  |                                   |  |      addi.l #6144,d1
     418:	|  |  |  |  |  |  |  |  |                                   |  |      cmp.l d2,d1
     41a:	|  |  |  |  |  |  |  |  |                                   |  \----- bne.s 3d6 <main+0x370>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     41c:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     422:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd75a66>,d0
     428:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     42c:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 422 <main+0x3bc>
  custom->bltcon0 = 0x01f0;
     42e:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0;
     436:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd75aa6>
  custom->bltadat = data;
     43e:	|  |  |  |  |  |  |  |  |                                   |         move.w #-1,dff074 <_end+0xd75ad8>
  custom->bltdpt = Target;  
     446:	|  |  |  |  |  |  |  |  |                                   |         move.l d1,dff054 <_end+0xd75ab8>
  custom->bltdmod = mod;
     44c:	|  |  |  |  |  |  |  |  |                                   |         move.w a0,dff066 <_end+0xd75aca>
  custom->bltsize = lines*64+linelength;
     452:	|  |  |  |  |  |  |  |  |                                   |         move.w d4,d0
     454:	|  |  |  |  |  |  |  |  |                                   |         addi.w #4096,d0
     458:	|  |  |  |  |  |  |  |  |                                   |         move.w d0,dff058 <_end+0xd75abc>
  for( WORD i=0;i <=5;i++) {
     45e:	|  |  |  |  |  |  |  |  |                                   |         addi.w #-4095,d0
     462:	|  |  |  |  |  |  |  |  |                                   |         cmpi.w #5,d4
     466:	|  |  |  |  |  |  |  |  |                                   |     /-- beq.s 47e <main+0x418>
    startbuffer += repeats*linesize*2*16;
     468:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     46e:	|  |  |  |  |  |  |  |  |                                   |     |   move.w d0,d4
     470:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     474:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     476:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     478:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     47a:	|  |  |  |  |  |  |  |  |                                   \-----|-- bra.w 358 <main+0x2f2>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     47e:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89598 <SysBase>,a6
     484:	|  |  |  |  |  |  |  |  |                                             move.l #33024,d0
     48a:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     48c:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     490:	|  |  |  |  |  |  |  |  |                                             move.l d0,d2
     492:	|  |  |  |  |  |  |  |  |                                             move.l d0,8957a <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     498:	|  |  |  |  |  |  |  |  |                                             pea 10 <_start+0x10>
     49c:	|  |  |  |  |  |  |  |  |                                             pea 204 <main+0x19e>
     4a0:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     4a2:	|  |  |  |  |  |  |  |  |                                             jsr (a3)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     4a4:	|  |  |  |  |  |  |  |  |                                             pea 2 <_start+0x2>
     4a8:	|  |  |  |  |  |  |  |  |                                             pea 100 <main+0x9a>
     4ac:	|  |  |  |  |  |  |  |  |                                             pea 3d231 <incbin_MercuryLetterData2Lz4_end+0x173>
     4b2:	|  |  |  |  |  |  |  |  |                                             move.l d2,-(sp)
     4b4:	|  |  |  |  |  |  |  |  |                                             lea 446c <debug_register_bitmap.constprop.0>,a5
     4ba:	|  |  |  |  |  |  |  |  |                                             jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4bc:	|  |  |  |  |  |  |  |  |                                             movea.l 89598 <SysBase>,a6
     4c2:	|  |  |  |  |  |  |  |  |                                             move.l #49536,d0
     4c8:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     4ca:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     4ce:	|  |  |  |  |  |  |  |  |                                             move.l d0,89576 <Bitmap1>
  if(Bitmap1 == 0) {
     4d4:	|  |  |  |  |  |  |  |  |                                             lea 28(sp),sp
     4d8:	|  |  |  |  |  |  |  |  |        /----------------------------------- beq.w b0a <main+0xaa4>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     4dc:	|  |  |  |  |  |  |  |  |        |                                    pea 3 <_start+0x3>
     4e0:	|  |  |  |  |  |  |  |  |        |                                    pea 100 <main+0x9a>
     4e4:	|  |  |  |  |  |  |  |  |        |                                    pea 3d262 <incbin_MercuryLetterData2Lz4_end+0x1a4>
     4ea:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,-(sp)
     4ec:	|  |  |  |  |  |  |  |  |        |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     4ee:	|  |  |  |  |  |  |  |  |        |                                    move.l 89576 <Bitmap1>,d2
     4f4:	|  |  |  |  |  |  |  |  |        |                                    pea 10 <_start+0x10>
     4f8:	|  |  |  |  |  |  |  |  |        |                                    pea 306 <main+0x2a0>
     4fc:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,-(sp)
     4fe:	|  |  |  |  |  |  |  |  |        |                                    jsr (a3)

  ScreenBuffer1.BitPlane = Bitmap1;
     500:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,8952a <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     506:	|  |  |  |  |  |  |  |  |        |                                    clr.l 8952e <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     50c:	|  |  |  |  |  |  |  |  |        |                                    clr.l 8953a <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     512:	|  |  |  |  |  |  |  |  |        |                                    movea.l 89598 <SysBase>,a6
     518:	|  |  |  |  |  |  |  |  |        |                                    move.l #49536,d0
     51e:	|  |  |  |  |  |  |  |  |        |                                    moveq #2,d1
     520:	|  |  |  |  |  |  |  |  |        |                                    jsr -198(a6)
     524:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,89572 <Bitmap2>
  if(Bitmap2 == 0) {
     52a:	|  |  |  |  |  |  |  |  |        |                                    lea 28(sp),sp
     52e:	|  |  |  |  |  |  |  |  |  /-----|----------------------------------- beq.w a80 <main+0xa1a>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     532:	|  |  |  |  |  |  |  |  |  |  /--|----------------------------------> pea 3 <_start+0x3>
     536:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     53a:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 3d293 <incbin_MercuryLetterData2Lz4_end+0x1d5>
     540:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     542:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     544:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l 89572 <Bitmap2>,d2
     54a:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     54e:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 306 <main+0x2a0>
     552:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     554:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a3)

  ScreenBuffer2.BitPlane = Bitmap2;
     556:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,894f2 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     55c:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 894f6 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     562:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 89502 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     568:	|  |  |  |  |  |  |  |  |  |  |  |                                    movea.l 89598 <SysBase>,a6
     56e:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     574:	|  |  |  |  |  |  |  |  |  |  |  |                                    moveq #2,d1
     576:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     57a:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,8956e <Bitmap3>
  if(Bitmap3 == 0) {
     580:	|  |  |  |  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     584:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------------------- beq.w 968 <main+0x902>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     588:	|  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------------> pea 3 <_start+0x3>
     58c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 100 <main+0x9a>
     590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 3d2c4 <incbin_MercuryLetterData2Lz4_end+0x206>
     596:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,-(sp)
     598:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     59a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l 8956e <Bitmap3>,d2
     5a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 10 <_start+0x10>
     5a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 306 <main+0x2a0>
     5a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,-(sp)
     5aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)

  ScreenBuffer3.BitPlane = Bitmap3;
     5ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 894ba <ScreenBuffer3>,a3
     5b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     5b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 894be <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     5ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 894ca <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     5c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 2186 <Clbuild>,a5
     5c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d2
  DrawCopper = Clbuild( );
     5ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d3
     5ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,8956a <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     5d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562474,89496 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     5de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562418,8949a <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     5e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,8949e <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     5ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,894a2 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     5f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562474,894a6 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     5fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562418,894aa <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     608:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562418,894ae <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,894b2 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     618:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #562474,894b6 <ScreenBufferList+0x20>

  SetBplPointers(); 
     622:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 24e6 <SetBplPointers>,a3
     628:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     62a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,8956a <DrawCopper>
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
     630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,dff080 <_end+0xd75ae4>
	PrepareDisplay();	
	custom->intena=0xc020;//Enable vblank
     636:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              movea.l 89594 <custom>,a0
     63c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
     642:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)
  DrawCopper = ViewCopper;
     644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,8956a <DrawCopper>
  ViewCopper = tmp;
     64a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,89566 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,dff080 <_end+0xd75ae4>
	//LoadVectors();
	SwapCl();
	WaitVbl();	
     656:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)

	while( CubeFinished == 0) {		
     658:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 28(sp),sp
     65c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 50ae <DrawScreen>,a5
     662:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              tst.w 89586 <CubeFinished>
     668:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------------------- bne.s 6e2 <main+0x67c>
		DrawScreen();
     66a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------> jsr (a5)
		SetBplPointers();
     66c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a3)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     66e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w f0ff60 <_end+0xe869c4>,d0
     674:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        cmpi.w #20153,d0
     678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-------------- beq.w 828 <main+0x7c2>
     67c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |               cmpi.w #-24562,d0
     680:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        +-------------- beq.w 828 <main+0x7c2>
		debug_start_idle();
		while(FrameCounter<2);
     684:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-------------> move.w 89588 <FrameCounter>,d0
     68a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               cmpi.w #1,d0
     68e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-------------- bls.s 684 <main+0x61e>
		if(FrameCounter >= 3) {
     690:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-------------> move.w 89588 <FrameCounter>,d0
     696:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #2,d0
     69a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----- bhi.w 7c4 <main+0x75e>
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
     69e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w #0,89588 <FrameCounter>
		WaitVbl();
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      jsr (a2)
     6a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w f0ff60 <_end+0xe869c4>,d0
     6ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      cmpi.w #20153,d0
     6b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----- beq.w 7e6 <main+0x780>
     6b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|----> cmpi.w #-24562,d0
     6ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- beq.w 7e6 <main+0x780>
  UBYTE *tmp = DrawCopper;
     6be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 8956a <DrawCopper>,d0
  DrawCopper = ViewCopper;
     6c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 89566 <ViewCopper>,8956a <DrawCopper>
  ViewCopper = tmp;
     6ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,89566 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     6d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,dff080 <_end+0xd75ae4>
	while( CubeFinished == 0) {		
     6da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w 89586 <CubeFinished>
     6e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|----- beq.s 66a <main+0x604>
  FreeMem(WorkingMem, 25000);
     6e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|----> movea.l 89598 <SysBase>,a6
     6e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89582 <WorkingMem>,a1
     6ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #25000,d0
     6f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
     6f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     6fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 8957e <LineBuffer>,a1
     704:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #120000,d0
     70a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
     70e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     714:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 8957a <PrepareBuffer>,a1
     71a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #33024,d0
     720:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
     724:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     72a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89576 <Bitmap1>,a1
     730:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     736:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
     73a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     740:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89572 <Bitmap2>,a1
     746:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     74c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
     750:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     756:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 8956e <Bitmap3>,a1
     75c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     762:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
     766:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     76c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 8956a <DrawCopper>,a1
     772:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     778:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
     77c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     782:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89566 <ViewCopper>,a1
     788:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     78e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
     792:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
     798:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #5,d0
     79a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89562 <Vbint>,a1
     7a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -174(a6)
		debug_stop_idle();
		SwapCl();
	}

	CleanUp( );
	WaitVbl();
     7a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr (a2)
	custom->dmacon = 0x83ff;
     7a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89594 <custom>,a0
     7ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     7b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-8160,154(a0)
	
	End_PrepareDisplay();
     7b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr 4a88 <End_PrepareDisplay.isra.0>

	while(1) {
		WaitVbl();
     7be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> jsr (a2)
     7c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a2)
	while(1) {
     7c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-- bra.s 7be <main+0x758>
    		KPrintF("Framerate below 25FPS\n");
     7c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> pea 3d2d0 <incbin_MercuryLetterData2Lz4_end+0x212>
     7ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a4)
     7cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.l #4,sp
		FrameCounter = 0;
     7ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #0,89588 <FrameCounter>
		WaitVbl();
     7d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a2)
     7d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w f0ff60 <_end+0xe869c4>,d0
     7de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #20153,d0
     7e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- bne.w 6b6 <main+0x650>
		UaeLib(88, arg1, arg2, arg3, arg4);
     7e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> clr.l -(sp)
     7e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 5 <_start+0x5>
     7f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 58 <_start+0x58>
     7f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jsr f0ff60 <_end+0xe869c4>
	}
}
     7fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     7fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 8956a <DrawCopper>,d0
  DrawCopper = ViewCopper;
     804:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 89566 <ViewCopper>,8956a <DrawCopper>
  ViewCopper = tmp;
     80e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,89566 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     814:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,dff080 <_end+0xd75ae4>
	while( CubeFinished == 0) {		
     81a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               tst.w 89586 <CubeFinished>
     820:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|-------------- beq.w 66a <main+0x604>
     824:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-------------- bra.w 6e2 <main+0x67c>
		UaeLib(88, arg1, arg2, arg3, arg4);
     828:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------------> clr.l -(sp)
     82a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  clr.l -(sp)
     82c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 1 <_start+0x1>
     830:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 5 <_start+0x5>
     834:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 58 <_start+0x58>
     838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  jsr f0ff60 <_end+0xe869c4>
}
     83e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  lea 20(sp),sp
		while(FrameCounter<2);
     842:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  move.w 89588 <FrameCounter>,d0
     848:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  cmpi.w #1,d0
     84c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|----------------- bls.w 684 <main+0x61e>
     850:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \----------------- bra.w 690 <main+0x62a>
		KPrintF("p61Init failed!\n");
     854:	|  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|----------------------> pea 3d220 <incbin_MercuryLetterData2Lz4_end+0x162>
     85a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a4)
     85c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        addq.l #4,sp
	Forbid();
     85e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89598 <SysBase>,a6
     864:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -132(a6)
	SystemADKCON=custom->adkconr;
     868:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89594 <custom>,a0
     86e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 16(a0),d0
	SystemInts=custom->intenar;
     872:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     876:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 2(a0),d0
	LoadView(0);
     87a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89590 <GfxBase>,a6
     880:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        suba.l a1,a1
     882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -222(a6)
	WaitTOF();
     886:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89590 <GfxBase>,a6
     88c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitTOF();
     890:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89590 <GfxBase>,a6
     896:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitVbl();
     89a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        lea c06 <WaitVbl>,a2
     8a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	WaitVbl();
     8a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	OwnBlitter();
     8a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89590 <GfxBase>,a6
     8aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -456(a6)
	WaitBlit();	
     8ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89590 <GfxBase>,a6
     8b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     8b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89594 <custom>,a0
     8be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     8c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     8ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     8d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        moveq #0,d1
     8d2:	|  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|----------------------- bra.w 180 <main+0x11a>
		Exit(0);
     8d6:	|  |  |  >--|--|--|--|-----|--|--|--|--|--|--|----------------------> suba.l a6,a6
     8d8:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #0,d1
     8da:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     8de:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        pea 3d1f4 <incbin_MercuryLetterData2Lz4_end+0x136>
     8e4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 2582 <KPrintF>,a4
     8ea:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a4)
	Write(Output(), (APTR)"Hello console!\n", 15);
     8ec:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 8958c <DOSBase>,a6
     8f2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -60(a6)
     8f6:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 8958c <DOSBase>,a6
     8fc:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l d0,d1
     8fe:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l #250384,d2
     904:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #15,d3
     906:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -48(a6)
	Delay(50);
     90a:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 8958c <DOSBase>,a6
     910:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #50,d1
     912:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
     916:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 65494 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     91c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     91e:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     920:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 6b76 <incbin_player_start>,a3
		__asm volatile (
     926:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l d1-d7/a4-a6,-(sp)
     92a:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a3)
     92c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l (sp)+,d1-d7/a4-a6
	if(p61Init(module) != 0)
     930:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        addq.l #4,sp
     932:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        tst.l d0
     934:	|  |  |  |  |  |  |  \-----|--|--|--|--|--|--|----------------------- beq.w 10c <main+0xa6>
     938:	|  |  |  |  |  |  \--------|--|--|--|--|--|--|----------------------- bra.w 854 <main+0x7ee>
		Exit(0);
     93c:	|  |  |  |  |  \-----------|--|--|--|--|--|--|----------------------> movea.l 8958c <DOSBase>,a6
     942:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d1
     944:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     948:	|  |  |  |  |              |  |  |  |  |  |  |                        movea.l 89598 <SysBase>,a6
     94e:	|  |  |  |  |              |  |  |  |  |  |  |                        lea 3d1e8 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
     954:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d0
     956:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -552(a6)
     95a:	|  |  |  |  |              |  |  |  |  |  |  |                        move.l d0,8958c <DOSBase>
	if (!DOSBase)
     960:	|  |  |  |  \--------------|--|--|--|--|--|--|----------------------- bne.w b2 <main+0x4c>
     964:	|  |  |  \-----------------|--|--|--|--|--|--|----------------------- bra.w 8d6 <main+0x870>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     968:	|  |  |                    |  |  |  >--|--|--|----------------------> movea.l 8958c <DOSBase>,a6
     96e:	|  |  |                    |  |  |  |  |  |  |                        jsr -60(a6)
     972:	|  |  |                    |  |  |  |  |  |  |                        movea.l 8958c <DOSBase>,a6
     978:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d1
     97a:	|  |  |                    |  |  |  |  |  |  |                        move.l #250527,d2
     980:	|  |  |                    |  |  |  |  |  |  |                        moveq #38,d3
     982:	|  |  |                    |  |  |  |  |  |  |                        jsr -48(a6)
    Exit(1);
     986:	|  |  |                    |  |  |  |  |  |  |                        movea.l 8958c <DOSBase>,a6
     98c:	|  |  |                    |  |  |  |  |  |  |                        moveq #1,d1
     98e:	|  |  |                    |  |  |  |  |  |  |                        jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     992:	|  |  |                    |  |  |  |  |  |  |                        move.l 8956e <Bitmap3>,d0
     998:	|  |  |                    |  |  |  |  |  |  |                        pea 3 <_start+0x3>
     99c:	|  |  |                    |  |  |  |  |  |  |                        pea 100 <main+0x9a>
     9a0:	|  |  |                    |  |  |  |  |  |  |                        pea 3d2c4 <incbin_MercuryLetterData2Lz4_end+0x206>
     9a6:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,-(sp)
     9a8:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     9aa:	|  |  |                    |  |  |  |  |  |  |                        move.l 8956e <Bitmap3>,d2
     9b0:	|  |  |                    |  |  |  |  |  |  |                        pea 10 <_start+0x10>
     9b4:	|  |  |                    |  |  |  |  |  |  |                        pea 306 <main+0x2a0>
     9b8:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,-(sp)
     9ba:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  ScreenBuffer3.BitPlane = Bitmap3;
     9bc:	|  |  |                    |  |  |  |  |  |  |                        lea 894ba <ScreenBuffer3>,a3
     9c2:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     9c4:	|  |  |                    |  |  |  |  |  |  |                        clr.l 894be <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     9ca:	|  |  |                    |  |  |  |  |  |  |                        clr.l 894ca <ScreenBuffer3+0x10>
  ViewCopper = Clbuild( );
     9d0:	|  |  |                    |  |  |  |  |  |  |                        lea 2186 <Clbuild>,a5
     9d6:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9d8:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d2
  DrawCopper = Clbuild( );
     9da:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9dc:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d3
     9de:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,8956a <DrawCopper>
  ScreenBufferList[0] = &ScreenBuffer1;
     9e4:	|  |  |                    |  |  |  |  |  |  |                        move.l #562474,89496 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     9ee:	|  |  |                    |  |  |  |  |  |  |                        move.l #562418,8949a <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     9f8:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,8949e <ScreenBufferList+0x8>
  ScreenBufferList[3] = &ScreenBuffer3;
     9fe:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,894a2 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     a04:	|  |  |                    |  |  |  |  |  |  |                        move.l #562474,894a6 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     a0e:	|  |  |                    |  |  |  |  |  |  |                        move.l #562418,894aa <ScreenBufferList+0x14>
  ScreenBufferList[6] = &ScreenBuffer2;
     a18:	|  |  |                    |  |  |  |  |  |  |                        move.l #562418,894ae <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     a22:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,894b2 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     a28:	|  |  |                    |  |  |  |  |  |  |                        move.l #562474,894b6 <ScreenBufferList+0x20>
  SetBplPointers(); 
     a32:	|  |  |                    |  |  |  |  |  |  |                        lea 24e6 <SetBplPointers>,a3
     a38:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  DrawCopper = ViewCopper;
     a3a:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,8956a <DrawCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a40:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,dff080 <_end+0xd75ae4>
	custom->intena=0xc020;//Enable vblank
     a46:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89594 <custom>,a0
     a4c:	|  |  |                    |  |  |  |  |  |  |                        move.w #-16352,154(a0)
	SetBplPointers();
     a52:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  DrawCopper = ViewCopper;
     a54:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,8956a <DrawCopper>
  ViewCopper = tmp;
     a5a:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,89566 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a60:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,dff080 <_end+0xd75ae4>
	WaitVbl();	
     a66:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
	while( CubeFinished == 0) {		
     a68:	|  |  |                    |  |  |  |  |  |  |                        lea 28(sp),sp
     a6c:	|  |  |                    |  |  |  |  |  |  |                        lea 50ae <DrawScreen>,a5
     a72:	|  |  |                    |  |  |  |  |  |  |                        tst.w 89586 <CubeFinished>
     a78:	|  |  |                    |  |  |  |  |  |  \----------------------- beq.w 66a <main+0x604>
     a7c:	|  |  |                    |  |  |  |  |  \-------------------------- bra.w 6e2 <main+0x67c>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     a80:	|  |  |                    >--|--|--|--|----------------------------> movea.l 8958c <DOSBase>,a6
     a86:	|  |  |                    |  |  |  |  |                              jsr -60(a6)
     a8a:	|  |  |                    |  |  |  |  |                              movea.l 8958c <DOSBase>,a6
     a90:	|  |  |                    |  |  |  |  |                              move.l d0,d1
     a92:	|  |  |                    |  |  |  |  |                              move.l #250478,d2
     a98:	|  |  |                    |  |  |  |  |                              moveq #38,d3
     a9a:	|  |  |                    |  |  |  |  |                              jsr -48(a6)
    Exit(1);
     a9e:	|  |  |                    |  |  |  |  |                              movea.l 8958c <DOSBase>,a6
     aa4:	|  |  |                    |  |  |  |  |                              moveq #1,d1
     aa6:	|  |  |                    |  |  |  |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     aaa:	|  |  |                    |  |  |  |  |                              move.l 89572 <Bitmap2>,d0
     ab0:	|  |  |                    |  |  |  |  |                              pea 3 <_start+0x3>
     ab4:	|  |  |                    |  |  |  |  |                              pea 100 <main+0x9a>
     ab8:	|  |  |                    |  |  |  |  |                              pea 3d293 <incbin_MercuryLetterData2Lz4_end+0x1d5>
     abe:	|  |  |                    |  |  |  |  |                              move.l d0,-(sp)
     ac0:	|  |  |                    |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     ac2:	|  |  |                    |  |  |  |  |                              move.l 89572 <Bitmap2>,d2
     ac8:	|  |  |                    |  |  |  |  |                              pea 10 <_start+0x10>
     acc:	|  |  |                    |  |  |  |  |                              pea 306 <main+0x2a0>
     ad0:	|  |  |                    |  |  |  |  |                              move.l d2,-(sp)
     ad2:	|  |  |                    |  |  |  |  |                              jsr (a3)
  ScreenBuffer2.BitPlane = Bitmap2;
     ad4:	|  |  |                    |  |  |  |  |                              move.l d2,894f2 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     ada:	|  |  |                    |  |  |  |  |                              clr.l 894f6 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     ae0:	|  |  |                    |  |  |  |  |                              clr.l 89502 <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     ae6:	|  |  |                    |  |  |  |  |                              movea.l 89598 <SysBase>,a6
     aec:	|  |  |                    |  |  |  |  |                              move.l #49536,d0
     af2:	|  |  |                    |  |  |  |  |                              moveq #2,d1
     af4:	|  |  |                    |  |  |  |  |                              jsr -198(a6)
     af8:	|  |  |                    |  |  |  |  |                              move.l d0,8956e <Bitmap3>
  if(Bitmap3 == 0) {
     afe:	|  |  |                    |  |  |  |  |                              lea 28(sp),sp
     b02:	|  |  |                    |  |  |  |  \----------------------------- bne.w 588 <main+0x522>
     b06:	|  |  |                    |  |  |  \-------------------------------- bra.w 968 <main+0x902>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     b0a:	|  |  |                    |  |  \----------------------------------> movea.l 8958c <DOSBase>,a6
     b10:	|  |  |                    |  |                                       jsr -60(a6)
     b14:	|  |  |                    |  |                                       movea.l 8958c <DOSBase>,a6
     b1a:	|  |  |                    |  |                                       move.l d0,d1
     b1c:	|  |  |                    |  |                                       move.l #250429,d2
     b22:	|  |  |                    |  |                                       moveq #38,d3
     b24:	|  |  |                    |  |                                       jsr -48(a6)
    Exit(1);
     b28:	|  |  |                    |  |                                       movea.l 8958c <DOSBase>,a6
     b2e:	|  |  |                    |  |                                       moveq #1,d1
     b30:	|  |  |                    |  |                                       jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     b34:	|  |  |                    |  |                                       move.l 89576 <Bitmap1>,d0
     b3a:	|  |  |                    |  |                                       pea 3 <_start+0x3>
     b3e:	|  |  |                    |  |                                       pea 100 <main+0x9a>
     b42:	|  |  |                    |  |                                       pea 3d262 <incbin_MercuryLetterData2Lz4_end+0x1a4>
     b48:	|  |  |                    |  |                                       move.l d0,-(sp)
     b4a:	|  |  |                    |  |                                       jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     b4c:	|  |  |                    |  |                                       move.l 89576 <Bitmap1>,d2
     b52:	|  |  |                    |  |                                       pea 10 <_start+0x10>
     b56:	|  |  |                    |  |                                       pea 306 <main+0x2a0>
     b5a:	|  |  |                    |  |                                       move.l d2,-(sp)
     b5c:	|  |  |                    |  |                                       jsr (a3)
  ScreenBuffer1.BitPlane = Bitmap1;
     b5e:	|  |  |                    |  |                                       move.l d2,8952a <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     b64:	|  |  |                    |  |                                       clr.l 8952e <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     b6a:	|  |  |                    |  |                                       clr.l 8953a <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     b70:	|  |  |                    |  |                                       movea.l 89598 <SysBase>,a6
     b76:	|  |  |                    |  |                                       move.l #49536,d0
     b7c:	|  |  |                    |  |                                       moveq #2,d1
     b7e:	|  |  |                    |  |                                       jsr -198(a6)
     b82:	|  |  |                    |  |                                       move.l d0,89572 <Bitmap2>
  if(Bitmap2 == 0) {
     b88:	|  |  |                    |  |                                       lea 28(sp),sp
     b8c:	|  |  |                    |  \-------------------------------------- bne.w 532 <main+0x4cc>
     b90:	|  |  |                    \----------------------------------------- bra.w a80 <main+0xa1a>
	APTR vbr = 0;
     b94:	\--|--|-------------------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     b96:	   |  |                                                               move.l d0,8947e <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     b9c:	   |  |                                                               movea.l 8947e <VBR>,a0
     ba2:	   |  |                                                               move.l 108(a0),d0
	WaitVbl();
     ba6:	   |  |                                                               jsr (a2)
	Sw_PrepareDisplay();
     ba8:	   |  |                                                               jsr 4cea <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     bae:	   |  |                                                               movea.l 89594 <custom>,a0
     bb4:	   |  |                                                               move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     bba:	   |  |                                                               move.w #-8160,154(a0)
	while(SwScrollerFinished == 0) {
     bc0:	   |  |                                                               lea cc6 <Sw_Run>,a3
     bc6:	   |  |                                                               tst.w 8958a <SwScrollerFinished>
     bcc:	   |  \-------------------------------------------------------------- beq.w 202 <main+0x19c>
     bd0:	   \----------------------------------------------------------------- bra.w 20c <main+0x1a6>

00000bd4 <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     bd4:	subq.l #4,sp
     bd6:	move.l 16(sp),d0
     bda:	move.w d0,d0
     bdc:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     be0:	moveq #11,d0
     be2:	add.l 8(sp),d0
     be6:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     be8:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     bec:	moveq #0,d0
     bee:	move.w 2(sp),d0
	__asm volatile (
     bf2:	movem.l d0-d7/a2-a6,-(sp)
     bf6:	jsr 5cec <_lz4_depack>
     bfc:	movem.l (sp)+,d0-d7/a2-a6
}
     c00:	nop
     c02:	addq.l #4,sp
     c04:	rts

00000c06 <WaitVbl>:
void WaitVbl() {
     c06:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c08:	/-> move.l dff004 <_end+0xd75a68>,d0
     c0e:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     c10:	|   move.l (sp),d0
     c12:	|   andi.l #130816,d0
     c18:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     c1a:	|   move.l (sp),d0
     c1c:	|   cmpi.l #79616,d0
     c22:	\-- beq.s c08 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c24:	/-> move.l dff004 <_end+0xd75a68>,d0
     c2a:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     c2e:	|   move.l 4(sp),d0
     c32:	|   andi.l #130816,d0
     c38:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     c3c:	|   move.l 4(sp),d0
     c40:	|   cmpi.l #79616,d0
     c46:	\-- bne.s c24 <WaitVbl+0x1e>
}
     c48:	    addq.l #8,sp
     c4a:	    rts

00000c4c <p61Music>:
	void p61Music() {
     c4c:	move.l a6,-(sp)
     c4e:	move.l a3,-(sp)
		register volatile const void* _a3 ASM("a3") = player;
     c50:	lea 6b76 <incbin_player_start>,a3
		register volatile const void* _a6 ASM("a6") = (void*)0xdff000;
     c56:	movea.l #14675968,a6
		__asm volatile (
     c5c:	movem.l d0-a2/a4-a5,-(sp)
     c60:	jsr 4(a3)
     c64:	movem.l (sp)+,d0-a2/a4-a5
	}
     c68:	movea.l (sp)+,a3
     c6a:	movea.l (sp)+,a6
     c6c:	rts

00000c6e <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     c6e:	move.w #32,dff09c <_end+0xd75b00>
  custom->intreq = 1 << INTB_VERTB;
     c76:	move.w #32,dff09c <_end+0xd75b00>
  p61Music();
     c7e:	jsr c4c <p61Music>(pc)
  FrameCounter++;
     c82:	move.w 89588 <FrameCounter>,d0
     c88:	addq.w #1,d0
     c8a:	move.w d0,89588 <FrameCounter>
}
     c90:	rts

00000c92 <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
     c92:	    movem.l d2-d5/a2,-(sp)
     c96:	    move.l 24(sp),d3
     c9a:	    move.l 28(sp),d5
      *target++ = pattern;
     c9e:	    move.l 32(sp),d4
     ca2:	    add.l d4,d4
     ca4:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
     ca6:	    moveq #0,d2
     ca8:	    lea 59f6 <memset>(pc),a2
      *target++ = pattern;
     cac:	/-> move.l d4,-(sp)
     cae:	|   clr.l -(sp)
     cb0:	|   move.l d3,-(sp)
     cb2:	|   jsr (a2)
     cb4:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
     cb6:	|   addq.l #1,d2
     cb8:	|   lea 12(sp),sp
     cbc:	|   cmp.l d2,d5
     cbe:	\-- bne.s cac <Utils_FillLong.constprop.0+0x1a>
}
     cc0:	    movem.l (sp)+,d2-d5/a2
     cc4:	    rts

00000cc6 <Sw_Run>:
void Sw_Run() {                                     
     cc6:	          movem.l d2-d4/a2-a4/a6,-(sp)
  if(Sw_framecount == 50) {
     cca:	          move.l 6548e <Sw_framecount>,d0
     cd0:	          moveq #50,d1
     cd2:	          cmp.l d0,d1
     cd4:	   /----- beq.w 1000 <Sw_Run+0x33a>
  Sw_framecount++;
     cd8:	   |      addq.l #1,d0
     cda:	   |      move.l d0,6548e <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     ce0:	/--|----> move.w 8947c <Sw_BlitFrame>,d0
     ce6:	+--|----- beq.s ce0 <Sw_Run+0x1a>
  *bp = 0;
     ce8:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     cec:	|  |      move.w #0,8947c <Sw_BlitFrame>
  WaitBlit();
     cf4:	|  |      lea 89590 <GfxBase>,a2
     cfa:	|  |      movea.l (a2),a6
     cfc:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d00:	|  |      movea.l 89594 <custom>,a0
     d06:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     d0c:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     d12:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     d18:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     d1e:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     d24:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     d2a:	|  |      move.w #2544,64(a0)
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     d30:	|  |      move.l 6548e <Sw_framecount>,d1
     d36:	|  |      subq.l #1,d1
     d38:	|  |      move.l d1,d0
     d3a:	|  |      add.l d1,d0
     d3c:	|  |      add.l d0,d0
     d3e:	|  |      add.l d1,d0
     d40:	|  |      lsl.l #4,d0
     d42:	|  |      add.l 89486 <Sw_FontBuffer>,d0
     d48:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     d4c:	|  |      move.l 89478 <Sw_DrawBuffer>,d0
     d52:	|  |      addi.l #20400,d0
     d58:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     d5c:	|  |      move.w #104,88(a0)
  WaitBlit();
     d62:	|  |      movea.l (a2),a6
     d64:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d68:	|  |      movea.l 89594 <custom>,a0
     d6e:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     d74:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     d7a:	|  |      move.l 89474 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     d82:	|  |      move.l 89478 <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     d8a:	|  |      lea 43360 <Sw_CopyLines>,a3
     d90:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     d96:	|  |      add.l d0,d0
     d98:	|  |      move.w (0,a3,d0.l),d0
     d9c:	|  |      lsl.w #6,d0
     d9e:	|  |      addi.w #40,d0
     da2:	|  |      move.w d0,88(a0)
  WaitBlit();
     da6:	|  |      movea.l (a2),a6
     da8:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     dac:	|  |      movea.l 89594 <custom>,a0
     db2:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     db8:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     dbe:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     dc4:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     dca:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     dd0:	|  |      add.l d0,d0
     dd2:	|  |      move.w (0,a3,d0.l),d1
     dd6:	|  |      move.w d1,d0
     dd8:	|  |      mulu.w #80,d0
     ddc:	|  |      movea.l d0,a1
     dde:	|  |      lea 120(a1),a4
     de2:	|  |      move.l 89474 <Sw_ViewBufferP1>,d0
     de8:	|  |      add.l a4,d0
     dea:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     dee:	|  |      lea 40(a1),a1
     df2:	|  |      adda.l 89478 <Sw_DrawBuffer>,a1
     df8:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     dfc:	|  |      move.w d1,d0
     dfe:	|  |      mulu.w #40,d0
     e02:	|  |      addi.l #499962,d0
     e08:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     e0c:	|  |      move.w #255,d0
     e10:	|  |      sub.w d1,d0
     e12:	|  |      lsl.w #6,d0
     e14:	|  |      addi.w #20,d0
     e18:	|  |      move.w d0,88(a0)
  WaitBlit();
     e1c:	|  |      movea.l (a2),a6
     e1e:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     e22:	|  |      movea.l 89594 <custom>,a0
     e28:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     e2e:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     e34:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     e3a:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     e40:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     e46:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     e4c:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     e52:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     e58:	|  |      add.l d0,d0
     e5a:	|  |      move.w (0,a3,d0.l),d1
     e5e:	|  |      move.w d1,d0
     e60:	|  |      mulu.w #80,d0
     e64:	|  |      movea.l d0,a1
     e66:	|  |      lea 120(a1),a4
     e6a:	|  |      move.l 89474 <Sw_ViewBufferP1>,d0
     e70:	|  |      add.l a4,d0
     e72:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     e76:	|  |      move.w d1,d0
     e78:	|  |      mulu.w #40,d0
     e7c:	|  |      addi.l #499962,d0
     e82:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     e86:	|  |      lea 38(a1),a1
     e8a:	|  |      move.l 89478 <Sw_DrawBuffer>,d0
     e90:	|  |      add.l a1,d0
     e92:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     e96:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     e9a:	|  |      move.w #255,d0
     e9e:	|  |      sub.w d1,d0
     ea0:	|  |      lsl.w #6,d0
     ea2:	|  |      addi.w #21,d0
     ea6:	|  |      move.w d0,88(a0)
  WaitBlit();
     eaa:	|  |      movea.l (a2),a6
     eac:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     eb0:	|  |      movea.l 89594 <custom>,a1
     eb6:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     ebc:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     ec2:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     ec8:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     ece:	|  |      move.w #0,66(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     ed4:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     eda:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     ee0:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     ee6:	|  |      add.l d0,d0
     ee8:	|  |      move.w (0,a3,d0.l),d1
     eec:	|  |      moveq #0,d2
     eee:	|  |      move.w d1,d2
     ef0:	|  |      movea.l d2,a0
     ef2:	|  |      addq.l #1,a0
     ef4:	|  |      move.l a0,d0
     ef6:	|  |      add.l a0,d0
     ef8:	|  |      add.l d0,d0
     efa:	|  |      add.l a0,d0
     efc:	|  |      lsl.l #4,d0
     efe:	|  |      movea.l 89474 <Sw_ViewBufferP1>,a0
     f04:	|  |      adda.l d0,a0
     f06:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     f0a:	|  |      movea.w #-80,a0
     f0e:	|  |      adda.l d0,a0
     f10:	|  |      move.l 89478 <Sw_DrawBuffer>,d0
     f16:	|  |      add.l a0,d0
     f18:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f1c:	|  |      mulu.w #40,d1
     f20:	|  |      addi.l #489720,d1
     f26:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     f2a:	|  |      moveq #0,d0
     f2c:	|  |      not.b d0
     f2e:	|  |      sub.l d2,d0
     f30:	|  |      lsl.w #6,d0
     f32:	|  |      addi.w #20,d0
     f36:	|  |      move.w d0,88(a1)
  WaitBlit();
     f3a:	|  |      movea.l (a2),a6
     f3c:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     f40:	|  |      movea.l 89594 <custom>,a1
     f46:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     f4c:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     f52:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     f58:	|  |      move.w #40,96(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     f5e:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     f64:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     f6a:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     f70:	|  |      add.l d0,d0
     f72:	|  |      move.w (0,a3,d0.l),d1
     f76:	|  |      move.w d1,d2
     f78:	|  |      movea.l d2,a0
     f7a:	|  |      addq.l #1,a0
     f7c:	|  |      move.l a0,d0
     f7e:	|  |      add.l a0,d0
     f80:	|  |      add.l d0,d0
     f82:	|  |      add.l a0,d0
     f84:	|  |      lsl.l #4,d0
     f86:	|  |      movea.l 89474 <Sw_ViewBufferP1>,a0
     f8c:	|  |      adda.l d0,a0
     f8e:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f92:	|  |      mulu.w #40,d1
     f96:	|  |      addi.l #489720,d1
     f9c:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     fa0:	|  |      movea.w #-80,a0
     fa4:	|  |      adda.l d0,a0
     fa6:	|  |      move.l 89478 <Sw_DrawBuffer>,d0
     fac:	|  |      add.l a0,d0
     fae:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     fb2:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     fb6:	|  |      moveq #0,d0
     fb8:	|  |      not.b d0
     fba:	|  |      sub.l d2,d0
     fbc:	|  |      lsl.w #6,d0
     fbe:	|  |      addi.w #20,d0
     fc2:	|  |      move.w d0,88(a1)
  WaitBlit();
     fc6:	|  |      movea.l (a2),a6
     fc8:	|  |      jsr -228(a6)
  custom->color[0] = 0x00;
     fcc:	|  |      movea.l 89594 <custom>,a0
     fd2:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     fd8:	|  |      move.l 89470 <Sw_framecountscreen>,d0
     fde:	|  |      addq.l #1,d0
     fe0:	|  |      moveq #17,d1
     fe2:	|  |      cmp.l d0,d1
     fe4:	|  |  /-- beq.s ff2 <Sw_Run+0x32c>
     fe6:	|  |  |   move.l d0,89470 <Sw_framecountscreen>
}
     fec:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     ff0:	|  |  |   rts
     ff2:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     ff4:	|  |      move.l d0,89470 <Sw_framecountscreen>
}
     ffa:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     ffe:	|  |      rts
    Sw_framecount = 0;
    1000:	|  \----> clr.l 6548e <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
    1006:	|         move.l 89486 <Sw_FontBuffer>,d3
      *target++ = pattern;
    100c:	|         pea fa0 <Sw_Run+0x2da>
    1010:	|         clr.l -(sp)
    1012:	|         move.l d3,-(sp)
    1014:	|         jsr 59f6 <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
    1018:	|         movea.l 8946c <Sw_textoffset>,a3
    101e:	|         adda.l #413580,a3
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
    1024:	|         move.b (a3),d0
    1026:	|         ext.w d0
    1028:	|         movea.w d0,a2
    102a:	|         lea -32(a2),a2
    102e:	|         lea 12(sp),sp
    int x = 0;
    1032:	|         moveq #0,d2
    1034:	|         lea 43300 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
    103a:	|         move.w #3204,d4
    WaitBlit();
    103e:	|     /-> movea.l 89590 <GfxBase>,a6
    1044:	|     |   jsr -228(a6)
    custom->bltamod = 0;
    1048:	|     |   move.w #0,dff064 <_end+0xd75ac8>
    custom->bltbmod = 72;
    1050:	|     |   move.w #72,dff062 <_end+0xd75ac6>
    custom->bltdmod = 72;
    1058:	|     |   move.w #72,dff066 <_end+0xd75aca>
    custom->bltafwm = 0xffff;
    1060:	|     |   move.w #-1,dff044 <_end+0xd75aa8>
    custom->bltalwm = 0xffff;
    1068:	|     |   move.w #-1,dff046 <_end+0xd75aaa>
    custom->bltcon1 = 0;  
    1070:	|     |   move.w #0,dff042 <_end+0xd75aa6>
    custom->bltcon0 = 0xdfc + (restx << 12);
    1078:	|     |   move.w d2,d0
    107a:	|     |   moveq #12,d1
    107c:	|     |   lsl.w d1,d0
    107e:	|     |   addi.w #3580,d0
    1082:	|     |   move.w d0,dff040 <_end+0xd75aa4>
    custom->bltapt = font+4*50*index;
    1088:	|     |   move.l a2,d0
    108a:	|     |   add.l a2,d0
    108c:	|     |   add.l a2,d0
    108e:	|     |   lsl.l #3,d0
    1090:	|     |   add.l a2,d0
    1092:	|     |   lsl.l #4,d0
    1094:	|     |   addi.l #451718,d0
    109a:	|     |   move.l d0,dff050 <_end+0xd75ab4>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    10a0:	|     |   move.l d2,d0
    10a2:	|     |   asr.l #4,d0
    10a4:	|     |   add.l d0,d0
    10a6:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
    10a8:	|     |   move.l d0,dff04c <_end+0xd75ab0>
    custom->bltdpt = targetlocation;
    10ae:	|     |   move.l d0,dff054 <_end+0xd75ab8>
    custom->bltsize = 4+64*50;
    10b4:	|     |   move.w d4,dff058 <_end+0xd75abc>
        x += LetterSize[*text++ - 0x20];
    10ba:	|     |   move.b (a3)+,d0
    10bc:	|     |   ext.w d0
    10be:	|     |   move.b (-32,a4,d0.w),d0
    10c2:	|     |   andi.l #255,d0
    10c8:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
    10ca:	|     |   move.b (a3),d0
    10cc:	|     |   ext.w d0
    10ce:	|     |   movea.w d0,a2
    10d0:	|     |   lea -32(a2),a2
    10d4:	|     |   moveq #0,d0
    10d6:	|     |   move.b (0,a4,a2.l),d0
    10da:	|     |   add.l d2,d0
    10dc:	|     |   cmpi.l #639,d0
    10e2:	|     \-- ble.w 103e <Sw_Run+0x378>
    Sw_textoffset += 40;
    10e6:	|         moveq #40,d0
    10e8:	|         add.l 8946c <Sw_textoffset>,d0
    10ee:	|         move.l d0,8946c <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    10f4:	|         cmpi.l #1279,d0
    10fa:	|     /-- ble.s 110a <Sw_Run+0x444>
      Sw_textoffset = 0;
    10fc:	|     |   clr.l 8946c <Sw_textoffset>
      SwScrollerFinished = 1;
    1102:	|     |   move.w #1,8958a <SwScrollerFinished>
  Sw_framecount++;
    110a:	|     \-> move.l 6548e <Sw_framecount>,d0
    1110:	|         addq.l #1,d0
    1112:	|         move.l d0,6548e <Sw_framecount>
  while ( Sw_BlitFrame == 0)
    1118:	\-------- bra.w ce0 <Sw_Run+0x1a>

0000111c <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
    111c:	    movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1120:	    movea.l 89598 <SysBase>,a6
    1126:	    move.l #1360,d0
    112c:	    moveq #2,d1
    112e:	    jsr -198(a6)
    1132:	    movea.l d0,a2
  if( retval == 0) {
    1134:	    tst.l d0
    1136:	/-- beq.w 129c <Sw_ClBuild+0x180>
    *cl++ = *clpartinstruction++;
    113a:	|   move.l 64f4c <Sw_ClsSprites>,(a2)
    1140:	|   move.l 64f50 <Sw_ClsSprites+0x4>,4(a2)
    1148:	|   move.l 64f54 <Sw_ClsSprites+0x8>,8(a2)
    1150:	|   move.l 64f58 <Sw_ClsSprites+0xc>,12(a2)
    1158:	|   move.l 64f5c <Sw_ClsSprites+0x10>,16(a2)
    1160:	|   move.l 64f60 <Sw_ClsSprites+0x14>,20(a2)
    1168:	|   move.l 64f64 <Sw_ClsSprites+0x18>,24(a2)
    1170:	|   move.l 64f68 <Sw_ClsSprites+0x1c>,28(a2)
    1178:	|   move.l 64f6c <Sw_ClsSprites+0x20>,32(a2)
    1180:	|   move.l 64f70 <Sw_ClsSprites+0x24>,36(a2)
    1188:	|   move.l 64f74 <Sw_ClsSprites+0x28>,40(a2)
    1190:	|   move.l 64f78 <Sw_ClsSprites+0x2c>,44(a2)
    1198:	|   move.l 64f7c <Sw_ClsSprites+0x30>,48(a2)
    11a0:	|   move.l 64f80 <Sw_ClsSprites+0x34>,52(a2)
    11a8:	|   move.l 64f84 <Sw_ClsSprites+0x38>,56(a2)
    11b0:	|   move.l 64f88 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    11b8:	|   move.l 64f1c <Sw_ClScreen>,64(a2)
    11c0:	|   move.l 64f20 <Sw_ClScreen+0x4>,68(a2)
    11c8:	|   move.l 64f24 <Sw_ClScreen+0x8>,72(a2)
    11d0:	|   move.l 64f28 <Sw_ClScreen+0xc>,76(a2)
    11d8:	|   move.l 64f2c <Sw_ClScreen+0x10>,80(a2)
    11e0:	|   move.l 64f30 <Sw_ClScreen+0x14>,84(a2)
    11e8:	|   move.l 64f34 <Sw_ClScreen+0x18>,88(a2)
    11f0:	|   move.l 64f38 <Sw_ClScreen+0x1c>,92(a2)
    11f8:	|   move.l 64f3c <Sw_ClScreen+0x20>,96(a2)
    1200:	|   move.l 64f40 <Sw_ClScreen+0x24>,100(a2)
    1208:	|   move.l 64f44 <Sw_ClScreen+0x28>,104(a2)
    1210:	|   move.l 64f48 <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    1218:	|   move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    1220:	|   move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    1228:	|   move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    1230:	|   move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    1238:	|   move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    1240:	|   move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    1248:	|   move.l 64edc <Sw_ClColor>,136(a2)
    1250:	|   move.l 64ee0 <Sw_ClColor+0x4>,140(a2)
    1258:	|   move.l 64ee4 <Sw_ClColor+0x8>,144(a2)
    1260:	|   move.l 64ee8 <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    1268:	|   pea 1bc <main+0x156>
    126c:	|   pea 84de <incbin_Sw_ClColorDim_start>
    1272:	|   pea 152(a2)
    1276:	|   jsr 5a18 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    127a:	|   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    1282:	|   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    128a:	|   moveq #-2,d0
    128c:	|   move.l d0,604(a2)
  return (UWORD *) retval;  
    1290:	|   lea 12(sp),sp
}
    1294:	|   move.l a2,d0
    1296:	|   movem.l (sp)+,d2-d3/a2/a6
    129a:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    129c:	\-> movea.l 8958c <DOSBase>,a6
    12a2:	    jsr -60(a6)
    12a6:	    movea.l 8958c <DOSBase>,a6
    12ac:	    move.l d0,d1
    12ae:	    move.l #250047,d2
    12b4:	    moveq #40,d3
    12b6:	    jsr -48(a6)
    Exit(1);
    12ba:	    movea.l 8958c <DOSBase>,a6
    12c0:	    moveq #1,d1
    12c2:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    12c6:	    move.l 64f4c <Sw_ClsSprites>,(a2)
    12cc:	    move.l 64f50 <Sw_ClsSprites+0x4>,4(a2)
    12d4:	    move.l 64f54 <Sw_ClsSprites+0x8>,8(a2)
    12dc:	    move.l 64f58 <Sw_ClsSprites+0xc>,12(a2)
    12e4:	    move.l 64f5c <Sw_ClsSprites+0x10>,16(a2)
    12ec:	    move.l 64f60 <Sw_ClsSprites+0x14>,20(a2)
    12f4:	    move.l 64f64 <Sw_ClsSprites+0x18>,24(a2)
    12fc:	    move.l 64f68 <Sw_ClsSprites+0x1c>,28(a2)
    1304:	    move.l 64f6c <Sw_ClsSprites+0x20>,32(a2)
    130c:	    move.l 64f70 <Sw_ClsSprites+0x24>,36(a2)
    1314:	    move.l 64f74 <Sw_ClsSprites+0x28>,40(a2)
    131c:	    move.l 64f78 <Sw_ClsSprites+0x2c>,44(a2)
    1324:	    move.l 64f7c <Sw_ClsSprites+0x30>,48(a2)
    132c:	    move.l 64f80 <Sw_ClsSprites+0x34>,52(a2)
    1334:	    move.l 64f84 <Sw_ClsSprites+0x38>,56(a2)
    133c:	    move.l 64f88 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1344:	    move.l 64f1c <Sw_ClScreen>,64(a2)
    134c:	    move.l 64f20 <Sw_ClScreen+0x4>,68(a2)
    1354:	    move.l 64f24 <Sw_ClScreen+0x8>,72(a2)
    135c:	    move.l 64f28 <Sw_ClScreen+0xc>,76(a2)
    1364:	    move.l 64f2c <Sw_ClScreen+0x10>,80(a2)
    136c:	    move.l 64f30 <Sw_ClScreen+0x14>,84(a2)
    1374:	    move.l 64f34 <Sw_ClScreen+0x18>,88(a2)
    137c:	    move.l 64f38 <Sw_ClScreen+0x1c>,92(a2)
    1384:	    move.l 64f3c <Sw_ClScreen+0x20>,96(a2)
    138c:	    move.l 64f40 <Sw_ClScreen+0x24>,100(a2)
    1394:	    move.l 64f44 <Sw_ClScreen+0x28>,104(a2)
    139c:	    move.l 64f48 <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    13a4:	    move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    13ac:	    move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    13b4:	    move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    13bc:	    move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    13c4:	    move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    13cc:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    13d4:	    move.l 64edc <Sw_ClColor>,136(a2)
    13dc:	    move.l 64ee0 <Sw_ClColor+0x4>,140(a2)
    13e4:	    move.l 64ee4 <Sw_ClColor+0x8>,144(a2)
    13ec:	    move.l 64ee8 <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    13f4:	    pea 1bc <main+0x156>
    13f8:	    pea 84de <incbin_Sw_ClColorDim_start>
    13fe:	    pea 152(a2)
    1402:	    jsr 5a18 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    1406:	    move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    140e:	    move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    1416:	    moveq #-2,d0
    1418:	    move.l d0,604(a2)
  return (UWORD *) retval;  
    141c:	    lea 12(sp),sp
}
    1420:	    move.l a2,d0
    1422:	    movem.l (sp)+,d2-d3/a2/a6
    1426:	    rts

00001428 <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    1428:	moveq #0,d0
    142a:	move.w 89468 <Sw_ScreenBufferOffset>,d0
    1430:	lea 8942c <Sw_ScreenBufferList>,a0
    1436:	move.l d0,d1
    1438:	add.l d0,d1
    143a:	add.l d1,d1
    143c:	move.l (0,a0,d1.l),89478 <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1444:	addq.l #1,d0
    1446:	add.l d0,d0
    1448:	add.l d0,d0
    144a:	move.l (0,a0,d0.l),d0
    144e:	move.l d0,89474 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    1454:	moveq #80,d1
    1456:	add.l d0,d1
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    1458:	movea.l 89428 <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    145e:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    1462:	clr.w d0
    1464:	swap d0
    1466:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    146a:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    146e:	clr.w d1
    1470:	swap d1
    1472:	move.w d1,122(a0)
  /*highword = (ULONG)Sw_ViewBufferP3 >> 16;
  lowword = (ULONG)Sw_ViewBufferP3 & 0xffff;
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;*/

}
    1476:	rts

00001478 <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    1478:	          movea.l 89428 <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    147e:	          move.w 64ed8 <FrameCountBufferDraw>,d0
    1484:	          lea 64edc <Sw_ClColor>,a1
    148a:	          andi.l #65535,d0
    1490:	          lsl.l #4,d0
    1492:	          move.l (0,a1,d0.l),136(a0)
    1498:	          move.w 64ed8 <FrameCountBufferDraw>,d0
    149e:	          andi.l #65535,d0
    14a4:	          add.l d0,d0
    14a6:	          add.l d0,d0
    14a8:	          addq.l #1,d0
    14aa:	          add.l d0,d0
    14ac:	          add.l d0,d0
    14ae:	          move.l (0,a1,d0.l),140(a0)
    14b4:	          move.w 64ed8 <FrameCountBufferDraw>,d0
    14ba:	          andi.l #65535,d0
    14c0:	          add.l d0,d0
    14c2:	          add.l d0,d0
    14c4:	          addq.l #2,d0
    14c6:	          add.l d0,d0
    14c8:	          add.l d0,d0
    14ca:	          move.l (0,a1,d0.l),144(a0)
    14d0:	          move.w 64ed8 <FrameCountBufferDraw>,d0
    14d6:	          andi.l #65535,d0
    14dc:	          add.l d0,d0
    14de:	          add.l d0,d0
    14e0:	          addq.l #3,d0
    14e2:	          add.l d0,d0
    14e4:	          add.l d0,d0
    14e6:	          move.l (0,a1,d0.l),148(a0)
  for(int i=0;i<4;i++) {
    14ec:	          lea 152(a0),a0
  }
  if( ColPos == 12) {
    14f0:	          cmpi.w #12,89426 <ColPos>
    14f8:	   /----- beq.s 152e <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    14fa:	/--|----> move.w 89424 <Sw_ClColorDimPos>,d0
    1500:	|  |      moveq #0,d1
    1502:	|  |      move.w d0,d1
    1504:	|  |      addi.l #34014,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    150a:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    150e:	|  |      cmpi.w #22643,d0
    1512:	|  |  /-- bls.s 1516 <Sw_SetColors+0x9e>
    1514:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
    1516:	|  |  \-> move.w d0,89424 <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    151c:	|  |      pea 1bc <main+0x156>
    1520:	|  |      move.l d1,-(sp)
    1522:	|  |      move.l a0,-(sp)
    1524:	|  |      jsr 5a36 <memmove>(pc)

  }
}
    1528:	|  |      lea 12(sp),sp
    152c:	|  |      rts
    ColPos = 0;
    152e:	|  \----> clr.w 89426 <ColPos>
    1534:	\-------- bra.s 14fa <Sw_SetColors+0x82>

00001536 <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    1536:	          movea.l 89594 <custom>,a0
    153c:	          move.w #32,156(a0)
  if(Sw_MusicDelay > 0) {
    1542:	          move.w 64eda <Sw_MusicDelay>,d0
    1548:	/-------- beq.s 1580 <Sw_VblankHandler+0x4a>
    Sw_MusicDelay--;
    154a:	|         subq.w #1,d0
    154c:	|         move.w d0,64eda <Sw_MusicDelay>
  if( Sw_InitComplete == 1) {
    1552:	|  /----> cmpi.w #1,8946a <Sw_InitComplete>
    155a:	|  |  /-- beq.s 155e <Sw_VblankHandler+0x28>
}
    155c:	|  |  |   rts
    if( FrameCountBufferDraw == 2) {
    155e:	|  |  \-> move.w 64ed8 <FrameCountBufferDraw>,d0
    1564:	|  |      cmpi.w #2,d0
    1568:	|  |  /-- beq.s 1586 <Sw_VblankHandler+0x50>
      FrameCountBufferDraw++;
    156a:	|  |  |   move.w 64ed8 <FrameCountBufferDraw>,d0
    1570:	|  |  |   addq.w #1,d0
    1572:	|  |  |   move.w d0,64ed8 <FrameCountBufferDraw>
    Sw_SetBplPointers();
    1578:	|  |  |   jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    157c:	|  |  |   bra.w 1478 <Sw_SetColors>
    p61Music();
    1580:	\--|--|-> jsr c4c <p61Music>(pc)
    1584:	   \--|-- bra.s 1552 <Sw_VblankHandler+0x1c>
      FrameCountBufferDraw = 0;
    1586:	      \-> move.w #0,64ed8 <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    158e:	          move.w #1,8947c <Sw_BlitFrame>
      if(Sw_ScreenBufferOffset == 0) { 
    1596:	          tst.w 89468 <Sw_ScreenBufferOffset>
    159c:	      /-- bne.s 15ae <Sw_VblankHandler+0x78>
        Sw_ScreenBufferOffset = 2; 
    159e:	      |   move.w #2,89468 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    15a6:	      |   jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    15aa:	      |   bra.w 1478 <Sw_SetColors>
        Sw_ScreenBufferOffset = 0; 
    15ae:	      \-> clr.w 89468 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    15b4:	          jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    15b8:	          bra.w 1478 <Sw_SetColors>

000015bc <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    15bc:	rts

000015be <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    15be:	movea.l 89594 <custom>,a0
    15c4:	move.w #32,156(a0)
  p61Music();
    15ca:	bra.w c4c <p61Music>

000015ce <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    15ce:	                                                             lea -20(sp),sp
    15d2:	                                                             movem.l d2-d5/a2,-(sp)
    15d6:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    15da:	                                                             movea.l 8956a <DrawCopper>,a1
    15e0:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    15e4:	                                                             movea.l 89418 <DrawBuffer>,a0
    15ea:	                                                             move.w 52(a0),d0
    15ee:	                                                /----------- bmi.w 178e <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    15f2:	                                                |            move.w 54(a0),d2
    15f6:	                                                |     /----- bmi.w 174a <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    15fa:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    15fc:	                                                |     |      move.w d2,d4
    15fe:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    1600:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1604:	                                                |     |      cmp.w d1,d0
    1606:	                                          /-----|-----|----- bhi.w 1836 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    160a:	                                          |     |     |      move.w #70,30(sp)
    1610:	                                          |     |     |      move.w d2,32(sp)
    1614:	                                          |     |     |      move.w #109,34(sp)
    161a:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1620:	                                          |     |     |      clr.w 20(sp)
    1624:	                                          |     |     |      move.w #1,22(sp)
    162a:	                                          |     |     |      move.w #2,24(sp)
    1630:	                                          |     |     |      move.w #3,26(sp)
    1636:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    163c:	                                          |     |     |      cmpi.w #69,d2
    1640:	                                       /--|-----|-----|----- bhi.w 17cc <SetCl+0x1fe>
              values[j] = values[j + 1];
    1644:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1648:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    164e:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    1654:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1658:	                                       |  |  |  |     |      moveq #70,d0
    165a:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    165e:	|                                      |  |  |  |     |  /-- bcc.s 1670 <SetCl+0xa2>
              int temp2 = ids[j];
    1660:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    1666:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    166a:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    1670:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    1674:	|                                      |  |  |  |     |      cmp.w a0,d0
    1676:	|                                      |  |  |  |     |  /-- bcc.s 1694 <SetCl+0xc6>
              int temp2 = ids[j];
    1678:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    167c:	|                                      |  |  |  |     |  |   move.w d0,d2
    167e:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    1682:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1688:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    168c:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    1690:	|                                      |  |  |  |     |  |   move.w a0,d0
    1692:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    1694:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1698:	|                                      |  |  |  |     |      cmp.w d0,d2
    169a:	|                                      |  |  |  |     |  /-- bcc.s 16b4 <SetCl+0xe6>
              int temp2 = ids[j];
    169c:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    16a0:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    16a4:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    16aa:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    16ae:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    16b2:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    16b4:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    16b8:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    16bc:	|                                      |  |  |  |     |  /-- bcc.s 16d0 <SetCl+0x102>
              int temp2 = ids[j];
    16be:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    16c2:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    16c6:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    16cc:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    16d0:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    16d2:	|                                      |  |  |  |     |  /-- bcc.s 16ea <SetCl+0x11c>
              int temp2 = ids[j];
    16d4:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    16d8:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    16dc:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    16e2:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    16e6:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    16ea:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    16ee:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    16f2:	|                                      |  |  |  |     |  /-- bcc.s 1716 <SetCl+0x148>
              int temp2 = ids[j];
    16f4:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    16f8:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    16fe:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    1702:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    1706:	|                                      |  |  |  |     |  +-- bcc.s 1716 <SetCl+0x148>
              int temp2 = ids[j];
    1708:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    170c:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    1712:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    1716:	|                                      |  |  |  |     |  \-> move.w d1,d0
    1718:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    171a:	|                                      |  |  |  |     |      addi.w #11521,d0
    171e:	|                                      |  |  |  |     |      cmpi.w #210,d1
    1722:	|                                      |  |  |  |     |  /-- bhi.w 1812 <SetCl+0x244>
    switch( ids[i]) 
    1726:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    172c:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 201e <SetCl+0xa50>
    1730:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    1732:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    1736:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    1738:	|  |                                   |  |  |  |     |  |   move.w (1740 <SetCl+0x172>,pc,d1.l),d1
    173c:	|  |                                   |  |  |  |     |  |   jmp (1740 <SetCl+0x172>,pc,d1.w)
    1740:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    1744:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    174a:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    174c:	|  |                                   |  |  |  |  /-----|-- bhi.w 1876 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1750:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1756:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    175c:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    1762:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1768:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    176e:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    1772:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    1774:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1778:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    177e:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    1784:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1788:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    178a:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 165a <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    178e:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    1794:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    179a:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    17a0:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    17a6:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    17aa:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    17b0:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    17b6:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    17bc:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    17c2:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    17c6:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    17ca:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    17cc:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    17d0:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    17d4:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 165a <SetCl+0x8c>
              int temp2 = ids[j];
    17d8:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    17dc:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    17e2:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    17e8:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    17ec:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    17f0:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    17f4:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 2006 <SetCl+0xa38>
              values[j] = values[j + 1];
    17f8:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    17fe:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    1804:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    1808:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    180c:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    180e:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 165a <SetCl+0x8c>
    switch( ids[i]) 
    1812:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    1818:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 200c <SetCl+0xa3e>
    181c:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    181e:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    1822:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    1824:	|  |  |  |                             |  |  |     |  |      move.w (182c <SetCl+0x25e>,pc,d1.l),d1
    1828:	|  |  |  |                             |  |  |     |  |      jmp (182c <SetCl+0x25e>,pc,d1.w)
    182c:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    182e:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    1834:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1838:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    183e:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    1842:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1848:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    184e:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    1852:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1858:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    185e:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    1864:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    186a:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    186e:	|  |  |  |                             |     \-----|--|----- bls.w 1644 <SetCl+0x76>
    1872:	|  |  |  |                             \-----------|--|----- bra.w 17cc <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1876:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1878:	|  |  |  |                                            |      move.w #109,34(sp)
    187e:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1884:	|  |  |  |                                            |      move.w #2,24(sp)
    188a:	|  |  |  |                                            |      move.w #3,26(sp)
    1890:	|  |  |  |                                            |      move.w #4,28(sp)
    1896:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    189a:	|  |  |  |                                            |      clr.w d3
    189c:	|  |  |  |                                            \----- bra.w 1774 <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    18a0:	|  |  |  |                                                   cmpi.w #211,d3
    18a4:	|  |  |  |                                               /-- bls.s 18b6 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    18a6:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    18ac:	|  |  |  |                                               |   lea 172(a1),a2
    18b0:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    18b6:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    18b8:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    18be:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    18c4:	|  |  |  |                                                   lea 8(a2),a0
    18c8:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    18ce:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    18d4:	|  |  |  |  /--|-------------------------------------------- bhi.w 2024 <SetCl+0xa56>
    18d8:	|  |  |  |  |  |                                             moveq #0,d1
    18da:	|  |  |  |  |  |                                             move.w 22(sp),d1
    18de:	|  |  |  |  |  |                                             add.l d1,d1
    18e0:	|  |  |  |  |  |                                             move.w (18e8 <SetCl+0x31a>,pc,d1.l),d1
    18e4:	|  |  |  |  |  |                                             jmp (18e8 <SetCl+0x31a>,pc,d1.w)
    18e8:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    18ec:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    18f6:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    18fe:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    1904:	|  |  |  |  |  |                                             lea 176(a1),a0
    1908:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    190e:	|  |  |  |  |  +-------------------------------------------- bra.s 18ce <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1910:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1916:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    191c:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    1922:	|  |  |  |  |  |                                             lea 176(a1),a0
    1926:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    192c:	|  |  |  |  |  +-------------------------------------------- bra.s 18ce <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    192e:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1934:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    193a:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    1940:	|  |  |  |  |  |                                             lea 176(a1),a0
    1944:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    194a:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    1950:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 2030 <SetCl+0xa62>
    1954:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1956:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    195a:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    195c:	|  |  |  |  |  |  |  |                                       move.w (1964 <SetCl+0x396>,pc,d1.l),d1
    1960:	|  |  |  |  |  |  |  |                                       jmp (1964 <SetCl+0x396>,pc,d1.w)
    1964:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1966:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    196a:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    196c:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    196e:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    1974:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    197a:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    1980:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1984:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    198a:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 194a <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    198c:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    1990:	|  |  |  |  |  |  |  |                                   /-- bls.s 19a2 <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    1992:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1998:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    199c:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    19a2:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    19a4:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    19aa:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    19b0:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    19b4:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    19ba:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 194a <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    19bc:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    19c2:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19c8:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    19ce:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19d2:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    19d8:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 194a <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    19dc:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    19e2:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19e8:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    19ee:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19f2:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    19f8:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 18ce <SetCl+0x300>
        *tmp++ = line + 0x001;
    19fc:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    1a00:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    1a06:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    1a0c:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1a10:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    1a16:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 194a <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1a1a:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1a1e:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a24:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1a2a:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    1a2e:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    1a34:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    1a3a:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 2018 <SetCl+0xa4a>
    1a3e:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    1a40:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    1a44:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1a46:	|  |  |  |  |  |  |  |  |  |                                 move.w (1a4e <SetCl+0x480>,pc,d1.l),d1
    1a4a:	|  |  |  |  |  |  |  |  |  |                                 jmp (1a4e <SetCl+0x480>,pc,d1.w)
    1a4e:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1a50:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1a52:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1a5a:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    1a5c:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a62:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1a68:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a6c:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1a72:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a34 <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1a74:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1a78:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1a86 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    1a7a:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1a7e:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1a84:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1a86:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1a88:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1a8e:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1a94:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a98:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    1a9e:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a34 <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1aa0:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1aa4:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1aaa:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1ab0:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1ab4:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    1aba:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 1a34 <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1abe:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1ac2:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ac8:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1ace:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1ad2:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    1ad8:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    1ade:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 202a <SetCl+0xa5c>
    1ae2:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    1ae4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    1ae8:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    1aea:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (1af2 <SetCl+0x524>,pc,d1.l),d1
    1aee:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (1af2 <SetCl+0x524>,pc,d1.w)
    1af2:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    1af4:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    1af6:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    1af8:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    1afa:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1afc:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1b00:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1b06:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1b0c:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b10:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    1b16:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1ad8 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    1b18:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    1b1c:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 1b2a <SetCl+0x55c>
          *tmp++ = 0xffdf;
    1b1e:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1b22:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    1b28:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1b2a:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1b2c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b32:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1b38:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b3c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1b42:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1ad8 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1b44:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1b48:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1b4e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1b54:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b58:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    1b5e:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1ad8 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1b62:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1b64:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b6a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1b70:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b74:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    1b7a:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1ad8 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1b7e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1b82:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b88:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1b8e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1b92:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1b98:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    1b9e:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 204c <SetCl+0xa7e>
    1ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1bb2 <SetCl+0x5e4>,pc,d1.l),d1
    1bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1bb2 <SetCl+0x5e4>,pc,d1.w)
    1bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b98 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    1bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b98 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    1bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    1c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b98 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    1c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 1c20 <SetCl+0x652>
          *tmp++ = 0xffdf;
    1c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1c28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1b98 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 2036 <SetCl+0xa68>
    1c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1c70 <SetCl+0x6a2>,pc,d1.l),d1
    1c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1c70 <SetCl+0x6a2>,pc,d1.w)
    1c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    1c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c56 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    1c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1ca8 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    1c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    1cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c56 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c56 <SetCl+0x688>
        *tmp++ = line + 0x001;
    1ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    1ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c56 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    1d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    1d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1d6a <SetCl+0x79c>
          *tmp++ = 0xffdf;
    1d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    1d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    1d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    1db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1dd6 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    1de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    1e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 2012 <SetCl+0xa44>
    1e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1e2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1e36 <SetCl+0x868>,pc,d1.l),d1
    1e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1e36 <SetCl+0x868>,pc,d1.w)
    1e36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1e38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1e42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    1e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    1e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1e1c <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    1e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    1e60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 1e6e <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    1e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    1e6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1e70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1e76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    1e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    1e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1e1c <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1e88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    1ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1e1c <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    1ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 2036 <SetCl+0xa68>
    1eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    1ed0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    1ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1eda <SetCl+0x90c>,pc,d1.l),d1
    1ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1eda <SetCl+0x90c>,pc,d1.w)
    1eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    1ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    1ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1ec0 <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    1f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    1f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 1f12 <SetCl+0x944>
          *tmp++ = 0xffdf;
    1f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    1f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1ec0 <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1ec0 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f5c <SetCl+0x98e>
          *tmp++ = 0xffdf;
    1f50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1ec0 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f8a <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    1f7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    1f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1f8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    1f98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    1f9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    1fa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1e1c <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1faa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fb8 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1fb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1fba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1fc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1fca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1fd0:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 1a34 <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1fd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fea <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1fda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1fe0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    1fe4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1fea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1fec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1ff2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1ff8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1ffc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    2002:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 18ce <SetCl+0x300>
    2006:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    2008:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 165a <SetCl+0x8c>
    switch( ids[i]) 
    200c:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    200e:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 18ce <SetCl+0x300>
    2012:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    2014:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 1ec0 <SetCl+0x8f2>
    2018:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    201a:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1e1c <SetCl+0x84e>
    201e:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    2020:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 194a <SetCl+0x37c>
    2024:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    2026:	                  |     \-----|--|--|--|--|--|-------------- bra.w 1a34 <SetCl+0x466>
    202a:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    202c:	                  |           |     |  \--|--|-------------- bra.w 1b98 <SetCl+0x5ca>
    2030:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    2032:	                              \-----|-----|--|-------------- bra.w 1ad8 <SetCl+0x50a>
    2036:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    2038:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    203c:	                                    |     |                  move.w #-2,2(a0)
}
    2042:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    2046:	                                    |     |                  lea 20(sp),sp
    204a:	                                    |     |                  rts
    switch( ids[i]) 
    204c:	                                    \-----|----------------> movea.l a0,a1
    204e:	                                          \----------------- bra.w 1c56 <SetCl+0x688>

00002052 <LoadVectors>:
{
    2052:	       move.l a3,-(sp)
    2054:	       move.l a2,-(sp)
    2056:	       movea.l 12(sp),a2
    205a:	       movea.l 16(sp),a1
    205e:	       movea.l 20(sp),a3
  while( *source != 127) {
    2062:	       move.w (a2),d0
    2064:	       movea.l a3,a0
    2066:	       cmpi.w #127,d0
    206a:	/----- beq.s 20c0 <LoadVectors+0x6e>
    *target++ = *source++;
    206c:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    206e:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    2074:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    207a:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    2080:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    2086:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    208c:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    2092:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    2098:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    209e:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    20a4:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    20aa:	|  |   lea 24(a2),a2
    20ae:	|  |   lea 24(a0),a0
    20b2:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    20b8:	|  |   move.w (a2),d0
    20ba:	|  |   cmpi.w #127,d0
    20be:	|  \-- bne.s 206c <LoadVectors+0x1a>
  while( *source2 != 127) {  
    20c0:	\----> move.b (a1),d0
    20c2:	       cmpi.b #127,d0
    20c6:	/----- beq.w 2180 <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    20ca:	|  /-> ext.w d0
    20cc:	|  |   add.w (a3),d0
    20ce:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    20d0:	|  |   move.b 1(a1),d0
    20d4:	|  |   ext.w d0
    20d6:	|  |   add.w 2(a3),d0
    20da:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    20de:	|  |   move.b 2(a1),d0
    20e2:	|  |   ext.w d0
    20e4:	|  |   add.w 4(a3),d0
    20e8:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    20ec:	|  |   move.b 3(a1),d0
    20f0:	|  |   ext.w d0
    20f2:	|  |   add.w 6(a3),d0
    20f6:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    20fa:	|  |   move.b 4(a1),d0
    20fe:	|  |   ext.w d0
    2100:	|  |   add.w 8(a3),d0
    2104:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    2108:	|  |   move.b 5(a1),d0
    210c:	|  |   ext.w d0
    210e:	|  |   add.w 10(a3),d0
    2112:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    2116:	|  |   move.b 6(a1),d0
    211a:	|  |   ext.w d0
    211c:	|  |   add.w 12(a3),d0
    2120:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    2124:	|  |   move.b 7(a1),d0
    2128:	|  |   ext.w d0
    212a:	|  |   add.w 14(a3),d0
    212e:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    2132:	|  |   move.b 8(a1),d0
    2136:	|  |   ext.w d0
    2138:	|  |   add.w 16(a3),d0
    213c:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    2140:	|  |   move.b 9(a1),d0
    2144:	|  |   ext.w d0
    2146:	|  |   add.w 18(a3),d0
    214a:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    214e:	|  |   move.b 10(a1),d0
    2152:	|  |   ext.w d0
    2154:	|  |   add.w 20(a3),d0
    2158:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    215c:	|  |   lea 24(a3),a3
    2160:	|  |   lea 12(a1),a1
    2164:	|  |   lea 24(a0),a0
    2168:	|  |   move.b -1(a1),d0
    216c:	|  |   ext.w d0
    216e:	|  |   add.w -2(a3),d0
    2172:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    2176:	|  |   move.b (a1),d0
    2178:	|  |   cmpi.b #127,d0
    217c:	|  \-- bne.w 20ca <LoadVectors+0x78>
}
    2180:	\----> movea.l (sp)+,a2
    2182:	       movea.l (sp)+,a3
    2184:	       rts

00002186 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    2186:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    218a:	    movea.l 89598 <SysBase>,a6
    2190:	    move.l #1360,d0
    2196:	    moveq #2,d1
    2198:	    jsr -198(a6)
    219c:	    movea.l d0,a2
  
  if( retval == 0) {
    219e:	    tst.l d0
    21a0:	/-- beq.w 2330 <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    21a4:	|   move.l 44114 <ClsSprites>,(a2)
    21aa:	|   move.l 44118 <ClsSprites+0x4>,4(a2)
    21b2:	|   move.l 4411c <ClsSprites+0x8>,8(a2)
    21ba:	|   move.l 44120 <ClsSprites+0xc>,12(a2)
    21c2:	|   move.l 44124 <ClsSprites+0x10>,16(a2)
    21ca:	|   move.l 44128 <ClsSprites+0x14>,20(a2)
    21d2:	|   move.l 4412c <ClsSprites+0x18>,24(a2)
    21da:	|   move.l 44130 <ClsSprites+0x1c>,28(a2)
    21e2:	|   move.l 44134 <ClsSprites+0x20>,32(a2)
    21ea:	|   move.l 44138 <ClsSprites+0x24>,36(a2)
    21f2:	|   move.l 4413c <ClsSprites+0x28>,40(a2)
    21fa:	|   move.l 44140 <ClsSprites+0x2c>,44(a2)
    2202:	|   move.l 44144 <ClsSprites+0x30>,48(a2)
    220a:	|   move.l 44148 <ClsSprites+0x34>,52(a2)
    2212:	|   move.l 4414c <ClsSprites+0x38>,56(a2)
    221a:	|   move.l 44150 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    2222:	|   move.l 440e4 <ClScreen>,64(a2)
    222a:	|   move.l 440e8 <ClScreen+0x4>,68(a2)
    2232:	|   move.l 440ec <ClScreen+0x8>,72(a2)
    223a:	|   move.l 440f0 <ClScreen+0xc>,76(a2)
    2242:	|   move.l 440f4 <ClScreen+0x10>,80(a2)
    224a:	|   move.l 440f8 <ClScreen+0x14>,84(a2)
    2252:	|   move.l 440fc <ClScreen+0x18>,88(a2)
    225a:	|   move.l 44100 <ClScreen+0x1c>,92(a2)
    2262:	|   move.l 44104 <ClScreen+0x20>,96(a2)
    226a:	|   move.l 44108 <ClScreen+0x24>,100(a2)
    2272:	|   move.l 4410c <ClScreen+0x28>,104(a2)
    227a:	|   move.l 44110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2282:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    228a:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2292:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    229a:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    22a2:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    22aa:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    22b2:	|   move.l 440c4 <ClColor>,136(a2)
    22ba:	|   move.l 440c8 <ClColor+0x4>,140(a2)
    22c2:	|   move.l 440cc <ClColor+0x8>,144(a2)
    22ca:	|   move.l 440d0 <ClColor+0xc>,148(a2)
    22d2:	|   move.l 440d4 <ClColor+0x10>,152(a2)
    22da:	|   move.l 440d8 <ClColor+0x14>,156(a2)
    22e2:	|   move.l 440dc <ClColor+0x18>,160(a2)
    22ea:	|   move.l 440e0 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    22f2:	|   move.l 44074 <ClToggleBitPlanes>,168(a2)
    22fa:	|   move.l 44078 <ClToggleBitPlanes+0x4>,172(a2)
    2302:	|   move.l 4407c <ClToggleBitPlanes+0x8>,176(a2)
    230a:	|   move.l 44080 <ClToggleBitPlanes+0xc>,180(a2)
    2312:	|   move.l 44084 <ClToggleBitPlanes+0x10>,184(a2)
    231a:	|   move.l 44088 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    2322:	|   moveq #-2,d0
    2324:	|   move.l d0,192(a2)
  return retval;  
}
    2328:	|   move.l a2,d0
    232a:	|   movem.l (sp)+,d2-d3/a2/a6
    232e:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    2330:	\-> movea.l 8958c <DOSBase>,a6
    2336:	    jsr -60(a6)
    233a:	    movea.l 8958c <DOSBase>,a6
    2340:	    move.l d0,d1
    2342:	    move.l #250047,d2
    2348:	    moveq #40,d3
    234a:	    jsr -48(a6)
    Exit(1);
    234e:	    movea.l 8958c <DOSBase>,a6
    2354:	    moveq #1,d1
    2356:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    235a:	    move.l 44114 <ClsSprites>,(a2)
    2360:	    move.l 44118 <ClsSprites+0x4>,4(a2)
    2368:	    move.l 4411c <ClsSprites+0x8>,8(a2)
    2370:	    move.l 44120 <ClsSprites+0xc>,12(a2)
    2378:	    move.l 44124 <ClsSprites+0x10>,16(a2)
    2380:	    move.l 44128 <ClsSprites+0x14>,20(a2)
    2388:	    move.l 4412c <ClsSprites+0x18>,24(a2)
    2390:	    move.l 44130 <ClsSprites+0x1c>,28(a2)
    2398:	    move.l 44134 <ClsSprites+0x20>,32(a2)
    23a0:	    move.l 44138 <ClsSprites+0x24>,36(a2)
    23a8:	    move.l 4413c <ClsSprites+0x28>,40(a2)
    23b0:	    move.l 44140 <ClsSprites+0x2c>,44(a2)
    23b8:	    move.l 44144 <ClsSprites+0x30>,48(a2)
    23c0:	    move.l 44148 <ClsSprites+0x34>,52(a2)
    23c8:	    move.l 4414c <ClsSprites+0x38>,56(a2)
    23d0:	    move.l 44150 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    23d8:	    move.l 440e4 <ClScreen>,64(a2)
    23e0:	    move.l 440e8 <ClScreen+0x4>,68(a2)
    23e8:	    move.l 440ec <ClScreen+0x8>,72(a2)
    23f0:	    move.l 440f0 <ClScreen+0xc>,76(a2)
    23f8:	    move.l 440f4 <ClScreen+0x10>,80(a2)
    2400:	    move.l 440f8 <ClScreen+0x14>,84(a2)
    2408:	    move.l 440fc <ClScreen+0x18>,88(a2)
    2410:	    move.l 44100 <ClScreen+0x1c>,92(a2)
    2418:	    move.l 44104 <ClScreen+0x20>,96(a2)
    2420:	    move.l 44108 <ClScreen+0x24>,100(a2)
    2428:	    move.l 4410c <ClScreen+0x28>,104(a2)
    2430:	    move.l 44110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2438:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    2440:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2448:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    2450:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2458:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    2460:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    2468:	    move.l 440c4 <ClColor>,136(a2)
    2470:	    move.l 440c8 <ClColor+0x4>,140(a2)
    2478:	    move.l 440cc <ClColor+0x8>,144(a2)
    2480:	    move.l 440d0 <ClColor+0xc>,148(a2)
    2488:	    move.l 440d4 <ClColor+0x10>,152(a2)
    2490:	    move.l 440d8 <ClColor+0x14>,156(a2)
    2498:	    move.l 440dc <ClColor+0x18>,160(a2)
    24a0:	    move.l 440e0 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    24a8:	    move.l 44074 <ClToggleBitPlanes>,168(a2)
    24b0:	    move.l 44078 <ClToggleBitPlanes+0x4>,172(a2)
    24b8:	    move.l 4407c <ClToggleBitPlanes+0x8>,176(a2)
    24c0:	    move.l 44080 <ClToggleBitPlanes+0xc>,180(a2)
    24c8:	    move.l 44084 <ClToggleBitPlanes+0x10>,184(a2)
    24d0:	    move.l 44088 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    24d8:	    moveq #-2,d0
    24da:	    move.l d0,192(a2)
}
    24de:	    move.l a2,d0
    24e0:	    movem.l (sp)+,d2-d3/a2/a6
    24e4:	    rts

000024e6 <SetBplPointers>:

void SetBplPointers() {
    24e6:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    24e8:	    movea.w 89104 <ScreenBufferOffset>,a0
    24ee:	    moveq #0,d0
    24f0:	    move.w a0,d0
    24f2:	    lea 89496 <ScreenBufferList>,a2
    24f8:	    move.l d0,d1
    24fa:	    add.l d0,d1
    24fc:	    add.l d1,d1
    24fe:	    move.l (0,a2,d1.l),89418 <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    2506:	    move.l d0,d1
    2508:	    addq.l #1,d1
    250a:	    add.l d1,d1
    250c:	    add.l d1,d1
    250e:	    movea.l (0,a2,d1.l),a1
    2512:	    move.l a1,89408 <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    2518:	    addq.l #2,d0
    251a:	    add.l d0,d0
    251c:	    add.l d0,d0
    251e:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    2522:	    move.w a0,d0
    2524:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    2526:	    cmpi.w #8,d0
    252a:	/-- bls.s 252e <SetBplPointers+0x48>
    252c:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    252e:	\-> move.l d1,8940c <ClearBuffer>
  ScreenBufferOffset += 3;
    2534:	    move.w d0,89104 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    253a:	    move.w 54(a1),d0
    253e:	    ext.l d0
    2540:	    lsl.l #6,d0
    2542:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    2544:	    movea.l 8956a <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    254a:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    254e:	    move.l d0,d1
    2550:	    clr.w d1
    2552:	    swap d1
    2554:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2558:	    move.l d0,d1
    255a:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    2560:	    move.w d1,126(a0)
  highword = ptr >> 16;
    2564:	    clr.w d1
    2566:	    swap d1
    2568:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    256c:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    2572:	    move.w d0,134(a0)
  highword = ptr >> 16;
    2576:	    clr.w d0
    2578:	    swap d0
    257a:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    257e:	    movea.l (sp)+,a2
    2580:	    rts

00002582 <KPrintF>:
void KPrintF(const char* fmt, ...) {
    2582:	    lea -128(sp),sp
    2586:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    258a:	    move.w f0ff60 <_end+0xe869c4>,d0
    2590:	    cmpi.w #20153,d0
    2594:	/-- beq.s 25c0 <KPrintF+0x3e>
    2596:	|   cmpi.w #-24562,d0
    259a:	+-- beq.s 25c0 <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    259c:	|   movea.l 89598 <SysBase>,a6
    25a2:	|   movea.l 144(sp),a0
    25a6:	|   lea 148(sp),a1
    25aa:	|   lea 5b7e <KPutCharX>,a2
    25b0:	|   suba.l a3,a3
    25b2:	|   jsr -522(a6)
}
    25b6:	|   movem.l (sp)+,a2-a3/a6
    25ba:	|   lea 128(sp),sp
    25be:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    25c0:	\-> movea.l 89598 <SysBase>,a6
    25c6:	    movea.l 144(sp),a0
    25ca:	    lea 148(sp),a1
    25ce:	    lea 5b8c <PutChar>,a2
    25d4:	    lea 12(sp),a3
    25d8:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    25dc:	    move.l a3,-(sp)
    25de:	    pea 56 <_start+0x56>
    25e2:	    jsr f0ff60 <_end+0xe869c4>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    25e8:	    addq.l #8,sp
}
    25ea:	    movem.l (sp)+,a2-a3/a6
    25ee:	    lea 128(sp),sp
    25f2:	    rts

000025f4 <DrawRect>:
{  
    25f4:	                                                                                                                                                             lea -24(sp),sp
    25f8:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    25fc:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    2600:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    2604:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    2608:	                                                                                                                                                             tst.w d0
    260a:	                                                                                                               /-------------------------------------------- blt.w 2824 <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    260e:	                                                                                                               |                                             move.w d0,d4
    2610:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    2612:	                                                                                                               |                                             cmpi.w #256,d0
    2616:	                                                                                                               |                                         /-- ble.s 2622 <DrawRect+0x2e>
}
    2618:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    261c:	                                                                                                               |        |                                |   lea 24(sp),sp
    2620:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    2622:	                                                                                                               |        |                                \-> movea.w d1,a0
    2624:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    2628:	                                                                                                               |        |                                    cmpa.w #256,a0
    262c:	                                                                                                            /--|--------|----------------------------------- ble.w 284c <DrawRect+0x258>
    height = 256 - square->YPosMin;
    2630:	                                                                                                            |  |        |                                    move.w #256,d5
    2634:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    2636:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    2638:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    263c:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2640:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 283a <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    2644:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    2646:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    264a:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    264c:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2618 <DrawRect+0x24>
    264e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    2652:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2618 <DrawRect+0x24>
    2654:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    2658:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 2618 <DrawRect+0x24>
  xlength = xlength/16;
    265a:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    265c:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    265e:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    2660:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    2664:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    2666:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    2668:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    266a:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    266c:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    266e:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    2670:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    2672:	                                                                                                            |  |  |  |  |  |  |                              movea.l 8957a <PrepareBuffer>,a1
    2678:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    267a:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd75a66>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2680:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd75a66>,d0
    2686:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    268a:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 2680 <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    268c:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0;
    2694:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd75aa6>
  custom->bltadat = data;
    269c:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd75ad8>
  custom->bltdpt = Target;  
    26a4:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd75ab8>
  custom->bltdmod = mod;
    26aa:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd75aca>
  custom->bltsize = lines*64+linelength;
    26b0:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    26b2:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    26b4:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd75abc>
    custom->bltcon1 = 0x0000;      
    26ba:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd75aa6>
    custom->bltcdat = 0x0;
    26c2:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd75ad4>
    BltCon0LineDraw = 0x0500;
    26ca:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,89106 <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    26d2:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    26d4:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    26d8:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    26dc:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    26e0:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    26e2:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    26e4:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    26e8:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 2f40 <DrawRect+0x94c>
  if(height != 0) {
    26ec:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    26ee:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 2f54 <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    26f2:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,89106 <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    26fa:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    26fe:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    2702:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    2704:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2706:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    270a:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2d18 <DrawRect+0x724>
  if(height != 0) {
    270e:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    2710:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2d2c <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    2714:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    2718:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    271c:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    271e:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    2720:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    2724:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 2b08 <DrawRect+0x514>
  if(height != 0) {
    2728:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    272a:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 2b1c <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    272e:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    2730:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    2734:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    2736:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2738:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    273c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 28c6 <DrawRect+0x2d2>
  if(height != 0) {
    2740:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    2742:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 28da <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2746:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 8957a <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    274c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2750:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    2752:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    2754:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    275a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 89418 <DrawBuffer>,a0
    2760:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2762:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    2764:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2766:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2768:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    276a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd75a66>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2770:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd75a66>,d1
    2776:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2778:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    277c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    2780:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 2770 <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    2782:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd75ac8>
  custom->bltbmod = 64 - length*2;
    2788:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd75ac6>
  custom->bltdmod = 64 - length*2;  
    278e:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd75aca>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    2794:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2798:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 2854 <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    279c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    279e:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 3150 <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    27a2:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    27a8:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    27ac:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    27ae:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    27b0:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    27b2:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    27b8:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    27ba:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    27bc:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    27c0:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    27c4:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    27c8:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    27cc:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    27d0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 28b2 <DrawRect+0x2be>
    27d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    27d6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    27da:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 2884 <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    27de:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd75aa4>
    custom->bltapt = (UBYTE *)bltapt;
    27e4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd75ab4>
    custom->bltbpt = (UBYTE *)bltdpt;
    27ea:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd75ab0>
    custom->bltdpt = (UBYTE *)bltdpt;
    27f0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd75ab8>
    custom->bltsize = bltsize;
    27f6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd75abc>
    bltdpt += 64*256;
    27fc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2800:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd75a66>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2806:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd75a66>,d0
    280c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2810:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 2806 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    2812:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    2814:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    2816:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 2618 <DrawRect+0x24>
    if( planes > 1) {
    281a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    281e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 27d4 <DrawRect+0x1e0>
    2820:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 28b2 <DrawRect+0x2be>
    height += square->YPosMin;
    2824:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    2826:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    2828:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    282a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    282c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    282e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    2832:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2836:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 2644 <DrawRect+0x50>
    xlength += xposmin - 16;    
    283a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    283c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    283e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    2842:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2846:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2848:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 264a <DrawRect+0x56>
  WORD height = square->Height;
    284c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    284e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    2850:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 2638 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2854:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    285a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    2860:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    2862:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2864:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2866:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    286c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    286e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    2870:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    2874:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2878:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    287c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    2880:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 27cc <DrawRect+0x1d8>
    2884:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2886:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd75aa4>
    custom->bltapt = (UBYTE *)bltapt;
    288c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd75ab4>
    custom->bltbpt = (UBYTE *)bltdpt;
    2892:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd75ab0>
    custom->bltdpt = (UBYTE *)bltdpt;
    2898:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd75ab8>
    custom->bltsize = bltsize;
    289e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd75abc>
    bltdpt += 64*256;
    28a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    28a8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd75a66>,d0
    28ae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 2806 <DrawRect+0x212>
      bit = color & 1;
    28b2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    28b4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    28b8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    28ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    28bc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    28c0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 27de <DrawRect+0x1ea>
    28c4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 2884 <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    28c6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 3d0e5 <incbin_MercuryLetterData2Lz4_end+0x27>
    28cc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    28d0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 2582 <KPrintF>(pc)
    28d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    28d6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    28da:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    28dc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2746 <DrawRect+0x152>
      WORD length = x1 - x2;
    28e0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    28e4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    28e6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    28e8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28ea:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    28ec:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 3212 <DrawRect+0xc1e>
    28f0:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    28f4:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    28f8:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    28fa:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    28fc:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2a86 <DrawRect+0x492>
      height += 1; 
    2900:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    2902:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2904:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    2908:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 2910 <DrawRect+0x31c>
    290a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2910:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2914:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    2918:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    291a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    291c:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2a94 <DrawRect+0x4a0>
      if(yposmin <= 0) {
    2920:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    2922:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    2924:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 2a7a <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    2928:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    292a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    2930:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 2ae0 <DrawRect+0x4ec>
    2934:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    293a:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 350a <DrawRect+0xf16>
    293e:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    2944:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34da <DrawRect+0xee6>
          startx -= 1;
    2948:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    294c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    294e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    2950:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    2952:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 2af2 <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2956:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2958:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    295a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    295c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    295e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    2960:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    2962:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 2acc <DrawRect+0x4d8>
    2966:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2968:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    296a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    296c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2972:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    2974:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2976:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2978:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    297a:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    297c:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 341a <DrawRect+0xe26>
    2980:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2984:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2986:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2988:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    298a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    298e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    2994:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2996:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2998:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    299a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    299c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    299e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    29a0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    29a2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    29a4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    29a6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    29a8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    29aa:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    29ac:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    29ae:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    29b0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    29b2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    29b4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    29b6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    29b8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    29ba:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    29bc:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    29be:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    29c0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    29c2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    29c4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    29c6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    29ca:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    29cc:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    29ce:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 3d2e8 <LookupSlope>,a1
    29d4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    29d6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    29d8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    29dc:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    29de:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    29e0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    29e2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    29e4:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2aac <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29e8:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75a66>,d0
    29ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75a66>,d0
    29f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    29fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 29f0 <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    29fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    29fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 89106 <BltCon0LineDraw>,d0
    2a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2a08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75aa4>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 8957a <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 8957e <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd75ab0>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    2a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    2a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    2a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd75aac>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2a2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75ab8>
  custom->bltbmod = bltbmod;
    2a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd75ac6>
  custom->bltcmod = bltdmod;
    2a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd75ac4>
  custom->bltdmod = bltdmod;
    2a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd75aca>
  custom->bltsize = bltwidth + 64*height;
    2a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    2a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    2a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75abc>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    2a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2a60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 89418 <DrawBuffer>,a0
    2a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    2a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    2a6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd75a66>,d1
    2a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 2770 <DrawRect+0x17c>
        starty += 96;
    2a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2a7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2a82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 2928 <DrawRect+0x334>
        height = -height;
    2a86:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2a88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    2a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    2a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2a90:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 2900 <DrawRect+0x30c>
        startx += 96;
    2a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    2a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2a9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2aa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 2928 <DrawRect+0x334>
    2aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 2a7a <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2aac:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 3d0fb <incbin_MercuryLetterData2Lz4_end+0x3d>
    2ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 2582 <KPrintF>(pc)
    2aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    2abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd75a66>,d0
    2ac6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 29f0 <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    2acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    2ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    2ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    2ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    2ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    2adc:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 2972 <DrawRect+0x37e>
          height *= -1;
    2ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    2ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    2ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    2aea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    2aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    2aee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2956 <DrawRect+0x362>
    2af2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    2af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    2af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2afa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    2afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    2afe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    2b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    2b02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2966 <DrawRect+0x372>
    2b06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 2acc <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    2b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 3d0e5 <incbin_MercuryLetterData2Lz4_end+0x27>
    2b0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    2b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 2582 <KPrintF>(pc)
    2b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    2b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    2b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    2b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 2c90 <DrawRect+0x69c>
      WORD length = x1 - x2;
    2b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    2b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    2b28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    2b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    2b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 3374 <DrawRect+0xd80>
    2b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    2b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    2b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2b40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 2cc4 <DrawRect+0x6d0>
      height += 1; 
    2b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    2b4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2b58 <DrawRect+0x564>
    2b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2cac <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    2b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    2b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 2ca0 <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 31c4 <DrawRect+0xbd0>
    2b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    2b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 2d02 <DrawRect+0x70e>
    2b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 31c8 <DrawRect+0xbd4>
          height *= -1;
    2b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    2b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2d08 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    2b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 2cf2 <DrawRect+0x6fe>
    2b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3398 <DrawRect+0xda4>
    2bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    2c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 3d2e8 <LookupSlope>,a0
    2c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2cd0 <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75a66>,d0
    2c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75a66>,d0
    2c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2c2a <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 89106 <BltCon0LineDraw>,a0
    2c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75aa4>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 8957a <PrepareBuffer>,a5
    2c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 8957e <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2c5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd75ab0>
  custom->bltcpt = (UBYTE *)bltdpt;
    2c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd75aac>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75ab8>
  custom->bltbmod = bltbmod;
    2c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd75ac6>
  custom->bltcmod = bltdmod;
    2c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd75ac4>
  custom->bltdmod = bltdmod;
    2c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd75aca>
  custom->bltsize = bltwidth + 64*height;
    2c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75abc>
  WORD x1 = square->Vertices[index1].X;
    2c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    2c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    2c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 272e <DrawRect+0x13a>
        starty += 96;
    2ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2b70 <DrawRect+0x57c>
        startx += 96;
    2cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2b70 <DrawRect+0x57c>
    2cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 2ca0 <DrawRect+0x6ac>
        height = -height;
    2cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2b46 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 3d0fb <incbin_MercuryLetterData2Lz4_end+0x3d>
    2cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 2582 <KPrintF>(pc)
    2cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    2ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd75a66>,d0
    2cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2c2a <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    2cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2ba6 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    2d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    2d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2b94 <DrawRect+0x5a0>
    2d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    2d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 2b9e <DrawRect+0x5aa>
    2d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 2cf2 <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 3d0e5 <incbin_MercuryLetterData2Lz4_end+0x27>
    2d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    2d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 2582 <KPrintF>(pc)
    2d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 2e9c <DrawRect+0x8a8>
      WORD length = x1 - x2;
    2d32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 32d8 <DrawRect+0xce4>
    2d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    2d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    2d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    2d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    2d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 2ed0 <DrawRect+0x8dc>
      height += 1; 
    2d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    2d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    2d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 2d62 <DrawRect+0x76e>
    2d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    2d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    2d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2eb8 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    2d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    2d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    2d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2eac <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    2d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    2d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    2d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2f18 <DrawRect+0x924>
    2d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    2d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 34c8 <DrawRect+0xed4>
    2d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3498 <DrawRect+0xea4>
          startx -= 1;
    2d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    2da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    2da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    2da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2f2a <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    2db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    2db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    2db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 2f04 <DrawRect+0x910>
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 32f8 <DrawRect+0xd04>
    2dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    2e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2e08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2e0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2e10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2e20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 3d2e8 <LookupSlope>,a1
    2e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2e2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    2e30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2e34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2ede <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2e38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2e3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75a66>,d0
    2e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2e48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2e3e <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 89106 <BltCon0LineDraw>,d0
    2e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2e54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75aa4>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 8957a <PrepareBuffer>,a5
    2e64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 8957e <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2e6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd75ab0>
  custom->bltcpt = (UBYTE *)bltdpt;
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd75aac>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2e78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75ab8>
  custom->bltbmod = bltbmod;
    2e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd75ac6>
  custom->bltcmod = bltdmod;
    2e84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd75ac4>
  custom->bltdmod = bltdmod;
    2e8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd75aca>
  custom->bltsize = bltwidth + 64*height;
    2e90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    2e92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75abc>
  WORD x1 = square->Vertices[index1].X;
    2e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    2ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 2714 <DrawRect+0x120>
        starty += 96;
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    2eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 2d7a <DrawRect+0x786>
        startx += 96;
    2eb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 2d7a <DrawRect+0x786>
    2ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2eac <DrawRect+0x8b8>
        height = -height;
    2ed0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    2ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 2d52 <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 3d0fb <incbin_MercuryLetterData2Lz4_end+0x3d>
    2ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2eec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 2582 <KPrintF>(pc)
    2ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    2ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2ef6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2e3e <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2f08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    2f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 2dc4 <DrawRect+0x7d0>
          height *= -1;
    2f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    2f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    2f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2da8 <DrawRect+0x7b4>
    2f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2f2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    2f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2f32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    2f34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2db8 <DrawRect+0x7c4>
    2f3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 2f04 <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 3d0e5 <incbin_MercuryLetterData2Lz4_end+0x27>
    2f46:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    2f4a:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 2582 <KPrintF>(pc)
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    2f50:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    2f54:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    2f56:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 30c8 <DrawRect+0xad4>
      WORD length = x1 - x2;
    2f5a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    2f60:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2f62:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    2f64:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    2f66:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 3232 <DrawRect+0xc3e>
    2f6a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    2f6e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    2f72:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    2f74:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    2f78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    2f7a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 30fc <DrawRect+0xb08>
      height += 1; 
    2f7e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    2f80:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2f82:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    2f86:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 2f90 <DrawRect+0x99c>
    2f88:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    2f8a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    2f8e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2f90:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2f94:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2f98:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    2f9a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    2f9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 30e4 <DrawRect+0xaf0>
      if(yposmin <= 0) {
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    2fa2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    2fa4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 30d8 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2fa8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2faa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2fac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2fae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 3174 <DrawRect+0xb80>
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    2fb4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2fb6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 313a <DrawRect+0xb46>
    2fba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2fbc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2fbe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 3178 <DrawRect+0xb84>
          height *= -1;
    2fc2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    2fc4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2fc6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2fc8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 3140 <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2fcc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2fd0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    2fd2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 312a <DrawRect+0xb36>
    2fd6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2fd8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2fda:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2fde:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2fe0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2fe2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2fe4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2fe6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 3256 <DrawRect+0xc62>
    2fec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2ff0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2ff2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2ff8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2ffe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    3000:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    3002:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    3004:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    3006:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    3008:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    300a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    300c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    300e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    3010:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    3012:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3014:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    3016:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    301a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    301c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    301e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    3020:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    3022:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    3026:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    3028:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    302a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    302e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    3030:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    3032:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    3034:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    3038:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    303a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    303c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 3d2e8 <LookupSlope>,a0
    3042:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    3044:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    3046:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    304a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    304c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    3050:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    3052:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    3054:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 3108 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3058:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75a66>,d0
    305e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3062:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75a66>,d0
    3068:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    306c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 3062 <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    306e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    3072:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 89106 <BltCon0LineDraw>,a0
    3078:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    307a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    307c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    307e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75aa4>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    3084:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    3086:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    3088:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 8957a <PrepareBuffer>,a5
    308e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    3090:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 8957e <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    3096:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd75ab0>
  custom->bltcpt = (UBYTE *)bltdpt;
    309c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd75aac>
  custom->bltdpt = (UBYTE *)bltdpt;  
    30a2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75ab8>
  custom->bltbmod = bltbmod;
    30a8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd75ac6>
  custom->bltcmod = bltdmod;
    30b0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd75ac4>
  custom->bltdmod = bltdmod;
    30b6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd75aca>
  custom->bltsize = bltwidth + 64*height;
    30bc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    30be:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    30c0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    30c2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75abc>
  WORD x1 = square->Vertices[index1].X;
    30c8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    30cc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    30d0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    30d4:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 26f2 <DrawRect+0xfe>
        starty += 96;
    30d8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    30dc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    30e0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2fa8 <DrawRect+0x9b4>
        startx += 96;
    30e4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    30ea:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    30ee:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    30f2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    30f4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    30f6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2fa8 <DrawRect+0x9b4>
    30fa:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 30d8 <DrawRect+0xae4>
        height = -height;
    30fc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    30fe:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    3100:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    3102:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    3104:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 2f7e <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    3108:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 3d0fb <incbin_MercuryLetterData2Lz4_end+0x3d>
    310e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    3112:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 2582 <KPrintF>(pc)
    3116:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    3118:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    311c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd75a66>,d0
    3122:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    3126:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 3062 <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    312a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    312e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    3130:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    3132:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    3136:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2fde <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    313a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    313c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2fcc <DrawRect+0x9d8>
    3140:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    3144:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    3146:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    3148:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    314a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2fd6 <DrawRect+0x9e2>
    314e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 312a <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    3150:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    3152:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    3154:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    3156:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    315c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    315e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    3160:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    3164:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    3168:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    316c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    3170:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 27cc <DrawRect+0x1d8>
          height *= -1;
    3174:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    3176:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    3178:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    317c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    3180:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 31b0 <DrawRect+0xbbc>
    3182:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    3184:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3186:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    3188:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    318a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    318c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    318e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 319e <DrawRect+0xbaa>
    3190:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    3192:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3194:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3196:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    319a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2fde <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    319e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    31a2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    31a4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    31a6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    31a8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    31ac:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2fde <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    31b0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    31b4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31b6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31b8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31ba:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31bc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31be:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31c0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 3190 <DrawRect+0xb9c>
    31c2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 319e <DrawRect+0xbaa>
          height *= -1;
    31c4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    31c6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    31c8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    31cc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    31d0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 31ee <DrawRect+0xbfa>
    31d2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    31d4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31d6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    31d8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    31da:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    31dc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    31de:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 3200 <DrawRect+0xc0c>
    31e0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    31e2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    31e4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    31e6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    31ea:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2ba6 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    31ee:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    31f2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31f4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31f6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31f8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31fa:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31fc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31fe:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 31e0 <DrawRect+0xbec>
    3200:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    3204:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    3206:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    3208:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    320a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    320e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2ba6 <DrawRect+0x5b2>
        length *= -1;
    3212:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    3214:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    3216:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    3218:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    321c:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    3220:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    3226:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    3228:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    322a:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 2900 <DrawRect+0x30c>
    322e:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2a86 <DrawRect+0x492>
        length *= -1;
    3232:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    3234:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    3236:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    3238:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    323c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    3240:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    3244:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    3246:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    3248:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    324c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    324e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 2f7e <DrawRect+0x98a>
    3252:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 30fc <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    3256:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    3258:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    325a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    325c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    3260:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    3262:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    3264:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    3266:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    3268:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    326c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    326e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    3270:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    3274:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    327a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    327c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    327e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    3280:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3282:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    3284:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3286:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3288:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    328a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    328c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    328e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3290:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    3292:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3296:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3298:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    329a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    329c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    329e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    32a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    32a4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    32a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    32aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    32ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    32ae:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    32b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    32b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    32b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    32b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 3d2e8 <LookupSlope>,a0
    32be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    32c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    32c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    32c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    32c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    32cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    32ce:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    32d0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 3058 <DrawRect+0xa64>
    32d4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 3108 <DrawRect+0xb14>
        length *= -1;
    32d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    32da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    32dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    32de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    32e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    32e6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    32ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    32ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    32f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 2d52 <DrawRect+0x75e>
    32f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 2ed0 <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    32f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    32fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    32fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    32fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    3302:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    3304:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    3306:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    3308:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    330a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    330e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    3310:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3312:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    3314:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    3318:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    331e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    3320:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    3322:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    3324:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    3326:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    3328:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    332a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    332c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    332e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    3330:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    3332:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3334:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    3336:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    3338:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    333a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    333c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    333e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    3340:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    3342:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3344:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    3346:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3348:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    334a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    334c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    334e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    3350:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    3354:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    3356:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3358:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 3d2e8 <LookupSlope>,a1
    335e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    3360:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    3362:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    3366:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    3368:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    336a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    336c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2e38 <DrawRect+0x844>
    3370:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2ede <DrawRect+0x8ea>
        length *= -1;
    3374:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    3376:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    3378:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    337a:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    337e:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    3382:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    3386:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    3388:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    338a:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    338e:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    3390:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2b46 <DrawRect+0x552>
    3394:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 2cc4 <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3398:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    339a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    339c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    339e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    33a2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    33a4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    33a6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    33a8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    33aa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    33ae:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    33b0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    33b2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    33b6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    33bc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    33be:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    33c0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    33c2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    33c4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    33c6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    33c8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    33ca:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    33cc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    33ce:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    33d0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    33d2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    33d4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    33d8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    33da:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    33dc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33de:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33e0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    33e4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    33e6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33e8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    33ec:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33ee:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33f0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    33f2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    33f6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    33f8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33fa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 3d2e8 <LookupSlope>,a0
    3400:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    3402:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    3404:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    3408:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    340a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    340e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    3410:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    3412:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 2c20 <DrawRect+0x62c>
    3416:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 2cd0 <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    341a:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    341c:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    341e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    3420:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    3424:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    3426:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    3428:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    342a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    342c:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    3430:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    3432:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3434:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    3436:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    343a:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    3440:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    3442:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3444:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    3446:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3448:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    344a:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    344c:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    344e:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    3450:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3452:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    3454:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3456:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    3458:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    345a:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    345c:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    345e:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    3460:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    3462:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    3464:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3466:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    3468:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    346a:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    346c:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    346e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    3470:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    3472:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    3476:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    3478:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    347a:	|  |  |  |  |                                                  |  |  |                                                                                       lea 3d2e8 <LookupSlope>,a1
    3480:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    3482:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    3484:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    3488:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    348a:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    348c:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    348e:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    3490:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 29e8 <DrawRect+0x3f4>
    3494:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 2aac <DrawRect+0x4b8>
          height *= -1;
    3498:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    349a:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    349c:	|  |  |                                                        |     |                                                                                       tst.w d3
    349e:	|  |  |                                                        |     |                                                                                /----- blt.s 34cc <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    34a0:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    34a2:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    34a4:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    34a6:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 34b6 <DrawRect+0xec2>
    34a8:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    34aa:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34ac:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    34b2:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 2dc4 <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    34b6:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    34ba:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    34bc:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34be:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    34c4:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 2dc4 <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    34c8:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    34ca:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 34a0 <DrawRect+0xeac>
    34cc:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    34d0:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    34d2:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    34d4:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    34d6:	|  |  |                                                                                                                                         |  \-------- bpl.s 34a8 <DrawRect+0xeb4>
    34d8:	|  |  |                                                                                                                                         \----------- bra.s 34b6 <DrawRect+0xec2>
          height *= -1;
    34da:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    34dc:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    34de:	|     |                                                                                                                                                      tst.w d3
    34e0:	|     |                                                                                                                                               /----- blt.s 350e <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    34e2:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    34e4:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    34e6:	|     |                                                                                                                                               |  |   move.w a4,d0
    34e8:	|     |                                                                                                                                         /-----|--|-- bmi.s 34f8 <DrawRect+0xf04>
    34ea:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    34ec:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34ee:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34f4:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2972 <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    34f8:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    34fc:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    34fe:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    3500:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    3506:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2972 <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    350a:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    350c:	                                                                                                                                                |  |  |  \-- bge.s 34e2 <DrawRect+0xeee>
    350e:	                                                                                                                                                |  |  \----> addi.w #15,d3
    3512:	                                                                                                                                                |  |         asr.w #4,d3
    3514:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    3516:	                                                                                                                                                |  |         move.w a4,d0
    3518:	                                                                                                                                                |  \-------- bpl.s 34ea <DrawRect+0xef6>
    351a:	                                                                                                                                                \----------- bra.s 34f8 <DrawRect+0xf04>

0000351c <DrawCube3d>:
{
    351c:	                                                                                                                      lea -72(sp),sp
    3520:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    3524:	                                                                                                                      movea.l 120(sp),a2
    3528:	                                                                                                                      move.w 126(sp),108(sp)
    352e:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    3534:	                                                                                                                      move.w #0,dff042 <_end+0xd75aa6>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    353c:	                                                                                                                      move.l 8940c <ClearBuffer>,54(sp)
    3544:	                                                                                                                      lea 89108 <Cubes>,a3
    354a:	                                                                                                                      moveq #0,d5
    354c:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    354e:	|                                                                                                                     add.l d5,d2
    3550:	|                                                                                                                     move.l d2,102(sp)
    3554:	|                                                                                                                     add.l d5,d2
    3556:	|                                                                                                                     add.l d2,d2
    3558:	|                                                                                                                     add.l d2,d2
    355a:	|                                                                                                                     movea.l 54(sp),a0
    355e:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    3562:	|                                                                                                                     movea.l 89590 <GfxBase>,a6
    3568:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    356c:	|                                                                                                                     move.w #496,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0;
    3574:	|                                                                                                                     move.w #0,dff042 <_end+0xd75aa6>
  custom->bltdmod = bltmod;
    357c:	|                                                                                                                     move.w d3,dff066 <_end+0xd75aca>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    3582:	|                                                                                                                     move.l 8940c <ClearBuffer>,54(sp)
    358a:	|                                                                                                                     movea.l 54(sp),a4
    358e:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3592:	|                                                                                                                     cmpa.w #0,a6
    3596:	|                       /-------------------------------------------------------------------------------------------- bne.w 3ea0 <DrawCube3d+0x984>
    359a:	|                       |                                                                                             move.l d5,d1
    359c:	|                       |                                                                                             addq.l #1,d1
    359e:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    35a2:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    35a4:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    35aa:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    35ae:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    35b2:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    35b6:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    35ba:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    35be:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    35c2:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    35c8:	|                    |  |                                                                                             movea.w a0,a1
    35ca:	|                    |  |                                                                                             subq.l #1,a1
    35cc:	|                    |  |                                                                                             adda.l a1,a1
    35ce:	|                    |  |                                                                                             lea 42108 <zMult>,a5
    35d4:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    35da:	|                    |  |                                                                                             move.w 62(sp),d0
    35de:	|                    |  |                                                                                             muls.w d1,d0
    35e0:	|                    |  |                                                                                             moveq #15,d7
    35e2:	|                    |  |                                                                                             asr.l d7,d0
    35e4:	|                    |  |                                                                                             movea.l d0,a1
    35e6:	|                    |  |                                                                                             lea 160(a1),a1
    35ea:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    35ee:	|                    |  |                                                                                             move.w 62(sp),d7
    35f2:	|                    |  |                                                                                             muls.w 86(sp),d7
    35f6:	|                    |  |                                                                                             moveq #15,d0
    35f8:	|                    |  |                                                                                             asr.l d0,d7
    35fa:	|                    |  |                                                                                             addi.w #128,d7
    35fe:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3602:	|                    |  |                                                                                             movea.w 10(a2),a1
    3606:	|                    |  |                                                                                             subq.l #1,a1
    3608:	|                    |  |                                                                                             adda.l a1,a1
    360a:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    3610:	|                    |  |                                                                                             move.w 70(sp),d7
    3614:	|                    |  |                                                                                             muls.w 6(a2),d7
    3618:	|                    |  |                                                                                             asr.l d0,d7
    361a:	|                    |  |                                                                                             movea.l d7,a1
    361c:	|                    |  |                                                                                             lea 160(a1),a1
    3620:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3624:	|                    |  |                                                                                             move.w 70(sp),d7
    3628:	|                    |  |                                                                                             muls.w 8(a2),d7
    362c:	|                    |  |                                                                                             asr.l d0,d7
    362e:	|                    |  |                                                                                             addi.w #128,d7
    3632:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3636:	|                    |  |                                                                                             movea.w a4,a1
    3638:	|                    |  |                                                                                             move.l a1,d7
    363a:	|                    |  |                                                                                             subq.l #1,d7
    363c:	|                    |  |                                                                                             add.l d7,d7
    363e:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    3644:	|                    |  |                                                                                             move.w 76(sp),d0
    3648:	|                    |  |                                                                                             muls.w d4,d0
    364a:	|                    |  |                                                                                             moveq #15,d7
    364c:	|                    |  |                                                                                             asr.l d7,d0
    364e:	|                    |  |                                                                                             movea.l d0,a5
    3650:	|                    |  |                                                                                             lea 160(a5),a5
    3654:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3658:	|                    |  |                                                                                             move.w 76(sp),d7
    365c:	|                    |  |                                                                                             muls.w d3,d7
    365e:	|                    |  |                                                                                             moveq #15,d0
    3660:	|                    |  |                                                                                             asr.l d0,d7
    3662:	|                    |  |                                                                                             addi.w #128,d7
    3666:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    366a:	|                    |  |                                                                                             cmpa.w #0,a6
    366e:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 367a <DrawCube3d+0x15e>
    3670:	|                    |  |  |                                                                                          tst.w 89410 <DoNotClearDirty>
    3676:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 3e4e <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    367a:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    367e:	|                    |  |  |  |                                                                                       move.l a5,d7
    3680:	|                    |  |  |  |                                                                                       subq.l #1,d7
    3682:	|                    |  |  |  |                                                                                       add.l d7,d7
    3684:	|                    |  |  |  |                                                                                       lea 42108 <zMult>,a5
    368a:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    3690:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    3694:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3696:	|                    |  |  |  |                                                                                       moveq #15,d7
    3698:	|                    |  |  |  |                                                                                       asr.l d7,d0
    369a:	|                    |  |  |  |                                                                                       movea.l d0,a5
    369c:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    36a0:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    36a4:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    36a8:	|                    |  |  |  |                                                                                       muls.w d6,d7
    36aa:	|                    |  |  |  |                                                                                       moveq #15,d0
    36ac:	|                    |  |  |  |                                                                                       asr.l d0,d7
    36ae:	|                    |  |  |  |                                                                                       addi.w #128,d7
    36b2:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36b6:	|                    |  |  |  |                                                                                       move.l a1,d7
    36b8:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    36be:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36c0:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    36c2:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    36c6:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36c8:	|                    |  |  |  |                                                                                       muls.w d3,d0
    36ca:	|                    |  |  |  |                                                                                       movea.l d1,a5
    36cc:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    36ce:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36d0:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    36d2:	|                    |  |  |  |                                                                                       movea.w a0,a0
    36d4:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    36d6:	|                    |  |  |  |                                                                                       jsr 5a84 <__mulsi3>
    36dc:	|                    |  |  |  |                                                                                       addq.l #8,sp
    36de:	|                    |  |  |  |                                                                                       add.l a5,d0
    36e0:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    36e4:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    36e8:	|                    |  |  |  |                                                                                       neg.l d0
    36ea:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    36ee:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    36f2:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    36f6:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 3702 <DrawCube3d+0x1e6>
    36f8:	|                    |  |  |  |  |                                                                                    tst.w 89410 <DoNotClearDirty>
    36fe:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3e0e <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    3702:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    3706:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    3708:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    370a:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    370c:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    3710:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    3714:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3716:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    3718:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    371a:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    371c:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    371e:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    3722:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3724:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3726:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    3728:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    372a:	|                    |  |  |  |  |  |                                                                                 jsr 5a84 <__mulsi3>
    3730:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    3732:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    3734:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    3738:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    373a:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    373c:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    3740:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3744:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3748:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 375c <DrawCube3d+0x240>
    374a:	|  |                 |  |  |  |  |  |                                                                                 tst.w 89410 <DoNotClearDirty>
    3750:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 375c <DrawCube3d+0x240>
    3752:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3758:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 433e <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    375c:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    3760:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3766:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    376c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    3772:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3778:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    377e:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    3784:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    378a:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    378e:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    3792:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3796:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3798:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    379a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    379c:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    379e:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    37a0:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    37a2:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    37a4:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    37a6:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    37a8:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    37aa:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    37ac:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    37ae:	|  |  |              |  |  |  |  |  |                                                                                 jsr 5a84 <__mulsi3>
    37b4:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    37b6:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    37b8:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    37bc:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    37be:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    37c2:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    37c6:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37c8:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37ca:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37cc:	|  |  |              |  |  |  |  |  |                                                                                 lea 42108 <zMult>,a4
    37d2:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37d6:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    37d8:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    37dc:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    37de:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    37e0:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    37e4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    37e8:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37ea:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    37ec:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    37f0:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    37f4:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37f6:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37f8:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37fa:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37fe:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    3800:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    3804:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    3806:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    380a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    380e:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    3810:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    3814:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3816:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    3818:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    381a:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    381c:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    3820:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    3822:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    3824:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    3828:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    382a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    382c:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    382e:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    3832:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    3836:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    3838:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    383a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    383e:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    3840:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    3844:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3846:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3848:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    384a:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    384e:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    3850:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    3854:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3856:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3858:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    385a:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    385e:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3862:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3876 <DrawCube3d+0x35a>
    3864:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 89410 <DoNotClearDirty>
    386a:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3876 <DrawCube3d+0x35a>
    386c:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3872:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 42e6 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3876:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    387c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    3882:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3886:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    388a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    388e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    3892:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3896:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    389a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    389e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    38a2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    38a8:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    38ae:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    38b4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    38ba:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    38c0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    38c6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    38ca:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    38ce:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    38d2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    38d6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    38dc:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    38e2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    38e6:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 38fa <DrawCube3d+0x3de>
    38e8:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 89410 <DoNotClearDirty>
    38ee:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 38fa <DrawCube3d+0x3de>
    38f0:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    38f6:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 437e <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    38fa:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    3900:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    3906:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    390a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    390e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    3912:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    3916:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    391c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    3922:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    3928:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    392e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    3932:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3936:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    393a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    393e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    3944:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    394a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    3950:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3956:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    395a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    3960:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    3964:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3968:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    396e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    3974:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    397a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    3980:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    3984:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3988:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    398e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    3994:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3998:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    399c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    39a0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    39a4:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 354c <DrawCube3d+0x30>
    39a8:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 891c8 <Cubes+0xc0>,a6
    39ae:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    39b2:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    39b6:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    39ba:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    39c0:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    39c4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    39c8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    39cc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    39ce:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    39d0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    39d2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    39d8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    39de:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    39e2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    39e6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    39ea:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 3b4c <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    39ee:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    39f2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    39f6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 39e6 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    39f8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    39fc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    3a00:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 89414 <CubeNrReversePtr>,a0
    3a06:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    3a0a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    3a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 3d30 <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    3a10:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    3a12:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 3c96 <DrawCube3d+0x77a>
    3a16:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    3a18:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    3a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    3a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3ca6 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    3a22:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    3a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 3f02 <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    3a2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    3a32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 3a3a <DrawCube3d+0x51e>
    3a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    3a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    3a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    3a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 89418 <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    3a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    3a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    3a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3a62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    3a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    3a7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3a82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3a84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    3a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    3a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3aa0 <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3aa0 <DrawCube3d+0x584>
    3a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    3a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 3dc2 <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3ab6 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    3aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3ab6 <DrawCube3d+0x59a>
    3aac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 3dd0 <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    3aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 3acc <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 3acc <DrawCube3d+0x5b0>
    3ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 3d72 <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    3acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    3ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 3ae2 <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    3ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 3ae2 <DrawCube3d+0x5c6>
    3ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    3ade:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 3d80 <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    3ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    3ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 3af8 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    3aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 3af8 <DrawCube3d+0x5dc>
    3aee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    3af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 3d8e <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    3af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    3afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 3b0e <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3afe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    3b02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 3b0e <DrawCube3d+0x5f2>
    3b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    3b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 3d9c <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    3b0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    3b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    3b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    3b1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    3b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    3b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 39c0 <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 89418 <DrawBuffer>,a2
  if( mirroring == 1) {
    3b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 3f64 <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    3b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    3b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    3b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    3b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    3b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    3b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    3b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    3bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bde <DrawCube3d+0x6c2>
    3bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    3be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3be4 <DrawCube3d+0x6c8>
    3be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    3be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bea <DrawCube3d+0x6ce>
    3be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    3bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bf4 <DrawCube3d+0x6d8>
    3bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    3bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bfa <DrawCube3d+0x6de>
    3bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c02 <DrawCube3d+0x6e6>
    3c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    3c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    3c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c08 <DrawCube3d+0x6ec>
    3c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c0e <DrawCube3d+0x6f2>
    3c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    3c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c14 <DrawCube3d+0x6f8>
    3c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    3c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c1e <DrawCube3d+0x702>
    3c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    3c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c24 <DrawCube3d+0x708>
    3c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    3c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3c28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c2c <DrawCube3d+0x710>
    3c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3c4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c52 <DrawCube3d+0x736>
    3c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c5c <DrawCube3d+0x740>
    3c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c68 <DrawCube3d+0x74c>
    3c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c72 <DrawCube3d+0x756>
    3c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3c82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3c8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 39e6 <DrawCube3d+0x4ca>
    3c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 39f8 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    3c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    3c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    3c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    3c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    3ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 3a22 <DrawCube3d+0x506>
      if(maxycube < 0) {
    3ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3ef8 <DrawCube3d+0x9dc>
      minycube = 0;
    3cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    3cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3cc2 <DrawCube3d+0x7a6>
    3cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    3cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3cce <DrawCube3d+0x7b2>
    3cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 89418 <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    3ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3a46 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 3eb4 <DrawCube3d+0x998>
    3cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    3cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    3cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    3d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    3d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    3d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    3d14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    3d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    3d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3a62 <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    3d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3dde <DrawCube3d+0x8c2>
    3d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    3d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    3d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    3d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    3d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    3d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    3d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    3d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    3d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    3d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    3d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    3d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    3d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    3d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    3d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 3a16 <DrawCube3d+0x4fa>
    3d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 3c96 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    3d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    3d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    3d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 3acc <DrawCube3d+0x5b0>
    3d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    3d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    3d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 3ae2 <DrawCube3d+0x5c6>
    3d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    3d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    3d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 3af8 <DrawCube3d+0x5dc>
    3d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    3da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    3db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 39c0 <DrawCube3d+0x4a4>
    3dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 3b26 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    3dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3aa0 <DrawCube3d+0x584>
    3dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    3dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 25f4 <DrawRect>(pc)
    3dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3ab6 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    3de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    3de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    3df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    3df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    3e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    3e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    3e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 3d68 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3e0e:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    3e12:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3e14:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3e18:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3e1a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3e1c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    3e20:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e24:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd75a66>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e2a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd75a66>,d0
    3e30:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    3e34:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3e2a <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3e36:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    3e3c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    3e44:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd75abc>
}
    3e4a:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 3702 <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3e4e:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    3e52:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e54:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    3e58:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e5a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e5c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    3e60:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e66:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd75a66>,d7
    3e6c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    3e70:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e74:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd75a66>,d7
    3e7a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    3e7e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 3e74 <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    3e80:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    3e84:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    3e8a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    3e92:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd75abc>
      clearpos += 64*BPLHEIGHT;
    3e98:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    3e9c:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 367a <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3ea0:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 89410 <DoNotClearDirty>
    3ea6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 3f20 <DrawCube3d+0xa04>
    3ea8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3eaa:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3eac:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    3eb0:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 35a2 <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3eb4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3eb8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3eba:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3ebc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3ebe:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    3ec2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    3ec4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3ec6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3ec8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3ecc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3ece:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    3ed2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    3ed4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ed6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ed8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3eda:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3edc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3ede:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3ee2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3ee6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ee8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3eea:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3eec:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3eee:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    3ef0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    3ef4:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3a62 <DrawCube3d+0x546>
      if(maxycube < 0) {
    3ef8:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3efa:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3efe:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 3cb4 <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    3f02:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3f06:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3f08:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 3f10 <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3f0a:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3f0c:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 3cb4 <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    3f10:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    3f14:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3f18:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3f1c:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 3cb4 <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3f20:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    3f22:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    3f24:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3f28:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3f2a:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3f2c:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3f2e:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3f30:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3f32:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f36:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd75a66>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f3c:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd75a66>,d0
    3f42:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    3f46:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3f3c <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    3f48:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    3f4e:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    3f56:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd75abc>
      clearpos += 64*BPLHEIGHT;
    3f5c:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    3f60:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 35a2 <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3f64:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    3f68:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    3f6c:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    3f6e:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3f70:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3f72:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    3f76:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    3f7a:	|  |  |  |  |  |  |                                                                                                   movea.l 8957a <PrepareBuffer>,a6
    3f80:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    3f84:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    3f88:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    3f8a:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f8e:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f94:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    3f9a:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f9e:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f94 <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    3fa0:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd75aa8>
  custom->bltalwm = 0xffff; //Show All
    3fa8:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd75aaa>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    3fb0:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd75ad4>
  custom->bltamod = 60;
    3fb8:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd75ac8>
  custom->bltbmod = 60;
    3fc0:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd75ac6>
  custom->bltdmod = 60;    
    3fc8:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd75aca>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    3fd0:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x8002; //Ascending
    3fd8:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd75aa6>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3fe0:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    3fe2:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    3fe4:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3fe6:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3fe8:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3fea:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3fee:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    3ff0:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    3ff2:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    3ff4:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3ff6:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3ffa:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3ffc:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3ffe:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    4002:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    4006:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    400a:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    400c:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    400e:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    4010:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    4014:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    4018:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    401c:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    401e:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    4020:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    4024:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    4026:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    402a:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 4060 <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    402c:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd75ab4>
      custom->bltbpt = bltbpos;
    4032:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd75ab0>
      custom->bltdpt = bltdpos;
    4038:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd75ab8>
      custom->bltsize = 2 + height * 64;
    403e:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd75abc>
      bltapos -= 2;
    4044:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    4046:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    4048:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    404a:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd75a66>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4050:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd75a66>,d0
    4056:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    405a:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 4050 <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    405c:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    405e:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 402c <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    4060:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    4066:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    4068:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 4086 <DrawCube3d+0xb6a>
    406a:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    406c:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    4070:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    4074:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    4076:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    4078:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    407c:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    407e:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    4082:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 402c <DrawCube3d+0xb10>
    4084:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 4060 <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    4086:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    408e:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd75aa6>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    4096:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd75ad4>
  UWORD mod=64 - length*2-2;
    409e:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    40a0:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    40a2:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    40a4:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75ac8>
  custom->bltbmod = mod;
    40aa:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75ac6>
  custom->bltdmod = mod;
    40b0:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75aca>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40b6:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    40b8:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    40ba:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    40be:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    40c2:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    40c4:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40c6:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    40c8:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    40ca:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    40cc:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    40ce:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    40d0:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    40d2:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    40d8:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    40de:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    40e4:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40ea:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd75a66>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40f0:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d4
    40f6:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    40fa:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40f0 <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40fc:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    40fe:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    4102:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    4106:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    4108:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    410e:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    4110:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    4112:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    4118:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    411e:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    4124:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    412a:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4130:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    4136:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    413a:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4130 <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    413c:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0xe002;
    4144:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd75aa6>
  custom->bltcdat = 0x3333;
    414c:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd75ad4>
  custom->bltamod = mod;
    4154:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75ac8>
  custom->bltbmod = mod;
    415a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75ac6>
  custom->bltdmod = mod;
    4160:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75aca>
    custom->bltapt = bltapos;
    4166:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    416c:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    4172:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    4178:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    417e:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4184:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    418a:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    418e:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4184 <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    4190:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    4196:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    419c:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    41a2:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41a8:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41ae:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    41b4:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41b8:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41ae <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    41ba:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0xf002;
    41c2:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd75aa6>
  custom->bltcdat = 0x5555;
    41ca:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd75ad4>
  custom->bltamod = mod;
    41d2:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75ac8>
  custom->bltbmod = mod;
    41d8:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75ac6>
  custom->bltdmod = mod;
    41de:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75aca>
    custom->bltapt = bltapos;
    41e4:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    41ea:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    41f0:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    41f6:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41fc:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4202:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    4208:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    420c:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4202 <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    420e:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75ab4>
    custom->bltbpt = bltbpos;
    4214:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75ab0>
    custom->bltdpt = bltdpos;
    421a:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75ab8>
    custom->bltsize = length+1 + height * 64;
    4220:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4226:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    422c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    4232:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4236:	|  |  |  |  |  |  |                                                                                               \-- bne.s 422c <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    4238:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd75aa4>
  custom->bltcon1 = 0x0002;
    4240:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd75aa6>
  custom->bltcdat = 0x0;
    4248:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd75ad4>
  mod=64 -length*2;
    4250:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    4252:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    4254:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    4256:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd75ac8>
  custom->bltdmod = mod;
    425c:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd75aca>
  custom->bltafwm = bltfmask;
    4262:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd75aa8>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    426a:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    426e:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    4270:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4274:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd75ab4>
    custom->bltdpt = bltdpos;
    427a:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75ab8>
    custom->bltsize = length + height * 64;
    4280:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4286:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    428c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    4292:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4296:	|  |  |  |  |  |  |                                                                                               \-- bne.s 428c <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4298:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    429a:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    429e:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    42a0:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    42a4:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd75ab4>
    custom->bltdpt = bltdpos;
    42aa:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75ab8>
    custom->bltsize = length + height * 64;
    42b0:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd75abc>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42b6:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75a66>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    42bc:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75a66>,d0
    42c2:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    42c6:	|  |  |  |  |  |  |                                                                                               \-- bne.s 42bc <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    42c8:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd75aa8>
  DrawBuffer->minytotal = minytotal;
    42d0:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    42d6:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    42dc:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    42e0:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    42e4:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    42e6:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    42ea:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42ec:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    42f0:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42f2:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42f4:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    42f8:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42fe:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd75a66>,d6
    4304:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    4308:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    430c:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd75a66>,d6
    4312:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    4316:	|  |  |  |  |  |                                                                                                  \-- bne.s 430c <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    4318:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    431c:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    4320:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    4326:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    432e:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd75abc>
      clearpos += 64*BPLHEIGHT;
    4336:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    433a:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3876 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    433e:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4342:	|  |        |  |                                                                                                      add.l d0,d0
    4344:	|  |        |  |                                                                                                      add.l 94(sp),d0
    4348:	|  |        |  |                                                                                                      add.l d0,d0
    434a:	|  |        |  |                                                                                                      add.l d0,d0
    434c:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4350:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd75a66>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4356:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd75a66>,d0
    435c:	|  |        |  |                                                                                                  |   btst #14,d0
    4360:	|  |        |  |                                                                                                  \-- bne.s 4356 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    4362:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    4368:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    4370:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd75abc>
      clearpos += 64*BPLHEIGHT;
    4376:	|  |        |  |                                                                                                      lea 16384(a5),a5
    437a:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 375c <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    437e:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4382:	|           |                                                                                                         add.l d0,d0
    4384:	|           |                                                                                                         add.l 94(sp),d0
    4388:	|           |                                                                                                         add.l d0,d0
    438a:	|           |                                                                                                         add.l d0,d0
    438c:	|           |                                                                                                         movea.l 54(sp),a4
    4390:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4394:	|           |                                                                                                         move.w dff002 <_end+0xd75a66>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    439a:	|           |                                                                                                     /-> move.w dff002 <_end+0xd75a66>,d0
    43a0:	|           |                                                                                                     |   btst #14,d0
    43a4:	|           |                                                                                                     \-- bne.s 439a <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    43a6:	|           |                                                                                                         move.l a5,dff054 <_end+0xd75ab8>
    custom->bltadat = 0x0;
    43ac:	|           |                                                                                                         move.w #0,dff074 <_end+0xd75ad8>
    custom->bltsize = bltsize;    
    43b4:	|           |                                                                                                         move.w d6,dff058 <_end+0xd75abc>
    squares[3].Vertices[0].X = xs0;
    43ba:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    43c0:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    43c6:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    43ca:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    43ce:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    43d2:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    43d6:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    43dc:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    43e2:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    43e8:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    43ee:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    43f2:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    43f6:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    43fa:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    43fe:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    4404:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    440a:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    4410:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    4416:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    441a:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    4420:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    4424:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    4428:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    442e:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    4434:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    443a:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    4440:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    4444:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    4448:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    444e:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    4454:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    4458:	|           |                                                                                                         move.l 94(sp),d5
    445c:	|           |                                                                                                         lea 192(a3),a3
    4460:	|           |                                                                                                         cmp.w 106(sp),d5
    4464:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 354c <DrawCube3d+0x30>
    4468:	            \-------------------------------------------------------------------------------------------------------- bra.w 39a8 <DrawCube3d+0x48c>

0000446c <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    446c:	       link.w a5,#-52
    4470:	       move.l a2,-(sp)
    4472:	       move.l d2,-(sp)
    4474:	       movea.l 12(a5),a1
    4478:	       move.l 16(a5),d2
    447c:	       move.l 20(a5),d1
	struct debug_resource resource = {
    4480:	       clr.l -42(a5)
    4484:	       clr.l -38(a5)
    4488:	       clr.l -34(a5)
    448c:	       clr.l -30(a5)
    4490:	       clr.l -26(a5)
    4494:	       clr.l -22(a5)
    4498:	       clr.l -18(a5)
    449c:	       clr.l -14(a5)
    44a0:	       clr.w -10(a5)
    44a4:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    44aa:	       move.w d2,d0
    44ac:	       muls.w d1,d0
    44ae:	       lsl.l #6,d0
	struct debug_resource resource = {
    44b0:	       move.l d0,-46(a5)
    44b4:	       clr.w -8(a5)
    44b8:	       move.w #512,-6(a5)
    44be:	       move.w d2,-4(a5)
    44c2:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    44c6:	       move.b (a1),d0
    44c8:	       lea -42(a5),a0
    44cc:	/----- beq.s 44de <debug_register_bitmap.constprop.0+0x72>
    44ce:	|      lea -11(a5),a2
		*destination++ = *source++;
    44d2:	|  /-> addq.l #1,a1
    44d4:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    44d6:	|  |   move.b (a1),d0
    44d8:	+--|-- beq.s 44de <debug_register_bitmap.constprop.0+0x72>
    44da:	|  |   cmpa.l a0,a2
    44dc:	|  \-- bne.s 44d2 <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    44de:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    44e0:	       move.w f0ff60 <_end+0xe869c4>,d0
    44e6:	       cmpi.w #20153,d0
    44ea:	   /-- beq.s 44fe <debug_register_bitmap.constprop.0+0x92>
    44ec:	   |   cmpi.w #-24562,d0
    44f0:	   +-- beq.s 44fe <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    44f2:	   |   move.l -60(a5),d2
    44f6:	   |   movea.l -56(a5),a2
    44fa:	   |   unlk a5
    44fc:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    44fe:	   \-> clr.l -(sp)
    4500:	       clr.l -(sp)
    4502:	       pea -50(a5)
    4506:	       pea 4 <_start+0x4>
    450a:	       pea 58 <_start+0x58>
    450e:	       jsr f0ff60 <_end+0xe869c4>
}
    4514:	       lea 20(sp),sp
}
    4518:	       move.l -60(a5),d2
    451c:	       movea.l -56(a5),a2
    4520:	       unlk a5
    4522:	       rts

00004524 <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    4524:	                            lea -52(sp),sp
    4528:	                            movem.l d2-d7/a2-a6,-(sp)
    452c:	                            movea.l 100(sp),a2
    4530:	                            movea.l 104(sp),a5
    4534:	                            move.l 108(sp),d0
    4538:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    453c:	                            moveq #0,d2
    453e:	                            move.w d0,d2
    4540:	                            move.l d2,56(sp)
    4544:	                            tst.w d0
    4546:	/-------------------------- beq.s 45b6 <DrawLetters.isra.0+0x92>
    4548:	|                           clr.l 44(sp)
    454c:	|                           move.l #561416,60(sp)
    4554:	|                           lea 42108 <zMult>,a4
    455a:	|                           cmpi.w #1,d1
    455e:	|  /----------------------- beq.w 4740 <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4562:	|  |  /-------------------> moveq #0,d0
    4564:	|  |  |                     move.w (a5),d0
    4566:	|  |  |                     moveq #0,d3
    4568:	|  |  |                     move.w 2(a5),d3
    456c:	|  |  |                     movea.l d3,a0
    456e:	|  |  |                     move.l d0,d1
    4570:	|  |  |                     add.l d0,d1
    4572:	|  |  |                     add.l d1,d0
    4574:	|  |  |                     add.l d0,d0
    4576:	|  |  |                     adda.l d0,a0
    4578:	|  |  |                     move.l a0,d4
    457a:	|  |  |                     lsl.l #5,d4
    457c:	|  |  |                     movea.l d4,a0
    457e:	|  |  |                     adda.l 60(sp),a0
    4582:	|  |  |                     move.l 16(a0),d0
    4586:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    458a:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    458e:	|  |  |                     moveq #1,d2
    4590:	|  |  |                     cmp.l d0,d2
    4592:	|  |  |     /-------------- blt.w 4798 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4596:	|  |  |     |               movea.w d1,a0
    4598:	|  |  |     |               move.l a0,d0
    459a:	|  |  |     |               add.l a0,d0
    459c:	|  |  |     |               add.l a0,d0
    459e:	|  |  |     |               lsl.l #3,d0
    45a0:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    45a2:	|  |  |     |               addq.l #3,a0
    45a4:	|  |  |     |               adda.l a0,a0
    45a6:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    45a8:	|  |  |     |               addq.l #1,44(sp)
    45ac:	|  |  |     |               move.l 56(sp),d0
    45b0:	|  |  |     |               cmp.l 44(sp),d0
    45b4:	|  |  +-----|-------------- bne.s 4562 <DrawLetters.isra.0+0x3e>
}
    45b6:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    45ba:	|  |  |     |               lea 52(sp),sp
    45be:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    45c0:	|  |  |     |  /----------> tst.w d1
    45c2:	|  |  |  /--|--|----------- ble.w 4938 <DrawLetters.isra.0+0x414>
    45c6:	|  |  |  |  |  |            lea 6(a5),a6
    45ca:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    45cc:	|  |  |  |  |  |            lea 20(a0),a0
    45d0:	|  |  |  |  |  |            move.l a0,52(sp)
    45d4:	|  |  |  |  |  |            move.l a5,48(sp)
    45d8:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    45da:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    45de:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    45e2:	|  |  |  |  |  |  |         move.l a0,d0
    45e4:	|  |  |  |  |  |  |         subq.l #1,d0
    45e6:	|  |  |  |  |  |  |         add.l d0,d0
    45e8:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    45ec:	|  |  |  |  |  |  |         move.w d0,d1
    45ee:	|  |  |  |  |  |  |         muls.w (a2),d1
    45f0:	|  |  |  |  |  |  |         moveq #15,d4
    45f2:	|  |  |  |  |  |  |         asr.l d4,d1
    45f4:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    45f8:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    45fc:	|  |  |  |  |  |  |         asr.l d4,d0
    45fe:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4602:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    4606:	|  |  |  |  |  |  |         subq.l #1,a0
    4608:	|  |  |  |  |  |  |         adda.l a0,a0
    460a:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    460e:	|  |  |  |  |  |  |         move.w d2,d7
    4610:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    4614:	|  |  |  |  |  |  |         asr.l d4,d7
    4616:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    461a:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    461e:	|  |  |  |  |  |  |         asr.l d4,d2
    4620:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    4624:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    4628:	|  |  |  |  |  |  |         subq.l #1,a0
    462a:	|  |  |  |  |  |  |         adda.l a0,a0
    462c:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    4630:	|  |  |  |  |  |  |         move.w d3,d6
    4632:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    4636:	|  |  |  |  |  |  |         asr.l d4,d6
    4638:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    463c:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    4640:	|  |  |  |  |  |  |         asr.l d4,d3
    4642:	|  |  |  |  |  |  |         movea.w d3,a1
    4644:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4648:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    464c:	|  |  |  |  |  |  |         subq.l #1,a0
    464e:	|  |  |  |  |  |  |         adda.l a0,a0
    4650:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    4654:	|  |  |  |  |  |  |         move.w d3,d5
    4656:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    465a:	|  |  |  |  |  |  |         asr.l d4,d5
    465c:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    4660:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    4664:	|  |  |  |  |  |  |         asr.l d4,d3
    4666:	|  |  |  |  |  |  |         movea.w d3,a0
    4668:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    466c:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    4670:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    4674:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    4678:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    467c:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    4680:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4684:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4688:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    468c:	|  |  |  |  |  |  |         move.w d1,d4
    468e:	|  |  |  |  |  |  |         cmp.w d1,d7
    4690:	|  |  |  |  |  |  |     /-- bge.s 4694 <DrawLetters.isra.0+0x170>
    4692:	|  |  |  |  |  |  |     |   move.w d7,d4
    4694:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4696:	|  |  |  |  |  |  |     /-- bge.s 469a <DrawLetters.isra.0+0x176>
    4698:	|  |  |  |  |  |  |     |   move.w d6,d4
    469a:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    469c:	|  |  |  |  |  |  |     /-- bge.s 46a0 <DrawLetters.isra.0+0x17c>
    469e:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    46a0:	|  |  |  |  |  |  |     \-> move.w d0,d3
    46a2:	|  |  |  |  |  |  |         cmp.w d0,d2
    46a4:	|  |  |  |  |  |  |     /-- bge.s 46a8 <DrawLetters.isra.0+0x184>
    46a6:	|  |  |  |  |  |  |     |   move.w d2,d3
    46a8:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    46aa:	|  |  |  |  |  |  |     /-- ble.s 46ae <DrawLetters.isra.0+0x18a>
    46ac:	|  |  |  |  |  |  |     |   move.w a1,d3
    46ae:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    46b0:	|  |  |  |  |  |  |     /-- ble.s 46b4 <DrawLetters.isra.0+0x190>
    46b2:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    46b4:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    46b8:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    46bc:	|  |  |  |  |  |  |         cmp.w d0,d2
    46be:	|  |  |  |  |  |  |     /-- ble.s 46c2 <DrawLetters.isra.0+0x19e>
    46c0:	|  |  |  |  |  |  |     |   move.w d2,d0
    46c2:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    46c4:	|  |  |  |  |  |  |     /-- bge.s 46c8 <DrawLetters.isra.0+0x1a4>
    46c6:	|  |  |  |  |  |  |     |   move.w a1,d0
    46c8:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    46ca:	|  |  |  |  |  |  |     /-- bge.s 46ce <DrawLetters.isra.0+0x1aa>
    46cc:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    46ce:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    46d0:	|  |  |  |  |  |  |         sub.w d3,d0
    46d2:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    46d6:	|  |  |  |  |  |  |         cmpi.w #1,d0
    46da:	|  |  |  |  |  |  |  /----- ble.s 4718 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    46dc:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    46de:	|  |  |  |  |  |  |  |  /-- ble.s 46e2 <DrawLetters.isra.0+0x1be>
    46e0:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    46e2:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    46e4:	|  |  |  |  |  |  |  |  /-- ble.s 46e8 <DrawLetters.isra.0+0x1c4>
    46e6:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    46e8:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    46ea:	|  |  |  |  |  |  |  |  /-- ble.s 46ee <DrawLetters.isra.0+0x1ca>
    46ec:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    46ee:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    46f0:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    46f4:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    46f8:	|  |  |  |  |  |  |  +----- ble.s 4718 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    46fa:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46fe:	|  |  |  |  |  |  |  |      move.w (a0),d0
    4700:	|  |  |  |  |  |  |  |      neg.w d0
    4702:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    4706:	|  |  |  |  |  |  |  |      pea 64(sp)
    470a:	|  |  |  |  |  |  |  |      jsr 25f4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    470e:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    4712:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    4716:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    4718:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    471c:	|  |  |  |  |  |  |         addq.l #1,a3
    471e:	|  |  |  |  |  |  |         movea.w a5,a0
    4720:	|  |  |  |  |  |  |         cmpa.l a3,a0
    4722:	|  |  |  |  |  |  \-------- bgt.w 45da <DrawLetters.isra.0+0xb6>
    4726:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    472a:	|  |  |  |  |  |            addq.l #3,a0
    472c:	|  |  |  |  |  |            adda.l a0,a0
    472e:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4730:	|  |  |  |  |  |            addq.l #1,44(sp)
    4734:	|  |  |  |  |  |            move.l 56(sp),d0
    4738:	|  |  |  |  |  |            cmp.l 44(sp),d0
    473c:	+--|--|--|--|--|----------- beq.w 45b6 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4740:	|  >--|--|--|--|----------> moveq #0,d0
    4742:	|  |  |  |  |  |            move.w (a5),d0
    4744:	|  |  |  |  |  |            moveq #0,d1
    4746:	|  |  |  |  |  |            move.w 2(a5),d1
    474a:	|  |  |  |  |  |            movea.l d1,a0
    474c:	|  |  |  |  |  |            move.l d0,d1
    474e:	|  |  |  |  |  |            add.l d0,d1
    4750:	|  |  |  |  |  |            add.l d1,d0
    4752:	|  |  |  |  |  |            add.l d0,d0
    4754:	|  |  |  |  |  |            adda.l d0,a0
    4756:	|  |  |  |  |  |            move.l a0,d2
    4758:	|  |  |  |  |  |            lsl.l #5,d2
    475a:	|  |  |  |  |  |            movea.l d2,a0
    475c:	|  |  |  |  |  |            adda.l 60(sp),a0
    4760:	|  |  |  |  |  |            move.l 16(a0),d0
    4764:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4768:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    476c:	|  |  |  |  |  |            moveq #1,d3
    476e:	|  |  |  |  |  |            cmp.l d0,d3
    4770:	|  |  |  |  |  \----------- blt.w 45c0 <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    4774:	|  |  |  |  |               movea.w d1,a0
    4776:	|  |  |  |  |               move.l a0,d0
    4778:	|  |  |  |  |               add.l a0,d0
    477a:	|  |  |  |  |               add.l a0,d0
    477c:	|  |  |  |  |               lsl.l #3,d0
    477e:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4780:	|  |  |  |  |               addq.l #3,a0
    4782:	|  |  |  |  |               adda.l a0,a0
    4784:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4786:	|  |  |  |  |               addq.l #1,44(sp)
    478a:	|  |  |  |  |               move.l 56(sp),d0
    478e:	|  |  |  |  |               cmp.l 44(sp),d0
    4792:	|  +--|--|--|-------------- bne.s 4740 <DrawLetters.isra.0+0x21c>
    4794:	+--|--|--|--|-------------- bra.w 45b6 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4798:	|  |  |  |  \-------------> tst.w d1
    479a:	|  |  |  |     /----------- ble.w 491c <DrawLetters.isra.0+0x3f8>
    479e:	|  |  |  |     |            lea 6(a5),a6
    47a2:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    47a4:	|  |  |  |     |            lea 20(a0),a0
    47a8:	|  |  |  |     |            move.l a0,52(sp)
    47ac:	|  |  |  |     |            move.l a5,48(sp)
    47b0:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    47b2:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    47b6:	|  |  |  |     |  |         movea.w 4(a2),a0
    47ba:	|  |  |  |     |  |         move.l a0,d0
    47bc:	|  |  |  |     |  |         subq.l #1,d0
    47be:	|  |  |  |     |  |         add.l d0,d0
    47c0:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    47c4:	|  |  |  |     |  |         move.w d2,d7
    47c6:	|  |  |  |     |  |         muls.w (a2),d7
    47c8:	|  |  |  |     |  |         moveq #15,d3
    47ca:	|  |  |  |     |  |         asr.l d3,d7
    47cc:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    47d0:	|  |  |  |     |  |         muls.w 2(a2),d2
    47d4:	|  |  |  |     |  |         asr.l d3,d2
    47d6:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    47da:	|  |  |  |     |  |         movea.w 10(a2),a0
    47de:	|  |  |  |     |  |         move.l a0,d0
    47e0:	|  |  |  |     |  |         subq.l #1,d0
    47e2:	|  |  |  |     |  |         add.l d0,d0
    47e4:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    47e8:	|  |  |  |     |  |         move.w d0,d1
    47ea:	|  |  |  |     |  |         muls.w 6(a2),d1
    47ee:	|  |  |  |     |  |         asr.l d3,d1
    47f0:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    47f4:	|  |  |  |     |  |         muls.w 8(a2),d0
    47f8:	|  |  |  |     |  |         asr.l d3,d0
    47fa:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    47fe:	|  |  |  |     |  |         movea.w 16(a2),a0
    4802:	|  |  |  |     |  |         subq.l #1,a0
    4804:	|  |  |  |     |  |         adda.l a0,a0
    4806:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    480a:	|  |  |  |     |  |         move.w d3,d6
    480c:	|  |  |  |     |  |         muls.w 12(a2),d6
    4810:	|  |  |  |     |  |         moveq #15,d4
    4812:	|  |  |  |     |  |         asr.l d4,d6
    4814:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    4818:	|  |  |  |     |  |         muls.w 14(a2),d3
    481c:	|  |  |  |     |  |         asr.l d4,d3
    481e:	|  |  |  |     |  |         movea.w d3,a1
    4820:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4824:	|  |  |  |     |  |         movea.w 22(a2),a0
    4828:	|  |  |  |     |  |         subq.l #1,a0
    482a:	|  |  |  |     |  |         adda.l a0,a0
    482c:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    4830:	|  |  |  |     |  |         move.w d3,d5
    4832:	|  |  |  |     |  |         muls.w 18(a2),d5
    4836:	|  |  |  |     |  |         asr.l d4,d5
    4838:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    483c:	|  |  |  |     |  |         muls.w 20(a2),d3
    4840:	|  |  |  |     |  |         asr.l d4,d3
    4842:	|  |  |  |     |  |         movea.w d3,a0
    4844:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4848:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    484c:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    4850:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    4854:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4858:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    485c:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4860:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4864:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4868:	|  |  |  |     |  |         move.w d1,d4
    486a:	|  |  |  |     |  |         cmp.w d1,d7
    486c:	|  |  |  |     |  |     /-- bge.s 4870 <DrawLetters.isra.0+0x34c>
    486e:	|  |  |  |     |  |     |   move.w d7,d4
    4870:	|  |  |  |     |  |     \-> cmp.w d4,d6
    4872:	|  |  |  |     |  |     /-- bge.s 4876 <DrawLetters.isra.0+0x352>
    4874:	|  |  |  |     |  |     |   move.w d6,d4
    4876:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4878:	|  |  |  |     |  |     /-- bge.s 487c <DrawLetters.isra.0+0x358>
    487a:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    487c:	|  |  |  |     |  |     \-> move.w d0,d3
    487e:	|  |  |  |     |  |         cmp.w d0,d2
    4880:	|  |  |  |     |  |     /-- bge.s 4884 <DrawLetters.isra.0+0x360>
    4882:	|  |  |  |     |  |     |   move.w d2,d3
    4884:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4886:	|  |  |  |     |  |     /-- ble.s 488a <DrawLetters.isra.0+0x366>
    4888:	|  |  |  |     |  |     |   move.w a1,d3
    488a:	|  |  |  |     |  |     \-> cmp.w a0,d3
    488c:	|  |  |  |     |  |     /-- ble.s 4890 <DrawLetters.isra.0+0x36c>
    488e:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4890:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4894:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4898:	|  |  |  |     |  |         cmp.w d0,d2
    489a:	|  |  |  |     |  |     /-- ble.s 489e <DrawLetters.isra.0+0x37a>
    489c:	|  |  |  |     |  |     |   move.w d2,d0
    489e:	|  |  |  |     |  |     \-> cmp.w a1,d0
    48a0:	|  |  |  |     |  |     /-- bge.s 48a4 <DrawLetters.isra.0+0x380>
    48a2:	|  |  |  |     |  |     |   move.w a1,d0
    48a4:	|  |  |  |     |  |     \-> cmp.w a0,d0
    48a6:	|  |  |  |     |  |     /-- bge.s 48aa <DrawLetters.isra.0+0x386>
    48a8:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    48aa:	|  |  |  |     |  |     \-> addq.w #1,d0
    48ac:	|  |  |  |     |  |         sub.w d3,d0
    48ae:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    48b2:	|  |  |  |     |  |         cmpi.w #1,d0
    48b6:	|  |  |  |     |  |  /----- ble.s 48f0 <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    48b8:	|  |  |  |     |  |  |      cmp.w d1,d7
    48ba:	|  |  |  |     |  |  |  /-- ble.s 48be <DrawLetters.isra.0+0x39a>
    48bc:	|  |  |  |     |  |  |  |   move.w d7,d1
    48be:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    48c0:	|  |  |  |     |  |  |  /-- ble.s 48c4 <DrawLetters.isra.0+0x3a0>
    48c2:	|  |  |  |     |  |  |  |   move.w d6,d1
    48c4:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    48c6:	|  |  |  |     |  |  |  /-- ble.s 48ca <DrawLetters.isra.0+0x3a6>
    48c8:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    48ca:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    48cc:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    48d0:	|  |  |  |     |  |  |      cmpi.w #1,d1
    48d4:	|  |  |  |     |  |  +----- ble.s 48f0 <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    48d6:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48da:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    48de:	|  |  |  |     |  |  |      pea 64(sp)
    48e2:	|  |  |  |     |  |  |      jsr 25f4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    48e6:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48ea:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    48ee:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    48f0:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    48f4:	|  |  |  |     |  |         addq.l #1,a3
    48f6:	|  |  |  |     |  |         movea.w a5,a0
    48f8:	|  |  |  |     |  |         cmpa.l a0,a3
    48fa:	|  |  |  |     |  \-------- blt.w 47b2 <DrawLetters.isra.0+0x28e>
    48fe:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    4902:	|  |  |  |     |            addq.l #3,a0
    4904:	|  |  |  |     |            adda.l a0,a0
    4906:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4908:	|  |  |  |     |            addq.l #1,44(sp)
    490c:	|  |  |  |     |            move.l 56(sp),d0
    4910:	|  |  |  |     |            cmp.l 44(sp),d0
    4914:	|  |  +--|-----|----------- bne.w 4562 <DrawLetters.isra.0+0x3e>
    4918:	+--|--|--|-----|----------- bra.w 45b6 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    491c:	|  |  |  |     \----------> movea.w d1,a0
    491e:	|  |  |  |                  addq.l #3,a0
    4920:	|  |  |  |                  adda.l a0,a0
    4922:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4924:	|  |  |  |                  addq.l #1,44(sp)
    4928:	|  |  |  |                  move.l 56(sp),d0
    492c:	|  |  |  |                  cmp.l 44(sp),d0
    4930:	|  |  \--|----------------- bne.w 4562 <DrawLetters.isra.0+0x3e>
    4934:	+--|-----|----------------- bra.w 45b6 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4938:	|  |     \----------------> movea.w d1,a0
    493a:	|  |                        addq.l #3,a0
    493c:	|  |                        adda.l a0,a0
    493e:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4940:	|  |                        addq.l #1,44(sp)
    4944:	|  |                        move.l 56(sp),d0
    4948:	|  |                        cmp.l 44(sp),d0
    494c:	|  \----------------------- bne.w 4740 <DrawLetters.isra.0+0x21c>
    4950:	\-------------------------- bra.w 45b6 <DrawLetters.isra.0+0x92>

00004954 <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    4954:	          movem.l d2-d3/a2,-(sp)
    4958:	          move.l 36(sp),d3
    495c:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    4960:	          moveq #0,d1
    4962:	          move.w 89422 <vectorpos>,d1
    4968:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    496a:	          moveq #0,d0
    496c:	          move.w 89420 <VectorPosLetters>,d0
    4972:	          add.l d0,d0
    4974:	          addi.l #321516,d0
    497a:	          move.l d0,8941c <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4980:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    4982:	          tst.l d2
    4984:	          sne d0
    4986:	          ext.w d0
    4988:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    498a:	          neg.l d0
    498c:	          move.l d0,-(sp)
    498e:	          addi.l #372750,d1
    4994:	          move.l d1,-(sp)
    4996:	          jsr 351c <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    499a:	          clr.l -(sp)
    499c:	          move.l d3,-(sp)
    499e:	          move.l 40(sp),-(sp)
    49a2:	          move.l 8941c <ptrvectorletters>,-(sp)
    49a8:	          lea 4524 <DrawLetters.isra.0>(pc),a2
    49ac:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    49ae:	          lea 28(sp),sp
    49b2:	          tst.l d2
    49b4:	   /----- bne.w 4a4e <DrawDices+0xfa>
  CubeNrReversePos++;
    49b8:	/--|----> addq.w #1,44154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    49be:	|  |      move.w d3,d2
    49c0:	|  |      add.w d3,d2
    49c2:	|  |      add.w d3,d2
    49c4:	|  |      lsl.w #3,d2
    49c6:	|  |      add.w 89422 <vectorpos>,d2
    49cc:	|  |      move.w d2,89422 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    49d2:	|  |      move.w 30(sp),d0
    49d6:	|  |      add.w d0,d0
    49d8:	|  |      add.w 30(sp),d0
    49dc:	|  |      add.w d0,d0
    49de:	|  |      add.w d0,d0
    49e0:	|  |      add.w d0,89420 <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    49e6:	|  |      move.w 34(sp),d0
    49ea:	|  |      add.w d0,d0
    49ec:	|  |      add.w 34(sp),d0
    49f0:	|  |      add.w d0,d0
    49f2:	|  |      add.w d0,d0
    49f4:	|  |      add.w d0,89412 <VectorPosLettersReversed>
  SetCl( clminendpos);
    49fa:	|  |      move.l 44(sp),-(sp)
    49fe:	|  |      jsr 15ce <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    4a02:	|  |      andi.l #65535,d2
    4a08:	|  |      move.l 52(sp),-(sp)
    4a0c:	|  |      move.l d3,-(sp)
    4a0e:	|  |      jsr 5a84 <__mulsi3>
    4a14:	|  |      move.l d0,d1
    4a16:	|  |      add.l d1,d1
    4a18:	|  |      add.l d0,d1
    4a1a:	|  |      lsl.l #3,d1
    4a1c:	|  |      lea 12(sp),sp
    4a20:	|  |      cmp.l d2,d1
    4a22:	|  |  /-- bgt.s 4a46 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    4a24:	|  |  |   move.w #1,44154 <CubeNrReversePos>
    vectorpos = 0;
    4a2c:	|  |  |   clr.w 89422 <vectorpos>
    VectorPosLetters = 0;
    4a32:	|  |  |   clr.w 89420 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4a38:	|  |  |   clr.w 89412 <VectorPosLettersReversed>
    return 1;
    4a3e:	|  |  |   moveq #1,d0
}
    4a40:	|  |  |   movem.l (sp)+,d2-d3/a2
    4a44:	|  |  |   rts
    return 0;  
    4a46:	|  |  \-> clr.w d0
}
    4a48:	|  |      movem.l (sp)+,d2-d3/a2
    4a4c:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4a4e:	|  \----> moveq #0,d0
    4a50:	|         move.w 44154 <CubeNrReversePos>,d0
    4a56:	|         add.l d0,d0
    4a58:	|         add.l 16(sp),d0
    4a5c:	|         move.l d0,89414 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a62:	|         pea 1 <_start+0x1>
    4a66:	|         move.l d2,-(sp)
    4a68:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4a6c:	|         moveq #0,d0
    4a6e:	|         move.w 89412 <VectorPosLettersReversed>,d0
    4a74:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a76:	|         addi.l #281580,d0
    4a7c:	|         move.l d0,-(sp)
    4a7e:	|         jsr (a2)
    4a80:	|         lea 16(sp),sp
    4a84:	\-------- bra.w 49b8 <DrawDices+0x64>

00004a88 <End_PrepareDisplay.isra.0>:
}

int End_PrepareDisplay() {
    4a88:	          movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4a8c:	          movea.l 89598 <SysBase>,a6
    4a92:	          move.l #1360,d0
    4a98:	          moveq #2,d1
    4a9a:	          jsr -198(a6)
    4a9e:	          movea.l d0,a2
  if( retval == 0) {
    4aa0:	          tst.l d0
    4aa2:	   /----- beq.w 4cbc <End_PrepareDisplay.isra.0+0x234>
    *cl++ = *clpartinstruction++;
    4aa6:	/--|----> move.l 44034 <End_ClsSprites>,(a2)
    4aac:	|  |      move.l 44038 <End_ClsSprites+0x4>,4(a2)
    4ab4:	|  |      move.l 4403c <End_ClsSprites+0x8>,8(a2)
    4abc:	|  |      move.l 44040 <End_ClsSprites+0xc>,12(a2)
    4ac4:	|  |      move.l 44044 <End_ClsSprites+0x10>,16(a2)
    4acc:	|  |      move.l 44048 <End_ClsSprites+0x14>,20(a2)
    4ad4:	|  |      move.l 4404c <End_ClsSprites+0x18>,24(a2)
    4adc:	|  |      move.l 44050 <End_ClsSprites+0x1c>,28(a2)
    4ae4:	|  |      move.l 44054 <End_ClsSprites+0x20>,32(a2)
    4aec:	|  |      move.l 44058 <End_ClsSprites+0x24>,36(a2)
    4af4:	|  |      move.l 4405c <End_ClsSprites+0x28>,40(a2)
    4afc:	|  |      move.l 44060 <End_ClsSprites+0x2c>,44(a2)
    4b04:	|  |      move.l 44064 <End_ClsSprites+0x30>,48(a2)
    4b0c:	|  |      move.l 44068 <End_ClsSprites+0x34>,52(a2)
    4b14:	|  |      move.l 4406c <End_ClsSprites+0x38>,56(a2)
    4b1c:	|  |      move.l 44070 <End_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    4b24:	|  |      move.l 44004 <End_ClScreen>,64(a2)
    4b2c:	|  |      move.l 44008 <End_ClScreen+0x4>,68(a2)
    4b34:	|  |      move.l 4400c <End_ClScreen+0x8>,72(a2)
    4b3c:	|  |      move.l 44010 <End_ClScreen+0xc>,76(a2)
    4b44:	|  |      move.l 44014 <End_ClScreen+0x10>,80(a2)
    4b4c:	|  |      move.l 44018 <End_ClScreen+0x14>,84(a2)
    4b54:	|  |      move.l 4401c <End_ClScreen+0x18>,88(a2)
    4b5c:	|  |      move.l 44020 <End_ClScreen+0x1c>,92(a2)
    4b64:	|  |      move.l 44024 <End_ClScreen+0x20>,96(a2)
    4b6c:	|  |      move.l 44028 <End_ClScreen+0x24>,100(a2)
    4b74:	|  |      move.l 4402c <End_ClScreen+0x28>,104(a2)
    4b7c:	|  |      move.l 44030 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    4b84:	|  |      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    4b8a:	|  |      move.l #510204,d0
    4b90:	|  |      clr.w d0
    4b92:	|  |      swap d0
    4b94:	|  |      move.w d0,114(a2)
  *cw++ = 0x00e2;
    4b98:	|  |      move.w #226,116(a2)
  *cw++ = bpl1pointerlow;
    4b9e:	|  |      move.l #510204,d0
    4ba4:	|  |      move.w d0,118(a2)
  *cw++ = 0x00e4;
    4ba8:	|  |      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    4bae:	|  |      move.l #520444,d0
    4bb4:	|  |      clr.w d0
    4bb6:	|  |      swap d0
    4bb8:	|  |      move.w d0,122(a2)
  *cw++ = 0x00e6;
    4bbc:	|  |      move.w #230,124(a2)
  *cw++ = bpl2pointerlow;
    4bc2:	|  |      move.l #520444,d0
    4bc8:	|  |      move.w d0,126(a2)
  *cw++ = 0x00e8;
    4bcc:	|  |      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    4bd2:	|  |      move.l #530684,d0
    4bd8:	|  |      clr.w d0
    4bda:	|  |      swap d0
    4bdc:	|  |      move.w d0,130(a2)
  *cw++ = 0x00ea;
    4be0:	|  |      move.w #234,132(a2)
  *cw++ = bpl3pointerlow;  
    4be6:	|  |      move.l #530684,d0
    4bec:	|  |      move.w d0,134(a2)
  *cw++ = 0x00ec;
    4bf0:	|  |      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    4bf6:	|  |      move.l #540924,d0
    4bfc:	|  |      clr.w d0
    4bfe:	|  |      swap d0
    4c00:	|  |      move.w d0,138(a2)
  *cw++ = 0x00ee;
    4c04:	|  |      move.w #238,140(a2)
  *cw++ = bpl4pointerlow;  
    4c0a:	|  |      move.l #540924,d0
    4c10:	|  |      move.w d0,142(a2)
  *cw++ = 0x00f0;
    4c14:	|  |      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    4c1a:	|  |      move.l #551164,d0
    4c20:	|  |      clr.w d0
    4c22:	|  |      swap d0
    4c24:	|  |      move.w d0,146(a2)
  *cw++ = 0x00f2;
    4c28:	|  |      move.w #242,148(a2)
  *cw++ = bpl5pointerlow;  
    4c2e:	|  |      move.l #551164,d0
    4c34:	|  |      move.w d0,150(a2)
    *cl++ = *clpartinstruction++;
    4c38:	|  |      pea 80 <main+0x1a>
    4c3c:	|  |      pea dd54 <incbin_End_ClColor_start>
    4c42:	|  |      pea 152(a2)
    4c46:	|  |      jsr 5a18 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    4c4a:	|  |      move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    4c52:	|  |      move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    4c5a:	|  |      moveq #-2,d0
    4c5c:	|  |      move.l d0,288(a2)

  End_DrawCopper = End_ClBuild( );  
    4c60:	|  |      move.l a2,89100 <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    4c66:	|  |      movea.l 89598 <SysBase>,a6
    4c6c:	|  |      moveq #22,d0
    4c6e:	|  |      move.l #65537,d1
    4c74:	|  |      jsr -198(a6)
    4c78:	|  |      movea.l d0,a1
    4c7a:	|  |      lea 12(sp),sp
    4c7e:	|  |      tst.l d0
    4c80:	|  |  /-- beq.s 4c9c <End_PrepareDisplay.isra.0+0x214>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4c82:	|  |  |   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    4c88:	|  |  |   move.l #250156,10(a1)
    End_Vbint->is_Data = NULL;
    4c90:	|  |  |   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    4c94:	|  |  |   move.l #5566,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    4c9c:	|  |  \-> movea.l 89598 <SysBase>,a6
    4ca2:	|  |      moveq #4,d0
    4ca4:	|  |      jsr -168(a6)
void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    4ca8:	|  |      movea.l 89594 <custom>,a0
    4cae:	|  |      move.l 89100 <End_DrawCopper>,128(a0)
}
    4cb6:	|  |      movem.l (sp)+,d2-d3/a2/a6
    4cba:	|  |      rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    4cbc:	|  \----> movea.l 8958c <DOSBase>,a6
    4cc2:	|         jsr -60(a6)
    4cc6:	|         movea.l 8958c <DOSBase>,a6
    4ccc:	|         move.l d0,d1
    4cce:	|         move.l #250047,d2
    4cd4:	|         moveq #40,d3
    4cd6:	|         jsr -48(a6)
    Exit(1);
    4cda:	|         movea.l 8958c <DOSBase>,a6
    4ce0:	|         moveq #1,d1
    4ce2:	|         jsr -144(a6)
    4ce6:	\-------- bra.w 4aa6 <End_PrepareDisplay.isra.0+0x1e>

00004cea <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    4cea:	                         link.w a5,#-52
    4cee:	                         movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    4cf2:	                         clr.w 8958a <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    4cf8:	                         clr.l -42(a5)
    4cfc:	                         clr.l -38(a5)
    4d00:	                         clr.l -34(a5)
    4d04:	                         clr.l -30(a5)
    4d08:	                         clr.l -26(a5)
    4d0c:	                         clr.l -22(a5)
    4d10:	                         clr.l -18(a5)
    4d14:	                         clr.l -14(a5)
    4d18:	                         clr.l -10(a5)
    4d1c:	                         clr.l -6(a5)
    4d20:	                         clr.w -2(a5)
    4d24:	                         move.l #278528,-50(a5)
    4d2c:	                         moveq #4,d0
    4d2e:	                         move.l d0,-46(a5)
    4d32:	                         move.w #1,-10(a5)
    4d38:	                         move.w #2,-6(a5)
	while(*source && --num > 0)
    4d3e:	                         moveq #100,d0
	struct debug_resource resource = {
    4d40:	                         lea -42(a5),a0
    4d44:	                         lea 3d13a <incbin_MercuryLetterData2Lz4_end+0x7c>,a1
	while(*source && --num > 0)
    4d4a:	                         lea -11(a5),a2
		*destination++ = *source++;
    4d4e:	                  /----> addq.l #1,a1
    4d50:	                  |      move.b d0,(a0)+
	while(*source && --num > 0)
    4d52:	                  |      move.b (a1),d0
    4d54:	                  |  /-- beq.s 4d5a <Sw_PrepareDisplay.isra.0+0x70>
    4d56:	                  |  |   cmpa.l a0,a2
    4d58:	                  \--|-- bne.s 4d4e <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    4d5a:	                     \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    4d5c:	                         move.w f0ff60 <_end+0xe869c4>,d0
    4d62:	                         cmpi.w #20153,d0
    4d66:	                  /----- beq.w 4f0e <Sw_PrepareDisplay.isra.0+0x224>
    4d6a:	                  |      cmpi.w #-24562,d0
    4d6e:	                  +----- beq.w 4f0e <Sw_PrepareDisplay.isra.0+0x224>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4d72:	                  |      movea.l 89598 <SysBase>,a6
    4d78:	                  |      move.l #4000,d0
    4d7e:	                  |      moveq #2,d1
    4d80:	                  |      jsr -198(a6)
    4d84:	                  |      move.l d0,89486 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4d8a:	                  |      pea 1 <_start+0x1>
    4d8e:	                  |      pea 32 <_start+0x32>
    4d92:	                  |      pea 3d144 <incbin_MercuryLetterData2Lz4_end+0x86>
    4d98:	                  |      move.l d0,-(sp)
    4d9a:	                  |      lea 446c <debug_register_bitmap.constprop.0>(pc),a3
    4d9e:	                  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4da0:	                  |      pea 14 <_start+0x14>
    4da4:	                  |      pea 32 <_start+0x32>
    4da8:	                  |      move.l 89486 <Sw_FontBuffer>,-(sp)
    4dae:	                  |      lea c92 <Utils_FillLong.constprop.0>(pc),a2
    4db2:	                  |      jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4db4:	                  |      movea.l 89598 <SysBase>,a6
    4dba:	                  |      move.l #20560,d0
    4dc0:	                  |      moveq #2,d1
    4dc2:	                  |      jsr -198(a6)
    4dc6:	                  |      move.l d0,8948a <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4dcc:	                  |      lea 28(sp),sp
    4dd0:	      /-----------|----- beq.w 5038 <Sw_PrepareDisplay.isra.0+0x34e>
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    4dd4:	      |        /--|----> pea 1 <_start+0x1>
    4dd8:	      |        |  |      pea 101 <main+0x9b>
    4ddc:	      |        |  |      pea 3d17a <incbin_MercuryLetterData2Lz4_end+0xbc>
    4de2:	      |        |  |      move.l d0,-(sp)
    4de4:	      |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    4de6:	      |        |  |      pea 14 <_start+0x14>
    4dea:	      |        |  |      pea 100 <main+0x9a>
    4dee:	      |        |  |      move.l 8948a <Sw_ScreenBuffer3>,-(sp)
    4df4:	      |        |  |      jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4df6:	      |        |  |      movea.l 89598 <SysBase>,a6
    4dfc:	      |        |  |      move.l #20560,d0
    4e02:	      |        |  |      moveq #2,d1
    4e04:	      |        |  |      jsr -198(a6)
    4e08:	      |        |  |      move.l d0,8948e <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4e0e:	      |        |  |      lea 28(sp),sp
    4e12:	/-----|--------|--|----- beq.w 4fc2 <Sw_PrepareDisplay.isra.0+0x2d8>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4e16:	|  /--|--------|--|----> pea 1 <_start+0x1>
    4e1a:	|  |  |        |  |      pea 101 <main+0x9b>
    4e1e:	|  |  |        |  |      pea 3d1b3 <incbin_MercuryLetterData2Lz4_end+0xf5>
    4e24:	|  |  |        |  |      move.l d0,-(sp)
    4e26:	|  |  |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4e28:	|  |  |        |  |      pea 14 <_start+0x14>
    4e2c:	|  |  |        |  |      pea 100 <main+0x9a>
    4e30:	|  |  |        |  |      move.l 8948e <Sw_ScreenBuffer2>,-(sp)
    4e36:	|  |  |        |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4e38:	|  |  |        |  |      movea.l 89598 <SysBase>,a6
    4e3e:	|  |  |        |  |      move.l #20560,d0
    4e44:	|  |  |        |  |      moveq #2,d1
    4e46:	|  |  |        |  |      jsr -198(a6)
    4e4a:	|  |  |        |  |      move.l d0,89492 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4e50:	|  |  |        |  |      lea 28(sp),sp
    4e54:	|  |  |  /-----|--|----- beq.w 4f8e <Sw_PrepareDisplay.isra.0+0x2a4>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4e58:	|  |  |  |  /--|--|----> pea 1 <_start+0x1>
    4e5c:	|  |  |  |  |  |  |      pea 101 <main+0x9b>
    4e60:	|  |  |  |  |  |  |      pea 3d1c5 <incbin_MercuryLetterData2Lz4_end+0x107>
    4e66:	|  |  |  |  |  |  |      move.l d0,-(sp)
    4e68:	|  |  |  |  |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    4e6a:	|  |  |  |  |  |  |      pea 14 <_start+0x14>
    4e6e:	|  |  |  |  |  |  |      pea 100 <main+0x9a>
    4e72:	|  |  |  |  |  |  |      move.l 89492 <Sw_ScreenBuffer1>,-(sp)
    4e78:	|  |  |  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
    4e7a:	|  |  |  |  |  |  |      lea 111c <Sw_ClBuild>(pc),a2
    4e7e:	|  |  |  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ClBuild( );
    4e80:	|  |  |  |  |  |  |      jsr (a2)
    4e82:	|  |  |  |  |  |  |      move.l d0,89428 <Sw_DrawCopper>
void Sw_SwapCl() {

  /*ULONG tmp = (ULONG) Sw_DrawCopper;
  Sw_DrawCopper = Sw_ViewCopper;
  Sw_ViewCopper = (UWORD *)tmp;*/
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    4e88:	|  |  |  |  |  |  |      movea.l 89594 <custom>,a0
    4e8e:	|  |  |  |  |  |  |      move.l d0,128(a0)
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    4e92:	|  |  |  |  |  |  |      movea.l 89598 <SysBase>,a6
    4e98:	|  |  |  |  |  |  |      moveq #22,d0
    4e9a:	|  |  |  |  |  |  |      move.l #65537,d1
    4ea0:	|  |  |  |  |  |  |      jsr -198(a6)
    4ea4:	|  |  |  |  |  |  |      movea.l d0,a1
    4ea6:	|  |  |  |  |  |  |      move.l d0,89482 <Sw_Vbint>
    4eac:	|  |  |  |  |  |  |      lea 28(sp),sp
    4eb0:	|  |  |  |  |  |  |  /-- beq.s 4ecc <Sw_PrepareDisplay.isra.0+0x1e2>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4eb2:	|  |  |  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    4eb8:	|  |  |  |  |  |  |  |   move.l #250156,10(a1)
    Sw_Vbint->is_Data = NULL;
    4ec0:	|  |  |  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    4ec4:	|  |  |  |  |  |  |  |   move.l #5430,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    4ecc:	|  |  |  |  |  |  |  \-> movea.l 89598 <SysBase>,a6
    4ed2:	|  |  |  |  |  |  |      moveq #4,d0
    4ed4:	|  |  |  |  |  |  |      jsr -168(a6)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    4ed8:	|  |  |  |  |  |  |      move.l 89492 <Sw_ScreenBuffer1>,d0
    4ede:	|  |  |  |  |  |  |      move.l d0,8942c <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    4ee4:	|  |  |  |  |  |  |      move.l 8948e <Sw_ScreenBuffer2>,d1
    4eea:	|  |  |  |  |  |  |      move.l d1,89430 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    4ef0:	|  |  |  |  |  |  |      move.l d1,89434 <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    4ef6:	|  |  |  |  |  |  |      move.l d0,89438 <Sw_ScreenBufferList+0xc>
  Sw_InitComplete = 1;
    4efc:	|  |  |  |  |  |  |      move.w #1,8946a <Sw_InitComplete>
}
    4f04:	|  |  |  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    4f0a:	|  |  |  |  |  |  |      unlk a5
    4f0c:	|  |  |  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    4f0e:	|  |  |  |  |  |  \----> clr.l -(sp)
    4f10:	|  |  |  |  |  |         clr.l -(sp)
    4f12:	|  |  |  |  |  |         pea -50(a5)
    4f16:	|  |  |  |  |  |         pea 4 <_start+0x4>
    4f1a:	|  |  |  |  |  |         pea 58 <_start+0x58>
    4f1e:	|  |  |  |  |  |         jsr f0ff60 <_end+0xe869c4>
}
    4f24:	|  |  |  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4f28:	|  |  |  |  |  |         movea.l 89598 <SysBase>,a6
    4f2e:	|  |  |  |  |  |         move.l #4000,d0
    4f34:	|  |  |  |  |  |         moveq #2,d1
    4f36:	|  |  |  |  |  |         jsr -198(a6)
    4f3a:	|  |  |  |  |  |         move.l d0,89486 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4f40:	|  |  |  |  |  |         pea 1 <_start+0x1>
    4f44:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f48:	|  |  |  |  |  |         pea 3d144 <incbin_MercuryLetterData2Lz4_end+0x86>
    4f4e:	|  |  |  |  |  |         move.l d0,-(sp)
    4f50:	|  |  |  |  |  |         lea 446c <debug_register_bitmap.constprop.0>(pc),a3
    4f54:	|  |  |  |  |  |         jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4f56:	|  |  |  |  |  |         pea 14 <_start+0x14>
    4f5a:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f5e:	|  |  |  |  |  |         move.l 89486 <Sw_FontBuffer>,-(sp)
    4f64:	|  |  |  |  |  |         lea c92 <Utils_FillLong.constprop.0>(pc),a2
    4f68:	|  |  |  |  |  |         jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4f6a:	|  |  |  |  |  |         movea.l 89598 <SysBase>,a6
    4f70:	|  |  |  |  |  |         move.l #20560,d0
    4f76:	|  |  |  |  |  |         moveq #2,d1
    4f78:	|  |  |  |  |  |         jsr -198(a6)
    4f7c:	|  |  |  |  |  |         move.l d0,8948a <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4f82:	|  |  |  |  |  |         lea 28(sp),sp
    4f86:	|  |  |  |  |  \-------- bne.w 4dd4 <Sw_PrepareDisplay.isra.0+0xea>
    4f8a:	|  |  +--|--|----------- bra.w 5038 <Sw_PrepareDisplay.isra.0+0x34e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f8e:	|  |  |  >--|----------> movea.l 8958c <DOSBase>,a6
    4f94:	|  |  |  |  |            jsr -60(a6)
    4f98:	|  |  |  |  |            movea.l 8958c <DOSBase>,a6
    4f9e:	|  |  |  |  |            move.l d0,d1
    4fa0:	|  |  |  |  |            move.l #250252,d2
    4fa6:	|  |  |  |  |            moveq #38,d3
    4fa8:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4fac:	|  |  |  |  |            movea.l 8958c <DOSBase>,a6
    4fb2:	|  |  |  |  |            moveq #1,d1
    4fb4:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4fb8:	|  |  |  |  |            move.l 89492 <Sw_ScreenBuffer1>,d0
    4fbe:	|  |  |  |  +----------- bra.w 4e58 <Sw_PrepareDisplay.isra.0+0x16e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4fc2:	>--|--|--|--|----------> movea.l 8958c <DOSBase>,a6
    4fc8:	|  |  |  |  |            jsr -60(a6)
    4fcc:	|  |  |  |  |            movea.l 8958c <DOSBase>,a6
    4fd2:	|  |  |  |  |            move.l d0,d1
    4fd4:	|  |  |  |  |            move.l #250252,d2
    4fda:	|  |  |  |  |            moveq #38,d3
    4fdc:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4fe0:	|  |  |  |  |            movea.l 8958c <DOSBase>,a6
    4fe6:	|  |  |  |  |            moveq #1,d1
    4fe8:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4fec:	|  |  |  |  |            move.l 8948e <Sw_ScreenBuffer2>,d0
    4ff2:	|  |  |  |  |            pea 1 <_start+0x1>
    4ff6:	|  |  |  |  |            pea 101 <main+0x9b>
    4ffa:	|  |  |  |  |            pea 3d1b3 <incbin_MercuryLetterData2Lz4_end+0xf5>
    5000:	|  |  |  |  |            move.l d0,-(sp)
    5002:	|  |  |  |  |            jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    5004:	|  |  |  |  |            pea 14 <_start+0x14>
    5008:	|  |  |  |  |            pea 100 <main+0x9a>
    500c:	|  |  |  |  |            move.l 8948e <Sw_ScreenBuffer2>,-(sp)
    5012:	|  |  |  |  |            jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5014:	|  |  |  |  |            movea.l 89598 <SysBase>,a6
    501a:	|  |  |  |  |            move.l #20560,d0
    5020:	|  |  |  |  |            moveq #2,d1
    5022:	|  |  |  |  |            jsr -198(a6)
    5026:	|  |  |  |  |            move.l d0,89492 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    502c:	|  |  |  |  |            lea 28(sp),sp
    5030:	|  |  |  |  \----------- bne.w 4e58 <Sw_PrepareDisplay.isra.0+0x16e>
    5034:	|  |  |  \-------------- bra.w 4f8e <Sw_PrepareDisplay.isra.0+0x2a4>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    5038:	|  |  \----------------> movea.l 8958c <DOSBase>,a6
    503e:	|  |                     jsr -60(a6)
    5042:	|  |                     movea.l 8958c <DOSBase>,a6
    5048:	|  |                     move.l d0,d1
    504a:	|  |                     move.l #250195,d2
    5050:	|  |                     moveq #38,d3
    5052:	|  |                     jsr -48(a6)
    Exit(1);
    5056:	|  |                     movea.l 8958c <DOSBase>,a6
    505c:	|  |                     moveq #1,d1
    505e:	|  |                     jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    5062:	|  |                     move.l 8948a <Sw_ScreenBuffer3>,d0
    5068:	|  |                     pea 1 <_start+0x1>
    506c:	|  |                     pea 101 <main+0x9b>
    5070:	|  |                     pea 3d17a <incbin_MercuryLetterData2Lz4_end+0xbc>
    5076:	|  |                     move.l d0,-(sp)
    5078:	|  |                     jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    507a:	|  |                     pea 14 <_start+0x14>
    507e:	|  |                     pea 100 <main+0x9a>
    5082:	|  |                     move.l 8948a <Sw_ScreenBuffer3>,-(sp)
    5088:	|  |                     jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    508a:	|  |                     movea.l 89598 <SysBase>,a6
    5090:	|  |                     move.l #20560,d0
    5096:	|  |                     moveq #2,d1
    5098:	|  |                     jsr -198(a6)
    509c:	|  |                     move.l d0,8948e <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    50a2:	|  |                     lea 28(sp),sp
    50a6:	|  \-------------------- bne.w 4e16 <Sw_PrepareDisplay.isra.0+0x12c>
    50aa:	\----------------------- bra.w 4fc2 <Sw_PrepareDisplay.isra.0+0x2d8>

000050ae <DrawScreen>:
{    
    50ae:	                   lea -44(sp),sp
    50b2:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    50b6:	                   movea.l 89590 <GfxBase>,a6
    50bc:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    50c0:	                   move.w #-1,dff044 <_end+0xd75aa8>
  custom->bltalwm = 0xffff; //Static
    50c8:	                   move.w #-1,dff046 <_end+0xd75aaa>
  switch(Scene) {
    50d0:	                   cmpi.w #18,64ed6 <Scene>
    50d8:	         /-------- bhi.s 514c <DrawScreen+0x9e>
    50da:	         |         moveq #0,d0
    50dc:	         |         move.w 64ed6 <Scene>,d0
    50e2:	         |         add.l d0,d0
    50e4:	         |         move.w (50ec <DrawScreen+0x3e>,pc,d0.l),d0
    50e8:	         |         jmp (50ec <DrawScreen+0x3e>,pc,d0.w)
    50ec:	         |         ori.w #124,-(a0)
    50f0:	         |         ([,0)andi.b #-58,([0,a6],d0.w:2,0)
    50f6:	         |         ([,1104)bchg d1,([1046,d0.w:2],1104)
    50fe:	         |         .short 0x04e0
    5100:	         |         btst d2,(a6)+
    5102:	         |         movep.w d2,1476(a2)
    5106:	         |         ori.b #84,-(a6)
    510a:	         |         ori.l #113248044,6a <main+0x4>
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    5112:	         |         pea d0 <main+0x6a>
    5116:	         |         pea 1 <_start+0x1>
    511a:	         |         pea 2 <_start+0x2>
    511e:	         |         pea 3 <_start+0x3>
    5122:	         |         pea 6 <_start+0x6>
    5126:	         |         pea 9 <_start+0x9>
    512a:	         |         pea 441b6 <LetterMetaDataReversedAbyss>
    5130:	         |         pea 441ce <LetterMetaDataAbyss>
    5136:	         |         pea 441f2 <CubeNrReverseSizeAbyss>
    513c:	         |         jsr 4954 <DrawDices>(pc)
      break;  
    5140:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    5144:	         |         cmpi.w #1,d0
    5148:	         |  /----- beq.w 5312 <DrawScreen+0x264>
}
    514c:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    5150:	         |  |      lea 44(sp),sp
    5154:	         |  |      rts
      CubeFinished = 1;
    5156:	         |  |      move.w #1,89586 <CubeFinished>
}
    515e:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    5162:	         |  |      lea 44(sp),sp
    5166:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    5168:	         |  |      pea c3 <main+0x5d>
    516c:	         |  |      pea 1 <_start+0x1>
    5170:	         |  |      pea 3 <_start+0x3>
    5174:	         |  |      pea 3 <_start+0x3>
    5178:	         |  |      pea 8 <_start+0x8>
    517c:	         |  |      pea a <_start+0xa>
    5180:	         |  |      pea 64cec <LetterMetaDataReversedSpread>
    5186:	         |  |      pea 64d0e <LetterMetaDataSpread1>
    518c:	         |  |      pea 64d34 <CubeNrReverseSizeSpread>
    5192:	         |  |      jsr 4954 <DrawDices>(pc)
      break;
    5196:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    519a:	         |  |      cmpi.w #1,d0
    519e:	         +--|----- bne.s 514c <DrawScreen+0x9e>
    51a0:	         |  +----- bra.w 5312 <DrawScreen+0x264>
  ptrvector = VectorBuffer +  vectorpos;    
    51a4:	         |  |      moveq #0,d0
    51a6:	         |  |      move.w 89422 <vectorpos>,d0
    51ac:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    51ae:	         |  |      moveq #0,d1
    51b0:	         |  |      move.w 89420 <VectorPosLetters>,d1
    51b6:	         |  |      add.l d1,d1
    51b8:	         |  |      addi.l #321516,d1
    51be:	         |  |      move.l d1,8941c <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    51c4:	         |  |      pea 4 <_start+0x4>
    51c8:	         |  |      clr.l -(sp)
    51ca:	         |  |      addi.l #372750,d0
    51d0:	         |  |      move.l d0,-(sp)
    51d2:	         |  |      jsr 351c <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    51d6:	         |  |      movea.l 8941c <ptrvectorletters>,a2
    51dc:	         |  |      lea 12(sp),sp
    51e0:	         |  |      moveq #4,d0
    51e2:	         |  |      move.l d0,44(sp)
    51e6:	         |  |      lea 44184 <LetterMetaDataMercury1>,a5
    51ec:	         |  |      lea 42108 <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    51f2:	/--------|--|----> moveq #0,d0
    51f4:	|        |  |      move.w (a5),d0
    51f6:	|        |  |      moveq #0,d1
    51f8:	|        |  |      move.w 2(a5),d1
    51fc:	|        |  |      movea.l d1,a0
    51fe:	|        |  |      move.l d0,d1
    5200:	|        |  |      add.l d0,d1
    5202:	|        |  |      add.l d1,d0
    5204:	|        |  |      add.l d0,d0
    5206:	|        |  |      adda.l d0,a0
    5208:	|        |  |      move.l a0,d2
    520a:	|        |  |      lsl.l #5,d2
    520c:	|        |  |      movea.l d2,a0
    520e:	|        |  |      adda.l #561416,a0
    5214:	|        |  |      move.l 16(a0),d0
    5218:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    521c:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    5220:	|        |  |      moveq #1,d3
    5222:	|        |  |      cmp.l d0,d3
    5224:	|        |  |  /-- blt.w 5852 <DrawScreen+0x7a4>
      vectors += 12*metadata[2];
    5228:	|        |  |  |   movea.w d1,a0
    522a:	|        |  |  |   move.l a0,d0
    522c:	|        |  |  |   add.l a0,d0
    522e:	|        |  |  |   add.l a0,d0
    5230:	|        |  |  |   lsl.l #3,d0
    5232:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    5234:	|        |  |  |   addq.l #3,a0
    5236:	|        |  |  |   adda.l a0,a0
    5238:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    523a:	|        |  |  |   subq.l #1,44(sp)
    523e:	+--------|--|--|-- bne.s 51f2 <DrawScreen+0x144>
  CubeNrReversePos++;
    5240:	|  /-----|--|--|-> addq.w #1,44154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    5246:	|  |     |  |  |   move.w 89422 <vectorpos>,d2
    524c:	|  |     |  |  |   addi.w #96,d2
    5250:	|  |     |  |  |   move.w d2,89422 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    5256:	|  |     |  |  |   addi.w #156,89420 <VectorPosLetters>
  SetCl( clminendpos);
    525e:	|  |     |  |  |   pea 1 <_start+0x1>
    5262:	|  |     |  |  |   jsr 15ce <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    5266:	|  |     |  |  |   addq.l #4,sp
    5268:	|  |     |  |  |   cmpi.w #12767,d2
    526c:	|  |     +--|--|-- bls.w 514c <DrawScreen+0x9e>
    DoNotClearDirty = 1;
    5270:	|  |     |  |  |   move.w #1,89410 <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    5278:	|  |     |  |  |   cmpi.w #12959,d2
    527c:	|  |     +--|--|-- bls.w 514c <DrawScreen+0x9e>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    5280:	|  |     |  |  |   movea.l 8940c <ClearBuffer>,a2
    5286:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    528a:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    528e:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    5292:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    5296:	|  |     |  |  |   movea.l 89418 <DrawBuffer>,a1
    529c:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    52a0:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    52a4:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    52a8:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    52ac:	|  |     |  |  |   movea.l 89408 <ViewBuffer>,a0
    52b2:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    52b6:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    52ba:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    52be:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    52c2:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    52c6:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    52ca:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    52ce:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    52d2:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    52d6:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    52da:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    52de:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    52e2:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    52e6:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    52ea:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    52ee:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    52f2:	|  |     |  |  |   clr.w 89410 <DoNotClearDirty>
    CubeNrReversePos = 1;
    52f8:	|  |     |  |  |   move.w #1,44154 <CubeNrReversePos>
    vectorpos = 0;
    5300:	|  |     |  |  |   clr.w 89422 <vectorpos>
    VectorPosLetters = 0;
    5306:	|  |     |  |  |   clr.w 89420 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    530c:	|  |     |  |  |   clr.w 89412 <VectorPosLettersReversed>
  if(result == 1) Scene++;
    5312:	|  |     |  >--|-> addq.w #1,64ed6 <Scene>
}
    5318:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    531c:	|  |     |  |  |   lea 44(sp),sp
    5320:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    5322:	|  |     |  |  |   pea 2bd8 <DrawRect+0x5e4>
    5326:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    532c:	|  |     |  |  |   pea 200ee <incbin_PointCubeDataLz4_start>
    5332:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5336:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    5338:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    533e:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    5344:	|  |     |  |  |   move.l d2,-(sp)
    5346:	|  |     |  |  |   pea 2005a <incbin_PointCubeData_start>
    534c:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    5350:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    5352:	|  |     |  |  |   pea 251e <SetBplPointers+0x38>
    5356:	|  |     |  |  |   move.l d2,-(sp)
    5358:	|  |     |  |  |   pea 22d6e <incbin_PointLetterDataLz4_start>
    535e:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    5360:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    5366:	|  |     |  |  |   lea 32(sp),sp
    536a:	|  |     |  |  |   move.l #321516,(sp)
    5370:	|  |     |  |  |   move.l d2,-(sp)
    5372:	|  |     |  |  |   pea 22cda <incbin_PointLetterData_start>
    5378:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    537a:	|  |     |  |  |   pea 20d8 <LoadVectors+0x86>
    537e:	|  |     |  |  |   move.l d2,-(sp)
    5380:	|  |     |  |  |   pea 2531c <incbin_PointReversedLetterDataLz4_start>
    5386:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    5388:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    538e:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    5394:	|  |     |  |  |   pea 252a0 <incbin_PointReversedLetterData_start>
    539a:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    539c:	|  |     |  |  |   move.w #3,64ed6 <Scene>
    53a4:	|  |     |  |  |   lea 36(sp),sp
}
    53a8:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    53ac:	|  |     |  |  |   lea 44(sp),sp
    53b0:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    53b2:	|  |     |  |  |   pea d4 <main+0x6e>
    53b6:	|  |     |  |  |   pea 1 <_start+0x1>
    53ba:	|  |     |  |  |   pea 2 <_start+0x2>
    53be:	|  |     |  |  |   pea 3 <_start+0x3>
    53c2:	|  |     |  |  |   pea 5 <_start+0x5>
    53c6:	|  |     |  |  |   pea 6 <_start+0x6>
    53ca:	|  |     |  |  |   pea 449b6 <LetterMetaDataReversedPoint>
    53d0:	|  |     |  |  |   pea 449cc <LetterMetaDataPoint>
    53d6:	|  |     |  |  |   pea 449ea <CubeNrReverseSizePoint>
    53dc:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    53e0:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    53e4:	|  |     |  |  |   cmpi.w #1,d0
    53e8:	|  |     +--|--|-- bne.w 514c <DrawScreen+0x9e>
    53ec:	|  |     |  +--|-- bra.w 5312 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    53f0:	|  |     |  |  |   pea 24cd <Clbuild+0x347>
    53f4:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    53fa:	|  |     |  |  |   pea 1b010 <incbin_TekCubeDataLz4_start>
    5400:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5404:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    5406:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    540c:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    5412:	|  |     |  |  |   move.l d2,-(sp)
    5414:	|  |     |  |  |   pea 1af7c <incbin_TekCubeData_start>
    541a:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    541e:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    5420:	|  |     |  |  |   pea 2a8f <DrawRect+0x49b>
    5424:	|  |     |  |  |   move.l d2,-(sp)
    5426:	|  |     |  |  |   pea 1d5b6 <incbin_TekLetterDataLz4_start>
    542c:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    542e:	|  |     |  |  |   lea 32(sp),sp
    5432:	|  |     |  |  |   move.l #321516,(sp)
    5438:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    543e:	|  |     |  |  |   pea 1d4f2 <incbin_TekLetterData_start>
    5444:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    5446:	|  |     |  |  |   move.w #5,64ed6 <Scene>
    544e:	|  |     |  |  |   lea 12(sp),sp
}
    5452:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5456:	|  |     |  |  |   lea 44(sp),sp
    545a:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    545c:	|  |     |  |  |   pea 98 <main+0x32>
    5460:	|  |     |  |  |   pea 1 <_start+0x1>
    5464:	|  |     |  |  |   clr.l -(sp)
    5466:	|  |     |  |  |   pea 3 <_start+0x3>
    546a:	|  |     |  |  |   clr.l -(sp)
    546c:	|  |     |  |  |   pea 8 <_start+0x8>
    5470:	|  |     |  |  |   pea 4478c <LetterMetaDataTek>
    5476:	|  |     |  |  |   pea 4478c <LetterMetaDataTek>
    547c:	|  |     |  |  |   pea 447ae <CubeNrReverseSizeTek>
    5482:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    5486:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    548a:	|  |     |  |  |   cmpi.w #1,d0
    548e:	|  |     +--|--|-- bne.w 514c <DrawScreen+0x9e>
    5492:	|  |     |  +--|-- bra.w 5312 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    5496:	|  |     |  |  |   pea 2be6 <DrawRect+0x5f2>
    549a:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    54a0:	|  |     |  |  |   pea 274cc <incbin_FlexCubeDataLz4_start>
    54a6:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    54aa:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    54ac:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    54b2:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    54b8:	|  |     |  |  |   move.l d2,-(sp)
    54ba:	|  |     |  |  |   pea 27408 <incbin_FlexCubeData_start>
    54c0:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    54c4:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    54c6:	|  |     |  |  |   pea 30a1 <DrawRect+0xaad>
    54ca:	|  |     |  |  |   move.l d2,-(sp)
    54cc:	|  |     |  |  |   pea 2a1ba <incbin_FlexLetterDataLz4_start>
    54d2:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    54d4:	|  |     |  |  |   lea 32(sp),sp
    54d8:	|  |     |  |  |   move.l #321516,(sp)
    54de:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    54e4:	|  |     |  |  |   pea 2a0c6 <incbin_FlexLetterData_start>
    54ea:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    54ec:	|  |     |  |  |   move.w #7,64ed6 <Scene>
    54f4:	|  |     |  |  |   lea 12(sp),sp
}
    54f8:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    54fc:	|  |     |  |  |   lea 44(sp),sp
    5500:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    5502:	|  |     |  |  |   pea af <main+0x49>
    5506:	|  |     |  |  |   pea 1 <_start+0x1>
    550a:	|  |     |  |  |   clr.l -(sp)
    550c:	|  |     |  |  |   pea 4 <_start+0x4>
    5510:	|  |     |  |  |   clr.l -(sp)
    5512:	|  |     |  |  |   pea a <_start+0xa>
    5516:	|  |     |  |  |   pea 44760 <LetterMetaDataFlex>
    551c:	|  |     |  |  |   pea 44760 <LetterMetaDataFlex>
    5522:	|  |     |  |  |   pea 64d34 <CubeNrReverseSizeSpread>
    5528:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    552c:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5530:	|  |     |  |  |   cmpi.w #1,d0
    5534:	|  |     +--|--|-- bne.w 514c <DrawScreen+0x9e>
    5538:	|  |     |  +--|-- bra.w 5312 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    553c:	|  |     |  |  |   pea 23ad <Clbuild+0x227>
    5540:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    5546:	|  |     |  |  |   pea 2d304 <incbin_DesireCubeDataLz4_start>
    554c:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5550:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    5552:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    5558:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    555e:	|  |     |  |  |   move.l d2,-(sp)
    5560:	|  |     |  |  |   pea 2d270 <incbin_DesireCubeData_start>
    5566:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    556a:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    556c:	|  |     |  |  |   pea 286a <DrawRect+0x276>
    5570:	|  |     |  |  |   move.l d2,-(sp)
    5572:	|  |     |  |  |   pea 2f78a <incbin_DesireLetterDataLz4_start>
    5578:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    557a:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    5580:	|  |     |  |  |   lea 32(sp),sp
    5584:	|  |     |  |  |   move.l #321516,(sp)
    558a:	|  |     |  |  |   move.l d2,-(sp)
    558c:	|  |     |  |  |   pea 2f6c6 <incbin_DesireLetterData_start>
    5592:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    5594:	|  |     |  |  |   pea 27ff <DrawRect+0x20b>
    5598:	|  |     |  |  |   move.l d2,-(sp)
    559a:	|  |     |  |  |   pea 320cc <incbin_DesireReversedLetterDataLz4_start>
    55a0:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    55a2:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    55a8:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    55ae:	|  |     |  |  |   pea 32008 <incbin_DesireReversedLetterData_start>
    55b4:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    55b6:	|  |     |  |  |   move.w #9,64ed6 <Scene>
    55be:	|  |     |  |  |   lea 36(sp),sp
}
    55c2:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    55c6:	|  |     |  |  |   lea 44(sp),sp
    55ca:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    55cc:	|  |     |  |  |   pea af <main+0x49>
    55d0:	|  |     |  |  |   pea 1 <_start+0x1>
    55d4:	|  |     |  |  |   pea 3 <_start+0x3>
    55d8:	|  |     |  |  |   pea 3 <_start+0x3>
    55dc:	|  |     |  |  |   pea 8 <_start+0x8>
    55e0:	|  |     |  |  |   pea 8 <_start+0x8>
    55e4:	|  |     |  |  |   pea 4457a <LetterMetaDataReversedDesire>
    55ea:	|  |     |  |  |   pea 4459c <LetterMetaDataDesire>
    55f0:	|  |     |  |  |   pea 445be <CubeNrReverseSizeDesire>
    55f6:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    55fa:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    55fe:	|  |     |  |  |   cmpi.w #1,d0
    5602:	|  |     +--|--|-- bne.w 514c <DrawScreen+0x9e>
    5606:	|  |     |  +--|-- bra.w 5312 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    560a:	|  |     |  |  |   pea 24f2 <SetBplPointers+0xc>
    560e:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    5614:	|  |     |  |  |   pea 15d42 <incbin_AtwCubeDataLz4_start>
    561a:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    561e:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    5620:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    5626:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    562c:	|  |     |  |  |   move.l d2,-(sp)
    562e:	|  |     |  |  |   pea 15cae <incbin_AtwCubeData_start>
    5634:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    5638:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    563a:	|  |     |  |  |   pea 2c5b <DrawRect+0x667>
    563e:	|  |     |  |  |   move.l d2,-(sp)
    5640:	|  |     |  |  |   pea 1830c <incbin_AtwLetterDataLz4_start>
    5646:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    5648:	|  |     |  |  |   lea 32(sp),sp
    564c:	|  |     |  |  |   move.l #321516,(sp)
    5652:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    5658:	|  |     |  |  |   pea 18248 <incbin_AtwLetterData_start>
    565e:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    5660:	|  |     |  |  |   move.w #11,64ed6 <Scene>
    5668:	|  |     |  |  |   lea 12(sp),sp
}
    566c:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5670:	|  |     |  |  |   lea 44(sp),sp
    5674:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    5676:	|  |     |  |  |   pea c8 <main+0x62>
    567a:	|  |     |  |  |   pea 1 <_start+0x1>
    567e:	|  |     |  |  |   clr.l -(sp)
    5680:	|  |     |  |  |   pea 3 <_start+0x3>
    5684:	|  |     |  |  |   clr.l -(sp)
    5686:	|  |     |  |  |   pea 8 <_start+0x8>
    568a:	|  |     |  |  |   pea 44394 <LetterMetaDataReversedAtw>
    5690:	|  |     |  |  |   pea 443b6 <LetterMetaDataAtw>
    5696:	|  |     |  |  |   pea 443d8 <CubeNrReverseAtw>
    569c:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    56a0:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    56a4:	|  |     |  |  |   cmpi.w #1,d0
    56a8:	|  |     +--|--|-- bne.w 514c <DrawScreen+0x9e>
    56ac:	|  |     |  +--|-- bra.w 5312 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    56b0:	|  |     |  |  |   pea 28fa <DrawRect+0x306>
    56b4:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    56ba:	|  |     |  |  |   pea de6a <incbin_AbyssCubeDataLz4_start>
    56c0:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    56c4:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    56c6:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    56cc:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    56d2:	|  |     |  |  |   move.l d2,-(sp)
    56d4:	|  |     |  |  |   pea ddd6 <incbin_AbyssCubeData_start>
    56da:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    56de:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    56e0:	|  |     |  |  |   pea 30ff <DrawRect+0xb0b>
    56e4:	|  |     |  |  |   move.l d2,-(sp)
    56e6:	|  |     |  |  |   pea 10854 <incbin_AbyssLetterDataLz4_start>
    56ec:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    56ee:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    56f4:	|  |     |  |  |   lea 32(sp),sp
    56f8:	|  |     |  |  |   move.l #321516,(sp)
    56fe:	|  |     |  |  |   move.l d2,-(sp)
    5700:	|  |     |  |  |   pea 10778 <incbin_AbyssLetterData_start>
    5706:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    5708:	|  |     |  |  |   pea 229d <Clbuild+0x117>
    570c:	|  |     |  |  |   move.l d2,-(sp)
    570e:	|  |     |  |  |   pea 139fc <incbin_AbyssReversedLetterDataLz4_start>
    5714:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    5716:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    571c:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    5722:	|  |     |  |  |   pea 13968 <incbin_AbyssReversedLetterData_start>
    5728:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    572a:	|  |     |  |  |   move.w #13,64ed6 <Scene>
    5732:	|  |     |  |  |   lea 36(sp),sp
}
    5736:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    573a:	|  |     |  |  |   lea 44(sp),sp
    573e:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    5740:	|  |     |  |  |   pea 2003 <SetCl+0xa35>
    5744:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    574a:	|  |     |  |  |   pea 349a4 <incbin_MercuryCubeData1Lz4_start>
    5750:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5754:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    5756:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    575c:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    5762:	|  |     |  |  |   move.l d2,-(sp)
    5764:	|  |     |  |  |   pea 348e0 <incbin_MercuryCubeData1_start>
    576a:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    576e:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    5770:	|  |     |  |  |   pea 2b27 <DrawRect+0x533>
    5774:	|  |     |  |  |   move.l d2,-(sp)
    5776:	|  |     |  |  |   pea 36af8 <incbin_MercuryLetterData1Lz4_start>
    577c:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    577e:	|  |     |  |  |   lea 32(sp),sp
    5782:	|  |     |  |  |   move.l #321516,(sp)
    5788:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    578e:	|  |     |  |  |   pea 369bc <incbin_MercuryLetterData1_start>
    5794:	|  |     |  |  |   jsr (a2)
      Scene = 15;
    5796:	|  |     |  |  |   move.w #15,64ed6 <Scene>
    579e:	|  |     |  |  |   lea 12(sp),sp
}
    57a2:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    57a6:	|  |     |  |  |   lea 44(sp),sp
    57aa:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    57ac:	|  |     |  |  |   pea 1928 <SetCl+0x35a>
    57b0:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    57b6:	|  |     |  |  |   pea 396f8 <incbin_MercuryCubeData2Lz4_start>
    57bc:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    57c0:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    57c2:	|  |     |  |  |   move.l 89582 <WorkingMem>,d2
    57c8:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    57ce:	|  |     |  |  |   move.l d2,-(sp)
    57d0:	|  |     |  |  |   pea 39634 <incbin_MercuryCubeData2_start>
    57d6:	|  |     |  |  |   lea 2052 <LoadVectors>(pc),a2
    57da:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    57dc:	|  |     |  |  |   pea 1f6b <SetCl+0x99d>
    57e0:	|  |     |  |  |   move.l d2,-(sp)
    57e2:	|  |     |  |  |   pea 3b140 <incbin_MercuryLetterData2Lz4_start>
    57e8:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    57ea:	|  |     |  |  |   lea 32(sp),sp
    57ee:	|  |     |  |  |   move.l #321516,(sp)
    57f4:	|  |     |  |  |   move.l 89582 <WorkingMem>,-(sp)
    57fa:	|  |     |  |  |   pea 3b034 <incbin_MercuryLetterData2_start>
    5800:	|  |     |  |  |   jsr (a2)
      Scene = 17;
    5802:	|  |     |  |  |   move.w #17,64ed6 <Scene>
    580a:	|  |     |  |  |   lea 12(sp),sp
}
    580e:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5812:	|  |     |  |  |   lea 44(sp),sp
    5816:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    5818:	|  |     |  |  |   pea 84 <main+0x1e>
    581c:	|  |     |  |  |   pea 6e <main+0x8>
    5820:	|  |     |  |  |   clr.l -(sp)
    5822:	|  |     |  |  |   pea 4 <_start+0x4>
    5826:	|  |     |  |  |   clr.l -(sp)
    5828:	|  |     |  |  |   pea b <_start+0xb>
    582c:	|  |     |  |  |   pea 44156 <LetterMetaDataMercury2>
    5832:	|  |     |  |  |   pea 44156 <LetterMetaDataMercury2>
    5838:	|  |     |  |  |   pea 443d8 <CubeNrReverseAtw>
    583e:	|  |     |  |  |   jsr 4954 <DrawDices>(pc)
      break;
    5842:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5846:	|  |     |  |  |   cmpi.w #1,d0
    584a:	|  |     \--|--|-- bne.w 514c <DrawScreen+0x9e>
    584e:	|  |        \--|-- bra.w 5312 <DrawScreen+0x264>
      for(int i=0;i<metadata[2];i++)
    5852:	|  |           \-> tst.w d1
    5854:	|  |  /----------- ble.w 59ca <DrawScreen+0x91c>
    5858:	|  |  |            lea 6(a5),a6
    585c:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    585e:	|  |  |            lea 20(a0),a0
    5862:	|  |  |            move.l a0,52(sp)
    5866:	|  |  |            move.l a5,48(sp)
    586a:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    586c:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    5870:	|  |  |  |         movea.w 4(a2),a0
    5874:	|  |  |  |         move.l a0,d0
    5876:	|  |  |  |         subq.l #1,d0
    5878:	|  |  |  |         add.l d0,d0
    587a:	|  |  |  |         move.w (0,a4,d0.l),d0
    587e:	|  |  |  |         move.w d0,d1
    5880:	|  |  |  |         muls.w (a2),d1
    5882:	|  |  |  |         moveq #15,d4
    5884:	|  |  |  |         asr.l d4,d1
    5886:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    588a:	|  |  |  |         muls.w 2(a2),d0
    588e:	|  |  |  |         asr.l d4,d0
    5890:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    5894:	|  |  |  |         movea.w 10(a2),a0
    5898:	|  |  |  |         subq.l #1,a0
    589a:	|  |  |  |         adda.l a0,a0
    589c:	|  |  |  |         move.w (0,a4,a0.l),d2
    58a0:	|  |  |  |         move.w d2,d7
    58a2:	|  |  |  |         muls.w 6(a2),d7
    58a6:	|  |  |  |         asr.l d4,d7
    58a8:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    58ac:	|  |  |  |         muls.w 8(a2),d2
    58b0:	|  |  |  |         asr.l d4,d2
    58b2:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    58b6:	|  |  |  |         movea.w 16(a2),a0
    58ba:	|  |  |  |         subq.l #1,a0
    58bc:	|  |  |  |         adda.l a0,a0
    58be:	|  |  |  |         move.w (0,a4,a0.l),d3
    58c2:	|  |  |  |         move.w d3,d6
    58c4:	|  |  |  |         muls.w 12(a2),d6
    58c8:	|  |  |  |         asr.l d4,d6
    58ca:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    58ce:	|  |  |  |         muls.w 14(a2),d3
    58d2:	|  |  |  |         asr.l d4,d3
    58d4:	|  |  |  |         movea.w d3,a1
    58d6:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    58da:	|  |  |  |         movea.w 22(a2),a0
    58de:	|  |  |  |         subq.l #1,a0
    58e0:	|  |  |  |         adda.l a0,a0
    58e2:	|  |  |  |         move.w (0,a4,a0.l),d3
    58e6:	|  |  |  |         move.w d3,d5
    58e8:	|  |  |  |         muls.w 18(a2),d5
    58ec:	|  |  |  |         asr.l d4,d5
    58ee:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    58f2:	|  |  |  |         muls.w 20(a2),d3
    58f6:	|  |  |  |         asr.l d4,d3
    58f8:	|  |  |  |         movea.w d3,a0
    58fa:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    58fe:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    5902:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    5906:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    590a:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    590e:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    5912:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    5916:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    591a:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    591e:	|  |  |  |         move.w d1,d4
    5920:	|  |  |  |         cmp.w d1,d7
    5922:	|  |  |  |     /-- bge.s 5926 <DrawScreen+0x878>
    5924:	|  |  |  |     |   move.w d7,d4
    5926:	|  |  |  |     \-> cmp.w d4,d6
    5928:	|  |  |  |     /-- bge.s 592c <DrawScreen+0x87e>
    592a:	|  |  |  |     |   move.w d6,d4
    592c:	|  |  |  |     \-> cmp.w d4,d5
    592e:	|  |  |  |     /-- bge.s 5932 <DrawScreen+0x884>
    5930:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    5932:	|  |  |  |     \-> move.w d0,d3
    5934:	|  |  |  |         cmp.w d0,d2
    5936:	|  |  |  |     /-- bge.s 593a <DrawScreen+0x88c>
    5938:	|  |  |  |     |   move.w d2,d3
    593a:	|  |  |  |     \-> cmp.w a1,d3
    593c:	|  |  |  |     /-- ble.s 5940 <DrawScreen+0x892>
    593e:	|  |  |  |     |   move.w a1,d3
    5940:	|  |  |  |     \-> cmp.w a0,d3
    5942:	|  |  |  |     /-- ble.s 5946 <DrawScreen+0x898>
    5944:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    5946:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    594a:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    594e:	|  |  |  |         cmp.w d0,d2
    5950:	|  |  |  |     /-- ble.s 5954 <DrawScreen+0x8a6>
    5952:	|  |  |  |     |   move.w d2,d0
    5954:	|  |  |  |     \-> cmp.w a1,d0
    5956:	|  |  |  |     /-- bge.s 595a <DrawScreen+0x8ac>
    5958:	|  |  |  |     |   move.w a1,d0
    595a:	|  |  |  |     \-> cmp.w a0,d0
    595c:	|  |  |  |     /-- bge.s 5960 <DrawScreen+0x8b2>
    595e:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    5960:	|  |  |  |     \-> addq.w #1,d0
    5962:	|  |  |  |         sub.w d3,d0
    5964:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5968:	|  |  |  |         cmpi.w #1,d0
    596c:	|  |  |  |  /----- ble.s 59a6 <DrawScreen+0x8f8>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    596e:	|  |  |  |  |      cmp.w d1,d7
    5970:	|  |  |  |  |  /-- ble.s 5974 <DrawScreen+0x8c6>
    5972:	|  |  |  |  |  |   move.w d7,d1
    5974:	|  |  |  |  |  \-> cmp.w d1,d6
    5976:	|  |  |  |  |  /-- ble.s 597a <DrawScreen+0x8cc>
    5978:	|  |  |  |  |  |   move.w d6,d1
    597a:	|  |  |  |  |  \-> cmp.w d1,d5
    597c:	|  |  |  |  |  /-- ble.s 5980 <DrawScreen+0x8d2>
    597e:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    5980:	|  |  |  |  |  \-> sub.w d4,d1
    5982:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    5986:	|  |  |  |  |      cmpi.w #1,d1
    598a:	|  |  |  |  +----- ble.s 59a6 <DrawScreen+0x8f8>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    598c:	|  |  |  |  |      movea.l 52(sp),a0
    5990:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    5994:	|  |  |  |  |      pea 56(sp)
    5998:	|  |  |  |  |      jsr 25f4 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    599c:	|  |  |  |  |      movea.l 52(sp),a0
    59a0:	|  |  |  |  |      movea.w 4(a0),a5
    59a4:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    59a6:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    59aa:	|  |  |  |         addq.l #1,a3
    59ac:	|  |  |  |         movea.w a5,a0
    59ae:	|  |  |  |         cmpa.l a3,a0
    59b0:	|  |  |  \-------- bgt.w 586c <DrawScreen+0x7be>
    59b4:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    59b8:	|  |  |            addq.l #3,a0
    59ba:	|  |  |            adda.l a0,a0
    59bc:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    59be:	|  |  |            subq.l #1,44(sp)
    59c2:	+--|--|----------- bne.w 51f2 <DrawScreen+0x144>
    59c6:	|  +--|----------- bra.w 5240 <DrawScreen+0x192>
    metadata += 3 + metadata[2];    
    59ca:	|  |  \----------> movea.w d1,a0
    59cc:	|  |               addq.l #3,a0
    59ce:	|  |               adda.l a0,a0
    59d0:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    59d2:	|  |               subq.l #1,44(sp)
    59d6:	\--|-------------- bne.w 51f2 <DrawScreen+0x144>
    59da:	   \-------------- bra.w 5240 <DrawScreen+0x192>

000059de <strlen>:
	while(*s++)
    59de:	   /-> movea.l 4(sp),a0
    59e2:	   |   tst.b (a0)+
    59e4:	/--|-- beq.s 59f2 <strlen+0x14>
    59e6:	|  |   move.l a0,-(sp)
    59e8:	|  \-- jsr 59de <strlen>(pc)
    59ec:	|      addq.l #4,sp
    59ee:	|      addq.l #1,d0
}
    59f0:	|      rts
	unsigned long t=0;
    59f2:	\----> moveq #0,d0
}
    59f4:	       rts

000059f6 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    59f6:	       move.l d2,-(sp)
    59f8:	       move.l 8(sp),d0
	while(len-- > 0)
    59fc:	       tst.l 16(sp)
    5a00:	/----- beq.s 5a14 <memset+0x1e>
		*ptr++ = val;
    5a02:	|      move.b 15(sp),d2
    5a06:	|      move.l 16(sp),d1
    5a0a:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    5a0c:	|      movea.l d0,a0
		*ptr++ = val;
    5a0e:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    5a10:	|  |   cmpa.l d1,a0
    5a12:	|  \-- bne.s 5a0e <memset+0x18>
}
    5a14:	\----> move.l (sp)+,d2
    5a16:	       rts

00005a18 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5a18:	       move.l 4(sp),d0
    5a1c:	       movea.l 8(sp),a0
	while(len--)
    5a20:	       tst.l 12(sp)
    5a24:	/----- beq.s 5a34 <memcpy+0x1c>
    5a26:	|      movea.l d0,a1
    5a28:	|      move.l 12(sp),d1
    5a2c:	|      add.l a0,d1
		*d++ = *s++;
    5a2e:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    5a30:	|  |   cmp.l a0,d1
    5a32:	|  \-- bne.s 5a2e <memcpy+0x16>
}
    5a34:	\----> rts

00005a36 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5a36:	          move.l d2,-(sp)
    5a38:	          move.l 8(sp),d0
    5a3c:	          movea.l 12(sp),a0
    5a40:	          move.l 16(sp),d2
	if (d < s) {
    5a44:	          cmpa.l d0,a0
    5a46:	   /----- bls.s 5a5c <memmove+0x26>
		while (len--)
    5a48:	   |      tst.l d2
    5a4a:	/--|----- beq.s 5a58 <memmove+0x22>
    5a4c:	|  |      movea.l d0,a1
    5a4e:	|  |      move.l a0,d1
    5a50:	|  |      add.l d2,d1
			*d++ = *s++;
    5a52:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    5a54:	|  |  |   cmp.l a0,d1
    5a56:	|  |  \-- bne.s 5a52 <memmove+0x1c>
}
    5a58:	>--|----> move.l (sp)+,d2
    5a5a:	|  |      rts
		while (len--)
    5a5c:	|  \----> movea.l d2,a1
    5a5e:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5a60:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    5a62:	|         adda.l d0,a1
		while (len--)
    5a64:	|         tst.l d2
    5a66:	+-------- beq.s 5a58 <memmove+0x22>
    5a68:	|         move.l a0,d1
    5a6a:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    5a6c:	|     /-> move.b (a0),(a1)
		while (len--)
    5a6e:	|     |   subq.l #1,a0
    5a70:	|     |   subq.l #1,a1
    5a72:	|     |   cmpa.l d1,a0
    5a74:	+-----|-- beq.s 5a58 <memmove+0x22>
			*lastd-- = *lasts--;
    5a76:	|     |   move.b (a0),(a1)
		while (len--)
    5a78:	|     |   subq.l #1,a0
    5a7a:	|     |   subq.l #1,a1
    5a7c:	|     |   cmpa.l d1,a0
    5a7e:	|     \-- bne.s 5a6c <memmove+0x36>
    5a80:	\-------- bra.s 5a58 <memmove+0x22>
    5a82:	          nop

00005a84 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    5a84:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    5a88:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a8c:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    5a90:	mulu.w 8(sp),d1
	addw	d1, d0
    5a94:	add.w d1,d0
	swap	d0
    5a96:	swap d0
	clrw	d0
    5a98:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a9a:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    5a9e:	mulu.w 10(sp),d1
	addl	d1, d0
    5aa2:	add.l d1,d0
	rts
    5aa4:	rts

00005aa6 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    5aa6:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    5aa8:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    5aac:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    5ab0:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    5ab6:	   /-- bcc.s 5ace <__udivsi3+0x28>
	movel	d0, d2
    5ab8:	   |   move.l d0,d2
	clrw	d2
    5aba:	   |   clr.w d2
	swap	d2
    5abc:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    5abe:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    5ac0:	   |   move.w d2,d0
	swap	d0
    5ac2:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    5ac4:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    5ac8:	   |   divu.w d1,d2
	movew	d2, d0
    5aca:	   |   move.w d2,d0
	jra	6f
    5acc:	/--|-- bra.s 5afe <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    5ace:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    5ad0:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    5ad2:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    5ad4:	|  |   cmpi.l #65536,d1
	jcc	4b
    5ada:	|  \-- bcc.s 5ad0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    5adc:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    5ade:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    5ae4:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    5ae6:	|      mulu.w d0,d1
	swap	d2
    5ae8:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    5aea:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    5aec:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    5aee:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    5af0:	|  /-- bne.s 5afc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    5af2:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    5af4:	|  +-- bcs.s 5afc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    5af6:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    5afa:	+--|-- bls.s 5afe <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    5afc:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    5afe:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5b00:	       rts

00005b02 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    5b02:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    5b04:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    5b06:	    move.l 12(sp),d1
	jpl	1f
    5b0a:	/-- bpl.s 5b10 <__divsi3+0xe>
	negl	d1
    5b0c:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5b0e:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5b10:	\-> move.l 8(sp),d0
	jpl	2f
    5b14:	/-- bpl.s 5b1a <__divsi3+0x18>
	negl	d0
    5b16:	|   neg.l d0
	negb	d2
    5b18:	|   neg.b d2

2:	movel	d1, sp@-
    5b1a:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b1c:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5b1e:	    bsr.s 5aa6 <__udivsi3>
	addql	#8, sp
    5b20:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    5b22:	    tst.b d2
	jpl	3f
    5b24:	/-- bpl.s 5b28 <__divsi3+0x26>
	negl	d0
    5b26:	|   neg.l d0

3:	movel	sp@+, d2
    5b28:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5b2a:	    rts

00005b2c <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5b2c:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5b30:	move.l 4(sp),d0
	movel	d1, sp@-
    5b34:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b36:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5b38:	bsr.s 5b02 <__divsi3>
	addql	#8, sp
    5b3a:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b3c:	move.l 8(sp),d1
	movel	d1, sp@-
    5b40:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b42:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b44:	bsr.w 5a84 <__mulsi3>
	addql	#8, sp
    5b48:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b4a:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b4e:	sub.l d0,d1
	movel	d1, d0
    5b50:	move.l d1,d0
	rts
    5b52:	rts

00005b54 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5b54:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5b58:	move.l 4(sp),d0
	movel	d1, sp@-
    5b5c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b5e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5b60:	bsr.w 5aa6 <__udivsi3>
	addql	#8, sp
    5b64:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b66:	move.l 8(sp),d1
	movel	d1, sp@-
    5b6a:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b6c:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b6e:	bsr.w 5a84 <__mulsi3>
	addql	#8, sp
    5b72:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b74:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b78:	sub.l d0,d1
	movel	d1, d0
    5b7a:	move.l d1,d0
	rts
    5b7c:	rts

00005b7e <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    5b7e:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    5b80:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    5b84:	jsr -516(a6)
    move.l (sp)+, a6
    5b88:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    5b8a:	rts

00005b8c <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    5b8c:	move.b d0,(a3)+
	rts
    5b8e:	rts

00005b90 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    5b90:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    5b92:	                         adda.l a0,a2
	move.l	a2,a3
    5b94:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    5b96:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    5b98:	                         moveq #56,d4
	moveq	#8,d5
    5b9a:	                         moveq #8,d5
	bra.s	.Lliteral
    5b9c:	   /-------------------- bra.s 5c06 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    5b9e:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    5ba0:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    5ba2:	+--|-------------------- dbf d1,5b9e <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    5ba6:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    5ba8:	|  |     /-------------- bcc.s 5bac <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    5baa:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    5bac:	|  |  |  >-------------> tst.w d0
    5bae:	|  |  |  |           /-- bne.s 5bb8 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    5bb0:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    5bb2:	|  |  |  |           |   bls.s 5c2a <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    5bb4:	|  |  |  |           |   move.w (a0)+,d0
    5bb6:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    5bb8:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    5bba:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    5bbc:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    5bbe:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    5bc0:	|  |  |  |               movem.w (5c24 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    5bc6:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    5bc8:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    5bca:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    5bcc:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    5bce:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    5bd0:	|  |  |  |               tst.w d0
    5bd2:	|  |  |  |           /-- bne.s 5bd8 <_doynaxdepack_asm+0x48>
    5bd4:	|  |  |  |           |   move.w (a0)+,d0
    5bd6:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5bd8:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5bda:	|  |  |  |  /----------- beq.s 5bf2 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5bdc:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5bde:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5be0:	|  |  |  |  |  /-------- bpl.s 5bee <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    5be2:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    5be4:	|  |  |  |  |  |  /----- bpl.s 5bec <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    5be6:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5be8:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5bea:	|  |  |  |  |  |  |  \-- bmi.s 5be6 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5bec:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5bee:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5bf0:	|  |  |  |  |        /-- bcc.s 5bf4 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    5bf2:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    5bf4:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    5bf6:	|  |  |  |  \----------- dbf d1,5bf2 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5bfa:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5bfc:	|  |  |  \-------------- bcc.s 5bac <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5bfe:	|  |  |                  tst.w d0
    5c00:	|  +--|----------------- bne.s 5c06 <_doynaxdepack_asm+0x76>
    5c02:	|  |  |                  move.w (a0)+,d0
    5c04:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    5c06:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5c08:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5c0a:	|     \----------------- bcc.s 5baa <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5c0c:	|                 /----- bpl.s 5c14 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5c0e:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5c10:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    5c12:	|                 |  \-- bmi.s 5c0e <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    5c14:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    5c16:	\--------------------/-X dbv.s d1,5b9e <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5c1a:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5c1c:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5c1e:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5c20:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    5c22:	                     \-- bra.s 5c16 <_doynaxdepack_asm+0x86>

00005c24 <doy_table>:
    5c24:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    5c34:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    5c44:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    5c54:	.............oNq

00005c64 <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    5c64:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    5c68:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    5c6a:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    5c6e:	cmpi.w #0,d2
    bgt.s br1
    5c72:	bgt.s 5c7e <br1>
    |{
    |direction = -64;  
    neg.w d7    
    5c74:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    5c76:	addq.w #1,d2
    lsl.l   #6,d2
    5c78:	lsl.l #6,d2
    sub.w   d2,d1
    5c7a:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    5c7c:	neg.w d2

00005c7e <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    5c7e:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    5c80:	lsl.w #3,d6
    sub.w d6,d0
    5c82:	sub.w d6,d0
    mulu.w #1200,d6
    5c84:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    5c88:	move.w d2,d0
    subq.w #1,d0
    5c8a:	subq.w #1,d0
    mulu.w #100,d0
    5c8c:	mulu.w #100,d0
    subq.w #1,d3
    5c90:	subq.w #1,d3
    add.w d3,d0
    5c92:	add.w d3,d0
    add.w d0,a0
    5c94:	adda.w d0,a0
    move.w (a0),d0
    5c96:	move.w (a0),d0
    sub.w  d5,d0
    5c98:	sub.w d5,d0
    sub.w  d5,d0
    5c9a:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    5c9c:	sub.w d5,d7
    sub.w d5,d7
    5c9e:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    5ca0:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    5ca2:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    5ca4:	lsl.w #6,d2
    add.w d5,d2
    5ca6:	add.w d5,d2
    lea   0xdff000,a3
    5ca8:	lea dff000 <_end+0xd75a64>,a3
    tst.w 0x2(a3)
    5cae:	tst.w 2(a3)

00005cb2 <waitblit>:
waitblit:
    btst #6,2(a3)
    5cb2:	/-> btst #6,2(a3)
    bne.s waitblit
    5cb8:	\-- bne.s 5cb2 <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    5cba:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    5cbe:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    5cc2:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    5cc6:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    5cca:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    5cce:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    5cd2:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    5cd6:	    movem.l (sp)+,d0-a3
    rts
    5cda:	    rts

00005cdc <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    5cdc:	lea 5cdc <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    5ce0:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    5ce4:	adda.l a1,a1
    add.l #zmult,a1
    5ce6:	adda.l #23772,a1

00005cec <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5cec:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5cf0:	moveq #0,d1
			moveq	#0,d2
    5cf2:	moveq #0,d2
			moveq	#0,d3
    5cf4:	moveq #0,d3
			moveq	#16,d7
    5cf6:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5cf8:	lea 6976 <lz4jmp>(pc),a3
		moveq	#0,d0
    5cfc:	moveq #0,d0
		move.b	(a0)+,d0
    5cfe:	move.b (a0)+,d0
		add.w	d0,d0
    5d00:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d02:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d06:	jmp (0,a3,d0.w)

00005d0a <lz4Rts0>:
lz4Rts0:	rts
    5d0a:	rts

00005d0c <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    5d0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d26:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d28:	cmpa.l a0,a4
		beq.s	lz4Rts1
    5d2a:	beq.s 5d4e <lz4Rts1>
		move.b	(a0)+,d0
    5d2c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d2e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d30:	move.w (sp)+,d3
		move.b	d0,d3
    5d32:	move.b d0,d3
		move.l	a1,a2
    5d34:	movea.l a1,a2
		sub.l	d3,a2
    5d36:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d38:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d3a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d3e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d40:	moveq #0,d0
		move.b	(a0)+,d0
    5d42:	move.b (a0)+,d0
		add.w	d0,d0
    5d44:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d46:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d4a:	jmp (0,a3,d0.w)

00005d4e <lz4Rts1>:
lz4Rts1:	rts
    5d4e:	rts

00005d50 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    5d50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d6a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d6c:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5d6e:	beq.s 5d94 <lz4Rts2>
		move.b	(a0)+,d0
    5d70:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d72:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d74:	move.w (sp)+,d3
		move.b	d0,d3
    5d76:	move.b d0,d3
		move.l	a1,a2
    5d78:	movea.l a1,a2
		sub.l	d3,a2
    5d7a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d84:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d86:	moveq #0,d0
		move.b	(a0)+,d0
    5d88:	move.b (a0)+,d0
		add.w	d0,d0
    5d8a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d8c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d90:	jmp (0,a3,d0.w)

00005d94 <lz4Rts2>:
lz4Rts2:	rts
    5d94:	rts

00005d96 <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    5d96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5da8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5daa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db0:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5db2:	cmpa.l a0,a4
		beq.s	lz4Rts3
    5db4:	beq.s 5ddc <lz4Rts3>
		move.b	(a0)+,d0
    5db6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5db8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5dba:	move.w (sp)+,d3
		move.b	d0,d3
    5dbc:	move.b d0,d3
		move.l	a1,a2
    5dbe:	movea.l a1,a2
		sub.l	d3,a2
    5dc0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5dc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dc8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dcc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5dce:	moveq #0,d0
		move.b	(a0)+,d0
    5dd0:	move.b (a0)+,d0
		add.w	d0,d0
    5dd2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5dd4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5dd8:	jmp (0,a3,d0.w)

00005ddc <lz4Rts3>:
lz4Rts3:	rts
    5ddc:	rts

00005dde <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    5dde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5dfa:	cmpa.l a0,a4
		beq.s	lz4Rts4
    5dfc:	beq.s 5e26 <lz4Rts4>
		move.b	(a0)+,d0
    5dfe:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e00:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e02:	move.w (sp)+,d3
		move.b	d0,d3
    5e04:	move.b d0,d3
		move.l	a1,a2
    5e06:	movea.l a1,a2
		sub.l	d3,a2
    5e08:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e0a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e0c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e0e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e10:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e12:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e16:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e18:	moveq #0,d0
		move.b	(a0)+,d0
    5e1a:	move.b (a0)+,d0
		add.w	d0,d0
    5e1c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e1e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e22:	jmp (0,a3,d0.w)

00005e26 <lz4Rts4>:
lz4Rts4:	rts
    5e26:	rts

00005e28 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    5e28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e42:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e44:	cmpa.l a0,a4
		beq.s	lz4Rts5
    5e46:	beq.s 5e72 <lz4Rts5>
		move.b	(a0)+,d0
    5e48:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e4a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e4c:	move.w (sp)+,d3
		move.b	d0,d3
    5e4e:	move.b d0,d3
		move.l	a1,a2
    5e50:	movea.l a1,a2
		sub.l	d3,a2
    5e52:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e54:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e56:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e58:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e5a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e62:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e64:	moveq #0,d0
		move.b	(a0)+,d0
    5e66:	move.b (a0)+,d0
		add.w	d0,d0
    5e68:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e6a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e6e:	jmp (0,a3,d0.w)

00005e72 <lz4Rts5>:
lz4Rts5:	rts
    5e72:	rts

00005e74 <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    5e74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e8e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e90:	cmpa.l a0,a4
		beq.s	lz4Rts6
    5e92:	beq.s 5ec0 <lz4Rts6>
		move.b	(a0)+,d0
    5e94:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e96:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e98:	move.w (sp)+,d3
		move.b	d0,d3
    5e9a:	move.b d0,d3
		move.l	a1,a2
    5e9c:	movea.l a1,a2
		sub.l	d3,a2
    5e9e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5ea0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ea2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ea4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ea6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ea8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eaa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eb0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5eb2:	moveq #0,d0
		move.b	(a0)+,d0
    5eb4:	move.b (a0)+,d0
		add.w	d0,d0
    5eb6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5eb8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ebc:	jmp (0,a3,d0.w)

00005ec0 <lz4Rts6>:
lz4Rts6:	rts
    5ec0:	rts

00005ec2 <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    5ec2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ecc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ece:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ed0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ed2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ed4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ed6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ed8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5edc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5ede:	cmpa.l a0,a4
		beq.s	lz4Rts7
    5ee0:	beq.s 5f10 <lz4Rts7>
		move.b	(a0)+,d0
    5ee2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5ee4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5ee6:	move.w (sp)+,d3
		move.b	d0,d3
    5ee8:	move.b d0,d3
		move.l	a1,a2
    5eea:	movea.l a1,a2
		sub.l	d3,a2
    5eec:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5eee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ef0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ef2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ef4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ef6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ef8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5efa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5efc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5efe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f00:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f02:	moveq #0,d0
		move.b	(a0)+,d0
    5f04:	move.b (a0)+,d0
		add.w	d0,d0
    5f06:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f08:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f0c:	jmp (0,a3,d0.w)

00005f10 <lz4Rts7>:
lz4Rts7:	rts
    5f10:	rts

00005f12 <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    5f12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f2c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f2e:	cmpa.l a0,a4
		beq.s	lz4Rts8
    5f30:	beq.s 5f62 <lz4Rts8>
		move.b	(a0)+,d0
    5f32:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f34:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f36:	move.w (sp)+,d3
		move.b	d0,d3
    5f38:	move.b d0,d3
		move.l	a1,a2
    5f3a:	movea.l a1,a2
		sub.l	d3,a2
    5f3c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f3e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f40:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f42:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f50:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f52:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f54:	moveq #0,d0
		move.b	(a0)+,d0
    5f56:	move.b (a0)+,d0
		add.w	d0,d0
    5f58:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f5a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f5e:	jmp (0,a3,d0.w)

00005f62 <lz4Rts8>:
lz4Rts8:	rts
    5f62:	rts

00005f64 <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    5f64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f7e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f80:	cmpa.l a0,a4
		beq.s	lz4Rts9
    5f82:	beq.s 5fb6 <lz4Rts9>
		move.b	(a0)+,d0
    5f84:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f86:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f88:	move.w (sp)+,d3
		move.b	d0,d3
    5f8a:	move.b d0,d3
		move.l	a1,a2
    5f8c:	movea.l a1,a2
		sub.l	d3,a2
    5f8e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f92:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f94:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f96:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f98:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f9a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f9c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f9e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fa0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fa2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fa4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fa6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5fa8:	moveq #0,d0
		move.b	(a0)+,d0
    5faa:	move.b (a0)+,d0
		add.w	d0,d0
    5fac:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fae:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5fb2:	jmp (0,a3,d0.w)

00005fb6 <lz4Rts9>:
lz4Rts9:	rts
    5fb6:	rts

00005fb8 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    5fb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fc4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fd2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5fd4:	cmpa.l a0,a4
		beq.s	lz4Rts10
    5fd6:	beq.s 600c <lz4Rts10>
		move.b	(a0)+,d0
    5fd8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5fda:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fdc:	move.w (sp)+,d3
		move.b	d0,d3
    5fde:	move.b d0,d3
		move.l	a1,a2
    5fe0:	movea.l a1,a2
		sub.l	d3,a2
    5fe2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5fe4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fe6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fe8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ff0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ff2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ff4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ff6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ff8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ffa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ffc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5ffe:	moveq #0,d0
		move.b	(a0)+,d0
    6000:	move.b (a0)+,d0
		add.w	d0,d0
    6002:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6004:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6008:	jmp (0,a3,d0.w)

0000600c <lz4Rts10>:
lz4Rts10:	rts
    600c:	rts

0000600e <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    600e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6010:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6012:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6014:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6016:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6018:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    601a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    601c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    601e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6020:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6022:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6024:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6026:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6028:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    602a:	cmpa.l a0,a4
		beq.s	lz4Rts11
    602c:	beq.s 6064 <lz4Rts11>
		move.b	(a0)+,d0
    602e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6030:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6032:	move.w (sp)+,d3
		move.b	d0,d3
    6034:	move.b d0,d3
		move.l	a1,a2
    6036:	movea.l a1,a2
		sub.l	d3,a2
    6038:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    603a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    603c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    603e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6040:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6042:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6044:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6046:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6048:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    604a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    604c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    604e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6050:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6052:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6054:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6056:	moveq #0,d0
		move.b	(a0)+,d0
    6058:	move.b (a0)+,d0
		add.w	d0,d0
    605a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    605c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6060:	jmp (0,a3,d0.w)

00006064 <lz4Rts11>:
lz4Rts11:	rts
    6064:	rts

00006066 <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    6066:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6068:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    606a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    606c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    606e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6070:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6072:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6074:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6076:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6078:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    607a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    607c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    607e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6080:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6082:	cmpa.l a0,a4
		beq.s	lz4Rts12
    6084:	beq.s 60be <lz4Rts12>
		move.b	(a0)+,d0
    6086:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6088:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    608a:	move.w (sp)+,d3
		move.b	d0,d3
    608c:	move.b d0,d3
		move.l	a1,a2
    608e:	movea.l a1,a2
		sub.l	d3,a2
    6090:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6092:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6094:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6096:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6098:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    609a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    609c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    609e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ae:	move.b (a2)+,(a1)+
		moveq	#0,d0
    60b0:	moveq #0,d0
		move.b	(a0)+,d0
    60b2:	move.b (a0)+,d0
		add.w	d0,d0
    60b4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    60b6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60ba:	jmp (0,a3,d0.w)

000060be <lz4Rts12>:
lz4Rts12:	rts
    60be:	rts

000060c0 <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    60c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60da:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    60dc:	cmpa.l a0,a4
		beq.s	lz4Rts13
    60de:	beq.s 611a <lz4Rts13>
		move.b	(a0)+,d0
    60e0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    60e2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    60e4:	move.w (sp)+,d3
		move.b	d0,d3
    60e6:	move.b d0,d3
		move.l	a1,a2
    60e8:	movea.l a1,a2
		sub.l	d3,a2
    60ea:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    60ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6100:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6102:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6104:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6106:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6108:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    610a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    610c:	moveq #0,d0
		move.b	(a0)+,d0
    610e:	move.b (a0)+,d0
		add.w	d0,d0
    6110:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6112:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6116:	jmp (0,a3,d0.w)

0000611a <lz4Rts13>:
lz4Rts13:	rts
    611a:	rts

0000611c <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    611c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    611e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6120:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6122:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6124:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6126:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6128:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    612a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    612c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    612e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6130:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6132:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6134:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6136:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6138:	cmpa.l a0,a4
		beq.s	lz4Rts14
    613a:	beq.s 6178 <lz4Rts14>
		move.b	(a0)+,d0
    613c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    613e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6140:	move.w (sp)+,d3
		move.b	d0,d3
    6142:	move.b d0,d3
		move.l	a1,a2
    6144:	movea.l a1,a2
		sub.l	d3,a2
    6146:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6148:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    614a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    614c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    614e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6150:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6152:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6154:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6156:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6158:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    615a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    615c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    615e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6160:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6162:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6164:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6166:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6168:	move.b (a2)+,(a1)+
		moveq	#0,d0
    616a:	moveq #0,d0
		move.b	(a0)+,d0
    616c:	move.b (a0)+,d0
		add.w	d0,d0
    616e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6170:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6174:	jmp (0,a3,d0.w)

00006178 <lz4Rts14>:
lz4Rts14:	rts
    6178:	rts

0000617a <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    617a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    617c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    617e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6180:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6182:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6184:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6186:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6188:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    618a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    618c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    618e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6190:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6192:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6194:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6196:	cmpa.l a0,a4
		beq.s	lz4Rts15
    6198:	beq.s 61d8 <lz4Rts15>
		move.b	(a0)+,d0
    619a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    619c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    619e:	move.w (sp)+,d3
		move.b	d0,d3
    61a0:	move.b d0,d3
		move.l	a1,a2
    61a2:	movea.l a1,a2
		sub.l	d3,a2
    61a4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    61a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61c8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    61ca:	moveq #0,d0
		move.b	(a0)+,d0
    61cc:	move.b (a0)+,d0
		add.w	d0,d0
    61ce:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    61d0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    61d4:	jmp (0,a3,d0.w)

000061d8 <lz4Rts15>:
lz4Rts15:	rts
    61d8:	rts

000061da <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    61da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61f4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    61f6:	cmpa.l a0,a4
		beq.s	lz4Rts16
    61f8:	beq.s 624e <lz4Rts16>
		move.b	(a0)+,d0
    61fa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61fc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61fe:	move.w (sp)+,d3
		move.b	d0,d3
    6200:	move.b d0,d3
		move.l	a1,a2
    6202:	movea.l a1,a2
		sub.l	d3,a2
    6204:	suba.l d3,a2
		moveq	#15+4,d1
    6206:	moveq #19,d1

00006208 <.cl0>:
.cl0:	move.b	(a0)+,d2
    6208:	/-> move.b (a0)+,d2
		add.l d2,d1
    620a:	|   add.l d2,d1
		not.b	d2
    620c:	|   not.b d2
		beq.s	.cl0
    620e:	\-- beq.s 6208 <.cl0>
		moveq	#15,d5
    6210:	    moveq #15,d5
		and.w	d1,d5
    6212:	    and.w d1,d5
		add.w	d5,d5
    6214:	    add.w d5,d5
		neg.w	d5
    6216:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    6218:	    jmp (623c <.eloop1>,pc,d5.w)

0000621c <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    621c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    621e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6220:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6222:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6224:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6226:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6228:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    622a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    622c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    622e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6230:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6232:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6234:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6236:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6238:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    623a:	move.b (a2)+,(a1)+

0000623c <.eloop1>:
.eloop1:	sub.l	d7,d1
    623c:	sub.l d7,d1
		bpl.s	.tloop1
    623e:	bpl.s 621c <.tloop1>
		moveq	#0,d0
    6240:	moveq #0,d0
		move.b	(a0)+,d0
    6242:	move.b (a0)+,d0
		add.w	d0,d0
    6244:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6246:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    624a:	jmp (0,a3,d0.w)

0000624e <lz4Rts16>:
lz4Rts16:	rts
    624e:	rts

00006250 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    6250:	moveq #15,d1

00006252 <.cl2>:
.cl2:	move.b	(a0)+,d2
    6252:	/-> move.b (a0)+,d2
		add.l d2,d1
    6254:	|   add.l d2,d1
		not.b	d2
    6256:	|   not.b d2
		beq.s	.cl2
    6258:	\-- beq.s 6252 <.cl2>
		moveq	#15,d5
    625a:	    moveq #15,d5
		and.w	d1,d5
    625c:	    and.w d1,d5
		add.w	d5,d5
    625e:	    add.w d5,d5
		neg.w	d5
    6260:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    6262:	    jmp (6286 <.eloop3>,pc,d5.w)

00006266 <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    6266:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6268:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    626a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    626c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    626e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6270:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6272:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6274:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6276:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6278:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    627a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    627c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    627e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6280:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6282:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6284:	move.b (a0)+,(a1)+

00006286 <.eloop3>:
.eloop3:	sub.l	d7,d1
    6286:	sub.l d7,d1
		bpl.s	.tloop3
    6288:	bpl.s 6266 <.tloop3>
		cmpa.l	a0,a4
    628a:	cmpa.l a0,a4
		beq.s	lz4Rts17
    628c:	beq.s 62b0 <lz4Rts17>
		move.b	(a0)+,d0
    628e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6290:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6292:	move.w (sp)+,d3
		move.b	d0,d3
    6294:	move.b d0,d3
		move.l	a1,a2
    6296:	movea.l a1,a2
		sub.l	d3,a2
    6298:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    629a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    629c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    629e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62a0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62a2:	moveq #0,d0
		move.b	(a0)+,d0
    62a4:	move.b (a0)+,d0
		add.w	d0,d0
    62a6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    62a8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    62ac:	jmp (0,a3,d0.w)

000062b0 <lz4Rts17>:
lz4Rts17:	rts
    62b0:	rts

000062b2 <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    62b2:	moveq #15,d1

000062b4 <.cl4>:
.cl4:	move.b	(a0)+,d2
    62b4:	/-> move.b (a0)+,d2
		add.l d2,d1
    62b6:	|   add.l d2,d1
		not.b	d2
    62b8:	|   not.b d2
		beq.s	.cl4
    62ba:	\-- beq.s 62b4 <.cl4>
		moveq	#15,d5
    62bc:	    moveq #15,d5
		and.w	d1,d5
    62be:	    and.w d1,d5
		add.w	d5,d5
    62c0:	    add.w d5,d5
		neg.w	d5
    62c2:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    62c4:	    jmp (62e8 <.eloop5>,pc,d5.w)

000062c8 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    62c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62e6:	move.b (a0)+,(a1)+

000062e8 <.eloop5>:
.eloop5:	sub.l	d7,d1
    62e8:	sub.l d7,d1
		bpl.s	.tloop5
    62ea:	bpl.s 62c8 <.tloop5>
		cmpa.l	a0,a4
    62ec:	cmpa.l a0,a4
		beq.s	lz4Rts18
    62ee:	beq.s 6314 <lz4Rts18>
		move.b	(a0)+,d0
    62f0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    62f2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    62f4:	move.w (sp)+,d3
		move.b	d0,d3
    62f6:	move.b d0,d3
		move.l	a1,a2
    62f8:	movea.l a1,a2
		sub.l	d3,a2
    62fa:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6300:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6302:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6304:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6306:	moveq #0,d0
		move.b	(a0)+,d0
    6308:	move.b (a0)+,d0
		add.w	d0,d0
    630a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    630c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6310:	jmp (0,a3,d0.w)

00006314 <lz4Rts18>:
lz4Rts18:	rts
    6314:	rts

00006316 <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    6316:	moveq #15,d1

00006318 <.cl6>:
.cl6:	move.b	(a0)+,d2
    6318:	/-> move.b (a0)+,d2
		add.l d2,d1
    631a:	|   add.l d2,d1
		not.b	d2
    631c:	|   not.b d2
		beq.s	.cl6
    631e:	\-- beq.s 6318 <.cl6>
		moveq	#15,d5
    6320:	    moveq #15,d5
		and.w	d1,d5
    6322:	    and.w d1,d5
		add.w	d5,d5
    6324:	    add.w d5,d5
		neg.w	d5
    6326:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    6328:	    jmp (634c <.eloop7>,pc,d5.w)

0000632c <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    632c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    632e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6330:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6332:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6334:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6336:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6338:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    633a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    633c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    633e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6340:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6342:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6344:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6346:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6348:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    634a:	move.b (a0)+,(a1)+

0000634c <.eloop7>:
.eloop7:	sub.l	d7,d1
    634c:	sub.l d7,d1
		bpl.s	.tloop7
    634e:	bpl.s 632c <.tloop7>
		cmpa.l	a0,a4
    6350:	cmpa.l a0,a4
		beq.s	lz4Rts19
    6352:	beq.s 637a <lz4Rts19>
		move.b	(a0)+,d0
    6354:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6356:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6358:	move.w (sp)+,d3
		move.b	d0,d3
    635a:	move.b d0,d3
		move.l	a1,a2
    635c:	movea.l a1,a2
		sub.l	d3,a2
    635e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6360:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6362:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6364:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6366:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6368:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    636a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    636c:	moveq #0,d0
		move.b	(a0)+,d0
    636e:	move.b (a0)+,d0
		add.w	d0,d0
    6370:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6372:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6376:	jmp (0,a3,d0.w)

0000637a <lz4Rts19>:
lz4Rts19:	rts
    637a:	rts

0000637c <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    637c:	moveq #15,d1

0000637e <.cl8>:
.cl8:	move.b	(a0)+,d2
    637e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6380:	|   add.l d2,d1
		not.b	d2
    6382:	|   not.b d2
		beq.s	.cl8
    6384:	\-- beq.s 637e <.cl8>
		moveq	#15,d5
    6386:	    moveq #15,d5
		and.w	d1,d5
    6388:	    and.w d1,d5
		add.w	d5,d5
    638a:	    add.w d5,d5
		neg.w	d5
    638c:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    638e:	    jmp (63b2 <.eloop9>,pc,d5.w)

00006392 <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    6392:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6394:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6396:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6398:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    639a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    639c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    639e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63b0:	move.b (a0)+,(a1)+

000063b2 <.eloop9>:
.eloop9:	sub.l	d7,d1
    63b2:	sub.l d7,d1
		bpl.s	.tloop9
    63b4:	bpl.s 6392 <.tloop9>
		cmpa.l	a0,a4
    63b6:	cmpa.l a0,a4
		beq.s	lz4Rts20
    63b8:	beq.s 63e2 <lz4Rts20>
		move.b	(a0)+,d0
    63ba:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63bc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63be:	move.w (sp)+,d3
		move.b	d0,d3
    63c0:	move.b d0,d3
		move.l	a1,a2
    63c2:	movea.l a1,a2
		sub.l	d3,a2
    63c4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    63c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63d2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    63d4:	moveq #0,d0
		move.b	(a0)+,d0
    63d6:	move.b (a0)+,d0
		add.w	d0,d0
    63d8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    63da:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    63de:	jmp (0,a3,d0.w)

000063e2 <lz4Rts20>:
lz4Rts20:	rts
    63e2:	rts

000063e4 <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    63e4:	moveq #15,d1

000063e6 <.cl10>:
.cl10:	move.b	(a0)+,d2
    63e6:	/-> move.b (a0)+,d2
		add.l d2,d1
    63e8:	|   add.l d2,d1
		not.b	d2
    63ea:	|   not.b d2
		beq.s	.cl10
    63ec:	\-- beq.s 63e6 <.cl10>
		moveq	#15,d5
    63ee:	    moveq #15,d5
		and.w	d1,d5
    63f0:	    and.w d1,d5
		add.w	d5,d5
    63f2:	    add.w d5,d5
		neg.w	d5
    63f4:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    63f6:	    jmp (641a <.eloop11>,pc,d5.w)

000063fa <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    63fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6400:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6402:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6404:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6406:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6408:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    640a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    640c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    640e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6410:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6412:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6414:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6416:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6418:	move.b (a0)+,(a1)+

0000641a <.eloop11>:
.eloop11:	sub.l	d7,d1
    641a:	sub.l d7,d1
		bpl.s	.tloop11
    641c:	bpl.s 63fa <.tloop11>
		cmpa.l	a0,a4
    641e:	cmpa.l a0,a4
		beq.s	lz4Rts21
    6420:	beq.s 644c <lz4Rts21>
		move.b	(a0)+,d0
    6422:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6424:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6426:	move.w (sp)+,d3
		move.b	d0,d3
    6428:	move.b d0,d3
		move.l	a1,a2
    642a:	movea.l a1,a2
		sub.l	d3,a2
    642c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    642e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6430:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6432:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6434:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6436:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6438:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    643a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    643c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    643e:	moveq #0,d0
		move.b	(a0)+,d0
    6440:	move.b (a0)+,d0
		add.w	d0,d0
    6442:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6444:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6448:	jmp (0,a3,d0.w)

0000644c <lz4Rts21>:
lz4Rts21:	rts
    644c:	rts

0000644e <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    644e:	moveq #15,d1

00006450 <.cl12>:
.cl12:	move.b	(a0)+,d2
    6450:	/-> move.b (a0)+,d2
		add.l d2,d1
    6452:	|   add.l d2,d1
		not.b	d2
    6454:	|   not.b d2
		beq.s	.cl12
    6456:	\-- beq.s 6450 <.cl12>
		moveq	#15,d5
    6458:	    moveq #15,d5
		and.w	d1,d5
    645a:	    and.w d1,d5
		add.w	d5,d5
    645c:	    add.w d5,d5
		neg.w	d5
    645e:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    6460:	    jmp (6484 <.eloop13>,pc,d5.w)

00006464 <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    6464:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6466:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6468:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    646a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    646c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    646e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6470:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6472:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6474:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6476:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6478:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    647a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    647c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    647e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6480:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6482:	move.b (a0)+,(a1)+

00006484 <.eloop13>:
.eloop13:	sub.l	d7,d1
    6484:	sub.l d7,d1
		bpl.s	.tloop13
    6486:	bpl.s 6464 <.tloop13>
		cmpa.l	a0,a4
    6488:	cmpa.l a0,a4
		beq.s	lz4Rts22
    648a:	beq.s 64b8 <lz4Rts22>
		move.b	(a0)+,d0
    648c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    648e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6490:	move.w (sp)+,d3
		move.b	d0,d3
    6492:	move.b d0,d3
		move.l	a1,a2
    6494:	movea.l a1,a2
		sub.l	d3,a2
    6496:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6498:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    649a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    649c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    649e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64a8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    64aa:	moveq #0,d0
		move.b	(a0)+,d0
    64ac:	move.b (a0)+,d0
		add.w	d0,d0
    64ae:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    64b0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    64b4:	jmp (0,a3,d0.w)

000064b8 <lz4Rts22>:
lz4Rts22:	rts
    64b8:	rts

000064ba <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    64ba:	moveq #15,d1

000064bc <.cl14>:
.cl14:	move.b	(a0)+,d2
    64bc:	/-> move.b (a0)+,d2
		add.l d2,d1
    64be:	|   add.l d2,d1
		not.b	d2
    64c0:	|   not.b d2
		beq.s	.cl14
    64c2:	\-- beq.s 64bc <.cl14>
		moveq	#15,d5
    64c4:	    moveq #15,d5
		and.w	d1,d5
    64c6:	    and.w d1,d5
		add.w	d5,d5
    64c8:	    add.w d5,d5
		neg.w	d5
    64ca:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    64cc:	    jmp (64f0 <.eloop15>,pc,d5.w)

000064d0 <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    64d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ee:	move.b (a0)+,(a1)+

000064f0 <.eloop15>:
.eloop15:	sub.l	d7,d1
    64f0:	sub.l d7,d1
		bpl.s	.tloop15
    64f2:	bpl.s 64d0 <.tloop15>
		cmpa.l	a0,a4
    64f4:	cmpa.l a0,a4
		beq.s	lz4Rts23
    64f6:	beq.s 6526 <lz4Rts23>
		move.b	(a0)+,d0
    64f8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    64fa:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    64fc:	move.w (sp)+,d3
		move.b	d0,d3
    64fe:	move.b d0,d3
		move.l	a1,a2
    6500:	movea.l a1,a2
		sub.l	d3,a2
    6502:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6504:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6506:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6508:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    650a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    650c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    650e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6510:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6512:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6514:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6516:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6518:	moveq #0,d0
		move.b	(a0)+,d0
    651a:	move.b (a0)+,d0
		add.w	d0,d0
    651c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    651e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6522:	jmp (0,a3,d0.w)

00006526 <lz4Rts23>:
lz4Rts23:	rts
    6526:	rts

00006528 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    6528:	moveq #15,d1

0000652a <.cl16>:
.cl16:	move.b	(a0)+,d2
    652a:	/-> move.b (a0)+,d2
		add.l d2,d1
    652c:	|   add.l d2,d1
		not.b	d2
    652e:	|   not.b d2
		beq.s	.cl16
    6530:	\-- beq.s 652a <.cl16>
		moveq	#15,d5
    6532:	    moveq #15,d5
		and.w	d1,d5
    6534:	    and.w d1,d5
		add.w	d5,d5
    6536:	    add.w d5,d5
		neg.w	d5
    6538:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    653a:	    jmp (655e <.eloop17>,pc,d5.w)

0000653e <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    653e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6540:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6542:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6544:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6546:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6548:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    654a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    654c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    654e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6550:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6552:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6554:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6556:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6558:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    655a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    655c:	move.b (a0)+,(a1)+

0000655e <.eloop17>:
.eloop17:	sub.l	d7,d1
    655e:	sub.l d7,d1
		bpl.s	.tloop17
    6560:	bpl.s 653e <.tloop17>
		cmpa.l	a0,a4
    6562:	cmpa.l a0,a4
		beq.s	lz4Rts24
    6564:	beq.s 6596 <lz4Rts24>
		move.b	(a0)+,d0
    6566:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6568:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    656a:	move.w (sp)+,d3
		move.b	d0,d3
    656c:	move.b d0,d3
		move.l	a1,a2
    656e:	movea.l a1,a2
		sub.l	d3,a2
    6570:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6572:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6574:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6576:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6578:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    657a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    657c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    657e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6580:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6582:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6584:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6586:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6588:	moveq #0,d0
		move.b	(a0)+,d0
    658a:	move.b (a0)+,d0
		add.w	d0,d0
    658c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    658e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6592:	jmp (0,a3,d0.w)

00006596 <lz4Rts24>:
lz4Rts24:	rts
    6596:	rts

00006598 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    6598:	moveq #15,d1

0000659a <.cl18>:
.cl18:	move.b	(a0)+,d2
    659a:	/-> move.b (a0)+,d2
		add.l d2,d1
    659c:	|   add.l d2,d1
		not.b	d2
    659e:	|   not.b d2
		beq.s	.cl18
    65a0:	\-- beq.s 659a <.cl18>
		moveq	#15,d5
    65a2:	    moveq #15,d5
		and.w	d1,d5
    65a4:	    and.w d1,d5
		add.w	d5,d5
    65a6:	    add.w d5,d5
		neg.w	d5
    65a8:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    65aa:	    jmp (65ce <.eloop19>,pc,d5.w)

000065ae <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    65ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65cc:	move.b (a0)+,(a1)+

000065ce <.eloop19>:
.eloop19:	sub.l	d7,d1
    65ce:	sub.l d7,d1
		bpl.s	.tloop19
    65d0:	bpl.s 65ae <.tloop19>
		cmpa.l	a0,a4
    65d2:	cmpa.l a0,a4
		beq.s	lz4Rts25
    65d4:	beq.s 6608 <lz4Rts25>
		move.b	(a0)+,d0
    65d6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    65d8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    65da:	move.w (sp)+,d3
		move.b	d0,d3
    65dc:	move.b d0,d3
		move.l	a1,a2
    65de:	movea.l a1,a2
		sub.l	d3,a2
    65e0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    65e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    65fa:	moveq #0,d0
		move.b	(a0)+,d0
    65fc:	move.b (a0)+,d0
		add.w	d0,d0
    65fe:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6600:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6604:	jmp (0,a3,d0.w)

00006608 <lz4Rts25>:
lz4Rts25:	rts
    6608:	rts

0000660a <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    660a:	moveq #15,d1

0000660c <.cl20>:
.cl20:	move.b	(a0)+,d2
    660c:	/-> move.b (a0)+,d2
		add.l d2,d1
    660e:	|   add.l d2,d1
		not.b	d2
    6610:	|   not.b d2
		beq.s	.cl20
    6612:	\-- beq.s 660c <.cl20>
		moveq	#15,d5
    6614:	    moveq #15,d5
		and.w	d1,d5
    6616:	    and.w d1,d5
		add.w	d5,d5
    6618:	    add.w d5,d5
		neg.w	d5
    661a:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    661c:	    jmp (6640 <.eloop21>,pc,d5.w)

00006620 <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    6620:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6622:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6624:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6626:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6628:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    662a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    662c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    662e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6630:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6632:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6634:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6636:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6638:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    663a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    663c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    663e:	move.b (a0)+,(a1)+

00006640 <.eloop21>:
.eloop21:	sub.l	d7,d1
    6640:	sub.l d7,d1
		bpl.s	.tloop21
    6642:	bpl.s 6620 <.tloop21>
		cmpa.l	a0,a4
    6644:	cmpa.l a0,a4
		beq.s	lz4Rts26
    6646:	beq.s 667c <lz4Rts26>
		move.b	(a0)+,d0
    6648:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    664a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    664c:	move.w (sp)+,d3
		move.b	d0,d3
    664e:	move.b d0,d3
		move.l	a1,a2
    6650:	movea.l a1,a2
		sub.l	d3,a2
    6652:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6654:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6656:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6658:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    665a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    665c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    665e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6660:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6662:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6664:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6666:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6668:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    666a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    666c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    666e:	moveq #0,d0
		move.b	(a0)+,d0
    6670:	move.b (a0)+,d0
		add.w	d0,d0
    6672:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6674:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6678:	jmp (0,a3,d0.w)

0000667c <lz4Rts26>:
lz4Rts26:	rts
    667c:	rts

0000667e <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    667e:	moveq #15,d1

00006680 <.cl22>:
.cl22:	move.b	(a0)+,d2
    6680:	/-> move.b (a0)+,d2
		add.l d2,d1
    6682:	|   add.l d2,d1
		not.b	d2
    6684:	|   not.b d2
		beq.s	.cl22
    6686:	\-- beq.s 6680 <.cl22>
		moveq	#15,d5
    6688:	    moveq #15,d5
		and.w	d1,d5
    668a:	    and.w d1,d5
		add.w	d5,d5
    668c:	    add.w d5,d5
		neg.w	d5
    668e:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    6690:	    jmp (66b4 <.eloop23>,pc,d5.w)

00006694 <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    6694:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6696:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6698:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    669a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    669c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    669e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66b2:	move.b (a0)+,(a1)+

000066b4 <.eloop23>:
.eloop23:	sub.l	d7,d1
    66b4:	sub.l d7,d1
		bpl.s	.tloop23
    66b6:	bpl.s 6694 <.tloop23>
		cmpa.l	a0,a4
    66b8:	cmpa.l a0,a4
		beq.s	lz4Rts27
    66ba:	beq.s 66f2 <lz4Rts27>
		move.b	(a0)+,d0
    66bc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    66be:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    66c0:	move.w (sp)+,d3
		move.b	d0,d3
    66c2:	move.b d0,d3
		move.l	a1,a2
    66c4:	movea.l a1,a2
		sub.l	d3,a2
    66c6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    66c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66e2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    66e4:	moveq #0,d0
		move.b	(a0)+,d0
    66e6:	move.b (a0)+,d0
		add.w	d0,d0
    66e8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    66ea:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    66ee:	jmp (0,a3,d0.w)

000066f2 <lz4Rts27>:
lz4Rts27:	rts
    66f2:	rts

000066f4 <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    66f4:	moveq #15,d1

000066f6 <.cl24>:
.cl24:	move.b	(a0)+,d2
    66f6:	/-> move.b (a0)+,d2
		add.l d2,d1
    66f8:	|   add.l d2,d1
		not.b	d2
    66fa:	|   not.b d2
		beq.s	.cl24
    66fc:	\-- beq.s 66f6 <.cl24>
		moveq	#15,d5
    66fe:	    moveq #15,d5
		and.w	d1,d5
    6700:	    and.w d1,d5
		add.w	d5,d5
    6702:	    add.w d5,d5
		neg.w	d5
    6704:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    6706:	    jmp (672a <.eloop25>,pc,d5.w)

0000670a <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    670a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    670c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    670e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6710:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6712:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6714:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6716:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6718:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    671a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    671c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    671e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6720:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6722:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6724:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6726:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6728:	move.b (a0)+,(a1)+

0000672a <.eloop25>:
.eloop25:	sub.l	d7,d1
    672a:	sub.l d7,d1
		bpl.s	.tloop25
    672c:	bpl.s 670a <.tloop25>
		cmpa.l	a0,a4
    672e:	cmpa.l a0,a4
		beq.s	lz4Rts28
    6730:	beq.s 676a <lz4Rts28>
		move.b	(a0)+,d0
    6732:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6734:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6736:	move.w (sp)+,d3
		move.b	d0,d3
    6738:	move.b d0,d3
		move.l	a1,a2
    673a:	movea.l a1,a2
		sub.l	d3,a2
    673c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    673e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6740:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6742:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6744:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6746:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6748:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    674a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    674c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    674e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6750:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6752:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6754:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6756:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6758:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    675a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    675c:	moveq #0,d0
		move.b	(a0)+,d0
    675e:	move.b (a0)+,d0
		add.w	d0,d0
    6760:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6762:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6766:	jmp (0,a3,d0.w)

0000676a <lz4Rts28>:
lz4Rts28:	rts
    676a:	rts

0000676c <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    676c:	moveq #15,d1

0000676e <.cl26>:
.cl26:	move.b	(a0)+,d2
    676e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6770:	|   add.l d2,d1
		not.b	d2
    6772:	|   not.b d2
		beq.s	.cl26
    6774:	\-- beq.s 676e <.cl26>
		moveq	#15,d5
    6776:	    moveq #15,d5
		and.w	d1,d5
    6778:	    and.w d1,d5
		add.w	d5,d5
    677a:	    add.w d5,d5
		neg.w	d5
    677c:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    677e:	    jmp (67a2 <.eloop27>,pc,d5.w)

00006782 <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    6782:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6784:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6786:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6788:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    678a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    678c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    678e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6790:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6792:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6794:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6796:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6798:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    679a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    679c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    679e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67a0:	move.b (a0)+,(a1)+

000067a2 <.eloop27>:
.eloop27:	sub.l	d7,d1
    67a2:	sub.l d7,d1
		bpl.s	.tloop27
    67a4:	bpl.s 6782 <.tloop27>
		cmpa.l	a0,a4
    67a6:	cmpa.l a0,a4
		beq.s	lz4Rts29
    67a8:	beq.s 67e4 <lz4Rts29>
		move.b	(a0)+,d0
    67aa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    67ac:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    67ae:	move.w (sp)+,d3
		move.b	d0,d3
    67b0:	move.b d0,d3
		move.l	a1,a2
    67b2:	movea.l a1,a2
		sub.l	d3,a2
    67b4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    67b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67d4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    67d6:	moveq #0,d0
		move.b	(a0)+,d0
    67d8:	move.b (a0)+,d0
		add.w	d0,d0
    67da:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    67dc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    67e0:	jmp (0,a3,d0.w)

000067e4 <lz4Rts29>:
lz4Rts29:	rts
    67e4:	rts

000067e6 <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    67e6:	moveq #15,d1

000067e8 <.cl28>:
.cl28:	move.b	(a0)+,d2
    67e8:	/-> move.b (a0)+,d2
		add.l d2,d1
    67ea:	|   add.l d2,d1
		not.b	d2
    67ec:	|   not.b d2
		beq.s	.cl28
    67ee:	\-- beq.s 67e8 <.cl28>
		moveq	#15,d5
    67f0:	    moveq #15,d5
		and.w	d1,d5
    67f2:	    and.w d1,d5
		add.w	d5,d5
    67f4:	    add.w d5,d5
		neg.w	d5
    67f6:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    67f8:	    jmp (681c <.eloop29>,pc,d5.w)

000067fc <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    67fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6800:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6802:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6804:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6806:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6808:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    680a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    680c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    680e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6810:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6812:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6814:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6816:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6818:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    681a:	move.b (a0)+,(a1)+

0000681c <.eloop29>:
.eloop29:	sub.l	d7,d1
    681c:	sub.l d7,d1
		bpl.s	.tloop29
    681e:	bpl.s 67fc <.tloop29>
		cmpa.l	a0,a4
    6820:	cmpa.l a0,a4
		beq.s	lz4Rts30
    6822:	beq.s 6860 <lz4Rts30>
		move.b	(a0)+,d0
    6824:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6826:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6828:	move.w (sp)+,d3
		move.b	d0,d3
    682a:	move.b d0,d3
		move.l	a1,a2
    682c:	movea.l a1,a2
		sub.l	d3,a2
    682e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6830:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6832:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6834:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6836:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6838:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    683a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    683c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    683e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6840:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6842:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6844:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6846:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6848:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    684a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    684c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    684e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6850:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6852:	moveq #0,d0
		move.b	(a0)+,d0
    6854:	move.b (a0)+,d0
		add.w	d0,d0
    6856:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6858:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    685c:	jmp (0,a3,d0.w)

00006860 <lz4Rts30>:
lz4Rts30:	rts
    6860:	rts

00006862 <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    6862:	moveq #15,d1

00006864 <.cl30>:
.cl30:	move.b	(a0)+,d2
    6864:	/-> move.b (a0)+,d2
		add.l d2,d1
    6866:	|   add.l d2,d1
		not.b	d2
    6868:	|   not.b d2
		beq.s	.cl30
    686a:	\-- beq.s 6864 <.cl30>
		moveq	#15,d5
    686c:	    moveq #15,d5
		and.w	d1,d5
    686e:	    and.w d1,d5
		add.w	d5,d5
    6870:	    add.w d5,d5
		neg.w	d5
    6872:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    6874:	    jmp (6898 <.eloop31>,pc,d5.w)

00006878 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    6878:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6880:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6882:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6884:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6886:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6888:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    688a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    688c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    688e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6890:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6892:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6894:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6896:	move.b (a0)+,(a1)+

00006898 <.eloop31>:
.eloop31:	sub.l	d7,d1
    6898:	sub.l d7,d1
		bpl.s	.tloop31
    689a:	bpl.s 6878 <.tloop31>
		cmpa.l	a0,a4
    689c:	cmpa.l a0,a4
		beq.s	lz4Rts31
    689e:	beq.s 68de <lz4Rts31>
		move.b	(a0)+,d0
    68a0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    68a2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    68a4:	move.w (sp)+,d3
		move.b	d0,d3
    68a6:	move.b d0,d3
		move.l	a1,a2
    68a8:	movea.l a1,a2
		sub.l	d3,a2
    68aa:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    68ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68ce:	move.b (a2)+,(a1)+
		moveq	#0,d0
    68d0:	moveq #0,d0
		move.b	(a0)+,d0
    68d2:	move.b (a0)+,d0
		add.w	d0,d0
    68d4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    68d6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    68da:	jmp (0,a3,d0.w)

000068de <lz4Rts31>:
lz4Rts31:	rts
    68de:	rts

000068e0 <ll_lm>:

ll_lm:
		moveq	#15,d1
    68e0:	moveq #15,d1

000068e2 <.cl32>:
.cl32:	move.b	(a0)+,d2
    68e2:	/-> move.b (a0)+,d2
		add.l d2,d1
    68e4:	|   add.l d2,d1
		not.b	d2
    68e6:	|   not.b d2
		beq.s	.cl32
    68e8:	\-- beq.s 68e2 <.cl32>
		moveq	#15,d5
    68ea:	    moveq #15,d5
		and.w	d1,d5
    68ec:	    and.w d1,d5
		add.w	d5,d5
    68ee:	    add.w d5,d5
		neg.w	d5
    68f0:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    68f2:	    jmp (6916 <.eloop33>,pc,d5.w)

000068f6 <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    68f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6900:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6902:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6904:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6906:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6908:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    690a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    690c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    690e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6910:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6912:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6914:	move.b (a0)+,(a1)+

00006916 <.eloop33>:
.eloop33:	sub.l	d7,d1
    6916:	sub.l d7,d1
		bpl.s	.tloop33
    6918:	bpl.s 68f6 <.tloop33>
		cmpa.l	a0,a4
    691a:	cmpa.l a0,a4
		beq.s	lz4Rts32
    691c:	beq.s 6972 <lz4Rts32>
		move.b	(a0)+,d0
    691e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6920:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6922:	move.w (sp)+,d3
		move.b	d0,d3
    6924:	move.b d0,d3
		move.l	a1,a2
    6926:	movea.l a1,a2
		sub.l	d3,a2
    6928:	suba.l d3,a2
		moveq	#15+4,d1
    692a:	moveq #19,d1

0000692c <.cl34>:
.cl34:	move.b	(a0)+,d2
    692c:	/-> move.b (a0)+,d2
		add.l d2,d1
    692e:	|   add.l d2,d1
		not.b	d2
    6930:	|   not.b d2
		beq.s	.cl34
    6932:	\-- beq.s 692c <.cl34>
		moveq	#15,d5
    6934:	    moveq #15,d5
		and.w	d1,d5
    6936:	    and.w d1,d5
		add.w	d5,d5
    6938:	    add.w d5,d5
		neg.w	d5
    693a:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    693c:	    jmp (6960 <.eloop35>,pc,d5.w)

00006940 <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    6940:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6942:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6944:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6946:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6948:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    694a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    694c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    694e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6950:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6952:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6954:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6956:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6958:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    695a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    695c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    695e:	move.b (a2)+,(a1)+

00006960 <.eloop35>:
.eloop35:	sub.l	d7,d1
    6960:	sub.l d7,d1
		bpl.s	.tloop35
    6962:	bpl.s 6940 <.tloop35>
		moveq	#0,d0
    6964:	moveq #0,d0
		move.b	(a0)+,d0
    6966:	move.b (a0)+,d0
		add.w	d0,d0
    6968:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    696a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    696e:	jmp (0,a3,d0.w)

00006972 <lz4Rts32>:
lz4Rts32:				
			rts
    6972:	rts

00006974 <lz4Over>:

lz4Over:	rts
    6974:	rts

00006976 <lz4jmp>:
    6976:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    6978:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    697a:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    697c:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    697e:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    6980:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    6982:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    6984:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    6986:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    6988:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    698a:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    698c:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    698e:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    6990:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    6992:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    6994:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    6996:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    6998:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    699a:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    699c:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    699e:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    69a0:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    69a2:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    69a4:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    69a6:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    69a8:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    69aa:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    69ac:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    69ae:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    69b0:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    69b2:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    69b4:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    69b6:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    69b8:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    69ba:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    69bc:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    69be:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    69c0:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    69c2:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    69c4:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    69c6:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    69c8:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    69ca:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    69cc:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    69ce:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    69d0:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    69d2:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    69d4:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    69d6:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    69d8:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    69da:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    69dc:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    69de:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    69e0:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    69e2:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    69e4:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    69e6:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    69e8:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    69ea:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    69ec:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    69ee:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    69f0:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    69f2:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    69f4:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    69f6:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    69f8:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    69fa:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    69fc:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    69fe:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    6a00:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    6a02:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    6a04:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    6a06:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    6a08:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    6a0a:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    6a0c:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    6a0e:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    6a10:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    6a12:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    6a14:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    6a16:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    6a18:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    6a1a:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    6a1c:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    6a1e:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    6a20:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    6a22:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    6a24:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    6a26:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    6a28:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    6a2a:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    6a2c:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    6a2e:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    6a30:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    6a32:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    6a34:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    6a36:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    6a38:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    6a3a:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    6a3c:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    6a3e:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    6a40:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    6a42:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    6a44:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    6a46:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    6a48:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    6a4a:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    6a4c:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    6a4e:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    6a50:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    6a52:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    6a54:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    6a56:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    6a58:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    6a5a:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    6a5c:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    6a5e:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    6a60:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    6a62:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    6a64:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    6a66:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    6a68:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    6a6a:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    6a6c:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    6a6e:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    6a70:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    6a72:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    6a74:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    6a76:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    6a78:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    6a7a:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    6a7c:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    6a7e:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    6a80:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    6a82:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    6a84:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    6a86:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    6a88:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    6a8a:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    6a8c:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    6a8e:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    6a90:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    6a92:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    6a94:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    6a96:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    6a98:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    6a9a:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    6a9c:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    6a9e:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    6aa0:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    6aa2:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    6aa4:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    6aa6:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    6aa8:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    6aaa:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    6aac:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    6aae:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    6ab0:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    6ab2:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    6ab4:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    6ab6:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    6ab8:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    6aba:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    6abc:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    6abe:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    6ac0:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    6ac2:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    6ac4:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    6ac6:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    6ac8:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    6aca:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    6acc:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    6ace:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    6ad0:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    6ad2:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    6ad4:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    6ad6:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6ad8:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6ada:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6adc:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6ade:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6ae0:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    6ae2:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    6ae4:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    6ae6:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6ae8:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6aea:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6aec:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6aee:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6af0:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    6af2:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    6af4:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    6af6:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6af8:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6afa:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6afc:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6afe:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6b00:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    6b02:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    6b04:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    6b06:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6b08:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6b0a:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6b0c:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6b0e:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6b10:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    6b12:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    6b14:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    6b16:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6b18:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6b1a:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6b1c:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6b1e:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6b20:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    6b22:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    6b24:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    6b26:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    6b28:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    6b2a:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    6b2c:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    6b2e:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    6b30:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    6b32:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    6b34:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    6b36:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    6b38:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    6b3a:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    6b3c:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    6b3e:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    6b40:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    6b42:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    6b44:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    6b46:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    6b48:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    6b4a:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    6b4c:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    6b4e:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    6b50:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    6b52:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    6b54:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    6b56:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    6b58:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    6b5a:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    6b5c:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    6b5e:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    6b60:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    6b62:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    6b64:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    6b66:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    6b68:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    6b6a:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    6b6c:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    6b6e:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    6b70:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    6b72:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    6b74:	.short 0xff6a
