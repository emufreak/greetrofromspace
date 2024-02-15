
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
      70:	                                                                      move.l a6,85300 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                                      move.l #14675968,852fc <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                                      lea 3d1bf <incbin_MercuryLetterData2Lz4_end+0x119>,a1
      86:	                                                                      moveq #0,d0
      88:	                                                                      jsr -552(a6)
      8c:	                                                                      move.l d0,852f8 <GfxBase>
	if (!GfxBase)
      92:	               /----------------------------------------------------- beq.w 93c <main+0x8d6>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                                      movea.l 85300 <SysBase>,a6
      9c:	               |                                                      lea 3d1d0 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
      a2:	               |                                                      moveq #0,d0
      a4:	               |                                                      jsr -552(a6)
      a8:	               |                                                      move.l d0,852f4 <DOSBase>
	if (!DOSBase)
      ae:	         /-----|----------------------------------------------------- beq.w 8d6 <main+0x870>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|----------------------------------------------------> pea 3d1dc <incbin_MercuryLetterData2Lz4_end+0x136>
      b8:	         |  |  |                                                      lea 256c <KPrintF>,a4
      be:	         |  |  |                                                      jsr (a4)
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
      c0:	         |  |  |                                                      movea.l 852f4 <DOSBase>,a6
      c6:	         |  |  |                                                      jsr -60(a6)
      ca:	         |  |  |                                                      movea.l 852f4 <DOSBase>,a6
      d0:	         |  |  |                                                      move.l d0,d1
      d2:	         |  |  |                                                      move.l #250360,d2
      d8:	         |  |  |                                                      moveq #15,d3
      da:	         |  |  |                                                      jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                                      movea.l 852f4 <DOSBase>,a6
      e4:	         |  |  |                                                      moveq #50,d1
      e6:	         |  |  |                                                      jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
      ea:	         |  |  |                                                      lea 67892 <incbin_module2_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      f0:	         |  |  |                                                      suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      f2:	         |  |  |                                                      suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
      f4:	         |  |  |                                                      lea 6b5e <incbin_player_start>,a3
		__asm volatile (
      fa:	         |  |  |                                                      movem.l d1-d7/a4-a6,-(sp)
      fe:	         |  |  |                                                      jsr (a3)
     100:	         |  |  |                                                      movem.l (sp)+,d1-d7/a4-a6

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module2) != 0)
     104:	         |  |  |                                                      addq.l #4,sp
     106:	         |  |  |                                                      tst.l d0
     108:	         |  |  |  /-------------------------------------------------- bne.w 854 <main+0x7ee>
	Forbid();
     10c:	         |  |  |  |  /----------------------------------------------> movea.l 85300 <SysBase>,a6
     112:	         |  |  |  |  |                                                jsr -132(a6)
	SystemADKCON=custom->adkconr;
     116:	         |  |  |  |  |                                                movea.l 852fc <custom>,a0
     11c:	         |  |  |  |  |                                                move.w 16(a0),d0
	SystemInts=custom->intenar;
     120:	         |  |  |  |  |                                                move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     124:	         |  |  |  |  |                                                move.w 2(a0),d0
	LoadView(0);
     128:	         |  |  |  |  |                                                movea.l 852f8 <GfxBase>,a6
     12e:	         |  |  |  |  |                                                suba.l a1,a1
     130:	         |  |  |  |  |                                                jsr -222(a6)
	WaitTOF();
     134:	         |  |  |  |  |                                                movea.l 852f8 <GfxBase>,a6
     13a:	         |  |  |  |  |                                                jsr -270(a6)
	WaitTOF();
     13e:	         |  |  |  |  |                                                movea.l 852f8 <GfxBase>,a6
     144:	         |  |  |  |  |                                                jsr -270(a6)
	WaitVbl();
     148:	         |  |  |  |  |                                                lea c06 <WaitVbl>,a2
     14e:	         |  |  |  |  |                                                jsr (a2)
	WaitVbl();
     150:	         |  |  |  |  |                                                jsr (a2)
	OwnBlitter();
     152:	         |  |  |  |  |                                                movea.l 852f8 <GfxBase>,a6
     158:	         |  |  |  |  |                                                jsr -456(a6)
	WaitBlit();	
     15c:	         |  |  |  |  |                                                movea.l 852f8 <GfxBase>,a6
     162:	         |  |  |  |  |                                                jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     166:	         |  |  |  |  |                                                movea.l 852fc <custom>,a0
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
     1ae:	         |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     1b4:	         |  |  |  |  |  |                                             btst #0,297(a6)
     1ba:	/--------|--|--|--|--|--|-------------------------------------------- beq.w b94 <main+0xb2e>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1be:	|        |  |  |  |  |  |                                             moveq #46,d7
     1c0:	|        |  |  |  |  |  |                                             add.l sp,d7
     1c2:	|        |  |  |  |  |  |                                             exg d7,a5
     1c4:	|        |  |  |  |  |  |                                             jsr -30(a6)
     1c8:	|        |  |  |  |  |  |                                             exg d7,a5
	VBR=GetVBR();
     1ca:	|        |  |  |  |  |  |                                             move.l d0,851e6 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1d0:	|        |  |  |  |  |  |                                             movea.l 851e6 <VBR>,a0
     1d6:	|        |  |  |  |  |  |                                             move.l 108(a0),d0
		KPrintF("p61Init failed!\n");
