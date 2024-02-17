
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
       4:	       move.l #279924,d3
       a:	       subi.l #279924,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #279924,d0
      18:	       cmpi.l #279924,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 44574 <debugpal>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #279924,d3
      38:	       subi.l #279924,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #279924,d0
      46:	       cmpi.l #279924,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 44574 <debugpal>,a2
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
      70:	                                                                      move.l a6,89cb8 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                                      move.l #14675968,89cb4 <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                                      lea 3c3c4 <incbin_MercuryLetterData2Lz4_end+0xe0>,a1
      86:	                                                                      moveq #0,d0
      88:	                                                                      jsr -552(a6)
      8c:	                                                                      move.l d0,89cb0 <GfxBase>
	if (!GfxBase)
      92:	               /----------------------------------------------------- beq.w 922 <main+0x8bc>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                                      movea.l 89cb8 <SysBase>,a6
      9c:	               |                                                      lea 3c3d5 <incbin_MercuryLetterData2Lz4_end+0xf1>,a1
      a2:	               |                                                      moveq #0,d0
      a4:	               |                                                      jsr -552(a6)
      a8:	               |                                                      move.l d0,89cac <DOSBase>
	if (!DOSBase)
      ae:	         /-----|----------------------------------------------------- beq.w 8be <main+0x858>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|----------------------------------------------------> pea 3c3e1 <incbin_MercuryLetterData2Lz4_end+0xfd>
      b8:	         |  |  |                                                      lea 253c <KPrintF>,a3
      be:	         |  |  |                                                      jsr (a3)
#endif
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
      c0:	         |  |  |                                                      movea.l 89cac <DOSBase>,a6
      c6:	         |  |  |                                                      jsr -60(a6)
      ca:	         |  |  |                                                      movea.l 89cac <DOSBase>,a6
      d0:	         |  |  |                                                      move.l d0,d1
      d2:	         |  |  |                                                      move.l #246781,d2
      d8:	         |  |  |                                                      moveq #20,d3
      da:	         |  |  |                                                      jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                                      movea.l 89cac <DOSBase>,a6
      e4:	         |  |  |                                                      moveq #50,d1
      e6:	         |  |  |                                                      jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
      ea:	         |  |  |                                                      lea 65a58 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
      f0:	         |  |  |                                                      suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
      f2:	         |  |  |                                                      suba.l a2,a2
		__asm volatile (
      f4:	         |  |  |                                                      movem.l d1-d7/a3-a6,-(sp)
      f8:	         |  |  |                                                      jsr 6a4c <_P61_Init>
      fe:	         |  |  |                                                      movem.l (sp)+,d1-d7/a3-a6

	//warpmode(1);
	// TODO: precalc stuff here
#ifdef MUSIC
	if(p61Init(module) != 0)
     102:	         |  |  |                                                      addq.l #4,sp
     104:	         |  |  |                                                      tst.l d0
     106:	         |  |  |  /-------------------------------------------------- bne.w 83c <main+0x7d6>
	Forbid();
     10a:	         |  |  |  |  /----------------------------------------------> movea.l 89cb8 <SysBase>,a6
     110:	         |  |  |  |  |                                                jsr -132(a6)
	SystemADKCON=custom->adkconr;
     114:	         |  |  |  |  |                                                movea.l 89cb4 <custom>,a0
     11a:	         |  |  |  |  |                                                move.w 16(a0),d0
	SystemInts=custom->intenar;
     11e:	         |  |  |  |  |                                                move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     122:	         |  |  |  |  |                                                move.w 2(a0),d0
	LoadView(0);
     126:	         |  |  |  |  |                                                movea.l 89cb0 <GfxBase>,a6
     12c:	         |  |  |  |  |                                                suba.l a1,a1
     12e:	         |  |  |  |  |                                                jsr -222(a6)
	WaitTOF();
     132:	         |  |  |  |  |                                                movea.l 89cb0 <GfxBase>,a6
     138:	         |  |  |  |  |                                                jsr -270(a6)
	WaitTOF();
     13c:	         |  |  |  |  |                                                movea.l 89cb0 <GfxBase>,a6
     142:	         |  |  |  |  |                                                jsr -270(a6)
	WaitVbl();
     146:	         |  |  |  |  |                                                lea bee <WaitVbl>,a2
     14c:	         |  |  |  |  |                                                jsr (a2)
	WaitVbl();
     14e:	         |  |  |  |  |                                                jsr (a2)
	OwnBlitter();
     150:	         |  |  |  |  |                                                movea.l 89cb0 <GfxBase>,a6
     156:	         |  |  |  |  |                                                jsr -456(a6)
	WaitBlit();	
     15a:	         |  |  |  |  |                                                movea.l 89cb0 <GfxBase>,a6
     160:	         |  |  |  |  |                                                jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     164:	         |  |  |  |  |                                                movea.l 89cb4 <custom>,a0
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
     1ac:	         |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     1b2:	         |  |  |  |  |  |                                             btst #0,297(a6)
     1b8:	/--------|--|--|--|--|--|-------------------------------------------- beq.w b7a <main+0xb14>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1bc:	|        |  |  |  |  |  |                                             moveq #46,d7
     1be:	|        |  |  |  |  |  |                                             add.l sp,d7
     1c0:	|        |  |  |  |  |  |                                             exg d7,a5
     1c2:	|        |  |  |  |  |  |                                             jsr -30(a6)
     1c6:	|        |  |  |  |  |  |                                             exg d7,a5
	VBR=GetVBR();
     1c8:	|        |  |  |  |  |  |                                             move.l d0,89ba2 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1ce:	|        |  |  |  |  |  |                                             movea.l 89ba2 <VBR>,a0
     1d4:	|        |  |  |  |  |  |                                             move.l 108(a0),d0
		KPrintF("p61Init failed!\n");
#endif
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     1d8:	|        |  |  |  |  |  |                                             jsr (a2)

	Sw_PrepareDisplay();
     1da:	|        |  |  |  |  |  |                                             jsr 4ca4 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     1e0:	|        |  |  |  |  |  |                                             movea.l 89cb4 <custom>,a0
     1e6:	|        |  |  |  |  |  |                                             move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     1ec:	|        |  |  |  |  |  |                                             move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
     1f2:	|        |  |  |  |  |  |                                             lea c88 <Sw_Run>,a4
     1f8:	|        |  |  |  |  |  |                                             tst.w 89caa <SwScrollerFinished>
     1fe:	|  /-----|--|--|--|--|--|-------------------------------------------- bne.s 20a <main+0x1a4>
		Sw_Run();
     200:	|  |  /--|--|--|--|--|--|-------------------------------------------> jsr (a4)
	while(SwScrollerFinished == 0) {
     202:	|  |  |  |  |  |  |  |  |                                             tst.w 89caa <SwScrollerFinished>
     208:	|  |  +--|--|--|--|--|--|-------------------------------------------- beq.s 200 <main+0x19a>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     20a:	|  >--|--|--|--|--|--|--|-------------------------------------------> movea.l 89cb8 <SysBase>,a6
     210:	|  |  |  |  |  |  |  |  |                                             movea.l 89bb2 <Sw_ScreenBuffer1>,a1
     216:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     21c:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     220:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     226:	|  |  |  |  |  |  |  |  |                                             movea.l 89bae <Sw_ScreenBuffer2>,a1
     22c:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     232:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     236:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     23c:	|  |  |  |  |  |  |  |  |                                             movea.l 89baa <Sw_FontBuffer>,a1
     242:	|  |  |  |  |  |  |  |  |                                             move.l #4000,d0
     248:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_font, 38000);
     24c:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     252:	|  |  |  |  |  |  |  |  |                                             lea 6ebac <incbin_Sw_font_start>,a1
     258:	|  |  |  |  |  |  |  |  |                                             move.l #38000,d0
     25e:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  RemIntServer( INTB_COPER, Sw_Vbint);
     262:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     268:	|  |  |  |  |  |  |  |  |                                             moveq #4,d0
     26a:	|  |  |  |  |  |  |  |  |                                             movea.l 89ba6 <Sw_Vbint>,a1
     270:	|  |  |  |  |  |  |  |  |                                             jsr -174(a6)
	}
	Sw_Cleanup();

	WaitBlit();
     274:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb0 <GfxBase>,a6
     27a:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
		
	custom->dmacon = 0x83ff;
     27e:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb4 <custom>,a0
     284:	|  |  |  |  |  |  |  |  |                                             move.w #-31745,150(a0)
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     28a:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     290:	|  |  |  |  |  |  |  |  |                                             moveq #22,d0
     292:	|  |  |  |  |  |  |  |  |                                             move.l #65537,d1
     298:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     29c:	|  |  |  |  |  |  |  |  |                                             movea.l d0,a1
     29e:	|  |  |  |  |  |  |  |  |                                             move.l d0,89c82 <Vbint>
     2a4:	|  |  |  |  |  |  |  |  |                                         /-- beq.s 2c0 <main+0x25a>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     2a6:	|  |  |  |  |  |  |  |  |                                         |   move.w #708,8(a1)
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
     2ac:	|  |  |  |  |  |  |  |  |                                         |   move.l #246610,10(a1)
    Vbint->is_Data = NULL;
     2b4:	|  |  |  |  |  |  |  |  |                                         |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     2b8:	|  |  |  |  |  |  |  |  |                                         |   move.l #3124,18(a1)
  }

  AddIntServer( INTB_VERTB, Vbint); 
     2c0:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89cb8 <SysBase>,a6
     2c6:	|  |  |  |  |  |  |  |  |                                             moveq #5,d0
     2c8:	|  |  |  |  |  |  |  |  |                                             jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     2cc:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     2d2:	|  |  |  |  |  |  |  |  |                                             move.l #25000,d0
     2d8:	|  |  |  |  |  |  |  |  |                                             moveq #0,d1
     2da:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2de:	|  |  |  |  |  |  |  |  |                                             move.l d0,89ca2 <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     2e4:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     2ea:	|  |  |  |  |  |  |  |  |                                             move.l #120000,d0
     2f0:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     2f2:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2f6:	|  |  |  |  |  |  |  |  |                                             move.l d0,89c9e <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     2fc:	|  |  |  |  |  |  |  |  |                                             pea 3 <_start+0x3>
     300:	|  |  |  |  |  |  |  |  |                                             pea 2710 <DrawRect+0x162>
     304:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     306:	|  |  |  |  |  |  |  |  |                                             lea c54 <Utils_FillLong.constprop.0>,a4
     30c:	|  |  |  |  |  |  |  |  |                                             jsr (a4)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     30e:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb0 <GfxBase>,a6
     314:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     318:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff044 <_end+0xd75388>
  custom->bltalwm = 0xffff; //Static
     320:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff046 <_end+0xd7538a>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     328:	|  |  |  |  |  |  |  |  |                                             move.l 89c9e <LineBuffer>,d5
  for( WORD i=0;i <=5;i++) {
     32e:	|  |  |  |  |  |  |  |  |                                             movea.l d5,a1
     330:	|  |  |  |  |  |  |  |  |                                             lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     334:	|  |  |  |  |  |  |  |  |                                             moveq #0,d6
  for( WORD i=0;i <=5;i++) {
     336:	|  |  |  |  |  |  |  |  |                                             clr.w d4
      data = data >> i2;
     338:	|  |  |  |  |  |  |  |  |                                             moveq #0,d3
     33a:	|  |  |  |  |  |  |  |  |                                             not.w d3
	APTR vbr = 0;
     33c:	|  |  |  |  |  |  |  |  |                                             movea.l a1,a0
     33e:	|  |  |  |  |  |  |  |  |                                             moveq #1,d1
     340:	|  |  |  |  |  |  |  |  |                                   /-------> move.l d3,d2
     342:	|  |  |  |  |  |  |  |  |                                   |         asr.l d1,d2
      data = data ^ 0xffff;
     344:	|  |  |  |  |  |  |  |  |                                   |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     346:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     34c:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd75346>,d0
     352:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     356:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 34c <main+0x2e6>
  custom->bltcon0 = 0x01f0;
     358:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0;
     360:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd75386>
  custom->bltadat = data;
     368:	|  |  |  |  |  |  |  |  |                                   |         move.w d2,dff074 <_end+0xd753b8>
  custom->bltdpt = Target;  
     36e:	|  |  |  |  |  |  |  |  |                                   |         move.l a0,dff054 <_end+0xd75398>
  custom->bltdmod = mod;
     374:	|  |  |  |  |  |  |  |  |                                   |         move.w #10,dff066 <_end+0xd753aa>
  custom->bltsize = lines*64+linelength;
     37c:	|  |  |  |  |  |  |  |  |                                   |         move.w #6401,dff058 <_end+0xd7539c>
    for( WORD i2=1;i2<=16; i2++) {        
     384:	|  |  |  |  |  |  |  |  |                                   |         addq.l #1,d1
     386:	|  |  |  |  |  |  |  |  |                                   |         lea 1200(a0),a0
     38a:	|  |  |  |  |  |  |  |  |                                   |         moveq #17,d0
     38c:	|  |  |  |  |  |  |  |  |                                   |         cmp.l d1,d0
     38e:	|  |  |  |  |  |  |  |  |                                   +-------- bne.s 340 <main+0x2da>
    if( i > 0) {
     390:	|  |  |  |  |  |  |  |  |                                   |         tst.w d4
     392:	|  |  |  |  |  |  |  |  |                                   |     /-- bne.s 3a8 <main+0x342>
    startbuffer += repeats*linesize*2*16;
     394:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     39a:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     39e:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     3a0:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d4
     3a2:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     3a4:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     3a6:	|  |  |  |  |  |  |  |  |                                   +-----|-- bra.s 340 <main+0x2da>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     3a8:	|  |  |  |  |  |  |  |  |                                   |     \-> moveq #12,d0
     3aa:	|  |  |  |  |  |  |  |  |                                   |         sub.w d6,d0
     3ac:	|  |  |  |  |  |  |  |  |                                   |         movea.w d0,a0
     3ae:	|  |  |  |  |  |  |  |  |                                   |         movea.w d4,a5
     3b0:	|  |  |  |  |  |  |  |  |                                   |         lea -32768(a5),a5
     3b4:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d1
     3b6:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d2
     3b8:	|  |  |  |  |  |  |  |  |                                   |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     3be:	|  |  |  |  |  |  |  |  |                                   |  /----> move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3c4:	|  |  |  |  |  |  |  |  |                                   |  |  /-> move.w dff002 <_end+0xd75346>,d0
     3ca:	|  |  |  |  |  |  |  |  |                                   |  |  |   btst #14,d0
     3ce:	|  |  |  |  |  |  |  |  |                                   |  |  \-- bne.s 3c4 <main+0x35e>
  custom->bltcon0 = 0x01f0;
     3d0:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #496,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0;
     3d8:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #0,dff042 <_end+0xd75386>
  custom->bltadat = data;
     3e0:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #-1,dff074 <_end+0xd753b8>
  custom->bltdpt = Target;  
     3e8:	|  |  |  |  |  |  |  |  |                                   |  |      move.l d1,dff054 <_end+0xd75398>
  custom->bltdmod = mod;
     3ee:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a0,dff066 <_end+0xd753aa>
  custom->bltsize = lines*64+linelength;
     3f4:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a5,dff058 <_end+0xd7539c>
      while( height > 512) {
     3fa:	|  |  |  |  |  |  |  |  |                                   |  |      addi.l #6144,d1
     400:	|  |  |  |  |  |  |  |  |                                   |  |      cmp.l d2,d1
     402:	|  |  |  |  |  |  |  |  |                                   |  \----- bne.s 3be <main+0x358>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     404:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     40a:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd75346>,d0
     410:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     414:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 40a <main+0x3a4>
  custom->bltcon0 = 0x01f0;
     416:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0;
     41e:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd75386>
  custom->bltadat = data;
     426:	|  |  |  |  |  |  |  |  |                                   |         move.w #-1,dff074 <_end+0xd753b8>
  custom->bltdpt = Target;  
     42e:	|  |  |  |  |  |  |  |  |                                   |         move.l d1,dff054 <_end+0xd75398>
  custom->bltdmod = mod;
     434:	|  |  |  |  |  |  |  |  |                                   |         move.w a0,dff066 <_end+0xd753aa>
  custom->bltsize = lines*64+linelength;
     43a:	|  |  |  |  |  |  |  |  |                                   |         move.w d4,d0
     43c:	|  |  |  |  |  |  |  |  |                                   |         addi.w #4096,d0
     440:	|  |  |  |  |  |  |  |  |                                   |         move.w d0,dff058 <_end+0xd7539c>
  for( WORD i=0;i <=5;i++) {
     446:	|  |  |  |  |  |  |  |  |                                   |         addi.w #-4095,d0
     44a:	|  |  |  |  |  |  |  |  |                                   |         cmpi.w #5,d4
     44e:	|  |  |  |  |  |  |  |  |                                   |     /-- beq.s 466 <main+0x400>
    startbuffer += repeats*linesize*2*16;
     450:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     456:	|  |  |  |  |  |  |  |  |                                   |     |   move.w d0,d4
     458:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     45c:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     45e:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     460:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     462:	|  |  |  |  |  |  |  |  |                                   \-----|-- bra.w 340 <main+0x2da>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     466:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 89cb8 <SysBase>,a6
     46c:	|  |  |  |  |  |  |  |  |                                             move.l #33024,d0
     472:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     474:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     478:	|  |  |  |  |  |  |  |  |                                             move.l d0,d2
     47a:	|  |  |  |  |  |  |  |  |                                             move.l d0,89c9a <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     480:	|  |  |  |  |  |  |  |  |                                             pea 10 <_start+0x10>
     484:	|  |  |  |  |  |  |  |  |                                             pea 204 <main+0x19e>
     488:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     48a:	|  |  |  |  |  |  |  |  |                                             jsr (a4)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     48c:	|  |  |  |  |  |  |  |  |                                             pea 2 <_start+0x2>
     490:	|  |  |  |  |  |  |  |  |                                             pea 100 <main+0x9a>
     494:	|  |  |  |  |  |  |  |  |                                             pea 3c424 <incbin_MercuryLetterData2Lz4_end+0x140>
     49a:	|  |  |  |  |  |  |  |  |                                             move.l d2,-(sp)
     49c:	|  |  |  |  |  |  |  |  |                                             lea 4426 <debug_register_bitmap.constprop.0>,a5
     4a2:	|  |  |  |  |  |  |  |  |                                             jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4a4:	|  |  |  |  |  |  |  |  |                                             movea.l 89cb8 <SysBase>,a6
     4aa:	|  |  |  |  |  |  |  |  |                                             move.l #49536,d0
     4b0:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     4b2:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     4b6:	|  |  |  |  |  |  |  |  |                                             move.l d0,89c96 <Bitmap1>
  if(Bitmap1 == 0) {
     4bc:	|  |  |  |  |  |  |  |  |                                             lea 28(sp),sp
     4c0:	|  |  |  |  |  |  |  |  |        /----------------------------------- beq.w af0 <main+0xa8a>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     4c4:	|  |  |  |  |  |  |  |  |        |                                    pea 3 <_start+0x3>
     4c8:	|  |  |  |  |  |  |  |  |        |                                    pea 100 <main+0x9a>
     4cc:	|  |  |  |  |  |  |  |  |        |                                    pea 3c455 <incbin_MercuryLetterData2Lz4_end+0x171>
     4d2:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,-(sp)
     4d4:	|  |  |  |  |  |  |  |  |        |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     4d6:	|  |  |  |  |  |  |  |  |        |                                    move.l 89c96 <Bitmap1>,d2
     4dc:	|  |  |  |  |  |  |  |  |        |                                    pea 10 <_start+0x10>
     4e0:	|  |  |  |  |  |  |  |  |        |                                    pea 306 <main+0x2a0>
     4e4:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,-(sp)
     4e6:	|  |  |  |  |  |  |  |  |        |                                    jsr (a4)

  ScreenBuffer1.BitPlane = Bitmap1;
     4e8:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,89c4a <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     4ee:	|  |  |  |  |  |  |  |  |        |                                    clr.l 89c4e <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     4f4:	|  |  |  |  |  |  |  |  |        |                                    clr.l 89c5a <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     4fa:	|  |  |  |  |  |  |  |  |        |                                    movea.l 89cb8 <SysBase>,a6
     500:	|  |  |  |  |  |  |  |  |        |                                    move.l #49536,d0
     506:	|  |  |  |  |  |  |  |  |        |                                    moveq #2,d1
     508:	|  |  |  |  |  |  |  |  |        |                                    jsr -198(a6)
     50c:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,89c92 <Bitmap2>
  if(Bitmap2 == 0) {
     512:	|  |  |  |  |  |  |  |  |        |                                    lea 28(sp),sp
     516:	|  |  |  |  |  |  |  |  |  /-----|----------------------------------- beq.w a66 <main+0xa00>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     51a:	|  |  |  |  |  |  |  |  |  |  /--|----------------------------------> pea 3 <_start+0x3>
     51e:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     522:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 3c486 <incbin_MercuryLetterData2Lz4_end+0x1a2>
     528:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     52a:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     52c:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l 89c92 <Bitmap2>,d2
     532:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     536:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 306 <main+0x2a0>
     53a:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     53c:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a4)

  ScreenBuffer2.BitPlane = Bitmap2;
     53e:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,89c12 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     544:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 89c16 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     54a:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 89c22 <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     550:	|  |  |  |  |  |  |  |  |  |  |  |                                    movea.l 89cb8 <SysBase>,a6
     556:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     55c:	|  |  |  |  |  |  |  |  |  |  |  |                                    moveq #2,d1
     55e:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     562:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,89c8e <Bitmap3>
  if(Bitmap3 == 0) {
     568:	|  |  |  |  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     56c:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------------------- beq.w 94e <main+0x8e8>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     570:	|  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------------> pea 3 <_start+0x3>
     574:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 100 <main+0x9a>
     578:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 3c4b7 <incbin_MercuryLetterData2Lz4_end+0x1d3>
     57e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,-(sp)
     580:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     582:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l 89c8e <Bitmap3>,d2
     588:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 10 <_start+0x10>
     58c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 306 <main+0x2a0>
     590:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,-(sp)
     592:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)

  ScreenBuffer3.BitPlane = Bitmap3;
     594:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 89bda <ScreenBuffer3>,a4
     59a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,(a4)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     59c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 89bde <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     5a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 89bea <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     5a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 2140 <Clbuild>,a5
     5ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d2
  DrawCopper = Clbuild( );
     5b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     5b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d3
     5b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,89c8a <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     5bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564298,89bb6 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     5c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564242,89bba <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     5d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89bbe <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     5d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89bc2 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     5dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564298,89bc6 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     5e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564242,89bca <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     5f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564242,89bce <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     5fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a4,89bd2 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     600:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #564298,89bd6 <ScreenBufferList+0x20>

  SetBplPointers(); 
     60a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 24a0 <SetBplPointers>,a4
     610:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,89c8a <DrawCopper>
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
     618:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,dff080 <_end+0xd753c4>
	PrepareDisplay();	
	custom->intena=0xc020;//Enable vblank
     61e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              movea.l 89cb4 <custom>,a0
     624:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-16352,154(a0)

	//WarmUp
	SetBplPointers();
     62a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a4)
  DrawCopper = ViewCopper;
     62c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,89c8a <DrawCopper>
  ViewCopper = tmp;
     632:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,89c86 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     638:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,dff080 <_end+0xd753c4>
	//LoadVectors();
	SwapCl();
	WaitVbl();	
     63e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)

	while( CubeFinished == 0) {		
     640:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 28(sp),sp
     644:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 4fae <DrawScreen>,a5
     64a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              tst.w 89ca6 <CubeFinished>
     650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------------------- bne.s 6ca <main+0x664>
		DrawScreen();
     652:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------> jsr (a5)
		SetBplPointers();
     654:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a4)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     656:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w f0ff60 <_end+0xe862a4>,d0
     65c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        cmpi.w #20153,d0
     660:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-------------- beq.w 810 <main+0x7aa>
     664:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |               cmpi.w #-24562,d0
     668:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        +-------------- beq.w 810 <main+0x7aa>
		debug_start_idle();
		while(FrameCounter<2);
     66c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-------------> move.w 89ca8 <FrameCounter>,d0
     672:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               cmpi.w #1,d0
     676:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-------------- bls.s 66c <main+0x606>
		if(FrameCounter >= 3) {
     678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-------------> move.w 89ca8 <FrameCounter>,d0
     67e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #2,d0
     682:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----- bhi.w 7ac <main+0x746>
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
     686:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w #0,89ca8 <FrameCounter>
		WaitVbl();
     68e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      jsr (a2)
     690:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w f0ff60 <_end+0xe862a4>,d0
     696:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      cmpi.w #20153,d0
     69a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----- beq.w 7ce <main+0x768>
     69e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|----> cmpi.w #-24562,d0
     6a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- beq.w 7ce <main+0x768>
  UBYTE *tmp = DrawCopper;
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 89c8a <DrawCopper>,d0
  DrawCopper = ViewCopper;
     6ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 89c86 <ViewCopper>,89c8a <DrawCopper>
  ViewCopper = tmp;
     6b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,89c86 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     6bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,dff080 <_end+0xd753c4>
	while( CubeFinished == 0) {		
     6c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w 89ca6 <CubeFinished>
     6c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|----- beq.s 652 <main+0x5ec>
  FreeMem(WorkingMem, 25000);
     6ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|----> movea.l 89cb8 <SysBase>,a6
     6d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89ca2 <WorkingMem>,a1
     6d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #25000,d0
     6dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
     6e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     6e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c9e <LineBuffer>,a1
     6ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #120000,d0
     6f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
     6f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     6fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c9a <PrepareBuffer>,a1
     702:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #33024,d0
     708:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
     70c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     712:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c96 <Bitmap1>,a1
     718:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     71e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
     722:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     728:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c92 <Bitmap2>,a1
     72e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     734:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
     738:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     73e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c8e <Bitmap3>,a1
     744:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     74a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
     74e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     754:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c8a <DrawCopper>,a1
     75a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     760:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
     764:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     76a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c86 <ViewCopper>,a1
     770:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     776:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
     77a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb8 <SysBase>,a6
     780:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #5,d0
     782:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89c82 <Vbint>,a1
     788:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -174(a6)
		debug_stop_idle();
		SwapCl();
	}

	CleanUp( );
	WaitVbl();
     78c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr (a2)
	custom->dmacon = 0x83ff;
     78e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 89cb4 <custom>,a0
     794:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-31745,150(a0)
	custom->intena=0xe020;//Enable vblank
     79a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-8160,154(a0)
	
	End_PrepareDisplay();
     7a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr 4a42 <End_PrepareDisplay.isra.0>

	while(1) {
		WaitVbl();
     7a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> jsr (a2)
     7a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a2)
	while(1) {
     7aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-- bra.s 7a6 <main+0x740>
    		KPrintF("Framerate below 25FPS\n");
     7ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> pea 3c4c3 <incbin_MercuryLetterData2Lz4_end+0x1df>
     7b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a3)
     7b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.l #4,sp
		FrameCounter = 0;
     7b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #0,89ca8 <FrameCounter>
		WaitVbl();
     7be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a2)
     7c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w f0ff60 <_end+0xe862a4>,d0
     7c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #20153,d0
     7ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- bne.w 69e <main+0x638>
		UaeLib(88, arg1, arg2, arg3, arg4);
     7ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> clr.l -(sp)
     7d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     7d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 5 <_start+0x5>
     7d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 58 <_start+0x58>
     7dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jsr f0ff60 <_end+0xe862a4>
	}
}
     7e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     7e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 89c8a <DrawCopper>,d0
  DrawCopper = ViewCopper;
     7ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 89c86 <ViewCopper>,89c8a <DrawCopper>
  ViewCopper = tmp;
     7f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,89c86 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     7fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,dff080 <_end+0xd753c4>
	while( CubeFinished == 0) {		
     802:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               tst.w 89ca6 <CubeFinished>
     808:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|-------------- beq.w 652 <main+0x5ec>
     80c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-------------- bra.w 6ca <main+0x664>
		UaeLib(88, arg1, arg2, arg3, arg4);
     810:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------------> clr.l -(sp)
     812:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  clr.l -(sp)
     814:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 1 <_start+0x1>
     818:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 5 <_start+0x5>
     81c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 58 <_start+0x58>
     820:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  jsr f0ff60 <_end+0xe862a4>
}
     826:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  lea 20(sp),sp
		while(FrameCounter<2);
     82a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  move.w 89ca8 <FrameCounter>,d0
     830:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  cmpi.w #1,d0
     834:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|----------------- bls.w 66c <main+0x606>
     838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \----------------- bra.w 678 <main+0x612>
		KPrintF("p61Init failed!\n");
     83c:	|  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|----------------------> pea 3c413 <incbin_MercuryLetterData2Lz4_end+0x12f>
     842:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a3)
     844:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        addq.l #4,sp
	Forbid();
     846:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb8 <SysBase>,a6
     84c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -132(a6)
	SystemADKCON=custom->adkconr;
     850:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb4 <custom>,a0
     856:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 16(a0),d0
	SystemInts=custom->intenar;
     85a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     85e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w 2(a0),d0
	LoadView(0);
     862:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb0 <GfxBase>,a6
     868:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        suba.l a1,a1
     86a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -222(a6)
	WaitTOF();
     86e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb0 <GfxBase>,a6
     874:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitTOF();
     878:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb0 <GfxBase>,a6
     87e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -270(a6)
	WaitVbl();
     882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        lea bee <WaitVbl>,a2
     888:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	WaitVbl();
     88a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
	OwnBlitter();
     88c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb0 <GfxBase>,a6
     892:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -456(a6)
	WaitBlit();	
     896:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb0 <GfxBase>,a6
     89c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     8a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 89cb4 <custom>,a0
     8a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     8ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     8b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #16383,150(a0)
	for(int a=0;a<32;a++)
     8b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        moveq #0,d1
     8ba:	|  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|----------------------- bra.w 17e <main+0x118>
		Exit(0);
     8be:	|  |  |  >--|--|--|--|-----|--|--|--|--|--|--|----------------------> suba.l a6,a6
     8c0:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #0,d1
     8c2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     8c6:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        pea 3c3e1 <incbin_MercuryLetterData2Lz4_end+0xfd>
     8cc:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 253c <KPrintF>,a3
     8d2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr (a3)
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
     8d4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89cac <DOSBase>,a6
     8da:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -60(a6)
     8de:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89cac <DOSBase>,a6
     8e4:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l d0,d1
     8e6:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        move.l #246781,d2
     8ec:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #20,d3
     8ee:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -48(a6)
	Delay(50);
     8f2:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movea.l 89cac <DOSBase>,a6
     8f8:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        moveq #50,d1
     8fa:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr -198(a6)
		register volatile const void* _a0 ASM("a0") = module;
     8fe:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        lea 65a58 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     904:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     906:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        suba.l a2,a2
		__asm volatile (
     908:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l d1-d7/a3-a6,-(sp)
     90c:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        jsr 6a4c <_P61_Init>
     912:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        movem.l (sp)+,d1-d7/a3-a6
	if(p61Init(module) != 0)
     916:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        addq.l #4,sp
     918:	|  |  |  |  |  |  |  |     |  |  |  |  |  |  |                        tst.l d0
     91a:	|  |  |  |  |  |  |  \-----|--|--|--|--|--|--|----------------------- beq.w 10a <main+0xa4>
     91e:	|  |  |  |  |  |  \--------|--|--|--|--|--|--|----------------------- bra.w 83c <main+0x7d6>
		Exit(0);
     922:	|  |  |  |  |  \-----------|--|--|--|--|--|--|----------------------> movea.l 89cac <DOSBase>,a6
     928:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d1
     92a:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     92e:	|  |  |  |  |              |  |  |  |  |  |  |                        movea.l 89cb8 <SysBase>,a6
     934:	|  |  |  |  |              |  |  |  |  |  |  |                        lea 3c3d5 <incbin_MercuryLetterData2Lz4_end+0xf1>,a1
     93a:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d0
     93c:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -552(a6)
     940:	|  |  |  |  |              |  |  |  |  |  |  |                        move.l d0,89cac <DOSBase>
	if (!DOSBase)
     946:	|  |  |  |  \--------------|--|--|--|--|--|--|----------------------- bne.w b2 <main+0x4c>
     94a:	|  |  |  \-----------------|--|--|--|--|--|--|----------------------- bra.w 8be <main+0x858>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     94e:	|  |  |                    |  |  |  >--|--|--|----------------------> movea.l 89cac <DOSBase>,a6
     954:	|  |  |                    |  |  |  |  |  |  |                        jsr -60(a6)
     958:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89cac <DOSBase>,a6
     95e:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d1
     960:	|  |  |                    |  |  |  |  |  |  |                        move.l #246930,d2
     966:	|  |  |                    |  |  |  |  |  |  |                        moveq #38,d3
     968:	|  |  |                    |  |  |  |  |  |  |                        jsr -48(a6)
    Exit(1);
     96c:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89cac <DOSBase>,a6
     972:	|  |  |                    |  |  |  |  |  |  |                        moveq #1,d1
     974:	|  |  |                    |  |  |  |  |  |  |                        jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     978:	|  |  |                    |  |  |  |  |  |  |                        move.l 89c8e <Bitmap3>,d0
     97e:	|  |  |                    |  |  |  |  |  |  |                        pea 3 <_start+0x3>
     982:	|  |  |                    |  |  |  |  |  |  |                        pea 100 <main+0x9a>
     986:	|  |  |                    |  |  |  |  |  |  |                        pea 3c4b7 <incbin_MercuryLetterData2Lz4_end+0x1d3>
     98c:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,-(sp)
     98e:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     990:	|  |  |                    |  |  |  |  |  |  |                        move.l 89c8e <Bitmap3>,d2
     996:	|  |  |                    |  |  |  |  |  |  |                        pea 10 <_start+0x10>
     99a:	|  |  |                    |  |  |  |  |  |  |                        pea 306 <main+0x2a0>
     99e:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,-(sp)
     9a0:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  ScreenBuffer3.BitPlane = Bitmap3;
     9a2:	|  |  |                    |  |  |  |  |  |  |                        lea 89bda <ScreenBuffer3>,a4
     9a8:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,(a4)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     9aa:	|  |  |                    |  |  |  |  |  |  |                        clr.l 89bde <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     9b0:	|  |  |                    |  |  |  |  |  |  |                        clr.l 89bea <ScreenBuffer3+0x10>
  ViewCopper = Clbuild( );
     9b6:	|  |  |                    |  |  |  |  |  |  |                        lea 2140 <Clbuild>,a5
     9bc:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9be:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d2
  DrawCopper = Clbuild( );
     9c0:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     9c2:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d3
     9c4:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,89c8a <DrawCopper>
  ScreenBufferList[0] = &ScreenBuffer1;
     9ca:	|  |  |                    |  |  |  |  |  |  |                        move.l #564298,89bb6 <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     9d4:	|  |  |                    |  |  |  |  |  |  |                        move.l #564242,89bba <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     9de:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89bbe <ScreenBufferList+0x8>
  ScreenBufferList[3] = &ScreenBuffer3;
     9e4:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89bc2 <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     9ea:	|  |  |                    |  |  |  |  |  |  |                        move.l #564298,89bc6 <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     9f4:	|  |  |                    |  |  |  |  |  |  |                        move.l #564242,89bca <ScreenBufferList+0x14>
  ScreenBufferList[6] = &ScreenBuffer2;
     9fe:	|  |  |                    |  |  |  |  |  |  |                        move.l #564242,89bce <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     a08:	|  |  |                    |  |  |  |  |  |  |                        move.l a4,89bd2 <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     a0e:	|  |  |                    |  |  |  |  |  |  |                        move.l #564298,89bd6 <ScreenBufferList+0x20>
  SetBplPointers(); 
     a18:	|  |  |                    |  |  |  |  |  |  |                        lea 24a0 <SetBplPointers>,a4
     a1e:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  DrawCopper = ViewCopper;
     a20:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,89c8a <DrawCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a26:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,dff080 <_end+0xd753c4>
	custom->intena=0xc020;//Enable vblank
     a2c:	|  |  |                    |  |  |  |  |  |  |                        movea.l 89cb4 <custom>,a0
     a32:	|  |  |                    |  |  |  |  |  |  |                        move.w #-16352,154(a0)
	SetBplPointers();
     a38:	|  |  |                    |  |  |  |  |  |  |                        jsr (a4)
  DrawCopper = ViewCopper;
     a3a:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,89c8a <DrawCopper>
  ViewCopper = tmp;
     a40:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,89c86 <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     a46:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,dff080 <_end+0xd753c4>
	WaitVbl();	
     a4c:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
	while( CubeFinished == 0) {		
     a4e:	|  |  |                    |  |  |  |  |  |  |                        lea 28(sp),sp
     a52:	|  |  |                    |  |  |  |  |  |  |                        lea 4fae <DrawScreen>,a5
     a58:	|  |  |                    |  |  |  |  |  |  |                        tst.w 89ca6 <CubeFinished>
     a5e:	|  |  |                    |  |  |  |  |  |  \----------------------- beq.w 652 <main+0x5ec>
     a62:	|  |  |                    |  |  |  |  |  \-------------------------- bra.w 6ca <main+0x664>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     a66:	|  |  |                    >--|--|--|--|----------------------------> movea.l 89cac <DOSBase>,a6
     a6c:	|  |  |                    |  |  |  |  |                              jsr -60(a6)
     a70:	|  |  |                    |  |  |  |  |                              movea.l 89cac <DOSBase>,a6
     a76:	|  |  |                    |  |  |  |  |                              move.l d0,d1
     a78:	|  |  |                    |  |  |  |  |                              move.l #246881,d2
     a7e:	|  |  |                    |  |  |  |  |                              moveq #38,d3
     a80:	|  |  |                    |  |  |  |  |                              jsr -48(a6)
    Exit(1);
     a84:	|  |  |                    |  |  |  |  |                              movea.l 89cac <DOSBase>,a6
     a8a:	|  |  |                    |  |  |  |  |                              moveq #1,d1
     a8c:	|  |  |                    |  |  |  |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     a90:	|  |  |                    |  |  |  |  |                              move.l 89c92 <Bitmap2>,d0
     a96:	|  |  |                    |  |  |  |  |                              pea 3 <_start+0x3>
     a9a:	|  |  |                    |  |  |  |  |                              pea 100 <main+0x9a>
     a9e:	|  |  |                    |  |  |  |  |                              pea 3c486 <incbin_MercuryLetterData2Lz4_end+0x1a2>
     aa4:	|  |  |                    |  |  |  |  |                              move.l d0,-(sp)
     aa6:	|  |  |                    |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     aa8:	|  |  |                    |  |  |  |  |                              move.l 89c92 <Bitmap2>,d2
     aae:	|  |  |                    |  |  |  |  |                              pea 10 <_start+0x10>
     ab2:	|  |  |                    |  |  |  |  |                              pea 306 <main+0x2a0>
     ab6:	|  |  |                    |  |  |  |  |                              move.l d2,-(sp)
     ab8:	|  |  |                    |  |  |  |  |                              jsr (a4)
  ScreenBuffer2.BitPlane = Bitmap2;
     aba:	|  |  |                    |  |  |  |  |                              move.l d2,89c12 <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     ac0:	|  |  |                    |  |  |  |  |                              clr.l 89c16 <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     ac6:	|  |  |                    |  |  |  |  |                              clr.l 89c22 <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     acc:	|  |  |                    |  |  |  |  |                              movea.l 89cb8 <SysBase>,a6
     ad2:	|  |  |                    |  |  |  |  |                              move.l #49536,d0
     ad8:	|  |  |                    |  |  |  |  |                              moveq #2,d1
     ada:	|  |  |                    |  |  |  |  |                              jsr -198(a6)
     ade:	|  |  |                    |  |  |  |  |                              move.l d0,89c8e <Bitmap3>
  if(Bitmap3 == 0) {
     ae4:	|  |  |                    |  |  |  |  |                              lea 28(sp),sp
     ae8:	|  |  |                    |  |  |  |  \----------------------------- bne.w 570 <main+0x50a>
     aec:	|  |  |                    |  |  |  \-------------------------------- bra.w 94e <main+0x8e8>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     af0:	|  |  |                    |  |  \----------------------------------> movea.l 89cac <DOSBase>,a6
     af6:	|  |  |                    |  |                                       jsr -60(a6)
     afa:	|  |  |                    |  |                                       movea.l 89cac <DOSBase>,a6
     b00:	|  |  |                    |  |                                       move.l d0,d1
     b02:	|  |  |                    |  |                                       move.l #246832,d2
     b08:	|  |  |                    |  |                                       moveq #38,d3
     b0a:	|  |  |                    |  |                                       jsr -48(a6)
    Exit(1);
     b0e:	|  |  |                    |  |                                       movea.l 89cac <DOSBase>,a6
     b14:	|  |  |                    |  |                                       moveq #1,d1
     b16:	|  |  |                    |  |                                       jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     b1a:	|  |  |                    |  |                                       move.l 89c96 <Bitmap1>,d0
     b20:	|  |  |                    |  |                                       pea 3 <_start+0x3>
     b24:	|  |  |                    |  |                                       pea 100 <main+0x9a>
     b28:	|  |  |                    |  |                                       pea 3c455 <incbin_MercuryLetterData2Lz4_end+0x171>
     b2e:	|  |  |                    |  |                                       move.l d0,-(sp)
     b30:	|  |  |                    |  |                                       jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     b32:	|  |  |                    |  |                                       move.l 89c96 <Bitmap1>,d2
     b38:	|  |  |                    |  |                                       pea 10 <_start+0x10>
     b3c:	|  |  |                    |  |                                       pea 306 <main+0x2a0>
     b40:	|  |  |                    |  |                                       move.l d2,-(sp)
     b42:	|  |  |                    |  |                                       jsr (a4)
  ScreenBuffer1.BitPlane = Bitmap1;
     b44:	|  |  |                    |  |                                       move.l d2,89c4a <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     b4a:	|  |  |                    |  |                                       clr.l 89c4e <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     b50:	|  |  |                    |  |                                       clr.l 89c5a <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     b56:	|  |  |                    |  |                                       movea.l 89cb8 <SysBase>,a6
     b5c:	|  |  |                    |  |                                       move.l #49536,d0
     b62:	|  |  |                    |  |                                       moveq #2,d1
     b64:	|  |  |                    |  |                                       jsr -198(a6)
     b68:	|  |  |                    |  |                                       move.l d0,89c92 <Bitmap2>
  if(Bitmap2 == 0) {
     b6e:	|  |  |                    |  |                                       lea 28(sp),sp
     b72:	|  |  |                    |  \-------------------------------------- bne.w 51a <main+0x4b4>
     b76:	|  |  |                    \----------------------------------------- bra.w a66 <main+0xa00>
	APTR vbr = 0;
     b7a:	\--|--|-------------------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     b7c:	   |  |                                                               move.l d0,89ba2 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     b82:	   |  |                                                               movea.l 89ba2 <VBR>,a0
     b88:	   |  |                                                               move.l 108(a0),d0
	WaitVbl();
     b8c:	   |  |                                                               jsr (a2)
	Sw_PrepareDisplay();
     b8e:	   |  |                                                               jsr 4ca4 <Sw_PrepareDisplay.isra.0>
	custom->dmacon = 0x83f0;	
     b94:	   |  |                                                               movea.l 89cb4 <custom>,a0
     b9a:	   |  |                                                               move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     ba0:	   |  |                                                               move.w #-8160,154(a0)
	while(SwScrollerFinished == 0) {
     ba6:	   |  |                                                               lea c88 <Sw_Run>,a4
     bac:	   |  |                                                               tst.w 89caa <SwScrollerFinished>
     bb2:	   |  \-------------------------------------------------------------- beq.w 200 <main+0x19a>
     bb6:	   \----------------------------------------------------------------- bra.w 20a <main+0x1a4>
     bba:	                                                                      nop

00000bbc <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     bbc:	subq.l #4,sp
     bbe:	move.l 16(sp),d0
     bc2:	move.w d0,d0
     bc4:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     bc8:	moveq #11,d0
     bca:	add.l 8(sp),d0
     bce:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     bd0:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     bd4:	moveq #0,d0
     bd6:	move.w 2(sp),d0
	__asm volatile (
     bda:	movem.l d0-d7/a2-a6,-(sp)
     bde:	jsr 5b64 <_lz4_depack>
     be4:	movem.l (sp)+,d0-d7/a2-a6
}
     be8:	nop
     bea:	addq.l #4,sp
     bec:	rts

00000bee <WaitVbl>:
void WaitVbl() {
     bee:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     bf0:	/-> move.l dff004 <_end+0xd75348>,d0
     bf6:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     bf8:	|   move.l (sp),d0
     bfa:	|   andi.l #130816,d0
     c00:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     c02:	|   move.l (sp),d0
     c04:	|   cmpi.l #79616,d0
     c0a:	\-- beq.s bf0 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c0c:	/-> move.l dff004 <_end+0xd75348>,d0
     c12:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     c16:	|   move.l 4(sp),d0
     c1a:	|   andi.l #130816,d0
     c20:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     c24:	|   move.l 4(sp),d0
     c28:	|   cmpi.l #79616,d0
     c2e:	\-- bne.s c0c <WaitVbl+0x1e>
}
     c30:	    addq.l #8,sp
     c32:	    rts

00000c34 <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     c34:	move.w #32,dff09c <_end+0xd753e0>
  custom->intreq = 1 << INTB_VERTB;
     c3c:	move.w #32,dff09c <_end+0xd753e0>
  FrameCounter++;
     c44:	move.w 89ca8 <FrameCounter>,d0
     c4a:	addq.w #1,d0
     c4c:	move.w d0,89ca8 <FrameCounter>
}
     c52:	rts

00000c54 <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
     c54:	    movem.l d2-d5/a2,-(sp)
     c58:	    move.l 24(sp),d3
     c5c:	    move.l 28(sp),d5
      *target++ = pattern;
     c60:	    move.l 32(sp),d4
     c64:	    add.l d4,d4
     c66:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
     c68:	    moveq #0,d2
     c6a:	    lea 58f6 <memset>(pc),a2
      *target++ = pattern;
     c6e:	/-> move.l d4,-(sp)
     c70:	|   clr.l -(sp)
     c72:	|   move.l d3,-(sp)
     c74:	|   jsr (a2)
     c76:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
     c78:	|   addq.l #1,d2
     c7a:	|   lea 12(sp),sp
     c7e:	|   cmp.l d2,d5
     c80:	\-- bne.s c6e <Utils_FillLong.constprop.0+0x1a>
}
     c82:	    movem.l (sp)+,d2-d5/a2
     c86:	    rts

00000c88 <Sw_Run>:
void Sw_Run() {                                     
     c88:	          movem.l d2-d4/a2-a4/a6,-(sp)
  if(Sw_framecount == 50) {
     c8c:	          move.l 65a52 <Sw_framecount>,d0
     c92:	          moveq #50,d1
     c94:	          cmp.l d0,d1
     c96:	   /----- beq.w fc2 <Sw_Run+0x33a>
  Sw_framecount++;
     c9a:	   |      addq.l #1,d0
     c9c:	   |      move.l d0,65a52 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     ca2:	/--|----> move.w 89ba0 <Sw_BlitFrame>,d0
     ca8:	+--|----- beq.s ca2 <Sw_Run+0x1a>
  *bp = 0;
     caa:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     cae:	|  |      move.w #0,89ba0 <Sw_BlitFrame>
  WaitBlit();
     cb6:	|  |      lea 89cb0 <GfxBase>,a2
     cbc:	|  |      movea.l (a2),a6
     cbe:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     cc2:	|  |      movea.l 89cb4 <custom>,a0
     cc8:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     cce:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     cd4:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     cda:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     ce0:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     ce6:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     cec:	|  |      move.w #2544,64(a0)
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     cf2:	|  |      move.l 65a52 <Sw_framecount>,d1
     cf8:	|  |      subq.l #1,d1
     cfa:	|  |      move.l d1,d0
     cfc:	|  |      add.l d1,d0
     cfe:	|  |      add.l d0,d0
     d00:	|  |      add.l d1,d0
     d02:	|  |      lsl.l #4,d0
     d04:	|  |      add.l 89baa <Sw_FontBuffer>,d0
     d0a:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     d0e:	|  |      move.l 89b9c <Sw_DrawBuffer>,d0
     d14:	|  |      addi.l #20400,d0
     d1a:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     d1e:	|  |      move.w #104,88(a0)
  WaitBlit();
     d24:	|  |      movea.l (a2),a6
     d26:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d2a:	|  |      movea.l 89cb4 <custom>,a0
     d30:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     d36:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     d3c:	|  |      move.l 89b98 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     d44:	|  |      move.l 89b9c <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     d4c:	|  |      lea 42552 <Sw_CopyLines>,a3
     d52:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     d58:	|  |      add.l d0,d0
     d5a:	|  |      move.w (0,a3,d0.l),d0
     d5e:	|  |      lsl.w #6,d0
     d60:	|  |      addi.w #40,d0
     d64:	|  |      move.w d0,88(a0)
  WaitBlit();
     d68:	|  |      movea.l (a2),a6
     d6a:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     d6e:	|  |      movea.l 89cb4 <custom>,a0
     d74:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     d7a:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     d80:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     d86:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     d8c:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     d92:	|  |      add.l d0,d0
     d94:	|  |      move.w (0,a3,d0.l),d1
     d98:	|  |      move.w d1,d0
     d9a:	|  |      mulu.w #80,d0
     d9e:	|  |      movea.l d0,a1
     da0:	|  |      lea 120(a1),a4
     da4:	|  |      move.l 89b98 <Sw_ViewBufferP1>,d0
     daa:	|  |      add.l a4,d0
     dac:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     db0:	|  |      lea 40(a1),a1
     db4:	|  |      adda.l 89b9c <Sw_DrawBuffer>,a1
     dba:	|  |      move.l a1,84(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     dbe:	|  |      move.w d1,d0
     dc0:	|  |      mulu.w #40,d0
     dc4:	|  |      addi.l #501792,d0
     dca:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     dce:	|  |      move.w #255,d0
     dd2:	|  |      sub.w d1,d0
     dd4:	|  |      lsl.w #6,d0
     dd6:	|  |      addi.w #20,d0
     dda:	|  |      move.w d0,88(a0)
  WaitBlit();
     dde:	|  |      movea.l (a2),a6
     de0:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     de4:	|  |      movea.l 89cb4 <custom>,a0
     dea:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     df0:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     df6:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     dfc:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     e02:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     e08:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     e0e:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     e14:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     e1a:	|  |      add.l d0,d0
     e1c:	|  |      move.w (0,a3,d0.l),d1
     e20:	|  |      move.w d1,d0
     e22:	|  |      mulu.w #80,d0
     e26:	|  |      movea.l d0,a1
     e28:	|  |      lea 120(a1),a4
     e2c:	|  |      move.l 89b98 <Sw_ViewBufferP1>,d0
     e32:	|  |      add.l a4,d0
     e34:	|  |      move.l d0,80(a0)
  custom->bltbpt = Sw_XMaskRight+Sw_CopyLines[Sw_framecountscreen]*40;
     e38:	|  |      move.w d1,d0
     e3a:	|  |      mulu.w #40,d0
     e3e:	|  |      addi.l #501792,d0
     e44:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     e48:	|  |      lea 38(a1),a1
     e4c:	|  |      move.l 89b9c <Sw_DrawBuffer>,d0
     e52:	|  |      add.l a1,d0
     e54:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     e58:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     e5c:	|  |      move.w #255,d0
     e60:	|  |      sub.w d1,d0
     e62:	|  |      lsl.w #6,d0
     e64:	|  |      addi.w #21,d0
     e68:	|  |      move.w d0,88(a0)
  WaitBlit();
     e6c:	|  |      movea.l (a2),a6
     e6e:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     e72:	|  |      movea.l 89cb4 <custom>,a1
     e78:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     e7e:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     e84:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     e8a:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     e90:	|  |      move.w #0,66(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     e96:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     e9c:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     ea2:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     ea8:	|  |      add.l d0,d0
     eaa:	|  |      move.w (0,a3,d0.l),d1
     eae:	|  |      moveq #0,d2
     eb0:	|  |      move.w d1,d2
     eb2:	|  |      movea.l d2,a0
     eb4:	|  |      addq.l #1,a0
     eb6:	|  |      move.l a0,d0
     eb8:	|  |      add.l a0,d0
     eba:	|  |      add.l d0,d0
     ebc:	|  |      add.l a0,d0
     ebe:	|  |      lsl.l #4,d0
     ec0:	|  |      movea.l 89b98 <Sw_ViewBufferP1>,a0
     ec6:	|  |      adda.l d0,a0
     ec8:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     ecc:	|  |      movea.w #-80,a0
     ed0:	|  |      adda.l d0,a0
     ed2:	|  |      move.l 89b9c <Sw_DrawBuffer>,d0
     ed8:	|  |      add.l a0,d0
     eda:	|  |      move.l d0,84(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     ede:	|  |      mulu.w #40,d1
     ee2:	|  |      addi.l #491550,d1
     ee8:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     eec:	|  |      moveq #0,d0
     eee:	|  |      not.b d0
     ef0:	|  |      sub.l d2,d0
     ef2:	|  |      lsl.w #6,d0
     ef4:	|  |      addi.w #20,d0
     ef8:	|  |      move.w d0,88(a1)
  WaitBlit();
     efc:	|  |      movea.l (a2),a6
     efe:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     f02:	|  |      movea.l 89cb4 <custom>,a1
     f08:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     f0e:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     f14:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     f1a:	|  |      move.w #40,96(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     f20:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     f26:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     f2c:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     f32:	|  |      add.l d0,d0
     f34:	|  |      move.w (0,a3,d0.l),d1
     f38:	|  |      move.w d1,d2
     f3a:	|  |      movea.l d2,a0
     f3c:	|  |      addq.l #1,a0
     f3e:	|  |      move.l a0,d0
     f40:	|  |      add.l a0,d0
     f42:	|  |      add.l d0,d0
     f44:	|  |      add.l a0,d0
     f46:	|  |      lsl.l #4,d0
     f48:	|  |      movea.l 89b98 <Sw_ViewBufferP1>,a0
     f4e:	|  |      adda.l d0,a0
     f50:	|  |      move.l a0,80(a1)
  custom->bltbpt = Sw_XMaskLeft+Sw_CopyLines[Sw_framecountscreen]*40;
     f54:	|  |      mulu.w #40,d1
     f58:	|  |      addi.l #491550,d1
     f5e:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     f62:	|  |      movea.w #-80,a0
     f66:	|  |      adda.l d0,a0
     f68:	|  |      move.l 89b9c <Sw_DrawBuffer>,d0
     f6e:	|  |      add.l a0,d0
     f70:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     f74:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     f78:	|  |      moveq #0,d0
     f7a:	|  |      not.b d0
     f7c:	|  |      sub.l d2,d0
     f7e:	|  |      lsl.w #6,d0
     f80:	|  |      addi.w #20,d0
     f84:	|  |      move.w d0,88(a1)
  WaitBlit();
     f88:	|  |      movea.l (a2),a6
     f8a:	|  |      jsr -228(a6)
  custom->color[0] = 0x00;
     f8e:	|  |      movea.l 89cb4 <custom>,a0
     f94:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     f9a:	|  |      move.l 89b94 <Sw_framecountscreen>,d0
     fa0:	|  |      addq.l #1,d0
     fa2:	|  |      moveq #17,d1
     fa4:	|  |      cmp.l d0,d1
     fa6:	|  |  /-- beq.s fb4 <Sw_Run+0x32c>
     fa8:	|  |  |   move.l d0,89b94 <Sw_framecountscreen>
}
     fae:	|  |  |   movem.l (sp)+,d2-d4/a2-a4/a6
     fb2:	|  |  |   rts
     fb4:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
     fb6:	|  |      move.l d0,89b94 <Sw_framecountscreen>
}
     fbc:	|  |      movem.l (sp)+,d2-d4/a2-a4/a6
     fc0:	|  |      rts
    Sw_framecount = 0;
     fc2:	|  \----> clr.l 65a52 <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
     fc8:	|         move.l 89baa <Sw_FontBuffer>,d3
      *target++ = pattern;
     fce:	|         pea fa0 <Sw_Run+0x318>
     fd2:	|         clr.l -(sp)
     fd4:	|         move.l d3,-(sp)
     fd6:	|         jsr 58f6 <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
     fda:	|         movea.l 89b90 <Sw_textoffset>,a3
     fe0:	|         adda.l #414976,a3
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
     fe6:	|         move.b (a3),d0
     fe8:	|         ext.w d0
     fea:	|         movea.w d0,a2
     fec:	|         lea -32(a2),a2
     ff0:	|         lea 12(sp),sp
    int x = 0;
     ff4:	|         moveq #0,d2
     ff6:	|         lea 424f2 <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
     ffc:	|         move.w #3204,d4
    WaitBlit();
    1000:	|     /-> movea.l 89cb0 <GfxBase>,a6
    1006:	|     |   jsr -228(a6)
    custom->bltamod = 0;
    100a:	|     |   move.w #0,dff064 <_end+0xd753a8>
    custom->bltbmod = 72;
    1012:	|     |   move.w #72,dff062 <_end+0xd753a6>
    custom->bltdmod = 72;
    101a:	|     |   move.w #72,dff066 <_end+0xd753aa>
    custom->bltafwm = 0xffff;
    1022:	|     |   move.w #-1,dff044 <_end+0xd75388>
    custom->bltalwm = 0xffff;
    102a:	|     |   move.w #-1,dff046 <_end+0xd7538a>
    custom->bltcon1 = 0;  
    1032:	|     |   move.w #0,dff042 <_end+0xd75386>
    custom->bltcon0 = 0xdfc + (restx << 12);
    103a:	|     |   move.w d2,d0
    103c:	|     |   moveq #12,d1
    103e:	|     |   lsl.w d1,d0
    1040:	|     |   addi.w #3580,d0
    1044:	|     |   move.w d0,dff040 <_end+0xd75384>
    custom->bltapt = font+4*50*index;
    104a:	|     |   move.l a2,d0
    104c:	|     |   add.l a2,d0
    104e:	|     |   add.l a2,d0
    1050:	|     |   lsl.l #3,d0
    1052:	|     |   add.l a2,d0
    1054:	|     |   lsl.l #4,d0
    1056:	|     |   addi.l #453548,d0
    105c:	|     |   move.l d0,dff050 <_end+0xd75394>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    1062:	|     |   move.l d2,d0
    1064:	|     |   asr.l #4,d0
    1066:	|     |   add.l d0,d0
    1068:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
    106a:	|     |   move.l d0,dff04c <_end+0xd75390>
    custom->bltdpt = targetlocation;
    1070:	|     |   move.l d0,dff054 <_end+0xd75398>
    custom->bltsize = 4+64*50;
    1076:	|     |   move.w d4,dff058 <_end+0xd7539c>
        x += LetterSize[*text++ - 0x20];
    107c:	|     |   move.b (a3)+,d0
    107e:	|     |   ext.w d0
    1080:	|     |   move.b (-32,a4,d0.w),d0
    1084:	|     |   andi.l #255,d0
    108a:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
    108c:	|     |   move.b (a3),d0
    108e:	|     |   ext.w d0
    1090:	|     |   movea.w d0,a2
    1092:	|     |   lea -32(a2),a2
    1096:	|     |   moveq #0,d0
    1098:	|     |   move.b (0,a4,a2.l),d0
    109c:	|     |   add.l d2,d0
    109e:	|     |   cmpi.l #639,d0
    10a4:	|     \-- ble.w 1000 <Sw_Run+0x378>
    Sw_textoffset += 40;
    10a8:	|         moveq #40,d0
    10aa:	|         add.l 89b90 <Sw_textoffset>,d0
    10b0:	|         move.l d0,89b90 <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    10b6:	|         cmpi.l #1279,d0
    10bc:	|     /-- ble.s 10cc <Sw_Run+0x444>
      Sw_textoffset = 0;
    10be:	|     |   clr.l 89b90 <Sw_textoffset>
      SwScrollerFinished = 1;
    10c4:	|     |   move.w #1,89caa <SwScrollerFinished>
  Sw_framecount++;
    10cc:	|     \-> move.l 65a52 <Sw_framecount>,d0
    10d2:	|         addq.l #1,d0
    10d4:	|         move.l d0,65a52 <Sw_framecount>
  while ( Sw_BlitFrame == 0)
    10da:	\-------- bra.w ca2 <Sw_Run+0x1a>

000010de <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
    10de:	    movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    10e2:	    movea.l 89cb8 <SysBase>,a6
    10e8:	    move.l #1360,d0
    10ee:	    moveq #2,d1
    10f0:	    jsr -198(a6)
    10f4:	    movea.l d0,a2
  if( retval == 0) {
    10f6:	    tst.l d0
    10f8:	/-- beq.w 125e <Sw_ClBuild+0x180>
    *cl++ = *clpartinstruction++;
    10fc:	|   move.l 654c0 <Sw_ClsSprites>,(a2)
    1102:	|   move.l 654c4 <Sw_ClsSprites+0x4>,4(a2)
    110a:	|   move.l 654c8 <Sw_ClsSprites+0x8>,8(a2)
    1112:	|   move.l 654cc <Sw_ClsSprites+0xc>,12(a2)
    111a:	|   move.l 654d0 <Sw_ClsSprites+0x10>,16(a2)
    1122:	|   move.l 654d4 <Sw_ClsSprites+0x14>,20(a2)
    112a:	|   move.l 654d8 <Sw_ClsSprites+0x18>,24(a2)
    1132:	|   move.l 654dc <Sw_ClsSprites+0x1c>,28(a2)
    113a:	|   move.l 654e0 <Sw_ClsSprites+0x20>,32(a2)
    1142:	|   move.l 654e4 <Sw_ClsSprites+0x24>,36(a2)
    114a:	|   move.l 654e8 <Sw_ClsSprites+0x28>,40(a2)
    1152:	|   move.l 654ec <Sw_ClsSprites+0x2c>,44(a2)
    115a:	|   move.l 654f0 <Sw_ClsSprites+0x30>,48(a2)
    1162:	|   move.l 654f4 <Sw_ClsSprites+0x34>,52(a2)
    116a:	|   move.l 654f8 <Sw_ClsSprites+0x38>,56(a2)
    1172:	|   move.l 654fc <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    117a:	|   move.l 65490 <Sw_ClScreen>,64(a2)
    1182:	|   move.l 65494 <Sw_ClScreen+0x4>,68(a2)
    118a:	|   move.l 65498 <Sw_ClScreen+0x8>,72(a2)
    1192:	|   move.l 6549c <Sw_ClScreen+0xc>,76(a2)
    119a:	|   move.l 654a0 <Sw_ClScreen+0x10>,80(a2)
    11a2:	|   move.l 654a4 <Sw_ClScreen+0x14>,84(a2)
    11aa:	|   move.l 654a8 <Sw_ClScreen+0x18>,88(a2)
    11b2:	|   move.l 654ac <Sw_ClScreen+0x1c>,92(a2)
    11ba:	|   move.l 654b0 <Sw_ClScreen+0x20>,96(a2)
    11c2:	|   move.l 654b4 <Sw_ClScreen+0x24>,100(a2)
    11ca:	|   move.l 654b8 <Sw_ClScreen+0x28>,104(a2)
    11d2:	|   move.l 654bc <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    11da:	|   move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    11e2:	|   move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    11ea:	|   move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    11f2:	|   move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    11fa:	|   move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    1202:	|   move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    120a:	|   move.l 65450 <Sw_ClColor>,136(a2)
    1212:	|   move.l 65454 <Sw_ClColor+0x4>,140(a2)
    121a:	|   move.l 65458 <Sw_ClColor+0x8>,144(a2)
    1222:	|   move.l 6545c <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    122a:	|   pea 1bc <main+0x156>
    122e:	|   pea 7704 <incbin_Sw_ClColorDim_start>
    1234:	|   pea 152(a2)
    1238:	|   jsr 5918 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    123c:	|   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    1244:	|   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    124c:	|   moveq #-2,d0
    124e:	|   move.l d0,604(a2)
  return (UWORD *) retval;  
    1252:	|   lea 12(sp),sp
}
    1256:	|   move.l a2,d0
    1258:	|   movem.l (sp)+,d2-d3/a2/a6
    125c:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    125e:	\-> movea.l 89cac <DOSBase>,a6
    1264:	    jsr -60(a6)
    1268:	    movea.l 89cac <DOSBase>,a6
    126e:	    move.l d0,d1
    1270:	    move.l #246501,d2
    1276:	    moveq #40,d3
    1278:	    jsr -48(a6)
    Exit(1);
    127c:	    movea.l 89cac <DOSBase>,a6
    1282:	    moveq #1,d1
    1284:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1288:	    move.l 654c0 <Sw_ClsSprites>,(a2)
    128e:	    move.l 654c4 <Sw_ClsSprites+0x4>,4(a2)
    1296:	    move.l 654c8 <Sw_ClsSprites+0x8>,8(a2)
    129e:	    move.l 654cc <Sw_ClsSprites+0xc>,12(a2)
    12a6:	    move.l 654d0 <Sw_ClsSprites+0x10>,16(a2)
    12ae:	    move.l 654d4 <Sw_ClsSprites+0x14>,20(a2)
    12b6:	    move.l 654d8 <Sw_ClsSprites+0x18>,24(a2)
    12be:	    move.l 654dc <Sw_ClsSprites+0x1c>,28(a2)
    12c6:	    move.l 654e0 <Sw_ClsSprites+0x20>,32(a2)
    12ce:	    move.l 654e4 <Sw_ClsSprites+0x24>,36(a2)
    12d6:	    move.l 654e8 <Sw_ClsSprites+0x28>,40(a2)
    12de:	    move.l 654ec <Sw_ClsSprites+0x2c>,44(a2)
    12e6:	    move.l 654f0 <Sw_ClsSprites+0x30>,48(a2)
    12ee:	    move.l 654f4 <Sw_ClsSprites+0x34>,52(a2)
    12f6:	    move.l 654f8 <Sw_ClsSprites+0x38>,56(a2)
    12fe:	    move.l 654fc <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1306:	    move.l 65490 <Sw_ClScreen>,64(a2)
    130e:	    move.l 65494 <Sw_ClScreen+0x4>,68(a2)
    1316:	    move.l 65498 <Sw_ClScreen+0x8>,72(a2)
    131e:	    move.l 6549c <Sw_ClScreen+0xc>,76(a2)
    1326:	    move.l 654a0 <Sw_ClScreen+0x10>,80(a2)
    132e:	    move.l 654a4 <Sw_ClScreen+0x14>,84(a2)
    1336:	    move.l 654a8 <Sw_ClScreen+0x18>,88(a2)
    133e:	    move.l 654ac <Sw_ClScreen+0x1c>,92(a2)
    1346:	    move.l 654b0 <Sw_ClScreen+0x20>,96(a2)
    134e:	    move.l 654b4 <Sw_ClScreen+0x24>,100(a2)
    1356:	    move.l 654b8 <Sw_ClScreen+0x28>,104(a2)
    135e:	    move.l 654bc <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    1366:	    move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    136e:	    move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    1376:	    move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    137e:	    move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    1386:	    move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    138e:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    1396:	    move.l 65450 <Sw_ClColor>,136(a2)
    139e:	    move.l 65454 <Sw_ClColor+0x4>,140(a2)
    13a6:	    move.l 65458 <Sw_ClColor+0x8>,144(a2)
    13ae:	    move.l 6545c <Sw_ClColor+0xc>,148(a2)
    *cl++ = *clpartinstruction++;
    13b6:	    pea 1bc <main+0x156>
    13ba:	    pea 7704 <incbin_Sw_ClColorDim_start>
    13c0:	    pea 152(a2)
    13c4:	    jsr 5918 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    13c8:	    move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    13d0:	    move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    13d8:	    moveq #-2,d0
    13da:	    move.l d0,604(a2)
  return (UWORD *) retval;  
    13de:	    lea 12(sp),sp
}
    13e2:	    move.l a2,d0
    13e4:	    movem.l (sp)+,d2-d3/a2/a6
    13e8:	    rts

000013ea <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    13ea:	moveq #0,d0
    13ec:	move.w 89b8c <Sw_ScreenBufferOffset>,d0
    13f2:	lea 89b50 <Sw_ScreenBufferList>,a0
    13f8:	move.l d0,d1
    13fa:	add.l d0,d1
    13fc:	add.l d1,d1
    13fe:	move.l (0,a0,d1.l),89b9c <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1406:	addq.l #1,d0
    1408:	add.l d0,d0
    140a:	add.l d0,d0
    140c:	move.l (0,a0,d0.l),d0
    1410:	move.l d0,89b98 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    1416:	moveq #80,d1
    1418:	add.l d0,d1

  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    141a:	movea.l 89b4c <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    1420:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    1424:	clr.w d0
    1426:	swap d0
    1428:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    142c:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    1430:	clr.w d1
    1432:	swap d1
    1434:	move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

}
    1438:	rts

0000143a <Sw_SetColors>:

UWORD ColPos = 0;

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    143a:	          movea.l 89b4c <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    1440:	          move.w 6544c <FrameCountBufferDraw>,d0
    1446:	          lea 65450 <Sw_ClColor>,a1
    144c:	          andi.l #65535,d0
    1452:	          lsl.l #4,d0
    1454:	          move.l (0,a1,d0.l),136(a0)
    145a:	          move.w 6544c <FrameCountBufferDraw>,d0
    1460:	          andi.l #65535,d0
    1466:	          add.l d0,d0
    1468:	          add.l d0,d0
    146a:	          addq.l #1,d0
    146c:	          add.l d0,d0
    146e:	          add.l d0,d0
    1470:	          move.l (0,a1,d0.l),140(a0)
    1476:	          move.w 6544c <FrameCountBufferDraw>,d0
    147c:	          andi.l #65535,d0
    1482:	          add.l d0,d0
    1484:	          add.l d0,d0
    1486:	          addq.l #2,d0
    1488:	          add.l d0,d0
    148a:	          add.l d0,d0
    148c:	          move.l (0,a1,d0.l),144(a0)
    1492:	          move.w 6544c <FrameCountBufferDraw>,d0
    1498:	          andi.l #65535,d0
    149e:	          add.l d0,d0
    14a0:	          add.l d0,d0
    14a2:	          addq.l #3,d0
    14a4:	          add.l d0,d0
    14a6:	          add.l d0,d0
    14a8:	          move.l (0,a1,d0.l),148(a0)
  for(int i=0;i<4;i++) {
    14ae:	          lea 152(a0),a0
  }
  if( ColPos == 12) {
    14b2:	          cmpi.w #12,89b4a <ColPos>
    14ba:	   /----- beq.s 14f0 <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    14bc:	/--|----> move.w 89b48 <Sw_ClColorDimPos>,d0
    14c2:	|  |      moveq #0,d1
    14c4:	|  |      move.w d0,d1
    14c6:	|  |      addi.l #30468,d1
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    14cc:	|  |      addi.w #444,d0

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    14d0:	|  |      cmpi.w #22643,d0
    14d4:	|  |  /-- bls.s 14d8 <Sw_SetColors+0x9e>
    14d6:	|  |  |   clr.w d0
    Sw_ClColorDimPos = 0;
    14d8:	|  |  \-> move.w d0,89b48 <Sw_ClColorDimPos>
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    14de:	|  |      pea 1bc <main+0x156>
    14e2:	|  |      move.l d1,-(sp)
    14e4:	|  |      move.l a0,-(sp)
    14e6:	|  |      jsr 5936 <memmove>(pc)

  }
}
    14ea:	|  |      lea 12(sp),sp
    14ee:	|  |      rts
    ColPos = 0;
    14f0:	|  \----> clr.w 89b4a <ColPos>
    14f6:	\-------- bra.s 14bc <Sw_SetColors+0x82>

000014f8 <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    14f8:	    movea.l 89cb4 <custom>,a0
    14fe:	    move.w #32,156(a0)
  if(Sw_MusicDelay > 0) {
    1504:	    move.w 6544e <Sw_MusicDelay>,d0
    150a:	/-- beq.s 1514 <Sw_VblankHandler+0x1c>
    Sw_MusicDelay--;
    150c:	|   subq.w #1,d0
    150e:	|   move.w d0,6544e <Sw_MusicDelay>
  if( Sw_InitComplete == 1) {
    1514:	\-> cmpi.w #1,89b8e <Sw_InitComplete>
    151c:	/-- beq.s 1520 <Sw_VblankHandler+0x28>
}
    151e:	|   rts
    if( FrameCountBufferDraw == 2) {
    1520:	\-> move.w 6544c <FrameCountBufferDraw>,d0
    1526:	    cmpi.w #2,d0
    152a:	/-- beq.s 1542 <Sw_VblankHandler+0x4a>
      FrameCountBufferDraw++;
    152c:	|   move.w 6544c <FrameCountBufferDraw>,d0
    1532:	|   addq.w #1,d0
    1534:	|   move.w d0,6544c <FrameCountBufferDraw>
    Sw_SetBplPointers();
    153a:	|   jsr 13ea <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    153e:	|   bra.w 143a <Sw_SetColors>
      FrameCountBufferDraw = 0;
    1542:	\-> move.w #0,6544c <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    154a:	    move.w #1,89ba0 <Sw_BlitFrame>
      if(Sw_ScreenBufferOffset == 0) { 
    1552:	    tst.w 89b8c <Sw_ScreenBufferOffset>
    1558:	/-- bne.s 156a <Sw_VblankHandler+0x72>
        Sw_ScreenBufferOffset = 2; 
    155a:	|   move.w #2,89b8c <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1562:	|   jsr 13ea <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1566:	|   bra.w 143a <Sw_SetColors>
        Sw_ScreenBufferOffset = 0; 
    156a:	\-> clr.w 89b8c <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1570:	    jsr 13ea <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    1574:	    bra.w 143a <Sw_SetColors>

00001578 <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    1578:	rts

0000157a <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    157a:	movea.l 89cb4 <custom>,a0
    1580:	move.w #32,156(a0)
  //p61Music();
}
    1586:	rts

00001588 <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    1588:	                                                             lea -20(sp),sp
    158c:	                                                             movem.l d2-d5/a2,-(sp)
    1590:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    1594:	                                                             movea.l 89c8a <DrawCopper>,a1
    159a:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    159e:	                                                             movea.l 89b3c <DrawBuffer>,a0
    15a4:	                                                             move.w 52(a0),d0
    15a8:	                                                /----------- bmi.w 1748 <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    15ac:	                                                |            move.w 54(a0),d2
    15b0:	                                                |     /----- bmi.w 1704 <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    15b4:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    15b6:	                                                |     |      move.w d2,d4
    15b8:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    15ba:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    15be:	                                                |     |      cmp.w d1,d0
    15c0:	                                          /-----|-----|----- bhi.w 17f0 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    15c4:	                                          |     |     |      move.w #70,30(sp)
    15ca:	                                          |     |     |      move.w d2,32(sp)
    15ce:	                                          |     |     |      move.w #109,34(sp)
    15d4:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    15da:	                                          |     |     |      clr.w 20(sp)
    15de:	                                          |     |     |      move.w #1,22(sp)
    15e4:	                                          |     |     |      move.w #2,24(sp)
    15ea:	                                          |     |     |      move.w #3,26(sp)
    15f0:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    15f6:	                                          |     |     |      cmpi.w #69,d2
    15fa:	                                       /--|-----|-----|----- bhi.w 1786 <SetCl+0x1fe>
              values[j] = values[j + 1];
    15fe:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1602:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    1608:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    160e:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1612:	                                       |  |  |  |     |      moveq #70,d0
    1614:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    1618:	|                                      |  |  |  |     |  /-- bcc.s 162a <SetCl+0xa2>
              int temp2 = ids[j];
    161a:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    1620:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    1624:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    162a:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    162e:	|                                      |  |  |  |     |      cmp.w a0,d0
    1630:	|                                      |  |  |  |     |  /-- bcc.s 164e <SetCl+0xc6>
              int temp2 = ids[j];
    1632:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    1636:	|                                      |  |  |  |     |  |   move.w d0,d2
    1638:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    163c:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1642:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    1646:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    164a:	|                                      |  |  |  |     |  |   move.w a0,d0
    164c:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    164e:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1652:	|                                      |  |  |  |     |      cmp.w d0,d2
    1654:	|                                      |  |  |  |     |  /-- bcc.s 166e <SetCl+0xe6>
              int temp2 = ids[j];
    1656:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    165a:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    165e:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    1664:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    1668:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    166c:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    166e:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    1672:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    1676:	|                                      |  |  |  |     |  /-- bcc.s 168a <SetCl+0x102>
              int temp2 = ids[j];
    1678:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    167c:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    1680:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    1686:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    168a:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    168c:	|                                      |  |  |  |     |  /-- bcc.s 16a4 <SetCl+0x11c>
              int temp2 = ids[j];
    168e:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    1692:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    1696:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    169c:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    16a0:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    16a4:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    16a8:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    16ac:	|                                      |  |  |  |     |  /-- bcc.s 16d0 <SetCl+0x148>
              int temp2 = ids[j];
    16ae:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    16b2:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    16b8:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    16bc:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    16c0:	|                                      |  |  |  |     |  +-- bcc.s 16d0 <SetCl+0x148>
              int temp2 = ids[j];
    16c2:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    16c6:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    16cc:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    16d0:	|                                      |  |  |  |     |  \-> move.w d1,d0
    16d2:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    16d4:	|                                      |  |  |  |     |      addi.w #11521,d0
    16d8:	|                                      |  |  |  |     |      cmpi.w #210,d1
    16dc:	|                                      |  |  |  |     |  /-- bhi.w 17cc <SetCl+0x244>
    switch( ids[i]) 
    16e0:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    16e6:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 1fd8 <SetCl+0xa50>
    16ea:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    16ec:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    16f0:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    16f2:	|  |                                   |  |  |  |     |  |   move.w (16fa <SetCl+0x172>,pc,d1.l),d1
    16f6:	|  |                                   |  |  |  |     |  |   jmp (16fa <SetCl+0x172>,pc,d1.w)
    16fa:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    16fe:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1704:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    1706:	|  |                                   |  |  |  |  /-----|-- bhi.w 1830 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    170a:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1710:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1716:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    171c:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1722:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    1728:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    172c:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    172e:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1732:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    1738:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    173e:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1742:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    1744:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 1614 <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1748:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    174e:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    1754:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    175a:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1760:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    1764:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    176a:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    1770:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    1776:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    177c:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    1780:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1784:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    1786:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    178a:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    178e:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 1614 <SetCl+0x8c>
              int temp2 = ids[j];
    1792:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    1796:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    179c:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    17a2:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    17a6:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    17aa:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    17ae:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 1fc0 <SetCl+0xa38>
              values[j] = values[j + 1];
    17b2:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    17b8:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    17be:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    17c2:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    17c6:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    17c8:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 1614 <SetCl+0x8c>
    switch( ids[i]) 
    17cc:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    17d2:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 1fc6 <SetCl+0xa3e>
    17d6:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    17d8:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    17dc:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    17de:	|  |  |  |                             |  |  |     |  |      move.w (17e6 <SetCl+0x25e>,pc,d1.l),d1
    17e2:	|  |  |  |                             |  |  |     |  |      jmp (17e6 <SetCl+0x25e>,pc,d1.w)
    17e6:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    17e8:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    17ee:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    17f2:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    17f8:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    17fc:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1802:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1808:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    180c:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1812:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    1818:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    181e:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    1824:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    1828:	|  |  |  |                             |     \-----|--|----- bls.w 15fe <SetCl+0x76>
    182c:	|  |  |  |                             \-----------|--|----- bra.w 1786 <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1830:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1832:	|  |  |  |                                            |      move.w #109,34(sp)
    1838:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    183e:	|  |  |  |                                            |      move.w #2,24(sp)
    1844:	|  |  |  |                                            |      move.w #3,26(sp)
    184a:	|  |  |  |                                            |      move.w #4,28(sp)
    1850:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    1854:	|  |  |  |                                            |      clr.w d3
    1856:	|  |  |  |                                            \----- bra.w 172e <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    185a:	|  |  |  |                                                   cmpi.w #211,d3
    185e:	|  |  |  |                                               /-- bls.s 1870 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    1860:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1866:	|  |  |  |                                               |   lea 172(a1),a2
    186a:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1870:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1872:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1878:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    187e:	|  |  |  |                                                   lea 8(a2),a0
    1882:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    1888:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    188e:	|  |  |  |  /--|-------------------------------------------- bhi.w 1fde <SetCl+0xa56>
    1892:	|  |  |  |  |  |                                             moveq #0,d1
    1894:	|  |  |  |  |  |                                             move.w 22(sp),d1
    1898:	|  |  |  |  |  |                                             add.l d1,d1
    189a:	|  |  |  |  |  |                                             move.w (18a2 <SetCl+0x31a>,pc,d1.l),d1
    189e:	|  |  |  |  |  |                                             jmp (18a2 <SetCl+0x31a>,pc,d1.w)
    18a2:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    18a6:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    18b0:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    18b8:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    18be:	|  |  |  |  |  |                                             lea 176(a1),a0
    18c2:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    18c8:	|  |  |  |  |  +-------------------------------------------- bra.s 1888 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    18ca:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    18d0:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    18d6:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    18dc:	|  |  |  |  |  |                                             lea 176(a1),a0
    18e0:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    18e6:	|  |  |  |  |  +-------------------------------------------- bra.s 1888 <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    18e8:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    18ee:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    18f4:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    18fa:	|  |  |  |  |  |                                             lea 176(a1),a0
    18fe:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    1904:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    190a:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 1fea <SetCl+0xa62>
    190e:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1910:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    1914:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    1916:	|  |  |  |  |  |  |  |                                       move.w (191e <SetCl+0x396>,pc,d1.l),d1
    191a:	|  |  |  |  |  |  |  |                                       jmp (191e <SetCl+0x396>,pc,d1.w)
    191e:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1920:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    1924:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    1926:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1928:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    192e:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1934:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    193a:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    193e:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    1944:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1904 <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    1946:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    194a:	|  |  |  |  |  |  |  |                                   /-- bls.s 195c <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    194c:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1952:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    1956:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    195c:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    195e:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1964:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    196a:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    196e:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    1974:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1904 <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1976:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    197c:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1982:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    1988:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    198c:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    1992:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1904 <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1996:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    199c:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    19a2:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    19a8:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19ac:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    19b2:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 1888 <SetCl+0x300>
        *tmp++ = line + 0x001;
    19b6:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    19ba:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    19c0:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    19c6:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    19ca:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    19d0:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1904 <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    19d4:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    19d8:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    19de:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    19e4:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    19e8:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    19ee:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    19f4:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 1fd2 <SetCl+0xa4a>
    19f8:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    19fa:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    19fe:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1a00:	|  |  |  |  |  |  |  |  |  |                                 move.w (1a08 <SetCl+0x480>,pc,d1.l),d1
    1a04:	|  |  |  |  |  |  |  |  |  |                                 jmp (1a08 <SetCl+0x480>,pc,d1.w)
    1a08:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1a0a:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1a0c:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1a14:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    1a16:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a1c:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1a22:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a26:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1a2c:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 19ee <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1a2e:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1a32:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1a40 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    1a34:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1a38:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1a3e:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1a40:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1a42:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1a48:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1a4e:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a52:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    1a58:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 19ee <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1a5a:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1a5e:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a64:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1a6a:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a6e:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    1a74:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 19ee <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1a78:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1a7c:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1a82:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1a88:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1a8c:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    1a92:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    1a98:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 1fe4 <SetCl+0xa5c>
    1a9c:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    1a9e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    1aa2:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    1aa4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (1aac <SetCl+0x524>,pc,d1.l),d1
    1aa8:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (1aac <SetCl+0x524>,pc,d1.w)
    1aac:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    1aae:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    1ab0:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    1ab2:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    1ab4:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ab6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1aba:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ac0:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ac6:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1aca:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    1ad0:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1a92 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    1ad2:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    1ad6:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 1ae4 <SetCl+0x55c>
          *tmp++ = 0xffdf;
    1ad8:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1adc:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    1ae2:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1ae4:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1ae6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1aec:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1af2:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1af6:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1afc:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1a92 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1afe:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1b02:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1b08:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1b0e:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b12:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    1b18:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1a92 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1b1c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1b1e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1b24:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1b2a:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1b2e:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    1b34:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1a92 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1b38:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1b3c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b42:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1b48:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1b4c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1b52:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    1b58:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 2006 <SetCl+0xa7e>
    1b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1b6c <SetCl+0x5e4>,pc,d1.l),d1
    1b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1b6c <SetCl+0x5e4>,pc,d1.w)
    1b6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b52 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1ba6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    1bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b52 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    1bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    1bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1b52 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    1bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 1bda <SetCl+0x652>
          *tmp++ = 0xffdf;
    1bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1be8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1bec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1b52 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1c16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 1ff0 <SetCl+0xa68>
    1c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1c20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1c2a <SetCl+0x6a2>,pc,d1.l),d1
    1c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1c2a <SetCl+0x6a2>,pc,d1.w)
    1c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1c2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1c34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    1c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c10 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    1c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1c62 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    1c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1c5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    1c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    1c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    1c7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1c10 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1c8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    1c96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c10 <SetCl+0x688>
        *tmp++ = line + 0x001;
    1c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    1c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    1ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    1cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1c10 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    1cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1ce4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    1ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    1cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    1d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    1d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 1d24 <SetCl+0x79c>
          *tmp++ = 0xffdf;
    1d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    1d32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    1d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    1d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    1d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 1d90 <SetCl+0x808>
          *tmp++ = 0xffdf;
    1d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    1d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    1d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    1da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    1dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    1db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    1db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    1dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    1dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    1dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    1ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 1fcc <SetCl+0xa44>
    1de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    1de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    1de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    1de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (1df0 <SetCl+0x868>,pc,d1.l),d1
    1dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (1df0 <SetCl+0x868>,pc,d1.w)
    1df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    1df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    1df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    1dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    1e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1dd6 <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    1e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    1e1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 1e28 <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    1e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1e20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    1e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1e28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1e30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    1e36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    1e40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 1dd6 <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1e42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1e4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1e52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    1e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    1e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 1dd6 <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1e60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1e64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1e70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    1e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    1e7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    1e80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 1ff0 <SetCl+0xa68>
    1e84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    1e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    1e8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    1e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (1e94 <SetCl+0x90c>,pc,d1.l),d1
    1e90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (1e94 <SetCl+0x90c>,pc,d1.w)
    1e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    1e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    1e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    1e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    1e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1eae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    1eb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1e7a <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    1eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    1ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 1ecc <SetCl+0x944>
          *tmp++ = 0xffdf;
    1ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    1eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    1ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 1e7a <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1ee6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1ef6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    1f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1e7a <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f16 <SetCl+0x98e>
          *tmp++ = 0xffdf;
    1f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 1e7a <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f44 <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    1f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    1f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1f44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    1f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    1f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    1f5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 1dd6 <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1f72 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    1f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1f6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    1f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    1f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1f7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    1f80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    1f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    1f8a:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 19ee <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    1f8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    1f92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 1fa4 <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    1f94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1f9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    1f9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    1fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    1fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    1fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    1fbc:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1888 <SetCl+0x300>
    1fc0:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    1fc2:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1614 <SetCl+0x8c>
    switch( ids[i]) 
    1fc6:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    1fc8:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1888 <SetCl+0x300>
    1fcc:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    1fce:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 1e7a <SetCl+0x8f2>
    1fd2:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    1fd4:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 1dd6 <SetCl+0x84e>
    1fd8:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    1fda:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 1904 <SetCl+0x37c>
    1fde:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    1fe0:	                  |     \-----|--|--|--|--|--|-------------- bra.w 19ee <SetCl+0x466>
    1fe4:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    1fe6:	                  |           |     |  \--|--|-------------- bra.w 1b52 <SetCl+0x5ca>
    1fea:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    1fec:	                              \-----|-----|--|-------------- bra.w 1a92 <SetCl+0x50a>
    1ff0:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    1ff2:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    1ff6:	                                    |     |                  move.w #-2,2(a0)
}
    1ffc:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    2000:	                                    |     |                  lea 20(sp),sp
    2004:	                                    |     |                  rts
    switch( ids[i]) 
    2006:	                                    \-----|----------------> movea.l a0,a1
    2008:	                                          \----------------- bra.w 1c10 <SetCl+0x688>

0000200c <LoadVectors>:
{
    200c:	       move.l a3,-(sp)
    200e:	       move.l a2,-(sp)
    2010:	       movea.l 12(sp),a2
    2014:	       movea.l 16(sp),a1
    2018:	       movea.l 20(sp),a3
  while( *source != 127) {
    201c:	       move.w (a2),d0
    201e:	       movea.l a3,a0
    2020:	       cmpi.w #127,d0
    2024:	/----- beq.s 207a <LoadVectors+0x6e>
    *target++ = *source++;
    2026:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    2028:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    202e:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    2034:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    203a:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    2040:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    2046:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    204c:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    2052:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    2058:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    205e:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    2064:	|  |   lea 24(a2),a2
    2068:	|  |   lea 24(a0),a0
    206c:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    2072:	|  |   move.w (a2),d0
    2074:	|  |   cmpi.w #127,d0
    2078:	|  \-- bne.s 2026 <LoadVectors+0x1a>
  while( *source2 != 127) {  
    207a:	\----> move.b (a1),d0
    207c:	       cmpi.b #127,d0
    2080:	/----- beq.w 213a <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    2084:	|  /-> ext.w d0
    2086:	|  |   add.w (a3),d0
    2088:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    208a:	|  |   move.b 1(a1),d0
    208e:	|  |   ext.w d0
    2090:	|  |   add.w 2(a3),d0
    2094:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    2098:	|  |   move.b 2(a1),d0
    209c:	|  |   ext.w d0
    209e:	|  |   add.w 4(a3),d0
    20a2:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    20a6:	|  |   move.b 3(a1),d0
    20aa:	|  |   ext.w d0
    20ac:	|  |   add.w 6(a3),d0
    20b0:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    20b4:	|  |   move.b 4(a1),d0
    20b8:	|  |   ext.w d0
    20ba:	|  |   add.w 8(a3),d0
    20be:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    20c2:	|  |   move.b 5(a1),d0
    20c6:	|  |   ext.w d0
    20c8:	|  |   add.w 10(a3),d0
    20cc:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    20d0:	|  |   move.b 6(a1),d0
    20d4:	|  |   ext.w d0
    20d6:	|  |   add.w 12(a3),d0
    20da:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    20de:	|  |   move.b 7(a1),d0
    20e2:	|  |   ext.w d0
    20e4:	|  |   add.w 14(a3),d0
    20e8:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    20ec:	|  |   move.b 8(a1),d0
    20f0:	|  |   ext.w d0
    20f2:	|  |   add.w 16(a3),d0
    20f6:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    20fa:	|  |   move.b 9(a1),d0
    20fe:	|  |   ext.w d0
    2100:	|  |   add.w 18(a3),d0
    2104:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    2108:	|  |   move.b 10(a1),d0
    210c:	|  |   ext.w d0
    210e:	|  |   add.w 20(a3),d0
    2112:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    2116:	|  |   lea 24(a3),a3
    211a:	|  |   lea 12(a1),a1
    211e:	|  |   lea 24(a0),a0
    2122:	|  |   move.b -1(a1),d0
    2126:	|  |   ext.w d0
    2128:	|  |   add.w -2(a3),d0
    212c:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    2130:	|  |   move.b (a1),d0
    2132:	|  |   cmpi.b #127,d0
    2136:	|  \-- bne.w 2084 <LoadVectors+0x78>
}
    213a:	\----> movea.l (sp)+,a2
    213c:	       movea.l (sp)+,a3
    213e:	       rts

00002140 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    2140:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    2144:	    movea.l 89cb8 <SysBase>,a6
    214a:	    move.l #1360,d0
    2150:	    moveq #2,d1
    2152:	    jsr -198(a6)
    2156:	    movea.l d0,a2
  
  if( retval == 0) {
    2158:	    tst.l d0
    215a:	/-- beq.w 22ea <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    215e:	|   move.l 44688 <ClsSprites>,(a2)
    2164:	|   move.l 4468c <ClsSprites+0x4>,4(a2)
    216c:	|   move.l 44690 <ClsSprites+0x8>,8(a2)
    2174:	|   move.l 44694 <ClsSprites+0xc>,12(a2)
    217c:	|   move.l 44698 <ClsSprites+0x10>,16(a2)
    2184:	|   move.l 4469c <ClsSprites+0x14>,20(a2)
    218c:	|   move.l 446a0 <ClsSprites+0x18>,24(a2)
    2194:	|   move.l 446a4 <ClsSprites+0x1c>,28(a2)
    219c:	|   move.l 446a8 <ClsSprites+0x20>,32(a2)
    21a4:	|   move.l 446ac <ClsSprites+0x24>,36(a2)
    21ac:	|   move.l 446b0 <ClsSprites+0x28>,40(a2)
    21b4:	|   move.l 446b4 <ClsSprites+0x2c>,44(a2)
    21bc:	|   move.l 446b8 <ClsSprites+0x30>,48(a2)
    21c4:	|   move.l 446bc <ClsSprites+0x34>,52(a2)
    21cc:	|   move.l 446c0 <ClsSprites+0x38>,56(a2)
    21d4:	|   move.l 446c4 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    21dc:	|   move.l 44658 <ClScreen>,64(a2)
    21e4:	|   move.l 4465c <ClScreen+0x4>,68(a2)
    21ec:	|   move.l 44660 <ClScreen+0x8>,72(a2)
    21f4:	|   move.l 44664 <ClScreen+0xc>,76(a2)
    21fc:	|   move.l 44668 <ClScreen+0x10>,80(a2)
    2204:	|   move.l 4466c <ClScreen+0x14>,84(a2)
    220c:	|   move.l 44670 <ClScreen+0x18>,88(a2)
    2214:	|   move.l 44674 <ClScreen+0x1c>,92(a2)
    221c:	|   move.l 44678 <ClScreen+0x20>,96(a2)
    2224:	|   move.l 4467c <ClScreen+0x24>,100(a2)
    222c:	|   move.l 44680 <ClScreen+0x28>,104(a2)
    2234:	|   move.l 44684 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    223c:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    2244:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    224c:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    2254:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    225c:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    2264:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    226c:	|   move.l 44638 <ClColor>,136(a2)
    2274:	|   move.l 4463c <ClColor+0x4>,140(a2)
    227c:	|   move.l 44640 <ClColor+0x8>,144(a2)
    2284:	|   move.l 44644 <ClColor+0xc>,148(a2)
    228c:	|   move.l 44648 <ClColor+0x10>,152(a2)
    2294:	|   move.l 4464c <ClColor+0x14>,156(a2)
    229c:	|   move.l 44650 <ClColor+0x18>,160(a2)
    22a4:	|   move.l 44654 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    22ac:	|   move.l 445e8 <ClToggleBitPlanes>,168(a2)
    22b4:	|   move.l 445ec <ClToggleBitPlanes+0x4>,172(a2)
    22bc:	|   move.l 445f0 <ClToggleBitPlanes+0x8>,176(a2)
    22c4:	|   move.l 445f4 <ClToggleBitPlanes+0xc>,180(a2)
    22cc:	|   move.l 445f8 <ClToggleBitPlanes+0x10>,184(a2)
    22d4:	|   move.l 445fc <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    22dc:	|   moveq #-2,d0
    22de:	|   move.l d0,192(a2)
  return retval;  
}
    22e2:	|   move.l a2,d0
    22e4:	|   movem.l (sp)+,d2-d3/a2/a6
    22e8:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    22ea:	\-> movea.l 89cac <DOSBase>,a6
    22f0:	    jsr -60(a6)
    22f4:	    movea.l 89cac <DOSBase>,a6
    22fa:	    move.l d0,d1
    22fc:	    move.l #246501,d2
    2302:	    moveq #40,d3
    2304:	    jsr -48(a6)
    Exit(1);
    2308:	    movea.l 89cac <DOSBase>,a6
    230e:	    moveq #1,d1
    2310:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    2314:	    move.l 44688 <ClsSprites>,(a2)
    231a:	    move.l 4468c <ClsSprites+0x4>,4(a2)
    2322:	    move.l 44690 <ClsSprites+0x8>,8(a2)
    232a:	    move.l 44694 <ClsSprites+0xc>,12(a2)
    2332:	    move.l 44698 <ClsSprites+0x10>,16(a2)
    233a:	    move.l 4469c <ClsSprites+0x14>,20(a2)
    2342:	    move.l 446a0 <ClsSprites+0x18>,24(a2)
    234a:	    move.l 446a4 <ClsSprites+0x1c>,28(a2)
    2352:	    move.l 446a8 <ClsSprites+0x20>,32(a2)
    235a:	    move.l 446ac <ClsSprites+0x24>,36(a2)
    2362:	    move.l 446b0 <ClsSprites+0x28>,40(a2)
    236a:	    move.l 446b4 <ClsSprites+0x2c>,44(a2)
    2372:	    move.l 446b8 <ClsSprites+0x30>,48(a2)
    237a:	    move.l 446bc <ClsSprites+0x34>,52(a2)
    2382:	    move.l 446c0 <ClsSprites+0x38>,56(a2)
    238a:	    move.l 446c4 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    2392:	    move.l 44658 <ClScreen>,64(a2)
    239a:	    move.l 4465c <ClScreen+0x4>,68(a2)
    23a2:	    move.l 44660 <ClScreen+0x8>,72(a2)
    23aa:	    move.l 44664 <ClScreen+0xc>,76(a2)
    23b2:	    move.l 44668 <ClScreen+0x10>,80(a2)
    23ba:	    move.l 4466c <ClScreen+0x14>,84(a2)
    23c2:	    move.l 44670 <ClScreen+0x18>,88(a2)
    23ca:	    move.l 44674 <ClScreen+0x1c>,92(a2)
    23d2:	    move.l 44678 <ClScreen+0x20>,96(a2)
    23da:	    move.l 4467c <ClScreen+0x24>,100(a2)
    23e2:	    move.l 44680 <ClScreen+0x28>,104(a2)
    23ea:	    move.l 44684 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    23f2:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    23fa:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2402:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    240a:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2412:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    241a:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    2422:	    move.l 44638 <ClColor>,136(a2)
    242a:	    move.l 4463c <ClColor+0x4>,140(a2)
    2432:	    move.l 44640 <ClColor+0x8>,144(a2)
    243a:	    move.l 44644 <ClColor+0xc>,148(a2)
    2442:	    move.l 44648 <ClColor+0x10>,152(a2)
    244a:	    move.l 4464c <ClColor+0x14>,156(a2)
    2452:	    move.l 44650 <ClColor+0x18>,160(a2)
    245a:	    move.l 44654 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    2462:	    move.l 445e8 <ClToggleBitPlanes>,168(a2)
    246a:	    move.l 445ec <ClToggleBitPlanes+0x4>,172(a2)
    2472:	    move.l 445f0 <ClToggleBitPlanes+0x8>,176(a2)
    247a:	    move.l 445f4 <ClToggleBitPlanes+0xc>,180(a2)
    2482:	    move.l 445f8 <ClToggleBitPlanes+0x10>,184(a2)
    248a:	    move.l 445fc <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    2492:	    moveq #-2,d0
    2494:	    move.l d0,192(a2)
}
    2498:	    move.l a2,d0
    249a:	    movem.l (sp)+,d2-d3/a2/a6
    249e:	    rts

000024a0 <SetBplPointers>:

void SetBplPointers() {
    24a0:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    24a2:	    movea.w 89828 <ScreenBufferOffset>,a0
    24a8:	    moveq #0,d0
    24aa:	    move.w a0,d0
    24ac:	    lea 89bb6 <ScreenBufferList>,a2
    24b2:	    move.l d0,d1
    24b4:	    add.l d0,d1
    24b6:	    add.l d1,d1
    24b8:	    move.l (0,a2,d1.l),89b3c <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    24c0:	    move.l d0,d1
    24c2:	    addq.l #1,d1
    24c4:	    add.l d1,d1
    24c6:	    add.l d1,d1
    24c8:	    movea.l (0,a2,d1.l),a1
    24cc:	    move.l a1,89b2c <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    24d2:	    addq.l #2,d0
    24d4:	    add.l d0,d0
    24d6:	    add.l d0,d0
    24d8:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    24dc:	    move.w a0,d0
    24de:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    24e0:	    cmpi.w #8,d0
    24e4:	/-- bls.s 24e8 <SetBplPointers+0x48>
    24e6:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    24e8:	\-> move.l d1,89b30 <ClearBuffer>
  ScreenBufferOffset += 3;
    24ee:	    move.w d0,89828 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    24f4:	    move.w 54(a1),d0
    24f8:	    ext.l d0
    24fa:	    lsl.l #6,d0
    24fc:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    24fe:	    movea.l 89c8a <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    2504:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    2508:	    move.l d0,d1
    250a:	    clr.w d1
    250c:	    swap d1
    250e:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2512:	    move.l d0,d1
    2514:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    251a:	    move.w d1,126(a0)
  highword = ptr >> 16;
    251e:	    clr.w d1
    2520:	    swap d1
    2522:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    2526:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    252c:	    move.w d0,134(a0)
  highword = ptr >> 16;
    2530:	    clr.w d0
    2532:	    swap d0
    2534:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    2538:	    movea.l (sp)+,a2
    253a:	    rts

0000253c <KPrintF>:
void KPrintF(const char* fmt, ...) {
    253c:	    lea -128(sp),sp
    2540:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    2544:	    move.w f0ff60 <_end+0xe862a4>,d0
    254a:	    cmpi.w #20153,d0
    254e:	/-- beq.s 257a <KPrintF+0x3e>
    2550:	|   cmpi.w #-24562,d0
    2554:	+-- beq.s 257a <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    2556:	|   movea.l 89cb8 <SysBase>,a6
    255c:	|   movea.l 144(sp),a0
    2560:	|   lea 148(sp),a1
    2564:	|   lea 5a7e <KPutCharX>,a2
    256a:	|   suba.l a3,a3
    256c:	|   jsr -522(a6)
}
    2570:	|   movem.l (sp)+,a2-a3/a6
    2574:	|   lea 128(sp),sp
    2578:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    257a:	\-> movea.l 89cb8 <SysBase>,a6
    2580:	    movea.l 144(sp),a0
    2584:	    lea 148(sp),a1
    2588:	    lea 5a8c <PutChar>,a2
    258e:	    lea 12(sp),a3
    2592:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    2596:	    move.l a3,-(sp)
    2598:	    pea 56 <_start+0x56>
    259c:	    jsr f0ff60 <_end+0xe862a4>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    25a2:	    addq.l #8,sp
}
    25a4:	    movem.l (sp)+,a2-a3/a6
    25a8:	    lea 128(sp),sp
    25ac:	    rts

000025ae <DrawRect>:
{  
    25ae:	                                                                                                                                                             lea -24(sp),sp
    25b2:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    25b6:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    25ba:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    25be:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    25c2:	                                                                                                                                                             tst.w d0
    25c4:	                                                                                                               /-------------------------------------------- blt.w 27de <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    25c8:	                                                                                                               |                                             move.w d0,d4
    25ca:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    25cc:	                                                                                                               |                                             cmpi.w #256,d0
    25d0:	                                                                                                               |                                         /-- ble.s 25dc <DrawRect+0x2e>
}
    25d2:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    25d6:	                                                                                                               |        |                                |   lea 24(sp),sp
    25da:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    25dc:	                                                                                                               |        |                                \-> movea.w d1,a0
    25de:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    25e2:	                                                                                                               |        |                                    cmpa.w #256,a0
    25e6:	                                                                                                            /--|--------|----------------------------------- ble.w 2806 <DrawRect+0x258>
    height = 256 - square->YPosMin;
    25ea:	                                                                                                            |  |        |                                    move.w #256,d5
    25ee:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    25f0:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    25f2:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    25f6:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    25fa:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 27f4 <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    25fe:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    2600:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    2604:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    2606:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 25d2 <DrawRect+0x24>
    2608:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    260c:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 25d2 <DrawRect+0x24>
    260e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    2612:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 25d2 <DrawRect+0x24>
  xlength = xlength/16;
    2614:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    2616:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    2618:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    261a:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    261e:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    2620:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    2622:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    2624:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    2626:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    2628:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    262a:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    262c:	                                                                                                            |  |  |  |  |  |  |                              movea.l 89c9a <PrepareBuffer>,a1
    2632:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2634:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd75346>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    263a:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd75346>,d0
    2640:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    2644:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 263a <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    2646:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0;
    264e:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd75386>
  custom->bltadat = data;
    2656:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd753b8>
  custom->bltdpt = Target;  
    265e:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd75398>
  custom->bltdmod = mod;
    2664:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd753aa>
  custom->bltsize = lines*64+linelength;
    266a:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    266c:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    266e:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd7539c>
    custom->bltcon1 = 0x0000;      
    2674:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd75386>
    custom->bltcdat = 0x0;
    267c:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd753b4>
    BltCon0LineDraw = 0x0500;
    2684:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,8982a <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    268c:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    268e:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    2692:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    2696:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    269a:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    269c:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    269e:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    26a2:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 2efa <DrawRect+0x94c>
  if(height != 0) {
    26a6:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    26a8:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 2f0e <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    26ac:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,8982a <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    26b4:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    26b8:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    26bc:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    26be:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    26c0:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    26c4:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 2cd2 <DrawRect+0x724>
  if(height != 0) {
    26c8:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    26ca:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 2ce6 <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    26ce:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    26d2:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    26d6:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    26d8:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    26da:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    26de:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 2ac2 <DrawRect+0x514>
  if(height != 0) {
    26e2:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    26e4:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 2ad6 <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    26e8:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    26ea:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    26ee:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    26f0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    26f2:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    26f6:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 2880 <DrawRect+0x2d2>
  if(height != 0) {
    26fa:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    26fc:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 2894 <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2700:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 89c9a <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2706:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    270a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    270c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    270e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    2714:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 89b3c <DrawBuffer>,a0
    271a:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    271c:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    271e:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2720:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2722:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2724:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd75346>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    272a:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd75346>,d1
    2730:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2732:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    2736:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    273a:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 272a <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    273c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd753a8>
  custom->bltbmod = 64 - length*2;
    2742:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd753a6>
  custom->bltdmod = 64 - length*2;  
    2748:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd753aa>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    274e:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2752:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 280e <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    2756:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    2758:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 310a <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    275c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    2762:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    2766:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    2768:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    276a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    276c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    2772:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    2774:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    2776:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    277a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    277e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    2782:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    2786:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    278a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 286c <DrawRect+0x2be>
    278e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    2790:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    2794:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 283e <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    2798:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd75384>
    custom->bltapt = (UBYTE *)bltapt;
    279e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd75394>
    custom->bltbpt = (UBYTE *)bltdpt;
    27a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd75390>
    custom->bltdpt = (UBYTE *)bltdpt;
    27aa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd75398>
    custom->bltsize = bltsize;
    27b0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd7539c>
    bltdpt += 64*256;
    27b6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    27ba:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd75346>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    27c0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd75346>,d0
    27c6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    27ca:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 27c0 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    27cc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    27ce:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    27d0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 25d2 <DrawRect+0x24>
    if( planes > 1) {
    27d4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    27d8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 278e <DrawRect+0x1e0>
    27da:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 286c <DrawRect+0x2be>
    height += square->YPosMin;
    27de:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    27e0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    27e2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    27e4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    27e6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    27e8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    27ec:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    27f0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 25fe <DrawRect+0x50>
    xlength += xposmin - 16;    
    27f4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    27f6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    27f8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    27fc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2800:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2802:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 2604 <DrawRect+0x56>
  WORD height = square->Height;
    2806:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    2808:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    280a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 25f2 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    280e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    2814:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    281a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    281c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    281e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2820:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    2826:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    2828:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    282a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    282e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2832:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    2836:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    283a:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 2786 <DrawRect+0x1d8>
    283e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2840:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd75384>
    custom->bltapt = (UBYTE *)bltapt;
    2846:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd75394>
    custom->bltbpt = (UBYTE *)bltdpt;
    284c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd75390>
    custom->bltdpt = (UBYTE *)bltdpt;
    2852:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd75398>
    custom->bltsize = bltsize;
    2858:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd7539c>
    bltdpt += 64*256;
    285e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2862:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd75346>,d0
    2868:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 27c0 <DrawRect+0x212>
      bit = color & 1;
    286c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    286e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    2872:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    2874:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    2876:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    287a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 2798 <DrawRect+0x1ea>
    287e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 283e <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    2880:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 3c30b <incbin_MercuryLetterData2Lz4_end+0x27>
    2886:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    288a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 253c <KPrintF>(pc)
    288e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    2890:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    2894:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    2896:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2700 <DrawRect+0x152>
      WORD length = x1 - x2;
    289a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    289e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    28a0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    28a2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28a4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    28a6:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 31cc <DrawRect+0xc1e>
    28aa:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    28ae:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    28b2:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    28b4:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    28b6:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2a40 <DrawRect+0x492>
      height += 1; 
    28ba:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    28bc:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    28be:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    28c2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 28ca <DrawRect+0x31c>
    28c4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    28ca:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    28ce:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    28d2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    28d4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    28d6:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2a4e <DrawRect+0x4a0>
      if(yposmin <= 0) {
    28da:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    28dc:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    28de:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 2a34 <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    28e2:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    28e4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    28ea:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 2a9a <DrawRect+0x4ec>
    28ee:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    28f4:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 34c4 <DrawRect+0xf16>
    28f8:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    28fe:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 3494 <DrawRect+0xee6>
          startx -= 1;
    2902:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2906:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    2908:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    290a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    290c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 2aac <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2910:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2912:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2914:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    2916:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    2918:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    291a:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    291c:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 2a86 <DrawRect+0x4d8>
    2920:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2922:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    2924:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2926:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    292c:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    292e:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2930:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2932:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    2934:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    2936:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 33d4 <DrawRect+0xe26>
    293a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    293e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2940:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2942:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    2944:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2948:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    294e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2950:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2952:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    2954:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    2956:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    2958:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    295a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    295c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    295e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2960:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2962:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2964:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    2966:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    2968:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    296a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    296c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    296e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    2970:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    2972:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    2974:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    2976:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    2978:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    297a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    297c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    297e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    2980:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2984:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    2986:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    2988:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 3c4da <LookupSlope>,a1
    298e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    2990:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    2992:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    2996:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    2998:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    299a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    299c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    299e:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2a66 <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29a2:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75346>,d0
    29a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75346>,d0
    29b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    29b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 29aa <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    29b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    29b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 8982a <BltCon0LineDraw>,d0
    29be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    29c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75384>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    29c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 89c9a <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    29ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 89c9e <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    29d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd75390>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    29da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    29dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    29de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    29e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    29e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd7538c>
  custom->bltdpt = (UBYTE *)bltdpt;  
    29e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75398>
  custom->bltbmod = bltbmod;
    29ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd753a6>
  custom->bltcmod = bltdmod;
    29f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd753a4>
  custom->bltdmod = bltdmod;
    29fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd753aa>
  custom->bltsize = bltwidth + 64*height;
    2a00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2a02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    2a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    2a06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd7539c>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2a12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    2a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2a1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 89b3c <DrawBuffer>,a0
    2a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2a22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    2a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    2a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd75346>,d1
    2a30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 272a <DrawRect+0x17c>
        starty += 96;
    2a34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 28e2 <DrawRect+0x334>
        height = -height;
    2a40:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2a42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    2a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    2a46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2a4a:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 28ba <DrawRect+0x30c>
        startx += 96;
    2a4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    2a54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2a58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2a5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2a60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 28e2 <DrawRect+0x334>
    2a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 2a34 <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2a66:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 3c321 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 253c <KPrintF>(pc)
    2a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    2a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd75346>,d0
    2a80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2a82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 29aa <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    2a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    2a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    2a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    2a8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    2a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    2a96:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 292c <DrawRect+0x37e>
          height *= -1;
    2a9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    2a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    2a9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2aa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    2aa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    2aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    2aa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2910 <DrawRect+0x362>
    2aac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    2ab0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    2ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2ab4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    2ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    2ab8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    2aba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    2abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2920 <DrawRect+0x372>
    2ac0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 2a86 <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    2ac2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 3c30b <incbin_MercuryLetterData2Lz4_end+0x27>
    2ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    2acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 253c <KPrintF>(pc)
    2ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    2ad2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    2ad6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    2ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 2c4a <DrawRect+0x69c>
      WORD length = x1 - x2;
    2adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    2ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    2ae2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2ae4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    2ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    2ae8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 332e <DrawRect+0xd80>
    2aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2af2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    2af4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    2af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2afa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 2c7e <DrawRect+0x6d0>
      height += 1; 
    2b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2b02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    2b08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2b12 <DrawRect+0x564>
    2b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2b16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2b1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2b1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 2c66 <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    2b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    2b26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 2c5a <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2b2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 317e <DrawRect+0xbd0>
    2b34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    2b36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    2b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 2cbc <DrawRect+0x70e>
    2b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2b40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 3182 <DrawRect+0xbd4>
          height *= -1;
    2b44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    2b46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2b4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 2cc2 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2b4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    2b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 2cac <DrawRect+0x6fe>
    2b58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2b5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2b60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3352 <DrawRect+0xda4>
    2b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2b7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2b82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2b8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    2bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 3c4da <LookupSlope>,a0
    2bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2c8a <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75346>,d0
    2be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75346>,d0
    2bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2be4 <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2bf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 8982a <BltCon0LineDraw>,a0
    2bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2bfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75384>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2c0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 89c9a <PrepareBuffer>,a5
    2c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 89c9e <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2c18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd75390>
  custom->bltcpt = (UBYTE *)bltdpt;
    2c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd7538c>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2c24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75398>
  custom->bltbmod = bltbmod;
    2c2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd753a6>
  custom->bltcmod = bltdmod;
    2c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd753a4>
  custom->bltdmod = bltdmod;
    2c38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd753aa>
  custom->bltsize = bltwidth + 64*height;
    2c3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2c42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd7539c>
  WORD x1 = square->Vertices[index1].X;
    2c4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    2c4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2c52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    2c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 26e8 <DrawRect+0x13a>
        starty += 96;
    2c5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    2c5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    2c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2b2a <DrawRect+0x57c>
        startx += 96;
    2c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    2c6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    2c70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    2c74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    2c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    2c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2b2a <DrawRect+0x57c>
    2c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 2c5a <DrawRect+0x6ac>
        height = -height;
    2c7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    2c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    2c82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    2c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    2c86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2b00 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 3c321 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    2c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 253c <KPrintF>(pc)
    2c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    2c9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2c9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd75346>,d0
    2ca4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    2ca8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2be4 <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    2cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    2cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    2cb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    2cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    2cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2b60 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    2cbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    2cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2b4e <DrawRect+0x5a0>
    2cc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    2cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    2cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    2cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    2ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 2b58 <DrawRect+0x5aa>
    2cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 2cac <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    2cd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 3c30b <incbin_MercuryLetterData2Lz4_end+0x27>
    2cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    2cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 253c <KPrintF>(pc)
    2ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    2ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    2ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    2ce8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 2e56 <DrawRect+0x8a8>
      WORD length = x1 - x2;
    2cec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    2cf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    2cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    2cf4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    2cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    2cf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 3292 <DrawRect+0xce4>
    2cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    2d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    2d04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    2d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    2d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 2e8a <DrawRect+0x8dc>
      height += 1; 
    2d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    2d0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    2d14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 2d1c <DrawRect+0x76e>
    2d16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2d20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    2d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    2d26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    2d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 2e72 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    2d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    2d2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    2d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 2e66 <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    2d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    2d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    2d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 2ed2 <DrawRect+0x924>
    2d40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    2d46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3482 <DrawRect+0xed4>
    2d4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    2d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3452 <DrawRect+0xea4>
          startx -= 1;
    2d54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2d58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    2d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    2d5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    2d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 2ee4 <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    2d62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    2d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    2d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    2d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    2d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 2ebe <DrawRect+0x910>
    2d72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    2d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    2d76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    2d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2d82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    2d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    2d88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 32b2 <DrawRect+0xd04>
    2d8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    2d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2d9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2da6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2dac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    2dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    2dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    2dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    2dcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    2dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    2dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 3c4da <LookupSlope>,a1
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    2de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 2e98 <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75346>,d0
    2dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2e02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2df8 <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 8982a <BltCon0LineDraw>,d0
    2e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2e0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75384>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2e18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 89c9a <PrepareBuffer>,a5
    2e1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2e20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 89c9e <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd75390>
  custom->bltcpt = (UBYTE *)bltdpt;
    2e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd7538c>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75398>
  custom->bltbmod = bltbmod;
    2e38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd753a6>
  custom->bltcmod = bltdmod;
    2e3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd753a4>
  custom->bltdmod = bltdmod;
    2e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd753aa>
  custom->bltsize = bltwidth + 64*height;
    2e4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    2e4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2e4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd7539c>
  WORD x1 = square->Vertices[index1].X;
    2e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    2e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    2e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    2e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 26ce <DrawRect+0x120>
        starty += 96;
    2e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    2e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 2d34 <DrawRect+0x786>
        startx += 96;
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    2e78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2e7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2e80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    2e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    2e84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 2d34 <DrawRect+0x786>
    2e88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 2e66 <DrawRect+0x8b8>
        height = -height;
    2e8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    2e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    2e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    2e90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    2e94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 2d0c <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 3c321 <incbin_MercuryLetterData2Lz4_end+0x3d>
    2e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    2ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    2ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 253c <KPrintF>(pc)
    2eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    2eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2eb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 2df8 <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    2ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    2ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    2ec4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    2ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    2ece:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 2d7e <DrawRect+0x7d0>
          height *= -1;
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    2ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    2ed6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    2edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    2ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    2ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 2d62 <DrawRect+0x7b4>
    2ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    2ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    2eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2eec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    2eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    2ef0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    2ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    2ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 2d72 <DrawRect+0x7c4>
    2ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 2ebe <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    2efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 3c30b <incbin_MercuryLetterData2Lz4_end+0x27>
    2f00:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 253c <KPrintF>(pc)
    2f08:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    2f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    2f0e:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    2f10:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 3082 <DrawRect+0xad4>
      WORD length = x1 - x2;
    2f14:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    2f18:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    2f1a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    2f1e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    2f20:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 31ec <DrawRect+0xc3e>
    2f24:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    2f28:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    2f2a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    2f2c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    2f2e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    2f32:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    2f34:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 30b6 <DrawRect+0xb08>
      height += 1; 
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    2f3a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2f3c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 2f4a <DrawRect+0x99c>
    2f42:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    2f44:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    2f48:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2f4a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2f52:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    2f54:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    2f56:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 309e <DrawRect+0xaf0>
      if(yposmin <= 0) {
    2f5a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    2f5c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 3092 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    2f62:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    2f64:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    2f66:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    2f68:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 312e <DrawRect+0xb80>
    2f6c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    2f6e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 30f4 <DrawRect+0xb46>
    2f74:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    2f76:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    2f78:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 3132 <DrawRect+0xb84>
          height *= -1;
    2f7c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    2f7e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2f80:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    2f82:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 30fa <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    2f86:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    2f88:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2f8a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    2f8c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 30e4 <DrawRect+0xb36>
    2f90:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2f92:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2f94:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2f98:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2f9a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2f9c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2f9e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2fa2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 3210 <DrawRect+0xc62>
    2fa6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2faa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2fac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    2fae:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2fb8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2fba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2fbc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    2fbe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2fc0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    2fc2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    2fc4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2fc6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2fc8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2fca:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2fcc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    2fd0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2fd4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2fd6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    2fd8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2fda:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    2fdc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2fe0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2fe2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2fe4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2fea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2fec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2fee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2ff2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    2ff6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 3c4da <LookupSlope>,a0
    2ffc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    2ffe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    3000:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    3004:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    3006:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    300a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    300c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    300e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 30c2 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3012:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd75346>,d0
    3018:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    301c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd75346>,d0
    3022:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    3026:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 301c <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    3028:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    302c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 8982a <BltCon0LineDraw>,a0
    3032:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    3034:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    3036:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    3038:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd75384>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    303e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    3040:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    3042:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 89c9a <PrepareBuffer>,a5
    3048:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    304a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 89c9e <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    3050:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd75390>
  custom->bltcpt = (UBYTE *)bltdpt;
    3056:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd7538c>
  custom->bltdpt = (UBYTE *)bltdpt;  
    305c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd75398>
  custom->bltbmod = bltbmod;
    3062:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd753a6>
  custom->bltcmod = bltdmod;
    306a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd753a4>
  custom->bltdmod = bltdmod;
    3070:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd753aa>
  custom->bltsize = bltwidth + 64*height;
    3076:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    3078:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    307a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    307c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd7539c>
  WORD x1 = square->Vertices[index1].X;
    3082:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    3086:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    308a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    308e:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 26ac <DrawRect+0xfe>
        starty += 96;
    3092:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    3096:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    309a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 2f62 <DrawRect+0x9b4>
        startx += 96;
    309e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    30a4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    30a8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    30ac:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    30ae:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    30b0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 2f62 <DrawRect+0x9b4>
    30b4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 3092 <DrawRect+0xae4>
        height = -height;
    30b6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    30b8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    30ba:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    30bc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    30be:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 2f38 <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    30c2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 3c321 <incbin_MercuryLetterData2Lz4_end+0x3d>
    30c8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    30cc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 253c <KPrintF>(pc)
    30d0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    30d2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    30d6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd75346>,d0
    30dc:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    30e0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 301c <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    30e4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    30e8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    30ea:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    30ec:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    30f0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 2f98 <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    30f4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    30f6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 2f86 <DrawRect+0x9d8>
    30fa:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    30fe:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    3100:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    3102:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    3104:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 2f90 <DrawRect+0x9e2>
    3108:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 30e4 <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    310a:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    310c:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    310e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    3110:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    3116:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    3118:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    311a:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    311e:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    3122:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    3126:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    312a:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 2786 <DrawRect+0x1d8>
          height *= -1;
    312e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    3130:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    3132:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    3136:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    313a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 316a <DrawRect+0xbbc>
    313c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    313e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3140:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    3142:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    3144:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    3146:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    3148:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 3158 <DrawRect+0xbaa>
    314a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    314c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    314e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3150:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    3154:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 2f98 <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    3158:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    315c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    315e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3160:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3162:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    3166:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 2f98 <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    316a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    316e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    3170:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3172:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    3174:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    3176:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    3178:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    317a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 314a <DrawRect+0xb9c>
    317c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 3158 <DrawRect+0xbaa>
          height *= -1;
    317e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    3180:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    3182:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    3186:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    318a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 31a8 <DrawRect+0xbfa>
    318c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    318e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3190:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    3192:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    3194:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    3196:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    3198:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 31ba <DrawRect+0xc0c>
    319a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    319c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    319e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    31a0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    31a4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2b60 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    31a8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    31ac:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    31ae:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    31b0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    31b2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    31b4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    31b6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    31b8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 319a <DrawRect+0xbec>
    31ba:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    31be:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    31c0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    31c2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    31c4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    31c8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2b60 <DrawRect+0x5b2>
        length *= -1;
    31cc:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    31ce:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    31d0:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    31d2:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    31d6:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    31da:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    31e0:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    31e2:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    31e4:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 28ba <DrawRect+0x30c>
    31e8:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2a40 <DrawRect+0x492>
        length *= -1;
    31ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    31ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    31f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    31f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    31f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    31fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    31fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    3200:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    3202:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    3206:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    3208:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 2f38 <DrawRect+0x98a>
    320c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 30b6 <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    3210:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    3212:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    3214:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    3216:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    321a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    321c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    321e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    3220:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    3222:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    3226:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3228:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    322a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    322e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    3234:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    3236:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    3238:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    323a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    323c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    323e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    3240:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3242:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    3244:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    3246:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    3248:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    324a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    324c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3250:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3252:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    3254:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    3256:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    3258:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    325c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    325e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3260:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    3264:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3266:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3268:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    326a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    326e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    3270:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3272:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 3c4da <LookupSlope>,a0
    3278:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    327a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    327c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    3280:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    3282:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    3286:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    3288:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    328a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 3012 <DrawRect+0xa64>
    328e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 30c2 <DrawRect+0xb14>
        length *= -1;
    3292:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    3294:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    3296:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    3298:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    329c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    32a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    32a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    32a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    32aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 2d0c <DrawRect+0x75e>
    32ae:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 2e8a <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    32b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    32b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    32b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    32b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    32bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    32be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    32c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    32c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    32c4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    32c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    32ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    32cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    32ce:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    32d2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    32d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    32da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    32dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    32de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    32e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    32e2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    32e4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    32e6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    32e8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    32ea:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    32ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    32ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    32f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    32f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    32f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    32f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    32f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    32fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    32fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    32fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    3300:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3302:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    3304:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3306:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    3308:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    330a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    330e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    3310:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    3312:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 3c4da <LookupSlope>,a1
    3318:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    331a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    331c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    3320:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    3322:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    3324:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    3326:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 2df2 <DrawRect+0x844>
    332a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 2e98 <DrawRect+0x8ea>
        length *= -1;
    332e:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    3330:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    3332:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    3334:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    3338:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    333c:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    3340:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    3342:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    3344:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    3348:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    334a:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2b00 <DrawRect+0x552>
    334e:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 2c7e <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3352:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    3354:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    3356:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    3358:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    335c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    335e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    3360:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    3362:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    3364:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    3368:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    336a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    336c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    3370:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    3376:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    3378:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    337a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    337c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    337e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    3380:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3382:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    3384:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    3386:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    3388:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    338a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    338c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    338e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    3392:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    3394:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    3396:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    3398:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    339a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    339e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    33a0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33a2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    33a6:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33a8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    33aa:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    33ac:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    33b0:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    33b2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    33b4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 3c4da <LookupSlope>,a0
    33ba:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    33bc:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    33be:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    33c2:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    33c4:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    33c8:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    33ca:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    33cc:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 2bda <DrawRect+0x62c>
    33d0:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 2c8a <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    33d4:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    33d6:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    33d8:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    33da:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    33de:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    33e0:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    33e2:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    33e4:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    33e6:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    33ea:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    33ec:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    33ee:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    33f0:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    33f4:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    33fa:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    33fc:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    33fe:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    3400:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3402:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    3404:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    3406:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    3408:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    340a:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    340c:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    340e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3410:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    3412:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    3414:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    3416:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    3418:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    341a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    341c:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    341e:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3420:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    3422:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    3424:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    3426:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    3428:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    342a:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    342c:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    3430:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    3432:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    3434:	|  |  |  |  |                                                  |  |  |                                                                                       lea 3c4da <LookupSlope>,a1
    343a:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    343c:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    343e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    3442:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    3444:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    3446:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    3448:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    344a:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 29a2 <DrawRect+0x3f4>
    344e:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 2a66 <DrawRect+0x4b8>
          height *= -1;
    3452:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    3454:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    3456:	|  |  |                                                        |     |                                                                                       tst.w d3
    3458:	|  |  |                                                        |     |                                                                                /----- blt.s 3486 <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    345a:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    345c:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    345e:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    3460:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 3470 <DrawRect+0xec2>
    3462:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    3464:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    3466:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    346c:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 2d7e <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    3470:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    3474:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    3476:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    3478:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    347e:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 2d7e <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    3482:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    3484:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 345a <DrawRect+0xeac>
    3486:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    348a:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    348c:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    348e:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    3490:	|  |  |                                                                                                                                         |  \-------- bpl.s 3462 <DrawRect+0xeb4>
    3492:	|  |  |                                                                                                                                         \----------- bra.s 3470 <DrawRect+0xec2>
          height *= -1;
    3494:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    3496:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    3498:	|     |                                                                                                                                                      tst.w d3
    349a:	|     |                                                                                                                                               /----- blt.s 34c8 <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    349c:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    349e:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    34a0:	|     |                                                                                                                                               |  |   move.w a4,d0
    34a2:	|     |                                                                                                                                         /-----|--|-- bmi.s 34b2 <DrawRect+0xf04>
    34a4:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    34a6:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34a8:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34ae:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 292c <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    34b2:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    34b6:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    34b8:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    34ba:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    34c0:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 292c <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    34c4:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    34c6:	                                                                                                                                                |  |  |  \-- bge.s 349c <DrawRect+0xeee>
    34c8:	                                                                                                                                                |  |  \----> addi.w #15,d3
    34cc:	                                                                                                                                                |  |         asr.w #4,d3
    34ce:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    34d0:	                                                                                                                                                |  |         move.w a4,d0
    34d2:	                                                                                                                                                |  \-------- bpl.s 34a4 <DrawRect+0xef6>
    34d4:	                                                                                                                                                \----------- bra.s 34b2 <DrawRect+0xf04>

000034d6 <DrawCube3d>:
{
    34d6:	                                                                                                                      lea -72(sp),sp
    34da:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    34de:	                                                                                                                      movea.l 120(sp),a2
    34e2:	                                                                                                                      move.w 126(sp),108(sp)
    34e8:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    34ee:	                                                                                                                      move.w #0,dff042 <_end+0xd75386>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    34f6:	                                                                                                                      move.l 89b30 <ClearBuffer>,54(sp)
    34fe:	                                                                                                                      lea 8982c <Cubes>,a3
    3504:	                                                                                                                      moveq #0,d5
    3506:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    3508:	|                                                                                                                     add.l d5,d2
    350a:	|                                                                                                                     move.l d2,102(sp)
    350e:	|                                                                                                                     add.l d5,d2
    3510:	|                                                                                                                     add.l d2,d2
    3512:	|                                                                                                                     add.l d2,d2
    3514:	|                                                                                                                     movea.l 54(sp),a0
    3518:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    351c:	|                                                                                                                     movea.l 89cb0 <GfxBase>,a6
    3522:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    3526:	|                                                                                                                     move.w #496,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0;
    352e:	|                                                                                                                     move.w #0,dff042 <_end+0xd75386>
  custom->bltdmod = bltmod;
    3536:	|                                                                                                                     move.w d3,dff066 <_end+0xd753aa>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    353c:	|                                                                                                                     move.l 89b30 <ClearBuffer>,54(sp)
    3544:	|                                                                                                                     movea.l 54(sp),a4
    3548:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    354c:	|                                                                                                                     cmpa.w #0,a6
    3550:	|                       /-------------------------------------------------------------------------------------------- bne.w 3e5a <DrawCube3d+0x984>
    3554:	|                       |                                                                                             move.l d5,d1
    3556:	|                       |                                                                                             addq.l #1,d1
    3558:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    355c:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    355e:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    3564:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    3568:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    356c:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    3570:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    3574:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    3578:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    357c:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3582:	|                    |  |                                                                                             movea.w a0,a1
    3584:	|                    |  |                                                                                             subq.l #1,a1
    3586:	|                    |  |                                                                                             adda.l a1,a1
    3588:	|                    |  |                                                                                             lea 412fa <zMult>,a5
    358e:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    3594:	|                    |  |                                                                                             move.w 62(sp),d0
    3598:	|                    |  |                                                                                             muls.w d1,d0
    359a:	|                    |  |                                                                                             moveq #15,d7
    359c:	|                    |  |                                                                                             asr.l d7,d0
    359e:	|                    |  |                                                                                             movea.l d0,a1
    35a0:	|                    |  |                                                                                             lea 160(a1),a1
    35a4:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    35a8:	|                    |  |                                                                                             move.w 62(sp),d7
    35ac:	|                    |  |                                                                                             muls.w 86(sp),d7
    35b0:	|                    |  |                                                                                             moveq #15,d0
    35b2:	|                    |  |                                                                                             asr.l d0,d7
    35b4:	|                    |  |                                                                                             addi.w #128,d7
    35b8:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    35bc:	|                    |  |                                                                                             movea.w 10(a2),a1
    35c0:	|                    |  |                                                                                             subq.l #1,a1
    35c2:	|                    |  |                                                                                             adda.l a1,a1
    35c4:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    35ca:	|                    |  |                                                                                             move.w 70(sp),d7
    35ce:	|                    |  |                                                                                             muls.w 6(a2),d7
    35d2:	|                    |  |                                                                                             asr.l d0,d7
    35d4:	|                    |  |                                                                                             movea.l d7,a1
    35d6:	|                    |  |                                                                                             lea 160(a1),a1
    35da:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    35de:	|                    |  |                                                                                             move.w 70(sp),d7
    35e2:	|                    |  |                                                                                             muls.w 8(a2),d7
    35e6:	|                    |  |                                                                                             asr.l d0,d7
    35e8:	|                    |  |                                                                                             addi.w #128,d7
    35ec:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    35f0:	|                    |  |                                                                                             movea.w a4,a1
    35f2:	|                    |  |                                                                                             move.l a1,d7
    35f4:	|                    |  |                                                                                             subq.l #1,d7
    35f6:	|                    |  |                                                                                             add.l d7,d7
    35f8:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    35fe:	|                    |  |                                                                                             move.w 76(sp),d0
    3602:	|                    |  |                                                                                             muls.w d4,d0
    3604:	|                    |  |                                                                                             moveq #15,d7
    3606:	|                    |  |                                                                                             asr.l d7,d0
    3608:	|                    |  |                                                                                             movea.l d0,a5
    360a:	|                    |  |                                                                                             lea 160(a5),a5
    360e:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    3612:	|                    |  |                                                                                             move.w 76(sp),d7
    3616:	|                    |  |                                                                                             muls.w d3,d7
    3618:	|                    |  |                                                                                             moveq #15,d0
    361a:	|                    |  |                                                                                             asr.l d0,d7
    361c:	|                    |  |                                                                                             addi.w #128,d7
    3620:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    3624:	|                    |  |                                                                                             cmpa.w #0,a6
    3628:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 3634 <DrawCube3d+0x15e>
    362a:	|                    |  |  |                                                                                          tst.w 89b34 <DoNotClearDirty>
    3630:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 3e08 <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    3634:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    3638:	|                    |  |  |  |                                                                                       move.l a5,d7
    363a:	|                    |  |  |  |                                                                                       subq.l #1,d7
    363c:	|                    |  |  |  |                                                                                       add.l d7,d7
    363e:	|                    |  |  |  |                                                                                       lea 412fa <zMult>,a5
    3644:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    364a:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    364e:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3650:	|                    |  |  |  |                                                                                       moveq #15,d7
    3652:	|                    |  |  |  |                                                                                       asr.l d7,d0
    3654:	|                    |  |  |  |                                                                                       movea.l d0,a5
    3656:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    365a:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    365e:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    3662:	|                    |  |  |  |                                                                                       muls.w d6,d7
    3664:	|                    |  |  |  |                                                                                       moveq #15,d0
    3666:	|                    |  |  |  |                                                                                       asr.l d0,d7
    3668:	|                    |  |  |  |                                                                                       addi.w #128,d7
    366c:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3670:	|                    |  |  |  |                                                                                       move.l a1,d7
    3672:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    3678:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    367a:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    367c:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    3680:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3682:	|                    |  |  |  |                                                                                       muls.w d3,d0
    3684:	|                    |  |  |  |                                                                                       movea.l d1,a5
    3686:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    3688:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    368a:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    368c:	|                    |  |  |  |                                                                                       movea.w a0,a0
    368e:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    3690:	|                    |  |  |  |                                                                                       jsr 5984 <__mulsi3>
    3696:	|                    |  |  |  |                                                                                       addq.l #8,sp
    3698:	|                    |  |  |  |                                                                                       add.l a5,d0
    369a:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    369e:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    36a2:	|                    |  |  |  |                                                                                       neg.l d0
    36a4:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    36a8:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    36ac:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    36b0:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 36bc <DrawCube3d+0x1e6>
    36b2:	|                    |  |  |  |  |                                                                                    tst.w 89b34 <DoNotClearDirty>
    36b8:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 3dc8 <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    36bc:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    36c0:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    36c2:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36c4:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    36c6:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    36ca:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    36ce:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36d0:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    36d2:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36d4:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    36d6:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    36d8:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    36dc:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    36de:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    36e0:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    36e2:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    36e4:	|                    |  |  |  |  |  |                                                                                 jsr 5984 <__mulsi3>
    36ea:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    36ec:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    36ee:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    36f2:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    36f4:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    36f6:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    36fa:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    36fe:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3702:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3716 <DrawCube3d+0x240>
    3704:	|  |                 |  |  |  |  |  |                                                                                 tst.w 89b34 <DoNotClearDirty>
    370a:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3716 <DrawCube3d+0x240>
    370c:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3712:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 42f8 <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    3716:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    371a:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3720:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    3726:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    372c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3732:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    3738:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    373e:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    3744:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    3748:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    374c:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3750:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3752:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3754:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    3756:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    3758:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    375a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    375c:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    375e:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    3760:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3762:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3764:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    3766:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    3768:	|  |  |              |  |  |  |  |  |                                                                                 jsr 5984 <__mulsi3>
    376e:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    3770:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    3772:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    3776:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    3778:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    377c:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    3780:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    3782:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    3784:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    3786:	|  |  |              |  |  |  |  |  |                                                                                 lea 412fa <zMult>,a4
    378c:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    3790:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    3792:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    3796:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3798:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    379a:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    379e:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    37a2:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37a4:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    37a6:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    37aa:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    37ae:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    37b0:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    37b2:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    37b4:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    37b8:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    37ba:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    37be:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    37c0:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    37c4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    37c8:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    37ca:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    37ce:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    37d0:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    37d2:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    37d4:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    37d6:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    37da:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    37dc:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    37de:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    37e2:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    37e4:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    37e6:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    37e8:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    37ec:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    37f0:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    37f2:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    37f4:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    37f8:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    37fa:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    37fe:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3800:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3802:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    3804:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    3808:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    380a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    380e:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3810:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3812:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3814:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3818:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    381c:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3830 <DrawCube3d+0x35a>
    381e:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 89b34 <DoNotClearDirty>
    3824:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3830 <DrawCube3d+0x35a>
    3826:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    382c:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 42a0 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3830:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    3836:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    383c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3840:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    3844:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    3848:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    384c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3850:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    3854:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    3858:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    385c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    3862:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    3868:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    386e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    3874:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    387a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    3880:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    3884:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    3888:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    388c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    3890:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    3896:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    389c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    38a0:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 38b4 <DrawCube3d+0x3de>
    38a2:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 89b34 <DoNotClearDirty>
    38a8:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 38b4 <DrawCube3d+0x3de>
    38aa:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    38b0:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 4338 <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    38b4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    38ba:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    38c0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    38c4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    38c8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    38cc:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    38d0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    38d6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    38dc:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    38e2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    38e8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    38ec:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    38f0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    38f4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    38f8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    38fe:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    3904:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    390a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3910:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    3914:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    391a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    391e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3922:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    3928:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    392e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    3934:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    393a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    393e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3942:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    3948:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    394e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3952:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    3956:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    395a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    395e:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 3506 <DrawCube3d+0x30>
    3962:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 898ec <Cubes+0xc0>,a6
    3968:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    396c:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    3970:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    3974:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    397a:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    397e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    3982:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    3986:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    3988:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    398a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    398c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    3992:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    3998:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    399c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    39a0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    39a4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 3b06 <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    39a8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    39ac:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    39b0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 39a0 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    39b2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    39b6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    39ba:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 89b38 <CubeNrReversePtr>,a0
    39c0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    39c4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    39c6:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 3cea <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    39ca:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    39cc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 3c50 <DrawCube3d+0x77a>
    39d0:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    39d2:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    39d4:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    39d8:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 3c60 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    39dc:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    39e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 3ebc <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    39e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    39ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 39f4 <DrawCube3d+0x51e>
    39ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    39f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    39f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    39fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 89b3c <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3a00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    3a04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3a0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3a0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    3a14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    3a18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3a1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3a20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3a22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    3a24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3a28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3a2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3a2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3a32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    3a36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3a3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3a3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3a3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3a40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    3a44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    3a48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a5a <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3a4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3a5a <DrawCube3d+0x584>
    3a50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    3a56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 3d7c <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3a5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3a5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3a70 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    3a64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3a70 <DrawCube3d+0x59a>
    3a66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3a6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 3d8a <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3a70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    3a74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 3a86 <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3a7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 3a86 <DrawCube3d+0x5b0>
    3a7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3a82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 3d2c <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    3a86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    3a8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 3a9c <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3a8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    3a90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 3a9c <DrawCube3d+0x5c6>
    3a92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    3a98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 3d3a <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    3a9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    3aa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 3ab2 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3aa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    3aa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 3ab2 <DrawCube3d+0x5dc>
    3aa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    3aae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 3d48 <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    3ab2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    3ab6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 3ac8 <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3ab8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    3abc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 3ac8 <DrawCube3d+0x5f2>
    3abe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    3ac4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 3d56 <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    3ac8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    3acc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    3ad0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    3ad4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    3ad8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    3adc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 397a <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3ae0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 89b3c <DrawBuffer>,a2
  if( mirroring == 1) {
    3ae6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3aec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 3f1e <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3af0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3af6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3afc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3b00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    3b04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3b0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3b0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3b10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3b12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    3b14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3b1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3b1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3b22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    3b28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3b2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3b2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3b32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    3b34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3b3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3b3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3b42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    3b44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3b4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3b4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3b50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3b52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    3b54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    3b56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3b5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3b5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3b62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3b64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3b6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3b6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3b70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3b72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3b76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3b78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3b7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3b80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3b84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3b86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3b88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3b8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    3b8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3b90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3b92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3b94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3b98 <DrawCube3d+0x6c2>
    3b96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3b98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    3b9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3b9e <DrawCube3d+0x6c8>
    3b9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    3b9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3ba0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3ba4 <DrawCube3d+0x6ce>
    3ba2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3ba4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3ba8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    3baa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bae <DrawCube3d+0x6d8>
    3bac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    3bae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3bb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bb4 <DrawCube3d+0x6de>
    3bb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3bb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3bb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3bb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3bbc <DrawCube3d+0x6e6>
    3bba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    3bbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    3bbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bc2 <DrawCube3d+0x6ec>
    3bc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3bc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3bc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bc8 <DrawCube3d+0x6f2>
    3bc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3bc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    3bca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bce <DrawCube3d+0x6f8>
    3bcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    3bce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3bd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3bd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bd8 <DrawCube3d+0x702>
    3bd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3bd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    3bda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3bde <DrawCube3d+0x708>
    3bdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    3bde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3be0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3be2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3be6 <DrawCube3d+0x710>
    3be4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3be6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3bea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3bee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3bf0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3bf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3bf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3bf8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3bfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3bfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3c00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3c04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3c06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c0c <DrawCube3d+0x736>
    3c08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3c0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3c10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c16 <DrawCube3d+0x740>
    3c12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3c16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3c1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3c1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3c22 <DrawCube3d+0x74c>
    3c1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3c22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3c26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3c2c <DrawCube3d+0x756>
    3c28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3c2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3c30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3c32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3c36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3c3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3c3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3c40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3c44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3c48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 39a0 <DrawCube3d+0x4ca>
    3c4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 39b2 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    3c50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    3c54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    3c56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    3c58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    3c5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 39dc <DrawCube3d+0x506>
      if(maxycube < 0) {
    3c60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    3c62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    3c64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    3c66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 3eb2 <DrawCube3d+0x9dc>
      minycube = 0;
    3c6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    3c6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    3c72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    3c76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3c7c <DrawCube3d+0x7a6>
    3c78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    3c7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    3c80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    3c82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 3c88 <DrawCube3d+0x7b2>
    3c84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3c88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3c8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 89b3c <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3c90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    3c92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    3c94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    3c98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    3c9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3a00 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3ca0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    3ca2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    3ca6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 3e6e <DrawCube3d+0x998>
    3caa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    3cac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    3cae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    3cb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    3cb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    3cb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    3cb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    3cba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    3cbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    3cc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    3cc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    3cc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    3cca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    3ccc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    3cce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    3cd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3cd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    3cd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3cda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    3cdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    3cde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    3ce0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    3ce2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    3ce6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3a1c <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3cea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    3cee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    3cf2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    3cf6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 3d98 <DrawCube3d+0x8c2>
    3cfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    3cfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    3cfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    3d00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    3d02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3d06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    3d08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    3d0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    3d10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    3d12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    3d18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    3d1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    3d1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    3d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    3d22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    3d24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 39d0 <DrawCube3d+0x4fa>
    3d28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 3c50 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    3d2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    3d30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d34:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    3d36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 3a86 <DrawCube3d+0x5b0>
    3d3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    3d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    3d44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 3a9c <DrawCube3d+0x5c6>
    3d48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    3d4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    3d52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 3ab2 <DrawCube3d+0x5dc>
    3d56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    3d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    3d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    3d64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    3d68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    3d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    3d70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    3d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 397a <DrawCube3d+0x4a4>
    3d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 3ae0 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    3d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    3d80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    3d86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3a5a <DrawCube3d+0x584>
    3d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    3d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 25ae <DrawRect>(pc)
    3d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    3d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3a70 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    3d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    3d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    3d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    3da0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    3da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    3da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    3da8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    3daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    3dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    3db2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    3db4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    3dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    3dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    3dbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    3dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    3dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 3d22 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3dc8:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    3dcc:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3dce:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    3dd2:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3dd4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    3dd6:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    3dda:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3dde:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd75346>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3de4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd75346>,d0
    3dea:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    3dee:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 3de4 <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    3df0:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    3df6:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    3dfe:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd7539c>
}
    3e04:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 36bc <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3e08:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    3e0c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e0e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    3e12:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e14:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    3e16:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    3e1a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3e20:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd75346>,d7
    3e26:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    3e2a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3e2e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd75346>,d7
    3e34:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    3e38:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 3e2e <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    3e3a:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    3e3e:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    3e44:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    3e4c:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd7539c>
      clearpos += 64*BPLHEIGHT;
    3e52:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    3e56:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 3634 <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3e5a:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 89b34 <DoNotClearDirty>
    3e60:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 3eda <DrawCube3d+0xa04>
    3e62:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    3e64:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    3e66:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    3e6a:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 355c <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    3e6e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    3e72:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    3e74:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    3e76:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    3e78:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    3e7c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    3e7e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    3e80:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    3e82:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    3e86:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    3e88:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    3e8c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    3e8e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3e90:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    3e92:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    3e94:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    3e96:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    3e98:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    3e9c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    3ea0:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ea2:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    3ea4:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    3ea6:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    3ea8:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    3eaa:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    3eae:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3a1c <DrawCube3d+0x546>
      if(maxycube < 0) {
    3eb2:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    3eb4:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    3eb8:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 3c6e <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    3ebc:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    3ec0:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    3ec2:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 3eca <DrawCube3d+0x9f4>
    maxheightcube+=1;
    3ec4:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    3ec6:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 3c6e <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    3eca:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    3ece:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    3ed2:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    3ed6:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 3c6e <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    3eda:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    3edc:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    3ede:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    3ee2:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    3ee4:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3ee6:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    3ee8:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3eea:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    3eec:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3ef0:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd75346>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3ef6:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd75346>,d0
    3efc:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    3f00:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 3ef6 <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    3f02:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    3f08:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    3f10:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd7539c>
      clearpos += 64*BPLHEIGHT;
    3f16:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    3f1a:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 355c <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3f1e:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    3f22:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    3f26:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    3f28:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3f2a:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    3f2c:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    3f30:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    3f34:	|  |  |  |  |  |  |                                                                                                   movea.l 89c9a <PrepareBuffer>,a6
    3f3a:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    3f3e:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    3f42:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    3f44:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3f48:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3f4e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    3f54:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    3f58:	|  |  |  |  |  |  |                                                                                               \-- bne.s 3f4e <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    3f5a:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd75388>
  custom->bltalwm = 0xffff; //Show All
    3f62:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd7538a>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    3f6a:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd753b4>
  custom->bltamod = 60;
    3f72:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd753a8>
  custom->bltbmod = 60;
    3f7a:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd753a6>
  custom->bltdmod = 60;    
    3f82:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd753aa>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    3f8a:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x8002; //Ascending
    3f92:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd75386>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3f9a:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    3f9c:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    3f9e:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    3fa0:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    3fa2:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    3fa4:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    3fa8:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    3faa:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    3fac:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    3fae:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    3fb0:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    3fb4:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    3fb6:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    3fb8:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    3fbc:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    3fc0:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    3fc4:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    3fc6:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    3fc8:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    3fca:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    3fce:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    3fd2:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    3fd6:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    3fd8:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    3fda:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    3fde:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    3fe0:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    3fe4:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 401a <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    3fe6:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd75394>
      custom->bltbpt = bltbpos;
    3fec:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd75390>
      custom->bltdpt = bltdpos;
    3ff2:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd75398>
      custom->bltsize = 2 + height * 64;
    3ff8:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd7539c>
      bltapos -= 2;
    3ffe:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    4000:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    4002:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4004:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd75346>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    400a:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd75346>,d0
    4010:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    4014:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 400a <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    4016:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    4018:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 3fe6 <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    401a:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    4020:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    4022:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 4040 <DrawCube3d+0xb6a>
    4024:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    4026:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    402a:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    402e:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    4030:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    4032:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    4036:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    4038:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    403c:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 3fe6 <DrawCube3d+0xb10>
    403e:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 401a <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    4040:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd75384>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    4048:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd75386>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    4050:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd753b4>
  UWORD mod=64 - length*2-2;
    4058:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    405a:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    405c:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    405e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd753a8>
  custom->bltbmod = mod;
    4064:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd753a6>
  custom->bltdmod = mod;
    406a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd753aa>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4070:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    4072:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    4074:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    4078:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    407c:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    407e:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4080:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    4082:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    4084:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    4086:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    4088:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    408a:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    408c:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    4092:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    4098:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    409e:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40a4:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd75346>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40aa:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d4
    40b0:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    40b4:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40aa <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    40b6:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    40b8:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    40bc:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    40c0:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    40c2:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    40c8:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    40ca:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    40cc:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    40d2:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    40d8:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    40de:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    40e4:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    40ea:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    40f0:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    40f4:	|  |  |  |  |  |  |                                                                                               \-- bne.s 40ea <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    40f6:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd75384>
  custom->bltcon1 = 0xe002;
    40fe:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd75386>
  custom->bltcdat = 0x3333;
    4106:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd753b4>
  custom->bltamod = mod;
    410e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd753a8>
  custom->bltbmod = mod;
    4114:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd753a6>
  custom->bltdmod = mod;
    411a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd753aa>
    custom->bltapt = bltapos;
    4120:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    4126:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    412c:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    4132:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4138:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    413e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    4144:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4148:	|  |  |  |  |  |  |                                                                                               \-- bne.s 413e <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    414a:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    4150:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    4156:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    415c:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4162:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4168:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    416e:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4172:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4168 <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    4174:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd75384>
  custom->bltcon1 = 0xf002;
    417c:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd75386>
  custom->bltcdat = 0x5555;
    4184:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd753b4>
  custom->bltamod = mod;
    418c:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd753a8>
  custom->bltbmod = mod;
    4192:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd753a6>
  custom->bltdmod = mod;
    4198:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd753aa>
    custom->bltapt = bltapos;
    419e:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    41a4:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    41aa:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    41b0:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41b6:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41bc:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    41c2:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41c6:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41bc <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    41c8:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd75394>
    custom->bltbpt = bltbpos;
    41ce:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd75390>
    custom->bltdpt = bltdpos;
    41d4:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd75398>
    custom->bltsize = length+1 + height * 64;
    41da:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41e0:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    41e6:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    41ec:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    41f0:	|  |  |  |  |  |  |                                                                                               \-- bne.s 41e6 <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    41f2:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd75384>
  custom->bltcon1 = 0x0002;
    41fa:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd75386>
  custom->bltcdat = 0x0;
    4202:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd753b4>
  mod=64 -length*2;
    420a:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    420c:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    420e:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    4210:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd753a8>
  custom->bltdmod = mod;
    4216:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd753aa>
  custom->bltafwm = bltfmask;
    421c:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd75388>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4224:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    4228:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    422a:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    422e:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd75394>
    custom->bltdpt = bltdpos;
    4234:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75398>
    custom->bltsize = length + height * 64;
    423a:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4240:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4246:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    424c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4250:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4246 <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4252:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    4254:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    4258:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    425a:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    425e:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd75394>
    custom->bltdpt = bltdpos;
    4264:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd75398>
    custom->bltsize = length + height * 64;
    426a:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd7539c>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4270:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd75346>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4276:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd75346>,d0
    427c:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4280:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4276 <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    4282:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd75388>
  DrawBuffer->minytotal = minytotal;
    428a:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    4290:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    4296:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    429a:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    429e:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    42a0:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    42a4:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42a6:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    42aa:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42ac:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    42ae:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    42b2:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42b8:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd75346>,d6
    42be:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    42c2:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    42c6:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd75346>,d6
    42cc:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    42d0:	|  |  |  |  |  |                                                                                                  \-- bne.s 42c6 <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    42d2:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    42d6:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    42da:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    42e0:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    42e8:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd7539c>
      clearpos += 64*BPLHEIGHT;
    42f0:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    42f4:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3830 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    42f8:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    42fc:	|  |        |  |                                                                                                      add.l d0,d0
    42fe:	|  |        |  |                                                                                                      add.l 94(sp),d0
    4302:	|  |        |  |                                                                                                      add.l d0,d0
    4304:	|  |        |  |                                                                                                      add.l d0,d0
    4306:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    430a:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd75346>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4310:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd75346>,d0
    4316:	|  |        |  |                                                                                                  |   btst #14,d0
    431a:	|  |        |  |                                                                                                  \-- bne.s 4310 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    431c:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    4322:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    432a:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd7539c>
      clearpos += 64*BPLHEIGHT;
    4330:	|  |        |  |                                                                                                      lea 16384(a5),a5
    4334:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 3716 <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    4338:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    433c:	|           |                                                                                                         add.l d0,d0
    433e:	|           |                                                                                                         add.l 94(sp),d0
    4342:	|           |                                                                                                         add.l d0,d0
    4344:	|           |                                                                                                         add.l d0,d0
    4346:	|           |                                                                                                         movea.l 54(sp),a4
    434a:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    434e:	|           |                                                                                                         move.w dff002 <_end+0xd75346>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4354:	|           |                                                                                                     /-> move.w dff002 <_end+0xd75346>,d0
    435a:	|           |                                                                                                     |   btst #14,d0
    435e:	|           |                                                                                                     \-- bne.s 4354 <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    4360:	|           |                                                                                                         move.l a5,dff054 <_end+0xd75398>
    custom->bltadat = 0x0;
    4366:	|           |                                                                                                         move.w #0,dff074 <_end+0xd753b8>
    custom->bltsize = bltsize;    
    436e:	|           |                                                                                                         move.w d6,dff058 <_end+0xd7539c>
    squares[3].Vertices[0].X = xs0;
    4374:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    437a:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    4380:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    4384:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    4388:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    438c:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    4390:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    4396:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    439c:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    43a2:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    43a8:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    43ac:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    43b0:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    43b4:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    43b8:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    43be:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    43c4:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    43ca:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    43d0:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    43d4:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    43da:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    43de:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    43e2:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    43e8:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    43ee:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    43f4:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    43fa:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    43fe:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    4402:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    4408:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    440e:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    4412:	|           |                                                                                                         move.l 94(sp),d5
    4416:	|           |                                                                                                         lea 192(a3),a3
    441a:	|           |                                                                                                         cmp.w 106(sp),d5
    441e:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 3506 <DrawCube3d+0x30>
    4422:	            \-------------------------------------------------------------------------------------------------------- bra.w 3962 <DrawCube3d+0x48c>

00004426 <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    4426:	       link.w a5,#-52
    442a:	       move.l a2,-(sp)
    442c:	       move.l d2,-(sp)
    442e:	       movea.l 12(a5),a1
    4432:	       move.l 16(a5),d2
    4436:	       move.l 20(a5),d1
	struct debug_resource resource = {
    443a:	       clr.l -42(a5)
    443e:	       clr.l -38(a5)
    4442:	       clr.l -34(a5)
    4446:	       clr.l -30(a5)
    444a:	       clr.l -26(a5)
    444e:	       clr.l -22(a5)
    4452:	       clr.l -18(a5)
    4456:	       clr.l -14(a5)
    445a:	       clr.w -10(a5)
    445e:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    4464:	       move.w d2,d0
    4466:	       muls.w d1,d0
    4468:	       lsl.l #6,d0
	struct debug_resource resource = {
    446a:	       move.l d0,-46(a5)
    446e:	       clr.w -8(a5)
    4472:	       move.w #512,-6(a5)
    4478:	       move.w d2,-4(a5)
    447c:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    4480:	       move.b (a1),d0
    4482:	       lea -42(a5),a0
    4486:	/----- beq.s 4498 <debug_register_bitmap.constprop.0+0x72>
    4488:	|      lea -11(a5),a2
		*destination++ = *source++;
    448c:	|  /-> addq.l #1,a1
    448e:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    4490:	|  |   move.b (a1),d0
    4492:	+--|-- beq.s 4498 <debug_register_bitmap.constprop.0+0x72>
    4494:	|  |   cmpa.l a0,a2
    4496:	|  \-- bne.s 448c <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    4498:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    449a:	       move.w f0ff60 <_end+0xe862a4>,d0
    44a0:	       cmpi.w #20153,d0
    44a4:	   /-- beq.s 44b8 <debug_register_bitmap.constprop.0+0x92>
    44a6:	   |   cmpi.w #-24562,d0
    44aa:	   +-- beq.s 44b8 <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    44ac:	   |   move.l -60(a5),d2
    44b0:	   |   movea.l -56(a5),a2
    44b4:	   |   unlk a5
    44b6:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    44b8:	   \-> clr.l -(sp)
    44ba:	       clr.l -(sp)
    44bc:	       pea -50(a5)
    44c0:	       pea 4 <_start+0x4>
    44c4:	       pea 58 <_start+0x58>
    44c8:	       jsr f0ff60 <_end+0xe862a4>
}
    44ce:	       lea 20(sp),sp
}
    44d2:	       move.l -60(a5),d2
    44d6:	       movea.l -56(a5),a2
    44da:	       unlk a5
    44dc:	       rts

000044de <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    44de:	                            lea -52(sp),sp
    44e2:	                            movem.l d2-d7/a2-a6,-(sp)
    44e6:	                            movea.l 100(sp),a2
    44ea:	                            movea.l 104(sp),a5
    44ee:	                            move.l 108(sp),d0
    44f2:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    44f6:	                            moveq #0,d2
    44f8:	                            move.w d0,d2
    44fa:	                            move.l d2,56(sp)
    44fe:	                            tst.w d0
    4500:	/-------------------------- beq.s 4570 <DrawLetters.isra.0+0x92>
    4502:	|                           clr.l 44(sp)
    4506:	|                           move.l #563244,60(sp)
    450e:	|                           lea 412fa <zMult>,a4
    4514:	|                           cmpi.w #1,d1
    4518:	|  /----------------------- beq.w 46fa <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    451c:	|  |  /-------------------> moveq #0,d0
    451e:	|  |  |                     move.w (a5),d0
    4520:	|  |  |                     moveq #0,d3
    4522:	|  |  |                     move.w 2(a5),d3
    4526:	|  |  |                     movea.l d3,a0
    4528:	|  |  |                     move.l d0,d1
    452a:	|  |  |                     add.l d0,d1
    452c:	|  |  |                     add.l d1,d0
    452e:	|  |  |                     add.l d0,d0
    4530:	|  |  |                     adda.l d0,a0
    4532:	|  |  |                     move.l a0,d4
    4534:	|  |  |                     lsl.l #5,d4
    4536:	|  |  |                     movea.l d4,a0
    4538:	|  |  |                     adda.l 60(sp),a0
    453c:	|  |  |                     move.l 16(a0),d0
    4540:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4544:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4548:	|  |  |                     moveq #1,d2
    454a:	|  |  |                     cmp.l d0,d2
    454c:	|  |  |     /-------------- blt.w 4752 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4550:	|  |  |     |               movea.w d1,a0
    4552:	|  |  |     |               move.l a0,d0
    4554:	|  |  |     |               add.l a0,d0
    4556:	|  |  |     |               add.l a0,d0
    4558:	|  |  |     |               lsl.l #3,d0
    455a:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    455c:	|  |  |     |               addq.l #3,a0
    455e:	|  |  |     |               adda.l a0,a0
    4560:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4562:	|  |  |     |               addq.l #1,44(sp)
    4566:	|  |  |     |               move.l 56(sp),d0
    456a:	|  |  |     |               cmp.l 44(sp),d0
    456e:	|  |  +-----|-------------- bne.s 451c <DrawLetters.isra.0+0x3e>
}
    4570:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    4574:	|  |  |     |               lea 52(sp),sp
    4578:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    457a:	|  |  |     |  /----------> tst.w d1
    457c:	|  |  |  /--|--|----------- ble.w 48f2 <DrawLetters.isra.0+0x414>
    4580:	|  |  |  |  |  |            lea 6(a5),a6
    4584:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4586:	|  |  |  |  |  |            lea 20(a0),a0
    458a:	|  |  |  |  |  |            move.l a0,52(sp)
    458e:	|  |  |  |  |  |            move.l a5,48(sp)
    4592:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    4594:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4598:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    459c:	|  |  |  |  |  |  |         move.l a0,d0
    459e:	|  |  |  |  |  |  |         subq.l #1,d0
    45a0:	|  |  |  |  |  |  |         add.l d0,d0
    45a2:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    45a6:	|  |  |  |  |  |  |         move.w d0,d1
    45a8:	|  |  |  |  |  |  |         muls.w (a2),d1
    45aa:	|  |  |  |  |  |  |         moveq #15,d4
    45ac:	|  |  |  |  |  |  |         asr.l d4,d1
    45ae:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    45b2:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    45b6:	|  |  |  |  |  |  |         asr.l d4,d0
    45b8:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    45bc:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    45c0:	|  |  |  |  |  |  |         subq.l #1,a0
    45c2:	|  |  |  |  |  |  |         adda.l a0,a0
    45c4:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    45c8:	|  |  |  |  |  |  |         move.w d2,d7
    45ca:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    45ce:	|  |  |  |  |  |  |         asr.l d4,d7
    45d0:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    45d4:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    45d8:	|  |  |  |  |  |  |         asr.l d4,d2
    45da:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    45de:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    45e2:	|  |  |  |  |  |  |         subq.l #1,a0
    45e4:	|  |  |  |  |  |  |         adda.l a0,a0
    45e6:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    45ea:	|  |  |  |  |  |  |         move.w d3,d6
    45ec:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    45f0:	|  |  |  |  |  |  |         asr.l d4,d6
    45f2:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    45f6:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    45fa:	|  |  |  |  |  |  |         asr.l d4,d3
    45fc:	|  |  |  |  |  |  |         movea.w d3,a1
    45fe:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4602:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    4606:	|  |  |  |  |  |  |         subq.l #1,a0
    4608:	|  |  |  |  |  |  |         adda.l a0,a0
    460a:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    460e:	|  |  |  |  |  |  |         move.w d3,d5
    4610:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    4614:	|  |  |  |  |  |  |         asr.l d4,d5
    4616:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    461a:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    461e:	|  |  |  |  |  |  |         asr.l d4,d3
    4620:	|  |  |  |  |  |  |         movea.w d3,a0
    4622:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4626:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    462a:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    462e:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    4632:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    4636:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    463a:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    463e:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4642:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4646:	|  |  |  |  |  |  |         move.w d1,d4
    4648:	|  |  |  |  |  |  |         cmp.w d1,d7
    464a:	|  |  |  |  |  |  |     /-- bge.s 464e <DrawLetters.isra.0+0x170>
    464c:	|  |  |  |  |  |  |     |   move.w d7,d4
    464e:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4650:	|  |  |  |  |  |  |     /-- bge.s 4654 <DrawLetters.isra.0+0x176>
    4652:	|  |  |  |  |  |  |     |   move.w d6,d4
    4654:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    4656:	|  |  |  |  |  |  |     /-- bge.s 465a <DrawLetters.isra.0+0x17c>
    4658:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    465a:	|  |  |  |  |  |  |     \-> move.w d0,d3
    465c:	|  |  |  |  |  |  |         cmp.w d0,d2
    465e:	|  |  |  |  |  |  |     /-- bge.s 4662 <DrawLetters.isra.0+0x184>
    4660:	|  |  |  |  |  |  |     |   move.w d2,d3
    4662:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    4664:	|  |  |  |  |  |  |     /-- ble.s 4668 <DrawLetters.isra.0+0x18a>
    4666:	|  |  |  |  |  |  |     |   move.w a1,d3
    4668:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    466a:	|  |  |  |  |  |  |     /-- ble.s 466e <DrawLetters.isra.0+0x190>
    466c:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    466e:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4672:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4676:	|  |  |  |  |  |  |         cmp.w d0,d2
    4678:	|  |  |  |  |  |  |     /-- ble.s 467c <DrawLetters.isra.0+0x19e>
    467a:	|  |  |  |  |  |  |     |   move.w d2,d0
    467c:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    467e:	|  |  |  |  |  |  |     /-- bge.s 4682 <DrawLetters.isra.0+0x1a4>
    4680:	|  |  |  |  |  |  |     |   move.w a1,d0
    4682:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    4684:	|  |  |  |  |  |  |     /-- bge.s 4688 <DrawLetters.isra.0+0x1aa>
    4686:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4688:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    468a:	|  |  |  |  |  |  |         sub.w d3,d0
    468c:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    4690:	|  |  |  |  |  |  |         cmpi.w #1,d0
    4694:	|  |  |  |  |  |  |  /----- ble.s 46d2 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4696:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    4698:	|  |  |  |  |  |  |  |  /-- ble.s 469c <DrawLetters.isra.0+0x1be>
    469a:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    469c:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    469e:	|  |  |  |  |  |  |  |  /-- ble.s 46a2 <DrawLetters.isra.0+0x1c4>
    46a0:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    46a2:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    46a4:	|  |  |  |  |  |  |  |  /-- ble.s 46a8 <DrawLetters.isra.0+0x1ca>
    46a6:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    46a8:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    46aa:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    46ae:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    46b2:	|  |  |  |  |  |  |  +----- ble.s 46d2 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    46b4:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46b8:	|  |  |  |  |  |  |  |      move.w (a0),d0
    46ba:	|  |  |  |  |  |  |  |      neg.w d0
    46bc:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    46c0:	|  |  |  |  |  |  |  |      pea 64(sp)
    46c4:	|  |  |  |  |  |  |  |      jsr 25ae <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    46c8:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    46cc:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    46d0:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    46d2:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    46d6:	|  |  |  |  |  |  |         addq.l #1,a3
    46d8:	|  |  |  |  |  |  |         movea.w a5,a0
    46da:	|  |  |  |  |  |  |         cmpa.l a3,a0
    46dc:	|  |  |  |  |  |  \-------- bgt.w 4594 <DrawLetters.isra.0+0xb6>
    46e0:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    46e4:	|  |  |  |  |  |            addq.l #3,a0
    46e6:	|  |  |  |  |  |            adda.l a0,a0
    46e8:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    46ea:	|  |  |  |  |  |            addq.l #1,44(sp)
    46ee:	|  |  |  |  |  |            move.l 56(sp),d0
    46f2:	|  |  |  |  |  |            cmp.l 44(sp),d0
    46f6:	+--|--|--|--|--|----------- beq.w 4570 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    46fa:	|  >--|--|--|--|----------> moveq #0,d0
    46fc:	|  |  |  |  |  |            move.w (a5),d0
    46fe:	|  |  |  |  |  |            moveq #0,d1
    4700:	|  |  |  |  |  |            move.w 2(a5),d1
    4704:	|  |  |  |  |  |            movea.l d1,a0
    4706:	|  |  |  |  |  |            move.l d0,d1
    4708:	|  |  |  |  |  |            add.l d0,d1
    470a:	|  |  |  |  |  |            add.l d1,d0
    470c:	|  |  |  |  |  |            add.l d0,d0
    470e:	|  |  |  |  |  |            adda.l d0,a0
    4710:	|  |  |  |  |  |            move.l a0,d2
    4712:	|  |  |  |  |  |            lsl.l #5,d2
    4714:	|  |  |  |  |  |            movea.l d2,a0
    4716:	|  |  |  |  |  |            adda.l 60(sp),a0
    471a:	|  |  |  |  |  |            move.l 16(a0),d0
    471e:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4722:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4726:	|  |  |  |  |  |            moveq #1,d3
    4728:	|  |  |  |  |  |            cmp.l d0,d3
    472a:	|  |  |  |  |  \----------- blt.w 457a <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    472e:	|  |  |  |  |               movea.w d1,a0
    4730:	|  |  |  |  |               move.l a0,d0
    4732:	|  |  |  |  |               add.l a0,d0
    4734:	|  |  |  |  |               add.l a0,d0
    4736:	|  |  |  |  |               lsl.l #3,d0
    4738:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    473a:	|  |  |  |  |               addq.l #3,a0
    473c:	|  |  |  |  |               adda.l a0,a0
    473e:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4740:	|  |  |  |  |               addq.l #1,44(sp)
    4744:	|  |  |  |  |               move.l 56(sp),d0
    4748:	|  |  |  |  |               cmp.l 44(sp),d0
    474c:	|  +--|--|--|-------------- bne.s 46fa <DrawLetters.isra.0+0x21c>
    474e:	+--|--|--|--|-------------- bra.w 4570 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4752:	|  |  |  |  \-------------> tst.w d1
    4754:	|  |  |  |     /----------- ble.w 48d6 <DrawLetters.isra.0+0x3f8>
    4758:	|  |  |  |     |            lea 6(a5),a6
    475c:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    475e:	|  |  |  |     |            lea 20(a0),a0
    4762:	|  |  |  |     |            move.l a0,52(sp)
    4766:	|  |  |  |     |            move.l a5,48(sp)
    476a:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    476c:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4770:	|  |  |  |     |  |         movea.w 4(a2),a0
    4774:	|  |  |  |     |  |         move.l a0,d0
    4776:	|  |  |  |     |  |         subq.l #1,d0
    4778:	|  |  |  |     |  |         add.l d0,d0
    477a:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    477e:	|  |  |  |     |  |         move.w d2,d7
    4780:	|  |  |  |     |  |         muls.w (a2),d7
    4782:	|  |  |  |     |  |         moveq #15,d3
    4784:	|  |  |  |     |  |         asr.l d3,d7
    4786:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    478a:	|  |  |  |     |  |         muls.w 2(a2),d2
    478e:	|  |  |  |     |  |         asr.l d3,d2
    4790:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4794:	|  |  |  |     |  |         movea.w 10(a2),a0
    4798:	|  |  |  |     |  |         move.l a0,d0
    479a:	|  |  |  |     |  |         subq.l #1,d0
    479c:	|  |  |  |     |  |         add.l d0,d0
    479e:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    47a2:	|  |  |  |     |  |         move.w d0,d1
    47a4:	|  |  |  |     |  |         muls.w 6(a2),d1
    47a8:	|  |  |  |     |  |         asr.l d3,d1
    47aa:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    47ae:	|  |  |  |     |  |         muls.w 8(a2),d0
    47b2:	|  |  |  |     |  |         asr.l d3,d0
    47b4:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    47b8:	|  |  |  |     |  |         movea.w 16(a2),a0
    47bc:	|  |  |  |     |  |         subq.l #1,a0
    47be:	|  |  |  |     |  |         adda.l a0,a0
    47c0:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    47c4:	|  |  |  |     |  |         move.w d3,d6
    47c6:	|  |  |  |     |  |         muls.w 12(a2),d6
    47ca:	|  |  |  |     |  |         moveq #15,d4
    47cc:	|  |  |  |     |  |         asr.l d4,d6
    47ce:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    47d2:	|  |  |  |     |  |         muls.w 14(a2),d3
    47d6:	|  |  |  |     |  |         asr.l d4,d3
    47d8:	|  |  |  |     |  |         movea.w d3,a1
    47da:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    47de:	|  |  |  |     |  |         movea.w 22(a2),a0
    47e2:	|  |  |  |     |  |         subq.l #1,a0
    47e4:	|  |  |  |     |  |         adda.l a0,a0
    47e6:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    47ea:	|  |  |  |     |  |         move.w d3,d5
    47ec:	|  |  |  |     |  |         muls.w 18(a2),d5
    47f0:	|  |  |  |     |  |         asr.l d4,d5
    47f2:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    47f6:	|  |  |  |     |  |         muls.w 20(a2),d3
    47fa:	|  |  |  |     |  |         asr.l d4,d3
    47fc:	|  |  |  |     |  |         movea.w d3,a0
    47fe:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4802:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    4806:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    480a:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    480e:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4812:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    4816:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    481a:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    481e:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4822:	|  |  |  |     |  |         move.w d1,d4
    4824:	|  |  |  |     |  |         cmp.w d1,d7
    4826:	|  |  |  |     |  |     /-- bge.s 482a <DrawLetters.isra.0+0x34c>
    4828:	|  |  |  |     |  |     |   move.w d7,d4
    482a:	|  |  |  |     |  |     \-> cmp.w d4,d6
    482c:	|  |  |  |     |  |     /-- bge.s 4830 <DrawLetters.isra.0+0x352>
    482e:	|  |  |  |     |  |     |   move.w d6,d4
    4830:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4832:	|  |  |  |     |  |     /-- bge.s 4836 <DrawLetters.isra.0+0x358>
    4834:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    4836:	|  |  |  |     |  |     \-> move.w d0,d3
    4838:	|  |  |  |     |  |         cmp.w d0,d2
    483a:	|  |  |  |     |  |     /-- bge.s 483e <DrawLetters.isra.0+0x360>
    483c:	|  |  |  |     |  |     |   move.w d2,d3
    483e:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4840:	|  |  |  |     |  |     /-- ble.s 4844 <DrawLetters.isra.0+0x366>
    4842:	|  |  |  |     |  |     |   move.w a1,d3
    4844:	|  |  |  |     |  |     \-> cmp.w a0,d3
    4846:	|  |  |  |     |  |     /-- ble.s 484a <DrawLetters.isra.0+0x36c>
    4848:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    484a:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    484e:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4852:	|  |  |  |     |  |         cmp.w d0,d2
    4854:	|  |  |  |     |  |     /-- ble.s 4858 <DrawLetters.isra.0+0x37a>
    4856:	|  |  |  |     |  |     |   move.w d2,d0
    4858:	|  |  |  |     |  |     \-> cmp.w a1,d0
    485a:	|  |  |  |     |  |     /-- bge.s 485e <DrawLetters.isra.0+0x380>
    485c:	|  |  |  |     |  |     |   move.w a1,d0
    485e:	|  |  |  |     |  |     \-> cmp.w a0,d0
    4860:	|  |  |  |     |  |     /-- bge.s 4864 <DrawLetters.isra.0+0x386>
    4862:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4864:	|  |  |  |     |  |     \-> addq.w #1,d0
    4866:	|  |  |  |     |  |         sub.w d3,d0
    4868:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    486c:	|  |  |  |     |  |         cmpi.w #1,d0
    4870:	|  |  |  |     |  |  /----- ble.s 48aa <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4872:	|  |  |  |     |  |  |      cmp.w d1,d7
    4874:	|  |  |  |     |  |  |  /-- ble.s 4878 <DrawLetters.isra.0+0x39a>
    4876:	|  |  |  |     |  |  |  |   move.w d7,d1
    4878:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    487a:	|  |  |  |     |  |  |  /-- ble.s 487e <DrawLetters.isra.0+0x3a0>
    487c:	|  |  |  |     |  |  |  |   move.w d6,d1
    487e:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    4880:	|  |  |  |     |  |  |  /-- ble.s 4884 <DrawLetters.isra.0+0x3a6>
    4882:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    4884:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    4886:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    488a:	|  |  |  |     |  |  |      cmpi.w #1,d1
    488e:	|  |  |  |     |  |  +----- ble.s 48aa <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4890:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    4894:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    4898:	|  |  |  |     |  |  |      pea 64(sp)
    489c:	|  |  |  |     |  |  |      jsr 25ae <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    48a0:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    48a4:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    48a8:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    48aa:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    48ae:	|  |  |  |     |  |         addq.l #1,a3
    48b0:	|  |  |  |     |  |         movea.w a5,a0
    48b2:	|  |  |  |     |  |         cmpa.l a0,a3
    48b4:	|  |  |  |     |  \-------- blt.w 476c <DrawLetters.isra.0+0x28e>
    48b8:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    48bc:	|  |  |  |     |            addq.l #3,a0
    48be:	|  |  |  |     |            adda.l a0,a0
    48c0:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48c2:	|  |  |  |     |            addq.l #1,44(sp)
    48c6:	|  |  |  |     |            move.l 56(sp),d0
    48ca:	|  |  |  |     |            cmp.l 44(sp),d0
    48ce:	|  |  +--|-----|----------- bne.w 451c <DrawLetters.isra.0+0x3e>
    48d2:	+--|--|--|-----|----------- bra.w 4570 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    48d6:	|  |  |  |     \----------> movea.w d1,a0
    48d8:	|  |  |  |                  addq.l #3,a0
    48da:	|  |  |  |                  adda.l a0,a0
    48dc:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48de:	|  |  |  |                  addq.l #1,44(sp)
    48e2:	|  |  |  |                  move.l 56(sp),d0
    48e6:	|  |  |  |                  cmp.l 44(sp),d0
    48ea:	|  |  \--|----------------- bne.w 451c <DrawLetters.isra.0+0x3e>
    48ee:	+--|-----|----------------- bra.w 4570 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    48f2:	|  |     \----------------> movea.w d1,a0
    48f4:	|  |                        addq.l #3,a0
    48f6:	|  |                        adda.l a0,a0
    48f8:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    48fa:	|  |                        addq.l #1,44(sp)
    48fe:	|  |                        move.l 56(sp),d0
    4902:	|  |                        cmp.l 44(sp),d0
    4906:	|  \----------------------- bne.w 46fa <DrawLetters.isra.0+0x21c>
    490a:	\-------------------------- bra.w 4570 <DrawLetters.isra.0+0x92>

0000490e <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    490e:	          movem.l d2-d3/a2,-(sp)
    4912:	          move.l 36(sp),d3
    4916:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    491a:	          moveq #0,d1
    491c:	          move.w 89b46 <vectorpos>,d1
    4922:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4924:	          moveq #0,d0
    4926:	          move.w 89b44 <VectorPosLetters>,d0
    492c:	          add.l d0,d0
    492e:	          addi.l #322912,d0
    4934:	          move.l d0,89b40 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    493a:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    493c:	          tst.l d2
    493e:	          sne d0
    4940:	          ext.w d0
    4942:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4944:	          neg.l d0
    4946:	          move.l d0,-(sp)
    4948:	          addi.l #374146,d1
    494e:	          move.l d1,-(sp)
    4950:	          jsr 34d6 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    4954:	          clr.l -(sp)
    4956:	          move.l d3,-(sp)
    4958:	          move.l 40(sp),-(sp)
    495c:	          move.l 89b40 <ptrvectorletters>,-(sp)
    4962:	          lea 44de <DrawLetters.isra.0>(pc),a2
    4966:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    4968:	          lea 28(sp),sp
    496c:	          tst.l d2
    496e:	   /----- bne.w 4a08 <DrawDices+0xfa>
  CubeNrReversePos++;
    4972:	/--|----> addq.w #1,446c8 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    4978:	|  |      move.w d3,d2
    497a:	|  |      add.w d3,d2
    497c:	|  |      add.w d3,d2
    497e:	|  |      lsl.w #3,d2
    4980:	|  |      add.w 89b46 <vectorpos>,d2
    4986:	|  |      move.w d2,89b46 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    498c:	|  |      move.w 30(sp),d0
    4990:	|  |      add.w d0,d0
    4992:	|  |      add.w 30(sp),d0
    4996:	|  |      add.w d0,d0
    4998:	|  |      add.w d0,d0
    499a:	|  |      add.w d0,89b44 <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    49a0:	|  |      move.w 34(sp),d0
    49a4:	|  |      add.w d0,d0
    49a6:	|  |      add.w 34(sp),d0
    49aa:	|  |      add.w d0,d0
    49ac:	|  |      add.w d0,d0
    49ae:	|  |      add.w d0,89b36 <VectorPosLettersReversed>
  SetCl( clminendpos);
    49b4:	|  |      move.l 44(sp),-(sp)
    49b8:	|  |      jsr 1588 <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    49bc:	|  |      andi.l #65535,d2
    49c2:	|  |      move.l 52(sp),-(sp)
    49c6:	|  |      move.l d3,-(sp)
    49c8:	|  |      jsr 5984 <__mulsi3>
    49ce:	|  |      move.l d0,d1
    49d0:	|  |      add.l d1,d1
    49d2:	|  |      add.l d0,d1
    49d4:	|  |      lsl.l #3,d1
    49d6:	|  |      lea 12(sp),sp
    49da:	|  |      cmp.l d2,d1
    49dc:	|  |  /-- bgt.s 4a00 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    49de:	|  |  |   move.w #1,446c8 <CubeNrReversePos>
    vectorpos = 0;
    49e6:	|  |  |   clr.w 89b46 <vectorpos>
    VectorPosLetters = 0;
    49ec:	|  |  |   clr.w 89b44 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    49f2:	|  |  |   clr.w 89b36 <VectorPosLettersReversed>
    return 1;
    49f8:	|  |  |   moveq #1,d0
}
    49fa:	|  |  |   movem.l (sp)+,d2-d3/a2
    49fe:	|  |  |   rts
    return 0;  
    4a00:	|  |  \-> clr.w d0
}
    4a02:	|  |      movem.l (sp)+,d2-d3/a2
    4a06:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4a08:	|  \----> moveq #0,d0
    4a0a:	|         move.w 446c8 <CubeNrReversePos>,d0
    4a10:	|         add.l d0,d0
    4a12:	|         add.l 16(sp),d0
    4a16:	|         move.l d0,89b38 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a1c:	|         pea 1 <_start+0x1>
    4a20:	|         move.l d2,-(sp)
    4a22:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4a26:	|         moveq #0,d0
    4a28:	|         move.w 89b36 <VectorPosLettersReversed>,d0
    4a2e:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4a30:	|         addi.l #282976,d0
    4a36:	|         move.l d0,-(sp)
    4a38:	|         jsr (a2)
    4a3a:	|         lea 16(sp),sp
    4a3e:	\-------- bra.w 4972 <DrawDices+0x64>

00004a42 <End_PrepareDisplay.isra.0>:

int End_PrepareDisplay() {
    4a42:	          movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4a46:	          movea.l 89cb8 <SysBase>,a6
    4a4c:	          move.l #1360,d0
    4a52:	          moveq #2,d1
    4a54:	          jsr -198(a6)
    4a58:	          movea.l d0,a2
  if( retval == 0) {
    4a5a:	          tst.l d0
    4a5c:	   /----- beq.w 4c76 <End_PrepareDisplay.isra.0+0x234>
    *cl++ = *clpartinstruction++;
    4a60:	/--|----> move.l 445a8 <End_ClsSprites>,(a2)
    4a66:	|  |      move.l 445ac <End_ClsSprites+0x4>,4(a2)
    4a6e:	|  |      move.l 445b0 <End_ClsSprites+0x8>,8(a2)
    4a76:	|  |      move.l 445b4 <End_ClsSprites+0xc>,12(a2)
    4a7e:	|  |      move.l 445b8 <End_ClsSprites+0x10>,16(a2)
    4a86:	|  |      move.l 445bc <End_ClsSprites+0x14>,20(a2)
    4a8e:	|  |      move.l 445c0 <End_ClsSprites+0x18>,24(a2)
    4a96:	|  |      move.l 445c4 <End_ClsSprites+0x1c>,28(a2)
    4a9e:	|  |      move.l 445c8 <End_ClsSprites+0x20>,32(a2)
    4aa6:	|  |      move.l 445cc <End_ClsSprites+0x24>,36(a2)
    4aae:	|  |      move.l 445d0 <End_ClsSprites+0x28>,40(a2)
    4ab6:	|  |      move.l 445d4 <End_ClsSprites+0x2c>,44(a2)
    4abe:	|  |      move.l 445d8 <End_ClsSprites+0x30>,48(a2)
    4ac6:	|  |      move.l 445dc <End_ClsSprites+0x34>,52(a2)
    4ace:	|  |      move.l 445e0 <End_ClsSprites+0x38>,56(a2)
    4ad6:	|  |      move.l 445e4 <End_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    4ade:	|  |      move.l 44578 <End_ClScreen>,64(a2)
    4ae6:	|  |      move.l 4457c <End_ClScreen+0x4>,68(a2)
    4aee:	|  |      move.l 44580 <End_ClScreen+0x8>,72(a2)
    4af6:	|  |      move.l 44584 <End_ClScreen+0xc>,76(a2)
    4afe:	|  |      move.l 44588 <End_ClScreen+0x10>,80(a2)
    4b06:	|  |      move.l 4458c <End_ClScreen+0x14>,84(a2)
    4b0e:	|  |      move.l 44590 <End_ClScreen+0x18>,88(a2)
    4b16:	|  |      move.l 44594 <End_ClScreen+0x1c>,92(a2)
    4b1e:	|  |      move.l 44598 <End_ClScreen+0x20>,96(a2)
    4b26:	|  |      move.l 4459c <End_ClScreen+0x24>,100(a2)
    4b2e:	|  |      move.l 445a0 <End_ClScreen+0x28>,104(a2)
    4b36:	|  |      move.l 445a4 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    4b3e:	|  |      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    4b44:	|  |      move.l #512034,d0
    4b4a:	|  |      clr.w d0
    4b4c:	|  |      swap d0
    4b4e:	|  |      move.w d0,114(a2)
  *cw++ = 0x00e2;
    4b52:	|  |      move.w #226,116(a2)
  *cw++ = bpl1pointerlow;
    4b58:	|  |      move.l #512034,d0
    4b5e:	|  |      move.w d0,118(a2)
  *cw++ = 0x00e4;
    4b62:	|  |      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    4b68:	|  |      move.l #522274,d0
    4b6e:	|  |      clr.w d0
    4b70:	|  |      swap d0
    4b72:	|  |      move.w d0,122(a2)
  *cw++ = 0x00e6;
    4b76:	|  |      move.w #230,124(a2)
  *cw++ = bpl2pointerlow;
    4b7c:	|  |      move.l #522274,d0
    4b82:	|  |      move.w d0,126(a2)
  *cw++ = 0x00e8;
    4b86:	|  |      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    4b8c:	|  |      move.l #532514,d0
    4b92:	|  |      clr.w d0
    4b94:	|  |      swap d0
    4b96:	|  |      move.w d0,130(a2)
  *cw++ = 0x00ea;
    4b9a:	|  |      move.w #234,132(a2)
  *cw++ = bpl3pointerlow;  
    4ba0:	|  |      move.l #532514,d0
    4ba6:	|  |      move.w d0,134(a2)
  *cw++ = 0x00ec;
    4baa:	|  |      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    4bb0:	|  |      move.l #542754,d0
    4bb6:	|  |      clr.w d0
    4bb8:	|  |      swap d0
    4bba:	|  |      move.w d0,138(a2)
  *cw++ = 0x00ee;
    4bbe:	|  |      move.w #238,140(a2)
  *cw++ = bpl4pointerlow;  
    4bc4:	|  |      move.l #542754,d0
    4bca:	|  |      move.w d0,142(a2)
  *cw++ = 0x00f0;
    4bce:	|  |      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    4bd4:	|  |      move.l #552994,d0
    4bda:	|  |      clr.w d0
    4bdc:	|  |      swap d0
    4bde:	|  |      move.w d0,146(a2)
  *cw++ = 0x00f2;
    4be2:	|  |      move.w #242,148(a2)
  *cw++ = bpl5pointerlow;  
    4be8:	|  |      move.l #552994,d0
    4bee:	|  |      move.w d0,150(a2)
    *cl++ = *clpartinstruction++;
    4bf2:	|  |      pea 80 <main+0x1a>
    4bf6:	|  |      pea cf7a <incbin_End_ClColor_start>
    4bfc:	|  |      pea 152(a2)
    4c00:	|  |      jsr 5918 <memcpy>(pc)
  *cl++ = 0x20bffffe;
    4c04:	|  |      move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    4c0c:	|  |      move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    4c14:	|  |      moveq #-2,d0
    4c16:	|  |      move.l d0,288(a2)

  End_DrawCopper = End_ClBuild( );  
    4c1a:	|  |      move.l a2,89824 <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    4c20:	|  |      movea.l 89cb8 <SysBase>,a6
    4c26:	|  |      moveq #22,d0
    4c28:	|  |      move.l #65537,d1
    4c2e:	|  |      jsr -198(a6)
    4c32:	|  |      movea.l d0,a1
    4c34:	|  |      lea 12(sp),sp
    4c38:	|  |      tst.l d0
    4c3a:	|  |  /-- beq.s 4c56 <End_PrepareDisplay.isra.0+0x214>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4c3c:	|  |  |   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    4c42:	|  |  |   move.l #246610,10(a1)
    End_Vbint->is_Data = NULL;
    4c4a:	|  |  |   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    4c4e:	|  |  |   move.l #5498,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    4c56:	|  |  \-> movea.l 89cb8 <SysBase>,a6
    4c5c:	|  |      moveq #4,d0
    4c5e:	|  |      jsr -168(a6)
void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    4c62:	|  |      movea.l 89cb4 <custom>,a0
    4c68:	|  |      move.l 89824 <End_DrawCopper>,128(a0)
}
    4c70:	|  |      movem.l (sp)+,d2-d3/a2/a6
    4c74:	|  |      rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    4c76:	|  \----> movea.l 89cac <DOSBase>,a6
    4c7c:	|         jsr -60(a6)
    4c80:	|         movea.l 89cac <DOSBase>,a6
    4c86:	|         move.l d0,d1
    4c88:	|         move.l #246501,d2
    4c8e:	|         moveq #40,d3
    4c90:	|         jsr -48(a6)
    Exit(1);
    4c94:	|         movea.l 89cac <DOSBase>,a6
    4c9a:	|         moveq #1,d1
    4c9c:	|         jsr -144(a6)
    4ca0:	\-------- bra.w 4a60 <End_PrepareDisplay.isra.0+0x1e>

00004ca4 <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    4ca4:	                   link.w a5,#-52
    4ca8:	                   movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    4cac:	                   clr.w 89caa <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    4cb2:	                   clr.l -42(a5)
    4cb6:	                   clr.l -38(a5)
    4cba:	                   clr.l -34(a5)
    4cbe:	                   clr.l -30(a5)
    4cc2:	                   clr.l -26(a5)
    4cc6:	                   clr.l -22(a5)
    4cca:	                   clr.l -18(a5)
    4cce:	                   clr.l -14(a5)
    4cd2:	                   clr.l -10(a5)
    4cd6:	                   clr.l -6(a5)
    4cda:	                   clr.w -2(a5)
    4cde:	                   move.l #279924,-50(a5)
    4ce6:	                   moveq #4,d0
    4ce8:	                   move.l d0,-46(a5)
    4cec:	                   move.w #1,-10(a5)
    4cf2:	                   move.w #2,-6(a5)
	while(*source && --num > 0)
    4cf8:	                   moveq #100,d0
	struct debug_resource resource = {
    4cfa:	                   lea -42(a5),a0
    4cfe:	                   lea 3c360 <incbin_MercuryLetterData2Lz4_end+0x7c>,a1
	while(*source && --num > 0)
    4d04:	                   lea -11(a5),a2
		*destination++ = *source++;
    4d08:	            /----> addq.l #1,a1
    4d0a:	            |      move.b d0,(a0)+
	while(*source && --num > 0)
    4d0c:	            |      move.b (a1),d0
    4d0e:	            |  /-- beq.s 4d14 <Sw_PrepareDisplay.isra.0+0x70>
    4d10:	            |  |   cmpa.l a0,a2
    4d12:	            \--|-- bne.s 4d08 <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    4d14:	               \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    4d16:	                   move.w f0ff60 <_end+0xe862a4>,d0
    4d1c:	                   cmpi.w #20153,d0
    4d20:	            /----- beq.w 4e86 <Sw_PrepareDisplay.isra.0+0x1e2>
    4d24:	            |      cmpi.w #-24562,d0
    4d28:	            +----- beq.w 4e86 <Sw_PrepareDisplay.isra.0+0x1e2>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4d2c:	            |      movea.l 89cb8 <SysBase>,a6
    4d32:	            |      move.l #4000,d0
    4d38:	            |      moveq #2,d1
    4d3a:	            |      jsr -198(a6)
    4d3e:	            |      move.l d0,89baa <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4d44:	            |      pea 1 <_start+0x1>
    4d48:	            |      pea 32 <_start+0x32>
    4d4c:	            |      pea 3c36a <incbin_MercuryLetterData2Lz4_end+0x86>
    4d52:	            |      move.l d0,-(sp)
    4d54:	            |      lea 4426 <debug_register_bitmap.constprop.0>(pc),a3
    4d58:	            |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4d5a:	            |      pea 14 <_start+0x14>
    4d5e:	            |      pea 32 <_start+0x32>
    4d62:	            |      move.l 89baa <Sw_FontBuffer>,-(sp)
    4d68:	            |      lea c54 <Utils_FillLong.constprop.0>(pc),a2
    4d6c:	            |      jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4d6e:	            |      movea.l 89cb8 <SysBase>,a6
    4d74:	            |      move.l #20560,d0
    4d7a:	            |      moveq #2,d1
    4d7c:	            |      jsr -198(a6)
    4d80:	            |      move.l d0,89bae <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4d86:	            |      lea 28(sp),sp
    4d8a:	      /-----|----- beq.w 4f38 <Sw_PrepareDisplay.isra.0+0x294>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4d8e:	      |  /--|----> pea 1 <_start+0x1>
    4d92:	      |  |  |      pea 101 <main+0x9b>
    4d96:	      |  |  |      pea 3c3a0 <incbin_MercuryLetterData2Lz4_end+0xbc>
    4d9c:	      |  |  |      move.l d0,-(sp)
    4d9e:	      |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4da0:	      |  |  |      pea 14 <_start+0x14>
    4da4:	      |  |  |      pea 100 <main+0x9a>
    4da8:	      |  |  |      move.l 89bae <Sw_ScreenBuffer2>,-(sp)
    4dae:	      |  |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4db0:	      |  |  |      movea.l 89cb8 <SysBase>,a6
    4db6:	      |  |  |      move.l #20560,d0
    4dbc:	      |  |  |      moveq #2,d1
    4dbe:	      |  |  |      jsr -198(a6)
    4dc2:	      |  |  |      move.l d0,89bb2 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4dc8:	      |  |  |      lea 28(sp),sp
    4dcc:	/-----|--|--|----- beq.w 4f04 <Sw_PrepareDisplay.isra.0+0x260>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4dd0:	|  /--|--|--|----> pea 1 <_start+0x1>
    4dd4:	|  |  |  |  |      pea 101 <main+0x9b>
    4dd8:	|  |  |  |  |      pea 3c3b2 <incbin_MercuryLetterData2Lz4_end+0xce>
    4dde:	|  |  |  |  |      move.l d0,-(sp)
    4de0:	|  |  |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    4de2:	|  |  |  |  |      pea 14 <_start+0x14>
    4de6:	|  |  |  |  |      pea 100 <main+0x9a>
    4dea:	|  |  |  |  |      move.l 89bb2 <Sw_ScreenBuffer1>,-(sp)
    4df0:	|  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
    4df2:	|  |  |  |  |      lea 10de <Sw_ClBuild>(pc),a2
    4df6:	|  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ClBuild( );
    4df8:	|  |  |  |  |      jsr (a2)
    4dfa:	|  |  |  |  |      move.l d0,89b4c <Sw_DrawCopper>

void Sw_SwapCl() {
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    4e00:	|  |  |  |  |      movea.l 89cb4 <custom>,a0
    4e06:	|  |  |  |  |      move.l d0,128(a0)
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    4e0a:	|  |  |  |  |      movea.l 89cb8 <SysBase>,a6
    4e10:	|  |  |  |  |      moveq #22,d0
    4e12:	|  |  |  |  |      move.l #65537,d1
    4e18:	|  |  |  |  |      jsr -198(a6)
    4e1c:	|  |  |  |  |      movea.l d0,a1
    4e1e:	|  |  |  |  |      move.l d0,89ba6 <Sw_Vbint>
    4e24:	|  |  |  |  |      lea 28(sp),sp
    4e28:	|  |  |  |  |  /-- beq.s 4e44 <Sw_PrepareDisplay.isra.0+0x1a0>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4e2a:	|  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    4e30:	|  |  |  |  |  |   move.l #246610,10(a1)
    Sw_Vbint->is_Data = NULL;
    4e38:	|  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    4e3c:	|  |  |  |  |  |   move.l #5368,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    4e44:	|  |  |  |  |  \-> movea.l 89cb8 <SysBase>,a6
    4e4a:	|  |  |  |  |      moveq #4,d0
    4e4c:	|  |  |  |  |      jsr -168(a6)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    4e50:	|  |  |  |  |      move.l 89bb2 <Sw_ScreenBuffer1>,d0
    4e56:	|  |  |  |  |      move.l d0,89b50 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    4e5c:	|  |  |  |  |      move.l 89bae <Sw_ScreenBuffer2>,d1
    4e62:	|  |  |  |  |      move.l d1,89b54 <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    4e68:	|  |  |  |  |      move.l d1,89b58 <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    4e6e:	|  |  |  |  |      move.l d0,89b5c <Sw_ScreenBufferList+0xc>
  Sw_InitComplete = 1;
    4e74:	|  |  |  |  |      move.w #1,89b8e <Sw_InitComplete>
}
    4e7c:	|  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    4e82:	|  |  |  |  |      unlk a5
    4e84:	|  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    4e86:	|  |  |  |  \----> clr.l -(sp)
    4e88:	|  |  |  |         clr.l -(sp)
    4e8a:	|  |  |  |         pea -50(a5)
    4e8e:	|  |  |  |         pea 4 <_start+0x4>
    4e92:	|  |  |  |         pea 58 <_start+0x58>
    4e96:	|  |  |  |         jsr f0ff60 <_end+0xe862a4>
}
    4e9c:	|  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    4ea0:	|  |  |  |         movea.l 89cb8 <SysBase>,a6
    4ea6:	|  |  |  |         move.l #4000,d0
    4eac:	|  |  |  |         moveq #2,d1
    4eae:	|  |  |  |         jsr -198(a6)
    4eb2:	|  |  |  |         move.l d0,89baa <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    4eb8:	|  |  |  |         pea 1 <_start+0x1>
    4ebc:	|  |  |  |         pea 32 <_start+0x32>
    4ec0:	|  |  |  |         pea 3c36a <incbin_MercuryLetterData2Lz4_end+0x86>
    4ec6:	|  |  |  |         move.l d0,-(sp)
    4ec8:	|  |  |  |         lea 4426 <debug_register_bitmap.constprop.0>(pc),a3
    4ecc:	|  |  |  |         jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    4ece:	|  |  |  |         pea 14 <_start+0x14>
    4ed2:	|  |  |  |         pea 32 <_start+0x32>
    4ed6:	|  |  |  |         move.l 89baa <Sw_FontBuffer>,-(sp)
    4edc:	|  |  |  |         lea c54 <Utils_FillLong.constprop.0>(pc),a2
    4ee0:	|  |  |  |         jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4ee2:	|  |  |  |         movea.l 89cb8 <SysBase>,a6
    4ee8:	|  |  |  |         move.l #20560,d0
    4eee:	|  |  |  |         moveq #2,d1
    4ef0:	|  |  |  |         jsr -198(a6)
    4ef4:	|  |  |  |         move.l d0,89bae <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    4efa:	|  |  |  |         lea 28(sp),sp
    4efe:	|  |  |  \-------- bne.w 4d8e <Sw_PrepareDisplay.isra.0+0xea>
    4f02:	|  |  +----------- bra.s 4f38 <Sw_PrepareDisplay.isra.0+0x294>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f04:	>--|--|----------> movea.l 89cac <DOSBase>,a6
    4f0a:	|  |  |            jsr -60(a6)
    4f0e:	|  |  |            movea.l 89cac <DOSBase>,a6
    4f14:	|  |  |            move.l d0,d1
    4f16:	|  |  |            move.l #246649,d2
    4f1c:	|  |  |            moveq #38,d3
    4f1e:	|  |  |            jsr -48(a6)
    Exit(1);
    4f22:	|  |  |            movea.l 89cac <DOSBase>,a6
    4f28:	|  |  |            moveq #1,d1
    4f2a:	|  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    4f2e:	|  |  |            move.l 89bb2 <Sw_ScreenBuffer1>,d0
    4f34:	|  +--|----------- bra.w 4dd0 <Sw_PrepareDisplay.isra.0+0x12c>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4f38:	|  |  \----------> movea.l 89cac <DOSBase>,a6
    4f3e:	|  |               jsr -60(a6)
    4f42:	|  |               movea.l 89cac <DOSBase>,a6
    4f48:	|  |               move.l d0,d1
    4f4a:	|  |               move.l #246649,d2
    4f50:	|  |               moveq #38,d3
    4f52:	|  |               jsr -48(a6)
    Exit(1);
    4f56:	|  |               movea.l 89cac <DOSBase>,a6
    4f5c:	|  |               moveq #1,d1
    4f5e:	|  |               jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    4f62:	|  |               move.l 89bae <Sw_ScreenBuffer2>,d0
    4f68:	|  |               pea 1 <_start+0x1>
    4f6c:	|  |               pea 101 <main+0x9b>
    4f70:	|  |               pea 3c3a0 <incbin_MercuryLetterData2Lz4_end+0xbc>
    4f76:	|  |               move.l d0,-(sp)
    4f78:	|  |               jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    4f7a:	|  |               pea 14 <_start+0x14>
    4f7e:	|  |               pea 100 <main+0x9a>
    4f82:	|  |               move.l 89bae <Sw_ScreenBuffer2>,-(sp)
    4f88:	|  |               jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    4f8a:	|  |               movea.l 89cb8 <SysBase>,a6
    4f90:	|  |               move.l #20560,d0
    4f96:	|  |               moveq #2,d1
    4f98:	|  |               jsr -198(a6)
    4f9c:	|  |               move.l d0,89bb2 <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    4fa2:	|  |               lea 28(sp),sp
    4fa6:	|  \-------------- bne.w 4dd0 <Sw_PrepareDisplay.isra.0+0x12c>
    4faa:	\----------------- bra.w 4f04 <Sw_PrepareDisplay.isra.0+0x260>

00004fae <DrawScreen>:
{    
    4fae:	                   lea -44(sp),sp
    4fb2:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    4fb6:	                   movea.l 89cb0 <GfxBase>,a6
    4fbc:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    4fc0:	                   move.w #-1,dff044 <_end+0xd75388>
  custom->bltalwm = 0xffff; //Static
    4fc8:	                   move.w #-1,dff046 <_end+0xd7538a>
  switch(Scene) {
    4fd0:	                   cmpi.w #18,6544a <Scene>
    4fd8:	         /-------- bhi.s 504c <DrawScreen+0x9e>
    4fda:	         |         moveq #0,d0
    4fdc:	         |         move.w 6544a <Scene>,d0
    4fe2:	         |         add.l d0,d0
    4fe4:	         |         move.w (4fec <DrawScreen+0x3e>,pc,d0.l),d0
    4fe8:	         |         jmp (4fec <DrawScreen+0x3e>,pc,d0.w)
    4fec:	         |         ori.w #124,-(a0)
    4ff0:	         |         ([,0)andi.b #-58,([0,a6],d0.w:2,0)
    4ff6:	         |         ([,1104)bchg d1,([1046,d0.w:2],1104)
    4ffe:	         |         .short 0x04e0
    5000:	         |         btst d2,(a6)+
    5002:	         |         movep.w d2,1476(a2)
    5006:	         |         ori.b #84,-(a6)
    500a:	         |         ori.l #113248044,6a <main+0x4>
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    5012:	         |         pea d0 <main+0x6a>
    5016:	         |         pea 1 <_start+0x1>
    501a:	         |         pea 2 <_start+0x2>
    501e:	         |         pea 3 <_start+0x3>
    5022:	         |         pea 6 <_start+0x6>
    5026:	         |         pea 9 <_start+0x9>
    502a:	         |         pea 4472a <LetterMetaDataReversedAbyss>
    5030:	         |         pea 44742 <LetterMetaDataAbyss>
    5036:	         |         pea 44766 <CubeNrReverseSizeAbyss>
    503c:	         |         jsr 490e <DrawDices>(pc)
      break;  
    5040:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    5044:	         |         cmpi.w #1,d0
    5048:	         |  /----- beq.w 5212 <DrawScreen+0x264>
}
    504c:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    5050:	         |  |      lea 44(sp),sp
    5054:	         |  |      rts
      CubeFinished = 1;
    5056:	         |  |      move.w #1,89ca6 <CubeFinished>
}
    505e:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    5062:	         |  |      lea 44(sp),sp
    5066:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    5068:	         |  |      pea c3 <main+0x5d>
    506c:	         |  |      pea 1 <_start+0x1>
    5070:	         |  |      pea 3 <_start+0x3>
    5074:	         |  |      pea 3 <_start+0x3>
    5078:	         |  |      pea 8 <_start+0x8>
    507c:	         |  |      pea a <_start+0xa>
    5080:	         |  |      pea 65260 <LetterMetaDataReversedSpread>
    5086:	         |  |      pea 65282 <LetterMetaDataSpread1>
    508c:	         |  |      pea 652a8 <CubeNrReverseSizeSpread>
    5092:	         |  |      jsr 490e <DrawDices>(pc)
      break;
    5096:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    509a:	         |  |      cmpi.w #1,d0
    509e:	         +--|----- bne.s 504c <DrawScreen+0x9e>
    50a0:	         |  +----- bra.w 5212 <DrawScreen+0x264>
  ptrvector = VectorBuffer +  vectorpos;    
    50a4:	         |  |      moveq #0,d0
    50a6:	         |  |      move.w 89b46 <vectorpos>,d0
    50ac:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    50ae:	         |  |      moveq #0,d1
    50b0:	         |  |      move.w 89b44 <VectorPosLetters>,d1
    50b6:	         |  |      add.l d1,d1
    50b8:	         |  |      addi.l #322912,d1
    50be:	         |  |      move.l d1,89b40 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    50c4:	         |  |      pea 4 <_start+0x4>
    50c8:	         |  |      clr.l -(sp)
    50ca:	         |  |      addi.l #374146,d0
    50d0:	         |  |      move.l d0,-(sp)
    50d2:	         |  |      jsr 34d6 <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    50d6:	         |  |      movea.l 89b40 <ptrvectorletters>,a2
    50dc:	         |  |      lea 12(sp),sp
    50e0:	         |  |      moveq #4,d0
    50e2:	         |  |      move.l d0,44(sp)
    50e6:	         |  |      lea 446f8 <LetterMetaDataMercury1>,a5
    50ec:	         |  |      lea 412fa <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    50f2:	/--------|--|----> moveq #0,d0
    50f4:	|        |  |      move.w (a5),d0
    50f6:	|        |  |      moveq #0,d1
    50f8:	|        |  |      move.w 2(a5),d1
    50fc:	|        |  |      movea.l d1,a0
    50fe:	|        |  |      move.l d0,d1
    5100:	|        |  |      add.l d0,d1
    5102:	|        |  |      add.l d1,d0
    5104:	|        |  |      add.l d0,d0
    5106:	|        |  |      adda.l d0,a0
    5108:	|        |  |      move.l a0,d2
    510a:	|        |  |      lsl.l #5,d2
    510c:	|        |  |      movea.l d2,a0
    510e:	|        |  |      adda.l #563244,a0
    5114:	|        |  |      move.l 16(a0),d0
    5118:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    511c:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    5120:	|        |  |      moveq #1,d3
    5122:	|        |  |      cmp.l d0,d3
    5124:	|        |  |  /-- blt.w 5752 <DrawScreen+0x7a4>
      vectors += 12*metadata[2];
    5128:	|        |  |  |   movea.w d1,a0
    512a:	|        |  |  |   move.l a0,d0
    512c:	|        |  |  |   add.l a0,d0
    512e:	|        |  |  |   add.l a0,d0
    5130:	|        |  |  |   lsl.l #3,d0
    5132:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    5134:	|        |  |  |   addq.l #3,a0
    5136:	|        |  |  |   adda.l a0,a0
    5138:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    513a:	|        |  |  |   subq.l #1,44(sp)
    513e:	+--------|--|--|-- bne.s 50f2 <DrawScreen+0x144>
  CubeNrReversePos++;
    5140:	|  /-----|--|--|-> addq.w #1,446c8 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    5146:	|  |     |  |  |   move.w 89b46 <vectorpos>,d2
    514c:	|  |     |  |  |   addi.w #96,d2
    5150:	|  |     |  |  |   move.w d2,89b46 <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    5156:	|  |     |  |  |   addi.w #156,89b44 <VectorPosLetters>
  SetCl( clminendpos);
    515e:	|  |     |  |  |   pea 1 <_start+0x1>
    5162:	|  |     |  |  |   jsr 1588 <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    5166:	|  |     |  |  |   addq.l #4,sp
    5168:	|  |     |  |  |   cmpi.w #12767,d2
    516c:	|  |     +--|--|-- bls.w 504c <DrawScreen+0x9e>
    DoNotClearDirty = 1;
    5170:	|  |     |  |  |   move.w #1,89b34 <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    5178:	|  |     |  |  |   cmpi.w #12959,d2
    517c:	|  |     +--|--|-- bls.w 504c <DrawScreen+0x9e>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    5180:	|  |     |  |  |   movea.l 89b30 <ClearBuffer>,a2
    5186:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    518a:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    518e:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    5192:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    5196:	|  |     |  |  |   movea.l 89b3c <DrawBuffer>,a1
    519c:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    51a0:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    51a4:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    51a8:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    51ac:	|  |     |  |  |   movea.l 89b2c <ViewBuffer>,a0
    51b2:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    51b6:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    51ba:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    51be:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    51c2:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    51c6:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    51ca:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    51ce:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    51d2:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    51d6:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    51da:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    51de:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    51e2:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    51e6:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    51ea:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    51ee:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    51f2:	|  |     |  |  |   clr.w 89b34 <DoNotClearDirty>
    CubeNrReversePos = 1;
    51f8:	|  |     |  |  |   move.w #1,446c8 <CubeNrReversePos>
    vectorpos = 0;
    5200:	|  |     |  |  |   clr.w 89b46 <vectorpos>
    VectorPosLetters = 0;
    5206:	|  |     |  |  |   clr.w 89b44 <VectorPosLetters>
    VectorPosLettersReversed = 0;
    520c:	|  |     |  |  |   clr.w 89b36 <VectorPosLettersReversed>
  if(result == 1) Scene++;
    5212:	|  |     |  >--|-> addq.w #1,6544a <Scene>
}
    5218:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    521c:	|  |     |  |  |   lea 44(sp),sp
    5220:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    5222:	|  |     |  |  |   pea 2bd8 <DrawRect+0x62a>
    5226:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    522c:	|  |     |  |  |   pea 1f314 <incbin_PointCubeDataLz4_start>
    5232:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    5236:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    5238:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    523e:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    5244:	|  |     |  |  |   move.l d2,-(sp)
    5246:	|  |     |  |  |   pea 1f280 <incbin_PointCubeData_start>
    524c:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    5250:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    5252:	|  |     |  |  |   pea 251e <SetBplPointers+0x7e>
    5256:	|  |     |  |  |   move.l d2,-(sp)
    5258:	|  |     |  |  |   pea 21f94 <incbin_PointLetterDataLz4_start>
    525e:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    5260:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    5266:	|  |     |  |  |   lea 32(sp),sp
    526a:	|  |     |  |  |   move.l #322912,(sp)
    5270:	|  |     |  |  |   move.l d2,-(sp)
    5272:	|  |     |  |  |   pea 21f00 <incbin_PointLetterData_start>
    5278:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    527a:	|  |     |  |  |   pea 20d8 <LoadVectors+0xcc>
    527e:	|  |     |  |  |   move.l d2,-(sp)
    5280:	|  |     |  |  |   pea 24542 <incbin_PointReversedLetterDataLz4_start>
    5286:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    5288:	|  |     |  |  |   pea 45160 <LetterBuffer2>
    528e:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    5294:	|  |     |  |  |   pea 244c6 <incbin_PointReversedLetterData_start>
    529a:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    529c:	|  |     |  |  |   move.w #3,6544a <Scene>
    52a4:	|  |     |  |  |   lea 36(sp),sp
}
    52a8:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    52ac:	|  |     |  |  |   lea 44(sp),sp
    52b0:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    52b2:	|  |     |  |  |   pea d4 <main+0x6e>
    52b6:	|  |     |  |  |   pea 1 <_start+0x1>
    52ba:	|  |     |  |  |   pea 2 <_start+0x2>
    52be:	|  |     |  |  |   pea 3 <_start+0x3>
    52c2:	|  |     |  |  |   pea 5 <_start+0x5>
    52c6:	|  |     |  |  |   pea 6 <_start+0x6>
    52ca:	|  |     |  |  |   pea 44f2a <LetterMetaDataReversedPoint>
    52d0:	|  |     |  |  |   pea 44f40 <LetterMetaDataPoint>
    52d6:	|  |     |  |  |   pea 44f5e <CubeNrReverseSizePoint>
    52dc:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    52e0:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    52e4:	|  |     |  |  |   cmpi.w #1,d0
    52e8:	|  |     +--|--|-- bne.w 504c <DrawScreen+0x9e>
    52ec:	|  |     |  +--|-- bra.w 5212 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    52f0:	|  |     |  |  |   pea 24cd <SetBplPointers+0x2d>
    52f4:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    52fa:	|  |     |  |  |   pea 1a236 <incbin_TekCubeDataLz4_start>
    5300:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    5304:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    5306:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    530c:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    5312:	|  |     |  |  |   move.l d2,-(sp)
    5314:	|  |     |  |  |   pea 1a1a2 <incbin_TekCubeData_start>
    531a:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    531e:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    5320:	|  |     |  |  |   pea 2a8f <DrawRect+0x4e1>
    5324:	|  |     |  |  |   move.l d2,-(sp)
    5326:	|  |     |  |  |   pea 1c7dc <incbin_TekLetterDataLz4_start>
    532c:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    532e:	|  |     |  |  |   lea 32(sp),sp
    5332:	|  |     |  |  |   move.l #322912,(sp)
    5338:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    533e:	|  |     |  |  |   pea 1c718 <incbin_TekLetterData_start>
    5344:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    5346:	|  |     |  |  |   move.w #5,6544a <Scene>
    534e:	|  |     |  |  |   lea 12(sp),sp
}
    5352:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5356:	|  |     |  |  |   lea 44(sp),sp
    535a:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    535c:	|  |     |  |  |   pea 98 <main+0x32>
    5360:	|  |     |  |  |   pea 1 <_start+0x1>
    5364:	|  |     |  |  |   clr.l -(sp)
    5366:	|  |     |  |  |   pea 3 <_start+0x3>
    536a:	|  |     |  |  |   clr.l -(sp)
    536c:	|  |     |  |  |   pea 8 <_start+0x8>
    5370:	|  |     |  |  |   pea 44d00 <LetterMetaDataTek>
    5376:	|  |     |  |  |   pea 44d00 <LetterMetaDataTek>
    537c:	|  |     |  |  |   pea 44d22 <CubeNrReverseSizeTek>
    5382:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    5386:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    538a:	|  |     |  |  |   cmpi.w #1,d0
    538e:	|  |     +--|--|-- bne.w 504c <DrawScreen+0x9e>
    5392:	|  |     |  +--|-- bra.w 5212 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    5396:	|  |     |  |  |   pea 2be6 <DrawRect+0x638>
    539a:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    53a0:	|  |     |  |  |   pea 266f2 <incbin_FlexCubeDataLz4_start>
    53a6:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    53aa:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    53ac:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    53b2:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    53b8:	|  |     |  |  |   move.l d2,-(sp)
    53ba:	|  |     |  |  |   pea 2662e <incbin_FlexCubeData_start>
    53c0:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    53c4:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    53c6:	|  |     |  |  |   pea 30a1 <DrawRect+0xaf3>
    53ca:	|  |     |  |  |   move.l d2,-(sp)
    53cc:	|  |     |  |  |   pea 293e0 <incbin_FlexLetterDataLz4_start>
    53d2:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    53d4:	|  |     |  |  |   lea 32(sp),sp
    53d8:	|  |     |  |  |   move.l #322912,(sp)
    53de:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    53e4:	|  |     |  |  |   pea 292ec <incbin_FlexLetterData_start>
    53ea:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    53ec:	|  |     |  |  |   move.w #7,6544a <Scene>
    53f4:	|  |     |  |  |   lea 12(sp),sp
}
    53f8:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    53fc:	|  |     |  |  |   lea 44(sp),sp
    5400:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    5402:	|  |     |  |  |   pea af <main+0x49>
    5406:	|  |     |  |  |   pea 1 <_start+0x1>
    540a:	|  |     |  |  |   clr.l -(sp)
    540c:	|  |     |  |  |   pea 4 <_start+0x4>
    5410:	|  |     |  |  |   clr.l -(sp)
    5412:	|  |     |  |  |   pea a <_start+0xa>
    5416:	|  |     |  |  |   pea 44cd4 <LetterMetaDataFlex>
    541c:	|  |     |  |  |   pea 44cd4 <LetterMetaDataFlex>
    5422:	|  |     |  |  |   pea 652a8 <CubeNrReverseSizeSpread>
    5428:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    542c:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5430:	|  |     |  |  |   cmpi.w #1,d0
    5434:	|  |     +--|--|-- bne.w 504c <DrawScreen+0x9e>
    5438:	|  |     |  +--|-- bra.w 5212 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    543c:	|  |     |  |  |   pea 23ad <Clbuild+0x26d>
    5440:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    5446:	|  |     |  |  |   pea 2c52a <incbin_DesireCubeDataLz4_start>
    544c:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    5450:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    5452:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    5458:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    545e:	|  |     |  |  |   move.l d2,-(sp)
    5460:	|  |     |  |  |   pea 2c496 <incbin_DesireCubeData_start>
    5466:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    546a:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    546c:	|  |     |  |  |   pea 286a <DrawRect+0x2bc>
    5470:	|  |     |  |  |   move.l d2,-(sp)
    5472:	|  |     |  |  |   pea 2e9b0 <incbin_DesireLetterDataLz4_start>
    5478:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    547a:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    5480:	|  |     |  |  |   lea 32(sp),sp
    5484:	|  |     |  |  |   move.l #322912,(sp)
    548a:	|  |     |  |  |   move.l d2,-(sp)
    548c:	|  |     |  |  |   pea 2e8ec <incbin_DesireLetterData_start>
    5492:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    5494:	|  |     |  |  |   pea 27ff <DrawRect+0x251>
    5498:	|  |     |  |  |   move.l d2,-(sp)
    549a:	|  |     |  |  |   pea 312f2 <incbin_DesireReversedLetterDataLz4_start>
    54a0:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    54a2:	|  |     |  |  |   pea 45160 <LetterBuffer2>
    54a8:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    54ae:	|  |     |  |  |   pea 3122e <incbin_DesireReversedLetterData_start>
    54b4:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    54b6:	|  |     |  |  |   move.w #9,6544a <Scene>
    54be:	|  |     |  |  |   lea 36(sp),sp
}
    54c2:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    54c6:	|  |     |  |  |   lea 44(sp),sp
    54ca:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    54cc:	|  |     |  |  |   pea af <main+0x49>
    54d0:	|  |     |  |  |   pea 1 <_start+0x1>
    54d4:	|  |     |  |  |   pea 3 <_start+0x3>
    54d8:	|  |     |  |  |   pea 3 <_start+0x3>
    54dc:	|  |     |  |  |   pea 8 <_start+0x8>
    54e0:	|  |     |  |  |   pea 8 <_start+0x8>
    54e4:	|  |     |  |  |   pea 44aee <LetterMetaDataReversedDesire>
    54ea:	|  |     |  |  |   pea 44b10 <LetterMetaDataDesire>
    54f0:	|  |     |  |  |   pea 44b32 <CubeNrReverseSizeDesire>
    54f6:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    54fa:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    54fe:	|  |     |  |  |   cmpi.w #1,d0
    5502:	|  |     +--|--|-- bne.w 504c <DrawScreen+0x9e>
    5506:	|  |     |  +--|-- bra.w 5212 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    550a:	|  |     |  |  |   pea 24f2 <SetBplPointers+0x52>
    550e:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    5514:	|  |     |  |  |   pea 14f68 <incbin_AtwCubeDataLz4_start>
    551a:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    551e:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    5520:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    5526:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    552c:	|  |     |  |  |   move.l d2,-(sp)
    552e:	|  |     |  |  |   pea 14ed4 <incbin_AtwCubeData_start>
    5534:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    5538:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    553a:	|  |     |  |  |   pea 2c5b <DrawRect+0x6ad>
    553e:	|  |     |  |  |   move.l d2,-(sp)
    5540:	|  |     |  |  |   pea 17532 <incbin_AtwLetterDataLz4_start>
    5546:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    5548:	|  |     |  |  |   lea 32(sp),sp
    554c:	|  |     |  |  |   move.l #322912,(sp)
    5552:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    5558:	|  |     |  |  |   pea 1746e <incbin_AtwLetterData_start>
    555e:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    5560:	|  |     |  |  |   move.w #11,6544a <Scene>
    5568:	|  |     |  |  |   lea 12(sp),sp
}
    556c:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5570:	|  |     |  |  |   lea 44(sp),sp
    5574:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    5576:	|  |     |  |  |   pea c8 <main+0x62>
    557a:	|  |     |  |  |   pea 1 <_start+0x1>
    557e:	|  |     |  |  |   clr.l -(sp)
    5580:	|  |     |  |  |   pea 3 <_start+0x3>
    5584:	|  |     |  |  |   clr.l -(sp)
    5586:	|  |     |  |  |   pea 8 <_start+0x8>
    558a:	|  |     |  |  |   pea 44908 <LetterMetaDataReversedAtw>
    5590:	|  |     |  |  |   pea 4492a <LetterMetaDataAtw>
    5596:	|  |     |  |  |   pea 4494c <CubeNrReverseAtw>
    559c:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    55a0:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    55a4:	|  |     |  |  |   cmpi.w #1,d0
    55a8:	|  |     +--|--|-- bne.w 504c <DrawScreen+0x9e>
    55ac:	|  |     |  +--|-- bra.w 5212 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    55b0:	|  |     |  |  |   pea 28fa <DrawRect+0x34c>
    55b4:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    55ba:	|  |     |  |  |   pea d090 <incbin_AbyssCubeDataLz4_start>
    55c0:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    55c4:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    55c6:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    55cc:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    55d2:	|  |     |  |  |   move.l d2,-(sp)
    55d4:	|  |     |  |  |   pea cffc <incbin_AbyssCubeData_start>
    55da:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    55de:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    55e0:	|  |     |  |  |   pea 30ff <DrawRect+0xb51>
    55e4:	|  |     |  |  |   move.l d2,-(sp)
    55e6:	|  |     |  |  |   pea fa7a <incbin_AbyssLetterDataLz4_start>
    55ec:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    55ee:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    55f4:	|  |     |  |  |   lea 32(sp),sp
    55f8:	|  |     |  |  |   move.l #322912,(sp)
    55fe:	|  |     |  |  |   move.l d2,-(sp)
    5600:	|  |     |  |  |   pea f99e <incbin_AbyssLetterData_start>
    5606:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    5608:	|  |     |  |  |   pea 229d <Clbuild+0x15d>
    560c:	|  |     |  |  |   move.l d2,-(sp)
    560e:	|  |     |  |  |   pea 12c22 <incbin_AbyssReversedLetterDataLz4_start>
    5614:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    5616:	|  |     |  |  |   pea 45160 <LetterBuffer2>
    561c:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    5622:	|  |     |  |  |   pea 12b8e <incbin_AbyssReversedLetterData_start>
    5628:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    562a:	|  |     |  |  |   move.w #13,6544a <Scene>
    5632:	|  |     |  |  |   lea 36(sp),sp
}
    5636:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    563a:	|  |     |  |  |   lea 44(sp),sp
    563e:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    5640:	|  |     |  |  |   pea 2003 <SetCl+0xa7b>
    5644:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    564a:	|  |     |  |  |   pea 33bca <incbin_MercuryCubeData1Lz4_start>
    5650:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    5654:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    5656:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    565c:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    5662:	|  |     |  |  |   move.l d2,-(sp)
    5664:	|  |     |  |  |   pea 33b06 <incbin_MercuryCubeData1_start>
    566a:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    566e:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    5670:	|  |     |  |  |   pea 2b27 <DrawRect+0x579>
    5674:	|  |     |  |  |   move.l d2,-(sp)
    5676:	|  |     |  |  |   pea 35d1e <incbin_MercuryLetterData1Lz4_start>
    567c:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    567e:	|  |     |  |  |   lea 32(sp),sp
    5682:	|  |     |  |  |   move.l #322912,(sp)
    5688:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    568e:	|  |     |  |  |   pea 35be2 <incbin_MercuryLetterData1_start>
    5694:	|  |     |  |  |   jsr (a2)
      Scene = 15;
    5696:	|  |     |  |  |   move.w #15,6544a <Scene>
    569e:	|  |     |  |  |   lea 12(sp),sp
}
    56a2:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    56a6:	|  |     |  |  |   lea 44(sp),sp
    56aa:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    56ac:	|  |     |  |  |   pea 1928 <SetCl+0x3a0>
    56b0:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    56b6:	|  |     |  |  |   pea 3891e <incbin_MercuryCubeData2Lz4_start>
    56bc:	|  |     |  |  |   lea bbc <Utils_Lz4DepackAsm>(pc),a3
    56c0:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    56c2:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,d2
    56c8:	|  |     |  |  |   pea 5b582 <VectorBuffer>
    56ce:	|  |     |  |  |   move.l d2,-(sp)
    56d0:	|  |     |  |  |   pea 3885a <incbin_MercuryCubeData2_start>
    56d6:	|  |     |  |  |   lea 200c <LoadVectors>(pc),a2
    56da:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    56dc:	|  |     |  |  |   pea 1f6b <SetCl+0x9e3>
    56e0:	|  |     |  |  |   move.l d2,-(sp)
    56e2:	|  |     |  |  |   pea 3a366 <incbin_MercuryLetterData2Lz4_start>
    56e8:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    56ea:	|  |     |  |  |   lea 32(sp),sp
    56ee:	|  |     |  |  |   move.l #322912,(sp)
    56f4:	|  |     |  |  |   move.l 89ca2 <WorkingMem>,-(sp)
    56fa:	|  |     |  |  |   pea 3a25a <incbin_MercuryLetterData2_start>
    5700:	|  |     |  |  |   jsr (a2)
      Scene = 17;
    5702:	|  |     |  |  |   move.w #17,6544a <Scene>
    570a:	|  |     |  |  |   lea 12(sp),sp
}
    570e:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5712:	|  |     |  |  |   lea 44(sp),sp
    5716:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    5718:	|  |     |  |  |   pea 84 <main+0x1e>
    571c:	|  |     |  |  |   pea 6e <main+0x8>
    5720:	|  |     |  |  |   clr.l -(sp)
    5722:	|  |     |  |  |   pea 4 <_start+0x4>
    5726:	|  |     |  |  |   clr.l -(sp)
    5728:	|  |     |  |  |   pea b <_start+0xb>
    572c:	|  |     |  |  |   pea 446ca <LetterMetaDataMercury2>
    5732:	|  |     |  |  |   pea 446ca <LetterMetaDataMercury2>
    5738:	|  |     |  |  |   pea 4494c <CubeNrReverseAtw>
    573e:	|  |     |  |  |   jsr 490e <DrawDices>(pc)
      break;
    5742:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5746:	|  |     |  |  |   cmpi.w #1,d0
    574a:	|  |     \--|--|-- bne.w 504c <DrawScreen+0x9e>
    574e:	|  |        \--|-- bra.w 5212 <DrawScreen+0x264>
      for(int i=0;i<metadata[2];i++)
    5752:	|  |           \-> tst.w d1
    5754:	|  |  /----------- ble.w 58ca <DrawScreen+0x91c>
    5758:	|  |  |            lea 6(a5),a6
    575c:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    575e:	|  |  |            lea 20(a0),a0
    5762:	|  |  |            move.l a0,52(sp)
    5766:	|  |  |            move.l a5,48(sp)
    576a:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    576c:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    5770:	|  |  |  |         movea.w 4(a2),a0
    5774:	|  |  |  |         move.l a0,d0
    5776:	|  |  |  |         subq.l #1,d0
    5778:	|  |  |  |         add.l d0,d0
    577a:	|  |  |  |         move.w (0,a4,d0.l),d0
    577e:	|  |  |  |         move.w d0,d1
    5780:	|  |  |  |         muls.w (a2),d1
    5782:	|  |  |  |         moveq #15,d4
    5784:	|  |  |  |         asr.l d4,d1
    5786:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    578a:	|  |  |  |         muls.w 2(a2),d0
    578e:	|  |  |  |         asr.l d4,d0
    5790:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    5794:	|  |  |  |         movea.w 10(a2),a0
    5798:	|  |  |  |         subq.l #1,a0
    579a:	|  |  |  |         adda.l a0,a0
    579c:	|  |  |  |         move.w (0,a4,a0.l),d2
    57a0:	|  |  |  |         move.w d2,d7
    57a2:	|  |  |  |         muls.w 6(a2),d7
    57a6:	|  |  |  |         asr.l d4,d7
    57a8:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    57ac:	|  |  |  |         muls.w 8(a2),d2
    57b0:	|  |  |  |         asr.l d4,d2
    57b2:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    57b6:	|  |  |  |         movea.w 16(a2),a0
    57ba:	|  |  |  |         subq.l #1,a0
    57bc:	|  |  |  |         adda.l a0,a0
    57be:	|  |  |  |         move.w (0,a4,a0.l),d3
    57c2:	|  |  |  |         move.w d3,d6
    57c4:	|  |  |  |         muls.w 12(a2),d6
    57c8:	|  |  |  |         asr.l d4,d6
    57ca:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    57ce:	|  |  |  |         muls.w 14(a2),d3
    57d2:	|  |  |  |         asr.l d4,d3
    57d4:	|  |  |  |         movea.w d3,a1
    57d6:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    57da:	|  |  |  |         movea.w 22(a2),a0
    57de:	|  |  |  |         subq.l #1,a0
    57e0:	|  |  |  |         adda.l a0,a0
    57e2:	|  |  |  |         move.w (0,a4,a0.l),d3
    57e6:	|  |  |  |         move.w d3,d5
    57e8:	|  |  |  |         muls.w 18(a2),d5
    57ec:	|  |  |  |         asr.l d4,d5
    57ee:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    57f2:	|  |  |  |         muls.w 20(a2),d3
    57f6:	|  |  |  |         asr.l d4,d3
    57f8:	|  |  |  |         movea.w d3,a0
    57fa:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    57fe:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    5802:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    5806:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    580a:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    580e:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    5812:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    5816:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    581a:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    581e:	|  |  |  |         move.w d1,d4
    5820:	|  |  |  |         cmp.w d1,d7
    5822:	|  |  |  |     /-- bge.s 5826 <DrawScreen+0x878>
    5824:	|  |  |  |     |   move.w d7,d4
    5826:	|  |  |  |     \-> cmp.w d4,d6
    5828:	|  |  |  |     /-- bge.s 582c <DrawScreen+0x87e>
    582a:	|  |  |  |     |   move.w d6,d4
    582c:	|  |  |  |     \-> cmp.w d4,d5
    582e:	|  |  |  |     /-- bge.s 5832 <DrawScreen+0x884>
    5830:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    5832:	|  |  |  |     \-> move.w d0,d3
    5834:	|  |  |  |         cmp.w d0,d2
    5836:	|  |  |  |     /-- bge.s 583a <DrawScreen+0x88c>
    5838:	|  |  |  |     |   move.w d2,d3
    583a:	|  |  |  |     \-> cmp.w a1,d3
    583c:	|  |  |  |     /-- ble.s 5840 <DrawScreen+0x892>
    583e:	|  |  |  |     |   move.w a1,d3
    5840:	|  |  |  |     \-> cmp.w a0,d3
    5842:	|  |  |  |     /-- ble.s 5846 <DrawScreen+0x898>
    5844:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    5846:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    584a:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    584e:	|  |  |  |         cmp.w d0,d2
    5850:	|  |  |  |     /-- ble.s 5854 <DrawScreen+0x8a6>
    5852:	|  |  |  |     |   move.w d2,d0
    5854:	|  |  |  |     \-> cmp.w a1,d0
    5856:	|  |  |  |     /-- bge.s 585a <DrawScreen+0x8ac>
    5858:	|  |  |  |     |   move.w a1,d0
    585a:	|  |  |  |     \-> cmp.w a0,d0
    585c:	|  |  |  |     /-- bge.s 5860 <DrawScreen+0x8b2>
    585e:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    5860:	|  |  |  |     \-> addq.w #1,d0
    5862:	|  |  |  |         sub.w d3,d0
    5864:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5868:	|  |  |  |         cmpi.w #1,d0
    586c:	|  |  |  |  /----- ble.s 58a6 <DrawScreen+0x8f8>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    586e:	|  |  |  |  |      cmp.w d1,d7
    5870:	|  |  |  |  |  /-- ble.s 5874 <DrawScreen+0x8c6>
    5872:	|  |  |  |  |  |   move.w d7,d1
    5874:	|  |  |  |  |  \-> cmp.w d1,d6
    5876:	|  |  |  |  |  /-- ble.s 587a <DrawScreen+0x8cc>
    5878:	|  |  |  |  |  |   move.w d6,d1
    587a:	|  |  |  |  |  \-> cmp.w d1,d5
    587c:	|  |  |  |  |  /-- ble.s 5880 <DrawScreen+0x8d2>
    587e:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    5880:	|  |  |  |  |  \-> sub.w d4,d1
    5882:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    5886:	|  |  |  |  |      cmpi.w #1,d1
    588a:	|  |  |  |  +----- ble.s 58a6 <DrawScreen+0x8f8>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    588c:	|  |  |  |  |      movea.l 52(sp),a0
    5890:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    5894:	|  |  |  |  |      pea 56(sp)
    5898:	|  |  |  |  |      jsr 25ae <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    589c:	|  |  |  |  |      movea.l 52(sp),a0
    58a0:	|  |  |  |  |      movea.w 4(a0),a5
    58a4:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    58a6:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    58aa:	|  |  |  |         addq.l #1,a3
    58ac:	|  |  |  |         movea.w a5,a0
    58ae:	|  |  |  |         cmpa.l a3,a0
    58b0:	|  |  |  \-------- bgt.w 576c <DrawScreen+0x7be>
    58b4:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    58b8:	|  |  |            addq.l #3,a0
    58ba:	|  |  |            adda.l a0,a0
    58bc:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    58be:	|  |  |            subq.l #1,44(sp)
    58c2:	+--|--|----------- bne.w 50f2 <DrawScreen+0x144>
    58c6:	|  +--|----------- bra.w 5140 <DrawScreen+0x192>
    metadata += 3 + metadata[2];    
    58ca:	|  |  \----------> movea.w d1,a0
    58cc:	|  |               addq.l #3,a0
    58ce:	|  |               adda.l a0,a0
    58d0:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    58d2:	|  |               subq.l #1,44(sp)
    58d6:	\--|-------------- bne.w 50f2 <DrawScreen+0x144>
    58da:	   \-------------- bra.w 5140 <DrawScreen+0x192>

000058de <strlen>:
	while(*s++)
    58de:	   /-> movea.l 4(sp),a0
    58e2:	   |   tst.b (a0)+
    58e4:	/--|-- beq.s 58f2 <strlen+0x14>
    58e6:	|  |   move.l a0,-(sp)
    58e8:	|  \-- jsr 58de <strlen>(pc)
    58ec:	|      addq.l #4,sp
    58ee:	|      addq.l #1,d0
}
    58f0:	|      rts
	unsigned long t=0;
    58f2:	\----> moveq #0,d0
}
    58f4:	       rts

000058f6 <memset>:
void* memset(void *dest, int val, unsigned long len) {
    58f6:	       move.l d2,-(sp)
    58f8:	       move.l 8(sp),d0
	while(len-- > 0)
    58fc:	       tst.l 16(sp)
    5900:	/----- beq.s 5914 <memset+0x1e>
		*ptr++ = val;
    5902:	|      move.b 15(sp),d2
    5906:	|      move.l 16(sp),d1
    590a:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    590c:	|      movea.l d0,a0
		*ptr++ = val;
    590e:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    5910:	|  |   cmpa.l d1,a0
    5912:	|  \-- bne.s 590e <memset+0x18>
}
    5914:	\----> move.l (sp)+,d2
    5916:	       rts

00005918 <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5918:	       move.l 4(sp),d0
    591c:	       movea.l 8(sp),a0
	while(len--)
    5920:	       tst.l 12(sp)
    5924:	/----- beq.s 5934 <memcpy+0x1c>
    5926:	|      movea.l d0,a1
    5928:	|      move.l 12(sp),d1
    592c:	|      add.l a0,d1
		*d++ = *s++;
    592e:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    5930:	|  |   cmp.l a0,d1
    5932:	|  \-- bne.s 592e <memcpy+0x16>
}
    5934:	\----> rts

00005936 <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5936:	          move.l d2,-(sp)
    5938:	          move.l 8(sp),d0
    593c:	          movea.l 12(sp),a0
    5940:	          move.l 16(sp),d2
	if (d < s) {
    5944:	          cmpa.l d0,a0
    5946:	   /----- bls.s 595c <memmove+0x26>
		while (len--)
    5948:	   |      tst.l d2
    594a:	/--|----- beq.s 5958 <memmove+0x22>
    594c:	|  |      movea.l d0,a1
    594e:	|  |      move.l a0,d1
    5950:	|  |      add.l d2,d1
			*d++ = *s++;
    5952:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    5954:	|  |  |   cmp.l a0,d1
    5956:	|  |  \-- bne.s 5952 <memmove+0x1c>
}
    5958:	>--|----> move.l (sp)+,d2
    595a:	|  |      rts
		while (len--)
    595c:	|  \----> movea.l d2,a1
    595e:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5960:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    5962:	|         adda.l d0,a1
		while (len--)
    5964:	|         tst.l d2
    5966:	+-------- beq.s 5958 <memmove+0x22>
    5968:	|         move.l a0,d1
    596a:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    596c:	|     /-> move.b (a0),(a1)
		while (len--)
    596e:	|     |   subq.l #1,a0
    5970:	|     |   subq.l #1,a1
    5972:	|     |   cmpa.l d1,a0
    5974:	+-----|-- beq.s 5958 <memmove+0x22>
			*lastd-- = *lasts--;
    5976:	|     |   move.b (a0),(a1)
		while (len--)
    5978:	|     |   subq.l #1,a0
    597a:	|     |   subq.l #1,a1
    597c:	|     |   cmpa.l d1,a0
    597e:	|     \-- bne.s 596c <memmove+0x36>
    5980:	\-------- bra.s 5958 <memmove+0x22>
    5982:	          nop

00005984 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    5984:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    5988:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    598c:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    5990:	mulu.w 8(sp),d1
	addw	d1, d0
    5994:	add.w d1,d0
	swap	d0
    5996:	swap d0
	clrw	d0
    5998:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    599a:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    599e:	mulu.w 10(sp),d1
	addl	d1, d0
    59a2:	add.l d1,d0
	rts
    59a4:	rts

000059a6 <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    59a6:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    59a8:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    59ac:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    59b0:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    59b6:	   /-- bcc.s 59ce <__udivsi3+0x28>
	movel	d0, d2
    59b8:	   |   move.l d0,d2
	clrw	d2
    59ba:	   |   clr.w d2
	swap	d2
    59bc:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    59be:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    59c0:	   |   move.w d2,d0
	swap	d0
    59c2:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    59c4:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    59c8:	   |   divu.w d1,d2
	movew	d2, d0
    59ca:	   |   move.w d2,d0
	jra	6f
    59cc:	/--|-- bra.s 59fe <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    59ce:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    59d0:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    59d2:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    59d4:	|  |   cmpi.l #65536,d1
	jcc	4b
    59da:	|  \-- bcc.s 59d0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    59dc:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    59de:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    59e4:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    59e6:	|      mulu.w d0,d1
	swap	d2
    59e8:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    59ea:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    59ec:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    59ee:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    59f0:	|  /-- bne.s 59fc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    59f2:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    59f4:	|  +-- bcs.s 59fc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    59f6:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    59fa:	+--|-- bls.s 59fe <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    59fc:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    59fe:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5a00:	       rts

00005a02 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    5a02:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    5a04:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    5a06:	    move.l 12(sp),d1
	jpl	1f
    5a0a:	/-- bpl.s 5a10 <__divsi3+0xe>
	negl	d1
    5a0c:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5a0e:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5a10:	\-> move.l 8(sp),d0
	jpl	2f
    5a14:	/-- bpl.s 5a1a <__divsi3+0x18>
	negl	d0
    5a16:	|   neg.l d0
	negb	d2
    5a18:	|   neg.b d2

2:	movel	d1, sp@-
    5a1a:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5a1c:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5a1e:	    bsr.s 59a6 <__udivsi3>
	addql	#8, sp
    5a20:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    5a22:	    tst.b d2
	jpl	3f
    5a24:	/-- bpl.s 5a28 <__divsi3+0x26>
	negl	d0
    5a26:	|   neg.l d0

3:	movel	sp@+, d2
    5a28:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5a2a:	    rts

00005a2c <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5a2c:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5a30:	move.l 4(sp),d0
	movel	d1, sp@-
    5a34:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5a36:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5a38:	bsr.s 5a02 <__divsi3>
	addql	#8, sp
    5a3a:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5a3c:	move.l 8(sp),d1
	movel	d1, sp@-
    5a40:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5a42:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5a44:	bsr.w 5984 <__mulsi3>
	addql	#8, sp
    5a48:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5a4a:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5a4e:	sub.l d0,d1
	movel	d1, d0
    5a50:	move.l d1,d0
	rts
    5a52:	rts

00005a54 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5a54:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5a58:	move.l 4(sp),d0
	movel	d1, sp@-
    5a5c:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5a5e:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5a60:	bsr.w 59a6 <__udivsi3>
	addql	#8, sp
    5a64:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5a66:	move.l 8(sp),d1
	movel	d1, sp@-
    5a6a:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5a6c:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5a6e:	bsr.w 5984 <__mulsi3>
	addql	#8, sp
    5a72:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5a74:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5a78:	sub.l d0,d1
	movel	d1, d0
    5a7a:	move.l d1,d0
	rts
    5a7c:	rts

00005a7e <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    5a7e:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    5a80:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    5a84:	jsr -516(a6)
    move.l (sp)+, a6
    5a88:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    5a8a:	rts

00005a8c <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    5a8c:	move.b d0,(a3)+
	rts
    5a8e:	rts

00005a90 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    5a90:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    5a92:	                         adda.l a0,a2
	move.l	a2,a3
    5a94:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    5a96:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    5a98:	                         moveq #56,d4
	moveq	#8,d5
    5a9a:	                         moveq #8,d5
	bra.s	.Lliteral
    5a9c:	   /-------------------- bra.s 5b06 <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    5a9e:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    5aa0:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    5aa2:	+--|-------------------- dbf d1,5a9e <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    5aa6:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    5aa8:	|  |     /-------------- bcc.s 5aac <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    5aaa:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    5aac:	|  |  |  >-------------> tst.w d0
    5aae:	|  |  |  |           /-- bne.s 5ab8 <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    5ab0:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    5ab2:	|  |  |  |           |   bls.s 5b2a <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    5ab4:	|  |  |  |           |   move.w (a0)+,d0
    5ab6:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    5ab8:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    5aba:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    5abc:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    5abe:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    5ac0:	|  |  |  |               movem.w (5b24 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    5ac6:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    5ac8:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    5aca:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    5acc:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    5ace:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    5ad0:	|  |  |  |               tst.w d0
    5ad2:	|  |  |  |           /-- bne.s 5ad8 <_doynaxdepack_asm+0x48>
    5ad4:	|  |  |  |           |   move.w (a0)+,d0
    5ad6:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5ad8:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5ada:	|  |  |  |  /----------- beq.s 5af2 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5adc:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5ade:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5ae0:	|  |  |  |  |  /-------- bpl.s 5aee <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    5ae2:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    5ae4:	|  |  |  |  |  |  /----- bpl.s 5aec <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    5ae6:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5ae8:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5aea:	|  |  |  |  |  |  |  \-- bmi.s 5ae6 <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5aec:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5aee:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5af0:	|  |  |  |  |        /-- bcc.s 5af4 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    5af2:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    5af4:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    5af6:	|  |  |  |  \----------- dbf d1,5af2 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5afa:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5afc:	|  |  |  \-------------- bcc.s 5aac <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5afe:	|  |  |                  tst.w d0
    5b00:	|  +--|----------------- bne.s 5b06 <_doynaxdepack_asm+0x76>
    5b02:	|  |  |                  move.w (a0)+,d0
    5b04:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    5b06:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5b08:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5b0a:	|     \----------------- bcc.s 5aaa <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5b0c:	|                 /----- bpl.s 5b14 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5b0e:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5b10:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    5b12:	|                 |  \-- bmi.s 5b0e <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    5b14:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    5b16:	\--------------------/-X dbv.s d1,5a9e <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5b1a:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5b1c:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5b1e:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5b20:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    5b22:	                     \-- bra.s 5b16 <_doynaxdepack_asm+0x86>

00005b24 <doy_table>:
    5b24:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    5b34:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    5b44:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    5b54:	.............oNq

00005b64 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5b64:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5b68:	moveq #0,d1
			moveq	#0,d2
    5b6a:	moveq #0,d2
			moveq	#0,d3
    5b6c:	moveq #0,d3
			moveq	#16,d7
    5b6e:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5b70:	lea 67ee <lz4jmp>(pc),a3
		moveq	#0,d0
    5b74:	moveq #0,d0
		move.b	(a0)+,d0
    5b76:	move.b (a0)+,d0
		add.w	d0,d0
    5b78:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5b7a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5b7e:	jmp (0,a3,d0.w)

00005b82 <lz4Rts0>:
lz4Rts0:	rts
    5b82:	rts

00005b84 <sl_sm0>:

sl_sm0:
		move.b	(a0)+,(a1)+
    5b84:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b86:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b88:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b8a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b8c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b8e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b90:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b92:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b94:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b96:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b98:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b9a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b9c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5b9e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5ba0:	cmpa.l a0,a4
		beq.s	lz4Rts1
    5ba2:	beq.s 5bc6 <lz4Rts1>
		move.b	(a0)+,d0
    5ba4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5ba6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5ba8:	move.w (sp)+,d3
		move.b	d0,d3
    5baa:	move.b d0,d3
		move.l	a1,a2
    5bac:	movea.l a1,a2
		sub.l	d3,a2
    5bae:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5bb0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bb2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bb4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bb6:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5bb8:	moveq #0,d0
		move.b	(a0)+,d0
    5bba:	move.b (a0)+,d0
		add.w	d0,d0
    5bbc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5bbe:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5bc2:	jmp (0,a3,d0.w)

00005bc6 <lz4Rts1>:
lz4Rts1:	rts
    5bc6:	rts

00005bc8 <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    5bc8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bca:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bcc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bd0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bd2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bd4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bd6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bd8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bdc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5bde:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5be0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5be2:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5be4:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5be6:	beq.s 5c0c <lz4Rts2>
		move.b	(a0)+,d0
    5be8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5bea:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5bec:	move.w (sp)+,d3
		move.b	d0,d3
    5bee:	move.b d0,d3
		move.l	a1,a2
    5bf0:	movea.l a1,a2
		sub.l	d3,a2
    5bf2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5bf4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bf6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bf8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bfa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5bfc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5bfe:	moveq #0,d0
		move.b	(a0)+,d0
    5c00:	move.b (a0)+,d0
		add.w	d0,d0
    5c02:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5c04:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5c08:	jmp (0,a3,d0.w)

00005c0c <lz4Rts2>:
lz4Rts2:	rts
    5c0c:	rts

00005c0e <sl_sm2>:

sl_sm2:
		move.b	(a0)+,(a1)+
    5c0e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c10:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c12:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c14:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c16:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c18:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c1a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c1c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c1e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c20:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c28:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5c2a:	cmpa.l a0,a4
		beq.s	lz4Rts3
    5c2c:	beq.s 5c54 <lz4Rts3>
		move.b	(a0)+,d0
    5c2e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5c30:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5c32:	move.w (sp)+,d3
		move.b	d0,d3
    5c34:	move.b d0,d3
		move.l	a1,a2
    5c36:	movea.l a1,a2
		sub.l	d3,a2
    5c38:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5c3a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c3c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c3e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c40:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c42:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c44:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5c46:	moveq #0,d0
		move.b	(a0)+,d0
    5c48:	move.b (a0)+,d0
		add.w	d0,d0
    5c4a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5c4c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5c50:	jmp (0,a3,d0.w)

00005c54 <lz4Rts3>:
lz4Rts3:	rts
    5c54:	rts

00005c56 <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    5c56:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c58:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c5a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c5c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c5e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c60:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c62:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c64:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c66:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c68:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c6a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c6c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c6e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5c70:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5c72:	cmpa.l a0,a4
		beq.s	lz4Rts4
    5c74:	beq.s 5c9e <lz4Rts4>
		move.b	(a0)+,d0
    5c76:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5c78:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5c7a:	move.w (sp)+,d3
		move.b	d0,d3
    5c7c:	move.b d0,d3
		move.l	a1,a2
    5c7e:	movea.l a1,a2
		sub.l	d3,a2
    5c80:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5c82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c8a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c8c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5c8e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5c90:	moveq #0,d0
		move.b	(a0)+,d0
    5c92:	move.b (a0)+,d0
		add.w	d0,d0
    5c94:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5c96:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5c9a:	jmp (0,a3,d0.w)

00005c9e <lz4Rts4>:
lz4Rts4:	rts
    5c9e:	rts

00005ca0 <sl_sm4>:

sl_sm4:
		move.b	(a0)+,(a1)+
    5ca0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ca2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ca4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ca6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ca8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5caa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cac:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cb0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cb2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cb4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cb6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cb8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cba:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5cbc:	cmpa.l a0,a4
		beq.s	lz4Rts5
    5cbe:	beq.s 5cea <lz4Rts5>
		move.b	(a0)+,d0
    5cc0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5cc2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5cc4:	move.w (sp)+,d3
		move.b	d0,d3
    5cc6:	move.b d0,d3
		move.l	a1,a2
    5cc8:	movea.l a1,a2
		sub.l	d3,a2
    5cca:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5ccc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cd0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cd2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cd4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cd6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cd8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5cda:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5cdc:	moveq #0,d0
		move.b	(a0)+,d0
    5cde:	move.b (a0)+,d0
		add.w	d0,d0
    5ce0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5ce2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5ce6:	jmp (0,a3,d0.w)

00005cea <lz4Rts5>:
lz4Rts5:	rts
    5cea:	rts

00005cec <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    5cec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5cf2:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    5d08:	cmpa.l a0,a4
		beq.s	lz4Rts6
    5d0a:	beq.s 5d38 <lz4Rts6>
		move.b	(a0)+,d0
    5d0c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d0e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d10:	move.w (sp)+,d3
		move.b	d0,d3
    5d12:	move.b d0,d3
		move.l	a1,a2
    5d14:	movea.l a1,a2
		sub.l	d3,a2
    5d16:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d1e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d26:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d28:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d2a:	moveq #0,d0
		move.b	(a0)+,d0
    5d2c:	move.b (a0)+,d0
		add.w	d0,d0
    5d2e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d30:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d34:	jmp (0,a3,d0.w)

00005d38 <lz4Rts6>:
lz4Rts6:	rts
    5d38:	rts

00005d3a <sl_sm6>:

sl_sm6:
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
		move.b	(a0)+,(a1)+
    5d54:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5d56:	cmpa.l a0,a4
		beq.s	lz4Rts7
    5d58:	beq.s 5d88 <lz4Rts7>
		move.b	(a0)+,d0
    5d5a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5d5c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5d5e:	move.w (sp)+,d3
		move.b	d0,d3
    5d60:	move.b d0,d3
		move.l	a1,a2
    5d62:	movea.l a1,a2
		sub.l	d3,a2
    5d64:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5d66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5d78:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5d7a:	moveq #0,d0
		move.b	(a0)+,d0
    5d7c:	move.b (a0)+,d0
		add.w	d0,d0
    5d7e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5d80:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5d84:	jmp (0,a3,d0.w)

00005d88 <lz4Rts7>:
lz4Rts7:	rts
    5d88:	rts

00005d8a <sl_sm7>:

sl_sm7:
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
		cmpa.l	a0,a4
    5da6:	cmpa.l a0,a4
		beq.s	lz4Rts8
    5da8:	beq.s 5dda <lz4Rts8>
		move.b	(a0)+,d0
    5daa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5dac:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5dae:	move.w (sp)+,d3
		move.b	d0,d3
    5db0:	move.b d0,d3
		move.l	a1,a2
    5db2:	movea.l a1,a2
		sub.l	d3,a2
    5db4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5db6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5db8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dba:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dbc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dbe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5dc0:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    5dcc:	moveq #0,d0
		move.b	(a0)+,d0
    5dce:	move.b (a0)+,d0
		add.w	d0,d0
    5dd0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5dd2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5dd6:	jmp (0,a3,d0.w)

00005dda <lz4Rts8>:
lz4Rts8:	rts
    5dda:	rts

00005ddc <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    5ddc:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    5df8:	cmpa.l a0,a4
		beq.s	lz4Rts9
    5dfa:	beq.s 5e2e <lz4Rts9>
		move.b	(a0)+,d0
    5dfc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5dfe:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e00:	move.w (sp)+,d3
		move.b	d0,d3
    5e02:	move.b d0,d3
		move.l	a1,a2
    5e04:	movea.l a1,a2
		sub.l	d3,a2
    5e06:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e08:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    5e18:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e1a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e1c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e1e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5e20:	moveq #0,d0
		move.b	(a0)+,d0
    5e22:	move.b (a0)+,d0
		add.w	d0,d0
    5e24:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e26:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e2a:	jmp (0,a3,d0.w)

00005e2e <lz4Rts9>:
lz4Rts9:	rts
    5e2e:	rts

00005e30 <sl_sm9>:

sl_sm9:
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
		move.b	(a0)+,(a1)+
    5e44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e46:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e48:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5e4a:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5e4c:	cmpa.l a0,a4
		beq.s	lz4Rts10
    5e4e:	beq.s 5e84 <lz4Rts10>
		move.b	(a0)+,d0
    5e50:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5e52:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5e54:	move.w (sp)+,d3
		move.b	d0,d3
    5e56:	move.b d0,d3
		move.l	a1,a2
    5e58:	movea.l a1,a2
		sub.l	d3,a2
    5e5a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5e5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5e6a:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    5e76:	moveq #0,d0
		move.b	(a0)+,d0
    5e78:	move.b (a0)+,d0
		add.w	d0,d0
    5e7a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5e7c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5e80:	jmp (0,a3,d0.w)

00005e84 <lz4Rts10>:
lz4Rts10:	rts
    5e84:	rts

00005e86 <sl_sm10>:

sl_sm10:
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
		cmpa.l	a0,a4
    5ea2:	cmpa.l a0,a4
		beq.s	lz4Rts11
    5ea4:	beq.s 5edc <lz4Rts11>
		move.b	(a0)+,d0
    5ea6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5ea8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5eaa:	move.w (sp)+,d3
		move.b	d0,d3
    5eac:	move.b d0,d3
		move.l	a1,a2
    5eae:	movea.l a1,a2
		sub.l	d3,a2
    5eb0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5eb2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eb4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eb6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5eb8:	move.b (a2)+,(a1)+
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

00005edc <lz4Rts11>:
lz4Rts11:	rts
    5edc:	rts

00005ede <sl_sm11>:

sl_sm11:
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
		beq.s	lz4Rts12
    5efc:	beq.s 5f36 <lz4Rts12>
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
		move.b	(a2)+,(a1)+
    5f20:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f22:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f24:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f26:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5f28:	moveq #0,d0
		move.b	(a0)+,d0
    5f2a:	move.b (a0)+,d0
		add.w	d0,d0
    5f2c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f2e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f32:	jmp (0,a3,d0.w)

00005f36 <lz4Rts12>:
lz4Rts12:	rts
    5f36:	rts

00005f38 <sl_sm12>:

sl_sm12:
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
		move.b	(a0)+,(a1)+
    5f4c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f4e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f50:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f52:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5f54:	cmpa.l a0,a4
		beq.s	lz4Rts13
    5f56:	beq.s 5f92 <lz4Rts13>
		move.b	(a0)+,d0
    5f58:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f5a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5f5c:	move.w (sp)+,d3
		move.b	d0,d3
    5f5e:	move.b d0,d3
		move.l	a1,a2
    5f60:	movea.l a1,a2
		sub.l	d3,a2
    5f62:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    5f74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5f76:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    5f84:	moveq #0,d0
		move.b	(a0)+,d0
    5f86:	move.b (a0)+,d0
		add.w	d0,d0
    5f88:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f8a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f8e:	jmp (0,a3,d0.w)

00005f92 <lz4Rts13>:
lz4Rts13:	rts
    5f92:	rts

00005f94 <sl_sm13>:

sl_sm13:
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
		cmpa.l	a0,a4
    5fb0:	cmpa.l a0,a4
		beq.s	lz4Rts14
    5fb2:	beq.s 5ff0 <lz4Rts14>
		move.b	(a0)+,d0
    5fb4:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5fb6:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fb8:	move.w (sp)+,d3
		move.b	d0,d3
    5fba:	move.b d0,d3
		move.l	a1,a2
    5fbc:	movea.l a1,a2
		sub.l	d3,a2
    5fbe:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    5fca:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    5fe2:	moveq #0,d0
		move.b	(a0)+,d0
    5fe4:	move.b (a0)+,d0
		add.w	d0,d0
    5fe6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fe8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5fec:	jmp (0,a3,d0.w)

00005ff0 <lz4Rts14>:
lz4Rts14:	rts
    5ff0:	rts

00005ff2 <sl_sm14>:

sl_sm14:
		move.b	(a0)+,(a1)+
    5ff2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5ff4:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    600e:	cmpa.l a0,a4
		beq.s	lz4Rts15
    6010:	beq.s 6050 <lz4Rts15>
		move.b	(a0)+,d0
    6012:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6014:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6016:	move.w (sp)+,d3
		move.b	d0,d3
    6018:	move.b d0,d3
		move.l	a1,a2
    601a:	movea.l a1,a2
		sub.l	d3,a2
    601c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    601e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6020:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    603e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6040:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6042:	moveq #0,d0
		move.b	(a0)+,d0
    6044:	move.b (a0)+,d0
		add.w	d0,d0
    6046:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6048:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    604c:	jmp (0,a3,d0.w)

00006050 <lz4Rts15>:
lz4Rts15:	rts
    6050:	rts

00006052 <sl_lm>:

sl_lm:
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
		move.b	(a0)+,(a1)+
    606a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    606c:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    606e:	cmpa.l a0,a4
		beq.s	lz4Rts16
    6070:	beq.s 60c6 <lz4Rts16>
		move.b	(a0)+,d0
    6072:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6074:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6076:	move.w (sp)+,d3
		move.b	d0,d3
    6078:	move.b d0,d3
		move.l	a1,a2
    607a:	movea.l a1,a2
		sub.l	d3,a2
    607c:	suba.l d3,a2
		moveq	#15+4,d1
    607e:	moveq #19,d1

00006080 <.cl0>:
.cl0:	move.b	(a0)+,d2
    6080:	/-> move.b (a0)+,d2
		add.l d2,d1
    6082:	|   add.l d2,d1
		not.b	d2
    6084:	|   not.b d2
		beq.s	.cl0
    6086:	\-- beq.s 6080 <.cl0>
		moveq	#15,d5
    6088:	    moveq #15,d5
		and.w	d1,d5
    608a:	    and.w d1,d5
		add.w	d5,d5
    608c:	    add.w d5,d5
		neg.w	d5
    608e:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    6090:	    jmp (60b4 <.eloop1>,pc,d5.w)

00006094 <.tloop1>:
.tloop1:
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
		move.b	(a2)+,(a1)+
    60b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60b2:	move.b (a2)+,(a1)+

000060b4 <.eloop1>:
.eloop1:	sub.l	d7,d1
    60b4:	sub.l d7,d1
		bpl.s	.tloop1
    60b6:	bpl.s 6094 <.tloop1>
		moveq	#0,d0
    60b8:	moveq #0,d0
		move.b	(a0)+,d0
    60ba:	move.b (a0)+,d0
		add.w	d0,d0
    60bc:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    60be:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60c2:	jmp (0,a3,d0.w)

000060c6 <lz4Rts16>:
lz4Rts16:	rts
    60c6:	rts

000060c8 <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    60c8:	moveq #15,d1

000060ca <.cl2>:
.cl2:	move.b	(a0)+,d2
    60ca:	/-> move.b (a0)+,d2
		add.l d2,d1
    60cc:	|   add.l d2,d1
		not.b	d2
    60ce:	|   not.b d2
		beq.s	.cl2
    60d0:	\-- beq.s 60ca <.cl2>
		moveq	#15,d5
    60d2:	    moveq #15,d5
		and.w	d1,d5
    60d4:	    and.w d1,d5
		add.w	d5,d5
    60d6:	    add.w d5,d5
		neg.w	d5
    60d8:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    60da:	    jmp (60fe <.eloop3>,pc,d5.w)

000060de <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    60de:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60e0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60e2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60e4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60e6:	move.b (a0)+,(a1)+
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

000060fe <.eloop3>:
.eloop3:	sub.l	d7,d1
    60fe:	sub.l d7,d1
		bpl.s	.tloop3
    6100:	bpl.s 60de <.tloop3>
		cmpa.l	a0,a4
    6102:	cmpa.l a0,a4
		beq.s	lz4Rts17
    6104:	beq.s 6128 <lz4Rts17>
		move.b	(a0)+,d0
    6106:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6108:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    610a:	move.w (sp)+,d3
		move.b	d0,d3
    610c:	move.b d0,d3
		move.l	a1,a2
    610e:	movea.l a1,a2
		sub.l	d3,a2
    6110:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6112:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6114:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6116:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6118:	move.b (a2)+,(a1)+
		moveq	#0,d0
    611a:	moveq #0,d0
		move.b	(a0)+,d0
    611c:	move.b (a0)+,d0
		add.w	d0,d0
    611e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6120:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6124:	jmp (0,a3,d0.w)

00006128 <lz4Rts17>:
lz4Rts17:	rts
    6128:	rts

0000612a <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    612a:	moveq #15,d1

0000612c <.cl4>:
.cl4:	move.b	(a0)+,d2
    612c:	/-> move.b (a0)+,d2
		add.l d2,d1
    612e:	|   add.l d2,d1
		not.b	d2
    6130:	|   not.b d2
		beq.s	.cl4
    6132:	\-- beq.s 612c <.cl4>
		moveq	#15,d5
    6134:	    moveq #15,d5
		and.w	d1,d5
    6136:	    and.w d1,d5
		add.w	d5,d5
    6138:	    add.w d5,d5
		neg.w	d5
    613a:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    613c:	    jmp (6160 <.eloop5>,pc,d5.w)

00006140 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    6140:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6142:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6144:	move.b (a0)+,(a1)+
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

00006160 <.eloop5>:
.eloop5:	sub.l	d7,d1
    6160:	sub.l d7,d1
		bpl.s	.tloop5
    6162:	bpl.s 6140 <.tloop5>
		cmpa.l	a0,a4
    6164:	cmpa.l a0,a4
		beq.s	lz4Rts18
    6166:	beq.s 618c <lz4Rts18>
		move.b	(a0)+,d0
    6168:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    616a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    616c:	move.w (sp)+,d3
		move.b	d0,d3
    616e:	move.b d0,d3
		move.l	a1,a2
    6170:	movea.l a1,a2
		sub.l	d3,a2
    6172:	suba.l d3,a2
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
		moveq	#0,d0
    617e:	moveq #0,d0
		move.b	(a0)+,d0
    6180:	move.b (a0)+,d0
		add.w	d0,d0
    6182:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6184:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6188:	jmp (0,a3,d0.w)

0000618c <lz4Rts18>:
lz4Rts18:	rts
    618c:	rts

0000618e <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    618e:	moveq #15,d1

00006190 <.cl6>:
.cl6:	move.b	(a0)+,d2
    6190:	/-> move.b (a0)+,d2
		add.l d2,d1
    6192:	|   add.l d2,d1
		not.b	d2
    6194:	|   not.b d2
		beq.s	.cl6
    6196:	\-- beq.s 6190 <.cl6>
		moveq	#15,d5
    6198:	    moveq #15,d5
		and.w	d1,d5
    619a:	    and.w d1,d5
		add.w	d5,d5
    619c:	    add.w d5,d5
		neg.w	d5
    619e:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    61a0:	    jmp (61c4 <.eloop7>,pc,d5.w)

000061a4 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    61a4:	move.b (a0)+,(a1)+
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
		move.b	(a0)+,(a1)+
    61c2:	move.b (a0)+,(a1)+

000061c4 <.eloop7>:
.eloop7:	sub.l	d7,d1
    61c4:	sub.l d7,d1
		bpl.s	.tloop7
    61c6:	bpl.s 61a4 <.tloop7>
		cmpa.l	a0,a4
    61c8:	cmpa.l a0,a4
		beq.s	lz4Rts19
    61ca:	beq.s 61f2 <lz4Rts19>
		move.b	(a0)+,d0
    61cc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61ce:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61d0:	move.w (sp)+,d3
		move.b	d0,d3
    61d2:	move.b d0,d3
		move.l	a1,a2
    61d4:	movea.l a1,a2
		sub.l	d3,a2
    61d6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    61d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61e2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    61e4:	moveq #0,d0
		move.b	(a0)+,d0
    61e6:	move.b (a0)+,d0
		add.w	d0,d0
    61e8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    61ea:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    61ee:	jmp (0,a3,d0.w)

000061f2 <lz4Rts19>:
lz4Rts19:	rts
    61f2:	rts

000061f4 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    61f4:	moveq #15,d1

000061f6 <.cl8>:
.cl8:	move.b	(a0)+,d2
    61f6:	/-> move.b (a0)+,d2
		add.l d2,d1
    61f8:	|   add.l d2,d1
		not.b	d2
    61fa:	|   not.b d2
		beq.s	.cl8
    61fc:	\-- beq.s 61f6 <.cl8>
		moveq	#15,d5
    61fe:	    moveq #15,d5
		and.w	d1,d5
    6200:	    and.w d1,d5
		add.w	d5,d5
    6202:	    add.w d5,d5
		neg.w	d5
    6204:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    6206:	    jmp (622a <.eloop9>,pc,d5.w)

0000620a <.tloop9>:
.tloop9:
		move.b	(a0)+,(a1)+
    620a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    620c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    620e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6210:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6212:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6214:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6216:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6218:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    621a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    621c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    621e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6220:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6222:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6224:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6226:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6228:	move.b (a0)+,(a1)+

0000622a <.eloop9>:
.eloop9:	sub.l	d7,d1
    622a:	sub.l d7,d1
		bpl.s	.tloop9
    622c:	bpl.s 620a <.tloop9>
		cmpa.l	a0,a4
    622e:	cmpa.l a0,a4
		beq.s	lz4Rts20
    6230:	beq.s 625a <lz4Rts20>
		move.b	(a0)+,d0
    6232:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6234:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6236:	move.w (sp)+,d3
		move.b	d0,d3
    6238:	move.b d0,d3
		move.l	a1,a2
    623a:	movea.l a1,a2
		sub.l	d3,a2
    623c:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    623e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6240:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6242:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6244:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6246:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6248:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    624a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    624c:	moveq #0,d0
		move.b	(a0)+,d0
    624e:	move.b (a0)+,d0
		add.w	d0,d0
    6250:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6252:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6256:	jmp (0,a3,d0.w)

0000625a <lz4Rts20>:
lz4Rts20:	rts
    625a:	rts

0000625c <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    625c:	moveq #15,d1

0000625e <.cl10>:
.cl10:	move.b	(a0)+,d2
    625e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6260:	|   add.l d2,d1
		not.b	d2
    6262:	|   not.b d2
		beq.s	.cl10
    6264:	\-- beq.s 625e <.cl10>
		moveq	#15,d5
    6266:	    moveq #15,d5
		and.w	d1,d5
    6268:	    and.w d1,d5
		add.w	d5,d5
    626a:	    add.w d5,d5
		neg.w	d5
    626c:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    626e:	    jmp (6292 <.eloop11>,pc,d5.w)

00006272 <.tloop11>:
.tloop11:
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
		move.b	(a0)+,(a1)+
    6286:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6288:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    628a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    628c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    628e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6290:	move.b (a0)+,(a1)+

00006292 <.eloop11>:
.eloop11:	sub.l	d7,d1
    6292:	sub.l d7,d1
		bpl.s	.tloop11
    6294:	bpl.s 6272 <.tloop11>
		cmpa.l	a0,a4
    6296:	cmpa.l a0,a4
		beq.s	lz4Rts21
    6298:	beq.s 62c4 <lz4Rts21>
		move.b	(a0)+,d0
    629a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    629c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    629e:	move.w (sp)+,d3
		move.b	d0,d3
    62a0:	move.b d0,d3
		move.l	a1,a2
    62a2:	movea.l a1,a2
		sub.l	d3,a2
    62a4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62a6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62ae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62b0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62b2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62b4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62b6:	moveq #0,d0
		move.b	(a0)+,d0
    62b8:	move.b (a0)+,d0
		add.w	d0,d0
    62ba:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    62bc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    62c0:	jmp (0,a3,d0.w)

000062c4 <lz4Rts21>:
lz4Rts21:	rts
    62c4:	rts

000062c6 <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    62c6:	moveq #15,d1

000062c8 <.cl12>:
.cl12:	move.b	(a0)+,d2
    62c8:	/-> move.b (a0)+,d2
		add.l d2,d1
    62ca:	|   add.l d2,d1
		not.b	d2
    62cc:	|   not.b d2
		beq.s	.cl12
    62ce:	\-- beq.s 62c8 <.cl12>
		moveq	#15,d5
    62d0:	    moveq #15,d5
		and.w	d1,d5
    62d2:	    and.w d1,d5
		add.w	d5,d5
    62d4:	    add.w d5,d5
		neg.w	d5
    62d6:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    62d8:	    jmp (62fc <.eloop13>,pc,d5.w)

000062dc <.tloop13>:
.tloop13:
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
		move.b	(a0)+,(a1)+
    62e8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ea:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ec:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62ee:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62f0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62f2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    62fa:	move.b (a0)+,(a1)+

000062fc <.eloop13>:
.eloop13:	sub.l	d7,d1
    62fc:	sub.l d7,d1
		bpl.s	.tloop13
    62fe:	bpl.s 62dc <.tloop13>
		cmpa.l	a0,a4
    6300:	cmpa.l a0,a4
		beq.s	lz4Rts22
    6302:	beq.s 6330 <lz4Rts22>
		move.b	(a0)+,d0
    6304:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6306:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6308:	move.w (sp)+,d3
		move.b	d0,d3
    630a:	move.b d0,d3
		move.l	a1,a2
    630c:	movea.l a1,a2
		sub.l	d3,a2
    630e:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6310:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6312:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6314:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6316:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6318:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    631a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    631c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    631e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6320:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6322:	moveq #0,d0
		move.b	(a0)+,d0
    6324:	move.b (a0)+,d0
		add.w	d0,d0
    6326:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6328:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    632c:	jmp (0,a3,d0.w)

00006330 <lz4Rts22>:
lz4Rts22:	rts
    6330:	rts

00006332 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    6332:	moveq #15,d1

00006334 <.cl14>:
.cl14:	move.b	(a0)+,d2
    6334:	/-> move.b (a0)+,d2
		add.l d2,d1
    6336:	|   add.l d2,d1
		not.b	d2
    6338:	|   not.b d2
		beq.s	.cl14
    633a:	\-- beq.s 6334 <.cl14>
		moveq	#15,d5
    633c:	    moveq #15,d5
		and.w	d1,d5
    633e:	    and.w d1,d5
		add.w	d5,d5
    6340:	    add.w d5,d5
		neg.w	d5
    6342:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    6344:	    jmp (6368 <.eloop15>,pc,d5.w)

00006348 <.tloop15>:
.tloop15:
		move.b	(a0)+,(a1)+
    6348:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    634a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    634c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    634e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6350:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6352:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6354:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6356:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6358:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    635a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    635c:	move.b (a0)+,(a1)+
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

00006368 <.eloop15>:
.eloop15:	sub.l	d7,d1
    6368:	sub.l d7,d1
		bpl.s	.tloop15
    636a:	bpl.s 6348 <.tloop15>
		cmpa.l	a0,a4
    636c:	cmpa.l a0,a4
		beq.s	lz4Rts23
    636e:	beq.s 639e <lz4Rts23>
		move.b	(a0)+,d0
    6370:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6372:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6374:	move.w (sp)+,d3
		move.b	d0,d3
    6376:	move.b d0,d3
		move.l	a1,a2
    6378:	movea.l a1,a2
		sub.l	d3,a2
    637a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    637c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    637e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6380:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6382:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6384:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6386:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6388:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    638a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    638c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    638e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6390:	moveq #0,d0
		move.b	(a0)+,d0
    6392:	move.b (a0)+,d0
		add.w	d0,d0
    6394:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6396:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    639a:	jmp (0,a3,d0.w)

0000639e <lz4Rts23>:
lz4Rts23:	rts
    639e:	rts

000063a0 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    63a0:	moveq #15,d1

000063a2 <.cl16>:
.cl16:	move.b	(a0)+,d2
    63a2:	/-> move.b (a0)+,d2
		add.l d2,d1
    63a4:	|   add.l d2,d1
		not.b	d2
    63a6:	|   not.b d2
		beq.s	.cl16
    63a8:	\-- beq.s 63a2 <.cl16>
		moveq	#15,d5
    63aa:	    moveq #15,d5
		and.w	d1,d5
    63ac:	    and.w d1,d5
		add.w	d5,d5
    63ae:	    add.w d5,d5
		neg.w	d5
    63b0:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    63b2:	    jmp (63d6 <.eloop17>,pc,d5.w)

000063b6 <.tloop17>:
.tloop17:
		move.b	(a0)+,(a1)+
    63b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63bc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63be:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63c0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63c2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63c4:	move.b (a0)+,(a1)+
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

000063d6 <.eloop17>:
.eloop17:	sub.l	d7,d1
    63d6:	sub.l d7,d1
		bpl.s	.tloop17
    63d8:	bpl.s 63b6 <.tloop17>
		cmpa.l	a0,a4
    63da:	cmpa.l a0,a4
		beq.s	lz4Rts24
    63dc:	beq.s 640e <lz4Rts24>
		move.b	(a0)+,d0
    63de:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63e0:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63e2:	move.w (sp)+,d3
		move.b	d0,d3
    63e4:	move.b d0,d3
		move.l	a1,a2
    63e6:	movea.l a1,a2
		sub.l	d3,a2
    63e8:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    63ea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63ec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63ee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63f0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63fe:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6400:	moveq #0,d0
		move.b	(a0)+,d0
    6402:	move.b (a0)+,d0
		add.w	d0,d0
    6404:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6406:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    640a:	jmp (0,a3,d0.w)

0000640e <lz4Rts24>:
lz4Rts24:	rts
    640e:	rts

00006410 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    6410:	moveq #15,d1

00006412 <.cl18>:
.cl18:	move.b	(a0)+,d2
    6412:	/-> move.b (a0)+,d2
		add.l d2,d1
    6414:	|   add.l d2,d1
		not.b	d2
    6416:	|   not.b d2
		beq.s	.cl18
    6418:	\-- beq.s 6412 <.cl18>
		moveq	#15,d5
    641a:	    moveq #15,d5
		and.w	d1,d5
    641c:	    and.w d1,d5
		add.w	d5,d5
    641e:	    add.w d5,d5
		neg.w	d5
    6420:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    6422:	    jmp (6446 <.eloop19>,pc,d5.w)

00006426 <.tloop19>:
.tloop19:
		move.b	(a0)+,(a1)+
    6426:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6428:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    642a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    642c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    642e:	move.b (a0)+,(a1)+
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

00006446 <.eloop19>:
.eloop19:	sub.l	d7,d1
    6446:	sub.l d7,d1
		bpl.s	.tloop19
    6448:	bpl.s 6426 <.tloop19>
		cmpa.l	a0,a4
    644a:	cmpa.l a0,a4
		beq.s	lz4Rts25
    644c:	beq.s 6480 <lz4Rts25>
		move.b	(a0)+,d0
    644e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6450:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6452:	move.w (sp)+,d3
		move.b	d0,d3
    6454:	move.b d0,d3
		move.l	a1,a2
    6456:	movea.l a1,a2
		sub.l	d3,a2
    6458:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    645a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    645c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    645e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6460:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6462:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    6472:	moveq #0,d0
		move.b	(a0)+,d0
    6474:	move.b (a0)+,d0
		add.w	d0,d0
    6476:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6478:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    647c:	jmp (0,a3,d0.w)

00006480 <lz4Rts25>:
lz4Rts25:	rts
    6480:	rts

00006482 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    6482:	moveq #15,d1

00006484 <.cl20>:
.cl20:	move.b	(a0)+,d2
    6484:	/-> move.b (a0)+,d2
		add.l d2,d1
    6486:	|   add.l d2,d1
		not.b	d2
    6488:	|   not.b d2
		beq.s	.cl20
    648a:	\-- beq.s 6484 <.cl20>
		moveq	#15,d5
    648c:	    moveq #15,d5
		and.w	d1,d5
    648e:	    and.w d1,d5
		add.w	d5,d5
    6490:	    add.w d5,d5
		neg.w	d5
    6492:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    6494:	    jmp (64b8 <.eloop21>,pc,d5.w)

00006498 <.tloop21>:
.tloop21:
		move.b	(a0)+,(a1)+
    6498:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    649a:	move.b (a0)+,(a1)+
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

000064b8 <.eloop21>:
.eloop21:	sub.l	d7,d1
    64b8:	sub.l d7,d1
		bpl.s	.tloop21
    64ba:	bpl.s 6498 <.tloop21>
		cmpa.l	a0,a4
    64bc:	cmpa.l a0,a4
		beq.s	lz4Rts26
    64be:	beq.s 64f4 <lz4Rts26>
		move.b	(a0)+,d0
    64c0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    64c2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    64c4:	move.w (sp)+,d3
		move.b	d0,d3
    64c6:	move.b d0,d3
		move.l	a1,a2
    64c8:	movea.l a1,a2
		sub.l	d3,a2
    64ca:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    64cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64ce:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    64e4:	move.b (a2)+,(a1)+
		moveq	#0,d0
    64e6:	moveq #0,d0
		move.b	(a0)+,d0
    64e8:	move.b (a0)+,d0
		add.w	d0,d0
    64ea:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    64ec:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    64f0:	jmp (0,a3,d0.w)

000064f4 <lz4Rts26>:
lz4Rts26:	rts
    64f4:	rts

000064f6 <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    64f6:	moveq #15,d1

000064f8 <.cl22>:
.cl22:	move.b	(a0)+,d2
    64f8:	/-> move.b (a0)+,d2
		add.l d2,d1
    64fa:	|   add.l d2,d1
		not.b	d2
    64fc:	|   not.b d2
		beq.s	.cl22
    64fe:	\-- beq.s 64f8 <.cl22>
		moveq	#15,d5
    6500:	    moveq #15,d5
		and.w	d1,d5
    6502:	    and.w d1,d5
		add.w	d5,d5
    6504:	    add.w d5,d5
		neg.w	d5
    6506:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    6508:	    jmp (652c <.eloop23>,pc,d5.w)

0000650c <.tloop23>:
.tloop23:
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
		move.b	(a0)+,(a1)+
    652a:	move.b (a0)+,(a1)+

0000652c <.eloop23>:
.eloop23:	sub.l	d7,d1
    652c:	sub.l d7,d1
		bpl.s	.tloop23
    652e:	bpl.s 650c <.tloop23>
		cmpa.l	a0,a4
    6530:	cmpa.l a0,a4
		beq.s	lz4Rts27
    6532:	beq.s 656a <lz4Rts27>
		move.b	(a0)+,d0
    6534:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6536:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6538:	move.w (sp)+,d3
		move.b	d0,d3
    653a:	move.b d0,d3
		move.l	a1,a2
    653c:	movea.l a1,a2
		sub.l	d3,a2
    653e:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    6554:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6556:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6558:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    655a:	move.b (a2)+,(a1)+
		moveq	#0,d0
    655c:	moveq #0,d0
		move.b	(a0)+,d0
    655e:	move.b (a0)+,d0
		add.w	d0,d0
    6560:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6562:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6566:	jmp (0,a3,d0.w)

0000656a <lz4Rts27>:
lz4Rts27:	rts
    656a:	rts

0000656c <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    656c:	moveq #15,d1

0000656e <.cl24>:
.cl24:	move.b	(a0)+,d2
    656e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6570:	|   add.l d2,d1
		not.b	d2
    6572:	|   not.b d2
		beq.s	.cl24
    6574:	\-- beq.s 656e <.cl24>
		moveq	#15,d5
    6576:	    moveq #15,d5
		and.w	d1,d5
    6578:	    and.w d1,d5
		add.w	d5,d5
    657a:	    add.w d5,d5
		neg.w	d5
    657c:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    657e:	    jmp (65a2 <.eloop25>,pc,d5.w)

00006582 <.tloop25>:
.tloop25:
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
		move.b	(a0)+,(a1)+
    659a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    659c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    659e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65a0:	move.b (a0)+,(a1)+

000065a2 <.eloop25>:
.eloop25:	sub.l	d7,d1
    65a2:	sub.l d7,d1
		bpl.s	.tloop25
    65a4:	bpl.s 6582 <.tloop25>
		cmpa.l	a0,a4
    65a6:	cmpa.l a0,a4
		beq.s	lz4Rts28
    65a8:	beq.s 65e2 <lz4Rts28>
		move.b	(a0)+,d0
    65aa:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    65ac:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    65ae:	move.w (sp)+,d3
		move.b	d0,d3
    65b0:	move.b d0,d3
		move.l	a1,a2
    65b2:	movea.l a1,a2
		sub.l	d3,a2
    65b4:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    65c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65c8:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    65d4:	moveq #0,d0
		move.b	(a0)+,d0
    65d6:	move.b (a0)+,d0
		add.w	d0,d0
    65d8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    65da:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    65de:	jmp (0,a3,d0.w)

000065e2 <lz4Rts28>:
lz4Rts28:	rts
    65e2:	rts

000065e4 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    65e4:	moveq #15,d1

000065e6 <.cl26>:
.cl26:	move.b	(a0)+,d2
    65e6:	/-> move.b (a0)+,d2
		add.l d2,d1
    65e8:	|   add.l d2,d1
		not.b	d2
    65ea:	|   not.b d2
		beq.s	.cl26
    65ec:	\-- beq.s 65e6 <.cl26>
		moveq	#15,d5
    65ee:	    moveq #15,d5
		and.w	d1,d5
    65f0:	    and.w d1,d5
		add.w	d5,d5
    65f2:	    add.w d5,d5
		neg.w	d5
    65f4:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    65f6:	    jmp (661a <.eloop27>,pc,d5.w)

000065fa <.tloop27>:
.tloop27:
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

0000661a <.eloop27>:
.eloop27:	sub.l	d7,d1
    661a:	sub.l d7,d1
		bpl.s	.tloop27
    661c:	bpl.s 65fa <.tloop27>
		cmpa.l	a0,a4
    661e:	cmpa.l a0,a4
		beq.s	lz4Rts29
    6620:	beq.s 665c <lz4Rts29>
		move.b	(a0)+,d0
    6622:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6624:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6626:	move.w (sp)+,d3
		move.b	d0,d3
    6628:	move.b d0,d3
		move.l	a1,a2
    662a:	movea.l a1,a2
		sub.l	d3,a2
    662c:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    663a:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    664e:	moveq #0,d0
		move.b	(a0)+,d0
    6650:	move.b (a0)+,d0
		add.w	d0,d0
    6652:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6654:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6658:	jmp (0,a3,d0.w)

0000665c <lz4Rts29>:
lz4Rts29:	rts
    665c:	rts

0000665e <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    665e:	moveq #15,d1

00006660 <.cl28>:
.cl28:	move.b	(a0)+,d2
    6660:	/-> move.b (a0)+,d2
		add.l d2,d1
    6662:	|   add.l d2,d1
		not.b	d2
    6664:	|   not.b d2
		beq.s	.cl28
    6666:	\-- beq.s 6660 <.cl28>
		moveq	#15,d5
    6668:	    moveq #15,d5
		and.w	d1,d5
    666a:	    and.w d1,d5
		add.w	d5,d5
    666c:	    add.w d5,d5
		neg.w	d5
    666e:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    6670:	    jmp (6694 <.eloop29>,pc,d5.w)

00006674 <.tloop29>:
.tloop29:
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

00006694 <.eloop29>:
.eloop29:	sub.l	d7,d1
    6694:	sub.l d7,d1
		bpl.s	.tloop29
    6696:	bpl.s 6674 <.tloop29>
		cmpa.l	a0,a4
    6698:	cmpa.l a0,a4
		beq.s	lz4Rts30
    669a:	beq.s 66d8 <lz4Rts30>
		move.b	(a0)+,d0
    669c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    669e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    66a0:	move.w (sp)+,d3
		move.b	d0,d3
    66a2:	move.b d0,d3
		move.l	a1,a2
    66a4:	movea.l a1,a2
		sub.l	d3,a2
    66a6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    66a8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66aa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66ae:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    66ca:	moveq #0,d0
		move.b	(a0)+,d0
    66cc:	move.b (a0)+,d0
		add.w	d0,d0
    66ce:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    66d0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    66d4:	jmp (0,a3,d0.w)

000066d8 <lz4Rts30>:
lz4Rts30:	rts
    66d8:	rts

000066da <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    66da:	moveq #15,d1

000066dc <.cl30>:
.cl30:	move.b	(a0)+,d2
    66dc:	/-> move.b (a0)+,d2
		add.l d2,d1
    66de:	|   add.l d2,d1
		not.b	d2
    66e0:	|   not.b d2
		beq.s	.cl30
    66e2:	\-- beq.s 66dc <.cl30>
		moveq	#15,d5
    66e4:	    moveq #15,d5
		and.w	d1,d5
    66e6:	    and.w d1,d5
		add.w	d5,d5
    66e8:	    add.w d5,d5
		neg.w	d5
    66ea:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    66ec:	    jmp (6710 <.eloop31>,pc,d5.w)

000066f0 <.tloop31>:
.tloop31:
		move.b	(a0)+,(a1)+
    66f0:	move.b (a0)+,(a1)+
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

00006710 <.eloop31>:
.eloop31:	sub.l	d7,d1
    6710:	sub.l d7,d1
		bpl.s	.tloop31
    6712:	bpl.s 66f0 <.tloop31>
		cmpa.l	a0,a4
    6714:	cmpa.l a0,a4
		beq.s	lz4Rts31
    6716:	beq.s 6756 <lz4Rts31>
		move.b	(a0)+,d0
    6718:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    671a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    671c:	move.w (sp)+,d3
		move.b	d0,d3
    671e:	move.b d0,d3
		move.l	a1,a2
    6720:	movea.l a1,a2
		sub.l	d3,a2
    6722:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6724:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    6744:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6746:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6748:	moveq #0,d0
		move.b	(a0)+,d0
    674a:	move.b (a0)+,d0
		add.w	d0,d0
    674c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    674e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6752:	jmp (0,a3,d0.w)

00006756 <lz4Rts31>:
lz4Rts31:	rts
    6756:	rts

00006758 <ll_lm>:

ll_lm:
		moveq	#15,d1
    6758:	moveq #15,d1

0000675a <.cl32>:
.cl32:	move.b	(a0)+,d2
    675a:	/-> move.b (a0)+,d2
		add.l d2,d1
    675c:	|   add.l d2,d1
		not.b	d2
    675e:	|   not.b d2
		beq.s	.cl32
    6760:	\-- beq.s 675a <.cl32>
		moveq	#15,d5
    6762:	    moveq #15,d5
		and.w	d1,d5
    6764:	    and.w d1,d5
		add.w	d5,d5
    6766:	    add.w d5,d5
		neg.w	d5
    6768:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    676a:	    jmp (678e <.eloop33>,pc,d5.w)

0000676e <.tloop33>:
.tloop33:
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
		move.b	(a0)+,(a1)+
    678a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    678c:	move.b (a0)+,(a1)+

0000678e <.eloop33>:
.eloop33:	sub.l	d7,d1
    678e:	sub.l d7,d1
		bpl.s	.tloop33
    6790:	bpl.s 676e <.tloop33>
		cmpa.l	a0,a4
    6792:	cmpa.l a0,a4
		beq.s	lz4Rts32
    6794:	beq.s 67ea <lz4Rts32>
		move.b	(a0)+,d0
    6796:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6798:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    679a:	move.w (sp)+,d3
		move.b	d0,d3
    679c:	move.b d0,d3
		move.l	a1,a2
    679e:	movea.l a1,a2
		sub.l	d3,a2
    67a0:	suba.l d3,a2
		moveq	#15+4,d1
    67a2:	moveq #19,d1

000067a4 <.cl34>:
.cl34:	move.b	(a0)+,d2
    67a4:	/-> move.b (a0)+,d2
		add.l d2,d1
    67a6:	|   add.l d2,d1
		not.b	d2
    67a8:	|   not.b d2
		beq.s	.cl34
    67aa:	\-- beq.s 67a4 <.cl34>
		moveq	#15,d5
    67ac:	    moveq #15,d5
		and.w	d1,d5
    67ae:	    and.w d1,d5
		add.w	d5,d5
    67b0:	    add.w d5,d5
		neg.w	d5
    67b2:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    67b4:	    jmp (67d8 <.eloop35>,pc,d5.w)

000067b8 <.tloop35>:
.tloop35:
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
		move.b	(a2)+,(a1)+
    67d6:	move.b (a2)+,(a1)+

000067d8 <.eloop35>:
.eloop35:	sub.l	d7,d1
    67d8:	sub.l d7,d1
		bpl.s	.tloop35
    67da:	bpl.s 67b8 <.tloop35>
		moveq	#0,d0
    67dc:	moveq #0,d0
		move.b	(a0)+,d0
    67de:	move.b (a0)+,d0
		add.w	d0,d0
    67e0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    67e2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    67e6:	jmp (0,a3,d0.w)

000067ea <lz4Rts32>:
lz4Rts32:				
			rts
    67ea:	rts

000067ec <lz4Over>:

lz4Over:	rts
    67ec:	rts

000067ee <lz4jmp>:
    67ee:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    67f0:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    67f2:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    67f4:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    67f6:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    67f8:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    67fa:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    67fc:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    67fe:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    6800:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    6802:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    6804:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    6806:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    6808:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    680a:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    680c:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    680e:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    6810:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    6812:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    6814:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    6816:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    6818:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    681a:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    681c:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    681e:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    6820:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    6822:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    6824:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    6826:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    6828:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    682a:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    682c:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    682e:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    6830:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    6832:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    6834:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    6836:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    6838:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    683a:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    683c:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    683e:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    6840:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    6842:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    6844:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    6846:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    6848:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    684a:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    684c:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    684e:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    6850:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    6852:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    6854:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    6856:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    6858:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    685a:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    685c:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    685e:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    6860:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    6862:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    6864:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    6866:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    6868:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    686a:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    686c:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    686e:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    6870:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    6872:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    6874:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    6876:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    6878:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    687a:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    687c:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    687e:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    6880:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    6882:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    6884:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    6886:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    6888:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    688a:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    688c:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    688e:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    6890:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    6892:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    6894:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    6896:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    6898:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    689a:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    689c:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    689e:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    68a0:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    68a2:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    68a4:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    68a6:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    68a8:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    68aa:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    68ac:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    68ae:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    68b0:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    68b2:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    68b4:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    68b6:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    68b8:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    68ba:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    68bc:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    68be:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    68c0:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    68c2:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    68c4:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    68c6:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    68c8:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    68ca:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    68cc:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    68ce:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    68d0:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    68d2:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    68d4:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    68d6:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    68d8:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    68da:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    68dc:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    68de:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    68e0:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    68e2:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    68e4:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    68e6:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    68e8:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    68ea:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    68ec:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    68ee:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    68f0:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    68f2:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    68f4:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    68f6:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    68f8:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    68fa:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    68fc:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    68fe:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    6900:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    6902:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    6904:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    6906:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    6908:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    690a:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    690c:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    690e:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    6910:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    6912:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    6914:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    6916:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    6918:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    691a:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    691c:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    691e:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    6920:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    6922:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    6924:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    6926:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    6928:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    692a:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    692c:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    692e:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    6930:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    6932:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    6934:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    6936:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    6938:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    693a:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    693c:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    693e:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    6940:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    6942:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    6944:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    6946:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    6948:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    694a:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    694c:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    694e:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6950:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6952:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6954:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6956:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6958:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    695a:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    695c:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    695e:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6960:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6962:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6964:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6966:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6968:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    696a:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    696c:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    696e:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6970:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6972:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6974:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6976:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6978:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    697a:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    697c:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    697e:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6980:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6982:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6984:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6986:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6988:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    698a:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    698c:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    698e:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6990:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6992:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6994:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6996:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6998:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    699a:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    699c:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    699e:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    69a0:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    69a2:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    69a4:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    69a6:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    69a8:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    69aa:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    69ac:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    69ae:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    69b0:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    69b2:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    69b4:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    69b6:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    69b8:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    69ba:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    69bc:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    69be:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    69c0:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    69c2:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    69c4:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    69c6:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    69c8:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    69ca:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    69cc:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    69ce:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    69d0:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    69d2:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    69d4:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    69d6:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    69d8:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    69da:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    69dc:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    69de:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    69e0:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    69e2:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    69e4:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    69e6:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    69e8:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    69ea:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    69ec:	.short 0xff6a

Disassembly of section CODE:

000069ee <P61B>:

	endc	;ifne asmonereport

P61B:
P61_motuuli:
	jmp P61_Init(PC)
    69ee:	jmp 6a4c <_P61_Init>(pc)

	ifeq p61cia
	jmp P61_Music(PC)
	else
	rts
    69f2:	rts
	rts
    69f4:	rts
	endc

	jmp P61_End(PC)
    69f6:	jmp 6d1e <_P61_End>(pc)

	rts				;no P61_SetRepeat
    69fa:	rts
	rts
    69fc:	rts

	ifne p61jump
	jmp P61_SetPosition(PC)
	else
	rts
    69fe:	rts
	rts
    6a00:	rts

00006a02 <P61_Master>:
    6a02:	Address 0x6a04 is out of bounds.


00006a04 <P61_Tempo>:
    6a04:	Address 0x6a06 is out of bounds.


00006a06 <P61_Play>:
    6a06:	Address 0x6a08 is out of bounds.


00006a08 <P61_E8>:
	...

00006a0a <P61_VBR>:
    6a0a:	ori.b #0,d0

00006a0e <P61_Pos>:
	...

00006a10 <P61_Patt>:
	...

00006a12 <P61_CRow>:
	...

00006a14 <P61_Temp0Offset>:
    6a14:	ori.b #-124,d0

00006a18 <P61_Temp1Offset>:
    6a18:	ori.b #-60,d0

00006a1c <P61_Temp2Offset>:
    6a1c:	ori.b #4,d0

00006a20 <P61_Temp3Offset>:
    6a20:	ori.b #68,d0

00006a24 <P61_intti>:
.nonote:
	endm
	ifeq p61system
	ifne p61cia
P61_intti:
	movem.l d0-a6,-(sp)
    6a24:	movem.l d0-a6,-(sp)
	tst.b $bfdd00
    6a28:	tst.b bfdd00 <_end+0xb74044>
	lea $dff000+C,a6
    6a2e:	lea dff000 <_end+0xd75344>,a6
	move #$2000,$9c-C(a6)
    6a34:	move.w #8192,156(a6)
	move #$2000,$9c-C(a6)
    6a3a:	move.w #8192,156(a6)
	bsr P61_Music
    6a40:	bsr.w 6d84 <_P61_Music>
	movem.l (sp)+,d0-a6
    6a44:	movem.l (sp)+,d0-a6
	nop
    6a48:	nop
	rte
    6a4a:	rte

00006a4c <_P61_Init>:
* Returns:	D0=0 if okay (i.e. P61 module!). No need to change D0.l.
* NOTE: the define 'start' has been made runtime. move.w #<startpos>,P61_InitPos instead.

_P61_Init:
P61_Init:
	lea $dff000+C,a6
    6a4c:	    lea dff000 <_end+0xd75344>,a6
	addq.w #4,a5
	dbf d5,.choffl
	endc
	endc

	cmp.l #"P61A",(a0)+
    6a52:	    cmpi.l #1345728833,(a0)+
	beq.b .modok
    6a58:	/-- beq.s 6a5c <_P61_Init+0x10>
	subq.l #4,a0
    6a5a:	|   subq.l #4,a0
.modok:
	ifne p61cia
	move d0,-(sp)
    6a5c:	\-> move.w d0,-(sp)
	endc
	moveq #0,d0
    6a5e:	    moveq #0,d0
	cmp.l d0,a1
    6a60:	    cmpa.l d0,a1
	bne.b .redirect
    6a62:	/-- bne.s 6a6a <_P61_Init+0x1e>
	move (a0),d0
    6a64:	|   move.w (a0),d0
	lea (a0,d0.l),a1
    6a66:	|   lea (0,a0,d0.l),a1
.redirect:
	move.l a2,a6
    6a6a:	\-> movea.l a2,a6
	lea 8(a0),a2
    6a6c:	    lea 8(a0),a2
	moveq #$40,d0
    6a70:	    moveq #64,d0
	and.b 3(a0),d0
    6a72:	    and.b 3(a0),d0
	bne.b .buffer
    6a76:	/-- bne.s 6a7c <_P61_Init+0x30>
	move.l a1,a6
    6a78:	|   movea.l a1,a6
	subq.l #4,a2
    6a7a:	|   subq.l #4,a2
.buffer:

	lea P61_cn(pc),a3
    6a7c:	\-> lea 7472 <P61_cn>(pc),a3

	move.w #$ff00,d1
    6a80:	    move.w #-256,d1
	move.w d1,P61_OnOff+P61_temp0-P61_cn(a3)	;stop active decsteps
    6a84:	    move.w d1,-248(a3)
	move.w d1,P61_OnOff+P61_temp1-P61_cn(a3)
    6a88:	    move.w d1,-184(a3)
	move.w d1,P61_OnOff+P61_temp2-P61_cn(a3)
    6a8c:	    move.w d1,-120(a3)
	move.w d1,P61_OnOff+P61_temp3-P61_cn(a3)
    6a90:	    move.w d1,-56(a3)

	ifne copdma
	move.l a4,p61_DMApokeAddr-P61_cn(a3)
	endc

	moveq #$1f,d1
    6a94:	    moveq #31,d1
	and.b 3(a0),d1
    6a96:	    and.b 3(a0),d1
	move.l a0,-(sp)
    6a9a:	    move.l a0,-(sp)
;;    ---  insert pan/echo in this loop  ---
	lea P61_samples(pc),a4
    6a9c:	    lea 74e8 <P61_samples>(pc),a4
	subq #1,d1
    6aa0:	    subq.w #1,d1
	moveq #0,d4
    6aa2:	    moveq #0,d4

00006aa4 <P61_lopos>:
P61_lopos:
	move.l a6,(a4)+
    6aa4:	move.l a6,(a4)+
	move (a2)+,d4
    6aa6:	move.w (a2)+,d4
	bpl.b P61_kook
    6aa8:	bpl.s 6ac4 <P61_kook>
	neg d4
    6aaa:	neg.w d4
	lea P61_samples-16(pc),a5
    6aac:	lea 74d8 <P61_timers>(pc),a5
	ifeq opt020
	asl #4,d4
    6ab0:	asl.w #4,d4
	move.l (a5,d4),d6
    6ab2:	move.l (0,a5,d4.w),d6
	else
	add d4,d4
	move.l (a5,d4*8),d6
	endc
	move.l d6,-4(a4)
    6ab6:	move.l d6,-4(a4)
	ifeq opt020
	move 4(a5,d4),d4
    6aba:	move.w (4,a5,d4.w),d4
	else
	move 4(a5,d4*8),d4
	endc
	sub.l d4,a6
    6abe:	suba.l d4,a6
	sub.l d4,a6
    6ac0:	suba.l d4,a6
	bra.b P61_jatk
    6ac2:	bra.s 6aea <P61_jatk>

00006ac4 <P61_kook>:
P61_kook:
	move.l a6,d6
    6ac4:	    move.l a6,d6
	tst.b 3(a0)
    6ac6:	    tst.b 3(a0)
	bpl.b P61_jatk
    6aca:	    bpl.s 6aea <P61_jatk>
	tst.b (a2)
    6acc:	    tst.b (a2)
	bmi.b P61_jatk
    6ace:	    bmi.s 6aea <P61_jatk>
	move d4,d0
    6ad0:	    move.w d4,d0
	subq #2,d0
    6ad2:	    subq.w #2,d0
	bmi.b P61_jatk
    6ad4:	    bmi.s 6aea <P61_jatk>
	move.l a1,a5
    6ad6:	    movea.l a1,a5
	move.b (a5)+,d2
    6ad8:	    move.b (a5)+,d2
	sub.b (a5),d2
    6ada:	    sub.b (a5),d2
	move.b d2,(a5)+
    6adc:	    move.b d2,(a5)+
.loop:sub.b (a5),d2
    6ade:	/-> sub.b (a5),d2
	move.b d2,(a5)+
    6ae0:	|   move.b d2,(a5)+
	sub.b (a5),d2
    6ae2:	|   sub.b (a5),d2
	move.b d2,(a5)+
    6ae4:	|   move.b d2,(a5)+
	dbf d0,.loop
    6ae6:	\-- dbf d0,6ade <P61_kook+0x1a>

00006aea <P61_jatk>:
P61_jatk:
	move d4,(a4)+
    6aea:	    move.w d4,(a4)+
	moveq #0,d2
    6aec:	    moveq #0,d2
	move.b (a2)+,d2
    6aee:	    move.b (a2)+,d2
	moveq #0,d3
    6af0:	    moveq #0,d3
	move.b (a2)+,d3
    6af2:	    move.b (a2)+,d3
	moveq #0,d0
    6af4:	    moveq #0,d0
	move (a2)+,d0
    6af6:	    move.w (a2)+,d0
	bmi.b .norepeat
    6af8:	/-- bmi.s 6b0a <P61_jatk+0x20>
	move d4,d5
    6afa:	|   move.w d4,d5
	sub d0,d5
    6afc:	|   sub.w d0,d5
	move.l d6,a5
    6afe:	|   movea.l d6,a5
	add.l d0,a5
    6b00:	|   adda.l d0,a5
	add.l d0,a5
    6b02:	|   adda.l d0,a5
	move.l a5,(a4)+
    6b04:	|   move.l a5,(a4)+
	move d5,(a4)+
    6b06:	|   move.w d5,(a4)+
	bra.b P61_gene
    6b08:	|   bra.s 6b10 <P61_gene>
.norepeat:
	move.l d6,(a4)+
    6b0a:	\-> move.l d6,(a4)+
	move #1,(a4)+
    6b0c:	    move.w #1,(a4)+

00006b10 <P61_gene>:
P61_gene:
	move d3,(a4)+
    6b10:	             move.w d3,(a4)+
	moveq #$f,d0
    6b12:	             moveq #15,d0
	and d2,d0
    6b14:	             and.w d2,d0
	mulu #74,d0
    6b16:	             mulu.w #74,d0
	move d0,(a4)+
    6b1a:	             move.w d0,(a4)+
	tst -6(a2)
    6b1c:	             tst.w -6(a2)
	bmi.b .nobuffer
    6b20:	/----------- bmi.s 6b6c <P61_gene+0x5c>
	moveq #$40,d0
    6b22:	|            moveq #64,d0
	and.b 3(a0),d0
    6b24:	|            and.b 3(a0),d0
	beq.b .nobuffer
    6b28:	+----------- beq.s 6b6c <P61_gene+0x5c>
	move d4,d7
    6b2a:	|            move.w d4,d7
	tst.b d2
    6b2c:	|            tst.b d2
	bpl.b .copy
    6b2e:	|     /----- bpl.s 6b50 <P61_gene+0x40>
	subq #1,d7
    6b30:	|     |      subq.w #1,d7
	moveq #0,d5
    6b32:	|     |      moveq #0,d5
	moveq #0,d4
    6b34:	|     |      moveq #0,d4
.lo:	move.b (a1)+,d4
    6b36:	|     |  /-> move.b (a1)+,d4
	moveq #$f,d3
    6b38:	|     |  |   moveq #15,d3
	and d4,d3
    6b3a:	|     |  |   and.w d4,d3
	lsr #4,d4
    6b3c:	|     |  |   lsr.w #4,d4
	sub.b .table(pc,d4),d5
    6b3e:	|     |  |   sub.b (6b5c <P61_gene+0x4c>,pc,d4.w),d5
	move.b d5,(a6)+
    6b42:	|     |  |   move.b d5,(a6)+
	sub.b .table(pc,d3),d5
    6b44:	|     |  |   sub.b (6b5c <P61_gene+0x4c>,pc,d3.w),d5
	move.b d5,(a6)+
    6b48:	|     |  |   move.b d5,(a6)+
	dbf d7,.lo
    6b4a:	|     |  \-- dbf d7,6b36 <P61_gene+0x26>
	bra.b .kop
    6b4e:	|  /--|----- bra.s 6b74 <P61_gene+0x64>
.copy:
	add d7,d7
    6b50:	|  |  \----> add.w d7,d7
	subq #1,d7
    6b52:	|  |         subq.w #1,d7
.cob:
	move.b (a1)+,(a6)+
    6b54:	|  |     /-> move.b (a1)+,(a6)+
	dbf d7,.cob
    6b56:	|  |     \-- dbf d7,6b54 <P61_gene+0x44>
	bra.b .kop
    6b5a:	|  +-------- bra.s 6b74 <P61_gene+0x64>
    6b5c:	|  |         ori.b #4,d1
    6b60:	|  |         btst #64,(a0)
    6b64:	|  |         divu.w d0,d0
    6b66:	|  |         asr.w (-4,a0,sp.l)
    6b6a:	|  |         .short 0xfeff
.table:
	dc.b 0,1,2,4,8,16,32,64,128,-64,-32,-16,-8,-4,-2,-1
.nobuffer:
	move.l d4,d6
    6b6c:	\--|-------> move.l d4,d6
	add.l d6,d6
    6b6e:	   |         add.l d6,d6
	add.l d6,a6
    6b70:	   |         adda.l d6,a6
	add.l d6,a1
    6b72:	   |         adda.l d6,a1
.kop:
	dbf d1,P61_lopos
    6b74:	   \-------> dbf d1,6aa4 <P61_lopos>
	move.l (sp)+,a0
    6b78:	             movea.l (sp)+,a0
	and.b #$7f,3(a0)
    6b7a:	             andi.b #127,3(a0)
	move.l a2,-(sp)
    6b80:	             move.l a2,-(sp)
	lea P61_temp0(pc),a1
    6b82:	             lea 7372 <P61_temp0>(pc),a1
	lea P61_temp1(pc),a2
    6b86:	             lea 73b2 <P61_temp1>(pc),a2
	lea P61_temp2(pc),a4
    6b8a:	             lea 73f2 <P61_temp2>(pc),a4
	lea P61_temp3(pc),a5
    6b8e:	             lea 7432 <P61_temp3>(pc),a5
	moveq #Channel_Block_Size/2-2,d0
    6b92:	             moveq #30,d0
	moveq #0,d1
    6b94:	             moveq #0,d1
.cl:	move d1,(a1)+
    6b96:	         /-> move.w d1,(a1)+
	move d1,(a2)+
    6b98:	         |   move.w d1,(a2)+
	move d1,(a4)+
    6b9a:	         |   move.w d1,(a4)+
	move d1,(a5)+
    6b9c:	         |   move.w d1,(a5)+
	dbf d0,.cl
    6b9e:	         \-- dbf d0,6b96 <P61_gene+0x86>
	lea P61_temp0-P61_cn(a3),a1
    6ba2:	             lea -256(a3),a1
	lea P61_emptysample-P61_cn(a3),a2
    6ba6:	             lea 614(a3),a2
	moveq #channels-1,d0
    6baa:	             moveq #3,d0
.loo:
	move.l a2,P61_Sample(a1)
    6bac:	         /-> move.l a2,4(a1)
	lea Channel_Block_Size(a1),a1
    6bb0:	         |   lea 64(a1),a1
	dbf d0,.loo
    6bb4:	         \-- dbf d0,6bac <P61_gene+0x9c>
	move.l (sp)+,a2
    6bb8:	             movea.l (sp)+,a2
	move.l a2,P61_positionbase-P61_cn(a3)
    6bba:	             move.l a2,630(a3)
	moveq #$7f,d1
    6bbe:	             moveq #127,d1
	and.b 2(a0),d1
    6bc0:	             and.b 2(a0),d1
	ifeq opt020
	lsl #3,d1
    6bc4:	             lsl.w #3,d1
	lea (a2,d1.l),a4
    6bc6:	             lea (0,a2,d1.l),a4
	else
	lea (a2,d1.l*8),a4
	endc
	move.l a4,P61_possibase-P61_cn(a3)	;base to pos. indices.
    6bca:	             move.l a4,634(a3)
	move.l a4,a1
    6bce:	             movea.l a4,a1
	moveq #-1,d0
    6bd0:	             moveq #-1,d0
.search:
	cmp.b (a1)+,d0
    6bd2:	         /-> cmp.b (a1)+,d0
	bne.b .search
    6bd4:	         \-- bne.s 6bd2 <P61_gene+0xc2>
	move.l a1,P61_patternbase-P61_cn(a3)
    6bd6:	             move.l a1,638(a3)
	move.l a1,d0
    6bda:	             move.l a1,d0
	sub.l a4,d0
    6bdc:	             sub.l a4,d0
	subq.w #1,d0			;this is the * BUGFIX! whoa!
    6bde:	             subq.w #1,d0
	move d0,P61_slen-P61_cn(a3)
    6be0:	             move.w d0,80(a3)
;;    ---  Bugfix: P61_Init gives P61_slen=actual songlength +1.
;;    ---  This did not affect NextPattern, because it looks for endbyte flag.
;;    ---  It did affect Bxx/Dxx, but I guess nobody has tried to jump or 
;;    ---  break to Last Pattern, ever. Now fixed to set correct SLen and 
;;    ---  suddenly Bxx/Dxx/Setposition works as they should. //Photon
	add.w P61_InitPos(pc),a4	;position from which to start playing the song
    6be4:	             adda.w 76f8 <P61_InitPos>(pc),a4

	moveq #0,d0
    6be8:	             moveq #0,d0
	move.b (a4)+,d0
    6bea:	             move.b (a4)+,d0
	move.l a4,P61_spos-P61_cn(a3)
    6bec:	             move.l a4,88(a3)
	lsl #3,d0
    6bf0:	             lsl.w #3,d0
	add.l d0,a2
    6bf2:	             adda.l d0,a2
	move.l a1,a4
    6bf4:	             movea.l a1,a4
	moveq #0,d0	;hi word must be clear to manage >32K of patterns
    6bf6:	             moveq #0,d0
	move (a2)+,d0	;and no movem-signextend. This code is correct.
    6bf8:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6bfa:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp0-P61_cn(a3)
    6bfe:	             move.l a1,-246(a3)
	move (a2)+,d0
    6c02:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6c04:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp1-P61_cn(a3)
    6c08:	             move.l a1,-182(a3)
	move (a2)+,d0
    6c0c:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6c0e:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp2-P61_cn(a3)
    6c12:	             move.l a1,-118(a3)
	move (a2)+,d0
    6c16:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6c18:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp3-P61_cn(a3)
    6c1c:	             move.l a1,-54(a3)

	ifeq nowaveforms
	lea P61_setrepeat(pc),a0
    6c20:	             lea 7312 <P61_setrepeat>(pc),a0
	move.l a0,P61_intaddr-P61_cn(a3)
    6c24:	             move.l a0,642(a3)
	endc

	move #63,P61_rowpos-P61_cn(a3)
    6c28:	             move.w #63,78(a3)
	move #6,P61_speed-P61_cn(a3)
    6c2e:	             move.w #6,82(a3)
	move #5,P61_speed2-P61_cn(a3)
    6c34:	             move.w #5,84(a3)
	clr P61_speedis1-P61_cn(a3)
    6c3a:	             clr.w 86(a3)
	endc
	ifne P61_pde
	clr P61_pdelay-P61_cn(a3)
	clr P61_pdflag-P61_cn(a3)
	endc
	clr (a3)		;start frame of very first song note.
    6c3e:	             clr.w (a3)
;"reused" patterns with effects coming out of nowhere
;at start of song require 0. Otherwise F0x speed-2 is 
;ok, except if split4=1, set to F-speed - #channels.
;Don't change if you don't need 'the very quickest click to start' speed.
	moveq #2,d0
    6c40:	             moveq #2,d0
	and.b $bfe001,d0
    6c42:	             and.b bfe001 <_end+0xb74345>,d0
	move.b d0,P61_ofilter-P61_cn(a3)
    6c48:	             move.b d0,100(a3)
	bset #1,$bfe001
    6c4c:	             bset #1,bfe001 <_end+0xb74345>
	lea P61_liko(pc),a5
	jsr -$1e(a6)
.no68010:
	move.l d0,P61_VBR-P61_cn(a3)
	endc
	move.l P61_VBR-P61_cn(a3),a0
    6c54:	             movea.l -2664(a3),a0
	lea $78(a0),a0
    6c58:	             lea 120(a0),a0
	move.l a0,P61_vektori-P61_cn(a3)
    6c5c:	             move.l a0,92(a3)
	move.l (a0),P61_oldlev6-P61_cn(a3)
    6c60:	             move.l (a0),96(a3)
	ifeq copdma
	lea P61_dmason(pc),a1		;set 'dma-on-interrupt'.
    6c64:	             lea 72dc <P61_dmason>(pc),a1
	move.l a1,(a0)
    6c68:	             move.l a1,(a0)
	endc
	endc
	moveq #$f,d0
    6c6a:	             moveq #15,d0
	lea $dff000+C,a6		;a6 trashed above.
    6c6c:	             lea dff000 <_end+0xd75344>,a6
	ifeq quietstart
	moveq #$0,d1			;original code
    6c72:	             moveq #0,d1
	move d1,$a8-C(a6)
    6c74:	             move.w d1,168(a6)
	move d1,$b8-C(a6)
    6c78:	             move.w d1,184(a6)
	move d1,$c8-C(a6)
    6c7c:	             move.w d1,200(a6)
	move d1,$d8-C(a6)
    6c80:	             move.w d1,216(a6)
	move d0,$96-C(a6)
    6c84:	             move.w d0,150(a6)
	move.w d0,P61_NewDMA-P61_cn(a3)	;"NEXTframe setloop" to be triggered
	endc

	ifeq p61system
	ifeq copdma
	lea P61_dmason(pc),a1		;again?
    6c88:	             lea 72dc <P61_dmason>(pc),a1
	move.l a1,(a0)
    6c8c:	             move.l a1,(a0)
	endc
	move #$2000,$9a-C(a6)		;old timerb OFF
    6c8e:	             move.w #8192,154(a6)
	lea $bfd000,a0
    6c94:	             lea bfd000 <_end+0xb73344>,a0
	lea P61_timers(pc),a1
    6c9a:	             lea 74d8 <P61_timers>(pc),a1
	move.b #$7f,$d00(a0)
    6c9e:	             move.b #127,3328(a0)

	ifne p61cia			;only affect cia if actually used
	move.b #$10,$e00(a0)
    6ca4:	             move.b #16,3584(a0)
	endc
	move.b #$10,$f00(a0)
    6caa:	             move.b #16,3840(a0)
	ifne p61cia
	move.b $400(a0),(a1)+
    6cb0:	             move.b 1024(a0),(a1)+
	move.b $500(a0),(a1)+
    6cb4:	             move.b 1280(a0),(a1)+
	else
	addq.w #2,a1	
	endc

	move.b $600(a0),(a1)+
    6cb8:	             move.b 1536(a0),(a1)+
	move.b $700(a0),(a1)
    6cbc:	             move.b 1792(a0),(a1)
	endc
	ifeq (p61system+p61cia)
	move.b #$82,$d00(a0)
	endc
	ifne p61cia
	move (sp)+,d0
    6cc0:	             move.w (sp)+,d0
	subq #1,d0
    6cc2:	             subq.w #1,d0
	beq.b P61_ForcePAL
    6cc4:	             beq.s 6cca <P61_ForcePAL>
	subq #1,d0
    6cc6:	             subq.w #1,d0
	beq.b P61_NTSC
    6cc8:	             beq.s 6cd2 <P61_NTSC>

00006cca <P61_ForcePAL>:
	move.l 4.w,a1
	cmp.b #60,$213(a1)
	beq.b P61_NTSC
	endc
P61_ForcePAL:
	move.l #1773447,d0
    6cca:	move.l #1773447,d0
	bra.b P61_setcia
    6cd0:	bra.s 6cd8 <P61_setcia>

00006cd2 <P61_NTSC>:
P61_NTSC:
	move.l #1789773,d0
    6cd2:	move.l #1789773,d0

00006cd8 <P61_setcia>:
P61_setcia:
	move.l d0,P61_timer-P61_cn(a3)
    6cd8:	move.l d0,114(a3)
	divu #125,d0
    6cdc:	divu.w #125,d0
	move d0,P61_thi2-P61_cn(a3)
    6ce0:	move.w d0,112(a3)
	sub #$1f0*2,d0
    6ce4:	sub.w #992,d0
	move d0,P61_thi-P61_cn(a3)
    6ce8:	move.w d0,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d0
    6cec:	move.w 112(a3),d0
	move.b d0,$400(a0)
    6cf0:	move.b d0,1024(a0)
	lsr #8,d0
    6cf4:	lsr.w #8,d0
	move.b d0,$500(a0)
    6cf6:	move.b d0,1280(a0)
	lea P61_intti(pc),a1
    6cfa:	lea 6a24 <P61_intti>(pc),a1
	move.l a1,P61_tintti-P61_cn(a3)
    6cfe:	move.l a1,106(a3)
	move.l P61_vektori(pc),a2
    6d02:	movea.l 74ce <P61_vektori>(pc),a2
	move.l a1,(a2)
    6d06:	move.l a1,(a2)
	move.b #$83,$d00(a0)
    6d08:	move.b #-125,3328(a0)
	move.b #$11,$e00(a0)
    6d0e:	move.b #17,3584(a0)
	endc
	endc

	ifeq p61system
	ifeq copdma
	move #$e000,$9a-C(a6)	;level 6 timer B int, at least for setloop
    6d14:	move.w #-8192,154(a6)
	endc
	ifne quietstart
	move.w #$800f,$96-C(A6)	;make all used channels start a quiet loop.
	endc

	moveq #0,d0
    6d1a:	moveq #0,d0
	rts
    6d1c:	rts

00006d1e <_P61_End>:
* Input:	none.
* Uses:		D0-D1/A0-A1/A3/A6, A6 set to $dff000+C (your custombase) at exit.

_P61_End:
P61_End:
	lea $dff000+C,a6
    6d1e:	lea dff000 <_end+0xd75344>,a6
	moveq #0,d0
    6d24:	moveq #0,d0
	move d0,$a8-C(a6)
    6d26:	move.w d0,168(a6)
	move d0,$b8-C(a6)
    6d2a:	move.w d0,184(a6)
	move d0,$c8-C(a6)
    6d2e:	move.w d0,200(a6)
	move d0,$d8-C(a6)
    6d32:	move.w d0,216(a6)
	move #$f,$96-C(a6)
    6d36:	move.w #15,150(a6)
	and.b #%11111101,$bfe001
    6d3c:	andi.b #-3,bfe001 <_end+0xb74345>
	move.b P61_ofilter(pc),d0
    6d44:	move.b 74d6 <P61_ofilter>(pc),d0
	or.b d0,$bfe001
    6d48:	or.b d0,bfe001 <_end+0xb74345>
	ifeq p61system
	move #$2000,$9a-C(a6)
    6d4e:	move.w #8192,154(a6)
	move.l P61_vektori(pc),a0
    6d54:	movea.l 74ce <P61_vektori>(pc),a0
	move.l P61_oldlev6(pc),(a0)
    6d58:	move.l 74d2 <P61_oldlev6>(pc),(a0)
	lea $bfd000,a0
    6d5c:	lea bfd000 <_end+0xb73344>,a0
	lea P61_timers(pc),a1
    6d62:	lea 74d8 <P61_timers>(pc),a1

	ifne p61cia			;only affect cia if used
	move.b (a1)+,$400(a0)
    6d66:	move.b (a1)+,1024(a0)
	move.b (a1)+,$500(a0)
    6d6a:	move.b (a1)+,1280(a0)
	else
	addq.w #2,a1
	endc
	move.b (a1)+,$600(a0)
    6d6e:	move.b (a1)+,1536(a0)
	move.b (a1)+,$700(a0)
    6d72:	move.b (a1)+,1792(a0)
	ifne p61cia
	move.b #$10,$e00(a0)
    6d76:	move.b #16,3584(a0)
	endc

	move.b #$10,$f00(a0)
    6d7c:	move.b #16,3840(a0)
	jsr -$150(a6)
	st P61_sigbit-P61_cn(a3)
P61_rem3:
	move.l (sp)+,a6
	endc
	rts
    6d82:	rts

00006d84 <_P61_Music>:
********** Main entry point from CIA/VB int or frame loop **********
* Input:	A6=your custombase ("$dff000")
* Uses:		D0-A7, A6 set to $dff000+C (your custombase) at exit.
_P61_Music:
P61_Music:
	lea P61_cn(pc),a3
    6d84:	lea 7472 <P61_cn>(pc),a3
	moveq #0,d7			;replaced clr.* with move.* d7,
    6d88:	moveq #0,d7
	lea $a0-C(a6),a4		;Aud Chan Base.
    6d8a:	lea 160(a6),a4

00006d8e <P61_ohitaaa>:
	rts
	endc

P61_ohitaaa:
	ifne visuctrs				;easy visualizer counters.
	addq.w #1,P61_visuctr0-P61_cn(a3)	;inc elapsed #calls since last
    6d8e:	addq.w #1,650(a3)
	addq.w #1,P61_visuctr1-P61_cn(a3)
    6d92:	addq.w #1,652(a3)
	addq.w #1,P61_visuctr2-P61_cn(a3)
    6d96:	addq.w #1,654(a3)
	addq.w #1,P61_visuctr3-P61_cn(a3)
    6d9a:	addq.w #1,656(a3)
	
	ifne p61fade
	pea P61_mfade(pc)
	endc

	move.w (a3),d4
    6d9e:	move.w (a3),d4
	cmp.w P61_speed2(pc),d4	;Really compares with P61_speed, 1 added later.
    6da0:	cmp.w 74c6 <P61_speed2>(pc),d4
	beq.w P61_playtime	;if new note frame, handle
    6da4:	beq.w 70c8 <P61_playtime>

00006da8 <P61_nowrap>:
	move d0,P61_CRow-P61_cn(a3)
	endc
;;    ---  end of rolled over code  ---

P61_nowrap:
	addq.w #1,d4			;NOW I do!
    6da8:	addq.w #1,d4
	move d4,(a3)
    6daa:	move.w d4,(a3)

00006dac <P61_delay>:
	move.b P61_tlo2(pc),(a0)
	move.b P61_thi2(pc),$100(a0)
	endc
	endc
********** mainfx handling **********
	lea P61_temp0(pc),a5
    6dac:	lea 7372 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    6db0:	moveq #3,d5

00006db2 <P61_lopas>:
P61_lopas:
	tst.b P61_OnOff+1(a5)
    6db2:	tst.b 9(a5)
	beq.w P61_contfxdone
    6db6:	beq.w 6e22 <P61_contfxdone>
	moveq #$f,d0
    6dba:	moveq #15,d0
	and (a5),d0
    6dbc:	and.w (a5),d0
	ifeq opt020
	add d0,d0
    6dbe:	add.w d0,d0
	move P61_jtab2(pc,d0),d0
    6dc0:	move.w (6dc8 <P61_jtab2>,pc,d0.w),d0
	else
	move P61_jtab2(pc,d0*2),d0
	endc
	jmp P61_jtab2(pc,d0)
    6dc4:	jmp (6dc8 <P61_jtab2>,pc,d0.w)

00006dc8 <P61_jtab2>:
    6dc8:	ori.w #90,(a2)+
    6dcc:	ori.w #90,(a2)+
    6dd0:	ori.w #90,(a2)+
    6dd4:	ori.w #90,(a2)+
    6dd8:	ori.w #90,(a2)+
    6ddc:	ori.b #90,-(a0)
    6de0:	ori.w #90,(a2)+
    6de4:	ori.w #90,(a2)+

00006de8 <P61_volslide>:
	bra.w P61_contfxdone
	endc
;;    ---  period table move to before P61_cn  ---
	ifne P61_vs
P61_volslide:
	move.b P61_Info(a5),d0
    6de8:	    move.b 2(a5),d0
	sub.b d0,P61_Volume+1(a5)
    6dec:	    sub.b d0,25(a5)
	bpl.b .test
    6df0:	/-- bpl.s 6dfe <P61_volslide+0x16>
	move d7,P61_Volume(a5)
    6df2:	|   move.w d7,24(a5)
	ifeq p61fade
	move d7,8(a4)
    6df6:	|   move.w d7,8(a4)
	else
	move d7,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6dfa:	|   bra.w 6e22 <P61_contfxdone>
.test:
	moveq #64,d0
    6dfe:	\-> moveq #64,d0
	cmp P61_Volume(a5),d0
    6e00:	    cmp.w 24(a5),d0
	bge.b .ncs
    6e04:	/-- bge.s 6e12 <P61_volslide+0x2a>
	move d0,P61_Volume(a5)
    6e06:	|   move.w d0,24(a5)
	ifeq p61fade
	move d0,8(a4)
    6e0a:	|   move.w d0,8(a4)
	else
	move d0,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6e0e:	|   bra.w 6e22 <P61_contfxdone>
.ncs:
	ifeq p61fade
	move P61_Volume(a5),8(a4)
    6e12:	\-> move.w 24(a5),8(a4)
	else
	move P61_Volume(a5),P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    6e18:	    bra.w 6e22 <P61_contfxdone>
	move d0,P61_Period(a5)
	move d7,P61_ToPeriod(a5)
.setper:
	move P61_Period(a5),6(a4)
	else
	nop
    6e1c:	    nop
	endc
	bra.w P61_contfxdone
    6e1e:	    bra.w 6e22 <P61_contfxdone>

00006e22 <P61_contfxdone>:
********** MainFX returns here from all fx **********
P61_contfxdone:
	ifne P61_il
	bsr.w P61_funk2
	endc
	lea Channel_Block_Size(a5),a5
    6e22:	lea 64(a5),a5
	lea Custom_Block_Size(a4),a4
    6e26:	lea 16(a4),a4
	dbf d5,P61_lopas
    6e2a:	dbf d5,6db2 <P61_lopas>
;;    ---  splitchans or normal decrunch  ---
	ifeq split4
	cmp P61_speed2(PC),d4		;'decrunch frame'? (1 before playtime)
    6e2e:	cmp.w 74c6 <P61_speed2>(pc),d4
	bne.w P61_ret2
    6e32:	bne.w 70c6 <P61_ret2>

00006e36 <P61_preplay2>:
P61_preplay2:

.pr:	ifle (channels-splitchans)
	printt "splitchans >= channels! Must be less."
	else
	moveq #(channels-splitchans)-1,d5	;do preplay "first" half
    6e36:	moveq #2,d5
	lea P61_temp0(pc),a5
    6e38:	lea 7372 <P61_temp0>(pc),a5
	bra.w P61_preplay
    6e3c:	bra.w 6fb6 <P61_preplay>

00006e40 <P61_MyJpt>:

	endc				;if split4
********** My Jump Table **********
P61_MyJpt:;jump table,%x1111xxx,%x111xxxx,%x11xxxxx=note,cmd,all - else empty
;	REPT 12
	jmp P61_all(PC)
    6e40:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e44:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e48:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e4c:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e50:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e54:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e58:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e5c:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e60:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e64:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e68:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e6c:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e70:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e74:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e78:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e7c:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e80:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e84:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e88:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e8c:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e90:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e94:	jmp 7032 <P61_all2>(pc)
	jmp P61_all(PC)
    6e98:	jmp 6fe6 <P61_all>(pc)
	jmp P61_all2(PC)
    6e9c:	jmp 7032 <P61_all2>(pc)
;	ENDR
	jmp P61_cmd(PC)
    6ea0:	jmp 6ff0 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    6ea4:	jmp 703e <P61_cmd2>(pc)
	jmp P61_cmd(PC)
    6ea8:	jmp 6ff0 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    6eac:	jmp 703e <P61_cmd2>(pc)
	jmp P61_noote(PC)
    6eb0:	jmp 6ffc <P61_noote>(pc)
	jmp P61_note2(PC)
    6eb4:	jmp 704c <P61_note2>(pc)
	jmp P61_empty(PC)
    6eb8:	jmp 6fde <P61_empty>(pc)
	jmp P61_empty2(PC)
    6ebc:	jmp 7028 <P61_empty2>(pc)

;	REPT 12
	jmp P61_allS(PC)
    6ec0:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6ec4:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ec8:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6ecc:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ed0:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6ed4:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ed8:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6edc:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ee0:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6ee4:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ee8:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6eec:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ef0:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6ef4:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6ef8:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6efc:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6f00:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6f04:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6f08:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6f0c:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6f10:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6f14:	jmp 7072 <P61_all2S>(pc)
	jmp P61_allS(PC)
    6f18:	jmp 7016 <P61_allS>(pc)
	jmp P61_all2S(PC)
    6f1c:	jmp 7072 <P61_all2S>(pc)
;	ENDR
	jmp P61_cmdS(PC)
    6f20:	jmp 701e <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    6f24:	jmp 707c <P61_cmd2S>(pc)
	jmp P61_cmdS(PC)
    6f28:	jmp 701e <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    6f2c:	jmp 707c <P61_cmd2S>(pc)
	jmp P61_noteS(PC)
    6f30:	jmp 7088 <P61_noteS>(pc)
	jmp P61_note2S(PC)
    6f34:	jmp 7060 <P61_note2S>(pc)
	jmp P61_emptyS(PC)
    6f38:	jmp 700e <P61_emptyS>(pc)

00006f3c <P61_empty2S>:
;	jmp P61_empty2S(PC)
********** END OF MYJPT **********
P61_empty2S:
	move d7,(a5)+
    6f3c:	move.w d7,(a5)+
	move.b d7,(a5)+
    6f3e:	move.b d7,(a5)+

00006f40 <P61_proccompS>:
;;    ---  alt exit  ---
P61_proccompS:
	move.b (a0)+,d1
    6f40:	    move.b (a0)+,d1
	move.b d1,d0
    6f42:	    move.b d1,d0

	add.b d1,d1
    6f44:	    add.b d1,d1
	bpl.b P61_permexit		;bit 6 was 0
    6f46:	    bpl.s 6fac <P61_permexit>
;;    ---  stay in chan, repeat  ---
.b6set:	bcs.b .bit16
    6f48:	/-- bcs.s 6f66 <P61_proccompS+0x26>

.bit8:	move.b d7,(a5)
    6f4a:	|   move.b d7,(a5)
	subq.l #3,a5			;stay tuned to this channel!
    6f4c:	|   subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    6f4e:	|   and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    6f50:	|   move.b d0,19(a5)
	move.b (a0)+,d0			;hi word is clear. (constant)
    6f54:	|   move.b (a0)+,d0
	move.l a0,P61_ChaPos(a5)	;dupe of above
    6f56:	|   move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    6f5a:	|   suba.l d0,a0
.jedi1:	move.b (a0)+,d0			;used in .empty etc
    6f5c:	|   move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    6f5e:	|   moveq #-8,d1
	and.b d0,d1
    6f60:	|   and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    6f62:	|   jmp (6f40 <P61_proccompS>,pc,d1.w)

.bit16:	move.b d7,(a5)
    6f66:	\-> move.b d7,(a5)
	subq.l #3,a5
    6f68:	    subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    6f6a:	    and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    6f6c:	    move.b d0,19(a5)
	ifeq opt020
	move.b (a0)+,d0			;hi word is clear. (constant)
    6f70:	    move.b (a0)+,d0
	lsl #8,d0
    6f72:	    lsl.w #8,d0
	move.b (a0)+,d0
    6f74:	    move.b (a0)+,d0
	else
	move.w (a0)+,d0			;(potentially) odd-address word-read.
	endc
	move.l a0,P61_ChaPos(a5)	;dupe of above
    6f76:	    move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    6f7a:	    suba.l d0,a0
.jedi2:	move.b (a0)+,d0			;used in .empty etc
    6f7c:	    move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    6f7e:	    moveq #-8,d1
	and.b d0,d1
    6f80:	    and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    6f82:	    jmp (6f40 <P61_proccompS>,pc,d1.w)

00006f86 <P61_Take>:

P61_Take:
	tst.b P61_TempLen+1(a5)		;faster than subq + addq!
    6f86:	tst.b 19(a5)
	bne.b P61_takeone
    6f8a:	bne.s 6f9a <P61_takeone>

00006f8c <P61_TakeNorm>:
P61_TakeNorm:				;this is more frequent than takeone
	move.l P61_ChaPos(a5),a0	;dflt - if takenorm
    6f8c:	movea.l 10(a5),a0
	move.b (a0)+,d0			;used in .empty etc
    6f90:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    6f92:	moveq #-8,d1
	and.b d0,d1
    6f94:	and.b d0,d1
	jmp P61_MyJpt+256+4(PC,d1.w)	;first call can be this...
    6f96:	jmp (6f44 <P61_proccompS+0x4>,pc,d1.w)

00006f9a <P61_takeone>:
P61_takeone:
	subq.b #1,P61_TempLen+1(a5)
    6f9a:	subq.b #1,19(a5)
	move.l P61_TempPos(a5),a0
    6f9e:	movea.l 14(a5),a0

00006fa2 <P61_Jedi>:
P61_Jedi:	;temp/repeat. copy below proccompS.
	move.b (a0)+,d0			;used in .empty etc
    6fa2:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    6fa4:	moveq #-8,d1
	and.b d0,d1
    6fa6:	and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)	;but rest is always this
    6fa8:	jmp (6f40 <P61_proccompS>,pc,d1.w)

00006fac <P61_permexit>:
;;    ---  alt (perm) exit  ---		;does not affect maxtime.
P61_permexit:
	move.b d0,(a5)
    6fac:	move.b d0,(a5)
	move.l a0,P61_ChaPos-3(a5)
    6fae:	move.l a0,7(a5)
	bra.w P61_permdko
    6fb2:	bra.w 709c <P61_permdko>

00006fb6 <P61_preplay>:

;;    ---  The hipper wilderbeest run gnu linux at midnight!  ---
	ifne P61_ft
	lea (P61_samples-16)-P61_cn(a3),a2
	endc
	moveq #$3f,d4
    6fb6:	moveq #63,d4
	moveq #-$10,d6			;intelligent on/off-flag
    6fb8:	moveq #-16,d6
	moveq #0,d0			;clear hi word, never dirtied below.
    6fba:	moveq #0,d0

00006fbc <P61_loaps>:
	move.l P61_ChaPos(a5),(a1)+
	move.l P61_TempPos(a5),(a1)+
	move P61_TempLen(a5),(a1)
	endc

	moveq #-65,d1			;%10111111 const
    6fbc:	moveq #-65,d1
	and.b P61_Pack(a5),d1
    6fbe:	and.b 3(a5),d1
	add.b d1,d1			;sign in carry
    6fc2:	add.b d1,d1
	beq.b P61_Take			;6 lsb bits 0?
    6fc4:	beq.s 6f86 <P61_Take>
	bcc.b P61_nodko
    6fc6:	bcc.s 6fd0 <P61_nodko>
	addq #3,a5
    6fc8:	addq.w #3,a5
	subq.b #1,(a5)
    6fca:	subq.b #1,(a5)
	bra.w P61_permdko
    6fcc:	bra.w 709c <P61_permdko>

00006fd0 <P61_nodko>:
P61_nodko:
	move.b d7,P61_OnOff+1(a5)
    6fd0:	move.b d7,9(a5)
	subq.b #1,P61_Pack(a5)
    6fd4:	subq.b #1,3(a5)
	addq #3,a5
    6fd8:	addq.w #3,a5
	bra.w P61_koto
    6fda:	bra.w 70be <P61_koto>

00006fde <P61_empty>:

;;    ---  routines  ---
P61_empty:
	move d7,(a5)+
    6fde:	move.w d7,(a5)+
	move.b d7,(a5)+
    6fe0:	move.b d7,(a5)+
	bra.w P61_ex
    6fe2:	bra.w 7098 <P61_ex>

00006fe6 <P61_all>:
P61_all:
	move.b d0,(a5)+		;but this can't...
    6fe6:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    6fe8:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    6fea:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_ex
    6fec:	bra.w 7098 <P61_ex>

00006ff0 <P61_cmd>:
P61_cmd:
	moveq #$f,d1
    6ff0:	moveq #15,d1
	and d0,d1
    6ff2:	and.w d0,d1
	move d1,(a5)+
    6ff4:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    6ff6:	move.b (a0)+,(a5)+
	bra.w P61_ex
    6ff8:	bra.w 7098 <P61_ex>

00006ffc <P61_noote>:
P61_noote:
	moveq #7,d1
    6ffc:	moveq #7,d1
	and d0,d1
    6ffe:	and.w d0,d1
	lsl #8,d1
    7000:	lsl.w #8,d1
	move.b (a0)+,d1
    7002:	move.b (a0)+,d1
	lsl #4,d1
    7004:	lsl.w #4,d1
	move d1,(a5)+
    7006:	move.w d1,(a5)+
	move.b d7,(a5)+
    7008:	move.b d7,(a5)+
	bra.w P61_ex
    700a:	bra.w 7098 <P61_ex>

0000700e <P61_emptyS>:
;;    ---  copyS  ---
P61_emptyS:
	move d7,(a5)+
    700e:	move.w d7,(a5)+
	move.b d7,(a5)+
    7010:	move.b d7,(a5)+
	bra.w P61_exS
    7012:	bra.w 7096 <P61_exS>

00007016 <P61_allS>:
P61_allS:
	move.b d0,(a5)+		;but this can't...
    7016:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7018:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    701a:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.b P61_exS
    701c:	bra.s 7096 <P61_exS>

0000701e <P61_cmdS>:
P61_cmdS:
	moveq #$f,d1
    701e:	moveq #15,d1
	and d0,d1
    7020:	and.w d0,d1
	move d1,(a5)+
    7022:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    7024:	move.b (a0)+,(a5)+
	bra.b P61_exS
    7026:	bra.s 7096 <P61_exS>

00007028 <P61_empty2>:
;;    ---    ---
********** copy, perm exit **********
P61_empty2:
	move d7,(a5)+
    7028:	move.w d7,(a5)+
	move.b d7,(a5)+
    702a:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    702c:	move.l a0,7(a5)
	bra.b P61_permdko
    7030:	bra.s 709c <P61_permdko>

00007032 <P61_all2>:
P61_all2:
	move.b d0,(a5)+
    7032:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7034:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7036:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	move.l a0,P61_ChaPos-3(a5)
    7038:	move.l a0,7(a5)
	bra.b P61_permdko
    703c:	bra.s 709c <P61_permdko>

0000703e <P61_cmd2>:
P61_cmd2:
	moveq #$f,d1
    703e:	moveq #15,d1
	and d0,d1
    7040:	and.w d0,d1
	move d1,(a5)+
    7042:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7044:	move.b (a0)+,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    7046:	move.l a0,7(a5)
	bra.b P61_permdko
    704a:	bra.s 709c <P61_permdko>

0000704c <P61_note2>:
P61_note2:
	moveq #7,d1
    704c:	moveq #7,d1
	and d0,d1
    704e:	and.w d0,d1
	lsl #8,d1
    7050:	lsl.w #8,d1
	move.b (a0)+,d1
    7052:	move.b (a0)+,d1
	lsl #4,d1
    7054:	lsl.w #4,d1
	move d1,(a5)+
    7056:	move.w d1,(a5)+
	move.b d7,(a5)+
    7058:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    705a:	move.l a0,7(a5)
	bra.b P61_permdko
    705e:	bra.s 709c <P61_permdko>

00007060 <P61_note2S>:
;;    ---  copyS, diff exit  ---
P61_note2S:
	moveq #7,d1
    7060:	moveq #7,d1
	and d0,d1
    7062:	and.w d0,d1
	lsl #8,d1
    7064:	lsl.w #8,d1
	move.b (a0)+,d1
    7066:	move.b (a0)+,d1
	lsl #4,d1
    7068:	lsl.w #4,d1
	move d1,(a5)+
    706a:	move.w d1,(a5)+
	move.b d7,(a5)+
    706c:	move.b d7,(a5)+
	bra.w P61_proccompS
    706e:	bra.w 6f40 <P61_proccompS>

00007072 <P61_all2S>:
P61_all2S:
	move.b d0,(a5)+
    7072:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7074:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    7076:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_proccompS
    7078:	bra.w 6f40 <P61_proccompS>

0000707c <P61_cmd2S>:
P61_cmd2S:
	moveq #$f,d1
    707c:	moveq #15,d1
	and d0,d1
    707e:	and.w d0,d1
	move d1,(a5)+
    7080:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7082:	move.b (a0)+,(a5)+
	bra.w P61_proccompS
    7084:	bra.w 6f40 <P61_proccompS>

00007088 <P61_noteS>:
;;    ---    ---
P61_noteS:
	moveq #7,d1
    7088:	moveq #7,d1
	and d0,d1
    708a:	and.w d0,d1
	lsl #8,d1
    708c:	lsl.w #8,d1
	move.b (a0)+,d1
    708e:	move.b (a0)+,d1
	lsl #4,d1
    7090:	lsl.w #4,d1
	move d1,(a5)+
    7092:	move.w d1,(a5)+
	move.b d7,(a5)+
    7094:	move.b d7,(a5)+

00007096 <P61_exS>:
;;    ---  norm (temp) exit  ---
;This exit is called when you have max rastertime.
P61_exS:
	move.b (a0)+,(a5)
    7096:	move.b (a0)+,(a5)

00007098 <P61_ex>:
P61_ex:
	move.l a0,P61_TempPos-3(a5)
    7098:	move.l a0,11(a5)

0000709c <P61_permdko>:
P61_permdko:
	move.w d6,P61_OnOff-3(a5)		;was byte size in word var...
    709c:	move.w d6,5(a5)
	move -3(a5),d0
    70a0:	move.w -3(a5),d0
	and #$1f0,d0
    70a4:	and.w #496,d0
	beq.b .koto
    70a8:	beq.s 70be <P61_koto>
	ifne P61_ft
	lea (a2,d0),a1			;this is not the same a2 as the fix.
	else
	lea (P61_samples-16)-P61_cn(a3),a1
    70aa:	lea 102(a3),a1
	add d0,a1
    70ae:	adda.w d0,a1
	endc
	move.l a1,P61_Sample-3(a5)
    70b0:	move.l a1,1(a5)
	ifne P61_ft
	move.l P61_SampleVolume(a1),P61_Volume-3(a5)
	else
	move P61_SampleVolume(a1),P61_Volume-3(a5)
    70b4:	move.w 12(a1),21(a5)
	endc
	ifne P61_il
	move.l P61_RepeatOffset(a1),P61_Wave-3(a5)
	endc
	ifne P61_sof
	move d7,P61_Offset-3(a5)
    70ba:	move.w d7,25(a5)

000070be <P61_koto>:
	endc
.koto:
P61_koto:
	ifeq split4			;split4 means only do once.
	lea Channel_Block_Size-3(a5),a5
    70be:	lea 61(a5),a5
	dbf d5,P61_loaps
    70c2:	dbf d5,6fbc <P61_loaps>

000070c6 <P61_ret2>:
	endc
P61_ret2:
	rts
    70c6:	rts

000070c8 <P61_playtime>:

********** END OF LOAPS LOOP **********
********** here comes another :) **********
	ifeq dupedec
P61_playtime:
	addq.w #1,(a3)	;inc framecount past _Speed for detection+reset later
    70c8:	addq.w #1,(a3)
	ifeq split4
	ifgt splitchans
	moveq #splitchans-1,d5		;channels split off?(optimization flag)
    70ca:	moveq #0,d5
	lea P61_temp0+Channel_Block_Size*(channels-splitchans)(PC),a5
    70cc:	lea 7432 <P61_temp3>(pc),a5
	bsr P61_preplay
    70d0:	bsr.w 6fb6 <P61_preplay>

000070d4 <P61_playtimeCont>:
.djdj:
	move d7,P61_pdflag-P61_cn(a3)
	endc

	ifne suppF01
	tst P61_speedis1-P61_cn(a3)
    70d4:	       tst.w 86(a3)
	beq.b .mo
    70d8:	/----- beq.s 70ec <P61_playtimeCont+0x18>

	lea P61_temp0(pc),a5
    70da:	|      lea 7372 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    70de:	|      moveq #3,d5
.chl:	bsr.w P61_preplay		;then do the remaining from prev frame
    70e0:	|  /-> bsr.w 6fb6 <P61_preplay>
	ifeq split4		;split4 means preplay is one-shot. So ext loop.
	lea Channel_Block_Size-3(a5),a5
    70e4:	|  |   lea 61(a5),a5
	dbf d5,.chl
    70e8:	|  \-- dbf d5,70e0 <P61_playtimeCont+0xc>
.mo:
	endc	;suppF01

	ifeq copdma&nowaveforms		;both must be off to skip int.
	ifeq p61system		;main 'new note' int starter.
	lea P61_dmason(pc),a1
    70ec:	\----> lea 72dc <P61_dmason>(pc),a1
	move.l P61_vektori(pc),a0
    70f0:	       movea.l 74ce <P61_vektori>(pc),a0
	move.l a1,(a0)
    70f4:	       move.l a1,(a0)
	move.b #$f0,$bfd600		;496 ticks=11.000677 scanlines,
    70f6:	       move.b #-16,bfd600 <_end+0xb73944>
	move.b #$01,$bfd700		;dmaoff $1.38 scanlines later on 68000.
    70fe:	       move.b #1,bfd700 <_end+0xb73a44>
	move.b #$19,$bfdf00		;With unlucky timing and max period 856
    7106:	       move.b #25,bfdf00 <_end+0xb74244>
	move.b #$f0,(a1)
	move.b #1,$100(a1)
	endc
	endc

	moveq #0,d4			;clr dmamask accumulator
    710e:	       moveq #0,d4
	moveq #channels-1,d5
    7110:	       moveq #3,d5
	lea P61_temp0(pc),a5
    7112:	       lea 7372 <P61_temp0>(pc),a5
	bra.w P61_loscont		;I'd trade a bra for 2 Leias any day!
    7116:	       bra.w 7142 <P61_loscont>
    711a:	       ori.b #28,(a4)+
    711e:	       ori.b #28,(a4)+
    7122:	       ori.b #28,(a4)+
    7126:	       ori.b #28,(a4)+
    712a:	       ori.b #-42,(a4)+
    712e:	       ori.b #28,(a4)+
    7132:	       btst d0,(28,a6,d0.w)
    7136:	       ori.b #64,(a4)+

0000713a <P61_jtab>:
	endc
.j:
P61_jtab:
;;    ---  end of table  ---
P61_los:
	lea Custom_Block_Size(a4),a4
    713a:	lea 16(a4),a4
	lea Channel_Block_Size(a5),a5
    713e:	lea 64(a5),a5

00007142 <P61_loscont>:
P61_loscont:
	move P61_OnOff(a5),d0		;$ff00/$ffff? if off, will goto nocha.
    7142:	move.w 8(a5),d0
	ifeq p61bigjtab
	tst.b d0
    7146:	tst.b d0
	beq.s P61_nocha
    7148:	beq.s 717c <P61_nocha>
	endc
	or (a5),d0
    714a:	or.w (a5),d0
	add d0,d0			;->$fe00..$fffe (if big jtab)
    714c:	add.w d0,d0
	move P61_jtab(PC,d0),d0
    714e:	move.w (713a <P61_jtab>,pc,d0.w),d0
	jmp P61_jtab(PC,d0)
    7152:	jmp (713a <P61_jtab>,pc,d0.w)

00007156 <P61_fxdone>:

P61_fxdone:				;this sets dma and paula values
	moveq #$7e,d0
    7156:	moveq #126,d0
	and.b (a5),d0
    7158:	and.b (a5),d0
	beq.b P61_nocha
    715a:	beq.s 717c <P61_nocha>
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    715c:	move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    7160:	move.w (2,a3,d0.w),22(a5)

00007166 <P61_zample>:
P61_zample:				;also direct target for finetune retrig
	ifne P61_sof
	tst P61_Offset(a5)
    7166:	tst.w 28(a5)
	bne.w P61_pek
    716a:	bne.w 7246 <P61_pek>
	endc
;;    ---  check DMA-mask for pan/echo samplestarts, modify it, mix.  ---
;	bsr P61_Synth		;synth/pan/echo cpu-mix routine. Not done yet.
;;   --- modify below code to not touch synth/pan/echo fixchans ---
	or P61_DMABit(a5),d4		;accumulate channels touched
    716e:	or.w 62(a5),d4
	move.l P61_Sample(a5),a1	;skipped if nocha
    7172:	movea.l 4(a5),a1
	ifeq oscillo
	move.l (a1)+,(a4)
    7176:	move.l (a1)+,(a4)
	move (a1),4(a4)
    7178:	move.w (a1),4(a4)

0000717c <P61_nocha>:
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo
P61_nocha:
	ifeq p61fade
	move.l P61_Period(a5),6(a4)
    717c:	move.l 22(a5),6(a4)

00007182 <P61_skip>:
	endc
P61_skip:
	ifne P61_il
	bsr.w P61_funk2
	endc
	DBF d5,P61_los
    7182:	dbf d5,713a <P61_jtab>

00007186 <P61_chansdone>:
	bpl.b .noch0
	move.w d7,$aa-C(A6)		;clear AUDxDAT
.noch0:
	endc

	move d4,$96-C(a6)	;DMAclear - changed to not be written 4 times
    7186:	       move.w d4,150(a6)

	ifne visuctrs
	lea P61_visuctr0+channels*2(PC),a0
    718a:	       lea 7704 <P61E>(pc),a0
	moveq #channels-1,d5
    718e:	       moveq #3,d5
.visul:	subq.w #2,a0
    7190:	/----> subq.w #2,a0
	btst d5,d4
    7192:	|      btst d5,d4
	beq.s .noctr0
    7194:	|  /-- beq.s 7198 <P61_chansdone+0x12>
	move.w d7,(a0)
    7196:	|  |   move.w d7,(a0)
.noctr0:
	dbf d5,.visul
    7198:	\--\-X dbf d5,7190 <P61_chansdone+0xa>

	ifne copdma
	move.l p61_DMApokeAddr(PC),a0
	move.b d4,(a0)		;only the low byte is poked, allowing other dma
	endc
	move.b d4,P61_dma+1-P61_cn(a3)
    719c:	       move.b d4,77(a3)
;;    ---  non-rolled over code  --- compatible with F01.
	ifne suppF01				;moved to here in P6110.
	ifne nowaveforms
	move.b d4,P61_NewDMA+1-P61_cn(a3)	;or set by fx
	endc
	move.w d7,(a3)				;clr p61_cn
    71a0:	       move.w d7,(a3)
	move d0,P61_CRow-P61_cn(a3)
	rts
P61_ohittaa:					;nextrow
	endc

	subq #1,P61_rowpos-P61_cn(a3)		;next pattern-step
    71a2:	       subq.w #1,78(a3)
	bpl.b P61_nonewpatt
    71a6:	       bpl.s 7204 <P61_nonewpatt>

000071a8 <P61_nextpattern>:

P61_nextpattern:
	ifne P61_pl
	move d7,P61_plflag-P61_cn(a3)
	endc
	move.l P61_patternbase(pc),a0
    71a8:	movea.l 76f0 <P61_patternbase>(pc),a0
	moveq #63,d0
    71ac:	moveq #63,d0
	move d0,P61_rowpos-P61_cn(a3)
    71ae:	move.w d0,78(a3)
	move d7,P61_CRow-P61_cn(a3)
    71b2:	move.w d7,-2656(a3)
	move.l P61_spos(pc),a1
    71b6:	movea.l 74ca <P61_spos>(pc),a1
	addq #1,P61_Pos-P61_cn(a3)
    71ba:	addq.w #1,-2660(a3)
	move.b (a1)+,d0
    71be:	move.b (a1)+,d0
	bpl.b P61_dk
    71c0:	bpl.s 71cc <P61_dk>
	move.l P61_possibase(pc),a1
    71c2:	movea.l 76ec <P61_possibase>(pc),a1
	move.b (a1)+,d0
    71c6:	move.b (a1)+,d0
	move d7,P61_Pos-P61_cn(a3)
    71c8:	move.w d7,-2660(a3)

000071cc <P61_dk>:
P61_dk:
	move.l a1,P61_spos-P61_cn(a3)
    71cc:	move.l a1,88(a3)
	move d0,P61_Patt-P61_cn(a3)
    71d0:	move.w d0,-2658(a3)
	lsl #3,d0
    71d4:	lsl.w #3,d0
	move.l P61_positionbase(pc),a1
    71d6:	movea.l 76e8 <P61_positionbase>(pc),a1
	add.l d0,a1
    71da:	adda.l d0,a1
	move.w (a1)+,d0			;no movem sign-extend... check.
    71dc:	move.w (a1)+,d0
	add.l a0,d0
    71de:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp0-P61_cn(a3)
    71e0:	move.l d0,-246(a3)
	moveq #0,d0			;actually faster than lea (a0,d0.l)
    71e4:	moveq #0,d0
	move.w (a1)+,d0			;for some reason this code doesn't 
    71e6:	move.w (a1)+,d0
	add.l a0,d0			;use 'ifgt channels-1' etc. Kept as is.
    71e8:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp1-P61_cn(a3)
    71ea:	move.l d0,-182(a3)
	moveq #0,d0
    71ee:	moveq #0,d0
	move.w (a1)+,d0
    71f0:	move.w (a1)+,d0
	add.l a0,d0
    71f2:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp2-P61_cn(a3)
    71f4:	move.l d0,-118(a3)
	moveq #0,d0
    71f8:	moveq #0,d0
	move.w (a1)+,d0
    71fa:	move.w (a1)+,d0
	add.l a0,d0
    71fc:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp3-P61_cn(a3)
    71fe:	move.l d0,-54(a3)
	rts
    7202:	rts

00007204 <P61_nonewpatt>:
P61_nonewpatt:
	moveq #63,d0
    7204:	moveq #63,d0
	sub P61_rowpos-P61_cn(a3),d0
    7206:	sub.w 78(a3),d0
	move d0,P61_CRow-P61_cn(a3)
    720a:	move.w d0,-2656(a3)
;;    ---  end of non-rolled over code  ---
	endc	;suppF01
	rts				;end of P61_playtime.
    720e:	rts

00007210 <P61_sampleoffse>:
	bra.w P61_nocha
	endc

	ifne P61_sof
P61_sampleoffse:
	moveq #0,d1
    7210:	    moveq #0,d1
	move #$ff00,d1
    7212:	    move.w #-256,d1
	and 2(a5),d1
    7216:	    and.w 2(a5),d1
	bne.b .deq
    721a:	/-- bne.s 7220 <P61_sampleoffse+0x10>
	move P61_LOffset(a5),d1
    721c:	|   move.w 30(a5),d1
.deq:
	move d1,P61_LOffset(a5)
    7220:	\-> move.w d1,30(a5)
	add d1,P61_Offset(a5)
    7224:	    add.w d1,28(a5)

	moveq #$7e,d0
    7228:	    moveq #126,d0
	and.b (a5),d0
    722a:	    and.b (a5),d0
	beq.w P61_nocha
    722c:	    beq.w 717c <P61_nocha>
	move P61_Offset(a5),d2
    7230:	    move.w 28(a5),d2
	add d1,P61_Offset(a5)
    7234:	    add.w d1,28(a5)
	move d2,d1
    7238:	    move.w d2,d1
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    723a:	    move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    723e:	    move.w (2,a3,d0.w),22(a5)
	bra.b P61_hup
    7244:	    bra.s 724c <P61_hup>

00007246 <P61_pek>:
P61_pek:
	moveq #0,d1
    7246:	moveq #0,d1
	move P61_Offset(a5),d1
    7248:	move.w 28(a5),d1

0000724c <P61_hup>:
P61_hup:
	or P61_DMABit(a5),d4			;don't write 4 times, please.
    724c:	or.w 62(a5),d4

	move.l P61_Sample(a5),a1
    7250:	movea.l 4(a5),a1
	move.l (a1)+,d0
    7254:	move.l (a1)+,d0
	add.l d1,d0
    7256:	add.l d1,d0
	move.l d0,(a4)
    7258:	move.l d0,(a4)
	lsr #1,d1
    725a:	lsr.w #1,d1
	move (a1),d6
    725c:	move.w (a1),d6
	sub d1,d6
    725e:	sub.w d1,d6
	bpl.b P61_offok
    7260:	bpl.s 7268 <P61_offok>
	move.l -4(a1),(a4)
    7262:	move.l -4(a1),(a4)
	moveq #1,d6
    7266:	moveq #1,d6

00007268 <P61_offok>:
P61_offok:
	move d6,4(a4)
    7268:	move.w d6,4(a4)
	lsl.l #3,d1
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo

	bra.w P61_nocha			;continues to where ints etc is handled
    726c:	bra.w 717c <P61_nocha>

00007270 <P61_volum>:
	endc

	ifne P61_vl
P61_volum:
	move.b P61_Info(a5),P61_Volume+1(a5)
    7270:	move.b 2(a5),25(a5)
	bra.w P61_fxdone
    7276:	bra.w 7156 <P61_fxdone>

0000727a <P61_cspeed>:
	st P61_pdflag-P61_cn(a3)
	bra.w P61_fxdone
	endc
	ifne P61_sd
P61_cspeed:
	moveq #0,d0
    727a:	moveq #0,d0
	move.b P61_Info(a5),d0
    727c:	move.b 2(a5),d0
	ifne p61cia
	tst P61_Tempo-P61_cn(a3)
    7280:	tst.w -2670(a3)
	beq.b P61_VBlank
    7284:	beq.s 728c <P61_VBlank>
	cmp.b #32,d0
    7286:	cmp.b #32,d0
	bhs.b P61_STempo
    728a:	bcc.s 72b4 <P61_STempo>

0000728c <P61_VBlank>:
	endc
P61_VBlank:
	cmp.b #1,d0
    728c:	cmp.b #1,d0
	beq.b P61_jkd
    7290:	beq.s 72a4 <P61_jkd>
	move.b d0,P61_speed+1-P61_cn(a3)
    7292:	move.b d0,83(a3)
	subq.b #1,d0
    7296:	subq.b #1,d0
	move.b d0,P61_speed2+1-P61_cn(a3)
    7298:	move.b d0,85(a3)
	move d7,P61_speedis1-P61_cn(a3)
    729c:	move.w d7,86(a3)
	bra.w P61_fxdone
    72a0:	bra.w 7156 <P61_fxdone>

000072a4 <P61_jkd>:
P61_jkd:
	move.b d0,P61_speed+1-P61_cn(a3)
    72a4:	move.b d0,83(a3)
	move.b d0,P61_speed2+1-P61_cn(a3)
    72a8:	move.b d0,85(a3)
	st P61_speedis1-P61_cn(a3)
    72ac:	st 86(a3)
	bra.w P61_fxdone
    72b0:	bra.w 7156 <P61_fxdone>

000072b4 <P61_STempo>:
	ifne p61cia
P61_STempo:
	move.l P61_timer(pc),d1
    72b4:	move.l 74e4 <P61_timer>(pc),d1
	divu d0,d1
    72b8:	divu.w d0,d1
	move d1,P61_thi2-P61_cn(a3)
    72ba:	move.w d1,112(a3)
	sub #$1f0*2,d1
    72be:	sub.w #992,d1
	move d1,P61_thi-P61_cn(a3)
    72c2:	move.w d1,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d1
    72c6:	move.w 112(a3),d1
	move.b d1,$bfd400
    72ca:	move.b d1,bfd400 <_end+0xb73744>
	lsr #8,d1
    72d0:	lsr.w #8,d1
	move.b d1,$bfd500
    72d2:	move.b d1,bfd500 <_end+0xb73844>
	endc
	bra P61_fxdone
    72d8:	bra.w 7156 <P61_fxdone>

000072dc <P61_dmason>:
********** timing interrupt entry point **********
;;    ---  first int, DMAs on again.  ---
	ifeq copdma
P61_dmason:
	ifeq p61system
	tst.b $bfdd00
    72dc:	tst.b bfdd00 <_end+0xb74044>
	move #$2000,$dff09c
    72e2:	move.w #8192,dff09c <_end+0xd753e0>
	move #$2000,$dff09c
    72ea:	move.w #8192,dff09c <_end+0xd753e0>

	ifeq nowaveforms
	move.b #$19,$bfdf00		;retrigger to chain replen int.
    72f2:	move.b #25,bfdf00 <_end+0xb74244>
	move.l a0,-(sp)
    72fa:	move.l a0,-(sp)
	move.l P61_vektori(pc),a0	;put another int in '$78.w'
    72fc:	movea.l 74ce <P61_vektori>(pc),a0
	move.l P61_intaddr(pc),(a0)
    7300:	move.l 76f4 <P61_intaddr>(pc),(a0)
	move.l (sp)+,a0
    7304:	movea.l (sp)+,a0
	endc

	move P61_dma(pc),$dff096	;on only. includes $8200.
    7306:	move.w 74be <P61_dma>(pc),dff096 <_end+0xd753da>
	nop
    730e:	nop
	rte
    7310:	rte

00007312 <P61_setrepeat>:
	endc				;ifeq copdma
;;    ---  second chained int, replen  ---
	ifeq nowaveforms
P61_setrepeat:
	ifeq p61system
	tst.b $bfdd00
    7312:	tst.b bfdd00 <_end+0xb74044>
	movem.l a0/a1,-(sp)
    7318:	movem.l a0-a1,-(sp)
	lea $dff0a0,a1
    731c:	lea dff0a0 <_end+0xd753e4>,a1
	move #$2000,-4(a1)
    7322:	move.w #8192,-4(a1)
	move #$2000,-4(a1)
    7328:	move.w #8192,-4(a1)
	else
	lea $dff0a0,a1
	endc

	move.l P61_Sample+P61_temp0(pc),a0
    732e:	movea.l 7376 <P61_temp0+0x4>(pc),a0
	addq.l #6,a0
    7332:	addq.l #6,a0
	move.l (a0)+,(a1)+
    7334:	move.l (a0)+,(a1)+
	move (a0),(a1)
    7336:	move.w (a0),(a1)
	ifgt channels-1
	move.l P61_Sample+P61_temp1(pc),a0
    7338:	movea.l 73b6 <P61_temp1+0x4>(pc),a0
	addq.l #6,a0
    733c:	addq.l #6,a0
	move.l (a0)+,12(a1)
    733e:	move.l (a0)+,12(a1)
	move (a0),16(a1)
    7342:	move.w (a0),16(a1)
	endc
	ifgt channels-2
	move.l P61_Sample+P61_temp2(pc),a0
    7346:	movea.l 73f6 <P61_temp2+0x4>(pc),a0
	addq.l #6,a0
    734a:	addq.l #6,a0
	move.l (a0)+,28(a1)
    734c:	move.l (a0)+,28(a1)
	move (a0),32(a1)
    7350:	move.w (a0),32(a1)
	endc
	ifgt channels-3
	move.l P61_Sample+P61_temp3(pc),a0
    7354:	movea.l 7436 <P61_temp3+0x4>(pc),a0
	addq.l #6,a0
    7358:	addq.l #6,a0
	move.l (a0)+,44(a1)
    735a:	move.l (a0)+,44(a1)
	move (a0),48(a1)
    735e:	move.w (a0),48(a1)
	endc
	bra P61_ohi
	endc
	ifeq p61system
	ifne p61cia
	move.l P61_vektori(pc),a0
    7362:	movea.l 74ce <P61_vektori>(pc),a0
	move.l P61_tintti(pc),(a0)
    7366:	move.l 74dc <P61_tintti>(pc),(a0)
	endc
	movem.l (sp)+,a0/a1
    736a:	movem.l (sp)+,a0-a1
	nop
    736e:	nop
	rte
    7370:	rte

00007372 <P61_temp0>:
	...
    73ae:	ori.b #1,d0

000073b2 <P61_temp1>:
	...
    73ee:	ori.b #2,d0

000073f2 <P61_temp2>:
	...
    742e:	ori.b #4,d0

00007432 <P61_temp3>:
	...
    746e:	ori.b #8,d0

00007472 <P61_cn>:
	...

00007474 <P61_periods>:
    7474:	bchg d1,(a0)+
    7476:	bchg d1,(a0)+
    7478:	btst d1,762(a0)
    747c:	.short 0x02d0
    747e:	andi.l #41943644,-(a6)
    7484:	.short 0x023a
    7486:	andi.b #-4,(a2)+
    748a:	bset d0,-(a0)
    748c:	bset d0,d5
    748e:	bclr d0,404(a4)
    7492:	.short 0x017d
    7494:	bchg d0,339(a0)
    7498:	bchg d0,d0
    749a:	btst d0,285(a6)
    749e:	movep.w 254(a5),d0
    74a2:	.short 0x00f0
    74a4:	.short 0x00e2
    74a6:	.short 0x00d6
    74a8:	.short 0x00ca
    74aa:	.short 0x00be
    74ac:	ori.l #11141280,(-105,a4,d0.w)
    74b4:	.short 0x008f
    74b6:	ori.l #8323192,d7
    74bc:	Address 0x74be is out of bounds.


000074be <P61_dma>:
    74be:	or.b d0,d1

000074c0 <P61_rowpos>:
	...

000074c2 <P61_slen>:
	...

000074c4 <P61_speed>:
	...

000074c6 <P61_speed2>:
	...

000074c8 <P61_speedis1>:
	...

000074ca <P61_spos>:
    74ca:	ori.b #0,d0

000074ce <P61_vektori>:
    74ce:	ori.b #0,d0

000074d2 <P61_oldlev6>:
    74d2:	ori.b #0,d0

000074d6 <P61_ofilter>:
	...

000074d8 <P61_timers>:
    74d8:	ori.b #0,d0

000074dc <P61_tintti>:
    74dc:	ori.b #0,d0

000074e0 <P61_thi>:
	...

000074e1 <P61_tlo>:
	...

000074e2 <P61_thi2>:
	...

000074e3 <P61_tlo2>:
	...

000074e4 <P61_timer>:
    74e4:	ori.b #0,d0

000074e8 <P61_samples>:
	...

000076d8 <P61_emptysample>:
	...

000076e8 <P61_positionbase>:
    76e8:	ori.b #0,d0

000076ec <P61_possibase>:
    76ec:	ori.b #0,d0

000076f0 <P61_patternbase>:
    76f0:	ori.b #0,d0

000076f4 <P61_intaddr>:
    76f4:	ori.b #0,d0

000076f8 <P61_InitPos>:
	...

000076fa <P61_PattFlag>:
	...

000076fc <P61_etu>:
    76fc:	negx.b d0

000076fe <P61_visuctr1>:
    76fe:	negx.b d0

00007700 <P61_visuctr2>:
    7700:	negx.b d0

00007702 <P61_visuctr3>:
    7702:	negx.b d0
