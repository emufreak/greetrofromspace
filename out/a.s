
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
       4:	       move.l #280322,d3
       a:	       subi.l #280322,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #280322,d0
      18:	       cmpi.l #280322,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 44702 <__fini_array_end>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #280322,d3
      38:	       subi.l #280322,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #280322,d0
      46:	       cmpi.l #280322,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 44702 <__fini_array_end>,a2
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
      70:	                                                                      move.l a6,89e4c <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                                      move.l #14675968,89e48 <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                                      lea 3c551 <incbin_MercuryLetterData2Lz4_end+0x119>,a1
      86:	                                                                      moveq #0,d0
      88:	                                                                      jsr -552(a6)
      8c:	                                                                      move.l d0,89e44 <GfxBase>
	if (!GfxBase)
      92:	               /----------------------------------------------------- beq.w 938 <main+0x8d2>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                                      movea.l 89e4c <SysBase>,a6
      9c:	               |                                                      lea 3c562 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
      a2:	               |                                                      moveq #0,d0
      a4:	               |                                                      jsr -552(a6)
      a8:	               |                                                      move.l d0,89e40 <DOSBase>
	if (!DOSBase)
      ae:	         /-----|----------------------------------------------------- beq.w 8d4 <main+0x86e>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|----------------------------------------------------> pea 3c56e <incbin_MercuryLetterData2Lz4_end+0x136>
      b8:	         |  |  |                                                      lea 2550 <KPrintF>,a3
      be:	         |  |  |                                                      jsr (a3)
#endif
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
      c0:	         |  |  |                                                      movea.l 89e40 <DOSBase>,a6
      c6:	         |  |  |                                                      jsr -60(a6)
      ca:	         |  |  |                                                      movea.l 89e40 <DOSBase>,a6
      d0:	         |  |  |                                                      move.l d0,d1
      d2:	         |  |  |                                                      move.l #247178,d2
      d8:	         |  |  |                                                      moveq #20,d3
      da:	         |  |  |                                                      jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                                      movea.l 89e40 <DOSBase>,a6
      e4:	         |  |  |                                                      moveq #50,d1
      e6:	         |  |  |                                                      jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
      ea:	         |  |  |                                                      lea 65be8 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      f0:	         |  |  |                                                      suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      f2:	         |  |  |                                                      suba.l a2,a2
		__asm volatile (
      f4:	         |  |  |                                                      movem.l d1-d7/a3-a6,-(sp)
      f8:	         |  |  |                                                      jsr 6ba0 <_P61_Init>
      fe:	         |  |  |                                                      movem.l (sp)+,d1-d7/a3-a6

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     102:	         |  |  |                                                      addq.l #4,sp
     104:	         |  |  |                                                      tst.l d0
     106:	         |  |  |  /-------------------------------------------------- bne.w 852 <main+0x7ec>
	Forbid();
     10a:	         |  |  |  |  /----------------------------------------------> movea.l 89e4c <SysBase>,a6
     110:	         |  |  |  |  |                                                jsr -132(a6)
	SystemADKCON=custom->adkconr;
     114:	         |  |  |  |  |                                                movea.l 89e48 <custom>,a0
     11a:	         |  |  |  |  |                                                move.w 16(a0),d0
	SystemInts=custom->intenar;
     11e:	         |  |  |  |  |                                                move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     122:	         |  |  |  |  |                                                move.w 2(a0),d0
	LoadView(0);
     126:	         |  |  |  |  |                                                movea.l 89e44 <GfxBase>,a6
     12c:	         |  |  |  |  |                                                suba.l a1,a1
     12e:	         |  |  |  |  |                                                jsr -222(a6)
	WaitTOF();
     132:	         |  |  |  |  |                                                movea.l 89e44 <GfxBase>,a6
     138:	         |  |  |  |  |                                                jsr -270(a6)
	WaitTOF();
     13c:	         |  |  |  |  |                                                movea.l 89e44 <GfxBase>,a6
     142:	         |  |  |  |  |                                                jsr -270(a6)
	WaitVbl();
     146:	         |  |  |  |  |                                                lea c02 <WaitVbl>,a2
     14c:	         |  |  |  |  |                                                jsr (a2)
	WaitVbl();
     14e:	         |  |  |  |  |                                                jsr (a2)
	OwnBlitter();
     150:	         |  |  |  |  |                                                movea.l 89e44 <GfxBase>,a6
     156:	         |  |  |  |  |                                                jsr -456(a6)
	WaitBlit();	
     15a:	         |  |  |  |  |                                                movea.l 89e44 <GfxBase>,a6
     160:	         |  |  |  |  |                                                jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     164:	         |  |  |  |  |                                                movea.l 89e48 <custom>,a0
     16a:	         |  |  |  |  |                                                move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     170:	         |  |  |  |  |                                                move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     176:	         |  |  |  |  |                                                move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     17c:	         |  |  |  |  |                                                moveq #0,d1
		custom->color[a]=0;
     17e:	         |  |  |  |  |  /-------------------------------------------> move.l d1,d0
     180:	         |  |  |  |  |  |                                             addi.l #192,d0
     186:	         |  |  |  |  |  |                                             add.l d0,d0
     188:	         |  |  |  |  |  |                                             move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     18e:	         |  |  |  |  |  |                                             addq.l #1,d1
     190:	         |  |  |  |  |  |                                             moveq #32,d0
     192:	         |  |  |  |  |  |                                             cmp.l d1,d0
     194:	         |  |  |  |  |  +-------------------------------------------- bne.s 17e <main+0x118>
	WaitVbl();
     196:	         |  |  |  |  |  |                                             jsr (a2)
	WaitVbl();
     198:	         |  |  |  |  |  |                                             jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     19a:	         |  |  |  |  |  |                                             move.w #20090,46(sp)
     1a0:	         |  |  |  |  |  |                                             move.w #2049,48(sp)
     1a6:	         |  |  |  |  |  |                                             move.w #20083,50(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     1ac:	         |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     1b2:	         |  |  |  |  |  |                                             btst #0,297(a6)
     1b8:	/--------|--|--|--|--|--|-------------------------------------------- beq.w b90 <main+0xb2a>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1bc:	|        |  |  |  |  |  |                                             moveq #46,d7
     1be:	|        |  |  |  |  |  |                                             add.l sp,d7
     1c0:	|        |  |  |  |  |  |                                             exg d7,a5
     1c2:	|        |  |  |  |  |  |                                             jsr -30(a6)
     1c6:	|        |  |  |  |  |  |                                             exg d7,a5
	VBR=GetVBR();
     1c8:	|        |  |  |  |  |  |                                             move.l d0,89d32 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1ce:	|        |  |  |  |  |  |                                             movea.l 89d32 <VBR>,a0
     1d4:	|        |  |  |  |  |  |                                             move.l 108(a0),d0
		KPrintF("p61Init failed!\n");
#endif
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     1d8:	|        |  |  |  |  |  |                                             jsr (a2)

	Sw_PrepareDisplay();
     1da:	|        |  |  |  |  |  |                                             jsr 4cb8 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     1e0:	|        |  |  |  |  |  |                                             movea.l 89e48 <custom>,a0
     1e6:	|        |  |  |  |  |  |                                             move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     1ec:	|        |  |  |  |  |  |                                             move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
     1f2:	|        |  |  |  |  |  |                                             lea c9c <Sw_Run>,a4
     1f8:	|        |  |  |  |  |  |                                             tst.w 89e3e <SwScrollerFinished>
     1fe:	|  /-----|--|--|--|--|--|-------------------------------------------- bne.s 20a <main+0x1a4>
		Sw_Run();
     200:	|  |  /--|--|--|--|--|--|-------------------------------------------> jsr (a4)
	while(SwScrollerFinished == 0) {
     202:	|  |  |  |  |  |  |  |  |                                             tst.w 89e3e <SwScrollerFinished>
     208:	|  |  +--|--|--|--|--|--|-------------------------------------------- beq.s 200 <main+0x19a>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     20a:	|  >--|--|--|--|--|--|--|-------------------------------------------> movea.l 89e4c <SysBase>,a6
     210:	|  |  |  |  |  |  |  |  |                                             movea.l 89d46 <Sw_ScreenBuffer1>,a1
     216:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     21c:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     220:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     226:	|  |  |  |  |  |  |  |  |                                             movea.l 89d42 <Sw_ScreenBuffer2>,a1
     22c:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     232:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer3, BPLSIZE*BPLDEPTH);
     236:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     23c:	|  |  |  |  |  |  |  |  |                                             movea.l 89d3e <Sw_ScreenBuffer3>,a1
     242:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     248:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     24c:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     252:	|  |  |  |  |  |  |  |  |                                             movea.l 89d3a <Sw_FontBuffer>,a1
     258:	|  |  |  |  |  |  |  |  |                                             move.l #4000,d0
     25e:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_font, 38000);
     262:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     268:	|  |  |  |  |  |  |  |  |                                             lea 6ed3c <incbin_Sw_font_start>,a1
     26e:	|  |  |  |  |  |  |  |  |                                             move.l #38000,d0
     274:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  RemIntServer( INTB_COPER, Sw_Vbint);
     278:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     27e:	|  |  |  |  |  |  |  |  |                                             moveq #4,d0
     280:	|  |  |  |  |  |  |  |  |                                             movea.l 89d36 <Sw_Vbint>,a1
     286:	|  |  |  |  |  |  |  |  |                                             jsr -174(a6)
	}
	Sw_Cleanup();

	WaitBlit();
     28a:	|  |  |  |  |  |  |  |  |                                             movea.l 89e44 <GfxBase>,a6
     290:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
		
	custom->dmacon = 0x83ff;
     294:	|  |  |  |  |  |  |  |  |                                             movea.l 89e48 <custom>,a0
     29a:	|  |  |  |  |  |  |  |  |                                             move.w #-31745,150(a0)
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     2a0:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     2a6:	|  |  |  |  |  |  |  |  |                                             moveq #22,d0
     2a8:	|  |  |  |  |  |  |  |  |                                             move.l #65537,d1
     2ae:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2b2:	|  |  |  |  |  |  |  |  |                                             movea.l d0,a1
     2b4:	|  |  |  |  |  |  |  |  |                                             move.l d0,89e16 <Vbint>
     2ba:	|  |  |  |  |  |  |  |  |                                         /-- beq.s 2d6 <main+0x270>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     2bc:	|  |  |  |  |  |  |  |  |                                         |   move.w #708,8(a1)
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
     2c2:	|  |  |  |  |  |  |  |  |                                         |   move.l #246950,10(a1)
    Vbint->is_Data = NULL;
     2ca:	|  |  |  |  |  |  |  |  |                                         |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     2ce:	|  |  |  |  |  |  |  |  |                                         |   move.l #3144,18(a1)
  }

  AddIntServer( INTB_VERTB, Vbint); 
     2d6:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89e4c <SysBase>,a6
     2dc:	|  |  |  |  |  |  |  |  |                                             moveq #5,d0
     2de:	|  |  |  |  |  |  |  |  |                                             jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     2e2:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     2e8:	|  |  |  |  |  |  |  |  |                                             move.l #25000,d0
     2ee:	|  |  |  |  |  |  |  |  |                                             moveq #0,d1
     2f0:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2f4:	|  |  |  |  |  |  |  |  |                                             move.l d0,89e36 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     2fa:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     300:	|  |  |  |  |  |  |  |  |                                             move.l #120000,d0
     306:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     308:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     30c:	|  |  |  |  |  |  |  |  |                                             move.l d0,89e32 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     312:	|  |  |  |  |  |  |  |  |                                             pea 3 <_start+0x3>
     316:	|  |  |  |  |  |  |  |  |                                             pea 2710 <DrawRect+0x14e>
     31a:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     31c:	|  |  |  |  |  |  |  |  |                                             lea c68 <Utils_FillLong.constprop.0>,a4
     322:	|  |  |  |  |  |  |  |  |                                             jsr (a4)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     324:	|  |  |  |  |  |  |  |  |                                             movea.l 89e44 <GfxBase>,a6
     32a:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     32e:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff044 <_end+0xd751f4>
  custom->bltalwm = 0xffff; //Static
     336:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff046 <_end+0xd751f6>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     33e:	|  |  |  |  |  |  |  |  |                                             move.l 89e32 <LineBuffer>,d5
  for( WORD i=0;i <=5;i++) {
     344:	|  |  |  |  |  |  |  |  |                                             movea.l d5,a1
     346:	|  |  |  |  |  |  |  |  |                                             lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     34a:	|  |  |  |  |  |  |  |  |                                             moveq #0,d6
  for( WORD i=0;i <=5;i++) {
     34c:	|  |  |  |  |  |  |  |  |                                             clr.w d4
      data = data >> i2;
     34e:	|  |  |  |  |  |  |  |  |                                             moveq #0,d3
     350:	|  |  |  |  |  |  |  |  |                                             not.w d3
	APTR vbr = 0;
     352:	|  |  |  |  |  |  |  |  |                                             movea.l a1,a0
     354:	|  |  |  |  |  |  |  |  |                                             moveq #1,d1
     356:	|  |  |  |  |  |  |  |  |                                   /-------> move.l d3,d2
     358:	|  |  |  |  |  |  |  |  |                                   |         asr.l d1,d2
      data = data ^ 0xffff;
     35a:	|  |  |  |  |  |  |  |  |                                   |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     35c:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     362:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd751b2>,d0
     368:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     36c:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 362 <main+0x2fc>
  custom->bltcon0 = 0x01f0;
     36e:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0;
     376:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd751f2>
  custom->bltadat = data;
     37e:	|  |  |  |  |  |  |  |  |                                   |         move.w d2,dff074 <_end+0xd75224>
  custom->bltdpt = Target;  
     384:	|  |  |  |  |  |  |  |  |                                   |         move.l a0,dff054 <_end+0xd75204>
  custom->bltdmod = mod;
     38a:	|  |  |  |  |  |  |  |  |                                   |         move.w #10,dff066 <_end+0xd75216>
  custom->bltsize = lines*64+linelength;
     392:	|  |  |  |  |  |  |  |  |                                   |         move.w #6401,dff058 <_end+0xd75208>
    for( WORD i2=1;i2<=16; i2++) {        
     39a:	|  |  |  |  |  |  |  |  |                                   |         addq.l #1,d1
     39c:	|  |  |  |  |  |  |  |  |                                   |         lea 1200(a0),a0
     3a0:	|  |  |  |  |  |  |  |  |                                   |         moveq #17,d0
     3a2:	|  |  |  |  |  |  |  |  |                                   |         cmp.l d1,d0
     3a4:	|  |  |  |  |  |  |  |  |                                   +-------- bne.s 356 <main+0x2f0>
    if( i > 0) {
     3a6:	|  |  |  |  |  |  |  |  |                                   |         tst.w d4
     3a8:	|  |  |  |  |  |  |  |  |                                   |     /-- bne.s 3be <main+0x358>
    startbuffer += repeats*linesize*2*16;
     3aa:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     3b0:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     3b4:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     3b6:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d4
     3b8:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     3ba:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     3bc:	|  |  |  |  |  |  |  |  |                                   +-----|-- bra.s 356 <main+0x2f0>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     3be:	|  |  |  |  |  |  |  |  |                                   |     \-> moveq #12,d0
     3c0:	|  |  |  |  |  |  |  |  |                                   |         sub.w d6,d0
     3c2:	|  |  |  |  |  |  |  |  |                                   |         movea.w d0,a0
     3c4:	|  |  |  |  |  |  |  |  |                                   |         movea.w d4,a5
     3c6:	|  |  |  |  |  |  |  |  |                                   |         lea -32768(a5),a5
     3ca:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d1
     3cc:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d2
     3ce:	|  |  |  |  |  |  |  |  |                                   |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     3d4:	|  |  |  |  |  |  |  |  |                                   |  /----> move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3da:	|  |  |  |  |  |  |  |  |                                   |  |  /-> move.w dff002 <_end+0xd751b2>,d0
     3e0:	|  |  |  |  |  |  |  |  |                                   |  |  |   btst #14,d0
     3e4:	|  |  |  |  |  |  |  |  |                                   |  |  \-- bne.s 3da <main+0x374>
  custom->bltcon0 = 0x01f0;
     3e6:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #496,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0;
     3ee:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #0,dff042 <_end+0xd751f2>
  custom->bltadat = data;
     3f6:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #-1,dff074 <_end+0xd75224>
  custom->bltdpt = Target;  
     3fe:	|  |  |  |  |  |  |  |  |                                   |  |      move.l d1,dff054 <_end+0xd75204>
  custom->bltdmod = mod;
     404:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a0,dff066 <_end+0xd75216>
  custom->bltsize = lines*64+linelength;
     40a:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a5,dff058 <_end+0xd75208>
      while( height > 512) {
     410:	|  |  |  |  |  |  |  |  |                                   |  |      addi.l #6144,d1
     416:	|  |  |  |  |  |  |  |  |                                   |  |      cmp.l d2,d1
     418:	|  |  |  |  |  |  |  |  |                                   |  \----- bne.s 3d4 <main+0x36e>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     41a:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     420:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd751b2>,d0
     426:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     42a:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 420 <main+0x3ba>
  custom->bltcon0 = 0x01f0;
     42c:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0;
     434:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd751f2>
  custom->bltadat = data;
     43c:	|  |  |  |  |  |  |  |  |                                   |         move.w #-1,dff074 <_end+0xd75224>
  custom->bltdpt = Target;  
     444:	|  |  |  |  |  |  |  |  |                                   |         move.l d1,dff054 <_end+0xd75204>
  custom->bltdmod = mod;
     44a:	|  |  |  |  |  |  |  |  |                                   |         move.w a0,dff066 <_end+0xd75216>
  custom->bltsize = lines*64+linelength;
     450:	|  |  |  |  |  |  |  |  |                                   |         move.w d4,d0
     452:	|  |  |  |  |  |  |  |  |                                   |         addi.w #4096,d0
     456:	|  |  |  |  |  |  |  |  |                                   |         move.w d0,dff058 <_end+0xd75208>
  for( WORD i=0;i <=5;i++) {
     45c:	|  |  |  |  |  |  |  |  |                                   |         addi.w #-4095,d0
     460:	|  |  |  |  |  |  |  |  |                                   |         cmpi.w #5,d4
     464:	|  |  |  |  |  |  |  |  |                                   |     /-- beq.s 47c <main+0x416>
    startbuffer += repeats*linesize*2*16;
     466:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     46c:	|  |  |  |  |  |  |  |  |                                   |     |   move.w d0,d4
     46e:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     472:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     474:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     476:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     478:	|  |  |  |  |  |  |  |  |                                   \-----|-- bra.w 356 <main+0x2f0>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     47c:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89e4c <SysBase>,a6
     482:	|  |  |  |  |  |  |  |  |                                             move.l #33024,d0
     488:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     48a:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     48e:	|  |  |  |  |  |  |  |  |                                             move.l d0,d2
     490:	|  |  |  |  |  |  |  |  |                                             move.l d0,89e2e <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     496:	|  |  |  |  |  |  |  |  |                                             pea 10 <_start+0x10>
     49a:	|  |  |  |  |  |  |  |  |                                             pea 204 <main+0x19e>
     49e:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     4a0:	|  |  |  |  |  |  |  |  |                                             jsr (a4)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     4a2:	|  |  |  |  |  |  |  |  |                                             pea 2 <_start+0x2>
     4a6:	|  |  |  |  |  |  |  |  |                                             pea 100 <main+0x9a>
     4aa:	|  |  |  |  |  |  |  |  |                                             pea 3c5b1 <incbin_MercuryLetterData2Lz4_end+0x179>
     4b0:	|  |  |  |  |  |  |  |  |                                             move.l d2,-(sp)
     4b2:	|  |  |  |  |  |  |  |  |                                             lea 443a <debug_register_bitmap.constprop.0>,a5
     4b8:	|  |  |  |  |  |  |  |  |                                             jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4ba:	|  |  |  |  |  |  |  |  |                                             movea.l 89e4c <SysBase>,a6
     4c0:	|  |  |  |  |  |  |  |  |                                             move.l #49536,d0
     4c6:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     4c8:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     4cc:	|  |  |  |  |  |  |  |  |                                             move.l d0,89e2a <Bitmap1>
  if(Bitmap1 == 0) {
     4d2:	|  |  |  |  |  |  |  |  |                                             lea 28(sp),sp
     4d6:	|  |  |  |  |  |  |  |  |        /----------------------------------- beq.w b06 <main+0xaa0>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     4da:	|  |  |  |  |  |  |  |  |        |                                    pea 3 <_start+0x3>
     4de:	|  |  |  |  |  |  |  |  |        |                                    pea 100 <main+0x9a>
     4e2:	|  |  |  |  |  |  |  |  |        |                                    pea 3c5e2 <incbin_MercuryLetterData2Lz4_end+0x1aa>
     4e8:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,-(sp)
     4ea:	|  |  |  |  |  |  |  |  |        |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     4ec:	|  |  |  |  |  |  |  |  |        |                                    move.l 89e2a <Bitmap1>,d2
     4f2:	|  |  |  |  |  |  |  |  |        |                                    pea 10 <_start+0x10>
     4f6:	|  |  |  |  |  |  |  |  |        |                                    pea 306 <main+0x2a0>
     4fa:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,-(sp)
     4fc:	|  |  |  |  |  |  |  |  |        |                                    jsr (a4)

  ScreenBuffer1.BitPlane = Bitmap1;
     4fe:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,89dde <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     504:	|  |  |  |  |  |  |  |  |        |                                    clr.l 89de2 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     50a:	|  |  |  |  |  |  |  |  |        |                                    clr.l 89dee <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     510:	|  |  |  |  |  |  |  |  |        |                                    movea.l 89e4c <SysBase>,a6
     516:	|  |  |  |  |  |  |  |  |        |                                    move.l #49536,d0
     51c:	|  |  |  |  |  |  |  |  |        |                                    moveq #2,d1
     51e:	|  |  |  |  |  |  |  |  |        |                                    jsr -198(a6)
     522:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,89e26 <Bitmap2>
  if(Bitmap2 == 0) {
     528:	|  |  |  |  |  |  |  |  |        |                                    lea 28(sp),sp
     52c:	|  |  |  |  |  |  |  |  |  /-----|----------------------------------- beq.w a7c <main+0xa16>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     530:	|  |  |  |  |  |  |  |  |  |  /--|----------------------------------> pea 3 <_start+0x3>
     534:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     538:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 3c613 <incbin_MercuryLetterData2Lz4_end+0x1db>
     53e:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     540:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     542:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l 89e26 <Bitmap2>,d2
     548:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     54c:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 306 <main+0x2a0>
     550:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     552:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a4)

  ScreenBuffer2.BitPlane = Bitmap2;
     554:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,89da6 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     55a:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 89daa <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     560:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 89db6 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     566:	|  |  |  |  |  |  |  |  |  |  |  |                                    movea.l 89e4c <SysBase>,a6
     56c:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     572:	|  |  |  |  |  |  |  |  |  |  |  |                                    moveq #2,d1
     574:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     578:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,89e22 <Bitmap3>
  if(Bitmap3 == 0) {
     57e:	|  |  |  |  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     582:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------------------- beq.w 964 <main+0x8fe>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     586:	|  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------------> pea 3 <_start+0x3>
     58a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 100 <main+0x9a>
     58e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 3c644 <incbin_MercuryLetterData2Lz4_end+0x20c>
     594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,-(sp)
     596:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     598:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l 89e22 <Bitmap3>,d2
     59e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 10 <_start+0x10>
     5a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 306 <main+0x2a0>
     5a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,-(sp)
     5a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)

  ScreenBuffer3.BitPlane = Bitmap3;
     5aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 89d6e <ScreenBuffer3>,a4
     5b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,(a4)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     5b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 89d72 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     5b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 89d7e <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     5be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 2154 <Clbuild>,a5
     5c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d2
  DrawCopper = Clbuild( );
     5c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d3
     5cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,89e1e <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     5d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564702,89d4a <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     5dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564646,89d4e <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     5e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89d52 <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     5ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89d56 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     5f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564702,89d5a <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     5fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564646,89d5e <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     606:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564646,89d62 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     610:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89d66 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     616:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564702,89d6a <ScreenBufferList+0x20>

  SetBplPointers(); 
     620:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 24b4 <SetBplPointers>,a4
     626:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     628:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,89e1e <DrawCopper>
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
     62e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,dff080 <_end+0xd75230>
	PrepareDisplay();	
	custom->intena=0xc020;//Enable vblank
     634:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              movea.l 89e48 <custom>,a0
     63a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
     640:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)
  DrawCopper = ViewCopper;
     642:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,89e1e <DrawCopper>
  ViewCopper = tmp;
     648:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,89e1a <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     64e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,dff080 <_end+0xd75230>
	//LoadVectors();
	SwapCl();
	WaitVbl();	
     654:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)

	while( CubeFinished == 0) {		
     656:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 28(sp),sp
     65a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 507c <DrawScreen>,a5
     660:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              tst.w 89e3a <CubeFinished>
     666:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------------------- bne.s 6e0 <main+0x67a>
		DrawScreen();
     668:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------> jsr (a5)
		SetBplPointers();
     66a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a4)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     66c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w f0ff60 <_end+0xe86110>,d0
     672:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        cmpi.w #20153,d0
     676:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-------------- beq.w 826 <main+0x7c0>
     67a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |               cmpi.w #-24562,d0
     67e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        +-------------- beq.w 826 <main+0x7c0>
		debug_start_idle();
		while(FrameCounter<2);
     682:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-------------> move.w 89e3c <FrameCounter>,d0
     688:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               cmpi.w #1,d0
     68c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-------------- bls.s 682 <main+0x61c>
		if(FrameCounter >= 3) {
     68e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-------------> move.w 89e3c <FrameCounter>,d0
     694:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #2,d0
     698:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----- bhi.w 7c2 <main+0x75c>
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
     69c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w #0,89e3c <FrameCounter>
		WaitVbl();
     6a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      jsr (a2)
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w f0ff60 <_end+0xe86110>,d0
     6ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      cmpi.w #20153,d0
     6b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----- beq.w 7e4 <main+0x77e>
     6b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|----> cmpi.w #-24562,d0
     6b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- beq.w 7e4 <main+0x77e>
  UBYTE *tmp = DrawCopper;
     6bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 89e1e <DrawCopper>,d0
  DrawCopper = ViewCopper;
     6c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 89e1a <ViewCopper>,89e1e <DrawCopper>
  ViewCopper = tmp;
     6cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,89e1a <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     6d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,dff080 <_end+0xd75230>
	while( CubeFinished == 0) {		
     6d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w 89e3a <CubeFinished>
     6de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|----- beq.s 668 <main+0x602>
  FreeMem(WorkingMem, 25000);
     6e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|----> movea.l 89e4c <SysBase>,a6
     6e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e36 <WorkingMem>,a1
     6ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #25000,d0
     6f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
     6f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     6fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e32 <LineBuffer>,a1
     702:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #120000,d0
     708:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
     70c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     712:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e2e <PrepareBuffer>,a1
     718:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #33024,d0
     71e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
     722:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     728:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e2a <Bitmap1>,a1
     72e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     734:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
     738:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     73e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e26 <Bitmap2>,a1
     744:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     74a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
     74e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     754:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e22 <Bitmap3>,a1
     75a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     760:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
     764:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     76a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e1e <DrawCopper>,a1
     770:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     776:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
     77a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     780:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e1a <ViewCopper>,a1
     786:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     78c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
     790:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
     796:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #5,d0
     798:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e16 <Vbint>,a1
     79e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -174(a6)
		debug_stop_idle();
		SwapCl();
	}

	CleanUp( );
	WaitVbl();
     7a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr (a2)
	custom->dmacon = 0x83ff;
     7a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89e48 <custom>,a0
     7aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     7b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-8160,154(a0)
	
	End_PrepareDisplay();
     7b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr 4a56 <End_PrepareDisplay.isra.0>

	while(1) {
		WaitVbl();
     7bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> jsr (a2)
     7be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a2)
	while(1) {
     7c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-- bra.s 7bc <main+0x756>
    		KPrintF("Framerate below 25FPS\n");
     7c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> pea 3c650 <incbin_MercuryLetterData2Lz4_end+0x218>
     7c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a3)
     7ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.l #4,sp
		FrameCounter = 0;
     7cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #0,89e3c <FrameCounter>
		WaitVbl();
     7d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a2)
     7d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w f0ff60 <_end+0xe86110>,d0
     7dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #20153,d0
     7e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- bne.w 6b4 <main+0x64e>
		UaeLib(88, arg1, arg2, arg3, arg4);
     7e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> clr.l -(sp)
     7e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 5 <_start+0x5>
     7ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 58 <_start+0x58>
     7f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jsr f0ff60 <_end+0xe86110>
	}
}
     7f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     7fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 89e1e <DrawCopper>,d0
  DrawCopper = ViewCopper;
     802:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 89e1a <ViewCopper>,89e1e <DrawCopper>
  ViewCopper = tmp;
     80c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,89e1a <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     812:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,dff080 <_end+0xd75230>
	while( CubeFinished == 0) {		
     818:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               tst.w 89e3a <CubeFinished>
     81e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|-------------- beq.w 668 <main+0x602>
     822:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-------------- bra.w 6e0 <main+0x67a>
		UaeLib(88, arg1, arg2, arg3, arg4);
     826:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------------> clr.l -(sp)
     828:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  clr.l -(sp)
     82a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 1 <_start+0x1>
     82e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 5 <_start+0x5>
     832:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 58 <_start+0x58>
     836:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  jsr f0ff60 <_end+0xe86110>
}
     83c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  lea 20(sp),sp
		while(FrameCounter<2);
     840:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  move.w 89e3c <FrameCounter>,d0
     846:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  cmpi.w #1,d0
     84a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|----------------- bls.w 682 <main+0x61c>
     84e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \----------------- bra.w 68e <main+0x628>
		KPrintF("p61Init failed!\n");
     852:	|  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|----------------------> pea 3c5a0 <incbin_MercuryLetterData2Lz4_end+0x168>
     858:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a3)
     85a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        addq.l #4,sp
	Forbid();
     85c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e4c <SysBase>,a6
     862:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -132(a6)
	SystemADKCON=custom->adkconr;
     866:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e48 <custom>,a0
     86c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 16(a0),d0
	SystemInts=custom->intenar;
     870:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     874:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 2(a0),d0
	LoadView(0);
     878:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e44 <GfxBase>,a6
     87e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        suba.l a1,a1
     880:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -222(a6)
	WaitTOF();
     884:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e44 <GfxBase>,a6
     88a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitTOF();
     88e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e44 <GfxBase>,a6
     894:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitVbl();
     898:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        lea c02 <WaitVbl>,a2
     89e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	WaitVbl();
     8a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	OwnBlitter();
     8a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e44 <GfxBase>,a6
     8a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -456(a6)
	WaitBlit();	
     8ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e44 <GfxBase>,a6
     8b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     8b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89e48 <custom>,a0
     8bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     8c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     8c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     8ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        moveq #0,d1
     8d0:	|  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|----------------------- bra.w 17e <main+0x118>
		Exit(0);
     8d4:	|  |  |  >--|--|--|--|-----|--|--|--|--|--|--|----------------------> suba.l a6,a6
     8d6:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #0,d1
     8d8:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     8dc:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        pea 3c56e <incbin_MercuryLetterData2Lz4_end+0x136>
     8e2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 2550 <KPrintF>,a3
     8e8:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a3)
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
     8ea:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89e40 <DOSBase>,a6
     8f0:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -60(a6)
     8f4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89e40 <DOSBase>,a6
     8fa:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l d0,d1
     8fc:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l #247178,d2
     902:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #20,d3
     904:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -48(a6)
	Delay(50);
     908:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89e40 <DOSBase>,a6
     90e:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #50,d1
     910:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
     914:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 65be8 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     91a:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     91c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a2,a2
		__asm volatile (
     91e:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l d1-d7/a3-a6,-(sp)
     922:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr 6ba0 <_P61_Init>
     928:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l (sp)+,d1-d7/a3-a6
	if(p61Init(module) != 0)
     92c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        addq.l #4,sp
     92e:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        tst.l d0
     930:	|  |  |  |  |  |  |  \-----|--|--|--|--|--|--|----------------------- beq.w 10a <main+0xa4>
     934:	|  |  |  |  |  |  \--------|--|--|--|--|--|--|----------------------- bra.w 852 <main+0x7ec>
		Exit(0);
     938:	|  |  |  |  |  \-----------|--|--|--|--|--|--|----------------------> movea.l 89e40 <DOSBase>,a6
     93e:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d1
     940:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     944:	|  |  |  |  |              |  |  |  |  |  |  |                        movea.l 89e4c <SysBase>,a6
     94a:	|  |  |  |  |              |  |  |  |  |  |  |                        lea 3c562 <incbin_MercuryLetterData2Lz4_end+0x12a>,a1
     950:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d0
     952:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -552(a6)
     956:	|  |  |  |  |              |  |  |  |  |  |  |                        move.l d0,89e40 <DOSBase>
	if (!DOSBase)
     95c:	|  |  |  |  \--------------|--|--|--|--|--|--|----------------------- bne.w b2 <main+0x4c>
     960:	|  |  |  \-----------------|--|--|--|--|--|--|----------------------- bra.w 8d4 <main+0x86e>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     964:	|  |  |                    |  |  |  >--|--|--|----------------------> movea.l 89e40 <DOSBase>,a6
     96a:	|  |  |                    |  |  |  |  |  |  |                        jsr -60(a6)
     96e:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89e40 <DOSBase>,a6
     974:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d1
     976:	|  |  |                    |  |  |  |  |  |  |                        move.l #247327,d2
     97c:	|  |  |                    |  |  |  |  |  |  |                        moveq #38,d3
     97e:	|  |  |                    |  |  |  |  |  |  |                        jsr -48(a6)
    Exit(1);
     982:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89e40 <DOSBase>,a6
     988:	|  |  |                    |  |  |  |  |  |  |                        moveq #1,d1
     98a:	|  |  |                    |  |  |  |  |  |  |                        jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     98e:	|  |  |                    |  |  |  |  |  |  |                        move.l 89e22 <Bitmap3>,d0
     994:	|  |  |                    |  |  |  |  |  |  |                        pea 3 <_start+0x3>
     998:	|  |  |                    |  |  |  |  |  |  |                        pea 100 <main+0x9a>
     99c:	|  |  |                    |  |  |  |  |  |  |                        pea 3c644 <incbin_MercuryLetterData2Lz4_end+0x20c>
     9a2:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,-(sp)
     9a4:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     9a6:	|  |  |                    |  |  |  |  |  |  |                        move.l 89e22 <Bitmap3>,d2
     9ac:	|  |  |                    |  |  |  |  |  |  |                        pea 10 <_start+0x10>
     9b0:	|  |  |                    |  |  |  |  |  |  |                        pea 306 <main+0x2a0>
     9b4:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,-(sp)
     9b6:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  ScreenBuffer3.BitPlane = Bitmap3;
     9b8:	|  |  |                    |  |  |  |  |  |  |                        lea 89d6e <ScreenBuffer3>,a4
     9be:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,(a4)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     9c0:	|  |  |                    |  |  |  |  |  |  |                        clr.l 89d72 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     9c6:	|  |  |                    |  |  |  |  |  |  |                        clr.l 89d7e <ScreenBuffer3+0x10>
  ViewCopper = Clbuild( );
     9cc:	|  |  |                    |  |  |  |  |  |  |                        lea 2154 <Clbuild>,a5
     9d2:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9d4:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d2
  DrawCopper = Clbuild( );
     9d6:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9d8:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d3
     9da:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,89e1e <DrawCopper>
  ScreenBufferList[0] = &ScreenBuffer1;
     9e0:	|  |  |                    |  |  |  |  |  |  |                        move.l #564702,89d4a <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     9ea:	|  |  |                    |  |  |  |  |  |  |                        move.l #564646,89d4e <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     9f4:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89d52 <ScreenBufferList+0x8>
  ScreenBufferList[3] = &ScreenBuffer3;
     9fa:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89d56 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     a00:	|  |  |                    |  |  |  |  |  |  |                        move.l #564702,89d5a <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     a0a:	|  |  |                    |  |  |  |  |  |  |                        move.l #564646,89d5e <ScreenBufferList+0x14>
  ScreenBufferList[6] = &ScreenBuffer2;
     a14:	|  |  |                    |  |  |  |  |  |  |                        move.l #564646,89d62 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     a1e:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89d66 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     a24:	|  |  |                    |  |  |  |  |  |  |                        move.l #564702,89d6a <ScreenBufferList+0x20>
  SetBplPointers(); 
     a2e:	|  |  |                    |  |  |  |  |  |  |                        lea 24b4 <SetBplPointers>,a4
     a34:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  DrawCopper = ViewCopper;
     a36:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,89e1e <DrawCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a3c:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,dff080 <_end+0xd75230>
	custom->intena=0xc020;//Enable vblank
     a42:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89e48 <custom>,a0
     a48:	|  |  |                    |  |  |  |  |  |  |                        move.w #-16352,154(a0)
	SetBplPointers();
     a4e:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  DrawCopper = ViewCopper;
     a50:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,89e1e <DrawCopper>
  ViewCopper = tmp;
     a56:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,89e1a <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a5c:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,dff080 <_end+0xd75230>
	WaitVbl();	
     a62:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
	while( CubeFinished == 0) {		
     a64:	|  |  |                    |  |  |  |  |  |  |                        lea 28(sp),sp
     a68:	|  |  |                    |  |  |  |  |  |  |                        lea 507c <DrawScreen>,a5
     a6e:	|  |  |                    |  |  |  |  |  |  |                        tst.w 89e3a <CubeFinished>
     a74:	|  |  |                    |  |  |  |  |  |  \----------------------- beq.w 668 <main+0x602>
     a78:	|  |  |                    |  |  |  |  |  \-------------------------- bra.w 6e0 <main+0x67a>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     a7c:	|  |  |                    >--|--|--|--|----------------------------> movea.l 89e40 <DOSBase>,a6
     a82:	|  |  |                    |  |  |  |  |                              jsr -60(a6)
     a86:	|  |  |                    |  |  |  |  |                              movea.l 89e40 <DOSBase>,a6
     a8c:	|  |  |                    |  |  |  |  |                              move.l d0,d1
     a8e:	|  |  |                    |  |  |  |  |                              move.l #247278,d2
     a94:	|  |  |                    |  |  |  |  |                              moveq #38,d3
     a96:	|  |  |                    |  |  |  |  |                              jsr -48(a6)
    Exit(1);
     a9a:	|  |  |                    |  |  |  |  |                              movea.l 89e40 <DOSBase>,a6
     aa0:	|  |  |                    |  |  |  |  |                              moveq #1,d1
     aa2:	|  |  |                    |  |  |  |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     aa6:	|  |  |                    |  |  |  |  |                              move.l 89e26 <Bitmap2>,d0
     aac:	|  |  |                    |  |  |  |  |                              pea 3 <_start+0x3>
     ab0:	|  |  |                    |  |  |  |  |                              pea 100 <main+0x9a>
     ab4:	|  |  |                    |  |  |  |  |                              pea 3c613 <incbin_MercuryLetterData2Lz4_end+0x1db>
     aba:	|  |  |                    |  |  |  |  |                              move.l d0,-(sp)
     abc:	|  |  |                    |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     abe:	|  |  |                    |  |  |  |  |                              move.l 89e26 <Bitmap2>,d2
     ac4:	|  |  |                    |  |  |  |  |                              pea 10 <_start+0x10>
     ac8:	|  |  |                    |  |  |  |  |                              pea 306 <main+0x2a0>
     acc:	|  |  |                    |  |  |  |  |                              move.l d2,-(sp)
     ace:	|  |  |                    |  |  |  |  |                              jsr (a4)
  ScreenBuffer2.BitPlane = Bitmap2;
     ad0:	|  |  |                    |  |  |  |  |                              move.l d2,89da6 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     ad6:	|  |  |                    |  |  |  |  |                              clr.l 89daa <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     adc:	|  |  |                    |  |  |  |  |                              clr.l 89db6 <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     ae2:	|  |  |                    |  |  |  |  |                              movea.l 89e4c <SysBase>,a6
     ae8:	|  |  |                    |  |  |  |  |                              move.l #49536,d0
     aee:	|  |  |                    |  |  |  |  |                              moveq #2,d1
     af0:	|  |  |                    |  |  |  |  |                              jsr -198(a6)
     af4:	|  |  |                    |  |  |  |  |                              move.l d0,89e22 <Bitmap3>
  if(Bitmap3 == 0) {
     afa:	|  |  |                    |  |  |  |  |                              lea 28(sp),sp
     afe:	|  |  |                    |  |  |  |  \----------------------------- bne.w 586 <main+0x520>
     b02:	|  |  |                    |  |  |  \-------------------------------- bra.w 964 <main+0x8fe>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     b06:	|  |  |                    |  |  \----------------------------------> movea.l 89e40 <DOSBase>,a6
     b0c:	|  |  |                    |  |                                       jsr -60(a6)
     b10:	|  |  |                    |  |                                       movea.l 89e40 <DOSBase>,a6
     b16:	|  |  |                    |  |                                       move.l d0,d1
     b18:	|  |  |                    |  |                                       move.l #247229,d2
     b1e:	|  |  |                    |  |                                       moveq #38,d3
     b20:	|  |  |                    |  |                                       jsr -48(a6)
    Exit(1);
     b24:	|  |  |                    |  |                                       movea.l 89e40 <DOSBase>,a6
     b2a:	|  |  |                    |  |                                       moveq #1,d1
     b2c:	|  |  |                    |  |                                       jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     b30:	|  |  |                    |  |                                       move.l 89e2a <Bitmap1>,d0
     b36:	|  |  |                    |  |                                       pea 3 <_start+0x3>
     b3a:	|  |  |                    |  |                                       pea 100 <main+0x9a>
     b3e:	|  |  |                    |  |                                       pea 3c5e2 <incbin_MercuryLetterData2Lz4_end+0x1aa>
     b44:	|  |  |                    |  |                                       move.l d0,-(sp)
     b46:	|  |  |                    |  |                                       jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     b48:	|  |  |                    |  |                                       move.l 89e2a <Bitmap1>,d2
     b4e:	|  |  |                    |  |                                       pea 10 <_start+0x10>
     b52:	|  |  |                    |  |                                       pea 306 <main+0x2a0>
     b56:	|  |  |                    |  |                                       move.l d2,-(sp)
     b58:	|  |  |                    |  |                                       jsr (a4)
  ScreenBuffer1.BitPlane = Bitmap1;
     b5a:	|  |  |                    |  |                                       move.l d2,89dde <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     b60:	|  |  |                    |  |                                       clr.l 89de2 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     b66:	|  |  |                    |  |                                       clr.l 89dee <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     b6c:	|  |  |                    |  |                                       movea.l 89e4c <SysBase>,a6
     b72:	|  |  |                    |  |                                       move.l #49536,d0
     b78:	|  |  |                    |  |                                       moveq #2,d1
     b7a:	|  |  |                    |  |                                       jsr -198(a6)
     b7e:	|  |  |                    |  |                                       move.l d0,89e26 <Bitmap2>
  if(Bitmap2 == 0) {
     b84:	|  |  |                    |  |                                       lea 28(sp),sp
     b88:	|  |  |                    |  \-------------------------------------- bne.w 530 <main+0x4ca>
     b8c:	|  |  |                    \----------------------------------------- bra.w a7c <main+0xa16>
	APTR vbr = 0;
     b90:	\--|--|-------------------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     b92:	   |  |                                                               move.l d0,89d32 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     b98:	   |  |                                                               movea.l 89d32 <VBR>,a0
     b9e:	   |  |                                                               move.l 108(a0),d0
	WaitVbl();
     ba2:	   |  |                                                               jsr (a2)
	Sw_PrepareDisplay();
     ba4:	   |  |                                                               jsr 4cb8 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     baa:	   |  |                                                               movea.l 89e48 <custom>,a0
     bb0:	   |  |                                                               move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     bb6:	   |  |                                                               move.w #-8160,154(a0)
	while(SwScrollerFinished == 0) {
     bbc:	   |  |                                                               lea c9c <Sw_Run>,a4
     bc2:	   |  |                                                               tst.w 89e3e <SwScrollerFinished>
     bc8:	   |  \-------------------------------------------------------------- beq.w 200 <main+0x19a>
     bcc:	   \----------------------------------------------------------------- bra.w 20a <main+0x1a4>

00000bd0 <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     bd0:	subq.l #4,sp
     bd2:	move.l 16(sp),d0
     bd6:	move.w d0,d0
     bd8:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     bdc:	moveq #11,d0
     bde:	add.l 8(sp),d0
     be2:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     be4:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     be8:	moveq #0,d0
     bea:	move.w 2(sp),d0
	__asm volatile (
     bee:	movem.l d0-d7/a2-a6,-(sp)
     bf2:	jsr 5cb8 <_lz4_depack>
     bf8:	movem.l (sp)+,d0-d7/a2-a6
}
     bfc:	nop
     bfe:	addq.l #4,sp
     c00:	rts

00000c02 <WaitVbl>:
void WaitVbl() {
     c02:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c04:	/-> move.l dff004 <_end+0xd751b4>,d0
     c0a:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     c0c:	|   move.l (sp),d0
     c0e:	|   andi.l #130816,d0
     c14:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     c16:	|   move.l (sp),d0
     c18:	|   cmpi.l #79616,d0
     c1e:	\-- beq.s c04 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c20:	/-> move.l dff004 <_end+0xd751b4>,d0
     c26:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     c2a:	|   move.l 4(sp),d0
     c2e:	|   andi.l #130816,d0
     c34:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     c38:	|   move.l 4(sp),d0
     c3c:	|   cmpi.l #79616,d0
     c42:	\-- bne.s c20 <WaitVbl+0x1e>
}
     c44:	    addq.l #8,sp
     c46:	    rts

00000c48 <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     c48:	move.w #32,dff09c <_end+0xd7524c>
  custom->intreq = 1 << INTB_VERTB;
     c50:	move.w #32,dff09c <_end+0xd7524c>
  FrameCounter++;
     c58:	move.w 89e3c <FrameCounter>,d0
     c5e:	addq.w #1,d0
     c60:	move.w d0,89e3c <FrameCounter>
}
     c66:	rts

00000c68 <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
     c68:	    movem.l d2-d5/a2,-(sp)
     c6c:	    move.l 24(sp),d3
     c70:	    move.l 28(sp),d5
      *target++ = pattern;
     c74:	    move.l 32(sp),d4
     c78:	    add.l d4,d4
     c7a:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
     c7c:	    moveq #0,d2
     c7e:	    lea 59c4 <memset>(pc),a2
      *target++ = pattern;
     c82:	/-> move.l d4,-(sp)
     c84:	|   clr.l -(sp)
     c86:	|   move.l d3,-(sp)
     c88:	|   jsr (a2)
     c8a:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
     c8c:	|   addq.l #1,d2
     c8e:	|   lea 12(sp),sp
     c92:	|   cmp.l d2,d5
     c94:	\-- bne.s c82 <Utils_FillLong.constprop.0+0x1a>
}
     c96:	    movem.l (sp)+,d2-d5/a2
     c9a:	    rts

00000c9c <Sw_Run>:
void Sw_Run() {                                     
     c9c:	          movem.l d2-d4/a2-a4/a6,-(sp)
  if(Sw_framecount == 50) {
     ca0:	          move.l 65be2 <Sw_framecount>,d0
     ca6:	          moveq #50,d1
     ca8:	          cmp.l d0,d1
     caa:	   /----- beq.w fd6 <Sw_Run+0x33a>
  Sw_framecount++;
     cae:	   |      addq.l #1,d0
     cb0:	   |      move.l d0,65be2 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     cb6:	/--|----> move.w 89d30 <Sw_BlitFrame>,d0
     cbc:	+--|----- beq.s cb6 <Sw_Run+0x1a>
  *bp = 0;
     cbe:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     cc2:	|  |      move.w #0,89d30 <Sw_BlitFrame>
  WaitBlit();
     cca:	|  |      lea 89e44 <GfxBase>,a2
     cd0:	|  |      movea.l (a2),a6
     cd2:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     cd6:	|  |      movea.l 89e48 <custom>,a0
     cdc:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     ce2:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     ce8:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     cee:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     cf4:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     cfa:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     d00:	|  |      move.w #2544,64(a0)
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     d06:	|  |      move.l 65be2 <Sw_framecount>,d1
     d0c:	|  |      subq.l #1,d1
     d0e:	|  |      move.l d1,d0
     d10:	|  |      add.l d1,d0
     d12:	|  |      add.l d0,d0
     d14:	|  |      add.l d1,d0
     d16:	|  |      lsl.l #4,d0
     d18:	|  |      add.l 89d3a <Sw_FontBuffer>,d0
     d1e:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     d22:	|  |      move.l 89d2c <Sw_DrawBuffer>,d0
     d28:	|  |      addi.l #20400,d0
     d2e:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     d32:	|  |      move.w #104,88(a0)
  WaitBlit();
     d38:	|  |      movea.l (a2),a6
     d3a:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d3e:	|  |      movea.l 89e48 <custom>,a0
     d44:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     d4a:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     d50:	|  |      move.l 89d28 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     d58:	|  |      move.l 89d2c <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     d60:	|  |      lea 426e0 <Sw_CopyLines>,a3
     d66:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     d6c:	|  |      add.l d0,d0
     d6e:	|  |      move.w (0,a3,d0.l),d0
     d72:	|  |      lsl.w #6,d0
     d74:	|  |      addi.w #40,d0
     d78:	|  |      move.w d0,88(a0)
  WaitBlit();
     d7c:	|  |      movea.l (a2),a6
     d7e:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     d82:	|  |      movea.l 89e48 <custom>,a0
     d88:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     d8e:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     d94:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     d9a:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     da0:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     da6:	|  |      add.l d0,d0
     da8:	|  |      move.w (0,a3,d0.l),d1
     dac:	|  |      move.w d1,d0
     dae:	|  |      mulu.w #80,d0
     db2:	|  |      movea.l d0,a1
     db4:	|  |      lea 120(a1),a4
     db8:	|  |      move.l 89d28 <Sw_ViewBufferP1>,d0
     dbe:	|  |      add.l a4,d0
     dc0:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     dc4:	|  |      lea 40(a1),a1
     dc8:	|  |      adda.l 89d2c <Sw_DrawBuffer>,a1
     dce:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     dd2:	|  |      move.w d1,d0
     dd4:	|  |      mulu.w #40,d0
     dd8:	|  |      addi.l #502192,d0
     dde:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     de2:	|  |      move.w #255,d0
     de6:	|  |      sub.w d1,d0
     de8:	|  |      lsl.w #6,d0
     dea:	|  |      addi.w #20,d0
     dee:	|  |      move.w d0,88(a0)
  WaitBlit();
     df2:	|  |      movea.l (a2),a6
     df4:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     df8:	|  |      movea.l 89e48 <custom>,a0
     dfe:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     e04:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     e0a:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     e10:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     e16:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     e1c:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     e22:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     e28:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     e2e:	|  |      add.l d0,d0
     e30:	|  |      move.w (0,a3,d0.l),d1
     e34:	|  |      move.w d1,d0
     e36:	|  |      mulu.w #80,d0
     e3a:	|  |      movea.l d0,a1
     e3c:	|  |      lea 120(a1),a4
     e40:	|  |      move.l 89d28 <Sw_ViewBufferP1>,d0
     e46:	|  |      add.l a4,d0
     e48:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     e4c:	|  |      move.w d1,d0
     e4e:	|  |      mulu.w #40,d0
     e52:	|  |      addi.l #502192,d0
     e58:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     e5c:	|  |      lea 38(a1),a1
     e60:	|  |      move.l 89d2c <Sw_DrawBuffer>,d0
     e66:	|  |      add.l a1,d0
     e68:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     e6c:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     e70:	|  |      move.w #255,d0
     e74:	|  |      sub.w d1,d0
     e76:	|  |      lsl.w #6,d0
     e78:	|  |      addi.w #21,d0
     e7c:	|  |      move.w d0,88(a0)
  WaitBlit();
     e80:	|  |      movea.l (a2),a6
     e82:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     e86:	|  |      movea.l 89e48 <custom>,a1
     e8c:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     e92:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     e98:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     e9e:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     ea4:	|  |      move.w #0,66(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     eaa:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     eb0:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     eb6:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     ebc:	|  |      add.l d0,d0
     ebe:	|  |      move.w (0,a3,d0.l),d1
     ec2:	|  |      moveq #0,d2
     ec4:	|  |      move.w d1,d2
     ec6:	|  |      movea.l d2,a0
     ec8:	|  |      addq.l #1,a0
     eca:	|  |      move.l a0,d0
     ecc:	|  |      add.l a0,d0
     ece:	|  |      add.l d0,d0
     ed0:	|  |      add.l a0,d0
     ed2:	|  |      lsl.l #4,d0
     ed4:	|  |      movea.l 89d28 <Sw_ViewBufferP1>,a0
     eda:	|  |      adda.l d0,a0
     edc:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     ee0:	|  |      movea.w #-80,a0
     ee4:	|  |      adda.l d0,a0
     ee6:	|  |      move.l 89d2c <Sw_DrawBuffer>,d0
     eec:	|  |      add.l a0,d0
     eee:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     ef2:	|  |      mulu.w #40,d1
     ef6:	|  |      addi.l #491950,d1
     efc:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     f00:	|  |      moveq #0,d0
     f02:	|  |      not.b d0
     f04:	|  |      sub.l d2,d0
     f06:	|  |      lsl.w #6,d0
     f08:	|  |      addi.w #20,d0
     f0c:	|  |      move.w d0,88(a1)
  WaitBlit();
     f10:	|  |      movea.l (a2),a6
     f12:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     f16:	|  |      movea.l 89e48 <custom>,a1
     f1c:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     f22:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     f28:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     f2e:	|  |      move.w #40,96(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     f34:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     f3a:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     f40:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     f46:	|  |      add.l d0,d0
     f48:	|  |      move.w (0,a3,d0.l),d1
     f4c:	|  |      move.w d1,d2
     f4e:	|  |      movea.l d2,a0
     f50:	|  |      addq.l #1,a0
     f52:	|  |      move.l a0,d0
     f54:	|  |      add.l a0,d0
     f56:	|  |      add.l d0,d0
     f58:	|  |      add.l a0,d0
     f5a:	|  |      lsl.l #4,d0
     f5c:	|  |      movea.l 89d28 <Sw_ViewBufferP1>,a0
     f62:	|  |      adda.l d0,a0
     f64:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f68:	|  |      mulu.w #40,d1
     f6c:	|  |      addi.l #491950,d1
     f72:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     f76:	|  |      movea.w #-80,a0
     f7a:	|  |      adda.l d0,a0
     f7c:	|  |      move.l 89d2c <Sw_DrawBuffer>,d0
     f82:	|  |      add.l a0,d0
     f84:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     f88:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     f8c:	|  |      moveq #0,d0
     f8e:	|  |      not.b d0
     f90:	|  |      sub.l d2,d0
     f92:	|  |      lsl.w #6,d0
     f94:	|  |      addi.w #20,d0
     f98:	|  |      move.w d0,88(a1)
  WaitBlit();
     f9c:	|  |      movea.l (a2),a6
     f9e:	|  |      jsr -228(a6)
  custom->color[0] = 0x00;
     fa2:	|  |      movea.l 89e48 <custom>,a0
     fa8:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     fae:	|  |      move.l 89d24 <Sw_framecountscreen>,d0
     fb4:	|  |      addq.l #1,d0
     fb6:	|  |      moveq #17,d1
     fb8:	|  |      cmp.l d0,d1
     fba:	|  |  /-- beq.s fc8 <Sw_Run+0x32c>
     fbc:	|  |  |   move.l d0,89d24 <Sw_framecountscreen>
}
     fc2:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     fc6:	|  |  |   rts
     fc8:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     fca:	|  |      move.l d0,89d24 <Sw_framecountscreen>
}
     fd0:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     fd4:	|  |      rts
    Sw_framecount = 0;
     fd6:	|  \----> clr.l 65be2 <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
     fdc:	|         move.l 89d3a <Sw_FontBuffer>,d3
      *target++ = pattern;
     fe2:	|         pea fa0 <Sw_Run+0x304>
     fe6:	|         clr.l -(sp)
     fe8:	|         move.l d3,-(sp)
     fea:	|         jsr 59c4 <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
     fee:	|         movea.l 89d20 <Sw_textoffset>,a3
     ff4:	|         adda.l #415376,a3
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
     ffa:	|         move.b (a3),d0
     ffc:	|         ext.w d0
     ffe:	|         movea.w d0,a2
    1000:	|         lea -32(a2),a2
    1004:	|         lea 12(sp),sp
    int x = 0;
    1008:	|         moveq #0,d2
    100a:	|         lea 42680 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
    1010:	|         move.w #3204,d4
    WaitBlit();
    1014:	|     /-> movea.l 89e44 <GfxBase>,a6
    101a:	|     |   jsr -228(a6)
    custom->bltamod = 0;
    101e:	|     |   move.w #0,dff064 <_end+0xd75214>
    custom->bltbmod = 72;
    1026:	|     |   move.w #72,dff062 <_end+0xd75212>
    custom->bltdmod = 72;
    102e:	|     |   move.w #72,dff066 <_end+0xd75216>
    custom->bltafwm = 0xffff;
    1036:	|     |   move.w #-1,dff044 <_end+0xd751f4>
    custom->bltalwm = 0xffff;
    103e:	|     |   move.w #-1,dff046 <_end+0xd751f6>
    custom->bltcon1 = 0;  
    1046:	|     |   move.w #0,dff042 <_end+0xd751f2>
    custom->bltcon0 = 0xdfc + (restx << 12);
    104e:	|     |   move.w d2,d0
    1050:	|     |   moveq #12,d1
    1052:	|     |   lsl.w d1,d0
    1054:	|     |   addi.w #3580,d0
    1058:	|     |   move.w d0,dff040 <_end+0xd751f0>
    custom->bltapt = font+4*50*index;
    105e:	|     |   move.l a2,d0
    1060:	|     |   add.l a2,d0
    1062:	|     |   add.l a2,d0
    1064:	|     |   lsl.l #3,d0
    1066:	|     |   add.l a2,d0
    1068:	|     |   lsl.l #4,d0
    106a:	|     |   addi.l #453948,d0
    1070:	|     |   move.l d0,dff050 <_end+0xd75200>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    1076:	|     |   move.l d2,d0
    1078:	|     |   asr.l #4,d0
    107a:	|     |   add.l d0,d0
    107c:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
    107e:	|     |   move.l d0,dff04c <_end+0xd751fc>
    custom->bltdpt = targetlocation;
    1084:	|     |   move.l d0,dff054 <_end+0xd75204>
    custom->bltsize = 4+64*50;
    108a:	|     |   move.w d4,dff058 <_end+0xd75208>
        x += LetterSize[*text++ - 0x20];
    1090:	|     |   move.b (a3)+,d0
    1092:	|     |   ext.w d0
    1094:	|     |   move.b (-32,a4,d0.w),d0
    1098:	|     |   andi.l #255,d0
    109e:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
    10a0:	|     |   move.b (a3),d0
    10a2:	|     |   ext.w d0
    10a4:	|     |   movea.w d0,a2
    10a6:	|     |   lea -32(a2),a2
    10aa:	|     |   moveq #0,d0
    10ac:	|     |   move.b (0,a4,a2.l),d0
    10b0:	|     |   add.l d2,d0
    10b2:	|     |   cmpi.l #639,d0
    10b8:	|     \-- ble.w 1014 <Sw_Run+0x378>
    Sw_textoffset += 40;
    10bc:	|         moveq #40,d0
    10be:	|         add.l 89d20 <Sw_textoffset>,d0
    10c4:	|         move.l d0,89d20 <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    10ca:	|         cmpi.l #1279,d0
    10d0:	|     /-- ble.s 10e0 <Sw_Run+0x444>
      Sw_textoffset = 0;
    10d2:	|     |   clr.l 89d20 <Sw_textoffset>
      SwScrollerFinished = 1;
    10d8:	|     |   move.w #1,89e3e <SwScrollerFinished>
  Sw_framecount++;
    10e0:	|     \-> move.l 65be2 <Sw_framecount>,d0
    10e6:	|         addq.l #1,d0
    10e8:	|         move.l d0,65be2 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
    10ee:	\-------- bra.w cb6 <Sw_Run+0x1a>

000010f2 <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
    10f2:	    movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    10f6:	    movea.l 89e4c <SysBase>,a6
    10fc:	    move.l #1360,d0
    1102:	    moveq #2,d1
    1104:	    jsr -198(a6)
    1108:	    movea.l d0,a2
  if( retval == 0) {
    110a:	    tst.l d0
    110c:	/-- beq.w 1272 <Sw_ClBuild+0x180>
    *cl++ = *clpartinstruction++;
    1110:	|   move.l 65650 <Sw_ClsSprites>,(a2)
    1116:	|   move.l 65654 <Sw_ClsSprites+0x4>,4(a2)
    111e:	|   move.l 65658 <Sw_ClsSprites+0x8>,8(a2)
    1126:	|   move.l 6565c <Sw_ClsSprites+0xc>,12(a2)
    112e:	|   move.l 65660 <Sw_ClsSprites+0x10>,16(a2)
    1136:	|   move.l 65664 <Sw_ClsSprites+0x14>,20(a2)
    113e:	|   move.l 65668 <Sw_ClsSprites+0x18>,24(a2)
    1146:	|   move.l 6566c <Sw_ClsSprites+0x1c>,28(a2)
    114e:	|   move.l 65670 <Sw_ClsSprites+0x20>,32(a2)
    1156:	|   move.l 65674 <Sw_ClsSprites+0x24>,36(a2)
    115e:	|   move.l 65678 <Sw_ClsSprites+0x28>,40(a2)
    1166:	|   move.l 6567c <Sw_ClsSprites+0x2c>,44(a2)
    116e:	|   move.l 65680 <Sw_ClsSprites+0x30>,48(a2)
    1176:	|   move.l 65684 <Sw_ClsSprites+0x34>,52(a2)
    117e:	|   move.l 65688 <Sw_ClsSprites+0x38>,56(a2)
    1186:	|   move.l 6568c <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    118e:	|   move.l 65620 <Sw_ClScreen>,64(a2)
    1196:	|   move.l 65624 <Sw_ClScreen+0x4>,68(a2)
    119e:	|   move.l 65628 <Sw_ClScreen+0x8>,72(a2)
    11a6:	|   move.l 6562c <Sw_ClScreen+0xc>,76(a2)
    11ae:	|   move.l 65630 <Sw_ClScreen+0x10>,80(a2)
    11b6:	|   move.l 65634 <Sw_ClScreen+0x14>,84(a2)
    11be:	|   move.l 65638 <Sw_ClScreen+0x18>,88(a2)
    11c6:	|   move.l 6563c <Sw_ClScreen+0x1c>,92(a2)
    11ce:	|   move.l 65640 <Sw_ClScreen+0x20>,96(a2)
    11d6:	|   move.l 65644 <Sw_ClScreen+0x24>,100(a2)
    11de:	|   move.l 65648 <Sw_ClScreen+0x28>,104(a2)
    11e6:	|   move.l 6564c <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    11ee:	|   move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    11f6:	|   move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    11fe:	|   move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    1206:	|   move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    120e:	|   move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    1216:	|   move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    121e:	|   move.l 655e0 <Sw_ClColor>,136(a2)
    1226:	|   move.l 655e4 <Sw_ClColor+0x4>,140(a2)
    122e:	|   move.l 655e8 <Sw_ClColor+0x8>,144(a2)
    1236:	|   move.l 655ec <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    123e:	|   pea 1bc <main+0x156>
    1242:	|   pea 7858 <incbin_Sw_ClColorDim_start>
    1248:	|   pea 152(a2)
    124c:	|   jsr 59e6 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    1250:	|   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    1258:	|   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    1260:	|   moveq #-2,d0
    1262:	|   move.l d0,604(a2)
  return (UWORD *) retval;  
    1266:	|   lea 12(sp),sp
}
    126a:	|   move.l a2,d0
    126c:	|   movem.l (sp)+,d2-d3/a2/a6
    1270:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1272:	\-> movea.l 89e40 <DOSBase>,a6
    1278:	    jsr -60(a6)
    127c:	    movea.l 89e40 <DOSBase>,a6
    1282:	    move.l d0,d1
    1284:	    move.l #246841,d2
    128a:	    moveq #40,d3
    128c:	    jsr -48(a6)
    Exit(1);
    1290:	    movea.l 89e40 <DOSBase>,a6
    1296:	    moveq #1,d1
    1298:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    129c:	    move.l 65650 <Sw_ClsSprites>,(a2)
    12a2:	    move.l 65654 <Sw_ClsSprites+0x4>,4(a2)
    12aa:	    move.l 65658 <Sw_ClsSprites+0x8>,8(a2)
    12b2:	    move.l 6565c <Sw_ClsSprites+0xc>,12(a2)
    12ba:	    move.l 65660 <Sw_ClsSprites+0x10>,16(a2)
    12c2:	    move.l 65664 <Sw_ClsSprites+0x14>,20(a2)
    12ca:	    move.l 65668 <Sw_ClsSprites+0x18>,24(a2)
    12d2:	    move.l 6566c <Sw_ClsSprites+0x1c>,28(a2)
    12da:	    move.l 65670 <Sw_ClsSprites+0x20>,32(a2)
    12e2:	    move.l 65674 <Sw_ClsSprites+0x24>,36(a2)
    12ea:	    move.l 65678 <Sw_ClsSprites+0x28>,40(a2)
    12f2:	    move.l 6567c <Sw_ClsSprites+0x2c>,44(a2)
    12fa:	    move.l 65680 <Sw_ClsSprites+0x30>,48(a2)
    1302:	    move.l 65684 <Sw_ClsSprites+0x34>,52(a2)
    130a:	    move.l 65688 <Sw_ClsSprites+0x38>,56(a2)
    1312:	    move.l 6568c <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    131a:	    move.l 65620 <Sw_ClScreen>,64(a2)
    1322:	    move.l 65624 <Sw_ClScreen+0x4>,68(a2)
    132a:	    move.l 65628 <Sw_ClScreen+0x8>,72(a2)
    1332:	    move.l 6562c <Sw_ClScreen+0xc>,76(a2)
    133a:	    move.l 65630 <Sw_ClScreen+0x10>,80(a2)
    1342:	    move.l 65634 <Sw_ClScreen+0x14>,84(a2)
    134a:	    move.l 65638 <Sw_ClScreen+0x18>,88(a2)
    1352:	    move.l 6563c <Sw_ClScreen+0x1c>,92(a2)
    135a:	    move.l 65640 <Sw_ClScreen+0x20>,96(a2)
    1362:	    move.l 65644 <Sw_ClScreen+0x24>,100(a2)
    136a:	    move.l 65648 <Sw_ClScreen+0x28>,104(a2)
    1372:	    move.l 6564c <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    137a:	    move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    1382:	    move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    138a:	    move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    1392:	    move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    139a:	    move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    13a2:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    13aa:	    move.l 655e0 <Sw_ClColor>,136(a2)
    13b2:	    move.l 655e4 <Sw_ClColor+0x4>,140(a2)
    13ba:	    move.l 655e8 <Sw_ClColor+0x8>,144(a2)
    13c2:	    move.l 655ec <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    13ca:	    pea 1bc <main+0x156>
    13ce:	    pea 7858 <incbin_Sw_ClColorDim_start>
    13d4:	    pea 152(a2)
    13d8:	    jsr 59e6 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    13dc:	    move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    13e4:	    move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    13ec:	    moveq #-2,d0
    13ee:	    move.l d0,604(a2)
  return (UWORD *) retval;  
    13f2:	    lea 12(sp),sp
}
    13f6:	    move.l a2,d0
    13f8:	    movem.l (sp)+,d2-d3/a2/a6
    13fc:	    rts

000013fe <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    13fe:	moveq #0,d0
    1400:	move.w 89d1c <Sw_ScreenBufferOffset>,d0
    1406:	lea 89ce0 <Sw_ScreenBufferList>,a0
    140c:	move.l d0,d1
    140e:	add.l d0,d1
    1410:	add.l d1,d1
    1412:	move.l (0,a0,d1.l),89d2c <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    141a:	addq.l #1,d0
    141c:	add.l d0,d0
    141e:	add.l d0,d0
    1420:	move.l (0,a0,d0.l),d0
    1424:	move.l d0,89d28 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    142a:	moveq #80,d1
    142c:	add.l d0,d1
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  /*highword = (ULONG)Sw_FontBuffer >> 16;
  lowword = (ULONG)Sw_FontBuffer & 0xffff;*/

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    142e:	movea.l 89cdc <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    1434:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    1438:	clr.w d0
    143a:	swap d0
    143c:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    1440:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    1444:	clr.w d1
    1446:	swap d1
    1448:	move.w d1,122(a0)
  /*highword = (ULONG)Sw_ViewBufferP3 >> 16;
  lowword = (ULONG)Sw_ViewBufferP3 & 0xffff;
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;*/

}
    144c:	rts

0000144e <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    144e:	          movea.l 89cdc <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    1454:	          move.w 655dc <FrameCountBufferDraw>,d0
    145a:	          lea 655e0 <Sw_ClColor>,a1
    1460:	          andi.l #65535,d0
    1466:	          lsl.l #4,d0
    1468:	          move.l (0,a1,d0.l),136(a0)
    146e:	          move.w 655dc <FrameCountBufferDraw>,d0
    1474:	          andi.l #65535,d0
    147a:	          add.l d0,d0
    147c:	          add.l d0,d0
    147e:	          addq.l #1,d0
    1480:	          add.l d0,d0
    1482:	          add.l d0,d0
    1484:	          move.l (0,a1,d0.l),140(a0)
    148a:	          move.w 655dc <FrameCountBufferDraw>,d0
    1490:	          andi.l #65535,d0
    1496:	          add.l d0,d0
    1498:	          add.l d0,d0
    149a:	          addq.l #2,d0
    149c:	          add.l d0,d0
    149e:	          add.l d0,d0
    14a0:	          move.l (0,a1,d0.l),144(a0)
    14a6:	          move.w 655dc <FrameCountBufferDraw>,d0
    14ac:	          andi.l #65535,d0
    14b2:	          add.l d0,d0
    14b4:	          add.l d0,d0
    14b6:	          addq.l #3,d0
    14b8:	          add.l d0,d0
    14ba:	          add.l d0,d0
    14bc:	          move.l (0,a1,d0.l),148(a0)
  for(int i=0;i<4;i++) {
    14c2:	          lea 152(a0),a0
  }
  if( ColPos == 12) {
    14c6:	          cmpi.w #12,89cda <ColPos>
    14ce:	   /----- beq.s 1504 <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    14d0:	/--|----> move.w 89cd8 <Sw_ClColorDimPos>,d0
    14d6:	|  |      moveq #0,d1
    14d8:	|  |      move.w d0,d1
    14da:	|  |      addi.l #30808,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    14e0:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    14e4:	|  |      cmpi.w #22643,d0
    14e8:	|  |  /-- bls.s 14ec <Sw_SetColors+0x9e>
    14ea:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
    14ec:	|  |  \-> move.w d0,89cd8 <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    14f2:	|  |      pea 1bc <main+0x156>
    14f6:	|  |      move.l d1,-(sp)
    14f8:	|  |      move.l a0,-(sp)
    14fa:	|  |      jsr 5a04 <memmove>(pc)

  }
}
    14fe:	|  |      lea 12(sp),sp
    1502:	|  |      rts
    ColPos = 0;
    1504:	|  \----> clr.w 89cda <ColPos>
    150a:	\-------- bra.s 14d0 <Sw_SetColors+0x82>

0000150c <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    150c:	    movea.l 89e48 <custom>,a0
    1512:	    move.w #32,156(a0)
  if(Sw_MusicDelay > 0) {
    1518:	    move.w 655de <Sw_MusicDelay>,d0
    151e:	/-- beq.s 1528 <Sw_VblankHandler+0x1c>
    Sw_MusicDelay--;
    1520:	|   subq.w #1,d0
    1522:	|   move.w d0,655de <Sw_MusicDelay>
  if( Sw_InitComplete == 1) {
    1528:	\-> cmpi.w #1,89d1e <Sw_InitComplete>
    1530:	/-- beq.s 1534 <Sw_VblankHandler+0x28>
}
    1532:	|   rts
    if( FrameCountBufferDraw == 2) {
    1534:	\-> move.w 655dc <FrameCountBufferDraw>,d0
    153a:	    cmpi.w #2,d0
    153e:	/-- beq.s 1556 <Sw_VblankHandler+0x4a>
      FrameCountBufferDraw++;
    1540:	|   move.w 655dc <FrameCountBufferDraw>,d0
    1546:	|   addq.w #1,d0
    1548:	|   move.w d0,655dc <FrameCountBufferDraw>
    Sw_SetBplPointers();
    154e:	|   jsr 13fe <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1552:	|   bra.w 144e <Sw_SetColors>
      FrameCountBufferDraw = 0;
    1556:	\-> move.w #0,655dc <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    155e:	    move.w #1,89d30 <Sw_BlitFrame>
      if(Sw_ScreenBufferOffset == 0) { 
    1566:	    tst.w 89d1c <Sw_ScreenBufferOffset>
    156c:	/-- bne.s 157e <Sw_VblankHandler+0x72>
        Sw_ScreenBufferOffset = 2; 
    156e:	|   move.w #2,89d1c <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1576:	|   jsr 13fe <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    157a:	|   bra.w 144e <Sw_SetColors>
        Sw_ScreenBufferOffset = 0; 
    157e:	\-> clr.w 89d1c <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1584:	    jsr 13fe <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1588:	    bra.w 144e <Sw_SetColors>

0000158c <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    158c:	rts

0000158e <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    158e:	movea.l 89e48 <custom>,a0
    1594:	move.w #32,156(a0)
  //p61Music();
}
    159a:	rts

0000159c <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    159c:	                                                             lea -20(sp),sp
    15a0:	                                                             movem.l d2-d5/a2,-(sp)
    15a4:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    15a8:	                                                             movea.l 89e1e <DrawCopper>,a1
    15ae:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    15b2:	                                                             movea.l 89ccc <DrawBuffer>,a0
    15b8:	                                                             move.w 52(a0),d0
    15bc:	                                                /----------- bmi.w 175c <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    15c0:	                                                |            move.w 54(a0),d2
    15c4:	                                                |     /----- bmi.w 1718 <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    15c8:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    15ca:	                                                |     |      move.w d2,d4
    15cc:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    15ce:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    15d2:	                                                |     |      cmp.w d1,d0
    15d4:	                                          /-----|-----|----- bhi.w 1804 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    15d8:	                                          |     |     |      move.w #70,30(sp)
    15de:	                                          |     |     |      move.w d2,32(sp)
    15e2:	                                          |     |     |      move.w #109,34(sp)
    15e8:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    15ee:	                                          |     |     |      clr.w 20(sp)
    15f2:	                                          |     |     |      move.w #1,22(sp)
    15f8:	                                          |     |     |      move.w #2,24(sp)
    15fe:	                                          |     |     |      move.w #3,26(sp)
    1604:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    160a:	                                          |     |     |      cmpi.w #69,d2
    160e:	                                       /--|-----|-----|----- bhi.w 179a <SetCl+0x1fe>
              values[j] = values[j + 1];
    1612:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1616:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    161c:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    1622:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1626:	                                       |  |  |  |     |      moveq #70,d0
    1628:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    162c:	|                                      |  |  |  |     |  /-- bcc.s 163e <SetCl+0xa2>
              int temp2 = ids[j];
    162e:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    1634:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    1638:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    163e:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    1642:	|                                      |  |  |  |     |      cmp.w a0,d0
    1644:	|                                      |  |  |  |     |  /-- bcc.s 1662 <SetCl+0xc6>
              int temp2 = ids[j];
    1646:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    164a:	|                                      |  |  |  |     |  |   move.w d0,d2
    164c:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    1650:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1656:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    165a:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    165e:	|                                      |  |  |  |     |  |   move.w a0,d0
    1660:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    1662:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1666:	|                                      |  |  |  |     |      cmp.w d0,d2
    1668:	|                                      |  |  |  |     |  /-- bcc.s 1682 <SetCl+0xe6>
              int temp2 = ids[j];
    166a:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    166e:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    1672:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    1678:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    167c:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    1680:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    1682:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    1686:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    168a:	|                                      |  |  |  |     |  /-- bcc.s 169e <SetCl+0x102>
              int temp2 = ids[j];
    168c:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    1690:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    1694:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    169a:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    169e:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    16a0:	|                                      |  |  |  |     |  /-- bcc.s 16b8 <SetCl+0x11c>
              int temp2 = ids[j];
    16a2:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    16a6:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    16aa:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    16b0:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    16b4:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    16b8:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    16bc:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    16c0:	|                                      |  |  |  |     |  /-- bcc.s 16e4 <SetCl+0x148>
              int temp2 = ids[j];
    16c2:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    16c6:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    16cc:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    16d0:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    16d4:	|                                      |  |  |  |     |  +-- bcc.s 16e4 <SetCl+0x148>
              int temp2 = ids[j];
    16d6:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    16da:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    16e0:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    16e4:	|                                      |  |  |  |     |  \-> move.w d1,d0
    16e6:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    16e8:	|                                      |  |  |  |     |      addi.w #11521,d0
    16ec:	|                                      |  |  |  |     |      cmpi.w #210,d1
    16f0:	|                                      |  |  |  |     |  /-- bhi.w 17e0 <SetCl+0x244>
    switch( ids[i]) 
    16f4:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    16fa:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 1fec <SetCl+0xa50>
    16fe:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    1700:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    1704:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    1706:	|  |                                   |  |  |  |     |  |   move.w (170e <SetCl+0x172>,pc,d1.l),d1
    170a:	|  |                                   |  |  |  |     |  |   jmp (170e <SetCl+0x172>,pc,d1.w)
    170e:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    1712:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1718:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    171a:	|  |                                   |  |  |  |  /-----|-- bhi.w 1844 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    171e:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1724:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    172a:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    1730:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1736:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    173c:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    1740:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    1742:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1746:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    174c:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    1752:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1756:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    1758:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 1628 <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    175c:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    1762:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    1768:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    176e:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1774:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    1778:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    177e:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    1784:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    178a:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    1790:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    1794:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1798:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    179a:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    179e:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    17a2:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 1628 <SetCl+0x8c>
              int temp2 = ids[j];
    17a6:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    17aa:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    17b0:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    17b6:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    17ba:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    17be:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    17c2:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 1fd4 <SetCl+0xa38>
              values[j] = values[j + 1];
    17c6:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    17cc:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    17d2:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    17d6:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    17da:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    17dc:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 1628 <SetCl+0x8c>
    switch( ids[i]) 
    17e0:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    17e6:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 1fda <SetCl+0xa3e>
    17ea:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    17ec:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    17f0:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    17f2:	|  |  |  |                             |  |  |     |  |      move.w (17fa <SetCl+0x25e>,pc,d1.l),d1
    17f6:	|  |  |  |                             |  |  |     |  |      jmp (17fa <SetCl+0x25e>,pc,d1.w)
    17fa:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    17fc:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    1802:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1806:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    180c:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    1810:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1816:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    181c:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    1820:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1826:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    182c:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    1832:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    1838:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    183c:	|  |  |  |                             |     \-----|--|----- bls.w 1612 <SetCl+0x76>
    1840:	|  |  |  |                             \-----------|--|----- bra.w 179a <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1844:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1846:	|  |  |  |                                            |      move.w #109,34(sp)
    184c:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1852:	|  |  |  |                                            |      move.w #2,24(sp)
    1858:	|  |  |  |                                            |      move.w #3,26(sp)
    185e:	|  |  |  |                                            |      move.w #4,28(sp)
    1864:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    1868:	|  |  |  |                                            |      clr.w d3
    186a:	|  |  |  |                                            \----- bra.w 1742 <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    186e:	|  |  |  |                                                   cmpi.w #211,d3
    1872:	|  |  |  |                                               /-- bls.s 1884 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    1874:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    187a:	|  |  |  |                                               |   lea 172(a1),a2
    187e:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1884:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1886:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    188c:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    1892:	|  |  |  |                                                   lea 8(a2),a0
    1896:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    189c:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    18a2:	|  |  |  |  /--|-------------------------------------------- bhi.w 1ff2 <SetCl+0xa56>
    18a6:	|  |  |  |  |  |                                             moveq #0,d1
    18a8:	|  |  |  |  |  |                                             move.w 22(sp),d1
    18ac:	|  |  |  |  |  |                                             add.l d1,d1
    18ae:	|  |  |  |  |  |                                             move.w (18b6 <SetCl+0x31a>,pc,d1.l),d1
    18b2:	|  |  |  |  |  |                                             jmp (18b6 <SetCl+0x31a>,pc,d1.w)
    18b6:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    18ba:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    18c4:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    18cc:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    18d2:	|  |  |  |  |  |                                             lea 176(a1),a0
    18d6:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    18dc:	|  |  |  |  |  +-------------------------------------------- bra.s 189c <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    18de:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    18e4:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    18ea:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    18f0:	|  |  |  |  |  |                                             lea 176(a1),a0
    18f4:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    18fa:	|  |  |  |  |  +-------------------------------------------- bra.s 189c <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    18fc:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1902:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1908:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    190e:	|  |  |  |  |  |                                             lea 176(a1),a0
    1912:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    1918:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    191e:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 1ffe <SetCl+0xa62>
    1922:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1924:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    1928:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    192a:	|  |  |  |  |  |  |  |                                       move.w (1932 <SetCl+0x396>,pc,d1.l),d1
    192e:	|  |  |  |  |  |  |  |                                       jmp (1932 <SetCl+0x396>,pc,d1.w)
    1932:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1934:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    1938:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    193a:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    193c:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    1942:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1948:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    194e:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1952:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    1958:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1918 <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    195a:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    195e:	|  |  |  |  |  |  |  |                                   /-- bls.s 1970 <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    1960:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1966:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    196a:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1970:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1972:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1978:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    197e:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    1982:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    1988:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1918 <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    198a:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    1990:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1996:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    199c:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19a0:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    19a6:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1918 <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    19aa:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    19b0:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19b6:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    19bc:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19c0:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    19c6:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 189c <SetCl+0x300>
        *tmp++ = line + 0x001;
    19ca:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    19ce:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    19d4:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    19da:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19de:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    19e4:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1918 <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    19e8:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    19ec:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    19f2:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    19f8:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    19fc:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    1a02:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    1a08:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 1fe6 <SetCl+0xa4a>
    1a0c:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    1a0e:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    1a12:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1a14:	|  |  |  |  |  |  |  |  |  |                                 move.w (1a1c <SetCl+0x480>,pc,d1.l),d1
    1a18:	|  |  |  |  |  |  |  |  |  |                                 jmp (1a1c <SetCl+0x480>,pc,d1.w)
    1a1c:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1a1e:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1a20:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1a28:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    1a2a:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a30:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1a36:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a3a:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1a40:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a02 <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1a42:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1a46:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1a54 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    1a48:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1a4c:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1a52:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1a54:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1a56:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1a5c:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1a62:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a66:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    1a6c:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1a02 <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1a6e:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1a72:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a78:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1a7e:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a82:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    1a88:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 1a02 <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1a8c:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1a90:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a96:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1a9c:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1aa0:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    1aa6:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    1aac:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 1ff8 <SetCl+0xa5c>
    1ab0:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    1ab2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    1ab6:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    1ab8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (1ac0 <SetCl+0x524>,pc,d1.l),d1
    1abc:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (1ac0 <SetCl+0x524>,pc,d1.w)
    1ac0:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    1ac2:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    1ac4:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    1ac6:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    1ac8:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1aca:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1ace:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ad4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ada:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1ade:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    1ae4:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1aa6 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    1ae6:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    1aea:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 1af8 <SetCl+0x55c>
          *tmp++ = 0xffdf;
    1aec:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1af0:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    1af6:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1af8:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1afa:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b00:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1b06:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b0a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1b10:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1aa6 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1b12:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1b16:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1b1c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1b22:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b26:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    1b2c:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1aa6 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1b30:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1b32:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b38:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1b3e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b42:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    1b48:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1aa6 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1b4c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1b50:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b56:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1b5c:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1b60:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1b66:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    1b6c:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 201a <SetCl+0xa7e>
    1b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1b80 <SetCl+0x5e4>,pc,d1.l),d1
    1b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1b80 <SetCl+0x5e4>,pc,d1.w)
    1b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b66 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    1bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b66 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    1bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    1bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b66 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    1be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 1bee <SetCl+0x652>
          *tmp++ = 0xffdf;
    1be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1b66 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 2004 <SetCl+0xa68>
    1c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1c3e <SetCl+0x6a2>,pc,d1.l),d1
    1c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1c3e <SetCl+0x6a2>,pc,d1.w)
    1c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1c48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    1c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c24 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    1c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1c76 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    1c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    1c8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c24 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c24 <SetCl+0x688>
        *tmp++ = line + 0x001;
    1cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    1cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c24 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    1d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    1d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1d38 <SetCl+0x79c>
          *tmp++ = 0xffdf;
    1d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    1d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    1d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    1d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1da4 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    1db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    1df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 1fe0 <SetCl+0xa44>
    1df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1e04 <SetCl+0x868>,pc,d1.l),d1
    1e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1e04 <SetCl+0x868>,pc,d1.w)
    1e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1e08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1e10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    1e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    1e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1dea <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    1e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    1e2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 1e3c <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    1e30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1e34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    1e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1e3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1e3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    1e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    1e54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1dea <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    1e70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1dea <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1e78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1e84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1e88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    1e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 2004 <SetCl+0xa68>
    1e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    1e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    1ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1ea8 <SetCl+0x90c>,pc,d1.l),d1
    1ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1ea8 <SetCl+0x90c>,pc,d1.w)
    1ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    1eae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    1eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ebc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1e8e <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    1ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    1ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 1ee0 <SetCl+0x944>
          *tmp++ = 0xffdf;
    1ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    1eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1e8e <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1e8e <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f2a <SetCl+0x98e>
          *tmp++ = 0xffdf;
    1f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1e8e <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f58 <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    1f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1f50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    1f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1f5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    1f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    1f6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    1f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1dea <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f86 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1f7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f9e:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 1a02 <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1fa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fb8 <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1fa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1fae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    1fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1fb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1fba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1fc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1fca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    1fd0:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 189c <SetCl+0x300>
    1fd4:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    1fd6:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1628 <SetCl+0x8c>
    switch( ids[i]) 
    1fda:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    1fdc:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 189c <SetCl+0x300>
    1fe0:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    1fe2:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 1e8e <SetCl+0x8f2>
    1fe6:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    1fe8:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1dea <SetCl+0x84e>
    1fec:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    1fee:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 1918 <SetCl+0x37c>
    1ff2:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    1ff4:	                  |     \-----|--|--|--|--|--|-------------- bra.w 1a02 <SetCl+0x466>
    1ff8:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    1ffa:	                  |           |     |  \--|--|-------------- bra.w 1b66 <SetCl+0x5ca>
    1ffe:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    2000:	                              \-----|-----|--|-------------- bra.w 1aa6 <SetCl+0x50a>
    2004:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    2006:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    200a:	                                    |     |                  move.w #-2,2(a0)
}
    2010:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    2014:	                                    |     |                  lea 20(sp),sp
    2018:	                                    |     |                  rts
    switch( ids[i]) 
    201a:	                                    \-----|----------------> movea.l a0,a1
    201c:	                                          \----------------- bra.w 1c24 <SetCl+0x688>

00002020 <LoadVectors>:
{
    2020:	       move.l a3,-(sp)
    2022:	       move.l a2,-(sp)
    2024:	       movea.l 12(sp),a2
    2028:	       movea.l 16(sp),a1
    202c:	       movea.l 20(sp),a3
  while( *source != 127) {
    2030:	       move.w (a2),d0
    2032:	       movea.l a3,a0
    2034:	       cmpi.w #127,d0
    2038:	/----- beq.s 208e <LoadVectors+0x6e>
    *target++ = *source++;
    203a:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    203c:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    2042:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    2048:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    204e:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    2054:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    205a:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    2060:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    2066:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    206c:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    2072:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    2078:	|  |   lea 24(a2),a2
    207c:	|  |   lea 24(a0),a0
    2080:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    2086:	|  |   move.w (a2),d0
    2088:	|  |   cmpi.w #127,d0
    208c:	|  \-- bne.s 203a <LoadVectors+0x1a>
  while( *source2 != 127) {  
    208e:	\----> move.b (a1),d0
    2090:	       cmpi.b #127,d0
    2094:	/----- beq.w 214e <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    2098:	|  /-> ext.w d0
    209a:	|  |   add.w (a3),d0
    209c:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    209e:	|  |   move.b 1(a1),d0
    20a2:	|  |   ext.w d0
    20a4:	|  |   add.w 2(a3),d0
    20a8:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    20ac:	|  |   move.b 2(a1),d0
    20b0:	|  |   ext.w d0
    20b2:	|  |   add.w 4(a3),d0
    20b6:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    20ba:	|  |   move.b 3(a1),d0
    20be:	|  |   ext.w d0
    20c0:	|  |   add.w 6(a3),d0
    20c4:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    20c8:	|  |   move.b 4(a1),d0
    20cc:	|  |   ext.w d0
    20ce:	|  |   add.w 8(a3),d0
    20d2:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    20d6:	|  |   move.b 5(a1),d0
    20da:	|  |   ext.w d0
    20dc:	|  |   add.w 10(a3),d0
    20e0:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    20e4:	|  |   move.b 6(a1),d0
    20e8:	|  |   ext.w d0
    20ea:	|  |   add.w 12(a3),d0
    20ee:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    20f2:	|  |   move.b 7(a1),d0
    20f6:	|  |   ext.w d0
    20f8:	|  |   add.w 14(a3),d0
    20fc:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    2100:	|  |   move.b 8(a1),d0
    2104:	|  |   ext.w d0
    2106:	|  |   add.w 16(a3),d0
    210a:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    210e:	|  |   move.b 9(a1),d0
    2112:	|  |   ext.w d0
    2114:	|  |   add.w 18(a3),d0
    2118:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    211c:	|  |   move.b 10(a1),d0
    2120:	|  |   ext.w d0
    2122:	|  |   add.w 20(a3),d0
    2126:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    212a:	|  |   lea 24(a3),a3
    212e:	|  |   lea 12(a1),a1
    2132:	|  |   lea 24(a0),a0
    2136:	|  |   move.b -1(a1),d0
    213a:	|  |   ext.w d0
    213c:	|  |   add.w -2(a3),d0
    2140:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    2144:	|  |   move.b (a1),d0
    2146:	|  |   cmpi.b #127,d0
    214a:	|  \-- bne.w 2098 <LoadVectors+0x78>
}
    214e:	\----> movea.l (sp)+,a2
    2150:	       movea.l (sp)+,a3
    2152:	       rts

00002154 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    2154:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2158:	    movea.l 89e4c <SysBase>,a6
    215e:	    move.l #1360,d0
    2164:	    moveq #2,d1
    2166:	    jsr -198(a6)
    216a:	    movea.l d0,a2
  
  if( retval == 0) {
    216c:	    tst.l d0
    216e:	/-- beq.w 22fe <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    2172:	|   move.l 44818 <ClsSprites>,(a2)
    2178:	|   move.l 4481c <ClsSprites+0x4>,4(a2)
    2180:	|   move.l 44820 <ClsSprites+0x8>,8(a2)
    2188:	|   move.l 44824 <ClsSprites+0xc>,12(a2)
    2190:	|   move.l 44828 <ClsSprites+0x10>,16(a2)
    2198:	|   move.l 4482c <ClsSprites+0x14>,20(a2)
    21a0:	|   move.l 44830 <ClsSprites+0x18>,24(a2)
    21a8:	|   move.l 44834 <ClsSprites+0x1c>,28(a2)
    21b0:	|   move.l 44838 <ClsSprites+0x20>,32(a2)
    21b8:	|   move.l 4483c <ClsSprites+0x24>,36(a2)
    21c0:	|   move.l 44840 <ClsSprites+0x28>,40(a2)
    21c8:	|   move.l 44844 <ClsSprites+0x2c>,44(a2)
    21d0:	|   move.l 44848 <ClsSprites+0x30>,48(a2)
    21d8:	|   move.l 4484c <ClsSprites+0x34>,52(a2)
    21e0:	|   move.l 44850 <ClsSprites+0x38>,56(a2)
    21e8:	|   move.l 44854 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    21f0:	|   move.l 447e8 <ClScreen>,64(a2)
    21f8:	|   move.l 447ec <ClScreen+0x4>,68(a2)
    2200:	|   move.l 447f0 <ClScreen+0x8>,72(a2)
    2208:	|   move.l 447f4 <ClScreen+0xc>,76(a2)
    2210:	|   move.l 447f8 <ClScreen+0x10>,80(a2)
    2218:	|   move.l 447fc <ClScreen+0x14>,84(a2)
    2220:	|   move.l 44800 <ClScreen+0x18>,88(a2)
    2228:	|   move.l 44804 <ClScreen+0x1c>,92(a2)
    2230:	|   move.l 44808 <ClScreen+0x20>,96(a2)
    2238:	|   move.l 4480c <ClScreen+0x24>,100(a2)
    2240:	|   move.l 44810 <ClScreen+0x28>,104(a2)
    2248:	|   move.l 44814 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2250:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    2258:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2260:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    2268:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2270:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    2278:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    2280:	|   move.l 447c8 <ClColor>,136(a2)
    2288:	|   move.l 447cc <ClColor+0x4>,140(a2)
    2290:	|   move.l 447d0 <ClColor+0x8>,144(a2)
    2298:	|   move.l 447d4 <ClColor+0xc>,148(a2)
    22a0:	|   move.l 447d8 <ClColor+0x10>,152(a2)
    22a8:	|   move.l 447dc <ClColor+0x14>,156(a2)
    22b0:	|   move.l 447e0 <ClColor+0x18>,160(a2)
    22b8:	|   move.l 447e4 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    22c0:	|   move.l 44778 <ClToggleBitPlanes>,168(a2)
    22c8:	|   move.l 4477c <ClToggleBitPlanes+0x4>,172(a2)
    22d0:	|   move.l 44780 <ClToggleBitPlanes+0x8>,176(a2)
    22d8:	|   move.l 44784 <ClToggleBitPlanes+0xc>,180(a2)
    22e0:	|   move.l 44788 <ClToggleBitPlanes+0x10>,184(a2)
    22e8:	|   move.l 4478c <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    22f0:	|   moveq #-2,d0
    22f2:	|   move.l d0,192(a2)
  return retval;  
}
    22f6:	|   move.l a2,d0
    22f8:	|   movem.l (sp)+,d2-d3/a2/a6
    22fc:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    22fe:	\-> movea.l 89e40 <DOSBase>,a6
    2304:	    jsr -60(a6)
    2308:	    movea.l 89e40 <DOSBase>,a6
    230e:	    move.l d0,d1
    2310:	    move.l #246841,d2
    2316:	    moveq #40,d3
    2318:	    jsr -48(a6)
    Exit(1);
    231c:	    movea.l 89e40 <DOSBase>,a6
    2322:	    moveq #1,d1
    2324:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2328:	    move.l 44818 <ClsSprites>,(a2)
    232e:	    move.l 4481c <ClsSprites+0x4>,4(a2)
    2336:	    move.l 44820 <ClsSprites+0x8>,8(a2)
    233e:	    move.l 44824 <ClsSprites+0xc>,12(a2)
    2346:	    move.l 44828 <ClsSprites+0x10>,16(a2)
    234e:	    move.l 4482c <ClsSprites+0x14>,20(a2)
    2356:	    move.l 44830 <ClsSprites+0x18>,24(a2)
    235e:	    move.l 44834 <ClsSprites+0x1c>,28(a2)
    2366:	    move.l 44838 <ClsSprites+0x20>,32(a2)
    236e:	    move.l 4483c <ClsSprites+0x24>,36(a2)
    2376:	    move.l 44840 <ClsSprites+0x28>,40(a2)
    237e:	    move.l 44844 <ClsSprites+0x2c>,44(a2)
    2386:	    move.l 44848 <ClsSprites+0x30>,48(a2)
    238e:	    move.l 4484c <ClsSprites+0x34>,52(a2)
    2396:	    move.l 44850 <ClsSprites+0x38>,56(a2)
    239e:	    move.l 44854 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    23a6:	    move.l 447e8 <ClScreen>,64(a2)
    23ae:	    move.l 447ec <ClScreen+0x4>,68(a2)
    23b6:	    move.l 447f0 <ClScreen+0x8>,72(a2)
    23be:	    move.l 447f4 <ClScreen+0xc>,76(a2)
    23c6:	    move.l 447f8 <ClScreen+0x10>,80(a2)
    23ce:	    move.l 447fc <ClScreen+0x14>,84(a2)
    23d6:	    move.l 44800 <ClScreen+0x18>,88(a2)
    23de:	    move.l 44804 <ClScreen+0x1c>,92(a2)
    23e6:	    move.l 44808 <ClScreen+0x20>,96(a2)
    23ee:	    move.l 4480c <ClScreen+0x24>,100(a2)
    23f6:	    move.l 44810 <ClScreen+0x28>,104(a2)
    23fe:	    move.l 44814 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    2406:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    240e:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2416:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    241e:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2426:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    242e:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    2436:	    move.l 447c8 <ClColor>,136(a2)
    243e:	    move.l 447cc <ClColor+0x4>,140(a2)
    2446:	    move.l 447d0 <ClColor+0x8>,144(a2)
    244e:	    move.l 447d4 <ClColor+0xc>,148(a2)
    2456:	    move.l 447d8 <ClColor+0x10>,152(a2)
    245e:	    move.l 447dc <ClColor+0x14>,156(a2)
    2466:	    move.l 447e0 <ClColor+0x18>,160(a2)
    246e:	    move.l 447e4 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    2476:	    move.l 44778 <ClToggleBitPlanes>,168(a2)
    247e:	    move.l 4477c <ClToggleBitPlanes+0x4>,172(a2)
    2486:	    move.l 44780 <ClToggleBitPlanes+0x8>,176(a2)
    248e:	    move.l 44784 <ClToggleBitPlanes+0xc>,180(a2)
    2496:	    move.l 44788 <ClToggleBitPlanes+0x10>,184(a2)
    249e:	    move.l 4478c <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    24a6:	    moveq #-2,d0
    24a8:	    move.l d0,192(a2)
}
    24ac:	    move.l a2,d0
    24ae:	    movem.l (sp)+,d2-d3/a2/a6
    24b2:	    rts

000024b4 <SetBplPointers>:

void SetBplPointers() {
    24b4:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    24b6:	    movea.w 899b8 <ScreenBufferOffset>,a0
    24bc:	    moveq #0,d0
    24be:	    move.w a0,d0
    24c0:	    lea 89d4a <ScreenBufferList>,a2
    24c6:	    move.l d0,d1
    24c8:	    add.l d0,d1
    24ca:	    add.l d1,d1
    24cc:	    move.l (0,a2,d1.l),89ccc <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    24d4:	    move.l d0,d1
    24d6:	    addq.l #1,d1
    24d8:	    add.l d1,d1
    24da:	    add.l d1,d1
    24dc:	    movea.l (0,a2,d1.l),a1
    24e0:	    move.l a1,89cbc <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    24e6:	    addq.l #2,d0
    24e8:	    add.l d0,d0
    24ea:	    add.l d0,d0
    24ec:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    24f0:	    move.w a0,d0
    24f2:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    24f4:	    cmpi.w #8,d0
    24f8:	/-- bls.s 24fc <SetBplPointers+0x48>
    24fa:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    24fc:	\-> move.l d1,89cc0 <ClearBuffer>
  ScreenBufferOffset += 3;
    2502:	    move.w d0,899b8 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    2508:	    move.w 54(a1),d0
    250c:	    ext.l d0
    250e:	    lsl.l #6,d0
    2510:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    2512:	    movea.l 89e1e <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    2518:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    251c:	    move.l d0,d1
    251e:	    clr.w d1
    2520:	    swap d1
    2522:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2526:	    move.l d0,d1
    2528:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    252e:	    move.w d1,126(a0)
  highword = ptr >> 16;
    2532:	    clr.w d1
    2534:	    swap d1
    2536:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    253a:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    2540:	    move.w d0,134(a0)
  highword = ptr >> 16;
    2544:	    clr.w d0
    2546:	    swap d0
    2548:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    254c:	    movea.l (sp)+,a2
    254e:	    rts

00002550 <KPrintF>:
void KPrintF(const char* fmt, ...) {
    2550:	    lea -128(sp),sp
    2554:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    2558:	    move.w f0ff60 <_end+0xe86110>,d0
    255e:	    cmpi.w #20153,d0
    2562:	/-- beq.s 258e <KPrintF+0x3e>
    2564:	|   cmpi.w #-24562,d0
    2568:	+-- beq.s 258e <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    256a:	|   movea.l 89e4c <SysBase>,a6
    2570:	|   movea.l 144(sp),a0
    2574:	|   lea 148(sp),a1
    2578:	|   lea 5b4a <KPutCharX>,a2
    257e:	|   suba.l a3,a3
    2580:	|   jsr -522(a6)
}
    2584:	|   movem.l (sp)+,a2-a3/a6
    2588:	|   lea 128(sp),sp
    258c:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    258e:	\-> movea.l 89e4c <SysBase>,a6
    2594:	    movea.l 144(sp),a0
    2598:	    lea 148(sp),a1
    259c:	    lea 5b58 <PutChar>,a2
    25a2:	    lea 12(sp),a3
    25a6:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    25aa:	    move.l a3,-(sp)
    25ac:	    pea 56 <_start+0x56>
    25b0:	    jsr f0ff60 <_end+0xe86110>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    25b6:	    addq.l #8,sp
}
    25b8:	    movem.l (sp)+,a2-a3/a6
    25bc:	    lea 128(sp),sp
    25c0:	    rts

000025c2 <DrawRect>:
{  
    25c2:	                                                                                                                                                             lea -24(sp),sp
    25c6:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    25ca:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    25ce:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    25d2:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    25d6:	                                                                                                                                                             tst.w d0
    25d8:	                                                                                                               /-------------------------------------------- blt.w 27f2 <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    25dc:	                                                                                                               |                                             move.w d0,d4
    25de:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    25e0:	                                                                                                               |                                             cmpi.w #256,d0
    25e4:	                                                                                                               |                                         /-- ble.s 25f0 <DrawRect+0x2e>
}
    25e6:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    25ea:	                                                                                                               |        |                                |   lea 24(sp),sp
    25ee:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    25f0:	                                                                                                               |        |                                \-> movea.w d1,a0
    25f2:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    25f6:	                                                                                                               |        |                                    cmpa.w #256,a0
    25fa:	                                                                                                            /--|--------|----------------------------------- ble.w 281a <DrawRect+0x258>
    height = 256 - square->YPosMin;
    25fe:	                                                                                                            |  |        |                                    move.w #256,d5
    2602:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    2604:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    2606:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    260a:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    260e:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 2808 <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    2612:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    2614:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    2618:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    261a:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 25e6 <DrawRect+0x24>
    261c:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    2620:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 25e6 <DrawRect+0x24>
    2622:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    2626:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 25e6 <DrawRect+0x24>
  xlength = xlength/16;
    2628:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    262a:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    262c:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    262e:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    2632:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    2634:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    2636:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    2638:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    263a:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    263c:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    263e:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    2640:	                                                                                                            |  |  |  |  |  |  |                              movea.l 89e2e <PrepareBuffer>,a1
    2646:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2648:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd751b2>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    264e:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd751b2>,d0
    2654:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    2658:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 264e <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    265a:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0;
    2662:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd751f2>
  custom->bltadat = data;
    266a:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd75224>
  custom->bltdpt = Target;  
    2672:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd75204>
  custom->bltdmod = mod;
    2678:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd75216>
  custom->bltsize = lines*64+linelength;
    267e:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    2680:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    2682:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd75208>
    custom->bltcon1 = 0x0000;      
    2688:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd751f2>
    custom->bltcdat = 0x0;
    2690:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd75220>
    BltCon0LineDraw = 0x0500;
    2698:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,899ba <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    26a0:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    26a2:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    26a6:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    26aa:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    26ae:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    26b0:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    26b2:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    26b6:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 2f0e <DrawRect+0x94c>
  if(height != 0) {
    26ba:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    26bc:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 2f22 <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    26c0:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,899ba <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    26c8:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    26cc:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    26d0:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    26d2:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    26d4:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    26d8:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2ce6 <DrawRect+0x724>
  if(height != 0) {
    26dc:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    26de:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2cfa <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    26e2:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    26e6:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    26ea:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    26ec:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    26ee:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    26f2:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 2ad6 <DrawRect+0x514>
  if(height != 0) {
    26f6:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    26f8:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 2aea <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    26fc:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    26fe:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    2702:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    2704:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2706:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    270a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 2894 <DrawRect+0x2d2>
  if(height != 0) {
    270e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    2710:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 28a8 <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2714:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 89e2e <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    271a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    271e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    2720:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    2722:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    2728:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 89ccc <DrawBuffer>,a0
    272e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2730:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    2732:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2734:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2736:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2738:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd751b2>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    273e:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd751b2>,d1
    2744:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2746:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    274a:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    274e:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 273e <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    2750:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd75214>
  custom->bltbmod = 64 - length*2;
    2756:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd75212>
  custom->bltdmod = 64 - length*2;  
    275c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd75216>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    2762:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2766:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 2822 <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    276a:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    276c:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 311e <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2770:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    2776:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    277a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    277c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    277e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2780:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    2786:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    2788:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    278a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    278e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    2792:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    2796:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    279a:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    279e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 2880 <DrawRect+0x2be>
    27a2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    27a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    27a8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 2852 <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    27ac:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd751f0>
    custom->bltapt = (UBYTE *)bltapt;
    27b2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd75200>
    custom->bltbpt = (UBYTE *)bltdpt;
    27b8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd751fc>
    custom->bltdpt = (UBYTE *)bltdpt;
    27be:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd75204>
    custom->bltsize = bltsize;
    27c4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd75208>
    bltdpt += 64*256;
    27ca:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    27ce:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd751b2>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    27d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd751b2>,d0
    27da:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    27de:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 27d4 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    27e0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    27e2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    27e4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 25e6 <DrawRect+0x24>
    if( planes > 1) {
    27e8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    27ec:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 27a2 <DrawRect+0x1e0>
    27ee:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 2880 <DrawRect+0x2be>
    height += square->YPosMin;
    27f2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    27f4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    27f6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    27f8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    27fa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    27fc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    2800:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2804:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 2612 <DrawRect+0x50>
    xlength += xposmin - 16;    
    2808:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    280a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    280c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    2810:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2814:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2816:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 2618 <DrawRect+0x56>
  WORD height = square->Height;
    281a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    281c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    281e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 2606 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2822:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    2828:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    282e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    2830:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2832:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2834:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    283a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    283c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    283e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    2842:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2846:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    284a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    284e:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 279a <DrawRect+0x1d8>
    2852:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2854:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd751f0>
    custom->bltapt = (UBYTE *)bltapt;
    285a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd75200>
    custom->bltbpt = (UBYTE *)bltdpt;
    2860:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd751fc>
    custom->bltdpt = (UBYTE *)bltdpt;
    2866:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd75204>
    custom->bltsize = bltsize;
    286c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd75208>
    bltdpt += 64*256;
    2872:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2876:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd751b2>,d0
    287c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 27d4 <DrawRect+0x212>
      bit = color & 1;
    2880:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    2882:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    2886:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    2888:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    288a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    288e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 27ac <DrawRect+0x1ea>
    2892:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 2852 <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    2894:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 3c45f <incbin_MercuryLetterData2Lz4_end+0x27>
    289a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    289e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 2550 <KPrintF>(pc)
    28a2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    28a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    28a8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    28aa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2714 <DrawRect+0x152>
      WORD length = x1 - x2;
    28ae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    28b2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    28b4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    28b6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28b8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    28ba:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 31e0 <DrawRect+0xc1e>
    28be:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    28c2:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    28c6:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    28c8:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    28ca:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2a54 <DrawRect+0x492>
      height += 1; 
    28ce:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    28d0:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    28d2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    28d6:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 28de <DrawRect+0x31c>
    28d8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    28de:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    28e2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    28e6:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28e8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    28ea:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2a62 <DrawRect+0x4a0>
      if(yposmin <= 0) {
    28ee:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    28f0:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    28f2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 2a48 <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    28f6:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    28f8:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    28fe:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 2aae <DrawRect+0x4ec>
    2902:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    2908:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34d8 <DrawRect+0xf16>
    290c:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    2912:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34a8 <DrawRect+0xee6>
          startx -= 1;
    2916:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    291a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    291c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    291e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    2920:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 2ac0 <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2924:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2926:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2928:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    292a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    292c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    292e:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    2930:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 2a9a <DrawRect+0x4d8>
    2934:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2936:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    2938:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    293a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2940:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    2942:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2944:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2946:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    2948:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    294a:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 33e8 <DrawRect+0xe26>
    294e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2952:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2954:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2956:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    2958:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    295c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    2962:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2964:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2966:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    2968:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    296a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    296c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    296e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2970:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2972:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2974:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2976:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2978:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    297a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    297c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    297e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2980:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    2982:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    2984:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    2986:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    2988:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    298a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    298c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    298e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    2990:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    2992:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    2994:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2998:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    299a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    299c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 3c668 <LookupSlope>,a1
    29a2:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    29a4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    29a6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    29aa:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    29ac:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    29ae:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    29b0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    29b2:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2a7a <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29b6:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd751b2>,d0
    29bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd751b2>,d0
    29c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    29c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 29be <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    29ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    29cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 899ba <BltCon0LineDraw>,d0
    29d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    29d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd751f0>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    29dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 89e2e <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    29e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 89e32 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    29e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd751fc>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    29ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    29f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    29f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    29f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    29f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd751f8>
  custom->bltdpt = (UBYTE *)bltdpt;  
    29fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75204>
  custom->bltbmod = bltbmod;
    2a02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd75212>
  custom->bltcmod = bltdmod;
    2a08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd75210>
  custom->bltdmod = bltdmod;
    2a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd75216>
  custom->bltsize = bltwidth + 64*height;
    2a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2a16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    2a18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    2a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75208>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    2a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2a2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 89ccc <DrawBuffer>,a0
    2a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    2a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    2a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd751b2>,d1
    2a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 273e <DrawRect+0x17c>
        starty += 96;
    2a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 28f6 <DrawRect+0x334>
        height = -height;
    2a54:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    2a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    2a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2a5e:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 28ce <DrawRect+0x30c>
        startx += 96;
    2a62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    2a68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2a72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 28f6 <DrawRect+0x334>
    2a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 2a48 <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2a7a:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 3c475 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2a84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 2550 <KPrintF>(pc)
    2a88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    2a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd751b2>,d0
    2a94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 29be <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    2a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    2a9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    2aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    2aa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    2aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    2aaa:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 2940 <DrawRect+0x37e>
          height *= -1;
    2aae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    2ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    2ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    2ab8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    2aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    2abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2924 <DrawRect+0x362>
    2ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    2ac4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    2ac6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    2aca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    2acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    2ace:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    2ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2934 <DrawRect+0x372>
    2ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 2a9a <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    2ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 3c45f <incbin_MercuryLetterData2Lz4_end+0x27>
    2adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    2ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 2550 <KPrintF>(pc)
    2ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    2ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    2aea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    2aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 2c5e <DrawRect+0x69c>
      WORD length = x1 - x2;
    2af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    2af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    2af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2af8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    2afa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    2afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 3342 <DrawRect+0xd80>
    2b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2b06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    2b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    2b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2b0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 2c92 <DrawRect+0x6d0>
      height += 1; 
    2b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    2b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2b26 <DrawRect+0x564>
    2b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2b20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2b30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2c7a <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    2b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    2b3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 2c6e <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2b40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 3192 <DrawRect+0xbd0>
    2b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    2b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 2cd0 <DrawRect+0x70e>
    2b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 3196 <DrawRect+0xbd4>
          height *= -1;
    2b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    2b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2cd6 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    2b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 2cc0 <DrawRect+0x6fe>
    2b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3366 <DrawRect+0xda4>
    2b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    2bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 3c668 <LookupSlope>,a0
    2bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2c9e <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd751b2>,d0
    2bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd751b2>,d0
    2bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2bf8 <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 899ba <BltCon0LineDraw>,a0
    2c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd751f0>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 89e2e <PrepareBuffer>,a5
    2c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 89e32 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd751fc>
  custom->bltcpt = (UBYTE *)bltdpt;
    2c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd751f8>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75204>
  custom->bltbmod = bltbmod;
    2c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd75212>
  custom->bltcmod = bltdmod;
    2c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd75210>
  custom->bltdmod = bltdmod;
    2c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd75216>
  custom->bltsize = bltwidth + 64*height;
    2c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75208>
  WORD x1 = square->Vertices[index1].X;
    2c5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    2c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    2c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 26fc <DrawRect+0x13a>
        starty += 96;
    2c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2b3e <DrawRect+0x57c>
        startx += 96;
    2c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2c8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2b3e <DrawRect+0x57c>
    2c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 2c6e <DrawRect+0x6ac>
        height = -height;
    2c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2b14 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 3c475 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 2550 <KPrintF>(pc)
    2cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    2cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd751b2>,d0
    2cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2bf8 <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    2cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2b74 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    2cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    2cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2b62 <DrawRect+0x5a0>
    2cd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    2ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 2b6c <DrawRect+0x5aa>
    2ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 2cc0 <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 3c45f <incbin_MercuryLetterData2Lz4_end+0x27>
    2cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    2cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 2550 <KPrintF>(pc)
    2cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 2e6a <DrawRect+0x8a8>
      WORD length = x1 - x2;
    2d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 32a6 <DrawRect+0xce4>
    2d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    2d14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    2d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    2d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    2d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 2e9e <DrawRect+0x8dc>
      height += 1; 
    2d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    2d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    2d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 2d30 <DrawRect+0x76e>
    2d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    2d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    2d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    2d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2e86 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    2d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    2d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    2d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2e7a <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    2d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    2d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    2d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2ee6 <DrawRect+0x924>
    2d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    2d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3496 <DrawRect+0xed4>
    2d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    2d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3466 <DrawRect+0xea4>
          startx -= 1;
    2d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    2d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    2d70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    2d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2ef8 <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    2d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    2d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    2d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 2ed2 <DrawRect+0x910>
    2d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 32c6 <DrawRect+0xd04>
    2da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    2dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 3c668 <LookupSlope>,a1
    2df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    2dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2eac <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd751b2>,d0
    2e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2e0c <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 899ba <BltCon0LineDraw>,d0
    2e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd751f0>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 89e2e <PrepareBuffer>,a5
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2e34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 89e32 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd751fc>
  custom->bltcpt = (UBYTE *)bltdpt;
    2e40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd751f8>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75204>
  custom->bltbmod = bltbmod;
    2e4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd75212>
  custom->bltcmod = bltdmod;
    2e52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd75210>
  custom->bltdmod = bltdmod;
    2e58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd75216>
  custom->bltsize = bltwidth + 64*height;
    2e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    2e60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2e64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75208>
  WORD x1 = square->Vertices[index1].X;
    2e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    2e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2e76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 26e2 <DrawRect+0x120>
        starty += 96;
    2e7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    2e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 2d48 <DrawRect+0x786>
        startx += 96;
    2e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2e90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 2d48 <DrawRect+0x786>
    2e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2e7a <DrawRect+0x8b8>
        height = -height;
    2e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    2ea0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    2ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2ea4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 2d20 <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 3c475 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 2550 <KPrintF>(pc)
    2ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    2ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2e0c <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    2ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 2d92 <DrawRect+0x7d0>
          height *= -1;
    2ee6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    2ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    2ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2d76 <DrawRect+0x7b4>
    2ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2efc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    2efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    2f02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2f08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2d86 <DrawRect+0x7c4>
    2f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 2ed2 <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    2f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 3c45f <incbin_MercuryLetterData2Lz4_end+0x27>
    2f14:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    2f18:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 2550 <KPrintF>(pc)
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    2f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    2f22:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    2f24:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 3096 <DrawRect+0xad4>
      WORD length = x1 - x2;
    2f28:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    2f2c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    2f2e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2f30:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    2f32:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    2f34:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 3200 <DrawRect+0xc3e>
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    2f3c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    2f3e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    2f42:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    2f46:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    2f48:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 30ca <DrawRect+0xb08>
      height += 1; 
    2f4c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2f50:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    2f54:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 2f5e <DrawRect+0x99c>
    2f56:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    2f58:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    2f5c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2f62:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2f66:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    2f68:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    2f6a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 30b2 <DrawRect+0xaf0>
      if(yposmin <= 0) {
    2f6e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    2f72:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 30a6 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2f76:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2f78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2f7a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2f7c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 3142 <DrawRect+0xb80>
    2f80:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    2f82:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2f84:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 3108 <DrawRect+0xb46>
    2f88:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2f8a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2f8c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 3146 <DrawRect+0xb84>
          height *= -1;
    2f90:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    2f92:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2f94:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2f96:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 310e <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2f9a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2f9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2f9e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 30f8 <DrawRect+0xb36>
    2fa4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2fa6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2fa8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2fac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2fae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2fb0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2fb4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2fb6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 3224 <DrawRect+0xc62>
    2fba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2fbe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2fc0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    2fc2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2fc6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2fcc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2fd0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    2fd2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2fd4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    2fd6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2fd8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2fda:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2fdc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2fde:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2fe0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2fe2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    2fe4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2fea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2fec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2fee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2ff0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2ff6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2ff8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2ffc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2ffe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    3000:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    3002:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    3006:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    3008:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    300a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 3c668 <LookupSlope>,a0
    3010:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    3012:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    3014:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    3018:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    301a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    301e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    3020:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    3022:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 30d6 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3026:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd751b2>,d0
    302c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3030:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd751b2>,d0
    3036:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    303a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 3030 <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    303c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    3040:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 899ba <BltCon0LineDraw>,a0
    3046:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    3048:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    304a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    304c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd751f0>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    3052:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    3054:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    3056:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 89e2e <PrepareBuffer>,a5
    305c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    305e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 89e32 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    3064:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd751fc>
  custom->bltcpt = (UBYTE *)bltdpt;
    306a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd751f8>
  custom->bltdpt = (UBYTE *)bltdpt;  
    3070:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75204>
  custom->bltbmod = bltbmod;
    3076:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd75212>
  custom->bltcmod = bltdmod;
    307e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd75210>
  custom->bltdmod = bltdmod;
    3084:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd75216>
  custom->bltsize = bltwidth + 64*height;
    308a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    308c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    308e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    3090:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd75208>
  WORD x1 = square->Vertices[index1].X;
    3096:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    309a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    309e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    30a2:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 26c0 <DrawRect+0xfe>
        starty += 96;
    30a6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    30aa:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    30ae:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2f76 <DrawRect+0x9b4>
        startx += 96;
    30b2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    30b8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    30bc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    30c0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    30c2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    30c4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2f76 <DrawRect+0x9b4>
    30c8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 30a6 <DrawRect+0xae4>
        height = -height;
    30ca:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    30cc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    30ce:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    30d0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    30d2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 2f4c <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    30d6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 3c475 <incbin_MercuryLetterData2Lz4_end+0x3d>
    30dc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    30e0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 2550 <KPrintF>(pc)
    30e4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    30e6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    30ea:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd751b2>,d0
    30f0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    30f4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 3030 <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    30f8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    30fc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    30fe:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    3100:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    3104:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2fac <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    3108:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    310a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2f9a <DrawRect+0x9d8>
    310e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    3112:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    3114:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    3116:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    3118:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2fa4 <DrawRect+0x9e2>
    311c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 30f8 <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    311e:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    3120:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    3122:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    3124:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    312a:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    312c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    312e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    3132:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    3136:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    313a:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    313e:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 279a <DrawRect+0x1d8>
          height *= -1;
    3142:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    3144:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    3146:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    314a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    314e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 317e <DrawRect+0xbbc>
    3150:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    3152:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3154:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    3156:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    3158:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    315a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    315c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 316c <DrawRect+0xbaa>
    315e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    3160:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3162:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3164:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    3168:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2fac <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    316c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    3170:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    3172:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3174:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3176:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    317a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2fac <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    317e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    3182:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    3184:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3186:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    3188:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    318a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    318c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    318e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 315e <DrawRect+0xb9c>
    3190:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 316c <DrawRect+0xbaa>
          height *= -1;
    3192:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    3194:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    3196:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    319a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    319e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 31bc <DrawRect+0xbfa>
    31a0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    31a2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31a4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    31a6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    31a8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    31aa:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    31ac:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 31ce <DrawRect+0xc0c>
    31ae:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    31b0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    31b2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    31b4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    31b8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2b74 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    31bc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    31c0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31c2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31c4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31c6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31c8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31ca:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31cc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 31ae <DrawRect+0xbec>
    31ce:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    31d2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    31d4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    31d6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    31d8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    31dc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2b74 <DrawRect+0x5b2>
        length *= -1;
    31e0:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    31e2:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    31e4:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    31e6:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    31ea:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    31ee:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    31f4:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    31f6:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    31f8:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 28ce <DrawRect+0x30c>
    31fc:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2a54 <DrawRect+0x492>
        length *= -1;
    3200:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    3202:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    3204:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    3206:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    320a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    320e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    3212:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    3214:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    3216:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    321a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    321c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 2f4c <DrawRect+0x98a>
    3220:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 30ca <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    3224:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    3226:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    3228:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    322a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    322e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    3230:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    3232:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    3234:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    3236:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    323a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    323c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    323e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    3242:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    3248:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    324a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    324c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    324e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3250:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    3252:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3254:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3256:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    3258:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    325a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    325c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    325e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    3260:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3264:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3266:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3268:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    326a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    326c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    3270:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    3272:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3274:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    3278:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    327a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    327c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    327e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    3282:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    3284:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3286:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 3c668 <LookupSlope>,a0
    328c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    328e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    3290:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    3294:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    3296:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    329a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    329c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    329e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 3026 <DrawRect+0xa64>
    32a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 30d6 <DrawRect+0xb14>
        length *= -1;
    32a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    32a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    32aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    32ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    32b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    32b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    32ba:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    32bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    32be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 2d20 <DrawRect+0x75e>
    32c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 2e9e <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    32c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    32c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    32ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    32cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    32d0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    32d2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    32d4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    32d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    32d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    32dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    32de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    32e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    32e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    32e6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    32ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    32ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    32f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    32f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    32f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    32f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    32f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    32fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    32fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    32fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    3300:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3302:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    3304:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    3306:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    3308:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    330a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    330c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    330e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    3310:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3312:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    3314:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3316:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3318:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    331a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    331c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    331e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    3322:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    3324:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3326:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 3c668 <LookupSlope>,a1
    332c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    332e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    3330:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    3334:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    3336:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    3338:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    333a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2e06 <DrawRect+0x844>
    333e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2eac <DrawRect+0x8ea>
        length *= -1;
    3342:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    3344:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    3346:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    3348:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    334c:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    3350:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    3354:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    3356:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    3358:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    335c:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    335e:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2b14 <DrawRect+0x552>
    3362:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 2c92 <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3366:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    3368:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    336a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    336c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    3370:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    3372:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    3374:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    3376:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    3378:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    337c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    337e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    3380:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    3384:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    338a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    338c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    338e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    3390:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3392:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    3394:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3396:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    3398:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    339a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    339c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    339e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    33a0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    33a2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    33a6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    33a8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    33aa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33ac:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    33ae:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    33b2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    33b4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33b6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    33ba:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33bc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33be:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    33c0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    33c4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    33c6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33c8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 3c668 <LookupSlope>,a0
    33ce:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    33d0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    33d2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    33d6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    33d8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    33dc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    33de:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    33e0:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 2bee <DrawRect+0x62c>
    33e4:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 2c9e <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    33e8:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    33ea:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    33ec:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    33ee:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    33f2:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    33f4:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    33f6:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    33f8:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    33fa:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    33fe:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    3400:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3402:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    3404:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    3408:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    340e:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    3410:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3412:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    3414:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3416:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    3418:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    341a:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    341c:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    341e:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    3420:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    3422:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3424:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    3426:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    3428:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    342a:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    342c:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    342e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    3430:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    3432:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3434:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    3436:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    3438:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    343a:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    343c:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    343e:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    3440:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    3444:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    3446:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    3448:	|  |  |  |  |                                                  |  |  |                                                                                       lea 3c668 <LookupSlope>,a1
    344e:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    3450:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    3452:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    3456:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    3458:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    345a:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    345c:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    345e:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 29b6 <DrawRect+0x3f4>
    3462:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 2a7a <DrawRect+0x4b8>
          height *= -1;
    3466:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    3468:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    346a:	|  |  |                                                        |     |                                                                                       tst.w d3
    346c:	|  |  |                                                        |     |                                                                                /----- blt.s 349a <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    346e:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    3470:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    3472:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    3474:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 3484 <DrawRect+0xec2>
    3476:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    3478:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    347a:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3480:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 2d92 <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    3484:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    3488:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    348a:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    348c:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3492:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 2d92 <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    3496:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    3498:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 346e <DrawRect+0xeac>
    349a:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    349e:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    34a0:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    34a2:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    34a4:	|  |  |                                                                                                                                         |  \-------- bpl.s 3476 <DrawRect+0xeb4>
    34a6:	|  |  |                                                                                                                                         \----------- bra.s 3484 <DrawRect+0xec2>
          height *= -1;
    34a8:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    34aa:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    34ac:	|     |                                                                                                                                                      tst.w d3
    34ae:	|     |                                                                                                                                               /----- blt.s 34dc <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    34b0:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    34b2:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    34b4:	|     |                                                                                                                                               |  |   move.w a4,d0
    34b6:	|     |                                                                                                                                         /-----|--|-- bmi.s 34c6 <DrawRect+0xf04>
    34b8:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    34ba:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34bc:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34c2:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2940 <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    34c6:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    34ca:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    34cc:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34ce:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34d4:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2940 <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    34d8:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    34da:	                                                                                                                                                |  |  |  \-- bge.s 34b0 <DrawRect+0xeee>
    34dc:	                                                                                                                                                |  |  \----> addi.w #15,d3
    34e0:	                                                                                                                                                |  |         asr.w #4,d3
    34e2:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    34e4:	                                                                                                                                                |  |         move.w a4,d0
    34e6:	                                                                                                                                                |  \-------- bpl.s 34b8 <DrawRect+0xef6>
    34e8:	                                                                                                                                                \----------- bra.s 34c6 <DrawRect+0xf04>

000034ea <DrawCube3d>:
{
    34ea:	                                                                                                                      lea -72(sp),sp
    34ee:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    34f2:	                                                                                                                      movea.l 120(sp),a2
    34f6:	                                                                                                                      move.w 126(sp),108(sp)
    34fc:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    3502:	                                                                                                                      move.w #0,dff042 <_end+0xd751f2>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    350a:	                                                                                                                      move.l 89cc0 <ClearBuffer>,54(sp)
    3512:	                                                                                                                      lea 899bc <Cubes>,a3
    3518:	                                                                                                                      moveq #0,d5
    351a:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    351c:	|                                                                                                                     add.l d5,d2
    351e:	|                                                                                                                     move.l d2,102(sp)
    3522:	|                                                                                                                     add.l d5,d2
    3524:	|                                                                                                                     add.l d2,d2
    3526:	|                                                                                                                     add.l d2,d2
    3528:	|                                                                                                                     movea.l 54(sp),a0
    352c:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    3530:	|                                                                                                                     movea.l 89e44 <GfxBase>,a6
    3536:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    353a:	|                                                                                                                     move.w #496,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0;
    3542:	|                                                                                                                     move.w #0,dff042 <_end+0xd751f2>
  custom->bltdmod = bltmod;
    354a:	|                                                                                                                     move.w d3,dff066 <_end+0xd75216>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    3550:	|                                                                                                                     move.l 89cc0 <ClearBuffer>,54(sp)
    3558:	|                                                                                                                     movea.l 54(sp),a4
    355c:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3560:	|                                                                                                                     cmpa.w #0,a6
    3564:	|                       /-------------------------------------------------------------------------------------------- bne.w 3e6e <DrawCube3d+0x984>
    3568:	|                       |                                                                                             move.l d5,d1
    356a:	|                       |                                                                                             addq.l #1,d1
    356c:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    3570:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    3572:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    3578:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    357c:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    3580:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    3584:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    3588:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    358c:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    3590:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3596:	|                    |  |                                                                                             movea.w a0,a1
    3598:	|                    |  |                                                                                             subq.l #1,a1
    359a:	|                    |  |                                                                                             adda.l a1,a1
    359c:	|                    |  |                                                                                             lea 41488 <zMult>,a5
    35a2:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    35a8:	|                    |  |                                                                                             move.w 62(sp),d0
    35ac:	|                    |  |                                                                                             muls.w d1,d0
    35ae:	|                    |  |                                                                                             moveq #15,d7
    35b0:	|                    |  |                                                                                             asr.l d7,d0
    35b2:	|                    |  |                                                                                             movea.l d0,a1
    35b4:	|                    |  |                                                                                             lea 160(a1),a1
    35b8:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    35bc:	|                    |  |                                                                                             move.w 62(sp),d7
    35c0:	|                    |  |                                                                                             muls.w 86(sp),d7
    35c4:	|                    |  |                                                                                             moveq #15,d0
    35c6:	|                    |  |                                                                                             asr.l d0,d7
    35c8:	|                    |  |                                                                                             addi.w #128,d7
    35cc:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    35d0:	|                    |  |                                                                                             movea.w 10(a2),a1
    35d4:	|                    |  |                                                                                             subq.l #1,a1
    35d6:	|                    |  |                                                                                             adda.l a1,a1
    35d8:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    35de:	|                    |  |                                                                                             move.w 70(sp),d7
    35e2:	|                    |  |                                                                                             muls.w 6(a2),d7
    35e6:	|                    |  |                                                                                             asr.l d0,d7
    35e8:	|                    |  |                                                                                             movea.l d7,a1
    35ea:	|                    |  |                                                                                             lea 160(a1),a1
    35ee:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    35f2:	|                    |  |                                                                                             move.w 70(sp),d7
    35f6:	|                    |  |                                                                                             muls.w 8(a2),d7
    35fa:	|                    |  |                                                                                             asr.l d0,d7
    35fc:	|                    |  |                                                                                             addi.w #128,d7
    3600:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    3604:	|                    |  |                                                                                             movea.w a4,a1
    3606:	|                    |  |                                                                                             move.l a1,d7
    3608:	|                    |  |                                                                                             subq.l #1,d7
    360a:	|                    |  |                                                                                             add.l d7,d7
    360c:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    3612:	|                    |  |                                                                                             move.w 76(sp),d0
    3616:	|                    |  |                                                                                             muls.w d4,d0
    3618:	|                    |  |                                                                                             moveq #15,d7
    361a:	|                    |  |                                                                                             asr.l d7,d0
    361c:	|                    |  |                                                                                             movea.l d0,a5
    361e:	|                    |  |                                                                                             lea 160(a5),a5
    3622:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3626:	|                    |  |                                                                                             move.w 76(sp),d7
    362a:	|                    |  |                                                                                             muls.w d3,d7
    362c:	|                    |  |                                                                                             moveq #15,d0
    362e:	|                    |  |                                                                                             asr.l d0,d7
    3630:	|                    |  |                                                                                             addi.w #128,d7
    3634:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    3638:	|                    |  |                                                                                             cmpa.w #0,a6
    363c:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 3648 <DrawCube3d+0x15e>
    363e:	|                    |  |  |                                                                                          tst.w 89cc4 <DoNotClearDirty>
    3644:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 3e1c <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3648:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    364c:	|                    |  |  |  |                                                                                       move.l a5,d7
    364e:	|                    |  |  |  |                                                                                       subq.l #1,d7
    3650:	|                    |  |  |  |                                                                                       add.l d7,d7
    3652:	|                    |  |  |  |                                                                                       lea 41488 <zMult>,a5
    3658:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    365e:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    3662:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3664:	|                    |  |  |  |                                                                                       moveq #15,d7
    3666:	|                    |  |  |  |                                                                                       asr.l d7,d0
    3668:	|                    |  |  |  |                                                                                       movea.l d0,a5
    366a:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    366e:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    3672:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    3676:	|                    |  |  |  |                                                                                       muls.w d6,d7
    3678:	|                    |  |  |  |                                                                                       moveq #15,d0
    367a:	|                    |  |  |  |                                                                                       asr.l d0,d7
    367c:	|                    |  |  |  |                                                                                       addi.w #128,d7
    3680:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3684:	|                    |  |  |  |                                                                                       move.l a1,d7
    3686:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    368c:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    368e:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    3690:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    3694:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3696:	|                    |  |  |  |                                                                                       muls.w d3,d0
    3698:	|                    |  |  |  |                                                                                       movea.l d1,a5
    369a:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    369c:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    369e:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    36a0:	|                    |  |  |  |                                                                                       movea.w a0,a0
    36a2:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    36a4:	|                    |  |  |  |                                                                                       jsr 5a50 <__mulsi3>
    36aa:	|                    |  |  |  |                                                                                       addq.l #8,sp
    36ac:	|                    |  |  |  |                                                                                       add.l a5,d0
    36ae:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    36b2:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    36b6:	|                    |  |  |  |                                                                                       neg.l d0
    36b8:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    36bc:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    36c0:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    36c4:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 36d0 <DrawCube3d+0x1e6>
    36c6:	|                    |  |  |  |  |                                                                                    tst.w 89cc4 <DoNotClearDirty>
    36cc:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3ddc <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    36d0:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    36d4:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    36d6:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36d8:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36da:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    36de:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    36e2:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36e4:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    36e6:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36e8:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    36ea:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    36ec:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    36f0:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36f2:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    36f4:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    36f6:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    36f8:	|                    |  |  |  |  |  |                                                                                 jsr 5a50 <__mulsi3>
    36fe:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    3700:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    3702:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    3706:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    3708:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    370a:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    370e:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3712:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3716:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 372a <DrawCube3d+0x240>
    3718:	|  |                 |  |  |  |  |  |                                                                                 tst.w 89cc4 <DoNotClearDirty>
    371e:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 372a <DrawCube3d+0x240>
    3720:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3726:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 430c <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    372a:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    372e:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3734:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    373a:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    3740:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3746:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    374c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    3752:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    3758:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    375c:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    3760:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3764:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3766:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3768:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    376a:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    376c:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    376e:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    3770:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    3772:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    3774:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3776:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3778:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    377a:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    377c:	|  |  |              |  |  |  |  |  |                                                                                 jsr 5a50 <__mulsi3>
    3782:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    3784:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    3786:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    378a:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    378c:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    3790:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    3794:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    3796:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    3798:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    379a:	|  |  |              |  |  |  |  |  |                                                                                 lea 41488 <zMult>,a4
    37a0:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37a4:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    37a6:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    37aa:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    37ac:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    37ae:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    37b2:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    37b6:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37b8:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    37ba:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    37be:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    37c2:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37c4:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37c6:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37c8:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37cc:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    37ce:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    37d2:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    37d4:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    37d8:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    37dc:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37de:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    37e2:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    37e4:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    37e6:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    37e8:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    37ea:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    37ee:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    37f0:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    37f2:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    37f6:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    37f8:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    37fa:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    37fc:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    3800:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    3804:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    3806:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    3808:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    380c:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    380e:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    3812:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3814:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3816:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    3818:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    381c:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    381e:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    3822:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3824:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3826:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3828:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    382c:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3830:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3844 <DrawCube3d+0x35a>
    3832:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 89cc4 <DoNotClearDirty>
    3838:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3844 <DrawCube3d+0x35a>
    383a:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3840:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 42b4 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3844:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    384a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    3850:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3854:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    3858:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    385c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    3860:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3864:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    3868:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    386c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    3870:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    3876:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    387c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    3882:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    3888:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    388e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    3894:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    3898:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    389c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    38a0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    38a4:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    38aa:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    38b0:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    38b4:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 38c8 <DrawCube3d+0x3de>
    38b6:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 89cc4 <DoNotClearDirty>
    38bc:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 38c8 <DrawCube3d+0x3de>
    38be:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    38c4:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 434c <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    38c8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    38ce:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    38d4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    38d8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    38dc:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    38e0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    38e4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    38ea:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    38f0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    38f6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    38fc:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    3900:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3904:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    3908:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    390c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    3912:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    3918:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    391e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3924:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    3928:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    392e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    3932:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3936:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    393c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    3942:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    3948:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    394e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    3952:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3956:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    395c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    3962:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3966:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    396a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    396e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    3972:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 351a <DrawCube3d+0x30>
    3976:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 89a7c <Cubes+0xc0>,a6
    397c:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    3980:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    3984:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    3988:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    398e:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    3992:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    3996:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    399a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    399c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    399e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    39a0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    39a6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    39ac:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    39b0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    39b4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    39b8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 3b1a <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    39bc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    39c0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    39c4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 39b4 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    39c6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    39ca:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    39ce:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 89cc8 <CubeNrReversePtr>,a0
    39d4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    39d8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    39da:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 3cfe <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    39de:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    39e0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 3c64 <DrawCube3d+0x77a>
    39e4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    39e6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    39e8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    39ec:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3c74 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    39f0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    39f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 3ed0 <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    39fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    3a00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 3a08 <DrawCube3d+0x51e>
    3a02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    3a08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    3a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    3a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 89ccc <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    3a18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3a1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    3a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    3a2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    3a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3a42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    3a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3a52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    3a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    3a5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a6e <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3a62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a6e <DrawCube3d+0x584>
    3a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    3a6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 3d90 <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3a6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3a72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3a84 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    3a78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3a84 <DrawCube3d+0x59a>
    3a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 3d9e <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3a84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    3a88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 3a9a <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 3a9a <DrawCube3d+0x5b0>
    3a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3a96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 3d40 <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    3a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    3a9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 3ab0 <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    3aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 3ab0 <DrawCube3d+0x5c6>
    3aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    3aac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 3d4e <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    3ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    3ab4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 3ac6 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    3aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 3ac6 <DrawCube3d+0x5dc>
    3abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    3ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 3d5c <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    3ac6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    3aca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 3adc <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    3ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 3adc <DrawCube3d+0x5f2>
    3ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    3ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 3d6a <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    3adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    3ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    3ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    3ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    3aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    3af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 398e <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 89ccc <DrawBuffer>,a2
  if( mirroring == 1) {
    3afa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 3f32 <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    3b18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3b20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    3b28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    3b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    3b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    3b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    3b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    3b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3b7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    3ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bac <DrawCube3d+0x6c2>
    3baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    3bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bb2 <DrawCube3d+0x6c8>
    3bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    3bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bb8 <DrawCube3d+0x6ce>
    3bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    3bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bc2 <DrawCube3d+0x6d8>
    3bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    3bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bc8 <DrawCube3d+0x6de>
    3bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bd0 <DrawCube3d+0x6e6>
    3bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    3bd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    3bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bd6 <DrawCube3d+0x6ec>
    3bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bdc <DrawCube3d+0x6f2>
    3bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    3bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3be2 <DrawCube3d+0x6f8>
    3be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    3be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bec <DrawCube3d+0x702>
    3bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    3bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bf2 <DrawCube3d+0x708>
    3bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    3bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bfa <DrawCube3d+0x710>
    3bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3c02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3c0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3c14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c20 <DrawCube3d+0x736>
    3c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c2a <DrawCube3d+0x740>
    3c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c36 <DrawCube3d+0x74c>
    3c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c40 <DrawCube3d+0x756>
    3c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3c46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3c4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 39b4 <DrawCube3d+0x4ca>
    3c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 39c6 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    3c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    3c68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    3c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    3c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    3c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 39f0 <DrawCube3d+0x506>
      if(maxycube < 0) {
    3c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3ec6 <DrawCube3d+0x9dc>
      minycube = 0;
    3c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    3c82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3c90 <DrawCube3d+0x7a6>
    3c8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    3c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3c9c <DrawCube3d+0x7b2>
    3c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 89ccc <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    3cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3a14 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 3e82 <DrawCube3d+0x998>
    3cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    3cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    3cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    3cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    3cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    3ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    3ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    3cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    3cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3a30 <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    3d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3d0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3dac <DrawCube3d+0x8c2>
    3d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    3d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    3d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    3d14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    3d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    3d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    3d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    3d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    3d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    3d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    3d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    3d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    3d32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    3d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    3d38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 39e4 <DrawCube3d+0x4fa>
    3d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 3c64 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    3d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    3d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    3d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 3a9a <DrawCube3d+0x5b0>
    3d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    3d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    3d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 3ab0 <DrawCube3d+0x5c6>
    3d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    3d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    3d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 3ac6 <DrawCube3d+0x5dc>
    3d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    3d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    3d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 398e <DrawCube3d+0x4a4>
    3d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 3af4 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    3d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3a6e <DrawCube3d+0x584>
    3d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    3da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 25c2 <DrawRect>(pc)
    3da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3a84 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    3db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    3db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    3dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    3dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    3dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    3dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    3dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3dd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 3d36 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3ddc:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    3de0:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3de2:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3de6:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3de8:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3dea:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    3dee:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3df2:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd751b2>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3df8:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd751b2>,d0
    3dfe:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    3e02:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3df8 <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3e04:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    3e0a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    3e12:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd75208>
}
    3e18:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 36d0 <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3e1c:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    3e20:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e22:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    3e26:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e28:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e2a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    3e2e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e34:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd751b2>,d7
    3e3a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    3e3e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e42:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd751b2>,d7
    3e48:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    3e4c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 3e42 <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    3e4e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    3e52:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    3e58:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    3e60:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd75208>
      clearpos += 64*BPLHEIGHT;
    3e66:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    3e6a:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 3648 <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3e6e:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 89cc4 <DoNotClearDirty>
    3e74:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 3eee <DrawCube3d+0xa04>
    3e76:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3e78:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3e7a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    3e7e:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 3570 <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3e82:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3e86:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3e88:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3e8a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3e8c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    3e90:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    3e92:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3e94:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3e96:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3e9a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3e9c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    3ea0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    3ea2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ea4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3ea6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3ea8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3eaa:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3eac:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3eb0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3eb4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3eb6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3eb8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3eba:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ebc:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    3ebe:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    3ec2:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3a30 <DrawCube3d+0x546>
      if(maxycube < 0) {
    3ec6:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3ec8:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3ecc:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 3c82 <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    3ed0:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3ed4:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3ed6:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 3ede <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3ed8:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3eda:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 3c82 <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    3ede:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    3ee2:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3ee6:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3eea:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 3c82 <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3eee:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    3ef0:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    3ef2:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3ef6:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3ef8:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3efa:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3efc:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3efe:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3f00:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f04:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd751b2>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f0a:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd751b2>,d0
    3f10:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    3f14:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3f0a <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    3f16:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    3f1c:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    3f24:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd75208>
      clearpos += 64*BPLHEIGHT;
    3f2a:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    3f2e:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 3570 <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3f32:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    3f36:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    3f3a:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    3f3c:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3f3e:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3f40:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    3f44:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    3f48:	|  |  |  |  |  |  |                                                                                                   movea.l 89e2e <PrepareBuffer>,a6
    3f4e:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    3f52:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    3f56:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    3f58:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f5c:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f62:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    3f68:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f6c:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f62 <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    3f6e:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd751f4>
  custom->bltalwm = 0xffff; //Show All
    3f76:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd751f6>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    3f7e:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd75220>
  custom->bltamod = 60;
    3f86:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd75214>
  custom->bltbmod = 60;
    3f8e:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd75212>
  custom->bltdmod = 60;    
    3f96:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd75216>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    3f9e:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x8002; //Ascending
    3fa6:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd751f2>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3fae:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    3fb0:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    3fb2:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3fb4:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3fb6:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3fb8:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3fbc:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    3fbe:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    3fc0:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    3fc2:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3fc4:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3fc8:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3fca:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3fcc:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    3fd0:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    3fd4:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    3fd8:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3fda:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3fdc:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    3fde:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3fe2:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    3fe6:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    3fea:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    3fec:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    3fee:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    3ff2:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    3ff4:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    3ff8:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 402e <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    3ffa:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd75200>
      custom->bltbpt = bltbpos;
    4000:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd751fc>
      custom->bltdpt = bltdpos;
    4006:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd75204>
      custom->bltsize = 2 + height * 64;
    400c:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd75208>
      bltapos -= 2;
    4012:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    4014:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    4016:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4018:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd751b2>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    401e:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd751b2>,d0
    4024:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    4028:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 401e <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    402a:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    402c:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 3ffa <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    402e:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    4034:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    4036:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 4054 <DrawCube3d+0xb6a>
    4038:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    403a:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    403e:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    4042:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    4044:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    4046:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    404a:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    404c:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    4050:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 3ffa <DrawCube3d+0xb10>
    4052:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 402e <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    4054:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    405c:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd751f2>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    4064:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd75220>
  UWORD mod=64 - length*2-2;
    406c:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    406e:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    4070:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    4072:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75214>
  custom->bltbmod = mod;
    4078:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75212>
  custom->bltdmod = mod;
    407e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75216>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4084:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    4086:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    4088:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    408c:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    4090:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    4092:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4094:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    4096:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    4098:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    409a:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    409c:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    409e:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    40a0:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    40a6:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    40ac:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    40b2:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40b8:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd751b2>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40be:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d4
    40c4:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    40c8:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40be <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40ca:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    40cc:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    40d0:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    40d4:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    40d6:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    40dc:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    40de:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    40e0:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    40e6:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    40ec:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    40f2:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40f8:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40fe:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4104:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4108:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40fe <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    410a:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0xe002;
    4112:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd751f2>
  custom->bltcdat = 0x3333;
    411a:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd75220>
  custom->bltamod = mod;
    4122:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75214>
  custom->bltbmod = mod;
    4128:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75212>
  custom->bltdmod = mod;
    412e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75216>
    custom->bltapt = bltapos;
    4134:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    413a:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    4140:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    4146:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    414c:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4152:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4158:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    415c:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4152 <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    415e:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    4164:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    416a:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    4170:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4176:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    417c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4182:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4186:	|  |  |  |  |  |  |                                                                                               \-- bne.s 417c <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    4188:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0xf002;
    4190:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd751f2>
  custom->bltcdat = 0x5555;
    4198:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd75220>
  custom->bltamod = mod;
    41a0:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd75214>
  custom->bltbmod = mod;
    41a6:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd75212>
  custom->bltdmod = mod;
    41ac:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd75216>
    custom->bltapt = bltapos;
    41b2:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    41b8:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    41be:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    41c4:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41ca:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41d0:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    41d6:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41da:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41d0 <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    41dc:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75200>
    custom->bltbpt = bltbpos;
    41e2:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd751fc>
    custom->bltdpt = bltdpos;
    41e8:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75204>
    custom->bltsize = length+1 + height * 64;
    41ee:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41f4:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41fa:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4200:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4204:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41fa <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    4206:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd751f0>
  custom->bltcon1 = 0x0002;
    420e:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd751f2>
  custom->bltcdat = 0x0;
    4216:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd75220>
  mod=64 -length*2;
    421e:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    4220:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    4222:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    4224:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd75214>
  custom->bltdmod = mod;
    422a:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd75216>
  custom->bltafwm = bltfmask;
    4230:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd751f4>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4238:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    423c:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    423e:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4242:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd75200>
    custom->bltdpt = bltdpos;
    4248:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75204>
    custom->bltsize = length + height * 64;
    424e:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4254:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    425a:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4260:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4264:	|  |  |  |  |  |  |                                                                                               \-- bne.s 425a <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4266:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4268:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    426c:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    426e:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4272:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd75200>
    custom->bltdpt = bltdpos;
    4278:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75204>
    custom->bltsize = length + height * 64;
    427e:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd75208>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4284:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd751b2>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    428a:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd751b2>,d0
    4290:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4294:	|  |  |  |  |  |  |                                                                                               \-- bne.s 428a <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    4296:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd751f4>
  DrawBuffer->minytotal = minytotal;
    429e:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    42a4:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    42aa:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    42ae:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    42b2:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    42b4:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    42b8:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42ba:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    42be:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42c0:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42c2:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    42c6:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42cc:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd751b2>,d6
    42d2:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    42d6:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    42da:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd751b2>,d6
    42e0:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    42e4:	|  |  |  |  |  |                                                                                                  \-- bne.s 42da <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    42e6:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    42ea:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    42ee:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    42f4:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    42fc:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd75208>
      clearpos += 64*BPLHEIGHT;
    4304:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    4308:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3844 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    430c:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4310:	|  |        |  |                                                                                                      add.l d0,d0
    4312:	|  |        |  |                                                                                                      add.l 94(sp),d0
    4316:	|  |        |  |                                                                                                      add.l d0,d0
    4318:	|  |        |  |                                                                                                      add.l d0,d0
    431a:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    431e:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd751b2>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4324:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd751b2>,d0
    432a:	|  |        |  |                                                                                                  |   btst #14,d0
    432e:	|  |        |  |                                                                                                  \-- bne.s 4324 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    4330:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    4336:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    433e:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd75208>
      clearpos += 64*BPLHEIGHT;
    4344:	|  |        |  |                                                                                                      lea 16384(a5),a5
    4348:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 372a <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    434c:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    4350:	|           |                                                                                                         add.l d0,d0
    4352:	|           |                                                                                                         add.l 94(sp),d0
    4356:	|           |                                                                                                         add.l d0,d0
    4358:	|           |                                                                                                         add.l d0,d0
    435a:	|           |                                                                                                         movea.l 54(sp),a4
    435e:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4362:	|           |                                                                                                         move.w dff002 <_end+0xd751b2>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4368:	|           |                                                                                                     /-> move.w dff002 <_end+0xd751b2>,d0
    436e:	|           |                                                                                                     |   btst #14,d0
    4372:	|           |                                                                                                     \-- bne.s 4368 <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    4374:	|           |                                                                                                         move.l a5,dff054 <_end+0xd75204>
    custom->bltadat = 0x0;
    437a:	|           |                                                                                                         move.w #0,dff074 <_end+0xd75224>
    custom->bltsize = bltsize;    
    4382:	|           |                                                                                                         move.w d6,dff058 <_end+0xd75208>
    squares[3].Vertices[0].X = xs0;
    4388:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    438e:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    4394:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    4398:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    439c:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    43a0:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    43a4:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    43aa:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    43b0:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    43b6:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    43bc:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    43c0:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    43c4:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    43c8:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    43cc:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    43d2:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    43d8:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    43de:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    43e4:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    43e8:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    43ee:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    43f2:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    43f6:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    43fc:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    4402:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    4408:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    440e:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    4412:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    4416:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    441c:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    4422:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    4426:	|           |                                                                                                         move.l 94(sp),d5
    442a:	|           |                                                                                                         lea 192(a3),a3
    442e:	|           |                                                                                                         cmp.w 106(sp),d5
    4432:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 351a <DrawCube3d+0x30>
    4436:	            \-------------------------------------------------------------------------------------------------------- bra.w 3976 <DrawCube3d+0x48c>

0000443a <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    443a:	       link.w a5,#-52
    443e:	       move.l a2,-(sp)
    4440:	       move.l d2,-(sp)
    4442:	       movea.l 12(a5),a1
    4446:	       move.l 16(a5),d2
    444a:	       move.l 20(a5),d1
	struct debug_resource resource = {
    444e:	       clr.l -42(a5)
    4452:	       clr.l -38(a5)
    4456:	       clr.l -34(a5)
    445a:	       clr.l -30(a5)
    445e:	       clr.l -26(a5)
    4462:	       clr.l -22(a5)
    4466:	       clr.l -18(a5)
    446a:	       clr.l -14(a5)
    446e:	       clr.w -10(a5)
    4472:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    4478:	       move.w d2,d0
    447a:	       muls.w d1,d0
    447c:	       lsl.l #6,d0
	struct debug_resource resource = {
    447e:	       move.l d0,-46(a5)
    4482:	       clr.w -8(a5)
    4486:	       move.w #512,-6(a5)
    448c:	       move.w d2,-4(a5)
    4490:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    4494:	       move.b (a1),d0
    4496:	       lea -42(a5),a0
    449a:	/----- beq.s 44ac <debug_register_bitmap.constprop.0+0x72>
    449c:	|      lea -11(a5),a2
		*destination++ = *source++;
    44a0:	|  /-> addq.l #1,a1
    44a2:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    44a4:	|  |   move.b (a1),d0
    44a6:	+--|-- beq.s 44ac <debug_register_bitmap.constprop.0+0x72>
    44a8:	|  |   cmpa.l a0,a2
    44aa:	|  \-- bne.s 44a0 <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    44ac:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    44ae:	       move.w f0ff60 <_end+0xe86110>,d0
    44b4:	       cmpi.w #20153,d0
    44b8:	   /-- beq.s 44cc <debug_register_bitmap.constprop.0+0x92>
    44ba:	   |   cmpi.w #-24562,d0
    44be:	   +-- beq.s 44cc <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    44c0:	   |   move.l -60(a5),d2
    44c4:	   |   movea.l -56(a5),a2
    44c8:	   |   unlk a5
    44ca:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    44cc:	   \-> clr.l -(sp)
    44ce:	       clr.l -(sp)
    44d0:	       pea -50(a5)
    44d4:	       pea 4 <_start+0x4>
    44d8:	       pea 58 <_start+0x58>
    44dc:	       jsr f0ff60 <_end+0xe86110>
}
    44e2:	       lea 20(sp),sp
}
    44e6:	       move.l -60(a5),d2
    44ea:	       movea.l -56(a5),a2
    44ee:	       unlk a5
    44f0:	       rts

000044f2 <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    44f2:	                            lea -52(sp),sp
    44f6:	                            movem.l d2-d7/a2-a6,-(sp)
    44fa:	                            movea.l 100(sp),a2
    44fe:	                            movea.l 104(sp),a5
    4502:	                            move.l 108(sp),d0
    4506:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    450a:	                            moveq #0,d2
    450c:	                            move.w d0,d2
    450e:	                            move.l d2,56(sp)
    4512:	                            tst.w d0
    4514:	/-------------------------- beq.s 4584 <DrawLetters.isra.0+0x92>
    4516:	|                           clr.l 44(sp)
    451a:	|                           move.l #563644,60(sp)
    4522:	|                           lea 41488 <zMult>,a4
    4528:	|                           cmpi.w #1,d1
    452c:	|  /----------------------- beq.w 470e <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4530:	|  |  /-------------------> moveq #0,d0
    4532:	|  |  |                     move.w (a5),d0
    4534:	|  |  |                     moveq #0,d3
    4536:	|  |  |                     move.w 2(a5),d3
    453a:	|  |  |                     movea.l d3,a0
    453c:	|  |  |                     move.l d0,d1
    453e:	|  |  |                     add.l d0,d1
    4540:	|  |  |                     add.l d1,d0
    4542:	|  |  |                     add.l d0,d0
    4544:	|  |  |                     adda.l d0,a0
    4546:	|  |  |                     move.l a0,d4
    4548:	|  |  |                     lsl.l #5,d4
    454a:	|  |  |                     movea.l d4,a0
    454c:	|  |  |                     adda.l 60(sp),a0
    4550:	|  |  |                     move.l 16(a0),d0
    4554:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4558:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    455c:	|  |  |                     moveq #1,d2
    455e:	|  |  |                     cmp.l d0,d2
    4560:	|  |  |     /-------------- blt.w 4766 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4564:	|  |  |     |               movea.w d1,a0
    4566:	|  |  |     |               move.l a0,d0
    4568:	|  |  |     |               add.l a0,d0
    456a:	|  |  |     |               add.l a0,d0
    456c:	|  |  |     |               lsl.l #3,d0
    456e:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4570:	|  |  |     |               addq.l #3,a0
    4572:	|  |  |     |               adda.l a0,a0
    4574:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4576:	|  |  |     |               addq.l #1,44(sp)
    457a:	|  |  |     |               move.l 56(sp),d0
    457e:	|  |  |     |               cmp.l 44(sp),d0
    4582:	|  |  +-----|-------------- bne.s 4530 <DrawLetters.isra.0+0x3e>
}
    4584:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    4588:	|  |  |     |               lea 52(sp),sp
    458c:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    458e:	|  |  |     |  /----------> tst.w d1
    4590:	|  |  |  /--|--|----------- ble.w 4906 <DrawLetters.isra.0+0x414>
    4594:	|  |  |  |  |  |            lea 6(a5),a6
    4598:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    459a:	|  |  |  |  |  |            lea 20(a0),a0
    459e:	|  |  |  |  |  |            move.l a0,52(sp)
    45a2:	|  |  |  |  |  |            move.l a5,48(sp)
    45a6:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    45a8:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    45ac:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    45b0:	|  |  |  |  |  |  |         move.l a0,d0
    45b2:	|  |  |  |  |  |  |         subq.l #1,d0
    45b4:	|  |  |  |  |  |  |         add.l d0,d0
    45b6:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    45ba:	|  |  |  |  |  |  |         move.w d0,d1
    45bc:	|  |  |  |  |  |  |         muls.w (a2),d1
    45be:	|  |  |  |  |  |  |         moveq #15,d4
    45c0:	|  |  |  |  |  |  |         asr.l d4,d1
    45c2:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    45c6:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    45ca:	|  |  |  |  |  |  |         asr.l d4,d0
    45cc:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    45d0:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    45d4:	|  |  |  |  |  |  |         subq.l #1,a0
    45d6:	|  |  |  |  |  |  |         adda.l a0,a0
    45d8:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    45dc:	|  |  |  |  |  |  |         move.w d2,d7
    45de:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    45e2:	|  |  |  |  |  |  |         asr.l d4,d7
    45e4:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    45e8:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    45ec:	|  |  |  |  |  |  |         asr.l d4,d2
    45ee:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    45f2:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    45f6:	|  |  |  |  |  |  |         subq.l #1,a0
    45f8:	|  |  |  |  |  |  |         adda.l a0,a0
    45fa:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    45fe:	|  |  |  |  |  |  |         move.w d3,d6
    4600:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    4604:	|  |  |  |  |  |  |         asr.l d4,d6
    4606:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    460a:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    460e:	|  |  |  |  |  |  |         asr.l d4,d3
    4610:	|  |  |  |  |  |  |         movea.w d3,a1
    4612:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4616:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    461a:	|  |  |  |  |  |  |         subq.l #1,a0
    461c:	|  |  |  |  |  |  |         adda.l a0,a0
    461e:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    4622:	|  |  |  |  |  |  |         move.w d3,d5
    4624:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    4628:	|  |  |  |  |  |  |         asr.l d4,d5
    462a:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    462e:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    4632:	|  |  |  |  |  |  |         asr.l d4,d3
    4634:	|  |  |  |  |  |  |         movea.w d3,a0
    4636:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    463a:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    463e:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    4642:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    4646:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    464a:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    464e:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4652:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4656:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    465a:	|  |  |  |  |  |  |         move.w d1,d4
    465c:	|  |  |  |  |  |  |         cmp.w d1,d7
    465e:	|  |  |  |  |  |  |     /-- bge.s 4662 <DrawLetters.isra.0+0x170>
    4660:	|  |  |  |  |  |  |     |   move.w d7,d4
    4662:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4664:	|  |  |  |  |  |  |     /-- bge.s 4668 <DrawLetters.isra.0+0x176>
    4666:	|  |  |  |  |  |  |     |   move.w d6,d4
    4668:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    466a:	|  |  |  |  |  |  |     /-- bge.s 466e <DrawLetters.isra.0+0x17c>
    466c:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    466e:	|  |  |  |  |  |  |     \-> move.w d0,d3
    4670:	|  |  |  |  |  |  |         cmp.w d0,d2
    4672:	|  |  |  |  |  |  |     /-- bge.s 4676 <DrawLetters.isra.0+0x184>
    4674:	|  |  |  |  |  |  |     |   move.w d2,d3
    4676:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    4678:	|  |  |  |  |  |  |     /-- ble.s 467c <DrawLetters.isra.0+0x18a>
    467a:	|  |  |  |  |  |  |     |   move.w a1,d3
    467c:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    467e:	|  |  |  |  |  |  |     /-- ble.s 4682 <DrawLetters.isra.0+0x190>
    4680:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4682:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4686:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    468a:	|  |  |  |  |  |  |         cmp.w d0,d2
    468c:	|  |  |  |  |  |  |     /-- ble.s 4690 <DrawLetters.isra.0+0x19e>
    468e:	|  |  |  |  |  |  |     |   move.w d2,d0
    4690:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    4692:	|  |  |  |  |  |  |     /-- bge.s 4696 <DrawLetters.isra.0+0x1a4>
    4694:	|  |  |  |  |  |  |     |   move.w a1,d0
    4696:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    4698:	|  |  |  |  |  |  |     /-- bge.s 469c <DrawLetters.isra.0+0x1aa>
    469a:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    469c:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    469e:	|  |  |  |  |  |  |         sub.w d3,d0
    46a0:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    46a4:	|  |  |  |  |  |  |         cmpi.w #1,d0
    46a8:	|  |  |  |  |  |  |  /----- ble.s 46e6 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    46aa:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    46ac:	|  |  |  |  |  |  |  |  /-- ble.s 46b0 <DrawLetters.isra.0+0x1be>
    46ae:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    46b0:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    46b2:	|  |  |  |  |  |  |  |  /-- ble.s 46b6 <DrawLetters.isra.0+0x1c4>
    46b4:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    46b6:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    46b8:	|  |  |  |  |  |  |  |  /-- ble.s 46bc <DrawLetters.isra.0+0x1ca>
    46ba:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    46bc:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    46be:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    46c2:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    46c6:	|  |  |  |  |  |  |  +----- ble.s 46e6 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    46c8:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46cc:	|  |  |  |  |  |  |  |      move.w (a0),d0
    46ce:	|  |  |  |  |  |  |  |      neg.w d0
    46d0:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    46d4:	|  |  |  |  |  |  |  |      pea 64(sp)
    46d8:	|  |  |  |  |  |  |  |      jsr 25c2 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    46dc:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46e0:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    46e4:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    46e6:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    46ea:	|  |  |  |  |  |  |         addq.l #1,a3
    46ec:	|  |  |  |  |  |  |         movea.w a5,a0
    46ee:	|  |  |  |  |  |  |         cmpa.l a3,a0
    46f0:	|  |  |  |  |  |  \-------- bgt.w 45a8 <DrawLetters.isra.0+0xb6>
    46f4:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    46f8:	|  |  |  |  |  |            addq.l #3,a0
    46fa:	|  |  |  |  |  |            adda.l a0,a0
    46fc:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    46fe:	|  |  |  |  |  |            addq.l #1,44(sp)
    4702:	|  |  |  |  |  |            move.l 56(sp),d0
    4706:	|  |  |  |  |  |            cmp.l 44(sp),d0
    470a:	+--|--|--|--|--|----------- beq.w 4584 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    470e:	|  >--|--|--|--|----------> moveq #0,d0
    4710:	|  |  |  |  |  |            move.w (a5),d0
    4712:	|  |  |  |  |  |            moveq #0,d1
    4714:	|  |  |  |  |  |            move.w 2(a5),d1
    4718:	|  |  |  |  |  |            movea.l d1,a0
    471a:	|  |  |  |  |  |            move.l d0,d1
    471c:	|  |  |  |  |  |            add.l d0,d1
    471e:	|  |  |  |  |  |            add.l d1,d0
    4720:	|  |  |  |  |  |            add.l d0,d0
    4722:	|  |  |  |  |  |            adda.l d0,a0
    4724:	|  |  |  |  |  |            move.l a0,d2
    4726:	|  |  |  |  |  |            lsl.l #5,d2
    4728:	|  |  |  |  |  |            movea.l d2,a0
    472a:	|  |  |  |  |  |            adda.l 60(sp),a0
    472e:	|  |  |  |  |  |            move.l 16(a0),d0
    4732:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4736:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    473a:	|  |  |  |  |  |            moveq #1,d3
    473c:	|  |  |  |  |  |            cmp.l d0,d3
    473e:	|  |  |  |  |  \----------- blt.w 458e <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    4742:	|  |  |  |  |               movea.w d1,a0
    4744:	|  |  |  |  |               move.l a0,d0
    4746:	|  |  |  |  |               add.l a0,d0
    4748:	|  |  |  |  |               add.l a0,d0
    474a:	|  |  |  |  |               lsl.l #3,d0
    474c:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    474e:	|  |  |  |  |               addq.l #3,a0
    4750:	|  |  |  |  |               adda.l a0,a0
    4752:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4754:	|  |  |  |  |               addq.l #1,44(sp)
    4758:	|  |  |  |  |               move.l 56(sp),d0
    475c:	|  |  |  |  |               cmp.l 44(sp),d0
    4760:	|  +--|--|--|-------------- bne.s 470e <DrawLetters.isra.0+0x21c>
    4762:	+--|--|--|--|-------------- bra.w 4584 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4766:	|  |  |  |  \-------------> tst.w d1
    4768:	|  |  |  |     /----------- ble.w 48ea <DrawLetters.isra.0+0x3f8>
    476c:	|  |  |  |     |            lea 6(a5),a6
    4770:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4772:	|  |  |  |     |            lea 20(a0),a0
    4776:	|  |  |  |     |            move.l a0,52(sp)
    477a:	|  |  |  |     |            move.l a5,48(sp)
    477e:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    4780:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4784:	|  |  |  |     |  |         movea.w 4(a2),a0
    4788:	|  |  |  |     |  |         move.l a0,d0
    478a:	|  |  |  |     |  |         subq.l #1,d0
    478c:	|  |  |  |     |  |         add.l d0,d0
    478e:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    4792:	|  |  |  |     |  |         move.w d2,d7
    4794:	|  |  |  |     |  |         muls.w (a2),d7
    4796:	|  |  |  |     |  |         moveq #15,d3
    4798:	|  |  |  |     |  |         asr.l d3,d7
    479a:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    479e:	|  |  |  |     |  |         muls.w 2(a2),d2
    47a2:	|  |  |  |     |  |         asr.l d3,d2
    47a4:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    47a8:	|  |  |  |     |  |         movea.w 10(a2),a0
    47ac:	|  |  |  |     |  |         move.l a0,d0
    47ae:	|  |  |  |     |  |         subq.l #1,d0
    47b0:	|  |  |  |     |  |         add.l d0,d0
    47b2:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    47b6:	|  |  |  |     |  |         move.w d0,d1
    47b8:	|  |  |  |     |  |         muls.w 6(a2),d1
    47bc:	|  |  |  |     |  |         asr.l d3,d1
    47be:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    47c2:	|  |  |  |     |  |         muls.w 8(a2),d0
    47c6:	|  |  |  |     |  |         asr.l d3,d0
    47c8:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    47cc:	|  |  |  |     |  |         movea.w 16(a2),a0
    47d0:	|  |  |  |     |  |         subq.l #1,a0
    47d2:	|  |  |  |     |  |         adda.l a0,a0
    47d4:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    47d8:	|  |  |  |     |  |         move.w d3,d6
    47da:	|  |  |  |     |  |         muls.w 12(a2),d6
    47de:	|  |  |  |     |  |         moveq #15,d4
    47e0:	|  |  |  |     |  |         asr.l d4,d6
    47e2:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    47e6:	|  |  |  |     |  |         muls.w 14(a2),d3
    47ea:	|  |  |  |     |  |         asr.l d4,d3
    47ec:	|  |  |  |     |  |         movea.w d3,a1
    47ee:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    47f2:	|  |  |  |     |  |         movea.w 22(a2),a0
    47f6:	|  |  |  |     |  |         subq.l #1,a0
    47f8:	|  |  |  |     |  |         adda.l a0,a0
    47fa:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    47fe:	|  |  |  |     |  |         move.w d3,d5
    4800:	|  |  |  |     |  |         muls.w 18(a2),d5
    4804:	|  |  |  |     |  |         asr.l d4,d5
    4806:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    480a:	|  |  |  |     |  |         muls.w 20(a2),d3
    480e:	|  |  |  |     |  |         asr.l d4,d3
    4810:	|  |  |  |     |  |         movea.w d3,a0
    4812:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4816:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    481a:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    481e:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    4822:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4826:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    482a:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    482e:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4832:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4836:	|  |  |  |     |  |         move.w d1,d4
    4838:	|  |  |  |     |  |         cmp.w d1,d7
    483a:	|  |  |  |     |  |     /-- bge.s 483e <DrawLetters.isra.0+0x34c>
    483c:	|  |  |  |     |  |     |   move.w d7,d4
    483e:	|  |  |  |     |  |     \-> cmp.w d4,d6
    4840:	|  |  |  |     |  |     /-- bge.s 4844 <DrawLetters.isra.0+0x352>
    4842:	|  |  |  |     |  |     |   move.w d6,d4
    4844:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4846:	|  |  |  |     |  |     /-- bge.s 484a <DrawLetters.isra.0+0x358>
    4848:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    484a:	|  |  |  |     |  |     \-> move.w d0,d3
    484c:	|  |  |  |     |  |         cmp.w d0,d2
    484e:	|  |  |  |     |  |     /-- bge.s 4852 <DrawLetters.isra.0+0x360>
    4850:	|  |  |  |     |  |     |   move.w d2,d3
    4852:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4854:	|  |  |  |     |  |     /-- ble.s 4858 <DrawLetters.isra.0+0x366>
    4856:	|  |  |  |     |  |     |   move.w a1,d3
    4858:	|  |  |  |     |  |     \-> cmp.w a0,d3
    485a:	|  |  |  |     |  |     /-- ble.s 485e <DrawLetters.isra.0+0x36c>
    485c:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    485e:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4862:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4866:	|  |  |  |     |  |         cmp.w d0,d2
    4868:	|  |  |  |     |  |     /-- ble.s 486c <DrawLetters.isra.0+0x37a>
    486a:	|  |  |  |     |  |     |   move.w d2,d0
    486c:	|  |  |  |     |  |     \-> cmp.w a1,d0
    486e:	|  |  |  |     |  |     /-- bge.s 4872 <DrawLetters.isra.0+0x380>
    4870:	|  |  |  |     |  |     |   move.w a1,d0
    4872:	|  |  |  |     |  |     \-> cmp.w a0,d0
    4874:	|  |  |  |     |  |     /-- bge.s 4878 <DrawLetters.isra.0+0x386>
    4876:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4878:	|  |  |  |     |  |     \-> addq.w #1,d0
    487a:	|  |  |  |     |  |         sub.w d3,d0
    487c:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    4880:	|  |  |  |     |  |         cmpi.w #1,d0
    4884:	|  |  |  |     |  |  /----- ble.s 48be <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4886:	|  |  |  |     |  |  |      cmp.w d1,d7
    4888:	|  |  |  |     |  |  |  /-- ble.s 488c <DrawLetters.isra.0+0x39a>
    488a:	|  |  |  |     |  |  |  |   move.w d7,d1
    488c:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    488e:	|  |  |  |     |  |  |  /-- ble.s 4892 <DrawLetters.isra.0+0x3a0>
    4890:	|  |  |  |     |  |  |  |   move.w d6,d1
    4892:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    4894:	|  |  |  |     |  |  |  /-- ble.s 4898 <DrawLetters.isra.0+0x3a6>
    4896:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    4898:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    489a:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    489e:	|  |  |  |     |  |  |      cmpi.w #1,d1
    48a2:	|  |  |  |     |  |  +----- ble.s 48be <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    48a4:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48a8:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    48ac:	|  |  |  |     |  |  |      pea 64(sp)
    48b0:	|  |  |  |     |  |  |      jsr 25c2 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    48b4:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48b8:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    48bc:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    48be:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    48c2:	|  |  |  |     |  |         addq.l #1,a3
    48c4:	|  |  |  |     |  |         movea.w a5,a0
    48c6:	|  |  |  |     |  |         cmpa.l a0,a3
    48c8:	|  |  |  |     |  \-------- blt.w 4780 <DrawLetters.isra.0+0x28e>
    48cc:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    48d0:	|  |  |  |     |            addq.l #3,a0
    48d2:	|  |  |  |     |            adda.l a0,a0
    48d4:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48d6:	|  |  |  |     |            addq.l #1,44(sp)
    48da:	|  |  |  |     |            move.l 56(sp),d0
    48de:	|  |  |  |     |            cmp.l 44(sp),d0
    48e2:	|  |  +--|-----|----------- bne.w 4530 <DrawLetters.isra.0+0x3e>
    48e6:	+--|--|--|-----|----------- bra.w 4584 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    48ea:	|  |  |  |     \----------> movea.w d1,a0
    48ec:	|  |  |  |                  addq.l #3,a0
    48ee:	|  |  |  |                  adda.l a0,a0
    48f0:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48f2:	|  |  |  |                  addq.l #1,44(sp)
    48f6:	|  |  |  |                  move.l 56(sp),d0
    48fa:	|  |  |  |                  cmp.l 44(sp),d0
    48fe:	|  |  \--|----------------- bne.w 4530 <DrawLetters.isra.0+0x3e>
    4902:	+--|-----|----------------- bra.w 4584 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4906:	|  |     \----------------> movea.w d1,a0
    4908:	|  |                        addq.l #3,a0
    490a:	|  |                        adda.l a0,a0
    490c:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    490e:	|  |                        addq.l #1,44(sp)
    4912:	|  |                        move.l 56(sp),d0
    4916:	|  |                        cmp.l 44(sp),d0
    491a:	|  \----------------------- bne.w 470e <DrawLetters.isra.0+0x21c>
    491e:	\-------------------------- bra.w 4584 <DrawLetters.isra.0+0x92>

00004922 <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    4922:	          movem.l d2-d3/a2,-(sp)
    4926:	          move.l 36(sp),d3
    492a:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    492e:	          moveq #0,d1
    4930:	          move.w 89cd6 <vectorpos>,d1
    4936:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4938:	          moveq #0,d0
    493a:	          move.w 89cd4 <VectorPosLetters>,d0
    4940:	          add.l d0,d0
    4942:	          addi.l #323312,d0
    4948:	          move.l d0,89cd0 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    494e:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    4950:	          tst.l d2
    4952:	          sne d0
    4954:	          ext.w d0
    4956:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4958:	          neg.l d0
    495a:	          move.l d0,-(sp)
    495c:	          addi.l #374546,d1
    4962:	          move.l d1,-(sp)
    4964:	          jsr 34ea <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    4968:	          clr.l -(sp)
    496a:	          move.l d3,-(sp)
    496c:	          move.l 40(sp),-(sp)
    4970:	          move.l 89cd0 <ptrvectorletters>,-(sp)
    4976:	          lea 44f2 <DrawLetters.isra.0>(pc),a2
    497a:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    497c:	          lea 28(sp),sp
    4980:	          tst.l d2
    4982:	   /----- bne.w 4a1c <DrawDices+0xfa>
  CubeNrReversePos++;
    4986:	/--|----> addq.w #1,44858 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    498c:	|  |      move.w d3,d2
    498e:	|  |      add.w d3,d2
    4990:	|  |      add.w d3,d2
    4992:	|  |      lsl.w #3,d2
    4994:	|  |      add.w 89cd6 <vectorpos>,d2
    499a:	|  |      move.w d2,89cd6 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    49a0:	|  |      move.w 30(sp),d0
    49a4:	|  |      add.w d0,d0
    49a6:	|  |      add.w 30(sp),d0
    49aa:	|  |      add.w d0,d0
    49ac:	|  |      add.w d0,d0
    49ae:	|  |      add.w d0,89cd4 <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    49b4:	|  |      move.w 34(sp),d0
    49b8:	|  |      add.w d0,d0
    49ba:	|  |      add.w 34(sp),d0
    49be:	|  |      add.w d0,d0
    49c0:	|  |      add.w d0,d0
    49c2:	|  |      add.w d0,89cc6 <VectorPosLettersReversed>
  SetCl( clminendpos);
    49c8:	|  |      move.l 44(sp),-(sp)
    49cc:	|  |      jsr 159c <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    49d0:	|  |      andi.l #65535,d2
    49d6:	|  |      move.l 52(sp),-(sp)
    49da:	|  |      move.l d3,-(sp)
    49dc:	|  |      jsr 5a50 <__mulsi3>
    49e2:	|  |      move.l d0,d1
    49e4:	|  |      add.l d1,d1
    49e6:	|  |      add.l d0,d1
    49e8:	|  |      lsl.l #3,d1
    49ea:	|  |      lea 12(sp),sp
    49ee:	|  |      cmp.l d2,d1
    49f0:	|  |  /-- bgt.s 4a14 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    49f2:	|  |  |   move.w #1,44858 <CubeNrReversePos>
    vectorpos = 0;
    49fa:	|  |  |   clr.w 89cd6 <vectorpos>
    VectorPosLetters = 0;
    4a00:	|  |  |   clr.w 89cd4 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4a06:	|  |  |   clr.w 89cc6 <VectorPosLettersReversed>
    return 1;
    4a0c:	|  |  |   moveq #1,d0
}
    4a0e:	|  |  |   movem.l (sp)+,d2-d3/a2
    4a12:	|  |  |   rts
    return 0;  
    4a14:	|  |  \-> clr.w d0
}
    4a16:	|  |      movem.l (sp)+,d2-d3/a2
    4a1a:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4a1c:	|  \----> moveq #0,d0
    4a1e:	|         move.w 44858 <CubeNrReversePos>,d0
    4a24:	|         add.l d0,d0
    4a26:	|         add.l 16(sp),d0
    4a2a:	|         move.l d0,89cc8 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a30:	|         pea 1 <_start+0x1>
    4a34:	|         move.l d2,-(sp)
    4a36:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4a3a:	|         moveq #0,d0
    4a3c:	|         move.w 89cc6 <VectorPosLettersReversed>,d0
    4a42:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a44:	|         addi.l #283376,d0
    4a4a:	|         move.l d0,-(sp)
    4a4c:	|         jsr (a2)
    4a4e:	|         lea 16(sp),sp
    4a52:	\-------- bra.w 4986 <DrawDices+0x64>

00004a56 <End_PrepareDisplay.isra.0>:

int End_PrepareDisplay() {
    4a56:	          movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4a5a:	          movea.l 89e4c <SysBase>,a6
    4a60:	          move.l #1360,d0
    4a66:	          moveq #2,d1
    4a68:	          jsr -198(a6)
    4a6c:	          movea.l d0,a2
  if( retval == 0) {
    4a6e:	          tst.l d0
    4a70:	   /----- beq.w 4c8a <End_PrepareDisplay.isra.0+0x234>
    *cl++ = *clpartinstruction++;
    4a74:	/--|----> move.l 44738 <End_ClsSprites>,(a2)
    4a7a:	|  |      move.l 4473c <End_ClsSprites+0x4>,4(a2)
    4a82:	|  |      move.l 44740 <End_ClsSprites+0x8>,8(a2)
    4a8a:	|  |      move.l 44744 <End_ClsSprites+0xc>,12(a2)
    4a92:	|  |      move.l 44748 <End_ClsSprites+0x10>,16(a2)
    4a9a:	|  |      move.l 4474c <End_ClsSprites+0x14>,20(a2)
    4aa2:	|  |      move.l 44750 <End_ClsSprites+0x18>,24(a2)
    4aaa:	|  |      move.l 44754 <End_ClsSprites+0x1c>,28(a2)
    4ab2:	|  |      move.l 44758 <End_ClsSprites+0x20>,32(a2)
    4aba:	|  |      move.l 4475c <End_ClsSprites+0x24>,36(a2)
    4ac2:	|  |      move.l 44760 <End_ClsSprites+0x28>,40(a2)
    4aca:	|  |      move.l 44764 <End_ClsSprites+0x2c>,44(a2)
    4ad2:	|  |      move.l 44768 <End_ClsSprites+0x30>,48(a2)
    4ada:	|  |      move.l 4476c <End_ClsSprites+0x34>,52(a2)
    4ae2:	|  |      move.l 44770 <End_ClsSprites+0x38>,56(a2)
    4aea:	|  |      move.l 44774 <End_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    4af2:	|  |      move.l 44708 <End_ClScreen>,64(a2)
    4afa:	|  |      move.l 4470c <End_ClScreen+0x4>,68(a2)
    4b02:	|  |      move.l 44710 <End_ClScreen+0x8>,72(a2)
    4b0a:	|  |      move.l 44714 <End_ClScreen+0xc>,76(a2)
    4b12:	|  |      move.l 44718 <End_ClScreen+0x10>,80(a2)
    4b1a:	|  |      move.l 4471c <End_ClScreen+0x14>,84(a2)
    4b22:	|  |      move.l 44720 <End_ClScreen+0x18>,88(a2)
    4b2a:	|  |      move.l 44724 <End_ClScreen+0x1c>,92(a2)
    4b32:	|  |      move.l 44728 <End_ClScreen+0x20>,96(a2)
    4b3a:	|  |      move.l 4472c <End_ClScreen+0x24>,100(a2)
    4b42:	|  |      move.l 44730 <End_ClScreen+0x28>,104(a2)
    4b4a:	|  |      move.l 44734 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    4b52:	|  |      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    4b58:	|  |      move.l #512434,d0
    4b5e:	|  |      clr.w d0
    4b60:	|  |      swap d0
    4b62:	|  |      move.w d0,114(a2)
  *cw++ = 0x00e2;
    4b66:	|  |      move.w #226,116(a2)
  *cw++ = bpl1pointerlow;
    4b6c:	|  |      move.l #512434,d0
    4b72:	|  |      move.w d0,118(a2)
  *cw++ = 0x00e4;
    4b76:	|  |      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    4b7c:	|  |      move.l #522674,d0
    4b82:	|  |      clr.w d0
    4b84:	|  |      swap d0
    4b86:	|  |      move.w d0,122(a2)
  *cw++ = 0x00e6;
    4b8a:	|  |      move.w #230,124(a2)
  *cw++ = bpl2pointerlow;
    4b90:	|  |      move.l #522674,d0
    4b96:	|  |      move.w d0,126(a2)
  *cw++ = 0x00e8;
    4b9a:	|  |      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    4ba0:	|  |      move.l #532914,d0
    4ba6:	|  |      clr.w d0
    4ba8:	|  |      swap d0
    4baa:	|  |      move.w d0,130(a2)
  *cw++ = 0x00ea;
    4bae:	|  |      move.w #234,132(a2)
  *cw++ = bpl3pointerlow;  
    4bb4:	|  |      move.l #532914,d0
    4bba:	|  |      move.w d0,134(a2)
  *cw++ = 0x00ec;
    4bbe:	|  |      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    4bc4:	|  |      move.l #543154,d0
    4bca:	|  |      clr.w d0
    4bcc:	|  |      swap d0
    4bce:	|  |      move.w d0,138(a2)
  *cw++ = 0x00ee;
    4bd2:	|  |      move.w #238,140(a2)
  *cw++ = bpl4pointerlow;  
    4bd8:	|  |      move.l #543154,d0
    4bde:	|  |      move.w d0,142(a2)
  *cw++ = 0x00f0;
    4be2:	|  |      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    4be8:	|  |      move.l #553394,d0
    4bee:	|  |      clr.w d0
    4bf0:	|  |      swap d0
    4bf2:	|  |      move.w d0,146(a2)
  *cw++ = 0x00f2;
    4bf6:	|  |      move.w #242,148(a2)
  *cw++ = bpl5pointerlow;  
    4bfc:	|  |      move.l #553394,d0
    4c02:	|  |      move.w d0,150(a2)
    *cl++ = *clpartinstruction++;
    4c06:	|  |      pea 80 <main+0x1a>
    4c0a:	|  |      pea d0ce <incbin_End_ClColor_start>
    4c10:	|  |      pea 152(a2)
    4c14:	|  |      jsr 59e6 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    4c18:	|  |      move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    4c20:	|  |      move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    4c28:	|  |      moveq #-2,d0
    4c2a:	|  |      move.l d0,288(a2)

  End_DrawCopper = End_ClBuild( );  
    4c2e:	|  |      move.l a2,899b4 <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    4c34:	|  |      movea.l 89e4c <SysBase>,a6
    4c3a:	|  |      moveq #22,d0
    4c3c:	|  |      move.l #65537,d1
    4c42:	|  |      jsr -198(a6)
    4c46:	|  |      movea.l d0,a1
    4c48:	|  |      lea 12(sp),sp
    4c4c:	|  |      tst.l d0
    4c4e:	|  |  /-- beq.s 4c6a <End_PrepareDisplay.isra.0+0x214>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4c50:	|  |  |   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    4c56:	|  |  |   move.l #246950,10(a1)
    End_Vbint->is_Data = NULL;
    4c5e:	|  |  |   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    4c62:	|  |  |   move.l #5518,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    4c6a:	|  |  \-> movea.l 89e4c <SysBase>,a6
    4c70:	|  |      moveq #4,d0
    4c72:	|  |      jsr -168(a6)
void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    4c76:	|  |      movea.l 89e48 <custom>,a0
    4c7c:	|  |      move.l 899b4 <End_DrawCopper>,128(a0)
}
    4c84:	|  |      movem.l (sp)+,d2-d3/a2/a6
    4c88:	|  |      rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    4c8a:	|  \----> movea.l 89e40 <DOSBase>,a6
    4c90:	|         jsr -60(a6)
    4c94:	|         movea.l 89e40 <DOSBase>,a6
    4c9a:	|         move.l d0,d1
    4c9c:	|         move.l #246841,d2
    4ca2:	|         moveq #40,d3
    4ca4:	|         jsr -48(a6)
    Exit(1);
    4ca8:	|         movea.l 89e40 <DOSBase>,a6
    4cae:	|         moveq #1,d1
    4cb0:	|         jsr -144(a6)
    4cb4:	\-------- bra.w 4a74 <End_PrepareDisplay.isra.0+0x1e>

00004cb8 <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    4cb8:	                         link.w a5,#-52
    4cbc:	                         movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    4cc0:	                         clr.w 89e3e <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    4cc6:	                         clr.l -42(a5)
    4cca:	                         clr.l -38(a5)
    4cce:	                         clr.l -34(a5)
    4cd2:	                         clr.l -30(a5)
    4cd6:	                         clr.l -26(a5)
    4cda:	                         clr.l -22(a5)
    4cde:	                         clr.l -18(a5)
    4ce2:	                         clr.l -14(a5)
    4ce6:	                         clr.l -10(a5)
    4cea:	                         clr.l -6(a5)
    4cee:	                         clr.w -2(a5)
    4cf2:	                         move.l #280324,-50(a5)
    4cfa:	                         moveq #4,d0
    4cfc:	                         move.l d0,-46(a5)
    4d00:	                         move.w #1,-10(a5)
    4d06:	                         move.w #2,-6(a5)
	while(*source && --num > 0)
    4d0c:	                         moveq #100,d0
	struct debug_resource resource = {
    4d0e:	                         lea -42(a5),a0
    4d12:	                         lea 3c4b4 <incbin_MercuryLetterData2Lz4_end+0x7c>,a1
	while(*source && --num > 0)
    4d18:	                         lea -11(a5),a2
		*destination++ = *source++;
    4d1c:	                  /----> addq.l #1,a1
    4d1e:	                  |      move.b d0,(a0)+
	while(*source && --num > 0)
    4d20:	                  |      move.b (a1),d0
    4d22:	                  |  /-- beq.s 4d28 <Sw_PrepareDisplay.isra.0+0x70>
    4d24:	                  |  |   cmpa.l a0,a2
    4d26:	                  \--|-- bne.s 4d1c <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    4d28:	                     \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    4d2a:	                         move.w f0ff60 <_end+0xe86110>,d0
    4d30:	                         cmpi.w #20153,d0
    4d34:	                  /----- beq.w 4edc <Sw_PrepareDisplay.isra.0+0x224>
    4d38:	                  |      cmpi.w #-24562,d0
    4d3c:	                  +----- beq.w 4edc <Sw_PrepareDisplay.isra.0+0x224>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4d40:	                  |      movea.l 89e4c <SysBase>,a6
    4d46:	                  |      move.l #4000,d0
    4d4c:	                  |      moveq #2,d1
    4d4e:	                  |      jsr -198(a6)
    4d52:	                  |      move.l d0,89d3a <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4d58:	                  |      pea 1 <_start+0x1>
    4d5c:	                  |      pea 32 <_start+0x32>
    4d60:	                  |      pea 3c4be <incbin_MercuryLetterData2Lz4_end+0x86>
    4d66:	                  |      move.l d0,-(sp)
    4d68:	                  |      lea 443a <debug_register_bitmap.constprop.0>(pc),a3
    4d6c:	                  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4d6e:	                  |      pea 14 <_start+0x14>
    4d72:	                  |      pea 32 <_start+0x32>
    4d76:	                  |      move.l 89d3a <Sw_FontBuffer>,-(sp)
    4d7c:	                  |      lea c68 <Utils_FillLong.constprop.0>(pc),a2
    4d80:	                  |      jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4d82:	                  |      movea.l 89e4c <SysBase>,a6
    4d88:	                  |      move.l #20560,d0
    4d8e:	                  |      moveq #2,d1
    4d90:	                  |      jsr -198(a6)
    4d94:	                  |      move.l d0,89d3e <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4d9a:	                  |      lea 28(sp),sp
    4d9e:	      /-----------|----- beq.w 5006 <Sw_PrepareDisplay.isra.0+0x34e>
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    4da2:	      |        /--|----> pea 1 <_start+0x1>
    4da6:	      |        |  |      pea 101 <main+0x9b>
    4daa:	      |        |  |      pea 3c4f4 <incbin_MercuryLetterData2Lz4_end+0xbc>
    4db0:	      |        |  |      move.l d0,-(sp)
    4db2:	      |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    4db4:	      |        |  |      pea 14 <_start+0x14>
    4db8:	      |        |  |      pea 100 <main+0x9a>
    4dbc:	      |        |  |      move.l 89d3e <Sw_ScreenBuffer3>,-(sp)
    4dc2:	      |        |  |      jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4dc4:	      |        |  |      movea.l 89e4c <SysBase>,a6
    4dca:	      |        |  |      move.l #20560,d0
    4dd0:	      |        |  |      moveq #2,d1
    4dd2:	      |        |  |      jsr -198(a6)
    4dd6:	      |        |  |      move.l d0,89d42 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4ddc:	      |        |  |      lea 28(sp),sp
    4de0:	/-----|--------|--|----- beq.w 4f90 <Sw_PrepareDisplay.isra.0+0x2d8>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4de4:	|  /--|--------|--|----> pea 1 <_start+0x1>
    4de8:	|  |  |        |  |      pea 101 <main+0x9b>
    4dec:	|  |  |        |  |      pea 3c52d <incbin_MercuryLetterData2Lz4_end+0xf5>
    4df2:	|  |  |        |  |      move.l d0,-(sp)
    4df4:	|  |  |        |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4df6:	|  |  |        |  |      pea 14 <_start+0x14>
    4dfa:	|  |  |        |  |      pea 100 <main+0x9a>
    4dfe:	|  |  |        |  |      move.l 89d42 <Sw_ScreenBuffer2>,-(sp)
    4e04:	|  |  |        |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4e06:	|  |  |        |  |      movea.l 89e4c <SysBase>,a6
    4e0c:	|  |  |        |  |      move.l #20560,d0
    4e12:	|  |  |        |  |      moveq #2,d1
    4e14:	|  |  |        |  |      jsr -198(a6)
    4e18:	|  |  |        |  |      move.l d0,89d46 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4e1e:	|  |  |        |  |      lea 28(sp),sp
    4e22:	|  |  |  /-----|--|----- beq.w 4f5c <Sw_PrepareDisplay.isra.0+0x2a4>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4e26:	|  |  |  |  /--|--|----> pea 1 <_start+0x1>
    4e2a:	|  |  |  |  |  |  |      pea 101 <main+0x9b>
    4e2e:	|  |  |  |  |  |  |      pea 3c53f <incbin_MercuryLetterData2Lz4_end+0x107>
    4e34:	|  |  |  |  |  |  |      move.l d0,-(sp)
    4e36:	|  |  |  |  |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    4e38:	|  |  |  |  |  |  |      pea 14 <_start+0x14>
    4e3c:	|  |  |  |  |  |  |      pea 100 <main+0x9a>
    4e40:	|  |  |  |  |  |  |      move.l 89d46 <Sw_ScreenBuffer1>,-(sp)
    4e46:	|  |  |  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
    4e48:	|  |  |  |  |  |  |      lea 10f2 <Sw_ClBuild>(pc),a2
    4e4c:	|  |  |  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ClBuild( );
    4e4e:	|  |  |  |  |  |  |      jsr (a2)
    4e50:	|  |  |  |  |  |  |      move.l d0,89cdc <Sw_DrawCopper>
void Sw_SwapCl() {

  /*ULONG tmp = (ULONG) Sw_DrawCopper;
  Sw_DrawCopper = Sw_ViewCopper;
  Sw_ViewCopper = (UWORD *)tmp;*/
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    4e56:	|  |  |  |  |  |  |      movea.l 89e48 <custom>,a0
    4e5c:	|  |  |  |  |  |  |      move.l d0,128(a0)
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    4e60:	|  |  |  |  |  |  |      movea.l 89e4c <SysBase>,a6
    4e66:	|  |  |  |  |  |  |      moveq #22,d0
    4e68:	|  |  |  |  |  |  |      move.l #65537,d1
    4e6e:	|  |  |  |  |  |  |      jsr -198(a6)
    4e72:	|  |  |  |  |  |  |      movea.l d0,a1
    4e74:	|  |  |  |  |  |  |      move.l d0,89d36 <Sw_Vbint>
    4e7a:	|  |  |  |  |  |  |      lea 28(sp),sp
    4e7e:	|  |  |  |  |  |  |  /-- beq.s 4e9a <Sw_PrepareDisplay.isra.0+0x1e2>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4e80:	|  |  |  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    4e86:	|  |  |  |  |  |  |  |   move.l #246950,10(a1)
    Sw_Vbint->is_Data = NULL;
    4e8e:	|  |  |  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    4e92:	|  |  |  |  |  |  |  |   move.l #5388,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    4e9a:	|  |  |  |  |  |  |  \-> movea.l 89e4c <SysBase>,a6
    4ea0:	|  |  |  |  |  |  |      moveq #4,d0
    4ea2:	|  |  |  |  |  |  |      jsr -168(a6)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    4ea6:	|  |  |  |  |  |  |      move.l 89d46 <Sw_ScreenBuffer1>,d0
    4eac:	|  |  |  |  |  |  |      move.l d0,89ce0 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    4eb2:	|  |  |  |  |  |  |      move.l 89d42 <Sw_ScreenBuffer2>,d1
    4eb8:	|  |  |  |  |  |  |      move.l d1,89ce4 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    4ebe:	|  |  |  |  |  |  |      move.l d1,89ce8 <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    4ec4:	|  |  |  |  |  |  |      move.l d0,89cec <Sw_ScreenBufferList+0xc>
  Sw_InitComplete = 1;
    4eca:	|  |  |  |  |  |  |      move.w #1,89d1e <Sw_InitComplete>
}
    4ed2:	|  |  |  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    4ed8:	|  |  |  |  |  |  |      unlk a5
    4eda:	|  |  |  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    4edc:	|  |  |  |  |  |  \----> clr.l -(sp)
    4ede:	|  |  |  |  |  |         clr.l -(sp)
    4ee0:	|  |  |  |  |  |         pea -50(a5)
    4ee4:	|  |  |  |  |  |         pea 4 <_start+0x4>
    4ee8:	|  |  |  |  |  |         pea 58 <_start+0x58>
    4eec:	|  |  |  |  |  |         jsr f0ff60 <_end+0xe86110>
}
    4ef2:	|  |  |  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4ef6:	|  |  |  |  |  |         movea.l 89e4c <SysBase>,a6
    4efc:	|  |  |  |  |  |         move.l #4000,d0
    4f02:	|  |  |  |  |  |         moveq #2,d1
    4f04:	|  |  |  |  |  |         jsr -198(a6)
    4f08:	|  |  |  |  |  |         move.l d0,89d3a <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4f0e:	|  |  |  |  |  |         pea 1 <_start+0x1>
    4f12:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f16:	|  |  |  |  |  |         pea 3c4be <incbin_MercuryLetterData2Lz4_end+0x86>
    4f1c:	|  |  |  |  |  |         move.l d0,-(sp)
    4f1e:	|  |  |  |  |  |         lea 443a <debug_register_bitmap.constprop.0>(pc),a3
    4f22:	|  |  |  |  |  |         jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4f24:	|  |  |  |  |  |         pea 14 <_start+0x14>
    4f28:	|  |  |  |  |  |         pea 32 <_start+0x32>
    4f2c:	|  |  |  |  |  |         move.l 89d3a <Sw_FontBuffer>,-(sp)
    4f32:	|  |  |  |  |  |         lea c68 <Utils_FillLong.constprop.0>(pc),a2
    4f36:	|  |  |  |  |  |         jsr (a2)
  Sw_ScreenBuffer3 = AllocMem( BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4f38:	|  |  |  |  |  |         movea.l 89e4c <SysBase>,a6
    4f3e:	|  |  |  |  |  |         move.l #20560,d0
    4f44:	|  |  |  |  |  |         moveq #2,d1
    4f46:	|  |  |  |  |  |         jsr -198(a6)
    4f4a:	|  |  |  |  |  |         move.l d0,89d3e <Sw_ScreenBuffer3>
  if(Sw_ScreenBuffer3 == 0) {
    4f50:	|  |  |  |  |  |         lea 28(sp),sp
    4f54:	|  |  |  |  |  \-------- bne.w 4da2 <Sw_PrepareDisplay.isra.0+0xea>
    4f58:	|  |  +--|--|----------- bra.w 5006 <Sw_PrepareDisplay.isra.0+0x34e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f5c:	|  |  |  >--|----------> movea.l 89e40 <DOSBase>,a6
    4f62:	|  |  |  |  |            jsr -60(a6)
    4f66:	|  |  |  |  |            movea.l 89e40 <DOSBase>,a6
    4f6c:	|  |  |  |  |            move.l d0,d1
    4f6e:	|  |  |  |  |            move.l #247046,d2
    4f74:	|  |  |  |  |            moveq #38,d3
    4f76:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4f7a:	|  |  |  |  |            movea.l 89e40 <DOSBase>,a6
    4f80:	|  |  |  |  |            moveq #1,d1
    4f82:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4f86:	|  |  |  |  |            move.l 89d46 <Sw_ScreenBuffer1>,d0
    4f8c:	|  |  |  |  +----------- bra.w 4e26 <Sw_PrepareDisplay.isra.0+0x16e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f90:	>--|--|--|--|----------> movea.l 89e40 <DOSBase>,a6
    4f96:	|  |  |  |  |            jsr -60(a6)
    4f9a:	|  |  |  |  |            movea.l 89e40 <DOSBase>,a6
    4fa0:	|  |  |  |  |            move.l d0,d1
    4fa2:	|  |  |  |  |            move.l #247046,d2
    4fa8:	|  |  |  |  |            moveq #38,d3
    4faa:	|  |  |  |  |            jsr -48(a6)
    Exit(1);
    4fae:	|  |  |  |  |            movea.l 89e40 <DOSBase>,a6
    4fb4:	|  |  |  |  |            moveq #1,d1
    4fb6:	|  |  |  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4fba:	|  |  |  |  |            move.l 89d42 <Sw_ScreenBuffer2>,d0
    4fc0:	|  |  |  |  |            pea 1 <_start+0x1>
    4fc4:	|  |  |  |  |            pea 101 <main+0x9b>
    4fc8:	|  |  |  |  |            pea 3c52d <incbin_MercuryLetterData2Lz4_end+0xf5>
    4fce:	|  |  |  |  |            move.l d0,-(sp)
    4fd0:	|  |  |  |  |            jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4fd2:	|  |  |  |  |            pea 14 <_start+0x14>
    4fd6:	|  |  |  |  |            pea 100 <main+0x9a>
    4fda:	|  |  |  |  |            move.l 89d42 <Sw_ScreenBuffer2>,-(sp)
    4fe0:	|  |  |  |  |            jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4fe2:	|  |  |  |  |            movea.l 89e4c <SysBase>,a6
    4fe8:	|  |  |  |  |            move.l #20560,d0
    4fee:	|  |  |  |  |            moveq #2,d1
    4ff0:	|  |  |  |  |            jsr -198(a6)
    4ff4:	|  |  |  |  |            move.l d0,89d46 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4ffa:	|  |  |  |  |            lea 28(sp),sp
    4ffe:	|  |  |  |  \----------- bne.w 4e26 <Sw_PrepareDisplay.isra.0+0x16e>
    5002:	|  |  |  \-------------- bra.w 4f5c <Sw_PrepareDisplay.isra.0+0x2a4>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    5006:	|  |  \----------------> movea.l 89e40 <DOSBase>,a6
    500c:	|  |                     jsr -60(a6)
    5010:	|  |                     movea.l 89e40 <DOSBase>,a6
    5016:	|  |                     move.l d0,d1
    5018:	|  |                     move.l #246989,d2
    501e:	|  |                     moveq #38,d3
    5020:	|  |                     jsr -48(a6)
    Exit(1);
    5024:	|  |                     movea.l 89e40 <DOSBase>,a6
    502a:	|  |                     moveq #1,d1
    502c:	|  |                     jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer3, "screenbuffer3.bpl", 512, 257, 1, 0);
    5030:	|  |                     move.l 89d3e <Sw_ScreenBuffer3>,d0
    5036:	|  |                     pea 1 <_start+0x1>
    503a:	|  |                     pea 101 <main+0x9b>
    503e:	|  |                     pea 3c4f4 <incbin_MercuryLetterData2Lz4_end+0xbc>
    5044:	|  |                     move.l d0,-(sp)
    5046:	|  |                     jsr (a3)
  Utils_FillLong( (ULONG *)Sw_ScreenBuffer3, 0, 256, 20,0);   
    5048:	|  |                     pea 14 <_start+0x14>
    504c:	|  |                     pea 100 <main+0x9a>
    5050:	|  |                     move.l 89d3e <Sw_ScreenBuffer3>,-(sp)
    5056:	|  |                     jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5058:	|  |                     movea.l 89e4c <SysBase>,a6
    505e:	|  |                     move.l #20560,d0
    5064:	|  |                     moveq #2,d1
    5066:	|  |                     jsr -198(a6)
    506a:	|  |                     move.l d0,89d42 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    5070:	|  |                     lea 28(sp),sp
    5074:	|  \-------------------- bne.w 4de4 <Sw_PrepareDisplay.isra.0+0x12c>
    5078:	\----------------------- bra.w 4f90 <Sw_PrepareDisplay.isra.0+0x2d8>

0000507c <DrawScreen>:
{    
    507c:	                   lea -44(sp),sp
    5080:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    5084:	                   movea.l 89e44 <GfxBase>,a6
    508a:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    508e:	                   move.w #-1,dff044 <_end+0xd751f4>
  custom->bltalwm = 0xffff; //Static
    5096:	                   move.w #-1,dff046 <_end+0xd751f6>
  switch(Scene) {
    509e:	                   cmpi.w #18,655da <Scene>
    50a6:	         /-------- bhi.s 511a <DrawScreen+0x9e>
    50a8:	         |         moveq #0,d0
    50aa:	         |         move.w 655da <Scene>,d0
    50b0:	         |         add.l d0,d0
    50b2:	         |         move.w (50ba <DrawScreen+0x3e>,pc,d0.l),d0
    50b6:	         |         jmp (50ba <DrawScreen+0x3e>,pc,d0.w)
    50ba:	         |         ori.w #124,-(a0)
    50be:	         |         ([,0)andi.b #-58,([0,a6],d0.w:2,0)
    50c4:	         |         ([,1104)bchg d1,([1046,d0.w:2],1104)
    50cc:	         |         .short 0x04e0
    50ce:	         |         btst d2,(a6)+
    50d0:	         |         movep.w d2,1476(a2)
    50d4:	         |         ori.b #84,-(a6)
    50d8:	         |         ori.l #113248044,6a <main+0x4>
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    50e0:	         |         pea d0 <main+0x6a>
    50e4:	         |         pea 1 <_start+0x1>
    50e8:	         |         pea 2 <_start+0x2>
    50ec:	         |         pea 3 <_start+0x3>
    50f0:	         |         pea 6 <_start+0x6>
    50f4:	         |         pea 9 <_start+0x9>
    50f8:	         |         pea 448ba <LetterMetaDataReversedAbyss>
    50fe:	         |         pea 448d2 <LetterMetaDataAbyss>
    5104:	         |         pea 448f6 <CubeNrReverseSizeAbyss>
    510a:	         |         jsr 4922 <DrawDices>(pc)
      break;  
    510e:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    5112:	         |         cmpi.w #1,d0
    5116:	         |  /----- beq.w 52e0 <DrawScreen+0x264>
}
    511a:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    511e:	         |  |      lea 44(sp),sp
    5122:	         |  |      rts
      CubeFinished = 1;
    5124:	         |  |      move.w #1,89e3a <CubeFinished>
}
    512c:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    5130:	         |  |      lea 44(sp),sp
    5134:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    5136:	         |  |      pea c3 <main+0x5d>
    513a:	         |  |      pea 1 <_start+0x1>
    513e:	         |  |      pea 3 <_start+0x3>
    5142:	         |  |      pea 3 <_start+0x3>
    5146:	         |  |      pea 8 <_start+0x8>
    514a:	         |  |      pea a <_start+0xa>
    514e:	         |  |      pea 653f0 <LetterMetaDataReversedSpread>
    5154:	         |  |      pea 65412 <LetterMetaDataSpread1>
    515a:	         |  |      pea 65438 <CubeNrReverseSizeSpread>
    5160:	         |  |      jsr 4922 <DrawDices>(pc)
      break;
    5164:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    5168:	         |  |      cmpi.w #1,d0
    516c:	         +--|----- bne.s 511a <DrawScreen+0x9e>
    516e:	         |  +----- bra.w 52e0 <DrawScreen+0x264>
  ptrvector = VectorBuffer +  vectorpos;    
    5172:	         |  |      moveq #0,d0
    5174:	         |  |      move.w 89cd6 <vectorpos>,d0
    517a:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    517c:	         |  |      moveq #0,d1
    517e:	         |  |      move.w 89cd4 <VectorPosLetters>,d1
    5184:	         |  |      add.l d1,d1
    5186:	         |  |      addi.l #323312,d1
    518c:	         |  |      move.l d1,89cd0 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    5192:	         |  |      pea 4 <_start+0x4>
    5196:	         |  |      clr.l -(sp)
    5198:	         |  |      addi.l #374546,d0
    519e:	         |  |      move.l d0,-(sp)
    51a0:	         |  |      jsr 34ea <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    51a4:	         |  |      movea.l 89cd0 <ptrvectorletters>,a2
    51aa:	         |  |      lea 12(sp),sp
    51ae:	         |  |      moveq #4,d0
    51b0:	         |  |      move.l d0,44(sp)
    51b4:	         |  |      lea 44888 <LetterMetaDataMercury1>,a5
    51ba:	         |  |      lea 41488 <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    51c0:	/--------|--|----> moveq #0,d0
    51c2:	|        |  |      move.w (a5),d0
    51c4:	|        |  |      moveq #0,d1
    51c6:	|        |  |      move.w 2(a5),d1
    51ca:	|        |  |      movea.l d1,a0
    51cc:	|        |  |      move.l d0,d1
    51ce:	|        |  |      add.l d0,d1
    51d0:	|        |  |      add.l d1,d0
    51d2:	|        |  |      add.l d0,d0
    51d4:	|        |  |      adda.l d0,a0
    51d6:	|        |  |      move.l a0,d2
    51d8:	|        |  |      lsl.l #5,d2
    51da:	|        |  |      movea.l d2,a0
    51dc:	|        |  |      adda.l #563644,a0
    51e2:	|        |  |      move.l 16(a0),d0
    51e6:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    51ea:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    51ee:	|        |  |      moveq #1,d3
    51f0:	|        |  |      cmp.l d0,d3
    51f2:	|        |  |  /-- blt.w 5820 <DrawScreen+0x7a4>
      vectors += 12*metadata[2];
    51f6:	|        |  |  |   movea.w d1,a0
    51f8:	|        |  |  |   move.l a0,d0
    51fa:	|        |  |  |   add.l a0,d0
    51fc:	|        |  |  |   add.l a0,d0
    51fe:	|        |  |  |   lsl.l #3,d0
    5200:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    5202:	|        |  |  |   addq.l #3,a0
    5204:	|        |  |  |   adda.l a0,a0
    5206:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    5208:	|        |  |  |   subq.l #1,44(sp)
    520c:	+--------|--|--|-- bne.s 51c0 <DrawScreen+0x144>
  CubeNrReversePos++;
    520e:	|  /-----|--|--|-> addq.w #1,44858 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    5214:	|  |     |  |  |   move.w 89cd6 <vectorpos>,d2
    521a:	|  |     |  |  |   addi.w #96,d2
    521e:	|  |     |  |  |   move.w d2,89cd6 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    5224:	|  |     |  |  |   addi.w #156,89cd4 <VectorPosLetters>
  SetCl( clminendpos);
    522c:	|  |     |  |  |   pea 1 <_start+0x1>
    5230:	|  |     |  |  |   jsr 159c <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    5234:	|  |     |  |  |   addq.l #4,sp
    5236:	|  |     |  |  |   cmpi.w #12767,d2
    523a:	|  |     +--|--|-- bls.w 511a <DrawScreen+0x9e>
    DoNotClearDirty = 1;
    523e:	|  |     |  |  |   move.w #1,89cc4 <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    5246:	|  |     |  |  |   cmpi.w #12959,d2
    524a:	|  |     +--|--|-- bls.w 511a <DrawScreen+0x9e>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    524e:	|  |     |  |  |   movea.l 89cc0 <ClearBuffer>,a2
    5254:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    5258:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    525c:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    5260:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    5264:	|  |     |  |  |   movea.l 89ccc <DrawBuffer>,a1
    526a:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    526e:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    5272:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    5276:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    527a:	|  |     |  |  |   movea.l 89cbc <ViewBuffer>,a0
    5280:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    5284:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    5288:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    528c:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    5290:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    5294:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    5298:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    529c:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    52a0:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    52a4:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    52a8:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    52ac:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    52b0:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    52b4:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    52b8:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    52bc:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    52c0:	|  |     |  |  |   clr.w 89cc4 <DoNotClearDirty>
    CubeNrReversePos = 1;
    52c6:	|  |     |  |  |   move.w #1,44858 <CubeNrReversePos>
    vectorpos = 0;
    52ce:	|  |     |  |  |   clr.w 89cd6 <vectorpos>
    VectorPosLetters = 0;
    52d4:	|  |     |  |  |   clr.w 89cd4 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    52da:	|  |     |  |  |   clr.w 89cc6 <VectorPosLettersReversed>
  if(result == 1) Scene++;
    52e0:	|  |     |  >--|-> addq.w #1,655da <Scene>
}
    52e6:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    52ea:	|  |     |  |  |   lea 44(sp),sp
    52ee:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    52f0:	|  |     |  |  |   pea 2bd8 <DrawRect+0x616>
    52f4:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    52fa:	|  |     |  |  |   pea 1f468 <incbin_PointCubeDataLz4_start>
    5300:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    5304:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    5306:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    530c:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    5312:	|  |     |  |  |   move.l d2,-(sp)
    5314:	|  |     |  |  |   pea 1f3d4 <incbin_PointCubeData_start>
    531a:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    531e:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    5320:	|  |     |  |  |   pea 251e <SetBplPointers+0x6a>
    5324:	|  |     |  |  |   move.l d2,-(sp)
    5326:	|  |     |  |  |   pea 220e8 <incbin_PointLetterDataLz4_start>
    532c:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    532e:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    5334:	|  |     |  |  |   lea 32(sp),sp
    5338:	|  |     |  |  |   move.l #323312,(sp)
    533e:	|  |     |  |  |   move.l d2,-(sp)
    5340:	|  |     |  |  |   pea 22054 <incbin_PointLetterData_start>
    5346:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    5348:	|  |     |  |  |   pea 20d8 <LoadVectors+0xb8>
    534c:	|  |     |  |  |   move.l d2,-(sp)
    534e:	|  |     |  |  |   pea 24696 <incbin_PointReversedLetterDataLz4_start>
    5354:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    5356:	|  |     |  |  |   pea 452f0 <LetterBuffer2>
    535c:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5362:	|  |     |  |  |   pea 2461a <incbin_PointReversedLetterData_start>
    5368:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    536a:	|  |     |  |  |   move.w #3,655da <Scene>
    5372:	|  |     |  |  |   lea 36(sp),sp
}
    5376:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    537a:	|  |     |  |  |   lea 44(sp),sp
    537e:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    5380:	|  |     |  |  |   pea d4 <main+0x6e>
    5384:	|  |     |  |  |   pea 1 <_start+0x1>
    5388:	|  |     |  |  |   pea 2 <_start+0x2>
    538c:	|  |     |  |  |   pea 3 <_start+0x3>
    5390:	|  |     |  |  |   pea 5 <_start+0x5>
    5394:	|  |     |  |  |   pea 6 <_start+0x6>
    5398:	|  |     |  |  |   pea 450ba <LetterMetaDataReversedPoint>
    539e:	|  |     |  |  |   pea 450d0 <LetterMetaDataPoint>
    53a4:	|  |     |  |  |   pea 450ee <CubeNrReverseSizePoint>
    53aa:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    53ae:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    53b2:	|  |     |  |  |   cmpi.w #1,d0
    53b6:	|  |     +--|--|-- bne.w 511a <DrawScreen+0x9e>
    53ba:	|  |     |  +--|-- bra.w 52e0 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    53be:	|  |     |  |  |   pea 24cd <SetBplPointers+0x19>
    53c2:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    53c8:	|  |     |  |  |   pea 1a38a <incbin_TekCubeDataLz4_start>
    53ce:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    53d2:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    53d4:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    53da:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    53e0:	|  |     |  |  |   move.l d2,-(sp)
    53e2:	|  |     |  |  |   pea 1a2f6 <incbin_TekCubeData_start>
    53e8:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    53ec:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    53ee:	|  |     |  |  |   pea 2a8f <DrawRect+0x4cd>
    53f2:	|  |     |  |  |   move.l d2,-(sp)
    53f4:	|  |     |  |  |   pea 1c930 <incbin_TekLetterDataLz4_start>
    53fa:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    53fc:	|  |     |  |  |   lea 32(sp),sp
    5400:	|  |     |  |  |   move.l #323312,(sp)
    5406:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    540c:	|  |     |  |  |   pea 1c86c <incbin_TekLetterData_start>
    5412:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    5414:	|  |     |  |  |   move.w #5,655da <Scene>
    541c:	|  |     |  |  |   lea 12(sp),sp
}
    5420:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5424:	|  |     |  |  |   lea 44(sp),sp
    5428:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    542a:	|  |     |  |  |   pea 98 <main+0x32>
    542e:	|  |     |  |  |   pea 1 <_start+0x1>
    5432:	|  |     |  |  |   clr.l -(sp)
    5434:	|  |     |  |  |   pea 3 <_start+0x3>
    5438:	|  |     |  |  |   clr.l -(sp)
    543a:	|  |     |  |  |   pea 8 <_start+0x8>
    543e:	|  |     |  |  |   pea 44e90 <LetterMetaDataTek>
    5444:	|  |     |  |  |   pea 44e90 <LetterMetaDataTek>
    544a:	|  |     |  |  |   pea 44eb2 <CubeNrReverseSizeTek>
    5450:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    5454:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5458:	|  |     |  |  |   cmpi.w #1,d0
    545c:	|  |     +--|--|-- bne.w 511a <DrawScreen+0x9e>
    5460:	|  |     |  +--|-- bra.w 52e0 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    5464:	|  |     |  |  |   pea 2be6 <DrawRect+0x624>
    5468:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    546e:	|  |     |  |  |   pea 26846 <incbin_FlexCubeDataLz4_start>
    5474:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    5478:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    547a:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    5480:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    5486:	|  |     |  |  |   move.l d2,-(sp)
    5488:	|  |     |  |  |   pea 26782 <incbin_FlexCubeData_start>
    548e:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    5492:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    5494:	|  |     |  |  |   pea 30a1 <DrawRect+0xadf>
    5498:	|  |     |  |  |   move.l d2,-(sp)
    549a:	|  |     |  |  |   pea 29534 <incbin_FlexLetterDataLz4_start>
    54a0:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    54a2:	|  |     |  |  |   lea 32(sp),sp
    54a6:	|  |     |  |  |   move.l #323312,(sp)
    54ac:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    54b2:	|  |     |  |  |   pea 29440 <incbin_FlexLetterData_start>
    54b8:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    54ba:	|  |     |  |  |   move.w #7,655da <Scene>
    54c2:	|  |     |  |  |   lea 12(sp),sp
}
    54c6:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    54ca:	|  |     |  |  |   lea 44(sp),sp
    54ce:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    54d0:	|  |     |  |  |   pea af <main+0x49>
    54d4:	|  |     |  |  |   pea 1 <_start+0x1>
    54d8:	|  |     |  |  |   clr.l -(sp)
    54da:	|  |     |  |  |   pea 4 <_start+0x4>
    54de:	|  |     |  |  |   clr.l -(sp)
    54e0:	|  |     |  |  |   pea a <_start+0xa>
    54e4:	|  |     |  |  |   pea 44e64 <LetterMetaDataFlex>
    54ea:	|  |     |  |  |   pea 44e64 <LetterMetaDataFlex>
    54f0:	|  |     |  |  |   pea 65438 <CubeNrReverseSizeSpread>
    54f6:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    54fa:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    54fe:	|  |     |  |  |   cmpi.w #1,d0
    5502:	|  |     +--|--|-- bne.w 511a <DrawScreen+0x9e>
    5506:	|  |     |  +--|-- bra.w 52e0 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    550a:	|  |     |  |  |   pea 23ad <Clbuild+0x259>
    550e:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5514:	|  |     |  |  |   pea 2c67e <incbin_DesireCubeDataLz4_start>
    551a:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    551e:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    5520:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    5526:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    552c:	|  |     |  |  |   move.l d2,-(sp)
    552e:	|  |     |  |  |   pea 2c5ea <incbin_DesireCubeData_start>
    5534:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    5538:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    553a:	|  |     |  |  |   pea 286a <DrawRect+0x2a8>
    553e:	|  |     |  |  |   move.l d2,-(sp)
    5540:	|  |     |  |  |   pea 2eb04 <incbin_DesireLetterDataLz4_start>
    5546:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    5548:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    554e:	|  |     |  |  |   lea 32(sp),sp
    5552:	|  |     |  |  |   move.l #323312,(sp)
    5558:	|  |     |  |  |   move.l d2,-(sp)
    555a:	|  |     |  |  |   pea 2ea40 <incbin_DesireLetterData_start>
    5560:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    5562:	|  |     |  |  |   pea 27ff <DrawRect+0x23d>
    5566:	|  |     |  |  |   move.l d2,-(sp)
    5568:	|  |     |  |  |   pea 31446 <incbin_DesireReversedLetterDataLz4_start>
    556e:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    5570:	|  |     |  |  |   pea 452f0 <LetterBuffer2>
    5576:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    557c:	|  |     |  |  |   pea 31382 <incbin_DesireReversedLetterData_start>
    5582:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    5584:	|  |     |  |  |   move.w #9,655da <Scene>
    558c:	|  |     |  |  |   lea 36(sp),sp
}
    5590:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5594:	|  |     |  |  |   lea 44(sp),sp
    5598:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    559a:	|  |     |  |  |   pea af <main+0x49>
    559e:	|  |     |  |  |   pea 1 <_start+0x1>
    55a2:	|  |     |  |  |   pea 3 <_start+0x3>
    55a6:	|  |     |  |  |   pea 3 <_start+0x3>
    55aa:	|  |     |  |  |   pea 8 <_start+0x8>
    55ae:	|  |     |  |  |   pea 8 <_start+0x8>
    55b2:	|  |     |  |  |   pea 44c7e <LetterMetaDataReversedDesire>
    55b8:	|  |     |  |  |   pea 44ca0 <LetterMetaDataDesire>
    55be:	|  |     |  |  |   pea 44cc2 <CubeNrReverseSizeDesire>
    55c4:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    55c8:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    55cc:	|  |     |  |  |   cmpi.w #1,d0
    55d0:	|  |     +--|--|-- bne.w 511a <DrawScreen+0x9e>
    55d4:	|  |     |  +--|-- bra.w 52e0 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    55d8:	|  |     |  |  |   pea 24f2 <SetBplPointers+0x3e>
    55dc:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    55e2:	|  |     |  |  |   pea 150bc <incbin_AtwCubeDataLz4_start>
    55e8:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    55ec:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    55ee:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    55f4:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    55fa:	|  |     |  |  |   move.l d2,-(sp)
    55fc:	|  |     |  |  |   pea 15028 <incbin_AtwCubeData_start>
    5602:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    5606:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    5608:	|  |     |  |  |   pea 2c5b <DrawRect+0x699>
    560c:	|  |     |  |  |   move.l d2,-(sp)
    560e:	|  |     |  |  |   pea 17686 <incbin_AtwLetterDataLz4_start>
    5614:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    5616:	|  |     |  |  |   lea 32(sp),sp
    561a:	|  |     |  |  |   move.l #323312,(sp)
    5620:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5626:	|  |     |  |  |   pea 175c2 <incbin_AtwLetterData_start>
    562c:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    562e:	|  |     |  |  |   move.w #11,655da <Scene>
    5636:	|  |     |  |  |   lea 12(sp),sp
}
    563a:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    563e:	|  |     |  |  |   lea 44(sp),sp
    5642:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    5644:	|  |     |  |  |   pea c8 <main+0x62>
    5648:	|  |     |  |  |   pea 1 <_start+0x1>
    564c:	|  |     |  |  |   clr.l -(sp)
    564e:	|  |     |  |  |   pea 3 <_start+0x3>
    5652:	|  |     |  |  |   clr.l -(sp)
    5654:	|  |     |  |  |   pea 8 <_start+0x8>
    5658:	|  |     |  |  |   pea 44a98 <LetterMetaDataReversedAtw>
    565e:	|  |     |  |  |   pea 44aba <LetterMetaDataAtw>
    5664:	|  |     |  |  |   pea 44adc <CubeNrReverseAtw>
    566a:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    566e:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5672:	|  |     |  |  |   cmpi.w #1,d0
    5676:	|  |     +--|--|-- bne.w 511a <DrawScreen+0x9e>
    567a:	|  |     |  +--|-- bra.w 52e0 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    567e:	|  |     |  |  |   pea 28fa <DrawRect+0x338>
    5682:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5688:	|  |     |  |  |   pea d1e4 <incbin_AbyssCubeDataLz4_start>
    568e:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    5692:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    5694:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    569a:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    56a0:	|  |     |  |  |   move.l d2,-(sp)
    56a2:	|  |     |  |  |   pea d150 <incbin_AbyssCubeData_start>
    56a8:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    56ac:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    56ae:	|  |     |  |  |   pea 30ff <DrawRect+0xb3d>
    56b2:	|  |     |  |  |   move.l d2,-(sp)
    56b4:	|  |     |  |  |   pea fbce <incbin_AbyssLetterDataLz4_start>
    56ba:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    56bc:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    56c2:	|  |     |  |  |   lea 32(sp),sp
    56c6:	|  |     |  |  |   move.l #323312,(sp)
    56cc:	|  |     |  |  |   move.l d2,-(sp)
    56ce:	|  |     |  |  |   pea faf2 <incbin_AbyssLetterData_start>
    56d4:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    56d6:	|  |     |  |  |   pea 229d <Clbuild+0x149>
    56da:	|  |     |  |  |   move.l d2,-(sp)
    56dc:	|  |     |  |  |   pea 12d76 <incbin_AbyssReversedLetterDataLz4_start>
    56e2:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    56e4:	|  |     |  |  |   pea 452f0 <LetterBuffer2>
    56ea:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    56f0:	|  |     |  |  |   pea 12ce2 <incbin_AbyssReversedLetterData_start>
    56f6:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    56f8:	|  |     |  |  |   move.w #13,655da <Scene>
    5700:	|  |     |  |  |   lea 36(sp),sp
}
    5704:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5708:	|  |     |  |  |   lea 44(sp),sp
    570c:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    570e:	|  |     |  |  |   pea 2003 <SetCl+0xa67>
    5712:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5718:	|  |     |  |  |   pea 33d1e <incbin_MercuryCubeData1Lz4_start>
    571e:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    5722:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    5724:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    572a:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    5730:	|  |     |  |  |   move.l d2,-(sp)
    5732:	|  |     |  |  |   pea 33c5a <incbin_MercuryCubeData1_start>
    5738:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    573c:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    573e:	|  |     |  |  |   pea 2b27 <DrawRect+0x565>
    5742:	|  |     |  |  |   move.l d2,-(sp)
    5744:	|  |     |  |  |   pea 35e72 <incbin_MercuryLetterData1Lz4_start>
    574a:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    574c:	|  |     |  |  |   lea 32(sp),sp
    5750:	|  |     |  |  |   move.l #323312,(sp)
    5756:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    575c:	|  |     |  |  |   pea 35d36 <incbin_MercuryLetterData1_start>
    5762:	|  |     |  |  |   jsr (a2)
      Scene = 15;
    5764:	|  |     |  |  |   move.w #15,655da <Scene>
    576c:	|  |     |  |  |   lea 12(sp),sp
}
    5770:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5774:	|  |     |  |  |   lea 44(sp),sp
    5778:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    577a:	|  |     |  |  |   pea 1928 <SetCl+0x38c>
    577e:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    5784:	|  |     |  |  |   pea 38a72 <incbin_MercuryCubeData2Lz4_start>
    578a:	|  |     |  |  |   lea bd0 <Utils_Lz4DepackAsm>(pc),a3
    578e:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    5790:	|  |     |  |  |   move.l 89e36 <WorkingMem>,d2
    5796:	|  |     |  |  |   pea 5b712 <VectorBuffer>
    579c:	|  |     |  |  |   move.l d2,-(sp)
    579e:	|  |     |  |  |   pea 389ae <incbin_MercuryCubeData2_start>
    57a4:	|  |     |  |  |   lea 2020 <LoadVectors>(pc),a2
    57a8:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    57aa:	|  |     |  |  |   pea 1f6b <SetCl+0x9cf>
    57ae:	|  |     |  |  |   move.l d2,-(sp)
    57b0:	|  |     |  |  |   pea 3a4ba <incbin_MercuryLetterData2Lz4_start>
    57b6:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    57b8:	|  |     |  |  |   lea 32(sp),sp
    57bc:	|  |     |  |  |   move.l #323312,(sp)
    57c2:	|  |     |  |  |   move.l 89e36 <WorkingMem>,-(sp)
    57c8:	|  |     |  |  |   pea 3a3ae <incbin_MercuryLetterData2_start>
    57ce:	|  |     |  |  |   jsr (a2)
      Scene = 17;
    57d0:	|  |     |  |  |   move.w #17,655da <Scene>
    57d8:	|  |     |  |  |   lea 12(sp),sp
}
    57dc:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    57e0:	|  |     |  |  |   lea 44(sp),sp
    57e4:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    57e6:	|  |     |  |  |   pea 84 <main+0x1e>
    57ea:	|  |     |  |  |   pea 6e <main+0x8>
    57ee:	|  |     |  |  |   clr.l -(sp)
    57f0:	|  |     |  |  |   pea 4 <_start+0x4>
    57f4:	|  |     |  |  |   clr.l -(sp)
    57f6:	|  |     |  |  |   pea b <_start+0xb>
    57fa:	|  |     |  |  |   pea 4485a <LetterMetaDataMercury2>
    5800:	|  |     |  |  |   pea 4485a <LetterMetaDataMercury2>
    5806:	|  |     |  |  |   pea 44adc <CubeNrReverseAtw>
    580c:	|  |     |  |  |   jsr 4922 <DrawDices>(pc)
      break;
    5810:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5814:	|  |     |  |  |   cmpi.w #1,d0
    5818:	|  |     \--|--|-- bne.w 511a <DrawScreen+0x9e>
    581c:	|  |        \--|-- bra.w 52e0 <DrawScreen+0x264>
      for(int i=0;i<metadata[2];i++)
    5820:	|  |           \-> tst.w d1
    5822:	|  |  /----------- ble.w 5998 <DrawScreen+0x91c>
    5826:	|  |  |            lea 6(a5),a6
    582a:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    582c:	|  |  |            lea 20(a0),a0
    5830:	|  |  |            move.l a0,52(sp)
    5834:	|  |  |            move.l a5,48(sp)
    5838:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    583a:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    583e:	|  |  |  |         movea.w 4(a2),a0
    5842:	|  |  |  |         move.l a0,d0
    5844:	|  |  |  |         subq.l #1,d0
    5846:	|  |  |  |         add.l d0,d0
    5848:	|  |  |  |         move.w (0,a4,d0.l),d0
    584c:	|  |  |  |         move.w d0,d1
    584e:	|  |  |  |         muls.w (a2),d1
    5850:	|  |  |  |         moveq #15,d4
    5852:	|  |  |  |         asr.l d4,d1
    5854:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    5858:	|  |  |  |         muls.w 2(a2),d0
    585c:	|  |  |  |         asr.l d4,d0
    585e:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    5862:	|  |  |  |         movea.w 10(a2),a0
    5866:	|  |  |  |         subq.l #1,a0
    5868:	|  |  |  |         adda.l a0,a0
    586a:	|  |  |  |         move.w (0,a4,a0.l),d2
    586e:	|  |  |  |         move.w d2,d7
    5870:	|  |  |  |         muls.w 6(a2),d7
    5874:	|  |  |  |         asr.l d4,d7
    5876:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    587a:	|  |  |  |         muls.w 8(a2),d2
    587e:	|  |  |  |         asr.l d4,d2
    5880:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    5884:	|  |  |  |         movea.w 16(a2),a0
    5888:	|  |  |  |         subq.l #1,a0
    588a:	|  |  |  |         adda.l a0,a0
    588c:	|  |  |  |         move.w (0,a4,a0.l),d3
    5890:	|  |  |  |         move.w d3,d6
    5892:	|  |  |  |         muls.w 12(a2),d6
    5896:	|  |  |  |         asr.l d4,d6
    5898:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    589c:	|  |  |  |         muls.w 14(a2),d3
    58a0:	|  |  |  |         asr.l d4,d3
    58a2:	|  |  |  |         movea.w d3,a1
    58a4:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    58a8:	|  |  |  |         movea.w 22(a2),a0
    58ac:	|  |  |  |         subq.l #1,a0
    58ae:	|  |  |  |         adda.l a0,a0
    58b0:	|  |  |  |         move.w (0,a4,a0.l),d3
    58b4:	|  |  |  |         move.w d3,d5
    58b6:	|  |  |  |         muls.w 18(a2),d5
    58ba:	|  |  |  |         asr.l d4,d5
    58bc:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    58c0:	|  |  |  |         muls.w 20(a2),d3
    58c4:	|  |  |  |         asr.l d4,d3
    58c6:	|  |  |  |         movea.w d3,a0
    58c8:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    58cc:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    58d0:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    58d4:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    58d8:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    58dc:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    58e0:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    58e4:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    58e8:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    58ec:	|  |  |  |         move.w d1,d4
    58ee:	|  |  |  |         cmp.w d1,d7
    58f0:	|  |  |  |     /-- bge.s 58f4 <DrawScreen+0x878>
    58f2:	|  |  |  |     |   move.w d7,d4
    58f4:	|  |  |  |     \-> cmp.w d4,d6
    58f6:	|  |  |  |     /-- bge.s 58fa <DrawScreen+0x87e>
    58f8:	|  |  |  |     |   move.w d6,d4
    58fa:	|  |  |  |     \-> cmp.w d4,d5
    58fc:	|  |  |  |     /-- bge.s 5900 <DrawScreen+0x884>
    58fe:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    5900:	|  |  |  |     \-> move.w d0,d3
    5902:	|  |  |  |         cmp.w d0,d2
    5904:	|  |  |  |     /-- bge.s 5908 <DrawScreen+0x88c>
    5906:	|  |  |  |     |   move.w d2,d3
    5908:	|  |  |  |     \-> cmp.w a1,d3
    590a:	|  |  |  |     /-- ble.s 590e <DrawScreen+0x892>
    590c:	|  |  |  |     |   move.w a1,d3
    590e:	|  |  |  |     \-> cmp.w a0,d3
    5910:	|  |  |  |     /-- ble.s 5914 <DrawScreen+0x898>
    5912:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    5914:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    5918:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    591c:	|  |  |  |         cmp.w d0,d2
    591e:	|  |  |  |     /-- ble.s 5922 <DrawScreen+0x8a6>
    5920:	|  |  |  |     |   move.w d2,d0
    5922:	|  |  |  |     \-> cmp.w a1,d0
    5924:	|  |  |  |     /-- bge.s 5928 <DrawScreen+0x8ac>
    5926:	|  |  |  |     |   move.w a1,d0
    5928:	|  |  |  |     \-> cmp.w a0,d0
    592a:	|  |  |  |     /-- bge.s 592e <DrawScreen+0x8b2>
    592c:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    592e:	|  |  |  |     \-> addq.w #1,d0
    5930:	|  |  |  |         sub.w d3,d0
    5932:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5936:	|  |  |  |         cmpi.w #1,d0
    593a:	|  |  |  |  /----- ble.s 5974 <DrawScreen+0x8f8>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    593c:	|  |  |  |  |      cmp.w d1,d7
    593e:	|  |  |  |  |  /-- ble.s 5942 <DrawScreen+0x8c6>
    5940:	|  |  |  |  |  |   move.w d7,d1
    5942:	|  |  |  |  |  \-> cmp.w d1,d6
    5944:	|  |  |  |  |  /-- ble.s 5948 <DrawScreen+0x8cc>
    5946:	|  |  |  |  |  |   move.w d6,d1
    5948:	|  |  |  |  |  \-> cmp.w d1,d5
    594a:	|  |  |  |  |  /-- ble.s 594e <DrawScreen+0x8d2>
    594c:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    594e:	|  |  |  |  |  \-> sub.w d4,d1
    5950:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    5954:	|  |  |  |  |      cmpi.w #1,d1
    5958:	|  |  |  |  +----- ble.s 5974 <DrawScreen+0x8f8>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    595a:	|  |  |  |  |      movea.l 52(sp),a0
    595e:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    5962:	|  |  |  |  |      pea 56(sp)
    5966:	|  |  |  |  |      jsr 25c2 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    596a:	|  |  |  |  |      movea.l 52(sp),a0
    596e:	|  |  |  |  |      movea.w 4(a0),a5
    5972:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    5974:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    5978:	|  |  |  |         addq.l #1,a3
    597a:	|  |  |  |         movea.w a5,a0
    597c:	|  |  |  |         cmpa.l a3,a0
    597e:	|  |  |  \-------- bgt.w 583a <DrawScreen+0x7be>
    5982:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    5986:	|  |  |            addq.l #3,a0
    5988:	|  |  |            adda.l a0,a0
    598a:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    598c:	|  |  |            subq.l #1,44(sp)
    5990:	+--|--|----------- bne.w 51c0 <DrawScreen+0x144>
    5994:	|  +--|----------- bra.w 520e <DrawScreen+0x192>
    metadata += 3 + metadata[2];    
    5998:	|  |  \----------> movea.w d1,a0
    599a:	|  |               addq.l #3,a0
    599c:	|  |               adda.l a0,a0
    599e:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    59a0:	|  |               subq.l #1,44(sp)
    59a4:	\--|-------------- bne.w 51c0 <DrawScreen+0x144>
    59a8:	   \-------------- bra.w 520e <DrawScreen+0x192>

000059ac <strlen>:
	while(*s++)
    59ac:	   /-> movea.l 4(sp),a0
    59b0:	   |   tst.b (a0)+
    59b2:	/--|-- beq.s 59c0 <strlen+0x14>
    59b4:	|  |   move.l a0,-(sp)
    59b6:	|  \-- jsr 59ac <strlen>(pc)
    59ba:	|      addq.l #4,sp
    59bc:	|      addq.l #1,d0
}
    59be:	|      rts
	unsigned long t=0;
    59c0:	\----> moveq #0,d0
}
    59c2:	       rts

000059c4 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    59c4:	       move.l d2,-(sp)
    59c6:	       move.l 8(sp),d0
	while(len-- > 0)
    59ca:	       tst.l 16(sp)
    59ce:	/----- beq.s 59e2 <memset+0x1e>
		*ptr++ = val;
    59d0:	|      move.b 15(sp),d2
    59d4:	|      move.l 16(sp),d1
    59d8:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    59da:	|      movea.l d0,a0
		*ptr++ = val;
    59dc:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    59de:	|  |   cmpa.l d1,a0
    59e0:	|  \-- bne.s 59dc <memset+0x18>
}
    59e2:	\----> move.l (sp)+,d2
    59e4:	       rts

000059e6 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    59e6:	       move.l 4(sp),d0
    59ea:	       movea.l 8(sp),a0
	while(len--)
    59ee:	       tst.l 12(sp)
    59f2:	/----- beq.s 5a02 <memcpy+0x1c>
    59f4:	|      movea.l d0,a1
    59f6:	|      move.l 12(sp),d1
    59fa:	|      add.l a0,d1
		*d++ = *s++;
    59fc:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    59fe:	|  |   cmp.l a0,d1
    5a00:	|  \-- bne.s 59fc <memcpy+0x16>
}
    5a02:	\----> rts

00005a04 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5a04:	          move.l d2,-(sp)
    5a06:	          move.l 8(sp),d0
    5a0a:	          movea.l 12(sp),a0
    5a0e:	          move.l 16(sp),d2
	if (d < s) {
    5a12:	          cmpa.l d0,a0
    5a14:	   /----- bls.s 5a2a <memmove+0x26>
		while (len--)
    5a16:	   |      tst.l d2
    5a18:	/--|----- beq.s 5a26 <memmove+0x22>
    5a1a:	|  |      movea.l d0,a1
    5a1c:	|  |      move.l a0,d1
    5a1e:	|  |      add.l d2,d1
			*d++ = *s++;
    5a20:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    5a22:	|  |  |   cmp.l a0,d1
    5a24:	|  |  \-- bne.s 5a20 <memmove+0x1c>
}
    5a26:	>--|----> move.l (sp)+,d2
    5a28:	|  |      rts
		while (len--)
    5a2a:	|  \----> movea.l d2,a1
    5a2c:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5a2e:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    5a30:	|         adda.l d0,a1
		while (len--)
    5a32:	|         tst.l d2
    5a34:	+-------- beq.s 5a26 <memmove+0x22>
    5a36:	|         move.l a0,d1
    5a38:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    5a3a:	|     /-> move.b (a0),(a1)
		while (len--)
    5a3c:	|     |   subq.l #1,a0
    5a3e:	|     |   subq.l #1,a1
    5a40:	|     |   cmpa.l d1,a0
    5a42:	+-----|-- beq.s 5a26 <memmove+0x22>
			*lastd-- = *lasts--;
    5a44:	|     |   move.b (a0),(a1)
		while (len--)
    5a46:	|     |   subq.l #1,a0
    5a48:	|     |   subq.l #1,a1
    5a4a:	|     |   cmpa.l d1,a0
    5a4c:	|     \-- bne.s 5a3a <memmove+0x36>
    5a4e:	\-------- bra.s 5a26 <memmove+0x22>

00005a50 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    5a50:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    5a54:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a58:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    5a5c:	mulu.w 8(sp),d1
	addw	d1, d0
    5a60:	add.w d1,d0
	swap	d0
    5a62:	swap d0
	clrw	d0
    5a64:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5a66:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    5a6a:	mulu.w 10(sp),d1
	addl	d1, d0
    5a6e:	add.l d1,d0
	rts
    5a70:	rts

00005a72 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    5a72:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    5a74:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    5a78:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    5a7c:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    5a82:	   /-- bcc.s 5a9a <__udivsi3+0x28>
	movel	d0, d2
    5a84:	   |   move.l d0,d2
	clrw	d2
    5a86:	   |   clr.w d2
	swap	d2
    5a88:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    5a8a:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    5a8c:	   |   move.w d2,d0
	swap	d0
    5a8e:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    5a90:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    5a94:	   |   divu.w d1,d2
	movew	d2, d0
    5a96:	   |   move.w d2,d0
	jra	6f
    5a98:	/--|-- bra.s 5aca <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    5a9a:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    5a9c:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    5a9e:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    5aa0:	|  |   cmpi.l #65536,d1
	jcc	4b
    5aa6:	|  \-- bcc.s 5a9c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    5aa8:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    5aaa:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    5ab0:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    5ab2:	|      mulu.w d0,d1
	swap	d2
    5ab4:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    5ab6:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    5ab8:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    5aba:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    5abc:	|  /-- bne.s 5ac8 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    5abe:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    5ac0:	|  +-- bcs.s 5ac8 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    5ac2:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    5ac6:	+--|-- bls.s 5aca <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    5ac8:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    5aca:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5acc:	       rts

00005ace <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    5ace:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    5ad0:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    5ad2:	    move.l 12(sp),d1
	jpl	1f
    5ad6:	/-- bpl.s 5adc <__divsi3+0xe>
	negl	d1
    5ad8:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5ada:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5adc:	\-> move.l 8(sp),d0
	jpl	2f
    5ae0:	/-- bpl.s 5ae6 <__divsi3+0x18>
	negl	d0
    5ae2:	|   neg.l d0
	negb	d2
    5ae4:	|   neg.b d2

2:	movel	d1, sp@-
    5ae6:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5ae8:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5aea:	    bsr.s 5a72 <__udivsi3>
	addql	#8, sp
    5aec:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    5aee:	    tst.b d2
	jpl	3f
    5af0:	/-- bpl.s 5af4 <__divsi3+0x26>
	negl	d0
    5af2:	|   neg.l d0

3:	movel	sp@+, d2
    5af4:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5af6:	    rts

00005af8 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5af8:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5afc:	move.l 4(sp),d0
	movel	d1, sp@-
    5b00:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b02:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5b04:	bsr.s 5ace <__divsi3>
	addql	#8, sp
    5b06:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b08:	move.l 8(sp),d1
	movel	d1, sp@-
    5b0c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b0e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b10:	bsr.w 5a50 <__mulsi3>
	addql	#8, sp
    5b14:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b16:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b1a:	sub.l d0,d1
	movel	d1, d0
    5b1c:	move.l d1,d0
	rts
    5b1e:	rts

00005b20 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5b20:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5b24:	move.l 4(sp),d0
	movel	d1, sp@-
    5b28:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b2a:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5b2c:	bsr.w 5a72 <__udivsi3>
	addql	#8, sp
    5b30:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5b32:	move.l 8(sp),d1
	movel	d1, sp@-
    5b36:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5b38:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5b3a:	bsr.w 5a50 <__mulsi3>
	addql	#8, sp
    5b3e:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5b40:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5b44:	sub.l d0,d1
	movel	d1, d0
    5b46:	move.l d1,d0
	rts
    5b48:	rts

00005b4a <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    5b4a:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    5b4c:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    5b50:	jsr -516(a6)
    move.l (sp)+, a6
    5b54:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    5b56:	rts

00005b58 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    5b58:	move.b d0,(a3)+
	rts
    5b5a:	rts

00005b5c <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    5b5c:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    5b5e:	                         adda.l a0,a2
	move.l	a2,a3
    5b60:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    5b62:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    5b64:	                         moveq #56,d4
	moveq	#8,d5
    5b66:	                         moveq #8,d5
	bra.s	.Lliteral
    5b68:	   /-------------------- bra.s 5bd2 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    5b6a:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    5b6c:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    5b6e:	+--|-------------------- dbf d1,5b6a <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    5b72:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    5b74:	|  |     /-------------- bcc.s 5b78 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    5b76:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    5b78:	|  |  |  >-------------> tst.w d0
    5b7a:	|  |  |  |           /-- bne.s 5b84 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    5b7c:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    5b7e:	|  |  |  |           |   bls.s 5bf6 <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    5b80:	|  |  |  |           |   move.w (a0)+,d0
    5b82:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    5b84:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    5b86:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    5b88:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    5b8a:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    5b8c:	|  |  |  |               movem.w (5bf0 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    5b92:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    5b94:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    5b96:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    5b98:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    5b9a:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    5b9c:	|  |  |  |               tst.w d0
    5b9e:	|  |  |  |           /-- bne.s 5ba4 <_doynaxdepack_asm+0x48>
    5ba0:	|  |  |  |           |   move.w (a0)+,d0
    5ba2:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5ba4:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5ba6:	|  |  |  |  /----------- beq.s 5bbe <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5ba8:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5baa:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5bac:	|  |  |  |  |  /-------- bpl.s 5bba <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    5bae:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    5bb0:	|  |  |  |  |  |  /----- bpl.s 5bb8 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    5bb2:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5bb4:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5bb6:	|  |  |  |  |  |  |  \-- bmi.s 5bb2 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5bb8:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5bba:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5bbc:	|  |  |  |  |        /-- bcc.s 5bc0 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    5bbe:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    5bc0:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    5bc2:	|  |  |  |  \----------- dbf d1,5bbe <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5bc6:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5bc8:	|  |  |  \-------------- bcc.s 5b78 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5bca:	|  |  |                  tst.w d0
    5bcc:	|  +--|----------------- bne.s 5bd2 <_doynaxdepack_asm+0x76>
    5bce:	|  |  |                  move.w (a0)+,d0
    5bd0:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    5bd2:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5bd4:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5bd6:	|     \----------------- bcc.s 5b76 <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5bd8:	|                 /----- bpl.s 5be0 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5bda:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5bdc:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    5bde:	|                 |  \-- bmi.s 5bda <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    5be0:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    5be2:	\--------------------/-X dbv.s d1,5b6a <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5be6:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5be8:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5bea:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5bec:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    5bee:	                     \-- bra.s 5be2 <_doynaxdepack_asm+0x86>

00005bf0 <doy_table>:
    5bf0:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    5c00:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    5c10:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    5c20:	.............oNq

00005c30 <_smartlinefillasm>:
|A0 = LookupSlope
|A1 = LineBuffer
|A2 = PrepareBuffer
|A3 = dff000
_smartlinefillasm:
    movem.l d0-d7/a0-a3,-(sp)
    5c30:	movem.l d0-a3,-(sp)
    |UWORD startyoffset = starty*64;
    lsl.l #6,D1
    5c34:	lsl.l #6,d1
    |WORD direction = 64;
    move.w #64,d7
    5c36:	move.w #64,d7
    |if( height < 0) {
    cmp.w #0,d2
    5c3a:	cmpi.w #0,d2
    bgt.s br1
    5c3e:	bgt.s 5c4a <br1>
    |{
    |direction = -64;  
    neg.w d7    
    5c40:	neg.w d7
    |startyoffset -= (height + 1) * 64;      
    addq.w  #1,d2
    5c42:	addq.w #1,d2
    lsl.l   #6,d2
    5c44:	lsl.l #6,d2
    sub.w   d2,d1
    5c46:	sub.w d2,d1
    |height *= -1;
    neg.w d2        
    5c48:	neg.w d2

00005c4a <br1>:
    |}   
br1:
    |D1 = targetbufferoffset
    |UWORD targetbufferoffset = bltstart + startyoffset;      
    add.w d6,d1
    5c4a:	add.w d6,d1
    |D6 = startbufferoffset
    |ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    lsl.w #3,d6
    5c4c:	lsl.w #3,d6
    sub.w d6,d0
    5c4e:	sub.w d6,d0
    mulu.w #1200,d6
    5c50:	mulu.w #1200,d6
    |WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    |d0 = BLTBMOD
    move.w d2,d0
    5c54:	move.w d2,d0
    subq.w #1,d0
    5c56:	subq.w #1,d0
    mulu.w #100,d0
    5c58:	mulu.w #100,d0
    subq.w #1,d3
    5c5c:	subq.w #1,d3
    add.w d3,d0
    5c5e:	add.w d3,d0
    add.w d0,a0
    5c60:	adda.w d0,a0
    move.w (a0),d0
    5c62:	move.w (a0),d0
    sub.w  d5,d0
    5c64:	sub.w d5,d0
    sub.w  d5,d0
    5c66:	sub.w d5,d0
    |WORD bltdmod = direction - 2 * bltwidth;
    |d7 = BLTDMOO
    sub.w d5,d7
    5c68:	sub.w d5,d7
    sub.w d5,d7
    5c6a:	sub.w d5,d7
    |ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    |A1 = bltbpt
    add.l d6,a1
    5c6c:	adda.l d6,a1
    |ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    |A2 = bltdpt
    add.l d1,a2
    5c6e:	adda.l d1,a2
    |bltsize = bltwidth * 64*height
    |D2 = bltsize
    lsl.w #6,d2
    5c70:	lsl.w #6,d2
    add.w d5,d2
    5c72:	add.w d5,d2
    lea   0xdff000,a3
    5c74:	lea dff000 <_end+0xd751b0>,a3
    tst.w 0x2(a3)
    5c7a:	tst.w 2(a3)

00005c7e <waitblit>:
waitblit:
    btst #6,2(a3)
    5c7e:	/-> btst #6,2(a3)
    bne.s waitblit
    5c84:	\-- bne.s 5c7e <waitblit>
    |custom->bltbpt = (UBYTE *)bltbpt;
    move.l a1,0x4c(a3)
    5c86:	    move.l a1,76(a3)
    |custom->bltcpt = (UBYTE *)bltdpt;
    move.l a2,0x48(a3)
    5c8a:	    move.l a2,72(a3)
    |custom->bltdpt = (UBYTE *)bltdpt;  
    move.l a2,0x54(a3)
    5c8e:	    move.l a2,84(a3)
    |custom->bltbmod = bltbmod;
    move.w d0,0x62(a3)
    5c92:	    move.w d0,98(a3)
    |custom->bltcmod = bltdmod;
    move.w d7,0x60(a3)
    5c96:	    move.w d7,96(a3)
    |custom->bltdmod = bltdmod;
    move.w d7,0x66(a3)
    5c9a:	    move.w d7,102(a3)
    |custom->bltsize = bltwidth + 64*height;
    move.w d2,0x58(a3)
    5c9e:	    move.w d2,88(a3)
    movem.l (sp)+,d0-d7/a0-a3
    5ca2:	    movem.l (sp)+,d0-a3
    rts
    5ca6:	    rts

00005ca8 <_calc2d>:

vectors3d:
zmult:

_calc2d:
    lea vectors3d,a0
    5ca8:	lea 5ca8 <_calc2d>(pc),a0
    movem.w (a0),d0-d5/a1-a4
    5cac:	movem.w (a0),d0-d5/a1-a4
    add.l a1,a1
    5cb0:	adda.l a1,a1
    add.l #zmult,a1
    5cb2:	adda.l #23720,a1

00005cb8 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5cb8:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5cbc:	moveq #0,d1
			moveq	#0,d2
    5cbe:	moveq #0,d2
			moveq	#0,d3
    5cc0:	moveq #0,d3
			moveq	#16,d7
    5cc2:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5cc4:	lea 6942 <lz4jmp>(pc),a3
		moveq	#0,d0
    5cc8:	moveq #0,d0
		move.b	(a0)+,d0
    5cca:	move.b (a0)+,d0
		add.w	d0,d0
    5ccc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5cce:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5cd2:	jmp (0,a3,d0.w)

00005cd6 <lz4Rts0>:
lz4Rts0:	rts
    5cd6:	rts

00005cd8 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    5cd8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cdc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ce0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ce2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ce4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ce6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ce8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5cf4:	cmpa.l a0,a4
		beq.s	lz4Rts1
    5cf6:	beq.s 5d1a <lz4Rts1>
		move.b	(a0)+,d0
    5cf8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5cfa:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5cfc:	move.w (sp)+,d3
		move.b	d0,d3
    5cfe:	move.b d0,d3
		move.l	a1,a2
    5d00:	movea.l a1,a2
		sub.l	d3,a2
    5d02:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d04:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d06:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d08:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d0a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d0c:	moveq #0,d0
		move.b	(a0)+,d0
    5d0e:	move.b (a0)+,d0
		add.w	d0,d0
    5d10:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d12:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d16:	jmp (0,a3,d0.w)

00005d1a <lz4Rts1>:
lz4Rts1:	rts
    5d1a:	rts

00005d1c <sl_sm1>:

sl_sm1:
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
		move.b	(a0)+,(a1)+
    5d28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d36:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d38:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5d3a:	beq.s 5d60 <lz4Rts2>
		move.b	(a0)+,d0
    5d3c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d3e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d40:	move.w (sp)+,d3
		move.b	d0,d3
    5d42:	move.b d0,d3
		move.l	a1,a2
    5d44:	movea.l a1,a2
		sub.l	d3,a2
    5d46:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d48:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d4a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d4c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d4e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d50:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d52:	moveq #0,d0
		move.b	(a0)+,d0
    5d54:	move.b (a0)+,d0
		add.w	d0,d0
    5d56:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d58:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d5c:	jmp (0,a3,d0.w)

00005d60 <lz4Rts2>:
lz4Rts2:	rts
    5d60:	rts

00005d62 <sl_sm2>:

sl_sm2:
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
		move.b	(a0)+,(a1)+
    5d6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d70:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d72:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d74:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d76:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d78:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d7a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5d7c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d7e:	cmpa.l a0,a4
		beq.s	lz4Rts3
    5d80:	beq.s 5da8 <lz4Rts3>
		move.b	(a0)+,d0
    5d82:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d84:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d86:	move.w (sp)+,d3
		move.b	d0,d3
    5d88:	move.b d0,d3
		move.l	a1,a2
    5d8a:	movea.l a1,a2
		sub.l	d3,a2
    5d8c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d8e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d90:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d92:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d94:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d96:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d98:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d9a:	moveq #0,d0
		move.b	(a0)+,d0
    5d9c:	move.b (a0)+,d0
		add.w	d0,d0
    5d9e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5da0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5da4:	jmp (0,a3,d0.w)

00005da8 <lz4Rts3>:
lz4Rts3:	rts
    5da8:	rts

00005daa <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    5daa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5db8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dbc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dbe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dc0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dc2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dc4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5dc6:	cmpa.l a0,a4
		beq.s	lz4Rts4
    5dc8:	beq.s 5df2 <lz4Rts4>
		move.b	(a0)+,d0
    5dca:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5dcc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5dce:	move.w (sp)+,d3
		move.b	d0,d3
    5dd0:	move.b d0,d3
		move.l	a1,a2
    5dd2:	movea.l a1,a2
		sub.l	d3,a2
    5dd4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5dd6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dd8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dda:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ddc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dde:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5de0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5de2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5de4:	moveq #0,d0
		move.b	(a0)+,d0
    5de6:	move.b (a0)+,d0
		add.w	d0,d0
    5de8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5dea:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5dee:	jmp (0,a3,d0.w)

00005df2 <lz4Rts4>:
lz4Rts4:	rts
    5df2:	rts

00005df4 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    5df4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5df8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dfa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dfc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5dfe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e00:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e02:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e04:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e06:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e08:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e0a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e0c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e0e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e10:	cmpa.l a0,a4
		beq.s	lz4Rts5
    5e12:	beq.s 5e3e <lz4Rts5>
		move.b	(a0)+,d0
    5e14:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e16:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e18:	move.w (sp)+,d3
		move.b	d0,d3
    5e1a:	move.b d0,d3
		move.l	a1,a2
    5e1c:	movea.l a1,a2
		sub.l	d3,a2
    5e1e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e28:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e2a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e2c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e2e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e30:	moveq #0,d0
		move.b	(a0)+,d0
    5e32:	move.b (a0)+,d0
		add.w	d0,d0
    5e34:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e36:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e3a:	jmp (0,a3,d0.w)

00005e3e <lz4Rts5>:
lz4Rts5:	rts
    5e3e:	rts

00005e40 <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    5e40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e4a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e52:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e54:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e5a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e5c:	cmpa.l a0,a4
		beq.s	lz4Rts6
    5e5e:	beq.s 5e8c <lz4Rts6>
		move.b	(a0)+,d0
    5e60:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e62:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e64:	move.w (sp)+,d3
		move.b	d0,d3
    5e66:	move.b d0,d3
		move.l	a1,a2
    5e68:	movea.l a1,a2
		sub.l	d3,a2
    5e6a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e7c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e7e:	moveq #0,d0
		move.b	(a0)+,d0
    5e80:	move.b (a0)+,d0
		add.w	d0,d0
    5e82:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e84:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e88:	jmp (0,a3,d0.w)

00005e8c <lz4Rts6>:
lz4Rts6:	rts
    5e8c:	rts

00005e8e <sl_sm6>:

sl_sm6:
		move.b	(a0)+,(a1)+
    5e8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e9e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ea0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ea2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ea4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ea6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ea8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5eaa:	cmpa.l a0,a4
		beq.s	lz4Rts7
    5eac:	beq.s 5edc <lz4Rts7>
		move.b	(a0)+,d0
    5eae:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5eb0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5eb2:	move.w (sp)+,d3
		move.b	d0,d3
    5eb4:	move.b d0,d3
		move.l	a1,a2
    5eb6:	movea.l a1,a2
		sub.l	d3,a2
    5eb8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5eba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ebc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ebe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ec0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ec2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ec4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ec6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ec8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5ecc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5ece:	moveq #0,d0
		move.b	(a0)+,d0
    5ed0:	move.b (a0)+,d0
		add.w	d0,d0
    5ed2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5ed4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ed8:	jmp (0,a3,d0.w)

00005edc <lz4Rts7>:
lz4Rts7:	rts
    5edc:	rts

00005ede <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    5ede:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ee0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ee2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ee4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ee6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ee8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5eee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ef0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ef2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ef4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ef6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ef8:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5efa:	cmpa.l a0,a4
		beq.s	lz4Rts8
    5efc:	beq.s 5f2e <lz4Rts8>
		move.b	(a0)+,d0
    5efe:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f00:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f02:	move.w (sp)+,d3
		move.b	d0,d3
    5f04:	move.b d0,d3
		move.l	a1,a2
    5f06:	movea.l a1,a2
		sub.l	d3,a2
    5f08:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f0a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f0c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f0e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f10:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f12:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f14:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f16:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f1e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f20:	moveq #0,d0
		move.b	(a0)+,d0
    5f22:	move.b (a0)+,d0
		add.w	d0,d0
    5f24:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f26:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f2a:	jmp (0,a3,d0.w)

00005f2e <lz4Rts8>:
lz4Rts8:	rts
    5f2e:	rts

00005f30 <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    5f30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f4a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f4c:	cmpa.l a0,a4
		beq.s	lz4Rts9
    5f4e:	beq.s 5f82 <lz4Rts9>
		move.b	(a0)+,d0
    5f50:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f52:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f54:	move.w (sp)+,d3
		move.b	d0,d3
    5f56:	move.b d0,d3
		move.l	a1,a2
    5f58:	movea.l a1,a2
		sub.l	d3,a2
    5f5a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5f5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f72:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f74:	moveq #0,d0
		move.b	(a0)+,d0
    5f76:	move.b (a0)+,d0
		add.w	d0,d0
    5f78:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f7a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f7e:	jmp (0,a3,d0.w)

00005f82 <lz4Rts9>:
lz4Rts9:	rts
    5f82:	rts

00005f84 <sl_sm9>:

sl_sm9:
		move.b	(a0)+,(a1)+
    5f84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f9e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5fa0:	cmpa.l a0,a4
		beq.s	lz4Rts10
    5fa2:	beq.s 5fd8 <lz4Rts10>
		move.b	(a0)+,d0
    5fa4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5fa6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fa8:	move.w (sp)+,d3
		move.b	d0,d3
    5faa:	move.b d0,d3
		move.l	a1,a2
    5fac:	movea.l a1,a2
		sub.l	d3,a2
    5fae:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5fb0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fb2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fb4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fb6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fb8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fc0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fc2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fc4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fc6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fc8:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5fca:	moveq #0,d0
		move.b	(a0)+,d0
    5fcc:	move.b (a0)+,d0
		add.w	d0,d0
    5fce:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fd0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5fd4:	jmp (0,a3,d0.w)

00005fd8 <lz4Rts10>:
lz4Rts10:	rts
    5fd8:	rts

00005fda <sl_sm10>:

sl_sm10:
		move.b	(a0)+,(a1)+
    5fda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fdc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fe0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fe2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fe4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fe6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fe8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ff0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ff2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ff4:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5ff6:	cmpa.l a0,a4
		beq.s	lz4Rts11
    5ff8:	beq.s 6030 <lz4Rts11>
		move.b	(a0)+,d0
    5ffa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5ffc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5ffe:	move.w (sp)+,d3
		move.b	d0,d3
    6000:	move.b d0,d3
		move.l	a1,a2
    6002:	movea.l a1,a2
		sub.l	d3,a2
    6004:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6006:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6008:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    600a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    600c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    600e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6010:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6012:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6014:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6016:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6018:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    601a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    601c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    601e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6020:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6022:	moveq #0,d0
		move.b	(a0)+,d0
    6024:	move.b (a0)+,d0
		add.w	d0,d0
    6026:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6028:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    602c:	jmp (0,a3,d0.w)

00006030 <lz4Rts11>:
lz4Rts11:	rts
    6030:	rts

00006032 <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    6032:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6034:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6036:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6038:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    603a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    603c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    603e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6040:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6042:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6044:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6046:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6048:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    604a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    604c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    604e:	cmpa.l a0,a4
		beq.s	lz4Rts12
    6050:	beq.s 608a <lz4Rts12>
		move.b	(a0)+,d0
    6052:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6054:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6056:	move.w (sp)+,d3
		move.b	d0,d3
    6058:	move.b d0,d3
		move.l	a1,a2
    605a:	movea.l a1,a2
		sub.l	d3,a2
    605c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    605e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6060:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6062:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6064:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6066:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6068:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    606a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    606c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    606e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6070:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6072:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6074:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6076:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6078:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    607a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    607c:	moveq #0,d0
		move.b	(a0)+,d0
    607e:	move.b (a0)+,d0
		add.w	d0,d0
    6080:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6082:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6086:	jmp (0,a3,d0.w)

0000608a <lz4Rts12>:
lz4Rts12:	rts
    608a:	rts

0000608c <sl_sm12>:

sl_sm12:
		move.b	(a0)+,(a1)+
    608c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    608e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6090:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6092:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6094:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6096:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6098:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    609a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    609c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    609e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a6:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    60a8:	cmpa.l a0,a4
		beq.s	lz4Rts13
    60aa:	beq.s 60e6 <lz4Rts13>
		move.b	(a0)+,d0
    60ac:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    60ae:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    60b0:	move.w (sp)+,d3
		move.b	d0,d3
    60b2:	move.b d0,d3
		move.l	a1,a2
    60b4:	movea.l a1,a2
		sub.l	d3,a2
    60b6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    60b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60d6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    60d8:	moveq #0,d0
		move.b	(a0)+,d0
    60da:	move.b (a0)+,d0
		add.w	d0,d0
    60dc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    60de:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60e2:	jmp (0,a3,d0.w)

000060e6 <lz4Rts13>:
lz4Rts13:	rts
    60e6:	rts

000060e8 <sl_sm13>:

sl_sm13:
		move.b	(a0)+,(a1)+
    60e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6100:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6102:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6104:	cmpa.l a0,a4
		beq.s	lz4Rts14
    6106:	beq.s 6144 <lz4Rts14>
		move.b	(a0)+,d0
    6108:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    610a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    610c:	move.w (sp)+,d3
		move.b	d0,d3
    610e:	move.b d0,d3
		move.l	a1,a2
    6110:	movea.l a1,a2
		sub.l	d3,a2
    6112:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6114:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6116:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6118:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    611a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    611c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    611e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6120:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6122:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6124:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6126:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6128:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    612a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    612c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    612e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6130:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6132:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6134:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6136:	moveq #0,d0
		move.b	(a0)+,d0
    6138:	move.b (a0)+,d0
		add.w	d0,d0
    613a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    613c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6140:	jmp (0,a3,d0.w)

00006144 <lz4Rts14>:
lz4Rts14:	rts
    6144:	rts

00006146 <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    6146:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6148:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    614a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    614c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    614e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6150:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6152:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6154:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6156:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6158:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    615a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    615c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    615e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6160:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6162:	cmpa.l a0,a4
		beq.s	lz4Rts15
    6164:	beq.s 61a4 <lz4Rts15>
		move.b	(a0)+,d0
    6166:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6168:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    616a:	move.w (sp)+,d3
		move.b	d0,d3
    616c:	move.b d0,d3
		move.l	a1,a2
    616e:	movea.l a1,a2
		sub.l	d3,a2
    6170:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6172:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6174:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6176:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6178:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    617a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    617c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    617e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6180:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6182:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6184:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6186:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6188:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    618a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    618c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    618e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6190:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6192:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6194:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6196:	moveq #0,d0
		move.b	(a0)+,d0
    6198:	move.b (a0)+,d0
		add.w	d0,d0
    619a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    619c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    61a0:	jmp (0,a3,d0.w)

000061a4 <lz4Rts15>:
lz4Rts15:	rts
    61a4:	rts

000061a6 <sl_lm>:

sl_lm:
		move.b	(a0)+,(a1)+
    61a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61c0:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    61c2:	cmpa.l a0,a4
		beq.s	lz4Rts16
    61c4:	beq.s 621a <lz4Rts16>
		move.b	(a0)+,d0
    61c6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61c8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61ca:	move.w (sp)+,d3
		move.b	d0,d3
    61cc:	move.b d0,d3
		move.l	a1,a2
    61ce:	movea.l a1,a2
		sub.l	d3,a2
    61d0:	suba.l d3,a2
		moveq	#15+4,d1
    61d2:	moveq #19,d1

000061d4 <.cl0>:
.cl0:	move.b	(a0)+,d2
    61d4:	/-> move.b (a0)+,d2
		add.l d2,d1
    61d6:	|   add.l d2,d1
		not.b	d2
    61d8:	|   not.b d2
		beq.s	.cl0
    61da:	\-- beq.s 61d4 <.cl0>
		moveq	#15,d5
    61dc:	    moveq #15,d5
		and.w	d1,d5
    61de:	    and.w d1,d5
		add.w	d5,d5
    61e0:	    add.w d5,d5
		neg.w	d5
    61e2:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    61e4:	    jmp (6208 <.eloop1>,pc,d5.w)

000061e8 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    61e8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6200:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6202:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6204:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6206:	move.b (a2)+,(a1)+

00006208 <.eloop1>:
.eloop1:	sub.l	d7,d1
    6208:	sub.l d7,d1
		bpl.s	.tloop1
    620a:	bpl.s 61e8 <.tloop1>
		moveq	#0,d0
    620c:	moveq #0,d0
		move.b	(a0)+,d0
    620e:	move.b (a0)+,d0
		add.w	d0,d0
    6210:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6212:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6216:	jmp (0,a3,d0.w)

0000621a <lz4Rts16>:
lz4Rts16:	rts
    621a:	rts

0000621c <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    621c:	moveq #15,d1

0000621e <.cl2>:
.cl2:	move.b	(a0)+,d2
    621e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6220:	|   add.l d2,d1
		not.b	d2
    6222:	|   not.b d2
		beq.s	.cl2
    6224:	\-- beq.s 621e <.cl2>
		moveq	#15,d5
    6226:	    moveq #15,d5
		and.w	d1,d5
    6228:	    and.w d1,d5
		add.w	d5,d5
    622a:	    add.w d5,d5
		neg.w	d5
    622c:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    622e:	    jmp (6252 <.eloop3>,pc,d5.w)

00006232 <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    6232:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6234:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6236:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6238:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    623a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    623c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    623e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6240:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6242:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6244:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6246:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6248:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    624a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    624c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    624e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6250:	move.b (a0)+,(a1)+

00006252 <.eloop3>:
.eloop3:	sub.l	d7,d1
    6252:	sub.l d7,d1
		bpl.s	.tloop3
    6254:	bpl.s 6232 <.tloop3>
		cmpa.l	a0,a4
    6256:	cmpa.l a0,a4
		beq.s	lz4Rts17
    6258:	beq.s 627c <lz4Rts17>
		move.b	(a0)+,d0
    625a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    625c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    625e:	move.w (sp)+,d3
		move.b	d0,d3
    6260:	move.b d0,d3
		move.l	a1,a2
    6262:	movea.l a1,a2
		sub.l	d3,a2
    6264:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6266:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6268:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    626a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    626c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    626e:	moveq #0,d0
		move.b	(a0)+,d0
    6270:	move.b (a0)+,d0
		add.w	d0,d0
    6272:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6274:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6278:	jmp (0,a3,d0.w)

0000627c <lz4Rts17>:
lz4Rts17:	rts
    627c:	rts

0000627e <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    627e:	moveq #15,d1

00006280 <.cl4>:
.cl4:	move.b	(a0)+,d2
    6280:	/-> move.b (a0)+,d2
		add.l d2,d1
    6282:	|   add.l d2,d1
		not.b	d2
    6284:	|   not.b d2
		beq.s	.cl4
    6286:	\-- beq.s 6280 <.cl4>
		moveq	#15,d5
    6288:	    moveq #15,d5
		and.w	d1,d5
    628a:	    and.w d1,d5
		add.w	d5,d5
    628c:	    add.w d5,d5
		neg.w	d5
    628e:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    6290:	    jmp (62b4 <.eloop5>,pc,d5.w)

00006294 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    6294:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6296:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6298:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    629a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    629c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    629e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62b2:	move.b (a0)+,(a1)+

000062b4 <.eloop5>:
.eloop5:	sub.l	d7,d1
    62b4:	sub.l d7,d1
		bpl.s	.tloop5
    62b6:	bpl.s 6294 <.tloop5>
		cmpa.l	a0,a4
    62b8:	cmpa.l a0,a4
		beq.s	lz4Rts18
    62ba:	beq.s 62e0 <lz4Rts18>
		move.b	(a0)+,d0
    62bc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    62be:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    62c0:	move.w (sp)+,d3
		move.b	d0,d3
    62c2:	move.b d0,d3
		move.l	a1,a2
    62c4:	movea.l a1,a2
		sub.l	d3,a2
    62c6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62d0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62d2:	moveq #0,d0
		move.b	(a0)+,d0
    62d4:	move.b (a0)+,d0
		add.w	d0,d0
    62d6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    62d8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    62dc:	jmp (0,a3,d0.w)

000062e0 <lz4Rts18>:
lz4Rts18:	rts
    62e0:	rts

000062e2 <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    62e2:	moveq #15,d1

000062e4 <.cl6>:
.cl6:	move.b	(a0)+,d2
    62e4:	/-> move.b (a0)+,d2
		add.l d2,d1
    62e6:	|   add.l d2,d1
		not.b	d2
    62e8:	|   not.b d2
		beq.s	.cl6
    62ea:	\-- beq.s 62e4 <.cl6>
		moveq	#15,d5
    62ec:	    moveq #15,d5
		and.w	d1,d5
    62ee:	    and.w d1,d5
		add.w	d5,d5
    62f0:	    add.w d5,d5
		neg.w	d5
    62f2:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    62f4:	    jmp (6318 <.eloop7>,pc,d5.w)

000062f8 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    62f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6300:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6302:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6304:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6306:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6308:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    630a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    630c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    630e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6310:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6312:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6314:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6316:	move.b (a0)+,(a1)+

00006318 <.eloop7>:
.eloop7:	sub.l	d7,d1
    6318:	sub.l d7,d1
		bpl.s	.tloop7
    631a:	bpl.s 62f8 <.tloop7>
		cmpa.l	a0,a4
    631c:	cmpa.l a0,a4
		beq.s	lz4Rts19
    631e:	beq.s 6346 <lz4Rts19>
		move.b	(a0)+,d0
    6320:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6322:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6324:	move.w (sp)+,d3
		move.b	d0,d3
    6326:	move.b d0,d3
		move.l	a1,a2
    6328:	movea.l a1,a2
		sub.l	d3,a2
    632a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    632c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    632e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6330:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6332:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6334:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6336:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6338:	moveq #0,d0
		move.b	(a0)+,d0
    633a:	move.b (a0)+,d0
		add.w	d0,d0
    633c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    633e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6342:	jmp (0,a3,d0.w)

00006346 <lz4Rts19>:
lz4Rts19:	rts
    6346:	rts

00006348 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    6348:	moveq #15,d1

0000634a <.cl8>:
.cl8:	move.b	(a0)+,d2
    634a:	/-> move.b (a0)+,d2
		add.l d2,d1
    634c:	|   add.l d2,d1
		not.b	d2
    634e:	|   not.b d2
		beq.s	.cl8
    6350:	\-- beq.s 634a <.cl8>
		moveq	#15,d5
    6352:	    moveq #15,d5
		and.w	d1,d5
    6354:	    and.w d1,d5
		add.w	d5,d5
    6356:	    add.w d5,d5
		neg.w	d5
    6358:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    635a:	    jmp (637e <.eloop9>,pc,d5.w)

0000635e <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    635e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6360:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6362:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6364:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6366:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6368:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    636a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    636c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    636e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6370:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6372:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6374:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6376:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6378:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    637a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    637c:	move.b (a0)+,(a1)+

0000637e <.eloop9>:
.eloop9:	sub.l	d7,d1
    637e:	sub.l d7,d1
		bpl.s	.tloop9
    6380:	bpl.s 635e <.tloop9>
		cmpa.l	a0,a4
    6382:	cmpa.l a0,a4
		beq.s	lz4Rts20
    6384:	beq.s 63ae <lz4Rts20>
		move.b	(a0)+,d0
    6386:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6388:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    638a:	move.w (sp)+,d3
		move.b	d0,d3
    638c:	move.b d0,d3
		move.l	a1,a2
    638e:	movea.l a1,a2
		sub.l	d3,a2
    6390:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6392:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6394:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6396:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6398:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    639a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    639c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    639e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    63a0:	moveq #0,d0
		move.b	(a0)+,d0
    63a2:	move.b (a0)+,d0
		add.w	d0,d0
    63a4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    63a6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    63aa:	jmp (0,a3,d0.w)

000063ae <lz4Rts20>:
lz4Rts20:	rts
    63ae:	rts

000063b0 <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    63b0:	moveq #15,d1

000063b2 <.cl10>:
.cl10:	move.b	(a0)+,d2
    63b2:	/-> move.b (a0)+,d2
		add.l d2,d1
    63b4:	|   add.l d2,d1
		not.b	d2
    63b6:	|   not.b d2
		beq.s	.cl10
    63b8:	\-- beq.s 63b2 <.cl10>
		moveq	#15,d5
    63ba:	    moveq #15,d5
		and.w	d1,d5
    63bc:	    and.w d1,d5
		add.w	d5,d5
    63be:	    add.w d5,d5
		neg.w	d5
    63c0:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    63c2:	    jmp (63e6 <.eloop11>,pc,d5.w)

000063c6 <.tloop11>:
.tloop11:
		move.b	(a0)+,(a1)+
    63c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63e4:	move.b (a0)+,(a1)+

000063e6 <.eloop11>:
.eloop11:	sub.l	d7,d1
    63e6:	sub.l d7,d1
		bpl.s	.tloop11
    63e8:	bpl.s 63c6 <.tloop11>
		cmpa.l	a0,a4
    63ea:	cmpa.l a0,a4
		beq.s	lz4Rts21
    63ec:	beq.s 6418 <lz4Rts21>
		move.b	(a0)+,d0
    63ee:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63f0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63f2:	move.w (sp)+,d3
		move.b	d0,d3
    63f4:	move.b d0,d3
		move.l	a1,a2
    63f6:	movea.l a1,a2
		sub.l	d3,a2
    63f8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    63fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6400:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6402:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6404:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6406:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6408:	move.b (a2)+,(a1)+
		moveq	#0,d0
    640a:	moveq #0,d0
		move.b	(a0)+,d0
    640c:	move.b (a0)+,d0
		add.w	d0,d0
    640e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6410:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6414:	jmp (0,a3,d0.w)

00006418 <lz4Rts21>:
lz4Rts21:	rts
    6418:	rts

0000641a <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    641a:	moveq #15,d1

0000641c <.cl12>:
.cl12:	move.b	(a0)+,d2
    641c:	/-> move.b (a0)+,d2
		add.l d2,d1
    641e:	|   add.l d2,d1
		not.b	d2
    6420:	|   not.b d2
		beq.s	.cl12
    6422:	\-- beq.s 641c <.cl12>
		moveq	#15,d5
    6424:	    moveq #15,d5
		and.w	d1,d5
    6426:	    and.w d1,d5
		add.w	d5,d5
    6428:	    add.w d5,d5
		neg.w	d5
    642a:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    642c:	    jmp (6450 <.eloop13>,pc,d5.w)

00006430 <.tloop13>:
.tloop13:
		move.b	(a0)+,(a1)+
    6430:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6432:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6434:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6436:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6438:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    643a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    643c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    643e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6440:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6442:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6444:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6446:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6448:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    644a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    644c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    644e:	move.b (a0)+,(a1)+

00006450 <.eloop13>:
.eloop13:	sub.l	d7,d1
    6450:	sub.l d7,d1
		bpl.s	.tloop13
    6452:	bpl.s 6430 <.tloop13>
		cmpa.l	a0,a4
    6454:	cmpa.l a0,a4
		beq.s	lz4Rts22
    6456:	beq.s 6484 <lz4Rts22>
		move.b	(a0)+,d0
    6458:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    645a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    645c:	move.w (sp)+,d3
		move.b	d0,d3
    645e:	move.b d0,d3
		move.l	a1,a2
    6460:	movea.l a1,a2
		sub.l	d3,a2
    6462:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6464:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6466:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6468:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    646a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    646c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    646e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6470:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6472:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6474:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6476:	moveq #0,d0
		move.b	(a0)+,d0
    6478:	move.b (a0)+,d0
		add.w	d0,d0
    647a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    647c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6480:	jmp (0,a3,d0.w)

00006484 <lz4Rts22>:
lz4Rts22:	rts
    6484:	rts

00006486 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    6486:	moveq #15,d1

00006488 <.cl14>:
.cl14:	move.b	(a0)+,d2
    6488:	/-> move.b (a0)+,d2
		add.l d2,d1
    648a:	|   add.l d2,d1
		not.b	d2
    648c:	|   not.b d2
		beq.s	.cl14
    648e:	\-- beq.s 6488 <.cl14>
		moveq	#15,d5
    6490:	    moveq #15,d5
		and.w	d1,d5
    6492:	    and.w d1,d5
		add.w	d5,d5
    6494:	    add.w d5,d5
		neg.w	d5
    6496:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    6498:	    jmp (64bc <.eloop15>,pc,d5.w)

0000649c <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    649c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    649e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64aa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64ba:	move.b (a0)+,(a1)+

000064bc <.eloop15>:
.eloop15:	sub.l	d7,d1
    64bc:	sub.l d7,d1
		bpl.s	.tloop15
    64be:	bpl.s 649c <.tloop15>
		cmpa.l	a0,a4
    64c0:	cmpa.l a0,a4
		beq.s	lz4Rts23
    64c2:	beq.s 64f2 <lz4Rts23>
		move.b	(a0)+,d0
    64c4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    64c6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    64c8:	move.w (sp)+,d3
		move.b	d0,d3
    64ca:	move.b d0,d3
		move.l	a1,a2
    64cc:	movea.l a1,a2
		sub.l	d3,a2
    64ce:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    64d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64e2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    64e4:	moveq #0,d0
		move.b	(a0)+,d0
    64e6:	move.b (a0)+,d0
		add.w	d0,d0
    64e8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    64ea:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    64ee:	jmp (0,a3,d0.w)

000064f2 <lz4Rts23>:
lz4Rts23:	rts
    64f2:	rts

000064f4 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    64f4:	moveq #15,d1

000064f6 <.cl16>:
.cl16:	move.b	(a0)+,d2
    64f6:	/-> move.b (a0)+,d2
		add.l d2,d1
    64f8:	|   add.l d2,d1
		not.b	d2
    64fa:	|   not.b d2
		beq.s	.cl16
    64fc:	\-- beq.s 64f6 <.cl16>
		moveq	#15,d5
    64fe:	    moveq #15,d5
		and.w	d1,d5
    6500:	    and.w d1,d5
		add.w	d5,d5
    6502:	    add.w d5,d5
		neg.w	d5
    6504:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    6506:	    jmp (652a <.eloop17>,pc,d5.w)

0000650a <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    650a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    650c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    650e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6510:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6512:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6514:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6516:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6518:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    651a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    651c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    651e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6520:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6522:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6524:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6526:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6528:	move.b (a0)+,(a1)+

0000652a <.eloop17>:
.eloop17:	sub.l	d7,d1
    652a:	sub.l d7,d1
		bpl.s	.tloop17
    652c:	bpl.s 650a <.tloop17>
		cmpa.l	a0,a4
    652e:	cmpa.l a0,a4
		beq.s	lz4Rts24
    6530:	beq.s 6562 <lz4Rts24>
		move.b	(a0)+,d0
    6532:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6534:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6536:	move.w (sp)+,d3
		move.b	d0,d3
    6538:	move.b d0,d3
		move.l	a1,a2
    653a:	movea.l a1,a2
		sub.l	d3,a2
    653c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    653e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6540:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6542:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6544:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6546:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6548:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    654a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    654c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    654e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6550:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6552:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6554:	moveq #0,d0
		move.b	(a0)+,d0
    6556:	move.b (a0)+,d0
		add.w	d0,d0
    6558:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    655a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    655e:	jmp (0,a3,d0.w)

00006562 <lz4Rts24>:
lz4Rts24:	rts
    6562:	rts

00006564 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    6564:	moveq #15,d1

00006566 <.cl18>:
.cl18:	move.b	(a0)+,d2
    6566:	/-> move.b (a0)+,d2
		add.l d2,d1
    6568:	|   add.l d2,d1
		not.b	d2
    656a:	|   not.b d2
		beq.s	.cl18
    656c:	\-- beq.s 6566 <.cl18>
		moveq	#15,d5
    656e:	    moveq #15,d5
		and.w	d1,d5
    6570:	    and.w d1,d5
		add.w	d5,d5
    6572:	    add.w d5,d5
		neg.w	d5
    6574:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    6576:	    jmp (659a <.eloop19>,pc,d5.w)

0000657a <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    657a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    657c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    657e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6580:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6582:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6584:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6586:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6588:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    658a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    658c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    658e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6590:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6592:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6594:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6596:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6598:	move.b (a0)+,(a1)+

0000659a <.eloop19>:
.eloop19:	sub.l	d7,d1
    659a:	sub.l d7,d1
		bpl.s	.tloop19
    659c:	bpl.s 657a <.tloop19>
		cmpa.l	a0,a4
    659e:	cmpa.l a0,a4
		beq.s	lz4Rts25
    65a0:	beq.s 65d4 <lz4Rts25>
		move.b	(a0)+,d0
    65a2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    65a4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    65a6:	move.w (sp)+,d3
		move.b	d0,d3
    65a8:	move.b d0,d3
		move.l	a1,a2
    65aa:	movea.l a1,a2
		sub.l	d3,a2
    65ac:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    65ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65b4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65b6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65b8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65ba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65bc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65c4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    65c6:	moveq #0,d0
		move.b	(a0)+,d0
    65c8:	move.b (a0)+,d0
		add.w	d0,d0
    65ca:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    65cc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    65d0:	jmp (0,a3,d0.w)

000065d4 <lz4Rts25>:
lz4Rts25:	rts
    65d4:	rts

000065d6 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    65d6:	moveq #15,d1

000065d8 <.cl20>:
.cl20:	move.b	(a0)+,d2
    65d8:	/-> move.b (a0)+,d2
		add.l d2,d1
    65da:	|   add.l d2,d1
		not.b	d2
    65dc:	|   not.b d2
		beq.s	.cl20
    65de:	\-- beq.s 65d8 <.cl20>
		moveq	#15,d5
    65e0:	    moveq #15,d5
		and.w	d1,d5
    65e2:	    and.w d1,d5
		add.w	d5,d5
    65e4:	    add.w d5,d5
		neg.w	d5
    65e6:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    65e8:	    jmp (660c <.eloop21>,pc,d5.w)

000065ec <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    65ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6600:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6602:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6604:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6606:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6608:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    660a:	move.b (a0)+,(a1)+

0000660c <.eloop21>:
.eloop21:	sub.l	d7,d1
    660c:	sub.l d7,d1
		bpl.s	.tloop21
    660e:	bpl.s 65ec <.tloop21>
		cmpa.l	a0,a4
    6610:	cmpa.l a0,a4
		beq.s	lz4Rts26
    6612:	beq.s 6648 <lz4Rts26>
		move.b	(a0)+,d0
    6614:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6616:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6618:	move.w (sp)+,d3
		move.b	d0,d3
    661a:	move.b d0,d3
		move.l	a1,a2
    661c:	movea.l a1,a2
		sub.l	d3,a2
    661e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6620:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6622:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6624:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6626:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6628:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    662a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    662c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    662e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6630:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6632:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6634:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6636:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6638:	move.b (a2)+,(a1)+
		moveq	#0,d0
    663a:	moveq #0,d0
		move.b	(a0)+,d0
    663c:	move.b (a0)+,d0
		add.w	d0,d0
    663e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6640:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6644:	jmp (0,a3,d0.w)

00006648 <lz4Rts26>:
lz4Rts26:	rts
    6648:	rts

0000664a <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    664a:	moveq #15,d1

0000664c <.cl22>:
.cl22:	move.b	(a0)+,d2
    664c:	/-> move.b (a0)+,d2
		add.l d2,d1
    664e:	|   add.l d2,d1
		not.b	d2
    6650:	|   not.b d2
		beq.s	.cl22
    6652:	\-- beq.s 664c <.cl22>
		moveq	#15,d5
    6654:	    moveq #15,d5
		and.w	d1,d5
    6656:	    and.w d1,d5
		add.w	d5,d5
    6658:	    add.w d5,d5
		neg.w	d5
    665a:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    665c:	    jmp (6680 <.eloop23>,pc,d5.w)

00006660 <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    6660:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6662:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6664:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6666:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6668:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    666a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    666c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    666e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6670:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6672:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6674:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6676:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6678:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    667a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    667c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    667e:	move.b (a0)+,(a1)+

00006680 <.eloop23>:
.eloop23:	sub.l	d7,d1
    6680:	sub.l d7,d1
		bpl.s	.tloop23
    6682:	bpl.s 6660 <.tloop23>
		cmpa.l	a0,a4
    6684:	cmpa.l a0,a4
		beq.s	lz4Rts27
    6686:	beq.s 66be <lz4Rts27>
		move.b	(a0)+,d0
    6688:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    668a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    668c:	move.w (sp)+,d3
		move.b	d0,d3
    668e:	move.b d0,d3
		move.l	a1,a2
    6690:	movea.l a1,a2
		sub.l	d3,a2
    6692:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6694:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6696:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6698:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    669a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    669c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    669e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66a0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66a2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66a4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ae:	move.b (a2)+,(a1)+
		moveq	#0,d0
    66b0:	moveq #0,d0
		move.b	(a0)+,d0
    66b2:	move.b (a0)+,d0
		add.w	d0,d0
    66b4:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    66b6:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    66ba:	jmp (0,a3,d0.w)

000066be <lz4Rts27>:
lz4Rts27:	rts
    66be:	rts

000066c0 <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    66c0:	moveq #15,d1

000066c2 <.cl24>:
.cl24:	move.b	(a0)+,d2
    66c2:	/-> move.b (a0)+,d2
		add.l d2,d1
    66c4:	|   add.l d2,d1
		not.b	d2
    66c6:	|   not.b d2
		beq.s	.cl24
    66c8:	\-- beq.s 66c2 <.cl24>
		moveq	#15,d5
    66ca:	    moveq #15,d5
		and.w	d1,d5
    66cc:	    and.w d1,d5
		add.w	d5,d5
    66ce:	    add.w d5,d5
		neg.w	d5
    66d0:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    66d2:	    jmp (66f6 <.eloop25>,pc,d5.w)

000066d6 <.tloop25>:
.tloop25:
		move.b	(a0)+,(a1)+
    66d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66e6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    66f4:	move.b (a0)+,(a1)+

000066f6 <.eloop25>:
.eloop25:	sub.l	d7,d1
    66f6:	sub.l d7,d1
		bpl.s	.tloop25
    66f8:	bpl.s 66d6 <.tloop25>
		cmpa.l	a0,a4
    66fa:	cmpa.l a0,a4
		beq.s	lz4Rts28
    66fc:	beq.s 6736 <lz4Rts28>
		move.b	(a0)+,d0
    66fe:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6700:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6702:	move.w (sp)+,d3
		move.b	d0,d3
    6704:	move.b d0,d3
		move.l	a1,a2
    6706:	movea.l a1,a2
		sub.l	d3,a2
    6708:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    670a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    670c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    670e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6710:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6712:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6714:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6716:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6718:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    671a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    671c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    671e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6720:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6722:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6724:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6726:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6728:	moveq #0,d0
		move.b	(a0)+,d0
    672a:	move.b (a0)+,d0
		add.w	d0,d0
    672c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    672e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6732:	jmp (0,a3,d0.w)

00006736 <lz4Rts28>:
lz4Rts28:	rts
    6736:	rts

00006738 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    6738:	moveq #15,d1

0000673a <.cl26>:
.cl26:	move.b	(a0)+,d2
    673a:	/-> move.b (a0)+,d2
		add.l d2,d1
    673c:	|   add.l d2,d1
		not.b	d2
    673e:	|   not.b d2
		beq.s	.cl26
    6740:	\-- beq.s 673a <.cl26>
		moveq	#15,d5
    6742:	    moveq #15,d5
		and.w	d1,d5
    6744:	    and.w d1,d5
		add.w	d5,d5
    6746:	    add.w d5,d5
		neg.w	d5
    6748:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    674a:	    jmp (676e <.eloop27>,pc,d5.w)

0000674e <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    674e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6750:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6752:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6754:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6756:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6758:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    675a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    675c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    675e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6760:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6762:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6764:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6766:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6768:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    676a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    676c:	move.b (a0)+,(a1)+

0000676e <.eloop27>:
.eloop27:	sub.l	d7,d1
    676e:	sub.l d7,d1
		bpl.s	.tloop27
    6770:	bpl.s 674e <.tloop27>
		cmpa.l	a0,a4
    6772:	cmpa.l a0,a4
		beq.s	lz4Rts29
    6774:	beq.s 67b0 <lz4Rts29>
		move.b	(a0)+,d0
    6776:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6778:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    677a:	move.w (sp)+,d3
		move.b	d0,d3
    677c:	move.b d0,d3
		move.l	a1,a2
    677e:	movea.l a1,a2
		sub.l	d3,a2
    6780:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6782:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6784:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6786:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6788:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    678a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    678c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    678e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6790:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6792:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6794:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6796:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6798:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    679a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    679c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    679e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67a0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    67a2:	moveq #0,d0
		move.b	(a0)+,d0
    67a4:	move.b (a0)+,d0
		add.w	d0,d0
    67a6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    67a8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    67ac:	jmp (0,a3,d0.w)

000067b0 <lz4Rts29>:
lz4Rts29:	rts
    67b0:	rts

000067b2 <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    67b2:	moveq #15,d1

000067b4 <.cl28>:
.cl28:	move.b	(a0)+,d2
    67b4:	/-> move.b (a0)+,d2
		add.l d2,d1
    67b6:	|   add.l d2,d1
		not.b	d2
    67b8:	|   not.b d2
		beq.s	.cl28
    67ba:	\-- beq.s 67b4 <.cl28>
		moveq	#15,d5
    67bc:	    moveq #15,d5
		and.w	d1,d5
    67be:	    and.w d1,d5
		add.w	d5,d5
    67c0:	    add.w d5,d5
		neg.w	d5
    67c2:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    67c4:	    jmp (67e8 <.eloop29>,pc,d5.w)

000067c8 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    67c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    67e6:	move.b (a0)+,(a1)+

000067e8 <.eloop29>:
.eloop29:	sub.l	d7,d1
    67e8:	sub.l d7,d1
		bpl.s	.tloop29
    67ea:	bpl.s 67c8 <.tloop29>
		cmpa.l	a0,a4
    67ec:	cmpa.l a0,a4
		beq.s	lz4Rts30
    67ee:	beq.s 682c <lz4Rts30>
		move.b	(a0)+,d0
    67f0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    67f2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    67f4:	move.w (sp)+,d3
		move.b	d0,d3
    67f6:	move.b d0,d3
		move.l	a1,a2
    67f8:	movea.l a1,a2
		sub.l	d3,a2
    67fa:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    67fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    67fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6800:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6802:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6804:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6806:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6808:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    680a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    680c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    680e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6810:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6812:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6814:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6816:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6818:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    681a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    681c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    681e:	moveq #0,d0
		move.b	(a0)+,d0
    6820:	move.b (a0)+,d0
		add.w	d0,d0
    6822:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6824:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6828:	jmp (0,a3,d0.w)

0000682c <lz4Rts30>:
lz4Rts30:	rts
    682c:	rts

0000682e <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    682e:	moveq #15,d1

00006830 <.cl30>:
.cl30:	move.b	(a0)+,d2
    6830:	/-> move.b (a0)+,d2
		add.l d2,d1
    6832:	|   add.l d2,d1
		not.b	d2
    6834:	|   not.b d2
		beq.s	.cl30
    6836:	\-- beq.s 6830 <.cl30>
		moveq	#15,d5
    6838:	    moveq #15,d5
		and.w	d1,d5
    683a:	    and.w d1,d5
		add.w	d5,d5
    683c:	    add.w d5,d5
		neg.w	d5
    683e:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    6840:	    jmp (6864 <.eloop31>,pc,d5.w)

00006844 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    6844:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6846:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6848:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    684a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    684c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    684e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6850:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6852:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6854:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6856:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6858:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    685a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    685c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    685e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6860:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6862:	move.b (a0)+,(a1)+

00006864 <.eloop31>:
.eloop31:	sub.l	d7,d1
    6864:	sub.l d7,d1
		bpl.s	.tloop31
    6866:	bpl.s 6844 <.tloop31>
		cmpa.l	a0,a4
    6868:	cmpa.l a0,a4
		beq.s	lz4Rts31
    686a:	beq.s 68aa <lz4Rts31>
		move.b	(a0)+,d0
    686c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    686e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6870:	move.w (sp)+,d3
		move.b	d0,d3
    6872:	move.b d0,d3
		move.l	a1,a2
    6874:	movea.l a1,a2
		sub.l	d3,a2
    6876:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6878:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    687a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    687c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    687e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6880:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6882:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6884:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6886:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6888:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    688a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    688c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    688e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6890:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6892:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6894:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6896:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6898:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    689a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    689c:	moveq #0,d0
		move.b	(a0)+,d0
    689e:	move.b (a0)+,d0
		add.w	d0,d0
    68a0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    68a2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    68a6:	jmp (0,a3,d0.w)

000068aa <lz4Rts31>:
lz4Rts31:	rts
    68aa:	rts

000068ac <ll_lm>:

ll_lm:
		moveq	#15,d1
    68ac:	moveq #15,d1

000068ae <.cl32>:
.cl32:	move.b	(a0)+,d2
    68ae:	/-> move.b (a0)+,d2
		add.l d2,d1
    68b0:	|   add.l d2,d1
		not.b	d2
    68b2:	|   not.b d2
		beq.s	.cl32
    68b4:	\-- beq.s 68ae <.cl32>
		moveq	#15,d5
    68b6:	    moveq #15,d5
		and.w	d1,d5
    68b8:	    and.w d1,d5
		add.w	d5,d5
    68ba:	    add.w d5,d5
		neg.w	d5
    68bc:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    68be:	    jmp (68e2 <.eloop33>,pc,d5.w)

000068c2 <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    68c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68c4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68c6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68c8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68ca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68cc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68dc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    68e0:	move.b (a0)+,(a1)+

000068e2 <.eloop33>:
.eloop33:	sub.l	d7,d1
    68e2:	sub.l d7,d1
		bpl.s	.tloop33
    68e4:	bpl.s 68c2 <.tloop33>
		cmpa.l	a0,a4
    68e6:	cmpa.l a0,a4
		beq.s	lz4Rts32
    68e8:	beq.s 693e <lz4Rts32>
		move.b	(a0)+,d0
    68ea:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    68ec:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    68ee:	move.w (sp)+,d3
		move.b	d0,d3
    68f0:	move.b d0,d3
		move.l	a1,a2
    68f2:	movea.l a1,a2
		sub.l	d3,a2
    68f4:	suba.l d3,a2
		moveq	#15+4,d1
    68f6:	moveq #19,d1

000068f8 <.cl34>:
.cl34:	move.b	(a0)+,d2
    68f8:	/-> move.b (a0)+,d2
		add.l d2,d1
    68fa:	|   add.l d2,d1
		not.b	d2
    68fc:	|   not.b d2
		beq.s	.cl34
    68fe:	\-- beq.s 68f8 <.cl34>
		moveq	#15,d5
    6900:	    moveq #15,d5
		and.w	d1,d5
    6902:	    and.w d1,d5
		add.w	d5,d5
    6904:	    add.w d5,d5
		neg.w	d5
    6906:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    6908:	    jmp (692c <.eloop35>,pc,d5.w)

0000690c <.tloop35>:
.tloop35:
		move.b	(a2)+,(a1)+
    690c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    690e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6910:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6912:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6914:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6916:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6918:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    691a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    691c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    691e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6920:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6922:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6924:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6926:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6928:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    692a:	move.b (a2)+,(a1)+

0000692c <.eloop35>:
.eloop35:	sub.l	d7,d1
    692c:	sub.l d7,d1
		bpl.s	.tloop35
    692e:	bpl.s 690c <.tloop35>
		moveq	#0,d0
    6930:	moveq #0,d0
		move.b	(a0)+,d0
    6932:	move.b (a0)+,d0
		add.w	d0,d0
    6934:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6936:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    693a:	jmp (0,a3,d0.w)

0000693e <lz4Rts32>:
lz4Rts32:				
			rts
    693e:	rts

00006940 <lz4Over>:

lz4Over:	rts
    6940:	rts

00006942 <lz4jmp>:
    6942:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    6944:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    6946:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    6948:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    694a:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    694c:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    694e:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    6950:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    6952:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    6954:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    6956:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    6958:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    695a:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    695c:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    695e:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    6960:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    6962:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    6964:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    6966:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    6968:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    696a:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    696c:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    696e:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    6970:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    6972:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    6974:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    6976:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    6978:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    697a:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    697c:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    697e:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    6980:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    6982:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    6984:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    6986:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    6988:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    698a:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    698c:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    698e:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    6990:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    6992:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    6994:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    6996:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    6998:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    699a:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    699c:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    699e:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    69a0:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    69a2:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    69a4:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    69a6:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    69a8:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    69aa:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    69ac:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    69ae:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    69b0:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    69b2:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    69b4:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    69b6:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    69b8:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    69ba:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    69bc:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    69be:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    69c0:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    69c2:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    69c4:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    69c6:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    69c8:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    69ca:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    69cc:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    69ce:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    69d0:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    69d2:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    69d4:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    69d6:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    69d8:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    69da:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    69dc:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    69de:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    69e0:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    69e2:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    69e4:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    69e6:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    69e8:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    69ea:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    69ec:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    69ee:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    69f0:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    69f2:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    69f4:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    69f6:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    69f8:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    69fa:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    69fc:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    69fe:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    6a00:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    6a02:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    6a04:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    6a06:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    6a08:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    6a0a:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    6a0c:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    6a0e:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    6a10:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    6a12:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    6a14:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    6a16:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    6a18:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    6a1a:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    6a1c:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    6a1e:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    6a20:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    6a22:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    6a24:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    6a26:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    6a28:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    6a2a:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    6a2c:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    6a2e:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    6a30:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    6a32:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    6a34:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    6a36:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    6a38:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    6a3a:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    6a3c:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    6a3e:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    6a40:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    6a42:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    6a44:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    6a46:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    6a48:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    6a4a:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    6a4c:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    6a4e:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    6a50:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    6a52:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    6a54:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    6a56:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    6a58:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    6a5a:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    6a5c:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    6a5e:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    6a60:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    6a62:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    6a64:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    6a66:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    6a68:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    6a6a:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    6a6c:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    6a6e:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    6a70:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    6a72:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    6a74:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    6a76:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    6a78:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    6a7a:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    6a7c:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    6a7e:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    6a80:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    6a82:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    6a84:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    6a86:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    6a88:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    6a8a:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    6a8c:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    6a8e:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    6a90:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    6a92:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    6a94:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    6a96:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    6a98:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    6a9a:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    6a9c:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    6a9e:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    6aa0:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    6aa2:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6aa4:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6aa6:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6aa8:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6aaa:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6aac:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    6aae:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    6ab0:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    6ab2:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6ab4:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6ab6:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6ab8:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6aba:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6abc:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    6abe:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    6ac0:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    6ac2:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6ac4:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6ac6:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6ac8:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6aca:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6acc:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    6ace:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    6ad0:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    6ad2:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6ad4:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6ad6:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6ad8:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6ada:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6adc:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    6ade:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    6ae0:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    6ae2:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6ae4:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6ae6:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6ae8:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6aea:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6aec:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    6aee:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    6af0:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    6af2:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    6af4:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    6af6:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    6af8:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    6afa:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    6afc:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    6afe:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    6b00:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    6b02:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    6b04:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    6b06:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    6b08:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    6b0a:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    6b0c:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    6b0e:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    6b10:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    6b12:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    6b14:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    6b16:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    6b18:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    6b1a:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    6b1c:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    6b1e:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    6b20:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    6b22:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    6b24:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    6b26:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    6b28:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    6b2a:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    6b2c:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    6b2e:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    6b30:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    6b32:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    6b34:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    6b36:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    6b38:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    6b3a:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    6b3c:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    6b3e:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    6b40:	.short 0xff6a

Disassembly of section CODE:

00006b42 <P61B>:

	endc	;ifne asmonereport

P61B:
P61_motuuli:
	jmp P61_Init(PC)
    6b42:	jmp 6ba0 <_P61_Init>(pc)

	ifeq p61cia
	jmp P61_Music(PC)
	else
	rts
    6b46:	rts
	rts
    6b48:	rts
	endc

	jmp P61_End(PC)
    6b4a:	jmp 6e72 <_P61_End>(pc)

	rts				;no P61_SetRepeat
    6b4e:	rts
	rts
    6b50:	rts

	ifne p61jump
	jmp P61_SetPosition(PC)
	else
	rts
    6b52:	rts
	rts
    6b54:	rts

00006b56 <P61_Master>:
    6b56:	Address 0x6b58 is out of bounds.


00006b58 <P61_Tempo>:
    6b58:	Address 0x6b5a is out of bounds.


00006b5a <P61_Play>:
    6b5a:	Address 0x6b5c is out of bounds.


00006b5c <P61_E8>:
	...

00006b5e <P61_VBR>:
    6b5e:	ori.b #0,d0

00006b62 <P61_Pos>:
	...

00006b64 <P61_Patt>:
	...

00006b66 <P61_CRow>:
	...

00006b68 <P61_Temp0Offset>:
    6b68:	ori.b #-124,d0

00006b6c <P61_Temp1Offset>:
    6b6c:	ori.b #-60,d0

00006b70 <P61_Temp2Offset>:
    6b70:	ori.b #4,d0

00006b74 <P61_Temp3Offset>:
    6b74:	ori.b #68,d0

00006b78 <P61_intti>:
.nonote:
	endm
	ifeq p61system
	ifne p61cia
P61_intti:
	movem.l d0-a6,-(sp)
    6b78:	movem.l d0-a6,-(sp)
	tst.b $bfdd00
    6b7c:	tst.b bfdd00 <_end+0xb73eb0>
	lea $dff000+C,a6
    6b82:	lea dff000 <_end+0xd751b0>,a6
	move #$2000,$9c-C(a6)
    6b88:	move.w #8192,156(a6)
	move #$2000,$9c-C(a6)
    6b8e:	move.w #8192,156(a6)
	bsr P61_Music
    6b94:	bsr.w 6ed8 <_P61_Music>
	movem.l (sp)+,d0-a6
    6b98:	movem.l (sp)+,d0-a6
	nop
    6b9c:	nop
	rte
    6b9e:	rte

00006ba0 <_P61_Init>:
* Returns:	D0=0 if okay (i.e. P61 module!). No need to change D0.l.
* NOTE: the define 'start' has been made runtime. move.w #<startpos>,P61_InitPos instead.

_P61_Init:
P61_Init:
	lea $dff000+C,a6
    6ba0:	    lea dff000 <_end+0xd751b0>,a6
	addq.w #4,a5
	dbf d5,.choffl
	endc
	endc

	cmp.l #"P61A",(a0)+
    6ba6:	    cmpi.l #1345728833,(a0)+
	beq.b .modok
    6bac:	/-- beq.s 6bb0 <_P61_Init+0x10>
	subq.l #4,a0
    6bae:	|   subq.l #4,a0
.modok:
	ifne p61cia
	move d0,-(sp)
    6bb0:	\-> move.w d0,-(sp)
	endc
	moveq #0,d0
    6bb2:	    moveq #0,d0
	cmp.l d0,a1
    6bb4:	    cmpa.l d0,a1
	bne.b .redirect
    6bb6:	/-- bne.s 6bbe <_P61_Init+0x1e>
	move (a0),d0
    6bb8:	|   move.w (a0),d0
	lea (a0,d0.l),a1
    6bba:	|   lea (0,a0,d0.l),a1
.redirect:
	move.l a2,a6
    6bbe:	\-> movea.l a2,a6
	lea 8(a0),a2
    6bc0:	    lea 8(a0),a2
	moveq #$40,d0
    6bc4:	    moveq #64,d0
	and.b 3(a0),d0
    6bc6:	    and.b 3(a0),d0
	bne.b .buffer
    6bca:	/-- bne.s 6bd0 <_P61_Init+0x30>
	move.l a1,a6
    6bcc:	|   movea.l a1,a6
	subq.l #4,a2
    6bce:	|   subq.l #4,a2
.buffer:

	lea P61_cn(pc),a3
    6bd0:	\-> lea 75c6 <P61_cn>(pc),a3

	move.w #$ff00,d1
    6bd4:	    move.w #-256,d1
	move.w d1,P61_OnOff+P61_temp0-P61_cn(a3)	;stop active decsteps
    6bd8:	    move.w d1,-248(a3)
	move.w d1,P61_OnOff+P61_temp1-P61_cn(a3)
    6bdc:	    move.w d1,-184(a3)
	move.w d1,P61_OnOff+P61_temp2-P61_cn(a3)
    6be0:	    move.w d1,-120(a3)
	move.w d1,P61_OnOff+P61_temp3-P61_cn(a3)
    6be4:	    move.w d1,-56(a3)

	ifne copdma
	move.l a4,p61_DMApokeAddr-P61_cn(a3)
	endc

	moveq #$1f,d1
    6be8:	    moveq #31,d1
	and.b 3(a0),d1
    6bea:	    and.b 3(a0),d1
	move.l a0,-(sp)
    6bee:	    move.l a0,-(sp)
;;    ---  insert pan/echo in this loop  ---
	lea P61_samples(pc),a4
    6bf0:	    lea 763c <P61_samples>(pc),a4
	subq #1,d1
    6bf4:	    subq.w #1,d1
	moveq #0,d4
    6bf6:	    moveq #0,d4

00006bf8 <P61_lopos>:
P61_lopos:
	move.l a6,(a4)+
    6bf8:	move.l a6,(a4)+
	move (a2)+,d4
    6bfa:	move.w (a2)+,d4
	bpl.b P61_kook
    6bfc:	bpl.s 6c18 <P61_kook>
	neg d4
    6bfe:	neg.w d4
	lea P61_samples-16(pc),a5
    6c00:	lea 762c <P61_timers>(pc),a5
	ifeq opt020
	asl #4,d4
    6c04:	asl.w #4,d4
	move.l (a5,d4),d6
    6c06:	move.l (0,a5,d4.w),d6
	else
	add d4,d4
	move.l (a5,d4*8),d6
	endc
	move.l d6,-4(a4)
    6c0a:	move.l d6,-4(a4)
	ifeq opt020
	move 4(a5,d4),d4
    6c0e:	move.w (4,a5,d4.w),d4
	else
	move 4(a5,d4*8),d4
	endc
	sub.l d4,a6
    6c12:	suba.l d4,a6
	sub.l d4,a6
    6c14:	suba.l d4,a6
	bra.b P61_jatk
    6c16:	bra.s 6c3e <P61_jatk>

00006c18 <P61_kook>:
P61_kook:
	move.l a6,d6
    6c18:	    move.l a6,d6
	tst.b 3(a0)
    6c1a:	    tst.b 3(a0)
	bpl.b P61_jatk
    6c1e:	    bpl.s 6c3e <P61_jatk>
	tst.b (a2)
    6c20:	    tst.b (a2)
	bmi.b P61_jatk
    6c22:	    bmi.s 6c3e <P61_jatk>
	move d4,d0
    6c24:	    move.w d4,d0
	subq #2,d0
    6c26:	    subq.w #2,d0
	bmi.b P61_jatk
    6c28:	    bmi.s 6c3e <P61_jatk>
	move.l a1,a5
    6c2a:	    movea.l a1,a5
	move.b (a5)+,d2
    6c2c:	    move.b (a5)+,d2
	sub.b (a5),d2
    6c2e:	    sub.b (a5),d2
	move.b d2,(a5)+
    6c30:	    move.b d2,(a5)+
.loop:sub.b (a5),d2
    6c32:	/-> sub.b (a5),d2
	move.b d2,(a5)+
    6c34:	|   move.b d2,(a5)+
	sub.b (a5),d2
    6c36:	|   sub.b (a5),d2
	move.b d2,(a5)+
    6c38:	|   move.b d2,(a5)+
	dbf d0,.loop
    6c3a:	\-- dbf d0,6c32 <P61_kook+0x1a>

00006c3e <P61_jatk>:
P61_jatk:
	move d4,(a4)+
    6c3e:	    move.w d4,(a4)+
	moveq #0,d2
    6c40:	    moveq #0,d2
	move.b (a2)+,d2
    6c42:	    move.b (a2)+,d2
	moveq #0,d3
    6c44:	    moveq #0,d3
	move.b (a2)+,d3
    6c46:	    move.b (a2)+,d3
	moveq #0,d0
    6c48:	    moveq #0,d0
	move (a2)+,d0
    6c4a:	    move.w (a2)+,d0
	bmi.b .norepeat
    6c4c:	/-- bmi.s 6c5e <P61_jatk+0x20>
	move d4,d5
    6c4e:	|   move.w d4,d5
	sub d0,d5
    6c50:	|   sub.w d0,d5
	move.l d6,a5
    6c52:	|   movea.l d6,a5
	add.l d0,a5
    6c54:	|   adda.l d0,a5
	add.l d0,a5
    6c56:	|   adda.l d0,a5
	move.l a5,(a4)+
    6c58:	|   move.l a5,(a4)+
	move d5,(a4)+
    6c5a:	|   move.w d5,(a4)+
	bra.b P61_gene
    6c5c:	|   bra.s 6c64 <P61_gene>
.norepeat:
	move.l d6,(a4)+
    6c5e:	\-> move.l d6,(a4)+
	move #1,(a4)+
    6c60:	    move.w #1,(a4)+

00006c64 <P61_gene>:
P61_gene:
	move d3,(a4)+
    6c64:	             move.w d3,(a4)+
	moveq #$f,d0
    6c66:	             moveq #15,d0
	and d2,d0
    6c68:	             and.w d2,d0
	mulu #74,d0
    6c6a:	             mulu.w #74,d0
	move d0,(a4)+
    6c6e:	             move.w d0,(a4)+
	tst -6(a2)
    6c70:	             tst.w -6(a2)
	bmi.b .nobuffer
    6c74:	/----------- bmi.s 6cc0 <P61_gene+0x5c>
	moveq #$40,d0
    6c76:	|            moveq #64,d0
	and.b 3(a0),d0
    6c78:	|            and.b 3(a0),d0
	beq.b .nobuffer
    6c7c:	+----------- beq.s 6cc0 <P61_gene+0x5c>
	move d4,d7
    6c7e:	|            move.w d4,d7
	tst.b d2
    6c80:	|            tst.b d2
	bpl.b .copy
    6c82:	|     /----- bpl.s 6ca4 <P61_gene+0x40>
	subq #1,d7
    6c84:	|     |      subq.w #1,d7
	moveq #0,d5
    6c86:	|     |      moveq #0,d5
	moveq #0,d4
    6c88:	|     |      moveq #0,d4
.lo:	move.b (a1)+,d4
    6c8a:	|     |  /-> move.b (a1)+,d4
	moveq #$f,d3
    6c8c:	|     |  |   moveq #15,d3
	and d4,d3
    6c8e:	|     |  |   and.w d4,d3
	lsr #4,d4
    6c90:	|     |  |   lsr.w #4,d4
	sub.b .table(pc,d4),d5
    6c92:	|     |  |   sub.b (6cb0 <P61_gene+0x4c>,pc,d4.w),d5
	move.b d5,(a6)+
    6c96:	|     |  |   move.b d5,(a6)+
	sub.b .table(pc,d3),d5
    6c98:	|     |  |   sub.b (6cb0 <P61_gene+0x4c>,pc,d3.w),d5
	move.b d5,(a6)+
    6c9c:	|     |  |   move.b d5,(a6)+
	dbf d7,.lo
    6c9e:	|     |  \-- dbf d7,6c8a <P61_gene+0x26>
	bra.b .kop
    6ca2:	|  /--|----- bra.s 6cc8 <P61_gene+0x64>
.copy:
	add d7,d7
    6ca4:	|  |  \----> add.w d7,d7
	subq #1,d7
    6ca6:	|  |         subq.w #1,d7
.cob:
	move.b (a1)+,(a6)+
    6ca8:	|  |     /-> move.b (a1)+,(a6)+
	dbf d7,.cob
    6caa:	|  |     \-- dbf d7,6ca8 <P61_gene+0x44>
	bra.b .kop
    6cae:	|  +-------- bra.s 6cc8 <P61_gene+0x64>
    6cb0:	|  |         ori.b #4,d1
    6cb4:	|  |         btst #64,(a0)
    6cb8:	|  |         divu.w d0,d0
    6cba:	|  |         asr.w (-4,a0,sp.l)
    6cbe:	|  |         .short 0xfeff
.table:
	dc.b 0,1,2,4,8,16,32,64,128,-64,-32,-16,-8,-4,-2,-1
.nobuffer:
	move.l d4,d6
    6cc0:	\--|-------> move.l d4,d6
	add.l d6,d6
    6cc2:	   |         add.l d6,d6
	add.l d6,a6
    6cc4:	   |         adda.l d6,a6
	add.l d6,a1
    6cc6:	   |         adda.l d6,a1
.kop:
	dbf d1,P61_lopos
    6cc8:	   \-------> dbf d1,6bf8 <P61_lopos>
	move.l (sp)+,a0
    6ccc:	             movea.l (sp)+,a0
	and.b #$7f,3(a0)
    6cce:	             andi.b #127,3(a0)
	move.l a2,-(sp)
    6cd4:	             move.l a2,-(sp)
	lea P61_temp0(pc),a1
    6cd6:	             lea 74c6 <P61_temp0>(pc),a1
	lea P61_temp1(pc),a2
    6cda:	             lea 7506 <P61_temp1>(pc),a2
	lea P61_temp2(pc),a4
    6cde:	             lea 7546 <P61_temp2>(pc),a4
	lea P61_temp3(pc),a5
    6ce2:	             lea 7586 <P61_temp3>(pc),a5
	moveq #Channel_Block_Size/2-2,d0
    6ce6:	             moveq #30,d0
	moveq #0,d1
    6ce8:	             moveq #0,d1
.cl:	move d1,(a1)+
    6cea:	         /-> move.w d1,(a1)+
	move d1,(a2)+
    6cec:	         |   move.w d1,(a2)+
	move d1,(a4)+
    6cee:	         |   move.w d1,(a4)+
	move d1,(a5)+
    6cf0:	         |   move.w d1,(a5)+
	dbf d0,.cl
    6cf2:	         \-- dbf d0,6cea <P61_gene+0x86>
	lea P61_temp0-P61_cn(a3),a1
    6cf6:	             lea -256(a3),a1
	lea P61_emptysample-P61_cn(a3),a2
    6cfa:	             lea 614(a3),a2
	moveq #channels-1,d0
    6cfe:	             moveq #3,d0
.loo:
	move.l a2,P61_Sample(a1)
    6d00:	         /-> move.l a2,4(a1)
	lea Channel_Block_Size(a1),a1
    6d04:	         |   lea 64(a1),a1
	dbf d0,.loo
    6d08:	         \-- dbf d0,6d00 <P61_gene+0x9c>
	move.l (sp)+,a2
    6d0c:	             movea.l (sp)+,a2
	move.l a2,P61_positionbase-P61_cn(a3)
    6d0e:	             move.l a2,630(a3)
	moveq #$7f,d1
    6d12:	             moveq #127,d1
	and.b 2(a0),d1
    6d14:	             and.b 2(a0),d1
	ifeq opt020
	lsl #3,d1
    6d18:	             lsl.w #3,d1
	lea (a2,d1.l),a4
    6d1a:	             lea (0,a2,d1.l),a4
	else
	lea (a2,d1.l*8),a4
	endc
	move.l a4,P61_possibase-P61_cn(a3)	;base to pos. indices.
    6d1e:	             move.l a4,634(a3)
	move.l a4,a1
    6d22:	             movea.l a4,a1
	moveq #-1,d0
    6d24:	             moveq #-1,d0
.search:
	cmp.b (a1)+,d0
    6d26:	         /-> cmp.b (a1)+,d0
	bne.b .search
    6d28:	         \-- bne.s 6d26 <P61_gene+0xc2>
	move.l a1,P61_patternbase-P61_cn(a3)
    6d2a:	             move.l a1,638(a3)
	move.l a1,d0
    6d2e:	             move.l a1,d0
	sub.l a4,d0
    6d30:	             sub.l a4,d0
	subq.w #1,d0			;this is the * BUGFIX! whoa!
    6d32:	             subq.w #1,d0
	move d0,P61_slen-P61_cn(a3)
    6d34:	             move.w d0,80(a3)
;;    ---  Bugfix: P61_Init gives P61_slen=actual songlength +1.
;;    ---  This did not affect NextPattern, because it looks for endbyte flag.
;;    ---  It did affect Bxx/Dxx, but I guess nobody has tried to jump or 
;;    ---  break to Last Pattern, ever. Now fixed to set correct SLen and 
;;    ---  suddenly Bxx/Dxx/Setposition works as they should. //Photon
	add.w P61_InitPos(pc),a4	;position from which to start playing the song
    6d38:	             adda.w 784c <P61_InitPos>(pc),a4

	moveq #0,d0
    6d3c:	             moveq #0,d0
	move.b (a4)+,d0
    6d3e:	             move.b (a4)+,d0
	move.l a4,P61_spos-P61_cn(a3)
    6d40:	             move.l a4,88(a3)
	lsl #3,d0
    6d44:	             lsl.w #3,d0
	add.l d0,a2
    6d46:	             adda.l d0,a2
	move.l a1,a4
    6d48:	             movea.l a1,a4
	moveq #0,d0	;hi word must be clear to manage >32K of patterns
    6d4a:	             moveq #0,d0
	move (a2)+,d0	;and no movem-signextend. This code is correct.
    6d4c:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6d4e:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp0-P61_cn(a3)
    6d52:	             move.l a1,-246(a3)
	move (a2)+,d0
    6d56:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6d58:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp1-P61_cn(a3)
    6d5c:	             move.l a1,-182(a3)
	move (a2)+,d0
    6d60:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6d62:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp2-P61_cn(a3)
    6d66:	             move.l a1,-118(a3)
	move (a2)+,d0
    6d6a:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6d6c:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp3-P61_cn(a3)
    6d70:	             move.l a1,-54(a3)

	ifeq nowaveforms
	lea P61_setrepeat(pc),a0
    6d74:	             lea 7466 <P61_setrepeat>(pc),a0
	move.l a0,P61_intaddr-P61_cn(a3)
    6d78:	             move.l a0,642(a3)
	endc

	move #63,P61_rowpos-P61_cn(a3)
    6d7c:	             move.w #63,78(a3)
	move #6,P61_speed-P61_cn(a3)
    6d82:	             move.w #6,82(a3)
	move #5,P61_speed2-P61_cn(a3)
    6d88:	             move.w #5,84(a3)
	clr P61_speedis1-P61_cn(a3)
    6d8e:	             clr.w 86(a3)
	endc
	ifne P61_pde
	clr P61_pdelay-P61_cn(a3)
	clr P61_pdflag-P61_cn(a3)
	endc
	clr (a3)		;start frame of very first song note.
    6d92:	             clr.w (a3)
;"reused" patterns with effects coming out of nowhere
;at start of song require 0. Otherwise F0x speed-2 is 
;ok, except if split4=1, set to F-speed - #channels.
;Don't change if you don't need 'the very quickest click to start' speed.
	moveq #2,d0
    6d94:	             moveq #2,d0
	and.b $bfe001,d0
    6d96:	             and.b bfe001 <_end+0xb741b1>,d0
	move.b d0,P61_ofilter-P61_cn(a3)
    6d9c:	             move.b d0,100(a3)
	bset #1,$bfe001
    6da0:	             bset #1,bfe001 <_end+0xb741b1>
	lea P61_liko(pc),a5
	jsr -$1e(a6)
.no68010:
	move.l d0,P61_VBR-P61_cn(a3)
	endc
	move.l P61_VBR-P61_cn(a3),a0
    6da8:	             movea.l -2664(a3),a0
	lea $78(a0),a0
    6dac:	             lea 120(a0),a0
	move.l a0,P61_vektori-P61_cn(a3)
    6db0:	             move.l a0,92(a3)
	move.l (a0),P61_oldlev6-P61_cn(a3)
    6db4:	             move.l (a0),96(a3)
	ifeq copdma
	lea P61_dmason(pc),a1		;set 'dma-on-interrupt'.
    6db8:	             lea 7430 <P61_dmason>(pc),a1
	move.l a1,(a0)
    6dbc:	             move.l a1,(a0)
	endc
	endc
	moveq #$f,d0
    6dbe:	             moveq #15,d0
	lea $dff000+C,a6		;a6 trashed above.
    6dc0:	             lea dff000 <_end+0xd751b0>,a6
	ifeq quietstart
	moveq #$0,d1			;original code
    6dc6:	             moveq #0,d1
	move d1,$a8-C(a6)
    6dc8:	             move.w d1,168(a6)
	move d1,$b8-C(a6)
    6dcc:	             move.w d1,184(a6)
	move d1,$c8-C(a6)
    6dd0:	             move.w d1,200(a6)
	move d1,$d8-C(a6)
    6dd4:	             move.w d1,216(a6)
	move d0,$96-C(a6)
    6dd8:	             move.w d0,150(a6)
	move.w d0,P61_NewDMA-P61_cn(a3)	;"NEXTframe setloop" to be triggered
	endc

	ifeq p61system
	ifeq copdma
	lea P61_dmason(pc),a1		;again?
    6ddc:	             lea 7430 <P61_dmason>(pc),a1
	move.l a1,(a0)
    6de0:	             move.l a1,(a0)
	endc
	move #$2000,$9a-C(a6)		;old timerb OFF
    6de2:	             move.w #8192,154(a6)
	lea $bfd000,a0
    6de8:	             lea bfd000 <_end+0xb731b0>,a0
	lea P61_timers(pc),a1
    6dee:	             lea 762c <P61_timers>(pc),a1
	move.b #$7f,$d00(a0)
    6df2:	             move.b #127,3328(a0)

	ifne p61cia			;only affect cia if actually used
	move.b #$10,$e00(a0)
    6df8:	             move.b #16,3584(a0)
	endc
	move.b #$10,$f00(a0)
    6dfe:	             move.b #16,3840(a0)
	ifne p61cia
	move.b $400(a0),(a1)+
    6e04:	             move.b 1024(a0),(a1)+
	move.b $500(a0),(a1)+
    6e08:	             move.b 1280(a0),(a1)+
	else
	addq.w #2,a1	
	endc

	move.b $600(a0),(a1)+
    6e0c:	             move.b 1536(a0),(a1)+
	move.b $700(a0),(a1)
    6e10:	             move.b 1792(a0),(a1)
	endc
	ifeq (p61system+p61cia)
	move.b #$82,$d00(a0)
	endc
	ifne p61cia
	move (sp)+,d0
    6e14:	             move.w (sp)+,d0
	subq #1,d0
    6e16:	             subq.w #1,d0
	beq.b P61_ForcePAL
    6e18:	             beq.s 6e1e <P61_ForcePAL>
	subq #1,d0
    6e1a:	             subq.w #1,d0
	beq.b P61_NTSC
    6e1c:	             beq.s 6e26 <P61_NTSC>

00006e1e <P61_ForcePAL>:
	move.l 4.w,a1
	cmp.b #60,$213(a1)
	beq.b P61_NTSC
	endc
P61_ForcePAL:
	move.l #1773447,d0
    6e1e:	move.l #1773447,d0
	bra.b P61_setcia
    6e24:	bra.s 6e2c <P61_setcia>

00006e26 <P61_NTSC>:
P61_NTSC:
	move.l #1789773,d0
    6e26:	move.l #1789773,d0

00006e2c <P61_setcia>:
P61_setcia:
	move.l d0,P61_timer-P61_cn(a3)
    6e2c:	move.l d0,114(a3)
	divu #125,d0
    6e30:	divu.w #125,d0
	move d0,P61_thi2-P61_cn(a3)
    6e34:	move.w d0,112(a3)
	sub #$1f0*2,d0
    6e38:	sub.w #992,d0
	move d0,P61_thi-P61_cn(a3)
    6e3c:	move.w d0,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d0
    6e40:	move.w 112(a3),d0
	move.b d0,$400(a0)
    6e44:	move.b d0,1024(a0)
	lsr #8,d0
    6e48:	lsr.w #8,d0
	move.b d0,$500(a0)
    6e4a:	move.b d0,1280(a0)
	lea P61_intti(pc),a1
    6e4e:	lea 6b78 <P61_intti>(pc),a1
	move.l a1,P61_tintti-P61_cn(a3)
    6e52:	move.l a1,106(a3)
	move.l P61_vektori(pc),a2
    6e56:	movea.l 7622 <P61_vektori>(pc),a2
	move.l a1,(a2)
    6e5a:	move.l a1,(a2)
	move.b #$83,$d00(a0)
    6e5c:	move.b #-125,3328(a0)
	move.b #$11,$e00(a0)
    6e62:	move.b #17,3584(a0)
	endc
	endc

	ifeq p61system
	ifeq copdma
	move #$e000,$9a-C(a6)	;level 6 timer B int, at least for setloop
    6e68:	move.w #-8192,154(a6)
	endc
	ifne quietstart
	move.w #$800f,$96-C(A6)	;make all used channels start a quiet loop.
	endc

	moveq #0,d0
    6e6e:	moveq #0,d0
	rts
    6e70:	rts

00006e72 <_P61_End>:
* Input:	none.
* Uses:		D0-D1/A0-A1/A3/A6, A6 set to $dff000+C (your custombase) at exit.

_P61_End:
P61_End:
	lea $dff000+C,a6
    6e72:	lea dff000 <_end+0xd751b0>,a6
	moveq #0,d0
    6e78:	moveq #0,d0
	move d0,$a8-C(a6)
    6e7a:	move.w d0,168(a6)
	move d0,$b8-C(a6)
    6e7e:	move.w d0,184(a6)
	move d0,$c8-C(a6)
    6e82:	move.w d0,200(a6)
	move d0,$d8-C(a6)
    6e86:	move.w d0,216(a6)
	move #$f,$96-C(a6)
    6e8a:	move.w #15,150(a6)
	and.b #%11111101,$bfe001
    6e90:	andi.b #-3,bfe001 <_end+0xb741b1>
	move.b P61_ofilter(pc),d0
    6e98:	move.b 762a <P61_ofilter>(pc),d0
	or.b d0,$bfe001
    6e9c:	or.b d0,bfe001 <_end+0xb741b1>
	ifeq p61system
	move #$2000,$9a-C(a6)
    6ea2:	move.w #8192,154(a6)
	move.l P61_vektori(pc),a0
    6ea8:	movea.l 7622 <P61_vektori>(pc),a0
	move.l P61_oldlev6(pc),(a0)
    6eac:	move.l 7626 <P61_oldlev6>(pc),(a0)
	lea $bfd000,a0
    6eb0:	lea bfd000 <_end+0xb731b0>,a0
	lea P61_timers(pc),a1
    6eb6:	lea 762c <P61_timers>(pc),a1

	ifne p61cia			;only affect cia if used
	move.b (a1)+,$400(a0)
    6eba:	move.b (a1)+,1024(a0)
	move.b (a1)+,$500(a0)
    6ebe:	move.b (a1)+,1280(a0)
	else
	addq.w #2,a1
	endc
	move.b (a1)+,$600(a0)
    6ec2:	move.b (a1)+,1536(a0)
	move.b (a1)+,$700(a0)
    6ec6:	move.b (a1)+,1792(a0)
	ifne p61cia
	move.b #$10,$e00(a0)
    6eca:	move.b #16,3584(a0)
	endc

	move.b #$10,$f00(a0)
    6ed0:	move.b #16,3840(a0)
	jsr -$150(a6)
	st P61_sigbit-P61_cn(a3)
P61_rem3:
	move.l (sp)+,a6
	endc
	rts
    6ed6:	rts

00006ed8 <_P61_Music>:
********** Main entry point from CIA/VB int or frame loop **********
* Input:	A6=your custombase ("$dff000")
* Uses:		D0-A7, A6 set to $dff000+C (your custombase) at exit.
_P61_Music:
P61_Music:
	lea P61_cn(pc),a3
    6ed8:	lea 75c6 <P61_cn>(pc),a3
	moveq #0,d7			;replaced clr.* with move.* d7,
    6edc:	moveq #0,d7
	lea $a0-C(a6),a4		;Aud Chan Base.
    6ede:	lea 160(a6),a4

00006ee2 <P61_ohitaaa>:
	rts
	endc

P61_ohitaaa:
	ifne visuctrs				;easy visualizer counters.
	addq.w #1,P61_visuctr0-P61_cn(a3)	;inc elapsed #calls since last
    6ee2:	addq.w #1,650(a3)
	addq.w #1,P61_visuctr1-P61_cn(a3)
    6ee6:	addq.w #1,652(a3)
	addq.w #1,P61_visuctr2-P61_cn(a3)
    6eea:	addq.w #1,654(a3)
	addq.w #1,P61_visuctr3-P61_cn(a3)
    6eee:	addq.w #1,656(a3)
	
	ifne p61fade
	pea P61_mfade(pc)
	endc

	move.w (a3),d4
    6ef2:	move.w (a3),d4
	cmp.w P61_speed2(pc),d4	;Really compares with P61_speed, 1 added later.
    6ef4:	cmp.w 761a <P61_speed2>(pc),d4
	beq.w P61_playtime	;if new note frame, handle
    6ef8:	beq.w 721c <P61_playtime>

00006efc <P61_nowrap>:
	move d0,P61_CRow-P61_cn(a3)
	endc
;;    ---  end of rolled over code  ---

P61_nowrap:
	addq.w #1,d4			;NOW I do!
    6efc:	addq.w #1,d4
	move d4,(a3)
    6efe:	move.w d4,(a3)

00006f00 <P61_delay>:
	move.b P61_tlo2(pc),(a0)
	move.b P61_thi2(pc),$100(a0)
	endc
	endc
********** mainfx handling **********
	lea P61_temp0(pc),a5
    6f00:	lea 74c6 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    6f04:	moveq #3,d5

00006f06 <P61_lopas>:
P61_lopas:
	tst.b P61_OnOff+1(a5)
    6f06:	tst.b 9(a5)
	beq.w P61_contfxdone
    6f0a:	beq.w 6f76 <P61_contfxdone>
	moveq #$f,d0
    6f0e:	moveq #15,d0
	and (a5),d0
    6f10:	and.w (a5),d0
	ifeq opt020
	add d0,d0
    6f12:	add.w d0,d0
	move P61_jtab2(pc,d0),d0
    6f14:	move.w (6f1c <P61_jtab2>,pc,d0.w),d0
	else
	move P61_jtab2(pc,d0*2),d0
	endc
	jmp P61_jtab2(pc,d0)
    6f18:	jmp (6f1c <P61_jtab2>,pc,d0.w)

00006f1c <P61_jtab2>:
    6f1c:	ori.w #90,(a2)+
    6f20:	ori.w #90,(a2)+
    6f24:	ori.w #90,(a2)+
    6f28:	ori.w #90,(a2)+
    6f2c:	ori.w #90,(a2)+
    6f30:	ori.b #90,-(a0)
    6f34:	ori.w #90,(a2)+
    6f38:	ori.w #90,(a2)+

00006f3c <P61_volslide>:
	bra.w P61_contfxdone
	endc
;;    ---  period table move to before P61_cn  ---
	ifne P61_vs
P61_volslide:
	move.b P61_Info(a5),d0
    6f3c:	    move.b 2(a5),d0
	sub.b d0,P61_Volume+1(a5)
    6f40:	    sub.b d0,25(a5)
	bpl.b .test
    6f44:	/-- bpl.s 6f52 <P61_volslide+0x16>
	move d7,P61_Volume(a5)
    6f46:	|   move.w d7,24(a5)
	ifeq p61fade
	move d7,8(a4)
    6f4a:	|   move.w d7,8(a4)
	else
	move d7,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6f4e:	|   bra.w 6f76 <P61_contfxdone>
.test:
	moveq #64,d0
    6f52:	\-> moveq #64,d0
	cmp P61_Volume(a5),d0
    6f54:	    cmp.w 24(a5),d0
	bge.b .ncs
    6f58:	/-- bge.s 6f66 <P61_volslide+0x2a>
	move d0,P61_Volume(a5)
    6f5a:	|   move.w d0,24(a5)
	ifeq p61fade
	move d0,8(a4)
    6f5e:	|   move.w d0,8(a4)
	else
	move d0,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6f62:	|   bra.w 6f76 <P61_contfxdone>
.ncs:
	ifeq p61fade
	move P61_Volume(a5),8(a4)
    6f66:	\-> move.w 24(a5),8(a4)
	else
	move P61_Volume(a5),P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6f6c:	    bra.w 6f76 <P61_contfxdone>
	move d0,P61_Period(a5)
	move d7,P61_ToPeriod(a5)
.setper:
	move P61_Period(a5),6(a4)
	else
	nop
    6f70:	    nop
	endc
	bra.w P61_contfxdone
    6f72:	    bra.w 6f76 <P61_contfxdone>

00006f76 <P61_contfxdone>:
********** MainFX returns here from all fx **********
P61_contfxdone:
	ifne P61_il
	bsr.w P61_funk2
	endc
	lea Channel_Block_Size(a5),a5
    6f76:	lea 64(a5),a5
	lea Custom_Block_Size(a4),a4
    6f7a:	lea 16(a4),a4
	dbf d5,P61_lopas
    6f7e:	dbf d5,6f06 <P61_lopas>
;;    ---  splitchans or normal decrunch  ---
	ifeq split4
	cmp P61_speed2(PC),d4		;'decrunch frame'? (1 before playtime)
    6f82:	cmp.w 761a <P61_speed2>(pc),d4
	bne.w P61_ret2
    6f86:	bne.w 721a <P61_ret2>

00006f8a <P61_preplay2>:
P61_preplay2:

.pr:	ifle (channels-splitchans)
	printt "splitchans >= channels! Must be less."
	else
	moveq #(channels-splitchans)-1,d5	;do preplay "first" half
    6f8a:	moveq #2,d5
	lea P61_temp0(pc),a5
    6f8c:	lea 74c6 <P61_temp0>(pc),a5
	bra.w P61_preplay
    6f90:	bra.w 710a <P61_preplay>

00006f94 <P61_MyJpt>:

	endc				;if split4
********** My Jump Table **********
P61_MyJpt:;jump table,%x1111xxx,%x111xxxx,%x11xxxxx=note,cmd,all - else empty
;	REPT 12
	jmp P61_all(PC)
    6f94:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6f98:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6f9c:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fa0:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fa4:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fa8:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fac:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fb0:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fb4:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fb8:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fbc:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fc0:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fc4:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fc8:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fcc:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fd0:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fd4:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fd8:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fdc:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fe0:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fe4:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6fe8:	jmp 7186 <P61_all2>(pc)
	jmp P61_all(PC)
    6fec:	jmp 713a <P61_all>(pc)
	jmp P61_all2(PC)
    6ff0:	jmp 7186 <P61_all2>(pc)
;	ENDR
	jmp P61_cmd(PC)
    6ff4:	jmp 7144 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    6ff8:	jmp 7192 <P61_cmd2>(pc)
	jmp P61_cmd(PC)
    6ffc:	jmp 7144 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    7000:	jmp 7192 <P61_cmd2>(pc)
	jmp P61_noote(PC)
    7004:	jmp 7150 <P61_noote>(pc)
	jmp P61_note2(PC)
    7008:	jmp 71a0 <P61_note2>(pc)
	jmp P61_empty(PC)
    700c:	jmp 7132 <P61_empty>(pc)
	jmp P61_empty2(PC)
    7010:	jmp 717c <P61_empty2>(pc)

;	REPT 12
	jmp P61_allS(PC)
    7014:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7018:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    701c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7020:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7024:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7028:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    702c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7030:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7034:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7038:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    703c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7040:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7044:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7048:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    704c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7050:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7054:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7058:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    705c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7060:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7064:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7068:	jmp 71c6 <P61_all2S>(pc)
	jmp P61_allS(PC)
    706c:	jmp 716a <P61_allS>(pc)
	jmp P61_all2S(PC)
    7070:	jmp 71c6 <P61_all2S>(pc)
;	ENDR
	jmp P61_cmdS(PC)
    7074:	jmp 7172 <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    7078:	jmp 71d0 <P61_cmd2S>(pc)
	jmp P61_cmdS(PC)
    707c:	jmp 7172 <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    7080:	jmp 71d0 <P61_cmd2S>(pc)
	jmp P61_noteS(PC)
    7084:	jmp 71dc <P61_noteS>(pc)
	jmp P61_note2S(PC)
    7088:	jmp 71b4 <P61_note2S>(pc)
	jmp P61_emptyS(PC)
    708c:	jmp 7162 <P61_emptyS>(pc)

00007090 <P61_empty2S>:
;	jmp P61_empty2S(PC)
********** END OF MYJPT **********
P61_empty2S:
	move d7,(a5)+
    7090:	move.w d7,(a5)+
	move.b d7,(a5)+
    7092:	move.b d7,(a5)+

00007094 <P61_proccompS>:
;;    ---  alt exit  ---
P61_proccompS:
	move.b (a0)+,d1
    7094:	    move.b (a0)+,d1
	move.b d1,d0
    7096:	    move.b d1,d0

	add.b d1,d1
    7098:	    add.b d1,d1
	bpl.b P61_permexit		;bit 6 was 0
    709a:	    bpl.s 7100 <P61_permexit>
;;    ---  stay in chan, repeat  ---
.b6set:	bcs.b .bit16
    709c:	/-- bcs.s 70ba <P61_proccompS+0x26>

.bit8:	move.b d7,(a5)
    709e:	|   move.b d7,(a5)
	subq.l #3,a5			;stay tuned to this channel!
    70a0:	|   subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    70a2:	|   and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    70a4:	|   move.b d0,19(a5)
	move.b (a0)+,d0			;hi word is clear. (constant)
    70a8:	|   move.b (a0)+,d0
	move.l a0,P61_ChaPos(a5)	;dupe of above
    70aa:	|   move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    70ae:	|   suba.l d0,a0
.jedi1:	move.b (a0)+,d0			;used in .empty etc
    70b0:	|   move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    70b2:	|   moveq #-8,d1
	and.b d0,d1
    70b4:	|   and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    70b6:	|   jmp (7094 <P61_proccompS>,pc,d1.w)

.bit16:	move.b d7,(a5)
    70ba:	\-> move.b d7,(a5)
	subq.l #3,a5
    70bc:	    subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    70be:	    and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    70c0:	    move.b d0,19(a5)
	ifeq opt020
	move.b (a0)+,d0			;hi word is clear. (constant)
    70c4:	    move.b (a0)+,d0
	lsl #8,d0
    70c6:	    lsl.w #8,d0
	move.b (a0)+,d0
    70c8:	    move.b (a0)+,d0
	else
	move.w (a0)+,d0			;(potentially) odd-address word-read.
	endc
	move.l a0,P61_ChaPos(a5)	;dupe of above
    70ca:	    move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    70ce:	    suba.l d0,a0
.jedi2:	move.b (a0)+,d0			;used in .empty etc
    70d0:	    move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    70d2:	    moveq #-8,d1
	and.b d0,d1
    70d4:	    and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    70d6:	    jmp (7094 <P61_proccompS>,pc,d1.w)

000070da <P61_Take>:

P61_Take:
	tst.b P61_TempLen+1(a5)		;faster than subq + addq!
    70da:	tst.b 19(a5)
	bne.b P61_takeone
    70de:	bne.s 70ee <P61_takeone>

000070e0 <P61_TakeNorm>:
P61_TakeNorm:				;this is more frequent than takeone
	move.l P61_ChaPos(a5),a0	;dflt - if takenorm
    70e0:	movea.l 10(a5),a0
	move.b (a0)+,d0			;used in .empty etc
    70e4:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    70e6:	moveq #-8,d1
	and.b d0,d1
    70e8:	and.b d0,d1
	jmp P61_MyJpt+256+4(PC,d1.w)	;first call can be this...
    70ea:	jmp (7098 <P61_proccompS+0x4>,pc,d1.w)

000070ee <P61_takeone>:
P61_takeone:
	subq.b #1,P61_TempLen+1(a5)
    70ee:	subq.b #1,19(a5)
	move.l P61_TempPos(a5),a0
    70f2:	movea.l 14(a5),a0

000070f6 <P61_Jedi>:
P61_Jedi:	;temp/repeat. copy below proccompS.
	move.b (a0)+,d0			;used in .empty etc
    70f6:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    70f8:	moveq #-8,d1
	and.b d0,d1
    70fa:	and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)	;but rest is always this
    70fc:	jmp (7094 <P61_proccompS>,pc,d1.w)

00007100 <P61_permexit>:
;;    ---  alt (perm) exit  ---		;does not affect maxtime.
P61_permexit:
	move.b d0,(a5)
    7100:	move.b d0,(a5)
	move.l a0,P61_ChaPos-3(a5)
    7102:	move.l a0,7(a5)
	bra.w P61_permdko
    7106:	bra.w 71f0 <P61_permdko>

0000710a <P61_preplay>:

;;    ---  The hipper wilderbeest run gnu linux at midnight!  ---
	ifne P61_ft
	lea (P61_samples-16)-P61_cn(a3),a2
	endc
	moveq #$3f,d4
    710a:	moveq #63,d4
	moveq #-$10,d6			;intelligent on/off-flag
    710c:	moveq #-16,d6
	moveq #0,d0			;clear hi word, never dirtied below.
    710e:	moveq #0,d0

00007110 <P61_loaps>:
	move.l P61_ChaPos(a5),(a1)+
	move.l P61_TempPos(a5),(a1)+
	move P61_TempLen(a5),(a1)
	endc

	moveq #-65,d1			;%10111111 const
    7110:	moveq #-65,d1
	and.b P61_Pack(a5),d1
    7112:	and.b 3(a5),d1
	add.b d1,d1			;sign in carry
    7116:	add.b d1,d1
	beq.b P61_Take			;6 lsb bits 0?
    7118:	beq.s 70da <P61_Take>
	bcc.b P61_nodko
    711a:	bcc.s 7124 <P61_nodko>
	addq #3,a5
    711c:	addq.w #3,a5
	subq.b #1,(a5)
    711e:	subq.b #1,(a5)
	bra.w P61_permdko
    7120:	bra.w 71f0 <P61_permdko>

00007124 <P61_nodko>:
P61_nodko:
	move.b d7,P61_OnOff+1(a5)
    7124:	move.b d7,9(a5)
	subq.b #1,P61_Pack(a5)
    7128:	subq.b #1,3(a5)
	addq #3,a5
    712c:	addq.w #3,a5
	bra.w P61_koto
    712e:	bra.w 7212 <P61_koto>

00007132 <P61_empty>:

;;    ---  routines  ---
P61_empty:
	move d7,(a5)+
    7132:	move.w d7,(a5)+
	move.b d7,(a5)+
    7134:	move.b d7,(a5)+
	bra.w P61_ex
    7136:	bra.w 71ec <P61_ex>

0000713a <P61_all>:
P61_all:
	move.b d0,(a5)+		;but this can't...
    713a:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    713c:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    713e:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_ex
    7140:	bra.w 71ec <P61_ex>

00007144 <P61_cmd>:
P61_cmd:
	moveq #$f,d1
    7144:	moveq #15,d1
	and d0,d1
    7146:	and.w d0,d1
	move d1,(a5)+
    7148:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    714a:	move.b (a0)+,(a5)+
	bra.w P61_ex
    714c:	bra.w 71ec <P61_ex>

00007150 <P61_noote>:
P61_noote:
	moveq #7,d1
    7150:	moveq #7,d1
	and d0,d1
    7152:	and.w d0,d1
	lsl #8,d1
    7154:	lsl.w #8,d1
	move.b (a0)+,d1
    7156:	move.b (a0)+,d1
	lsl #4,d1
    7158:	lsl.w #4,d1
	move d1,(a5)+
    715a:	move.w d1,(a5)+
	move.b d7,(a5)+
    715c:	move.b d7,(a5)+
	bra.w P61_ex
    715e:	bra.w 71ec <P61_ex>

00007162 <P61_emptyS>:
;;    ---  copyS  ---
P61_emptyS:
	move d7,(a5)+
    7162:	move.w d7,(a5)+
	move.b d7,(a5)+
    7164:	move.b d7,(a5)+
	bra.w P61_exS
    7166:	bra.w 71ea <P61_exS>

0000716a <P61_allS>:
P61_allS:
	move.b d0,(a5)+		;but this can't...
    716a:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    716c:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    716e:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.b P61_exS
    7170:	bra.s 71ea <P61_exS>

00007172 <P61_cmdS>:
P61_cmdS:
	moveq #$f,d1
    7172:	moveq #15,d1
	and d0,d1
    7174:	and.w d0,d1
	move d1,(a5)+
    7176:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    7178:	move.b (a0)+,(a5)+
	bra.b P61_exS
    717a:	bra.s 71ea <P61_exS>

0000717c <P61_empty2>:
;;    ---    ---
********** copy, perm exit **********
P61_empty2:
	move d7,(a5)+
    717c:	move.w d7,(a5)+
	move.b d7,(a5)+
    717e:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    7180:	move.l a0,7(a5)
	bra.b P61_permdko
    7184:	bra.s 71f0 <P61_permdko>

00007186 <P61_all2>:
P61_all2:
	move.b d0,(a5)+
    7186:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7188:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    718a:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	move.l a0,P61_ChaPos-3(a5)
    718c:	move.l a0,7(a5)
	bra.b P61_permdko
    7190:	bra.s 71f0 <P61_permdko>

00007192 <P61_cmd2>:
P61_cmd2:
	moveq #$f,d1
    7192:	moveq #15,d1
	and d0,d1
    7194:	and.w d0,d1
	move d1,(a5)+
    7196:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7198:	move.b (a0)+,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    719a:	move.l a0,7(a5)
	bra.b P61_permdko
    719e:	bra.s 71f0 <P61_permdko>

000071a0 <P61_note2>:
P61_note2:
	moveq #7,d1
    71a0:	moveq #7,d1
	and d0,d1
    71a2:	and.w d0,d1
	lsl #8,d1
    71a4:	lsl.w #8,d1
	move.b (a0)+,d1
    71a6:	move.b (a0)+,d1
	lsl #4,d1
    71a8:	lsl.w #4,d1
	move d1,(a5)+
    71aa:	move.w d1,(a5)+
	move.b d7,(a5)+
    71ac:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    71ae:	move.l a0,7(a5)
	bra.b P61_permdko
    71b2:	bra.s 71f0 <P61_permdko>

000071b4 <P61_note2S>:
;;    ---  copyS, diff exit  ---
P61_note2S:
	moveq #7,d1
    71b4:	moveq #7,d1
	and d0,d1
    71b6:	and.w d0,d1
	lsl #8,d1
    71b8:	lsl.w #8,d1
	move.b (a0)+,d1
    71ba:	move.b (a0)+,d1
	lsl #4,d1
    71bc:	lsl.w #4,d1
	move d1,(a5)+
    71be:	move.w d1,(a5)+
	move.b d7,(a5)+
    71c0:	move.b d7,(a5)+
	bra.w P61_proccompS
    71c2:	bra.w 7094 <P61_proccompS>

000071c6 <P61_all2S>:
P61_all2S:
	move.b d0,(a5)+
    71c6:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    71c8:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    71ca:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_proccompS
    71cc:	bra.w 7094 <P61_proccompS>

000071d0 <P61_cmd2S>:
P61_cmd2S:
	moveq #$f,d1
    71d0:	moveq #15,d1
	and d0,d1
    71d2:	and.w d0,d1
	move d1,(a5)+
    71d4:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    71d6:	move.b (a0)+,(a5)+
	bra.w P61_proccompS
    71d8:	bra.w 7094 <P61_proccompS>

000071dc <P61_noteS>:
;;    ---    ---
P61_noteS:
	moveq #7,d1
    71dc:	moveq #7,d1
	and d0,d1
    71de:	and.w d0,d1
	lsl #8,d1
    71e0:	lsl.w #8,d1
	move.b (a0)+,d1
    71e2:	move.b (a0)+,d1
	lsl #4,d1
    71e4:	lsl.w #4,d1
	move d1,(a5)+
    71e6:	move.w d1,(a5)+
	move.b d7,(a5)+
    71e8:	move.b d7,(a5)+

000071ea <P61_exS>:
;;    ---  norm (temp) exit  ---
;This exit is called when you have max rastertime.
P61_exS:
	move.b (a0)+,(a5)
    71ea:	move.b (a0)+,(a5)

000071ec <P61_ex>:
P61_ex:
	move.l a0,P61_TempPos-3(a5)
    71ec:	move.l a0,11(a5)

000071f0 <P61_permdko>:
P61_permdko:
	move.w d6,P61_OnOff-3(a5)		;was byte size in word var...
    71f0:	move.w d6,5(a5)
	move -3(a5),d0
    71f4:	move.w -3(a5),d0
	and #$1f0,d0
    71f8:	and.w #496,d0
	beq.b .koto
    71fc:	beq.s 7212 <P61_koto>
	ifne P61_ft
	lea (a2,d0),a1			;this is not the same a2 as the fix.
	else
	lea (P61_samples-16)-P61_cn(a3),a1
    71fe:	lea 102(a3),a1
	add d0,a1
    7202:	adda.w d0,a1
	endc
	move.l a1,P61_Sample-3(a5)
    7204:	move.l a1,1(a5)
	ifne P61_ft
	move.l P61_SampleVolume(a1),P61_Volume-3(a5)
	else
	move P61_SampleVolume(a1),P61_Volume-3(a5)
    7208:	move.w 12(a1),21(a5)
	endc
	ifne P61_il
	move.l P61_RepeatOffset(a1),P61_Wave-3(a5)
	endc
	ifne P61_sof
	move d7,P61_Offset-3(a5)
    720e:	move.w d7,25(a5)

00007212 <P61_koto>:
	endc
.koto:
P61_koto:
	ifeq split4			;split4 means only do once.
	lea Channel_Block_Size-3(a5),a5
    7212:	lea 61(a5),a5
	dbf d5,P61_loaps
    7216:	dbf d5,7110 <P61_loaps>

0000721a <P61_ret2>:
	endc
P61_ret2:
	rts
    721a:	rts

0000721c <P61_playtime>:

********** END OF LOAPS LOOP **********
********** here comes another :) **********
	ifeq dupedec
P61_playtime:
	addq.w #1,(a3)	;inc framecount past _Speed for detection+reset later
    721c:	addq.w #1,(a3)
	ifeq split4
	ifgt splitchans
	moveq #splitchans-1,d5		;channels split off?(optimization flag)
    721e:	moveq #0,d5
	lea P61_temp0+Channel_Block_Size*(channels-splitchans)(PC),a5
    7220:	lea 7586 <P61_temp3>(pc),a5
	bsr P61_preplay
    7224:	bsr.w 710a <P61_preplay>

00007228 <P61_playtimeCont>:
.djdj:
	move d7,P61_pdflag-P61_cn(a3)
	endc

	ifne suppF01
	tst P61_speedis1-P61_cn(a3)
    7228:	       tst.w 86(a3)
	beq.b .mo
    722c:	/----- beq.s 7240 <P61_playtimeCont+0x18>

	lea P61_temp0(pc),a5
    722e:	|      lea 74c6 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    7232:	|      moveq #3,d5
.chl:	bsr.w P61_preplay		;then do the remaining from prev frame
    7234:	|  /-> bsr.w 710a <P61_preplay>
	ifeq split4		;split4 means preplay is one-shot. So ext loop.
	lea Channel_Block_Size-3(a5),a5
    7238:	|  |   lea 61(a5),a5
	dbf d5,.chl
    723c:	|  \-- dbf d5,7234 <P61_playtimeCont+0xc>
.mo:
	endc	;suppF01

	ifeq copdma&nowaveforms		;both must be off to skip int.
	ifeq p61system		;main 'new note' int starter.
	lea P61_dmason(pc),a1
    7240:	\----> lea 7430 <P61_dmason>(pc),a1
	move.l P61_vektori(pc),a0
    7244:	       movea.l 7622 <P61_vektori>(pc),a0
	move.l a1,(a0)
    7248:	       move.l a1,(a0)
	move.b #$f0,$bfd600		;496 ticks=11.000677 scanlines,
    724a:	       move.b #-16,bfd600 <_end+0xb737b0>
	move.b #$01,$bfd700		;dmaoff $1.38 scanlines later on 68000.
    7252:	       move.b #1,bfd700 <_end+0xb738b0>
	move.b #$19,$bfdf00		;With unlucky timing and max period 856
    725a:	       move.b #25,bfdf00 <_end+0xb740b0>
	move.b #$f0,(a1)
	move.b #1,$100(a1)
	endc
	endc

	moveq #0,d4			;clr dmamask accumulator
    7262:	       moveq #0,d4
	moveq #channels-1,d5
    7264:	       moveq #3,d5
	lea P61_temp0(pc),a5
    7266:	       lea 74c6 <P61_temp0>(pc),a5
	bra.w P61_loscont		;I'd trade a bra for 2 Leias any day!
    726a:	       bra.w 7296 <P61_loscont>
    726e:	       ori.b #28,(a4)+
    7272:	       ori.b #28,(a4)+
    7276:	       ori.b #28,(a4)+
    727a:	       ori.b #28,(a4)+
    727e:	       ori.b #-42,(a4)+
    7282:	       ori.b #28,(a4)+
    7286:	       btst d0,(28,a6,d0.w)
    728a:	       ori.b #64,(a4)+

0000728e <P61_jtab>:
	endc
.j:
P61_jtab:
;;    ---  end of table  ---
P61_los:
	lea Custom_Block_Size(a4),a4
    728e:	lea 16(a4),a4
	lea Channel_Block_Size(a5),a5
    7292:	lea 64(a5),a5

00007296 <P61_loscont>:
P61_loscont:
	move P61_OnOff(a5),d0		;$ff00/$ffff? if off, will goto nocha.
    7296:	move.w 8(a5),d0
	ifeq p61bigjtab
	tst.b d0
    729a:	tst.b d0
	beq.s P61_nocha
    729c:	beq.s 72d0 <P61_nocha>
	endc
	or (a5),d0
    729e:	or.w (a5),d0
	add d0,d0			;->$fe00..$fffe (if big jtab)
    72a0:	add.w d0,d0
	move P61_jtab(PC,d0),d0
    72a2:	move.w (728e <P61_jtab>,pc,d0.w),d0
	jmp P61_jtab(PC,d0)
    72a6:	jmp (728e <P61_jtab>,pc,d0.w)

000072aa <P61_fxdone>:

P61_fxdone:				;this sets dma and paula values
	moveq #$7e,d0
    72aa:	moveq #126,d0
	and.b (a5),d0
    72ac:	and.b (a5),d0
	beq.b P61_nocha
    72ae:	beq.s 72d0 <P61_nocha>
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    72b0:	move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    72b4:	move.w (2,a3,d0.w),22(a5)

000072ba <P61_zample>:
P61_zample:				;also direct target for finetune retrig
	ifne P61_sof
	tst P61_Offset(a5)
    72ba:	tst.w 28(a5)
	bne.w P61_pek
    72be:	bne.w 739a <P61_pek>
	endc
;;    ---  check DMA-mask for pan/echo samplestarts, modify it, mix.  ---
;	bsr P61_Synth		;synth/pan/echo cpu-mix routine. Not done yet.
;;   --- modify below code to not touch synth/pan/echo fixchans ---
	or P61_DMABit(a5),d4		;accumulate channels touched
    72c2:	or.w 62(a5),d4
	move.l P61_Sample(a5),a1	;skipped if nocha
    72c6:	movea.l 4(a5),a1
	ifeq oscillo
	move.l (a1)+,(a4)
    72ca:	move.l (a1)+,(a4)
	move (a1),4(a4)
    72cc:	move.w (a1),4(a4)

000072d0 <P61_nocha>:
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo
P61_nocha:
	ifeq p61fade
	move.l P61_Period(a5),6(a4)
    72d0:	move.l 22(a5),6(a4)

000072d6 <P61_skip>:
	endc
P61_skip:
	ifne P61_il
	bsr.w P61_funk2
	endc
	DBF d5,P61_los
    72d6:	dbf d5,728e <P61_jtab>

000072da <P61_chansdone>:
	bpl.b .noch0
	move.w d7,$aa-C(A6)		;clear AUDxDAT
.noch0:
	endc

	move d4,$96-C(a6)	;DMAclear - changed to not be written 4 times
    72da:	       move.w d4,150(a6)

	ifne visuctrs
	lea P61_visuctr0+channels*2(PC),a0
    72de:	       lea 7858 <P61E>(pc),a0
	moveq #channels-1,d5
    72e2:	       moveq #3,d5
.visul:	subq.w #2,a0
    72e4:	/----> subq.w #2,a0
	btst d5,d4
    72e6:	|      btst d5,d4
	beq.s .noctr0
    72e8:	|  /-- beq.s 72ec <P61_chansdone+0x12>
	move.w d7,(a0)
    72ea:	|  |   move.w d7,(a0)
.noctr0:
	dbf d5,.visul
    72ec:	\--\-X dbf d5,72e4 <P61_chansdone+0xa>

	ifne copdma
	move.l p61_DMApokeAddr(PC),a0
	move.b d4,(a0)		;only the low byte is poked, allowing other dma
	endc
	move.b d4,P61_dma+1-P61_cn(a3)
    72f0:	       move.b d4,77(a3)
;;    ---  non-rolled over code  --- compatible with F01.
	ifne suppF01				;moved to here in P6110.
	ifne nowaveforms
	move.b d4,P61_NewDMA+1-P61_cn(a3)	;or set by fx
	endc
	move.w d7,(a3)				;clr p61_cn
    72f4:	       move.w d7,(a3)
	move d0,P61_CRow-P61_cn(a3)
	rts
P61_ohittaa:					;nextrow
	endc

	subq #1,P61_rowpos-P61_cn(a3)		;next pattern-step
    72f6:	       subq.w #1,78(a3)
	bpl.b P61_nonewpatt
    72fa:	       bpl.s 7358 <P61_nonewpatt>

000072fc <P61_nextpattern>:

P61_nextpattern:
	ifne P61_pl
	move d7,P61_plflag-P61_cn(a3)
	endc
	move.l P61_patternbase(pc),a0
    72fc:	movea.l 7844 <P61_patternbase>(pc),a0
	moveq #63,d0
    7300:	moveq #63,d0
	move d0,P61_rowpos-P61_cn(a3)
    7302:	move.w d0,78(a3)
	move d7,P61_CRow-P61_cn(a3)
    7306:	move.w d7,-2656(a3)
	move.l P61_spos(pc),a1
    730a:	movea.l 761e <P61_spos>(pc),a1
	addq #1,P61_Pos-P61_cn(a3)
    730e:	addq.w #1,-2660(a3)
	move.b (a1)+,d0
    7312:	move.b (a1)+,d0
	bpl.b P61_dk
    7314:	bpl.s 7320 <P61_dk>
	move.l P61_possibase(pc),a1
    7316:	movea.l 7840 <P61_possibase>(pc),a1
	move.b (a1)+,d0
    731a:	move.b (a1)+,d0
	move d7,P61_Pos-P61_cn(a3)
    731c:	move.w d7,-2660(a3)

00007320 <P61_dk>:
P61_dk:
	move.l a1,P61_spos-P61_cn(a3)
    7320:	move.l a1,88(a3)
	move d0,P61_Patt-P61_cn(a3)
    7324:	move.w d0,-2658(a3)
	lsl #3,d0
    7328:	lsl.w #3,d0
	move.l P61_positionbase(pc),a1
    732a:	movea.l 783c <P61_positionbase>(pc),a1
	add.l d0,a1
    732e:	adda.l d0,a1
	move.w (a1)+,d0			;no movem sign-extend... check.
    7330:	move.w (a1)+,d0
	add.l a0,d0
    7332:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp0-P61_cn(a3)
    7334:	move.l d0,-246(a3)
	moveq #0,d0			;actually faster than lea (a0,d0.l)
    7338:	moveq #0,d0
	move.w (a1)+,d0			;for some reason this code doesn't 
    733a:	move.w (a1)+,d0
	add.l a0,d0			;use 'ifgt channels-1' etc. Kept as is.
    733c:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp1-P61_cn(a3)
    733e:	move.l d0,-182(a3)
	moveq #0,d0
    7342:	moveq #0,d0
	move.w (a1)+,d0
    7344:	move.w (a1)+,d0
	add.l a0,d0
    7346:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp2-P61_cn(a3)
    7348:	move.l d0,-118(a3)
	moveq #0,d0
    734c:	moveq #0,d0
	move.w (a1)+,d0
    734e:	move.w (a1)+,d0
	add.l a0,d0
    7350:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp3-P61_cn(a3)
    7352:	move.l d0,-54(a3)
	rts
    7356:	rts

00007358 <P61_nonewpatt>:
P61_nonewpatt:
	moveq #63,d0
    7358:	moveq #63,d0
	sub P61_rowpos-P61_cn(a3),d0
    735a:	sub.w 78(a3),d0
	move d0,P61_CRow-P61_cn(a3)
    735e:	move.w d0,-2656(a3)
;;    ---  end of non-rolled over code  ---
	endc	;suppF01
	rts				;end of P61_playtime.
    7362:	rts

00007364 <P61_sampleoffse>:
	bra.w P61_nocha
	endc

	ifne P61_sof
P61_sampleoffse:
	moveq #0,d1
    7364:	    moveq #0,d1
	move #$ff00,d1
    7366:	    move.w #-256,d1
	and 2(a5),d1
    736a:	    and.w 2(a5),d1
	bne.b .deq
    736e:	/-- bne.s 7374 <P61_sampleoffse+0x10>
	move P61_LOffset(a5),d1
    7370:	|   move.w 30(a5),d1
.deq:
	move d1,P61_LOffset(a5)
    7374:	\-> move.w d1,30(a5)
	add d1,P61_Offset(a5)
    7378:	    add.w d1,28(a5)

	moveq #$7e,d0
    737c:	    moveq #126,d0
	and.b (a5),d0
    737e:	    and.b (a5),d0
	beq.w P61_nocha
    7380:	    beq.w 72d0 <P61_nocha>
	move P61_Offset(a5),d2
    7384:	    move.w 28(a5),d2
	add d1,P61_Offset(a5)
    7388:	    add.w d1,28(a5)
	move d2,d1
    738c:	    move.w d2,d1
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    738e:	    move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    7392:	    move.w (2,a3,d0.w),22(a5)
	bra.b P61_hup
    7398:	    bra.s 73a0 <P61_hup>

0000739a <P61_pek>:
P61_pek:
	moveq #0,d1
    739a:	moveq #0,d1
	move P61_Offset(a5),d1
    739c:	move.w 28(a5),d1

000073a0 <P61_hup>:
P61_hup:
	or P61_DMABit(a5),d4			;don't write 4 times, please.
    73a0:	or.w 62(a5),d4

	move.l P61_Sample(a5),a1
    73a4:	movea.l 4(a5),a1
	move.l (a1)+,d0
    73a8:	move.l (a1)+,d0
	add.l d1,d0
    73aa:	add.l d1,d0
	move.l d0,(a4)
    73ac:	move.l d0,(a4)
	lsr #1,d1
    73ae:	lsr.w #1,d1
	move (a1),d6
    73b0:	move.w (a1),d6
	sub d1,d6
    73b2:	sub.w d1,d6
	bpl.b P61_offok
    73b4:	bpl.s 73bc <P61_offok>
	move.l -4(a1),(a4)
    73b6:	move.l -4(a1),(a4)
	moveq #1,d6
    73ba:	moveq #1,d6

000073bc <P61_offok>:
P61_offok:
	move d6,4(a4)
    73bc:	move.w d6,4(a4)
	lsl.l #3,d1
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo

	bra.w P61_nocha			;continues to where ints etc is handled
    73c0:	bra.w 72d0 <P61_nocha>

000073c4 <P61_volum>:
	endc

	ifne P61_vl
P61_volum:
	move.b P61_Info(a5),P61_Volume+1(a5)
    73c4:	move.b 2(a5),25(a5)
	bra.w P61_fxdone
    73ca:	bra.w 72aa <P61_fxdone>

000073ce <P61_cspeed>:
	st P61_pdflag-P61_cn(a3)
	bra.w P61_fxdone
	endc
	ifne P61_sd
P61_cspeed:
	moveq #0,d0
    73ce:	moveq #0,d0
	move.b P61_Info(a5),d0
    73d0:	move.b 2(a5),d0
	ifne p61cia
	tst P61_Tempo-P61_cn(a3)
    73d4:	tst.w -2670(a3)
	beq.b P61_VBlank
    73d8:	beq.s 73e0 <P61_VBlank>
	cmp.b #32,d0
    73da:	cmp.b #32,d0
	bhs.b P61_STempo
    73de:	bcc.s 7408 <P61_STempo>

000073e0 <P61_VBlank>:
	endc
P61_VBlank:
	cmp.b #1,d0
    73e0:	cmp.b #1,d0
	beq.b P61_jkd
    73e4:	beq.s 73f8 <P61_jkd>
	move.b d0,P61_speed+1-P61_cn(a3)
    73e6:	move.b d0,83(a3)
	subq.b #1,d0
    73ea:	subq.b #1,d0
	move.b d0,P61_speed2+1-P61_cn(a3)
    73ec:	move.b d0,85(a3)
	move d7,P61_speedis1-P61_cn(a3)
    73f0:	move.w d7,86(a3)
	bra.w P61_fxdone
    73f4:	bra.w 72aa <P61_fxdone>

000073f8 <P61_jkd>:
P61_jkd:
	move.b d0,P61_speed+1-P61_cn(a3)
    73f8:	move.b d0,83(a3)
	move.b d0,P61_speed2+1-P61_cn(a3)
    73fc:	move.b d0,85(a3)
	st P61_speedis1-P61_cn(a3)
    7400:	st 86(a3)
	bra.w P61_fxdone
    7404:	bra.w 72aa <P61_fxdone>

00007408 <P61_STempo>:
	ifne p61cia
P61_STempo:
	move.l P61_timer(pc),d1
    7408:	move.l 7638 <P61_timer>(pc),d1
	divu d0,d1
    740c:	divu.w d0,d1
	move d1,P61_thi2-P61_cn(a3)
    740e:	move.w d1,112(a3)
	sub #$1f0*2,d1
    7412:	sub.w #992,d1
	move d1,P61_thi-P61_cn(a3)
    7416:	move.w d1,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d1
    741a:	move.w 112(a3),d1
	move.b d1,$bfd400
    741e:	move.b d1,bfd400 <_end+0xb735b0>
	lsr #8,d1
    7424:	lsr.w #8,d1
	move.b d1,$bfd500
    7426:	move.b d1,bfd500 <_end+0xb736b0>
	endc
	bra P61_fxdone
    742c:	bra.w 72aa <P61_fxdone>

00007430 <P61_dmason>:
********** timing interrupt entry point **********
;;    ---  first int, DMAs on again.  ---
	ifeq copdma
P61_dmason:
	ifeq p61system
	tst.b $bfdd00
    7430:	tst.b bfdd00 <_end+0xb73eb0>
	move #$2000,$dff09c
    7436:	move.w #8192,dff09c <_end+0xd7524c>
	move #$2000,$dff09c
    743e:	move.w #8192,dff09c <_end+0xd7524c>

	ifeq nowaveforms
	move.b #$19,$bfdf00		;retrigger to chain replen int.
    7446:	move.b #25,bfdf00 <_end+0xb740b0>
	move.l a0,-(sp)
    744e:	move.l a0,-(sp)
	move.l P61_vektori(pc),a0	;put another int in '$78.w'
    7450:	movea.l 7622 <P61_vektori>(pc),a0
	move.l P61_intaddr(pc),(a0)
    7454:	move.l 7848 <P61_intaddr>(pc),(a0)
	move.l (sp)+,a0
    7458:	movea.l (sp)+,a0
	endc

	move P61_dma(pc),$dff096	;on only. includes $8200.
    745a:	move.w 7612 <P61_dma>(pc),dff096 <_end+0xd75246>
	nop
    7462:	nop
	rte
    7464:	rte

00007466 <P61_setrepeat>:
	endc				;ifeq copdma
;;    ---  second chained int, replen  ---
	ifeq nowaveforms
P61_setrepeat:
	ifeq p61system
	tst.b $bfdd00
    7466:	tst.b bfdd00 <_end+0xb73eb0>
	movem.l a0/a1,-(sp)
    746c:	movem.l a0-a1,-(sp)
	lea $dff0a0,a1
    7470:	lea dff0a0 <_end+0xd75250>,a1
	move #$2000,-4(a1)
    7476:	move.w #8192,-4(a1)
	move #$2000,-4(a1)
    747c:	move.w #8192,-4(a1)
	else
	lea $dff0a0,a1
	endc

	move.l P61_Sample+P61_temp0(pc),a0
    7482:	movea.l 74ca <P61_temp0+0x4>(pc),a0
	addq.l #6,a0
    7486:	addq.l #6,a0
	move.l (a0)+,(a1)+
    7488:	move.l (a0)+,(a1)+
	move (a0),(a1)
    748a:	move.w (a0),(a1)
	ifgt channels-1
	move.l P61_Sample+P61_temp1(pc),a0
    748c:	movea.l 750a <P61_temp1+0x4>(pc),a0
	addq.l #6,a0
    7490:	addq.l #6,a0
	move.l (a0)+,12(a1)
    7492:	move.l (a0)+,12(a1)
	move (a0),16(a1)
    7496:	move.w (a0),16(a1)
	endc
	ifgt channels-2
	move.l P61_Sample+P61_temp2(pc),a0
    749a:	movea.l 754a <P61_temp2+0x4>(pc),a0
	addq.l #6,a0
    749e:	addq.l #6,a0
	move.l (a0)+,28(a1)
    74a0:	move.l (a0)+,28(a1)
	move (a0),32(a1)
    74a4:	move.w (a0),32(a1)
	endc
	ifgt channels-3
	move.l P61_Sample+P61_temp3(pc),a0
    74a8:	movea.l 758a <P61_temp3+0x4>(pc),a0
	addq.l #6,a0
    74ac:	addq.l #6,a0
	move.l (a0)+,44(a1)
    74ae:	move.l (a0)+,44(a1)
	move (a0),48(a1)
    74b2:	move.w (a0),48(a1)
	endc
	bra P61_ohi
	endc
	ifeq p61system
	ifne p61cia
	move.l P61_vektori(pc),a0
    74b6:	movea.l 7622 <P61_vektori>(pc),a0
	move.l P61_tintti(pc),(a0)
    74ba:	move.l 7630 <P61_tintti>(pc),(a0)
	endc
	movem.l (sp)+,a0/a1
    74be:	movem.l (sp)+,a0-a1
	nop
    74c2:	nop
	rte
    74c4:	rte

000074c6 <P61_temp0>:
	...
    7502:	ori.b #1,d0

00007506 <P61_temp1>:
	...
    7542:	ori.b #2,d0

00007546 <P61_temp2>:
	...
    7582:	ori.b #4,d0

00007586 <P61_temp3>:
	...
    75c2:	ori.b #8,d0

000075c6 <P61_cn>:
	...

000075c8 <P61_periods>:
    75c8:	bchg d1,(a0)+
    75ca:	bchg d1,(a0)+
    75cc:	btst d1,762(a0)
    75d0:	.short 0x02d0
    75d2:	andi.l #41943644,-(a6)
    75d8:	.short 0x023a
    75da:	andi.b #-4,(a2)+
    75de:	bset d0,-(a0)
    75e0:	bset d0,d5
    75e2:	bclr d0,404(a4)
    75e6:	.short 0x017d
    75e8:	bchg d0,339(a0)
    75ec:	bchg d0,d0
    75ee:	btst d0,285(a6)
    75f2:	movep.w 254(a5),d0
    75f6:	.short 0x00f0
    75f8:	.short 0x00e2
    75fa:	.short 0x00d6
    75fc:	.short 0x00ca
    75fe:	.short 0x00be
    7600:	ori.l #11141280,(-105,a4,d0.w)
    7608:	.short 0x008f
    760a:	ori.l #8323192,d7
    7610:	Address 0x7612 is out of bounds.


00007612 <P61_dma>:
    7612:	or.b d0,d1

00007614 <P61_rowpos>:
	...

00007616 <P61_slen>:
	...

00007618 <P61_speed>:
	...

0000761a <P61_speed2>:
	...

0000761c <P61_speedis1>:
	...

0000761e <P61_spos>:
    761e:	ori.b #0,d0

00007622 <P61_vektori>:
    7622:	ori.b #0,d0

00007626 <P61_oldlev6>:
    7626:	ori.b #0,d0

0000762a <P61_ofilter>:
	...

0000762c <P61_timers>:
    762c:	ori.b #0,d0

00007630 <P61_tintti>:
    7630:	ori.b #0,d0

00007634 <P61_thi>:
	...

00007635 <P61_tlo>:
	...

00007636 <P61_thi2>:
	...

00007637 <P61_tlo2>:
	...

00007638 <P61_timer>:
    7638:	ori.b #0,d0

0000763c <P61_samples>:
	...

0000782c <P61_emptysample>:
	...

0000783c <P61_positionbase>:
    783c:	ori.b #0,d0

00007840 <P61_possibase>:
    7840:	ori.b #0,d0

00007844 <P61_patternbase>:
    7844:	ori.b #0,d0

00007848 <P61_intaddr>:
    7848:	ori.b #0,d0

0000784c <P61_InitPos>:
	...

0000784e <P61_PattFlag>:
	...

00007850 <P61_etu>:
    7850:	negx.b d0

00007852 <P61_visuctr1>:
    7852:	negx.b d0

00007854 <P61_visuctr2>:
    7854:	negx.b d0

00007856 <P61_visuctr3>:
    7856:	negx.b d0