#endif
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     1da:	|        |  |  |  |  |  |                                             jsr (a2)

	Sw_PrepareDisplay();
     1dc:	|        |  |  |  |  |  |                                             jsr 4cd4 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;	
     1e2:	|        |  |  |  |  |  |                                             movea.l 852fc <custom>,a0
     1e8:	|        |  |  |  |  |  |                                             move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     1ee:	|        |  |  |  |  |  |                                             move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
     1f4:	|        |  |  |  |  |  |                                             lea cc6 <Sw_Run>,a3
     1fa:	|        |  |  |  |  |  |                                             tst.w 852f2 <SwScrollerFinished>
     200:	|  /-----|--|--|--|--|--|-------------------------------------------- bne.s 20c <main+0x1a6>
		Sw_Run();
     202:	|  |  /--|--|--|--|--|--|-------------------------------------------> jsr (a3)
	while(SwScrollerFinished == 0) {
     204:	|  |  |  |  |  |  |  |  |                                             tst.w 852f2 <SwScrollerFinished>
     20a:	|  |  +--|--|--|--|--|--|-------------------------------------------- beq.s 202 <main+0x19c>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     20c:	|  >--|--|--|--|--|--|--|-------------------------------------------> movea.l 85300 <SysBase>,a6
     212:	|  |  |  |  |  |  |  |  |                                             movea.l 851fa <Sw_ScreenBuffer1>,a1
     218:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     21e:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     222:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     228:	|  |  |  |  |  |  |  |  |                                             movea.l 851f6 <Sw_ScreenBuffer2>,a1
     22e:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     234:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer3, BPLSIZE*BPLDEPTH);
     238:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     23e:	|  |  |  |  |  |  |  |  |                                             movea.l 851f2 <Sw_ScreenBuffer3>,a1
     244:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     24a:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     24e:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     254:	|  |  |  |  |  |  |  |  |                                             movea.l 851ee <Sw_FontBuffer>,a1
     25a:	|  |  |  |  |  |  |  |  |                                             move.l #4000,d0
     260:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_font, 38000);
     264:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     26a:	|  |  |  |  |  |  |  |  |                                             lea 6a1ee <incbin_Sw_font_start>,a1
     270:	|  |  |  |  |  |  |  |  |                                             move.l #38000,d0
     276:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  RemIntServer( INTB_COPER, Sw_Vbint);
     27a:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     280:	|  |  |  |  |  |  |  |  |                                             moveq #4,d0
     282:	|  |  |  |  |  |  |  |  |                                             movea.l 851ea <Sw_Vbint>,a1
     288:	|  |  |  |  |  |  |  |  |                                             jsr -174(a6)
	}
	Sw_Cleanup();

	WaitBlit();
     28c:	|  |  |  |  |  |  |  |  |                                             movea.l 852f8 <GfxBase>,a6
     292:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
		
	custom->dmacon = 0x83ff;
     296:	|  |  |  |  |  |  |  |  |                                             movea.l 852fc <custom>,a0
     29c:	|  |  |  |  |  |  |  |  |                                             move.w #-31745,150(a0)
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     2a2:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     2a8:	|  |  |  |  |  |  |  |  |                                             moveq #22,d0
     2aa:	|  |  |  |  |  |  |  |  |                                             move.l #65537,d1
     2b0:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2b4:	|  |  |  |  |  |  |  |  |                                             movea.l d0,a1
     2b6:	|  |  |  |  |  |  |  |  |                                             move.l d0,852ca <Vbint>
     2bc:	|  |  |  |  |  |  |  |  |                                         /-- beq.s 2d8 <main+0x272>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     2be:	|  |  |  |  |  |  |  |  |                                         |   move.w #708,8(a1)
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
     2c4:	|  |  |  |  |  |  |  |  |                                         |   move.l #250132,10(a1)
    Vbint->is_Data = NULL;
     2cc:	|  |  |  |  |  |  |  |  |                                         |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     2d0:	|  |  |  |  |  |  |  |  |                                         |   move.l #3182,18(a1)
  }

  AddIntServer( INTB_VERTB, Vbint); 
     2d8:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 85300 <SysBase>,a6
     2de:	|  |  |  |  |  |  |  |  |                                             moveq #5,d0
     2e0:	|  |  |  |  |  |  |  |  |                                             jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     2e4:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     2ea:	|  |  |  |  |  |  |  |  |                                             move.l #25000,d0
     2f0:	|  |  |  |  |  |  |  |  |                                             moveq #0,d1
     2f2:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2f6:	|  |  |  |  |  |  |  |  |                                             move.l d0,852ea <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     2fc:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     302:	|  |  |  |  |  |  |  |  |                                             move.l #120000,d0
     308:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     30a:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     30e:	|  |  |  |  |  |  |  |  |                                             move.l d0,852e6 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     314:	|  |  |  |  |  |  |  |  |                                             pea 3 <_start+0x3>
     318:	|  |  |  |  |  |  |  |  |                                             pea 2710 <DrawRect+0x132>
     31c:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     31e:	|  |  |  |  |  |  |  |  |                                             lea c92 <Utils_FillLong.constprop.0>,a3
     324:	|  |  |  |  |  |  |  |  |                                             jsr (a3)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     326:	|  |  |  |  |  |  |  |  |                                             movea.l 852f8 <GfxBase>,a6
     32c:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     330:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff044 <_end+0xd79d40>
  custom->bltalwm = 0xffff; //Static
     338:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff046 <_end+0xd79d42>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     340:	|  |  |  |  |  |  |  |  |                                             move.l 852e6 <LineBuffer>,d5
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
     35e:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     364:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd79cfe>,d0
     36a:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     36e:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 364 <main+0x2fe>
  custom->bltcon0 = 0x01f0;
     370:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0;
     378:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd79d3e>
  custom->bltadat = data;
     380:	|  |  |  |  |  |  |  |  |                                   |         move.w d2,dff074 <_end+0xd79d70>
  custom->bltdpt = Target;  
     386:	|  |  |  |  |  |  |  |  |                                   |         move.l a0,dff054 <_end+0xd79d50>
  custom->bltdmod = mod;
     38c:	|  |  |  |  |  |  |  |  |                                   |         move.w #10,dff066 <_end+0xd79d62>
  custom->bltsize = lines*64+linelength;
     394:	|  |  |  |  |  |  |  |  |                                   |         move.w #6401,dff058 <_end+0xd79d54>
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
     3d6:	|  |  |  |  |  |  |  |  |                                   |  /----> move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3dc:	|  |  |  |  |  |  |  |  |                                   |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
     3e2:	|  |  |  |  |  |  |  |  |                                   |  |  |   btst #14,d0
     3e6:	|  |  |  |  |  |  |  |  |                                   |  |  \-- bne.s 3dc <main+0x376>
  custom->bltcon0 = 0x01f0;
     3e8:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #496,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0;
     3f0:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #0,dff042 <_end+0xd79d3e>
  custom->bltadat = data;
     3f8:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #-1,dff074 <_end+0xd79d70>
  custom->bltdpt = Target;  
     400:	|  |  |  |  |  |  |  |  |                                   |  |      move.l d1,dff054 <_end+0xd79d50>
  custom->bltdmod = mod;
     406:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a0,dff066 <_end+0xd79d62>
  custom->bltsize = lines*64+linelength;
     40c:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a5,dff058 <_end+0xd79d54>
      while( height > 512) {
     412:	|  |  |  |  |  |  |  |  |                                   |  |      addi.l #6144,d1
     418:	|  |  |  |  |  |  |  |  |                                   |  |      cmp.l d2,d1
     41a:	|  |  |  |  |  |  |  |  |                                   |  \----- bne.s 3d6 <main+0x370>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     41c:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     422:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd79cfe>,d0
     428:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     42c:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 422 <main+0x3bc>
  custom->bltcon0 = 0x01f0;
     42e:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0;
     436:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd79d3e>
  custom->bltadat = data;
     43e:	|  |  |  |  |  |  |  |  |                                   |         move.w #-1,dff074 <_end+0xd79d70>
  custom->bltdpt = Target;  
     446:	|  |  |  |  |  |  |  |  |                                   |         move.l d1,dff054 <_end+0xd79d50>
  custom->bltdmod = mod;
     44c:	|  |  |  |  |  |  |  |  |                                   |         move.w a0,dff066 <_end+0xd79d62>
  custom->bltsize = lines*64+linelength;
     452:	|  |  |  |  |  |  |  |  |                                   |         move.w d4,d0
     454:	|  |  |  |  |  |  |  |  |                                   |         addi.w #4096,d0
     458:	|  |  |  |  |  |  |  |  |                                   |         move.w d0,dff058 <_end+0xd79d54>
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
     47e:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 85300 <SysBase>,a6
     484:	|  |  |  |  |  |  |  |  |                                             move.l #33024,d0
     48a:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     48c:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     490:	|  |  |  |  |  |  |  |  |                                             move.l d0,d2
     492:	|  |  |  |  |  |  |  |  |                                             move.l d0,852e2 <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     498:	|  |  |  |  |  |  |  |  |                                             pea 10 <_start+0x10>
     49c:	|  |  |  |  |  |  |  |  |                                             pea 204 <main+0x19e>
     4a0:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     4a2:	|  |  |  |  |  |  |  |  |                                             jsr (a3)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     4a4:	|  |  |  |  |  |  |  |  |                                             pea 2 <_start+0x2>
     4a8:	|  |  |  |  |  |  |  |  |                                             pea 100 <main+0x9a>
     4ac:	|  |  |  |  |  |  |  |  |                                             pea 3d219 <incbin_MercuryLetterData2Lz4_end+0x173>
     4b2:	|  |  |  |  |  |  |  |  |                                             move.l d2,-(sp)
     4b4:	|  |  |  |  |  |  |  |  |                                             lea 4456 <debug_register_bitmap.constprop.0>,a5
     4ba:	|  |  |  |  |  |  |  |  |                                             jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4bc:	|  |  |  |  |  |  |  |  |                                             movea.l 85300 <SysBase>,a6
     4c2:	|  |  |  |  |  |  |  |  |                                             move.l #49536,d0
     4c8:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     4ca:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     4ce:	|  |  |  |  |  |  |  |  |                                             move.l d0,852de <Bitmap1>
  if(Bitmap1 == 0) {
     4d4:	|  |  |  |  |  |  |  |  |                                             lea 28(sp),sp
     4d8:	|  |  |  |  |  |  |  |  |        /----------------------------------- beq.w b0a <main+0xaa4>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     4dc:	|  |  |  |  |  |  |  |  |        |                                    pea 3 <_start+0x3>
     4e0:	|  |  |  |  |  |  |  |  |        |                                    pea 100 <main+0x9a>
     4e4:	|  |  |  |  |  |  |  |  |        |                                    pea 3d24a <incbin_MercuryLetterData2Lz4_end+0x1a4>
     4ea:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,-(sp)
     4ec:	|  |  |  |  |  |  |  |  |        |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     4ee:	|  |  |  |  |  |  |  |  |        |                                    move.l 852de <Bitmap1>,d2
     4f4:	|  |  |  |  |  |  |  |  |        |                                    pea 10 <_start+0x10>
     4f8:	|  |  |  |  |  |  |  |  |        |                                    pea 306 <main+0x2a0>
     4fc:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,-(sp)
     4fe:	|  |  |  |  |  |  |  |  |        |                                    jsr (a3)

  ScreenBuffer1.BitPlane = Bitmap1;
     500:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,85292 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     506:	|  |  |  |  |  |  |  |  |        |                                    clr.l 85296 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     50c:	|  |  |  |  |  |  |  |  |        |                                    clr.l 852a2 <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     512:	|  |  |  |  |  |  |  |  |        |                                    movea.l 85300 <SysBase>,a6
     518:	|  |  |  |  |  |  |  |  |        |                                    move.l #49536,d0
     51e:	|  |  |  |  |  |  |  |  |        |                                    moveq #2,d1
     520:	|  |  |  |  |  |  |  |  |        |                                    jsr -198(a6)
     524:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,852da <Bitmap2>
  if(Bitmap2 == 0) {
     52a:	|  |  |  |  |  |  |  |  |        |                                    lea 28(sp),sp
     52e:	|  |  |  |  |  |  |  |  |  /-----|----------------------------------- beq.w a80 <main+0xa1a>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     532:	|  |  |  |  |  |  |  |  |  |  /--|----------------------------------> pea 3 <_start+0x3>
     536:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     53a:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 3d27b <incbin_MercuryLetterData2Lz4_end+0x1d5>
     540:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     542:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     544:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l 852da <Bitmap2>,d2
     54a:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     54e:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 306 <main+0x2a0>
     552:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     554:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a3)

  ScreenBuffer2.BitPlane = Bitmap2;
     556:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,8525a <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     55c:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 8525e <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     562:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 8526a <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     568:	|  |  |  |  |  |  |  |  |  |  |  |                                    movea.l 85300 <SysBase>,a6
     56e:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     574:	|  |  |  |  |  |  |  |  |  |  |  |                                    moveq #2,d1
     576:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     57a:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,852d6 <Bitmap3>
  if(Bitmap3 == 0) {
     580:	|  |  |  |  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     584:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------------------- beq.w 968 <main+0x902>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     588:	|  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------------> pea 3 <_start+0x3>
     58c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 100 <main+0x9a>
     590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 3d2ac <incbin_MercuryLetterData2Lz4_end+0x206>
     596:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,-(sp)
     598:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     59a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l 852d6 <Bitmap3>,d2
     5a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 10 <_start+0x10>
     5a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 306 <main+0x2a0>
     5a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,-(sp)
     5aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)

  ScreenBuffer3.BitPlane = Bitmap3;
     5ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 85222 <ScreenBuffer3>,a3
     5b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     5b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 85226 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     5ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 85232 <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     5c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 2170 <Clbuild>,a5
     5c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d2
  DrawCopper = Clbuild( );
     5ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d3
     5ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,852d2 <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     5d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545426,851fe <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     5de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545370,85202 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     5e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,85206 <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     5ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,8520a <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     5f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545426,8520e <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     5fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545370,85212 <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     608:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545370,85216 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a3,8521a <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     618:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #545426,8521e <ScreenBufferList+0x20>

  SetBplPointers(); 
     622:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 24d0 <SetBplPointers>,a3
     628:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     62a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,852d2 <DrawCopper>
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
     630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,dff080 <_end+0xd79d7c>
	PrepareDisplay();	
	custom->intena=0xc020;//Enable vblank
     636:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              movea.l 852fc <custom>,a0
     63c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
     642:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)
  DrawCopper = ViewCopper;
     644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,852d2 <DrawCopper>
  ViewCopper = tmp;
     64a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,852ce <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,dff080 <_end+0xd79d7c>
	//LoadVectors();
	SwapCl();
	WaitVbl();	
     656:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)

	while( CubeFinished == 0) {		
     658:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 28(sp),sp
     65c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 5098 <DrawScreen>,a5
     662:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              tst.w 852ee <CubeFinished>
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
     66e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w f0ff60 <_end+0xe8ac5c>,d0
     674:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        cmpi.w #20153,d0
     678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-------------- beq.w 828 <main+0x7c2>
     67c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |               cmpi.w #-24562,d0
     680:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        +-------------- beq.w 828 <main+0x7c2>
		debug_start_idle();
		while(FrameCounter<2);
     684:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-------------> move.w 852f0 <FrameCounter>,d0
     68a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               cmpi.w #1,d0
     68e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-------------- bls.s 684 <main+0x61e>
		if(FrameCounter >= 3) {
     690:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-------------> move.w 852f0 <FrameCounter>,d0
     696:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #2,d0
     69a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----- bhi.w 7c4 <main+0x75e>
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
     69e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w #0,852f0 <FrameCounter>
		WaitVbl();
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      jsr (a2)
     6a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w f0ff60 <_end+0xe8ac5c>,d0
     6ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      cmpi.w #20153,d0
     6b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----- beq.w 7e6 <main+0x780>
     6b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|----> cmpi.w #-24562,d0
     6ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- beq.w 7e6 <main+0x780>
  UBYTE *tmp = DrawCopper;
     6be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 852d2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
     6c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 852ce <ViewCopper>,852d2 <DrawCopper>
  ViewCopper = tmp;
     6ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,852ce <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     6d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,dff080 <_end+0xd79d7c>
	while( CubeFinished == 0) {		
     6da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w 852ee <CubeFinished>
     6e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|----- beq.s 66a <main+0x604>
  FreeMem(WorkingMem, 25000);
     6e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|----> movea.l 85300 <SysBase>,a6
     6e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852ea <WorkingMem>,a1
     6ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #25000,d0
     6f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
     6f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     6fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852e6 <LineBuffer>,a1
     704:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #120000,d0
     70a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
     70e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     714:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852e2 <PrepareBuffer>,a1
     71a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #33024,d0
     720:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
     724:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     72a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852de <Bitmap1>,a1
     730:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     736:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
     73a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     740:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852da <Bitmap2>,a1
     746:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     74c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
     750:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     756:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852d6 <Bitmap3>,a1
     75c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     762:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
     766:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     76c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852d2 <DrawCopper>,a1
     772:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     778:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
     77c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     782:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852ce <ViewCopper>,a1
     788:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     78e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
     792:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
     798:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #5,d0
     79a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852ca <Vbint>,a1
     7a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -174(a6)
		debug_stop_idle();
		SwapCl();
	}

	CleanUp( );
	WaitVbl();
     7a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr (a2)
	custom->dmacon = 0x83ff;
     7a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 852fc <custom>,a0
     7ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     7b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-8160,154(a0)
	
	End_PrepareDisplay();
     7b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr 4a72 <End_PrepareDisplay.isra.0>

	while(1) {
		WaitVbl();
     7be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> jsr (a2)
     7c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a2)
	while(1) {
     7c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-- bra.s 7be <main+0x758>
    		KPrintF("Framerate below 25FPS\n");
     7c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> pea 3d2b8 <incbin_MercuryLetterData2Lz4_end+0x212>
     7ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a4)
     7cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.l #4,sp
		FrameCounter = 0;
     7ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #0,852f0 <FrameCounter>
		WaitVbl();
     7d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a2)
     7d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w f0ff60 <_end+0xe8ac5c>,d0
     7de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #20153,d0
     7e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- bne.w 6b6 <main+0x650>
		UaeLib(88, arg1, arg2, arg3, arg4);
     7e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> clr.l -(sp)
     7e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 5 <_start+0x5>
     7f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 58 <_start+0x58>
     7f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jsr f0ff60 <_end+0xe8ac5c>
	}
}
     7fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     7fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 852d2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
     804:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 852ce <ViewCopper>,852d2 <DrawCopper>
  ViewCopper = tmp;
     80e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,852ce <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     814:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,dff080 <_end+0xd79d7c>
	while( CubeFinished == 0) {		
     81a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               tst.w 852ee <CubeFinished>
     820:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|-------------- beq.w 66a <main+0x604>
     824:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-------------- bra.w 6e2 <main+0x67c>
		UaeLib(88, arg1, arg2, arg3, arg4);
     828:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------------> clr.l -(sp)
     82a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  clr.l -(sp)
     82c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 1 <_start+0x1>
     830:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 5 <_start+0x5>
     834:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 58 <_start+0x58>
     838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  jsr f0ff60 <_end+0xe8ac5c>
}
     83e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  lea 20(sp),sp
		while(FrameCounter<2);
     842:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  move.w 852f0 <FrameCounter>,d0
     848:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  cmpi.w #1,d0
     84c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|----------------- bls.w 684 <main+0x61e>
     850:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \----------------- bra.w 690 <main+0x62a>
		KPrintF("p61Init failed!\n");
     854:	|  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|----------------------> pea 3d208 <incbin_MercuryLetterData2Lz4_end+0x162>
     85a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a4)
     85c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        addq.l #4,sp
	Forbid();
     85e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 85300 <SysBase>,a6
     864:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -132(a6)
	SystemADKCON=custom->adkconr;
     868:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852fc <custom>,a0
     86e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 16(a0),d0
	SystemInts=custom->intenar;
     872:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     876:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 2(a0),d0
	LoadView(0);
     87a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852f8 <GfxBase>,a6
     880:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        suba.l a1,a1
     882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -222(a6)
	WaitTOF();
     886:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852f8 <GfxBase>,a6
     88c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitTOF();
     890:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852f8 <GfxBase>,a6
     896:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitVbl();
     89a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        lea c06 <WaitVbl>,a2
     8a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	WaitVbl();
     8a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	OwnBlitter();
     8a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852f8 <GfxBase>,a6
     8aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -456(a6)
	WaitBlit();	
     8ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852f8 <GfxBase>,a6
     8b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     8b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 852fc <custom>,a0
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
     8de:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        pea 3d1dc <incbin_MercuryLetterData2Lz4_end+0x136>
     8e4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 256c <KPrintF>,a4
     8ea:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a4)
	Write(Output(), (APTR)"Hello console!\n", 15);
     8ec:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 852f4 <DOSBase>,a6
     8f2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -60(a6)
     8f6:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 852f4 <DOSBase>,a6
     8fc:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l d0,d1
     8fe:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l #250360,d2
     904:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #15,d3
     906:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -48(a6)
	Delay(50);
     90a:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 852f4 <DOSBase>,a6
     910:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #50,d1
     912:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
     916:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 67892 <incbin_module2_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     91c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     91e:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a2,a2
		register volatile const void* _a3 ASM("a3") = player;
     920:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 6b5e <incbin_player_start>,a3
		__asm volatile (
     926:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l d1-d7/a4-a6,-(sp)
     92a:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a3)
     92c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l (sp)+,d1-d7/a4-a6
	if(p61Init(module2) != 0)
     930:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        addq.l #4,sp
     932:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        tst.l d0
     934:	|  |  |  |  |  |  |  \-----|--|--|--|--|--|--|----------------------- beq.w 10c <main+0xa6>
     938:	|  |  |  |  |  |  \--------|--|--|--|--|--|--|----------------------- bra.w 854 <main+0x7ee>
		Exit(0);
     93c:	|  |  |  |  |  \-----------|--|--|--|--|--|--|----------------------> movea.l 852f4 <DOSBase>,a6
     942:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d1
     944:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     948:	|  |  |  |  |              |  |  |  |  |  |  |                        movea.l 85300 <SysBase>,a6
     94e:	|  |  |  |  |              |  |  |  |  |  |  |                        lea 3d1d0 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
     954:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d0
     956:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -552(a6)
     95a:	|  |  |  |  |              |  |  |  |  |  |  |                        move.l d0,852f4 <DOSBase>
	if (!DOSBase)
     960:	|  |  |  |  \--------------|--|--|--|--|--|--|----------------------- bne.w b2 <main+0x4c>
     964:	|  |  |  \-----------------|--|--|--|--|--|--|----------------------- bra.w 8d6 <main+0x870>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     968:	|  |  |                    |  |  |  >--|--|--|----------------------> movea.l 852f4 <DOSBase>,a6
     96e:	|  |  |                    |  |  |  |  |  |  |                        jsr -60(a6)
     972:	|  |  |                    |  |  |  |  |  |  |                        movea.l 852f4 <DOSBase>,a6
     978:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d1
     97a:	|  |  |                    |  |  |  |  |  |  |                        move.l #250503,d2
     980:	|  |  |                    |  |  |  |  |  |  |                        moveq #38,d3
     982:	|  |  |                    |  |  |  |  |  |  |                        jsr -48(a6)
    Exit(1);
     986:	|  |  |                    |  |  |  |  |  |  |                        movea.l 852f4 <DOSBase>,a6
     98c:	|  |  |                    |  |  |  |  |  |  |                        moveq #1,d1
     98e:	|  |  |                    |  |  |  |  |  |  |                        jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     992:	|  |  |                    |  |  |  |  |  |  |                        move.l 852d6 <Bitmap3>,d0
     998:	|  |  |                    |  |  |  |  |  |  |                        pea 3 <_start+0x3>
     99c:	|  |  |                    |  |  |  |  |  |  |                        pea 100 <main+0x9a>
     9a0:	|  |  |                    |  |  |  |  |  |  |                        pea 3d2ac <incbin_MercuryLetterData2Lz4_end+0x206>
     9a6:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,-(sp)
     9a8:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     9aa:	|  |  |                    |  |  |  |  |  |  |                        move.l 852d6 <Bitmap3>,d2
     9b0:	|  |  |                    |  |  |  |  |  |  |                        pea 10 <_start+0x10>
     9b4:	|  |  |                    |  |  |  |  |  |  |                        pea 306 <main+0x2a0>
     9b8:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,-(sp)
     9ba:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  ScreenBuffer3.BitPlane = Bitmap3;
     9bc:	|  |  |                    |  |  |  |  |  |  |                        lea 85222 <ScreenBuffer3>,a3
     9c2:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,(a3)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     9c4:	|  |  |                    |  |  |  |  |  |  |                        clr.l 85226 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     9ca:	|  |  |                    |  |  |  |  |  |  |                        clr.l 85232 <ScreenBuffer3+0x10>
  ViewCopper = Clbuild( );
     9d0:	|  |  |                    |  |  |  |  |  |  |                        lea 2170 <Clbuild>,a5
     9d6:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9d8:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d2
  DrawCopper = Clbuild( );
     9da:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9dc:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d3
     9de:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,852d2 <DrawCopper>
  ScreenBufferList[0] = &ScreenBuffer1;
     9e4:	|  |  |                    |  |  |  |  |  |  |                        move.l #545426,851fe <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     9ee:	|  |  |                    |  |  |  |  |  |  |                        move.l #545370,85202 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     9f8:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,85206 <ScreenBufferList+0x8>
  ScreenBufferList[3] = &ScreenBuffer3;
     9fe:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,8520a <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     a04:	|  |  |                    |  |  |  |  |  |  |                        move.l #545426,8520e <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     a0e:	|  |  |                    |  |  |  |  |  |  |                        move.l #545370,85212 <ScreenBufferList+0x14>
  ScreenBufferList[6] = &ScreenBuffer2;
     a18:	|  |  |                    |  |  |  |  |  |  |                        move.l #545370,85216 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     a22:	|  |  |                    |  |  |  |  |  |  |                        move.l a3,8521a <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     a28:	|  |  |                    |  |  |  |  |  |  |                        move.l #545426,8521e <ScreenBufferList+0x20>
  SetBplPointers(); 
     a32:	|  |  |                    |  |  |  |  |  |  |                        lea 24d0 <SetBplPointers>,a3
     a38:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  DrawCopper = ViewCopper;
     a3a:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,852d2 <DrawCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a40:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,dff080 <_end+0xd79d7c>
	custom->intena=0xc020;//Enable vblank
     a46:	|  |  |                    |  |  |  |  |  |  |                        movea.l 852fc <custom>,a0
     a4c:	|  |  |                    |  |  |  |  |  |  |                        move.w #-16352,154(a0)
	SetBplPointers();
     a52:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
  DrawCopper = ViewCopper;
     a54:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,852d2 <DrawCopper>
  ViewCopper = tmp;
     a5a:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,852ce <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a60:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,dff080 <_end+0xd79d7c>
	WaitVbl();	
     a66:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
	while( CubeFinished == 0) {		
     a68:	|  |  |                    |  |  |  |  |  |  |                        lea 28(sp),sp
     a6c:	|  |  |                    |  |  |  |  |  |  |                        lea 5098 <DrawScreen>,a5
     a72:	|  |  |                    |  |  |  |  |  |  |                        tst.w 852ee <CubeFinished>
     a78:	|  |  |                    |  |  |  |  |  |  \----------------------- beq.w 66a <main+0x604>
     a7c:	|  |  |                    |  |  |  |  |  \-------------------------- bra.w 6e2 <main+0x67c>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     a80:	|  |  |                    >--|--|--|--|----------------------------> movea.l 852f4 <DOSBase>,a6
     a86:	|  |  |                    |  |  |  |  |                              jsr -60(a6)
     a8a:	|  |  |                    |  |  |  |  |                              movea.l 852f4 <DOSBase>,a6
     a90:	|  |  |                    |  |  |  |  |                              move.l d0,d1
     a92:	|  |  |                    |  |  |  |  |                              move.l #250454,d2
     a98:	|  |  |                    |  |  |  |  |                              moveq #38,d3
     a9a:	|  |  |                    |  |  |  |  |                              jsr -48(a6)
    Exit(1);
     a9e:	|  |  |                    |  |  |  |  |                              movea.l 852f4 <DOSBase>,a6
     aa4:	|  |  |                    |  |  |  |  |                              moveq #1,d1
     aa6:	|  |  |                    |  |  |  |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     aaa:	|  |  |                    |  |  |  |  |                              move.l 852da <Bitmap2>,d0
     ab0:	|  |  |                    |  |  |  |  |                              pea 3 <_start+0x3>
     ab4:	|  |  |                    |  |  |  |  |                              pea 100 <main+0x9a>
     ab8:	|  |  |                    |  |  |  |  |                              pea 3d27b <incbin_MercuryLetterData2Lz4_end+0x1d5>
     abe:	|  |  |                    |  |  |  |  |                              move.l d0,-(sp)
     ac0:	|  |  |                    |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     ac2:	|  |  |                    |  |  |  |  |                              move.l 852da <Bitmap2>,d2
     ac8:	|  |  |                    |  |  |  |  |                              pea 10 <_start+0x10>
     acc:	|  |  |                    |  |  |  |  |                              pea 306 <main+0x2a0>
     ad0:	|  |  |                    |  |  |  |  |                              move.l d2,-(sp)
     ad2:	|  |  |                    |  |  |  |  |                              jsr (a3)
  ScreenBuffer2.BitPlane = Bitmap2;
     ad4:	|  |  |                    |  |  |  |  |                              move.l d2,8525a <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     ada:	|  |  |                    |  |  |  |  |                              clr.l 8525e <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     ae0:	|  |  |                    |  |  |  |  |                              clr.l 8526a <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     ae6:	|  |  |                    |  |  |  |  |                              movea.l 85300 <SysBase>,a6
     aec:	|  |  |                    |  |  |  |  |                              move.l #49536,d0
     af2:	|  |  |                    |  |  |  |  |                              moveq #2,d1
     af4:	|  |  |                    |  |  |  |  |                              jsr -198(a6)
     af8:	|  |  |                    |  |  |  |  |                              move.l d0,852d6 <Bitmap3>
  if(Bitmap3 == 0) {
     afe:	|  |  |                    |  |  |  |  |                              lea 28(sp),sp
     b02:	|  |  |                    |  |  |  |  \----------------------------- bne.w 588 <main+0x522>
     b06:	|  |  |                    |  |  |  \-------------------------------- bra.w 968 <main+0x902>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     b0a:	|  |  |                    |  |  \----------------------------------> movea.l 852f4 <DOSBase>,a6
     b10:	|  |  |                    |  |                                       jsr -60(a6)
     b14:	|  |  |                    |  |                                       movea.l 852f4 <DOSBase>,a6
     b1a:	|  |  |                    |  |                                       move.l d0,d1
     b1c:	|  |  |                    |  |                                       move.l #250405,d2
     b22:	|  |  |                    |  |                                       moveq #38,d3
     b24:	|  |  |                    |  |                                       jsr -48(a6)
    Exit(1);
     b28:	|  |  |                    |  |                                       movea.l 852f4 <DOSBase>,a6
     b2e:	|  |  |                    |  |                                       moveq #1,d1
     b30:	|  |  |                    |  |                                       jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     b34:	|  |  |                    |  |                                       move.l 852de <Bitmap1>,d0
     b3a:	|  |  |                    |  |                                       pea 3 <_start+0x3>
     b3e:	|  |  |                    |  |                                       pea 100 <main+0x9a>
     b42:	|  |  |                    |  |                                       pea 3d24a <incbin_MercuryLetterData2Lz4_end+0x1a4>
     b48:	|  |  |                    |  |                                       move.l d0,-(sp)
     b4a:	|  |  |                    |  |                                       jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     b4c:	|  |  |                    |  |                                       move.l 852de <Bitmap1>,d2
     b52:	|  |  |                    |  |                                       pea 10 <_start+0x10>
     b56:	|  |  |                    |  |                                       pea 306 <main+0x2a0>
     b5a:	|  |  |                    |  |                                       move.l d2,-(sp)
     b5c:	|  |  |                    |  |                                       jsr (a3)
  ScreenBuffer1.BitPlane = Bitmap1;
     b5e:	|  |  |                    |  |                                       move.l d2,85292 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     b64:	|  |  |                    |  |                                       clr.l 85296 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     b6a:	|  |  |                    |  |                                       clr.l 852a2 <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     b70:	|  |  |                    |  |                                       movea.l 85300 <SysBase>,a6
     b76:	|  |  |                    |  |                                       move.l #49536,d0
     b7c:	|  |  |                    |  |                                       moveq #2,d1
     b7e:	|  |  |                    |  |                                       jsr -198(a6)
     b82:	|  |  |                    |  |                                       move.l d0,852da <Bitmap2>
  if(Bitmap2 == 0) {
     b88:	|  |  |                    |  |                                       lea 28(sp),sp
     b8c:	|  |  |                    |  \-------------------------------------- bne.w 532 <main+0x4cc>
     b90:	|  |  |                    \----------------------------------------- bra.w a80 <main+0xa1a>
	APTR vbr = 0;
     b94:	\--|--|-------------------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     b96:	   |  |                                                               move.l d0,851e6 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     b9c:	   |  |                                                               movea.l 851e6 <VBR>,a0
     ba2:	   |  |                                                               move.l 108(a0),d0
	WaitVbl();
     ba6:	   |  |                                                               jsr (a2)
	Sw_PrepareDisplay();
     ba8:	   |  |                                                               jsr 4cd4 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83ff;	
     bae:	   |  |                                                               movea.l 852fc <custom>,a0
     bb4:	   |  |                                                               move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     bba:	   |  |                                                               move.w #-8160,154(a0)
	while(SwScrollerFinished == 0) {
     bc0:	   |  |                                                               lea cc6 <Sw_Run>,a3
     bc6:	   |  |                                                               tst.w 852f2 <SwScrollerFinished>
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
     bf6:	jsr 5cd4 <_lz4_depack>
     bfc:	movem.l (sp)+,d0-d7/a2-a6
}
     c00:	nop
     c02:	addq.l #4,sp
     c04:	rts

00000c06 <WaitVbl>:
void WaitVbl() {
     c06:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c08:	/-> move.l dff004 <_end+0xd79d00>,d0
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
     c24:	/-> move.l dff004 <_end+0xd79d00>,d0
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
     c50:	lea 6b5e <incbin_player_start>,a3
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
     c6e:	move.w #32,dff09c <_end+0xd79d98>
  custom->intreq = 1 << INTB_VERTB;
     c76:	move.w #32,dff09c <_end+0xd79d98>
  p61Music();
     c7e:	jsr c4c <p61Music>(pc)
  FrameCounter++;
     c82:	move.w 852f0 <FrameCounter>,d0
     c88:	addq.w #1,d0
     c8a:	move.w d0,852f0 <FrameCounter>
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
     ca8:	    lea 59e0 <memset>(pc),a2
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
     cca:	          move.l 6548c <Sw_framecount>,d0
     cd0:	          moveq #50,d1
     cd2:	          cmp.l d0,d1
     cd4:	   /----- beq.w 1000 <Sw_Run+0x33a>
  Sw_framecount++;
     cd8:	   |      addq.l #1,d0
     cda:	   |      move.l d0,6548c <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     ce0:	/--|----> move.w 851e4 <Sw_BlitFrame>,d0
     ce6:	+--|----- beq.s ce0 <Sw_Run+0x1a>
  *bp = 0;
     ce8:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     cec:	|  |      move.w #0,851e4 <Sw_BlitFrame>
  WaitBlit();
     cf4:	|  |      lea 852f8 <GfxBase>,a2
     cfa:	|  |      movea.l (a2),a6
     cfc:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d00:	|  |      movea.l 852fc <custom>,a0
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
     d30:	|  |      move.l 6548c <Sw_framecount>,d1
     d36:	|  |      subq.l #1,d1
     d38:	|  |      move.l d1,d0
     d3a:	|  |      add.l d1,d0
     d3c:	|  |      add.l d0,d0
     d3e:	|  |      add.l d1,d0
     d40:	|  |      lsl.l #4,d0
     d42:	|  |      add.l 851ee <Sw_FontBuffer>,d0
     d48:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     d4c:	|  |      move.l 851e0 <Sw_DrawBuffer>,d0
     d52:	|  |      addi.l #20400,d0
     d58:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     d5c:	|  |      move.w #104,88(a0)
  WaitBlit();
     d62:	|  |      movea.l (a2),a6
     d64:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d68:	|  |      movea.l 852fc <custom>,a0
     d6e:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     d74:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     d7a:	|  |      move.l 851dc <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     d82:	|  |      move.l 851e0 <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     d8a:	|  |      lea 43348 <Sw_CopyLines>,a3
     d90:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
     d96:	|  |      add.l d0,d0
     d98:	|  |      move.w (0,a3,d0.l),d0
     d9c:	|  |      lsl.w #6,d0
     d9e:	|  |      addi.w #40,d0
     da2:	|  |      move.w d0,88(a0)
  WaitBlit();
     da6:	|  |      movea.l (a2),a6
     da8:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     dac:	|  |      movea.l 852fc <custom>,a0
     db2:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     db8:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     dbe:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     dc4:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     dca:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
     dd0:	|  |      add.l d0,d0
     dd2:	|  |      move.w (0,a3,d0.l),d1
     dd6:	|  |      move.w d1,d0
     dd8:	|  |      mulu.w #80,d0
     ddc:	|  |      movea.l d0,a1
     dde:	|  |      lea 120(a1),a4
     de2:	|  |      move.l 851dc <Sw_ViewBufferP1>,d0
     de8:	|  |      add.l a4,d0
     dea:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     dee:	|  |      lea 40(a1),a1
     df2:	|  |      adda.l 851e0 <Sw_DrawBuffer>,a1
     df8:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     dfc:	|  |      move.w d1,d0
     dfe:	|  |      mulu.w #40,d0
     e02:	|  |      addi.l #482914,d0
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
     e22:	|  |      movea.l 852fc <custom>,a0
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
     e52:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
     e58:	|  |      add.l d0,d0
     e5a:	|  |      move.w (0,a3,d0.l),d1
     e5e:	|  |      move.w d1,d0
     e60:	|  |      mulu.w #80,d0
     e64:	|  |      movea.l d0,a1
     e66:	|  |      lea 120(a1),a4
     e6a:	|  |      move.l 851dc <Sw_ViewBufferP1>,d0
     e70:	|  |      add.l a4,d0
     e72:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     e76:	|  |      move.w d1,d0
     e78:	|  |      mulu.w #40,d0
     e7c:	|  |      addi.l #482914,d0
     e82:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     e86:	|  |      lea 38(a1),a1
     e8a:	|  |      move.l 851e0 <Sw_DrawBuffer>,d0
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
     eb0:	|  |      movea.l 852fc <custom>,a1
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
     ee0:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
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
     efe:	|  |      movea.l 851dc <Sw_ViewBufferP1>,a0
     f04:	|  |      adda.l d0,a0
     f06:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     f0a:	|  |      movea.w #-80,a0
     f0e:	|  |      adda.l d0,a0
     f10:	|  |      move.l 851e0 <Sw_DrawBuffer>,d0
     f16:	|  |      add.l a0,d0
     f18:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f1c:	|  |      mulu.w #40,d1
     f20:	|  |      addi.l #472672,d1
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
     f40:	|  |      movea.l 852fc <custom>,a1
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
     f6a:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
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
     f86:	|  |      movea.l 851dc <Sw_ViewBufferP1>,a0
     f8c:	|  |      adda.l d0,a0
     f8e:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f92:	|  |      mulu.w #40,d1
     f96:	|  |      addi.l #472672,d1
     f9c:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     fa0:	|  |      movea.w #-80,a0
     fa4:	|  |      adda.l d0,a0
     fa6:	|  |      move.l 851e0 <Sw_DrawBuffer>,d0
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
     fcc:	|  |      movea.l 852fc <custom>,a0
     fd2:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     fd8:	|  |      move.l 851d8 <Sw_framecountscreen>,d0
     fde:	|  |      addq.l #1,d0
     fe0:	|  |      moveq #17,d1
     fe2:	|  |      cmp.l d0,d1
     fe4:	|  |  /-- beq.s ff2 <Sw_Run+0x32c>
     fe6:	|  |  |   move.l d0,851d8 <Sw_framecountscreen>
}
     fec:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     ff0:	|  |  |   rts
     ff2:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     ff4:	|  |      move.l d0,851d8 <Sw_framecountscreen>
}
     ffa:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     ffe:	|  |      rts
    Sw_framecount = 0;
    1000:	|  \----> clr.l 6548c <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
    1006:	|         move.l 851ee <Sw_FontBuffer>,d3
      *target++ = pattern;
    100c:	|         pea fa0 <Sw_Run+0x2da>
    1010:	|         clr.l -(sp)
    1012:	|         move.l d3,-(sp)
    1014:	|         jsr 59e0 <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
    1018:	|         movea.l 851d4 <Sw_textoffset>,a3
    101e:	|         adda.l #413578,a3
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
    1034:	|         lea 432e8 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
    103a:	|         move.w #3204,d4
    WaitBlit();
    103e:	|     /-> movea.l 852f8 <GfxBase>,a6
    1044:	|     |   jsr -228(a6)
    custom->bltamod = 0;
    1048:	|     |   move.w #0,dff064 <_end+0xd79d60>
    custom->bltbmod = 72;
    1050:	|     |   move.w #72,dff062 <_end+0xd79d5e>
    custom->bltdmod = 72;
    1058:	|     |   move.w #72,dff066 <_end+0xd79d62>
    custom->bltafwm = 0xffff;
    1060:	|     |   move.w #-1,dff044 <_end+0xd79d40>
    custom->bltalwm = 0xffff;
    1068:	|     |   move.w #-1,dff046 <_end+0xd79d42>
    custom->bltcon1 = 0;  
    1070:	|     |   move.w #0,dff042 <_end+0xd79d3e>
    custom->bltcon0 = 0xdfc + (restx << 12);
    1078:	|     |   move.w d2,d0
    107a:	|     |   moveq #12,d1
    107c:	|     |   lsl.w d1,d0
    107e:	|     |   addi.w #3580,d0
    1082:	|     |   move.w d0,dff040 <_end+0xd79d3c>
    custom->bltapt = font+4*50*index;
    1088:	|     |   move.l a2,d0
    108a:	|     |   add.l a2,d0
    108c:	|     |   add.l a2,d0
    108e:	|     |   lsl.l #3,d0
    1090:	|     |   add.l a2,d0
    1092:	|     |   lsl.l #4,d0
    1094:	|     |   addi.l #434670,d0
    109a:	|     |   move.l d0,dff050 <_end+0xd79d4c>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    10a0:	|     |   move.l d2,d0
    10a2:	|     |   asr.l #4,d0
    10a4:	|     |   add.l d0,d0
    10a6:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
    10a8:	|     |   move.l d0,dff04c <_end+0xd79d48>
    custom->bltdpt = targetlocation;
    10ae:	|     |   move.l d0,dff054 <_end+0xd79d50>
    custom->bltsize = 4+64*50;
    10b4:	|     |   move.w d4,dff058 <_end+0xd79d54>
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
    10e8:	|         add.l 851d4 <Sw_textoffset>,d0
    10ee:	|         move.l d0,851d4 <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    10f4:	|         cmpi.l #1279,d0
    10fa:	|     /-- ble.s 110a <Sw_Run+0x444>
      Sw_textoffset = 0;
    10fc:	|     |   clr.l 851d4 <Sw_textoffset>
      SwScrollerFinished = 1;
    1102:	|     |   move.w #1,852f2 <SwScrollerFinished>
  Sw_framecount++;
    110a:	|     \-> move.l 6548c <Sw_framecount>,d0
    1110:	|         addq.l #1,d0
    1112:	|         move.l d0,6548c <Sw_framecount>
  while ( Sw_BlitFrame == 0)
    1118:	\-------- bra.w ce0 <Sw_Run+0x1a>

0000111c <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
    111c:	    movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1120:	    movea.l 85300 <SysBase>,a6
    1126:	    move.l #1360,d0
    112c:	    moveq #2,d1
    112e:	    jsr -198(a6)
    1132:	    movea.l d0,a2
  if( retval == 0) {
    1134:	    tst.l d0
    1136:	/-- beq.w 129c <Sw_ClBuild+0x180>
    *cl++ = *clpartinstruction++;
    113a:	|   move.l 64f4a <Sw_ClsSprites>,(a2)
    1140:	|   move.l 64f4e <Sw_ClsSprites+0x4>,4(a2)
    1148:	|   move.l 64f52 <Sw_ClsSprites+0x8>,8(a2)
    1150:	|   move.l 64f56 <Sw_ClsSprites+0xc>,12(a2)
    1158:	|   move.l 64f5a <Sw_ClsSprites+0x10>,16(a2)
    1160:	|   move.l 64f5e <Sw_ClsSprites+0x14>,20(a2)
    1168:	|   move.l 64f62 <Sw_ClsSprites+0x18>,24(a2)
    1170:	|   move.l 64f66 <Sw_ClsSprites+0x1c>,28(a2)
    1178:	|   move.l 64f6a <Sw_ClsSprites+0x20>,32(a2)
    1180:	|   move.l 64f6e <Sw_ClsSprites+0x24>,36(a2)
    1188:	|   move.l 64f72 <Sw_ClsSprites+0x28>,40(a2)
    1190:	|   move.l 64f76 <Sw_ClsSprites+0x2c>,44(a2)
    1198:	|   move.l 64f7a <Sw_ClsSprites+0x30>,48(a2)
    11a0:	|   move.l 64f7e <Sw_ClsSprites+0x34>,52(a2)
    11a8:	|   move.l 64f82 <Sw_ClsSprites+0x38>,56(a2)
    11b0:	|   move.l 64f86 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    11b8:	|   move.l 64f1a <Sw_ClScreen>,64(a2)
    11c0:	|   move.l 64f1e <Sw_ClScreen+0x4>,68(a2)
    11c8:	|   move.l 64f22 <Sw_ClScreen+0x8>,72(a2)
    11d0:	|   move.l 64f26 <Sw_ClScreen+0xc>,76(a2)
    11d8:	|   move.l 64f2a <Sw_ClScreen+0x10>,80(a2)
    11e0:	|   move.l 64f2e <Sw_ClScreen+0x14>,84(a2)
    11e8:	|   move.l 64f32 <Sw_ClScreen+0x18>,88(a2)
    11f0:	|   move.l 64f36 <Sw_ClScreen+0x1c>,92(a2)
    11f8:	|   move.l 64f3a <Sw_ClScreen+0x20>,96(a2)
    1200:	|   move.l 64f3e <Sw_ClScreen+0x24>,100(a2)
    1208:	|   move.l 64f42 <Sw_ClScreen+0x28>,104(a2)
    1210:	|   move.l 64f46 <Sw_ClScreen+0x2c>,108(a2)
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
    1248:	|   move.l 64eda <Sw_ClColor>,136(a2)
    1250:	|   move.l 64ede <Sw_ClColor+0x4>,140(a2)
    1258:	|   move.l 64ee2 <Sw_ClColor+0x8>,144(a2)
    1260:	|   move.l 64ee6 <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    1268:	|   pea 1bc <main+0x156>
    126c:	|   pea 84c6 <incbin_Sw_ClColorDim_start>
    1272:	|   pea 152(a2)
    1276:	|   jsr 5a02 <memcpy>(pc)
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
    129c:	\-> movea.l 852f4 <DOSBase>,a6
    12a2:	    jsr -60(a6)
    12a6:	    movea.l 852f4 <DOSBase>,a6
    12ac:	    move.l d0,d1
    12ae:	    move.l #250023,d2
    12b4:	    moveq #40,d3
    12b6:	    jsr -48(a6)
    Exit(1);
    12ba:	    movea.l 852f4 <DOSBase>,a6
    12c0:	    moveq #1,d1
    12c2:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    12c6:	    move.l 64f4a <Sw_ClsSprites>,(a2)
    12cc:	    move.l 64f4e <Sw_ClsSprites+0x4>,4(a2)
    12d4:	    move.l 64f52 <Sw_ClsSprites+0x8>,8(a2)
    12dc:	    move.l 64f56 <Sw_ClsSprites+0xc>,12(a2)
    12e4:	    move.l 64f5a <Sw_ClsSprites+0x10>,16(a2)
    12ec:	    move.l 64f5e <Sw_ClsSprites+0x14>,20(a2)
    12f4:	    move.l 64f62 <Sw_ClsSprites+0x18>,24(a2)
    12fc:	    move.l 64f66 <Sw_ClsSprites+0x1c>,28(a2)
    1304:	    move.l 64f6a <Sw_ClsSprites+0x20>,32(a2)
    130c:	    move.l 64f6e <Sw_ClsSprites+0x24>,36(a2)
    1314:	    move.l 64f72 <Sw_ClsSprites+0x28>,40(a2)
    131c:	    move.l 64f76 <Sw_ClsSprites+0x2c>,44(a2)
    1324:	    move.l 64f7a <Sw_ClsSprites+0x30>,48(a2)
    132c:	    move.l 64f7e <Sw_ClsSprites+0x34>,52(a2)
    1334:	    move.l 64f82 <Sw_ClsSprites+0x38>,56(a2)
    133c:	    move.l 64f86 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1344:	    move.l 64f1a <Sw_ClScreen>,64(a2)
    134c:	    move.l 64f1e <Sw_ClScreen+0x4>,68(a2)
    1354:	    move.l 64f22 <Sw_ClScreen+0x8>,72(a2)
    135c:	    move.l 64f26 <Sw_ClScreen+0xc>,76(a2)
    1364:	    move.l 64f2a <Sw_ClScreen+0x10>,80(a2)
    136c:	    move.l 64f2e <Sw_ClScreen+0x14>,84(a2)
    1374:	    move.l 64f32 <Sw_ClScreen+0x18>,88(a2)
    137c:	    move.l 64f36 <Sw_ClScreen+0x1c>,92(a2)
    1384:	    move.l 64f3a <Sw_ClScreen+0x20>,96(a2)
    138c:	    move.l 64f3e <Sw_ClScreen+0x24>,100(a2)
    1394:	    move.l 64f42 <Sw_ClScreen+0x28>,104(a2)
    139c:	    move.l 64f46 <Sw_ClScreen+0x2c>,108(a2)
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
    13d4:	    move.l 64eda <Sw_ClColor>,136(a2)
    13dc:	    move.l 64ede <Sw_ClColor+0x4>,140(a2)
    13e4:	    move.l 64ee2 <Sw_ClColor+0x8>,144(a2)
    13ec:	    move.l 64ee6 <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    13f4:	    pea 1bc <main+0x156>
    13f8:	    pea 84c6 <incbin_Sw_ClColorDim_start>
    13fe:	    pea 152(a2)
    1402:	    jsr 5a02 <memcpy>(pc)
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
    142a:	move.w 851d0 <Sw_ScreenBufferOffset>,d0
    1430:	lea 85194 <Sw_ScreenBufferList>,a0
    1436:	move.l d0,d1
    1438:	add.l d0,d1
    143a:	add.l d1,d1
    143c:	move.l (0,a0,d1.l),851e0 <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1444:	addq.l #1,d0
    1446:	add.l d0,d0
    1448:	add.l d0,d0
    144a:	move.l (0,a0,d0.l),d0
    144e:	move.l d0,851dc <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    1454:	moveq #80,d1
    1456:	add.l d0,d1
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    1458:	movea.l 85190 <Sw_DrawCopper>,a0
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
    1478:	          movea.l 85190 <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    147e:	          move.w 64ed8 <FrameCountBufferDraw>,d0
    1484:	          lea 64eda <Sw_ClColor>,a1
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
    14f0:	          cmpi.w #12,8518e <ColPos>
    14f8:	   /----- beq.s 152e <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    14fa:	/--|----> move.w 8518c <Sw_ClColorDimPos>,d0
    1500:	|  |      moveq #0,d1
    1502:	|  |      move.w d0,d1
    1504:	|  |      addi.l #33990,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    150a:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    150e:	|  |      cmpi.w #22643,d0
    1512:	|  |  /-- bls.s 1516 <Sw_SetColors+0x9e>
    1514:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
    1516:	|  |  \-> move.w d0,8518c <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    151c:	|  |      pea 1bc <main+0x156>
    1520:	|  |      move.l d1,-(sp)
    1522:	|  |      move.l a0,-(sp)
    1524:	|  |      jsr 5a20 <memmove>(pc)

  }
}
    1528:	|  |      lea 12(sp),sp
    152c:	|  |      rts
    ColPos = 0;
    152e:	|  \----> clr.w 8518e <ColPos>
    1534:	\-------- bra.s 14fa <Sw_SetColors+0x82>

00001536 <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    1536:	    movea.l 852fc <custom>,a0
    153c:	    move.w #32,156(a0)
  if( Sw_InitComplete == 1) {
    1542:	    cmpi.w #1,851d2 <Sw_InitComplete>
    154a:	/-- beq.s 154e <Sw_VblankHandler+0x18>
}
    154c:	|   rts
    if( FrameCountBufferDraw == 2) {
    154e:	\-> move.w 64ed8 <FrameCountBufferDraw>,d0
    1554:	    cmpi.w #2,d0
    1558:	/-- beq.s 1570 <Sw_VblankHandler+0x3a>
      FrameCountBufferDraw++;
    155a:	|   move.w 64ed8 <FrameCountBufferDraw>,d0
    1560:	|   addq.w #1,d0
    1562:	|   move.w d0,64ed8 <FrameCountBufferDraw>
    Sw_SetBplPointers();
    1568:	|   jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    156c:	|   bra.w 1478 <Sw_SetColors>
      FrameCountBufferDraw = 0;
    1570:	\-> move.w #0,64ed8 <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    1578:	    move.w #1,851e4 <Sw_BlitFrame>
      if(Sw_ScreenBufferOffset == 0) { 
    1580:	    tst.w 851d0 <Sw_ScreenBufferOffset>
    1586:	/-- bne.s 1598 <Sw_VblankHandler+0x62>
        Sw_ScreenBufferOffset = 2; 
    1588:	|   move.w #2,851d0 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1590:	|   jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1594:	|   bra.w 1478 <Sw_SetColors>
        Sw_ScreenBufferOffset = 0; 
    1598:	\-> clr.w 851d0 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    159e:	    jsr 1428 <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    15a2:	    bra.w 1478 <Sw_SetColors>

000015a6 <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    15a6:	rts

000015a8 <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    15a8:	movea.l 852fc <custom>,a0
    15ae:	move.w #32,156(a0)
  p61Music();
    15b4:	bra.w c4c <p61Music>

000015b8 <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    15b8:	                                                             lea -20(sp),sp
    15bc:	                                                             movem.l d2-d5/a2,-(sp)
    15c0:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    15c4:	                                                             movea.l 852d2 <DrawCopper>,a1
    15ca:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    15ce:	                                                             movea.l 85180 <DrawBuffer>,a0
    15d4:	                                                             move.w 52(a0),d0
    15d8:	                                                /----------- bmi.w 1778 <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    15dc:	                                                |            move.w 54(a0),d2
    15e0:	                                                |     /----- bmi.w 1734 <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    15e4:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    15e6:	                                                |     |      move.w d2,d4
    15e8:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    15ea:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    15ee:	                                                |     |      cmp.w d1,d0
    15f0:	                                          /-----|-----|----- bhi.w 1820 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    15f4:	                                          |     |     |      move.w #70,30(sp)
    15fa:	                                          |     |     |      move.w d2,32(sp)
    15fe:	                                          |     |     |      move.w #109,34(sp)
    1604:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    160a:	                                          |     |     |      clr.w 20(sp)
    160e:	                                          |     |     |      move.w #1,22(sp)
    1614:	                                          |     |     |      move.w #2,24(sp)
    161a:	                                          |     |     |      move.w #3,26(sp)
    1620:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    1626:	                                          |     |     |      cmpi.w #69,d2
    162a:	                                       /--|-----|-----|----- bhi.w 17b6 <SetCl+0x1fe>
              values[j] = values[j + 1];
    162e:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1632:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    1638:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    163e:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1642:	                                       |  |  |  |     |      moveq #70,d0
    1644:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    1648:	|                                      |  |  |  |     |  /-- bcc.s 165a <SetCl+0xa2>
              int temp2 = ids[j];
    164a:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    1650:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    1654:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    165a:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    165e:	|                                      |  |  |  |     |      cmp.w a0,d0
    1660:	|                                      |  |  |  |     |  /-- bcc.s 167e <SetCl+0xc6>
              int temp2 = ids[j];
    1662:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    1666:	|                                      |  |  |  |     |  |   move.w d0,d2
    1668:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    166c:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1672:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    1676:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    167a:	|                                      |  |  |  |     |  |   move.w a0,d0
    167c:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    167e:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1682:	|                                      |  |  |  |     |      cmp.w d0,d2
    1684:	|                                      |  |  |  |     |  /-- bcc.s 169e <SetCl+0xe6>
              int temp2 = ids[j];
    1686:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    168a:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    168e:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    1694:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    1698:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    169c:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    169e:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    16a2:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    16a6:	|                                      |  |  |  |     |  /-- bcc.s 16ba <SetCl+0x102>
              int temp2 = ids[j];
    16a8:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    16ac:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    16b0:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    16b6:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    16ba:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    16bc:	|                                      |  |  |  |     |  /-- bcc.s 16d4 <SetCl+0x11c>
              int temp2 = ids[j];
    16be:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    16c2:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    16c6:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    16cc:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    16d0:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    16d4:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    16d8:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    16dc:	|                                      |  |  |  |     |  /-- bcc.s 1700 <SetCl+0x148>
              int temp2 = ids[j];
    16de:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    16e2:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    16e8:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    16ec:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    16f0:	|                                      |  |  |  |     |  +-- bcc.s 1700 <SetCl+0x148>
              int temp2 = ids[j];
    16f2:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    16f6:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    16fc:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    1700:	|                                      |  |  |  |     |  \-> move.w d1,d0
    1702:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    1704:	|                                      |  |  |  |     |      addi.w #11521,d0
    1708:	|                                      |  |  |  |     |      cmpi.w #210,d1
    170c:	|                                      |  |  |  |     |  /-- bhi.w 17fc <SetCl+0x244>
    switch( ids[i]) 
    1710:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    1716:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 2008 <SetCl+0xa50>
    171a:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    171c:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    1720:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    1722:	|  |                                   |  |  |  |     |  |   move.w (172a <SetCl+0x172>,pc,d1.l),d1
    1726:	|  |                                   |  |  |  |     |  |   jmp (172a <SetCl+0x172>,pc,d1.w)
    172a:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    172e:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1734:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    1736:	|  |                                   |  |  |  |  /-----|-- bhi.w 1860 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    173a:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1740:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1746:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    174c:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1752:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    1758:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    175c:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    175e:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1762:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    1768:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    176e:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1772:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    1774:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 1644 <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1778:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    177e:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    1784:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    178a:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1790:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    1794:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    179a:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    17a0:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    17a6:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    17ac:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    17b0:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    17b4:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    17b6:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    17ba:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    17be:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 1644 <SetCl+0x8c>
              int temp2 = ids[j];
    17c2:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    17c6:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    17cc:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    17d2:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    17d6:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    17da:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    17de:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 1ff0 <SetCl+0xa38>
              values[j] = values[j + 1];
    17e2:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    17e8:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    17ee:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    17f2:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    17f6:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    17f8:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 1644 <SetCl+0x8c>
    switch( ids[i]) 
    17fc:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    1802:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 1ff6 <SetCl+0xa3e>
    1806:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    1808:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    180c:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    180e:	|  |  |  |                             |  |  |     |  |      move.w (1816 <SetCl+0x25e>,pc,d1.l),d1
    1812:	|  |  |  |                             |  |  |     |  |      jmp (1816 <SetCl+0x25e>,pc,d1.w)
    1816:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    1818:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    181e:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1822:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    1828:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    182c:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1832:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1838:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    183c:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1842:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    1848:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    184e:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    1854:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    1858:	|  |  |  |                             |     \-----|--|----- bls.w 162e <SetCl+0x76>
    185c:	|  |  |  |                             \-----------|--|----- bra.w 17b6 <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1860:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1862:	|  |  |  |                                            |      move.w #109,34(sp)
    1868:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    186e:	|  |  |  |                                            |      move.w #2,24(sp)
    1874:	|  |  |  |                                            |      move.w #3,26(sp)
    187a:	|  |  |  |                                            |      move.w #4,28(sp)
    1880:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    1884:	|  |  |  |                                            |      clr.w d3
    1886:	|  |  |  |                                            \----- bra.w 175e <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    188a:	|  |  |  |                                                   cmpi.w #211,d3
    188e:	|  |  |  |                                               /-- bls.s 18a0 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    1890:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1896:	|  |  |  |                                               |   lea 172(a1),a2
    189a:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    18a0:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    18a2:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    18a8:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    18ae:	|  |  |  |                                                   lea 8(a2),a0
    18b2:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    18b8:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    18be:	|  |  |  |  /--|-------------------------------------------- bhi.w 200e <SetCl+0xa56>
    18c2:	|  |  |  |  |  |                                             moveq #0,d1
    18c4:	|  |  |  |  |  |                                             move.w 22(sp),d1
    18c8:	|  |  |  |  |  |                                             add.l d1,d1
    18ca:	|  |  |  |  |  |                                             move.w (18d2 <SetCl+0x31a>,pc,d1.l),d1
    18ce:	|  |  |  |  |  |                                             jmp (18d2 <SetCl+0x31a>,pc,d1.w)
    18d2:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    18d6:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    18e0:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    18e8:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    18ee:	|  |  |  |  |  |                                             lea 176(a1),a0
    18f2:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    18f8:	|  |  |  |  |  +-------------------------------------------- bra.s 18b8 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    18fa:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1900:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1906:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    190c:	|  |  |  |  |  |                                             lea 176(a1),a0
    1910:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    1916:	|  |  |  |  |  +-------------------------------------------- bra.s 18b8 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1918:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    191e:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1924:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    192a:	|  |  |  |  |  |                                             lea 176(a1),a0
    192e:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    1934:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    193a:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 201a <SetCl+0xa62>
    193e:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1940:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    1944:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    1946:	|  |  |  |  |  |  |  |                                       move.w (194e <SetCl+0x396>,pc,d1.l),d1
    194a:	|  |  |  |  |  |  |  |                                       jmp (194e <SetCl+0x396>,pc,d1.w)
    194e:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1950:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    1954:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    1956:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1958:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    195e:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1964:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    196a:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    196e:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    1974:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1934 <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    1976:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    197a:	|  |  |  |  |  |  |  |                                   /-- bls.s 198c <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    197c:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1982:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    1986:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    198c:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    198e:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1994:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    199a:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    199e:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    19a4:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1934 <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    19a6:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    19ac:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19b2:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    19b8:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19bc:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    19c2:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1934 <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    19c6:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    19cc:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19d2:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    19d8:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19dc:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    19e2:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 18b8 <SetCl+0x300>
        *tmp++ = line + 0x001;
    19e6:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    19ea:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    19f0:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    19f6:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19fa:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    1a00:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1934 <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1a04:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1a08:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a0e:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1a14:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    1a18:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    1a1e:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    1a24:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 2002 <SetCl+0xa4a>
    1a28:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    1a2a:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    1a2e:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1a30:	|  |  |  |  |  |  |  |  |  |                                 move.w (1a38 <SetCl+0x480>,pc,d1.l),d1
    1a34:	|  |  |  |  |  |  |  |  |  |                                 jmp (1a38 <SetCl+0x480>,pc,d1.w)
    1a38:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1a3a:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1a3c:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1a44:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    1a46:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a4c:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1a52:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a56:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1a5c:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a1e <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1a5e:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1a62:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1a70 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    1a64:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1a68:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1a6e:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1a70:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1a72:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1a78:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1a7e:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a82:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    1a88:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a1e <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1a8a:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1a8e:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a94:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1a9a:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a9e:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    1aa4:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 1a1e <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1aa8:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1aac:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ab2:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1ab8:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1abc:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    1ac2:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    1ac8:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 2014 <SetCl+0xa5c>
    1acc:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    1ace:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    1ad2:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    1ad4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (1adc <SetCl+0x524>,pc,d1.l),d1
    1ad8:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (1adc <SetCl+0x524>,pc,d1.w)
    1adc:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    1ade:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    1ae0:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    1ae2:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    1ae4:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ae6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1aea:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1af0:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1af6:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1afa:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    1b00:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1ac2 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    1b02:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    1b06:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 1b14 <SetCl+0x55c>
          *tmp++ = 0xffdf;
    1b08:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1b0c:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    1b12:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1b14:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1b16:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b1c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1b22:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b26:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1b2c:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1ac2 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1b2e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1b32:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1b38:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1b3e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b42:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    1b48:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1ac2 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1b4c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1b4e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b54:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1b5a:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b5e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    1b64:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1ac2 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1b68:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1b6c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b72:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1b78:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1b7c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1b82:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    1b88:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 2036 <SetCl+0xa7e>
    1b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1b9c <SetCl+0x5e4>,pc,d1.l),d1
    1b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1b9c <SetCl+0x5e4>,pc,d1.w)
    1b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b82 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    1bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b82 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    1bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    1bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b82 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    1bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 1c0a <SetCl+0x652>
          *tmp++ = 0xffdf;
    1bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1b82 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 2020 <SetCl+0xa68>
    1c4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1c5a <SetCl+0x6a2>,pc,d1.l),d1
    1c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1c5a <SetCl+0x6a2>,pc,d1.w)
    1c5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1c5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    1c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c40 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    1c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1c92 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    1c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    1caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c40 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c40 <SetCl+0x688>
        *tmp++ = line + 0x001;
    1cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    1ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c40 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1d14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    1d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    1d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1d54 <SetCl+0x79c>
          *tmp++ = 0xffdf;
    1d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    1d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    1d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    1d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1dc0 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    1dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    1e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 1ffc <SetCl+0xa44>
    1e10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1e20 <SetCl+0x868>,pc,d1.l),d1
    1e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1e20 <SetCl+0x868>,pc,d1.w)
    1e20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1e24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    1e2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    1e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1e06 <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    1e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    1e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 1e58 <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    1e4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    1e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1e58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1e60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    1e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    1e70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1e06 <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1e76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    1e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1e06 <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1e90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    1eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 2020 <SetCl+0xa68>
    1eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    1eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    1ebc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1ec4 <SetCl+0x90c>,pc,d1.l),d1
    1ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1ec4 <SetCl+0x90c>,pc,d1.w)
    1ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    1eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    1ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1eaa <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    1eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    1eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 1efc <SetCl+0x944>
          *tmp++ = 0xffdf;
    1ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1efc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    1f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1eaa <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1f16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    1f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1eaa <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f46 <SetCl+0x98e>
          *tmp++ = 0xffdf;
    1f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1eaa <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f74 <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    1f68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    1f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1f76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    1f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    1f86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    1f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1e06 <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fa2 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1f96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1fa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1fa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1faa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1fb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1fba:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 1a1e <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1fbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1fc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fd4 <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1fc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1fca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    1fce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1fd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1fdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1fe2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1fe6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    1fec:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 18b8 <SetCl+0x300>
    1ff0:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    1ff2:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1644 <SetCl+0x8c>
    switch( ids[i]) 
    1ff6:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    1ff8:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 18b8 <SetCl+0x300>
    1ffc:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    1ffe:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 1eaa <SetCl+0x8f2>
    2002:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    2004:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1e06 <SetCl+0x84e>
    2008:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    200a:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 1934 <SetCl+0x37c>
    200e:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    2010:	                  |     \-----|--|--|--|--|--|-------------- bra.w 1a1e <SetCl+0x466>
    2014:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    2016:	                  |           |     |  \--|--|-------------- bra.w 1b82 <SetCl+0x5ca>
    201a:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    201c:	                              \-----|-----|--|-------------- bra.w 1ac2 <SetCl+0x50a>
    2020:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    2022:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    2026:	                                    |     |                  move.w #-2,2(a0)
}
    202c:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    2030:	                                    |     |                  lea 20(sp),sp
    2034:	                                    |     |                  rts
    switch( ids[i]) 
    2036:	                                    \-----|----------------> movea.l a0,a1
    2038:	                                          \----------------- bra.w 1c40 <SetCl+0x688>

0000203c <LoadVectors>:
{
    203c:	       move.l a3,-(sp)
    203e:	       move.l a2,-(sp)
    2040:	       movea.l 12(sp),a2
    2044:	       movea.l 16(sp),a1
    2048:	       movea.l 20(sp),a3
  while( *source != 127) {
    204c:	       move.w (a2),d0
    204e:	       movea.l a3,a0
    2050:	       cmpi.w #127,d0
    2054:	/----- beq.s 20aa <LoadVectors+0x6e>
    *target++ = *source++;
    2056:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    2058:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    205e:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    2064:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    206a:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    2070:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    2076:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    207c:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    2082:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    2088:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    208e:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    2094:	|  |   lea 24(a2),a2
    2098:	|  |   lea 24(a0),a0
    209c:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    20a2:	|  |   move.w (a2),d0
    20a4:	|  |   cmpi.w #127,d0
    20a8:	|  \-- bne.s 2056 <LoadVectors+0x1a>
  while( *source2 != 127) {  
    20aa:	\----> move.b (a1),d0
    20ac:	       cmpi.b #127,d0
    20b0:	/----- beq.w 216a <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    20b4:	|  /-> ext.w d0
    20b6:	|  |   add.w (a3),d0
    20b8:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    20ba:	|  |   move.b 1(a1),d0
    20be:	|  |   ext.w d0
    20c0:	|  |   add.w 2(a3),d0
    20c4:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    20c8:	|  |   move.b 2(a1),d0
    20cc:	|  |   ext.w d0
    20ce:	|  |   add.w 4(a3),d0
    20d2:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    20d6:	|  |   move.b 3(a1),d0
    20da:	|  |   ext.w d0
    20dc:	|  |   add.w 6(a3),d0
    20e0:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    20e4:	|  |   move.b 4(a1),d0
    20e8:	|  |   ext.w d0
    20ea:	|  |   add.w 8(a3),d0
    20ee:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    20f2:	|  |   move.b 5(a1),d0
    20f6:	|  |   ext.w d0
    20f8:	|  |   add.w 10(a3),d0
    20fc:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    2100:	|  |   move.b 6(a1),d0
    2104:	|  |   ext.w d0
    2106:	|  |   add.w 12(a3),d0
    210a:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    210e:	|  |   move.b 7(a1),d0
    2112:	|  |   ext.w d0
    2114:	|  |   add.w 14(a3),d0
    2118:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    211c:	|  |   move.b 8(a1),d0
    2120:	|  |   ext.w d0
    2122:	|  |   add.w 16(a3),d0
    2126:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    212a:	|  |   move.b 9(a1),d0
    212e:	|  |   ext.w d0
    2130:	|  |   add.w 18(a3),d0
    2134:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    2138:	|  |   move.b 10(a1),d0
    213c:	|  |   ext.w d0
    213e:	|  |   add.w 20(a3),d0
    2142:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    2146:	|  |   lea 24(a3),a3
    214a:	|  |   lea 12(a1),a1
    214e:	|  |   lea 24(a0),a0
    2152:	|  |   move.b -1(a1),d0
    2156:	|  |   ext.w d0
    2158:	|  |   add.w -2(a3),d0
    215c:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    2160:	|  |   move.b (a1),d0
    2162:	|  |   cmpi.b #127,d0
    2166:	|  \-- bne.w 20b4 <LoadVectors+0x78>
}
    216a:	\----> movea.l (sp)+,a2
    216c:	       movea.l (sp)+,a3
    216e:	       rts

00002170 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    2170:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2174:	    movea.l 85300 <SysBase>,a6
    217a:	    move.l #1360,d0
    2180:	    moveq #2,d1
    2182:	    jsr -198(a6)
    2186:	    movea.l d0,a2
  
  if( retval == 0) {
    2188:	    tst.l d0
    218a:	/-- beq.w 231a <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    218e:	|   move.l 44114 <ClsSprites>,(a2)
    2194:	|   move.l 44118 <ClsSprites+0x4>,4(a2)
    219c:	|   move.l 4411c <ClsSprites+0x8>,8(a2)
    21a4:	|   move.l 44120 <ClsSprites+0xc>,12(a2)
    21ac:	|   move.l 44124 <ClsSprites+0x10>,16(a2)
    21b4:	|   move.l 44128 <ClsSprites+0x14>,20(a2)
    21bc:	|   move.l 4412c <ClsSprites+0x18>,24(a2)
    21c4:	|   move.l 44130 <ClsSprites+0x1c>,28(a2)
    21cc:	|   move.l 44134 <ClsSprites+0x20>,32(a2)
    21d4:	|   move.l 44138 <ClsSprites+0x24>,36(a2)
    21dc:	|   move.l 4413c <ClsSprites+0x28>,40(a2)
    21e4:	|   move.l 44140 <ClsSprites+0x2c>,44(a2)
    21ec:	|   move.l 44144 <ClsSprites+0x30>,48(a2)
    21f4:	|   move.l 44148 <ClsSprites+0x34>,52(a2)
    21fc:	|   move.l 4414c <ClsSprites+0x38>,56(a2)
    2204:	|   move.l 44150 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    220c:	|   move.l 440e4 <ClScreen>,64(a2)
    2214:	|   move.l 440e8 <ClScreen+0x4>,68(a2)
    221c:	|   move.l 440ec <ClScreen+0x8>,72(a2)
    2224:	|   move.l 440f0 <ClScreen+0xc>,76(a2)
    222c:	|   move.l 440f4 <ClScreen+0x10>,80(a2)
    2234:	|   move.l 440f8 <ClScreen+0x14>,84(a2)
    223c:	|   move.l 440fc <ClScreen+0x18>,88(a2)
    2244:	|   move.l 44100 <ClScreen+0x1c>,92(a2)
    224c:	|   move.l 44104 <ClScreen+0x20>,96(a2)
    2254:	|   move.l 44108 <ClScreen+0x24>,100(a2)
    225c:	|   move.l 4410c <ClScreen+0x28>,104(a2)
    2264:	|   move.l 44110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    226c:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    2274:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    227c:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    2284:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    228c:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    2294:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    229c:	|   move.l 440c4 <ClColor>,136(a2)
    22a4:	|   move.l 440c8 <ClColor+0x4>,140(a2)
    22ac:	|   move.l 440cc <ClColor+0x8>,144(a2)
    22b4:	|   move.l 440d0 <ClColor+0xc>,148(a2)
    22bc:	|   move.l 440d4 <ClColor+0x10>,152(a2)
    22c4:	|   move.l 440d8 <ClColor+0x14>,156(a2)
    22cc:	|   move.l 440dc <ClColor+0x18>,160(a2)
    22d4:	|   move.l 440e0 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    22dc:	|   move.l 44074 <ClToggleBitPlanes>,168(a2)
    22e4:	|   move.l 44078 <ClToggleBitPlanes+0x4>,172(a2)
    22ec:	|   move.l 4407c <ClToggleBitPlanes+0x8>,176(a2)
    22f4:	|   move.l 44080 <ClToggleBitPlanes+0xc>,180(a2)
    22fc:	|   move.l 44084 <ClToggleBitPlanes+0x10>,184(a2)
    2304:	|   move.l 44088 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    230c:	|   moveq #-2,d0
    230e:	|   move.l d0,192(a2)
  return retval;  
}
    2312:	|   move.l a2,d0
    2314:	|   movem.l (sp)+,d2-d3/a2/a6
    2318:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    231a:	\-> movea.l 852f4 <DOSBase>,a6
    2320:	    jsr -60(a6)
    2324:	    movea.l 852f4 <DOSBase>,a6
    232a:	    move.l d0,d1
    232c:	    move.l #250023,d2
    2332:	    moveq #40,d3
    2334:	    jsr -48(a6)
    Exit(1);
    2338:	    movea.l 852f4 <DOSBase>,a6
    233e:	    moveq #1,d1
    2340:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2344:	    move.l 44114 <ClsSprites>,(a2)
    234a:	    move.l 44118 <ClsSprites+0x4>,4(a2)
    2352:	    move.l 4411c <ClsSprites+0x8>,8(a2)
    235a:	    move.l 44120 <ClsSprites+0xc>,12(a2)
    2362:	    move.l 44124 <ClsSprites+0x10>,16(a2)
    236a:	    move.l 44128 <ClsSprites+0x14>,20(a2)
    2372:	    move.l 4412c <ClsSprites+0x18>,24(a2)
    237a:	    move.l 44130 <ClsSprites+0x1c>,28(a2)
    2382:	    move.l 44134 <ClsSprites+0x20>,32(a2)
    238a:	    move.l 44138 <ClsSprites+0x24>,36(a2)
    2392:	    move.l 4413c <ClsSprites+0x28>,40(a2)
    239a:	    move.l 44140 <ClsSprites+0x2c>,44(a2)
    23a2:	    move.l 44144 <ClsSprites+0x30>,48(a2)
    23aa:	    move.l 44148 <ClsSprites+0x34>,52(a2)
    23b2:	    move.l 4414c <ClsSprites+0x38>,56(a2)
    23ba:	    move.l 44150 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    23c2:	    move.l 440e4 <ClScreen>,64(a2)
    23ca:	    move.l 440e8 <ClScreen+0x4>,68(a2)
    23d2:	    move.l 440ec <ClScreen+0x8>,72(a2)
    23da:	    move.l 440f0 <ClScreen+0xc>,76(a2)
    23e2:	    move.l 440f4 <ClScreen+0x10>,80(a2)
    23ea:	    move.l 440f8 <ClScreen+0x14>,84(a2)
    23f2:	    move.l 440fc <ClScreen+0x18>,88(a2)
    23fa:	    move.l 44100 <ClScreen+0x1c>,92(a2)
    2402:	    move.l 44104 <ClScreen+0x20>,96(a2)
    240a:	    move.l 44108 <ClScreen+0x24>,100(a2)
    2412:	    move.l 4410c <ClScreen+0x28>,104(a2)
    241a:	    move.l 44110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2422:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    242a:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2432:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    243a:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2442:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    244a:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    2452:	    move.l 440c4 <ClColor>,136(a2)
    245a:	    move.l 440c8 <ClColor+0x4>,140(a2)
    2462:	    move.l 440cc <ClColor+0x8>,144(a2)
    246a:	    move.l 440d0 <ClColor+0xc>,148(a2)
    2472:	    move.l 440d4 <ClColor+0x10>,152(a2)
    247a:	    move.l 440d8 <ClColor+0x14>,156(a2)
    2482:	    move.l 440dc <ClColor+0x18>,160(a2)
    248a:	    move.l 440e0 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    2492:	    move.l 44074 <ClToggleBitPlanes>,168(a2)
    249a:	    move.l 44078 <ClToggleBitPlanes+0x4>,172(a2)
    24a2:	    move.l 4407c <ClToggleBitPlanes+0x8>,176(a2)
    24aa:	    move.l 44080 <ClToggleBitPlanes+0xc>,180(a2)
    24b2:	    move.l 44084 <ClToggleBitPlanes+0x10>,184(a2)
    24ba:	    move.l 44088 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    24c2:	    moveq #-2,d0
    24c4:	    move.l d0,192(a2)
}
    24c8:	    move.l a2,d0
    24ca:	    movem.l (sp)+,d2-d3/a2/a6
    24ce:	    rts

000024d0 <SetBplPointers>:

void SetBplPointers() {
    24d0:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    24d2:	    movea.w 84e6c <ScreenBufferOffset>,a0
    24d8:	    moveq #0,d0
    24da:	    move.w a0,d0
    24dc:	    lea 851fe <ScreenBufferList>,a2
    24e2:	    move.l d0,d1
    24e4:	    add.l d0,d1
    24e6:	    add.l d1,d1
    24e8:	    move.l (0,a2,d1.l),85180 <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    24f0:	    move.l d0,d1
    24f2:	    addq.l #1,d1
    24f4:	    add.l d1,d1
    24f6:	    add.l d1,d1
    24f8:	    movea.l (0,a2,d1.l),a1
    24fc:	    move.l a1,85170 <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    2502:	    addq.l #2,d0
    2504:	    add.l d0,d0
    2506:	    add.l d0,d0
    2508:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    250c:	    move.w a0,d0
    250e:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    2510:	    cmpi.w #8,d0
    2514:	/-- bls.s 2518 <SetBplPointers+0x48>
    2516:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    2518:	\-> move.l d1,85174 <ClearBuffer>
  ScreenBufferOffset += 3;
    251e:	    move.w d0,84e6c <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    2524:	    move.w 54(a1),d0
    2528:	    ext.l d0
    252a:	    lsl.l #6,d0
    252c:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    252e:	    movea.l 852d2 <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    2534:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    2538:	    move.l d0,d1
    253a:	    clr.w d1
    253c:	    swap d1
    253e:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2542:	    move.l d0,d1
    2544:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    254a:	    move.w d1,126(a0)
  highword = ptr >> 16;
    254e:	    clr.w d1
    2550:	    swap d1
    2552:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2556:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    255c:	    move.w d0,134(a0)
  highword = ptr >> 16;
    2560:	    clr.w d0
    2562:	    swap d0
    2564:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    2568:	    movea.l (sp)+,a2
    256a:	    rts

0000256c <KPrintF>:
void KPrintF(const char* fmt, ...) {
    256c:	    lea -128(sp),sp
    2570:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    2574:	    move.w f0ff60 <_end+0xe8ac5c>,d0
    257a:	    cmpi.w #20153,d0
    257e:	/-- beq.s 25aa <KPrintF+0x3e>
    2580:	|   cmpi.w #-24562,d0
    2584:	+-- beq.s 25aa <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    2586:	|   movea.l 85300 <SysBase>,a6
    258c:	|   movea.l 144(sp),a0
    2590:	|   lea 148(sp),a1
    2594:	|   lea 5b66 <KPutCharX>,a2
    259a:	|   suba.l a3,a3
    259c:	|   jsr -522(a6)
}
    25a0:	|   movem.l (sp)+,a2-a3/a6
    25a4:	|   lea 128(sp),sp
    25a8:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    25aa:	\-> movea.l 85300 <SysBase>,a6
    25b0:	    movea.l 144(sp),a0
    25b4:	    lea 148(sp),a1
    25b8:	    lea 5b74 <PutChar>,a2
    25be:	    lea 12(sp),a3
    25c2:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    25c6:	    move.l a3,-(sp)
    25c8:	    pea 56 <_start+0x56>
    25cc:	    jsr f0ff60 <_end+0xe8ac5c>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    25d2:	    addq.l #8,sp
}
    25d4:	    movem.l (sp)+,a2-a3/a6
    25d8:	    lea 128(sp),sp
    25dc:	    rts

000025de <DrawRect>:
{  
    25de:	                                                                                                                                                             lea -24(sp),sp
    25e2:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    25e6:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    25ea:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    25ee:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    25f2:	                                                                                                                                                             tst.w d0
    25f4:	                                                                                                               /-------------------------------------------- blt.w 280e <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    25f8:	                                                                                                               |                                             move.w d0,d4
    25fa:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    25fc:	                                                                                                               |                                             cmpi.w #256,d0
    2600:	                                                                                                               |                                         /-- ble.s 260c <DrawRect+0x2e>
}
    2602:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    2606:	                                                                                                               |        |                                |   lea 24(sp),sp
    260a:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    260c:	                                                                                                               |        |                                \-> movea.w d1,a0
    260e:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    2612:	                                                                                                               |        |                                    cmpa.w #256,a0
    2616:	                                                                                                            /--|--------|----------------------------------- ble.w 2836 <DrawRect+0x258>
    height = 256 - square->YPosMin;
    261a:	                                                                                                            |  |        |                                    move.w #256,d5
    261e:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    2620:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    2622:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    2626:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    262a:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 2824 <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    262e:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    2630:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    2634:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    2636:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2602 <DrawRect+0x24>
    2638:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    263c:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2602 <DrawRect+0x24>
    263e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    2642:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 2602 <DrawRect+0x24>
  xlength = xlength/16;
    2644:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    2646:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    2648:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    264a:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    264e:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    2650:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    2652:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    2654:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    2656:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    2658:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    265a:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    265c:	                                                                                                            |  |  |  |  |  |  |                              movea.l 852e2 <PrepareBuffer>,a1
    2662:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2664:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd79cfe>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    266a:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd79cfe>,d0
    2670:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    2674:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 266a <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    2676:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0;
    267e:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd79d3e>
  custom->bltadat = data;
    2686:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd79d70>
  custom->bltdpt = Target;  
    268e:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd79d50>
  custom->bltdmod = mod;
    2694:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd79d62>
  custom->bltsize = lines*64+linelength;
    269a:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    269c:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    269e:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd79d54>
    custom->bltcon1 = 0x0000;      
    26a4:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd79d3e>
    custom->bltcdat = 0x0;
    26ac:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd79d6c>
    BltCon0LineDraw = 0x0500;
    26b4:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,84e6e <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    26bc:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    26be:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    26c2:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    26c6:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    26ca:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    26cc:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    26ce:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    26d2:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 2f2a <DrawRect+0x94c>
  if(height != 0) {
    26d6:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    26d8:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 2f3e <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    26dc:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,84e6e <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    26e4:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    26e8:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    26ec:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    26ee:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    26f0:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    26f4:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2d02 <DrawRect+0x724>
  if(height != 0) {
    26f8:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    26fa:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2d16 <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    26fe:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    2702:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    2706:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    2708:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    270a:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    270e:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 2af2 <DrawRect+0x514>
  if(height != 0) {
    2712:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    2714:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 2b06 <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    2718:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    271a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    271e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    2720:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2722:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    2726:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 28b0 <DrawRect+0x2d2>
  if(height != 0) {
    272a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    272c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 28c4 <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2730:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 852e2 <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2736:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    273a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    273c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    273e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    2744:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 85180 <DrawBuffer>,a0
    274a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    274c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    274e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2750:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2752:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2754:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd79cfe>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    275a:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd79cfe>,d1
    2760:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2762:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    2766:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    276a:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 275a <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    276c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd79d60>
  custom->bltbmod = 64 - length*2;
    2772:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd79d5e>
  custom->bltdmod = 64 - length*2;  
    2778:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd79d62>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    277e:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2782:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 283e <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    2786:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    2788:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 313a <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    278c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    2792:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    2796:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    2798:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    279a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    279c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    27a2:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    27a4:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    27a6:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    27aa:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    27ae:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    27b2:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    27b6:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    27ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 289c <DrawRect+0x2be>
    27be:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    27c0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    27c4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 286e <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    27c8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd79d3c>
    custom->bltapt = (UBYTE *)bltapt;
    27ce:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd79d4c>
    custom->bltbpt = (UBYTE *)bltdpt;
    27d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd79d48>
    custom->bltdpt = (UBYTE *)bltdpt;
    27da:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd79d50>
    custom->bltsize = bltsize;
    27e0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd79d54>
    bltdpt += 64*256;
    27e6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    27ea:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd79cfe>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    27f0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd79cfe>,d0
    27f6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    27fa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 27f0 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    27fc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    27fe:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    2800:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 2602 <DrawRect+0x24>
    if( planes > 1) {
    2804:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    2808:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 27be <DrawRect+0x1e0>
    280a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 289c <DrawRect+0x2be>
    height += square->YPosMin;
    280e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    2810:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    2812:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    2814:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    2816:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    2818:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    281c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2820:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 262e <DrawRect+0x50>
    xlength += xposmin - 16;    
    2824:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    2826:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    2828:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    282c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2830:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2832:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 2634 <DrawRect+0x56>
  WORD height = square->Height;
    2836:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    2838:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    283a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 2622 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    283e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    2844:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    284a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    284c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    284e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2850:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    2856:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    2858:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    285a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    285e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2862:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    2866:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    286a:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 27b6 <DrawRect+0x1d8>
    286e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2870:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd79d3c>
    custom->bltapt = (UBYTE *)bltapt;
    2876:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd79d4c>
    custom->bltbpt = (UBYTE *)bltdpt;
    287c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd79d48>
    custom->bltdpt = (UBYTE *)bltdpt;
    2882:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd79d50>
    custom->bltsize = bltsize;
    2888:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd79d54>
    bltdpt += 64*256;
    288e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2892:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd79cfe>,d0
    2898:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 27f0 <DrawRect+0x212>
      bit = color & 1;
    289c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    289e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    28a2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    28a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    28a6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    28aa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 27c8 <DrawRect+0x1ea>
    28ae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 286e <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    28b0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 3d0cd <incbin_MercuryLetterData2Lz4_end+0x27>
    28b6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    28ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 256c <KPrintF>(pc)
    28be:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    28c0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    28c4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    28c6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2730 <DrawRect+0x152>
      WORD length = x1 - x2;
    28ca:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    28ce:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    28d0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    28d2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    28d6:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 31fc <DrawRect+0xc1e>
    28da:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    28de:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    28e2:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    28e4:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    28e6:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2a70 <DrawRect+0x492>
      height += 1; 
    28ea:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    28ec:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    28ee:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    28f2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 28fa <DrawRect+0x31c>
    28f4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    28fa:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    28fe:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    2902:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    2904:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    2906:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2a7e <DrawRect+0x4a0>
      if(yposmin <= 0) {
    290a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    290c:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    290e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 2a64 <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    2912:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    2914:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    291a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 2aca <DrawRect+0x4ec>
    291e:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    2924:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34f4 <DrawRect+0xf16>
    2928:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    292e:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34c4 <DrawRect+0xee6>
          startx -= 1;
    2932:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2936:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    2938:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    293a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    293c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 2adc <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2940:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2942:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2944:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    2946:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    2948:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    294a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    294c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 2ab6 <DrawRect+0x4d8>
    2950:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2952:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    2954:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2956:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    295c:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    295e:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2960:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2962:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    2964:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    2966:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 3404 <DrawRect+0xe26>
    296a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    296e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2970:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2972:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    2974:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2978:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    297e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2980:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2982:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    2984:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    2986:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    2988:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    298a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    298c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    298e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2990:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2992:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2994:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    2996:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    2998:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    299a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    299c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    299e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    29a0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    29a2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    29a4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    29a6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    29a8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    29aa:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    29ac:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    29ae:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    29b0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    29b4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    29b6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    29b8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 3d2d0 <LookupSlope>,a1
    29be:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    29c0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    29c2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    29c6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    29c8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    29ca:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    29cc:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    29ce:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2a96 <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29d2:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd79cfe>,d0
    29d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
    29e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    29e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 29da <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    29e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    29e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 84e6e <BltCon0LineDraw>,d0
    29ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    29f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd79d3c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    29f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 852e2 <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    29fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 852e6 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd79d48>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2a0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    2a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    2a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    2a12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd79d44>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2a18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd79d50>
  custom->bltbmod = bltbmod;
    2a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd79d5e>
  custom->bltcmod = bltdmod;
    2a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd79d5c>
  custom->bltdmod = bltdmod;
    2a2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd79d62>
  custom->bltsize = bltwidth + 64*height;
    2a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2a32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    2a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    2a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd79d54>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2a42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    2a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 85180 <DrawBuffer>,a0
    2a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    2a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    2a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd79cfe>,d1
    2a60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 275a <DrawRect+0x17c>
        starty += 96;
    2a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 2912 <DrawRect+0x334>
        height = -height;
    2a70:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2a72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    2a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    2a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2a7a:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 28ea <DrawRect+0x30c>
        startx += 96;
    2a7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    2a84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2a88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 2912 <DrawRect+0x334>
    2a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 2a64 <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2a96:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 3d0e3 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 256c <KPrintF>(pc)
    2aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    2aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd79cfe>,d0
    2ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 29da <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    2ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    2aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    2abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    2abe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    2ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    2ac6:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 295c <DrawRect+0x37e>
          height *= -1;
    2aca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    2acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    2ace:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    2ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    2ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    2ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2940 <DrawRect+0x362>
    2adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    2ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    2ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    2ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    2ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    2aea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    2aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2950 <DrawRect+0x372>
    2af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 2ab6 <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    2af2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 3d0cd <incbin_MercuryLetterData2Lz4_end+0x27>
    2af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    2afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 256c <KPrintF>(pc)
    2b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    2b02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    2b06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    2b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 2c7a <DrawRect+0x69c>
      WORD length = x1 - x2;
    2b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    2b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    2b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    2b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    2b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 335e <DrawRect+0xd80>
    2b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2b20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    2b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    2b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 2cae <DrawRect+0x6d0>
      height += 1; 
    2b30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2b34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    2b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2b42 <DrawRect+0x564>
    2b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2b40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2b4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2c96 <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    2b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    2b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 2c8a <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 31ae <DrawRect+0xbd0>
    2b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    2b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 2cec <DrawRect+0x70e>
    2b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 31b2 <DrawRect+0xbd4>
          height *= -1;
    2b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    2b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2cf2 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    2b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 2cdc <DrawRect+0x6fe>
    2b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3382 <DrawRect+0xda4>
    2b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    2bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 3d2d0 <LookupSlope>,a0
    2bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2cba <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd79cfe>,d0
    2c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
    2c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2c14 <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 84e6e <BltCon0LineDraw>,a0
    2c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd79d3c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 852e2 <PrepareBuffer>,a5
    2c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 852e6 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2c48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd79d48>
  custom->bltcpt = (UBYTE *)bltdpt;
    2c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd79d44>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd79d50>
  custom->bltbmod = bltbmod;
    2c5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd79d5e>
  custom->bltcmod = bltdmod;
    2c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd79d5c>
  custom->bltdmod = bltdmod;
    2c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd79d62>
  custom->bltsize = bltwidth + 64*height;
    2c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd79d54>
  WORD x1 = square->Vertices[index1].X;
    2c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    2c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2c82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    2c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 2718 <DrawRect+0x13a>
        starty += 96;
    2c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2c8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2b5a <DrawRect+0x57c>
        startx += 96;
    2c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2b5a <DrawRect+0x57c>
    2cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 2c8a <DrawRect+0x6ac>
        height = -height;
    2cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2b30 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 3d0e3 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 256c <KPrintF>(pc)
    2cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    2cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd79cfe>,d0
    2cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2c14 <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    2cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2b90 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    2cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    2cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2b7e <DrawRect+0x5a0>
    2cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    2cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 2b88 <DrawRect+0x5aa>
    2d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 2cdc <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 3d0cd <incbin_MercuryLetterData2Lz4_end+0x27>
    2d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    2d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 256c <KPrintF>(pc)
    2d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 2e86 <DrawRect+0x8a8>
      WORD length = x1 - x2;
    2d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 32c2 <DrawRect+0xce4>
    2d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    2d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    2d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    2d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    2d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 2eba <DrawRect+0x8dc>
      height += 1; 
    2d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    2d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    2d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 2d4c <DrawRect+0x76e>
    2d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    2d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    2d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    2d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2ea2 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    2d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    2d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    2d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2e96 <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    2d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    2d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2f02 <DrawRect+0x924>
    2d70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    2d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 34b2 <DrawRect+0xed4>
    2d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    2d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3482 <DrawRect+0xea4>
          startx -= 1;
    2d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    2d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    2d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    2d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2f14 <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    2d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    2d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    2d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 2eee <DrawRect+0x910>
    2da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 32e2 <DrawRect+0xd04>
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2e08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 3d2d0 <LookupSlope>,a1
    2e10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    2e1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2ec8 <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
    2e2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2e28 <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2e34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 84e6e <BltCon0LineDraw>,d0
    2e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2e3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd79d3c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2e48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 852e2 <PrepareBuffer>,a5
    2e4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 852e6 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd79d48>
  custom->bltcpt = (UBYTE *)bltdpt;
    2e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd79d44>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd79d50>
  custom->bltbmod = bltbmod;
    2e68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd79d5e>
  custom->bltcmod = bltdmod;
    2e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd79d5c>
  custom->bltdmod = bltdmod;
    2e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd79d62>
  custom->bltsize = bltwidth + 64*height;
    2e7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    2e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2e80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd79d54>
  WORD x1 = square->Vertices[index1].X;
    2e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    2e8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2e92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 26fe <DrawRect+0x120>
        starty += 96;
    2e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    2e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 2d64 <DrawRect+0x786>
        startx += 96;
    2ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 2d64 <DrawRect+0x786>
    2eb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2e96 <DrawRect+0x8b8>
        height = -height;
    2eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    2ebc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    2ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 2d3c <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 3d0e3 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 256c <KPrintF>(pc)
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    2edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2e28 <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    2eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2ef6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    2efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 2dae <DrawRect+0x7d0>
          height *= -1;
    2f02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    2f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    2f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2d92 <DrawRect+0x7b4>
    2f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    2f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    2f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2da2 <DrawRect+0x7c4>
    2f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 2eee <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    2f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 3d0cd <incbin_MercuryLetterData2Lz4_end+0x27>
    2f30:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    2f34:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 256c <KPrintF>(pc)
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    2f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    2f3e:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 30b2 <DrawRect+0xad4>
      WORD length = x1 - x2;
    2f44:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    2f48:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    2f4a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2f4c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    2f50:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 321c <DrawRect+0xc3e>
    2f54:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    2f58:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    2f5a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    2f5c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    2f62:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    2f64:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 30e6 <DrawRect+0xb08>
      height += 1; 
    2f68:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    2f6a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2f6c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 2f7a <DrawRect+0x99c>
    2f72:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    2f74:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    2f78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2f7a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2f7e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2f82:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    2f84:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    2f86:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 30ce <DrawRect+0xaf0>
      if(yposmin <= 0) {
    2f8a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    2f8c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    2f8e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 30c2 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2f92:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2f94:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2f96:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2f98:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 315e <DrawRect+0xb80>
    2f9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    2f9e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 3124 <DrawRect+0xb46>
    2fa4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2fa6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2fa8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 3162 <DrawRect+0xb84>
          height *= -1;
    2fac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    2fae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2fb0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 312a <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2fb6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2fb8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2fba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    2fbc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 3114 <DrawRect+0xb36>
    2fc0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2fc2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2fc4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2fc8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2fca:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2fcc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2fd0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2fd2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 3240 <DrawRect+0xc62>
    2fd6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2fda:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2fdc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    2fde:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2fe2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2fea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2fec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    2fee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2ff0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    2ff2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2ff6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2ff8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2ffa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2ffc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2ffe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    3000:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    3004:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    3006:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    3008:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    300a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    300c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    3010:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    3012:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    3014:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    3018:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    301a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    301c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    301e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    3022:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    3024:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    3026:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 3d2d0 <LookupSlope>,a0
    302c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    302e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    3030:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    3034:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    3036:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    303a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    303c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    303e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 30f2 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3042:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd79cfe>,d0
    3048:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    304c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
    3052:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    3056:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 304c <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    3058:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    305c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 84e6e <BltCon0LineDraw>,a0
    3062:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    3064:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    3066:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    3068:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd79d3c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    306e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    3070:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    3072:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 852e2 <PrepareBuffer>,a5
    3078:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    307a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 852e6 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    3080:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd79d48>
  custom->bltcpt = (UBYTE *)bltdpt;
    3086:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd79d44>
  custom->bltdpt = (UBYTE *)bltdpt;  
    308c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd79d50>
  custom->bltbmod = bltbmod;
    3092:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd79d5e>
  custom->bltcmod = bltdmod;
    309a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd79d5c>
  custom->bltdmod = bltdmod;
    30a0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd79d62>
  custom->bltsize = bltwidth + 64*height;
    30a6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    30a8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    30aa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    30ac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd79d54>
  WORD x1 = square->Vertices[index1].X;
    30b2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    30b6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    30ba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    30be:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 26dc <DrawRect+0xfe>
        starty += 96;
    30c2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    30c6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    30ca:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2f92 <DrawRect+0x9b4>
        startx += 96;
    30ce:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    30d4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    30d8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    30dc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    30de:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    30e0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2f92 <DrawRect+0x9b4>
    30e4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 30c2 <DrawRect+0xae4>
        height = -height;
    30e6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    30e8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    30ea:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    30ec:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    30ee:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 2f68 <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    30f2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 3d0e3 <incbin_MercuryLetterData2Lz4_end+0x3d>
    30f8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    30fc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 256c <KPrintF>(pc)
    3100:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    3102:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3106:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd79cfe>,d0
    310c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    3110:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 304c <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    3114:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    3118:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    311a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    311c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    3120:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2fc8 <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    3124:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    3126:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2fb6 <DrawRect+0x9d8>
    312a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    312e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    3130:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    3132:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    3134:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2fc0 <DrawRect+0x9e2>
    3138:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 3114 <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    313a:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    313c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    313e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    3140:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    3146:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    3148:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    314a:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    314e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    3152:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    3156:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    315a:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 27b6 <DrawRect+0x1d8>
          height *= -1;
    315e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    3160:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    3162:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    3166:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    316a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 319a <DrawRect+0xbbc>
    316c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    316e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3170:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    3172:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    3174:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    3176:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    3178:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 3188 <DrawRect+0xbaa>
    317a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    317c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    317e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3180:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    3184:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2fc8 <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    3188:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    318c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    318e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3190:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3192:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    3196:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2fc8 <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    319a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    319e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31a0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31a2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31a4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31a6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31a8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31aa:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 317a <DrawRect+0xb9c>
    31ac:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 3188 <DrawRect+0xbaa>
          height *= -1;
    31ae:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    31b0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    31b2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    31b6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    31ba:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 31d8 <DrawRect+0xbfa>
    31bc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    31be:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31c0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    31c2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    31c4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    31c6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    31c8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 31ea <DrawRect+0xc0c>
    31ca:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    31cc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    31ce:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    31d0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    31d4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2b90 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    31d8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    31dc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31de:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31e0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31e2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31e4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31e6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31e8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 31ca <DrawRect+0xbec>
    31ea:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    31ee:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    31f0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    31f2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    31f4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    31f8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2b90 <DrawRect+0x5b2>
        length *= -1;
    31fc:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    31fe:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    3200:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    3202:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    3206:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    320a:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    3210:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    3212:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    3214:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 28ea <DrawRect+0x30c>
    3218:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2a70 <DrawRect+0x492>
        length *= -1;
    321c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    321e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    3220:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    3222:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    3226:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    322a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    322e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    3230:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    3232:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    3236:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    3238:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 2f68 <DrawRect+0x98a>
    323c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 30e6 <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    3240:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    3242:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    3244:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    3246:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    324a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    324c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    324e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    3250:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    3252:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    3256:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3258:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    325a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    325e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    3264:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    3266:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    3268:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    326a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    326c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    326e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3270:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3272:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    3274:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    3276:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    3278:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    327a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    327c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3280:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3282:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3284:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    3286:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    3288:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    328c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    328e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3290:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    3294:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3296:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3298:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    329a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    329e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    32a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    32a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 3d2d0 <LookupSlope>,a0
    32a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    32aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    32ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    32b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    32b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    32b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    32b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    32ba:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 3042 <DrawRect+0xa64>
    32be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 30f2 <DrawRect+0xb14>
        length *= -1;
    32c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    32c4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    32c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    32c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    32cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    32d0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    32d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    32d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    32da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 2d3c <DrawRect+0x75e>
    32de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 2eba <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    32e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    32e4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    32e6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    32e8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    32ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    32ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    32f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    32f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    32f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    32f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    32fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    32fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    32fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    3302:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    3308:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    330a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    330c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    330e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    3310:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    3312:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    3314:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    3316:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    3318:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    331a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    331c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    331e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    3320:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    3322:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    3324:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    3326:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    3328:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    332a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    332c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    332e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    3330:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3332:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3334:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3336:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3338:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    333a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    333e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    3340:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3342:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 3d2d0 <LookupSlope>,a1
    3348:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    334a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    334c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    3350:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    3352:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    3354:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    3356:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2e22 <DrawRect+0x844>
    335a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2ec8 <DrawRect+0x8ea>
        length *= -1;
    335e:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    3360:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    3362:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    3364:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    3368:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    336c:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    3370:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    3372:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    3374:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    3378:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    337a:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2b30 <DrawRect+0x552>
    337e:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 2cae <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3382:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    3384:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    3386:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    3388:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    338c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    338e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    3390:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    3392:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    3394:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    3398:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    339a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    339c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    33a0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    33a6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    33a8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    33aa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    33ac:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    33ae:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    33b0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    33b2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    33b4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    33b6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    33b8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    33ba:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    33bc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    33be:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    33c2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    33c4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    33c6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33c8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33ca:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    33ce:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    33d0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33d2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    33d6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33d8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33da:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    33dc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    33e0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    33e2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33e4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 3d2d0 <LookupSlope>,a0
    33ea:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    33ec:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    33ee:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    33f2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    33f4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    33f8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    33fa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    33fc:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 2c0a <DrawRect+0x62c>
    3400:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 2cba <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    3404:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    3406:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    3408:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    340a:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    340e:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    3410:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    3412:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    3414:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    3416:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    341a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    341c:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    341e:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    3420:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    3424:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    342a:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    342c:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    342e:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    3430:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3432:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    3434:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3436:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    3438:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    343a:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    343c:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    343e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3440:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    3442:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    3444:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    3446:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    3448:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    344a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    344c:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    344e:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3450:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    3452:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    3454:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3456:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    3458:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    345a:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    345c:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    3460:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    3462:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    3464:	|  |  |  |  |                                                  |  |  |                                                                                       lea 3d2d0 <LookupSlope>,a1
    346a:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    346c:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    346e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    3472:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    3474:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    3476:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    3478:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    347a:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 29d2 <DrawRect+0x3f4>
    347e:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 2a96 <DrawRect+0x4b8>
          height *= -1;
    3482:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    3484:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    3486:	|  |  |                                                        |     |                                                                                       tst.w d3
    3488:	|  |  |                                                        |     |                                                                                /----- blt.s 34b6 <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    348a:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    348c:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    348e:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    3490:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 34a0 <DrawRect+0xec2>
    3492:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    3494:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    3496:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    349c:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 2dae <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    34a0:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    34a4:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    34a6:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34a8:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    34ae:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 2dae <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    34b2:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    34b4:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 348a <DrawRect+0xeac>
    34b6:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    34ba:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    34bc:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    34be:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    34c0:	|  |  |                                                                                                                                         |  \-------- bpl.s 3492 <DrawRect+0xeb4>
    34c2:	|  |  |                                                                                                                                         \----------- bra.s 34a0 <DrawRect+0xec2>
          height *= -1;
    34c4:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    34c6:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    34c8:	|     |                                                                                                                                                      tst.w d3
    34ca:	|     |                                                                                                                                               /----- blt.s 34f8 <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    34cc:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    34ce:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    34d0:	|     |                                                                                                                                               |  |   move.w a4,d0
    34d2:	|     |                                                                                                                                         /-----|--|-- bmi.s 34e2 <DrawRect+0xf04>
    34d4:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    34d6:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34d8:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34de:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 295c <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    34e2:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    34e6:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    34e8:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34ea:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34f0:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 295c <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    34f4:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    34f6:	                                                                                                                                                |  |  |  \-- bge.s 34cc <DrawRect+0xeee>
    34f8:	                                                                                                                                                |  |  \----> addi.w #15,d3
    34fc:	                                                                                                                                                |  |         asr.w #4,d3
    34fe:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    3500:	                                                                                                                                                |  |         move.w a4,d0
    3502:	                                                                                                                                                |  \-------- bpl.s 34d4 <DrawRect+0xef6>
    3504:	                                                                                                                                                \----------- bra.s 34e2 <DrawRect+0xf04>

00003506 <DrawCube3d>:
{
    3506:	                                                                                                                      lea -72(sp),sp
    350a:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    350e:	                                                                                                                      movea.l 120(sp),a2
    3512:	                                                                                                                      move.w 126(sp),108(sp)
    3518:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    351e:	                                                                                                                      move.w #0,dff042 <_end+0xd79d3e>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    3526:	                                                                                                                      move.l 85174 <ClearBuffer>,54(sp)
    352e:	                                                                                                                      lea 84e70 <Cubes>,a3
    3534:	                                                                                                                      moveq #0,d5
    3536:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    3538:	|                                                                                                                     add.l d5,d2
    353a:	|                                                                                                                     move.l d2,102(sp)
    353e:	|                                                                                                                     add.l d5,d2
    3540:	|                                                                                                                     add.l d2,d2
    3542:	|                                                                                                                     add.l d2,d2
    3544:	|                                                                                                                     movea.l 54(sp),a0
    3548:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    354c:	|                                                                                                                     movea.l 852f8 <GfxBase>,a6
    3552:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    3556:	|                                                                                                                     move.w #496,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0;
    355e:	|                                                                                                                     move.w #0,dff042 <_end+0xd79d3e>
  custom->bltdmod = bltmod;
    3566:	|                                                                                                                     move.w d3,dff066 <_end+0xd79d62>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    356c:	|                                                                                                                     move.l 85174 <ClearBuffer>,54(sp)
    3574:	|                                                                                                                     movea.l 54(sp),a4
    3578:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    357c:	|                                                                                                                     cmpa.w #0,a6
    3580:	|                       /-------------------------------------------------------------------------------------------- bne.w 3e8a <DrawCube3d+0x984>
    3584:	|                       |                                                                                             move.l d5,d1
    3586:	|                       |                                                                                             addq.l #1,d1
    3588:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    358c:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    358e:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    3594:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    3598:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    359c:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    35a0:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    35a4:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    35a8:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    35ac:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    35b2:	|                    |  |                                                                                             movea.w a0,a1
    35b4:	|                    |  |                                                                                             subq.l #1,a1
    35b6:	|                    |  |                                                                                             adda.l a1,a1
    35b8:	|                    |  |                                                                                             lea 420f0 <zMult>,a5
    35be:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    35c4:	|                    |  |                                                                                             move.w 62(sp),d0
    35c8:	|                    |  |                                                                                             muls.w d1,d0
    35ca:	|                    |  |                                                                                             moveq #15,d7
    35cc:	|                    |  |                                                                                             asr.l d7,d0
    35ce:	|                    |  |                                                                                             movea.l d0,a1
    35d0:	|                    |  |                                                                                             lea 160(a1),a1
    35d4:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    35d8:	|                    |  |                                                                                             move.w 62(sp),d7
    35dc:	|                    |  |                                                                                             muls.w 86(sp),d7
    35e0:	|                    |  |                                                                                             moveq #15,d0
    35e2:	|                    |  |                                                                                             asr.l d0,d7
    35e4:	|                    |  |                                                                                             addi.w #128,d7
    35e8:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    35ec:	|                    |  |                                                                                             movea.w 10(a2),a1
    35f0:	|                    |  |                                                                                             subq.l #1,a1
    35f2:	|                    |  |                                                                                             adda.l a1,a1
    35f4:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    35fa:	|                    |  |                                                                                             move.w 70(sp),d7
    35fe:	|                    |  |                                                                                             muls.w 6(a2),d7
    3602:	|                    |  |                                                                                             asr.l d0,d7
    3604:	|                    |  |                                                                                             movea.l d7,a1
    3606:	|                    |  |                                                                                             lea 160(a1),a1
    360a:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    360e:	|                    |  |                                                                                             move.w 70(sp),d7
    3612:	|                    |  |                                                                                             muls.w 8(a2),d7
    3616:	|                    |  |                                                                                             asr.l d0,d7
    3618:	|                    |  |                                                                                             addi.w #128,d7
    361c:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3620:	|                    |  |                                                                                             movea.w a4,a1
    3622:	|                    |  |                                                                                             move.l a1,d7
    3624:	|                    |  |                                                                                             subq.l #1,d7
    3626:	|                    |  |                                                                                             add.l d7,d7
    3628:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    362e:	|                    |  |                                                                                             move.w 76(sp),d0
    3632:	|                    |  |                                                                                             muls.w d4,d0
    3634:	|                    |  |                                                                                             moveq #15,d7
    3636:	|                    |  |                                                                                             asr.l d7,d0
    3638:	|                    |  |                                                                                             movea.l d0,a5
    363a:	|                    |  |                                                                                             lea 160(a5),a5
    363e:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3642:	|                    |  |                                                                                             move.w 76(sp),d7
    3646:	|                    |  |                                                                                             muls.w d3,d7
    3648:	|                    |  |                                                                                             moveq #15,d0
    364a:	|                    |  |                                                                                             asr.l d0,d7
    364c:	|                    |  |                                                                                             addi.w #128,d7
    3650:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    3654:	|                    |  |                                                                                             cmpa.w #0,a6
    3658:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 3664 <DrawCube3d+0x15e>
    365a:	|                    |  |  |                                                                                          tst.w 85178 <DoNotClearDirty>
    3660:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 3e38 <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3664:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    3668:	|                    |  |  |  |                                                                                       move.l a5,d7
    366a:	|                    |  |  |  |                                                                                       subq.l #1,d7
    366c:	|                    |  |  |  |                                                                                       add.l d7,d7
    366e:	|                    |  |  |  |                                                                                       lea 420f0 <zMult>,a5
    3674:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    367a:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    367e:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3680:	|                    |  |  |  |                                                                                       moveq #15,d7
    3682:	|                    |  |  |  |                                                                                       asr.l d7,d0
    3684:	|                    |  |  |  |                                                                                       movea.l d0,a5
    3686:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    368a:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    368e:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    3692:	|                    |  |  |  |                                                                                       muls.w d6,d7
    3694:	|                    |  |  |  |                                                                                       moveq #15,d0
    3696:	|                    |  |  |  |                                                                                       asr.l d0,d7
    3698:	|                    |  |  |  |                                                                                       addi.w #128,d7
    369c:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36a0:	|                    |  |  |  |                                                                                       move.l a1,d7
    36a2:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    36a8:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36aa:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    36ac:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    36b0:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36b2:	|                    |  |  |  |                                                                                       muls.w d3,d0
    36b4:	|                    |  |  |  |                                                                                       movea.l d1,a5
    36b6:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    36b8:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    36ba:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    36bc:	|                    |  |  |  |                                                                                       movea.w a0,a0
    36be:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    36c0:	|                    |  |  |  |                                                                                       jsr 5a6c <__mulsi3>
    36c6:	|                    |  |  |  |                                                                                       addq.l #8,sp
    36c8:	|                    |  |  |  |                                                                                       add.l a5,d0
    36ca:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    36ce:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    36d2:	|                    |  |  |  |                                                                                       neg.l d0
    36d4:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    36d8:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    36dc:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    36e0:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 36ec <DrawCube3d+0x1e6>
    36e2:	|                    |  |  |  |  |                                                                                    tst.w 85178 <DoNotClearDirty>
    36e8:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3df8 <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    36ec:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    36f0:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    36f2:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36f4:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36f6:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    36fa:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    36fe:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3700:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    3702:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3704:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    3706:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    3708:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    370c:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    370e:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3710:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    3712:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    3714:	|                    |  |  |  |  |  |                                                                                 jsr 5a6c <__mulsi3>
    371a:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    371c:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    371e:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    3722:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    3724:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    3726:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    372a:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    372e:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3732:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3746 <DrawCube3d+0x240>
    3734:	|  |                 |  |  |  |  |  |                                                                                 tst.w 85178 <DoNotClearDirty>
    373a:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3746 <DrawCube3d+0x240>
    373c:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3742:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 4328 <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    3746:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    374a:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3750:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    3756:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    375c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3762:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    3768:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    376e:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    3774:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    3778:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    377c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3780:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3782:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3784:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    3786:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    3788:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    378a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    378c:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    378e:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    3790:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3792:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3794:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    3796:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    3798:	|  |  |              |  |  |  |  |  |                                                                                 jsr 5a6c <__mulsi3>
    379e:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    37a0:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    37a2:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    37a6:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    37a8:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    37ac:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    37b0:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37b2:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37b4:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37b6:	|  |  |              |  |  |  |  |  |                                                                                 lea 420f0 <zMult>,a4
    37bc:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37c0:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    37c2:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    37c6:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    37c8:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    37ca:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    37ce:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    37d2:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37d4:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    37d6:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    37da:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    37de:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37e0:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37e2:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37e4:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37e8:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    37ea:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    37ee:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    37f0:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    37f4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    37f8:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37fa:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    37fe:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3800:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    3802:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    3804:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    3806:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    380a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    380c:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    380e:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    3812:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    3814:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    3816:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    3818:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    381c:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    3820:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    3822:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    3824:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    3828:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    382a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    382e:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3830:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3832:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    3834:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    3838:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    383a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    383e:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3840:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3842:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3844:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3848:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    384c:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3860 <DrawCube3d+0x35a>
    384e:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 85178 <DoNotClearDirty>
    3854:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3860 <DrawCube3d+0x35a>
    3856:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    385c:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 42d0 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3860:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    3866:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    386c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3870:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    3874:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    3878:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    387c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3880:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    3884:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    3888:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    388c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    3892:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    3898:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    389e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    38a4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    38aa:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    38b0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    38b4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    38b8:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    38bc:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    38c0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    38c6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    38cc:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    38d0:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 38e4 <DrawCube3d+0x3de>
    38d2:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 85178 <DoNotClearDirty>
    38d8:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 38e4 <DrawCube3d+0x3de>
    38da:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    38e0:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 4368 <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    38e4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    38ea:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    38f0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    38f4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    38f8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    38fc:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    3900:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    3906:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    390c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    3912:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    3918:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    391c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3920:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    3924:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    3928:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    392e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    3934:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    393a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3940:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    3944:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    394a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    394e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3952:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    3958:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    395e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    3964:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    396a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    396e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3972:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    3978:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    397e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3982:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    3986:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    398a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    398e:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 3536 <DrawCube3d+0x30>
    3992:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 84f30 <Cubes+0xc0>,a6
    3998:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    399c:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    39a0:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    39a4:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    39aa:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    39ae:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    39b2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    39b6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    39b8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    39ba:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    39bc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    39c2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    39c8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    39cc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    39d0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    39d4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 3b36 <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    39d8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    39dc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    39e0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 39d0 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    39e2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    39e6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    39ea:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 8517c <CubeNrReversePtr>,a0
    39f0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    39f4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    39f6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 3d1a <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    39fa:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    39fc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 3c80 <DrawCube3d+0x77a>
    3a00:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    3a02:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    3a04:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    3a08:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3c90 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    3a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    3a12:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 3eec <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    3a16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    3a1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 3a24 <DrawCube3d+0x51e>
    3a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    3a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    3a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    3a2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 85180 <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    3a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    3a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    3a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    3a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3a62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    3a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3a6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    3a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    3a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a8a <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3a7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a8a <DrawCube3d+0x584>
    3a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    3a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 3dac <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3aa0 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    3a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3aa0 <DrawCube3d+0x59a>
    3a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 3dba <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    3aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 3ab6 <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3aaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 3ab6 <DrawCube3d+0x5b0>
    3aac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 3d5c <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    3ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    3aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 3acc <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    3ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 3acc <DrawCube3d+0x5c6>
    3ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    3ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 3d6a <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    3acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    3ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 3ae2 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    3ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 3ae2 <DrawCube3d+0x5dc>
    3ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    3ade:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 3d78 <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    3ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    3ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 3af8 <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    3aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 3af8 <DrawCube3d+0x5f2>
    3aee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    3af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 3d86 <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    3af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    3afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    3b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    3b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    3b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    3b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 39aa <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 85180 <DrawBuffer>,a2
  if( mirroring == 1) {
    3b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 3f4e <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3b20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3b30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    3b34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3b40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    3b44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3b4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    3b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    3b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    3b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    3b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    3b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    3bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bc8 <DrawCube3d+0x6c2>
    3bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    3bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bce <DrawCube3d+0x6c8>
    3bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    3bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bd4 <DrawCube3d+0x6ce>
    3bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    3bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bde <DrawCube3d+0x6d8>
    3bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    3bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3be4 <DrawCube3d+0x6de>
    3be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bec <DrawCube3d+0x6e6>
    3bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    3bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    3bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bf2 <DrawCube3d+0x6ec>
    3bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bf8 <DrawCube3d+0x6f2>
    3bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    3bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bfe <DrawCube3d+0x6f8>
    3bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    3bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c08 <DrawCube3d+0x702>
    3c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    3c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c0e <DrawCube3d+0x708>
    3c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    3c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c16 <DrawCube3d+0x710>
    3c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3c16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3c28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c3c <DrawCube3d+0x736>
    3c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c46 <DrawCube3d+0x740>
    3c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3c4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c52 <DrawCube3d+0x74c>
    3c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c5c <DrawCube3d+0x756>
    3c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 39d0 <DrawCube3d+0x4ca>
    3c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 39e2 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    3c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    3c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    3c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    3c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    3c8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 3a0c <DrawCube3d+0x506>
      if(maxycube < 0) {
    3c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3ee2 <DrawCube3d+0x9dc>
      minycube = 0;
    3c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    3c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3cac <DrawCube3d+0x7a6>
    3ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    3cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3cb8 <DrawCube3d+0x7b2>
    3cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 85180 <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    3ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3a30 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 3e9e <DrawCube3d+0x998>
    3cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    3cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    3cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    3cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    3cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    3cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    3cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    3d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    3d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3a4c <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    3d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3dc8 <DrawCube3d+0x8c2>
    3d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    3d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    3d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    3d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    3d32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    3d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    3d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    3d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    3d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    3d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    3d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    3d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    3d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    3d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    3d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 3a00 <DrawCube3d+0x4fa>
    3d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 3c80 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    3d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    3d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    3d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 3ab6 <DrawCube3d+0x5b0>
    3d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    3d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    3d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 3acc <DrawCube3d+0x5c6>
    3d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    3d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    3d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 3ae2 <DrawCube3d+0x5dc>
    3d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    3d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    3d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 39aa <DrawCube3d+0x4a4>
    3da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 3b10 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    3dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3a8a <DrawCube3d+0x584>
    3dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    3dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 25de <DrawRect>(pc)
    3dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3aa0 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    3dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    3dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    3dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    3dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    3dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    3dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    3dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 3d52 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3df8:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    3dfc:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3dfe:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3e02:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3e04:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3e06:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    3e0a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e0e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd79cfe>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e14:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd79cfe>,d0
    3e1a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    3e1e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3e14 <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3e20:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    3e26:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    3e2e:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd79d54>
}
    3e34:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 36ec <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3e38:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    3e3c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e3e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    3e42:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e44:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e46:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    3e4a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e50:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd79cfe>,d7
    3e56:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    3e5a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e5e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd79cfe>,d7
    3e64:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    3e68:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 3e5e <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    3e6a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    3e6e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    3e74:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    3e7c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd79d54>
      clearpos += 64*BPLHEIGHT;
    3e82:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    3e86:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 3664 <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3e8a:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 85178 <DoNotClearDirty>
    3e90:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 3f0a <DrawCube3d+0xa04>
    3e92:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3e94:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3e96:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    3e9a:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 358c <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3e9e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3ea2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3ea4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3ea6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3ea8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    3eac:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    3eae:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3eb0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3eb2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3eb6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3eb8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    3ebc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    3ebe:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ec0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ec2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3ec4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3ec6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3ec8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3ecc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3ed0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ed2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3ed4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3ed6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ed8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    3eda:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    3ede:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3a4c <DrawCube3d+0x546>
      if(maxycube < 0) {
    3ee2:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3ee4:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3ee8:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 3c9e <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    3eec:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3ef0:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3ef2:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 3efa <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3ef4:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3ef6:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 3c9e <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    3efa:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    3efe:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3f02:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3f06:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 3c9e <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3f0a:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    3f0c:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    3f0e:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3f12:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3f14:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3f16:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3f18:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3f1a:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3f1c:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f20:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd79cfe>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f26:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd79cfe>,d0
    3f2c:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    3f30:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3f26 <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    3f32:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    3f38:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    3f40:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd79d54>
      clearpos += 64*BPLHEIGHT;
    3f46:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    3f4a:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 358c <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3f4e:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    3f52:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    3f56:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    3f58:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3f5a:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3f5c:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    3f60:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    3f64:	|  |  |  |  |  |  |                                                                                                   movea.l 852e2 <PrepareBuffer>,a6
    3f6a:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    3f6e:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    3f72:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    3f74:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f78:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f7e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    3f84:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f88:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f7e <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    3f8a:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd79d40>
  custom->bltalwm = 0xffff; //Show All
    3f92:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd79d42>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    3f9a:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd79d6c>
  custom->bltamod = 60;
    3fa2:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd79d60>
  custom->bltbmod = 60;
    3faa:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd79d5e>
  custom->bltdmod = 60;    
    3fb2:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd79d62>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    3fba:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x8002; //Ascending
    3fc2:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd79d3e>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3fca:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    3fcc:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    3fce:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3fd0:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3fd2:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3fd4:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3fd8:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    3fda:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    3fdc:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    3fde:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3fe0:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3fe4:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3fe6:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3fe8:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    3fec:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    3ff0:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    3ff4:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3ff6:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3ff8:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    3ffa:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3ffe:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    4002:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    4006:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    4008:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    400a:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    400e:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    4010:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    4014:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 404a <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    4016:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd79d4c>
      custom->bltbpt = bltbpos;
    401c:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd79d48>
      custom->bltdpt = bltdpos;
    4022:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd79d50>
      custom->bltsize = 2 + height * 64;
    4028:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd79d54>
      bltapos -= 2;
    402e:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    4030:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    4032:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4034:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd79cfe>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    403a:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd79cfe>,d0
    4040:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    4044:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 403a <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    4046:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    4048:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 4016 <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    404a:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    4050:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    4052:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 4070 <DrawCube3d+0xb6a>
    4054:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    4056:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    405a:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    405e:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    4060:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    4062:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    4066:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    4068:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    406c:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 4016 <DrawCube3d+0xb10>
    406e:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 404a <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    4070:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    4078:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd79d3e>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    4080:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd79d6c>
  UWORD mod=64 - length*2-2;
    4088:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    408a:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    408c:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    408e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd79d60>
  custom->bltbmod = mod;
    4094:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd79d5e>
  custom->bltdmod = mod;
    409a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd79d62>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40a0:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    40a2:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    40a4:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    40a8:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    40ac:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    40ae:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40b0:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    40b2:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    40b4:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    40b6:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    40b8:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    40ba:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    40bc:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    40c2:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    40c8:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    40ce:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40d4:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd79cfe>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40da:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d4
    40e0:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    40e4:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40da <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40e6:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    40e8:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    40ec:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    40f0:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    40f2:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    40f8:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    40fa:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    40fc:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    4102:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    4108:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    410e:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4114:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    411a:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    4120:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4124:	|  |  |  |  |  |  |                                                                                               \-- bne.s 411a <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    4126:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0xe002;
    412e:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd79d3e>
  custom->bltcdat = 0x3333;
    4136:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd79d6c>
  custom->bltamod = mod;
    413e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd79d60>
  custom->bltbmod = mod;
    4144:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd79d5e>
  custom->bltdmod = mod;
    414a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd79d62>
    custom->bltapt = bltapos;
    4150:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    4156:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    415c:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    4162:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4168:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    416e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    4174:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4178:	|  |  |  |  |  |  |                                                                                               \-- bne.s 416e <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    417a:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    4180:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    4186:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    418c:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4192:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4198:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    419e:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41a2:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4198 <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    41a4:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0xf002;
    41ac:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd79d3e>
  custom->bltcdat = 0x5555;
    41b4:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd79d6c>
  custom->bltamod = mod;
    41bc:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd79d60>
  custom->bltbmod = mod;
    41c2:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd79d5e>
  custom->bltdmod = mod;
    41c8:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd79d62>
    custom->bltapt = bltapos;
    41ce:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    41d4:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    41da:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    41e0:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41e6:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41ec:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    41f2:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41f6:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41ec <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    41f8:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd79d4c>
    custom->bltbpt = bltbpos;
    41fe:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd79d48>
    custom->bltdpt = bltdpos;
    4204:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd79d50>
    custom->bltsize = length+1 + height * 64;
    420a:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4210:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4216:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    421c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4220:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4216 <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    4222:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd79d3c>
  custom->bltcon1 = 0x0002;
    422a:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd79d3e>
  custom->bltcdat = 0x0;
    4232:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd79d6c>
  mod=64 -length*2;
    423a:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    423c:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    423e:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    4240:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd79d60>
  custom->bltdmod = mod;
    4246:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd79d62>
  custom->bltafwm = bltfmask;
    424c:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd79d40>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4254:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    4258:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    425a:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    425e:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd79d4c>
    custom->bltdpt = bltdpos;
    4264:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd79d50>
    custom->bltsize = length + height * 64;
    426a:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4270:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4276:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    427c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4280:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4276 <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4282:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4284:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    4288:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    428a:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    428e:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd79d4c>
    custom->bltdpt = bltdpos;
    4294:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd79d50>
    custom->bltsize = length + height * 64;
    429a:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd79d54>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42a0:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd79cfe>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    42a6:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd79cfe>,d0
    42ac:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    42b0:	|  |  |  |  |  |  |                                                                                               \-- bne.s 42a6 <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    42b2:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd79d40>
  DrawBuffer->minytotal = minytotal;
    42ba:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    42c0:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    42c6:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    42ca:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    42ce:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    42d0:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    42d4:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42d6:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    42da:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42dc:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42de:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    42e2:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42e8:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd79cfe>,d6
    42ee:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    42f2:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    42f6:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd79cfe>,d6
    42fc:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    4300:	|  |  |  |  |  |                                                                                                  \-- bne.s 42f6 <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    4302:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    4306:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    430a:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    4310:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    4318:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd79d54>
      clearpos += 64*BPLHEIGHT;
    4320:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    4324:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3860 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4328:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    432c:	|  |        |  |                                                                                                      add.l d0,d0
    432e:	|  |        |  |                                                                                                      add.l 94(sp),d0
    4332:	|  |        |  |                                                                                                      add.l d0,d0
    4334:	|  |        |  |                                                                                                      add.l d0,d0
    4336:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    433a:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd79cfe>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4340:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd79cfe>,d0
    4346:	|  |        |  |                                                                                                  |   btst #14,d0
    434a:	|  |        |  |                                                                                                  \-- bne.s 4340 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    434c:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    4352:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    435a:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd79d54>
      clearpos += 64*BPLHEIGHT;
    4360:	|  |        |  |                                                                                                      lea 16384(a5),a5
    4364:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 3746 <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    4368:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    436c:	|           |                                                                                                         add.l d0,d0
    436e:	|           |                                                                                                         add.l 94(sp),d0
    4372:	|           |                                                                                                         add.l d0,d0
    4374:	|           |                                                                                                         add.l d0,d0
    4376:	|           |                                                                                                         movea.l 54(sp),a4
    437a:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    437e:	|           |                                                                                                         move.w dff002 <_end+0xd79cfe>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4384:	|           |                                                                                                     /-> move.w dff002 <_end+0xd79cfe>,d0
    438a:	|           |                                                                                                     |   btst #14,d0
    438e:	|           |                                                                                                     \-- bne.s 4384 <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    4390:	|           |                                                                                                         move.l a5,dff054 <_end+0xd79d50>
    custom->bltadat = 0x0;
    4396:	|           |                                                                                                         move.w #0,dff074 <_end+0xd79d70>
    custom->bltsize = bltsize;    
    439e:	|           |                                                                                                         move.w d6,dff058 <_end+0xd79d54>
    squares[3].Vertices[0].X = xs0;
    43a4:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    43aa:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    43b0:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    43b4:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    43b8:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    43bc:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    43c0:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    43c6:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    43cc:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    43d2:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    43d8:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    43dc:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    43e0:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    43e4:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    43e8:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    43ee:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    43f4:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    43fa:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    4400:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    4404:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    440a:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    440e:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    4412:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    4418:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    441e:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    4424:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    442a:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    442e:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    4432:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    4438:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    443e:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    4442:	|           |                                                                                                         move.l 94(sp),d5
    4446:	|           |                                                                                                         lea 192(a3),a3
    444a:	|           |                                                                                                         cmp.w 106(sp),d5
    444e:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 3536 <DrawCube3d+0x30>
    4452:	            \-------------------------------------------------------------------------------------------------------- bra.w 3992 <DrawCube3d+0x48c>

00004456 <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    4456:	       link.w a5,#-52
    445a:	       move.l a2,-(sp)
    445c:	       move.l d2,-(sp)
    445e:	       movea.l 12(a5),a1
    4462:	       move.l 16(a5),d2
    4466:	       move.l 20(a5),d1
	struct debug_resource resource = {
    446a:	       clr.l -42(a5)
    446e:	       clr.l -38(a5)
    4472:	       clr.l -34(a5)
    4476:	       clr.l -30(a5)
    447a:	       clr.l -26(a5)
    447e:	       clr.l -22(a5)
    4482:	       clr.l -18(a5)
    4486:	       clr.l -14(a5)
    448a:	       clr.w -10(a5)
    448e:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    4494:	       move.w d2,d0
    4496:	       muls.w d1,d0
    4498:	       lsl.l #6,d0
	struct debug_resource resource = {
    449a:	       move.l d0,-46(a5)
    449e:	       clr.w -8(a5)
    44a2:	       move.w #512,-6(a5)
    44a8:	       move.w d2,-4(a5)
    44ac:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    44b0:	       move.b (a1),d0
    44b2:	       lea -42(a5),a0
    44b6:	/----- beq.s 44c8 <debug_register_bitmap.constprop.0+0x72>
    44b8:	|      lea -11(a5),a2
		*destination++ = *source++;
    44bc:	|  /-> addq.l #1,a1
    44be:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    44c0:	|  |   move.b (a1),d0
    44c2:	+--|-- beq.s 44c8 <debug_register_bitmap.constprop.0+0x72>
    44c4:	|  |   cmpa.l a0,a2
    44c6:	|  \-- bne.s 44bc <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    44c8:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    44ca:	       move.w f0ff60 <_end+0xe8ac5c>,d0
    44d0:	       cmpi.w #20153,d0
    44d4:	   /-- beq.s 44e8 <debug_register_bitmap.constprop.0+0x92>
    44d6:	   |   cmpi.w #-24562,d0
    44da:	   +-- beq.s 44e8 <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    44dc:	   |   move.l -60(a5),d2
    44e0:	   |   movea.l -56(a5),a2
    44e4:	   |   unlk a5
    44e6:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    44e8:	   \-> clr.l -(sp)
    44ea:	       clr.l -(sp)
    44ec:	       pea -50(a5)
    44f0:	       pea 4 <_start+0x4>
    44f4:	       pea 58 <_start+0x58>
    44f8:	       jsr f0ff60 <_end+0xe8ac5c>
}
    44fe:	       lea 20(sp),sp
}
    4502:	       move.l -60(a5),d2
    4506:	       movea.l -56(a5),a2
    450a:	       unlk a5
    450c:	       rts

0000450e <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    450e:	                            lea -52(sp),sp
    4512:	                            movem.l d2-d7/a2-a6,-(sp)
    4516:	                            movea.l 100(sp),a2
    451a:	                            movea.l 104(sp),a5
    451e:	                            move.l 108(sp),d0
    4522:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    4526:	                            moveq #0,d2
    4528:	                            move.w d0,d2
    452a:	                            move.l d2,56(sp)
    452e:	                            tst.w d0
    4530:	/-------------------------- beq.s 45a0 <DrawLetters.isra.0+0x92>
    4532:	|                           clr.l 44(sp)
    4536:	|                           move.l #544368,60(sp)
    453e:	|                           lea 420f0 <zMult>,a4
    4544:	|                           cmpi.w #1,d1
    4548:	|  /----------------------- beq.w 472a <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    454c:	|  |  /-------------------> moveq #0,d0
    454e:	|  |  |                     move.w (a5),d0
    4550:	|  |  |                     moveq #0,d3
    4552:	|  |  |                     move.w 2(a5),d3
    4556:	|  |  |                     movea.l d3,a0
    4558:	|  |  |                     move.l d0,d1
    455a:	|  |  |                     add.l d0,d1
    455c:	|  |  |                     add.l d1,d0
    455e:	|  |  |                     add.l d0,d0
    4560:	|  |  |                     adda.l d0,a0
    4562:	|  |  |                     move.l a0,d4
    4564:	|  |  |                     lsl.l #5,d4
    4566:	|  |  |                     movea.l d4,a0
    4568:	|  |  |                     adda.l 60(sp),a0
    456c:	|  |  |                     move.l 16(a0),d0
    4570:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4574:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4578:	|  |  |                     moveq #1,d2
    457a:	|  |  |                     cmp.l d0,d2
    457c:	|  |  |     /-------------- blt.w 4782 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4580:	|  |  |     |               movea.w d1,a0
    4582:	|  |  |     |               move.l a0,d0
    4584:	|  |  |     |               add.l a0,d0
    4586:	|  |  |     |               add.l a0,d0
    4588:	|  |  |     |               lsl.l #3,d0
    458a:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    458c:	|  |  |     |               addq.l #3,a0
    458e:	|  |  |     |               adda.l a0,a0
    4590:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4592:	|  |  |     |               addq.l #1,44(sp)
    4596:	|  |  |     |               move.l 56(sp),d0
    459a:	|  |  |     |               cmp.l 44(sp),d0
    459e:	|  |  +-----|-------------- bne.s 454c <DrawLetters.isra.0+0x3e>
}
    45a0:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    45a4:	|  |  |     |               lea 52(sp),sp
    45a8:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    45aa:	|  |  |     |  /----------> tst.w d1
    45ac:	|  |  |  /--|--|----------- ble.w 4922 <DrawLetters.isra.0+0x414>
    45b0:	|  |  |  |  |  |            lea 6(a5),a6
    45b4:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    45b6:	|  |  |  |  |  |            lea 20(a0),a0
    45ba:	|  |  |  |  |  |            move.l a0,52(sp)
    45be:	|  |  |  |  |  |            move.l a5,48(sp)
    45c2:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    45c4:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    45c8:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    45cc:	|  |  |  |  |  |  |         move.l a0,d0
    45ce:	|  |  |  |  |  |  |         subq.l #1,d0
    45d0:	|  |  |  |  |  |  |         add.l d0,d0
    45d2:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    45d6:	|  |  |  |  |  |  |         move.w d0,d1
    45d8:	|  |  |  |  |  |  |         muls.w (a2),d1
    45da:	|  |  |  |  |  |  |         moveq #15,d4
    45dc:	|  |  |  |  |  |  |         asr.l d4,d1
    45de:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    45e2:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    45e6:	|  |  |  |  |  |  |         asr.l d4,d0
    45e8:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    45ec:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    45f0:	|  |  |  |  |  |  |         subq.l #1,a0
    45f2:	|  |  |  |  |  |  |         adda.l a0,a0
    45f4:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    45f8:	|  |  |  |  |  |  |         move.w d2,d7
    45fa:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    45fe:	|  |  |  |  |  |  |         asr.l d4,d7
    4600:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    4604:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    4608:	|  |  |  |  |  |  |         asr.l d4,d2
    460a:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    460e:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    4612:	|  |  |  |  |  |  |         subq.l #1,a0
    4614:	|  |  |  |  |  |  |         adda.l a0,a0
    4616:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    461a:	|  |  |  |  |  |  |         move.w d3,d6
    461c:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    4620:	|  |  |  |  |  |  |         asr.l d4,d6
    4622:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    4626:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    462a:	|  |  |  |  |  |  |         asr.l d4,d3
    462c:	|  |  |  |  |  |  |         movea.w d3,a1
    462e:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4632:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    4636:	|  |  |  |  |  |  |         subq.l #1,a0
    4638:	|  |  |  |  |  |  |         adda.l a0,a0
    463a:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    463e:	|  |  |  |  |  |  |         move.w d3,d5
    4640:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    4644:	|  |  |  |  |  |  |         asr.l d4,d5
    4646:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    464a:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    464e:	|  |  |  |  |  |  |         asr.l d4,d3
    4650:	|  |  |  |  |  |  |         movea.w d3,a0
    4652:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4656:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    465a:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    465e:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    4662:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    4666:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    466a:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    466e:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4672:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4676:	|  |  |  |  |  |  |         move.w d1,d4
    4678:	|  |  |  |  |  |  |         cmp.w d1,d7
    467a:	|  |  |  |  |  |  |     /-- bge.s 467e <DrawLetters.isra.0+0x170>
    467c:	|  |  |  |  |  |  |     |   move.w d7,d4
    467e:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4680:	|  |  |  |  |  |  |     /-- bge.s 4684 <DrawLetters.isra.0+0x176>
    4682:	|  |  |  |  |  |  |     |   move.w d6,d4
    4684:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    4686:	|  |  |  |  |  |  |     /-- bge.s 468a <DrawLetters.isra.0+0x17c>
    4688:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    468a:	|  |  |  |  |  |  |     \-> move.w d0,d3
    468c:	|  |  |  |  |  |  |         cmp.w d0,d2
    468e:	|  |  |  |  |  |  |     /-- bge.s 4692 <DrawLetters.isra.0+0x184>
    4690:	|  |  |  |  |  |  |     |   move.w d2,d3
    4692:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    4694:	|  |  |  |  |  |  |     /-- ble.s 4698 <DrawLetters.isra.0+0x18a>
    4696:	|  |  |  |  |  |  |     |   move.w a1,d3
    4698:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    469a:	|  |  |  |  |  |  |     /-- ble.s 469e <DrawLetters.isra.0+0x190>
    469c:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    469e:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    46a2:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    46a6:	|  |  |  |  |  |  |         cmp.w d0,d2
    46a8:	|  |  |  |  |  |  |     /-- ble.s 46ac <DrawLetters.isra.0+0x19e>
    46aa:	|  |  |  |  |  |  |     |   move.w d2,d0
    46ac:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    46ae:	|  |  |  |  |  |  |     /-- bge.s 46b2 <DrawLetters.isra.0+0x1a4>
    46b0:	|  |  |  |  |  |  |     |   move.w a1,d0
    46b2:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    46b4:	|  |  |  |  |  |  |     /-- bge.s 46b8 <DrawLetters.isra.0+0x1aa>
    46b6:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    46b8:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    46ba:	|  |  |  |  |  |  |         sub.w d3,d0
    46bc:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    46c0:	|  |  |  |  |  |  |         cmpi.w #1,d0
    46c4:	|  |  |  |  |  |  |  /----- ble.s 4702 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    46c6:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    46c8:	|  |  |  |  |  |  |  |  /-- ble.s 46cc <DrawLetters.isra.0+0x1be>
    46ca:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    46cc:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    46ce:	|  |  |  |  |  |  |  |  /-- ble.s 46d2 <DrawLetters.isra.0+0x1c4>
    46d0:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    46d2:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    46d4:	|  |  |  |  |  |  |  |  /-- ble.s 46d8 <DrawLetters.isra.0+0x1ca>
    46d6:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    46d8:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    46da:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    46de:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    46e2:	|  |  |  |  |  |  |  +----- ble.s 4702 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    46e4:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46e8:	|  |  |  |  |  |  |  |      move.w (a0),d0
    46ea:	|  |  |  |  |  |  |  |      neg.w d0
    46ec:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    46f0:	|  |  |  |  |  |  |  |      pea 64(sp)
    46f4:	|  |  |  |  |  |  |  |      jsr 25de <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    46f8:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46fc:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    4700:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    4702:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    4706:	|  |  |  |  |  |  |         addq.l #1,a3
    4708:	|  |  |  |  |  |  |         movea.w a5,a0
    470a:	|  |  |  |  |  |  |         cmpa.l a3,a0
    470c:	|  |  |  |  |  |  \-------- bgt.w 45c4 <DrawLetters.isra.0+0xb6>
    4710:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    4714:	|  |  |  |  |  |            addq.l #3,a0
    4716:	|  |  |  |  |  |            adda.l a0,a0
    4718:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    471a:	|  |  |  |  |  |            addq.l #1,44(sp)
    471e:	|  |  |  |  |  |            move.l 56(sp),d0
    4722:	|  |  |  |  |  |            cmp.l 44(sp),d0
    4726:	+--|--|--|--|--|----------- beq.w 45a0 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    472a:	|  >--|--|--|--|----------> moveq #0,d0
    472c:	|  |  |  |  |  |            move.w (a5),d0
    472e:	|  |  |  |  |  |            moveq #0,d1
    4730:	|  |  |  |  |  |            move.w 2(a5),d1
    4734:	|  |  |  |  |  |            movea.l d1,a0
    4736:	|  |  |  |  |  |            move.l d0,d1
    4738:	|  |  |  |  |  |            add.l d0,d1
    473a:	|  |  |  |  |  |            add.l d1,d0
    473c:	|  |  |  |  |  |            add.l d0,d0
    473e:	|  |  |  |  |  |            adda.l d0,a0
    4740:	|  |  |  |  |  |            move.l a0,d2
    4742:	|  |  |  |  |  |            lsl.l #5,d2
    4744:	|  |  |  |  |  |            movea.l d2,a0
    4746:	|  |  |  |  |  |            adda.l 60(sp),a0
    474a:	|  |  |  |  |  |            move.l 16(a0),d0
    474e:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4752:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4756:	|  |  |  |  |  |            moveq #1,d3
    4758:	|  |  |  |  |  |            cmp.l d0,d3
    475a:	|  |  |  |  |  \----------- blt.w 45aa <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    475e:	|  |  |  |  |               movea.w d1,a0
    4760:	|  |  |  |  |               move.l a0,d0
    4762:	|  |  |  |  |               add.l a0,d0
    4764:	|  |  |  |  |               add.l a0,d0
    4766:	|  |  |  |  |               lsl.l #3,d0
    4768:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    476a:	|  |  |  |  |               addq.l #3,a0
    476c:	|  |  |  |  |               adda.l a0,a0
    476e:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4770:	|  |  |  |  |               addq.l #1,44(sp)
    4774:	|  |  |  |  |               move.l 56(sp),d0
    4778:	|  |  |  |  |               cmp.l 44(sp),d0
    477c:	|  +--|--|--|-------------- bne.s 472a <DrawLetters.isra.0+0x21c>
    477e:	+--|--|--|--|-------------- bra.w 45a0 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4782:	|  |  |  |  \-------------> tst.w d1
    4784:	|  |  |  |     /----------- ble.w 4906 <DrawLetters.isra.0+0x3f8>
    4788:	|  |  |  |     |            lea 6(a5),a6
    478c:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    478e:	|  |  |  |     |            lea 20(a0),a0
    4792:	|  |  |  |     |            move.l a0,52(sp)
    4796:	|  |  |  |     |            move.l a5,48(sp)
    479a:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    479c:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    47a0:	|  |  |  |     |  |         movea.w 4(a2),a0
    47a4:	|  |  |  |     |  |         move.l a0,d0
    47a6:	|  |  |  |     |  |         subq.l #1,d0
    47a8:	|  |  |  |     |  |         add.l d0,d0
    47aa:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    47ae:	|  |  |  |     |  |         move.w d2,d7
    47b0:	|  |  |  |     |  |         muls.w (a2),d7
    47b2:	|  |  |  |     |  |         moveq #15,d3
    47b4:	|  |  |  |     |  |         asr.l d3,d7
    47b6:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    47ba:	|  |  |  |     |  |         muls.w 2(a2),d2
    47be:	|  |  |  |     |  |         asr.l d3,d2
    47c0:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    47c4:	|  |  |  |     |  |         movea.w 10(a2),a0
    47c8:	|  |  |  |     |  |         move.l a0,d0
    47ca:	|  |  |  |     |  |         subq.l #1,d0
    47cc:	|  |  |  |     |  |         add.l d0,d0
    47ce:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    47d2:	|  |  |  |     |  |         move.w d0,d1
    47d4:	|  |  |  |     |  |         muls.w 6(a2),d1
    47d8:	|  |  |  |     |  |         asr.l d3,d1
    47da:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    47de:	|  |  |  |     |  |         muls.w 8(a2),d0
    47e2:	|  |  |  |     |  |         asr.l d3,d0
    47e4:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    47e8:	|  |  |  |     |  |         movea.w 16(a2),a0
    47ec:	|  |  |  |     |  |         subq.l #1,a0
    47ee:	|  |  |  |     |  |         adda.l a0,a0
    47f0:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    47f4:	|  |  |  |     |  |         move.w d3,d6
    47f6:	|  |  |  |     |  |         muls.w 12(a2),d6
    47fa:	|  |  |  |     |  |         moveq #15,d4
    47fc:	|  |  |  |     |  |         asr.l d4,d6
    47fe:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    4802:	|  |  |  |     |  |         muls.w 14(a2),d3
    4806:	|  |  |  |     |  |         asr.l d4,d3
    4808:	|  |  |  |     |  |         movea.w d3,a1
    480a:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    480e:	|  |  |  |     |  |         movea.w 22(a2),a0
    4812:	|  |  |  |     |  |         subq.l #1,a0
    4814:	|  |  |  |     |  |         adda.l a0,a0
    4816:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    481a:	|  |  |  |     |  |         move.w d3,d5
    481c:	|  |  |  |     |  |         muls.w 18(a2),d5
    4820:	|  |  |  |     |  |         asr.l d4,d5
    4822:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    4826:	|  |  |  |     |  |         muls.w 20(a2),d3
    482a:	|  |  |  |     |  |         asr.l d4,d3
    482c:	|  |  |  |     |  |         movea.w d3,a0
    482e:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4832:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    4836:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    483a:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    483e:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4842:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    4846:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    484a:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    484e:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4852:	|  |  |  |     |  |         move.w d1,d4
    4854:	|  |  |  |     |  |         cmp.w d1,d7
    4856:	|  |  |  |     |  |     /-- bge.s 485a <DrawLetters.isra.0+0x34c>
    4858:	|  |  |  |     |  |     |   move.w d7,d4
    485a:	|  |  |  |     |  |     \-> cmp.w d4,d6
    485c:	|  |  |  |     |  |     /-- bge.s 4860 <DrawLetters.isra.0+0x352>
    485e:	|  |  |  |     |  |     |   move.w d6,d4
    4860:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4862:	|  |  |  |     |  |     /-- bge.s 4866 <DrawLetters.isra.0+0x358>
    4864:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    4866:	|  |  |  |     |  |     \-> move.w d0,d3
    4868:	|  |  |  |     |  |         cmp.w d0,d2
    486a:	|  |  |  |     |  |     /-- bge.s 486e <DrawLetters.isra.0+0x360>
    486c:	|  |  |  |     |  |     |   move.w d2,d3
    486e:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4870:	|  |  |  |     |  |     /-- ble.s 4874 <DrawLetters.isra.0+0x366>
    4872:	|  |  |  |     |  |     |   move.w a1,d3
    4874:	|  |  |  |     |  |     \-> cmp.w a0,d3
    4876:	|  |  |  |     |  |     /-- ble.s 487a <DrawLetters.isra.0+0x36c>
    4878:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    487a:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    487e:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4882:	|  |  |  |     |  |         cmp.w d0,d2
    4884:	|  |  |  |     |  |     /-- ble.s 4888 <DrawLetters.isra.0+0x37a>
    4886:	|  |  |  |     |  |     |   move.w d2,d0
    4888:	|  |  |  |     |  |     \-> cmp.w a1,d0
    488a:	|  |  |  |     |  |     /-- bge.s 488e <DrawLetters.isra.0+0x380>
    488c:	|  |  |  |     |  |     |   move.w a1,d0
    488e:	|  |  |  |     |  |     \-> cmp.w a0,d0
    4890:	|  |  |  |     |  |     /-- bge.s 4894 <DrawLetters.isra.0+0x386>
    4892:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4894:	|  |  |  |     |  |     \-> addq.w #1,d0
    4896:	|  |  |  |     |  |         sub.w d3,d0
    4898:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    489c:	|  |  |  |     |  |         cmpi.w #1,d0
    48a0:	|  |  |  |     |  |  /----- ble.s 48da <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    48a2:	|  |  |  |     |  |  |      cmp.w d1,d7
    48a4:	|  |  |  |     |  |  |  /-- ble.s 48a8 <DrawLetters.isra.0+0x39a>
    48a6:	|  |  |  |     |  |  |  |   move.w d7,d1
    48a8:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    48aa:	|  |  |  |     |  |  |  /-- ble.s 48ae <DrawLetters.isra.0+0x3a0>
    48ac:	|  |  |  |     |  |  |  |   move.w d6,d1
    48ae:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    48b0:	|  |  |  |     |  |  |  /-- ble.s 48b4 <DrawLetters.isra.0+0x3a6>
    48b2:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    48b4:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    48b6:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    48ba:	|  |  |  |     |  |  |      cmpi.w #1,d1
    48be:	|  |  |  |     |  |  +----- ble.s 48da <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    48c0:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48c4:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    48c8:	|  |  |  |     |  |  |      pea 64(sp)
    48cc:	|  |  |  |     |  |  |      jsr 25de <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    48d0:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48d4:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    48d8:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    48da:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    48de:	|  |  |  |     |  |         addq.l #1,a3
    48e0:	|  |  |  |     |  |         movea.w a5,a0
    48e2:	|  |  |  |     |  |         cmpa.l a0,a3
    48e4:	|  |  |  |     |  \-------- blt.w 479c <DrawLetters.isra.0+0x28e>
    48e8:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    48ec:	|  |  |  |     |            addq.l #3,a0
    48ee:	|  |  |  |     |            adda.l a0,a0
    48f0:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48f2:	|  |  |  |     |            addq.l #1,44(sp)
    48f6:	|  |  |  |     |            move.l 56(sp),d0
    48fa:	|  |  |  |     |            cmp.l 44(sp),d0
    48fe:	|  |  +--|-----|----------- bne.w 454c <DrawLetters.isra.0+0x3e>
    4902:	+--|--|--|-----|----------- bra.w 45a0 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4906:	|  |  |  |     \----------> movea.w d1,a0
    4908:	|  |  |  |                  addq.l #3,a0
    490a:	|  |  |  |                  adda.l a0,a0
    490c:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    490e:	|  |  |  |                  addq.l #1,44(sp)
    4912:	|  |  |  |                  move.l 56(sp),d0
    4916:	|  |  |  |                  cmp.l 44(sp),d0
    491a:	|  |  \--|----------------- bne.w 454c <DrawLetters.isra.0+0x3e>
    491e:	+--|-----|----------------- bra.w 45a0 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4922:	|  |     \----------------> movea.w d1,a0
    4924:	|  |                        addq.l #3,a0
    4926:	|  |                        adda.l a0,a0
    4928:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    492a:	|  |                        addq.l #1,44(sp)
    492e:	|  |                        move.l 56(sp),d0
    4932:	|  |                        cmp.l 44(sp),d0
    4936:	|  \----------------------- bne.w 472a <DrawLetters.isra.0+0x21c>
    493a:	\-------------------------- bra.w 45a0 <DrawLetters.isra.0+0x92>

0000493e <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    493e:	          movem.l d2-d3/a2,-(sp)
    4942:	          move.l 36(sp),d3
    4946:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    494a:	          moveq #0,d1
    494c:	          move.w 8518a <vectorpos>,d1
    4952:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4954:	          moveq #0,d0
    4956:	          move.w 85188 <VectorPosLetters>,d0
    495c:	          add.l d0,d0
    495e:	          addi.l #321516,d0
    4964:	          move.l d0,85184 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    496a:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    496c:	          tst.l d2
    496e:	          sne d0
    4970:	          ext.w d0
    4972:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4974:	          neg.l d0
    4976:	          move.l d0,-(sp)
    4978:	          addi.l #372750,d1
    497e:	          move.l d1,-(sp)
    4980:	          jsr 3506 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    4984:	          clr.l -(sp)
    4986:	          move.l d3,-(sp)
    4988:	          move.l 40(sp),-(sp)
    498c:	          move.l 85184 <ptrvectorletters>,-(sp)
    4992:	          lea 450e <DrawLetters.isra.0>(pc),a2
    4996:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    4998:	          lea 28(sp),sp
    499c:	          tst.l d2
    499e:	   /----- bne.w 4a38 <DrawDices+0xfa>
  CubeNrReversePos++;
    49a2:	/--|----> addq.w #1,44154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    49a8:	|  |      move.w d3,d2
    49aa:	|  |      add.w d3,d2
    49ac:	|  |      add.w d3,d2
    49ae:	|  |      lsl.w #3,d2
    49b0:	|  |      add.w 8518a <vectorpos>,d2
    49b6:	|  |      move.w d2,8518a <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    49bc:	|  |      move.w 30(sp),d0
    49c0:	|  |      add.w d0,d0
    49c2:	|  |      add.w 30(sp),d0
    49c6:	|  |      add.w d0,d0
    49c8:	|  |      add.w d0,d0
    49ca:	|  |      add.w d0,85188 <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    49d0:	|  |      move.w 34(sp),d0
    49d4:	|  |      add.w d0,d0
    49d6:	|  |      add.w 34(sp),d0
    49da:	|  |      add.w d0,d0
    49dc:	|  |      add.w d0,d0
    49de:	|  |      add.w d0,8517a <VectorPosLettersReversed>
  SetCl( clminendpos);
    49e4:	|  |      move.l 44(sp),-(sp)
    49e8:	|  |      jsr 15b8 <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    49ec:	|  |      andi.l #65535,d2
    49f2:	|  |      move.l 52(sp),-(sp)
    49f6:	|  |      move.l d3,-(sp)
    49f8:	|  |      jsr 5a6c <__mulsi3>
    49fe:	|  |      move.l d0,d1
    4a00:	|  |      add.l d1,d1
    4a02:	|  |      add.l d0,d1
    4a04:	|  |      lsl.l #3,d1
    4a06:	|  |      lea 12(sp),sp
    4a0a:	|  |      cmp.l d2,d1
    4a0c:	|  |  /-- bgt.s 4a30 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    4a0e:	|  |  |   move.w #1,44154 <CubeNrReversePos>
    vectorpos = 0;
    4a16:	|  |  |   clr.w 8518a <vectorpos>
    VectorPosLetters = 0;
    4a1c:	|  |  |   clr.w 85188 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4a22:	|  |  |   clr.w 8517a <VectorPosLettersReversed>
    return 1;
    4a28:	|  |  |   moveq #1,d0
}
    4a2a:	|  |  |   movem.l (sp)+,d2-d3/a2
    4a2e:	|  |  |   rts
    return 0;  
    4a30:	|  |  \-> clr.w d0
}
    4a32:	|  |      movem.l (sp)+,d2-d3/a2
    4a36:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4a38:	|  \----> moveq #0,d0
    4a3a:	|         move.w 44154 <CubeNrReversePos>,d0
    4a40:	|         add.l d0,d0
    4a42:	|         add.l 16(sp),d0
    4a46:	|         move.l d0,8517c <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a4c:	|         pea 1 <_start+0x1>
    4a50:	|         move.l d2,-(sp)
    4a52:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4a56:	|         moveq #0,d0
    4a58:	|         move.w 8517a <VectorPosLettersReversed>,d0
    4a5e:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a60:	|         addi.l #281580,d0
    4a66:	|         move.l d0,-(sp)
    4a68:	|         jsr (a2)
    4a6a:	|         lea 16(sp),sp
    4a6e:	\-------- bra.w 49a2 <DrawDices+0x64>

00004a72 <End_PrepareDisplay.isra.0>:
}

int End_PrepareDisplay() {
    4a72:	          movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4a76:	          movea.l 85300 <SysBase>,a6
    4a7c:	          move.l #1360,d0
    4a82:	          moveq #2,d1
    4a84:	          jsr -198(a6)
    4a88:	          movea.l d0,a2
  if( retval == 0) {
    4a8a:	          tst.l d0
    4a8c:	   /----- beq.w 4ca6 <End_PrepareDisplay.isra.0+0x234>
    *cl++ = *clpartinstruction++;
    4a90:	/--|----> move.l 44034 <End_ClsSprites>,(a2)
    4a96:	|  |      move.l 44038 <End_ClsSprites+0x4>,4(a2)
    4a9e:	|  |      move.l 4403c <End_ClsSprites+0x8>,8(a2)
    4aa6:	|  |      move.l 44040 <End_ClsSprites+0xc>,12(a2)
    4aae:	|  |      move.l 44044 <End_ClsSprites+0x10>,16(a2)
    4ab6:	|  |      move.l 44048 <End_ClsSprites+0x14>,20(a2)
    4abe:	|  |      move.l 4404c <End_ClsSprites+0x18>,24(a2)
    4ac6:	|  |      move.l 44050 <End_ClsSprites+0x1c>,28(a2)
    4ace:	|  |      move.l 44054 <End_ClsSprites+0x20>,32(a2)
    4ad6:	|  |      move.l 44058 <End_ClsSprites+0x24>,36(a2)
    4ade:	|  |      move.l 4405c <End_ClsSprites+0x28>,40(a2)
    4ae6:	|  |      move.l 44060 <End_ClsSprites+0x2c>,44(a2)
    4aee:	|  |      move.l 44064 <End_ClsSprites+0x30>,48(a2)
    4af6:	|  |      move.l 44068 <End_ClsSprites+0x34>,52(a2)
    4afe:	|  |      move.l 4406c <End_ClsSprites+0x38>,56(a2)
    4b06:	|  |      move.l 44070 <End_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    4b0e:	|  |      move.l 44004 <End_ClScreen>,64(a2)
    4b16:	|  |      move.l 44008 <End_ClScreen+0x4>,68(a2)
    4b1e:	|  |      move.l 4400c <End_ClScreen+0x8>,72(a2)
    4b26:	|  |      move.l 44010 <End_ClScreen+0xc>,76(a2)
    4b2e:	|  |      move.l 44014 <End_ClScreen+0x10>,80(a2)
    4b36:	|  |      move.l 44018 <End_ClScreen+0x14>,84(a2)
    4b3e:	|  |      move.l 4401c <End_ClScreen+0x18>,88(a2)
    4b46:	|  |      move.l 44020 <End_ClScreen+0x1c>,92(a2)
    4b4e:	|  |      move.l 44024 <End_ClScreen+0x20>,96(a2)
    4b56:	|  |      move.l 44028 <End_ClScreen+0x24>,100(a2)
    4b5e:	|  |      move.l 4402c <End_ClScreen+0x28>,104(a2)
    4b66:	|  |      move.l 44030 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    4b6e:	|  |      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    4b74:	|  |      move.l #493156,d0
    4b7a:	|  |      clr.w d0
    4b7c:	|  |      swap d0
    4b7e:	|  |      move.w d0,114(a2)
  *cw++ = 0x00e2;
    4b82:	|  |      move.w #226,116(a2)
  *cw++ = bpl1pointerlow;
    4b88:	|  |      move.l #493156,d0
    4b8e:	|  |      move.w d0,118(a2)
  *cw++ = 0x00e4;
    4b92:	|  |      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    4b98:	|  |      move.l #503396,d0
    4b9e:	|  |      clr.w d0
    4ba0:	|  |      swap d0
    4ba2:	|  |      move.w d0,122(a2)
  *cw++ = 0x00e6;
    4ba6:	|  |      move.w #230,124(a2)
  *cw++ = bpl2pointerlow;
    4bac:	|  |      move.l #503396,d0
    4bb2:	|  |      move.w d0,126(a2)
  *cw++ = 0x00e8;
    4bb6:	|  |      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    4bbc:	|  |      move.l #513636,d0
    4bc2:	|  |      clr.w d0
    4bc4:	|  |      swap d0
    4bc6:	|  |      move.w d0,130(a2)
  *cw++ = 0x00ea;
    4bca:	|  |      move.w #234,132(a2)
  *cw++ = bpl3pointerlow;  
    4bd0:	|  |      move.l #513636,d0
    4bd6:	|  |      move.w d0,134(a2)
  *cw++ = 0x00ec;
    4bda:	|  |      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    4be0:	|  |      move.l #523876,d0
    4be6:	|  |      clr.w d0
    4be8:	|  |      swap d0
    4bea:	|  |      move.w d0,138(a2)
  *cw++ = 0x00ee;
    4bee:	|  |      move.w #238,140(a2)
  *cw++ = bpl4pointerlow;  
    4bf4:	|  |      move.l #523876,d0
    4bfa:	|  |      move.w d0,142(a2)
  *cw++ = 0x00f0;
    4bfe:	|  |      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    4c04:	|  |      move.l #534116,d0
    4c0a:	|  |      clr.w d0
    4c0c:	|  |      swap d0
    4c0e:	|  |      move.w d0,146(a2)
  *cw++ = 0x00f2;
    4c12:	|  |      move.w #242,148(a2)
  *cw++ = bpl5pointerlow;  
    4c18:	|  |      move.l #534116,d0
    4c1e:	|  |      move.w d0,150(a2)
    *cl++ = *clpartinstruction++;
    4c22:	|  |      pea 80 <main+0x1a>
    4c26:	|  |      pea dd3c <incbin_End_ClColor_start>
    4c2c:	|  |      pea 152(a2)
    4c30:	|  |      jsr 5a02 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    4c34:	|  |      move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    4c3c:	|  |      move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    4c44:	|  |      moveq #-2,d0
    4c46:	|  |      move.l d0,288(a2)

  End_DrawCopper = End_ClBuild( );  
    4c4a:	|  |      move.l a2,84e68 <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    4c50:	|  |      movea.l 85300 <SysBase>,a6
    4c56:	|  |      moveq #22,d0
    4c58:	|  |      move.l #65537,d1
    4c5e:	|  |      jsr -198(a6)
    4c62:	|  |      movea.l d0,a1
    4c64:	|  |      lea 12(sp),sp
    4c68:	|  |      tst.l d0
    4c6a:	|  |  /-- beq.s 4c86 <End_PrepareDisplay.isra.0+0x214>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4c6c:	|  |  |   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    4c72:	|  |  |   move.l #250132,10(a1)
    End_Vbint->is_Data = NULL;
    4c7a:	|  |  |   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    4c7e:	|  |  |   move.l #5544,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    4c86:	|  |  \-> movea.l 85300 <SysBase>,a6
    4c8c:	|  |      moveq #4,d0
    4c8e:	|  |      jsr -168(a6)
void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    4c92:	|  |      movea.l 852fc <custom>,a0
    4c98:	|  |      move.l 84e68 <End_DrawCopper>,128(a0)
}
    4ca0:	|  |      movem.l (sp)+,d2-d3/a2/a6
    4ca4:	|  |      rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    4ca6:	|  \----> movea.l 852f4 <DOSBase>,a6
    4cac:	|         jsr -60(a6)
    4cb0:	|         movea.l 852f4 <DOSBase>,a6
    4cb6:	|         move.l d0,d1
    4cb8:	|         move.l #250023,d2
    4cbe:	|         moveq #40,d3
    4cc0:	|         jsr -48(a6)
    Exit(1);
    4cc4:	|         movea.l 852f4 <DOSBase>,a6
    4cca:	|         moveq #1,d1
    4ccc:	|         jsr -144(a6)
    4cd0:	\-------- bra.w 4a90 <End_PrepareDisplay.isra.0+0x1e>

00004cd4 <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    4cd4:	                         link.w a5,#-52
    4cd8:	                         movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    4cdc:	                         clr.w 852f2 <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    4ce2:	                         clr.l -42(a5)
    4ce6:	                         clr.l -38(a5)
    4cea:	                         clr.l -34(a5)
    4cee:	                         clr.l -30(a5)
    4cf2:	                         clr.l -26(a5)
    4cf6:	                         clr.l -22(a5)
    4cfa:	                         clr.l -18(a5)
    4cfe:	                         clr.l -14(a5)
    4d02:	                         clr.l -10(a5)
    4d06:	                         clr.l -6(a5)
    4d0a:	                         clr.w -2(a5)
    4d0e:	                         move.l #278528,-50(a5)
    4d16:	                         moveq #4,d0
    4d18:	                         move.l d0,-46(a5)
    4d1c:	                         move.w #1,-10(a5)
    4d22:	                         move.w #2,-6(a5)
	while(*source && --num > 0)
    4d28:	                         moveq #100,d0
	struct debug_resource resource = {
    4d2a:	                         lea -42(a5),a0
    4d2e:	                         lea 3d122 <incbin_MercuryLetterData2Lz4_end+0x7c>,a1
	while(*source && --num > 0)
    4d34:	                         lea -11(a5),a2
		*destination++ = *source++;
    4d38:	                  /----> addq.l #1,a1
    4d3a:	                  |      move.b d0,(a0)+
	while(*source && --num > 0)
    4d3c:	                  |      move.b (a1),d0
    4d3e:	                  |  /-- beq.s 4d44 <Sw_PrepareDisplay.isra.0+0x70>
    4d40:	                  |  |   cmpa.l a0,a2
    4d42:	                  \--|-- bne.s 4d38 <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    4d44:	                     \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    4d46:	                         move.w f0ff60 <_end+0xe8ac5c>,d0
    4d4c:	                         cmpi.w #20153,d0
    4d50:	                  /----- beq.w 4ef8 <Sw_PrepareDisplay.isra.0+0x224>
    4d54:	                  |      cmpi.w #-24562,d0
    4d58:	                  +----- beq.w 4ef8 <Sw_PrepareDisplay.isra.0+0x224>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4d5c:	                  |      movea.l 85300 <SysBase>,a6
    4d62:	                  |      move.l #4000,d0
    4d68:	                  |      moveq #2,d1
    4d6a:	                  |      jsr -198(a6)
    4d6e:	                  |      move.l d0,851ee <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4d74:	                  |      pea 1 <_start+0x1>
    4d78:	                  |      pea 32 <_start+0x32>
    4d7c:	                  |      pea 3d12c <incbin_MercuryLetterData2Lz4_end+0x86>
    4d82:	                  |      move.l d0,-(sp)
    4d84:	                  |      lea 4456 <debug_register_bitmap.constprop.0>(pc),a3
    4d88:	                  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4d8a:	                  |      pea 14 <_start+0x14>
    4d8e:	                  |      pea 32 <_start+0x32>
    4d92:	                  |      move.l 851ee <Sw_FontBuffer>,-(sp)
    4d98:	                  |      lea c92 <Utils_FillLong.constprop.0>(pc),a2
    4d9c:	                  |      jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4d9e:	                  |      movea.l 85300 <SysBase>,a6
    4da4:	                  |      move.l #20560,d0
    4daa:	                  |      moveq #2,d1
    4dac:	                  |      jsr -198(a6)
    4db0:	                  |      move.l d0,851f2 <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4db6:	                  |      lea 28(sp),sp
    4dba:	      /-----------|----- beq.w 5022 <Sw_PrepareDisplay.isra.0+0x34e>
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    4dbe:	      |        /--|----> pea 1 <_start+0x1>
    4dc2:	      |        |  |      pea 101 <main+0x9b>
    4dc6:	      |        |  |      pea 3d162 <incbin_MercuryLetterData2Lz4_end+0xbc>
    4dcc:	      |        |  |      move.l d0,-(sp)
    4dce:	      |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    4dd0:	      |        |  |      pea 14 <_start+0x14>
    4dd4:	      |        |  |      pea 100 <main+0x9a>
    4dd8:	      |        |  |      move.l 851f2 <Sw_ScreenBuffer3>,-(sp)
    4dde:	      |        |  |      jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4de0:	      |        |  |      movea.l 85300 <SysBase>,a6
    4de6:	      |        |  |      move.l #20560,d0
    4dec:	      |        |  |      moveq #2,d1
    4dee:	      |        |  |      jsr -198(a6)
    4df2:	      |        |  |      move.l d0,851f6 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4df8:	      |        |  |      lea 28(sp),sp
    4dfc:	/-----|--------|--|----- beq.w 4fac <Sw_PrepareDisplay.isra.0+0x2d8>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4e00:	|  /--|--------|--|----> pea 1 <_start+0x1>
    4e04:	|  |  |        |  |      pea 101 <main+0x9b>
    4e08:	|  |  |        |  |      pea 3d19b <incbin_MercuryLetterData2Lz4_end+0xf5>
    4e0e:	|  |  |        |  |      move.l d0,-(sp)
    4e10:	|  |  |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4e12:	|  |  |        |  |      pea 14 <_start+0x14>
    4e16:	|  |  |        |  |      pea 100 <main+0x9a>
    4e1a:	|  |  |        |  |      move.l 851f6 <Sw_ScreenBuffer2>,-(sp)
    4e20:	|  |  |        |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4e22:	|  |  |        |  |      movea.l 85300 <SysBase>,a6
    4e28:	|  |  |        |  |      move.l #20560,d0
    4e2e:	|  |  |        |  |      moveq #2,d1
    4e30:	|  |  |        |  |      jsr -198(a6)
    4e34:	|  |  |        |  |      move.l d0,851fa <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4e3a:	|  |  |        |  |      lea 28(sp),sp
    4e3e:	|  |  |  /-----|--|----- beq.w 4f78 <Sw_PrepareDisplay.isra.0+0x2a4>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4e42:	|  |  |  |  /--|--|----> pea 1 <_start+0x1>
    4e46:	|  |  |  |  |  |  |      pea 101 <main+0x9b>
    4e4a:	|  |  |  |  |  |  |      pea 3d1ad <incbin_MercuryLetterData2Lz4_end+0x107>
    4e50:	|  |  |  |  |  |  |      move.l d0,-(sp)
    4e52:	|  |  |  |  |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    4e54:	|  |  |  |  |  |  |      pea 14 <_start+0x14>
    4e58:	|  |  |  |  |  |  |      pea 100 <main+0x9a>
    4e5c:	|  |  |  |  |  |  |      move.l 851fa <Sw_ScreenBuffer1>,-(sp)
    4e62:	|  |  |  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
    4e64:	|  |  |  |  |  |  |      lea 111c <Sw_ClBuild>(pc),a2
    4e68:	|  |  |  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ClBuild( );
    4e6a:	|  |  |  |  |  |  |      jsr (a2)
    4e6c:	|  |  |  |  |  |  |      move.l d0,85190 <Sw_DrawCopper>
void Sw_SwapCl() {

  /*ULONG tmp = (ULONG) Sw_DrawCopper;
  Sw_DrawCopper = Sw_ViewCopper;
  Sw_ViewCopper = (UWORD *)tmp;*/
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    4e72:	|  |  |  |  |  |  |      movea.l 852fc <custom>,a0
    4e78:	|  |  |  |  |  |  |      move.l d0,128(a0)
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    4e7c:	|  |  |  |  |  |  |      movea.l 85300 <SysBase>,a6
    4e82:	|  |  |  |  |  |  |      moveq #22,d0
    4e84:	|  |  |  |  |  |  |      move.l #65537,d1
    4e8a:	|  |  |  |  |  |  |      jsr -198(a6)
    4e8e:	|  |  |  |  |  |  |      movea.l d0,a1
    4e90:	|  |  |  |  |  |  |      move.l d0,851ea <Sw_Vbint>
    4e96:	|  |  |  |  |  |  |      lea 28(sp),sp
    4e9a:	|  |  |  |  |  |  |  /-- beq.s 4eb6 <Sw_PrepareDisplay.isra.0+0x1e2>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4e9c:	|  |  |  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    4ea2:	|  |  |  |  |  |  |  |   move.l #250132,10(a1)
    Sw_Vbint->is_Data = NULL;
    4eaa:	|  |  |  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    4eae:	|  |  |  |  |  |  |  |   move.l #5430,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    4eb6:	|  |  |  |  |  |  |  \-> movea.l 85300 <SysBase>,a6
    4ebc:	|  |  |  |  |  |  |      moveq #4,d0
    4ebe:	|  |  |  |  |  |  |      jsr -168(a6)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    4ec2:	|  |  |  |  |  |  |      move.l 851fa <Sw_ScreenBuffer1>,d0
    4ec8:	|  |  |  |  |  |  |      move.l d0,85194 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    4ece:	|  |  |  |  |  |  |      move.l 851f6 <Sw_ScreenBuffer2>,d1
    4ed4:	|  |  |  |  |  |  |      move.l d1,85198 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    4eda:	|  |  |  |  |  |  |      move.l d1,8519c <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    4ee0:	|  |  |  |  |  |  |      move.l d0,851a0 <Sw_ScreenBufferList+0xc>
  Sw_InitComplete = 1;
    4ee6:	|  |  |  |  |  |  |      move.w #1,851d2 <Sw_InitComplete>
}
    4eee:	|  |  |  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    4ef4:	|  |  |  |  |  |  |      unlk a5
    4ef6:	|  |  |  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    4ef8:	|  |  |  |  |  |  \----> clr.l -(sp)
    4efa:	|  |  |  |  |  |         clr.l -(sp)
    4efc:	|  |  |  |  |  |         pea -50(a5)
    4f00:	|  |  |  |  |  |         pea 4 <_start+0x4>
    4f04:	|  |  |  |  |  |         pea 58 <_start+0x58>
    4f08:	|  |  |  |  |  |         jsr f0ff60 <_end+0xe8ac5c>
}
    4f0e:	|  |  |  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4f12:	|  |  |  |  |  |         movea.l 85300 <SysBase>,a6
    4f18:	|  |  |  |  |  |         move.l #4000,d0
    4f1e:	|  |  |  |  |  |         moveq #2,d1
    4f20:	|  |  |  |  |  |         jsr -198(a6)
    4f24:	|  |  |  |  |  |         move.l d0,851ee <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4f2a:	|  |  |  |  |  |         pea 1 <_start+0x1>
    4f2e:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f32:	|  |  |  |  |  |         pea 3d12c <incbin_MercuryLetterData2Lz4_end+0x86>
    4f38:	|  |  |  |  |  |         move.l d0,-(sp)
    4f3a:	|  |  |  |  |  |         lea 4456 <debug_register_bitmap.constprop.0>(pc),a3
    4f3e:	|  |  |  |  |  |         jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4f40:	|  |  |  |  |  |         pea 14 <_start+0x14>
    4f44:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f48:	|  |  |  |  |  |         move.l 851ee <Sw_FontBuffer>,-(sp)
    4f4e:	|  |  |  |  |  |         lea c92 <Utils_FillLong.constprop.0>(pc),a2
    4f52:	|  |  |  |  |  |         jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4f54:	|  |  |  |  |  |         movea.l 85300 <SysBase>,a6
    4f5a:	|  |  |  |  |  |         move.l #20560,d0
    4f60:	|  |  |  |  |  |         moveq #2,d1
    4f62:	|  |  |  |  |  |         jsr -198(a6)
    4f66:	|  |  |  |  |  |         move.l d0,851f2 <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4f6c:	|  |  |  |  |  |         lea 28(sp),sp
    4f70:	|  |  |  |  |  \-------- bne.w 4dbe <Sw_PrepareDisplay.isra.0+0xea>
    4f74:	|  |  +--|--|----------- bra.w 5022 <Sw_PrepareDisplay.isra.0+0x34e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f78:	|  |  |  >--|----------> movea.l 852f4 <DOSBase>,a6
    4f7e:	|  |  |  |  |            jsr -60(a6)
    4f82:	|  |  |  |  |            movea.l 852f4 <DOSBase>,a6
    4f88:	|  |  |  |  |            move.l d0,d1
    4f8a:	|  |  |  |  |            move.l #250228,d2
    4f90:	|  |  |  |  |            moveq #38,d3
    4f92:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4f96:	|  |  |  |  |            movea.l 852f4 <DOSBase>,a6
    4f9c:	|  |  |  |  |            moveq #1,d1
    4f9e:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4fa2:	|  |  |  |  |            move.l 851fa <Sw_ScreenBuffer1>,d0
    4fa8:	|  |  |  |  +----------- bra.w 4e42 <Sw_PrepareDisplay.isra.0+0x16e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4fac:	>--|--|--|--|----------> movea.l 852f4 <DOSBase>,a6
    4fb2:	|  |  |  |  |            jsr -60(a6)
    4fb6:	|  |  |  |  |            movea.l 852f4 <DOSBase>,a6
    4fbc:	|  |  |  |  |            move.l d0,d1
    4fbe:	|  |  |  |  |            move.l #250228,d2
    4fc4:	|  |  |  |  |            moveq #38,d3
    4fc6:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4fca:	|  |  |  |  |            movea.l 852f4 <DOSBase>,a6
    4fd0:	|  |  |  |  |            moveq #1,d1
    4fd2:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4fd6:	|  |  |  |  |            move.l 851f6 <Sw_ScreenBuffer2>,d0
    4fdc:	|  |  |  |  |            pea 1 <_start+0x1>
    4fe0:	|  |  |  |  |            pea 101 <main+0x9b>
    4fe4:	|  |  |  |  |            pea 3d19b <incbin_MercuryLetterData2Lz4_end+0xf5>
    4fea:	|  |  |  |  |            move.l d0,-(sp)
    4fec:	|  |  |  |  |            jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4fee:	|  |  |  |  |            pea 14 <_start+0x14>
    4ff2:	|  |  |  |  |            pea 100 <main+0x9a>
    4ff6:	|  |  |  |  |            move.l 851f6 <Sw_ScreenBuffer2>,-(sp)
    4ffc:	|  |  |  |  |            jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4ffe:	|  |  |  |  |            movea.l 85300 <SysBase>,a6
    5004:	|  |  |  |  |            move.l #20560,d0
    500a:	|  |  |  |  |            moveq #2,d1
    500c:	|  |  |  |  |            jsr -198(a6)
    5010:	|  |  |  |  |            move.l d0,851fa <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    5016:	|  |  |  |  |            lea 28(sp),sp
    501a:	|  |  |  |  \----------- bne.w 4e42 <Sw_PrepareDisplay.isra.0+0x16e>
    501e:	|  |  |  \-------------- bra.w 4f78 <Sw_PrepareDisplay.isra.0+0x2a4>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    5022:	|  |  \----------------> movea.l 852f4 <DOSBase>,a6
    5028:	|  |                     jsr -60(a6)
    502c:	|  |                     movea.l 852f4 <DOSBase>,a6
    5032:	|  |                     move.l d0,d1
    5034:	|  |                     move.l #250171,d2
    503a:	|  |                     moveq #38,d3
    503c:	|  |                     jsr -48(a6)
    Exit(1);
    5040:	|  |                     movea.l 852f4 <DOSBase>,a6
    5046:	|  |                     moveq #1,d1
    5048:	|  |                     jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    504c:	|  |                     move.l 851f2 <Sw_ScreenBuffer3>,d0
    5052:	|  |                     pea 1 <_start+0x1>
    5056:	|  |                     pea 101 <main+0x9b>
    505a:	|  |                     pea 3d162 <incbin_MercuryLetterData2Lz4_end+0xbc>
    5060:	|  |                     move.l d0,-(sp)
    5062:	|  |                     jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    5064:	|  |                     pea 14 <_start+0x14>
    5068:	|  |                     pea 100 <main+0x9a>
    506c:	|  |                     move.l 851f2 <Sw_ScreenBuffer3>,-(sp)
    5072:	|  |                     jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5074:	|  |                     movea.l 85300 <SysBase>,a6
    507a:	|  |                     move.l #20560,d0
    5080:	|  |                     moveq #2,d1
    5082:	|  |                     jsr -198(a6)
    5086:	|  |                     move.l d0,851f6 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    508c:	|  |                     lea 28(sp),sp
    5090:	|  \-------------------- bne.w 4e00 <Sw_PrepareDisplay.isra.0+0x12c>
    5094:	\----------------------- bra.w 4fac <Sw_PrepareDisplay.isra.0+0x2d8>

00005098 <DrawScreen>:
{    
    5098:	                   lea -44(sp),sp
    509c:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    50a0:	                   movea.l 852f8 <GfxBase>,a6
    50a6:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    50aa:	                   move.w #-1,dff044 <_end+0xd79d40>
  custom->bltalwm = 0xffff; //Static
    50b2:	                   move.w #-1,dff046 <_end+0xd79d42>
  switch(Scene) {
    50ba:	                   cmpi.w #18,64ed6 <Scene>
    50c2:	         /-------- bhi.s 5136 <DrawScreen+0x9e>
    50c4:	         |         moveq #0,d0
    50c6:	         |         move.w 64ed6 <Scene>,d0
    50cc:	         |         add.l d0,d0
    50ce:	         |         move.w (50d6 <DrawScreen+0x3e>,pc,d0.l),d0
    50d2:	         |         jmp (50d6 <DrawScreen+0x3e>,pc,d0.w)
    50d6:	         |         ori.w #124,-(a0)
    50da:	         |         ([,0)andi.b #-58,([0,a6],d0.w:2,0)
    50e0:	         |         ([,1104)bchg d1,([1046,d0.w:2],1104)
    50e8:	         |         .short 0x04e0
    50ea:	         |         btst d2,(a6)+
    50ec:	         |         movep.w d2,1476(a2)
    50f0:	         |         ori.b #84,-(a6)
    50f4:	         |         ori.l #113248044,6a <main+0x4>
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    50fc:	         |         pea d0 <main+0x6a>
    5100:	         |         pea 1 <_start+0x1>
    5104:	         |         pea 2 <_start+0x2>
    5108:	         |         pea 3 <_start+0x3>
    510c:	         |         pea 6 <_start+0x6>
    5110:	         |         pea 9 <_start+0x9>
    5114:	         |         pea 441b6 <LetterMetaDataReversedAbyss>
    511a:	         |         pea 441ce <LetterMetaDataAbyss>
    5120:	         |         pea 441f2 <CubeNrReverseSizeAbyss>
    5126:	         |         jsr 493e <DrawDices>(pc)
      break;  
    512a:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    512e:	         |         cmpi.w #1,d0
    5132:	         |  /----- beq.w 52fc <DrawScreen+0x264>
}
    5136:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    513a:	         |  |      lea 44(sp),sp
    513e:	         |  |      rts
      CubeFinished = 1;
    5140:	         |  |      move.w #1,852ee <CubeFinished>
}
    5148:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    514c:	         |  |      lea 44(sp),sp
    5150:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    5152:	         |  |      pea c3 <main+0x5d>
    5156:	         |  |      pea 1 <_start+0x1>
    515a:	         |  |      pea 3 <_start+0x3>
    515e:	         |  |      pea 3 <_start+0x3>
    5162:	         |  |      pea 8 <_start+0x8>
    5166:	         |  |      pea a <_start+0xa>
    516a:	         |  |      pea 64cec <LetterMetaDataReversedSpread>
    5170:	         |  |      pea 64d0e <LetterMetaDataSpread1>
    5176:	         |  |      pea 64d34 <CubeNrReverseSizeSpread>
    517c:	         |  |      jsr 493e <DrawDices>(pc)
      break;
    5180:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    5184:	         |  |      cmpi.w #1,d0
    5188:	         +--|----- bne.s 5136 <DrawScreen+0x9e>
    518a:	         |  +----- bra.w 52fc <DrawScreen+0x264>
  ptrvector = VectorBuffer +  vectorpos;    
    518e:	         |  |      moveq #0,d0
    5190:	         |  |      move.w 8518a <vectorpos>,d0
    5196:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    5198:	         |  |      moveq #0,d1
    519a:	         |  |      move.w 85188 <VectorPosLetters>,d1
    51a0:	         |  |      add.l d1,d1
    51a2:	         |  |      addi.l #321516,d1
    51a8:	         |  |      move.l d1,85184 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    51ae:	         |  |      pea 4 <_start+0x4>
    51b2:	         |  |      clr.l -(sp)
    51b4:	         |  |      addi.l #372750,d0
    51ba:	         |  |      move.l d0,-(sp)
    51bc:	         |  |      jsr 3506 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    51c0:	         |  |      movea.l 85184 <ptrvectorletters>,a2
    51c6:	         |  |      lea 12(sp),sp
    51ca:	         |  |      moveq #4,d0
    51cc:	         |  |      move.l d0,44(sp)
    51d0:	         |  |      lea 44184 <LetterMetaDataMercury1>,a5
    51d6:	         |  |      lea 420f0 <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    51dc:	/--------|--|----> moveq #0,d0
    51de:	|        |  |      move.w (a5),d0
    51e0:	|        |  |      moveq #0,d1
    51e2:	|        |  |      move.w 2(a5),d1
    51e6:	|        |  |      movea.l d1,a0
    51e8:	|        |  |      move.l d0,d1
    51ea:	|        |  |      add.l d0,d1
    51ec:	|        |  |      add.l d1,d0
    51ee:	|        |  |      add.l d0,d0
    51f0:	|        |  |      adda.l d0,a0
    51f2:	|        |  |      move.l a0,d2
    51f4:	|        |  |      lsl.l #5,d2
    51f6:	|        |  |      movea.l d2,a0
    51f8:	|        |  |      adda.l #544368,a0
    51fe:	|        |  |      move.l 16(a0),d0
    5202:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    5206:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    520a:	|        |  |      moveq #1,d3
    520c:	|        |  |      cmp.l d0,d3
    520e:	|        |  |  /-- blt.w 583c <DrawScreen+0x7a4>
      vectors += 12*metadata[2];
    5212:	|        |  |  |   movea.w d1,a0
    5214:	|        |  |  |   move.l a0,d0
    5216:	|        |  |  |   add.l a0,d0
    5218:	|        |  |  |   add.l a0,d0
    521a:	|        |  |  |   lsl.l #3,d0
    521c:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    521e:	|        |  |  |   addq.l #3,a0
    5220:	|        |  |  |   adda.l a0,a0
    5222:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    5224:	|        |  |  |   subq.l #1,44(sp)
    5228:	+--------|--|--|-- bne.s 51dc <DrawScreen+0x144>
  CubeNrReversePos++;
    522a:	|  /-----|--|--|-> addq.w #1,44154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    5230:	|  |     |  |  |   move.w 8518a <vectorpos>,d2
    5236:	|  |     |  |  |   addi.w #96,d2
    523a:	|  |     |  |  |   move.w d2,8518a <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    5240:	|  |     |  |  |   addi.w #156,85188 <VectorPosLetters>
  SetCl( clminendpos);
    5248:	|  |     |  |  |   pea 1 <_start+0x1>
    524c:	|  |     |  |  |   jsr 15b8 <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    5250:	|  |     |  |  |   addq.l #4,sp
    5252:	|  |     |  |  |   cmpi.w #12767,d2
    5256:	|  |     +--|--|-- bls.w 5136 <DrawScreen+0x9e>
    DoNotClearDirty = 1;
    525a:	|  |     |  |  |   move.w #1,85178 <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    5262:	|  |     |  |  |   cmpi.w #12959,d2
    5266:	|  |     +--|--|-- bls.w 5136 <DrawScreen+0x9e>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    526a:	|  |     |  |  |   movea.l 85174 <ClearBuffer>,a2
    5270:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    5274:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    5278:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    527c:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    5280:	|  |     |  |  |   movea.l 85180 <DrawBuffer>,a1
    5286:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    528a:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    528e:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    5292:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    5296:	|  |     |  |  |   movea.l 85170 <ViewBuffer>,a0
    529c:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    52a0:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    52a4:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    52a8:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    52ac:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    52b0:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    52b4:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    52b8:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    52bc:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    52c0:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    52c4:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    52c8:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    52cc:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    52d0:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    52d4:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    52d8:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    52dc:	|  |     |  |  |   clr.w 85178 <DoNotClearDirty>
    CubeNrReversePos = 1;
    52e2:	|  |     |  |  |   move.w #1,44154 <CubeNrReversePos>
    vectorpos = 0;
    52ea:	|  |     |  |  |   clr.w 8518a <vectorpos>
    VectorPosLetters = 0;
    52f0:	|  |     |  |  |   clr.w 85188 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    52f6:	|  |     |  |  |   clr.w 8517a <VectorPosLettersReversed>
  if(result == 1) Scene++;
    52fc:	|  |     |  >--|-> addq.w #1,64ed6 <Scene>
}
    5302:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5306:	|  |     |  |  |   lea 44(sp),sp
    530a:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    530c:	|  |     |  |  |   pea 2bd8 <DrawRect+0x5fa>
    5310:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5316:	|  |     |  |  |   pea 200d6 <incbin_PointCubeDataLz4_start>
    531c:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5320:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    5322:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    5328:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    532e:	|  |     |  |  |   move.l d2,-(sp)
    5330:	|  |     |  |  |   pea 20042 <incbin_PointCubeData_start>
    5336:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    533a:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    533c:	|  |     |  |  |   pea 251e <SetBplPointers+0x4e>
    5340:	|  |     |  |  |   move.l d2,-(sp)
    5342:	|  |     |  |  |   pea 22d56 <incbin_PointLetterDataLz4_start>
    5348:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    534a:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    5350:	|  |     |  |  |   lea 32(sp),sp
    5354:	|  |     |  |  |   move.l #321516,(sp)
    535a:	|  |     |  |  |   move.l d2,-(sp)
    535c:	|  |     |  |  |   pea 22cc2 <incbin_PointLetterData_start>
    5362:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    5364:	|  |     |  |  |   pea 20d8 <LoadVectors+0x9c>
    5368:	|  |     |  |  |   move.l d2,-(sp)
    536a:	|  |     |  |  |   pea 25304 <incbin_PointReversedLetterDataLz4_start>
    5370:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    5372:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    5378:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    537e:	|  |     |  |  |   pea 25288 <incbin_PointReversedLetterData_start>
    5384:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    5386:	|  |     |  |  |   move.w #3,64ed6 <Scene>
    538e:	|  |     |  |  |   lea 36(sp),sp
}
    5392:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5396:	|  |     |  |  |   lea 44(sp),sp
    539a:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    539c:	|  |     |  |  |   pea d4 <main+0x6e>
    53a0:	|  |     |  |  |   pea 1 <_start+0x1>
    53a4:	|  |     |  |  |   pea 2 <_start+0x2>
    53a8:	|  |     |  |  |   pea 3 <_start+0x3>
    53ac:	|  |     |  |  |   pea 5 <_start+0x5>
    53b0:	|  |     |  |  |   pea 6 <_start+0x6>
    53b4:	|  |     |  |  |   pea 449b6 <LetterMetaDataReversedPoint>
    53ba:	|  |     |  |  |   pea 449cc <LetterMetaDataPoint>
    53c0:	|  |     |  |  |   pea 449ea <CubeNrReverseSizePoint>
    53c6:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    53ca:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    53ce:	|  |     |  |  |   cmpi.w #1,d0
    53d2:	|  |     +--|--|-- bne.w 5136 <DrawScreen+0x9e>
    53d6:	|  |     |  +--|-- bra.w 52fc <DrawScreen+0x264>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    53da:	|  |     |  |  |   pea 24cd <Clbuild+0x35d>
    53de:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    53e4:	|  |     |  |  |   pea 1aff8 <incbin_TekCubeDataLz4_start>
    53ea:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    53ee:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    53f0:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    53f6:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    53fc:	|  |     |  |  |   move.l d2,-(sp)
    53fe:	|  |     |  |  |   pea 1af64 <incbin_TekCubeData_start>
    5404:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    5408:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    540a:	|  |     |  |  |   pea 2a8f <DrawRect+0x4b1>
    540e:	|  |     |  |  |   move.l d2,-(sp)
    5410:	|  |     |  |  |   pea 1d59e <incbin_TekLetterDataLz4_start>
    5416:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    5418:	|  |     |  |  |   lea 32(sp),sp
    541c:	|  |     |  |  |   move.l #321516,(sp)
    5422:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5428:	|  |     |  |  |   pea 1d4da <incbin_TekLetterData_start>
    542e:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    5430:	|  |     |  |  |   move.w #5,64ed6 <Scene>
    5438:	|  |     |  |  |   lea 12(sp),sp
}
    543c:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5440:	|  |     |  |  |   lea 44(sp),sp
    5444:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    5446:	|  |     |  |  |   pea 98 <main+0x32>
    544a:	|  |     |  |  |   pea 1 <_start+0x1>
    544e:	|  |     |  |  |   clr.l -(sp)
    5450:	|  |     |  |  |   pea 3 <_start+0x3>
    5454:	|  |     |  |  |   clr.l -(sp)
    5456:	|  |     |  |  |   pea 8 <_start+0x8>
    545a:	|  |     |  |  |   pea 4478c <LetterMetaDataTek>
    5460:	|  |     |  |  |   pea 4478c <LetterMetaDataTek>
    5466:	|  |     |  |  |   pea 447ae <CubeNrReverseSizeTek>
    546c:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    5470:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5474:	|  |     |  |  |   cmpi.w #1,d0
    5478:	|  |     +--|--|-- bne.w 5136 <DrawScreen+0x9e>
    547c:	|  |     |  +--|-- bra.w 52fc <DrawScreen+0x264>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    5480:	|  |     |  |  |   pea 2be6 <DrawRect+0x608>
    5484:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    548a:	|  |     |  |  |   pea 274b4 <incbin_FlexCubeDataLz4_start>
    5490:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5494:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    5496:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    549c:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    54a2:	|  |     |  |  |   move.l d2,-(sp)
    54a4:	|  |     |  |  |   pea 273f0 <incbin_FlexCubeData_start>
    54aa:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    54ae:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    54b0:	|  |     |  |  |   pea 30a1 <DrawRect+0xac3>
    54b4:	|  |     |  |  |   move.l d2,-(sp)
    54b6:	|  |     |  |  |   pea 2a1a2 <incbin_FlexLetterDataLz4_start>
    54bc:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    54be:	|  |     |  |  |   lea 32(sp),sp
    54c2:	|  |     |  |  |   move.l #321516,(sp)
    54c8:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    54ce:	|  |     |  |  |   pea 2a0ae <incbin_FlexLetterData_start>
    54d4:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    54d6:	|  |     |  |  |   move.w #7,64ed6 <Scene>
    54de:	|  |     |  |  |   lea 12(sp),sp
}
    54e2:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    54e6:	|  |     |  |  |   lea 44(sp),sp
    54ea:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    54ec:	|  |     |  |  |   pea af <main+0x49>
    54f0:	|  |     |  |  |   pea 1 <_start+0x1>
    54f4:	|  |     |  |  |   clr.l -(sp)
    54f6:	|  |     |  |  |   pea 4 <_start+0x4>
    54fa:	|  |     |  |  |   clr.l -(sp)
    54fc:	|  |     |  |  |   pea a <_start+0xa>
    5500:	|  |     |  |  |   pea 44760 <LetterMetaDataFlex>
    5506:	|  |     |  |  |   pea 44760 <LetterMetaDataFlex>
    550c:	|  |     |  |  |   pea 64d34 <CubeNrReverseSizeSpread>
    5512:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    5516:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    551a:	|  |     |  |  |   cmpi.w #1,d0
    551e:	|  |     +--|--|-- bne.w 5136 <DrawScreen+0x9e>
    5522:	|  |     |  +--|-- bra.w 52fc <DrawScreen+0x264>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    5526:	|  |     |  |  |   pea 23ad <Clbuild+0x23d>
    552a:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5530:	|  |     |  |  |   pea 2d2ec <incbin_DesireCubeDataLz4_start>
    5536:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    553a:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    553c:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    5542:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    5548:	|  |     |  |  |   move.l d2,-(sp)
    554a:	|  |     |  |  |   pea 2d258 <incbin_DesireCubeData_start>
    5550:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    5554:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    5556:	|  |     |  |  |   pea 286a <DrawRect+0x28c>
    555a:	|  |     |  |  |   move.l d2,-(sp)
    555c:	|  |     |  |  |   pea 2f772 <incbin_DesireLetterDataLz4_start>
    5562:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    5564:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    556a:	|  |     |  |  |   lea 32(sp),sp
    556e:	|  |     |  |  |   move.l #321516,(sp)
    5574:	|  |     |  |  |   move.l d2,-(sp)
    5576:	|  |     |  |  |   pea 2f6ae <incbin_DesireLetterData_start>
    557c:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    557e:	|  |     |  |  |   pea 27ff <DrawRect+0x221>
    5582:	|  |     |  |  |   move.l d2,-(sp)
    5584:	|  |     |  |  |   pea 320b4 <incbin_DesireReversedLetterDataLz4_start>
    558a:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    558c:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    5592:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5598:	|  |     |  |  |   pea 31ff0 <incbin_DesireReversedLetterData_start>
    559e:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    55a0:	|  |     |  |  |   move.w #9,64ed6 <Scene>
    55a8:	|  |     |  |  |   lea 36(sp),sp
}
    55ac:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    55b0:	|  |     |  |  |   lea 44(sp),sp
    55b4:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    55b6:	|  |     |  |  |   pea af <main+0x49>
    55ba:	|  |     |  |  |   pea 1 <_start+0x1>
    55be:	|  |     |  |  |   pea 3 <_start+0x3>
    55c2:	|  |     |  |  |   pea 3 <_start+0x3>
    55c6:	|  |     |  |  |   pea 8 <_start+0x8>
    55ca:	|  |     |  |  |   pea 8 <_start+0x8>
    55ce:	|  |     |  |  |   pea 4457a <LetterMetaDataReversedDesire>
    55d4:	|  |     |  |  |   pea 4459c <LetterMetaDataDesire>
    55da:	|  |     |  |  |   pea 445be <CubeNrReverseSizeDesire>
    55e0:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    55e4:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    55e8:	|  |     |  |  |   cmpi.w #1,d0
    55ec:	|  |     +--|--|-- bne.w 5136 <DrawScreen+0x9e>
    55f0:	|  |     |  +--|-- bra.w 52fc <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    55f4:	|  |     |  |  |   pea 24f2 <SetBplPointers+0x22>
    55f8:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    55fe:	|  |     |  |  |   pea 15d2a <incbin_AtwCubeDataLz4_start>
    5604:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    5608:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    560a:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    5610:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    5616:	|  |     |  |  |   move.l d2,-(sp)
    5618:	|  |     |  |  |   pea 15c96 <incbin_AtwCubeData_start>
    561e:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    5622:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    5624:	|  |     |  |  |   pea 2c5b <DrawRect+0x67d>
    5628:	|  |     |  |  |   move.l d2,-(sp)
    562a:	|  |     |  |  |   pea 182f4 <incbin_AtwLetterDataLz4_start>
    5630:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    5632:	|  |     |  |  |   lea 32(sp),sp
    5636:	|  |     |  |  |   move.l #321516,(sp)
    563c:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5642:	|  |     |  |  |   pea 18230 <incbin_AtwLetterData_start>
    5648:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    564a:	|  |     |  |  |   move.w #11,64ed6 <Scene>
    5652:	|  |     |  |  |   lea 12(sp),sp
}
    5656:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    565a:	|  |     |  |  |   lea 44(sp),sp
    565e:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    5660:	|  |     |  |  |   pea c8 <main+0x62>
    5664:	|  |     |  |  |   pea 1 <_start+0x1>
    5668:	|  |     |  |  |   clr.l -(sp)
    566a:	|  |     |  |  |   pea 3 <_start+0x3>
    566e:	|  |     |  |  |   clr.l -(sp)
    5670:	|  |     |  |  |   pea 8 <_start+0x8>
    5674:	|  |     |  |  |   pea 44394 <LetterMetaDataReversedAtw>
    567a:	|  |     |  |  |   pea 443b6 <LetterMetaDataAtw>
    5680:	|  |     |  |  |   pea 443d8 <CubeNrReverseAtw>
    5686:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    568a:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    568e:	|  |     |  |  |   cmpi.w #1,d0
    5692:	|  |     +--|--|-- bne.w 5136 <DrawScreen+0x9e>
    5696:	|  |     |  +--|-- bra.w 52fc <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    569a:	|  |     |  |  |   pea 28fa <DrawRect+0x31c>
    569e:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    56a4:	|  |     |  |  |   pea de52 <incbin_AbyssCubeDataLz4_start>
    56aa:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    56ae:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    56b0:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    56b6:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    56bc:	|  |     |  |  |   move.l d2,-(sp)
    56be:	|  |     |  |  |   pea ddbe <incbin_AbyssCubeData_start>
    56c4:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    56c8:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    56ca:	|  |     |  |  |   pea 30ff <DrawRect+0xb21>
    56ce:	|  |     |  |  |   move.l d2,-(sp)
    56d0:	|  |     |  |  |   pea 1083c <incbin_AbyssLetterDataLz4_start>
    56d6:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    56d8:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    56de:	|  |     |  |  |   lea 32(sp),sp
    56e2:	|  |     |  |  |   move.l #321516,(sp)
    56e8:	|  |     |  |  |   move.l d2,-(sp)
    56ea:	|  |     |  |  |   pea 10760 <incbin_AbyssLetterData_start>
    56f0:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    56f2:	|  |     |  |  |   pea 229d <Clbuild+0x12d>
    56f6:	|  |     |  |  |   move.l d2,-(sp)
    56f8:	|  |     |  |  |   pea 139e4 <incbin_AbyssReversedLetterDataLz4_start>
    56fe:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    5700:	|  |     |  |  |   pea 44bec <LetterBuffer2>
    5706:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    570c:	|  |     |  |  |   pea 13950 <incbin_AbyssReversedLetterData_start>
    5712:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    5714:	|  |     |  |  |   move.w #13,64ed6 <Scene>
    571c:	|  |     |  |  |   lea 36(sp),sp
}
    5720:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5724:	|  |     |  |  |   lea 44(sp),sp
    5728:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    572a:	|  |     |  |  |   pea 2003 <SetCl+0xa4b>
    572e:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5734:	|  |     |  |  |   pea 3498c <incbin_MercuryCubeData1Lz4_start>
    573a:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    573e:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    5740:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    5746:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    574c:	|  |     |  |  |   move.l d2,-(sp)
    574e:	|  |     |  |  |   pea 348c8 <incbin_MercuryCubeData1_start>
    5754:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    5758:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    575a:	|  |     |  |  |   pea 2b27 <DrawRect+0x549>
    575e:	|  |     |  |  |   move.l d2,-(sp)
    5760:	|  |     |  |  |   pea 36ae0 <incbin_MercuryLetterData1Lz4_start>
    5766:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    5768:	|  |     |  |  |   lea 32(sp),sp
    576c:	|  |     |  |  |   move.l #321516,(sp)
    5772:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    5778:	|  |     |  |  |   pea 369a4 <incbin_MercuryLetterData1_start>
    577e:	|  |     |  |  |   jsr (a2)
      Scene = 15;
    5780:	|  |     |  |  |   move.w #15,64ed6 <Scene>
    5788:	|  |     |  |  |   lea 12(sp),sp
}
    578c:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5790:	|  |     |  |  |   lea 44(sp),sp
    5794:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    5796:	|  |     |  |  |   pea 1928 <SetCl+0x370>
    579a:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    57a0:	|  |     |  |  |   pea 396e0 <incbin_MercuryCubeData2Lz4_start>
    57a6:	|  |     |  |  |   lea bd4 <Utils_Lz4DepackAsm>(pc),a3
    57aa:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    57ac:	|  |     |  |  |   move.l 852ea <WorkingMem>,d2
    57b2:	|  |     |  |  |   pea 5b00e <VectorBuffer>
    57b8:	|  |     |  |  |   move.l d2,-(sp)
    57ba:	|  |     |  |  |   pea 3961c <incbin_MercuryCubeData2_start>
    57c0:	|  |     |  |  |   lea 203c <LoadVectors>(pc),a2
    57c4:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    57c6:	|  |     |  |  |   pea 1f6b <SetCl+0x9b3>
    57ca:	|  |     |  |  |   move.l d2,-(sp)
    57cc:	|  |     |  |  |   pea 3b128 <incbin_MercuryLetterData2Lz4_start>
    57d2:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    57d4:	|  |     |  |  |   lea 32(sp),sp
    57d8:	|  |     |  |  |   move.l #321516,(sp)
    57de:	|  |     |  |  |   move.l 852ea <WorkingMem>,-(sp)
    57e4:	|  |     |  |  |   pea 3b01c <incbin_MercuryLetterData2_start>
    57ea:	|  |     |  |  |   jsr (a2)
      Scene = 17;
    57ec:	|  |     |  |  |   move.w #17,64ed6 <Scene>
    57f4:	|  |     |  |  |   lea 12(sp),sp
}
    57f8:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    57fc:	|  |     |  |  |   lea 44(sp),sp
    5800:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    5802:	|  |     |  |  |   pea 84 <main+0x1e>
    5806:	|  |     |  |  |   pea 6e <main+0x8>
    580a:	|  |     |  |  |   clr.l -(sp)
    580c:	|  |     |  |  |   pea 4 <_start+0x4>
    5810:	|  |     |  |  |   clr.l -(sp)
    5812:	|  |     |  |  |   pea b <_start+0xb>
    5816:	|  |     |  |  |   pea 44156 <LetterMetaDataMercury2>
    581c:	|  |     |  |  |   pea 44156 <LetterMetaDataMercury2>
    5822:	|  |     |  |  |   pea 443d8 <CubeNrReverseAtw>
    5828:	|  |     |  |  |   jsr 493e <DrawDices>(pc)
      break;
    582c:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5830:	|  |     |  |  |   cmpi.w #1,d0
    5834:	|  |     \--|--|-- bne.w 5136 <DrawScreen+0x9e>
    5838:	|  |        \--|-- bra.w 52fc <DrawScreen+0x264>
      for(int i=0;i<metadata[2];i++)
    583c:	|  |           \-> tst.w d1
    583e:	|  |  /----------- ble.w 59b4 <DrawScreen+0x91c>
    5842:	|  |  |            lea 6(a5),a6
    5846:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    5848:	|  |  |            lea 20(a0),a0
    584c:	|  |  |            move.l a0,52(sp)
    5850:	|  |  |            move.l a5,48(sp)
    5854:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    5856:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    585a:	|  |  |  |         movea.w 4(a2),a0
    585e:	|  |  |  |         move.l a0,d0
    5860:	|  |  |  |         subq.l #1,d0
    5862:	|  |  |  |         add.l d0,d0
    5864:	|  |  |  |         move.w (0,a4,d0.l),d0
    5868:	|  |  |  |         move.w d0,d1
    586a:	|  |  |  |         muls.w (a2),d1
    586c:	|  |  |  |         moveq #15,d4
    586e:	|  |  |  |         asr.l d4,d1
    5870:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    5874:	|  |  |  |         muls.w 2(a2),d0
    5878:	|  |  |  |         asr.l d4,d0
    587a:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    587e:	|  |  |  |         movea.w 10(a2),a0
    5882:	|  |  |  |         subq.l #1,a0
    5884:	|  |  |  |         adda.l a0,a0
    5886:	|  |  |  |         move.w (0,a4,a0.l),d2
    588a:	|  |  |  |         move.w d2,d7
    588c:	|  |  |  |         muls.w 6(a2),d7
    5890:	|  |  |  |         asr.l d4,d7
    5892:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    5896:	|  |  |  |         muls.w 8(a2),d2
    589a:	|  |  |  |         asr.l d4,d2
    589c:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    58a0:	|  |  |  |         movea.w 16(a2),a0
    58a4:	|  |  |  |         subq.l #1,a0
    58a6:	|  |  |  |         adda.l a0,a0
    58a8:	|  |  |  |         move.w (0,a4,a0.l),d3
    58ac:	|  |  |  |         move.w d3,d6
    58ae:	|  |  |  |         muls.w 12(a2),d6
    58b2:	|  |  |  |         asr.l d4,d6
    58b4:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    58b8:	|  |  |  |         muls.w 14(a2),d3
    58bc:	|  |  |  |         asr.l d4,d3
    58be:	|  |  |  |         movea.w d3,a1
    58c0:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    58c4:	|  |  |  |         movea.w 22(a2),a0
    58c8:	|  |  |  |         subq.l #1,a0
    58ca:	|  |  |  |         adda.l a0,a0
    58cc:	|  |  |  |         move.w (0,a4,a0.l),d3
    58d0:	|  |  |  |         move.w d3,d5
    58d2:	|  |  |  |         muls.w 18(a2),d5
    58d6:	|  |  |  |         asr.l d4,d5
    58d8:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    58dc:	|  |  |  |         muls.w 20(a2),d3
    58e0:	|  |  |  |         asr.l d4,d3
    58e2:	|  |  |  |         movea.w d3,a0
    58e4:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    58e8:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    58ec:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    58f0:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    58f4:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    58f8:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    58fc:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    5900:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    5904:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    5908:	|  |  |  |         move.w d1,d4
    590a:	|  |  |  |         cmp.w d1,d7
    590c:	|  |  |  |     /-- bge.s 5910 <DrawScreen+0x878>
    590e:	|  |  |  |     |   move.w d7,d4
    5910:	|  |  |  |     \-> cmp.w d4,d6
    5912:	|  |  |  |     /-- bge.s 5916 <DrawScreen+0x87e>
    5914:	|  |  |  |     |   move.w d6,d4
    5916:	|  |  |  |     \-> cmp.w d4,d5
    5918:	|  |  |  |     /-- bge.s 591c <DrawScreen+0x884>
    591a:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    591c:	|  |  |  |     \-> move.w d0,d3
    591e:	|  |  |  |         cmp.w d0,d2
    5920:	|  |  |  |     /-- bge.s 5924 <DrawScreen+0x88c>
    5922:	|  |  |  |     |   move.w d2,d3
    5924:	|  |  |  |     \-> cmp.w a1,d3
    5926:	|  |  |  |     /-- ble.s 592a <DrawScreen+0x892>
    5928:	|  |  |  |     |   move.w a1,d3
    592a:	|  |  |  |     \-> cmp.w a0,d3
    592c:	|  |  |  |     /-- ble.s 5930 <DrawScreen+0x898>
    592e:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    5930:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    5934:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    5938:	|  |  |  |         cmp.w d0,d2
    593a:	|  |  |  |     /-- ble.s 593e <DrawScreen+0x8a6>
    593c:	|  |  |  |     |   move.w d2,d0
    593e:	|  |  |  |     \-> cmp.w a1,d0
    5940:	|  |  |  |     /-- bge.s 5944 <DrawScreen+0x8ac>
    5942:	|  |  |  |     |   move.w a1,d0
    5944:	|  |  |  |     \-> cmp.w a0,d0
    5946:	|  |  |  |     /-- bge.s 594a <DrawScreen+0x8b2>
    5948:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    594a:	|  |  |  |     \-> addq.w #1,d0
    594c:	|  |  |  |         sub.w d3,d0
    594e:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5952:	|  |  |  |         cmpi.w #1,d0
    5956:	|  |  |  |  /----- ble.s 5990 <DrawScreen+0x8f8>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    5958:	|  |  |  |  |      cmp.w d1,d7
    595a:	|  |  |  |  |  /-- ble.s 595e <DrawScreen+0x8c6>
    595c:	|  |  |  |  |  |   move.w d7,d1
    595e:	|  |  |  |  |  \-> cmp.w d1,d6
    5960:	|  |  |  |  |  /-- ble.s 5964 <DrawScreen+0x8cc>
    5962:	|  |  |  |  |  |   move.w d6,d1
    5964:	|  |  |  |  |  \-> cmp.w d1,d5
    5966:	|  |  |  |  |  /-- ble.s 596a <DrawScreen+0x8d2>
    5968:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    596a:	|  |  |  |  |  \-> sub.w d4,d1
    596c:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    5970:	|  |  |  |  |      cmpi.w #1,d1
    5974:	|  |  |  |  +----- ble.s 5990 <DrawScreen+0x8f8>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    5976:	|  |  |  |  |      movea.l 52(sp),a0
    597a:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    597e:	|  |  |  |  |      pea 56(sp)
    5982:	|  |  |  |  |      jsr 25de <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    5986:	|  |  |  |  |      movea.l 52(sp),a0
    598a:	|  |  |  |  |      movea.w 4(a0),a5
    598e:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    5990:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    5994:	|  |  |  |         addq.l #1,a3
    5996:	|  |  |  |         movea.w a5,a0
    5998:	|  |  |  |         cmpa.l a3,a0
    599a:	|  |  |  \-------- bgt.w 5856 <DrawScreen+0x7be>
    599e:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    59a2:	|  |  |            addq.l #3,a0
    59a4:	|  |  |            adda.l a0,a0
    59a6:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    59a8:	|  |  |            subq.l #1,44(sp)
    59ac:	+--|--|----------- bne.w 51dc <DrawScreen+0x144>
    59b0:	|  +--|----------- bra.w 522a <DrawScreen+0x192>
    metadata += 3 + metadata[2];    
    59b4:	|  |  \----------> movea.w d1,a0
    59b6:	|  |               addq.l #3,a0
    59b8:	|  |               adda.l a0,a0
    59ba:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    59bc:	|  |               subq.l #1,44(sp)
    59c0:	\--|-------------- bne.w 51dc <DrawScreen+0x144>
    59c4:	   \-------------- bra.w 522a <DrawScreen+0x192>

000059c8 <strlen>:
	while(*s++)
    59c8:	   /-> movea.l 4(sp),a0
    59cc:	   |   tst.b (a0)+
    59ce:	/--|-- beq.s 59dc <strlen+0x14>
    59d0:	|  |   move.l a0,-(sp)
    59d2:	|  \-- jsr 59c8 <strlen>(pc)
    59d6:	|      addq.l #4,sp
    59d8:	|      addq.l #1,d0
}
    59da:	|      rts
	unsigned long t=0;
    59dc:	\----> moveq #0,d0
}
    59de:	       rts

000059e0 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    59e0:	       move.l d2,-(sp)
    59e2:	       move.l 8(sp),d0
	while(len-- > 0)
    59e6:	       tst.l 16(sp)
    59ea:	/----- beq.s 59fe <memset+0x1e>
		*ptr++ = val;
    59ec:	|      move.b 15(sp),d2
    59f0:	|      move.l 16(sp),d1
    59f4:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    59f6:	|      movea.l d0,a0
		*ptr++ = val;
    59f8:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    59fa:	|  |   cmpa.l d1,a0
    59fc:	|  \-- bne.s 59f8 <memset+0x18>
}
    59fe:	\----> move.l (sp)+,d2
    5a00:	       rts

00005a02 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5a02:	       move.l 4(sp),d0
    5a06:	       movea.l 8(sp),a0
	while(len--)
    5a0a:	       tst.l 12(sp)
    5a0e:	/----- beq.s 5a1e <memcpy+0x1c>
    5a10:	|      movea.l d0,a1
    5a12:	|      move.l 12(sp),d1
    5a16:	|      add.l a0,d1
		*d++ = *s++;
    5a18:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    5a1a:	|  |   cmp.l a0,d1
    5a1c:	|  \-- bne.s 5a18 <memcpy+0x16>
}
    5a1e:	\----> rts

00005a20 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5a20:	          move.l d2,-(sp)
    5a22:	          move.l 8(sp),d0
    5a26:	          movea.l 12(sp),a0
    5a2a:	          move.l 16(sp),d2
	if (d < s) {
    5a2e:	          cmpa.l d0,a0
    5a30:	   /----- bls.s 5a46 <memmove+0x26>
		while (len--)
    5a32:	   |      tst.l d2
    5a34:	/--|----- beq.s 5a42 <memmove+0x22>
    5a36:	|  |      movea.l d0,a1
    5a38:	|  |      move.l a0,d1
    5a3a:	|  |      add.l d2,d1
			*d++ = *s++;
    5a3c:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    5a3e:	|  |  |   cmp.l a0,d1
    5a40:	|  |  \-- bne.s 5a3c <memmove+0x1c>
}
    5a42:	>--|----> move.l (sp)+,d2
    5a44:	|  |      rts
		while (len--)
    5a46:	|  \----> movea.l d2,a1
    5a48:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5a4a:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    5a4c:	|         adda.l d0,a1
		while (len--)
    5a4e:	|         tst.l d2
    5a50:	+-------- beq.s 5a42 <memmove+0x22>
    5a52:	|         move.l a0,d1
    5a54:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    5a56:	|     /-> move.b (a0),(a1)
		while (len--)
    5a58:	|     |   subq.l #1,a0
    5a5a:	|     |   subq.l #1,a1
    5a5c:	|     |   cmpa.l d1,a0
    5a5e:	+-----|-- beq.s 5a42 <memmove+0x22>
			*lastd-- = *lasts--;
    5a60:	|     |   move.b (a0),(a1)
		while (len--)
    5a62:	|     |   subq.l #1,a0
    5a64:	|     |   subq.l #1,a1
    5a66:	|     |   cmpa.l d1,a0
    5a68:	|     \-- bne.s 5a56 <memmove+0x36>
    5a6a:	\-------- bra.s 5a42 <memmove+0x22>

00005a6c <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    5a6c:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    5a70:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a74:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    5a78:	mulu.w 8(sp),d1
	addw	d1, d0
    5a7c:	add.w d1,d0
	swap	d0
    5a7e:	swap d0
	clrw	d0
    5a80:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a82:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    5a86:	mulu.w 10(sp),d1
	addl	d1, d0
    5a8a:	add.l d1,d0
	rts
    5a8c:	rts

00005a8e <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    5a8e:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    5a90:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    5a94:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    5a98:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    5a9e:	   /-- bcc.s 5ab6 <__udivsi3+0x28>
	movel	d0, d2
    5aa0:	   |   move.l d0,d2
	clrw	d2
    5aa2:	   |   clr.w d2
	swap	d2
    5aa4:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    5aa6:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    5aa8:	   |   move.w d2,d0
	swap	d0
    5aaa:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    5aac:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    5ab0:	   |   divu.w d1,d2
	movew	d2, d0
    5ab2:	   |   move.w d2,d0
	jra	6f
    5ab4:	/--|-- bra.s 5ae6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    5ab6:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    5ab8:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    5aba:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    5abc:	|  |   cmpi.l #65536,d1
	jcc	4b
    5ac2:	|  \-- bcc.s 5ab8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    5ac4:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    5ac6:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    5acc:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    5ace:	|      mulu.w d0,d1
	swap	d2
    5ad0:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    5ad2:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    5ad4:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    5ad6:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    5ad8:	|  /-- bne.s 5ae4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    5ada:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    5adc:	|  +-- bcs.s 5ae4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    5ade:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    5ae2:	+--|-- bls.s 5ae6 <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    5ae4:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    5ae6:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5ae8:	       rts

00005aea <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    5aea:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    5aec:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    5aee:	    move.l 12(sp),d1
	jpl	1f
    5af2:	/-- bpl.s 5af8 <__divsi3+0xe>
	negl	d1
    5af4:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5af6:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5af8:	\-> move.l 8(sp),d0
	jpl	2f
    5afc:	/-- bpl.s 5b02 <__divsi3+0x18>
	negl	d0
    5afe:	|   neg.l d0
	negb	d2
    5b00:	|   neg.b d2

2:	movel	d1, sp@-
    5b02:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b04:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5b06:	    bsr.s 5a8e <__udivsi3>
	addql	#8, sp
    5b08:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    5b0a:	    tst.b d2
	jpl	3f
    5b0c:	/-- bpl.s 5b10 <__divsi3+0x26>
	negl	d0
    5b0e:	|   neg.l d0

3:	movel	sp@+, d2
    5b10:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5b12:	    rts

00005b14 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5b14:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5b18:	move.l 4(sp),d0
	movel	d1, sp@-
    5b1c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b1e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5b20:	bsr.s 5aea <__divsi3>
	addql	#8, sp
    5b22:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b24:	move.l 8(sp),d1
	movel	d1, sp@-
    5b28:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b2a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b2c:	bsr.w 5a6c <__mulsi3>
	addql	#8, sp
    5b30:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b32:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b36:	sub.l d0,d1
	movel	d1, d0
    5b38:	move.l d1,d0
	rts
    5b3a:	rts

00005b3c <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5b3c:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5b40:	move.l 4(sp),d0
	movel	d1, sp@-
    5b44:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b46:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5b48:	bsr.w 5a8e <__udivsi3>
	addql	#8, sp
    5b4c:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b4e:	move.l 8(sp),d1
	movel	d1, sp@-
    5b52:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b54:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b56:	bsr.w 5a6c <__mulsi3>
	addql	#8, sp
    5b5a:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b5c:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b60:	sub.l d0,d1
	movel	d1, d0
    5b62:	move.l d1,d0
	rts
    5b64:	rts

00005b66 <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    5b66:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    5b68:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    5b6c:	jsr -516(a6)
    move.l (sp)+, a6
    5b70:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    5b72:	rts

00005b74 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    5b74:	move.b d0,(a3)+
	rts
    5b76:	rts

00005b78 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    5b78:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    5b7a:	                         adda.l a0,a2
	move.l	a2,a3
    5b7c:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    5b7e:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    5b80:	                         moveq #56,d4
	moveq	#8,d5
    5b82:	                         moveq #8,d5
	bra.s	.Lliteral
    5b84:	   /-------------------- bra.s 5bee <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    5b86:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    5b88:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    5b8a:	+--|-------------------- dbf d1,5b86 <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    5b8e:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    5b90:	|  |     /-------------- bcc.s 5b94 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    5b92:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    5b94:	|  |  |  >-------------> tst.w d0
    5b96:	|  |  |  |           /-- bne.s 5ba0 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    5b98:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    5b9a:	|  |  |  |           |   bls.s 5c12 <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    5b9c:	|  |  |  |           |   move.w (a0)+,d0
    5b9e:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    5ba0:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    5ba2:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    5ba4:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    5ba6:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    5ba8:	|  |  |  |               movem.w (5c0c <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    5bae:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    5bb0:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    5bb2:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    5bb4:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    5bb6:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    5bb8:	|  |  |  |               tst.w d0
    5bba:	|  |  |  |           /-- bne.s 5bc0 <_doynaxdepack_asm+0x48>
    5bbc:	|  |  |  |           |   move.w (a0)+,d0
    5bbe:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5bc0:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5bc2:	|  |  |  |  /----------- beq.s 5bda <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5bc4:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5bc6:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5bc8:	|  |  |  |  |  /-------- bpl.s 5bd6 <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    5bca:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    5bcc:	|  |  |  |  |  |  /----- bpl.s 5bd4 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    5bce:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5bd0:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5bd2:	|  |  |  |  |  |  |  \-- bmi.s 5bce <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5bd4:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5bd6:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5bd8:	|  |  |  |  |        /-- bcc.s 5bdc <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    5bda:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    5bdc:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    5bde:	|  |  |  |  \----------- dbf d1,5bda <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5be2:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5be4:	|  |  |  \-------------- bcc.s 5b94 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5be6:	|  |  |                  tst.w d0
    5be8:	|  +--|----------------- bne.s 5bee <_doynaxdepack_asm+0x76>
    5bea:	|  |  |                  move.w (a0)+,d0
    5bec:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    5bee:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5bf0:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5bf2:	|     \----------------- bcc.s 5b92 <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5bf4:	|                 /----- bpl.s 5bfc <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5bf6:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5bf8:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    5bfa:	|                 |  \-- bmi.s 5bf6 <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    5bfc:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    5bfe:	\--------------------/-X dbv.s d1,5b86 <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5c02:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5c04:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5c06:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5c08:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    5c0a:	                     \-- bra.s 5bfe <_doynaxdepack_asm+0x86>

00005c0c <doy_table>:
    5c0c:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    5c1c:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    5c2c:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    5c3c:	.............oNq

00005c4c <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    5c4c:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    5c50:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    5c52:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    5c56:	cmpi.w #0,d2
    bgt.s br1
    5c5a:	bgt.s 5c66 <br1>
    |{
    |direction = -64;  
    neg.w d7    
    5c5c:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    5c5e:	addq.w #1,d2
    lsl.l   #6,d2
    5c60:	lsl.l #6,d2
    sub.w   d2,d1
    5c62:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    5c64:	neg.w d2

00005c66 <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    5c66:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    5c68:	lsl.w #3,d6
    sub.w d6,d0
    5c6a:	sub.w d6,d0
    mulu.w #1200,d6
    5c6c:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    5c70:	move.w d2,d0
    subq.w #1,d0
    5c72:	subq.w #1,d0
    mulu.w #100,d0
    5c74:	mulu.w #100,d0
    subq.w #1,d3
    5c78:	subq.w #1,d3
    add.w d3,d0
    5c7a:	add.w d3,d0
    add.w d0,a0
    5c7c:	adda.w d0,a0
    move.w (a0),d0
    5c7e:	move.w (a0),d0
    sub.w  d5,d0
    5c80:	sub.w d5,d0
    sub.w  d5,d0
    5c82:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    5c84:	sub.w d5,d7
    sub.w d5,d7
    5c86:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    5c88:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    5c8a:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    5c8c:	lsl.w #6,d2
    add.w d5,d2
    5c8e:	add.w d5,d2
    lea   0xdff000,a3
    5c90:	lea dff000 <_end+0xd79cfc>,a3
    tst.w 0x2(a3)
    5c96:	tst.w 2(a3)

00005c9a <waitblit>:
waitblit:
    btst #6,2(a3)
    5c9a:	/-> btst #6,2(a3)
    bne.s waitblit
    5ca0:	\-- bne.s 5c9a <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    5ca2:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    5ca6:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    5caa:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    5cae:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    5cb2:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    5cb6:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    5cba:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    5cbe:	    movem.l (sp)+,d0-a3
    rts
    5cc2:	    rts

00005cc4 <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    5cc4:	lea 5cc4 <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    5cc8:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    5ccc:	adda.l a1,a1
    add.l #zmult,a1
    5cce:	adda.l #23748,a1

00005cd4 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5cd4:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5cd8:	moveq #0,d1
			moveq	#0,d2
    5cda:	moveq #0,d2
			moveq	#0,d3
    5cdc:	moveq #0,d3
			moveq	#16,d7
    5cde:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5ce0:	lea 695e <lz4jmp>(pc),a3
		moveq	#0,d0
    5ce4:	moveq #0,d0
		move.b	(a0)+,d0
    5ce6:	move.b (a0)+,d0
		add.w	d0,d0
    5ce8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5cea:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5cee:	jmp (0,a3,d0.w)

00005cf2 <lz4Rts0>:
lz4Rts0:	rts
    5cf2:	rts

00005cf4 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    5cf4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cfa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d0e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d10:	cmpa.l a0,a4
		beq.s	lz4Rts1
    5d12:	beq.s 5d36 <lz4Rts1>
		move.b	(a0)+,d0
    5d14:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d16:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d18:	move.w (sp)+,d3
		move.b	d0,d3
    5d1a:	move.b d0,d3
		move.l	a1,a2
    5d1c:	movea.l a1,a2
		sub.l	d3,a2
    5d1e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d26:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d28:	moveq #0,d0
		move.b	(a0)+,d0
    5d2a:	move.b (a0)+,d0
		add.w	d0,d0
    5d2c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d2e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d32:	jmp (0,a3,d0.w)

00005d36 <lz4Rts1>:
lz4Rts1:	rts
    5d36:	rts

00005d38 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    5d38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d52:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d54:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5d56:	beq.s 5d7c <lz4Rts2>
		move.b	(a0)+,d0
    5d58:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d5a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d5c:	move.w (sp)+,d3
		move.b	d0,d3
    5d5e:	move.b d0,d3
		move.l	a1,a2
    5d60:	movea.l a1,a2
		sub.l	d3,a2
    5d62:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d6c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d6e:	moveq #0,d0
		move.b	(a0)+,d0
    5d70:	move.b (a0)+,d0
		add.w	d0,d0
    5d72:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d74:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d78:	jmp (0,a3,d0.w)

00005d7c <lz4Rts2>:
lz4Rts2:	rts
    5d7c:	rts

00005d7e <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    5d7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d82:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d98:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d9a:	cmpa.l a0,a4
		beq.s	lz4Rts3
    5d9c:	beq.s 5dc4 <lz4Rts3>
		move.b	(a0)+,d0
    5d9e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5da0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5da2:	move.w (sp)+,d3
		move.b	d0,d3
    5da4:	move.b d0,d3
		move.l	a1,a2
    5da6:	movea.l a1,a2
		sub.l	d3,a2
    5da8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5daa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5db0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5db2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5db4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5db6:	moveq #0,d0
		move.b	(a0)+,d0
    5db8:	move.b (a0)+,d0
		add.w	d0,d0
    5dba:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5dbc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5dc0:	jmp (0,a3,d0.w)

00005dc4 <lz4Rts3>:
lz4Rts3:	rts
    5dc4:	rts

00005dc6 <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    5dc6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dd2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dd4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dd6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dd8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ddc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5de0:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5de2:	cmpa.l a0,a4
		beq.s	lz4Rts4
    5de4:	beq.s 5e0e <lz4Rts4>
		move.b	(a0)+,d0
    5de6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5de8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5dea:	move.w (sp)+,d3
		move.b	d0,d3
    5dec:	move.b d0,d3
		move.l	a1,a2
    5dee:	movea.l a1,a2
		sub.l	d3,a2
    5df0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5df2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5df4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5df6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5df8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dfa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dfc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dfe:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e00:	moveq #0,d0
		move.b	(a0)+,d0
    5e02:	move.b (a0)+,d0
		add.w	d0,d0
    5e04:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e06:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e0a:	jmp (0,a3,d0.w)

00005e0e <lz4Rts4>:
lz4Rts4:	rts
    5e0e:	rts

00005e10 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    5e10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e2a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e2c:	cmpa.l a0,a4
		beq.s	lz4Rts5
    5e2e:	beq.s 5e5a <lz4Rts5>
		move.b	(a0)+,d0
    5e30:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e32:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e34:	move.w (sp)+,d3
		move.b	d0,d3
    5e36:	move.b d0,d3
		move.l	a1,a2
    5e38:	movea.l a1,a2
		sub.l	d3,a2
    5e3a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e3e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e40:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e42:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e44:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e46:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e4a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e4c:	moveq #0,d0
		move.b	(a0)+,d0
    5e4e:	move.b (a0)+,d0
		add.w	d0,d0
    5e50:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e52:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e56:	jmp (0,a3,d0.w)

00005e5a <lz4Rts5>:
lz4Rts5:	rts
    5e5a:	rts

00005e5c <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    5e5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e76:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e78:	cmpa.l a0,a4
		beq.s	lz4Rts6
    5e7a:	beq.s 5ea8 <lz4Rts6>
		move.b	(a0)+,d0
    5e7c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e7e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e80:	move.w (sp)+,d3
		move.b	d0,d3
    5e82:	move.b d0,d3
		move.l	a1,a2
    5e84:	movea.l a1,a2
		sub.l	d3,a2
    5e86:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e8c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e8e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e92:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e94:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e96:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e98:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e9a:	moveq #0,d0
		move.b	(a0)+,d0
    5e9c:	move.b (a0)+,d0
		add.w	d0,d0
    5e9e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5ea0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ea4:	jmp (0,a3,d0.w)

00005ea8 <lz4Rts6>:
lz4Rts6:	rts
    5ea8:	rts

00005eaa <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    5eaa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eb0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eb2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eb4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eb6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ebc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ebe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ec4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5ec6:	cmpa.l a0,a4
		beq.s	lz4Rts7
    5ec8:	beq.s 5ef8 <lz4Rts7>
		move.b	(a0)+,d0
    5eca:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5ecc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5ece:	move.w (sp)+,d3
		move.b	d0,d3
    5ed0:	move.b d0,d3
		move.l	a1,a2
    5ed2:	movea.l a1,a2
		sub.l	d3,a2
    5ed4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5ed6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ed8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eda:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5edc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ede:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ee0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ee2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ee4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ee6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ee8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5eea:	moveq #0,d0
		move.b	(a0)+,d0
    5eec:	move.b (a0)+,d0
		add.w	d0,d0
    5eee:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5ef0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ef4:	jmp (0,a3,d0.w)

00005ef8 <lz4Rts7>:
lz4Rts7:	rts
    5ef8:	rts

00005efa <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    5efa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5efc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5efe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f14:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f16:	cmpa.l a0,a4
		beq.s	lz4Rts8
    5f18:	beq.s 5f4a <lz4Rts8>
		move.b	(a0)+,d0
    5f1a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f1c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f1e:	move.w (sp)+,d3
		move.b	d0,d3
    5f20:	move.b d0,d3
		move.l	a1,a2
    5f22:	movea.l a1,a2
		sub.l	d3,a2
    5f24:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f2e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f30:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f32:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f34:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f36:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f38:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f3a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f3c:	moveq #0,d0
		move.b	(a0)+,d0
    5f3e:	move.b (a0)+,d0
		add.w	d0,d0
    5f40:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f42:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f46:	jmp (0,a3,d0.w)

00005f4a <lz4Rts8>:
lz4Rts8:	rts
    5f4a:	rts

00005f4c <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    5f4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f66:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f68:	cmpa.l a0,a4
		beq.s	lz4Rts9
    5f6a:	beq.s 5f9e <lz4Rts9>
		move.b	(a0)+,d0
    5f6c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f6e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f70:	move.w (sp)+,d3
		move.b	d0,d3
    5f72:	move.b d0,d3
		move.l	a1,a2
    5f74:	movea.l a1,a2
		sub.l	d3,a2
    5f76:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f8c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f8e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f90:	moveq #0,d0
		move.b	(a0)+,d0
    5f92:	move.b (a0)+,d0
		add.w	d0,d0
    5f94:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f96:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f9a:	jmp (0,a3,d0.w)

00005f9e <lz4Rts9>:
lz4Rts9:	rts
    5f9e:	rts

00005fa0 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    5fa0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fa2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fa4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fa6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fa8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5faa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fb0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fb2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fb4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fb6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fba:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5fbc:	cmpa.l a0,a4
		beq.s	lz4Rts10
    5fbe:	beq.s 5ff4 <lz4Rts10>
		move.b	(a0)+,d0
    5fc0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5fc2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fc4:	move.w (sp)+,d3
		move.b	d0,d3
    5fc6:	move.b d0,d3
		move.l	a1,a2
    5fc8:	movea.l a1,a2
		sub.l	d3,a2
    5fca:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5fcc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fd6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fd8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fda:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fdc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fde:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fe0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fe2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fe4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5fe6:	moveq #0,d0
		move.b	(a0)+,d0
    5fe8:	move.b (a0)+,d0
		add.w	d0,d0
    5fea:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fec:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ff0:	jmp (0,a3,d0.w)

00005ff4 <lz4Rts10>:
lz4Rts10:	rts
    5ff4:	rts

00005ff6 <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    5ff6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ff8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ffa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ffc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ffe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6000:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6002:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6004:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6006:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6008:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    600a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    600c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    600e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6010:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6012:	cmpa.l a0,a4
		beq.s	lz4Rts11
    6014:	beq.s 604c <lz4Rts11>
		move.b	(a0)+,d0
    6016:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6018:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    601a:	move.w (sp)+,d3
		move.b	d0,d3
    601c:	move.b d0,d3
		move.l	a1,a2
    601e:	movea.l a1,a2
		sub.l	d3,a2
    6020:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6022:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6024:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6026:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6028:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    602a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    602c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    602e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6030:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6032:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6034:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6036:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6038:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    603a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    603c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    603e:	moveq #0,d0
		move.b	(a0)+,d0
    6040:	move.b (a0)+,d0
		add.w	d0,d0
    6042:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6044:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6048:	jmp (0,a3,d0.w)

0000604c <lz4Rts11>:
lz4Rts11:	rts
    604c:	rts

0000604e <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    604e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6050:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6052:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6054:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6056:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6058:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    605a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    605c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    605e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6060:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6062:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6064:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6066:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6068:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    606a:	cmpa.l a0,a4
		beq.s	lz4Rts12
    606c:	beq.s 60a6 <lz4Rts12>
		move.b	(a0)+,d0
    606e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6070:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6072:	move.w (sp)+,d3
		move.b	d0,d3
    6074:	move.b d0,d3
		move.l	a1,a2
    6076:	movea.l a1,a2
		sub.l	d3,a2
    6078:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    607a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    607c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    607e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6080:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6082:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6084:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6086:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6088:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    608a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    608c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    608e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6090:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6092:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6094:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6096:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6098:	moveq #0,d0
		move.b	(a0)+,d0
    609a:	move.b (a0)+,d0
		add.w	d0,d0
    609c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    609e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60a2:	jmp (0,a3,d0.w)

000060a6 <lz4Rts12>:
lz4Rts12:	rts
    60a6:	rts

000060a8 <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    60a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60c2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    60c4:	cmpa.l a0,a4
		beq.s	lz4Rts13
    60c6:	beq.s 6102 <lz4Rts13>
		move.b	(a0)+,d0
    60c8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    60ca:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    60cc:	move.w (sp)+,d3
		move.b	d0,d3
    60ce:	move.b d0,d3
		move.l	a1,a2
    60d0:	movea.l a1,a2
		sub.l	d3,a2
    60d2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    60d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60f2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    60f4:	moveq #0,d0
		move.b	(a0)+,d0
    60f6:	move.b (a0)+,d0
		add.w	d0,d0
    60f8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    60fa:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60fe:	jmp (0,a3,d0.w)

00006102 <lz4Rts13>:
lz4Rts13:	rts
    6102:	rts

00006104 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    6104:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6106:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6108:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    610a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    610c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    610e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6110:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6112:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6114:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6116:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6118:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    611a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    611c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    611e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6120:	cmpa.l a0,a4
		beq.s	lz4Rts14
    6122:	beq.s 6160 <lz4Rts14>
		move.b	(a0)+,d0
    6124:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6126:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6128:	move.w (sp)+,d3
		move.b	d0,d3
    612a:	move.b d0,d3
		move.l	a1,a2
    612c:	movea.l a1,a2
		sub.l	d3,a2
    612e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6130:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6132:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6134:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6136:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6138:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    613a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    613c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    613e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6140:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6142:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6144:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6146:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    6152:	moveq #0,d0
		move.b	(a0)+,d0
    6154:	move.b (a0)+,d0
		add.w	d0,d0
    6156:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6158:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    615c:	jmp (0,a3,d0.w)

00006160 <lz4Rts14>:
lz4Rts14:	rts
    6160:	rts

00006162 <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    6162:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6164:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6166:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6168:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    616a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    616c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    616e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6170:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6172:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6174:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6176:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6178:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    617a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    617c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    617e:	cmpa.l a0,a4
		beq.s	lz4Rts15
    6180:	beq.s 61c0 <lz4Rts15>
		move.b	(a0)+,d0
    6182:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6184:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6186:	move.w (sp)+,d3
		move.b	d0,d3
    6188:	move.b d0,d3
		move.l	a1,a2
    618a:	movea.l a1,a2
		sub.l	d3,a2
    618c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    618e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6190:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6192:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6194:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6196:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6198:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    619a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    619c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    619e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61a4:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    61b2:	moveq #0,d0
		move.b	(a0)+,d0
    61b4:	move.b (a0)+,d0
		add.w	d0,d0
    61b6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    61b8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    61bc:	jmp (0,a3,d0.w)

000061c0 <lz4Rts15>:
lz4Rts15:	rts
    61c0:	rts

000061c2 <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    61c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61dc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    61de:	cmpa.l a0,a4
		beq.s	lz4Rts16
    61e0:	beq.s 6236 <lz4Rts16>
		move.b	(a0)+,d0
    61e2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61e4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61e6:	move.w (sp)+,d3
		move.b	d0,d3
    61e8:	move.b d0,d3
		move.l	a1,a2
    61ea:	movea.l a1,a2
		sub.l	d3,a2
    61ec:	suba.l d3,a2
		moveq	#15+4,d1
    61ee:	moveq #19,d1

000061f0 <.cl0>:
.cl0:	move.b	(a0)+,d2
    61f0:	/-> move.b (a0)+,d2
		add.l d2,d1
    61f2:	|   add.l d2,d1
		not.b	d2
    61f4:	|   not.b d2
		beq.s	.cl0
    61f6:	\-- beq.s 61f0 <.cl0>
		moveq	#15,d5
    61f8:	    moveq #15,d5
		and.w	d1,d5
    61fa:	    and.w d1,d5
		add.w	d5,d5
    61fc:	    add.w d5,d5
		neg.w	d5
    61fe:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    6200:	    jmp (6224 <.eloop1>,pc,d5.w)

00006204 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    6204:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6206:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6208:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    620a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    620c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    620e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6210:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6212:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6214:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6216:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6218:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    621a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    621c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    621e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6220:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6222:	move.b (a2)+,(a1)+

00006224 <.eloop1>:
.eloop1:	sub.l	d7,d1
    6224:	sub.l d7,d1
		bpl.s	.tloop1
    6226:	bpl.s 6204 <.tloop1>
		moveq	#0,d0
    6228:	moveq #0,d0
		move.b	(a0)+,d0
    622a:	move.b (a0)+,d0
		add.w	d0,d0
    622c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    622e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6232:	jmp (0,a3,d0.w)

00006236 <lz4Rts16>:
lz4Rts16:	rts
    6236:	rts

00006238 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    6238:	moveq #15,d1

0000623a <.cl2>:
.cl2:	move.b	(a0)+,d2
    623a:	/-> move.b (a0)+,d2
		add.l d2,d1
    623c:	|   add.l d2,d1
		not.b	d2
    623e:	|   not.b d2
		beq.s	.cl2
    6240:	\-- beq.s 623a <.cl2>
		moveq	#15,d5
    6242:	    moveq #15,d5
		and.w	d1,d5
    6244:	    and.w d1,d5
		add.w	d5,d5
    6246:	    add.w d5,d5
		neg.w	d5
    6248:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    624a:	    jmp (626e <.eloop3>,pc,d5.w)

0000624e <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    624e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6250:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6252:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6254:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6256:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6258:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    625a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    625c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    625e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6260:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6262:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6264:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6266:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6268:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    626a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    626c:	move.b (a0)+,(a1)+

0000626e <.eloop3>:
.eloop3:	sub.l	d7,d1
    626e:	sub.l d7,d1
		bpl.s	.tloop3
    6270:	bpl.s 624e <.tloop3>
		cmpa.l	a0,a4
    6272:	cmpa.l a0,a4
		beq.s	lz4Rts17
    6274:	beq.s 6298 <lz4Rts17>
		move.b	(a0)+,d0
    6276:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6278:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    627a:	move.w (sp)+,d3
		move.b	d0,d3
    627c:	move.b d0,d3
		move.l	a1,a2
    627e:	movea.l a1,a2
		sub.l	d3,a2
    6280:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6282:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6284:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6286:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6288:	move.b (a2)+,(a1)+
		moveq	#0,d0
    628a:	moveq #0,d0
		move.b	(a0)+,d0
    628c:	move.b (a0)+,d0
		add.w	d0,d0
    628e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6290:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6294:	jmp (0,a3,d0.w)

00006298 <lz4Rts17>:
lz4Rts17:	rts
    6298:	rts

0000629a <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    629a:	moveq #15,d1

0000629c <.cl4>:
.cl4:	move.b	(a0)+,d2
    629c:	/-> move.b (a0)+,d2
		add.l d2,d1
    629e:	|   add.l d2,d1
		not.b	d2
    62a0:	|   not.b d2
		beq.s	.cl4
    62a2:	\-- beq.s 629c <.cl4>
		moveq	#15,d5
    62a4:	    moveq #15,d5
		and.w	d1,d5
    62a6:	    and.w d1,d5
		add.w	d5,d5
    62a8:	    add.w d5,d5
		neg.w	d5
    62aa:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    62ac:	    jmp (62d0 <.eloop5>,pc,d5.w)

000062b0 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    62b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ce:	move.b (a0)+,(a1)+

000062d0 <.eloop5>:
.eloop5:	sub.l	d7,d1
    62d0:	sub.l d7,d1
		bpl.s	.tloop5
    62d2:	bpl.s 62b0 <.tloop5>
		cmpa.l	a0,a4
    62d4:	cmpa.l a0,a4
		beq.s	lz4Rts18
    62d6:	beq.s 62fc <lz4Rts18>
		move.b	(a0)+,d0
    62d8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    62da:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    62dc:	move.w (sp)+,d3
		move.b	d0,d3
    62de:	move.b d0,d3
		move.l	a1,a2
    62e0:	movea.l a1,a2
		sub.l	d3,a2
    62e2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ec:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62ee:	moveq #0,d0
		move.b	(a0)+,d0
    62f0:	move.b (a0)+,d0
		add.w	d0,d0
    62f2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    62f4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    62f8:	jmp (0,a3,d0.w)

000062fc <lz4Rts18>:
lz4Rts18:	rts
    62fc:	rts

000062fe <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    62fe:	moveq #15,d1

00006300 <.cl6>:
.cl6:	move.b	(a0)+,d2
    6300:	/-> move.b (a0)+,d2
		add.l d2,d1
    6302:	|   add.l d2,d1
		not.b	d2
    6304:	|   not.b d2
		beq.s	.cl6
    6306:	\-- beq.s 6300 <.cl6>
		moveq	#15,d5
    6308:	    moveq #15,d5
		and.w	d1,d5
    630a:	    and.w d1,d5
		add.w	d5,d5
    630c:	    add.w d5,d5
		neg.w	d5
    630e:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    6310:	    jmp (6334 <.eloop7>,pc,d5.w)

00006314 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    6314:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6316:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6318:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    631a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    631c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    631e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6320:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6322:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6324:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6326:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6328:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    632a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    632c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    632e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6330:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6332:	move.b (a0)+,(a1)+

00006334 <.eloop7>:
.eloop7:	sub.l	d7,d1
    6334:	sub.l d7,d1
		bpl.s	.tloop7
    6336:	bpl.s 6314 <.tloop7>
		cmpa.l	a0,a4
    6338:	cmpa.l a0,a4
		beq.s	lz4Rts19
    633a:	beq.s 6362 <lz4Rts19>
		move.b	(a0)+,d0
    633c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    633e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6340:	move.w (sp)+,d3
		move.b	d0,d3
    6342:	move.b d0,d3
		move.l	a1,a2
    6344:	movea.l a1,a2
		sub.l	d3,a2
    6346:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6348:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    634a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    634c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    634e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6350:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6352:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6354:	moveq #0,d0
		move.b	(a0)+,d0
    6356:	move.b (a0)+,d0
		add.w	d0,d0
    6358:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    635a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    635e:	jmp (0,a3,d0.w)

00006362 <lz4Rts19>:
lz4Rts19:	rts
    6362:	rts

00006364 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    6364:	moveq #15,d1

00006366 <.cl8>:
.cl8:	move.b	(a0)+,d2
    6366:	/-> move.b (a0)+,d2
		add.l d2,d1
    6368:	|   add.l d2,d1
		not.b	d2
    636a:	|   not.b d2
		beq.s	.cl8
    636c:	\-- beq.s 6366 <.cl8>
		moveq	#15,d5
    636e:	    moveq #15,d5
		and.w	d1,d5
    6370:	    and.w d1,d5
		add.w	d5,d5
    6372:	    add.w d5,d5
		neg.w	d5
    6374:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    6376:	    jmp (639a <.eloop9>,pc,d5.w)

0000637a <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    637a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    637c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    637e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6380:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6382:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6384:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6386:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6388:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    638a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    638c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    638e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6390:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6392:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6394:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6396:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6398:	move.b (a0)+,(a1)+

0000639a <.eloop9>:
.eloop9:	sub.l	d7,d1
    639a:	sub.l d7,d1
		bpl.s	.tloop9
    639c:	bpl.s 637a <.tloop9>
		cmpa.l	a0,a4
    639e:	cmpa.l a0,a4
		beq.s	lz4Rts20
    63a0:	beq.s 63ca <lz4Rts20>
		move.b	(a0)+,d0
    63a2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63a4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63a6:	move.w (sp)+,d3
		move.b	d0,d3
    63a8:	move.b d0,d3
		move.l	a1,a2
    63aa:	movea.l a1,a2
		sub.l	d3,a2
    63ac:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    63ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63ba:	move.b (a2)+,(a1)+
		moveq	#0,d0
    63bc:	moveq #0,d0
		move.b	(a0)+,d0
    63be:	move.b (a0)+,d0
		add.w	d0,d0
    63c0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    63c2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    63c6:	jmp (0,a3,d0.w)

000063ca <lz4Rts20>:
lz4Rts20:	rts
    63ca:	rts

000063cc <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    63cc:	moveq #15,d1

000063ce <.cl10>:
.cl10:	move.b	(a0)+,d2
    63ce:	/-> move.b (a0)+,d2
		add.l d2,d1
    63d0:	|   add.l d2,d1
		not.b	d2
    63d2:	|   not.b d2
		beq.s	.cl10
    63d4:	\-- beq.s 63ce <.cl10>
		moveq	#15,d5
    63d6:	    moveq #15,d5
		and.w	d1,d5
    63d8:	    and.w d1,d5
		add.w	d5,d5
    63da:	    add.w d5,d5
		neg.w	d5
    63dc:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    63de:	    jmp (6402 <.eloop11>,pc,d5.w)

000063e2 <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    63e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6400:	move.b (a0)+,(a1)+

00006402 <.eloop11>:
.eloop11:	sub.l	d7,d1
    6402:	sub.l d7,d1
		bpl.s	.tloop11
    6404:	bpl.s 63e2 <.tloop11>
		cmpa.l	a0,a4
    6406:	cmpa.l a0,a4
		beq.s	lz4Rts21
    6408:	beq.s 6434 <lz4Rts21>
		move.b	(a0)+,d0
    640a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    640c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    640e:	move.w (sp)+,d3
		move.b	d0,d3
    6410:	move.b d0,d3
		move.l	a1,a2
    6412:	movea.l a1,a2
		sub.l	d3,a2
    6414:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6416:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6418:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    641a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    641c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    641e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6420:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6422:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6424:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6426:	moveq #0,d0
		move.b	(a0)+,d0
    6428:	move.b (a0)+,d0
		add.w	d0,d0
    642a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    642c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6430:	jmp (0,a3,d0.w)

00006434 <lz4Rts21>:
lz4Rts21:	rts
    6434:	rts

00006436 <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    6436:	moveq #15,d1

00006438 <.cl12>:
.cl12:	move.b	(a0)+,d2
    6438:	/-> move.b (a0)+,d2
		add.l d2,d1
    643a:	|   add.l d2,d1
		not.b	d2
    643c:	|   not.b d2
		beq.s	.cl12
    643e:	\-- beq.s 6438 <.cl12>
		moveq	#15,d5
    6440:	    moveq #15,d5
		and.w	d1,d5
    6442:	    and.w d1,d5
		add.w	d5,d5
    6444:	    add.w d5,d5
		neg.w	d5
    6446:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    6448:	    jmp (646c <.eloop13>,pc,d5.w)

0000644c <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    644c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    644e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6450:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6452:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6454:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6456:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6458:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    645a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    645c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    645e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6460:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6462:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6464:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6466:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6468:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    646a:	move.b (a0)+,(a1)+

0000646c <.eloop13>:
.eloop13:	sub.l	d7,d1
    646c:	sub.l d7,d1
		bpl.s	.tloop13
    646e:	bpl.s 644c <.tloop13>
		cmpa.l	a0,a4
    6470:	cmpa.l a0,a4
		beq.s	lz4Rts22
    6472:	beq.s 64a0 <lz4Rts22>
		move.b	(a0)+,d0
    6474:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6476:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6478:	move.w (sp)+,d3
		move.b	d0,d3
    647a:	move.b d0,d3
		move.l	a1,a2
    647c:	movea.l a1,a2
		sub.l	d3,a2
    647e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6480:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6482:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6484:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6486:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6488:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    648a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    648c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    648e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6490:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6492:	moveq #0,d0
		move.b	(a0)+,d0
    6494:	move.b (a0)+,d0
		add.w	d0,d0
    6496:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6498:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    649c:	jmp (0,a3,d0.w)

000064a0 <lz4Rts22>:
lz4Rts22:	rts
    64a0:	rts

000064a2 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    64a2:	moveq #15,d1

000064a4 <.cl14>:
.cl14:	move.b	(a0)+,d2
    64a4:	/-> move.b (a0)+,d2
		add.l d2,d1
    64a6:	|   add.l d2,d1
		not.b	d2
    64a8:	|   not.b d2
		beq.s	.cl14
    64aa:	\-- beq.s 64a4 <.cl14>
		moveq	#15,d5
    64ac:	    moveq #15,d5
		and.w	d1,d5
    64ae:	    and.w d1,d5
		add.w	d5,d5
    64b0:	    add.w d5,d5
		neg.w	d5
    64b2:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    64b4:	    jmp (64d8 <.eloop15>,pc,d5.w)

000064b8 <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    64b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64d6:	move.b (a0)+,(a1)+

000064d8 <.eloop15>:
.eloop15:	sub.l	d7,d1
    64d8:	sub.l d7,d1
		bpl.s	.tloop15
    64da:	bpl.s 64b8 <.tloop15>
		cmpa.l	a0,a4
    64dc:	cmpa.l a0,a4
		beq.s	lz4Rts23
    64de:	beq.s 650e <lz4Rts23>
		move.b	(a0)+,d0
    64e0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    64e2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    64e4:	move.w (sp)+,d3
		move.b	d0,d3
    64e6:	move.b d0,d3
		move.l	a1,a2
    64e8:	movea.l a1,a2
		sub.l	d3,a2
    64ea:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    64ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64fe:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6500:	moveq #0,d0
		move.b	(a0)+,d0
    6502:	move.b (a0)+,d0
		add.w	d0,d0
    6504:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6506:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    650a:	jmp (0,a3,d0.w)

0000650e <lz4Rts23>:
lz4Rts23:	rts
    650e:	rts

00006510 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    6510:	moveq #15,d1

00006512 <.cl16>:
.cl16:	move.b	(a0)+,d2
    6512:	/-> move.b (a0)+,d2
		add.l d2,d1
    6514:	|   add.l d2,d1
		not.b	d2
    6516:	|   not.b d2
		beq.s	.cl16
    6518:	\-- beq.s 6512 <.cl16>
		moveq	#15,d5
    651a:	    moveq #15,d5
		and.w	d1,d5
    651c:	    and.w d1,d5
		add.w	d5,d5
    651e:	    add.w d5,d5
		neg.w	d5
    6520:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    6522:	    jmp (6546 <.eloop17>,pc,d5.w)

00006526 <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    6526:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6528:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    652a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    652c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    652e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6530:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6532:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6534:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6536:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6538:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    653a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    653c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    653e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6540:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6542:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6544:	move.b (a0)+,(a1)+

00006546 <.eloop17>:
.eloop17:	sub.l	d7,d1
    6546:	sub.l d7,d1
		bpl.s	.tloop17
    6548:	bpl.s 6526 <.tloop17>
		cmpa.l	a0,a4
    654a:	cmpa.l a0,a4
		beq.s	lz4Rts24
    654c:	beq.s 657e <lz4Rts24>
		move.b	(a0)+,d0
    654e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6550:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6552:	move.w (sp)+,d3
		move.b	d0,d3
    6554:	move.b d0,d3
		move.l	a1,a2
    6556:	movea.l a1,a2
		sub.l	d3,a2
    6558:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    655a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    655c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    655e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6560:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6562:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6564:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6566:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6568:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    656a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    656c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    656e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6570:	moveq #0,d0
		move.b	(a0)+,d0
    6572:	move.b (a0)+,d0
		add.w	d0,d0
    6574:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6576:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    657a:	jmp (0,a3,d0.w)

0000657e <lz4Rts24>:
lz4Rts24:	rts
    657e:	rts

00006580 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    6580:	moveq #15,d1

00006582 <.cl18>:
.cl18:	move.b	(a0)+,d2
    6582:	/-> move.b (a0)+,d2
		add.l d2,d1
    6584:	|   add.l d2,d1
		not.b	d2
    6586:	|   not.b d2
		beq.s	.cl18
    6588:	\-- beq.s 6582 <.cl18>
		moveq	#15,d5
    658a:	    moveq #15,d5
		and.w	d1,d5
    658c:	    and.w d1,d5
		add.w	d5,d5
    658e:	    add.w d5,d5
		neg.w	d5
    6590:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    6592:	    jmp (65b6 <.eloop19>,pc,d5.w)

00006596 <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    6596:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6598:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    659a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    659c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    659e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65b4:	move.b (a0)+,(a1)+

000065b6 <.eloop19>:
.eloop19:	sub.l	d7,d1
    65b6:	sub.l d7,d1
		bpl.s	.tloop19
    65b8:	bpl.s 6596 <.tloop19>
		cmpa.l	a0,a4
    65ba:	cmpa.l a0,a4
		beq.s	lz4Rts25
    65bc:	beq.s 65f0 <lz4Rts25>
		move.b	(a0)+,d0
    65be:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    65c0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    65c2:	move.w (sp)+,d3
		move.b	d0,d3
    65c4:	move.b d0,d3
		move.l	a1,a2
    65c6:	movea.l a1,a2
		sub.l	d3,a2
    65c8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    65ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65e0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    65e2:	moveq #0,d0
		move.b	(a0)+,d0
    65e4:	move.b (a0)+,d0
		add.w	d0,d0
    65e6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    65e8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    65ec:	jmp (0,a3,d0.w)

000065f0 <lz4Rts25>:
lz4Rts25:	rts
    65f0:	rts

000065f2 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    65f2:	moveq #15,d1

000065f4 <.cl20>:
.cl20:	move.b	(a0)+,d2
    65f4:	/-> move.b (a0)+,d2
		add.l d2,d1
    65f6:	|   add.l d2,d1
		not.b	d2
    65f8:	|   not.b d2
		beq.s	.cl20
    65fa:	\-- beq.s 65f4 <.cl20>
		moveq	#15,d5
    65fc:	    moveq #15,d5
		and.w	d1,d5
    65fe:	    and.w d1,d5
		add.w	d5,d5
    6600:	    add.w d5,d5
		neg.w	d5
    6602:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    6604:	    jmp (6628 <.eloop21>,pc,d5.w)

00006608 <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    6608:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    660a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    660c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    660e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6610:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6612:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6614:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6616:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6618:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    661a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    661c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    661e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6620:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6622:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6624:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6626:	move.b (a0)+,(a1)+

00006628 <.eloop21>:
.eloop21:	sub.l	d7,d1
    6628:	sub.l d7,d1
		bpl.s	.tloop21
    662a:	bpl.s 6608 <.tloop21>
		cmpa.l	a0,a4
    662c:	cmpa.l a0,a4
		beq.s	lz4Rts26
    662e:	beq.s 6664 <lz4Rts26>
		move.b	(a0)+,d0
    6630:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6632:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6634:	move.w (sp)+,d3
		move.b	d0,d3
    6636:	move.b d0,d3
		move.l	a1,a2
    6638:	movea.l a1,a2
		sub.l	d3,a2
    663a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    663c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    663e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6640:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6642:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6644:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6646:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6648:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    664a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    664c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    664e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6650:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6652:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6654:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6656:	moveq #0,d0
		move.b	(a0)+,d0
    6658:	move.b (a0)+,d0
		add.w	d0,d0
    665a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    665c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6660:	jmp (0,a3,d0.w)

00006664 <lz4Rts26>:
lz4Rts26:	rts
    6664:	rts

00006666 <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    6666:	moveq #15,d1

00006668 <.cl22>:
.cl22:	move.b	(a0)+,d2
    6668:	/-> move.b (a0)+,d2
		add.l d2,d1
    666a:	|   add.l d2,d1
		not.b	d2
    666c:	|   not.b d2
		beq.s	.cl22
    666e:	\-- beq.s 6668 <.cl22>
		moveq	#15,d5
    6670:	    moveq #15,d5
		and.w	d1,d5
    6672:	    and.w d1,d5
		add.w	d5,d5
    6674:	    add.w d5,d5
		neg.w	d5
    6676:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    6678:	    jmp (669c <.eloop23>,pc,d5.w)

0000667c <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    667c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    667e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6680:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6682:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6684:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6686:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6688:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    668a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    668c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    668e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6690:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6692:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6694:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6696:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6698:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    669a:	move.b (a0)+,(a1)+

0000669c <.eloop23>:
.eloop23:	sub.l	d7,d1
    669c:	sub.l d7,d1
		bpl.s	.tloop23
    669e:	bpl.s 667c <.tloop23>
		cmpa.l	a0,a4
    66a0:	cmpa.l a0,a4
		beq.s	lz4Rts27
    66a2:	beq.s 66da <lz4Rts27>
		move.b	(a0)+,d0
    66a4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    66a6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    66a8:	move.w (sp)+,d3
		move.b	d0,d3
    66aa:	move.b d0,d3
		move.l	a1,a2
    66ac:	movea.l a1,a2
		sub.l	d3,a2
    66ae:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    66b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ca:	move.b (a2)+,(a1)+
		moveq	#0,d0
    66cc:	moveq #0,d0
		move.b	(a0)+,d0
    66ce:	move.b (a0)+,d0
		add.w	d0,d0
    66d0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    66d2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    66d6:	jmp (0,a3,d0.w)

000066da <lz4Rts27>:
lz4Rts27:	rts
    66da:	rts

000066dc <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    66dc:	moveq #15,d1

000066de <.cl24>:
.cl24:	move.b	(a0)+,d2
    66de:	/-> move.b (a0)+,d2
		add.l d2,d1
    66e0:	|   add.l d2,d1
		not.b	d2
    66e2:	|   not.b d2
		beq.s	.cl24
    66e4:	\-- beq.s 66de <.cl24>
		moveq	#15,d5
    66e6:	    moveq #15,d5
		and.w	d1,d5
    66e8:	    and.w d1,d5
		add.w	d5,d5
    66ea:	    add.w d5,d5
		neg.w	d5
    66ec:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    66ee:	    jmp (6712 <.eloop25>,pc,d5.w)

000066f2 <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    66f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6700:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6702:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6704:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6706:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6708:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    670a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    670c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    670e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6710:	move.b (a0)+,(a1)+

00006712 <.eloop25>:
.eloop25:	sub.l	d7,d1
    6712:	sub.l d7,d1
		bpl.s	.tloop25
    6714:	bpl.s 66f2 <.tloop25>
		cmpa.l	a0,a4
    6716:	cmpa.l a0,a4
		beq.s	lz4Rts28
    6718:	beq.s 6752 <lz4Rts28>
		move.b	(a0)+,d0
    671a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    671c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    671e:	move.w (sp)+,d3
		move.b	d0,d3
    6720:	move.b d0,d3
		move.l	a1,a2
    6722:	movea.l a1,a2
		sub.l	d3,a2
    6724:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6726:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6728:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    672a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    672c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    672e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6730:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6732:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6734:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6736:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6738:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    673a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    673c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    673e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6740:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6742:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6744:	moveq #0,d0
		move.b	(a0)+,d0
    6746:	move.b (a0)+,d0
		add.w	d0,d0
    6748:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    674a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    674e:	jmp (0,a3,d0.w)

00006752 <lz4Rts28>:
lz4Rts28:	rts
    6752:	rts

00006754 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    6754:	moveq #15,d1

00006756 <.cl26>:
.cl26:	move.b	(a0)+,d2
    6756:	/-> move.b (a0)+,d2
		add.l d2,d1
    6758:	|   add.l d2,d1
		not.b	d2
    675a:	|   not.b d2
		beq.s	.cl26
    675c:	\-- beq.s 6756 <.cl26>
		moveq	#15,d5
    675e:	    moveq #15,d5
		and.w	d1,d5
    6760:	    and.w d1,d5
		add.w	d5,d5
    6762:	    add.w d5,d5
		neg.w	d5
    6764:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    6766:	    jmp (678a <.eloop27>,pc,d5.w)

0000676a <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    676a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    676c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    676e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6770:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6772:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6774:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6776:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6778:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    677a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    677c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    677e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6780:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6782:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6784:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6786:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6788:	move.b (a0)+,(a1)+

0000678a <.eloop27>:
.eloop27:	sub.l	d7,d1
    678a:	sub.l d7,d1
		bpl.s	.tloop27
    678c:	bpl.s 676a <.tloop27>
		cmpa.l	a0,a4
    678e:	cmpa.l a0,a4
		beq.s	lz4Rts29
    6790:	beq.s 67cc <lz4Rts29>
		move.b	(a0)+,d0
    6792:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6794:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6796:	move.w (sp)+,d3
		move.b	d0,d3
    6798:	move.b d0,d3
		move.l	a1,a2
    679a:	movea.l a1,a2
		sub.l	d3,a2
    679c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    679e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67bc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    67be:	moveq #0,d0
		move.b	(a0)+,d0
    67c0:	move.b (a0)+,d0
		add.w	d0,d0
    67c2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    67c4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    67c8:	jmp (0,a3,d0.w)

000067cc <lz4Rts29>:
lz4Rts29:	rts
    67cc:	rts

000067ce <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    67ce:	moveq #15,d1

000067d0 <.cl28>:
.cl28:	move.b	(a0)+,d2
    67d0:	/-> move.b (a0)+,d2
		add.l d2,d1
    67d2:	|   add.l d2,d1
		not.b	d2
    67d4:	|   not.b d2
		beq.s	.cl28
    67d6:	\-- beq.s 67d0 <.cl28>
		moveq	#15,d5
    67d8:	    moveq #15,d5
		and.w	d1,d5
    67da:	    and.w d1,d5
		add.w	d5,d5
    67dc:	    add.w d5,d5
		neg.w	d5
    67de:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    67e0:	    jmp (6804 <.eloop29>,pc,d5.w)

000067e4 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    67e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6800:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6802:	move.b (a0)+,(a1)+

00006804 <.eloop29>:
.eloop29:	sub.l	d7,d1
    6804:	sub.l d7,d1
		bpl.s	.tloop29
    6806:	bpl.s 67e4 <.tloop29>
		cmpa.l	a0,a4
    6808:	cmpa.l a0,a4
		beq.s	lz4Rts30
    680a:	beq.s 6848 <lz4Rts30>
		move.b	(a0)+,d0
    680c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    680e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6810:	move.w (sp)+,d3
		move.b	d0,d3
    6812:	move.b d0,d3
		move.l	a1,a2
    6814:	movea.l a1,a2
		sub.l	d3,a2
    6816:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6818:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    681a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    681c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    681e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6820:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6822:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6824:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6826:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6828:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    682a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    682c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    682e:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    683a:	moveq #0,d0
		move.b	(a0)+,d0
    683c:	move.b (a0)+,d0
		add.w	d0,d0
    683e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6840:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6844:	jmp (0,a3,d0.w)

00006848 <lz4Rts30>:
lz4Rts30:	rts
    6848:	rts

0000684a <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    684a:	moveq #15,d1

0000684c <.cl30>:
.cl30:	move.b	(a0)+,d2
    684c:	/-> move.b (a0)+,d2
		add.l d2,d1
    684e:	|   add.l d2,d1
		not.b	d2
    6850:	|   not.b d2
		beq.s	.cl30
    6852:	\-- beq.s 684c <.cl30>
		moveq	#15,d5
    6854:	    moveq #15,d5
		and.w	d1,d5
    6856:	    and.w d1,d5
		add.w	d5,d5
    6858:	    add.w d5,d5
		neg.w	d5
    685a:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    685c:	    jmp (6880 <.eloop31>,pc,d5.w)

00006860 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    6860:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6862:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6864:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6866:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6868:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    686a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    686c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    686e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6870:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6872:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6874:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6876:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6878:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    687e:	move.b (a0)+,(a1)+

00006880 <.eloop31>:
.eloop31:	sub.l	d7,d1
    6880:	sub.l d7,d1
		bpl.s	.tloop31
    6882:	bpl.s 6860 <.tloop31>
		cmpa.l	a0,a4
    6884:	cmpa.l a0,a4
		beq.s	lz4Rts31
    6886:	beq.s 68c6 <lz4Rts31>
		move.b	(a0)+,d0
    6888:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    688a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    688c:	move.w (sp)+,d3
		move.b	d0,d3
    688e:	move.b d0,d3
		move.l	a1,a2
    6890:	movea.l a1,a2
		sub.l	d3,a2
    6892:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6894:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6896:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6898:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    689a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    689c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    689e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68aa:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    68b8:	moveq #0,d0
		move.b	(a0)+,d0
    68ba:	move.b (a0)+,d0
		add.w	d0,d0
    68bc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    68be:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    68c2:	jmp (0,a3,d0.w)

000068c6 <lz4Rts31>:
lz4Rts31:	rts
    68c6:	rts

000068c8 <ll_lm>:

ll_lm:
		moveq	#15,d1
    68c8:	moveq #15,d1

000068ca <.cl32>:
.cl32:	move.b	(a0)+,d2
    68ca:	/-> move.b (a0)+,d2
		add.l d2,d1
    68cc:	|   add.l d2,d1
		not.b	d2
    68ce:	|   not.b d2
		beq.s	.cl32
    68d0:	\-- beq.s 68ca <.cl32>
		moveq	#15,d5
    68d2:	    moveq #15,d5
		and.w	d1,d5
    68d4:	    and.w d1,d5
		add.w	d5,d5
    68d6:	    add.w d5,d5
		neg.w	d5
    68d8:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    68da:	    jmp (68fe <.eloop33>,pc,d5.w)

000068de <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    68de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68fc:	move.b (a0)+,(a1)+

000068fe <.eloop33>:
.eloop33:	sub.l	d7,d1
    68fe:	sub.l d7,d1
		bpl.s	.tloop33
    6900:	bpl.s 68de <.tloop33>
		cmpa.l	a0,a4
    6902:	cmpa.l a0,a4
		beq.s	lz4Rts32
    6904:	beq.s 695a <lz4Rts32>
		move.b	(a0)+,d0
    6906:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6908:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    690a:	move.w (sp)+,d3
		move.b	d0,d3
    690c:	move.b d0,d3
		move.l	a1,a2
    690e:	movea.l a1,a2
		sub.l	d3,a2
    6910:	suba.l d3,a2
		moveq	#15+4,d1
    6912:	moveq #19,d1

00006914 <.cl34>:
.cl34:	move.b	(a0)+,d2
    6914:	/-> move.b (a0)+,d2
		add.l d2,d1
    6916:	|   add.l d2,d1
		not.b	d2
    6918:	|   not.b d2
		beq.s	.cl34
    691a:	\-- beq.s 6914 <.cl34>
		moveq	#15,d5
    691c:	    moveq #15,d5
		and.w	d1,d5
    691e:	    and.w d1,d5
		add.w	d5,d5
    6920:	    add.w d5,d5
		neg.w	d5
    6922:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    6924:	    jmp (6948 <.eloop35>,pc,d5.w)

00006928 <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    6928:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    692a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    692c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    692e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6930:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6932:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6934:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6936:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6938:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    693a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    693c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    693e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6940:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6942:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6944:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6946:	move.b (a2)+,(a1)+

00006948 <.eloop35>:
.eloop35:	sub.l	d7,d1
    6948:	sub.l d7,d1
		bpl.s	.tloop35
    694a:	bpl.s 6928 <.tloop35>
		moveq	#0,d0
    694c:	moveq #0,d0
		move.b	(a0)+,d0
    694e:	move.b (a0)+,d0
		add.w	d0,d0
    6950:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6952:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6956:	jmp (0,a3,d0.w)

0000695a <lz4Rts32>:
lz4Rts32:				
			rts
    695a:	rts

0000695c <lz4Over>:

lz4Over:	rts
    695c:	rts

0000695e <lz4jmp>:
    695e:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    6960:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    6962:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    6964:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    6966:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    6968:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    696a:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    696c:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    696e:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    6970:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    6972:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    6974:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    6976:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    6978:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    697a:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    697c:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    697e:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    6980:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    6982:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    6984:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    6986:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    6988:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    698a:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    698c:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    698e:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    6990:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    6992:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    6994:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    6996:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    6998:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    699a:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    699c:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    699e:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    69a0:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    69a2:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    69a4:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    69a6:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    69a8:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    69aa:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    69ac:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    69ae:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    69b0:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    69b2:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    69b4:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    69b6:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    69b8:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    69ba:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    69bc:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    69be:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    69c0:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    69c2:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    69c4:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    69c6:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    69c8:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    69ca:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    69cc:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    69ce:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    69d0:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    69d2:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    69d4:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    69d6:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    69d8:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    69da:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    69dc:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    69de:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    69e0:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    69e2:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    69e4:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    69e6:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    69e8:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    69ea:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    69ec:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    69ee:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    69f0:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    69f2:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    69f4:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    69f6:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    69f8:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    69fa:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    69fc:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    69fe:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    6a00:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    6a02:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    6a04:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    6a06:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    6a08:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    6a0a:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    6a0c:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    6a0e:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    6a10:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    6a12:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    6a14:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    6a16:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    6a18:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    6a1a:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    6a1c:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    6a1e:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    6a20:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    6a22:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    6a24:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    6a26:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    6a28:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    6a2a:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    6a2c:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    6a2e:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    6a30:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    6a32:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    6a34:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    6a36:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    6a38:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    6a3a:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    6a3c:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    6a3e:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    6a40:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    6a42:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    6a44:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    6a46:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    6a48:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    6a4a:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    6a4c:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    6a4e:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    6a50:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    6a52:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    6a54:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    6a56:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    6a58:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    6a5a:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    6a5c:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    6a5e:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    6a60:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    6a62:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    6a64:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    6a66:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    6a68:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    6a6a:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    6a6c:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    6a6e:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    6a70:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    6a72:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    6a74:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    6a76:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    6a78:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    6a7a:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    6a7c:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    6a7e:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    6a80:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    6a82:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    6a84:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    6a86:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    6a88:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    6a8a:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    6a8c:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    6a8e:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    6a90:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    6a92:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    6a94:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    6a96:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    6a98:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    6a9a:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    6a9c:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    6a9e:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    6aa0:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    6aa2:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    6aa4:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    6aa6:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    6aa8:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    6aaa:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    6aac:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    6aae:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    6ab0:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    6ab2:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    6ab4:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    6ab6:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    6ab8:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    6aba:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    6abc:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    6abe:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6ac0:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6ac2:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6ac4:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6ac6:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6ac8:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    6aca:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    6acc:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    6ace:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6ad0:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6ad2:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6ad4:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6ad6:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6ad8:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    6ada:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    6adc:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    6ade:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6ae0:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6ae2:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6ae4:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6ae6:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6ae8:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    6aea:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    6aec:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    6aee:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6af0:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6af2:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6af4:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6af6:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6af8:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    6afa:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    6afc:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    6afe:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6b00:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6b02:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6b04:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6b06:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6b08:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    6b0a:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    6b0c:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    6b0e:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    6b10:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    6b12:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    6b14:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    6b16:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    6b18:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    6b1a:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    6b1c:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    6b1e:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    6b20:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    6b22:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    6b24:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    6b26:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    6b28:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    6b2a:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    6b2c:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    6b2e:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    6b30:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    6b32:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    6b34:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    6b36:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    6b38:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    6b3a:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    6b3c:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    6b3e:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    6b40:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    6b42:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    6b44:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    6b46:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    6b48:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    6b4a:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    6b4c:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    6b4e:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    6b50:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    6b52:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    6b54:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    6b56:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    6b58:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    6b5a:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    6b5c:	.short 0xff6a
