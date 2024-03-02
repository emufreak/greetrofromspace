
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
       4:	       move.l #253952,d3
       a:	       subi.l #253952,d3
      10:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      12:	       move.l #253952,d0
      18:	       cmpi.l #253952,d0
      1e:	/----- beq.s 32 <_start+0x32>
      20:	|      lea 3e000 <debugpal>,a2
      26:	|      moveq #0,d2
		__preinit_array_start[i]();
      28:	|  /-> movea.l (a2)+,a0
      2a:	|  |   jsr (a0)
	for (i = 0; i < count; i++)
      2c:	|  |   addq.l #1,d2
      2e:	|  |   cmp.l d3,d2
      30:	|  \-- bcs.s 28 <_start+0x28>

	count = __init_array_end - __init_array_start;
      32:	\----> move.l #253952,d3
      38:	       subi.l #253952,d3
      3e:	       asr.l #2,d3
	for (i = 0; i < count; i++)
      40:	       move.l #253952,d0
      46:	       cmpi.l #253952,d0
      4c:	/----- beq.s 60 <_start+0x60>
      4e:	|      lea 3e000 <debugpal>,a2
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
      70:	                                                                      move.l a6,752e0 <SysBase>
	custom = (struct Custom*)0xdff000;
      76:	                                                                      move.l #14675968,752dc <custom>

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      80:	                                                                      lea 37070 <incbin_MercuryLetterData2Lz4_end+0x24e>,a1
      86:	                                                                      moveq #0,d0
      88:	                                                                      jsr -552(a6)
      8c:	                                                                      move.l d0,752d8 <GfxBase>
	if (!GfxBase)
      92:	               /----------------------------------------------------- beq.w 9a6 <main+0x940>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      96:	               |                                                      movea.l 752e0 <SysBase>,a6
      9c:	               |                                                      lea 37081 <incbin_MercuryLetterData2Lz4_end+0x25f>,a1
      a2:	               |                                                      moveq #0,d0
      a4:	               |                                                      jsr -552(a6)
      a8:	               |                                                      move.l d0,752d4 <DOSBase>
	if (!DOSBase)
      ae:	         /-----|----------------------------------------------------- beq.w 8e6 <main+0x880>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
      b2:	         |  /--|----------------------------------------------------> pea 3708d <incbin_MercuryLetterData2Lz4_end+0x26b>
      b8:	         |  |  |                                                      lea 28f2 <KPrintF>,a4
      be:	         |  |  |                                                      jsr (a4)
#endif
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
      c0:	         |  |  |                                                      movea.l 752d4 <DOSBase>,a6
      c6:	         |  |  |                                                      jsr -60(a6)
      ca:	         |  |  |                                                      movea.l 752d4 <DOSBase>,a6
      d0:	         |  |  |                                                      move.l d0,d1
      d2:	         |  |  |                                                      move.l #225449,d2
      d8:	         |  |  |                                                      moveq #20,d3
      da:	         |  |  |                                                      jsr -48(a6)
	Delay(50);
      de:	         |  |  |                                                      movea.l 752d4 <DOSBase>,a6
      e4:	         |  |  |                                                      moveq #50,d1
      e6:	         |  |  |                                                      jsr -198(a6)

	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);
	Sw_LoadResources();
      ea:	         |  |  |                                                      jsr 144c <Sw_LoadResources>
	Forbid();	
      f0:	         |  |  |                                                      movea.l 752e0 <SysBase>,a6
      f6:	         |  |  |                                                      jsr -132(a6)
	SystemADKCON=custom->adkconr;
      fa:	         |  |  |                                                      movea.l 752dc <custom>,a0
     100:	         |  |  |                                                      move.w 16(a0),d0
	SystemInts=custom->intenar;
     104:	         |  |  |                                                      move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     108:	         |  |  |                                                      move.w 2(a0),d0
	LoadView(0);
     10c:	         |  |  |                                                      movea.l 752d8 <GfxBase>,a6
     112:	         |  |  |                                                      suba.l a1,a1
     114:	         |  |  |                                                      jsr -222(a6)
	WaitTOF();
     118:	         |  |  |                                                      movea.l 752d8 <GfxBase>,a6
     11e:	         |  |  |                                                      jsr -270(a6)
	WaitTOF();
     122:	         |  |  |                                                      movea.l 752d8 <GfxBase>,a6
     128:	         |  |  |                                                      jsr -270(a6)
	WaitVbl();
     12c:	         |  |  |                                                      lea c6a <WaitVbl>,a3
     132:	         |  |  |                                                      jsr (a3)
	WaitVbl();
     134:	         |  |  |                                                      jsr (a3)
	OwnBlitter();
     136:	         |  |  |                                                      movea.l 752d8 <GfxBase>,a6
     13c:	         |  |  |                                                      jsr -456(a6)
	WaitBlit();	
     140:	         |  |  |                                                      movea.l 752d8 <GfxBase>,a6
     146:	         |  |  |                                                      jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     14a:	         |  |  |                                                      movea.l 752dc <custom>,a0
     150:	         |  |  |                                                      move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     156:	         |  |  |                                                      move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     15c:	         |  |  |                                                      move.w #16383,150(a0)
     162:	         |  |  |                                                      addq.l #4,sp
	for(int a=0;a<32;a++)
     164:	         |  |  |                                                      moveq #0,d1
		custom->color[a]=0;
     166:	         |  |  |  /-------------------------------------------------> move.l d1,d0
     168:	         |  |  |  |                                                   addi.l #192,d0
     16e:	         |  |  |  |                                                   add.l d0,d0
     170:	         |  |  |  |                                                   move.w #0,(0,a0,d0.l)
	for(int a=0;a<32;a++)
     176:	         |  |  |  |                                                   addq.l #1,d1
     178:	         |  |  |  |                                                   moveq #32,d0
     17a:	         |  |  |  |                                                   cmp.l d1,d0
     17c:	         |  |  |  +-------------------------------------------------- bne.s 166 <main+0x100>
	WaitVbl();
     17e:	         |  |  |  |                                                   jsr (a3)
	WaitVbl();
     180:	         |  |  |  |                                                   jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     182:	         |  |  |  |                                                   move.w #20090,46(sp)
     188:	         |  |  |  |                                                   move.w #2049,48(sp)
     18e:	         |  |  |  |                                                   move.w #20083,50(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     194:	         |  |  |  |                                                   movea.l 752e0 <SysBase>,a6
     19a:	         |  |  |  |                                                   btst #0,297(a6)
     1a0:	/--------|--|--|--|-------------------------------------------------- beq.w c04 <main+0xb9e>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     1a4:	|        |  |  |  |                                                   moveq #46,d7
     1a6:	|        |  |  |  |                                                   add.l sp,d7
     1a8:	|        |  |  |  |                                                   exg d7,a5
     1aa:	|        |  |  |  |                                                   jsr -30(a6)
     1ae:	|        |  |  |  |                                                   exg d7,a5
	VBR=GetVBR();
     1b0:	|        |  |  |  |                                                   move.l d0,751ba <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     1b6:	|        |  |  |  |                                                   movea.l 751ba <VBR>,a0
     1bc:	|        |  |  |  |                                                   move.l 108(a0),d0
		register volatile const void* _a0 ASM("a0") = module;
     1c0:	|        |  |  |  |                                                   lea 5f4e4 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     1c6:	|        |  |  |  |                                                   suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     1c8:	|        |  |  |  |                                                   suba.l a2,a2
		__asm volatile (
     1ca:	|        |  |  |  |                                                   movem.l d1-d7/a3-a6,-(sp)
     1ce:	|        |  |  |  |                                                   jsr 6e00 <_P61_Init>
     1d4:	|        |  |  |  |                                                   movem.l (sp)+,d1-d7/a3-a6

	TakeSystem();

	#ifdef MUSIC
	if(p61Init(module) != 0)
     1d8:	|        |  |  |  |                                                   tst.l d0
     1da:	|  /-----|--|--|--|-------------------------------------------------- bne.w 8a2 <main+0x83c>
		KPrintF("p61Init failed!\n");
	#endif
	WaitVbl();
     1de:	|  |  /--|--|--|--|-------------------------------------------------> jsr (a3)

	custom->intena=0xf020;//Enable vblank
     1e0:	|  |  |  |  |  |  |                                                   movea.l 752dc <custom>,a0
     1e6:	|  |  |  |  |  |  |                                                   move.w #-4064,154(a0)
	custom->dmacon = 0x83f0;	
     1ec:	|  |  |  |  |  |  |                                                   move.w #-31760,150(a0)
	Sw_PrepareDisplay();
     1f2:	|  |  |  |  |  |  |                                                   jsr 505a <Sw_PrepareDisplay.isra.0>
	custom->intena=0xe020;//Enable vblank
     1f8:	|  |  |  |  |  |  |                                                   movea.l 752dc <custom>,a0
     1fe:	|  |  |  |  |  |  |                                                   move.w #-8160,154(a0)

	while(SwScrollerFinished == 0) {
     204:	|  |  |  |  |  |  |                                                   lea d04 <Sw_Run>,a2
     20a:	|  |  |  |  |  |  |                                                   tst.w 752d2 <SwScrollerFinished>
     210:	|  |  |  |  |  |  |  /----------------------------------------------- bne.s 21c <main+0x1b6>
		Sw_Run();
     212:	|  |  |  |  |  |  |  |  /-------------------------------------------> jsr (a2)
	while(SwScrollerFinished == 0) {
     214:	|  |  |  |  |  |  |  |  |                                             tst.w 752d2 <SwScrollerFinished>
     21a:	|  |  |  |  |  |  |  |  +-------------------------------------------- beq.s 212 <main+0x1ac>
	}
	Sw_ClearColors();
     21c:	|  |  |  |  |  |  |  >--|-------------------------------------------> jsr 17ca <Sw_ClearColors>

  return 0;
}

void Sw_Cleanup() {
  FreeMem( Sw_ScreenBuffer1, BPLSIZE*BPLDEPTH);
     222:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     228:	|  |  |  |  |  |  |  |  |                                             movea.l 751da <Sw_ScreenBuffer1>,a1
     22e:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     234:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ScreenBuffer2, BPLSIZE*BPLDEPTH);
     238:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     23e:	|  |  |  |  |  |  |  |  |                                             movea.l 751d6 <Sw_ScreenBuffer2>,a1
     244:	|  |  |  |  |  |  |  |  |                                             move.l #20560,d0
     24a:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_FontBuffer,  80*50);
     24e:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     254:	|  |  |  |  |  |  |  |  |                                             movea.l 751d2 <Sw_FontBuffer>,a1
     25a:	|  |  |  |  |  |  |  |  |                                             move.l #4000,d0
     260:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_font, 38000);
     264:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     26a:	|  |  |  |  |  |  |  |  |                                             movea.l 751ce <Sw_font>,a1
     270:	|  |  |  |  |  |  |  |  |                                             move.l #38000,d0
     276:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_XMaskLeft, 10240);
     27a:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     280:	|  |  |  |  |  |  |  |  |                                             movea.l 751ca <Sw_XMaskLeft>,a1
     286:	|  |  |  |  |  |  |  |  |                                             move.l #10240,d0
     28c:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_XMaskRight, 10240);  
     290:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     296:	|  |  |  |  |  |  |  |  |                                             movea.l 751c6 <Sw_XMaskRight>,a1
     29c:	|  |  |  |  |  |  |  |  |                                             move.l #10240,d0
     2a2:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)
  FreeMem( Sw_ClColorDim, 22644);  
     2a6:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     2ac:	|  |  |  |  |  |  |  |  |                                             movea.l 751c2 <Sw_ClColorDim>,a1
     2b2:	|  |  |  |  |  |  |  |  |                                             move.l #22644,d0
     2b8:	|  |  |  |  |  |  |  |  |                                             jsr -210(a6)

  RemIntServer( INTB_COPER, Sw_Vbint);
     2bc:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     2c2:	|  |  |  |  |  |  |  |  |                                             moveq #4,d0
     2c4:	|  |  |  |  |  |  |  |  |                                             movea.l 751be <Sw_Vbint>,a1
     2ca:	|  |  |  |  |  |  |  |  |                                             jsr -174(a6)
	Sw_Cleanup();

	WaitBlit();
     2ce:	|  |  |  |  |  |  |  |  |                                             movea.l 752d8 <GfxBase>,a6
     2d4:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
		
	custom->dmacon = 0x82f0;
     2d8:	|  |  |  |  |  |  |  |  |                                             movea.l 752dc <custom>,a0
     2de:	|  |  |  |  |  |  |  |  |                                             move.w #-32016,150(a0)
	custom->dmacon = 0x0100;
     2e4:	|  |  |  |  |  |  |  |  |                                             move.w #256,150(a0)
}


int PrepareDisplay() {

  if ((Vbint = AllocMem(sizeof(struct Interrupt),    
     2ea:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     2f0:	|  |  |  |  |  |  |  |  |                                             moveq #22,d0
     2f2:	|  |  |  |  |  |  |  |  |                                             move.l #65537,d1
     2f8:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     2fc:	|  |  |  |  |  |  |  |  |                                             movea.l d0,a1
     2fe:	|  |  |  |  |  |  |  |  |                                             move.l d0,752aa <Vbint>
     304:	|  |  |  |  |  |  |  |  |                                         /-- beq.s 320 <main+0x2ba>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Vbint->is_Node.ln_Type = NT_INTERRUPT;       
     306:	|  |  |  |  |  |  |  |  |                                         |   move.w #708,8(a1)
    Vbint->is_Node.ln_Pri = -60;
    Vbint->is_Node.ln_Name = "VertB-Example";
     30c:	|  |  |  |  |  |  |  |  |                                         |   move.l #225278,10(a1)
    Vbint->is_Data = NULL;
     314:	|  |  |  |  |  |  |  |  |                                         |   clr.l 14(a1)
    Vbint->is_Code = VblankHandler;
     318:	|  |  |  |  |  |  |  |  |                                         |   move.l #3248,18(a1)
  }

  AddIntServer( INTB_VERTB, Vbint); 
     320:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 752e0 <SysBase>,a6
     326:	|  |  |  |  |  |  |  |  |                                             moveq #5,d0
     328:	|  |  |  |  |  |  |  |  |                                             jsr -168(a6)

  WorkingMem =  AllocMem( 25000, MEMF_ANY);
     32c:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     332:	|  |  |  |  |  |  |  |  |                                             move.l #25000,d0
     338:	|  |  |  |  |  |  |  |  |                                             moveq #0,d1
     33a:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     33e:	|  |  |  |  |  |  |  |  |                                             move.l d0,752ca <WorkingMem>

  LineBuffer = AllocMem( 12*100*100, MEMF_CHIP);
     344:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     34a:	|  |  |  |  |  |  |  |  |                                             move.l #120000,d0
     350:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     352:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     356:	|  |  |  |  |  |  |  |  |                                             move.l d0,752c6 <LineBuffer>
  Utils_FillLong( (ULONG *) LineBuffer, 0x0, 100*100, 12/4, 0);
     35c:	|  |  |  |  |  |  |  |  |                                             pea 3 <_start+0x3>
     360:	|  |  |  |  |  |  |  |  |                                             pea 2710 <Clbuild+0x21a>
     364:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     366:	|  |  |  |  |  |  |  |  |                                             lea cd0 <Utils_FillLong.constprop.0>,a2
     36c:	|  |  |  |  |  |  |  |  |                                             jsr (a2)
  custom->bltsize = lines*64+linelength;
}

void Utils_BlitterPrepare() {
  volatile struct Custom *custom = (struct Custom*)0xdff000;
  WaitBlit();
     36e:	|  |  |  |  |  |  |  |  |                                             movea.l 752d8 <GfxBase>,a6
     374:	|  |  |  |  |  |  |  |  |                                             jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
     378:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff044 <_end+0xd89d60>
  custom->bltalwm = 0xffff; //Static
     380:	|  |  |  |  |  |  |  |  |                                             move.w #-1,dff046 <_end+0xd89d62>
  Utils_BlitterPrepare();
  PrepareLineBuffer( LineBuffer);
     388:	|  |  |  |  |  |  |  |  |                                             move.l 752c6 <LineBuffer>,d5
  for( WORD i=0;i <=5;i++) {
     38e:	|  |  |  |  |  |  |  |  |                                             movea.l d5,a1
     390:	|  |  |  |  |  |  |  |  |                                             lea 12(sp),sp
  PrepareLineBuffer( LineBuffer);
     394:	|  |  |  |  |  |  |  |  |                                             moveq #0,d6
  for( WORD i=0;i <=5;i++) {
     396:	|  |  |  |  |  |  |  |  |                                             clr.w d4
      data = data >> i2;
     398:	|  |  |  |  |  |  |  |  |                                             moveq #0,d3
     39a:	|  |  |  |  |  |  |  |  |                                             not.w d3
	APTR vbr = 0;
     39c:	|  |  |  |  |  |  |  |  |                                             movea.l a1,a0
     39e:	|  |  |  |  |  |  |  |  |                                             moveq #1,d1
     3a0:	|  |  |  |  |  |  |  |  |                                   /-------> move.l d3,d2
     3a2:	|  |  |  |  |  |  |  |  |                                   |         asr.l d1,d2
      data = data ^ 0xffff;
     3a4:	|  |  |  |  |  |  |  |  |                                   |         not.w d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     3a6:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     3ac:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd89d1e>,d0
     3b2:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     3b6:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 3ac <main+0x346>
  custom->bltcon0 = 0x01f0;
     3b8:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0;
     3c0:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd89d5e>
  custom->bltadat = data;
     3c8:	|  |  |  |  |  |  |  |  |                                   |         move.w d2,dff074 <_end+0xd89d90>
  custom->bltdpt = Target;  
     3ce:	|  |  |  |  |  |  |  |  |                                   |         move.l a0,dff054 <_end+0xd89d70>
  custom->bltdmod = mod;
     3d4:	|  |  |  |  |  |  |  |  |                                   |         move.w #10,dff066 <_end+0xd89d82>
  custom->bltsize = lines*64+linelength;
     3dc:	|  |  |  |  |  |  |  |  |                                   |         move.w #6401,dff058 <_end+0xd89d74>
    for( WORD i2=1;i2<=16; i2++) {        
     3e4:	|  |  |  |  |  |  |  |  |                                   |         addq.l #1,d1
     3e6:	|  |  |  |  |  |  |  |  |                                   |         lea 1200(a0),a0
     3ea:	|  |  |  |  |  |  |  |  |                                   |         moveq #17,d0
     3ec:	|  |  |  |  |  |  |  |  |                                   |         cmp.l d1,d0
     3ee:	|  |  |  |  |  |  |  |  |                                   +-------- bne.s 3a0 <main+0x33a>
    if( i > 0) {
     3f0:	|  |  |  |  |  |  |  |  |                                   |         tst.w d4
     3f2:	|  |  |  |  |  |  |  |  |                                   |     /-- bne.s 408 <main+0x3a2>
    startbuffer += repeats*linesize*2*16;
     3f4:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     3fa:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     3fe:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     400:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d4
     402:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     404:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     406:	|  |  |  |  |  |  |  |  |                                   +-----|-- bra.s 3a0 <main+0x33a>
        Utils_BlitClear( startbuffer+extraoffset, 512, i, linesize*2-2*i, 0xffff);        
     408:	|  |  |  |  |  |  |  |  |                                   |     \-> moveq #12,d0
     40a:	|  |  |  |  |  |  |  |  |                                   |         sub.w d6,d0
     40c:	|  |  |  |  |  |  |  |  |                                   |         movea.w d0,a0
     40e:	|  |  |  |  |  |  |  |  |                                   |         movea.w d4,a5
     410:	|  |  |  |  |  |  |  |  |                                   |         lea -32768(a5),a5
     414:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d1
     416:	|  |  |  |  |  |  |  |  |                                   |         move.l d5,d2
     418:	|  |  |  |  |  |  |  |  |                                   |         addi.l #18432,d2
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     41e:	|  |  |  |  |  |  |  |  |                                   |  /----> move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     424:	|  |  |  |  |  |  |  |  |                                   |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
     42a:	|  |  |  |  |  |  |  |  |                                   |  |  |   btst #14,d0
     42e:	|  |  |  |  |  |  |  |  |                                   |  |  \-- bne.s 424 <main+0x3be>
  custom->bltcon0 = 0x01f0;
     430:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #496,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0;
     438:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #0,dff042 <_end+0xd89d5e>
  custom->bltadat = data;
     440:	|  |  |  |  |  |  |  |  |                                   |  |      move.w #-1,dff074 <_end+0xd89d90>
  custom->bltdpt = Target;  
     448:	|  |  |  |  |  |  |  |  |                                   |  |      move.l d1,dff054 <_end+0xd89d70>
  custom->bltdmod = mod;
     44e:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a0,dff066 <_end+0xd89d82>
  custom->bltsize = lines*64+linelength;
     454:	|  |  |  |  |  |  |  |  |                                   |  |      move.w a5,dff058 <_end+0xd89d74>
      while( height > 512) {
     45a:	|  |  |  |  |  |  |  |  |                                   |  |      addi.l #6144,d1
     460:	|  |  |  |  |  |  |  |  |                                   |  |      cmp.l d2,d1
     462:	|  |  |  |  |  |  |  |  |                                   |  \----- bne.s 41e <main+0x3b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
     464:	|  |  |  |  |  |  |  |  |                                   |         move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
     46a:	|  |  |  |  |  |  |  |  |                                   |     /-> move.w dff002 <_end+0xd89d1e>,d0
     470:	|  |  |  |  |  |  |  |  |                                   |     |   btst #14,d0
     474:	|  |  |  |  |  |  |  |  |                                   |     \-- bne.s 46a <main+0x404>
  custom->bltcon0 = 0x01f0;
     476:	|  |  |  |  |  |  |  |  |                                   |         move.w #496,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0;
     47e:	|  |  |  |  |  |  |  |  |                                   |         move.w #0,dff042 <_end+0xd89d5e>
  custom->bltadat = data;
     486:	|  |  |  |  |  |  |  |  |                                   |         move.w #-1,dff074 <_end+0xd89d90>
  custom->bltdpt = Target;  
     48e:	|  |  |  |  |  |  |  |  |                                   |         move.l d1,dff054 <_end+0xd89d70>
  custom->bltdmod = mod;
     494:	|  |  |  |  |  |  |  |  |                                   |         move.w a0,dff066 <_end+0xd89d82>
  custom->bltsize = lines*64+linelength;
     49a:	|  |  |  |  |  |  |  |  |                                   |         move.w d4,d0
     49c:	|  |  |  |  |  |  |  |  |                                   |         addi.w #4096,d0
     4a0:	|  |  |  |  |  |  |  |  |                                   |         move.w d0,dff058 <_end+0xd89d74>
  for( WORD i=0;i <=5;i++) {
     4a6:	|  |  |  |  |  |  |  |  |                                   |         addi.w #-4095,d0
     4aa:	|  |  |  |  |  |  |  |  |                                   |         cmpi.w #5,d4
     4ae:	|  |  |  |  |  |  |  |  |                                   |     /-- beq.s 4c6 <main+0x460>
    startbuffer += repeats*linesize*2*16;
     4b0:	|  |  |  |  |  |  |  |  |                                   |     |   addi.l #19200,d5
  for( WORD i=0;i <=5;i++) {
     4b6:	|  |  |  |  |  |  |  |  |                                   |     |   move.w d0,d4
     4b8:	|  |  |  |  |  |  |  |  |                                   |     |   lea 19202(a1),a1
     4bc:	|  |  |  |  |  |  |  |  |                                   |     |   addq.l #2,d6
     4be:	|  |  |  |  |  |  |  |  |                                   |     |   movea.l a1,a0
     4c0:	|  |  |  |  |  |  |  |  |                                   |     |   moveq #1,d1
     4c2:	|  |  |  |  |  |  |  |  |                                   \-----|-- bra.w 3a0 <main+0x33a>

  PrepareBuffer = AllocMem( 64*(BPLHEIGHT+2)*2, MEMF_CHIP);  
     4c6:	|  |  |  |  |  |  |  |  |                                         \-> movea.l 752e0 <SysBase>,a6
     4cc:	|  |  |  |  |  |  |  |  |                                             move.l #33024,d0
     4d2:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     4d4:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     4d8:	|  |  |  |  |  |  |  |  |                                             move.l d0,d2
     4da:	|  |  |  |  |  |  |  |  |                                             move.l d0,752c2 <PrepareBuffer>
  Utils_FillLong( (ULONG *) PrepareBuffer, 0x0, (BPLHEIGHT+2)*2, 64/4, 0);
     4e0:	|  |  |  |  |  |  |  |  |                                             pea 10 <_start+0x10>
     4e4:	|  |  |  |  |  |  |  |  |                                             pea 204 <main+0x19e>
     4e8:	|  |  |  |  |  |  |  |  |                                             move.l d0,-(sp)
     4ea:	|  |  |  |  |  |  |  |  |                                             jsr (a2)
  debug_register_bitmap( PrepareBuffer, "prepare.bpl", 512, 256, 2, 0); 
     4ec:	|  |  |  |  |  |  |  |  |                                             pea 2 <_start+0x2>
     4f0:	|  |  |  |  |  |  |  |  |                                             pea 100 <main+0x9a>
     4f4:	|  |  |  |  |  |  |  |  |                                             pea 370d0 <incbin_MercuryLetterData2Lz4_end+0x2ae>
     4fa:	|  |  |  |  |  |  |  |  |                                             move.l d2,-(sp)
     4fc:	|  |  |  |  |  |  |  |  |                                             lea 47dc <debug_register_bitmap.constprop.0>,a5
     502:	|  |  |  |  |  |  |  |  |                                             jsr (a5)

  Bitmap1 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     504:	|  |  |  |  |  |  |  |  |                                             movea.l 752e0 <SysBase>,a6
     50a:	|  |  |  |  |  |  |  |  |                                             move.l #49536,d0
     510:	|  |  |  |  |  |  |  |  |                                             moveq #2,d1
     512:	|  |  |  |  |  |  |  |  |                                             jsr -198(a6)
     516:	|  |  |  |  |  |  |  |  |                                             move.l d0,752be <Bitmap1>
  if(Bitmap1 == 0) {
     51c:	|  |  |  |  |  |  |  |  |                                             lea 28(sp),sp
     520:	|  |  |  |  |  |  |  |  |        /----------------------------------- beq.w b7a <main+0xb14>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
    Exit(1);
  }  
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     524:	|  |  |  |  |  |  |  |  |        |                                    pea 3 <_start+0x3>
     528:	|  |  |  |  |  |  |  |  |        |                                    pea 100 <main+0x9a>
     52c:	|  |  |  |  |  |  |  |  |        |                                    pea 37101 <incbin_MercuryLetterData2Lz4_end+0x2df>
     532:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,-(sp)
     534:	|  |  |  |  |  |  |  |  |        |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     536:	|  |  |  |  |  |  |  |  |        |                                    move.l 752be <Bitmap1>,d2
     53c:	|  |  |  |  |  |  |  |  |        |                                    pea 10 <_start+0x10>
     540:	|  |  |  |  |  |  |  |  |        |                                    pea 306 <main+0x2a0>
     544:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,-(sp)
     546:	|  |  |  |  |  |  |  |  |        |                                    jsr (a2)

  ScreenBuffer1.BitPlane = Bitmap1;
     548:	|  |  |  |  |  |  |  |  |        |                                    move.l d2,75272 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     54e:	|  |  |  |  |  |  |  |  |        |                                    clr.l 75276 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     554:	|  |  |  |  |  |  |  |  |        |                                    clr.l 75282 <ScreenBuffer1+0x10>

  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     55a:	|  |  |  |  |  |  |  |  |        |                                    movea.l 752e0 <SysBase>,a6
     560:	|  |  |  |  |  |  |  |  |        |                                    move.l #49536,d0
     566:	|  |  |  |  |  |  |  |  |        |                                    moveq #2,d1
     568:	|  |  |  |  |  |  |  |  |        |                                    jsr -198(a6)
     56c:	|  |  |  |  |  |  |  |  |        |                                    move.l d0,752ba <Bitmap2>
  if(Bitmap2 == 0) {
     572:	|  |  |  |  |  |  |  |  |        |                                    lea 28(sp),sp
     576:	|  |  |  |  |  |  |  |  |  /-----|----------------------------------- beq.w af0 <main+0xa8a>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     57a:	|  |  |  |  |  |  |  |  |  |  /--|----------------------------------> pea 3 <_start+0x3>
     57e:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 100 <main+0x9a>
     582:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 37132 <incbin_MercuryLetterData2Lz4_end+0x310>
     588:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,-(sp)
     58a:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     58c:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l 752ba <Bitmap2>,d2
     592:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 10 <_start+0x10>
     596:	|  |  |  |  |  |  |  |  |  |  |  |                                    pea 306 <main+0x2a0>
     59a:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,-(sp)
     59c:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr (a2)

  ScreenBuffer2.BitPlane = Bitmap2;
     59e:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d2,7523a <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     5a4:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 7523e <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     5aa:	|  |  |  |  |  |  |  |  |  |  |  |                                    clr.l 7524a <ScreenBuffer2+0x10>

  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     5b0:	|  |  |  |  |  |  |  |  |  |  |  |                                    movea.l 752e0 <SysBase>,a6
     5b6:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l #49536,d0
     5bc:	|  |  |  |  |  |  |  |  |  |  |  |                                    moveq #2,d1
     5be:	|  |  |  |  |  |  |  |  |  |  |  |                                    jsr -198(a6)
     5c2:	|  |  |  |  |  |  |  |  |  |  |  |                                    move.l d0,752b6 <Bitmap3>
  if(Bitmap3 == 0) {
     5c8:	|  |  |  |  |  |  |  |  |  |  |  |                                    lea 28(sp),sp
     5cc:	|  |  |  |  |  |  |  |  |  |  |  |  /-------------------------------- beq.w 9d2 <main+0x96c>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
    Exit(1);
  }
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     5d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------------> pea 3 <_start+0x3>
     5d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 100 <main+0x9a>
     5d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 37163 <incbin_MercuryLetterData2Lz4_end+0x341>
     5de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,-(sp)
     5e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     5e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l 752b6 <Bitmap3>,d2
     5e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 10 <_start+0x10>
     5ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              pea 306 <main+0x2a0>
     5f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,-(sp)
     5f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)

  ScreenBuffer3.BitPlane = Bitmap3;
     5f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 75202 <ScreenBuffer3>,a2
     5fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,(a2)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     5fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 75206 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     602:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              clr.l 75212 <ScreenBuffer3+0x10>

  ViewCopper = Clbuild( );
     608:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 24f6 <Clbuild>,a5
     60e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     610:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d2
  DrawCopper = Clbuild( );
     612:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a5)
     614:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,d3
     616:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d0,752b2 <DrawCopper>

  ScreenBufferList[0] = &ScreenBuffer1;
     61c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479858,751de <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     626:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479802,751e2 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     630:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a2,751e6 <ScreenBufferList+0x8>

  ScreenBufferList[3] = &ScreenBuffer3;
     636:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a2,751ea <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     63c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479858,751ee <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     646:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479802,751f2 <ScreenBufferList+0x14>

  ScreenBufferList[6] = &ScreenBuffer2;
     650:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479802,751f6 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     65a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l a2,751fa <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     660:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l #479858,751fe <ScreenBufferList+0x20>

  SetBplPointers(); 
     66a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 2856 <SetBplPointers>,a2
     670:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)
void SwapCl() 
{

  volatile struct Custom *custom = (struct Custom*)0xdff000;
  UBYTE *tmp = DrawCopper;
  DrawCopper = ViewCopper;
     672:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,752b2 <DrawCopper>
  ViewCopper = tmp;
  custom->cop1lc = (ULONG) ViewCopper;
     678:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,dff080 <_end+0xd89d9c>
	PrepareDisplay();		
	custom->intena=0xc020;//Enable vblank
     67e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              movea.l 752dc <custom>,a5
     684:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-16352,154(a5)

	//WarmUp
	SetBplPointers();
     68a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a2)
  DrawCopper = ViewCopper;
     68c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d3,752b2 <DrawCopper>
  ViewCopper = tmp;
     692:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,752ae <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     698:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.l d2,dff080 <_end+0xd89d9c>
	//LoadVectors();
	SwapCl();
	custom->dmacon = 0x83f0;
     69e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              move.w #-31760,150(a5)
	WaitVbl();	
     6a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              jsr (a3)

	while( CubeFinished == 0) {		
     6a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 28(sp),sp
     6aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              lea 5364 <DrawScreen>,a5
     6b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                              tst.w 752ce <CubeFinished>
     6b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------------------- bne.s 730 <main+0x6ca>
		DrawScreen();
     6b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------------> jsr (a5)
		SetBplPointers();
     6ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a2)
}

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4) {
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     6bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w f0ff60 <_end+0xe9ac7c>,d0
     6c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        cmpi.w #20153,d0
     6c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-------------- beq.w 876 <main+0x810>
     6ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |               cmpi.w #-24562,d0
     6ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        +-------------- beq.w 876 <main+0x810>
		debug_start_idle();
		while(FrameCounter<2);
     6d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-------------> move.w 752d0 <FrameCounter>,d0
     6d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               cmpi.w #1,d0
     6dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----|-------------- bls.s 6d2 <main+0x66c>
		if(FrameCounter >= 3) {
     6de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-------------> move.w 752d0 <FrameCounter>,d0
     6e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #2,d0
     6e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /----- bhi.w 812 <main+0x7ac>
    		KPrintF("Framerate below 25FPS\n");
		}
		FrameCounter = 0;
     6ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w #0,752d0 <FrameCounter>
		WaitVbl();
     6f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      jsr (a3)
     6f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      move.w f0ff60 <_end+0xe9ac7c>,d0
     6fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |      cmpi.w #20153,d0
     700:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|----- beq.w 834 <main+0x7ce>
     704:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|----> cmpi.w #-24562,d0
     708:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- beq.w 834 <main+0x7ce>
  UBYTE *tmp = DrawCopper;
     70c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 752b2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
     712:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 752ae <ViewCopper>,752b2 <DrawCopper>
  ViewCopper = tmp;
     71c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,752ae <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     722:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,dff080 <_end+0xd89d9c>
	while( CubeFinished == 0) {		
     728:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w 752ce <CubeFinished>
     72e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|----- beq.s 6b8 <main+0x652>
  FreeMem(WorkingMem, 25000);
     730:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|----> movea.l 752e0 <SysBase>,a6
     736:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752ca <WorkingMem>,a1
     73c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #25000,d0
     742:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(LineBuffer, 12*100*100);
     746:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     74c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752c6 <LineBuffer>,a1
     752:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #120000,d0
     758:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(PrepareBuffer, 64*(BPLHEIGHT+2)*2);
     75c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     762:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752c2 <PrepareBuffer>,a1
     768:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #33024,d0
     76e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap1, 64*(BPLHEIGHT+2)*BPLDEPTH);
     772:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     778:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752be <Bitmap1>,a1
     77e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     784:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap2, 64*(BPLHEIGHT+2)*BPLDEPTH);
     788:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     78e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752ba <Bitmap2>,a1
     794:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     79a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(Bitmap3, 64*(BPLHEIGHT+2)*BPLDEPTH);
     79e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     7a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752b6 <Bitmap3>,a1
     7aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #49536,d0
     7b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(DrawCopper, ZMCPSIZE);
     7b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     7ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752b2 <DrawCopper>,a1
     7c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     7c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  FreeMem(ViewCopper, ZMCPSIZE);
     7ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     7d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752ae <ViewCopper>,a1
     7d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.l #1360,d0
     7dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -210(a6)
  RemIntServer( INTB_VERTB, Vbint);
     7e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752e0 <SysBase>,a6
     7e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #5,d0
     7e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752aa <Vbint>,a1
     7ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr -174(a6)
		debug_stop_idle();
		SwapCl();
	}

	CleanUp( );
	WaitVbl();
     7f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr (a3)
	custom->dmacon = 0x83f0;
     7f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l 752dc <custom>,a0
     7fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-31760,150(a0)
	custom->intena=0xe020;//Enable vblank
     800:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-8160,154(a0)
	
	End_PrepareDisplay();
     806:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jsr 4df8 <End_PrepareDisplay.isra.0>

	while(1) {
		WaitVbl();
     80c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> jsr (a3)
     80e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   jsr (a3)
	while(1) {
     810:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-- bra.s 80c <main+0x7a6>
    		KPrintF("Framerate below 25FPS\n");
     812:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> pea 3716f <incbin_MercuryLetterData2Lz4_end+0x34d>
     818:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a4)
     81a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.l #4,sp
		FrameCounter = 0;
     81c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #0,752d0 <FrameCounter>
		WaitVbl();
     824:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jsr (a3)
     826:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w f0ff60 <_end+0xe9ac7c>,d0
     82c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #20153,d0
     830:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------- bne.w 704 <main+0x69e>
		UaeLib(88, arg1, arg2, arg3, arg4);
     834:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----------> clr.l -(sp)
     836:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     838:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               clr.l -(sp)
     83a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 5 <_start+0x5>
     83e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               pea 58 <_start+0x58>
     842:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jsr f0ff60 <_end+0xe9ac7c>
	}
}
     848:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
  UBYTE *tmp = DrawCopper;
     84c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 752b2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
     852:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l 752ae <ViewCopper>,752b2 <DrawCopper>
  ViewCopper = tmp;
     85c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,752ae <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     862:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.l d0,dff080 <_end+0xd89d9c>
	while( CubeFinished == 0) {		
     868:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               tst.w 752ce <CubeFinished>
     86e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|-------------- beq.w 6b8 <main+0x652>
     872:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-------------- bra.w 730 <main+0x6ca>
		UaeLib(88, arg1, arg2, arg3, arg4);
     876:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-------------> clr.l -(sp)
     878:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  clr.l -(sp)
     87a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 1 <_start+0x1>
     87e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 5 <_start+0x5>
     882:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  pea 58 <_start+0x58>
     886:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  jsr f0ff60 <_end+0xe9ac7c>
}
     88c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  lea 20(sp),sp
		while(FrameCounter<2);
     890:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  move.w 752d0 <FrameCounter>,d0
     896:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                  cmpi.w #1,d0
     89a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|----------------- bls.w 6d2 <main+0x66c>
     89e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \----------------- bra.w 6de <main+0x678>
		KPrintF("p61Init failed!\n");
     8a2:	|  >--|--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------> pea 370bf <incbin_MercuryLetterData2Lz4_end+0x29d>
     8a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a4)
     8aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        addq.l #4,sp
	WaitVbl();
     8ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr (a3)
	custom->intena=0xf020;//Enable vblank
     8ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 752dc <custom>,a0
     8b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #-4064,154(a0)
	custom->dmacon = 0x83f0;	
     8ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #-31760,150(a0)
	Sw_PrepareDisplay();
     8c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        jsr 505a <Sw_PrepareDisplay.isra.0>
	custom->intena=0xe020;//Enable vblank
     8c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        movea.l 752dc <custom>,a0
     8cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        move.w #-8160,154(a0)
	while(SwScrollerFinished == 0) {
     8d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        lea d04 <Sw_Run>,a2
     8d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                        tst.w 752d2 <SwScrollerFinished>
     8de:	|  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|----------------------- beq.w 212 <main+0x1ac>
     8e2:	|  |  |  |  |  |  |  \-----|--|--|--|--|--|--|----------------------- bra.w 21c <main+0x1b6>
		Exit(0);
     8e6:	|  |  |  >--|--|--|--------|--|--|--|--|--|--|----------------------> suba.l a6,a6
     8e8:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        moveq #0,d1
     8ea:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     8ee:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        pea 3708d <incbin_MercuryLetterData2Lz4_end+0x26b>
     8f4:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        lea 28f2 <KPrintF>,a4
     8fa:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr (a4)
	Write(Output(), (APTR)"Hello Mountainbytes!\n", 20);
     8fc:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d4 <DOSBase>,a6
     902:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -60(a6)
     906:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d4 <DOSBase>,a6
     90c:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.l d0,d1
     90e:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.l #225449,d2
     914:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        moveq #20,d3
     916:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -48(a6)
	Delay(50);
     91a:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d4 <DOSBase>,a6
     920:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        moveq #50,d1
     922:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -198(a6)
	Sw_LoadResources();
     926:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr 144c <Sw_LoadResources>
	Forbid();	
     92c:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752e0 <SysBase>,a6
     932:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -132(a6)
	SystemADKCON=custom->adkconr;
     936:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752dc <custom>,a0
     93c:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w 16(a0),d0
	SystemInts=custom->intenar;
     940:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w 28(a0),d0
	SystemDMA=custom->dmaconr;
     944:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w 2(a0),d0
	LoadView(0);
     948:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d8 <GfxBase>,a6
     94e:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        suba.l a1,a1
     950:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -222(a6)
	WaitTOF();
     954:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d8 <GfxBase>,a6
     95a:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -270(a6)
	WaitTOF();
     95e:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d8 <GfxBase>,a6
     964:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -270(a6)
	WaitVbl();
     968:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        lea c6a <WaitVbl>,a3
     96e:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr (a3)
	WaitVbl();
     970:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr (a3)
	OwnBlitter();
     972:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d8 <GfxBase>,a6
     978:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -456(a6)
	WaitBlit();	
     97c:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752d8 <GfxBase>,a6
     982:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        jsr -228(a6)
	custom->intena=0x7fff;//disable all interrupts
     986:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        movea.l 752dc <custom>,a0
     98c:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w #32767,154(a0)
	custom->intreq=0x7fff;//Clear any interrupts that were pending
     992:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w #32767,156(a0)
	custom->dmacon=0x3fff;//Clear all DMA channels
     998:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        move.w #16383,150(a0)
     99e:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        addq.l #4,sp
	for(int a=0;a<32;a++)
     9a0:	|  |  |  |  |  |  |        |  |  |  |  |  |  |                        moveq #0,d1
     9a2:	|  |  |  |  |  |  \--------|--|--|--|--|--|--|----------------------- bra.w 166 <main+0x100>
		Exit(0);
     9a6:	|  |  |  |  |  \-----------|--|--|--|--|--|--|----------------------> movea.l 752d4 <DOSBase>,a6
     9ac:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d1
     9ae:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     9b2:	|  |  |  |  |              |  |  |  |  |  |  |                        movea.l 752e0 <SysBase>,a6
     9b8:	|  |  |  |  |              |  |  |  |  |  |  |                        lea 37081 <incbin_MercuryLetterData2Lz4_end+0x25f>,a1
     9be:	|  |  |  |  |              |  |  |  |  |  |  |                        moveq #0,d0
     9c0:	|  |  |  |  |              |  |  |  |  |  |  |                        jsr -552(a6)
     9c4:	|  |  |  |  |              |  |  |  |  |  |  |                        move.l d0,752d4 <DOSBase>
	if (!DOSBase)
     9ca:	|  |  |  |  \--------------|--|--|--|--|--|--|----------------------- bne.w b2 <main+0x4c>
     9ce:	|  |  |  \-----------------|--|--|--|--|--|--|----------------------- bra.w 8e6 <main+0x880>
    Write(Output(), "Cannot allocate Memory for Bitmap3.\n",38);
     9d2:	|  |  |                    |  |  |  >--|--|--|----------------------> movea.l 752d4 <DOSBase>,a6
     9d8:	|  |  |                    |  |  |  |  |  |  |                        jsr -60(a6)
     9dc:	|  |  |                    |  |  |  |  |  |  |                        movea.l 752d4 <DOSBase>,a6
     9e2:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d1
     9e4:	|  |  |                    |  |  |  |  |  |  |                        move.l #225598,d2
     9ea:	|  |  |                    |  |  |  |  |  |  |                        moveq #38,d3
     9ec:	|  |  |                    |  |  |  |  |  |  |                        jsr -48(a6)
    Exit(1);
     9f0:	|  |  |                    |  |  |  |  |  |  |                        movea.l 752d4 <DOSBase>,a6
     9f6:	|  |  |                    |  |  |  |  |  |  |                        moveq #1,d1
     9f8:	|  |  |                    |  |  |  |  |  |  |                        jsr -144(a6)
  debug_register_bitmap( Bitmap3, "bitmap3.bpl", 512, 256, 3, 0); 
     9fc:	|  |  |                    |  |  |  |  |  |  |                        move.l 752b6 <Bitmap3>,d0
     a02:	|  |  |                    |  |  |  |  |  |  |                        pea 3 <_start+0x3>
     a06:	|  |  |                    |  |  |  |  |  |  |                        pea 100 <main+0x9a>
     a0a:	|  |  |                    |  |  |  |  |  |  |                        pea 37163 <incbin_MercuryLetterData2Lz4_end+0x341>
     a10:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,-(sp)
     a12:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap3, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     a14:	|  |  |                    |  |  |  |  |  |  |                        move.l 752b6 <Bitmap3>,d2
     a1a:	|  |  |                    |  |  |  |  |  |  |                        pea 10 <_start+0x10>
     a1e:	|  |  |                    |  |  |  |  |  |  |                        pea 306 <main+0x2a0>
     a22:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,-(sp)
     a24:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
  ScreenBuffer3.BitPlane = Bitmap3;
     a26:	|  |  |                    |  |  |  |  |  |  |                        lea 75202 <ScreenBuffer3>,a2
     a2c:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,(a2)
  ScreenBuffer3.MyDirtyArea[0].Address = 0;
     a2e:	|  |  |                    |  |  |  |  |  |  |                        clr.l 75206 <ScreenBuffer3+0x4>
  ScreenBuffer3.MyDirtyArea[1].Address = 0;
     a34:	|  |  |                    |  |  |  |  |  |  |                        clr.l 75212 <ScreenBuffer3+0x10>
  ViewCopper = Clbuild( );
     a3a:	|  |  |                    |  |  |  |  |  |  |                        lea 24f6 <Clbuild>,a5
     a40:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     a42:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d2
  DrawCopper = Clbuild( );
     a44:	|  |  |                    |  |  |  |  |  |  |                        jsr (a5)
     a46:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,d3
     a48:	|  |  |                    |  |  |  |  |  |  |                        move.l d0,752b2 <DrawCopper>
  ScreenBufferList[0] = &ScreenBuffer1;
     a4e:	|  |  |                    |  |  |  |  |  |  |                        move.l #479858,751de <ScreenBufferList>
  ScreenBufferList[1] = &ScreenBuffer2;   
     a58:	|  |  |                    |  |  |  |  |  |  |                        move.l #479802,751e2 <ScreenBufferList+0x4>
  ScreenBufferList[2] = &ScreenBuffer3;  
     a62:	|  |  |                    |  |  |  |  |  |  |                        move.l a2,751e6 <ScreenBufferList+0x8>
  ScreenBufferList[3] = &ScreenBuffer3;
     a68:	|  |  |                    |  |  |  |  |  |  |                        move.l a2,751ea <ScreenBufferList+0xc>
  ScreenBufferList[4] = &ScreenBuffer1;
     a6e:	|  |  |                    |  |  |  |  |  |  |                        move.l #479858,751ee <ScreenBufferList+0x10>
  ScreenBufferList[5] = &ScreenBuffer2;
     a78:	|  |  |                    |  |  |  |  |  |  |                        move.l #479802,751f2 <ScreenBufferList+0x14>
  ScreenBufferList[6] = &ScreenBuffer2;
     a82:	|  |  |                    |  |  |  |  |  |  |                        move.l #479802,751f6 <ScreenBufferList+0x18>
  ScreenBufferList[7] = &ScreenBuffer3;
     a8c:	|  |  |                    |  |  |  |  |  |  |                        move.l a2,751fa <ScreenBufferList+0x1c>
  ScreenBufferList[8] = &ScreenBuffer1;
     a92:	|  |  |                    |  |  |  |  |  |  |                        move.l #479858,751fe <ScreenBufferList+0x20>
  SetBplPointers(); 
     a9c:	|  |  |                    |  |  |  |  |  |  |                        lea 2856 <SetBplPointers>,a2
     aa2:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
  DrawCopper = ViewCopper;
     aa4:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,752b2 <DrawCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     aaa:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,dff080 <_end+0xd89d9c>
	custom->intena=0xc020;//Enable vblank
     ab0:	|  |  |                    |  |  |  |  |  |  |                        movea.l 752dc <custom>,a5
     ab6:	|  |  |                    |  |  |  |  |  |  |                        move.w #-16352,154(a5)
	SetBplPointers();
     abc:	|  |  |                    |  |  |  |  |  |  |                        jsr (a2)
  DrawCopper = ViewCopper;
     abe:	|  |  |                    |  |  |  |  |  |  |                        move.l d3,752b2 <DrawCopper>
  ViewCopper = tmp;
     ac4:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,752ae <ViewCopper>
  custom->cop1lc = (ULONG) ViewCopper;
     aca:	|  |  |                    |  |  |  |  |  |  |                        move.l d2,dff080 <_end+0xd89d9c>
	custom->dmacon = 0x83f0;
     ad0:	|  |  |                    |  |  |  |  |  |  |                        move.w #-31760,150(a5)
	WaitVbl();	
     ad6:	|  |  |                    |  |  |  |  |  |  |                        jsr (a3)
	while( CubeFinished == 0) {		
     ad8:	|  |  |                    |  |  |  |  |  |  |                        lea 28(sp),sp
     adc:	|  |  |                    |  |  |  |  |  |  |                        lea 5364 <DrawScreen>,a5
     ae2:	|  |  |                    |  |  |  |  |  |  |                        tst.w 752ce <CubeFinished>
     ae8:	|  |  |                    |  |  |  |  |  |  \----------------------- beq.w 6b8 <main+0x652>
     aec:	|  |  |                    |  |  |  |  |  \-------------------------- bra.w 730 <main+0x6ca>
    Write(Output(), "Cannot allocate Memory for Bitmap2.\n",38);
     af0:	|  |  |                    >--|--|--|--|----------------------------> movea.l 752d4 <DOSBase>,a6
     af6:	|  |  |                    |  |  |  |  |                              jsr -60(a6)
     afa:	|  |  |                    |  |  |  |  |                              movea.l 752d4 <DOSBase>,a6
     b00:	|  |  |                    |  |  |  |  |                              move.l d0,d1
     b02:	|  |  |                    |  |  |  |  |                              move.l #225549,d2
     b08:	|  |  |                    |  |  |  |  |                              moveq #38,d3
     b0a:	|  |  |                    |  |  |  |  |                              jsr -48(a6)
    Exit(1);
     b0e:	|  |  |                    |  |  |  |  |                              movea.l 752d4 <DOSBase>,a6
     b14:	|  |  |                    |  |  |  |  |                              moveq #1,d1
     b16:	|  |  |                    |  |  |  |  |                              jsr -144(a6)
  debug_register_bitmap( Bitmap2, "bitmap2.bpl", 512, 256, 3, 0); 
     b1a:	|  |  |                    |  |  |  |  |                              move.l 752ba <Bitmap2>,d0
     b20:	|  |  |                    |  |  |  |  |                              pea 3 <_start+0x3>
     b24:	|  |  |                    |  |  |  |  |                              pea 100 <main+0x9a>
     b28:	|  |  |                    |  |  |  |  |                              pea 37132 <incbin_MercuryLetterData2Lz4_end+0x310>
     b2e:	|  |  |                    |  |  |  |  |                              move.l d0,-(sp)
     b30:	|  |  |                    |  |  |  |  |                              jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap2, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     b32:	|  |  |                    |  |  |  |  |                              move.l 752ba <Bitmap2>,d2
     b38:	|  |  |                    |  |  |  |  |                              pea 10 <_start+0x10>
     b3c:	|  |  |                    |  |  |  |  |                              pea 306 <main+0x2a0>
     b40:	|  |  |                    |  |  |  |  |                              move.l d2,-(sp)
     b42:	|  |  |                    |  |  |  |  |                              jsr (a2)
  ScreenBuffer2.BitPlane = Bitmap2;
     b44:	|  |  |                    |  |  |  |  |                              move.l d2,7523a <ScreenBuffer2>
  ScreenBuffer2.MyDirtyArea[0].Address = 0;
     b4a:	|  |  |                    |  |  |  |  |                              clr.l 7523e <ScreenBuffer2+0x4>
  ScreenBuffer2.MyDirtyArea[1].Address = 0;
     b50:	|  |  |                    |  |  |  |  |                              clr.l 7524a <ScreenBuffer2+0x10>
  Bitmap3 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     b56:	|  |  |                    |  |  |  |  |                              movea.l 752e0 <SysBase>,a6
     b5c:	|  |  |                    |  |  |  |  |                              move.l #49536,d0
     b62:	|  |  |                    |  |  |  |  |                              moveq #2,d1
     b64:	|  |  |                    |  |  |  |  |                              jsr -198(a6)
     b68:	|  |  |                    |  |  |  |  |                              move.l d0,752b6 <Bitmap3>
  if(Bitmap3 == 0) {
     b6e:	|  |  |                    |  |  |  |  |                              lea 28(sp),sp
     b72:	|  |  |                    |  |  |  |  \----------------------------- bne.w 5d0 <main+0x56a>
     b76:	|  |  |                    |  |  |  \-------------------------------- bra.w 9d2 <main+0x96c>
    Write(Output(), "Cannot allocate Memory for Bitmap1.\n",38);
     b7a:	|  |  |                    |  |  \----------------------------------> movea.l 752d4 <DOSBase>,a6
     b80:	|  |  |                    |  |                                       jsr -60(a6)
     b84:	|  |  |                    |  |                                       movea.l 752d4 <DOSBase>,a6
     b8a:	|  |  |                    |  |                                       move.l d0,d1
     b8c:	|  |  |                    |  |                                       move.l #225500,d2
     b92:	|  |  |                    |  |                                       moveq #38,d3
     b94:	|  |  |                    |  |                                       jsr -48(a6)
    Exit(1);
     b98:	|  |  |                    |  |                                       movea.l 752d4 <DOSBase>,a6
     b9e:	|  |  |                    |  |                                       moveq #1,d1
     ba0:	|  |  |                    |  |                                       jsr -144(a6)
  debug_register_bitmap( Bitmap1, "bitmap1.bpl", 512, 256, 3, 0);  
     ba4:	|  |  |                    |  |                                       move.l 752be <Bitmap1>,d0
     baa:	|  |  |                    |  |                                       pea 3 <_start+0x3>
     bae:	|  |  |                    |  |                                       pea 100 <main+0x9a>
     bb2:	|  |  |                    |  |                                       pea 37101 <incbin_MercuryLetterData2Lz4_end+0x2df>
     bb8:	|  |  |                    |  |                                       move.l d0,-(sp)
     bba:	|  |  |                    |  |                                       jsr (a5)
  Utils_FillLong( (ULONG *) Bitmap1, 0x0, (BPLHEIGHT+2)*BPLDEPTH, 64/4, 0);
     bbc:	|  |  |                    |  |                                       move.l 752be <Bitmap1>,d2
     bc2:	|  |  |                    |  |                                       pea 10 <_start+0x10>
     bc6:	|  |  |                    |  |                                       pea 306 <main+0x2a0>
     bca:	|  |  |                    |  |                                       move.l d2,-(sp)
     bcc:	|  |  |                    |  |                                       jsr (a2)
  ScreenBuffer1.BitPlane = Bitmap1;
     bce:	|  |  |                    |  |                                       move.l d2,75272 <ScreenBuffer1>
  ScreenBuffer1.MyDirtyArea[0].Address = 0;
     bd4:	|  |  |                    |  |                                       clr.l 75276 <ScreenBuffer1+0x4>
  ScreenBuffer1.MyDirtyArea[1].Address = 0;
     bda:	|  |  |                    |  |                                       clr.l 75282 <ScreenBuffer1+0x10>
  Bitmap2 = AllocMem( 64*(BPLHEIGHT+2)*BPLDEPTH, MEMF_CHIP);
     be0:	|  |  |                    |  |                                       movea.l 752e0 <SysBase>,a6
     be6:	|  |  |                    |  |                                       move.l #49536,d0
     bec:	|  |  |                    |  |                                       moveq #2,d1
     bee:	|  |  |                    |  |                                       jsr -198(a6)
     bf2:	|  |  |                    |  |                                       move.l d0,752ba <Bitmap2>
  if(Bitmap2 == 0) {
     bf8:	|  |  |                    |  |                                       lea 28(sp),sp
     bfc:	|  |  |                    |  \-------------------------------------- bne.w 57a <main+0x514>
     c00:	|  |  |                    \----------------------------------------- bra.w af0 <main+0xa8a>
	APTR vbr = 0;
     c04:	\--|--|-------------------------------------------------------------> moveq #0,d0
	VBR=GetVBR();
     c06:	   |  |                                                               move.l d0,751ba <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     c0c:	   |  |                                                               movea.l 751ba <VBR>,a0
     c12:	   |  |                                                               move.l 108(a0),d0
		register volatile const void* _a0 ASM("a0") = module;
     c16:	   |  |                                                               lea 5f4e4 <incbin_module_start>,a0
		register volatile const void* _a1 ASM("a1") = NULL;
     c1c:	   |  |                                                               suba.l a1,a1
		register volatile const void* _a2 ASM("a2") = NULL;
     c1e:	   |  |                                                               suba.l a2,a2
		__asm volatile (
     c20:	   |  |                                                               movem.l d1-d7/a3-a6,-(sp)
     c24:	   |  |                                                               jsr 6e00 <_P61_Init>
     c2a:	   |  |                                                               movem.l (sp)+,d1-d7/a3-a6
	if(p61Init(module) != 0)
     c2e:	   |  |                                                               tst.l d0
     c30:	   |  \-------------------------------------------------------------- beq.w 1de <main+0x178>
     c34:	   \----------------------------------------------------------------- bra.w 8a2 <main+0x83c>

00000c38 <Utils_Lz4DepackAsm>:
void Utils_Lz4DepackAsm(UBYTE *src, UBYTE *dst, UWORD size) { 
     c38:	subq.l #4,sp
     c3a:	move.l 16(sp),d0
     c3e:	move.w d0,d0
     c40:	move.w d0,2(sp)
  register volatile void* _a0 ASM("a0") = src + 11; //Skip Header
     c44:	moveq #11,d0
     c46:	add.l 8(sp),d0
     c4a:	movea.l d0,a0
	register volatile void* _a1 ASM("a1") = dst;
     c4c:	movea.l 12(sp),a1
  register volatile void* _d1 ASM("d0") = size;  
     c50:	moveq #0,d0
     c52:	move.w 2(sp),d0
	__asm volatile (
     c56:	movem.l d0-d7/a2-a6,-(sp)
     c5a:	jsr 5f18 <_lz4_depack>
     c60:	movem.l (sp)+,d0-d7/a2-a6
}
     c64:	nop
     c66:	addq.l #4,sp
     c68:	rts

00000c6a <WaitVbl>:
void WaitVbl() {
     c6a:	    subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c6c:	/-> move.l dff004 <_end+0xd89d20>,d0
     c72:	|   move.l d0,(sp)
		vpos&=0x1ff00;
     c74:	|   move.l (sp),d0
     c76:	|   andi.l #130816,d0
     c7c:	|   move.l d0,(sp)
		if (vpos!=(311<<8))
     c7e:	|   move.l (sp),d0
     c80:	|   cmpi.l #79616,d0
     c86:	\-- beq.s c6c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c88:	/-> move.l dff004 <_end+0xd89d20>,d0
     c8e:	|   move.l d0,4(sp)
		vpos&=0x1ff00;
     c92:	|   move.l 4(sp),d0
     c96:	|   andi.l #130816,d0
     c9c:	|   move.l d0,4(sp)
		if (vpos==(311<<8))
     ca0:	|   move.l 4(sp),d0
     ca4:	|   cmpi.l #79616,d0
     caa:	\-- bne.s c88 <WaitVbl+0x1e>
}
     cac:	    addq.l #8,sp
     cae:	    rts

00000cb0 <VblankHandler>:
  custom->intreq = 1 << INTB_VERTB;
     cb0:	move.w #32,dff09c <_end+0xd89db8>
  custom->intreq = 1 << INTB_VERTB;
     cb8:	move.w #32,dff09c <_end+0xd89db8>
  FrameCounter++;
     cc0:	move.w 752d0 <FrameCounter>,d0
     cc6:	addq.w #1,d0
     cc8:	move.w d0,752d0 <FrameCounter>
}
     cce:	rts

00000cd0 <Utils_FillLong.constprop.0>:
void Utils_FillLong( ULONG *target, ULONG pattern, int lines, int linelength, ULONG mod ) 
     cd0:	    movem.l d2-d5/a2,-(sp)
     cd4:	    move.l 24(sp),d3
     cd8:	    move.l 28(sp),d5
      *target++ = pattern;
     cdc:	    move.l 32(sp),d4
     ce0:	    add.l d4,d4
     ce2:	    add.l d4,d4
  for( int i=0;i<lines; i++) {
     ce4:	    moveq #0,d2
     ce6:	    lea 5cac <memset>(pc),a2
      *target++ = pattern;
     cea:	/-> move.l d4,-(sp)
     cec:	|   clr.l -(sp)
     cee:	|   move.l d3,-(sp)
     cf0:	|   jsr (a2)
     cf2:	|   add.l d4,d3
  for( int i=0;i<lines; i++) {
     cf4:	|   addq.l #1,d2
     cf6:	|   lea 12(sp),sp
     cfa:	|   cmp.l d2,d5
     cfc:	\-- bne.s cea <Utils_FillLong.constprop.0+0x1a>
}
     cfe:	    movem.l (sp)+,d2-d5/a2
     d02:	    rts

00000d04 <Sw_Run>:
void Sw_Run() {                                     
     d04:	          movem.l d2-d5/a2-a4/a6,-(sp)
  if(Sw_framecount == 50) {
     d08:	          move.l 5f4de <Sw_framecount>,d0
     d0e:	          moveq #50,d1
     d10:	          cmp.l d0,d1
     d12:	   /----- beq.w 103e <Sw_Run+0x33a>
  Sw_framecount++;
     d16:	   |      addq.l #1,d0
     d18:	   |      move.l d0,5f4de <Sw_framecount>
  while ( Sw_BlitFrame == 0)
     d1e:	/--|----> move.w 751b8 <Sw_BlitFrame>,d0
     d24:	+--|----- beq.s d1e <Sw_Run+0x1a>
  *bp = 0;
     d26:	|  |      clr.l 200 <main+0x19a>
  Sw_BlitFrame = 0;
     d2a:	|  |      move.w #0,751b8 <Sw_BlitFrame>
  WaitBlit();
     d32:	|  |      lea 752d8 <GfxBase>,a2
     d38:	|  |      movea.l (a2),a6
     d3a:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     d3e:	|  |      movea.l 752dc <custom>,a0
     d44:	|  |      move.w #0,100(a0)
  custom->bltbmod = 0;
     d4a:	|  |      move.w #0,98(a0)
  custom->bltdmod = 0;
     d50:	|  |      move.w #0,102(a0)
  custom->bltafwm = 0xffff;
     d56:	|  |      move.w #-1,68(a0)
  custom->bltalwm = 0xffff;
     d5c:	|  |      move.w #-1,70(a0)
  custom->bltcon1 = 0;  
     d62:	|  |      move.w #0,66(a0)
  custom->bltcon0 = 0x09f0;
     d68:	|  |      move.w #2544,64(a0)
  custom->bltapt = (void *) ((ULONG) Sw_FontBuffer+80*(Sw_framecount-1));
     d6e:	|  |      move.l 5f4de <Sw_framecount>,d1
     d74:	|  |      subq.l #1,d1
     d76:	|  |      move.l d1,d0
     d78:	|  |      add.l d1,d0
     d7a:	|  |      add.l d0,d0
     d7c:	|  |      add.l d1,d0
     d7e:	|  |      lsl.l #4,d0
     d80:	|  |      add.l 751d2 <Sw_FontBuffer>,d0
     d86:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+40*255;
     d8a:	|  |      move.l 751b4 <Sw_DrawBuffer>,d0
     d90:	|  |      addi.l #20400,d0
     d96:	|  |      move.l d0,84(a0)
  custom->bltsize = 64+40;
     d9a:	|  |      move.w #104,88(a0)
  WaitBlit();
     da0:	|  |      movea.l (a2),a6
     da2:	|  |      jsr -228(a6)
  custom->bltamod = 0;
     da6:	|  |      movea.l 752dc <custom>,a0
     dac:	|  |      move.w #0,100(a0)
  custom->bltdmod = 0;
     db2:	|  |      move.w #0,102(a0)
  custom->bltapt = Sw_ViewBufferP1;
     db8:	|  |      move.l 751b0 <Sw_ViewBufferP1>,80(a0)
  custom->bltdpt = Sw_DrawBuffer;  
     dc0:	|  |      move.l 751b4 <Sw_DrawBuffer>,84(a0)
  custom->bltsize = 64*Sw_CopyLines[Sw_framecountscreen]+40;  
     dc8:	|  |      lea 3d1fe <Sw_CopyLines>,a3
     dce:	|  |      move.l 751ac <Sw_framecountscreen>,d0
     dd4:	|  |      add.l d0,d0
     dd6:	|  |      move.w (0,a3,d0.l),d0
     dda:	|  |      lsl.w #6,d0
     ddc:	|  |      addi.w #40,d0
     de0:	|  |      move.w d0,88(a0)
  WaitBlit();
     de4:	|  |      movea.l (a2),a6
     de6:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     dea:	|  |      movea.l 752dc <custom>,a0
     df0:	|  |      move.w #3376,64(a0)
  custom->bltafwm = 0xffff;
     df6:	|  |      move.w #-1,68(a0)
  custom->bltamod = 40; // Skip Left Part of Screen
     dfc:	|  |      move.w #40,100(a0)
  custom->bltdmod = 40; // Skip Left Part of Screen
     e02:	|  |      move.w #40,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     e08:	|  |      move.l 751ac <Sw_framecountscreen>,d0
     e0e:	|  |      add.l d0,d0
     e10:	|  |      move.w (0,a3,d0.l),d1
     e14:	|  |      move.w d1,d0
     e16:	|  |      mulu.w #80,d0
     e1a:	|  |      movea.l d0,a1
     e1c:	|  |      lea 120(a1),a4
     e20:	|  |      move.l 751b0 <Sw_ViewBufferP1>,d0
     e26:	|  |      add.l a4,d0
     e28:	|  |      move.l d0,80(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40+20;
     e2c:	|  |      lea 40(a1),a1
     e30:	|  |      adda.l 751b4 <Sw_DrawBuffer>,a1
     e36:	|  |      move.l a1,84(a0)
  bltbpd += Sw_CopyLines[Sw_framecountscreen]*40;
     e3a:	|  |      move.w d1,d0
     e3c:	|  |      mulu.w #40,d0
     e40:	|  |      add.l 751c6 <Sw_XMaskRight>,d0
  custom->bltbpt = bltbpd;
     e46:	|  |      move.l d0,76(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     e4a:	|  |      move.w #255,d0
     e4e:	|  |      sub.w d1,d0
     e50:	|  |      lsl.w #6,d0
     e52:	|  |      addi.w #20,d0
     e56:	|  |      move.w d0,88(a0)
  WaitBlit();
     e5a:	|  |      movea.l (a2),a6
     e5c:	|  |      jsr -228(a6)
  custom->bltcon0 = 0xffea; // Shift A Channel 15 but actual -1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     e60:	|  |      movea.l 752dc <custom>,a0
     e66:	|  |      move.w #-22,64(a0)
  custom->bltcon1 = 0xf000; // Shift B Channel 15 but actual -1 (Sourceline)
     e6c:	|  |      move.w #-4096,66(a0)
  custom->bltalwm = 0xfffe;
     e72:	|  |      move.w #-2,70(a0)
  custom->bltcmod = 38; // Skip Left Part of Screen
     e78:	|  |      move.w #38,96(a0)
  custom->bltbmod = -2;
     e7e:	|  |      move.w #-2,98(a0)
  custom->bltamod = 38; // Skip Left Part of Screen
     e84:	|  |      move.w #38,100(a0)
  custom->bltdmod = 38; // Skip Left Part of Screen
     e8a:	|  |      move.w #38,102(a0)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+60;
     e90:	|  |      move.l 751ac <Sw_framecountscreen>,d0
     e96:	|  |      add.l d0,d0
     e98:	|  |      move.w (0,a3,d0.l),d1
     e9c:	|  |      move.w d1,d0
     e9e:	|  |      mulu.w #80,d0
     ea2:	|  |      movea.l d0,a1
     ea4:	|  |      lea 120(a1),a4
     ea8:	|  |      move.l 751b0 <Sw_ViewBufferP1>,d0
     eae:	|  |      add.l a4,d0
     eb0:	|  |      move.l d0,80(a0)
  bltbpd += Sw_CopyLines[Sw_framecountscreen]*40;
     eb4:	|  |      move.w d1,d0
     eb6:	|  |      mulu.w #40,d0
     eba:	|  |      add.l 751c6 <Sw_XMaskRight>,d0
  custom->bltbpt = bltbpd;
     ec0:	|  |      move.l d0,76(a0)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;
     ec4:	|  |      lea 38(a1),a1
     ec8:	|  |      move.l 751b4 <Sw_DrawBuffer>,d0
     ece:	|  |      add.l a1,d0
     ed0:	|  |      move.l d0,72(a0)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40-1+20;    
     ed4:	|  |      move.l d0,84(a0)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+21;
     ed8:	|  |      move.w #255,d0
     edc:	|  |      sub.w d1,d0
     ede:	|  |      lsl.w #6,d0
     ee0:	|  |      addi.w #21,d0
     ee4:	|  |      move.w d0,88(a0)
  WaitBlit();
     ee8:	|  |      movea.l (a2),a6
     eea:	|  |      jsr -228(a6)
  custom->bltafwm = 0xffff;
     eee:	|  |      movea.l 752dc <custom>,a1
     ef4:	|  |      move.w #-1,68(a1)
  custom->bltalwm = 0xffff;
     efa:	|  |      move.w #-1,70(a1)
  custom->bltcon0 = 0x0d30; // No Shift, Channels A+B+D, Minterm: Set if Channel A = 1 and Channel B = 0 
     f00:	|  |      move.w #3376,64(a1)
  custom->bltbmod = 0;
     f06:	|  |      move.w #0,98(a1)
  custom->bltcon1 = 0;  
     f0c:	|  |      move.w #0,66(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     f12:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     f18:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     f1e:	|  |      move.l 751ac <Sw_framecountscreen>,d0
     f24:	|  |      add.l d0,d0
     f26:	|  |      move.w (0,a3,d0.l),d1
     f2a:	|  |      moveq #0,d2
     f2c:	|  |      move.w d1,d2
     f2e:	|  |      movea.l d2,a0
     f30:	|  |      addq.l #1,a0
     f32:	|  |      move.l a0,d0
     f34:	|  |      add.l a0,d0
     f36:	|  |      add.l d0,d0
     f38:	|  |      add.l a0,d0
     f3a:	|  |      lsl.l #4,d0
     f3c:	|  |      movea.l 751b0 <Sw_ViewBufferP1>,a0
     f42:	|  |      adda.l d0,a0
     f44:	|  |      move.l a0,80(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;  
     f48:	|  |      movea.w #-80,a0
     f4c:	|  |      adda.l d0,a0
     f4e:	|  |      move.l 751b4 <Sw_DrawBuffer>,d0
     f54:	|  |      add.l a0,d0
     f56:	|  |      move.l d0,84(a1)
  bltbpd += Sw_CopyLines[Sw_framecountscreen]*40;
     f5a:	|  |      mulu.w #40,d1
     f5e:	|  |      add.l 751ca <Sw_XMaskLeft>,d1
  custom->bltbpt = bltbpd;
     f64:	|  |      move.l d1,76(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     f68:	|  |      moveq #0,d0
     f6a:	|  |      not.b d0
     f6c:	|  |      sub.l d2,d0
     f6e:	|  |      lsl.w #6,d0
     f70:	|  |      addi.w #20,d0
     f74:	|  |      move.w d0,88(a1)
  WaitBlit();
     f78:	|  |      movea.l (a2),a6
     f7a:	|  |      jsr -228(a6)
  custom->bltcon0 = 0x1fea; // Shift A Channel 1 (Sourceline), Channels A+B+C+D, Minterm: Set if (Channel A = 1 and Channel B = 1) or Channel C = 1 
     f7e:	|  |      movea.l 752dc <custom>,a1
     f84:	|  |      move.w #8170,64(a1)
  custom->bltcon1 = 0x1000; // Shift B Channel 1
     f8a:	|  |      move.w #4096,66(a1)
  custom->bltafwm = 0x7fff;
     f90:	|  |      move.w #32767,68(a1)
  custom->bltcmod = 40; // Skip Right Part of Screen
     f96:	|  |      move.w #40,96(a1)
  custom->bltamod = 40; // Skip Right Part of Screen
     f9c:	|  |      move.w #40,100(a1)
  custom->bltdmod = 40; // Skip Right Part of Screen
     fa2:	|  |      move.w #40,102(a1)
  custom->bltapt = Sw_ViewBufferP1+Sw_CopyLines[Sw_framecountscreen]*40+40;
     fa8:	|  |      move.l 751ac <Sw_framecountscreen>,d0
     fae:	|  |      add.l d0,d0
     fb0:	|  |      move.w (0,a3,d0.l),d1
     fb4:	|  |      move.w d1,d2
     fb6:	|  |      movea.l d2,a0
     fb8:	|  |      addq.l #1,a0
     fba:	|  |      move.l a0,d0
     fbc:	|  |      add.l a0,d0
     fbe:	|  |      add.l d0,d0
     fc0:	|  |      add.l a0,d0
     fc2:	|  |      lsl.l #4,d0
     fc4:	|  |      movea.l 751b0 <Sw_ViewBufferP1>,a0
     fca:	|  |      adda.l d0,a0
     fcc:	|  |      move.l a0,80(a1)
  bltbpd += Sw_CopyLines[Sw_framecountscreen]*40;
     fd0:	|  |      mulu.w #40,d1
     fd4:	|  |      add.l 751ca <Sw_XMaskLeft>,d1
  custom->bltbpt = bltbpd;
     fda:	|  |      move.l d1,76(a1)
  custom->bltcpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;
     fde:	|  |      movea.w #-80,a0
     fe2:	|  |      adda.l d0,a0
     fe4:	|  |      move.l 751b4 <Sw_DrawBuffer>,d0
     fea:	|  |      add.l a0,d0
     fec:	|  |      move.l d0,72(a1)
  custom->bltdpt = Sw_DrawBuffer+Sw_CopyLines[Sw_framecountscreen]*40;    
     ff0:	|  |      move.l d0,84(a1)
  custom->bltsize = (255-Sw_CopyLines[Sw_framecountscreen])*64+20;
     ff4:	|  |      moveq #0,d0
     ff6:	|  |      not.b d0
     ff8:	|  |      sub.l d2,d0
     ffa:	|  |      lsl.w #6,d0
     ffc:	|  |      addi.w #20,d0
    1000:	|  |      move.w d0,88(a1)
  WaitBlit();
    1004:	|  |      movea.l (a2),a6
    1006:	|  |      jsr -228(a6)
  custom->color[0] = 0x00;
    100a:	|  |      movea.l 752dc <custom>,a0
    1010:	|  |      move.w #0,384(a0)
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
    1016:	|  |      move.l 751ac <Sw_framecountscreen>,d0
    101c:	|  |      addq.l #1,d0
    101e:	|  |      moveq #17,d1
    1020:	|  |      cmp.l d0,d1
    1022:	|  |  /-- beq.s 1030 <Sw_Run+0x32c>
    1024:	|  |  |   move.l d0,751ac <Sw_framecountscreen>
}
    102a:	|  |  |   movem.l (sp)+,d2-d5/a2-a4/a6
    102e:	|  |  |   rts
    1030:	|  |  \-> moveq #0,d0
  if(++Sw_framecountscreen == 17) Sw_framecountscreen = 0;
    1032:	|  |      move.l d0,751ac <Sw_framecountscreen>
}
    1038:	|  |      movem.l (sp)+,d2-d5/a2-a4/a6
    103c:	|  |      rts
    Sw_framecount = 0;
    103e:	|  \----> clr.l 5f4de <Sw_framecount>
    Utils_FillLong( (ULONG *) Sw_FontBuffer, 0, 20, 50, 0);
    1044:	|         move.l 751d2 <Sw_FontBuffer>,d3
      *target++ = pattern;
    104a:	|         pea fa0 <Sw_Run+0x29c>
    104e:	|         clr.l -(sp)
    1050:	|         move.l d3,-(sp)
    1052:	|         jsr 5cac <memset>(pc)
    Utils_WriteLine( Sw_font, (ULONG) Sw_FontBuffer, Sw_text+Sw_textoffset);
    1056:	|         movea.l 751a8 <Sw_textoffset>,a3
    105c:	|         adda.l #389004,a3
    1062:	|         move.l 751ce <Sw_font>,d5
    51,35,35,31,34,20,35,42};

void Utils_WriteLine( UWORD *font, ULONG targetbuffer, char *text) {
    
    int x = 0;
    while(x + LetterSize[*text - 0x20] < 640) 
    1068:	|         move.b (a3),d0
    106a:	|         ext.w d0
    106c:	|         movea.w d0,a2
    106e:	|         lea -32(a2),a2
    1072:	|         lea 12(sp),sp
    int x = 0;
    1076:	|         moveq #0,d2
    1078:	|         lea 3d19e <LetterSize>,a4

    custom->bltapt = font+4*50*index;
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    custom->bltbpt = targetlocation;
    custom->bltdpt = targetlocation;
    custom->bltsize = 4+64*50;
    107e:	|         move.w #3204,d4
    WaitBlit();
    1082:	|     /-> movea.l 752d8 <GfxBase>,a6
    1088:	|     |   jsr -228(a6)
    custom->bltamod = 0;
    108c:	|     |   move.w #0,dff064 <_end+0xd89d80>
    custom->bltbmod = 72;
    1094:	|     |   move.w #72,dff062 <_end+0xd89d7e>
    custom->bltdmod = 72;
    109c:	|     |   move.w #72,dff066 <_end+0xd89d82>
    custom->bltafwm = 0xffff;
    10a4:	|     |   move.w #-1,dff044 <_end+0xd89d60>
    custom->bltalwm = 0xffff;
    10ac:	|     |   move.w #-1,dff046 <_end+0xd89d62>
    custom->bltcon1 = 0;  
    10b4:	|     |   move.w #0,dff042 <_end+0xd89d5e>
    custom->bltcon0 = 0xdfc + (restx << 12);
    10bc:	|     |   move.w d2,d0
    10be:	|     |   moveq #12,d1
    10c0:	|     |   lsl.w d1,d0
    10c2:	|     |   addi.w #3580,d0
    10c6:	|     |   move.w d0,dff040 <_end+0xd89d5c>
    custom->bltapt = font+4*50*index;
    10cc:	|     |   move.l a2,d0
    10ce:	|     |   add.l a2,d0
    10d0:	|     |   add.l a2,d0
    10d2:	|     |   lsl.l #3,d0
    10d4:	|     |   add.l a2,d0
    10d6:	|     |   lsl.l #4,d0
    10d8:	|     |   add.l d5,d0
    10da:	|     |   move.l d0,dff050 <_end+0xd89d6c>
    ULONG targetlocation = targetbuffer + 0 + (x >> 4)*2;
    10e0:	|     |   move.l d2,d0
    10e2:	|     |   asr.l #4,d0
    10e4:	|     |   add.l d0,d0
    10e6:	|     |   add.l d3,d0
    custom->bltbpt = targetlocation;
    10e8:	|     |   move.l d0,dff04c <_end+0xd89d68>
    custom->bltdpt = targetlocation;
    10ee:	|     |   move.l d0,dff054 <_end+0xd89d70>
    custom->bltsize = 4+64*50;
    10f4:	|     |   move.w d4,dff058 <_end+0xd89d74>
        x += LetterSize[*text++ - 0x20];
    10fa:	|     |   move.b (a3)+,d0
    10fc:	|     |   ext.w d0
    10fe:	|     |   move.b (-32,a4,d0.w),d0
    1102:	|     |   andi.l #255,d0
    1108:	|     |   add.l d0,d2
    while(x + LetterSize[*text - 0x20] < 640) 
    110a:	|     |   move.b (a3),d0
    110c:	|     |   ext.w d0
    110e:	|     |   movea.w d0,a2
    1110:	|     |   lea -32(a2),a2
    1114:	|     |   moveq #0,d0
    1116:	|     |   move.b (0,a4,a2.l),d0
    111a:	|     |   add.l d2,d0
    111c:	|     |   cmpi.l #639,d0
    1122:	|     \-- ble.w 1082 <Sw_Run+0x37e>
    Sw_textoffset += 40;
    1126:	|         moveq #40,d0
    1128:	|         add.l 751a8 <Sw_textoffset>,d0
    112e:	|         move.l d0,751a8 <Sw_textoffset>
    if( Sw_textoffset >= 32*40) {
    1134:	|         cmpi.l #1279,d0
    113a:	|     /-- ble.s 114a <Sw_Run+0x446>
      Sw_textoffset = 0;
    113c:	|     |   clr.l 751a8 <Sw_textoffset>
      SwScrollerFinished = 1;
    1142:	|     |   move.w #1,752d2 <SwScrollerFinished>
  Sw_framecount++;
    114a:	|     \-> move.l 5f4de <Sw_framecount>,d0
    1150:	|         addq.l #1,d0
    1152:	|         move.l d0,5f4de <Sw_framecount>
  while ( Sw_BlitFrame == 0)
    1158:	\-------- bra.w d1e <Sw_Run+0x1a>

0000115c <Sw_ClBuild>:
UWORD * Sw_ClBuild() {
    115c:	       movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1160:	       movea.l 752e0 <SysBase>,a6
    1166:	       move.l #1360,d0
    116c:	       moveq #2,d1
    116e:	       jsr -198(a6)
    1172:	       movea.l d0,a2
  if( retval == 0) {
    1174:	       tst.l d0
    1176:	   /-- beq.w 12de <Sw_ClBuild+0x182>
    *cl++ = *clpartinstruction++;
    117a:	   |   move.l 5ef4c <Sw_ClsSprites>,(a2)
    1180:	   |   move.l 5ef50 <Sw_ClsSprites+0x4>,4(a2)
    1188:	   |   move.l 5ef54 <Sw_ClsSprites+0x8>,8(a2)
    1190:	   |   move.l 5ef58 <Sw_ClsSprites+0xc>,12(a2)
    1198:	   |   move.l 5ef5c <Sw_ClsSprites+0x10>,16(a2)
    11a0:	   |   move.l 5ef60 <Sw_ClsSprites+0x14>,20(a2)
    11a8:	   |   move.l 5ef64 <Sw_ClsSprites+0x18>,24(a2)
    11b0:	   |   move.l 5ef68 <Sw_ClsSprites+0x1c>,28(a2)
    11b8:	   |   move.l 5ef6c <Sw_ClsSprites+0x20>,32(a2)
    11c0:	   |   move.l 5ef70 <Sw_ClsSprites+0x24>,36(a2)
    11c8:	   |   move.l 5ef74 <Sw_ClsSprites+0x28>,40(a2)
    11d0:	   |   move.l 5ef78 <Sw_ClsSprites+0x2c>,44(a2)
    11d8:	   |   move.l 5ef7c <Sw_ClsSprites+0x30>,48(a2)
    11e0:	   |   move.l 5ef80 <Sw_ClsSprites+0x34>,52(a2)
    11e8:	   |   move.l 5ef84 <Sw_ClsSprites+0x38>,56(a2)
    11f0:	   |   move.l 5ef88 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    11f8:	   |   move.l 5ef1c <Sw_ClScreen>,64(a2)
    1200:	   |   move.l 5ef20 <Sw_ClScreen+0x4>,68(a2)
    1208:	   |   move.l 5ef24 <Sw_ClScreen+0x8>,72(a2)
    1210:	   |   move.l 5ef28 <Sw_ClScreen+0xc>,76(a2)
    1218:	   |   move.l 5ef2c <Sw_ClScreen+0x10>,80(a2)
    1220:	   |   move.l 5ef30 <Sw_ClScreen+0x14>,84(a2)
    1228:	   |   move.l 5ef34 <Sw_ClScreen+0x18>,88(a2)
    1230:	   |   move.l 5ef38 <Sw_ClScreen+0x1c>,92(a2)
    1238:	   |   move.l 5ef3c <Sw_ClScreen+0x20>,96(a2)
    1240:	   |   move.l 5ef40 <Sw_ClScreen+0x24>,100(a2)
    1248:	   |   move.l 5ef44 <Sw_ClScreen+0x28>,104(a2)
    1250:	   |   move.l 5ef48 <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    1258:	   |   move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    1260:	   |   move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    1268:	   |   move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    1270:	   |   move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    1278:	   |   move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    1280:	   |   move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    1288:	   |   move.l 5eedc <Sw_ClColor>,136(a2)
    1290:	   |   move.l 5eee0 <Sw_ClColor+0x4>,140(a2)
    1298:	   |   move.l 5eee4 <Sw_ClColor+0x8>,144(a2)
    12a0:	   |   move.l 5eee8 <Sw_ClColor+0xc>,148(a2)
  clpartinstruction = Sw_ClColorDim;
    12a8:	   |   movea.l 751c2 <Sw_ClColorDim>,a0
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    12ae:	   |   lea 152(a2),a1
    12b2:	   |   move.l a0,d0
    12b4:	   |   addi.l #444,d0
    *cl++ = *clpartinstruction++;
    12ba:	/--|-> move.l (a0)+,(a1)+
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    12bc:	|  |   cmp.l a0,d0
    12be:	+--|-- bne.s 12ba <Sw_ClBuild+0x15e>
  *cl++ = 0x20bffffe;
    12c0:	|  |   move.l #549453822,596(a2)
  *cl++ = 0x009c8010;
    12c8:	|  |   move.l #10256400,600(a2)
  *cl++ = 0xfffffffe;
    12d0:	|  |   moveq #-2,d0
    12d2:	|  |   move.l d0,604(a2)
}
    12d6:	|  |   move.l a2,d0
    12d8:	|  |   movem.l (sp)+,d2-d3/a2/a6
    12dc:	|  |   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    12de:	|  \-> movea.l 752d4 <DOSBase>,a6
    12e4:	|      jsr -60(a6)
    12e8:	|      movea.l 752d4 <DOSBase>,a6
    12ee:	|      move.l d0,d1
    12f0:	|      move.l #224803,d2
    12f6:	|      moveq #40,d3
    12f8:	|      jsr -48(a6)
    Exit(1);
    12fc:	|      movea.l 752d4 <DOSBase>,a6
    1302:	|      moveq #1,d1
    1304:	|      jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1308:	|      move.l 5ef4c <Sw_ClsSprites>,(a2)
    130e:	|      move.l 5ef50 <Sw_ClsSprites+0x4>,4(a2)
    1316:	|      move.l 5ef54 <Sw_ClsSprites+0x8>,8(a2)
    131e:	|      move.l 5ef58 <Sw_ClsSprites+0xc>,12(a2)
    1326:	|      move.l 5ef5c <Sw_ClsSprites+0x10>,16(a2)
    132e:	|      move.l 5ef60 <Sw_ClsSprites+0x14>,20(a2)
    1336:	|      move.l 5ef64 <Sw_ClsSprites+0x18>,24(a2)
    133e:	|      move.l 5ef68 <Sw_ClsSprites+0x1c>,28(a2)
    1346:	|      move.l 5ef6c <Sw_ClsSprites+0x20>,32(a2)
    134e:	|      move.l 5ef70 <Sw_ClsSprites+0x24>,36(a2)
    1356:	|      move.l 5ef74 <Sw_ClsSprites+0x28>,40(a2)
    135e:	|      move.l 5ef78 <Sw_ClsSprites+0x2c>,44(a2)
    1366:	|      move.l 5ef7c <Sw_ClsSprites+0x30>,48(a2)
    136e:	|      move.l 5ef80 <Sw_ClsSprites+0x34>,52(a2)
    1376:	|      move.l 5ef84 <Sw_ClsSprites+0x38>,56(a2)
    137e:	|      move.l 5ef88 <Sw_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    1386:	|      move.l 5ef1c <Sw_ClScreen>,64(a2)
    138e:	|      move.l 5ef20 <Sw_ClScreen+0x4>,68(a2)
    1396:	|      move.l 5ef24 <Sw_ClScreen+0x8>,72(a2)
    139e:	|      move.l 5ef28 <Sw_ClScreen+0xc>,76(a2)
    13a6:	|      move.l 5ef2c <Sw_ClScreen+0x10>,80(a2)
    13ae:	|      move.l 5ef30 <Sw_ClScreen+0x14>,84(a2)
    13b6:	|      move.l 5ef34 <Sw_ClScreen+0x18>,88(a2)
    13be:	|      move.l 5ef38 <Sw_ClScreen+0x1c>,92(a2)
    13c6:	|      move.l 5ef3c <Sw_ClScreen+0x20>,96(a2)
    13ce:	|      move.l 5ef40 <Sw_ClScreen+0x24>,100(a2)
    13d6:	|      move.l 5ef44 <Sw_ClScreen+0x28>,104(a2)
    13de:	|      move.l 5ef48 <Sw_ClScreen+0x2c>,108(a2)
  *cl++ = 0x00e00000;
    13e6:	|      move.l #14680064,112(a2)
  *cl++ = 0x00e20000;
    13ee:	|      move.l #14811136,116(a2)
  *cl++ = 0x00e40000;
    13f6:	|      move.l #14942208,120(a2)
  *cl++ = 0x00e60000;
    13fe:	|      move.l #15073280,124(a2)
  *cl++ = 0x00e80000;
    1406:	|      move.l #15204352,128(a2)
  *cl++ = 0x00ea0000;
    140e:	|      move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    1416:	|      move.l 5eedc <Sw_ClColor>,136(a2)
    141e:	|      move.l 5eee0 <Sw_ClColor+0x4>,140(a2)
    1426:	|      move.l 5eee4 <Sw_ClColor+0x8>,144(a2)
    142e:	|      move.l 5eee8 <Sw_ClColor+0xc>,148(a2)
  clpartinstruction = Sw_ClColorDim;
    1436:	|      movea.l 751c2 <Sw_ClColorDim>,a0
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    143c:	|      lea 152(a2),a1
    1440:	|      move.l a0,d0
    1442:	|      addi.l #444,d0
    1448:	\----- bra.w 12ba <Sw_ClBuild+0x15e>

0000144c <Sw_LoadResources>:
void Sw_LoadResources() {
    144c:	                            movem.l d2-d4/a6,-(sp)
    BPTR filehandler = Open("font.fnt", MODE_OLDFILE);
    1450:	                            movea.l 752d4 <DOSBase>,a6
    1456:	                            move.l #224841,d1
    145c:	                            move.l #1005,d2
    1462:	                            jsr -30(a6)
    1466:	                            move.l d0,d4
    if( filehandler == 0) {
    1468:	                        /-- bne.s 1488 <Sw_LoadResources+0x3c>
      Write(Output(), "Error loading font.fnt\n", 24);
    146a:	                        |   movea.l 752d4 <DOSBase>,a6
    1470:	                        |   jsr -60(a6)
    1474:	                        |   movea.l 752d4 <DOSBase>,a6
    147a:	                        |   move.l d0,d1
    147c:	                        |   move.l #224850,d2
    1482:	                        |   moveq #24,d3
    1484:	                        |   jsr -48(a6)
    Sw_font = AllocMem(38000, MEMF_CHIP);
    1488:	                        \-> movea.l 752e0 <SysBase>,a6
    148e:	                            move.l #38000,d0
    1494:	                            moveq #2,d1
    1496:	                            jsr -198(a6)
    149a:	                            move.l d0,d2
    149c:	                            move.l d0,751ce <Sw_font>
    if(Sw_font == 0) {
    14a2:	   /----------------------- beq.w 1746 <Sw_LoadResources+0x2fa>
    ULONG readlength = Read(  filehandler, Sw_font, 38000);
    14a6:	/--|----------------------> movea.l 752d4 <DOSBase>,a6
    14ac:	|  |                        move.l d4,d1
    14ae:	|  |                        move.l #38000,d3
    14b4:	|  |                        jsr -42(a6)
    if( readlength == 0) {
    14b8:	|  |                        tst.l d0
    14ba:	|  |                    /-- bne.s 14e6 <Sw_LoadResources+0x9a>
      Write(Output(), "Cannot read Sw_font.\n", 37);
    14bc:	|  |                    |   movea.l 752d4 <DOSBase>,a6
    14c2:	|  |                    |   jsr -60(a6)
    14c6:	|  |                    |   movea.l 752d4 <DOSBase>,a6
    14cc:	|  |                    |   move.l d0,d1
    14ce:	|  |                    |   move.l #224911,d2
    14d4:	|  |                    |   moveq #37,d3
    14d6:	|  |                    |   jsr -48(a6)
      Exit(1);
    14da:	|  |                    |   movea.l 752d4 <DOSBase>,a6
    14e0:	|  |                    |   moveq #1,d1
    14e2:	|  |                    |   jsr -144(a6)
    filehandler = Open("xmaskleft.raw", MODE_OLDFILE);
    14e6:	|  |                    \-> movea.l 752d4 <DOSBase>,a6
    14ec:	|  |                        move.l #224933,d1
    14f2:	|  |                        move.l #1005,d2
    14f8:	|  |                        jsr -30(a6)
    14fc:	|  |                        move.l d0,d4
    if( filehandler == 0) {
    14fe:	|  |                    /-- bne.s 151e <Sw_LoadResources+0xd2>
      Write(Output(), "Error loading xmaskleft.raw\n", 29);
    1500:	|  |                    |   movea.l 752d4 <DOSBase>,a6
    1506:	|  |                    |   jsr -60(a6)
    150a:	|  |                    |   movea.l 752d4 <DOSBase>,a6
    1510:	|  |                    |   move.l d0,d1
    1512:	|  |                    |   move.l #224947,d2
    1518:	|  |                    |   moveq #29,d3
    151a:	|  |                    |   jsr -48(a6)
    Sw_XMaskLeft = AllocMem(10240, MEMF_CHIP);
    151e:	|  |                    \-> movea.l 752e0 <SysBase>,a6
    1524:	|  |                        move.l #10240,d0
    152a:	|  |                        moveq #2,d1
    152c:	|  |                        jsr -198(a6)
    1530:	|  |                        move.l d0,d2
    1532:	|  |                        move.l d0,751ca <Sw_XMaskLeft>
    if(Sw_XMaskLeft == 0) {
    1538:	|  |     /----------------- beq.w 1712 <Sw_LoadResources+0x2c6>
    readlength = Read(  filehandler, Sw_XMaskLeft, 10240);
    153c:	|  |  /--|----------------> movea.l 752d4 <DOSBase>,a6
    1542:	|  |  |  |                  move.l d4,d1
    1544:	|  |  |  |                  move.l #10240,d3
    154a:	|  |  |  |                  jsr -42(a6)
    if( readlength == 0) {
    154e:	|  |  |  |                  tst.l d0
    1550:	|  |  |  |              /-- bne.s 157c <Sw_LoadResources+0x130>
      Write(Output(), "Cannot read xmaskleft.raw\n", 27);
    1552:	|  |  |  |              |   movea.l 752d4 <DOSBase>,a6
    1558:	|  |  |  |              |   jsr -60(a6)
    155c:	|  |  |  |              |   movea.l 752d4 <DOSBase>,a6
    1562:	|  |  |  |              |   move.l d0,d1
    1564:	|  |  |  |              |   move.l #225018,d2
    156a:	|  |  |  |              |   moveq #27,d3
    156c:	|  |  |  |              |   jsr -48(a6)
      Exit(1);
    1570:	|  |  |  |              |   movea.l 752d4 <DOSBase>,a6
    1576:	|  |  |  |              |   moveq #1,d1
    1578:	|  |  |  |              |   jsr -144(a6)
    filehandler = Open("xmaskright.raw", MODE_OLDFILE);
    157c:	|  |  |  |              \-> movea.l 752d4 <DOSBase>,a6
    1582:	|  |  |  |                  move.l #225045,d1
    1588:	|  |  |  |                  move.l #1005,d2
    158e:	|  |  |  |                  jsr -30(a6)
    1592:	|  |  |  |                  move.l d0,d4
    if( filehandler == 0) {
    1594:	|  |  |  |              /-- bne.s 15b4 <Sw_LoadResources+0x168>
      Write(Output(), "Error loading xmaskright.raw\n", 29);
    1596:	|  |  |  |              |   movea.l 752d4 <DOSBase>,a6
    159c:	|  |  |  |              |   jsr -60(a6)
    15a0:	|  |  |  |              |   movea.l 752d4 <DOSBase>,a6
    15a6:	|  |  |  |              |   move.l d0,d1
    15a8:	|  |  |  |              |   move.l #225060,d2
    15ae:	|  |  |  |              |   moveq #29,d3
    15b0:	|  |  |  |              |   jsr -48(a6)
    Sw_XMaskRight = AllocMem(10240, MEMF_CHIP);
    15b4:	|  |  |  |              \-> movea.l 752e0 <SysBase>,a6
    15ba:	|  |  |  |                  move.l #10240,d0
    15c0:	|  |  |  |                  moveq #2,d1
    15c2:	|  |  |  |                  jsr -198(a6)
    15c6:	|  |  |  |                  move.l d0,d2
    15c8:	|  |  |  |                  move.l d0,751c6 <Sw_XMaskRight>
    if(Sw_XMaskRight == 0) {
    15ce:	|  |  |  |     /----------- beq.w 16de <Sw_LoadResources+0x292>
    readlength = Read(  filehandler, Sw_XMaskRight, 10240);
    15d2:	|  |  |  |  /--|----------> movea.l 752d4 <DOSBase>,a6
    15d8:	|  |  |  |  |  |            move.l d4,d1
    15da:	|  |  |  |  |  |            move.l #10240,d3
    15e0:	|  |  |  |  |  |            jsr -42(a6)
    if( readlength == 0) {
    15e4:	|  |  |  |  |  |            tst.l d0
    15e6:	|  |  |  |  |  |        /-- bne.s 1612 <Sw_LoadResources+0x1c6>
      Write(Output(), "Cannot read xmaskleft.raw\n", 27);
    15e8:	|  |  |  |  |  |        |   movea.l 752d4 <DOSBase>,a6
    15ee:	|  |  |  |  |  |        |   jsr -60(a6)
    15f2:	|  |  |  |  |  |        |   movea.l 752d4 <DOSBase>,a6
    15f8:	|  |  |  |  |  |        |   move.l d0,d1
    15fa:	|  |  |  |  |  |        |   move.l #225018,d2
    1600:	|  |  |  |  |  |        |   moveq #27,d3
    1602:	|  |  |  |  |  |        |   jsr -48(a6)
      Exit(1);
    1606:	|  |  |  |  |  |        |   movea.l 752d4 <DOSBase>,a6
    160c:	|  |  |  |  |  |        |   moveq #1,d1
    160e:	|  |  |  |  |  |        |   jsr -144(a6)
    filehandler = Open("clcolordim.raw", MODE_OLDFILE);
    1612:	|  |  |  |  |  |        \-> movea.l 752d4 <DOSBase>,a6
    1618:	|  |  |  |  |  |            move.l #225090,d1
    161e:	|  |  |  |  |  |            move.l #1005,d2
    1624:	|  |  |  |  |  |            jsr -30(a6)
    1628:	|  |  |  |  |  |            move.l d0,d4
    if( filehandler == 0) {
    162a:	|  |  |  |  |  |        /-- bne.s 164a <Sw_LoadResources+0x1fe>
      Write(Output(), "Error loading clcolordimg.raw\n", 29);
    162c:	|  |  |  |  |  |        |   movea.l 752d4 <DOSBase>,a6
    1632:	|  |  |  |  |  |        |   jsr -60(a6)
    1636:	|  |  |  |  |  |        |   movea.l 752d4 <DOSBase>,a6
    163c:	|  |  |  |  |  |        |   move.l d0,d1
    163e:	|  |  |  |  |  |        |   move.l #225105,d2
    1644:	|  |  |  |  |  |        |   moveq #29,d3
    1646:	|  |  |  |  |  |        |   jsr -48(a6)
    Sw_ClColorDim = AllocMem(22644, MEMF_CHIP);
    164a:	|  |  |  |  |  |        \-> movea.l 752e0 <SysBase>,a6
    1650:	|  |  |  |  |  |            move.l #22644,d0
    1656:	|  |  |  |  |  |            moveq #2,d1
    1658:	|  |  |  |  |  |            jsr -198(a6)
    165c:	|  |  |  |  |  |            move.l d0,d2
    165e:	|  |  |  |  |  |            move.l d0,751c2 <Sw_ClColorDim>
    if(Sw_ClColorDim == 0) {
    1664:	|  |  |  |  |  |     /----- beq.s 16ac <Sw_LoadResources+0x260>
    readlength = Read(  filehandler, Sw_ClColorDim, 22644);
    1666:	|  |  |  |  |  |  /--|----> movea.l 752d4 <DOSBase>,a6
    166c:	|  |  |  |  |  |  |  |      move.l d4,d1
    166e:	|  |  |  |  |  |  |  |      move.l #22644,d3
    1674:	|  |  |  |  |  |  |  |      jsr -42(a6)
    if( readlength == 0) {
    1678:	|  |  |  |  |  |  |  |      tst.l d0
    167a:	|  |  |  |  |  |  |  |  /-- bne.s 16a6 <Sw_LoadResources+0x25a>
      Write(Output(), "Cannot read clcolordim.raw\n", 29);
    167c:	|  |  |  |  |  |  |  |  |   movea.l 752d4 <DOSBase>,a6
    1682:	|  |  |  |  |  |  |  |  |   jsr -60(a6)
    1686:	|  |  |  |  |  |  |  |  |   movea.l 752d4 <DOSBase>,a6
    168c:	|  |  |  |  |  |  |  |  |   move.l d0,d1
    168e:	|  |  |  |  |  |  |  |  |   move.l #225179,d2
    1694:	|  |  |  |  |  |  |  |  |   moveq #29,d3
    1696:	|  |  |  |  |  |  |  |  |   jsr -48(a6)
      Exit(1);
    169a:	|  |  |  |  |  |  |  |  |   movea.l 752d4 <DOSBase>,a6
    16a0:	|  |  |  |  |  |  |  |  |   moveq #1,d1
    16a2:	|  |  |  |  |  |  |  |  |   jsr -144(a6)
}
    16a6:	|  |  |  |  |  |  |  |  \-> movem.l (sp)+,d2-d4/a6
    16aa:	|  |  |  |  |  |  |  |      rts
      Write(Output(), "Cannot allocate Memory for clcolordim.raw\n", 43);
    16ac:	|  |  |  |  |  |  |  \----> movea.l 752d4 <DOSBase>,a6
    16b2:	|  |  |  |  |  |  |         jsr -60(a6)
    16b6:	|  |  |  |  |  |  |         movea.l 752d4 <DOSBase>,a6
    16bc:	|  |  |  |  |  |  |         move.l d0,d1
    16be:	|  |  |  |  |  |  |         move.l #225136,d2
    16c4:	|  |  |  |  |  |  |         moveq #43,d3
    16c6:	|  |  |  |  |  |  |         jsr -48(a6)
      Exit(1);
    16ca:	|  |  |  |  |  |  |         movea.l 752d4 <DOSBase>,a6
    16d0:	|  |  |  |  |  |  |         moveq #1,d1
    16d2:	|  |  |  |  |  |  |         jsr -144(a6)
    readlength = Read(  filehandler, Sw_ClColorDim, 22644);
    16d6:	|  |  |  |  |  |  |         move.l 751c2 <Sw_ClColorDim>,d2
    16dc:	|  |  |  |  |  |  \-------- bra.s 1666 <Sw_LoadResources+0x21a>
      Write(Output(), "Cannot allocate Memory for xmaskleft.raw\n", 42);
    16de:	|  |  |  |  |  \----------> movea.l 752d4 <DOSBase>,a6
    16e4:	|  |  |  |  |               jsr -60(a6)
    16e8:	|  |  |  |  |               movea.l 752d4 <DOSBase>,a6
    16ee:	|  |  |  |  |               move.l d0,d1
    16f0:	|  |  |  |  |               move.l #224976,d2
    16f6:	|  |  |  |  |               moveq #42,d3
    16f8:	|  |  |  |  |               jsr -48(a6)
      Exit(1);
    16fc:	|  |  |  |  |               movea.l 752d4 <DOSBase>,a6
    1702:	|  |  |  |  |               moveq #1,d1
    1704:	|  |  |  |  |               jsr -144(a6)
    readlength = Read(  filehandler, Sw_XMaskRight, 10240);
    1708:	|  |  |  |  |               move.l 751c6 <Sw_XMaskRight>,d2
    170e:	|  |  |  |  \-------------- bra.w 15d2 <Sw_LoadResources+0x186>
      Write(Output(), "Cannot allocate Memory for xmaskleft.raw\n", 42);
    1712:	|  |  |  \----------------> movea.l 752d4 <DOSBase>,a6
    1718:	|  |  |                     jsr -60(a6)
    171c:	|  |  |                     movea.l 752d4 <DOSBase>,a6
    1722:	|  |  |                     move.l d0,d1
    1724:	|  |  |                     move.l #224976,d2
    172a:	|  |  |                     moveq #42,d3
    172c:	|  |  |                     jsr -48(a6)
      Exit(1);
    1730:	|  |  |                     movea.l 752d4 <DOSBase>,a6
    1736:	|  |  |                     moveq #1,d1
    1738:	|  |  |                     jsr -144(a6)
    readlength = Read(  filehandler, Sw_XMaskLeft, 10240);
    173c:	|  |  |                     move.l 751ca <Sw_XMaskLeft>,d2
    1742:	|  |  \-------------------- bra.w 153c <Sw_LoadResources+0xf0>
      Write(Output(), "Cannot allocate Memory for Sw_font.\n", 37);
    1746:	|  \----------------------> movea.l 752d4 <DOSBase>,a6
    174c:	|                           jsr -60(a6)
    1750:	|                           movea.l 752d4 <DOSBase>,a6
    1756:	|                           move.l d0,d1
    1758:	|                           move.l #224874,d2
    175e:	|                           moveq #37,d3
    1760:	|                           jsr -48(a6)
      Exit(1);
    1764:	|                           movea.l 752d4 <DOSBase>,a6
    176a:	|                           moveq #1,d1
    176c:	|                           jsr -144(a6)
    ULONG readlength = Read(  filehandler, Sw_font, 38000);
    1770:	|                           move.l 751ce <Sw_font>,d2
    1776:	\-------------------------- bra.w 14a6 <Sw_LoadResources+0x5a>

0000177a <Sw_SetBplPointers>:
  Fr2   Fr1   Fr3  Fr2      Fr1       Bf2 Bf1      Bf3  
  x     Fr2   Fr3  Fr2      Fr2       Bf2 Bf1      Bf1 (repeat)
  Fr3   Fr2   Fr4  Fr3      Fr2       Bf3 Bf2      Bf1
  x     Fr3   Fr4  Fr3      Fr3       Bf3 Bf2      Bf2*/

  Sw_DrawBuffer = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset];
    177a:	moveq #0,d0
    177c:	move.w 751a4 <Sw_ScreenBufferOffset>,d0
    1782:	lea 75168 <Sw_ScreenBufferList>,a0
    1788:	move.l d0,d1
    178a:	add.l d0,d1
    178c:	add.l d1,d1
    178e:	move.l (0,a0,d1.l),751b4 <Sw_DrawBuffer>
  Sw_ViewBufferP1 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1];
    1796:	addq.l #1,d0
    1798:	add.l d0,d0
    179a:	add.l d0,d0
    179c:	move.l (0,a0,d0.l),d0
    17a0:	move.l d0,751b0 <Sw_ViewBufferP1>
  Sw_ViewBufferP2 = (UWORD *)Sw_ScreenBufferList[Sw_ScreenBufferOffset+1]+40;
    17a6:	moveq #80,d1
    17a8:	add.l d0,d1

  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  

  UWORD *copword = (UWORD *) Sw_DrawCopper;
    17aa:	movea.l 75164 <Sw_DrawCopper>,a0
  UWORD lowword = (ULONG)Sw_ViewBufferP1 & 0xffff;  
    17b0:	move.w d0,118(a0)
  UWORD highword = (ULONG)Sw_ViewBufferP1 >> 16;
    17b4:	clr.w d0
    17b6:	swap d0
    17b8:	move.w d0,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
  lowword = (ULONG)Sw_ViewBufferP2 & 0xffff;
    17bc:	move.w d1,126(a0)
  highword = (ULONG)Sw_ViewBufferP2 >> 16;
    17c0:	clr.w d1
    17c2:	swap d1
    17c4:	move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

}
    17c8:	rts

000017ca <Sw_ClearColors>:

UWORD ColPos = 0;

void Sw_ClearColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    17ca:	movea.l 75164 <Sw_DrawCopper>,a0
  cl = (ULONG *) &copword[COPCOLOR];
  *cl++ = 0x1820000;
    17d0:	move.l #25296896,136(a0)
  *cl++ = 0x1840000;
    17d8:	move.l #25427968,140(a0)
  *cl++ = 0x1860000;
    17e0:	move.l #25559040,144(a0)
  *cl++ = 0xfffffffe;
    17e8:	moveq #-2,d0
    17ea:	move.l d0,148(a0)
}
    17ee:	rts

000017f0 <Sw_SetColors>:

void Sw_SetColors() {
  ULONG *cl;
  UWORD *copword = Sw_DrawCopper;
    17f0:	          movea.l 75164 <Sw_DrawCopper>,a1
  cl = (ULONG *) &copword[COPCOLOR];
  for(int i=0;i<4;i++) {
    *cl++ = Sw_ClColor[FrameCountBufferDraw*4+i];
    17f6:	          move.w 5eed8 <FrameCountBufferDraw>,d0
    17fc:	          lea 5eedc <Sw_ClColor>,a0
    1802:	          andi.l #65535,d0
    1808:	          lsl.l #4,d0
    180a:	          move.l (0,a0,d0.l),136(a1)
    1810:	          move.w 5eed8 <FrameCountBufferDraw>,d0
    1816:	          andi.l #65535,d0
    181c:	          add.l d0,d0
    181e:	          add.l d0,d0
    1820:	          addq.l #1,d0
    1822:	          add.l d0,d0
    1824:	          add.l d0,d0
    1826:	          move.l (0,a0,d0.l),140(a1)
    182c:	          move.w 5eed8 <FrameCountBufferDraw>,d0
    1832:	          andi.l #65535,d0
    1838:	          add.l d0,d0
    183a:	          add.l d0,d0
    183c:	          addq.l #2,d0
    183e:	          add.l d0,d0
    1840:	          add.l d0,d0
    1842:	          move.l (0,a0,d0.l),144(a1)
    1848:	          move.w 5eed8 <FrameCountBufferDraw>,d0
    184e:	          andi.l #65535,d0
    1854:	          add.l d0,d0
    1856:	          add.l d0,d0
    1858:	          addq.l #3,d0
    185a:	          add.l d0,d0
    185c:	          add.l d0,d0
    185e:	          move.l (0,a0,d0.l),148(a1)
  }
  if( ColPos == 12) {
    1864:	          cmpi.w #12,75162 <ColPos>
    186c:	   /----- beq.s 18a6 <Sw_SetColors+0xb6>
    ColPos = 0;
  }

  ULONG *clpartinstruction;

  clpartinstruction = Sw_ClColorDim + Sw_ClColorDimPos;
    186e:	/--|----> move.w 75160 <Sw_ClColorDimPos>,d1
    1874:	|  |      moveq #0,d0
    1876:	|  |      move.w d1,d0
    1878:	|  |      movea.l 751c2 <Sw_ClColorDim>,a0
    187e:	|  |      adda.l d0,a0
  Sw_ClColorDimPos += Sw_ClColorDimLength*4;
    1880:	|  |      addi.w #444,d1

  if(Sw_ClColorDimPos >= Sw_ClColorDimLength*51*4) {
    1884:	|  |      cmpi.w #22643,d1
    1888:	|  |  /-- bls.s 188c <Sw_SetColors+0x9c>
    188a:	|  |  |   clr.w d1
    Sw_ClColorDimPos = 0;
    188c:	|  |  \-> move.w d1,75160 <Sw_ClColorDimPos>
    1892:	|  |      lea 152(a1),a1
    1896:	|  |      move.l a0,d0
    1898:	|  |      addi.l #444,d0
  }  

  for(int i=0; i<Sw_ClColorDimLength;i++) 
  {
    *cl++ = *clpartinstruction++;
    189e:	|  |  /-> move.l (a0)+,(a1)+
  for(int i=0; i<Sw_ClColorDimLength;i++) 
    18a0:	|  |  |   cmp.l a0,d0
    18a2:	|  |  \-- bne.s 189e <Sw_SetColors+0xae>

  }
}
    18a4:	|  |      rts
    ColPos = 0;
    18a6:	|  \----> clr.w 75162 <ColPos>
    18ac:	\-------- bra.s 186e <Sw_SetColors+0x7e>

000018ae <Sw_VblankHandler>:
  custom->intreq = 0x0020;
    18ae:	    movea.l 752dc <custom>,a0
    18b4:	    move.w #32,156(a0)
  if(Sw_MusicDelay > 0) {
    18ba:	    move.w 5eeda <Sw_MusicDelay>,d0
    18c0:	/-- beq.s 18ca <Sw_VblankHandler+0x1c>
    Sw_MusicDelay--;
    18c2:	|   subq.w #1,d0
    18c4:	|   move.w d0,5eeda <Sw_MusicDelay>
  if( Sw_InitComplete == 1) {
    18ca:	\-> cmpi.w #1,751a6 <Sw_InitComplete>
    18d2:	/-- beq.s 18d6 <Sw_VblankHandler+0x28>
}
    18d4:	|   rts
    if( FrameCountBufferDraw == 2) {
    18d6:	\-> move.w 5eed8 <FrameCountBufferDraw>,d0
    18dc:	    cmpi.w #2,d0
    18e0:	/-- beq.s 18f8 <Sw_VblankHandler+0x4a>
      FrameCountBufferDraw++;
    18e2:	|   move.w 5eed8 <FrameCountBufferDraw>,d0
    18e8:	|   addq.w #1,d0
    18ea:	|   move.w d0,5eed8 <FrameCountBufferDraw>
    Sw_SetBplPointers();
    18f0:	|   jsr 177a <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    18f4:	|   bra.w 17f0 <Sw_SetColors>
      FrameCountBufferDraw = 0;
    18f8:	\-> move.w #0,5eed8 <FrameCountBufferDraw>
      Sw_BlitFrame = 1;
    1900:	    move.w #1,751b8 <Sw_BlitFrame>
      if(Sw_ScreenBufferOffset == 0) { 
    1908:	    tst.w 751a4 <Sw_ScreenBufferOffset>
    190e:	/-- bne.s 1920 <Sw_VblankHandler+0x72>
        Sw_ScreenBufferOffset = 2; 
    1910:	|   move.w #2,751a4 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1918:	|   jsr 177a <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    191c:	|   bra.w 17f0 <Sw_SetColors>
        Sw_ScreenBufferOffset = 0; 
    1920:	\-> clr.w 751a4 <Sw_ScreenBufferOffset>
    Sw_SetBplPointers();
    1926:	    jsr 177a <Sw_SetBplPointers>(pc)
    Sw_SetColors();   
    192a:	    bra.w 17f0 <Sw_SetColors>

0000192e <End_Run>:
                   0x1800000,0x1820f00,0x1840000, 0x1860f00
                  };     */

void End_Run() {                                     
  End_DrawScreen();
}
    192e:	rts

00001930 <End_VblankHandler>:
struct Interrupt *End_Vbint;
UWORD End_ScreenBufferOffset = 0;

void End_VblankHandler() {

  custom->intreq = 0x0020;
    1930:	movea.l 752dc <custom>,a0
    1936:	move.w #32,156(a0)
  //p61Music();
}
    193c:	rts

0000193e <SetCl>:
{ //Save Dma Space by disabling bitplanes for black lines  
    193e:	                                                             lea -20(sp),sp
    1942:	                                                             movem.l d2-d5/a2,-(sp)
    1946:	                                                             move.l 44(sp),d1
  UWORD *tmp = (UWORD *) DrawCopper + 84;
    194a:	                                                             movea.l 752b2 <DrawCopper>,a1
    1950:	                                                             lea 168(a1),a2
  if(DrawBuffer->maxytotal < 0) {
    1954:	                                                             movea.l 75154 <DrawBuffer>,a0
    195a:	                                                             move.w 52(a0),d0
    195e:	                                                /----------- bmi.w 1afe <SetCl+0x1c0>
  } else if(DrawBuffer->minytotal < 0) {
    1962:	                                                |            move.w 54(a0),d2
    1966:	                                                |     /----- bmi.w 1aba <SetCl+0x17c>
    firstdrawline = DrawBuffer->minytotal;
    196a:	                                                |     |      move.w d2,d3
        line = (firstdrawline + 0x2c - 255) << 8;
    196c:	                                                |     |      move.w d2,d4
    196e:	                                                |     |      lsl.w #8,d4
        *tmp++ = line + 0x001;
    1970:	                                                |     |      addi.w #11521,d4
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1974:	                                                |     |      cmp.w d1,d0
    1976:	                                          /-----|-----|----- bhi.w 1ba6 <SetCl+0x268>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    197a:	                                          |     |     |      move.w #70,30(sp)
    1980:	                                          |     |     |      move.w d2,32(sp)
    1984:	                                          |     |     |      move.w #109,34(sp)
    198a:	                                          |     |     |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1990:	                                          |     |     |      clr.w 20(sp)
    1994:	                                          |     |     |      move.w #1,22(sp)
    199a:	                                          |     |     |      move.w #2,24(sp)
    19a0:	                                          |     |     |      move.w #3,26(sp)
    19a6:	                                          |     |     |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    19ac:	                                          |     |     |      cmpi.w #69,d2
    19b0:	                                       /--|-----|-----|----- bhi.w 1b3c <SetCl+0x1fe>
              values[j] = values[j + 1];
    19b4:	                                       |  |  /--|-----|----> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    19b8:	                                       |  |  |  |     |      move.w #1,20(sp)
              values[j + 1] = temp;
    19be:	                                       |  |  |  |     |      move.w #70,32(sp)
              ids[j + 1] = temp2;
    19c4:	                                       |  |  |  |     |      clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    19c8:	                                       |  |  |  |     |      moveq #70,d0
    19ca:	/--------------------------------------|--|--|--|-----|----> cmp.w 36(sp),d1
    19ce:	|                                      |  |  |  |     |  /-- bcc.s 19e0 <SetCl+0xa2>
              int temp2 = ids[j];
    19d0:	|                                      |  |  |  |     |  |   move.w 26(sp),28(sp)
              values[j] = values[j + 1];
    19d6:	|                                      |  |  |  |     |  |   move.w d1,36(sp)
              ids[j] = ids[j + 1];
    19da:	|                                      |  |  |  |     |  |   move.w #4,26(sp)
          if (values[j] > values[j + 1]) {
    19e0:	|                                      |  |  |  |     |  \-> movea.w 30(sp),a0
    19e4:	|                                      |  |  |  |     |      cmp.w a0,d0
    19e6:	|                                      |  |  |  |     |  /-- bcc.s 1a04 <SetCl+0xc6>
              int temp2 = ids[j];
    19e8:	|                                      |  |  |  |     |  |   move.w 20(sp),d5
              values[j] = values[j + 1];
    19ec:	|                                      |  |  |  |     |  |   move.w d0,d2
    19ee:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    19f2:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    19f8:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    19fc:	|                                      |  |  |  |     |  |   move.w d5,22(sp)
    1a00:	|                                      |  |  |  |     |  |   move.w a0,d0
    1a02:	|                                      |  |  |  |     |  |   movea.w d2,a0
          if (values[j] > values[j + 1]) {
    1a04:	|                                      |  |  |  |     |  \-> move.w 34(sp),d2
    1a08:	|                                      |  |  |  |     |      cmp.w d0,d2
    1a0a:	|                                      |  |  |  |     |  /-- bcc.s 1a24 <SetCl+0xe6>
              int temp2 = ids[j];
    1a0c:	|                                      |  |  |  |     |  |   move.w 22(sp),d5
              values[j] = values[j + 1];
    1a10:	|                                      |  |  |  |     |  |   move.w d2,32(sp)
              ids[j] = ids[j + 1];
    1a14:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              values[j + 1] = temp;
    1a1a:	|                                      |  |  |  |     |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    1a1e:	|                                      |  |  |  |     |  |   move.w d5,24(sp)
    1a22:	|                                      |  |  |  |     |  |   move.w d2,d0
          if (values[j] > values[j + 1]) {
    1a24:	|                                      |  |  |  |     |  \-> move.w 36(sp),d2
    1a28:	|                                      |  |  |  |     |      cmp.w 34(sp),d2
    1a2c:	|                                      |  |  |  |     |  /-- bcc.s 1a40 <SetCl+0x102>
              int temp2 = ids[j];
    1a2e:	|                                      |  |  |  |     |  |   move.w 24(sp),d5
              values[j] = values[j + 1];
    1a32:	|                                      |  |  |  |     |  |   move.w d2,34(sp)
              ids[j] = ids[j + 1];
    1a36:	|                                      |  |  |  |     |  |   move.w 26(sp),24(sp)
              ids[j + 1] = temp2;
    1a3c:	|                                      |  |  |  |     |  |   move.w d5,26(sp)
          if (values[j] > values[j + 1]) {
    1a40:	|                                      |  |  |  |     |  \-> cmp.w a0,d0
    1a42:	|                                      |  |  |  |     |  /-- bcc.s 1a5a <SetCl+0x11c>
              int temp2 = ids[j];
    1a44:	|                                      |  |  |  |     |  |   move.w 20(sp),d2
              values[j] = values[j + 1];
    1a48:	|                                      |  |  |  |     |  |   move.w d0,30(sp)
              ids[j] = ids[j + 1];
    1a4c:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              values[j + 1] = temp;
    1a52:	|                                      |  |  |  |     |  |   move.w a0,32(sp)
              ids[j + 1] = temp2;
    1a56:	|                                      |  |  |  |     |  |   move.w d2,22(sp)
          if (values[j] > values[j + 1]) {
    1a5a:	|                                      |  |  |  |     |  \-> move.w 34(sp),d0
    1a5e:	|                                      |  |  |  |     |      cmp.w 32(sp),d0
    1a62:	|                                      |  |  |  |     |  /-- bcc.s 1a86 <SetCl+0x148>
              int temp2 = ids[j];
    1a64:	|                                      |  |  |  |     |  |   movea.w 22(sp),a0
              ids[j] = ids[j + 1];
    1a68:	|                                      |  |  |  |     |  |   move.w 24(sp),22(sp)
              ids[j + 1] = temp2;
    1a6e:	|                                      |  |  |  |     |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    1a72:	|                                      |  |  |  |     |  |   cmp.w 30(sp),d0
    1a76:	|                                      |  |  |  |     |  +-- bcc.s 1a86 <SetCl+0x148>
              int temp2 = ids[j];
    1a78:	|                                      |  |  |  |     |  |   move.w 20(sp),d0
              ids[j] = ids[j + 1];
    1a7c:	|                                      |  |  |  |     |  |   move.w 22(sp),20(sp)
              ids[j + 1] = temp2;
    1a82:	|                                      |  |  |  |     |  |   move.w d0,22(sp)
        line = (lastdrawline + 0x2c - 255) << 8;
    1a86:	|                                      |  |  |  |     |  \-> move.w d1,d0
    1a88:	|                                      |  |  |  |     |      lsl.w #8,d0
        *tmp++ = line + 0x001;
    1a8a:	|                                      |  |  |  |     |      addi.w #11521,d0
    1a8e:	|                                      |  |  |  |     |      cmpi.w #210,d1
    1a92:	|                                      |  |  |  |     |  /-- bhi.w 1b82 <SetCl+0x244>
    switch( ids[i]) 
    1a96:	|                                      |  |  |  |     |  |   cmpi.w #4,20(sp)
    1a9c:	|  /-----------------------------------|--|--|--|-----|--|-- bhi.w 238e <SetCl+0xa50>
    1aa0:	|  |                                   |  |  |  |     |  |   moveq #0,d1
    1aa2:	|  |                                   |  |  |  |     |  |   move.w 20(sp),d1
    1aa6:	|  |                                   |  |  |  |     |  |   add.l d1,d1
    1aa8:	|  |                                   |  |  |  |     |  |   move.w (1ab0 <SetCl+0x172>,pc,d1.l),d1
    1aac:	|  |                                   |  |  |  |     |  |   jmp (1ab0 <SetCl+0x172>,pc,d1.w)
    1ab0:	|  |                                   |  |  |  |     |  |   andi.w #588,sr
    1ab4:	|  |                                   |  |  |  |     |  |   andi.b #-18,700(a6)
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1aba:	|  |                                   |  |  |  |     \--|-> cmp.w d1,d0
    1abc:	|  |                                   |  |  |  |  /-----|-- bhi.w 1be6 <SetCl+0x2a8>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1ac0:	|  |                                   |  |  |  |  |     |   move.w #109,34(sp)
    1ac6:	|  |                                   |  |  |  |  |     |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1acc:	|  |                                   |  |  |  |  |     |   move.w #2,24(sp)
    1ad2:	|  |                                   |  |  |  |  |     |   move.w #3,26(sp)
    1ad8:	|  |                                   |  |  |  |  |     |   move.w #4,28(sp)
    1ade:	|  |                                   |  |  |  |  |     |   move.w #11521,d4
    firstdrawline = 0;
    1ae2:	|  |                                   |  |  |  |  |     |   clr.w d3
              values[j] = values[j + 1];
    1ae4:	|  |                                   |  |  |  |  |  /--|-> move.w d3,30(sp)
              ids[j] = ids[j + 1];
    1ae8:	|  |                                   |  |  |  |  |  |  |   move.w #1,20(sp)
              values[j + 1] = temp;
    1aee:	|  |                                   |  |  |  |  |  |  |   move.w #70,32(sp)
              ids[j + 1] = temp2;
    1af4:	|  |                                   |  |  |  |  |  |  |   clr.w 22(sp)
          if (values[j] > values[j + 1]) {
    1af8:	|  |                                   |  |  |  |  |  |  |   moveq #70,d0
    1afa:	+--|-----------------------------------|--|--|--|--|--|--|-- bra.w 19ca <SetCl+0x8c>
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1afe:	|  |                                   |  |  |  \--|--|--|-> move.w #70,30(sp)
    1b04:	|  |                                   |  |  |     |  |  |   move.w #255,32(sp)
    1b0a:	|  |                                   |  |  |     |  |  |   move.w #109,34(sp)
    1b10:	|  |                                   |  |  |     |  |  |   move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1b16:	|  |                                   |  |  |     |  |  |   clr.w 20(sp)
    1b1a:	|  |                                   |  |  |     |  |  |   move.w #1,22(sp)
    1b20:	|  |                                   |  |  |     |  |  |   move.w #2,24(sp)
    1b26:	|  |                                   |  |  |     |  |  |   move.w #3,26(sp)
    1b2c:	|  |                                   |  |  |     |  |  |   move.w #4,28(sp)
    1b32:	|  |                                   |  |  |     |  |  |   move.w #11265,d4
    firstdrawline = 255;
    1b36:	|  |                                   |  |  |     |  |  |   move.w #255,d3
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1b3a:	|  |                                   |  |  |     |  |  |   move.w d3,d1
          if (values[j] > values[j + 1]) {
    1b3c:	|  |                                   >--|--|-----|--|--|-> move.w 32(sp),d0
    1b40:	|  |                                   |  |  |     |  |  |   cmpi.w #109,d0
    1b44:	+--|-----------------------------------|--|--|-----|--|--|-- bls.w 19ca <SetCl+0x8c>
              int temp2 = ids[j];
    1b48:	|  |                                   |  |  |     |  |  |   movea.w 22(sp),a0
              values[j] = values[j + 1];
    1b4c:	|  |                                   |  |  |     |  |  |   move.w #109,32(sp)
              ids[j] = ids[j + 1];
    1b52:	|  |                                   |  |  |     |  |  |   move.w #2,22(sp)
              values[j + 1] = temp;
    1b58:	|  |                                   |  |  |     |  |  |   move.w d0,34(sp)
              ids[j + 1] = temp2;
    1b5c:	|  |                                   |  |  |     |  |  |   move.w a0,24(sp)
          if (values[j] > values[j + 1]) {
    1b60:	|  |                                   |  |  |     |  |  |   cmpi.w #120,d0
    1b64:	|  |  /--------------------------------|--|--|-----|--|--|-- bls.w 2376 <SetCl+0xa38>
              values[j] = values[j + 1];
    1b68:	|  |  |                                |  |  |     |  |  |   move.w #120,34(sp)
              ids[j] = ids[j + 1];
    1b6e:	|  |  |                                |  |  |     |  |  |   move.w #3,24(sp)
              values[j + 1] = temp;
    1b74:	|  |  |                                |  |  |     |  |  |   move.w d0,36(sp)
              ids[j + 1] = temp2;
    1b78:	|  |  |                                |  |  |     |  |  |   move.w a0,26(sp)
    1b7c:	|  |  |                                |  |  |     |  |  |   moveq #109,d0
    1b7e:	+--|--|--------------------------------|--|--|-----|--|--|-- bra.w 19ca <SetCl+0x8c>
    switch( ids[i]) 
    1b82:	|  |  |                                |  |  |     |  |  \-> cmpi.w #4,20(sp)
    1b88:	|  |  |  /-----------------------------|--|--|-----|--|----- bhi.w 237c <SetCl+0xa3e>
    1b8c:	|  |  |  |                             |  |  |     |  |      moveq #0,d1
    1b8e:	|  |  |  |                             |  |  |     |  |      move.w 20(sp),d1
    1b92:	|  |  |  |                             |  |  |     |  |      add.l d1,d1
    1b94:	|  |  |  |                             |  |  |     |  |      move.w (1b9c <SetCl+0x25e>,pc,d1.l),d1
    1b98:	|  |  |  |                             |  |  |     |  |      jmp (1b9c <SetCl+0x25e>,pc,d1.w)
    1b9c:	|  |  |  |                             |  |  |     |  |      .short 0x00c6
    1b9e:	|  |  |  |                             |  |  |     |  |      ori.w #432,(-28,a4,d0.w)
    1ba4:	|  |  |  |                             |  |  |     |  |      bclr d3,12800(a0)
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1ba8:	|  |  |  |                             |     |     |  |      move.w #70,30(sp)
    1bae:	|  |  |  |                             |     |     |  |      move.w d2,32(sp)
    1bb2:	|  |  |  |                             |     |     |  |      move.w #109,34(sp)
    1bb8:	|  |  |  |                             |     |     |  |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1bbe:	|  |  |  |                             |     |     |  |      clr.w 20(sp)
    1bc2:	|  |  |  |                             |     |     |  |      move.w #1,22(sp)
    1bc8:	|  |  |  |                             |     |     |  |      move.w #2,24(sp)
    1bce:	|  |  |  |                             |     |     |  |      move.w #3,26(sp)
    1bd4:	|  |  |  |                             |     |     |  |      move.w #4,28(sp)
          if (values[j] > values[j + 1]) {
    1bda:	|  |  |  |                             |     |     |  |      cmpi.w #69,d2
    1bde:	|  |  |  |                             |     \-----|--|----- bls.w 19b4 <SetCl+0x76>
    1be2:	|  |  |  |                             \-----------|--|----- bra.w 1b3c <SetCl+0x1fe>
  if( lastdrawline < minlastdrawline) lastdrawline = minlastdrawline;
    1be6:	|  |  |  |                                         \--|----> move.w d0,d1
  UWORD values[5] = { STARTYBG, firstdrawline, STARTYBG2, ENDYBG, lastdrawline };
    1be8:	|  |  |  |                                            |      move.w #109,34(sp)
    1bee:	|  |  |  |                                            |      move.w #120,36(sp)
  UWORD ids[5] = { 0, 1, 2, 3, 4 };
    1bf4:	|  |  |  |                                            |      move.w #2,24(sp)
    1bfa:	|  |  |  |                                            |      move.w #3,26(sp)
    1c00:	|  |  |  |                                            |      move.w #4,28(sp)
    1c06:	|  |  |  |                                            |      move.w #11521,d4
    firstdrawline = 0;
    1c0a:	|  |  |  |                                            |      clr.w d3
    1c0c:	|  |  |  |                                            \----- bra.w 1ae4 <SetCl+0x1a6>
        if( firstdrawline + 0x2c > 255) {
    1c10:	|  |  |  |                                                   cmpi.w #211,d3
    1c14:	|  |  |  |                                               /-- bls.s 1c26 <SetCl+0x2e8>
          *tmp++ = 0xffdf;
    1c16:	|  |  |  |                                               |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1c1c:	|  |  |  |                                               |   lea 172(a1),a2
    1c20:	|  |  |  |                                               |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1c26:	|  |  |  |                                               \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1c28:	|  |  |  |                                                   move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1c2e:	|  |  |  |                                                   move.w #256,4(a2)
        *tmp++ = 0x3200;
    1c34:	|  |  |  |                                                   lea 8(a2),a0
    1c38:	|  |  |  |                                                   move.w #12800,6(a2)
    switch( ids[i]) 
    1c3e:	|  |  |  |     /-------------------------------------------> cmpi.w #4,22(sp)
    1c44:	|  |  |  |  /--|-------------------------------------------- bhi.w 2394 <SetCl+0xa56>
    1c48:	|  |  |  |  |  |                                             moveq #0,d1
    1c4a:	|  |  |  |  |  |                                             move.w 22(sp),d1
    1c4e:	|  |  |  |  |  |                                             add.l d1,d1
    1c50:	|  |  |  |  |  |                                             move.w (1c58 <SetCl+0x31a>,pc,d1.l),d1
    1c54:	|  |  |  |  |  |                                             jmp (1c58 <SetCl+0x31a>,pc,d1.w)
    1c58:	|  |  |  |  |  |                                             bclr d0,18c <main+0x126>
    1c5c:	|  |  |  |  |  |                                             ([,29185)bchg d0,([113128316,a0,d0.w],29185)
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1c66:	|  |  |  |  |  |                                             ori.l #863830014,170(a0)
        *tmp++ = 0x0180;
    1c6e:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    1c74:	|  |  |  |  |  |                                             lea 176(a1),a0
    1c78:	|  |  |  |  |  |                                             move.w #52,174(a1)
        break;
    1c7e:	|  |  |  |  |  +-------------------------------------------- bra.s 1c3e <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c80:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1c86:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1c8c:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    1c92:	|  |  |  |  |  |                                             lea 176(a1),a0
    1c96:	|  |  |  |  |  |                                             move.w #18,174(a1)
        break;          
    1c9c:	|  |  |  |  |  +-------------------------------------------- bra.s 1c3e <SetCl+0x300>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1c9e:	|  |  |  |  |  |                                             move.w #-23551,168(a1)
        *tmp++ = 0xfffe;
    1ca4:	|  |  |  |  |  |                                             move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1caa:	|  |  |  |  |  |                                             move.w #384,172(a1)
        *tmp++ = BGCOLOR;
    1cb0:	|  |  |  |  |  |                                             lea 176(a1),a0
    1cb4:	|  |  |  |  |  |                                             move.w #18,174(a1)
    switch( ids[i]) 
    1cba:	|  |  |  |  |  |     /-------------------------------------> cmpi.w #4,22(sp)
    1cc0:	|  |  |  |  |  |  /--|-------------------------------------- bhi.w 23a0 <SetCl+0xa62>
    1cc4:	|  |  |  |  |  |  |  |                                       moveq #0,d1
    1cc6:	|  |  |  |  |  |  |  |                                       move.w 22(sp),d1
    1cca:	|  |  |  |  |  |  |  |                                       add.l d1,d1
    1ccc:	|  |  |  |  |  |  |  |                                       move.w (1cd4 <SetCl+0x396>,pc,d1.l),d1
    1cd0:	|  |  |  |  |  |  |  |                                       jmp (1cd4 <SetCl+0x396>,pc,d1.w)
    1cd4:	|  |  |  |  |  |  |  |                                       bset d0,-(a0)
    1cd6:	|  |  |  |  |  |  |  |                                       bclr d0,(0,d0.w)
    1cda:	|  |  |  |  |  |  |  |                                       bchg d0,(a2)+
    1cdc:	|  |  |  |  |  |  |  |                                       .short 0x01fe
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1cde:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    1ce4:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1cea:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    1cf0:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1cf4:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    1cfa:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1cba <SetCl+0x37c>
        if( firstdrawline + 0x2c > 255) {
    1cfc:	|  |  |  |  |  |  |  |                                       cmpi.w #211,d3
    1d00:	|  |  |  |  |  |  |  |                                   /-- bls.s 1d12 <SetCl+0x3d4>
          *tmp++ = 0xffdf;
    1d02:	|  |  |  |  |  |  |  |                                   |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    1d08:	|  |  |  |  |  |  |  |                                   |   lea 172(a1),a2
    1d0c:	|  |  |  |  |  |  |  |                                   |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    1d12:	|  |  |  |  |  |  |  |                                   \-> move.w d4,(a2)
        *tmp++ = 0xfffe;
    1d14:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a2)
        *tmp++ = 0x0100;
    1d1a:	|  |  |  |  |  |  |  |                                       move.w #256,4(a2)
        *tmp++ = 0x3200;
    1d20:	|  |  |  |  |  |  |  |                                       lea 8(a2),a0
    1d24:	|  |  |  |  |  |  |  |                                       move.w #12800,6(a2)
        break;
    1d2a:	|  |  |  |  |  |  |  +-------------------------------------- bra.s 1cba <SetCl+0x37c>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1d2c:	|  |  |  |  |  |  |  |                                       move.w #29185,168(a1)
        *tmp++ = 0xfffe;
    1d32:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1d38:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR;
    1d3e:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1d42:	|  |  |  |  |  |  |  |                                       move.w #52,174(a1)
        break;
    1d48:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1cba <SetCl+0x37c>
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1d4c:	|  |  |  |  |  |  |  |                                       move.w #-26367,168(a1)
        *tmp++ = 0xfffe;
    1d52:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0180;
    1d58:	|  |  |  |  |  |  |  |                                       move.w #384,172(a1)
        *tmp++ = TABLECOLOR2;
    1d5e:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1d62:	|  |  |  |  |  |  |  |                                       move.w #35,174(a1)
        break;  
    1d68:	|  |  |  |  |  +--|--|-------------------------------------- bra.w 1c3e <SetCl+0x300>
        *tmp++ = line + 0x001;
    1d6c:	|  |  |  |  |  |  |  |                                       move.w d0,168(a1)
        *tmp++ = 0xfffe;
    1d70:	|  |  |  |  |  |  |  |                                       move.w #-2,170(a1)
        *tmp++ = 0x0100;
    1d76:	|  |  |  |  |  |  |  |                                       move.w #256,172(a1)
        *tmp++ = 0x0200;
    1d7c:	|  |  |  |  |  |  |  |                                       lea 176(a1),a0
    1d80:	|  |  |  |  |  |  |  |                                       move.w #512,174(a1)
        break;
    1d86:	|  |  |  |  |  |  |  +-------------------------------------- bra.w 1cba <SetCl+0x37c>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1d8a:	|  |  |  |  |  |  |  |                                       move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1d8e:	|  |  |  |  |  |  |  |                                       move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1d94:	|  |  |  |  |  |  |  |                                       move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1d9a:	|  |  |  |  |  |  |  |                                       lea 8(a0),a1
    1d9e:	|  |  |  |  |  |  |  |                                       move.w #18,6(a0)
    switch( ids[i]) 
    1da4:	|  |  |  |  |  |  |  |  /----------------------------------> cmpi.w #4,24(sp)
    1daa:	|  |  |  |  |  |  |  |  |  /-------------------------------- bhi.w 2388 <SetCl+0xa4a>
    1dae:	|  |  |  |  |  |  |  |  |  |                                 moveq #0,d1
    1db0:	|  |  |  |  |  |  |  |  |  |                                 move.w 24(sp),d1
    1db4:	|  |  |  |  |  |  |  |  |  |                                 add.l d1,d1
    1db6:	|  |  |  |  |  |  |  |  |  |                                 move.w (1dbe <SetCl+0x480>,pc,d1.l),d1
    1dba:	|  |  |  |  |  |  |  |  |  |                                 jmp (1dbe <SetCl+0x480>,pc,d1.w)
    1dbe:	|  |  |  |  |  |  |  |  |  |                                 .short 0x043a
    1dc0:	|  |  |  |  |  |  |  |  |  |                                 .short 0x040e
    1dc2:	|  |  |  |  |  |  |  |  |  |                                 ([,0)bset d1,([86651068],d0.w:2,0)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1dca:	|  |  |  |  |  |  |  |  |  |                                 subx.b d1,d4
        *tmp++ = 0xfffe;
    1dcc:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1dd2:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1dd8:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1ddc:	|  |  |  |  |  |  |  |  |  |                                 move.w #35,6(a0)
        break;  
    1de2:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1da4 <SetCl+0x466>
        if( firstdrawline + 0x2c > 255) {
    1de4:	|  |  |  |  |  |  |  |  |  |                                 cmpi.w #211,d3
    1de8:	|  |  |  |  |  |  |  |  |  |                             /-- bls.s 1df6 <SetCl+0x4b8>
          *tmp++ = 0xffdf;
    1dea:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1dee:	|  |  |  |  |  |  |  |  |  |                             |   move.w #-2,2(a0)
    1df4:	|  |  |  |  |  |  |  |  |  |                             |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1df6:	|  |  |  |  |  |  |  |  |  |                             \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1df8:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1dfe:	|  |  |  |  |  |  |  |  |  |                                 move.w #256,4(a0)
        *tmp++ = 0x3200;
    1e04:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1e08:	|  |  |  |  |  |  |  |  |  |                                 move.w #12800,6(a0)
        break;
    1e0e:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.s 1da4 <SetCl+0x466>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1e10:	|  |  |  |  |  |  |  |  |  |                                 move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1e14:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e1a:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1e20:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1e24:	|  |  |  |  |  |  |  |  |  |                                 move.w #52,6(a0)
        break;
    1e2a:	|  |  |  |  |  |  |  |  +--|-------------------------------- bra.w 1da4 <SetCl+0x466>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1e2e:	|  |  |  |  |  |  |  |  |  |                                 move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1e32:	|  |  |  |  |  |  |  |  |  |                                 move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e38:	|  |  |  |  |  |  |  |  |  |                                 move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1e3e:	|  |  |  |  |  |  |  |  |  |                                 lea 8(a0),a1
    1e42:	|  |  |  |  |  |  |  |  |  |                                 move.w #18,6(a0)
    switch( ids[i]) 
    1e48:	|  |  |  |  |  |  |  |  |  |  /----------------------------> cmpi.w #4,24(sp)
    1e4e:	|  |  |  |  |  |  |  |  |  |  |  /-------------------------- bhi.w 239a <SetCl+0xa5c>
    1e52:	|  |  |  |  |  |  |  |  |  |  |  |                           moveq #0,d1
    1e54:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w 24(sp),d1
    1e58:	|  |  |  |  |  |  |  |  |  |  |  |                           add.l d1,d1
    1e5a:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w (1e62 <SetCl+0x524>,pc,d1.l),d1
    1e5e:	|  |  |  |  |  |  |  |  |  |  |  |                           jmp (1e62 <SetCl+0x524>,pc,d1.w)
    1e62:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00e6
    1e64:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,(a4)+
    1e66:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x00ca
    1e68:	|  |  |  |  |  |  |  |  |  |  |  |                           .short 0x008c
    1e6a:	|  |  |  |  |  |  |  |  |  |  |  |                           btst d0,d2
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1e6c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1e70:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1e76:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1e7c:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1e80:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #35,6(a0)
        break;  
    1e86:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1e48 <SetCl+0x50a>
        if( firstdrawline + 0x2c > 255) {
    1e88:	|  |  |  |  |  |  |  |  |  |  |  |                           cmpi.w #211,d3
    1e8c:	|  |  |  |  |  |  |  |  |  |  |  |                       /-- bls.s 1e9a <SetCl+0x55c>
          *tmp++ = 0xffdf;
    1e8e:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    1e92:	|  |  |  |  |  |  |  |  |  |  |  |                       |   move.w #-2,2(a0)
    1e98:	|  |  |  |  |  |  |  |  |  |  |  |                       |   addq.l #4,a0
        *tmp++ = line + 0x001;
    1e9a:	|  |  |  |  |  |  |  |  |  |  |  |                       \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    1e9c:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1ea2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x3200;
    1ea8:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1eac:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #12800,6(a0)
        break;
    1eb2:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.s 1e48 <SetCl+0x50a>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1eb4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #29185,(a0)
        *tmp++ = 0xfffe;
    1eb8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ebe:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    1ec4:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1ec8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #52,6(a0)
        break;
    1ece:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1e48 <SetCl+0x50a>
        *tmp++ = line + 0x001;
    1ed2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w d0,(a0)
        *tmp++ = 0xfffe;
    1ed4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a0)
        *tmp++ = 0x0100;
    1eda:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #256,4(a0)
        *tmp++ = 0x0200;
    1ee0:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a0),a1
    1ee4:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #512,6(a0)
        break;
    1eea:	|  |  |  |  |  |  |  |  |  |  +--|-------------------------- bra.w 1e48 <SetCl+0x50a>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1eee:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    1ef2:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1ef8:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    1efe:	|  |  |  |  |  |  |  |  |  |  |  |                           lea 8(a1),a0
    1f02:	|  |  |  |  |  |  |  |  |  |  |  |                           move.w #18,6(a1)
    switch( ids[i]) 
    1f08:	|  |  |  |  |  |  |  |  |  |  |  |     /-------------------> cmpi.w #4,26(sp)
    1f0e:	|  |  |  |  |  |  |  |  |  |  |  |  /--|-------------------- bhi.w 23bc <SetCl+0xa7e>
    1f12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    1f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w 26(sp),d1
    1f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     add.l d1,d1
    1f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w (1f22 <SetCl+0x5e4>,pc,d1.l),d1
    1f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     jmp (1f22 <SetCl+0x5e4>,pc,d1.w)
    1f22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,(a0)
    1f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00e4
    1f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x00c8
    1f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     .short 0x008a
    1f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst d0,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1f2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     subx.b d1,d4
        *tmp++ = 0xfffe;
    1f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    1f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #35,6(a1)
        break;  
    1f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1f08 <SetCl+0x5ca>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    1f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #29185,(a1)
        *tmp++ = 0xfffe;
    1f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0180;
    1f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    1f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1f5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #52,6(a1)
        break;
    1f62:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1f08 <SetCl+0x5ca>
        *tmp++ = line + 0x001;
    1f64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d0,(a1)
        *tmp++ = 0xfffe;
    1f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x0200;
    1f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1f76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #512,6(a1)
        break;
    1f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.s 1f08 <SetCl+0x5ca>
        if( firstdrawline + 0x2c > 255) {
    1f7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #211,d3
    1f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 /-- bls.s 1f90 <SetCl+0x652>
          *tmp++ = 0xffdf;
    1f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    1f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   move.w #-2,2(a1)
    1f8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 |   addq.l #4,a1
        *tmp++ = line + 0x001;
    1f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                 \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    1f92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a1)
        *tmp++ = 0x0100;
    1f98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #256,4(a1)
        *tmp++ = 0x3200;
    1f9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a1),a0
    1fa2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #12800,6(a1)
        break;
    1fa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  +-------------------- bra.w 1f08 <SetCl+0x5ca>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    1fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    1fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    1fbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     lea 8(a0),a1
    1fc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w #18,6(a0)
    switch( ids[i]) 
    1fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------------> cmpi.w #4,28(sp)
    1fcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------------- bhi.w 23a6 <SetCl+0xa68>
    1fd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               moveq #0,d1
    1fd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w 28(sp),d1
    1fd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               add.l d1,d1
    1fd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w (1fe0 <SetCl+0x6a2>,pc,d1.l),d1
    1fdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               jmp (1fe0 <SetCl+0x6a2>,pc,d1.w)
    1fe0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               btst d0,-(a6)
    1fe2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00e8
    1fe4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x00ba
    1fe6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               .short 0x008c
    1fe8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               bchg d0,-(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    1fea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    1fee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    1ff4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    1ffa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    1ffe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a0)
        break;  
    2004:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1fc6 <SetCl+0x688>
        if( firstdrawline + 0x2c > 255) {
    2006:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    200a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 2018 <SetCl+0x6da>
          *tmp++ = 0xffdf;
    200c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    2010:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a0)
    2016:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a0
        *tmp++ = line + 0x001;
    2018:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    201a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    2020:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x3200;
    2026:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    202a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a0)
        break;
    2030:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.s 1fc6 <SetCl+0x688>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    2032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a0)
        *tmp++ = 0xfffe;
    2036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0180;
    203c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    2042:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    2046:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a0)
        break;
    204c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1fc6 <SetCl+0x688>
        *tmp++ = line + 0x001;
    2050:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w d0,(a0)
        *tmp++ = 0xfffe;
    2052:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
        *tmp++ = 0x0100;
    2058:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a0)
        *tmp++ = 0x0200;
    205e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a0),a1
    2062:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a0)
        break;
    2068:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------------- bra.w 1fc6 <SetCl+0x688>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    206c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    2070:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    2076:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    207c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    2080:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
  *tmp++ = 0xffff;
    2086:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    208a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    2090:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    2094:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    2098:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    209a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-26367,(a1)
        *tmp++ = 0xfffe;
    209e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    20a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    20aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    20ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #35,6(a1)
  *tmp++ = 0xffff;
    20b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    20b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    20be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    20c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    20c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( firstdrawline + 0x2c > 255) {
    20c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #211,d3
    20cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bls.s 20da <SetCl+0x79c>
          *tmp++ = 0xffdf;
    20ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    20d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    20d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    20da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    20dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    20e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x3200;
    20e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    20ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #12800,6(a1)
  *tmp++ = 0xffff;
    20f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    20f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    20fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    2100:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    2104:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    2106:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #29185,(a1)
        *tmp++ = 0xfffe;
    210a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    2110:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    2116:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    211a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #52,6(a1)
  *tmp++ = 0xffff;
    2120:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    2124:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    212a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    212e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    2132:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    2134:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               cmpi.w #210,d3
    2138:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-- bhi.s 2146 <SetCl+0x808>
          *tmp++ = 0xffdf;
    213a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    213e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   move.w #-2,2(a1)
    2144:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |   addq.l #4,a1
        *tmp++ = line + 0x001;
    2146:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    2148:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0100;
    214e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #256,4(a1)
        *tmp++ = 0x0200;
    2154:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    2158:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #512,6(a1)
  *tmp++ = 0xffff;
    215e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-1,(a0)
  *tmp = 0xfffe;
    2162:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a0)
}
    2168:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               movem.l (sp)+,d2-d5/a2
    216c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 20(sp),sp
    2170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               rts
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    2172:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-23551,(a1)
        *tmp++ = 0xfffe;
    2176:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #-2,2(a1)
        *tmp++ = 0x0180;
    217c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #384,4(a1)
        *tmp++ = BGCOLOR;
    2182:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               lea 8(a1),a0
    2186:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |               move.w #18,6(a1)
    switch( ids[i]) 
    218c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----------> cmpi.w #4,26(sp)
    2192:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-------- bhi.w 2382 <SetCl+0xa44>
    2196:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         moveq #0,d1
    2198:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 26(sp),d1
    219c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l d1,d1
    219e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (21a6 <SetCl+0x868>,pc,d1.l),d1
    21a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         jmp (21a6 <SetCl+0x868>,pc,d1.w)
    21a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00f6
    21a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         .short 0x00ca
    21aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         ori.l #7340308,12988(a6)
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    21b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         subx.b d1,d4
        *tmp++ = 0xfffe;
    21b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    21ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR2;
    21c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    21c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #35,6(a1)
        break;  
    21ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 218c <SetCl+0x84e>
        if( firstdrawline + 0x2c > 255) {
    21cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpi.w #211,d3
    21d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bls.s 21de <SetCl+0x8a0>
          *tmp++ = 0xffdf;
    21d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    21d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w #-2,2(a1)
    21dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   addq.l #4,a1
        *tmp++ = line + 0x001;
    21de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w d4,(a1)
        *tmp++ = 0xfffe;
    21e0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0100;
    21e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #256,4(a1)
        *tmp++ = 0x3200;
    21ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    21f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #12800,6(a1)
        break;
    21f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.s 218c <SetCl+0x84e>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    21f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #29185,(a1)
        *tmp++ = 0xfffe;
    21fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a1)
        *tmp++ = 0x0180;
    2202:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a1)
        *tmp++ = TABLECOLOR;
    2208:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a1),a0
    220c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #52,6(a1)
        break;
    2212:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-------- bra.w 218c <SetCl+0x84e>
        *tmp++ = ((ENDYBG + 0x2c) << 8) + 0x0001;
    2216:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-23551,(a0)
        *tmp++ = 0xfffe;
    221a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #-2,2(a0)
        *tmp++ = 0x0180;
    2220:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #384,4(a0)
        *tmp++ = BGCOLOR;
    2226:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 8(a0),a1
    222a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w #18,6(a0)
    switch( ids[i]) 
    2230:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /----> cmpi.w #4,28(sp)
    2236:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|----- bhi.w 23a6 <SetCl+0xa68>
    223a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    223c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 28(sp),d1
    2240:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d1
    2242:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (224a <SetCl+0x90c>,pc,d1.l),d1
    2246:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      jmp (224a <SetCl+0x90c>,pc,d1.w)
    224a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfebc
    224c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe7e
    224e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe50
    2250:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfe22
    2252:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      .short 0xfeea
        *tmp++ = ((STARTYBG2 + 0x2c) << 8) + 0x0001;    
    2254:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-26367,(a0)
        *tmp++ = 0xfffe;
    2258:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    225e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR2;
    2264:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    2268:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #35,6(a0)
        break;  
    226e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 2230 <SetCl+0x8f2>
        if( firstdrawline + 0x2c > 255) {
    2270:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #211,d3
    2274:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bls.s 2282 <SetCl+0x944>
          *tmp++ = 0xffdf;
    2276:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    227a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    2280:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    2282:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d4,(a0)
        *tmp++ = 0xfffe;
    2284:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    228a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x3200;
    2290:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    2294:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #12800,6(a0)
        break;
    229a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.s 2230 <SetCl+0x8f2>
        *tmp++ = ((STARTYBG + 0x2c) << 8) + 0x0001;    
    229c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #29185,(a0)
        *tmp++ = 0xfffe;
    22a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0180;
    22a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #384,4(a0)
        *tmp++ = TABLECOLOR;
    22ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    22b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #52,6(a0)
        break;
    22b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 2230 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    22ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    22be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 22cc <SetCl+0x98e>
          *tmp++ = 0xffdf;
    22c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    22c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    22ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    22cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    22ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    22d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    22da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    22de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    22e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +----- bra.w 2230 <SetCl+0x8f2>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    22e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    22ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 22fa <SetCl+0x9bc>
          *tmp++ = 0xffdf;
    22ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a1)
          *tmp++ = 0xfffe;
    22f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a1)
    22f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a1
        *tmp++ = line + 0x001;
    22fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a1)
        *tmp++ = 0xfffe;
    22fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a1)
        *tmp++ = 0x0100;
    2302:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a1)
        *tmp++ = 0x0200;
    2308:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a1),a0
    230c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a1)
        break;
    2312:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|----- bra.w 218c <SetCl+0x84e>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    2316:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    231a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 2328 <SetCl+0x9ea>
          *tmp++ = 0xffdf;
    231c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,(a0)
          *tmp++ = 0xfffe;
    2320:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,2(a0)
    2326:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.l #4,a0
        *tmp++ = line + 0x001;
    2328:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a0)
        *tmp++ = 0xfffe;
    232a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a0)
        *tmp++ = 0x0100;
    2330:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a0)
        *tmp++ = 0x0200;
    2336:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a0),a1
    233a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a0)
        break;
    2340:	|  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|----- bra.w 1da4 <SetCl+0x466>
        if( lastdrawline + 0x2c > 254 && firstdrawline + 0x2c < 255) {
    2344:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #210,d3
    2348:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-- bhi.s 235a <SetCl+0xa1c>
          *tmp++ = 0xffdf;
    234a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-33,168(a1)
          *tmp++ = 0xfffe;
    2350:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lea 172(a1),a2
    2354:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w #-2,170(a1)
        *tmp++ = line + 0x001;
    235a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-> move.w d0,(a2)
        *tmp++ = 0xfffe;
    235c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #-2,2(a2)
        *tmp++ = 0x0100;
    2362:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #256,4(a2)
        *tmp++ = 0x0200;
    2368:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 8(a2),a0
    236c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w #512,6(a2)
        break;
    2372:	|  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1c3e <SetCl+0x300>
    2376:	|  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> moveq #109,d0
    2378:	\--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 19ca <SetCl+0x8c>
    switch( ids[i]) 
    237c:	   |     \--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----> movea.l a2,a0
    237e:	   |        |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----- bra.w 1c3e <SetCl+0x300>
    2382:	   |        |     |  |  |  |  |  |  |  |  |  |  |  \--|----> movea.l a0,a1
    2384:	   |        |     |  |  |  |  |  |  |  |  |  |  |     \----- bra.w 2230 <SetCl+0x8f2>
    2388:	   |        |     |  |  |  \--|--|--|--|--|--|--|----------> movea.l a1,a0
    238a:	   |        |     |  |  |     |  |  |  |  |  |  \----------- bra.w 218c <SetCl+0x84e>
    238e:	   \--------|-----|--|--|-----|--|--|--|--|--|-------------> movea.l a2,a0
    2390:	            |     |  \--|-----|--|--|--|--|--|-------------- bra.w 1cba <SetCl+0x37c>
    2394:	            \-----|-----|-----|--|--|--|--|--|-------------> movea.l a0,a1
    2396:	                  |     \-----|--|--|--|--|--|-------------- bra.w 1da4 <SetCl+0x466>
    239a:	                  |           |  \--|--|--|--|-------------> movea.l a1,a0
    239c:	                  |           |     |  \--|--|-------------- bra.w 1f08 <SetCl+0x5ca>
    23a0:	                  \-----------|-----|-----|--|-------------> movea.l a0,a1
    23a2:	                              \-----|-----|--|-------------- bra.w 1e48 <SetCl+0x50a>
    23a6:	                                    |     |  \-------------> movea.l a1,a0
  *tmp++ = 0xffff;
    23a8:	                                    |     |                  move.w #-1,(a0)
  *tmp = 0xfffe;
    23ac:	                                    |     |                  move.w #-2,2(a0)
}
    23b2:	                                    |     |                  movem.l (sp)+,d2-d5/a2
    23b6:	                                    |     |                  lea 20(sp),sp
    23ba:	                                    |     |                  rts
    switch( ids[i]) 
    23bc:	                                    \-----|----------------> movea.l a0,a1
    23be:	                                          \----------------- bra.w 1fc6 <SetCl+0x688>

000023c2 <LoadVectors>:
{
    23c2:	       move.l a3,-(sp)
    23c4:	       move.l a2,-(sp)
    23c6:	       movea.l 12(sp),a2
    23ca:	       movea.l 16(sp),a1
    23ce:	       movea.l 20(sp),a3
  while( *source != 127) {
    23d2:	       move.w (a2),d0
    23d4:	       movea.l a3,a0
    23d6:	       cmpi.w #127,d0
    23da:	/----- beq.s 2430 <LoadVectors+0x6e>
    *target++ = *source++;
    23dc:	|  /-> move.w d0,(a0)
    *target++ = *source++;
    23de:	|  |   move.w 2(a2),2(a0)
    *target++ = *source++;
    23e4:	|  |   move.w 4(a2),4(a0)
    *target++ = *source++;
    23ea:	|  |   move.w 6(a2),6(a0)
    *target++ = *source++;
    23f0:	|  |   move.w 8(a2),8(a0)
    *target++ = *source++;
    23f6:	|  |   move.w 10(a2),10(a0)
    *target++ = *source++;
    23fc:	|  |   move.w 12(a2),12(a0)
    *target++ = *source++;
    2402:	|  |   move.w 14(a2),14(a0)
    *target++ = *source++;
    2408:	|  |   move.w 16(a2),16(a0)
    *target++ = *source++;
    240e:	|  |   move.w 18(a2),18(a0)
    *target++ = *source++;
    2414:	|  |   move.w 20(a2),20(a0)
    *target++ = *source++; 
    241a:	|  |   lea 24(a2),a2
    241e:	|  |   lea 24(a0),a0
    2422:	|  |   move.w -2(a2),-2(a0)
  while( *source != 127) {
    2428:	|  |   move.w (a2),d0
    242a:	|  |   cmpi.w #127,d0
    242e:	|  \-- bne.s 23dc <LoadVectors+0x1a>
  while( *source2 != 127) {  
    2430:	\----> move.b (a1),d0
    2432:	       cmpi.b #127,d0
    2436:	/----- beq.w 24f0 <LoadVectors+0x12e>
    *target++ = *base++ + *source2++;
    243a:	|  /-> ext.w d0
    243c:	|  |   add.w (a3),d0
    243e:	|  |   move.w d0,(a0)
    *target++ = *base++ + *source2++;
    2440:	|  |   move.b 1(a1),d0
    2444:	|  |   ext.w d0
    2446:	|  |   add.w 2(a3),d0
    244a:	|  |   move.w d0,2(a0)
    *target++ = *base++ + *source2++;
    244e:	|  |   move.b 2(a1),d0
    2452:	|  |   ext.w d0
    2454:	|  |   add.w 4(a3),d0
    2458:	|  |   move.w d0,4(a0)
    *target++ = *base++ + *source2++;
    245c:	|  |   move.b 3(a1),d0
    2460:	|  |   ext.w d0
    2462:	|  |   add.w 6(a3),d0
    2466:	|  |   move.w d0,6(a0)
    *target++ = *base++ + *source2++;
    246a:	|  |   move.b 4(a1),d0
    246e:	|  |   ext.w d0
    2470:	|  |   add.w 8(a3),d0
    2474:	|  |   move.w d0,8(a0)
    *target++ = *base++ + *source2++;
    2478:	|  |   move.b 5(a1),d0
    247c:	|  |   ext.w d0
    247e:	|  |   add.w 10(a3),d0
    2482:	|  |   move.w d0,10(a0)
    *target++ = *base++ + *source2++;
    2486:	|  |   move.b 6(a1),d0
    248a:	|  |   ext.w d0
    248c:	|  |   add.w 12(a3),d0
    2490:	|  |   move.w d0,12(a0)
    *target++ = *base++ + *source2++;
    2494:	|  |   move.b 7(a1),d0
    2498:	|  |   ext.w d0
    249a:	|  |   add.w 14(a3),d0
    249e:	|  |   move.w d0,14(a0)
    *target++ = *base++ + *source2++;
    24a2:	|  |   move.b 8(a1),d0
    24a6:	|  |   ext.w d0
    24a8:	|  |   add.w 16(a3),d0
    24ac:	|  |   move.w d0,16(a0)
    *target++ = *base++ + *source2++;
    24b0:	|  |   move.b 9(a1),d0
    24b4:	|  |   ext.w d0
    24b6:	|  |   add.w 18(a3),d0
    24ba:	|  |   move.w d0,18(a0)
    *target++ = *base++ + *source2++;
    24be:	|  |   move.b 10(a1),d0
    24c2:	|  |   ext.w d0
    24c4:	|  |   add.w 20(a3),d0
    24c8:	|  |   move.w d0,20(a0)
    *target++ = *base++ + *source2++;
    24cc:	|  |   lea 24(a3),a3
    24d0:	|  |   lea 12(a1),a1
    24d4:	|  |   lea 24(a0),a0
    24d8:	|  |   move.b -1(a1),d0
    24dc:	|  |   ext.w d0
    24de:	|  |   add.w -2(a3),d0
    24e2:	|  |   move.w d0,-2(a0)
  while( *source2 != 127) {  
    24e6:	|  |   move.b (a1),d0
    24e8:	|  |   cmpi.b #127,d0
    24ec:	|  \-- bne.w 243a <LoadVectors+0x78>
}
    24f0:	\----> movea.l (sp)+,a2
    24f2:	       movea.l (sp)+,a3
    24f4:	       rts

000024f6 <Clbuild>:
  //custom->copjmp1 = tmp;
}

UBYTE * Clbuild() {
    24f6:	    movem.l d2-d3/a2/a6,-(sp)
  
  UBYTE *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    24fa:	    movea.l 752e0 <SysBase>,a6
    2500:	    move.l #1360,d0
    2506:	    moveq #2,d1
    2508:	    jsr -198(a6)
    250c:	    movea.l d0,a2
  
  if( retval == 0) {
    250e:	    tst.l d0
    2510:	/-- beq.w 26a0 <Clbuild+0x1aa>
  ULONG *cl = (ULONG *) retval;
 
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
    2514:	|   move.l 3e114 <ClsSprites>,(a2)
    251a:	|   move.l 3e118 <ClsSprites+0x4>,4(a2)
    2522:	|   move.l 3e11c <ClsSprites+0x8>,8(a2)
    252a:	|   move.l 3e120 <ClsSprites+0xc>,12(a2)
    2532:	|   move.l 3e124 <ClsSprites+0x10>,16(a2)
    253a:	|   move.l 3e128 <ClsSprites+0x14>,20(a2)
    2542:	|   move.l 3e12c <ClsSprites+0x18>,24(a2)
    254a:	|   move.l 3e130 <ClsSprites+0x1c>,28(a2)
    2552:	|   move.l 3e134 <ClsSprites+0x20>,32(a2)
    255a:	|   move.l 3e138 <ClsSprites+0x24>,36(a2)
    2562:	|   move.l 3e13c <ClsSprites+0x28>,40(a2)
    256a:	|   move.l 3e140 <ClsSprites+0x2c>,44(a2)
    2572:	|   move.l 3e144 <ClsSprites+0x30>,48(a2)
    257a:	|   move.l 3e148 <ClsSprites+0x34>,52(a2)
    2582:	|   move.l 3e14c <ClsSprites+0x38>,56(a2)
    258a:	|   move.l 3e150 <ClsSprites+0x3c>,60(a2)

  clpartinstruction = ClScreen;
  for(UWORD i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
    2592:	|   move.l 3e0e4 <ClScreen>,64(a2)
    259a:	|   move.l 3e0e8 <ClScreen+0x4>,68(a2)
    25a2:	|   move.l 3e0ec <ClScreen+0x8>,72(a2)
    25aa:	|   move.l 3e0f0 <ClScreen+0xc>,76(a2)
    25b2:	|   move.l 3e0f4 <ClScreen+0x10>,80(a2)
    25ba:	|   move.l 3e0f8 <ClScreen+0x14>,84(a2)
    25c2:	|   move.l 3e0fc <ClScreen+0x18>,88(a2)
    25ca:	|   move.l 3e100 <ClScreen+0x1c>,92(a2)
    25d2:	|   move.l 3e104 <ClScreen+0x20>,96(a2)
    25da:	|   move.l 3e108 <ClScreen+0x24>,100(a2)
    25e2:	|   move.l 3e10c <ClScreen+0x28>,104(a2)
    25ea:	|   move.l 3e110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    25f2:	|   move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    25fa:	|   move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    2602:	|   move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    260a:	|   move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    2612:	|   move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    261a:	|   move.l #15335424,132(a2)
  clpartinstruction = ClColor;
  for(UWORD i=0; i<8;i++)
  {
    *cl++ = *clpartinstruction++;
    2622:	|   move.l 3e0c4 <ClColor>,136(a2)
    262a:	|   move.l 3e0c8 <ClColor+0x4>,140(a2)
    2632:	|   move.l 3e0cc <ClColor+0x8>,144(a2)
    263a:	|   move.l 3e0d0 <ClColor+0xc>,148(a2)
    2642:	|   move.l 3e0d4 <ClColor+0x10>,152(a2)
    264a:	|   move.l 3e0d8 <ClColor+0x14>,156(a2)
    2652:	|   move.l 3e0dc <ClColor+0x18>,160(a2)
    265a:	|   move.l 3e0e0 <ClColor+0x1c>,164(a2)
  }  
 
  clpartinstruction = ClToggleBitPlanes;
  for(UWORD i=0; i<6;i++)
  {
    *cl++ = *clpartinstruction++;
    2662:	|   move.l 3e074 <ClToggleBitPlanes>,168(a2)
    266a:	|   move.l 3e078 <ClToggleBitPlanes+0x4>,172(a2)
    2672:	|   move.l 3e07c <ClToggleBitPlanes+0x8>,176(a2)
    267a:	|   move.l 3e080 <ClToggleBitPlanes+0xc>,180(a2)
    2682:	|   move.l 3e084 <ClToggleBitPlanes+0x10>,184(a2)
    268a:	|   move.l 3e088 <ClToggleBitPlanes+0x14>,188(a2)
  }    

  *cl++ = 0xfffffffe;
    2692:	|   moveq #-2,d0
    2694:	|   move.l d0,192(a2)
  return retval;  
}
    2698:	|   move.l a2,d0
    269a:	|   movem.l (sp)+,d2-d3/a2/a6
    269e:	|   rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    26a0:	\-> movea.l 752d4 <DOSBase>,a6
    26a6:	    jsr -60(a6)
    26aa:	    movea.l 752d4 <DOSBase>,a6
    26b0:	    move.l d0,d1
    26b2:	    move.l #224803,d2
    26b8:	    moveq #40,d3
    26ba:	    jsr -48(a6)
    Exit(1);
    26be:	    movea.l 752d4 <DOSBase>,a6
    26c4:	    moveq #1,d1
    26c6:	    jsr -144(a6)
    *cl++ = *clpartinstruction++;
    26ca:	    move.l 3e114 <ClsSprites>,(a2)
    26d0:	    move.l 3e118 <ClsSprites+0x4>,4(a2)
    26d8:	    move.l 3e11c <ClsSprites+0x8>,8(a2)
    26e0:	    move.l 3e120 <ClsSprites+0xc>,12(a2)
    26e8:	    move.l 3e124 <ClsSprites+0x10>,16(a2)
    26f0:	    move.l 3e128 <ClsSprites+0x14>,20(a2)
    26f8:	    move.l 3e12c <ClsSprites+0x18>,24(a2)
    2700:	    move.l 3e130 <ClsSprites+0x1c>,28(a2)
    2708:	    move.l 3e134 <ClsSprites+0x20>,32(a2)
    2710:	    move.l 3e138 <ClsSprites+0x24>,36(a2)
    2718:	    move.l 3e13c <ClsSprites+0x28>,40(a2)
    2720:	    move.l 3e140 <ClsSprites+0x2c>,44(a2)
    2728:	    move.l 3e144 <ClsSprites+0x30>,48(a2)
    2730:	    move.l 3e148 <ClsSprites+0x34>,52(a2)
    2738:	    move.l 3e14c <ClsSprites+0x38>,56(a2)
    2740:	    move.l 3e150 <ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    2748:	    move.l 3e0e4 <ClScreen>,64(a2)
    2750:	    move.l 3e0e8 <ClScreen+0x4>,68(a2)
    2758:	    move.l 3e0ec <ClScreen+0x8>,72(a2)
    2760:	    move.l 3e0f0 <ClScreen+0xc>,76(a2)
    2768:	    move.l 3e0f4 <ClScreen+0x10>,80(a2)
    2770:	    move.l 3e0f8 <ClScreen+0x14>,84(a2)
    2778:	    move.l 3e0fc <ClScreen+0x18>,88(a2)
    2780:	    move.l 3e100 <ClScreen+0x1c>,92(a2)
    2788:	    move.l 3e104 <ClScreen+0x20>,96(a2)
    2790:	    move.l 3e108 <ClScreen+0x24>,100(a2)
    2798:	    move.l 3e10c <ClScreen+0x28>,104(a2)
    27a0:	    move.l 3e110 <ClScreen+0x2c>,108(a2)
  *cl++ = 0x000e00000;
    27a8:	    move.l #14680064,112(a2)
  *cl++ = 0x000e20000;
    27b0:	    move.l #14811136,116(a2)
  *cl++ = 0x000e40000;
    27b8:	    move.l #14942208,120(a2)
  *cl++ = 0x000e60000;
    27c0:	    move.l #15073280,124(a2)
  *cl++ = 0x000e80000;
    27c8:	    move.l #15204352,128(a2)
  *cl++ = 0x000ea0000;
    27d0:	    move.l #15335424,132(a2)
    *cl++ = *clpartinstruction++;
    27d8:	    move.l 3e0c4 <ClColor>,136(a2)
    27e0:	    move.l 3e0c8 <ClColor+0x4>,140(a2)
    27e8:	    move.l 3e0cc <ClColor+0x8>,144(a2)
    27f0:	    move.l 3e0d0 <ClColor+0xc>,148(a2)
    27f8:	    move.l 3e0d4 <ClColor+0x10>,152(a2)
    2800:	    move.l 3e0d8 <ClColor+0x14>,156(a2)
    2808:	    move.l 3e0dc <ClColor+0x18>,160(a2)
    2810:	    move.l 3e0e0 <ClColor+0x1c>,164(a2)
    *cl++ = *clpartinstruction++;
    2818:	    move.l 3e074 <ClToggleBitPlanes>,168(a2)
    2820:	    move.l 3e078 <ClToggleBitPlanes+0x4>,172(a2)
    2828:	    move.l 3e07c <ClToggleBitPlanes+0x8>,176(a2)
    2830:	    move.l 3e080 <ClToggleBitPlanes+0xc>,180(a2)
    2838:	    move.l 3e084 <ClToggleBitPlanes+0x10>,184(a2)
    2840:	    move.l 3e088 <ClToggleBitPlanes+0x14>,188(a2)
  *cl++ = 0xfffffffe;
    2848:	    moveq #-2,d0
    284a:	    move.l d0,192(a2)
}
    284e:	    move.l a2,d0
    2850:	    movem.l (sp)+,d2-d3/a2/a6
    2854:	    rts

00002856 <SetBplPointers>:

void SetBplPointers() {
    2856:	    move.l a2,-(sp)

  DrawBuffer = ScreenBufferList[ScreenBufferOffset];
    2858:	    movea.w 74e40 <ScreenBufferOffset>,a0
    285e:	    moveq #0,d0
    2860:	    move.w a0,d0
    2862:	    lea 751de <ScreenBufferList>,a2
    2868:	    move.l d0,d1
    286a:	    add.l d0,d1
    286c:	    add.l d1,d1
    286e:	    move.l (0,a2,d1.l),75154 <DrawBuffer>
  ViewBuffer = ScreenBufferList[ScreenBufferOffset+1];  
    2876:	    move.l d0,d1
    2878:	    addq.l #1,d1
    287a:	    add.l d1,d1
    287c:	    add.l d1,d1
    287e:	    movea.l (0,a2,d1.l),a1
    2882:	    move.l a1,75144 <ViewBuffer>
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    2888:	    addq.l #2,d0
    288a:	    add.l d0,d0
    288c:	    add.l d0,d0
    288e:	    move.l (0,a2,d0.l),d1

  ScreenBufferOffset += 3;
    2892:	    move.w a0,d0
    2894:	    addq.w #3,d0
  if(ScreenBufferOffset >= 9) { 
    2896:	    cmpi.w #8,d0
    289a:	/-- bls.s 289e <SetBplPointers+0x48>
    289c:	|   clr.w d0
  ClearBuffer = ScreenBufferList[ScreenBufferOffset+2];  
    289e:	\-> move.l d1,75148 <ClearBuffer>
  ScreenBufferOffset += 3;
    28a4:	    move.w d0,74e40 <ScreenBufferOffset>
      ScreenBufferOffset = 0;   
  }

  ULONG ptr = ViewBuffer->BitPlane + ViewBuffer->minytotal * 64;
    28aa:	    move.w 54(a1),d0
    28ae:	    ext.l d0
    28b0:	    lsl.l #6,d0
    28b2:	    add.l (a1),d0
  UWORD highword = ptr >> 16;
  UWORD lowword = ptr & 0xffff;  

  UWORD *copword = (UWORD *) DrawCopper;
    28b4:	    movea.l 752b2 <DrawCopper>,a0
  UWORD lowword = ptr & 0xffff;  
    28ba:	    move.w d0,118(a0)
  UWORD highword = ptr >> 16;
    28be:	    move.l d0,d1
    28c0:	    clr.w d1
    28c2:	    swap d1
    28c4:	    move.w d1,114(a0)
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    28c8:	    move.l d0,d1
    28ca:	    addi.l #16384,d1
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    28d0:	    move.w d1,126(a0)
  highword = ptr >> 16;
    28d4:	    clr.w d1
    28d6:	    swap d1
    28d8:	    move.w d1,122(a0)
  copword[COPBPL2LOW] = lowword;
  copword[COPBPL2HIGH] = highword;

  ptr +=  64*BPLHEIGHT;
    28dc:	    addi.l #32768,d0
  highword = ptr >> 16;
  lowword = ptr & 0xffff;  
    28e2:	    move.w d0,134(a0)
  highword = ptr >> 16;
    28e6:	    clr.w d0
    28e8:	    swap d0
    28ea:	    move.w d0,130(a0)
  copword[COPBPL3LOW] = lowword;
  copword[COPBPL3HIGH] = highword;

    28ee:	    movea.l (sp)+,a2
    28f0:	    rts

000028f2 <KPrintF>:
void KPrintF(const char* fmt, ...) {
    28f2:	    lea -128(sp),sp
    28f6:	    movem.l a2-a3/a6,-(sp)
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    28fa:	    move.w f0ff60 <_end+0xe9ac7c>,d0
    2900:	    cmpi.w #20153,d0
    2904:	/-- beq.s 2930 <KPrintF+0x3e>
    2906:	|   cmpi.w #-24562,d0
    290a:	+-- beq.s 2930 <KPrintF+0x3e>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
    290c:	|   movea.l 752e0 <SysBase>,a6
    2912:	|   movea.l 144(sp),a0
    2916:	|   lea 148(sp),a1
    291a:	|   lea 5e32 <KPutCharX>,a2
    2920:	|   suba.l a3,a3
    2922:	|   jsr -522(a6)
}
    2926:	|   movem.l (sp)+,a2-a3/a6
    292a:	|   lea 128(sp),sp
    292e:	|   rts
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
    2930:	\-> movea.l 752e0 <SysBase>,a6
    2936:	    movea.l 144(sp),a0
    293a:	    lea 148(sp),a1
    293e:	    lea 5e40 <PutChar>,a2
    2944:	    lea 12(sp),a3
    2948:	    jsr -522(a6)
		UaeDbgLog(86, temp);
    294c:	    move.l a3,-(sp)
    294e:	    pea 56 <_start+0x56>
    2952:	    jsr f0ff60 <_end+0xe9ac7c>
	if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
    2958:	    addq.l #8,sp
}
    295a:	    movem.l (sp)+,a2-a3/a6
    295e:	    lea 128(sp),sp
    2962:	    rts

00002964 <DrawRect>:
{  
    2964:	                                                                                                                                                             lea -24(sp),sp
    2968:	                                                                                                                                                             movem.l d2-d7/a2-a6,-(sp)
    296c:	                                                                                                                                                             movea.l 72(sp),a2
  UWORD startbufferoffset = square->YPosMin*64;
    2970:	                                                                                                                                                             move.w 24(a2),d0
  WORD height = square->Height;
    2974:	                                                                                                                                                             move.w 28(a2),d1
  if(square->YPosMin < 0) {
    2978:	                                                                                                                                                             tst.w d0
    297a:	                                                                                                               /-------------------------------------------- blt.w 2b94 <DrawRect+0x230>
  UWORD startbufferoffset = square->YPosMin*64;
    297e:	                                                                                                               |                                             move.w d0,d4
    2980:	                                                                                                               |                                             lsl.w #6,d4
  } else if(square->YPosMin>256) {
    2982:	                                                                                                               |                                             cmpi.w #256,d0
    2986:	                                                                                                               |                                         /-- ble.s 2992 <DrawRect+0x2e>
}
    2988:	                                                                                                               |        /--------------------------------|-> movem.l (sp)+,d2-d7/a2-a6
    298c:	                                                                                                               |        |                                |   lea 24(sp),sp
    2990:	                                                                                                               |        |                                |   rts
  } else if(square->YPosMin+square->Height > 256) {
    2992:	                                                                                                               |        |                                \-> movea.w d1,a0
    2994:	                                                                                                               |        |                                    lea (0,a0,d0.w),a0
    2998:	                                                                                                               |        |                                    cmpa.w #256,a0
    299c:	                                                                                                            /--|--------|----------------------------------- ble.w 2bbc <DrawRect+0x258>
    height = 256 - square->YPosMin;
    29a0:	                                                                                                            |  |        |                                    move.w #256,d5
    29a4:	                                                                                                            |  |        |                                    sub.w d0,d5
  WORD ypos = 0;
    29a6:	                                                                                                            |  |        |                                    clr.w d6
  WORD xlength = square->XLength + 32;
    29a8:	                                                                                                            |  |  /-----|----------------------------------> move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    29ac:	                                                                                                            |  |  |     |                                    move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    29b0:	                                                                                                            |  |  |     |  /-------------------------------- ble.w 2baa <DrawRect+0x246>
  WORD xlength = square->XLength + 32;
    29b4:	                                                                                                            |  |  |     |  |  /----------------------------> move.w d3,d7
    29b6:	                                                                                                            |  |  |     |  |  |                              addi.w #32,d7
  if( height>0 && xlength > 0 && square->YPosMin < 256) {
    29ba:	                                                                                                            |  |  |  /--|--|--|----------------------------> tst.w d5
    29bc:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2988 <DrawRect+0x24>
    29be:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #15,d7
    29c2:	                                                                                                            |  |  |  |  +--|--|----------------------------- ble.s 2988 <DrawRect+0x24>
    29c4:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #256,d0
    29c8:	                                                                                                            |  |  |  |  +--|--|----------------------------- beq.s 2988 <DrawRect+0x24>
  xlength = xlength/16;
    29ca:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d7
    29cc:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a3
    Utils_BlitClear(PrepareBuffer+(copymin/16)*2, square->Height, xlength, 64-xlength*2, 0x0);
    29ce:	                                                                                                            |  |  |  |  |  |  |                              movea.w d7,a0
    29d0:	                                                                                                            |  |  |  |  |  |  |                              move.l a0,60(sp)
    29d4:	                                                                                                            |  |  |  |  |  |  |                              moveq #32,d7
    29d6:	                                                                                                            |  |  |  |  |  |  |                              sub.l a0,d7
    29d8:	                                                                                                            |  |  |  |  |  |  |                              add.w d7,d7
    29da:	                                                                                                            |  |  |  |  |  |  |                              move.w d2,d0
    29dc:	                                                                                                            |  |  |  |  |  |  |                              asr.w #4,d0
    29de:	                                                                                                            |  |  |  |  |  |  |                              movea.w d0,a0
    29e0:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a0
    29e2:	                                                                                                            |  |  |  |  |  |  |                              movea.l 752c2 <PrepareBuffer>,a1
    29e8:	                                                                                                            |  |  |  |  |  |  |                              adda.l a0,a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    29ea:	                                                                                                            |  |  |  |  |  |  |                              movea.w dff002 <_end+0xd89d1e>,a0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    29f0:	                                                                                                            |  |  |  |  |  |  |                          /-> move.w dff002 <_end+0xd89d1e>,d0
    29f6:	                                                                                                            |  |  |  |  |  |  |                          |   btst #14,d0
    29fa:	                                                                                                            |  |  |  |  |  |  |                          \-- bne.s 29f0 <DrawRect+0x8c>
  custom->bltcon0 = 0x01f0;
    29fc:	                                                                                                            |  |  |  |  |  |  |                              move.w #496,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0;
    2a04:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd89d5e>
  custom->bltadat = data;
    2a0c:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff074 <_end+0xd89d90>
  custom->bltdpt = Target;  
    2a14:	                                                                                                            |  |  |  |  |  |  |                              move.l a1,dff054 <_end+0xd89d70>
  custom->bltdmod = mod;
    2a1a:	                                                                                                            |  |  |  |  |  |  |                              move.w d7,dff066 <_end+0xd89d82>
  custom->bltsize = lines*64+linelength;
    2a20:	                                                                                                            |  |  |  |  |  |  |                              lsl.w #6,d1
    2a22:	                                                                                                            |  |  |  |  |  |  |                              add.w a3,d1
    2a24:	                                                                                                            |  |  |  |  |  |  |                              move.w d1,dff058 <_end+0xd89d74>
    custom->bltcon1 = 0x0000;      
    2a2a:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff042 <_end+0xd89d5e>
    custom->bltcdat = 0x0;
    2a32:	                                                                                                            |  |  |  |  |  |  |                              move.w #0,dff070 <_end+0xd89d8c>
    BltCon0LineDraw = 0x0500;
    2a3a:	                                                                                                            |  |  |  |  |  |  |                              move.w #1280,74e42 <BltCon0LineDraw>
  WORD x1 = square->Vertices[index1].X;
    2a42:	                                                                                                            |  |  |  |  |  |  |                              movea.w (a2),a6
  WORD x2 = square->Vertices[index2].X;
    2a44:	                                                                                                            |  |  |  |  |  |  |                              movea.w 4(a2),a3
  WORD height = y1 - y2;
    2a48:	                                                                                                            |  |  |  |  |  |  |                              movea.w 2(a2),a4
    2a4c:	                                                                                                            |  |  |  |  |  |  |                              movea.w 6(a2),a5
    2a50:	                                                                                                            |  |  |  |  |  |  |                              move.w a4,d0
    2a52:	                                                                                                            |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    2a54:	                                                                                                            |  |  |  |  |  |  |                              cmpi.w #99,d0
    2a58:	                                       /--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bgt.w 32b0 <DrawRect+0x94c>
  if(height != 0) {
    2a5c:	                                       |                                                                    |  |  |  |  |  |  |                              tst.w d0
    2a5e:	                                    /--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------- bne.w 32c4 <DrawRect+0x960>
    BltCon0LineDraw = 0x0700;
    2a62:	                  /-----------------|--|--------------------------------------------------------------------|--|--|--|--|--|--|----------------------------> move.w #1792,74e42 <BltCon0LineDraw>
  WORD x2 = square->Vertices[index2].X;
    2a6a:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 8(a2),a4
  WORD height = y1 - y2;
    2a6e:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              movea.w 10(a2),a6
    2a72:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              move.w a5,d0
    2a74:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2a76:	                  |                 |  |                                                                    |  |  |  |  |  |  |                              cmpi.w #99,d0
    2a7a:	                  |                 |  |                                                     /--------------|--|--|--|--|--|--|----------------------------- bgt.w 3088 <DrawRect+0x724>
  if(height != 0) {
    2a7e:	                  |                 |  |                                                     |              |  |  |  |  |  |  |                              tst.w d0
    2a80:	                  |                 |  |                                                  /--|--------------|--|--|--|--|--|--|----------------------------- bne.w 309c <DrawRect+0x738>
  WORD x2 = square->Vertices[index2].X;
    2a84:	                  |                 |  |                    /-----------------------------|--|--------------|--|--|--|--|--|--|----------------------------> movea.w 12(a2),a3
  WORD height = y1 - y2;
    2a88:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              movea.w 14(a2),a5
    2a8c:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              move.w a6,d0
    2a8e:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              sub.w a5,d0
  if(height >= 100) {
    2a90:	                  |                 |  |                    |                             |  |              |  |  |  |  |  |  |                              cmpi.w #99,d0
    2a94:	                  |                 |  |                    |                             |  |        /-----|--|--|--|--|--|--|----------------------------- bgt.w 2e78 <DrawRect+0x514>
  if(height != 0) {
    2a98:	                  |                 |  |                    |                             |  |        |     |  |  |  |  |  |  |                              tst.w d0
    2a9a:	                  |                 |  |                    |                             |  |     /--|-----|--|--|--|--|--|--|----------------------------- bne.w 2e8c <DrawRect+0x528>
  WORD x2 = square->Vertices[index2].X;
    2a9e:	                  |                 |  |                    |                             |  |  /--|--|-----|--|--|--|--|--|--|----------------------------> movea.w (a2),a4
  WORD height = y1 - y2;
    2aa0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              movea.w 2(a2),a6
    2aa4:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              move.w a5,d0
    2aa6:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              sub.w a6,d0
  if(height >= 100) {
    2aa8:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |                              cmpi.w #99,d0
    2aac:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        /-------------------- bgt.w 2c36 <DrawRect+0x2d2>
  if(height != 0) {
    2ab0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |        |                     tst.w d0
    2ab2:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  /-----|-------------------- bne.w 2c4a <DrawRect+0x2e6>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2ab6:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  /--|-------------------> move.l 752c2 <PrepareBuffer>,d0
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2abc:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2ac0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     lsr.w #4,d2
    2ac2:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.w d2,d2
    2ac4:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     andi.l #65535,d4
    2aca:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l 75154 <DrawBuffer>,a0
    2ad0:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2ad2:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     moveq #0,d1
    2ad4:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w d2,d1
    2ad6:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     movea.l d4,a0
    2ad8:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2ada:	                  |                 |  |                    |                             |  |  |  |  |     |  |  |  |  |  |  |  |  |  |                     move.w dff002 <_end+0xd89d1e>,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2ae0:	                  |                 |  |                    |                             |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|-------------------> move.w dff002 <_end+0xd89d1e>,d1
    2ae6:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d1,d4
    2ae8:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     andi.w #16384,d4
    2aec:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     btst #14,d1
    2af0:	                  |                 |  |                    |                             |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|-------------------- bne.s 2ae0 <DrawRect+0x17c>
  custom->bltamod = 64 - length*2;
    2af2:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff064 <_end+0xd89d80>
  custom->bltbmod = 64 - length*2;
    2af8:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff062 <_end+0xd89d7e>
  custom->bltdmod = 64 - length*2;  
    2afe:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     move.w d7,dff066 <_end+0xd89d82>
  if(color > 3) //Bitplane 3 is handled separately and reserved  for Letters                               
    2b04:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                     cmpi.w #3,d3
    2b08:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /-------- bhi.w 2bc4 <DrawRect+0x260>
  else if(color == 0) //Color 0 is used to delete some stuff away from Bitplane 3 (ie make wholes in a square to make it look like an O) to simplify code.                              
    2b0c:	                  |                 |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         tst.w d3
    2b0e:	                  |  /--------------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------- bne.w 34c0 <DrawRect+0xb5c>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2b12:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         adda.l #32768,a0
    bit = 0;
    2b18:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         clr.w 66(sp)
    planes = 1; //Only Plane 3 to write to
    2b1c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         moveq #1,d1
  UWORD yoffset = starty*64;
    2b1e:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2b20:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2b22:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         andi.l #65535,d2
    2b28:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.l d0,d2
  ULONG bltsize = length + height*64;
    2b2a:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         lsl.w #6,d5
    custom->bltsize = bltsize;
    2b2c:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         add.w 62(sp),d5
    2b30:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         movea.w #3520,a1
    if( bit == 1) {
    2b34:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w #3535,d6
    2b38:	                  |  |              |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |         move.w 66(sp),d7
    if( planes > 1) {
    2b3c:	                  |  |  /-----------|--|--------------------|-----------------------------|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----------|-------> cmpi.w #2,d1
    2b40:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-------- beq.w 2c22 <DrawRect+0x2be>
    2b44:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     /-> move.w a1,d0
    if( bit == 1) {
    2b46:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |     |   cmpi.w #1,d7
    2b4a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----|-- beq.w 2bf4 <DrawRect+0x290>
    custom->bltcon0 = 0x0d00 | minterms;
    2b4e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----|-> move.w d0,dff040 <_end+0xd89d5c>
    custom->bltapt = (UBYTE *)bltapt;
    2b54:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l d2,dff050 <_end+0xd89d6c>
    custom->bltbpt = (UBYTE *)bltdpt;
    2b5a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff04c <_end+0xd89d68>
    custom->bltdpt = (UBYTE *)bltdpt;
    2b60:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.l a0,dff054 <_end+0xd89d70>
    custom->bltsize = bltsize;
    2b66:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d5,dff058 <_end+0xd89d74>
    bltdpt += 64*256;
    2b6c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2b70:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w dff002 <_end+0xd89d1e>,d0
    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2b76:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-> move.w dff002 <_end+0xd89d1e>,d0
    2b7c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2b80:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|-- bne.s 2b76 <DrawRect+0x212>
  for(UWORD i = 0;i<planes;i++) 
    2b82:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   addq.w #1,d4
    2b84:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   cmp.w d4,d1
    2b86:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|-- beq.w 2988 <DrawRect+0x24>
    if( planes > 1) {
    2b8a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |   cmpi.w #2,d1
    2b8e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  \-- bne.s 2b44 <DrawRect+0x1e0>
    2b90:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|----- bra.w 2c22 <DrawRect+0x2be>
    height += square->YPosMin;
    2b94:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |  \--|--|-----|--|--|--|--|--|--|--|--|--|----> move.w d1,d5
    2b96:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      add.w d0,d5
    ypos -= square->YPosMin;
    2b98:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w d0,d6
    2b9a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      neg.w d6
    startbufferoffset = 0;
    2b9c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      clr.w d4
  WORD xlength = square->XLength + 32;
    2b9e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 26(a2),d3
  WORD xposmin = square->XPosMin;
    2ba2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  |  |  |  |  |  |  |  |  |      move.w 22(a2),d2
  if(square->XPosMin <= 0) {
    2ba6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     |  \--|--|--|--|--|--|--|--|----- bgt.w 29b4 <DrawRect+0x50>
    xlength += xposmin - 16;    
    2baa:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |     \-----|--|--|--|--|--|--|--|----> move.w d2,d7
    2bac:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      add.w d3,d7
    2bae:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #16,d7
    startbufferoffset -= 12;
    2bb2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      addi.w #-12,d4
    copymin = 96;
    2bb6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  |           |  |  |  |  |  |  |  |      moveq #96,d2
    2bb8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  |     |  \-----------|--|--|--|--|--|--|--|----- bra.w 29ba <DrawRect+0x56>
  WORD height = square->Height;
    2bbc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |  \-----|--------------|--|--|--|--|--|--|--|----> move.w d1,d5
  WORD ypos = 0;
    2bbe:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        |              |  |  |  |  |  |  |  |      clr.w d6
    2bc0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |        \--------------|--|--|--|--|--|--|--|----- bra.w 29a8 <DrawRect+0x44>
    bltdpt = bltdpt += 64* 256*2; //Set Destination to Plane 3
    2bc4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  \--|----> adda.l #32768,a0
    bit = 1;
    2bca:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #1,66(sp)
    planes = 1; //Only Plane 3 to write to
    2bd0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      moveq #1,d1
  UWORD yoffset = starty*64;
    2bd2:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    2bd4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    2bd6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      andi.l #65535,d2
    2bdc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.l d0,d2
  ULONG bltsize = length + height*64;
    2bde:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lsl.w #6,d5
    custom->bltsize = bltsize;
    2be0:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      add.w 62(sp),d5
    2be4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      movea.w #3520,a1
    if( bit == 1) {
    2be8:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w #3535,d6
    2bec:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w 66(sp),d7
    2bf0:	                  |  |  +-----------|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|-----|----- bra.w 2b3c <DrawRect+0x1d8>
    2bf4:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  >--|--|-----|----> move.w d6,d0
    custom->bltcon0 = 0x0d00 | minterms;
    2bf6:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d0,dff040 <_end+0xd89d5c>
    custom->bltapt = (UBYTE *)bltapt;
    2bfc:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l d2,dff050 <_end+0xd89d6c>
    custom->bltbpt = (UBYTE *)bltdpt;
    2c02:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff04c <_end+0xd89d68>
    custom->bltdpt = (UBYTE *)bltdpt;
    2c08:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.l a0,dff054 <_end+0xd89d70>
    custom->bltsize = bltsize;
    2c0e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w d5,dff058 <_end+0xd89d74>
    bltdpt += 64*256;
    2c14:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      lea 16384(a0),a0
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2c18:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     |      move.w dff002 <_end+0xd89d1e>,d0
    2c1e:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |     \----- bra.w 2b76 <DrawRect+0x212>
      bit = color & 1;
    2c22:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  \----------> move.w d3,d7
    2c24:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               andi.w #1,d7
      color = color >> 1;
    2c28:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               lsr.w #1,d3
    2c2a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               move.w a1,d0
    if( bit == 1) {
    2c2c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |               cmpi.w #1,d7
    2c30:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  |  \-------------- bne.w 2b4e <DrawRect+0x1ea>
    2c34:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  |  \----------------- bra.s 2bf4 <DrawRect+0x290>
     KPrintF("Cube height is huge.\n");
    2c36:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |  \-------------------> pea 36fb7 <incbin_MercuryLetterData2Lz4_end+0x195>
    2c3c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l d0,58(sp)
    2c40:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        jsr 28f2 <KPrintF>(pc)
    2c44:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        addq.l #4,sp
    2c46:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       |  |                        move.l 54(sp),d0
    if(xlength != 0) {
    2c4a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                       \--|----------------------> tst.w d3
    2c4c:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                          \----------------------- beq.w 2ab6 <DrawRect+0x152>
      WORD length = x1 - x2;
    2c50:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   move.w a4,58(sp)
    2c54:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   movea.w a3,a1
    2c56:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   suba.w a4,a1
      if(length < 0) {
    2c58:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    2c5a:	                  |  |  |           |  |                    |                             |  |  |  |  |  |                                                   cmp.w a1,d1
    2c5c:	                  |  |  |        /--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- bgt.w 3582 <DrawRect+0xc1e>
    2c60:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   movea.w #1,a3
      WORD index = 0;
    2c64:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   clr.w 64(sp)
      length += 1;
    2c68:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a1
      if(height < 0) {
    2c6a:	                  |  |  |        |  |  |                    |                             |  |  |  |  |  |                                                   tst.w d0
    2c6c:	                  |  |  |  /-----|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------- blt.w 2df6 <DrawRect+0x492>
      height += 1; 
    2c70:	                  |  |  |  |  /--|--|--|--------------------|-----------------------------|--|--|--|--|--|-------------------------------------------------> movea.w d0,a3
    2c72:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    2c74:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   tst.w 20(a2)
    2c78:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               /-- ble.s 2c80 <DrawRect+0x31c>
    2c7a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    2c80:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                               \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    2c84:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   movea.w 24(a2),a0
      if(xposmin <= 0) {
    2c88:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   clr.w d1
    2c8a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                                   cmp.w a5,d1
    2c8c:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            /----- bge.w 2e04 <DrawRect+0x4a0>
      if(yposmin <= 0) {
    2c90:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      clr.w d1
    2c92:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                            |      cmp.w a0,d1
    2c94:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      /-----|----- bge.w 2dea <DrawRect+0x486>
      WORD startyblitt = starty - yposmin;
    2c98:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  /--|----> suba.w a0,a6
      switch(index) {
    2c9a:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                                      |  |  |      cmpi.w #2,64(sp)
    2ca0:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       /--------------|--|--|----- beq.w 2e50 <DrawRect+0x4ec>
    2ca4:	                  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #3,64(sp)
    2caa:	/-----------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 387a <DrawRect+0xf16>
    2cae:	|                 |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmpi.w #1,64(sp)
    2cb4:	|  /--------------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--------------|--|--|----- beq.w 384a <DrawRect+0xee6>
          startx -= 1;
    2cb8:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2cbc:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      move.w a1,d3
    2cbe:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      clr.w d0
    2cc0:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |              |  |  |      cmp.w a1,d0
    2cc2:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     /--------|--|--|----- bgt.w 2e62 <DrawRect+0x4fe>
          bltwidth = length / 16 + 2;
    2cc6:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     /--|--|--|----> asr.w #4,d3
    2cc8:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2cca:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      move.w a5,d0
    2ccc:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      subq.w #1,d0
    2cce:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      movea.w d0,a0
    2cd0:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |     |     |  |  |  |      tst.w d0
    2cd2:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  /--|-----|--|--|--|----- bmi.w 2e3c <DrawRect+0x4d8>
    2cd6:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  /--|--|--|--|----> move.l a0,d0
    2cd8:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      asr.l #4,d0
    2cda:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    2cdc:	|  |              |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    2ce2:	|  |  /-----------|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w a6,d1
    2ce4:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.w #6,d1
    2ce6:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    2ce8:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d1
    2cea:	|  |  |           |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a3,d1
    2cec:	|  |  |        /--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 378a <DrawRect+0xe26>
    2cf0:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    2cf4:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w d0,a5
    2cf6:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2cf8:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d1
    2cfa:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w 58(sp),d1
    2cfe:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      andi.l #65535,d0
    2d04:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #3,d0
    2d06:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2d08:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d1,d0
    2d0a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    2d0c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d0
    2d0e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d1,d0
    2d10:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2d12:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2d14:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      sub.l d0,d1
    2d16:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #4,d1
    2d18:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2d1a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      moveq #0,d0
    2d1c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a1,d0
    2d1e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      subq.l #1,d0
    2d20:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l d0,d1
    2d22:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l d0,d1
    2d24:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a6
    2d26:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a6
    2d28:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    2d2a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lsl.l #5,d1
    2d2c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    2d2e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a6,d1
    2d30:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    2d32:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.l d1,a1
    2d34:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      adda.l d0,a1
    2d36:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    2d3a:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.l a1,d1
    2d3c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.l a1,d1
    2d3e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      lea 37186 <LookupSlope>,a1
    2d44:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w d3,d0
    2d46:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      add.w d3,d0
    2d48:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      movea.w (0,a1,d1.l),a6
    2d4c:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    2d4e:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    2d50:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      clr.w d0
    2d52:	|  |  |        |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      cmp.w a6,d0
    2d54:	|  |  |  /-----|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----- bgt.w 2e1c <DrawRect+0x4b8>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2d58:	|  |  |  |  /--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--|-----------------------|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd89d1e>,d0
    2d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |      move.w a6,d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2d60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
    2d66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   btst #14,d0
    2d6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  +-- bne.s 2d60 <DrawRect+0x3fc>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.w d1,a6
    2d6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 74e42 <BltCon0LineDraw>,d0
    2d74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    2d78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd89d5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2d7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l 752c2 <PrepareBuffer>,d0
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2d84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l 752c6 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    2d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd89d68>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2d90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2d92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a5,d1
    2d94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d1,a5
    2d96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d0,a5
  custom->bltcpt = (UBYTE *)bltdpt;
    2d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89d64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2d9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89d70>
  custom->bltbmod = bltbmod;
    2da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a6,dff062 <_end+0xd89d7e>
  custom->bltcmod = bltdmod;
    2daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd89d7c>
  custom->bltdmod = bltdmod;
    2db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd89d82>
  custom->bltsize = bltwidth + 64*height;
    2db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w a3,d1
    2db8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsl.w #6,d1
    2dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d1,d3
    2dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89d74>
    Utils_CopyPolygon(copymin,ypos,height,xlength,PrepareBuffer, DrawBuffer->BitPlane+startbufferoffset, 0xcf, square->Color);
    2dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w 30(a2),d3
  UWORD tmp = (startx/16)*2;
    2dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   lsr.w #4,d2
    2dc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.w d2,d2
    2dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   andi.l #65535,d4
    2dd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l 75154 <DrawBuffer>,a0
    2dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   add.l (a0),d4
  ULONG bltdpt = (ULONG) targetbuffer + tmp;
    2dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   moveq #0,d1
    2dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w d2,d1
    2ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   movea.l d4,a0
    2dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   adda.l d1,a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  |                       |  |  |  |  |  |  |  |  |   move.w dff002 <_end+0xd89d1e>,d1
    2de6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |  \-----------------------|--|--|--|--|--|--|--|--|-- bra.w 2ae0 <DrawRect+0x17c>
        starty += 96;
    2dea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    2dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   lea 96(a0),a0
    2df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  +--|--|-- bra.w 2c98 <DrawRect+0x334>
        height = -height;
    2df6:	|  |  |  |  |  |  |  |  |  >--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-> move.w a6,d0
    2df8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   sub.w a5,d0
        index +=1;
    2dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   movea.w a5,a6
    2dfc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  |  |   move.w a3,64(sp)
    2e00:	|  |  |  |  |  |  |  |  |  |  +--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|--|--|--|--|-- bra.w 2c70 <DrawRect+0x30c>
        startx += 96;
    2e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |  \--|-> addi.w #96,58(sp)
    2e0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    2e0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    2e12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   clr.w d1
    2e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  |     |   cmp.w a0,d1
    2e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  |  \-----|-- blt.w 2c98 <DrawRect+0x334>
    2e1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |  \--------|-- bra.s 2dea <DrawRect+0x486>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    2e1c:	|  |  |  >--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-----------|-> pea 36fcd <incbin_MercuryLetterData2Lz4_end+0x1ab>
    2e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.l a0,54(sp)
    2e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   jsr 28f2 <KPrintF>(pc)
    2e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   addq.l #4,sp
    2e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   movea.l 50(sp),a0
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2e30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w dff002 <_end+0xd89d1e>,d0
    2e36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           |   move.w a6,d1
    2e38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |           \-- bra.w 2d60 <DrawRect+0x3fc>
          bltstart = ((xposmin-1)/16)*2;
    2e3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  >--|--|--|-------------> lea 15(a0),a0
    2e40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.l a0,d0
    2e42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               asr.l #4,d0
    2e44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               add.w d0,d0
          minterm = 0xee;
    2e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          |  |  |  |  |               move.w #238,64(sp)
    2e4c:	|  |  +--|--|--|--|--|--|--|--|--|--|--|--------------------|-----------------------------|--|--|--|--|--------------------------|--|--|--|--|-------------- bra.w 2ce2 <DrawRect+0x37e>
          height *= -1;
    2e50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                          \--|--|--|--|-------------> not.w d0
    2e52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               movea.w d0,a3
          startx -= 1;
    2e54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    2e58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               move.w a1,d3
    2e5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               clr.w d1
    2e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  |               cmp.w a1,d1
    2e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  |  |  \-------------- ble.w 2cc6 <DrawRect+0x362>
    2e62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |  \--|----------------> addi.w #15,d3
    2e66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  asr.w #4,d3
    2e68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    2e6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  move.w a5,d0
    2e6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  subq.w #1,d0
    2e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  movea.w d0,a0
    2e70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     |                  tst.w d0
    2e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             |     \----------------- bpl.w 2cd6 <DrawRect+0x372>
    2e76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  |                             \----------------------- bra.s 2e3c <DrawRect+0x4d8>
     KPrintF("Cube height is huge.\n");
    2e78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |  \----------------------------------------------------> pea 36fb7 <incbin_MercuryLetterData2Lz4_end+0x195>
    2e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l d0,58(sp)
    2e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         jsr 28f2 <KPrintF>(pc)
    2e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         addq.l #4,sp
    2e88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  |                                                         move.l 54(sp),d0
    if(xlength != 0) {
    2e8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |  \-------------------------------------------------------> tst.w d3
    2e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         /----------------- beq.w 3000 <DrawRect+0x69c>
      WORD length = x1 - x2;
    2e92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  move.w a3,64(sp)
    2e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  movea.w a4,a0
    2e98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    2e9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  clr.w d1
    2e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |                    |                             |  |  |                                         |                  cmp.w a0,d1
    2e9e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------|-----------------------------|--|--|-----------------------------------------|----------------- bgt.w 36e4 <DrawRect+0xd80>
    2ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  movea.w #1,a4
      WORD index = 0;
    2ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  suba.l a1,a1
      length += 1;
    2ea8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w a0,d1
    2eaa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  addq.w #1,d1
    2eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  move.w d1,58(sp)
      if(height < 0) {
    2eb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |           |                             |  |  |                                         |                  tst.w d0
    2eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------|-----------------------------|--|--|-----------------------------------------|----------------- blt.w 3034 <DrawRect+0x6d0>
      height += 1; 
    2eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------|-----------------------------|--|--|-----------------------------------------|----------------> movea.w d0,a4
    2eb8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    2eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  tst.w 20(a2)
    2ebe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              /-- ble.s 2ec8 <DrawRect+0x564>
    2ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   move.w a1,d1
    2ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   eori.w #3,d1
    2ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    2ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    2ecc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    2ed0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  clr.w d1
    2ed2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |                  cmp.w a6,d1
    2ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           /----- bge.w 301c <DrawRect+0x6b8>
      if(yposmin <= 0) {
    2ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      clr.w d1
    2eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |           |      cmp.w a0,d1
    2edc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     /-----|----- bge.w 3010 <DrawRect+0x6ac>
      WORD startyblitt = starty - yposmin;
    2ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  /--|----> suba.w a0,a5
      switch(index) {
    2ee2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      moveq #2,d1
    2ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |                             |  |  |                                         |     |  |  |      cmp.w a1,d1
    2ee6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              /--------------|--|--|-----------------------------------------|-----|--|--|----- beq.w 3534 <DrawRect+0xbd0>
    2eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      moveq #3,d1
    2eec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                                         |     |  |  |      cmp.w a1,d1
    2eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             /-----------|-----|--|--|----- beq.w 3072 <DrawRect+0x70e>
    2ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      moveq #1,d1
    2ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |              |  |  |                             |           |     |  |  |      cmp.w a1,d1
    2ef6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  /-----------|--|--|-----------------------------|-----------|-----|--|--|----- bne.w 3538 <DrawRect+0xbd4>
          height *= -1;
    2efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      not.w d0
    2efc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    2efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |           |     |  |  |      tst.w d3
    2f00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     /-----|-----|--|--|----- blt.w 3078 <DrawRect+0x714>
          bltwidth = xlength/16+2;
    2f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  /--|--|--|----> asr.w #4,d3
    2f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    2f08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |     |     |  |  |  |  |      move.w a3,d0
    2f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  /--|-----|--|--|--|--|----- bmi.w 3062 <DrawRect+0x6fe>
    2f0e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    2f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    2f12:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |              |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    2f16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           /--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w a5,d1
    2f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    2f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    2f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      clr.w d1
    2f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    2f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3708 <DrawRect+0xda4>
    2f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    2f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    2f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    2f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    2f30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    2f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    2f38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    2f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2f3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    2f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    2f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2f44:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    2f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    2f4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    2f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    2f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    2f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    2f54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    2f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    2f5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    2f5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    2f60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2f62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    2f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2f68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      movea.l d1,a0
    2f6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      adda.l d0,a0
    2f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    2f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.l a0,d1
    2f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.l a0,d1
    2f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      lea 37186 <LookupSlope>,a0
    2f7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    2f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    2f7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    2f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
    2f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    2f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    2f8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      tst.w d1
    2f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 3040 <DrawRect+0x6dc>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    2f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|-----------|--|--|-----------|--|--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd89d1e>,d0
    2f96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    2f9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
    2fa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    2fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 2f9a <DrawRect+0x636>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    2fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    2faa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.w 74e42 <BltCon0LineDraw>,a0
    2fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    2fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    2fb4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    2fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd89d5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    2fbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    2fbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    2fc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 752c2 <PrepareBuffer>,a5
    2fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    2fc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 752c6 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    2fce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd89d68>
  custom->bltcpt = (UBYTE *)bltdpt;
    2fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89d64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    2fda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89d70>
  custom->bltbmod = bltbmod;
    2fe0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd89d7e>
  custom->bltcmod = bltdmod;
    2fe8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd89d7c>
  custom->bltdmod = bltdmod;
    2fee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd89d82>
  custom->bltsize = bltwidth + 64*height;
    2ff4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    2ff6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    2ff8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    2ffa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89d74>
  WORD x1 = square->Vertices[index1].X;
    3000:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |  \--|--|--|--|--|-> movea.w 12(a2),a3
  WORD xlength = square->XLength;
    3004:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    3008:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  |                             |  |  |  |     |  |  |  |  |   movea.w 14(a2),a5
}
    300c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |  \-----------------------------|--|--|--|-----|--|--|--|--|-- bra.w 2a9e <DrawRect+0x13a>
        starty += 96;
    3010:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    3014:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    3018:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  +--|--|-- bra.w 2ee0 <DrawRect+0x57c>
        startx += 96;
    301c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    3022:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    3026:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    302a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   clr.w d1
    302c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  |     |   cmp.w a0,d1
    302e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  |  \-----|-- blt.w 2ee0 <DrawRect+0x57c>
    3032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |  \--------|-- bra.s 3010 <DrawRect+0x6ac>
        height = -height;
    3034:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> move.w a5,d0
    3036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   sub.w a6,d0
        index +=1;
    3038:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a6,a5
    303a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.w a4,a1
    303c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-- bra.w 2eb6 <DrawRect+0x552>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    3040:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|-----------|--|--|-----------|--|--------------------------------|--|--|--|-----|-----------|-> pea 36fcd <incbin_MercuryLetterData2Lz4_end+0x1ab>
    3046:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.l a1,58(sp)
    304a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   jsr 28f2 <KPrintF>(pc)
    304e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   addq.l #4,sp
    3050:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    3054:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w dff002 <_end+0xd89d1e>,d0
    305a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           |   move.w 58(sp),d1
    305e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |           \-- bra.w 2f9a <DrawRect+0x636>
          bltstart = (startx / 16)*2;
    3062:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  >--|--|-----|-------------> addi.w #15,d0
    3066:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               asr.w #4,d0
    3068:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    306a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                |  |  |  |     |               movea.w #187,a1
    306e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           +--|--|-----------|--|--------------------------------|--|--|--|-----|-------------- bra.w 2f16 <DrawRect+0x5b2>
          bltwidth = xlength/16+2;
    3072:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                \--|--|--|-----|-------------> tst.w d3
    3074:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  |  |     \-------------- bge.w 2f04 <DrawRect+0x5a0>
    3078:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |  \--|-------------------> addi.w #15,d3
    307c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     asr.w #4,d3
    307e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    3080:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     |                     move.w a3,d0
    3082:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   |     \-------------------- bpl.w 2f0e <DrawRect+0x5aa>
    3086:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  |                                   \-------------------------- bra.s 3062 <DrawRect+0x6fe>
     KPrintF("Cube height is huge.\n");
    3088:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |  \-------------------------------------------------------------> pea 36fb7 <incbin_MercuryLetterData2Lz4_end+0x195>
    308e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l d0,58(sp)
    3092:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  jsr 28f2 <KPrintF>(pc)
    3096:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  addq.l #4,sp
    3098:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                                                                  move.l 54(sp),d0
    if(xlength != 0) {
    309c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           \----------------------------------------------------------------> tst.w d3
    309e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              /-------------- beq.w 320c <DrawRect+0x8a8>
      WORD length = x1 - x2;
    30a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               move.w a4,58(sp)
    30a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               movea.w a3,a1
    30a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               suba.w a4,a1
      if(length < 0) {
    30aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               clr.w d1
    30ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |                                                              |               cmp.w a1,d1
    30ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        /-----------------------------------------------------|-------------- bgt.w 3648 <DrawRect+0xce4>
    30b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               movea.w #1,a3
      WORD index = 0;
    30b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               clr.w 64(sp)
      length += 1;
    30ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               addq.w #1,a1
      if(height < 0) {
    30bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |        |                                                     |               tst.w d0
    30be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  /-----|-----------------------------------------------------|-------------- blt.w 3240 <DrawRect+0x8dc>
      height += 1; 
    30c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  /--|-----------------------------------------------------|-------------> movea.w d0,a3
    30c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               addq.w #1,a3
      if(square->Clockwise > 0) index = index ^ 0x3;
    30c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               tst.w 20(a2)
    30ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           /-- ble.s 30d2 <DrawRect+0x76e>
    30cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           |   eori.w #3,64(sp)
      WORD xposmin = square->XPosMin;
    30d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |           \-> movea.w 22(a2),a5
      WORD yposmin = square->YPosMin;
    30d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               movea.w 24(a2),a0
      if(xposmin <= 0) {
    30da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               clr.w d1
    30dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |               cmp.w a5,d1
    30de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        /----- bge.w 3228 <DrawRect+0x8c4>
      if(yposmin <= 0) {
    30e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      clr.w d1
    30e4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |        |      cmp.w a0,d1
    30e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  /-----|----- bge.w 321c <DrawRect+0x8b8>
      WORD startyblitt = starty - yposmin;
    30ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  /--|----> suba.w a0,a6
      switch(index) {
    30ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                                     |  |  |  |      cmpi.w #2,64(sp)
    30f2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      /--------------|--|--|--|----- beq.w 3288 <DrawRect+0x924>
    30f6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #3,64(sp)
    30fc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3838 <DrawRect+0xed4>
    3100:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |                                      |              |  |  |  |      cmpi.w #1,64(sp)
    3106:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--------------------------------------|--------------|--|--|--|----- beq.w 3808 <DrawRect+0xea4>
          startx -= 1;
    310a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    310e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      move.w a1,d3
    3110:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      clr.w d0
    3112:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |              |  |  |  |      cmp.w a1,d0
    3114:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     /--------|--|--|--|----- bgt.w 329a <DrawRect+0x936>
          bltwidth = length / 16 + 2;
    3118:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     /--|--|--|--|----> asr.w #4,d3
    311a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    311c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      move.w a5,d0
    311e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      subq.w #1,d0
    3120:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      movea.w d0,a0
    3122:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |     |     |  |  |  |  |      tst.w d0
    3124:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  /--|-----|--|--|--|--|----- bmi.w 3274 <DrawRect+0x910>
    3128:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  /--|--|--|--|--|----> move.l a0,d0
    312a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      asr.l #4,d0
    312c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xee;
    312e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      move.w #238,64(sp)
  UWORD startyoffset = starty*64;
    3134:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--------------------------------------|--|--|--|--|--|--|--|--|----> move.w a6,d1
    3136:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    3138:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      movea.w d1,a6
  if( height < 0) {
    313a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      clr.w d1
    313c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                      |  |  |  |  |  |  |  |  |      cmp.w a3,d1
    313e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /-----------------------------|--|--|--|--|--|--|--|--|----- bgt.w 3668 <DrawRect+0xd04>
    3142:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w #64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    3146:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.w d0,a5
    3148:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    314a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d1
    314c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
    3150:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    3156:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    3158:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    315a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d1,d0
    315c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    315e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d0
    3160:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d1,d0
    3162:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    3164:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    3166:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.l d0,d1
    3168:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    316a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    316c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      moveq #0,d0
    316e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w a1,d0
    3170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      subq.l #1,d0
    3172:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l d0,d1
    3174:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l d0,d1
    3176:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a6
    3178:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a6
    317a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    317c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    317e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    3180:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a6,d1
    3182:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    3184:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      movea.l d1,a1
    3186:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      adda.l d0,a1
    3188:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea (-1,a1,a3.w),a1
    318c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.l a1,d1
    318e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.l a1,d1
    3190:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      lea 37186 <LookupSlope>,a1
    3196:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w d3,d0
    3198:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      add.w d3,d0
    319a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      move.w (0,a1,d1.l),d1
    319e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    31a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      suba.w d0,a0
  if( bltbmod < 0 ) {
    31a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |                             |  |  |  |  |  |  |  |  |      tst.w d1
    31a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|-----------------------------|--|--|--|--|--|--|--|--|----- blt.w 324e <DrawRect+0x8ea>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    31a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|-----------------------------|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    31ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
    31b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   btst #14,d0
    31b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  +-- bne.s 31ae <DrawRect+0x84a>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    31ba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w 74e42 <BltCon0LineDraw>,d0
    31c0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   or.w 64(sp),d0
    31c4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd89d5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    31ca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    31cc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    31ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   movea.l 752c2 <PrepareBuffer>,a5
    31d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    31d6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   adda.l 752c6 <LineBuffer>,a4
  custom->bltbpt = (UBYTE *)bltbpt;
    31dc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a4,dff04c <_end+0xd89d68>
  custom->bltcpt = (UBYTE *)bltdpt;
    31e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89d64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    31e8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89d70>
  custom->bltbmod = bltbmod;
    31ee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d1,dff062 <_end+0xd89d7e>
  custom->bltcmod = bltdmod;
    31f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff060 <_end+0xd89d7c>
  custom->bltdmod = bltdmod;
    31fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a0,dff066 <_end+0xd89d82>
  custom->bltsize = bltwidth + 64*height;
    3200:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w a3,d0
    3202:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    3204:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    3206:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89d74>
  WORD x1 = square->Vertices[index1].X;
    320c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |  \--|--|--|--|-> movea.w 8(a2),a4
  WORD xlength = square->XLength;
    3210:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    3214:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   movea.w 10(a2),a6
}
    3218:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|-----|--|--|--|-- bra.w 2a84 <DrawRect+0x120>
        starty += 96;
    321c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     >--|--|--|-> lea 96(a6),a6
        yposmin += 96;
    3220:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  |  |   lea 96(a0),a0
    3224:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  +--|--|-- bra.w 30ea <DrawRect+0x786>
        startx += 96;
    3228:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |  \--|-> addi.w #96,58(sp)
    322e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   movea.w 58(sp),a4
        xposmin += 96;
    3232:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   lea 96(a5),a5
      if(yposmin <= 0) {
    3236:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   clr.w d1
    3238:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  |     |   cmp.w a0,d1
    323a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     |  \-----|-- blt.w 30ea <DrawRect+0x786>
    323e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |     \--------|-- bra.s 321c <DrawRect+0x8b8>
        height = -height;
    3240:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  >--|--|--|--|--|-----------------------------|--|--|--|--|--------------|-> move.w a6,d0
    3242:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   sub.w a5,d0
        index +=1;
    3244:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.w a5,a6
    3246:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w a3,64(sp)
    324a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  +--|--|--|--|-----------------------------|--|--|--|--|--------------|-- bra.w 30c2 <DrawRect+0x75e>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    324e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >--|--|-----------------------------|--|--|--|--|--------------|-> pea 36fcd <incbin_MercuryLetterData2Lz4_end+0x1ab>
    3254:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l d1,58(sp)
    3258:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l a0,54(sp)
    325c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   jsr 28f2 <KPrintF>(pc)
    3260:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   addq.l #4,sp
    3262:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   movea.l 50(sp),a0
    3266:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.l 54(sp),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    326a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              |   move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    3270:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |              \-- bra.w 31ae <DrawRect+0x84a>
          bltstart = ((xposmin-1)/16)*2;
    3274:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  >--|--|--|----------------> lea 15(a0),a0
    3278:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.l a0,d0
    327a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  asr.l #4,d0
    327c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  add.w d0,d0
          minterm = 0xee;
    327e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |  |  |                  move.w #238,64(sp)
    3284:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|--|--|--|--|--|--|--|-----------------------------|--|--|--|--|----------------- bra.w 3134 <DrawRect+0x7d0>
          height *= -1;
    3288:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                             \--|--|--|--|----------------> not.w d0
    328a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  movea.w d0,a3
          startx -= 1;
    328c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  subq.w #1,58(sp)
          bltwidth = length / 16 + 2;
    3290:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  move.w a1,d3
    3292:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  clr.w d1
    3294:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  |                  cmp.w a1,d1
    3296:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |  \----------------- ble.w 3118 <DrawRect+0x7b4>
    329a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |  \--|-------------------> addi.w #15,d3
    329e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     asr.w #4,d3
    32a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    32a2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     move.w a5,d0
    32a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     subq.w #1,d0
    32a6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     movea.w d0,a0
    32a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     |                     tst.w d0
    32aa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                |     \-------------------- bpl.w 3128 <DrawRect+0x7c4>
    32ae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                \-------------------------- bra.s 3274 <DrawRect+0x910>
     KPrintF("Cube height is huge.\n");
    32b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> pea 36fb7 <incbin_MercuryLetterData2Lz4_end+0x195>
    32b6:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l d0,58(sp)
    32ba:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            jsr 28f2 <KPrintF>(pc)
    32be:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            addq.l #4,sp
    32c0:	|  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                                            move.l 54(sp),d0
    if(xlength != 0) {
    32c4:	|  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------------------------> tst.w d3
    32c6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         /----------------- beq.w 3438 <DrawRect+0xad4>
      WORD length = x1 - x2;
    32ca:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  move.w a3,64(sp)
    32ce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  movea.w a6,a0
    32d0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  suba.w a3,a0
      if(length < 0) {
    32d2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  clr.w d1
    32d4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |                                         |                  cmp.w a0,d1
    32d6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        /--------------------------------|----------------- bgt.w 35a2 <DrawRect+0xc3e>
    32da:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  movea.w #1,a6
      WORD index = 0;
    32de:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  suba.l a1,a1
      length += 1;
    32e0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w a0,d1
    32e2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  addq.w #1,d1
    32e4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  move.w d1,58(sp)
      if(height < 0) {
    32e8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |        |                                |                  tst.w d0
    32ea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  /-----|--------------------------------|----------------- blt.w 346c <DrawRect+0xb08>
      height += 1; 
    32ee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--------------------------------|----------------> movea.w d0,a4
    32f0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  addq.w #1,a4
      if(square->Clockwise > 0) index = index ^ 0x3;
    32f2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  tst.w 20(a2)
    32f6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              /-- ble.s 3300 <DrawRect+0x99c>
    32f8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   move.w a1,d1
    32fa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   eori.w #3,d1
    32fe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              |   movea.w d1,a1
      WORD xposmin = square->XPosMin;
    3300:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |              \-> movea.w 22(a2),a6
      WORD yposmin = square->YPosMin;
    3304:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  movea.w 24(a2),a0
      if(xposmin <= 0) {
    3308:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  clr.w d1
    330a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |                  cmp.w a6,d1
    330c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           /----- bge.w 3454 <DrawRect+0xaf0>
      if(yposmin <= 0) {
    3310:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      clr.w d1
    3312:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |           |      cmp.w a0,d1
    3314:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     /-----|----- bge.w 3448 <DrawRect+0xae4>
      WORD startyblitt = starty - yposmin;
    3318:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  /--|----> suba.w a0,a5
      switch(index) {
    331a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      moveq #2,d1
    331c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |     |  |  |      cmp.w a1,d1
    331e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              /-----------------|-----|--|--|----- beq.w 34e4 <DrawRect+0xb80>
    3322:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      moveq #3,d1
    3324:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                 |     |  |  |      cmp.w a1,d1
    3326:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     /-----------|-----|--|--|----- beq.w 34aa <DrawRect+0xb46>
    332a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      moveq #1,d1
    332c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |     |           |     |  |  |      cmp.w a1,d1
    332e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  /--|-----------|-----|--|--|----- bne.w 34e8 <DrawRect+0xb84>
          height *= -1;
    3332:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      not.w d0
    3334:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      movea.w d0,a4
          bltwidth = xlength/16+2;
    3336:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |           |     |  |  |      tst.w d3
    3338:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     /-----|-----|--|--|----- blt.w 34b0 <DrawRect+0xb4c>
          bltwidth = xlength/16+2;
    333c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  /--|--|--|----> asr.w #4,d3
    333e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      addq.w #2,d3
          bltstart = (startx / 16)*2;
    3340:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |     |     |  |  |  |  |      move.w a3,d0
    3342:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  /--|-----|--|--|--|--|----- bmi.w 349a <DrawRect+0xb36>
    3346:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  /--|--|--|--|--|----> asr.w #4,d0
    3348:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      add.w d0,d0
          minterm = 0xbb;
    334a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |  |  |  |  |  |  |  |  |  |  |      movea.w #187,a1
  UWORD startyoffset = starty*64;
    334e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           /--|--|--|--|--|--|--|--|--|--|--|----> move.w a5,d1
    3350:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      lsl.w #6,d1
    3352:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      movea.w d1,a5
  if( height < 0) {
    3354:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      clr.w d1
    3356:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |  |  |  |  |  |  |  |  |      cmp.w a4,d1
    3358:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        /--|--|--|--|--|--|--|--|--|--|--|--|----- bgt.w 35c6 <DrawRect+0xc62>
    335c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.w #64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    3360:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3362:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d1
    3364:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 64(sp),d1
    3368:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      andi.l #65535,d0
    336e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #3,d0
    3370:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    3372:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,d0
    3374:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    3376:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d0
    3378:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d1,d0
    337a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    337c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    337e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.l d0,d1
    3380:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #4,d1
    3382:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3384:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      moveq #0,d0
    3386:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d0
    338a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      subq.l #1,d0
    338c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d0,d1
    338e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    3390:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l d0,d1
    3392:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l d1,46(sp)
    3396:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lsl.l #5,d1
    3398:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    339a:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l 46(sp),d1
    339e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    33a0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      movea.l d1,a0
    33a2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      adda.l d0,a0
    33a4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea (-1,a0,a4.w),a0
    33a8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.l a0,d1
    33aa:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.l a0,d1
    33ac:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      lea 37186 <LookupSlope>,a0
    33b2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d3,d0
    33b4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      add.w d3,d0
    33b6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w (0,a0,d1.l),d1
    33ba:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      sub.w d0,d1
    33bc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    33c0:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      suba.w d0,a6
  if( bltbmod < 0 ) {
    33c2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |  |      tst.w d1
    33c4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|--|--|--|--|--|--|--|--|--|--|----- blt.w 3478 <DrawRect+0xb14>
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    33c8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|----> move.w dff002 <_end+0xd89d1e>,d0
    33ce:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 58(sp),d1
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    33d2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
    33d8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   btst #14,d0
    33dc:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-- bne.s 33d2 <DrawRect+0xa6e>
  custom->bltcon0 = BltCon0LineDraw | minterm;
    33de:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d1,58(sp)
    33e2:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.w 74e42 <BltCon0LineDraw>,a0
    33e8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a0,d0
    33ea:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a1,d1
    33ec:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   or.w d1,d0
    33ee:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d0,dff040 <_end+0xd89d5c>
  ULONG bltdpt = (ULONG) PrepareBuffer + targetbufferoffset;
    33f4:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   moveq #0,d0
    33f6:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a5,d0
    33f8:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   movea.l 752c2 <PrepareBuffer>,a5
    33fe:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l d0,a5
  ULONG bltbpt = (ULONG) LineBuffer + startbufferoffset;
    3400:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   adda.l 752c6 <LineBuffer>,a3
  custom->bltbpt = (UBYTE *)bltbpt;
    3406:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a3,dff04c <_end+0xd89d68>
  custom->bltcpt = (UBYTE *)bltdpt;
    340c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff048 <_end+0xd89d64>
  custom->bltdpt = (UBYTE *)bltdpt;  
    3412:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.l a5,dff054 <_end+0xd89d70>
  custom->bltbmod = bltbmod;
    3418:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w 58(sp),dff062 <_end+0xd89d7e>
  custom->bltcmod = bltdmod;
    3420:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff060 <_end+0xd89d7c>
  custom->bltdmod = bltdmod;
    3426:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a6,dff066 <_end+0xd89d82>
  custom->bltsize = bltwidth + 64*height;
    342c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w a4,d0
    342e:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   lsl.w #6,d0
    3430:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   add.w d0,d3
    3432:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |   move.w d3,dff058 <_end+0xd89d74>
  WORD x1 = square->Vertices[index1].X;
    3438:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-> movea.w 4(a2),a3
  WORD xlength = square->XLength;
    343c:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   move.w 26(a2),d3
  WORD height = y1 - y2;
    3440:	|  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   movea.w 6(a2),a5
}
    3444:	|  |  |  |  |  |  \--|--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-- bra.w 2a62 <DrawRect+0xfe>
        starty += 96;
    3448:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  >--|--|--|-> lea 96(a5),a5
        yposmin += 96;
    344c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |   lea 96(a0),a0
    3450:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  +--|--|-- bra.w 3318 <DrawRect+0x9b4>
        startx += 96;
    3454:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  \--|-> addi.w #96,64(sp)
    345a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   movea.w 64(sp),a3
        xposmin += 96;
    345e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   lea 96(a6),a6
      if(yposmin <= 0) {
    3462:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   clr.w d1
    3464:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     |   cmp.w a0,d1
    3466:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  \-----|-- blt.w 3318 <DrawRect+0x9b4>
    346a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--------|-- bra.s 3448 <DrawRect+0xae4>
        height = -height;
    346c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-> move.w a5,d0
    346e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   sub.w a4,d0
        index +=1;
    3470:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a4,a5
    3472:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.w a6,a1
    3474:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|-----|-----------|-- bra.w 32ee <DrawRect+0x98a>
    KPrintF("SmartlineFill bltbmod overflow. Slope too flat.\n");
    3478:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|-----|-----------|-> pea 36fcd <incbin_MercuryLetterData2Lz4_end+0x1ab>
    347e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.l a1,58(sp)
    3482:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   jsr 28f2 <KPrintF>(pc)
    3486:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   addq.l #4,sp
    3488:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   movea.l 54(sp),a1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    348c:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w dff002 <_end+0xd89d1e>,d0
    3492:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           |   move.w 58(sp),d1
    3496:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |           \-- bra.w 33d2 <DrawRect+0xa6e>
          bltstart = (startx / 16)*2;
    349a:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|-----|-------------> addi.w #15,d0
    349e:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               asr.w #4,d0
    34a0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               add.w d0,d0
          minterm = 0xbb;
    34a2:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |               movea.w #187,a1
    34a6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|-----|-------------- bra.w 334e <DrawRect+0x9ea>
          bltwidth = xlength/16+2;
    34aa:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|-------------> tst.w d3
    34ac:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |     \-------------- bge.w 333c <DrawRect+0x9d8>
    34b0:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|-------------------> addi.w #15,d3
    34b4:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     asr.w #4,d3
    34b6:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     addq.w #2,d3
          bltstart = (startx / 16)*2;
    34b8:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |                     move.w a3,d0
    34ba:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     \-------------------- bpl.w 3346 <DrawRect+0x9e2>
    34be:	|  |  |  |  |  |     |  |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------- bra.s 349a <DrawRect+0xb36>
    planes = 2; //Write Plene 1 and two to make the colors of the Cube      
    34c0:	|  |  |  |  |  |     \--|--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------> moveq #2,d1
  UWORD yoffset = starty*64;
    34c2:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d6
  UWORD offset = yoffset+tmp;//+blitendoffset;
    34c4:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w d6,d2
  ULONG bltapt = (ULONG) startbuffer + offset;
    34c6:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 andi.l #65535,d2
    34cc:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.l d0,d2
  ULONG bltsize = length + height*64;
    34ce:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 lsl.w #6,d5
    custom->bltsize = bltsize;
    34d0:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 add.w 62(sp),d5
    34d4:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 movea.w #3520,a1
    if( bit == 1) {
    34d8:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w #3535,d6
    34dc:	|  |  |  |  |  |        |  |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                 move.w 66(sp),d7
    34e0:	|  |  |  |  |  |        \--|--|--|--------|--|--|--|--|--|-----|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-------------------------------- bra.w 2b3c <DrawRect+0x1d8>
          height *= -1;
    34e4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|-------------------------------> not.w d0
    34e6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |                                 movea.w d0,a4
          startx -= 1;
    34e8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    34ec:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                       move.w 58(sp),d3
    34f0:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   /-- bmi.s 3520 <DrawRect+0xbbc>
    34f2:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   asr.w #4,d3
    34f4:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    34f6:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   move.w a6,d0
    34f8:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   subq.w #1,d0
    34fa:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   movea.w d0,a0
    34fc:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                   |   tst.w d0
    34fe:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             /-----|-- bmi.s 350e <DrawRect+0xbaa>
    3500:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  /--|-> move.l a0,d0
    3502:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3504:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3506:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
          break;
    350a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  +-----------------------------|--|--|-- bra.w 334e <DrawRect+0x9ea>
          bltstart = ((xposmin-1)/16)*2;
    350e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             >--|--|-> lea 15(a0),a0
    3512:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   move.l a0,d0
    3514:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   asr.l #4,d0
    3516:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   add.w d0,d0
          minterm = 0xee;
    3518:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                             |  |  |   movea.w #238,a1
    351c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----------------------------|--|--|-- bra.w 334e <DrawRect+0x9ea>
          bltwidth = length / 16 + 2;
    3520:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    3524:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    3526:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3528:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    352a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    352c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    352e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    3530:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 3500 <DrawRect+0xb9c>
    3532:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                \-------- bra.s 350e <DrawRect+0xbaa>
          height *= -1;
    3534:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |  \--|--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> not.w d0
    3536:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w d0,a4
          startx -= 1;
    3538:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |     \--|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> subq.w #1,64(sp)
          bltwidth = length / 16 + 2;
    353c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.w 58(sp),d3
    3540:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      /-- bmi.s 355e <DrawRect+0xbfa>
    3542:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   asr.w #4,d3
    3544:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3546:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   move.w a6,d0
    3548:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   subq.w #1,d0
    354a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   movea.w d0,a0
    354c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                      |   tst.w d0
    354e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                /-----|-- bmi.s 3570 <DrawRect+0xc0c>
    3550:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  /--|-> move.l a0,d0
    3552:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   asr.l #4,d0
    3554:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   add.w d0,d0
          minterm = 0xee;
    3556:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  |   movea.w #238,a1
          break;
    355a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  +--------|--|--|--|--|--|--|--|--|--|--|--|--------------------------------|--|--|-- bra.w 2f16 <DrawRect+0x5b2>
          bltwidth = length / 16 + 2;
    355e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |  \-> addi.w #15,d3
    3562:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      asr.w #4,d3
    3564:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      addq.w #2,d3
          bltstart = ((xposmin-1)/16)*2;
    3566:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      move.w a6,d0
    3568:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      subq.w #1,d0
    356a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      movea.w d0,a0
    356c:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  |      tst.w d0
    356e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                |  \----- bpl.s 3550 <DrawRect+0xbec>
    3570:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                \-------> lea 15(a0),a0
    3574:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          move.l a0,d0
    3576:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          asr.l #4,d0
    3578:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          add.w d0,d0
          minterm = 0xee;
    357a:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  |        |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #238,a1
    357e:	|  |  |  |  |  |           |  |  |        |  |  |  |  |  |     |  |  |  \--------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2f16 <DrawRect+0x5b2>
        length *= -1;
    3582:	|  |  |  |  |  |           |  |  \--------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------> movea.w a4,a1
    3584:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          suba.w a3,a1
        index = 2;
    3586:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w a3,a4
      WORD startx = x1;
    3588:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w a3,58(sp)
    358c:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          movea.w #3,a3
        index = 2;
    3590:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          move.w #2,64(sp)
      length += 1;
    3596:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          addq.w #1,a1
      if(height < 0) {
    3598:	|  |  |  |  |  |           |  |           |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  |  |  |  |                                          tst.w d0
    359a:	|  |  |  |  |  |           |  \-----------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bge.w 2c70 <DrawRect+0x30c>
    359e:	|  |  |  |  |  |           \--------------|--|--|--|--|--|-----|--|--|-----------|--|--|--|--|--|--|--|--|--|--|--|----------------------------------------- bra.w 2df6 <DrawRect+0x492>
        length *= -1;
    35a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |  \--|--|--|----------------------------------------> movea.w a3,a0
    35a4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          suba.w a6,a0
        index = 2;
    35a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w a6,a3
      WORD startx = x1;
    35a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a6,64(sp)
    35ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #3,a6
        index = 2;
    35b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          movea.w #2,a1
      length += 1;
    35b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w a0,d1
    35b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          addq.w #1,d1
    35b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          move.w d1,58(sp)
      if(height < 0) {
    35bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  |     |  |  |                                          tst.w d0
    35be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  |  \-----|--|--|----------------------------------------- bge.w 32ee <DrawRect+0x98a>
    35c2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |  \--------|--|--|----------------------------------------- bra.w 346c <DrawRect+0xb08>
    startyoffset -= (height + 1) * 64;    
    35c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |  \----------------------------------------> move.w a4,d1
    35c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.w #6,d1
    35ca:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a0
    35cc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 64(a0),a0
    35d0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w a0,a5
    height *= -1;
    35d2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w a4,d1
    35d4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             neg.w d1
    35d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w d1,a4
    35d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    35dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    35de:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d1
    35e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 64(sp),d1
    35e4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             andi.l #65535,d0
    35ea:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #3,d0
    35ec:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    35ee:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,d0
    35f0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    35f2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d0
    35f4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d1,d0
    35f6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    35f8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    35fa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.l d0,d1
    35fc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #4,d1
    35fe:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3600:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             moveq #0,d0
    3602:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w 58(sp),d0
    3606:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             subq.l #1,d0
    3608:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d0,d1
    360a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    360c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l d0,d1
    360e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l d1,46(sp)
    3612:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lsl.l #5,d1
    3614:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    3616:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l 46(sp),d1
    361a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    361c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             movea.l d1,a0
    361e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             adda.l d0,a0
    3620:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea (-1,a0,a4.w),a0
    3624:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.l a0,d1
    3626:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.l a0,d1
    3628:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             lea 37186 <LookupSlope>,a0
    362e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d3,d0
    3630:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             add.w d3,d0
    3632:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w (0,a0,d1.l),d1
    3636:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             sub.w d0,d1
    3638:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    363c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             suba.w d0,a6
  if( bltbmod < 0 ) {
    363e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  |                                             tst.w d1
    3640:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           |  \-------------------------------------------- bge.w 33c8 <DrawRect+0xa64>
    3644:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  |  |  |  |           \----------------------------------------------- bra.w 3478 <DrawRect+0xb14>
        length *= -1;
    3648:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |  \--|--|--|----------------------------------------------------------> movea.w a4,a1
    364a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            suba.w a3,a1
        index = 2;
    364c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w a3,a4
      WORD startx = x1;
    364e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w a3,58(sp)
    3652:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            movea.w #3,a3
        index = 2;
    3656:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            move.w #2,64(sp)
      length += 1;
    365c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            addq.w #1,a1
      if(height < 0) {
    365e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  |     |  |  |                                                            tst.w d0
    3660:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           |  \-----|--|--|----------------------------------------------------------- bge.w 30c2 <DrawRect+0x75e>
    3664:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |           \--------|--|--|----------------------------------------------------------- bra.w 3240 <DrawRect+0x8dc>
    startyoffset -= (height + 1) * 64;    
    3668:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |  \----------------------------------------------------------> move.w a3,d1
    366a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.w #6,d1
    366c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a0
    366e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 64(a0),a0
    3672:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w a0,a6
    height *= -1;
    3674:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a3,d1
    3676:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               neg.w d1
    3678:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d1,a3
    367a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    367e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.w d0,a5
    3680:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3682:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d1
    3684:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w 58(sp),d1
    3688:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               andi.l #65535,d0
    368e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #3,d0
    3690:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    3692:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d1,d0
    3694:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    3696:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d0
    3698:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d1,d0
    369a:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    369c:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    369e:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.l d0,d1
    36a0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #4,d1
    36a2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    36a4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               moveq #0,d0
    36a6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w a1,d0
    36a8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               subq.l #1,d0
    36aa:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l d0,d1
    36ac:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l d0,d1
    36ae:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a6
    36b0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a6
    36b2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    36b4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lsl.l #5,d1
    36b6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    36b8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a6,d1
    36ba:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    36bc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               movea.l d1,a1
    36be:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               adda.l d0,a1
    36c0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea (-1,a1,a3.w),a1
    36c4:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.l a1,d1
    36c6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.l a1,d1
    36c8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               lea 37186 <LookupSlope>,a1
    36ce:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w d3,d0
    36d0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               add.w d3,d0
    36d2:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               move.w (0,a1,d1.l),d1
    36d6:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               sub.w d0,d1
  WORD bltdmod = direction - 2 * bltwidth;
    36d8:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               suba.w d0,a0
  if( bltbmod < 0 ) {
    36da:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  |                                                               tst.w d1
    36dc:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    |  \-------------------------------------------------------------- bge.w 31a8 <DrawRect+0x844>
    36e0:	|  |  |  |  |  |                          |  |  |  |  |  |     |  |  |                    \----------------------------------------------------------------- bra.w 324e <DrawRect+0x8ea>
        length *= -1;
    36e4:	|  |  |  |  |  |                          |  |  \--|--|--|-----|--|--|-------------------------------------------------------------------------------------> movea.w a3,a0
    36e6:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       suba.w a4,a0
        index = 2;
    36e8:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w a4,a3
      WORD startx = x1;
    36ea:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a4,64(sp)
    36ee:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #3,a4
        index = 2;
    36f2:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       movea.w #2,a1
      length += 1;
    36f6:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w a0,d1
    36f8:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       addq.w #1,d1
    36fa:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       move.w d1,58(sp)
      if(height < 0) {
    36fe:	|  |  |  |  |  |                          |  |     |  |  |     |  |  |                                                                                       tst.w d0
    3700:	|  |  |  |  |  |                          |  \-----|--|--|-----|--|--|-------------------------------------------------------------------------------------- bge.w 2eb6 <DrawRect+0x552>
    3704:	|  |  |  |  |  |                          \--------|--|--|-----|--|--|-------------------------------------------------------------------------------------- bra.w 3034 <DrawRect+0x6d0>
    startyoffset -= (height + 1) * 64;    
    3708:	|  |  |  |  |  |                                   |  |  \-----|--|--|-------------------------------------------------------------------------------------> move.w a4,d1
    370a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.w #6,d1
    370c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a0
    370e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 64(a0),a0
    3712:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w a0,a5
    height *= -1;
    3714:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w a4,d1
    3716:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       neg.w d1
    3718:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w d1,a4
    371a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.w #-64,a6
  UWORD targetbufferoffset = bltstart + startyoffset;
    371e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.w d0,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    3720:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d1
    3722:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 64(sp),d1
    3726:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       andi.l #65535,d0
    372c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #3,d0
    372e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    3730:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,d0
    3732:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3734:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d0
    3736:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d1,d0
    3738:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    373a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    373c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.l d0,d1
    373e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #4,d1
    3740:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a3
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    3742:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       moveq #0,d0
    3744:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w 58(sp),d0
    3748:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       subq.l #1,d0
    374a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d0,d1
    374c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    374e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l d0,d1
    3750:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l d1,46(sp)
    3754:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lsl.l #5,d1
    3756:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    3758:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l 46(sp),d1
    375c:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    375e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       movea.l d1,a0
    3760:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       adda.l d0,a0
    3762:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea (-1,a0,a4.w),a0
    3766:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.l a0,d1
    3768:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.l a0,d1
    376a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       lea 37186 <LookupSlope>,a0
    3770:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d3,d0
    3772:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       add.w d3,d0
    3774:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w (0,a0,d1.l),d1
    3778:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       sub.w d0,d1
    377a:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       move.w d1,58(sp)
  WORD bltdmod = direction - 2 * bltwidth;
    377e:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       suba.w d0,a6
  if( bltbmod < 0 ) {
    3780:	|  |  |  |  |  |                                   |  |        |  |  |                                                                                       tst.w d1
    3782:	|  |  |  |  |  |                                   |  \--------|--|--|-------------------------------------------------------------------------------------- bge.w 2f90 <DrawRect+0x62c>
    3786:	|  |  |  |  |  |                                   \-----------|--|--|-------------------------------------------------------------------------------------- bra.w 3040 <DrawRect+0x6dc>
    startyoffset -= (height + 1) * 64;    
    378a:	|  |  |  |  |  \-----------------------------------------------|--|--|-------------------------------------------------------------------------------------> move.w a3,d1
    378c:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.w #6,d1
    378e:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a0
    3790:	|  |  |  |  |                                                  |  |  |                                                                                       lea 64(a0),a0
    3794:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w a0,a6
    height *= -1;
    3796:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a3,d1
    3798:	|  |  |  |  |                                                  |  |  |                                                                                       neg.w d1
    379a:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d1,a3
    379c:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w #-64,a0
  UWORD targetbufferoffset = bltstart + startyoffset;
    37a0:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w d0,a5
    37a2:	|  |  |  |  |                                                  |  |  |                                                                                       adda.w a6,a5
  ULONG startbufferoffset = (startx - bltstart * 8) * 100 * 12;
    37a4:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d1
    37a6:	|  |  |  |  |                                                  |  |  |                                                                                       move.w 58(sp),d1
    37aa:	|  |  |  |  |                                                  |  |  |                                                                                       andi.l #65535,d0
    37b0:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #3,d0
    37b2:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    37b4:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d1,d0
    37b6:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    37b8:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d0
    37ba:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d1,d0
    37bc:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    37be:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    37c0:	|  |  |  |  |                                                  |  |  |                                                                                       sub.l d0,d1
    37c2:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #4,d1
    37c4:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a4
  WORD bltbmod = LookupSlope[length-1][height-1]-bltwidth*2;
    37c6:	|  |  |  |  |                                                  |  |  |                                                                                       moveq #0,d0
    37c8:	|  |  |  |  |                                                  |  |  |                                                                                       move.w a1,d0
    37ca:	|  |  |  |  |                                                  |  |  |                                                                                       subq.l #1,d0
    37cc:	|  |  |  |  |                                                  |  |  |                                                                                       move.l d0,d1
    37ce:	|  |  |  |  |                                                  |  |  |                                                                                       add.l d0,d1
    37d0:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a6
    37d2:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a6
    37d4:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    37d6:	|  |  |  |  |                                                  |  |  |                                                                                       lsl.l #5,d1
    37d8:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    37da:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a6,d1
    37dc:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    37de:	|  |  |  |  |                                                  |  |  |                                                                                       movea.l d1,a1
    37e0:	|  |  |  |  |                                                  |  |  |                                                                                       adda.l d0,a1
    37e2:	|  |  |  |  |                                                  |  |  |                                                                                       lea (-1,a1,a3.w),a1
    37e6:	|  |  |  |  |                                                  |  |  |                                                                                       move.l a1,d1
    37e8:	|  |  |  |  |                                                  |  |  |                                                                                       add.l a1,d1
    37ea:	|  |  |  |  |                                                  |  |  |                                                                                       lea 37186 <LookupSlope>,a1
    37f0:	|  |  |  |  |                                                  |  |  |                                                                                       move.w d3,d0
    37f2:	|  |  |  |  |                                                  |  |  |                                                                                       add.w d3,d0
    37f4:	|  |  |  |  |                                                  |  |  |                                                                                       movea.w (0,a1,d1.l),a6
    37f8:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a6
  WORD bltdmod = direction - 2 * bltwidth;
    37fa:	|  |  |  |  |                                                  |  |  |                                                                                       suba.w d0,a0
  if( bltbmod < 0 ) {
    37fc:	|  |  |  |  |                                                  |  |  |                                                                                       clr.w d0
    37fe:	|  |  |  |  |                                                  |  |  |                                                                                       cmp.w a6,d0
    3800:	|  |  |  |  \--------------------------------------------------|--|--|-------------------------------------------------------------------------------------- ble.w 2d58 <DrawRect+0x3f4>
    3804:	|  |  |  \-----------------------------------------------------|--|--|-------------------------------------------------------------------------------------- bra.w 2e1c <DrawRect+0x4b8>
          height *= -1;
    3808:	|  |  |                                                        |  \--|-------------------------------------------------------------------------------------> not.w d0
    380a:	|  |  |                                                        |     |                                                                                       movea.w d0,a3
          bltwidth = xlength/16+2;
    380c:	|  |  |                                                        |     |                                                                                       tst.w d3
    380e:	|  |  |                                                        |     |                                                                                /----- blt.s 383c <DrawRect+0xed8>
          bltwidth = xlength/16+2;
    3810:	|  |  |                                                        |     |                                                                                |  /-> asr.w #4,d3
    3812:	|  |  |                                                        |     |                                                                                |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    3814:	|  |  |                                                        |     |                                                                                |  |   move.w a4,d0
    3816:	|  |  |                                                        |     |                                                                          /-----|--|-- bmi.s 3826 <DrawRect+0xec2>
    3818:	|  |  |                                                        |     |                                                                          |  /--|--|-> asr.w #4,d0
    381a:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    381c:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3822:	|  |  |                                                        |     +--------------------------------------------------------------------------|--|--|--|-- bra.w 3134 <DrawRect+0x7d0>
          bltstart = (startx / 16)*2;
    3826:	|  |  |                                                        |     |                                                                          >--|--|--|-> addi.w #15,d0
    382a:	|  |  |                                                        |     |                                                                          |  |  |  |   asr.w #4,d0
    382c:	|  |  |                                                        |     |                                                                          |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    382e:	|  |  |                                                        |     |                                                                          |  |  |  |   move.w #187,64(sp)
    3834:	|  |  |                                                        |     \--------------------------------------------------------------------------|--|--|--|-- bra.w 3134 <DrawRect+0x7d0>
          bltwidth = xlength/16+2;
    3838:	|  |  |                                                        \--------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    383a:	|  |  |                                                                                                                                         |  |  |  \-- bge.s 3810 <DrawRect+0xeac>
    383c:	|  |  |                                                                                                                                         |  |  \----> addi.w #15,d3
    3840:	|  |  |                                                                                                                                         |  |         asr.w #4,d3
    3842:	|  |  |                                                                                                                                         |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    3844:	|  |  |                                                                                                                                         |  |         move.w a4,d0
    3846:	|  |  |                                                                                                                                         |  \-------- bpl.s 3818 <DrawRect+0xeb4>
    3848:	|  |  |                                                                                                                                         \----------- bra.s 3826 <DrawRect+0xec2>
          height *= -1;
    384a:	|  \--|----------------------------------------------------------------------------------------------------------------------------------------------------> not.w d0
    384c:	|     |                                                                                                                                                      movea.w d0,a3
          bltwidth = xlength/16+2;
    384e:	|     |                                                                                                                                                      tst.w d3
    3850:	|     |                                                                                                                                               /----- blt.s 387e <DrawRect+0xf1a>
          bltwidth = xlength/16+2;
    3852:	|     |                                                                                                                                               |  /-> asr.w #4,d3
    3854:	|     |                                                                                                                                               |  |   addq.w #2,d3
          bltstart = (startx / 16)*2;
    3856:	|     |                                                                                                                                               |  |   move.w a4,d0
    3858:	|     |                                                                                                                                         /-----|--|-- bmi.s 3868 <DrawRect+0xf04>
    385a:	|     |                                                                                                                                         |  /--|--|-> asr.w #4,d0
    385c:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    385e:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    3864:	|     +-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2ce2 <DrawRect+0x37e>
          bltstart = (startx / 16)*2;
    3868:	|     |                                                                                                                                         >--|--|--|-> addi.w #15,d0
    386c:	|     |                                                                                                                                         |  |  |  |   asr.w #4,d0
    386e:	|     |                                                                                                                                         |  |  |  |   add.w d0,d0
          minterm = 0xbb;
    3870:	|     |                                                                                                                                         |  |  |  |   move.w #187,64(sp)
    3876:	|     \-----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-- bra.w 2ce2 <DrawRect+0x37e>
          bltwidth = xlength/16+2;
    387a:	\-----------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|-> tst.w d3
    387c:	                                                                                                                                                |  |  |  \-- bge.s 3852 <DrawRect+0xeee>
    387e:	                                                                                                                                                |  |  \----> addi.w #15,d3
    3882:	                                                                                                                                                |  |         asr.w #4,d3
    3884:	                                                                                                                                                |  |         addq.w #2,d3
          bltstart = (startx / 16)*2;
    3886:	                                                                                                                                                |  |         move.w a4,d0
    3888:	                                                                                                                                                |  \-------- bpl.s 385a <DrawRect+0xef6>
    388a:	                                                                                                                                                \----------- bra.s 3868 <DrawRect+0xf04>

0000388c <DrawCube3d>:
{
    388c:	                                                                                                                      lea -72(sp),sp
    3890:	                                                                                                                      movem.l d2-d7/a2-a6,-(sp)
    3894:	                                                                                                                      movea.l 120(sp),a2
    3898:	                                                                                                                      move.w 126(sp),108(sp)
    389e:	                                                                                                                      move.w 130(sp),106(sp)
  custom->bltcon1 = 0x0;
    38a4:	                                                                                                                      move.w #0,dff042 <_end+0xd89d5e>
     ClearDirtyAreaPrepare( ClearBuffer->MyDirtyArea[i].BltMod);
    38ac:	                                                                                                                      move.l 75148 <ClearBuffer>,54(sp)
    38b4:	                                                                                                                      lea 74e44 <Cubes>,a3
    38ba:	                                                                                                                      moveq #0,d5
    38bc:	/-------------------------------------------------------------------------------------------------------------------> move.l d5,d2
    38be:	|                                                                                                                     add.l d5,d2
    38c0:	|                                                                                                                     move.l d2,102(sp)
    38c4:	|                                                                                                                     add.l d5,d2
    38c6:	|                                                                                                                     add.l d2,d2
    38c8:	|                                                                                                                     add.l d2,d2
    38ca:	|                                                                                                                     movea.l 54(sp),a0
    38ce:	|                                                                                                                     move.w (14,a0,d2.l),d3
  WaitBlit();
    38d2:	|                                                                                                                     movea.l 752d8 <GfxBase>,a6
    38d8:	|                                                                                                                     jsr -228(a6)
  custom->bltcon0 = 0x01f0;
    38dc:	|                                                                                                                     move.w #496,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0;
    38e4:	|                                                                                                                     move.w #0,dff042 <_end+0xd89d5e>
  custom->bltdmod = bltmod;
    38ec:	|                                                                                                                     move.w d3,dff066 <_end+0xd89d82>
    ULONG clearpos = ClearBuffer->MyDirtyArea[i].Address;
    38f2:	|                                                                                                                     move.l 75148 <ClearBuffer>,54(sp)
    38fa:	|                                                                                                                     movea.l 54(sp),a4
    38fe:	|                                                                                                                     movea.l (4,a4,d2.l),a6
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    3902:	|                                                                                                                     cmpa.w #0,a6
    3906:	|                       /-------------------------------------------------------------------------------------------- bne.w 4210 <DrawCube3d+0x984>
    390a:	|                       |                                                                                             move.l d5,d1
    390c:	|                       |                                                                                             addq.l #1,d1
    390e:	|                       |                                                                                             move.l d1,94(sp)
    WORD x0 = vectors[0];
    3912:	|                    /--|-------------------------------------------------------------------------------------------> move.w (a2),d1
    WORD y0 = vectors[1];
    3914:	|                    |  |                                                                                             move.w 2(a2),86(sp)
    WORD z0 = vectors[2];
    391a:	|                    |  |                                                                                             movea.w 4(a2),a0
    WORD x2 = vectors[6];
    391e:	|                    |  |                                                                                             move.w 12(a2),d4
    WORD y2 = vectors[7];
    3922:	|                    |  |                                                                                             move.w 14(a2),d3
    WORD z2 = vectors[8];
    3926:	|                    |  |                                                                                             movea.w 16(a2),a4
    WORD x3 = vectors[9];
    392a:	|                    |  |                                                                                             move.w 18(a2),d2
    WORD y3 = vectors[10];
    392e:	|                    |  |                                                                                             move.w 20(a2),d6
    WORD z3 = vectors[11];
    3932:	|                    |  |                                                                                             move.w 22(a2),90(sp)
    WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    3938:	|                    |  |                                                                                             movea.w a0,a1
    393a:	|                    |  |                                                                                             subq.l #1,a1
    393c:	|                    |  |                                                                                             adda.l a1,a1
    393e:	|                    |  |                                                                                             lea 3bfa6 <zMult>,a5
    3944:	|                    |  |                                                                                             move.w (0,a5,a1.l),62(sp)
    394a:	|                    |  |                                                                                             move.w 62(sp),d0
    394e:	|                    |  |                                                                                             muls.w d1,d0
    3950:	|                    |  |                                                                                             moveq #15,d7
    3952:	|                    |  |                                                                                             asr.l d7,d0
    3954:	|                    |  |                                                                                             movea.l d0,a1
    3956:	|                    |  |                                                                                             lea 160(a1),a1
    395a:	|                    |  |                                                                                             move.w a1,58(sp)
    WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    395e:	|                    |  |                                                                                             move.w 62(sp),d7
    3962:	|                    |  |                                                                                             muls.w 86(sp),d7
    3966:	|                    |  |                                                                                             moveq #15,d0
    3968:	|                    |  |                                                                                             asr.l d0,d7
    396a:	|                    |  |                                                                                             addi.w #128,d7
    396e:	|                    |  |                                                                                             move.w d7,62(sp)
    WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    3972:	|                    |  |                                                                                             movea.w 10(a2),a1
    3976:	|                    |  |                                                                                             subq.l #1,a1
    3978:	|                    |  |                                                                                             adda.l a1,a1
    397a:	|                    |  |                                                                                             move.w (0,a5,a1.l),70(sp)
    3980:	|                    |  |                                                                                             move.w 70(sp),d7
    3984:	|                    |  |                                                                                             muls.w 6(a2),d7
    3988:	|                    |  |                                                                                             asr.l d0,d7
    398a:	|                    |  |                                                                                             movea.l d7,a1
    398c:	|                    |  |                                                                                             lea 160(a1),a1
    3990:	|                    |  |                                                                                             move.w a1,66(sp)
    WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    3994:	|                    |  |                                                                                             move.w 70(sp),d7
    3998:	|                    |  |                                                                                             muls.w 8(a2),d7
    399c:	|                    |  |                                                                                             asr.l d0,d7
    399e:	|                    |  |                                                                                             addi.w #128,d7
    39a2:	|                    |  |                                                                                             move.w d7,70(sp)
    WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    39a6:	|                    |  |                                                                                             movea.w a4,a1
    39a8:	|                    |  |                                                                                             move.l a1,d7
    39aa:	|                    |  |                                                                                             subq.l #1,d7
    39ac:	|                    |  |                                                                                             add.l d7,d7
    39ae:	|                    |  |                                                                                             move.w (0,a5,d7.l),76(sp)
    39b4:	|                    |  |                                                                                             move.w 76(sp),d0
    39b8:	|                    |  |                                                                                             muls.w d4,d0
    39ba:	|                    |  |                                                                                             moveq #15,d7
    39bc:	|                    |  |                                                                                             asr.l d7,d0
    39be:	|                    |  |                                                                                             movea.l d0,a5
    39c0:	|                    |  |                                                                                             lea 160(a5),a5
    39c4:	|                    |  |                                                                                             move.w a5,72(sp)
    WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    39c8:	|                    |  |                                                                                             move.w 76(sp),d7
    39cc:	|                    |  |                                                                                             muls.w d3,d7
    39ce:	|                    |  |                                                                                             moveq #15,d0
    39d0:	|                    |  |                                                                                             asr.l d0,d7
    39d2:	|                    |  |                                                                                             addi.w #128,d7
    39d6:	|                    |  |                                                                                             move.w d7,76(sp)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    39da:	|                    |  |                                                                                             cmpa.w #0,a6
    39de:	|                    |  |  /----------------------------------------------------------------------------------------- beq.s 39ea <DrawCube3d+0x15e>
    39e0:	|                    |  |  |                                                                                          tst.w 7514c <DoNotClearDirty>
    39e6:	|                    |  |  |  /-------------------------------------------------------------------------------------- beq.w 41be <DrawCube3d+0x932>
    WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    39ea:	|                    |  |  >--|-------------------------------------------------------------------------------------> movea.w 90(sp),a5
    39ee:	|                    |  |  |  |                                                                                       move.l a5,d7
    39f0:	|                    |  |  |  |                                                                                       subq.l #1,d7
    39f2:	|                    |  |  |  |                                                                                       add.l d7,d7
    39f4:	|                    |  |  |  |                                                                                       lea 3bfa6 <zMult>,a5
    39fa:	|                    |  |  |  |                                                                                       move.w (0,a5,d7.l),84(sp)
    3a00:	|                    |  |  |  |                                                                                       move.w 84(sp),d0
    3a04:	|                    |  |  |  |                                                                                       muls.w d2,d0
    3a06:	|                    |  |  |  |                                                                                       moveq #15,d7
    3a08:	|                    |  |  |  |                                                                                       asr.l d7,d0
    3a0a:	|                    |  |  |  |                                                                                       movea.l d0,a5
    3a0c:	|                    |  |  |  |                                                                                       lea 160(a5),a5
    3a10:	|                    |  |  |  |                                                                                       move.w a5,80(sp)
    WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC; 
    3a14:	|                    |  |  |  |                                                                                       move.w 84(sp),d7
    3a18:	|                    |  |  |  |                                                                                       muls.w d6,d7
    3a1a:	|                    |  |  |  |                                                                                       moveq #15,d0
    3a1c:	|                    |  |  |  |                                                                                       asr.l d0,d7
    3a1e:	|                    |  |  |  |                                                                                       addi.w #128,d7
    3a22:	|                    |  |  |  |                                                                                       move.w d7,84(sp)
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3a26:	|                    |  |  |  |                                                                                       move.l a1,d7
    3a28:	|                    |  |  |  |                                                                                       addi.l #386,d7
    WORD vfx2 = x0 - x2;
    3a2e:	|                    |  |  |  |                                                                                       sub.w d4,d1
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3a30:	|                    |  |  |  |                                                                                       muls.w d4,d1
    WORD vfy2 = y0 - y2;
    3a32:	|                    |  |  |  |                                                                                       move.w 86(sp),d0
    3a36:	|                    |  |  |  |                                                                                       sub.w d3,d0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3a38:	|                    |  |  |  |                                                                                       muls.w d3,d0
    3a3a:	|                    |  |  |  |                                                                                       movea.l d1,a5
    3a3c:	|                    |  |  |  |                                                                                       adda.l d0,a5
    WORD vfz2 = z0 - z2; 
    3a3e:	|                    |  |  |  |                                                                                       suba.w a4,a0
    int vf2dotprod = vfx2 * x2 + vfy2 * y2 + vfz2 * (z2 + DIST);
    3a40:	|                    |  |  |  |                                                                                       move.l d7,-(sp)
    3a42:	|                    |  |  |  |                                                                                       movea.w a0,a0
    3a44:	|                    |  |  |  |                                                                                       move.l a0,-(sp)
    3a46:	|                    |  |  |  |                                                                                       jsr 5d38 <__mulsi3>
    3a4c:	|                    |  |  |  |                                                                                       addq.l #8,sp
    3a4e:	|                    |  |  |  |                                                                                       add.l a5,d0
    3a50:	|                    |  |  |  |                                                                                       move.l d0,86(sp)
    squares[2].DotProduct = vf2dotprod;
    3a54:	|                    |  |  |  |                                                                                       move.l d0,80(a3)
    int vf3dotprod = vf2dotprod * -1;
    3a58:	|                    |  |  |  |                                                                                       neg.l d0
    3a5a:	|                    |  |  |  |                                                                                       move.l d0,98(sp)
    squares[3].DotProduct = vf3dotprod;
    3a5e:	|                    |  |  |  |                                                                                       move.l d0,112(a3)
    if( clearpos != 0 && DoNotClearDirty == 0) {
    3a62:	|                    |  |  |  |                                                                                       cmpa.w #0,a6
    3a66:	|                    |  |  |  |  /----------------------------------------------------------------------------------- beq.s 3a72 <DrawCube3d+0x1e6>
    3a68:	|                    |  |  |  |  |                                                                                    tst.w 7514c <DoNotClearDirty>
    3a6e:	|                    |  |  |  |  |  /-------------------------------------------------------------------------------- beq.w 417e <DrawCube3d+0x8f2>
    clearpos = ClearBuffer->MyDirtyArea[i].AddressRev;    
    3a72:	|                    |  |  |  |  >--|-------------------------------------------------------------------------------> move.l 102(sp),d0
    3a76:	|                    |  |  |  |  |  |                                                                                 add.l d5,d0
    3a78:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    3a7a:	|                    |  |  |  |  |  |                                                                                 add.l d0,d0
    3a7c:	|                    |  |  |  |  |  |                                                                                 movea.l 54(sp),a6
    3a80:	|                    |  |  |  |  |  |                                                                                 movea.l (8,a6,d0.l),a5
    WORD vfx4 = x3 - x2;
    3a84:	|                    |  |  |  |  |  |                                                                                 sub.w d4,d2
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3a86:	|                    |  |  |  |  |  |                                                                                 muls.w d4,d2
    WORD vfy4 = y3 - y2;
    3a88:	|                    |  |  |  |  |  |                                                                                 sub.w d3,d6
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3a8a:	|                    |  |  |  |  |  |                                                                                 muls.w d3,d6
    3a8c:	|                    |  |  |  |  |  |                                                                                 add.l d6,d2
    WORD vfz4 = z3 - z2;
    3a8e:	|                    |  |  |  |  |  |                                                                                 move.w 90(sp),d0
    3a92:	|                    |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf4dotprod = vfx4 * x2 + vfy4 * y2 + vfz4 * (z2 + DIST);
    3a94:	|                    |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3a96:	|                    |  |  |  |  |  |                                                                                 movea.w d0,a0
    3a98:	|                    |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    3a9a:	|                    |  |  |  |  |  |                                                                                 jsr 5d38 <__mulsi3>
    3aa0:	|                    |  |  |  |  |  |                                                                                 addq.l #8,sp
    3aa2:	|                    |  |  |  |  |  |                                                                                 add.l d0,d2
    squares[4].DotProduct = vf4dotprod;
    3aa4:	|                    |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    int vf5dotprod = vf4dotprod * -1;
    3aa8:	|                    |  |  |  |  |  |                                                                                 move.l d2,d1
    3aaa:	|                    |  |  |  |  |  |                                                                                 neg.l d1
    3aac:	|                    |  |  |  |  |  |                                                                                 move.l d1,90(sp)
    squares[5].DotProduct = vf5dotprod;
    3ab0:	|                    |  |  |  |  |  |                                                                                 move.l d1,176(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3ab4:	|                    |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3ab8:	|  /-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3acc <DrawCube3d+0x240>
    3aba:	|  |                 |  |  |  |  |  |                                                                                 tst.w 7514c <DoNotClearDirty>
    3ac0:	|  +-----------------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3acc <DrawCube3d+0x240>
    3ac2:	|  |                 |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3ac8:	|  |  /--------------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 46ae <DrawCube3d+0xe22>
    squares[0].Vertices[0].X = xs2;
    3acc:	|  >--|--------------|--|--|--|--|--|-------------------------------------------------------------------------------> move.w 72(sp),(a3)
    squares[0].Vertices[0].Y = ys2;
    3ad0:	|  |  |              |  |  |  |  |  |                                                                                 move.w 76(sp),2(a3)
    squares[0].Vertices[1].X = xs0;
    3ad6:	|  |  |              |  |  |  |  |  |                                                                                 move.w 58(sp),4(a3)
    squares[0].Vertices[1].Y = ys0;
    3adc:	|  |  |              |  |  |  |  |  |                                                                                 move.w 62(sp),6(a3)
    squares[0].Vertices[2].X = xs1;
    3ae2:	|  |  |              |  |  |  |  |  |                                                                                 move.w 66(sp),8(a3)
    squares[0].Vertices[2].Y = ys1;
    3ae8:	|  |  |              |  |  |  |  |  |                                                                                 move.w 70(sp),10(a3)
    squares[0].Vertices[3].X = xs3;
    3aee:	|  |  |              |  |  |  |  |  |                                                                                 move.w 80(sp),12(a3)
    squares[0].Vertices[3].Y = ys3;
    3af4:	|  |  |              |  |  |  |  |  |                                                                                 move.w 84(sp),14(a3)
    WORD x6 = vectors[18];
    3afa:	|  |  |              |  |  |  |  |  |                                                                                 move.w 36(a2),d5
    WORD y6 = vectors[19];
    3afe:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 38(a2),a6
    WORD z6 = vectors[20];
    3b02:	|  |  |              |  |  |  |  |  |                                                                                 move.w 40(a2),d6
    WORD vfx0 = x6 - x2;
    3b06:	|  |  |              |  |  |  |  |  |                                                                                 move.w d5,d0
    3b08:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3b0a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d4,d0
    WORD vfy0 = y6 - y2;
    3b0c:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d1
    3b0e:	|  |  |              |  |  |  |  |  |                                                                                 sub.w d3,d1
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3b10:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d1,d3
    3b12:	|  |  |              |  |  |  |  |  |                                                                                 add.l d0,d3
    WORD vfz0 = z6 - z2; 
    3b14:	|  |  |              |  |  |  |  |  |                                                                                 move.w d6,d0
    3b16:	|  |  |              |  |  |  |  |  |                                                                                 sub.w a4,d0
    int vf0dotprod = vfx0 * x2 + vfy0 * y2 + vfz0 * (z2 + DIST);
    3b18:	|  |  |              |  |  |  |  |  |                                                                                 move.l d7,-(sp)
    3b1a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d0,a0
    3b1c:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,-(sp)
    3b1e:	|  |  |              |  |  |  |  |  |                                                                                 jsr 5d38 <__mulsi3>
    3b24:	|  |  |              |  |  |  |  |  |                                                                                 addq.l #8,sp
    3b26:	|  |  |              |  |  |  |  |  |                                                                                 add.l d3,d0
    3b28:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,50(sp)
    int vf1dotprod = vf0dotprod*-1;
    3b2c:	|  |  |              |  |  |  |  |  |                                                                                 neg.l d0
    3b2e:	|  |  |              |  |  |  |  |  |                                                                                 move.l d0,46(sp)
    WORD xs4 = ((x4 * zMult[z4 - 1]) >> 15) + XC;
    3b32:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 28(a2),a0
    3b36:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    3b38:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    3b3a:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    3b3c:	|  |  |              |  |  |  |  |  |                                                                                 lea 3bfa6 <zMult>,a4
    3b42:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    3b46:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d7
    3b48:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 24(a2),d7
    3b4c:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3b4e:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d7
    3b50:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d7
    WORD ys4 = ((y4 * zMult[z4 - 1]) >> 15) + YC;
    3b54:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 26(a2),d1
    3b58:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    3b5a:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d1,a1
    3b5c:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a1),a1
    WORD xs5 = ((x5 * zMult[z5 - 1]) >> 15) + XC;
    3b60:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 34(a2),a0
    3b64:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d1
    3b66:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d1
    3b68:	|  |  |              |  |  |  |  |  |                                                                                 add.l d1,d1
    3b6a:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d1.l),d1
    3b6e:	|  |  |              |  |  |  |  |  |                                                                                 move.w d1,d4
    3b70:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 30(a2),d4
    3b74:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d4
    3b76:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d4
    WORD ys5 = ((y5 * zMult[z5 - 1]) >> 15) + YC;
    3b7a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 32(a2),d1
    3b7e:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d1
    3b80:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d1
    WORD xs6 = ((x6 * zMult[z6 - 1]) >> 15) + XC;
    3b84:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3b86:	|  |  |              |  |  |  |  |  |                                                                                 move.l a0,d6
    3b88:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,d6
    3b8a:	|  |  |              |  |  |  |  |  |                                                                                 add.l d6,d6
    3b8c:	|  |  |              |  |  |  |  |  |                                                                                 move.w (0,a4,d6.l),d3
    3b90:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d3,d5
    3b92:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d5
    3b94:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #160,d5
    WORD ys6 = ((y6 * zMult[z6 - 1]) >> 15) + YC;
    3b98:	|  |  |              |  |  |  |  |  |                                                                                 move.w a6,d6
    3b9a:	|  |  |              |  |  |  |  |  |                                                                                 muls.w d6,d3
    3b9c:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d3
    3b9e:	|  |  |              |  |  |  |  |  |                                                                                 addi.w #128,d3
    WORD xs7 = ((x7 * zMult[z7 - 1]) >> 15) + XC;
    3ba2:	|  |  |              |  |  |  |  |  |                                                                                 movea.w 46(a2),a0
    3ba6:	|  |  |              |  |  |  |  |  |                                                                                 subq.l #1,a0
    3ba8:	|  |  |              |  |  |  |  |  |                                                                                 adda.l a0,a0
    3baa:	|  |  |              |  |  |  |  |  |                                                                                 movea.w (0,a4,a0.l),a0
    3bae:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d0
    3bb0:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 42(a2),d0
    3bb4:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d6
    3bb6:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d6,d0
    3bb8:	|  |  |              |  |  |  |  |  |                                                                                 movea.l d0,a6
    3bba:	|  |  |              |  |  |  |  |  |                                                                                 lea 160(a6),a6
    WORD ys7 = ((y7 * zMult[z7 - 1]) >> 15) + YC;
    3bbe:	|  |  |              |  |  |  |  |  |                                                                                 move.w a0,d6
    3bc0:	|  |  |              |  |  |  |  |  |                                                                                 muls.w 44(a2),d6
    3bc4:	|  |  |              |  |  |  |  |  |                                                                                 moveq #15,d0
    3bc6:	|  |  |              |  |  |  |  |  |                                                                                 asr.l d0,d6
    3bc8:	|  |  |              |  |  |  |  |  |                                                                                 movea.w d6,a0
    3bca:	|  |  |              |  |  |  |  |  |                                                                                 lea 128(a0),a0
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3bce:	|  |  |              |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3bd2:	|  |  |  /-----------|--|--|--|--|--|-------------------------------------------------------------------------------- beq.s 3be6 <DrawCube3d+0x35a>
    3bd4:	|  |  |  |           |  |  |  |  |  |                                                                                 tst.w 7514c <DoNotClearDirty>
    3bda:	|  |  |  +-----------|--|--|--|--|--|-------------------------------------------------------------------------------- bne.s 3be6 <DrawCube3d+0x35a>
    3bdc:	|  |  |  |           |  |  |  |  |  |                                                                                 cmpi.w #1,108(sp)
    3be2:	|  |  |  |        /--|--|--|--|--|--|-------------------------------------------------------------------------------- beq.w 4656 <DrawCube3d+0xdca>
    squares[0].DotProduct = vf0dotprod;
    3be6:	|  |  |  >--------|--|--|--|--|--|--|-------------------------------------------------------------------------------> move.l 50(sp),16(a3)
    squares[0].Color = 1;
    3bec:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,30(a3)
    squares[1].Vertices[0].X = xs6;
    3bf2:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,32(a3)
    squares[1].Vertices[0].Y = ys6;
    3bf6:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,34(a3)
    squares[1].Vertices[1].X = xs7;
    3bfa:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,36(a3)
    squares[1].Vertices[1].Y = ys7;
    3bfe:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,38(a3)
    squares[1].Vertices[2].X = xs5;
    3c02:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d4,40(a3)
    squares[1].Vertices[2].Y = ys5;
    3c06:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d1,42(a3)
    squares[1].Vertices[3].X = xs4;
    3c0a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d7,44(a3)
    squares[1].Vertices[3].Y = ys4;
    3c0e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a1,46(a3)
    squares[1].DotProduct = vf1dotprod;
    3c12:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 46(sp),48(a3)
    squares[1].Color = 1;
    3c18:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #1,62(a3)
    squares[2].Vertices[0].X = xs2;
    3c1e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 72(sp),64(a3)
    squares[2].Vertices[0].Y = ys2;
    3c24:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 76(sp),66(a3)
    squares[2].Vertices[1].X = xs3;
    3c2a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 80(sp),68(a3)
    squares[2].Vertices[1].Y = ys3;
    3c30:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w 84(sp),70(a3)
    squares[2].Vertices[2].X = xs7;
    3c36:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a6,72(a3)
    squares[2].Vertices[2].Y = ys7;
    3c3a:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w a0,74(a3)
    squares[2].Vertices[3].X = xs6;
    3c3e:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d5,76(a3)
    squares[2].Vertices[3].Y = ys6;
    3c42:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w d3,78(a3)
    squares[2].DotProduct = vf2dotprod;
    3c46:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.l 86(sp),80(a3)
    squares[2].Color = 2;
    3c4c:	|  |  |  |        |  |  |  |  |  |  |                                                                                 move.w #2,94(a3)
    if( clearpos != 0 && DoNotClearDirty == 0 && mirroring == 1) {
    3c52:	|  |  |  |        |  |  |  |  |  |  |                                                                                 cmpa.w #0,a5
    3c56:	|  |  |  |        |  |  |  |  |  |  |                                                                             /-- beq.s 3c6a <DrawCube3d+0x3de>
    3c58:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   tst.w 7514c <DoNotClearDirty>
    3c5e:	|  |  |  |        |  |  |  |  |  |  |                                                                             +-- bne.s 3c6a <DrawCube3d+0x3de>
    3c60:	|  |  |  |        |  |  |  |  |  |  |                                                                             |   cmpi.w #1,108(sp)
    3c66:	|  |  |  |     /--|--|--|--|--|--|--|-----------------------------------------------------------------------------|-- beq.w 46ee <DrawCube3d+0xe62>
    squares[3].Vertices[0].X = xs0;
    3c6a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                             \-> move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    3c70:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    3c76:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    3c7a:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    3c7e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    3c82:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    3c86:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    3c8c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    3c92:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 98(sp),112(a3)
    squares[3].Color = 2;
    3c98:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    3c9e:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    3ca2:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    3ca6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    3caa:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    3cae:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    3cb4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    3cba:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    3cc0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    3cc6:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l d2,144(a3)
    squares[4].Color = 3;
    3cca:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    3cd0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    3cd4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    3cd8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    3cde:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    3ce4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    3cea:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    3cf0:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    3cf4:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    3cf8:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    3cfe:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.w #3,190(a3)
    vectors += 8*3;  
    3d04:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    3d08:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 move.l 94(sp),d5
    3d0c:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 lea 192(a3),a3
    3d10:	|  |  |  |     |  |  |  |  |  |  |  |                                                                                 cmp.w 106(sp),d5
    3d14:	+--|--|--|-----|--|--|--|--|--|--|--|-------------------------------------------------------------------------------- bcs.w 38bc <DrawCube3d+0x30>
    3d18:	|  |  |  |  /--|--|--|--|--|--|--|--|-------------------------------------------------------------------------------> lea 74f04 <Cubes+0xc0>,a6
    3d1e:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.l 86(sp)
  for(UWORD i3=0;i3<cubecount;i3++) 
    3d22:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 94(sp)
  WORD maxytotal = 0;
    3d26:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 clr.w 98(sp)
  WORD minytotal = 256;
    3d2a:	|  |  |  |  |  |  |  |  |  |  |  |  |                                                                                 move.w #256,102(sp)
    struct Square *squares = cube->Squares;
    3d30:	|  |  |  |  |  |  |  |  |  |  |  |  |           /-------------------------------------------------------------------> lea -192(a6),a5
    3d34:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a5,90(sp)
    WORD maxxcube = 0;
    3d38:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w 84(sp)
    WORD maxycube = 0;
    3d3c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     suba.l a4,a4
    WORD maxheightcube = 0;
    3d3e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d1
    WORD maxlengthcube = 0;
    3d40:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     clr.w d0
    WORD minxcube = 320;
    3d42:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #320,66(sp)
    WORD minycube = 256;
    3d48:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w #256,58(sp)
    3d4e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.w a4,70(sp)
    3d52:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                                                     move.l a6,62(sp)
      if( squares[i].DotProduct > 0) {
    3d56:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   /-------------------------------> tst.l 16(a5)
    3d5a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          /----- bgt.w 3ebc <DrawCube3d+0x630>
    for(int i=0; i <= 5; i++)
    3d5e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      lea 32(a5),a5
    3d62:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                          |      cmpa.l 62(sp),a5
    3d66:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   +--------------------------|----- bne.s 3d56 <DrawCube3d+0x4ca>
    if(i3 == *CubeNrReversePtr) {
    3d68:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 /--------|----> movea.w 70(sp),a4
    3d6c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 62(sp),a6
    3d70:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      movea.l 75150 <CubeNrReversePtr>,a0
    3d76:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      move.w 94(sp),d5
    3d7a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                                   |                 |        |      cmp.w (a0),d5
    3d7c:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 /-----------------|-----------------|--------|----- beq.w 40a0 <DrawCube3d+0x814>
    WORD bltwidth = (maxlengthcube/16)+2;
    3d80:	|  |  |  |  |  |  |  |  |  |  |  |  |           |                 |                 |                 |        |      tst.w d0
    3d82:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  /--------------|-----------------|-----------------|--------|----- blt.w 4006 <DrawCube3d+0x77a>
    3d86:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  /-----------|-----------------|-----------------|--------|----> asr.w #4,d0
    3d88:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      addq.w #2,d0
    if(minycube < 0) {      
    3d8a:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |        |      tst.w 58(sp)
    3d8e:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  /-----|----- blt.w 4016 <DrawCube3d+0x78a>
    }else if(minycube > 256) {
    3d92:	|  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |           |                 |                 |  |  /--|----> cmpi.w #256,58(sp)
    3d98:	|  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|-----------|-----------------|-----------------|--|--|--|----- ble.w 4272 <DrawCube3d+0x9e6>
    if(maxycube > maxytotal) maxytotal = maxycube;
    3d9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      cmpi.w #255,98(sp)
    3da2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  /-- bgt.s 3daa <DrawCube3d+0x51e>
    3da4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  |   move.w #256,98(sp)
    3daa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |  \-> move.w #128,d3
    3dae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.w d0,a3
    3db0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |                 |  |  |  |      movea.l 75154 <DrawBuffer>,a2
      DrawBuffer->MyDirtyArea[i3].Address = 0;
    3db6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     /-----------|--|--|--|----> movea.l 86(sp),a0
    3dba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3dbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      move.l 86(sp),d1
    3dc0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l a0,d1
    3dc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3dc4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3dc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      lea (0,a2,d1.l),a1
    3dca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 4(a1)
      DrawBuffer->MyDirtyArea[i3].AddressRev = 0;
    3dce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |           |                 |     |           |  |  |  |      clr.l 8(a1)
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    3dd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  /-----|--|--|-----------|-----------------|-----|-----------|--|--|--|----> move.l 86(sp),d2
    3dd6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      addq.l #1,d2
    3dd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.l d2,d1
    3dda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3ddc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d2,d1
    3dde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3de0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.l d1,d1
    3de2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d3
    3de4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d3,(0,a2,d1.l)
    DrawBuffer->MyDirtyArea[i3].BltMod = 64 - bltwidth*2;
    3de8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l 86(sp),a0
    3dec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3dee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      adda.l a0,a0
    3df0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      moveq #32,d0
    3df2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      sub.l a3,d0
    3df4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      add.w d0,d0
    3df6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      move.w d0,(14,a2,a0.l)
      if( squares[i].DotProduct > 0) { 
    3dfa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |           |                 |     |           |  |  |  |      tst.l -176(a6)
    3dfe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  /--------|-----------------|-----|-----------|--|--|--|----- ble.s 3e10 <DrawCube3d+0x584>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e00:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      tst.w -166(a6)
    3e04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  +--------|-----------------|-----|-----------|--|--|--|----- ble.s 3e10 <DrawCube3d+0x584>
    3e06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |        |                 |     |           |  |  |  |      cmpi.w #1,-164(a6)
    3e0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |     /--|-----------------|-----|-----------|--|--|--|----- bgt.w 4132 <DrawCube3d+0x8a6>
      if( squares[i].DotProduct > 0) { 
    3e10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  >-----|--|-----------------|-----|-----------|--|--|--|----> tst.l -144(a6)
    3e14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  /--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3e26 <DrawCube3d+0x59a>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e16:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      tst.w -134(a6)
    3e1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  +--|--|-----------------|-----|-----------|--|--|--|----- ble.s 3e26 <DrawCube3d+0x59a>
    3e1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |                 |     |           |  |  |  |      cmpi.w #1,-132(a6)
    3e22:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  /--------------|-----|-----------|--|--|--|----- bgt.w 4140 <DrawCube3d+0x8b4>
      if( squares[i].DotProduct > 0) { 
    3e26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  >--|--|--|--------------|-----|-----------|--|--|--|----> tst.l -112(a6)
    3e2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  /-----------|-----|-----------|--|--|--|----- ble.s 3e3c <DrawCube3d+0x5b0>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      tst.w -102(a6)
    3e30:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  +-----------|-----|-----------|--|--|--|----- ble.s 3e3c <DrawCube3d+0x5b0>
    3e32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |           |     |           |  |  |  |      cmpi.w #1,-100(a6)
    3e38:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |        /--|-----|-----------|--|--|--|----- bgt.w 40e2 <DrawCube3d+0x856>
      if( squares[i].DotProduct > 0) { 
    3e3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  >--------|--|-----|-----------|--|--|--|----> tst.l -80(a6)
    3e40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  /-----|--|-----|-----------|--|--|--|----- ble.s 3e52 <DrawCube3d+0x5c6>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      tst.w -70(a6)
    3e46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  +-----|--|-----|-----------|--|--|--|----- ble.s 3e52 <DrawCube3d+0x5c6>
    3e48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |     |           |  |  |  |      cmpi.w #1,-68(a6)
    3e4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |     |  |  /--|-----------|--|--|--|----- bgt.w 40f0 <DrawCube3d+0x864>
      if( squares[i].DotProduct > 0) { 
    3e52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  >-----|--|--|--|-----------|--|--|--|----> tst.l -48(a6)
    3e56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  /--|--|--|--|-----------|--|--|--|----- ble.s 3e68 <DrawCube3d+0x5dc>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      tst.w -38(a6)
    3e5c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  +--|--|--|--|-----------|--|--|--|----- ble.s 3e68 <DrawCube3d+0x5dc>
    3e5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |  |      cmpi.w #1,-36(a6)
    3e64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--------|--|--|--|----- bgt.w 40fe <DrawCube3d+0x872>
      if( squares[i].DotProduct > 0) { 
    3e68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--------|--|--|--|----> tst.l -16(a6)
    3e6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  /-- ble.s 3e7e <DrawCube3d+0x5f2>
        if( squares[i].XLength > 0 && squares[i].Height > 1) {
    3e6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   tst.w -6(a6)
    3e72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  +-- ble.s 3e7e <DrawCube3d+0x5f2>
    3e74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |  |  |   cmpi.w #1,-4(a6)
    3e7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /--|--|--|--|--|-- bgt.w 410c <DrawCube3d+0x880>
  for(UWORD i3=0;i3<cubecount;i3++) 
    3e7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \-> addq.w #1,94(sp)
    3e82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.l d2,86(sp)
    3e86:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      lea 192(a6),a6
    3e8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      move.w 94(sp),d7
    3e8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |      cmp.w 106(sp),d7
    3e92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     +--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|----- bne.w 3d30 <DrawCube3d+0x4a4>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    3e96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|----> movea.l 75154 <DrawBuffer>,a2
  if( mirroring == 1) {
    3e9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      cmpi.w #1,108(sp)
    3ea2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  /--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|----- beq.w 42d4 <DrawCube3d+0xa48>
  DrawBuffer->minytotal = minytotal;
    3ea6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    3eac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      move.w 98(sp),52(a2)
}
    3eb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      movem.l (sp)+,d2-d7/a2-a6
    3eb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      lea 72(sp),sp
    3eba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |      rts
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3ebc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \----> move.w 4(a5),d0
    3ec0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d0,a6
    3ec2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a6,72(sp)
    3ec6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w (a5),d4
    3ec8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d4,a1
    3eca:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 6(a5),54(sp)
    3ed0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 54(sp),a4
    3ed4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 2(a5),d7
    3ed8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d7,a3
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3eda:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 8(a5),d3
    3ede:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d3,a0
    3ee0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a0,76(sp)
    3ee4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 10(a5),d6
    3ee8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d6,a2
    3eea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,50(sp)
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3eee:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 12(a5),d2
    3ef2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d2,a0
    3ef4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w 14(a5),a6
    3ef8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a6,a2
    3efa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a2,80(sp)
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3efe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 72(sp),d1
    3f02:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l a1,d1
    3f04:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l a4,d5
    3f06:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         add.l a3,d5
          + (squares[i].Vertices[2].X - squares[i].Vertices[1].X) * (squares[i].Vertices[2].Y + squares[i].Vertices[1].Y)
    3f08:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
    3f0a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w d5,a2
    3f0c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.l 76(sp),d1
    3f10:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.l 72(sp),d1
    3f14:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 50(sp),a4
    3f18:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a4,d5
    3f1a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d5,d1
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3f1c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d1,a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3f1e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l a0,a1
    3f20:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a3
    3f24:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d5
    3f26:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a3,d1
    3f28:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3f2a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.w a2,a1
    3f2c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
          + (squares[i].Vertices[3].X - squares[i].Vertices[2].X) * (squares[i].Vertices[3].Y + squares[i].Vertices[2].Y)
    3f2e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         suba.l 76(sp),a0
    3f32:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         movea.l 50(sp),a2
    3f36:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.l 80(sp),a2
          + (squares[i].Vertices[0].X - squares[i].Vertices[3].X) * (squares[i].Vertices[0].Y + squares[i].Vertices[3].Y);
    3f3a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a0,d5
    3f3c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a2,d1
    3f3e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         muls.w d1,d5
        UWORD cw = (squares[i].Vertices[1].X - squares[i].Vertices[0].X) * (squares[i].Vertices[1].Y + squares[i].Vertices[0].Y) 
    3f40:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         adda.w d5,a1
    3f42:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,20(a5)
          if( xposmin > squares[i].Vertices[i2].X) xposmin = squares[i].Vertices[i2].X;
    3f46:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d1
    3f48:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w d0,d4
    3f4a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f4e <DrawCube3d+0x6c2>
    3f4c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d1
    3f4e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d3
    3f50:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f54 <DrawCube3d+0x6c8>
    3f52:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d1
    3f54:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d1,d2
    3f56:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f5a <DrawCube3d+0x6ce>
    3f58:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d1
          if( yposmin > squares[i].Vertices[i2].Y) yposmin = squares[i].Vertices[i2].Y;                    
    3f5a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a0
    3f5e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d7
    3f60:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f64 <DrawCube3d+0x6d8>
    3f62:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a0
    3f64:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a0,d6
    3f66:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f6a <DrawCube3d+0x6de>
    3f68:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a0
    3f6a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d5
    3f6c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d5
    3f6e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3f72 <DrawCube3d+0x6e6>
    3f70:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a0
          if( xposmax < squares[i].Vertices[i2].X) xposmax = squares[i].Vertices[i2].X;
    3f72:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d4
    3f74:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f78 <DrawCube3d+0x6ec>
    3f76:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d4,d0
    3f78:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d3
    3f7a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f7e <DrawCube3d+0x6f2>
    3f7c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d3,d0
    3f7e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w d0,d2
    3f80:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f84 <DrawCube3d+0x6f8>
    3f82:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d2,d0
          if( yposmax < squares[i].Vertices[i2].Y) yposmax = squares[i].Vertices[i2].Y;
    3f84:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> movea.w 54(sp),a1
    3f88:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d7
    3f8a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f8e <DrawCube3d+0x702>
    3f8c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d7,a1
    3f8e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w a1,d6
    3f90:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f94 <DrawCube3d+0x708>
    3f92:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w d6,a1
    3f94:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a6,d6
    3f96:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d6
    3f98:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3f9c <DrawCube3d+0x710>
    3f9a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   movea.w a6,a1
        squares[i].YPosMin = yposmin;
    3f9c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w a0,24(a5)
        squares[i].XPosMin = xposmin;
    3fa0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d1,22(a5)
        squares[i].XLength = xposmax - xposmin;                
    3fa4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d0,d7
    3fa6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w d1,d7
    3fa8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d7,26(a5)
        squares[i].Height = yposmax - yposmin + 1;    
    3fac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w a1,d2
    3fae:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d2
    3fb0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w a0,d2
    3fb2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w d2,28(a5)
        if(yposmin < minycube) minycube = yposmin;
    3fb6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 58(sp),d2
    3fba:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a0,d2
    3fbc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3fc2 <DrawCube3d+0x736>
    3fbe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a0,58(sp)
        if(xposmin < minxcube) minxcube = xposmin;
    3fc2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 66(sp),d1
    3fc6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3fcc <DrawCube3d+0x740>
    3fc8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d1,66(sp)
        if(yposmax > maxycube) maxycube = yposmax;
    3fcc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 70(sp),d3
    3fd0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmp.w a1,d3
    3fd2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- bge.s 3fd8 <DrawCube3d+0x74c>
    3fd4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w a1,70(sp)
        if(xposmax > maxxcube) maxxcube = xposmax;
    3fd8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> cmp.w 84(sp),d0
    3fdc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     /-- ble.s 3fe2 <DrawCube3d+0x756>
    3fde:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |   move.w d0,84(sp)
        maxlengthcube = maxxcube - minxcube + 1;
    3fe2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     \-> move.w 84(sp),d0
    3fe6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d0
    3fe8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 66(sp),d0
        maxheightcube = maxycube - minycube + 1;
    3fec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         move.w 70(sp),d1
    3ff0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         addq.w #1,d1
    3ff2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         sub.w 58(sp),d1
    for(int i=0; i <= 5; i++)
    3ff6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         lea 32(a5),a5
    3ffa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |         cmpa.l 62(sp),a5
    3ffe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|--|--|--|-------- bne.w 3d56 <DrawCube3d+0x4ca>
    4002:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  \--|--|-------- bra.w 3d68 <DrawCube3d+0x4dc>
    WORD bltwidth = (maxlengthcube/16)+2;
    4006:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  >--|--|--|--|--|--|--|--|--|--|-----|--|--|--|--|-----|--|-------> addi.w #15,d0
    400a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         asr.w #4,d0
    400c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         addq.w #2,d0
    if(minycube < 0) {      
    400e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  |         tst.w 58(sp)
    4012:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |  \-------- bge.w 3d92 <DrawCube3d+0x506>
      if(maxycube < 0) {
    4016:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     \----------> move.w a4,d1
    4018:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  clr.w d2
    401a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |                  cmp.w a4,d2
    401c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     /----------- bgt.w 4268 <DrawCube3d+0x9dc>
      minycube = 0;
    4020:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |            clr.w 58(sp)
    if(minycube < minytotal) minytotal = minycube;
    4024:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  /--|----------> move.w 58(sp),d5
    4028:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w 102(sp),d5
    402c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 4032 <DrawCube3d+0x7a6>
    402e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w d5,102(sp)
    if(maxycube > maxytotal) maxytotal = maxycube;
    4032:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> move.w 98(sp),d6
    4036:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmp.w a4,d6
    4038:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        /-- bge.s 403e <DrawCube3d+0x7b2>
    403a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        |   move.w a4,98(sp)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    403e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |        \-> movea.w d0,a3
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    4040:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            movea.l 75154 <DrawBuffer>,a2
    DrawBuffer->MyDirtyArea[i3].BltSize = (maxheightcube+2)*64+bltwidth;
    4046:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            move.w d1,d3
    4048:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            lsl.w #6,d3
    404a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            addi.w #128,d3
    if(maxheightcube > 1) {
    404e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |  |  |            cmpi.w #1,d1
    4052:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  \--|--|--|--|--|----------- ble.w 3db6 <DrawCube3d+0x52a>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    4056:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            movea.l (a2),a1
    4058:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |            move.w 66(sp),d1
    405c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  /-------- bmi.w 4224 <DrawCube3d+0x998>
    4060:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         asr.w #4,d1
    4062:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d1
    4064:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d1
    4066:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.w 58(sp),d2
    406a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         subq.w #1,d2
    406c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         ext.l d2
    406e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lsl.l #6,d2
    4070:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         movea.l 86(sp),a0
    4074:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         adda.l a0,a0
    4076:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l 86(sp),d4
    407a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a0,d4
    407c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    407e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d4,d4
    4080:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a1,d5
    4082:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d1,d5
    4084:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l d2,d5
    4086:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    408a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         lea 40(a1),a1
    408e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    4090:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l a3,d1
    4092:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a3,d1
    4094:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         suba.l d1,a1
    4096:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         add.l a1,d2
    4098:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |     |  |  |  |  |  |         move.l d2,(8,a2,d4.l)
    409c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  +--|--|--|--|--|--|--|--|--|--|--|--|--|-----|-----|--|--|--|--|--|-------- bra.w 3dd2 <DrawCube3d+0x546>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    40a0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--|--|-----|-----|--|--|--|--|--|-------> movea.w #160,a0
    40a4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         suba.w 66(sp),a0
    40a8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |         cmpa.w #0,a0
    40ac:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     /-- blt.w 414e <DrawCube3d+0x8c2>
    40b0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.l a0,d2
    40b2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   asr.l #4,d2
    40b4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d2,d6
    40b6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   addq.w #1,d6
    40b8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    40bc:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.w #4,d2
    40be:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   movea.w 66(sp),a0
    40c2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lea -144(a0),a0
    40c6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   add.w a0,d2
      bltfmask = 0xffff << rshift;
    40c8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   andi.l #65535,d2
    40ce:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   moveq #0,d7
    40d0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   not.w d7
    40d2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   lsl.l d2,d7
    40d4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |     |   move.w d7,114(sp)
    WORD bltwidth = (maxlengthcube/16)+2;
    40d8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |     |  |  |  |  |     |     |  |  |  |  |  |  /--|-> tst.w d0
    40da:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bge.w 3d86 <DrawCube3d+0x4fa>
    40de:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \-----|--|--|-----|--|--|--|--|-----|-----|--|--|--|--|--|--|--|-- bra.w 4006 <DrawCube3d+0x77a>
          DrawRect( &squares[i]);                  
    40e2:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |  \-----|-----|--|--|--|--|--|--|--|-> pea -128(a6)
    40e6:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    40ea:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  |  |  |        |     |  |  |  |  |  |  |  |   addq.l #4,sp
    40ec:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |  \--|--|--------|-----|--|--|--|--|--|--|--|-- bra.w 3e3c <DrawCube3d+0x5b0>
    40f0:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |        \-----|--|--|--|--|--|--|--|-> pea -96(a6)
    40f4:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    40f8:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     |  |              |  |  |  |  |  |  |  |   addq.l #4,sp
    40fa:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |     \--|--------------|--|--|--|--|--|--|--|-- bra.w 3e52 <DrawCube3d+0x5c6>
    40fe:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |              \--|--|--|--|--|--|--|-> pea -64(a6)
    4102:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    4106:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        |                 |  |  |  |  |  |  |   addq.l #4,sp
    4108:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |        \-----------------|--|--|--|--|--|--|-- bra.w 3e68 <DrawCube3d+0x5dc>
    410c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |  \--|--|--|--|--|-> pea -32(a6)
    4110:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    4114:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.l #4,sp
  for(UWORD i3=0;i3<cubecount;i3++) 
    4116:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   addq.w #1,94(sp)
    411a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.l d2,86(sp)
    411e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   lea 192(a6),a6
    4122:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   move.w 94(sp),d7
    4126:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        |  |  |     |                          |     |  |  |  |  |   cmp.w 106(sp),d7
    412a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  \--------|--|--|-----|--------------------------|-----|--|--|--|--|-- bne.w 3d30 <DrawCube3d+0x4a4>
    412e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  |     |                          \-----|--|--|--|--|-- bra.w 3e96 <DrawCube3d+0x60a>
          DrawRect( &squares[i]);                  
    4132:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |  \-----|--------------------------------|--|--|--|--|-> move.l 90(sp),-(sp)
    4136:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    413a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           |  |        |                                |  |  |  |  |   addq.l #4,sp
    413c:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |           \--|--------|--------------------------------|--|--|--|--|-- bra.w 3e10 <DrawCube3d+0x584>
    4140:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |        \--------------------------------|--|--|--|--|-> pea -160(a6)
    4144:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   jsr 2964 <DrawRect>(pc)
    4148:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              |                                         |  |  |  |  |   addq.l #4,sp
    414a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |              \-----------------------------------------|--|--|--|--|-- bra.w 3e26 <DrawCube3d+0x59a>
      bltsizereverse = (160 - minxcube) / 16 + 1;
    414e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |  \-> lea 15(a0),a0
    4152:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.l a0,d2
    4154:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      asr.l #4,d2
    4156:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d2,d6
    4158:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      addq.w #1,d6
    415a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d6,110(sp)
      UWORD rshift = 16 - ((160 - minxcube) - (bltsizereverse - 1) * 16);
    415e:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.w #4,d2
    4160:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      movea.w 66(sp),a0
    4164:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lea -144(a0),a0
    4168:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      add.w a0,d2
      bltfmask = 0xffff << rshift;
    416a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      andi.l #65535,d2
    4170:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      moveq #0,d7
    4172:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      not.w d7
    4174:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      lsl.l d2,d7
    4176:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  |      move.w d7,114(sp)
    417a:	|  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |                                                        |  |  |  \----- bra.w 40d8 <DrawCube3d+0x84c>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    417e:	|  |  |  |  |  |  |  |  |  |  |  |  \--|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d0
    4182:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    4184:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l 94(sp),d0
    4188:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    418a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         add.l d0,d0
    418c:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         movea.l 54(sp),a0
    4190:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w (0,a0,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4194:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w dff002 <_end+0xd89d1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    419a:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd89d1e>,d0
    41a0:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     |   btst #14,d0
    41a4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |     \-- bne.s 419a <DrawCube3d+0x90e>
    custom->bltdpt =(ULONG *)target;
    41a6:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    41ac:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    41b4:	|  |  |  |  |  |  |  |  |  |  |  |     |  |  |                                                        |  |  |         move.w d1,dff058 <_end+0xd89d74>
}
    41ba:	|  |  |  |  |  |  |  |  |  |  |  \-----|--|--|--------------------------------------------------------|--|--|-------- bra.w 3a72 <DrawCube3d+0x1e6>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    41be:	|  |  |  |  |  |  |  |  |  |  \--------|--|--|--------------------------------------------------------|--|--|-------> move.l 94(sp),d7
    41c2:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    41c4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l 94(sp),d7
    41c8:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    41ca:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         add.l d7,d7
    41cc:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.l 54(sp),a5
    41d0:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w (0,a5,d7.l),80(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    41d6:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w dff002 <_end+0xd89d1e>,d7
    41dc:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         movea.w 80(sp),a5
    41e0:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w 86(sp),d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    41e4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     /-> move.w dff002 <_end+0xd89d1e>,d7
    41ea:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     |   btst #14,d7
    41ee:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |     \-- bne.s 41e4 <DrawCube3d+0x958>
    custom->bltdpt =(ULONG *)target;
    41f0:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w d0,86(sp)
    41f4:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.l a6,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    41fa:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    4202:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         move.w a5,dff058 <_end+0xd89d74>
      clearpos += 64*BPLHEIGHT;
    4208:	|  |  |  |  |  |  |  |  |  |           |  |  |                                                        |  |  |         lea 16384(a6),a6
    420c:	|  |  |  |  |  |  |  |  |  \-----------|--|--|--------------------------------------------------------|--|--|-------- bra.w 39ea <DrawCube3d+0x15e>
    if( clearpos != 0 && DoNotClearDirty == 0) {      
    4210:	|  |  |  |  |  |  |  |  \--------------|--|--|--------------------------------------------------------|--|--|-------> tst.w 7514c <DoNotClearDirty>
    4216:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  /----- beq.s 4290 <DrawCube3d+0xa04>
    4218:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d5,d2
    421a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      addq.l #1,d2
    421c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  |  |      move.l d2,94(sp)
    4220:	|  |  |  |  |  |  |  +-----------------|--|--|--------------------------------------------------------|--|--|--|----- bra.w 3912 <DrawCube3d+0x86>
      DrawBuffer->MyDirtyArea[i3].Address = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1)+(minxcube/16)*2;
    4224:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |  \--|----> addi.w #15,d1
    4228:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      asr.w #4,d1
    422a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d1
    422c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d1
    422e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.w 58(sp),d2
    4232:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      subq.w #1,d2
    4234:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      ext.l d2
    4236:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lsl.l #6,d2
    4238:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      movea.l 86(sp),a0
    423c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      adda.l a0,a0
    423e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l 86(sp),d4
    4242:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a0,d4
    4244:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    4246:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d4,d4
    4248:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a1,d5
    424a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d1,d5
    424c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l d2,d5
    424e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d5,(4,a2,d4.l)
      DrawBuffer->MyDirtyArea[i3].AddressRev = (ULONG) DrawBuffer->BitPlane + 64*(minycube-1) + 40 - (minxcube/16)*2-bltwidth*2;
    4252:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      lea 40(a1),a1
    4256:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    4258:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l a3,d1
    425a:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a3,d1
    425c:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      suba.l d1,a1
    425e:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      add.l a1,d2
    4260:	|  |  |  |  |  |  |  |                 |  |  |                                                        |  |     |      move.l d2,(8,a2,d4.l)
    4264:	|  |  |  |  |  |  |  |                 |  \--|--------------------------------------------------------|--|-----|----- bra.w 3dd2 <DrawCube3d+0x546>
      if(maxycube < 0) {
    4268:	|  |  |  |  |  |  |  |                 |     |                                                        |  \-----|----> clr.w d1
      minycube = 0;
    426a:	|  |  |  |  |  |  |  |                 |     |                                                        |        |      clr.w 58(sp)
    426e:	|  |  |  |  |  |  |  |                 |     |                                                        +--------|----- bra.w 4024 <DrawCube3d+0x798>
    } else if(maxycube > 256) {
    4272:	|  |  |  |  |  |  |  |                 \-----|--------------------------------------------------------|--------|----> move.w #256,d3
    4276:	|  |  |  |  |  |  |  |                       |                                                        |        |      cmp.w a4,d3
    4278:	|  |  |  |  |  |  |  |                       |                                                        |        |  /-- blt.s 4280 <DrawCube3d+0x9f4>
    maxheightcube+=1;
    427a:	|  |  |  |  |  |  |  |                       |                                                        |        |  |   addq.w #1,d1
    427c:	|  |  |  |  |  |  |  |                       |                                                        +--------|--|-- bra.w 4024 <DrawCube3d+0x798>
      maxheightcube = 256 - 1 - minycube;
    4280:	|  |  |  |  |  |  |  |                       |                                                        |        |  \-> move.w #255,d1
    4284:	|  |  |  |  |  |  |  |                       |                                                        |        |      sub.w 58(sp),d1
      maxycube = 256;
    4288:	|  |  |  |  |  |  |  |                       |                                                        |        |      movea.w #256,a4
    428c:	|  |  |  |  |  |  |  |                       |                                                        \--------|----- bra.w 4024 <DrawCube3d+0x798>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4290:	|  |  |  |  |  |  |  |                       |                                                                 \----> move.l d5,d3
    4292:	|  |  |  |  |  |  |  |                       |                                                                        addq.l #1,d3
    4294:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,94(sp)
    4298:	|  |  |  |  |  |  |  |                       |                                                                        move.l d3,d0
    429a:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    429c:	|  |  |  |  |  |  |  |                       |                                                                        add.l d3,d0
    429e:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    42a0:	|  |  |  |  |  |  |  |                       |                                                                        add.l d0,d0
    42a2:	|  |  |  |  |  |  |  |                       |                                                                        move.w (0,a4,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42a6:	|  |  |  |  |  |  |  |                       |                                                                        move.w dff002 <_end+0xd89d1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    42ac:	|  |  |  |  |  |  |  |                       |                                                                    /-> move.w dff002 <_end+0xd89d1e>,d0
    42b2:	|  |  |  |  |  |  |  |                       |                                                                    |   btst #14,d0
    42b6:	|  |  |  |  |  |  |  |                       |                                                                    \-- bne.s 42ac <DrawCube3d+0xa20>
    custom->bltdpt =(ULONG *)target;
    42b8:	|  |  |  |  |  |  |  |                       |                                                                        move.l a6,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    42be:	|  |  |  |  |  |  |  |                       |                                                                        move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    42c6:	|  |  |  |  |  |  |  |                       |                                                                        move.w d1,dff058 <_end+0xd89d74>
      clearpos += 64*BPLHEIGHT;
    42cc:	|  |  |  |  |  |  |  |                       |                                                                        lea 16384(a6),a6
    42d0:	|  |  |  |  |  |  |  \-----------------------|----------------------------------------------------------------------- bra.w 3912 <DrawCube3d+0x86>
    Utils_CopyBlitReverse( maxytotal - minytotal + 1, bltsizereverse, DrawBuffer->BitPlane+minytotal*64, (UBYTE *) PrepareBuffer, DrawBuffer->BitPlane+20+minytotal*64, bltfmask);
    42d4:	|  |  |  |  |  |  |                          \----------------------------------------------------------------------> move.l (a2),54(sp)
    42d8:	|  |  |  |  |  |  |                                                                                                   movea.w 102(sp),a3
    42dc:	|  |  |  |  |  |  |                                                                                                   move.l a3,d0
    42de:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    42e0:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    42e2:	|  |  |  |  |  |  |                                                                                                   lea 20(a3),a0
    42e6:	|  |  |  |  |  |  |                                                                                                   move.l a0,58(sp)
    42ea:	|  |  |  |  |  |  |                                                                                                   movea.l 752c2 <PrepareBuffer>,a6
    42f0:	|  |  |  |  |  |  |                                                                                                   adda.l 54(sp),a3
    42f4:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),d5
    42f8:	|  |  |  |  |  |  |                                                                                                   addq.w #1,d5
    42fa:	|  |  |  |  |  |  |                                                                                                   sub.w 102(sp),d5
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    42fe:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    4304:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    430a:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    430e:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4304 <DrawCube3d+0xa78>
  custom->bltafwm = 0xffff; //Show All
    4310:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd89d60>
  custom->bltalwm = 0xffff; //Show All
    4318:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff046 <_end+0xd89d62>
  custom->bltcdat = 0x00ff; //Select Channel B for 1st Byte and channel A for 2nd Byte  
    4320:	|  |  |  |  |  |  |                                                                                                   move.w #255,dff070 <_end+0xd89d8c>
  custom->bltamod = 60;
    4328:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff064 <_end+0xd89d80>
  custom->bltbmod = 60;
    4330:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff062 <_end+0xd89d7e>
  custom->bltdmod = 60;    
    4338:	|  |  |  |  |  |  |                                                                                                   move.w #60,dff066 <_end+0xd89d82>
  custom->bltcon0 = 0x8dd8; //Channels A,B,D / Shift Channel A 8 bit to Right for ByteSwap    
    4340:	|  |  |  |  |  |  |                                                                                                   move.w #-29224,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x8002; //Ascending
    4348:	|  |  |  |  |  |  |                                                                                                   move.w #-32766,dff042 <_end+0xd89d5e>
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    4350:	|  |  |  |  |  |  |                                                                                                   moveq #0,d4
    4352:	|  |  |  |  |  |  |                                                                                                   move.w d5,d4
    4354:	|  |  |  |  |  |  |                                                                                                   move.l d4,d0
    4356:	|  |  |  |  |  |  |                                                                                                   subq.l #1,d0
    4358:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d0
    435a:	|  |  |  |  |  |  |                                                                                                   move.l d0,66(sp)
      custom->bltsize = 2 + height * 64;
    435e:	|  |  |  |  |  |  |                                                                                                   lsl.w #6,d5
    4360:	|  |  |  |  |  |  |                                                                                                   move.w d5,d3
    4362:	|  |  |  |  |  |  |                                                                                                   addq.w #2,d3
    for(int i=0;i<length; i++) 
    4364:	|  |  |  |  |  |  |                                                                                                   moveq #0,d7
    4366:	|  |  |  |  |  |  |                                                                                                   move.w 110(sp),d7
    436a:	|  |  |  |  |  |  |                                                                                                   lsl.l #6,d4
    436c:	|  |  |  |  |  |  |                                                                                                   moveq #2,d6
    436e:	|  |  |  |  |  |  |                                                                                                   lea -44(a3),a5
    4372:	|  |  |  |  |  |  |                                                                                                   lea -46(a3),a3
    4376:	|  |  |  |  |  |  |                                                                                                   lea -62(a6),a4
    437a:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    437c:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    437e:	|  |  |  |  |  |  |                                                                                                   add.l a4,d0
    4380:	|  |  |  |  |  |  |                                                                                                   move.l d0,62(sp)
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    4384:	|  |  |  |  |  |  |                                                                                                   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    4388:	|  |  |  |  |  |  |                                                                                                   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    438c:	|  |  |  |  |  |  |                                                                                                   move.l a4,d1
    438e:	|  |  |  |  |  |  |                                                                                                   add.l d4,d1
    for(int i=0;i<length; i++) 
    4390:	|  |  |  |  |  |  |                                                                                                   move.l 62(sp),d2
    4394:	|  |  |  |  |  |  |                                                                                                   add.l d4,d2
    4396:	|  |  |  |  |  |  |                                                                                                   tst.w 110(sp)
    439a:	|  |  |  |  |  |  |                                                                                         /-------- beq.s 43d0 <DrawCube3d+0xb44>
      custom->bltapt = bltapos;
    439c:	|  |  |  |  |  |  |                                                                                         |  /----> move.l a1,dff050 <_end+0xd89d6c>
      custom->bltbpt = bltbpos;
    43a2:	|  |  |  |  |  |  |                                                                                         |  |      move.l a0,dff04c <_end+0xd89d68>
      custom->bltdpt = bltdpos;
    43a8:	|  |  |  |  |  |  |                                                                                         |  |      move.l d1,dff054 <_end+0xd89d70>
      custom->bltsize = 2 + height * 64;
    43ae:	|  |  |  |  |  |  |                                                                                         |  |      move.w d3,dff058 <_end+0xd89d74>
      bltapos -= 2;
    43b4:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a1
      bltbpos -= 2;
    43b6:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #2,a0
      bltdpos += 2; 
    43b8:	|  |  |  |  |  |  |                                                                                         |  |      addq.l #2,d1
      UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    43ba:	|  |  |  |  |  |  |                                                                                         |  |      move.w dff002 <_end+0xd89d1e>,d0
	    while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    43c0:	|  |  |  |  |  |  |                                                                                         |  |  /-> move.w dff002 <_end+0xd89d1e>,d0
    43c6:	|  |  |  |  |  |  |                                                                                         |  |  |   btst #14,d0
    43ca:	|  |  |  |  |  |  |                                                                                         |  |  \-- bne.s 43c0 <DrawCube3d+0xb34>
    for(int i=0;i<length; i++) 
    43cc:	|  |  |  |  |  |  |                                                                                         |  |      cmp.l d1,d2
    43ce:	|  |  |  |  |  |  |                                                                                         |  +----- bne.s 439c <DrawCube3d+0xb10>
  for(int i2=0;i2<2;i2++)
    43d0:	|  |  |  |  |  |  |                                                                                         >--|----> addi.l #16384,d4
    43d6:	|  |  |  |  |  |  |                                                                                         |  |      subq.l #1,d6
    43d8:	|  |  |  |  |  |  |                                                                                         |  |  /-- beq.s 43f6 <DrawCube3d+0xb6a>
    43da:	|  |  |  |  |  |  |                                                                                         |  |  |   moveq #1,d6
    UBYTE *bltapos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2;  
    43dc:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a5,d4.l),a1
    UBYTE *bltbpos = startbuffer + bitplaneoffset + (height - 1) * 64 + 10 * 2 - 2;  
    43e0:	|  |  |  |  |  |  |                                                                                         |  |  |   lea (0,a3,d4.l),a0
    UBYTE *bltdpos = preparebuffer  + bitplaneoffset + (height - 1) *64 + 2;    
    43e4:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l a4,d1
    43e6:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d1
    for(int i=0;i<length; i++) 
    43e8:	|  |  |  |  |  |  |                                                                                         |  |  |   move.l 62(sp),d2
    43ec:	|  |  |  |  |  |  |                                                                                         |  |  |   add.l d4,d2
    43ee:	|  |  |  |  |  |  |                                                                                         |  |  |   tst.w 110(sp)
    43f2:	|  |  |  |  |  |  |                                                                                         |  \--|-- bne.s 439c <DrawCube3d+0xb10>
    43f4:	|  |  |  |  |  |  |                                                                                         \-----|-- bra.s 43d0 <DrawCube3d+0xb44>
  custom->bltcon0 = 0x4dd8; //Move Uneven Nibbles upawards / Channel A,B,D
    43f6:	|  |  |  |  |  |  |                                                                                               \-> move.w #19928,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0xc002; //Move even Nibbles downwards (Moving 12 to the left kind of rotates them in the next Word)
    43fe:	|  |  |  |  |  |  |                                                                                                   move.w #-16382,dff042 <_end+0xd89d5e>
  custom->bltcdat = 0x0f0f; //Mask to Select Channel A for Uneven Nibbles and Channel B for Even ones
    4406:	|  |  |  |  |  |  |                                                                                                   move.w #3855,dff070 <_end+0xd89d8c>
  UWORD mod=64 - length*2-2;
    440e:	|  |  |  |  |  |  |                                                                                                   moveq #31,d1
    4410:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d1
    4412:	|  |  |  |  |  |  |                                                                                                   add.w d1,d1
  custom->bltamod = mod;
    4414:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd89d80>
  custom->bltbmod = mod;
    441a:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd89d7e>
  custom->bltdmod = mod;
    4420:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd89d82>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4426:	|  |  |  |  |  |  |                                                                                                   move.l d7,d0
    4428:	|  |  |  |  |  |  |                                                                                                   add.l d7,d0
    442a:	|  |  |  |  |  |  |                                                                                                   add.l 66(sp),d0
    custom->bltsize = length+1 + height * 64;
    442e:	|  |  |  |  |  |  |                                                                                                   add.w 110(sp),d5
    4432:	|  |  |  |  |  |  |                                                                                                   movea.w d5,a0
    4434:	|  |  |  |  |  |  |                                                                                                   addq.w #1,a0
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    4436:	|  |  |  |  |  |  |                                                                                                   move.l a6,d2
    4438:	|  |  |  |  |  |  |                                                                                                   add.l d0,d2
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    443a:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a3
    443c:	|  |  |  |  |  |  |                                                                                                   subq.l #2,a3
    443e:	|  |  |  |  |  |  |                                                                                                   move.l a6,d3
    4440:	|  |  |  |  |  |  |                                                                                                   add.l a3,d3
    custom->bltapt = bltapos;
    4442:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    4448:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    444e:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    4454:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    445a:	|  |  |  |  |  |  |                                                                                                   movea.w dff002 <_end+0xd89d1e>,a1
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4460:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d4
    4466:	|  |  |  |  |  |  |                                                                                               |   btst #14,d4
    446a:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4460 <DrawCube3d+0xbd4>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2;  
    446c:	|  |  |  |  |  |  |                                                                                                   movea.l d0,a1
    446e:	|  |  |  |  |  |  |                                                                                                   lea 16384(a1),a1
    4472:	|  |  |  |  |  |  |                                                                                                   lea (0,a6,a1.l),a1
    UBYTE *bltbpos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;  
    4476:	|  |  |  |  |  |  |                                                                                                   move.l d0,d6
    4478:	|  |  |  |  |  |  |                                                                                                   addi.l #16382,d6
    447e:	|  |  |  |  |  |  |                                                                                                   move.l a6,d4
    4480:	|  |  |  |  |  |  |                                                                                                   add.l d6,d4
    custom->bltapt = bltapos;
    4482:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    4488:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    448e:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    4494:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    449a:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    44a0:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    44a6:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    44aa:	|  |  |  |  |  |  |                                                                                               \-- bne.s 44a0 <DrawCube3d+0xc14>
  custom->bltcon0 = 0x2dd8;
    44ac:	|  |  |  |  |  |  |                                                                                                   move.w #11736,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0xe002;
    44b4:	|  |  |  |  |  |  |                                                                                                   move.w #-8190,dff042 <_end+0xd89d5e>
  custom->bltcdat = 0x3333;
    44bc:	|  |  |  |  |  |  |                                                                                                   move.w #13107,dff070 <_end+0xd89d8c>
  custom->bltamod = mod;
    44c4:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd89d80>
  custom->bltbmod = mod;
    44ca:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd89d7e>
  custom->bltdmod = mod;
    44d0:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd89d82>
    custom->bltapt = bltapos;
    44d6:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    44dc:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    44e2:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    44e8:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    44ee:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    44f4:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    44fa:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    44fe:	|  |  |  |  |  |  |                                                                                               \-- bne.s 44f4 <DrawCube3d+0xc68>
    custom->bltapt = bltapos;
    4500:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    4506:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    450c:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    4512:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4518:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    451e:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    4524:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4528:	|  |  |  |  |  |  |                                                                                               \-- bne.s 451e <DrawCube3d+0xc92>
  custom->bltcon0 = 0x1dd8;
    452a:	|  |  |  |  |  |  |                                                                                                   move.w #7640,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0xf002;
    4532:	|  |  |  |  |  |  |                                                                                                   move.w #-4094,dff042 <_end+0xd89d5e>
  custom->bltcdat = 0x5555;
    453a:	|  |  |  |  |  |  |                                                                                                   move.w #21845,dff070 <_end+0xd89d8c>
  custom->bltamod = mod;
    4542:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff064 <_end+0xd89d80>
  custom->bltbmod = mod;
    4548:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff062 <_end+0xd89d7e>
  custom->bltdmod = mod;
    454e:	|  |  |  |  |  |  |                                                                                                   move.w d1,dff066 <_end+0xd89d82>
    custom->bltapt = bltapos;
    4554:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    455a:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    4560:	|  |  |  |  |  |  |                                                                                                   move.l d2,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    4566:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    456c:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    4572:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    4578:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    457c:	|  |  |  |  |  |  |                                                                                               \-- bne.s 4572 <DrawCube3d+0xce6>
    custom->bltapt = bltapos;
    457e:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff050 <_end+0xd89d6c>
    custom->bltbpt = bltbpos;
    4584:	|  |  |  |  |  |  |                                                                                                   move.l d4,dff04c <_end+0xd89d68>
    custom->bltdpt = bltdpos;
    458a:	|  |  |  |  |  |  |                                                                                                   move.l a1,dff054 <_end+0xd89d70>
    custom->bltsize = length+1 + height * 64;
    4590:	|  |  |  |  |  |  |                                                                                                   move.w a0,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4596:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    459c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    45a2:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    45a6:	|  |  |  |  |  |  |                                                                                               \-- bne.s 459c <DrawCube3d+0xd10>
  custom->bltcon0 = 0x09f0;
    45a8:	|  |  |  |  |  |  |                                                                                                   move.w #2544,dff040 <_end+0xd89d5c>
  custom->bltcon1 = 0x0002;
    45b0:	|  |  |  |  |  |  |                                                                                                   move.w #2,dff042 <_end+0xd89d5e>
  custom->bltcdat = 0x0;
    45b8:	|  |  |  |  |  |  |                                                                                                   move.w #0,dff070 <_end+0xd89d8c>
  mod=64 -length*2;
    45c0:	|  |  |  |  |  |  |                                                                                                   moveq #32,d0
    45c2:	|  |  |  |  |  |  |                                                                                                   sub.l d7,d0
    45c4:	|  |  |  |  |  |  |                                                                                                   add.w d0,d0
  custom->bltamod = mod;  
    45c6:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff064 <_end+0xd89d80>
  custom->bltdmod = mod;
    45cc:	|  |  |  |  |  |  |                                                                                                   move.w d0,dff066 <_end+0xd89d82>
  custom->bltafwm = bltfmask;
    45d2:	|  |  |  |  |  |  |                                                                                                   move.w 114(sp),dff044 <_end+0xd89d60>
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    45da:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    45de:	|  |  |  |  |  |  |                                                                                                   add.l a3,d0
    45e0:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    45e4:	|  |  |  |  |  |  |                                                                                                   move.l d3,dff050 <_end+0xd89d6c>
    custom->bltdpt = bltdpos;
    45ea:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd89d70>
    custom->bltsize = length + height * 64;
    45f0:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    45f6:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    45fc:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    4602:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4606:	|  |  |  |  |  |  |                                                                                               \-- bne.s 45fc <DrawCube3d+0xd70>
    UBYTE *bltapos = preparebuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;      
    4608:	|  |  |  |  |  |  |                                                                                                   adda.l d6,a6
    UBYTE *bltdpos = targetbuffer + bitplaneoffset + (height - 1) * 64 + length * 2 - 2;
    460a:	|  |  |  |  |  |  |                                                                                                   move.l 58(sp),d0
    460e:	|  |  |  |  |  |  |                                                                                                   add.l d6,d0
    4610:	|  |  |  |  |  |  |                                                                                                   add.l 54(sp),d0
    custom->bltapt = bltapos;
    4614:	|  |  |  |  |  |  |                                                                                                   move.l a6,dff050 <_end+0xd89d6c>
    custom->bltdpt = bltdpos;
    461a:	|  |  |  |  |  |  |                                                                                                   move.l d0,dff054 <_end+0xd89d70>
    custom->bltsize = length + height * 64;
    4620:	|  |  |  |  |  |  |                                                                                                   move.w d5,dff058 <_end+0xd89d74>
    UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4626:	|  |  |  |  |  |  |                                                                                                   move.w dff002 <_end+0xd89d1e>,d0
	  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait     
    462c:	|  |  |  |  |  |  |                                                                                               /-> move.w dff002 <_end+0xd89d1e>,d0
    4632:	|  |  |  |  |  |  |                                                                                               |   btst #14,d0
    4636:	|  |  |  |  |  |  |                                                                                               \-- bne.s 462c <DrawCube3d+0xda0>
  custom->bltafwm = 0xffff;
    4638:	|  |  |  |  |  |  |                                                                                                   move.w #-1,dff044 <_end+0xd89d60>
  DrawBuffer->minytotal = minytotal;
    4640:	|  |  |  |  |  |  |                                                                                                   move.w 102(sp),54(a2)
  DrawBuffer->maxytotal = maxytotal;
    4646:	|  |  |  |  |  |  |                                                                                                   move.w 98(sp),52(a2)
}
    464c:	|  |  |  |  |  |  |                                                                                                   movem.l (sp)+,d2-d7/a2-a6
    4650:	|  |  |  |  |  |  |                                                                                                   lea 72(sp),sp
    4654:	|  |  |  |  |  |  |                                                                                                   rts
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    4656:	|  |  |  |  |  |  \-------------------------------------------------------------------------------------------------> move.l 94(sp),d6
    465a:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    465c:	|  |  |  |  |  |                                                                                                      add.l 94(sp),d6
    4660:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    4662:	|  |  |  |  |  |                                                                                                      add.l d6,d6
    4664:	|  |  |  |  |  |                                                                                                      movea.l 54(sp),a4
    4668:	|  |  |  |  |  |                                                                                                      move.w (0,a4,d6.l),102(sp)
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    466e:	|  |  |  |  |  |                                                                                                      move.w dff002 <_end+0xd89d1e>,d6
    4674:	|  |  |  |  |  |                                                                                                      move.l 50(sp),d0
    4678:	|  |  |  |  |  |                                                                                                      movea.l 46(sp),a4
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    467c:	|  |  |  |  |  |                                                                                                  /-> move.w dff002 <_end+0xd89d1e>,d6
    4682:	|  |  |  |  |  |                                                                                                  |   btst #14,d6
    4686:	|  |  |  |  |  |                                                                                                  \-- bne.s 467c <DrawCube3d+0xdf0>
    custom->bltdpt =(ULONG *)target;
    4688:	|  |  |  |  |  |                                                                                                      move.l d0,50(sp)
    468c:	|  |  |  |  |  |                                                                                                      move.l a4,46(sp)
    4690:	|  |  |  |  |  |                                                                                                      move.l a5,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    4696:	|  |  |  |  |  |                                                                                                      move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    469e:	|  |  |  |  |  |                                                                                                      move.w 102(sp),dff058 <_end+0xd89d74>
      clearpos += 64*BPLHEIGHT;
    46a6:	|  |  |  |  |  |                                                                                                      lea 16384(a5),a5
    46aa:	|  |  |  \--|--|----------------------------------------------------------------------------------------------------- bra.w 3be6 <DrawCube3d+0x35a>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize); 
    46ae:	|  |  \-----|--|----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    46b2:	|  |        |  |                                                                                                      add.l d0,d0
    46b4:	|  |        |  |                                                                                                      add.l 94(sp),d0
    46b8:	|  |        |  |                                                                                                      add.l d0,d0
    46ba:	|  |        |  |                                                                                                      add.l d0,d0
    46bc:	|  |        |  |                                                                                                      move.w (0,a6,d0.l),d1
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    46c0:	|  |        |  |                                                                                                      move.w dff002 <_end+0xd89d1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    46c6:	|  |        |  |                                                                                                  /-> move.w dff002 <_end+0xd89d1e>,d0
    46cc:	|  |        |  |                                                                                                  |   btst #14,d0
    46d0:	|  |        |  |                                                                                                  \-- bne.s 46c6 <DrawCube3d+0xe3a>
    custom->bltdpt =(ULONG *)target;
    46d2:	|  |        |  |                                                                                                      move.l a5,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    46d8:	|  |        |  |                                                                                                      move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    46e0:	|  |        |  |                                                                                                      move.w d1,dff058 <_end+0xd89d74>
      clearpos += 64*BPLHEIGHT;
    46e6:	|  |        |  |                                                                                                      lea 16384(a5),a5
    46ea:	|  \--------|--|----------------------------------------------------------------------------------------------------- bra.w 3acc <DrawCube3d+0x240>
      ClearDirtyArea(clearpos, ClearBuffer->MyDirtyArea[i].BltSize);
    46ee:	|           |  \----------------------------------------------------------------------------------------------------> move.l 94(sp),d0
    46f2:	|           |                                                                                                         add.l d0,d0
    46f4:	|           |                                                                                                         add.l 94(sp),d0
    46f8:	|           |                                                                                                         add.l d0,d0
    46fa:	|           |                                                                                                         add.l d0,d0
    46fc:	|           |                                                                                                         movea.l 54(sp),a4
    4700:	|           |                                                                                                         move.w (0,a4,d0.l),d6
  UWORD tst=*(volatile UWORD*)&custom->dmaconr; //for compatiblity a1000
    4704:	|           |                                                                                                         move.w dff002 <_end+0xd89d1e>,d0
  while (*(volatile UWORD*)&custom->dmaconr&(1<<14)) {} //blitter busy wait
    470a:	|           |                                                                                                     /-> move.w dff002 <_end+0xd89d1e>,d0
    4710:	|           |                                                                                                     |   btst #14,d0
    4714:	|           |                                                                                                     \-- bne.s 470a <DrawCube3d+0xe7e>
    custom->bltdpt =(ULONG *)target;
    4716:	|           |                                                                                                         move.l a5,dff054 <_end+0xd89d70>
    custom->bltadat = 0x0;
    471c:	|           |                                                                                                         move.w #0,dff074 <_end+0xd89d90>
    custom->bltsize = bltsize;    
    4724:	|           |                                                                                                         move.w d6,dff058 <_end+0xd89d74>
    squares[3].Vertices[0].X = xs0;
    472a:	|           |                                                                                                         move.w 58(sp),96(a3)
    squares[3].Vertices[0].Y = ys0;
    4730:	|           |                                                                                                         move.w 62(sp),98(a3)
    squares[3].Vertices[1].X = xs4;
    4736:	|           |                                                                                                         move.w d7,100(a3)
    squares[3].Vertices[1].Y = ys4;
    473a:	|           |                                                                                                         move.w a1,102(a3)
    squares[3].Vertices[2].X = xs5;
    473e:	|           |                                                                                                         move.w d4,104(a3)
    squares[3].Vertices[2].Y = ys5;
    4742:	|           |                                                                                                         move.w d1,106(a3)
    squares[3].Vertices[3].X = xs1;
    4746:	|           |                                                                                                         move.w 66(sp),108(a3)
    squares[3].Vertices[3].Y = ys1;
    474c:	|           |                                                                                                         move.w 70(sp),110(a3)
    squares[3].DotProduct = vf3dotprod;
    4752:	|           |                                                                                                         move.l 98(sp),112(a3)
    squares[3].Color = 2;
    4758:	|           |                                                                                                         move.w #2,126(a3)
    squares[4].Vertices[0].X = xs6;
    475e:	|           |                                                                                                         move.w d5,128(a3)
    squares[4].Vertices[0].Y = ys6;
    4762:	|           |                                                                                                         move.w d3,130(a3)
    squares[4].Vertices[1].X = xs4;
    4766:	|           |                                                                                                         move.w d7,132(a3)
    squares[4].Vertices[1].Y = ys4;
    476a:	|           |                                                                                                         move.w a1,134(a3)
    squares[4].Vertices[2].X = xs0;
    476e:	|           |                                                                                                         move.w 58(sp),136(a3)
    squares[4].Vertices[2].Y = ys0;
    4774:	|           |                                                                                                         move.w 62(sp),138(a3)
    squares[4].Vertices[3].X = xs2;
    477a:	|           |                                                                                                         move.w 72(sp),140(a3)
    squares[4].Vertices[3].Y = ys2;
    4780:	|           |                                                                                                         move.w 76(sp),142(a3)
    squares[4].DotProduct = vf4dotprod;
    4786:	|           |                                                                                                         move.l d2,144(a3)
    squares[4].Color = 3;
    478a:	|           |                                                                                                         move.w #3,158(a3)
    squares[5].Vertices[0].X = xs7;
    4790:	|           |                                                                                                         move.w a6,160(a3)
    squares[5].Vertices[0].Y = ys7;
    4794:	|           |                                                                                                         move.w a0,162(a3)
    squares[5].Vertices[1].X = xs3;
    4798:	|           |                                                                                                         move.w 80(sp),164(a3)
    squares[5].Vertices[1].Y = ys3;
    479e:	|           |                                                                                                         move.w 84(sp),166(a3)
    squares[5].Vertices[2].X = xs1;
    47a4:	|           |                                                                                                         move.w 66(sp),168(a3)
    squares[5].Vertices[2].Y = ys1;
    47aa:	|           |                                                                                                         move.w 70(sp),170(a3)
    squares[5].Vertices[3].X = xs5;
    47b0:	|           |                                                                                                         move.w d4,172(a3)
    squares[5].Vertices[3].Y = ys5;
    47b4:	|           |                                                                                                         move.w d1,174(a3)
    squares[5].DotProduct = vf5dotprod;      
    47b8:	|           |                                                                                                         move.l 90(sp),176(a3)
    squares[5].Color = 3; 
    47be:	|           |                                                                                                         move.w #3,190(a3)
    vectors += 8*3;  
    47c4:	|           |                                                                                                         lea 48(a2),a2
  for(UWORD i=0;i<cubecount;i++) 
    47c8:	|           |                                                                                                         move.l 94(sp),d5
    47cc:	|           |                                                                                                         lea 192(a3),a3
    47d0:	|           |                                                                                                         cmp.w 106(sp),d5
    47d4:	\-----------|-------------------------------------------------------------------------------------------------------- bcs.w 38bc <DrawCube3d+0x30>
    47d8:	            \-------------------------------------------------------------------------------------------------------- bra.w 3d18 <DrawCube3d+0x48c>

000047dc <debug_register_bitmap.constprop.0>:
	while(*source && --num > 0)
		*destination++ = *source++;
	*destination = '\0';
}

void debug_register_bitmap(const void* addr, const char* name, short width, short height, short numPlanes, unsigned short flags) {
    47dc:	       link.w a5,#-52
    47e0:	       move.l a2,-(sp)
    47e2:	       move.l d2,-(sp)
    47e4:	       movea.l 12(a5),a1
    47e8:	       move.l 16(a5),d2
    47ec:	       move.l 20(a5),d1
	struct debug_resource resource = {
    47f0:	       clr.l -42(a5)
    47f4:	       clr.l -38(a5)
    47f8:	       clr.l -34(a5)
    47fc:	       clr.l -30(a5)
    4800:	       clr.l -26(a5)
    4804:	       clr.l -22(a5)
    4808:	       clr.l -18(a5)
    480c:	       clr.l -14(a5)
    4810:	       clr.w -10(a5)
    4814:	       move.l 8(a5),-50(a5)
		.address = (unsigned int)addr,
		.size = width / 8 * height * numPlanes,
    481a:	       move.w d2,d0
    481c:	       muls.w d1,d0
    481e:	       lsl.l #6,d0
	struct debug_resource resource = {
    4820:	       move.l d0,-46(a5)
    4824:	       clr.w -8(a5)
    4828:	       move.w #512,-6(a5)
    482e:	       move.w d2,-4(a5)
    4832:	       move.w d1,-2(a5)
	while(*source && --num > 0)
    4836:	       move.b (a1),d0
    4838:	       lea -42(a5),a0
    483c:	/----- beq.s 484e <debug_register_bitmap.constprop.0+0x72>
    483e:	|      lea -11(a5),a2
		*destination++ = *source++;
    4842:	|  /-> addq.l #1,a1
    4844:	|  |   move.b d0,(a0)+
	while(*source && --num > 0)
    4846:	|  |   move.b (a1),d0
    4848:	+--|-- beq.s 484e <debug_register_bitmap.constprop.0+0x72>
    484a:	|  |   cmpa.l a0,a2
    484c:	|  \-- bne.s 4842 <debug_register_bitmap.constprop.0+0x66>
	*destination = '\0';
    484e:	\----> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    4850:	       move.w f0ff60 <_end+0xe9ac7c>,d0
    4856:	       cmpi.w #20153,d0
    485a:	   /-- beq.s 486e <debug_register_bitmap.constprop.0+0x92>
    485c:	   |   cmpi.w #-24562,d0
    4860:	   +-- beq.s 486e <debug_register_bitmap.constprop.0+0x92>
	if (flags & debug_resource_bitmap_masked)
		resource.size *= 2;

	my_strncpy(resource.name, name, sizeof(resource.name));
	debug_cmd(barto_cmd_register_resource, (unsigned int)&resource, 0, 0);
}
    4862:	   |   move.l -60(a5),d2
    4866:	   |   movea.l -56(a5),a2
    486a:	   |   unlk a5
    486c:	   |   rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    486e:	   \-> clr.l -(sp)
    4870:	       clr.l -(sp)
    4872:	       pea -50(a5)
    4876:	       pea 4 <_start+0x4>
    487a:	       pea 58 <_start+0x58>
    487e:	       jsr f0ff60 <_end+0xe9ac7c>
}
    4884:	       lea 20(sp),sp
}
    4888:	       move.l -60(a5),d2
    488c:	       movea.l -56(a5),a2
    4890:	       unlk a5
    4892:	       rts

00004894 <DrawLetters.isra.0>:
void DrawLetters( WORD *vectors, WORD *metadata, struct ScreenBuffer *buffer, UWORD numcube, UWORD reversed) 
    4894:	                            lea -52(sp),sp
    4898:	                            movem.l d2-d7/a2-a6,-(sp)
    489c:	                            movea.l 100(sp),a2
    48a0:	                            movea.l 104(sp),a5
    48a4:	                            move.l 108(sp),d0
    48a8:	                            move.w 114(sp),d1
  for(int i2=0;i2<numcube;i2++)
    48ac:	                            moveq #0,d2
    48ae:	                            move.w d0,d2
    48b0:	                            move.l d2,56(sp)
    48b4:	                            tst.w d0
    48b6:	/-------------------------- beq.s 4926 <DrawLetters.isra.0+0x92>
    48b8:	|                           clr.l 44(sp)
    48bc:	|                           move.l #478788,60(sp)
    48c4:	|                           lea 3bfa6 <zMult>,a4
    48ca:	|                           cmpi.w #1,d1
    48ce:	|  /----------------------- beq.w 4ab0 <DrawLetters.isra.0+0x21c>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    48d2:	|  |  /-------------------> moveq #0,d0
    48d4:	|  |  |                     move.w (a5),d0
    48d6:	|  |  |                     moveq #0,d3
    48d8:	|  |  |                     move.w 2(a5),d3
    48dc:	|  |  |                     movea.l d3,a0
    48de:	|  |  |                     move.l d0,d1
    48e0:	|  |  |                     add.l d0,d1
    48e2:	|  |  |                     add.l d1,d0
    48e4:	|  |  |                     add.l d0,d0
    48e6:	|  |  |                     adda.l d0,a0
    48e8:	|  |  |                     move.l a0,d4
    48ea:	|  |  |                     lsl.l #5,d4
    48ec:	|  |  |                     movea.l d4,a0
    48ee:	|  |  |                     adda.l 60(sp),a0
    48f2:	|  |  |                     move.l 16(a0),d0
    48f6:	|  |  |                     move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    48fa:	|  |  |                     move.w 4(a5),d1
    if( square.DotProduct > 1) 
    48fe:	|  |  |                     moveq #1,d2
    4900:	|  |  |                     cmp.l d0,d2
    4902:	|  |  |     /-------------- blt.w 4b08 <DrawLetters.isra.0+0x274>
      vectors += 12*metadata[2];
    4906:	|  |  |     |               movea.w d1,a0
    4908:	|  |  |     |               move.l a0,d0
    490a:	|  |  |     |               add.l a0,d0
    490c:	|  |  |     |               add.l a0,d0
    490e:	|  |  |     |               lsl.l #3,d0
    4910:	|  |  |     |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4912:	|  |  |     |               addq.l #3,a0
    4914:	|  |  |     |               adda.l a0,a0
    4916:	|  |  |     |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4918:	|  |  |     |               addq.l #1,44(sp)
    491c:	|  |  |     |               move.l 56(sp),d0
    4920:	|  |  |     |               cmp.l 44(sp),d0
    4924:	|  |  +-----|-------------- bne.s 48d2 <DrawLetters.isra.0+0x3e>
}
    4926:	>--|--|-----|-------------> movem.l (sp)+,d2-d7/a2-a6
    492a:	|  |  |     |               lea 52(sp),sp
    492e:	|  |  |     |               rts
      for(int i=0;i<metadata[2];i++)
    4930:	|  |  |     |  /----------> tst.w d1
    4932:	|  |  |  /--|--|----------- ble.w 4ca8 <DrawLetters.isra.0+0x414>
    4936:	|  |  |  |  |  |            lea 6(a5),a6
    493a:	|  |  |  |  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    493c:	|  |  |  |  |  |            lea 20(a0),a0
    4940:	|  |  |  |  |  |            move.l a0,52(sp)
    4944:	|  |  |  |  |  |            move.l a5,48(sp)
    4948:	|  |  |  |  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    494a:	|  |  |  |  |  |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    494e:	|  |  |  |  |  |  |         movea.w 4(a2),a0
    4952:	|  |  |  |  |  |  |         move.l a0,d0
    4954:	|  |  |  |  |  |  |         subq.l #1,d0
    4956:	|  |  |  |  |  |  |         add.l d0,d0
    4958:	|  |  |  |  |  |  |         move.w (0,a4,d0.l),d0
    495c:	|  |  |  |  |  |  |         move.w d0,d1
    495e:	|  |  |  |  |  |  |         muls.w (a2),d1
    4960:	|  |  |  |  |  |  |         moveq #15,d4
    4962:	|  |  |  |  |  |  |         asr.l d4,d1
    4964:	|  |  |  |  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    4968:	|  |  |  |  |  |  |         muls.w 2(a2),d0
    496c:	|  |  |  |  |  |  |         asr.l d4,d0
    496e:	|  |  |  |  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4972:	|  |  |  |  |  |  |         movea.w 10(a2),a0
    4976:	|  |  |  |  |  |  |         subq.l #1,a0
    4978:	|  |  |  |  |  |  |         adda.l a0,a0
    497a:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d2
    497e:	|  |  |  |  |  |  |         move.w d2,d7
    4980:	|  |  |  |  |  |  |         muls.w 6(a2),d7
    4984:	|  |  |  |  |  |  |         asr.l d4,d7
    4986:	|  |  |  |  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    498a:	|  |  |  |  |  |  |         muls.w 8(a2),d2
    498e:	|  |  |  |  |  |  |         asr.l d4,d2
    4990:	|  |  |  |  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    4994:	|  |  |  |  |  |  |         movea.w 16(a2),a0
    4998:	|  |  |  |  |  |  |         subq.l #1,a0
    499a:	|  |  |  |  |  |  |         adda.l a0,a0
    499c:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    49a0:	|  |  |  |  |  |  |         move.w d3,d6
    49a2:	|  |  |  |  |  |  |         muls.w 12(a2),d6
    49a6:	|  |  |  |  |  |  |         asr.l d4,d6
    49a8:	|  |  |  |  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    49ac:	|  |  |  |  |  |  |         muls.w 14(a2),d3
    49b0:	|  |  |  |  |  |  |         asr.l d4,d3
    49b2:	|  |  |  |  |  |  |         movea.w d3,a1
    49b4:	|  |  |  |  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    49b8:	|  |  |  |  |  |  |         movea.w 22(a2),a0
    49bc:	|  |  |  |  |  |  |         subq.l #1,a0
    49be:	|  |  |  |  |  |  |         adda.l a0,a0
    49c0:	|  |  |  |  |  |  |         move.w (0,a4,a0.l),d3
    49c4:	|  |  |  |  |  |  |         move.w d3,d5
    49c6:	|  |  |  |  |  |  |         muls.w 18(a2),d5
    49ca:	|  |  |  |  |  |  |         asr.l d4,d5
    49cc:	|  |  |  |  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    49d0:	|  |  |  |  |  |  |         muls.w 20(a2),d3
    49d4:	|  |  |  |  |  |  |         asr.l d4,d3
    49d6:	|  |  |  |  |  |  |         movea.w d3,a0
    49d8:	|  |  |  |  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    49dc:	|  |  |  |  |  |  |         move.w d1,64(sp)
        square.Vertices[0].Y = ys0;
    49e0:	|  |  |  |  |  |  |         move.w d0,66(sp)
        square.Vertices[1].X = xs1;
    49e4:	|  |  |  |  |  |  |         move.w d7,68(sp)
        square.Vertices[1].Y = ys1;
    49e8:	|  |  |  |  |  |  |         move.w d2,70(sp)
        square.Vertices[2].X = xs2;
    49ec:	|  |  |  |  |  |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    49f0:	|  |  |  |  |  |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    49f4:	|  |  |  |  |  |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    49f8:	|  |  |  |  |  |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    49fc:	|  |  |  |  |  |  |         move.w d1,d4
    49fe:	|  |  |  |  |  |  |         cmp.w d1,d7
    4a00:	|  |  |  |  |  |  |     /-- bge.s 4a04 <DrawLetters.isra.0+0x170>
    4a02:	|  |  |  |  |  |  |     |   move.w d7,d4
    4a04:	|  |  |  |  |  |  |     \-> cmp.w d4,d6
    4a06:	|  |  |  |  |  |  |     /-- bge.s 4a0a <DrawLetters.isra.0+0x176>
    4a08:	|  |  |  |  |  |  |     |   move.w d6,d4
    4a0a:	|  |  |  |  |  |  |     \-> cmp.w d4,d5
    4a0c:	|  |  |  |  |  |  |     /-- bge.s 4a10 <DrawLetters.isra.0+0x17c>
    4a0e:	|  |  |  |  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    4a10:	|  |  |  |  |  |  |     \-> move.w d0,d3
    4a12:	|  |  |  |  |  |  |         cmp.w d0,d2
    4a14:	|  |  |  |  |  |  |     /-- bge.s 4a18 <DrawLetters.isra.0+0x184>
    4a16:	|  |  |  |  |  |  |     |   move.w d2,d3
    4a18:	|  |  |  |  |  |  |     \-> cmp.w a1,d3
    4a1a:	|  |  |  |  |  |  |     /-- ble.s 4a1e <DrawLetters.isra.0+0x18a>
    4a1c:	|  |  |  |  |  |  |     |   move.w a1,d3
    4a1e:	|  |  |  |  |  |  |     \-> cmp.w a0,d3
    4a20:	|  |  |  |  |  |  |     /-- ble.s 4a24 <DrawLetters.isra.0+0x190>
    4a22:	|  |  |  |  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4a24:	|  |  |  |  |  |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4a28:	|  |  |  |  |  |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4a2c:	|  |  |  |  |  |  |         cmp.w d0,d2
    4a2e:	|  |  |  |  |  |  |     /-- ble.s 4a32 <DrawLetters.isra.0+0x19e>
    4a30:	|  |  |  |  |  |  |     |   move.w d2,d0
    4a32:	|  |  |  |  |  |  |     \-> cmp.w a1,d0
    4a34:	|  |  |  |  |  |  |     /-- bge.s 4a38 <DrawLetters.isra.0+0x1a4>
    4a36:	|  |  |  |  |  |  |     |   move.w a1,d0
    4a38:	|  |  |  |  |  |  |     \-> cmp.w a0,d0
    4a3a:	|  |  |  |  |  |  |     /-- bge.s 4a3e <DrawLetters.isra.0+0x1aa>
    4a3c:	|  |  |  |  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4a3e:	|  |  |  |  |  |  |     \-> addq.w #1,d0
    4a40:	|  |  |  |  |  |  |         sub.w d3,d0
    4a42:	|  |  |  |  |  |  |         move.w d0,92(sp)
        if(square.Height > 1)
    4a46:	|  |  |  |  |  |  |         cmpi.w #1,d0
    4a4a:	|  |  |  |  |  |  |  /----- ble.s 4a88 <DrawLetters.isra.0+0x1f4>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4a4c:	|  |  |  |  |  |  |  |      cmp.w d1,d7
    4a4e:	|  |  |  |  |  |  |  |  /-- ble.s 4a52 <DrawLetters.isra.0+0x1be>
    4a50:	|  |  |  |  |  |  |  |  |   move.w d7,d1
    4a52:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d6
    4a54:	|  |  |  |  |  |  |  |  /-- ble.s 4a58 <DrawLetters.isra.0+0x1c4>
    4a56:	|  |  |  |  |  |  |  |  |   move.w d6,d1
    4a58:	|  |  |  |  |  |  |  |  \-> cmp.w d1,d5
    4a5a:	|  |  |  |  |  |  |  |  /-- ble.s 4a5e <DrawLetters.isra.0+0x1ca>
    4a5c:	|  |  |  |  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    4a5e:	|  |  |  |  |  |  |  |  \-> sub.w d4,d1
    4a60:	|  |  |  |  |  |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    4a64:	|  |  |  |  |  |  |  |      cmpi.w #1,d1
    4a68:	|  |  |  |  |  |  |  +----- ble.s 4a88 <DrawLetters.isra.0+0x1f4>
              square.Clockwise *= -1;
    4a6a:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    4a6e:	|  |  |  |  |  |  |  |      move.w (a0),d0
    4a70:	|  |  |  |  |  |  |  |      neg.w d0
    4a72:	|  |  |  |  |  |  |  |      move.w d0,84(sp)
            DrawRect( &square);  
    4a76:	|  |  |  |  |  |  |  |      pea 64(sp)
    4a7a:	|  |  |  |  |  |  |  |      jsr 2964 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    4a7e:	|  |  |  |  |  |  |  |      movea.l 52(sp),a0
    4a82:	|  |  |  |  |  |  |  |      movea.w 4(a0),a5
    4a86:	|  |  |  |  |  |  |  |      addq.l #4,sp
        vectors += 12;
    4a88:	|  |  |  |  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    4a8c:	|  |  |  |  |  |  |         addq.l #1,a3
    4a8e:	|  |  |  |  |  |  |         movea.w a5,a0
    4a90:	|  |  |  |  |  |  |         cmpa.l a3,a0
    4a92:	|  |  |  |  |  |  \-------- bgt.w 494a <DrawLetters.isra.0+0xb6>
    4a96:	|  |  |  |  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    4a9a:	|  |  |  |  |  |            addq.l #3,a0
    4a9c:	|  |  |  |  |  |            adda.l a0,a0
    4a9e:	|  |  |  |  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4aa0:	|  |  |  |  |  |            addq.l #1,44(sp)
    4aa4:	|  |  |  |  |  |            move.l 56(sp),d0
    4aa8:	|  |  |  |  |  |            cmp.l 44(sp),d0
    4aac:	+--|--|--|--|--|----------- beq.w 4926 <DrawLetters.isra.0+0x92>
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    4ab0:	|  >--|--|--|--|----------> moveq #0,d0
    4ab2:	|  |  |  |  |  |            move.w (a5),d0
    4ab4:	|  |  |  |  |  |            moveq #0,d1
    4ab6:	|  |  |  |  |  |            move.w 2(a5),d1
    4aba:	|  |  |  |  |  |            movea.l d1,a0
    4abc:	|  |  |  |  |  |            move.l d0,d1
    4abe:	|  |  |  |  |  |            add.l d0,d1
    4ac0:	|  |  |  |  |  |            add.l d1,d0
    4ac2:	|  |  |  |  |  |            add.l d0,d0
    4ac4:	|  |  |  |  |  |            adda.l d0,a0
    4ac6:	|  |  |  |  |  |            move.l a0,d2
    4ac8:	|  |  |  |  |  |            lsl.l #5,d2
    4aca:	|  |  |  |  |  |            movea.l d2,a0
    4acc:	|  |  |  |  |  |            adda.l 60(sp),a0
    4ad0:	|  |  |  |  |  |            move.l 16(a0),d0
    4ad4:	|  |  |  |  |  |            move.l d0,80(sp)
      for(int i=0;i<metadata[2];i++)
    4ad8:	|  |  |  |  |  |            move.w 4(a5),d1
    if( square.DotProduct > 1) 
    4adc:	|  |  |  |  |  |            moveq #1,d3
    4ade:	|  |  |  |  |  |            cmp.l d0,d3
    4ae0:	|  |  |  |  |  \----------- blt.w 4930 <DrawLetters.isra.0+0x9c>
      vectors += 12*metadata[2];
    4ae4:	|  |  |  |  |               movea.w d1,a0
    4ae6:	|  |  |  |  |               move.l a0,d0
    4ae8:	|  |  |  |  |               add.l a0,d0
    4aea:	|  |  |  |  |               add.l a0,d0
    4aec:	|  |  |  |  |               lsl.l #3,d0
    4aee:	|  |  |  |  |               adda.l d0,a2
    metadata += 3 + metadata[2];    
    4af0:	|  |  |  |  |               addq.l #3,a0
    4af2:	|  |  |  |  |               adda.l a0,a0
    4af4:	|  |  |  |  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4af6:	|  |  |  |  |               addq.l #1,44(sp)
    4afa:	|  |  |  |  |               move.l 56(sp),d0
    4afe:	|  |  |  |  |               cmp.l 44(sp),d0
    4b02:	|  +--|--|--|-------------- bne.s 4ab0 <DrawLetters.isra.0+0x21c>
    4b04:	+--|--|--|--|-------------- bra.w 4926 <DrawLetters.isra.0+0x92>
      for(int i=0;i<metadata[2];i++)
    4b08:	|  |  |  |  \-------------> tst.w d1
    4b0a:	|  |  |  |     /----------- ble.w 4c8c <DrawLetters.isra.0+0x3f8>
    4b0e:	|  |  |  |     |            lea 6(a5),a6
    4b12:	|  |  |  |     |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4b14:	|  |  |  |     |            lea 20(a0),a0
    4b18:	|  |  |  |     |            move.l a0,52(sp)
    4b1c:	|  |  |  |     |            move.l a5,48(sp)
    4b20:	|  |  |  |     |            movea.w d1,a5
        square.Color = metadata[3+i];
    4b22:	|  |  |  |     |  /-------> move.w (a6)+,94(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    4b26:	|  |  |  |     |  |         movea.w 4(a2),a0
    4b2a:	|  |  |  |     |  |         move.l a0,d0
    4b2c:	|  |  |  |     |  |         subq.l #1,d0
    4b2e:	|  |  |  |     |  |         add.l d0,d0
    4b30:	|  |  |  |     |  |         move.w (0,a4,d0.l),d2
    4b34:	|  |  |  |     |  |         move.w d2,d7
    4b36:	|  |  |  |     |  |         muls.w (a2),d7
    4b38:	|  |  |  |     |  |         moveq #15,d3
    4b3a:	|  |  |  |     |  |         asr.l d3,d7
    4b3c:	|  |  |  |     |  |         addi.w #160,d7
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    4b40:	|  |  |  |     |  |         muls.w 2(a2),d2
    4b44:	|  |  |  |     |  |         asr.l d3,d2
    4b46:	|  |  |  |     |  |         addi.w #128,d2
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    4b4a:	|  |  |  |     |  |         movea.w 10(a2),a0
    4b4e:	|  |  |  |     |  |         move.l a0,d0
    4b50:	|  |  |  |     |  |         subq.l #1,d0
    4b52:	|  |  |  |     |  |         add.l d0,d0
    4b54:	|  |  |  |     |  |         move.w (0,a4,d0.l),d0
    4b58:	|  |  |  |     |  |         move.w d0,d1
    4b5a:	|  |  |  |     |  |         muls.w 6(a2),d1
    4b5e:	|  |  |  |     |  |         asr.l d3,d1
    4b60:	|  |  |  |     |  |         addi.w #160,d1
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    4b64:	|  |  |  |     |  |         muls.w 8(a2),d0
    4b68:	|  |  |  |     |  |         asr.l d3,d0
    4b6a:	|  |  |  |     |  |         addi.w #128,d0
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    4b6e:	|  |  |  |     |  |         movea.w 16(a2),a0
    4b72:	|  |  |  |     |  |         subq.l #1,a0
    4b74:	|  |  |  |     |  |         adda.l a0,a0
    4b76:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    4b7a:	|  |  |  |     |  |         move.w d3,d6
    4b7c:	|  |  |  |     |  |         muls.w 12(a2),d6
    4b80:	|  |  |  |     |  |         moveq #15,d4
    4b82:	|  |  |  |     |  |         asr.l d4,d6
    4b84:	|  |  |  |     |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    4b88:	|  |  |  |     |  |         muls.w 14(a2),d3
    4b8c:	|  |  |  |     |  |         asr.l d4,d3
    4b8e:	|  |  |  |     |  |         movea.w d3,a1
    4b90:	|  |  |  |     |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    4b94:	|  |  |  |     |  |         movea.w 22(a2),a0
    4b98:	|  |  |  |     |  |         subq.l #1,a0
    4b9a:	|  |  |  |     |  |         adda.l a0,a0
    4b9c:	|  |  |  |     |  |         move.w (0,a4,a0.l),d3
    4ba0:	|  |  |  |     |  |         move.w d3,d5
    4ba2:	|  |  |  |     |  |         muls.w 18(a2),d5
    4ba6:	|  |  |  |     |  |         asr.l d4,d5
    4ba8:	|  |  |  |     |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    4bac:	|  |  |  |     |  |         muls.w 20(a2),d3
    4bb0:	|  |  |  |     |  |         asr.l d4,d3
    4bb2:	|  |  |  |     |  |         movea.w d3,a0
    4bb4:	|  |  |  |     |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    4bb8:	|  |  |  |     |  |         move.w d7,64(sp)
        square.Vertices[0].Y = ys0;
    4bbc:	|  |  |  |     |  |         move.w d2,66(sp)
        square.Vertices[1].X = xs1;
    4bc0:	|  |  |  |     |  |         move.w d1,68(sp)
        square.Vertices[1].Y = ys1;
    4bc4:	|  |  |  |     |  |         move.w d0,70(sp)
        square.Vertices[2].X = xs2;
    4bc8:	|  |  |  |     |  |         move.w d6,72(sp)
        square.Vertices[2].Y = ys2;
    4bcc:	|  |  |  |     |  |         move.w a1,74(sp)
        square.Vertices[3].X = xs3;
    4bd0:	|  |  |  |     |  |         move.w d5,76(sp)
        square.Vertices[3].Y = ys3;
    4bd4:	|  |  |  |     |  |         move.w a0,78(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    4bd8:	|  |  |  |     |  |         move.w d1,d4
    4bda:	|  |  |  |     |  |         cmp.w d1,d7
    4bdc:	|  |  |  |     |  |     /-- bge.s 4be0 <DrawLetters.isra.0+0x34c>
    4bde:	|  |  |  |     |  |     |   move.w d7,d4
    4be0:	|  |  |  |     |  |     \-> cmp.w d4,d6
    4be2:	|  |  |  |     |  |     /-- bge.s 4be6 <DrawLetters.isra.0+0x352>
    4be4:	|  |  |  |     |  |     |   move.w d6,d4
    4be6:	|  |  |  |     |  |     \-> cmp.w d4,d5
    4be8:	|  |  |  |     |  |     /-- bge.s 4bec <DrawLetters.isra.0+0x358>
    4bea:	|  |  |  |     |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    4bec:	|  |  |  |     |  |     \-> move.w d0,d3
    4bee:	|  |  |  |     |  |         cmp.w d0,d2
    4bf0:	|  |  |  |     |  |     /-- bge.s 4bf4 <DrawLetters.isra.0+0x360>
    4bf2:	|  |  |  |     |  |     |   move.w d2,d3
    4bf4:	|  |  |  |     |  |     \-> cmp.w a1,d3
    4bf6:	|  |  |  |     |  |     /-- ble.s 4bfa <DrawLetters.isra.0+0x366>
    4bf8:	|  |  |  |     |  |     |   move.w a1,d3
    4bfa:	|  |  |  |     |  |     \-> cmp.w a0,d3
    4bfc:	|  |  |  |     |  |     /-- ble.s 4c00 <DrawLetters.isra.0+0x36c>
    4bfe:	|  |  |  |     |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    4c00:	|  |  |  |     |  |     \-> move.w d3,88(sp)
        square.XPosMin = xposmin;      
    4c04:	|  |  |  |     |  |         move.w d4,86(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    4c08:	|  |  |  |     |  |         cmp.w d0,d2
    4c0a:	|  |  |  |     |  |     /-- ble.s 4c0e <DrawLetters.isra.0+0x37a>
    4c0c:	|  |  |  |     |  |     |   move.w d2,d0
    4c0e:	|  |  |  |     |  |     \-> cmp.w a1,d0
    4c10:	|  |  |  |     |  |     /-- bge.s 4c14 <DrawLetters.isra.0+0x380>
    4c12:	|  |  |  |     |  |     |   move.w a1,d0
    4c14:	|  |  |  |     |  |     \-> cmp.w a0,d0
    4c16:	|  |  |  |     |  |     /-- bge.s 4c1a <DrawLetters.isra.0+0x386>
    4c18:	|  |  |  |     |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    4c1a:	|  |  |  |     |  |     \-> addq.w #1,d0
    4c1c:	|  |  |  |     |  |         sub.w d3,d0
    4c1e:	|  |  |  |     |  |         move.w d0,92(sp)
        if(square.Height > 1)
    4c22:	|  |  |  |     |  |         cmpi.w #1,d0
    4c26:	|  |  |  |     |  |  /----- ble.s 4c60 <DrawLetters.isra.0+0x3cc>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    4c28:	|  |  |  |     |  |  |      cmp.w d1,d7
    4c2a:	|  |  |  |     |  |  |  /-- ble.s 4c2e <DrawLetters.isra.0+0x39a>
    4c2c:	|  |  |  |     |  |  |  |   move.w d7,d1
    4c2e:	|  |  |  |     |  |  |  \-> cmp.w d1,d6
    4c30:	|  |  |  |     |  |  |  /-- ble.s 4c34 <DrawLetters.isra.0+0x3a0>
    4c32:	|  |  |  |     |  |  |  |   move.w d6,d1
    4c34:	|  |  |  |     |  |  |  \-> cmp.w d1,d5
    4c36:	|  |  |  |     |  |  |  /-- ble.s 4c3a <DrawLetters.isra.0+0x3a6>
    4c38:	|  |  |  |     |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    4c3a:	|  |  |  |     |  |  |  \-> sub.w d4,d1
    4c3c:	|  |  |  |     |  |  |      move.w d1,90(sp)
          if(square.XLength > 1) {
    4c40:	|  |  |  |     |  |  |      cmpi.w #1,d1
    4c44:	|  |  |  |     |  |  +----- ble.s 4c60 <DrawLetters.isra.0+0x3cc>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    4c46:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    4c4a:	|  |  |  |     |  |  |      move.w (a0),84(sp)
            DrawRect( &square);  
    4c4e:	|  |  |  |     |  |  |      pea 64(sp)
    4c52:	|  |  |  |     |  |  |      jsr 2964 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    4c56:	|  |  |  |     |  |  |      movea.l 52(sp),a0
    4c5a:	|  |  |  |     |  |  |      movea.w 4(a0),a5
    4c5e:	|  |  |  |     |  |  |      addq.l #4,sp
        vectors += 12;
    4c60:	|  |  |  |     |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    4c64:	|  |  |  |     |  |         addq.l #1,a3
    4c66:	|  |  |  |     |  |         movea.w a5,a0
    4c68:	|  |  |  |     |  |         cmpa.l a0,a3
    4c6a:	|  |  |  |     |  \-------- blt.w 4b22 <DrawLetters.isra.0+0x28e>
    4c6e:	|  |  |  |     |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    4c72:	|  |  |  |     |            addq.l #3,a0
    4c74:	|  |  |  |     |            adda.l a0,a0
    4c76:	|  |  |  |     |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4c78:	|  |  |  |     |            addq.l #1,44(sp)
    4c7c:	|  |  |  |     |            move.l 56(sp),d0
    4c80:	|  |  |  |     |            cmp.l 44(sp),d0
    4c84:	|  |  +--|-----|----------- bne.w 48d2 <DrawLetters.isra.0+0x3e>
    4c88:	+--|--|--|-----|----------- bra.w 4926 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4c8c:	|  |  |  |     \----------> movea.w d1,a0
    4c8e:	|  |  |  |                  addq.l #3,a0
    4c90:	|  |  |  |                  adda.l a0,a0
    4c92:	|  |  |  |                  adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4c94:	|  |  |  |                  addq.l #1,44(sp)
    4c98:	|  |  |  |                  move.l 56(sp),d0
    4c9c:	|  |  |  |                  cmp.l 44(sp),d0
    4ca0:	|  |  \--|----------------- bne.w 48d2 <DrawLetters.isra.0+0x3e>
    4ca4:	+--|-----|----------------- bra.w 4926 <DrawLetters.isra.0+0x92>
    metadata += 3 + metadata[2];    
    4ca8:	|  |     \----------------> movea.w d1,a0
    4caa:	|  |                        addq.l #3,a0
    4cac:	|  |                        adda.l a0,a0
    4cae:	|  |                        adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    4cb0:	|  |                        addq.l #1,44(sp)
    4cb4:	|  |                        move.l 56(sp),d0
    4cb8:	|  |                        cmp.l 44(sp),d0
    4cbc:	|  \----------------------- bne.w 4ab0 <DrawLetters.isra.0+0x21c>
    4cc0:	\-------------------------- bra.w 4926 <DrawLetters.isra.0+0x92>

00004cc4 <DrawDices>:
UWORD DrawDices( UWORD *cubenrreverse, WORD *lettermetadata,WORD *lettermetadatareversed, int nrofvertsletter,  int nrofvertsletterreversed, int nrofcubes, int nrofcubesreversed, int clminendpos, int nrofframes) {
    4cc4:	          movem.l d2-d3/a2,-(sp)
    4cc8:	          move.l 36(sp),d3
    4ccc:	          move.l 40(sp),d2
  ptrvector = VectorBuffer +  vectorpos;    
    4cd0:	          moveq #0,d1
    4cd2:	          move.w 7515e <vectorpos>,d1
    4cd8:	          add.l d1,d1
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    4cda:	          moveq #0,d0
    4cdc:	          move.w 7515c <VectorPosLetters>,d0
    4ce2:	          add.l d0,d0
    4ce4:	          addi.l #296940,d0
    4cea:	          move.l d0,75158 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4cf0:	          move.l d3,-(sp)
  if( nrofcubesreversed > 0) mirroring = 1;
    4cf2:	          tst.l d2
    4cf4:	          sne d0
    4cf6:	          ext.w d0
    4cf8:	          ext.l d0
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    4cfa:	          neg.l d0
    4cfc:	          move.l d0,-(sp)
    4cfe:	          addi.l #348174,d1
    4d04:	          move.l d1,-(sp)
    4d06:	          jsr 388c <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    4d0a:	          clr.l -(sp)
    4d0c:	          move.l d3,-(sp)
    4d0e:	          move.l 40(sp),-(sp)
    4d12:	          move.l 75158 <ptrvectorletters>,-(sp)
    4d18:	          lea 4894 <DrawLetters.isra.0>(pc),a2
    4d1c:	          jsr (a2)
  if( nrofcubesreversed > 0) {
    4d1e:	          lea 28(sp),sp
    4d22:	          tst.l d2
    4d24:	   /----- bne.w 4dbe <DrawDices+0xfa>
  CubeNrReversePos++;
    4d28:	/--|----> addq.w #1,3e154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    4d2e:	|  |      move.w d3,d2
    4d30:	|  |      add.w d3,d2
    4d32:	|  |      add.w d3,d2
    4d34:	|  |      lsl.w #3,d2
    4d36:	|  |      add.w 7515e <vectorpos>,d2
    4d3c:	|  |      move.w d2,7515e <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    4d42:	|  |      move.w 30(sp),d0
    4d46:	|  |      add.w d0,d0
    4d48:	|  |      add.w 30(sp),d0
    4d4c:	|  |      add.w d0,d0
    4d4e:	|  |      add.w d0,d0
    4d50:	|  |      add.w d0,7515c <VectorPosLetters>
  VectorPosLettersReversed += 4*3*nrofvertsletterreversed;
    4d56:	|  |      move.w 34(sp),d0
    4d5a:	|  |      add.w d0,d0
    4d5c:	|  |      add.w 34(sp),d0
    4d60:	|  |      add.w d0,d0
    4d62:	|  |      add.w d0,d0
    4d64:	|  |      add.w d0,7514e <VectorPosLettersReversed>
  SetCl( clminendpos);
    4d6a:	|  |      move.l 44(sp),-(sp)
    4d6e:	|  |      jsr 193e <SetCl>(pc)
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    4d72:	|  |      andi.l #65535,d2
    4d78:	|  |      move.l 52(sp),-(sp)
    4d7c:	|  |      move.l d3,-(sp)
    4d7e:	|  |      jsr 5d38 <__mulsi3>
    4d84:	|  |      move.l d0,d1
    4d86:	|  |      add.l d1,d1
    4d88:	|  |      add.l d0,d1
    4d8a:	|  |      lsl.l #3,d1
    4d8c:	|  |      lea 12(sp),sp
    4d90:	|  |      cmp.l d2,d1
    4d92:	|  |  /-- bgt.s 4db6 <DrawDices+0xf2>
    CubeNrReversePos = 1;
    4d94:	|  |  |   move.w #1,3e154 <CubeNrReversePos>
    vectorpos = 0;
    4d9c:	|  |  |   clr.w 7515e <vectorpos>
    VectorPosLetters = 0;
    4da2:	|  |  |   clr.w 7515c <VectorPosLetters>
    VectorPosLettersReversed = 0;
    4da8:	|  |  |   clr.w 7514e <VectorPosLettersReversed>
    return 1;
    4dae:	|  |  |   moveq #1,d0
}
    4db0:	|  |  |   movem.l (sp)+,d2-d3/a2
    4db4:	|  |  |   rts
    return 0;  
    4db6:	|  |  \-> clr.w d0
}
    4db8:	|  |      movem.l (sp)+,d2-d3/a2
    4dbc:	|  |      rts
    CubeNrReversePtr = cubenrreverse + CubeNrReversePos;
    4dbe:	|  \----> moveq #0,d0
    4dc0:	|         move.w 3e154 <CubeNrReversePos>,d0
    4dc6:	|         add.l d0,d0
    4dc8:	|         add.l 16(sp),d0
    4dcc:	|         move.l d0,75150 <CubeNrReversePtr>
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4dd2:	|         pea 1 <_start+0x1>
    4dd6:	|         move.l d2,-(sp)
    4dd8:	|         move.l 32(sp),-(sp)
    ptrvectorlettersreversed = LetterBuffer2 + VectorPosLettersReversed;
    4ddc:	|         moveq #0,d0
    4dde:	|         move.w 7514e <VectorPosLettersReversed>,d0
    4de4:	|         add.l d0,d0
    DrawLetters( ptrvectorlettersreversed, lettermetadatareversed,DrawBuffer,nrofcubesreversed, 1);
    4de6:	|         addi.l #257004,d0
    4dec:	|         move.l d0,-(sp)
    4dee:	|         jsr (a2)
    4df0:	|         lea 16(sp),sp
    4df4:	\-------- bra.w 4d28 <DrawDices+0x64>

00004df8 <End_PrepareDisplay.isra.0>:

int End_PrepareDisplay() {
    4df8:	          movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4dfc:	          movea.l 752e0 <SysBase>,a6
    4e02:	          move.l #1360,d0
    4e08:	          moveq #2,d1
    4e0a:	          jsr -198(a6)
    4e0e:	          movea.l d0,a2
  if( retval == 0) {
    4e10:	          tst.l d0
    4e12:	   /----- beq.w 502c <End_PrepareDisplay.isra.0+0x234>
    *cl++ = *clpartinstruction++;
    4e16:	/--|----> move.l 3e034 <End_ClsSprites>,(a2)
    4e1c:	|  |      move.l 3e038 <End_ClsSprites+0x4>,4(a2)
    4e24:	|  |      move.l 3e03c <End_ClsSprites+0x8>,8(a2)
    4e2c:	|  |      move.l 3e040 <End_ClsSprites+0xc>,12(a2)
    4e34:	|  |      move.l 3e044 <End_ClsSprites+0x10>,16(a2)
    4e3c:	|  |      move.l 3e048 <End_ClsSprites+0x14>,20(a2)
    4e44:	|  |      move.l 3e04c <End_ClsSprites+0x18>,24(a2)
    4e4c:	|  |      move.l 3e050 <End_ClsSprites+0x1c>,28(a2)
    4e54:	|  |      move.l 3e054 <End_ClsSprites+0x20>,32(a2)
    4e5c:	|  |      move.l 3e058 <End_ClsSprites+0x24>,36(a2)
    4e64:	|  |      move.l 3e05c <End_ClsSprites+0x28>,40(a2)
    4e6c:	|  |      move.l 3e060 <End_ClsSprites+0x2c>,44(a2)
    4e74:	|  |      move.l 3e064 <End_ClsSprites+0x30>,48(a2)
    4e7c:	|  |      move.l 3e068 <End_ClsSprites+0x34>,52(a2)
    4e84:	|  |      move.l 3e06c <End_ClsSprites+0x38>,56(a2)
    4e8c:	|  |      move.l 3e070 <End_ClsSprites+0x3c>,60(a2)
    *cl++ = *clpartinstruction++;
    4e94:	|  |      move.l 3e004 <End_ClScreen>,64(a2)
    4e9c:	|  |      move.l 3e008 <End_ClScreen+0x4>,68(a2)
    4ea4:	|  |      move.l 3e00c <End_ClScreen+0x8>,72(a2)
    4eac:	|  |      move.l 3e010 <End_ClScreen+0xc>,76(a2)
    4eb4:	|  |      move.l 3e014 <End_ClScreen+0x10>,80(a2)
    4ebc:	|  |      move.l 3e018 <End_ClScreen+0x14>,84(a2)
    4ec4:	|  |      move.l 3e01c <End_ClScreen+0x18>,88(a2)
    4ecc:	|  |      move.l 3e020 <End_ClScreen+0x1c>,92(a2)
    4ed4:	|  |      move.l 3e024 <End_ClScreen+0x20>,96(a2)
    4edc:	|  |      move.l 3e028 <End_ClScreen+0x24>,100(a2)
    4ee4:	|  |      move.l 3e02c <End_ClScreen+0x28>,104(a2)
    4eec:	|  |      move.l 3e030 <End_ClScreen+0x2c>,108(a2)
  *cw++ = 0x00e0;
    4ef4:	|  |      move.w #224,112(a2)
  UWORD bpl1pointerhigh = (ULONG) End_Bitmap >> 16;
    4efa:	|  |      move.l #427576,d0
    4f00:	|  |      clr.w d0
    4f02:	|  |      swap d0
    4f04:	|  |      move.w d0,114(a2)
  *cw++ = 0x00e2;
    4f08:	|  |      move.w #226,116(a2)
  *cw++ = bpl1pointerlow;
    4f0e:	|  |      move.l #427576,d0
    4f14:	|  |      move.w d0,118(a2)
  *cw++ = 0x00e4;
    4f18:	|  |      move.w #228,120(a2)
  UWORD bpl2pointerhigh = (ULONG)(End_Bitmap + 10240) >> 16;
    4f1e:	|  |      move.l #437816,d0
    4f24:	|  |      clr.w d0
    4f26:	|  |      swap d0
    4f28:	|  |      move.w d0,122(a2)
  *cw++ = 0x00e6;
    4f2c:	|  |      move.w #230,124(a2)
  *cw++ = bpl2pointerlow;
    4f32:	|  |      move.l #437816,d0
    4f38:	|  |      move.w d0,126(a2)
  *cw++ = 0x00e8;
    4f3c:	|  |      move.w #232,128(a2)
  UWORD bpl3pointerhigh = (ULONG)(End_Bitmap + 10240*2) >> 16;
    4f42:	|  |      move.l #448056,d0
    4f48:	|  |      clr.w d0
    4f4a:	|  |      swap d0
    4f4c:	|  |      move.w d0,130(a2)
  *cw++ = 0x00ea;
    4f50:	|  |      move.w #234,132(a2)
  *cw++ = bpl3pointerlow;  
    4f56:	|  |      move.l #448056,d0
    4f5c:	|  |      move.w d0,134(a2)
  *cw++ = 0x00ec;
    4f60:	|  |      move.w #236,136(a2)
  UWORD bpl4pointerhigh = (ULONG)(End_Bitmap + 10240*3) >> 16;
    4f66:	|  |      move.l #458296,d0
    4f6c:	|  |      clr.w d0
    4f6e:	|  |      swap d0
    4f70:	|  |      move.w d0,138(a2)
  *cw++ = 0x00ee;
    4f74:	|  |      move.w #238,140(a2)
  *cw++ = bpl4pointerlow;  
    4f7a:	|  |      move.l #458296,d0
    4f80:	|  |      move.w d0,142(a2)
  *cw++ = 0x00f0;
    4f84:	|  |      move.w #240,144(a2)
  UWORD bpl5pointerhigh = (ULONG)(End_Bitmap + 10240*4) >> 16;
    4f8a:	|  |      move.l #468536,d0
    4f90:	|  |      clr.w d0
    4f92:	|  |      swap d0
    4f94:	|  |      move.w d0,146(a2)
  *cw++ = 0x00f2;
    4f98:	|  |      move.w #242,148(a2)
  *cw++ = bpl5pointerlow;  
    4f9e:	|  |      move.l #468536,d0
    4fa4:	|  |      move.w d0,150(a2)
    *cl++ = *clpartinstruction++;
    4fa8:	|  |      pea 80 <main+0x1a>
    4fac:	|  |      pea 7ab8 <incbin_End_ClColor_start>
    4fb2:	|  |      pea 152(a2)
    4fb6:	|  |      jsr 5cce <memcpy>(pc)
  *cl++ = 0x20bffffe;
    4fba:	|  |      move.l #549453822,280(a2)
  *cl++ = 0x009c8010;
    4fc2:	|  |      move.l #10256400,284(a2)
  *cl++ = 0xfffffffe;
    4fca:	|  |      moveq #-2,d0
    4fcc:	|  |      move.l d0,288(a2)

  End_DrawCopper = End_ClBuild( );  
    4fd0:	|  |      move.l a2,74e3c <End_DrawCopper>

   if ((End_Vbint = AllocMem(sizeof(struct Interrupt),    
    4fd6:	|  |      movea.l 752e0 <SysBase>,a6
    4fdc:	|  |      moveq #22,d0
    4fde:	|  |      move.l #65537,d1
    4fe4:	|  |      jsr -198(a6)
    4fe8:	|  |      movea.l d0,a1
    4fea:	|  |      lea 12(sp),sp
    4fee:	|  |      tst.l d0
    4ff0:	|  |  /-- beq.s 500c <End_PrepareDisplay.isra.0+0x214>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    End_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    4ff2:	|  |  |   move.w #708,8(a1)
    End_Vbint->is_Node.ln_Pri = -60;
    End_Vbint->is_Node.ln_Name = "VertB-Example";
    4ff8:	|  |  |   move.l #225278,10(a1)
    End_Vbint->is_Data = NULL;
    5000:	|  |  |   clr.l 14(a1)
    End_Vbint->is_Code = End_VblankHandler;
    5004:	|  |  |   move.l #6448,18(a1)
  }

  AddIntServer( INTB_COPER, End_Vbint);
    500c:	|  |  \-> movea.l 752e0 <SysBase>,a6
    5012:	|  |      moveq #4,d0
    5014:	|  |      jsr -168(a6)
void End_Cleanup() {
  RemIntServer( INTB_COPER, End_Vbint);
}

void End_SetCl() {
  custom->cop1lc = (ULONG) End_DrawCopper;
    5018:	|  |      movea.l 752dc <custom>,a0
    501e:	|  |      move.l 74e3c <End_DrawCopper>,128(a0)
}
    5026:	|  |      movem.l (sp)+,d2-d3/a2/a6
    502a:	|  |      rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    502c:	|  \----> movea.l 752d4 <DOSBase>,a6
    5032:	|         jsr -60(a6)
    5036:	|         movea.l 752d4 <DOSBase>,a6
    503c:	|         move.l d0,d1
    503e:	|         move.l #224803,d2
    5044:	|         moveq #40,d3
    5046:	|         jsr -48(a6)
    Exit(1);
    504a:	|         movea.l 752d4 <DOSBase>,a6
    5050:	|         moveq #1,d1
    5052:	|         jsr -144(a6)
    5056:	\-------- bra.w 4e16 <End_PrepareDisplay.isra.0+0x1e>

0000505a <Sw_PrepareDisplay.isra.0>:
int Sw_PrepareDisplay() {
    505a:	                   link.w a5,#-52
    505e:	                   movem.l d2-d3/a2-a3/a6,-(sp)
  SwScrollerFinished = 0;
    5062:	                   clr.w 752d2 <SwScrollerFinished>

void debug_register_palette(const void* addr, const char* name, short numEntries, unsigned short flags) {
	struct debug_resource resource = {
    5068:	                   clr.l -42(a5)
    506c:	                   clr.l -38(a5)
    5070:	                   clr.l -34(a5)
    5074:	                   clr.l -30(a5)
    5078:	                   clr.l -26(a5)
    507c:	                   clr.l -22(a5)
    5080:	                   clr.l -18(a5)
    5084:	                   clr.l -14(a5)
    5088:	                   clr.l -10(a5)
    508c:	                   clr.l -6(a5)
    5090:	                   clr.w -2(a5)
    5094:	                   move.l #253952,-50(a5)
    509c:	                   moveq #4,d0
    509e:	                   move.l d0,-46(a5)
    50a2:	                   move.w #1,-10(a5)
    50a8:	                   move.w #2,-6(a5)
	while(*source && --num > 0)
    50ae:	                   moveq #100,d0
	struct debug_resource resource = {
    50b0:	                   lea -42(a5),a0
    50b4:	                   lea 3700c <incbin_MercuryLetterData2Lz4_end+0x1ea>,a1
	while(*source && --num > 0)
    50ba:	                   lea -11(a5),a2
		*destination++ = *source++;
    50be:	            /----> addq.l #1,a1
    50c0:	            |      move.b d0,(a0)+
	while(*source && --num > 0)
    50c2:	            |      move.b (a1),d0
    50c4:	            |  /-- beq.s 50ca <Sw_PrepareDisplay.isra.0+0x70>
    50c6:	            |  |   cmpa.l a0,a2
    50c8:	            \--|-- bne.s 50be <Sw_PrepareDisplay.isra.0+0x64>
	*destination = '\0';
    50ca:	               \-> clr.b (a0)
	if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
    50cc:	                   move.w f0ff60 <_end+0xe9ac7c>,d0
    50d2:	                   cmpi.w #20153,d0
    50d6:	            /----- beq.w 523c <Sw_PrepareDisplay.isra.0+0x1e2>
    50da:	            |      cmpi.w #-24562,d0
    50de:	            +----- beq.w 523c <Sw_PrepareDisplay.isra.0+0x1e2>
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    50e2:	            |      movea.l 752e0 <SysBase>,a6
    50e8:	            |      move.l #4000,d0
    50ee:	            |      moveq #2,d1
    50f0:	            |      jsr -198(a6)
    50f4:	            |      move.l d0,751d2 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    50fa:	            |      pea 1 <_start+0x1>
    50fe:	            |      pea 32 <_start+0x32>
    5102:	            |      pea 37016 <incbin_MercuryLetterData2Lz4_end+0x1f4>
    5108:	            |      move.l d0,-(sp)
    510a:	            |      lea 47dc <debug_register_bitmap.constprop.0>(pc),a3
    510e:	            |      jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    5110:	            |      pea 14 <_start+0x14>
    5114:	            |      pea 32 <_start+0x32>
    5118:	            |      move.l 751d2 <Sw_FontBuffer>,-(sp)
    511e:	            |      lea cd0 <Utils_FillLong.constprop.0>(pc),a2
    5122:	            |      jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5124:	            |      movea.l 752e0 <SysBase>,a6
    512a:	            |      move.l #20560,d0
    5130:	            |      moveq #2,d1
    5132:	            |      jsr -198(a6)
    5136:	            |      move.l d0,751d6 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    513c:	            |      lea 28(sp),sp
    5140:	      /-----|----- beq.w 52ee <Sw_PrepareDisplay.isra.0+0x294>
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    5144:	      |  /--|----> pea 1 <_start+0x1>
    5148:	      |  |  |      pea 101 <main+0x9b>
    514c:	      |  |  |      pea 3704c <incbin_MercuryLetterData2Lz4_end+0x22a>
    5152:	      |  |  |      move.l d0,-(sp)
    5154:	      |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    5156:	      |  |  |      pea 14 <_start+0x14>
    515a:	      |  |  |      pea 100 <main+0x9a>
    515e:	      |  |  |      move.l 751d6 <Sw_ScreenBuffer2>,-(sp)
    5164:	      |  |  |      jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5166:	      |  |  |      movea.l 752e0 <SysBase>,a6
    516c:	      |  |  |      move.l #20560,d0
    5172:	      |  |  |      moveq #2,d1
    5174:	      |  |  |      jsr -198(a6)
    5178:	      |  |  |      move.l d0,751da <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    517e:	      |  |  |      lea 28(sp),sp
    5182:	/-----|--|--|----- beq.w 52ba <Sw_PrepareDisplay.isra.0+0x260>
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    5186:	|  /--|--|--|----> pea 1 <_start+0x1>
    518a:	|  |  |  |  |      pea 101 <main+0x9b>
    518e:	|  |  |  |  |      pea 3705e <incbin_MercuryLetterData2Lz4_end+0x23c>
    5194:	|  |  |  |  |      move.l d0,-(sp)
    5196:	|  |  |  |  |      jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer1, 0, 256, 20,0);  
    5198:	|  |  |  |  |      pea 14 <_start+0x14>
    519c:	|  |  |  |  |      pea 100 <main+0x9a>
    51a0:	|  |  |  |  |      move.l 751da <Sw_ScreenBuffer1>,-(sp)
    51a6:	|  |  |  |  |      jsr (a2)
  Sw_ViewCopper = Sw_ClBuild( );
    51a8:	|  |  |  |  |      lea 115c <Sw_ClBuild>(pc),a2
    51ac:	|  |  |  |  |      jsr (a2)
  Sw_DrawCopper = Sw_ClBuild( );
    51ae:	|  |  |  |  |      jsr (a2)
    51b0:	|  |  |  |  |      move.l d0,75164 <Sw_DrawCopper>

void Sw_SwapCl() {
  custom->cop1lc = (ULONG) Sw_DrawCopper;
    51b6:	|  |  |  |  |      movea.l 752dc <custom>,a0
    51bc:	|  |  |  |  |      move.l d0,128(a0)
  if ((Sw_Vbint = AllocMem(sizeof(struct Interrupt),    
    51c0:	|  |  |  |  |      movea.l 752e0 <SysBase>,a6
    51c6:	|  |  |  |  |      moveq #22,d0
    51c8:	|  |  |  |  |      move.l #65537,d1
    51ce:	|  |  |  |  |      jsr -198(a6)
    51d2:	|  |  |  |  |      movea.l d0,a1
    51d4:	|  |  |  |  |      move.l d0,751be <Sw_Vbint>
    51da:	|  |  |  |  |      lea 28(sp),sp
    51de:	|  |  |  |  |  /-- beq.s 51fa <Sw_PrepareDisplay.isra.0+0x1a0>
    Sw_Vbint->is_Node.ln_Type = NT_INTERRUPT;       
    51e0:	|  |  |  |  |  |   move.w #708,8(a1)
    Sw_Vbint->is_Node.ln_Name = "VertB-Example";
    51e6:	|  |  |  |  |  |   move.l #225278,10(a1)
    Sw_Vbint->is_Data = NULL;
    51ee:	|  |  |  |  |  |   clr.l 14(a1)
    Sw_Vbint->is_Code = Sw_VblankHandler;
    51f2:	|  |  |  |  |  |   move.l #6318,18(a1)
  AddIntServer( INTB_COPER, Sw_Vbint);
    51fa:	|  |  |  |  |  \-> movea.l 752e0 <SysBase>,a6
    5200:	|  |  |  |  |      moveq #4,d0
    5202:	|  |  |  |  |      jsr -168(a6)
  Sw_ScreenBufferList[0] = Sw_ScreenBuffer1;
    5206:	|  |  |  |  |      move.l 751da <Sw_ScreenBuffer1>,d0
    520c:	|  |  |  |  |      move.l d0,75168 <Sw_ScreenBufferList>
  Sw_ScreenBufferList[1] = Sw_ScreenBuffer2;    
    5212:	|  |  |  |  |      move.l 751d6 <Sw_ScreenBuffer2>,d1
    5218:	|  |  |  |  |      move.l d1,7516c <Sw_ScreenBufferList+0x4>
  Sw_ScreenBufferList[2] = Sw_ScreenBuffer2;
    521e:	|  |  |  |  |      move.l d1,75170 <Sw_ScreenBufferList+0x8>
  Sw_ScreenBufferList[3] = Sw_ScreenBuffer1;   
    5224:	|  |  |  |  |      move.l d0,75174 <Sw_ScreenBufferList+0xc>
  Sw_InitComplete = 1;
    522a:	|  |  |  |  |      move.w #1,751a6 <Sw_InitComplete>
}
    5232:	|  |  |  |  |      movem.l -72(a5),d2-d3/a2-a3/a6
    5238:	|  |  |  |  |      unlk a5
    523a:	|  |  |  |  |      rts
		UaeLib(88, arg1, arg2, arg3, arg4);
    523c:	|  |  |  |  \----> clr.l -(sp)
    523e:	|  |  |  |         clr.l -(sp)
    5240:	|  |  |  |         pea -50(a5)
    5244:	|  |  |  |         pea 4 <_start+0x4>
    5248:	|  |  |  |         pea 58 <_start+0x58>
    524c:	|  |  |  |         jsr f0ff60 <_end+0xe9ac7c>
}
    5252:	|  |  |  |         lea 20(sp),sp
  Sw_FontBuffer = AllocMem( 80*50, MEMF_CHIP);  
    5256:	|  |  |  |         movea.l 752e0 <SysBase>,a6
    525c:	|  |  |  |         move.l #4000,d0
    5262:	|  |  |  |         moveq #2,d1
    5264:	|  |  |  |         jsr -198(a6)
    5268:	|  |  |  |         move.l d0,751d2 <Sw_FontBuffer>
  debug_register_bitmap( Sw_FontBuffer, "fontbuffer.bpl", 512, 50, 1, 0);
    526e:	|  |  |  |         pea 1 <_start+0x1>
    5272:	|  |  |  |         pea 32 <_start+0x32>
    5276:	|  |  |  |         pea 37016 <incbin_MercuryLetterData2Lz4_end+0x1f4>
    527c:	|  |  |  |         move.l d0,-(sp)
    527e:	|  |  |  |         lea 47dc <debug_register_bitmap.constprop.0>(pc),a3
    5282:	|  |  |  |         jsr (a3)
  Utils_FillLong( (ULONG *)Sw_FontBuffer, 0x0, 50, 20,0);   
    5284:	|  |  |  |         pea 14 <_start+0x14>
    5288:	|  |  |  |         pea 32 <_start+0x32>
    528c:	|  |  |  |         move.l 751d2 <Sw_FontBuffer>,-(sp)
    5292:	|  |  |  |         lea cd0 <Utils_FillLong.constprop.0>(pc),a2
    5296:	|  |  |  |         jsr (a2)
  Sw_ScreenBuffer2 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5298:	|  |  |  |         movea.l 752e0 <SysBase>,a6
    529e:	|  |  |  |         move.l #20560,d0
    52a4:	|  |  |  |         moveq #2,d1
    52a6:	|  |  |  |         jsr -198(a6)
    52aa:	|  |  |  |         move.l d0,751d6 <Sw_ScreenBuffer2>
  if(Sw_ScreenBuffer2 == 0) {
    52b0:	|  |  |  |         lea 28(sp),sp
    52b4:	|  |  |  \-------- bne.w 5144 <Sw_PrepareDisplay.isra.0+0xea>
    52b8:	|  |  +----------- bra.s 52ee <Sw_PrepareDisplay.isra.0+0x294>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    52ba:	>--|--|----------> movea.l 752d4 <DOSBase>,a6
    52c0:	|  |  |            jsr -60(a6)
    52c4:	|  |  |            movea.l 752d4 <DOSBase>,a6
    52ca:	|  |  |            move.l d0,d1
    52cc:	|  |  |            move.l #225317,d2
    52d2:	|  |  |            moveq #38,d3
    52d4:	|  |  |            jsr -48(a6)
    Exit(1);
    52d8:	|  |  |            movea.l 752d4 <DOSBase>,a6
    52de:	|  |  |            moveq #1,d1
    52e0:	|  |  |            jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer1, "screenbuffer1.bpl", 512, 257, 1, 0);
    52e4:	|  |  |            move.l 751da <Sw_ScreenBuffer1>,d0
    52ea:	|  +--|----------- bra.w 5186 <Sw_PrepareDisplay.isra.0+0x12c>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    52ee:	|  |  \----------> movea.l 752d4 <DOSBase>,a6
    52f4:	|  |               jsr -60(a6)
    52f8:	|  |               movea.l 752d4 <DOSBase>,a6
    52fe:	|  |               move.l d0,d1
    5300:	|  |               move.l #225317,d2
    5306:	|  |               moveq #38,d3
    5308:	|  |               jsr -48(a6)
    Exit(1);
    530c:	|  |               movea.l 752d4 <DOSBase>,a6
    5312:	|  |               moveq #1,d1
    5314:	|  |               jsr -144(a6)
  debug_register_bitmap( Sw_ScreenBuffer2, "screenbuffer2.bpl", 512, 257, 1, 0);
    5318:	|  |               move.l 751d6 <Sw_ScreenBuffer2>,d0
    531e:	|  |               pea 1 <_start+0x1>
    5322:	|  |               pea 101 <main+0x9b>
    5326:	|  |               pea 3704c <incbin_MercuryLetterData2Lz4_end+0x22a>
    532c:	|  |               move.l d0,-(sp)
    532e:	|  |               jsr (a3)
  Utils_FillLong( (ULONG *) Sw_ScreenBuffer2, 0, 256, 20,0);  
    5330:	|  |               pea 14 <_start+0x14>
    5334:	|  |               pea 100 <main+0x9a>
    5338:	|  |               move.l 751d6 <Sw_ScreenBuffer2>,-(sp)
    533e:	|  |               jsr (a2)
  Sw_ScreenBuffer1 = AllocMem(BPLSIZE*BPLDEPTH, MEMF_CHIP);
    5340:	|  |               movea.l 752e0 <SysBase>,a6
    5346:	|  |               move.l #20560,d0
    534c:	|  |               moveq #2,d1
    534e:	|  |               jsr -198(a6)
    5352:	|  |               move.l d0,751da <Sw_ScreenBuffer1>
  if(Sw_ScreenBuffer1 == 0) {
    5358:	|  |               lea 28(sp),sp
    535c:	|  \-------------- bne.w 5186 <Sw_PrepareDisplay.isra.0+0x12c>
    5360:	\----------------- bra.w 52ba <Sw_PrepareDisplay.isra.0+0x260>

00005364 <DrawScreen>:
{    
    5364:	                   lea -44(sp),sp
    5368:	                   movem.l d2-d7/a2-a6,-(sp)
  WaitBlit();
    536c:	                   movea.l 752d8 <GfxBase>,a6
    5372:	                   jsr -228(a6)
  custom->bltafwm = 0xffff; //Static
    5376:	                   move.w #-1,dff044 <_end+0xd89d60>
  custom->bltalwm = 0xffff; //Static
    537e:	                   move.w #-1,dff046 <_end+0xd89d62>
  switch(Scene) {
    5386:	                   cmpi.w #18,5eed6 <Scene>
    538e:	         /-------- bhi.s 5402 <DrawScreen+0x9e>
    5390:	         |         moveq #0,d0
    5392:	         |         move.w 5eed6 <Scene>,d0
    5398:	         |         add.l d0,d0
    539a:	         |         move.w (53a2 <DrawScreen+0x3e>,pc,d0.l),d0
    539e:	         |         jmp (53a2 <DrawScreen+0x3e>,pc,d0.w)
    53a2:	         |         ori.w #124,-(a0)
    53a6:	         |         ([,0)andi.b #-58,([0,a6],d0.w:2,0)
    53ac:	         |         ([,1104)bchg d1,([1046,d0.w:2],1104)
    53b4:	         |         .short 0x04e0
    53b6:	         |         btst d2,(a6)+
    53b8:	         |         movep.w d2,1476(a2)
    53bc:	         |         ori.b #84,-(a6)
    53c0:	         |         ori.l #113248044,6a <main+0x4>
      result = DrawDices( CubeNrReverseSizeAbyss, LetterMetaDataAbyss, LetterMetaDataReversedAbyss, 9, 6, 3, 2, 1, 208);
    53c8:	         |         pea d0 <main+0x6a>
    53cc:	         |         pea 1 <_start+0x1>
    53d0:	         |         pea 2 <_start+0x2>
    53d4:	         |         pea 3 <_start+0x3>
    53d8:	         |         pea 6 <_start+0x6>
    53dc:	         |         pea 9 <_start+0x9>
    53e0:	         |         pea 3e1b6 <LetterMetaDataReversedAbyss>
    53e6:	         |         pea 3e1ce <LetterMetaDataAbyss>
    53ec:	         |         pea 3e1f2 <CubeNrReverseSizeAbyss>
    53f2:	         |         jsr 4cc4 <DrawDices>(pc)
      break;  
    53f6:	         |         lea 36(sp),sp
  if(result == 1) Scene++;
    53fa:	         |         cmpi.w #1,d0
    53fe:	         |  /----- beq.w 55c8 <DrawScreen+0x264>
}
    5402:	         >--|----> movem.l (sp)+,d2-d7/a2-a6
    5406:	         |  |      lea 44(sp),sp
    540a:	         |  |      rts
      CubeFinished = 1;
    540c:	         |  |      move.w #1,752ce <CubeFinished>
}
    5414:	         |  |      movem.l (sp)+,d2-d7/a2-a6
    5418:	         |  |      lea 44(sp),sp
    541c:	         |  |      rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataSpread1, LetterMetaDataReversedSpread, 10, 8, 3, 3, 1, 195);
    541e:	         |  |      pea c3 <main+0x5d>
    5422:	         |  |      pea 1 <_start+0x1>
    5426:	         |  |      pea 3 <_start+0x3>
    542a:	         |  |      pea 3 <_start+0x3>
    542e:	         |  |      pea 8 <_start+0x8>
    5432:	         |  |      pea a <_start+0xa>
    5436:	         |  |      pea 5ecec <LetterMetaDataReversedSpread>
    543c:	         |  |      pea 5ed0e <LetterMetaDataSpread1>
    5442:	         |  |      pea 5ed34 <CubeNrReverseSizeSpread>
    5448:	         |  |      jsr 4cc4 <DrawDices>(pc)
      break;
    544c:	         |  |      lea 36(sp),sp
  if(result == 1) Scene++;
    5450:	         |  |      cmpi.w #1,d0
    5454:	         +--|----- bne.s 5402 <DrawScreen+0x9e>
    5456:	         |  +----- bra.w 55c8 <DrawScreen+0x264>
  ptrvector = VectorBuffer +  vectorpos;    
    545a:	         |  |      moveq #0,d0
    545c:	         |  |      move.w 7515e <vectorpos>,d0
    5462:	         |  |      add.l d0,d0
  ptrvectorletters = LetterBuffer + VectorPosLetters;
    5464:	         |  |      moveq #0,d1
    5466:	         |  |      move.w 7515c <VectorPosLetters>,d1
    546c:	         |  |      add.l d1,d1
    546e:	         |  |      addi.l #296940,d1
    5474:	         |  |      move.l d1,75158 <ptrvectorletters>
  DrawCube3d( ptrvector, mirroring, nrofcubes);      
    547a:	         |  |      pea 4 <_start+0x4>
    547e:	         |  |      clr.l -(sp)
    5480:	         |  |      addi.l #348174,d0
    5486:	         |  |      move.l d0,-(sp)
    5488:	         |  |      jsr 388c <DrawCube3d>(pc)
  DrawLetters( ptrvectorletters, lettermetadata, DrawBuffer,nrofcubes, 0);
    548c:	         |  |      movea.l 75158 <ptrvectorletters>,a2
    5492:	         |  |      lea 12(sp),sp
    5496:	         |  |      moveq #4,d0
    5498:	         |  |      move.l d0,44(sp)
    549c:	         |  |      lea 3e184 <LetterMetaDataMercury1>,a5
    54a2:	         |  |      lea 3bfa6 <zMult>,a4
    square.DotProduct = Cubes[cubenr].Squares[facenr].DotProduct;  
    54a8:	/--------|--|----> moveq #0,d0
    54aa:	|        |  |      move.w (a5),d0
    54ac:	|        |  |      moveq #0,d1
    54ae:	|        |  |      move.w 2(a5),d1
    54b2:	|        |  |      movea.l d1,a0
    54b4:	|        |  |      move.l d0,d1
    54b6:	|        |  |      add.l d0,d1
    54b8:	|        |  |      add.l d1,d0
    54ba:	|        |  |      add.l d0,d0
    54bc:	|        |  |      adda.l d0,a0
    54be:	|        |  |      move.l a0,d2
    54c0:	|        |  |      lsl.l #5,d2
    54c2:	|        |  |      movea.l d2,a0
    54c4:	|        |  |      adda.l #478788,a0
    54ca:	|        |  |      move.l 16(a0),d0
    54ce:	|        |  |      move.l d0,72(sp)
      for(int i=0;i<metadata[2];i++)
    54d2:	|        |  |      move.w 4(a5),d1
    if( square.DotProduct > 1) 
    54d6:	|        |  |      moveq #1,d3
    54d8:	|        |  |      cmp.l d0,d3
    54da:	|        |  |  /-- blt.w 5b08 <DrawScreen+0x7a4>
      vectors += 12*metadata[2];
    54de:	|        |  |  |   movea.w d1,a0
    54e0:	|        |  |  |   move.l a0,d0
    54e2:	|        |  |  |   add.l a0,d0
    54e4:	|        |  |  |   add.l a0,d0
    54e6:	|        |  |  |   lsl.l #3,d0
    54e8:	|        |  |  |   adda.l d0,a2
    metadata += 3 + metadata[2];    
    54ea:	|        |  |  |   addq.l #3,a0
    54ec:	|        |  |  |   adda.l a0,a0
    54ee:	|        |  |  |   adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    54f0:	|        |  |  |   subq.l #1,44(sp)
    54f4:	+--------|--|--|-- bne.s 54a8 <DrawScreen+0x144>
  CubeNrReversePos++;
    54f6:	|  /-----|--|--|-> addq.w #1,3e154 <CubeNrReversePos>
  vectorpos += 3*8*nrofcubes;
    54fc:	|  |     |  |  |   move.w 7515e <vectorpos>,d2
    5502:	|  |     |  |  |   addi.w #96,d2
    5506:	|  |     |  |  |   move.w d2,7515e <vectorpos>
  VectorPosLetters += 4*3*nrofvertsletter;
    550c:	|  |     |  |  |   addi.w #156,7515c <VectorPosLetters>
  SetCl( clminendpos);
    5514:	|  |     |  |  |   pea 1 <_start+0x1>
    5518:	|  |     |  |  |   jsr 193e <SetCl>(pc)
  if(vectorpos >= 8*3*133*4)
    551c:	|  |     |  |  |   addq.l #4,sp
    551e:	|  |     |  |  |   cmpi.w #12767,d2
    5522:	|  |     +--|--|-- bls.w 5402 <DrawScreen+0x9e>
    DoNotClearDirty = 1;
    5526:	|  |     |  |  |   move.w #1,7514c <DoNotClearDirty>
  if(vectorpos >= 8*3*nrofframes*nrofcubes) 
    552e:	|  |     |  |  |   cmpi.w #12959,d2
    5532:	|  |     +--|--|-- bls.w 5402 <DrawScreen+0x9e>
    ClearBuffer->MyDirtyArea[0].Address = 0;
    5536:	|  |     |  |  |   movea.l 75148 <ClearBuffer>,a2
    553c:	|  |     |  |  |   clr.l 4(a2)
    ClearBuffer->MyDirtyArea[1].Address = 0;
    5540:	|  |     |  |  |   clr.l 16(a2)
    ClearBuffer->MyDirtyArea[2].Address = 0;
    5544:	|  |     |  |  |   clr.l 28(a2)
    ClearBuffer->MyDirtyArea[3].Address = 0;    
    5548:	|  |     |  |  |   clr.l 40(a2)
    DrawBuffer->MyDirtyArea[0].Address = 0;
    554c:	|  |     |  |  |   movea.l 75154 <DrawBuffer>,a1
    5552:	|  |     |  |  |   clr.l 4(a1)
    DrawBuffer->MyDirtyArea[1].Address = 0;
    5556:	|  |     |  |  |   clr.l 16(a1)
    DrawBuffer->MyDirtyArea[2].Address = 0;
    555a:	|  |     |  |  |   clr.l 28(a1)
    DrawBuffer->MyDirtyArea[3].Address = 0;    
    555e:	|  |     |  |  |   clr.l 40(a1)
    ViewBuffer->MyDirtyArea[0].Address = 0;
    5562:	|  |     |  |  |   movea.l 75144 <ViewBuffer>,a0
    5568:	|  |     |  |  |   clr.l 4(a0)
    ViewBuffer->MyDirtyArea[1].Address = 0;
    556c:	|  |     |  |  |   clr.l 16(a0)
    ViewBuffer->MyDirtyArea[2].Address = 0;
    5570:	|  |     |  |  |   clr.l 28(a0)
    ViewBuffer->MyDirtyArea[3].Address = 0;     
    5574:	|  |     |  |  |   clr.l 40(a0)
    ClearBuffer->MyDirtyArea[0].AddressRev = 0;
    5578:	|  |     |  |  |   clr.l 8(a2)
    ClearBuffer->MyDirtyArea[1].AddressRev = 0;
    557c:	|  |     |  |  |   clr.l 20(a2)
    ClearBuffer->MyDirtyArea[2].AddressRev = 0;
    5580:	|  |     |  |  |   clr.l 32(a2)
    ClearBuffer->MyDirtyArea[3].AddressRev = 0;    
    5584:	|  |     |  |  |   clr.l 44(a2)
    DrawBuffer->MyDirtyArea[0].AddressRev = 0;
    5588:	|  |     |  |  |   clr.l 8(a1)
    DrawBuffer->MyDirtyArea[1].AddressRev = 0;
    558c:	|  |     |  |  |   clr.l 20(a1)
    DrawBuffer->MyDirtyArea[2].AddressRev = 0;
    5590:	|  |     |  |  |   clr.l 32(a1)
    DrawBuffer->MyDirtyArea[3].AddressRev = 0;    
    5594:	|  |     |  |  |   clr.l 44(a1)
    ViewBuffer->MyDirtyArea[0].AddressRev = 0;
    5598:	|  |     |  |  |   clr.l 8(a0)
    ViewBuffer->MyDirtyArea[1].AddressRev = 0;
    559c:	|  |     |  |  |   clr.l 20(a0)
    ViewBuffer->MyDirtyArea[2].AddressRev = 0;
    55a0:	|  |     |  |  |   clr.l 32(a0)
    ViewBuffer->MyDirtyArea[3].AddressRev = 0;    
    55a4:	|  |     |  |  |   clr.l 44(a0)
    DoNotClearDirty = 0;    
    55a8:	|  |     |  |  |   clr.w 7514c <DoNotClearDirty>
    CubeNrReversePos = 1;
    55ae:	|  |     |  |  |   move.w #1,3e154 <CubeNrReversePos>
    vectorpos = 0;
    55b6:	|  |     |  |  |   clr.w 7515e <vectorpos>
    VectorPosLetters = 0;
    55bc:	|  |     |  |  |   clr.w 7515c <VectorPosLetters>
    VectorPosLettersReversed = 0;
    55c2:	|  |     |  |  |   clr.w 7514e <VectorPosLettersReversed>
  if(result == 1) Scene++;
    55c8:	|  |     |  >--|-> addq.w #1,5eed6 <Scene>
}
    55ce:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    55d2:	|  |     |  |  |   lea 44(sp),sp
    55d6:	|  |     |  |  |   rts
     Utils_Lz4DepackAsm( PointCubeDataLz4, WorkingMem, 11224);
    55d8:	|  |     |  |  |   pea 2bd8 <DrawRect+0x274>
    55dc:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    55e2:	|  |     |  |  |   pea 19e52 <incbin_PointCubeDataLz4_start>
    55e8:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    55ec:	|  |     |  |  |   jsr (a3)
     LoadVectors( PointCubeData, WorkingMem, VectorBuffer);   
    55ee:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    55f4:	|  |     |  |  |   pea 5500e <VectorBuffer>
    55fa:	|  |     |  |  |   move.l d2,-(sp)
    55fc:	|  |     |  |  |   pea 19dbe <incbin_PointCubeData_start>
    5602:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    5606:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointLetterDataLz4, WorkingMem, 9502);   
    5608:	|  |     |  |  |   pea 251e <Clbuild+0x28>
    560c:	|  |     |  |  |   move.l d2,-(sp)
    560e:	|  |     |  |  |   pea 1cad2 <incbin_PointLetterDataLz4_start>
    5614:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointLetterData, WorkingMem, LetterBuffer);
    5616:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    561c:	|  |     |  |  |   lea 32(sp),sp
    5620:	|  |     |  |  |   move.l #296940,(sp)
    5626:	|  |     |  |  |   move.l d2,-(sp)
    5628:	|  |     |  |  |   pea 1ca3e <incbin_PointLetterData_start>
    562e:	|  |     |  |  |   jsr (a2)
     Utils_Lz4DepackAsm( PointReversedLetterDataLz4, WorkingMem, 8408);   
    5630:	|  |     |  |  |   pea 20d8 <SetCl+0x79a>
    5634:	|  |     |  |  |   move.l d2,-(sp)
    5636:	|  |     |  |  |   pea 1f080 <incbin_PointReversedLetterDataLz4_start>
    563c:	|  |     |  |  |   jsr (a3)
     LoadVectors(PointReversedLetterData, WorkingMem, LetterBuffer2);
    563e:	|  |     |  |  |   pea 3ebec <LetterBuffer2>
    5644:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    564a:	|  |     |  |  |   pea 1f004 <incbin_PointReversedLetterData_start>
    5650:	|  |     |  |  |   jsr (a2)
     Scene = 3;
    5652:	|  |     |  |  |   move.w #3,5eed6 <Scene>
    565a:	|  |     |  |  |   lea 36(sp),sp
}
    565e:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5662:	|  |     |  |  |   lea 44(sp),sp
    5666:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizePoint, LetterMetaDataPoint, LetterMetaDataReversedPoint, 6, 5, 3, 2, 1, 212);
    5668:	|  |     |  |  |   pea d4 <main+0x6e>
    566c:	|  |     |  |  |   pea 1 <_start+0x1>
    5670:	|  |     |  |  |   pea 2 <_start+0x2>
    5674:	|  |     |  |  |   pea 3 <_start+0x3>
    5678:	|  |     |  |  |   pea 5 <_start+0x5>
    567c:	|  |     |  |  |   pea 6 <_start+0x6>
    5680:	|  |     |  |  |   pea 3e9b6 <LetterMetaDataReversedPoint>
    5686:	|  |     |  |  |   pea 3e9cc <LetterMetaDataPoint>
    568c:	|  |     |  |  |   pea 3e9ea <CubeNrReverseSizePoint>
    5692:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    5696:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    569a:	|  |     |  |  |   cmpi.w #1,d0
    569e:	|  |     +--|--|-- bne.w 5402 <DrawScreen+0x9e>
    56a2:	|  |     |  +--|-- bra.w 55c8 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( TekCubeDataLz4, WorkingMem, 9421);
    56a6:	|  |     |  |  |   pea 24cd <LoadVectors+0x10b>
    56aa:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    56b0:	|  |     |  |  |   pea 14d74 <incbin_TekCubeDataLz4_start>
    56b6:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    56ba:	|  |     |  |  |   jsr (a3)
      LoadVectors( TekCubeData, WorkingMem, VectorBuffer);   
    56bc:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    56c2:	|  |     |  |  |   pea 5500e <VectorBuffer>
    56c8:	|  |     |  |  |   move.l d2,-(sp)
    56ca:	|  |     |  |  |   pea 14ce0 <incbin_TekCubeData_start>
    56d0:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    56d4:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( TekLetterDataLz4, WorkingMem, 10895);   
    56d6:	|  |     |  |  |   pea 2a8f <DrawRect+0x12b>
    56da:	|  |     |  |  |   move.l d2,-(sp)
    56dc:	|  |     |  |  |   pea 1731a <incbin_TekLetterDataLz4_start>
    56e2:	|  |     |  |  |   jsr (a3)
      LoadVectors(TekLetterData, WorkingMem, LetterBuffer);      
    56e4:	|  |     |  |  |   lea 32(sp),sp
    56e8:	|  |     |  |  |   move.l #296940,(sp)
    56ee:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    56f4:	|  |     |  |  |   pea 17256 <incbin_TekLetterData_start>
    56fa:	|  |     |  |  |   jsr (a2)
      Scene = 5;
    56fc:	|  |     |  |  |   move.w #5,5eed6 <Scene>
    5704:	|  |     |  |  |   lea 12(sp),sp
}
    5708:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    570c:	|  |     |  |  |   lea 44(sp),sp
    5710:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeTek, LetterMetaDataTek, LetterMetaDataTek, 8, 0, 3, 0, 1, 152);
    5712:	|  |     |  |  |   pea 98 <main+0x32>
    5716:	|  |     |  |  |   pea 1 <_start+0x1>
    571a:	|  |     |  |  |   clr.l -(sp)
    571c:	|  |     |  |  |   pea 3 <_start+0x3>
    5720:	|  |     |  |  |   clr.l -(sp)
    5722:	|  |     |  |  |   pea 8 <_start+0x8>
    5726:	|  |     |  |  |   pea 3e78c <LetterMetaDataTek>
    572c:	|  |     |  |  |   pea 3e78c <LetterMetaDataTek>
    5732:	|  |     |  |  |   pea 3e7ae <CubeNrReverseSizeTek>
    5738:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    573c:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5740:	|  |     |  |  |   cmpi.w #1,d0
    5744:	|  |     +--|--|-- bne.w 5402 <DrawScreen+0x9e>
    5748:	|  |     |  +--|-- bra.w 55c8 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( FlexCubeDataLz4, WorkingMem, 11238);
    574c:	|  |     |  |  |   pea 2be6 <DrawRect+0x282>
    5750:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5756:	|  |     |  |  |   pea 21230 <incbin_FlexCubeDataLz4_start>
    575c:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    5760:	|  |     |  |  |   jsr (a3)
      LoadVectors( FlexCubeData, WorkingMem, VectorBuffer);   
    5762:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    5768:	|  |     |  |  |   pea 5500e <VectorBuffer>
    576e:	|  |     |  |  |   move.l d2,-(sp)
    5770:	|  |     |  |  |   pea 2116c <incbin_FlexCubeData_start>
    5776:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    577a:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( FlexLetterDataLz4, WorkingMem, 12449);   
    577c:	|  |     |  |  |   pea 30a1 <DrawRect+0x73d>
    5780:	|  |     |  |  |   move.l d2,-(sp)
    5782:	|  |     |  |  |   pea 23f1e <incbin_FlexLetterDataLz4_start>
    5788:	|  |     |  |  |   jsr (a3)
      LoadVectors(FlexLetterData, WorkingMem, LetterBuffer);
    578a:	|  |     |  |  |   lea 32(sp),sp
    578e:	|  |     |  |  |   move.l #296940,(sp)
    5794:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    579a:	|  |     |  |  |   pea 23e2a <incbin_FlexLetterData_start>
    57a0:	|  |     |  |  |   jsr (a2)
      Scene = 7;
    57a2:	|  |     |  |  |   move.w #7,5eed6 <Scene>
    57aa:	|  |     |  |  |   lea 12(sp),sp
}
    57ae:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    57b2:	|  |     |  |  |   lea 44(sp),sp
    57b6:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeSpread, LetterMetaDataFlex, LetterMetaDataFlex, 10, 0, 4, 0, 1, 175);
    57b8:	|  |     |  |  |   pea af <main+0x49>
    57bc:	|  |     |  |  |   pea 1 <_start+0x1>
    57c0:	|  |     |  |  |   clr.l -(sp)
    57c2:	|  |     |  |  |   pea 4 <_start+0x4>
    57c6:	|  |     |  |  |   clr.l -(sp)
    57c8:	|  |     |  |  |   pea a <_start+0xa>
    57cc:	|  |     |  |  |   pea 3e760 <LetterMetaDataFlex>
    57d2:	|  |     |  |  |   pea 3e760 <LetterMetaDataFlex>
    57d8:	|  |     |  |  |   pea 5ed34 <CubeNrReverseSizeSpread>
    57de:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    57e2:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    57e6:	|  |     |  |  |   cmpi.w #1,d0
    57ea:	|  |     +--|--|-- bne.w 5402 <DrawScreen+0x9e>
    57ee:	|  |     |  +--|-- bra.w 55c8 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( DesireCubeDataLz4, WorkingMem, 9133);
    57f2:	|  |     |  |  |   pea 23ad <SetCl+0xa6f>
    57f6:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    57fc:	|  |     |  |  |   pea 27068 <incbin_DesireCubeDataLz4_start>
    5802:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    5806:	|  |     |  |  |   jsr (a3)
      LoadVectors( DesireCubeData, WorkingMem, VectorBuffer);   
    5808:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    580e:	|  |     |  |  |   pea 5500e <VectorBuffer>
    5814:	|  |     |  |  |   move.l d2,-(sp)
    5816:	|  |     |  |  |   pea 26fd4 <incbin_DesireCubeData_start>
    581c:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    5820:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireLetterDataLz4, WorkingMem, 10346);   
    5822:	|  |     |  |  |   pea 286a <SetBplPointers+0x14>
    5826:	|  |     |  |  |   move.l d2,-(sp)
    5828:	|  |     |  |  |   pea 294ee <incbin_DesireLetterDataLz4_start>
    582e:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireLetterData, WorkingMem, LetterBuffer);
    5830:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    5836:	|  |     |  |  |   lea 32(sp),sp
    583a:	|  |     |  |  |   move.l #296940,(sp)
    5840:	|  |     |  |  |   move.l d2,-(sp)
    5842:	|  |     |  |  |   pea 2942a <incbin_DesireLetterData_start>
    5848:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( DesireReversedLetterDataLz4, WorkingMem, 10239);   
    584a:	|  |     |  |  |   pea 27ff <Clbuild+0x309>
    584e:	|  |     |  |  |   move.l d2,-(sp)
    5850:	|  |     |  |  |   pea 2be30 <incbin_DesireReversedLetterDataLz4_start>
    5856:	|  |     |  |  |   jsr (a3)
      LoadVectors(DesireReversedLetterData, WorkingMem, LetterBuffer2);      
    5858:	|  |     |  |  |   pea 3ebec <LetterBuffer2>
    585e:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5864:	|  |     |  |  |   pea 2bd6c <incbin_DesireReversedLetterData_start>
    586a:	|  |     |  |  |   jsr (a2)
      Scene = 9;
    586c:	|  |     |  |  |   move.w #9,5eed6 <Scene>
    5874:	|  |     |  |  |   lea 36(sp),sp
}
    5878:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    587c:	|  |     |  |  |   lea 44(sp),sp
    5880:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseSizeDesire, LetterMetaDataDesire, LetterMetaDataReversedDesire, 8, 8, 3, 3, 1, 175);
    5882:	|  |     |  |  |   pea af <main+0x49>
    5886:	|  |     |  |  |   pea 1 <_start+0x1>
    588a:	|  |     |  |  |   pea 3 <_start+0x3>
    588e:	|  |     |  |  |   pea 3 <_start+0x3>
    5892:	|  |     |  |  |   pea 8 <_start+0x8>
    5896:	|  |     |  |  |   pea 8 <_start+0x8>
    589a:	|  |     |  |  |   pea 3e57a <LetterMetaDataReversedDesire>
    58a0:	|  |     |  |  |   pea 3e59c <LetterMetaDataDesire>
    58a6:	|  |     |  |  |   pea 3e5be <CubeNrReverseSizeDesire>
    58ac:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    58b0:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    58b4:	|  |     |  |  |   cmpi.w #1,d0
    58b8:	|  |     +--|--|-- bne.w 5402 <DrawScreen+0x9e>
    58bc:	|  |     |  +--|-- bra.w 55c8 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AtwCubeDataLz4, WorkingMem, 9458);
    58c0:	|  |     |  |  |   pea 24f2 <LoadVectors+0x130>
    58c4:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    58ca:	|  |     |  |  |   pea faa6 <incbin_AtwCubeDataLz4_start>
    58d0:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    58d4:	|  |     |  |  |   jsr (a3)
      LoadVectors( AtwCubeData, WorkingMem, VectorBuffer);   
    58d6:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    58dc:	|  |     |  |  |   pea 5500e <VectorBuffer>
    58e2:	|  |     |  |  |   move.l d2,-(sp)
    58e4:	|  |     |  |  |   pea fa12 <incbin_AtwCubeData_start>
    58ea:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    58ee:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AtwLetterDataLz4, WorkingMem, 11355);   
    58f0:	|  |     |  |  |   pea 2c5b <DrawRect+0x2f7>
    58f4:	|  |     |  |  |   move.l d2,-(sp)
    58f6:	|  |     |  |  |   pea 12070 <incbin_AtwLetterDataLz4_start>
    58fc:	|  |     |  |  |   jsr (a3)
      LoadVectors(AtwLetterData, WorkingMem, LetterBuffer);
    58fe:	|  |     |  |  |   lea 32(sp),sp
    5902:	|  |     |  |  |   move.l #296940,(sp)
    5908:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    590e:	|  |     |  |  |   pea 11fac <incbin_AtwLetterData_start>
    5914:	|  |     |  |  |   jsr (a2)
      Scene = 11;
    5916:	|  |     |  |  |   move.w #11,5eed6 <Scene>
    591e:	|  |     |  |  |   lea 12(sp),sp
}
    5922:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5926:	|  |     |  |  |   lea 44(sp),sp
    592a:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataAtw, LetterMetaDataReversedAtw, 8, 0, 3, 0, 1, 200);
    592c:	|  |     |  |  |   pea c8 <main+0x62>
    5930:	|  |     |  |  |   pea 1 <_start+0x1>
    5934:	|  |     |  |  |   clr.l -(sp)
    5936:	|  |     |  |  |   pea 3 <_start+0x3>
    593a:	|  |     |  |  |   clr.l -(sp)
    593c:	|  |     |  |  |   pea 8 <_start+0x8>
    5940:	|  |     |  |  |   pea 3e394 <LetterMetaDataReversedAtw>
    5946:	|  |     |  |  |   pea 3e3b6 <LetterMetaDataAtw>
    594c:	|  |     |  |  |   pea 3e3d8 <CubeNrReverseAtw>
    5952:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    5956:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    595a:	|  |     |  |  |   cmpi.w #1,d0
    595e:	|  |     +--|--|-- bne.w 5402 <DrawScreen+0x9e>
    5962:	|  |     |  +--|-- bra.w 55c8 <DrawScreen+0x264>
      Utils_Lz4DepackAsm( AbyssCubeDataLz4, WorkingMem, 10490);
    5966:	|  |     |  |  |   pea 28fa <KPrintF+0x8>
    596a:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5970:	|  |     |  |  |   pea 7bce <incbin_AbyssCubeDataLz4_start>
    5976:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    597a:	|  |     |  |  |   jsr (a3)
      LoadVectors( AbyssCubeData, WorkingMem, VectorBuffer);   
    597c:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    5982:	|  |     |  |  |   pea 5500e <VectorBuffer>
    5988:	|  |     |  |  |   move.l d2,-(sp)
    598a:	|  |     |  |  |   pea 7b3a <incbin_AbyssCubeData_start>
    5990:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    5994:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssLetterDataLz4, WorkingMem, 12543);   
    5996:	|  |     |  |  |   pea 30ff <DrawRect+0x79b>
    599a:	|  |     |  |  |   move.l d2,-(sp)
    599c:	|  |     |  |  |   pea a5b8 <incbin_AbyssLetterDataLz4_start>
    59a2:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssLetterData, WorkingMem, LetterBuffer);
    59a4:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    59aa:	|  |     |  |  |   lea 32(sp),sp
    59ae:	|  |     |  |  |   move.l #296940,(sp)
    59b4:	|  |     |  |  |   move.l d2,-(sp)
    59b6:	|  |     |  |  |   pea a4dc <incbin_AbyssLetterData_start>
    59bc:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( AbyssReversedLetterDataLz4, WorkingMem, 8861);   
    59be:	|  |     |  |  |   pea 229d <SetCl+0x95f>
    59c2:	|  |     |  |  |   move.l d2,-(sp)
    59c4:	|  |     |  |  |   pea d760 <incbin_AbyssReversedLetterDataLz4_start>
    59ca:	|  |     |  |  |   jsr (a3)
      LoadVectors(AbyssReversedLetterData, WorkingMem, LetterBuffer2);      
    59cc:	|  |     |  |  |   pea 3ebec <LetterBuffer2>
    59d2:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    59d8:	|  |     |  |  |   pea d6cc <incbin_AbyssReversedLetterData_start>
    59de:	|  |     |  |  |   jsr (a2)
      Scene = 13;
    59e0:	|  |     |  |  |   move.w #13,5eed6 <Scene>
    59e8:	|  |     |  |  |   lea 36(sp),sp
}
    59ec:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    59f0:	|  |     |  |  |   lea 44(sp),sp
    59f4:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData1Lz4, WorkingMem, 8195);
    59f6:	|  |     |  |  |   pea 2003 <SetCl+0x6c5>
    59fa:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5a00:	|  |     |  |  |   pea 2e708 <incbin_MercuryCubeData1Lz4_start>
    5a06:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    5a0a:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData1, WorkingMem, VectorBuffer);   
    5a0c:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    5a12:	|  |     |  |  |   pea 5500e <VectorBuffer>
    5a18:	|  |     |  |  |   move.l d2,-(sp)
    5a1a:	|  |     |  |  |   pea 2e644 <incbin_MercuryCubeData1_start>
    5a20:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    5a24:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData1Lz4, WorkingMem, 11047);   
    5a26:	|  |     |  |  |   pea 2b27 <DrawRect+0x1c3>
    5a2a:	|  |     |  |  |   move.l d2,-(sp)
    5a2c:	|  |     |  |  |   pea 3085c <incbin_MercuryLetterData1Lz4_start>
    5a32:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData1, WorkingMem, LetterBuffer);
    5a34:	|  |     |  |  |   lea 32(sp),sp
    5a38:	|  |     |  |  |   move.l #296940,(sp)
    5a3e:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5a44:	|  |     |  |  |   pea 30720 <incbin_MercuryLetterData1_start>
    5a4a:	|  |     |  |  |   jsr (a2)
      Scene = 15;
    5a4c:	|  |     |  |  |   move.w #15,5eed6 <Scene>
    5a54:	|  |     |  |  |   lea 12(sp),sp
}
    5a58:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5a5c:	|  |     |  |  |   lea 44(sp),sp
    5a60:	|  |     |  |  |   rts
      Utils_Lz4DepackAsm( MercuryCubeData2Lz4, WorkingMem, 6440);
    5a62:	|  |     |  |  |   pea 1928 <Sw_VblankHandler+0x7a>
    5a66:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5a6c:	|  |     |  |  |   pea 3345c <incbin_MercuryCubeData2Lz4_start>
    5a72:	|  |     |  |  |   lea c38 <Utils_Lz4DepackAsm>(pc),a3
    5a76:	|  |     |  |  |   jsr (a3)
      LoadVectors( MercuryCubeData2, WorkingMem, VectorBuffer);   
    5a78:	|  |     |  |  |   move.l 752ca <WorkingMem>,d2
    5a7e:	|  |     |  |  |   pea 5500e <VectorBuffer>
    5a84:	|  |     |  |  |   move.l d2,-(sp)
    5a86:	|  |     |  |  |   pea 33398 <incbin_MercuryCubeData2_start>
    5a8c:	|  |     |  |  |   lea 23c2 <LoadVectors>(pc),a2
    5a90:	|  |     |  |  |   jsr (a2)
      Utils_Lz4DepackAsm( MercuryLetterData2Lz4, WorkingMem, 8043);   
    5a92:	|  |     |  |  |   pea 1f6b <SetCl+0x62d>
    5a96:	|  |     |  |  |   move.l d2,-(sp)
    5a98:	|  |     |  |  |   pea 34ea4 <incbin_MercuryLetterData2Lz4_start>
    5a9e:	|  |     |  |  |   jsr (a3)
      LoadVectors(MercuryLetterData2, WorkingMem, LetterBuffer);
    5aa0:	|  |     |  |  |   lea 32(sp),sp
    5aa4:	|  |     |  |  |   move.l #296940,(sp)
    5aaa:	|  |     |  |  |   move.l 752ca <WorkingMem>,-(sp)
    5ab0:	|  |     |  |  |   pea 34d98 <incbin_MercuryLetterData2_start>
    5ab6:	|  |     |  |  |   jsr (a2)
      Scene = 17;
    5ab8:	|  |     |  |  |   move.w #17,5eed6 <Scene>
    5ac0:	|  |     |  |  |   lea 12(sp),sp
}
    5ac4:	|  |     |  |  |   movem.l (sp)+,d2-d7/a2-a6
    5ac8:	|  |     |  |  |   lea 44(sp),sp
    5acc:	|  |     |  |  |   rts
      result = DrawDices( CubeNrReverseAtw, LetterMetaDataMercury2, LetterMetaDataMercury2, 11, 0, 4, 0, 110, 132);      
    5ace:	|  |     |  |  |   pea 84 <main+0x1e>
    5ad2:	|  |     |  |  |   pea 6e <main+0x8>
    5ad6:	|  |     |  |  |   clr.l -(sp)
    5ad8:	|  |     |  |  |   pea 4 <_start+0x4>
    5adc:	|  |     |  |  |   clr.l -(sp)
    5ade:	|  |     |  |  |   pea b <_start+0xb>
    5ae2:	|  |     |  |  |   pea 3e156 <LetterMetaDataMercury2>
    5ae8:	|  |     |  |  |   pea 3e156 <LetterMetaDataMercury2>
    5aee:	|  |     |  |  |   pea 3e3d8 <CubeNrReverseAtw>
    5af4:	|  |     |  |  |   jsr 4cc4 <DrawDices>(pc)
      break;
    5af8:	|  |     |  |  |   lea 36(sp),sp
  if(result == 1) Scene++;
    5afc:	|  |     |  |  |   cmpi.w #1,d0
    5b00:	|  |     \--|--|-- bne.w 5402 <DrawScreen+0x9e>
    5b04:	|  |        \--|-- bra.w 55c8 <DrawScreen+0x264>
      for(int i=0;i<metadata[2];i++)
    5b08:	|  |           \-> tst.w d1
    5b0a:	|  |  /----------- ble.w 5c80 <DrawScreen+0x91c>
    5b0e:	|  |  |            lea 6(a5),a6
    5b12:	|  |  |            suba.l a3,a3
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    5b14:	|  |  |            lea 20(a0),a0
    5b18:	|  |  |            move.l a0,52(sp)
    5b1c:	|  |  |            move.l a5,48(sp)
    5b20:	|  |  |            movea.w d1,a5
        square.Color = metadata[3+i];
    5b22:	|  |  |  /-------> move.w (a6)+,86(sp)
        WORD xs0 = ((x0 * zMult[z0 - 1]) >> 15) + XC;
    5b26:	|  |  |  |         movea.w 4(a2),a0
    5b2a:	|  |  |  |         move.l a0,d0
    5b2c:	|  |  |  |         subq.l #1,d0
    5b2e:	|  |  |  |         add.l d0,d0
    5b30:	|  |  |  |         move.w (0,a4,d0.l),d0
    5b34:	|  |  |  |         move.w d0,d1
    5b36:	|  |  |  |         muls.w (a2),d1
    5b38:	|  |  |  |         moveq #15,d4
    5b3a:	|  |  |  |         asr.l d4,d1
    5b3c:	|  |  |  |         addi.w #160,d1
        WORD ys0 = ((y0 * zMult[z0 - 1]) >> 15) + YC;
    5b40:	|  |  |  |         muls.w 2(a2),d0
    5b44:	|  |  |  |         asr.l d4,d0
    5b46:	|  |  |  |         addi.w #128,d0
        WORD xs1 = ((x1 * zMult[z1 - 1]) >> 15) + XC;
    5b4a:	|  |  |  |         movea.w 10(a2),a0
    5b4e:	|  |  |  |         subq.l #1,a0
    5b50:	|  |  |  |         adda.l a0,a0
    5b52:	|  |  |  |         move.w (0,a4,a0.l),d2
    5b56:	|  |  |  |         move.w d2,d7
    5b58:	|  |  |  |         muls.w 6(a2),d7
    5b5c:	|  |  |  |         asr.l d4,d7
    5b5e:	|  |  |  |         addi.w #160,d7
        WORD ys1 = ((y1 * zMult[z1 - 1]) >> 15) + YC;
    5b62:	|  |  |  |         muls.w 8(a2),d2
    5b66:	|  |  |  |         asr.l d4,d2
    5b68:	|  |  |  |         addi.w #128,d2
        WORD xs2 = ((x2 * zMult[z2 - 1]) >> 15) + XC;
    5b6c:	|  |  |  |         movea.w 16(a2),a0
    5b70:	|  |  |  |         subq.l #1,a0
    5b72:	|  |  |  |         adda.l a0,a0
    5b74:	|  |  |  |         move.w (0,a4,a0.l),d3
    5b78:	|  |  |  |         move.w d3,d6
    5b7a:	|  |  |  |         muls.w 12(a2),d6
    5b7e:	|  |  |  |         asr.l d4,d6
    5b80:	|  |  |  |         addi.w #160,d6
        WORD ys2 = ((y2 * zMult[z2 - 1]) >> 15) + YC;
    5b84:	|  |  |  |         muls.w 14(a2),d3
    5b88:	|  |  |  |         asr.l d4,d3
    5b8a:	|  |  |  |         movea.w d3,a1
    5b8c:	|  |  |  |         lea 128(a1),a1
        WORD xs3 = ((x3 * zMult[z3 - 1]) >> 15) + XC;       
    5b90:	|  |  |  |         movea.w 22(a2),a0
    5b94:	|  |  |  |         subq.l #1,a0
    5b96:	|  |  |  |         adda.l a0,a0
    5b98:	|  |  |  |         move.w (0,a4,a0.l),d3
    5b9c:	|  |  |  |         move.w d3,d5
    5b9e:	|  |  |  |         muls.w 18(a2),d5
    5ba2:	|  |  |  |         asr.l d4,d5
    5ba4:	|  |  |  |         addi.w #160,d5
        WORD ys3 = ((y3 * zMult[z3 - 1]) >> 15) + YC;  
    5ba8:	|  |  |  |         muls.w 20(a2),d3
    5bac:	|  |  |  |         asr.l d4,d3
    5bae:	|  |  |  |         movea.w d3,a0
    5bb0:	|  |  |  |         lea 128(a0),a0
        square.Vertices[0].X = xs0;
    5bb4:	|  |  |  |         move.w d1,56(sp)
        square.Vertices[0].Y = ys0;
    5bb8:	|  |  |  |         move.w d0,58(sp)
        square.Vertices[1].X = xs1;
    5bbc:	|  |  |  |         move.w d7,60(sp)
        square.Vertices[1].Y = ys1;
    5bc0:	|  |  |  |         move.w d2,62(sp)
        square.Vertices[2].X = xs2;
    5bc4:	|  |  |  |         move.w d6,64(sp)
        square.Vertices[2].Y = ys2;
    5bc8:	|  |  |  |         move.w a1,66(sp)
        square.Vertices[3].X = xs3;
    5bcc:	|  |  |  |         move.w d5,68(sp)
        square.Vertices[3].Y = ys3;
    5bd0:	|  |  |  |         move.w a0,70(sp)
          if( xposmin > square.Vertices[i2].X) xposmin = square.Vertices[i2].X;
    5bd4:	|  |  |  |         move.w d1,d4
    5bd6:	|  |  |  |         cmp.w d1,d7
    5bd8:	|  |  |  |     /-- bge.s 5bdc <DrawScreen+0x878>
    5bda:	|  |  |  |     |   move.w d7,d4
    5bdc:	|  |  |  |     \-> cmp.w d4,d6
    5bde:	|  |  |  |     /-- bge.s 5be2 <DrawScreen+0x87e>
    5be0:	|  |  |  |     |   move.w d6,d4
    5be2:	|  |  |  |     \-> cmp.w d4,d5
    5be4:	|  |  |  |     /-- bge.s 5be8 <DrawScreen+0x884>
    5be6:	|  |  |  |     |   move.w d5,d4
          if( yposmin > square.Vertices[i2].Y) yposmin = square.Vertices[i2].Y;                    
    5be8:	|  |  |  |     \-> move.w d0,d3
    5bea:	|  |  |  |         cmp.w d0,d2
    5bec:	|  |  |  |     /-- bge.s 5bf0 <DrawScreen+0x88c>
    5bee:	|  |  |  |     |   move.w d2,d3
    5bf0:	|  |  |  |     \-> cmp.w a1,d3
    5bf2:	|  |  |  |     /-- ble.s 5bf6 <DrawScreen+0x892>
    5bf4:	|  |  |  |     |   move.w a1,d3
    5bf6:	|  |  |  |     \-> cmp.w a0,d3
    5bf8:	|  |  |  |     /-- ble.s 5bfc <DrawScreen+0x898>
    5bfa:	|  |  |  |     |   move.w a0,d3
        square.YPosMin = yposmin;
    5bfc:	|  |  |  |     \-> move.w d3,80(sp)
        square.XPosMin = xposmin;      
    5c00:	|  |  |  |         move.w d4,78(sp)
          if( yposmax < square.Vertices[i2].Y) yposmax = square.Vertices[i2].Y;
    5c04:	|  |  |  |         cmp.w d0,d2
    5c06:	|  |  |  |     /-- ble.s 5c0a <DrawScreen+0x8a6>
    5c08:	|  |  |  |     |   move.w d2,d0
    5c0a:	|  |  |  |     \-> cmp.w a1,d0
    5c0c:	|  |  |  |     /-- bge.s 5c10 <DrawScreen+0x8ac>
    5c0e:	|  |  |  |     |   move.w a1,d0
    5c10:	|  |  |  |     \-> cmp.w a0,d0
    5c12:	|  |  |  |     /-- bge.s 5c16 <DrawScreen+0x8b2>
    5c14:	|  |  |  |     |   move.w a0,d0
        square.Height = yposmax - yposmin + 1;
    5c16:	|  |  |  |     \-> addq.w #1,d0
    5c18:	|  |  |  |         sub.w d3,d0
    5c1a:	|  |  |  |         move.w d0,84(sp)
        if(square.Height > 1)
    5c1e:	|  |  |  |         cmpi.w #1,d0
    5c22:	|  |  |  |  /----- ble.s 5c5c <DrawScreen+0x8f8>
          if( xposmax < square.Vertices[i2].X) xposmax = square.Vertices[i2].X;
    5c24:	|  |  |  |  |      cmp.w d1,d7
    5c26:	|  |  |  |  |  /-- ble.s 5c2a <DrawScreen+0x8c6>
    5c28:	|  |  |  |  |  |   move.w d7,d1
    5c2a:	|  |  |  |  |  \-> cmp.w d1,d6
    5c2c:	|  |  |  |  |  /-- ble.s 5c30 <DrawScreen+0x8cc>
    5c2e:	|  |  |  |  |  |   move.w d6,d1
    5c30:	|  |  |  |  |  \-> cmp.w d1,d5
    5c32:	|  |  |  |  |  /-- ble.s 5c36 <DrawScreen+0x8d2>
    5c34:	|  |  |  |  |  |   move.w d5,d1
          square.XLength = xposmax - xposmin;
    5c36:	|  |  |  |  |  \-> sub.w d4,d1
    5c38:	|  |  |  |  |      move.w d1,82(sp)
          if(square.XLength > 1) {
    5c3c:	|  |  |  |  |      cmpi.w #1,d1
    5c40:	|  |  |  |  +----- ble.s 5c5c <DrawScreen+0x8f8>
            square.Clockwise = Cubes[cubenr].Squares[facenr].Clockwise;    
    5c42:	|  |  |  |  |      movea.l 52(sp),a0
    5c46:	|  |  |  |  |      move.w (a0),76(sp)
            DrawRect( &square);  
    5c4a:	|  |  |  |  |      pea 56(sp)
    5c4e:	|  |  |  |  |      jsr 2964 <DrawRect>(pc)
      for(int i=0;i<metadata[2];i++)
    5c52:	|  |  |  |  |      movea.l 52(sp),a0
    5c56:	|  |  |  |  |      movea.w 4(a0),a5
    5c5a:	|  |  |  |  |      addq.l #4,sp
        vectors += 12;
    5c5c:	|  |  |  |  \----> lea 24(a2),a2
      for(int i=0;i<metadata[2];i++)
    5c60:	|  |  |  |         addq.l #1,a3
    5c62:	|  |  |  |         movea.w a5,a0
    5c64:	|  |  |  |         cmpa.l a3,a0
    5c66:	|  |  |  \-------- bgt.w 5b22 <DrawScreen+0x7be>
    5c6a:	|  |  |            movea.l 48(sp),a5
    metadata += 3 + metadata[2];    
    5c6e:	|  |  |            addq.l #3,a0
    5c70:	|  |  |            adda.l a0,a0
    5c72:	|  |  |            adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    5c74:	|  |  |            subq.l #1,44(sp)
    5c78:	+--|--|----------- bne.w 54a8 <DrawScreen+0x144>
    5c7c:	|  +--|----------- bra.w 54f6 <DrawScreen+0x192>
    metadata += 3 + metadata[2];    
    5c80:	|  |  \----------> movea.w d1,a0
    5c82:	|  |               addq.l #3,a0
    5c84:	|  |               adda.l a0,a0
    5c86:	|  |               adda.l a0,a5
  for(int i2=0;i2<numcube;i2++)
    5c88:	|  |               subq.l #1,44(sp)
    5c8c:	\--|-------------- bne.w 54a8 <DrawScreen+0x144>
    5c90:	   \-------------- bra.w 54f6 <DrawScreen+0x192>

00005c94 <strlen>:
	while(*s++)
    5c94:	   /-> movea.l 4(sp),a0
    5c98:	   |   tst.b (a0)+
    5c9a:	/--|-- beq.s 5ca8 <strlen+0x14>
    5c9c:	|  |   move.l a0,-(sp)
    5c9e:	|  \-- jsr 5c94 <strlen>(pc)
    5ca2:	|      addq.l #4,sp
    5ca4:	|      addq.l #1,d0
}
    5ca6:	|      rts
	unsigned long t=0;
    5ca8:	\----> moveq #0,d0
}
    5caa:	       rts

00005cac <memset>:
void* memset(void *dest, int val, unsigned long len) {
    5cac:	       move.l d2,-(sp)
    5cae:	       move.l 8(sp),d0
	while(len-- > 0)
    5cb2:	       tst.l 16(sp)
    5cb6:	/----- beq.s 5cca <memset+0x1e>
		*ptr++ = val;
    5cb8:	|      move.b 15(sp),d2
    5cbc:	|      move.l 16(sp),d1
    5cc0:	|      add.l d0,d1
	unsigned char *ptr = (unsigned char *)dest;
    5cc2:	|      movea.l d0,a0
		*ptr++ = val;
    5cc4:	|  /-> move.b d2,(a0)+
	while(len-- > 0)
    5cc6:	|  |   cmpa.l d1,a0
    5cc8:	|  \-- bne.s 5cc4 <memset+0x18>
}
    5cca:	\----> move.l (sp)+,d2
    5ccc:	       rts

00005cce <memcpy>:
void* memcpy(void *dest, const void *src, unsigned long len) {
    5cce:	       move.l 4(sp),d0
    5cd2:	       movea.l 8(sp),a0
	while(len--)
    5cd6:	       tst.l 12(sp)
    5cda:	/----- beq.s 5cea <memcpy+0x1c>
    5cdc:	|      movea.l d0,a1
    5cde:	|      move.l 12(sp),d1
    5ce2:	|      add.l a0,d1
		*d++ = *s++;
    5ce4:	|  /-> move.b (a0)+,(a1)+
	while(len--)
    5ce6:	|  |   cmp.l a0,d1
    5ce8:	|  \-- bne.s 5ce4 <memcpy+0x16>
}
    5cea:	\----> rts

00005cec <memmove>:
void* memmove(void *dest, const void *src, unsigned long len) {
    5cec:	          move.l d2,-(sp)
    5cee:	          move.l 8(sp),d0
    5cf2:	          movea.l 12(sp),a0
    5cf6:	          move.l 16(sp),d2
	if (d < s) {
    5cfa:	          cmpa.l d0,a0
    5cfc:	   /----- bls.s 5d12 <memmove+0x26>
		while (len--)
    5cfe:	   |      tst.l d2
    5d00:	/--|----- beq.s 5d0e <memmove+0x22>
    5d02:	|  |      movea.l d0,a1
    5d04:	|  |      move.l a0,d1
    5d06:	|  |      add.l d2,d1
			*d++ = *s++;
    5d08:	|  |  /-> move.b (a0)+,(a1)+
		while (len--)
    5d0a:	|  |  |   cmp.l a0,d1
    5d0c:	|  |  \-- bne.s 5d08 <memmove+0x1c>
}
    5d0e:	>--|----> move.l (sp)+,d2
    5d10:	|  |      rts
		while (len--)
    5d12:	|  \----> movea.l d2,a1
    5d14:	|         subq.l #1,a1
		const char *lasts = s + (len - 1);
    5d16:	|         adda.l a1,a0
		char *lastd = d + (len - 1);
    5d18:	|         adda.l d0,a1
		while (len--)
    5d1a:	|         tst.l d2
    5d1c:	+-------- beq.s 5d0e <memmove+0x22>
    5d1e:	|         move.l a0,d1
    5d20:	|         sub.l d2,d1
			*lastd-- = *lasts--;
    5d22:	|     /-> move.b (a0),(a1)
		while (len--)
    5d24:	|     |   subq.l #1,a0
    5d26:	|     |   subq.l #1,a1
    5d28:	|     |   cmpa.l d1,a0
    5d2a:	+-----|-- beq.s 5d0e <memmove+0x22>
			*lastd-- = *lasts--;
    5d2c:	|     |   move.b (a0),(a1)
		while (len--)
    5d2e:	|     |   subq.l #1,a0
    5d30:	|     |   subq.l #1,a1
    5d32:	|     |   cmpa.l d1,a0
    5d34:	|     \-- bne.s 5d22 <memmove+0x36>
    5d36:	\-------- bra.s 5d0e <memmove+0x22>

00005d38 <__mulsi3>:
	.text
	.type __mulsi3, function
	.globl	__mulsi3
__mulsi3:
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    5d38:	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    5d3c:	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5d40:	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    5d44:	mulu.w 8(sp),d1
	addw	d1, d0
    5d48:	add.w d1,d0
	swap	d0
    5d4a:	swap d0
	clrw	d0
    5d4c:	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    5d4e:	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    5d52:	mulu.w 10(sp),d1
	addl	d1, d0
    5d56:	add.l d1,d0
	rts
    5d58:	rts

00005d5a <__udivsi3>:
	.text
	.type __udivsi3, function
	.globl	__udivsi3
__udivsi3:
	.cfi_startproc
	movel	d2, sp@-
    5d5a:	       move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    5d5c:	       move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    5d60:	       move.l 8(sp),d0

	cmpl	#0x10000, d1 /* divisor >= 2 ^ 16 ?   */
    5d64:	       cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    5d6a:	   /-- bcc.s 5d82 <__udivsi3+0x28>
	movel	d0, d2
    5d6c:	   |   move.l d0,d2
	clrw	d2
    5d6e:	   |   clr.w d2
	swap	d2
    5d70:	   |   swap d2
	divu	d1, d2          /* high quotient in lower word */
    5d72:	   |   divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    5d74:	   |   move.w d2,d0
	swap	d0
    5d76:	   |   swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    5d78:	   |   move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    5d7c:	   |   divu.w d1,d2
	movew	d2, d0
    5d7e:	   |   move.w d2,d0
	jra	6f
    5d80:	/--|-- bra.s 5db2 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    5d82:	|  \-> move.l d1,d2
4:	lsrl	#1, d1	/* shift divisor */
    5d84:	|  /-> lsr.l #1,d1
	lsrl	#1, d0	/* shift dividend */
    5d86:	|  |   lsr.l #1,d0
	cmpl	#0x10000, d1 /* still divisor >= 2 ^ 16 ?  */
    5d88:	|  |   cmpi.l #65536,d1
	jcc	4b
    5d8e:	|  \-- bcc.s 5d84 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    5d90:	|      divu.w d1,d0
	andl	#0xffff, d0 /* mask out divisor, ignore remainder */
    5d92:	|      andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    5d98:	|      move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    5d9a:	|      mulu.w d0,d1
	swap	d2
    5d9c:	|      swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    5d9e:	|      mulu.w d0,d2
	swap	d2		/* align high part with low part */
    5da0:	|      swap d2
	tstw	d2		/* high part 17 bits? */
    5da2:	|      tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    5da4:	|  /-- bne.s 5db0 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    5da6:	|  |   add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    5da8:	|  +-- bcs.s 5db0 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    5daa:	|  |   cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    5dae:	+--|-- bls.s 5db2 <__udivsi3+0x58>
5:	subql	#1, d0	/* adjust quotient */
    5db0:	|  \-> subq.l #1,d0

6:	movel	sp@+, d2
    5db2:	\----> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5db4:	       rts

00005db6 <__divsi3>:
	.text
	.type __divsi3, function
	.globl	__divsi3
 __divsi3:
 	.cfi_startproc
	movel	d2, sp@-
    5db6:	    move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	#1, d2	/* sign of result stored in d2 (=1 or =-1) */
    5db8:	    moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    5dba:	    move.l 12(sp),d1
	jpl	1f
    5dbe:	/-- bpl.s 5dc4 <__divsi3+0xe>
	negl	d1
    5dc0:	|   neg.l d1
	negb	d2		/* change sign because divisor <0  */
    5dc2:	|   neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    5dc4:	\-> move.l 8(sp),d0
	jpl	2f
    5dc8:	/-- bpl.s 5dce <__divsi3+0x18>
	negl	d0
    5dca:	|   neg.l d0
	negb	d2
    5dcc:	|   neg.b d2

2:	movel	d1, sp@-
    5dce:	\-> move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5dd0:	    move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3	/* divide abs(dividend) by abs(divisor) */
    5dd2:	    bsr.s 5d5a <__udivsi3>
	addql	#8, sp
    5dd4:	    addq.l #8,sp
	.cfi_adjust_cfa_offset -8

	tstb	d2
    5dd6:	    tst.b d2
	jpl	3f
    5dd8:	/-- bpl.s 5ddc <__divsi3+0x26>
	negl	d0
    5dda:	|   neg.l d0

3:	movel	sp@+, d2
    5ddc:	\-> move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    5dde:	    rts

00005de0 <__modsi3>:
	.text
	.type __modsi3, function
	.globl	__modsi3
__modsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5de0:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5de4:	move.l 4(sp),d0
	movel	d1, sp@-
    5de8:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5dea:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__divsi3
    5dec:	bsr.s 5db6 <__divsi3>
	addql	#8, sp
    5dee:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5df0:	move.l 8(sp),d1
	movel	d1, sp@-
    5df4:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5df6:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5df8:	bsr.w 5d38 <__mulsi3>
	addql	#8, sp
    5dfc:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5dfe:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5e02:	sub.l d0,d1
	movel	d1, d0
    5e04:	move.l d1,d0
	rts
    5e06:	rts

00005e08 <__umodsi3>:
	.text
	.type __umodsi3, function
	.globl	__umodsi3
__umodsi3:
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    5e08:	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    5e0c:	move.l 4(sp),d0
	movel	d1, sp@-
    5e10:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5e12:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__udivsi3
    5e14:	bsr.w 5d5a <__udivsi3>
	addql	#8, sp
    5e18:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    5e1a:	move.l 8(sp),d1
	movel	d1, sp@-
    5e1e:	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    5e20:	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	jbsr	__mulsi3	/* d0 = (a/b)*b */
    5e22:	bsr.w 5d38 <__mulsi3>
	addql	#8, sp
    5e26:	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    5e28:	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    5e2c:	sub.l d0,d1
	movel	d1, d0
    5e2e:	move.l d1,d0
	rts
    5e30:	rts

00005e32 <KPutCharX>:
	.type KPutCharX, function
	.globl	KPutCharX

KPutCharX:
	.cfi_startproc
    move.l  a6, -(sp)
    5e32:	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    5e34:	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    5e38:	jsr -516(a6)
    move.l (sp)+, a6
    5e3c:	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    5e3e:	rts

00005e40 <PutChar>:
	.type PutChar, function
	.globl	PutChar

PutChar:
	.cfi_startproc
	move.b d0, (a3)+
    5e40:	move.b d0,(a3)+
	rts
    5e42:	rts

00005e44 <_doynaxdepack_asm>:

	|Entry point. Wind up the decruncher
	.type _doynaxdepack_asm,function
	.globl _doynaxdepack_asm
_doynaxdepack_asm:
	movea.l	(a0)+,a2				|Unaligned literal buffer at the end of
    5e44:	                         movea.l (a0)+,a2
	adda.l	a0,a2					|the stream
    5e46:	                         adda.l a0,a2
	move.l	a2,a3
    5e48:	                         movea.l a2,a3
	move.l	(a0)+,d0				|Seed the shift register
    5e4a:	                         move.l (a0)+,d0
	moveq	#0x38,d4				|Masks for match offset extraction
    5e4c:	                         moveq #56,d4
	moveq	#8,d5
    5e4e:	                         moveq #8,d5
	bra.s	.Lliteral
    5e50:	   /-------------------- bra.s 5eba <_doynaxdepack_asm+0x76>

	|******** Copy a literal sequence ********

.Llcopy:							|Copy two bytes at a time, with the
	move.b	(a0)+,(a1)+				|deferral of the length LSB helping
    5e52:	/--|-------------------> move.b (a0)+,(a1)+
	move.b	(a0)+,(a1)+				|slightly in the unrolling
    5e54:	|  |                     move.b (a0)+,(a1)+
	dbf		d1,.Llcopy
    5e56:	+--|-------------------- dbf d1,5e52 <_doynaxdepack_asm+0xe>

	lsl.l	#2,d0					|Copy odd bytes separately in order
    5e5a:	|  |                     lsl.l #2,d0
	bcc.s	.Lmatch					|to keep the source aligned
    5e5c:	|  |     /-------------- bcc.s 5e60 <_doynaxdepack_asm+0x1c>
.Llsingle:
	move.b	(a2)+,(a1)+
    5e5e:	|  |  /--|-------------> move.b (a2)+,(a1)+

	|******** Process a match ********

	|Start by refilling the bit-buffer
.Lmatch:
	DOY_REFILL1 mprefix
    5e60:	|  |  |  >-------------> tst.w d0
    5e62:	|  |  |  |           /-- bne.s 5e6c <_doynaxdepack_asm+0x28>
	cmp.l	a0,a3					|Take the opportunity to test for the
    5e64:	|  |  |  |           |   cmpa.l a0,a3
	bls.s	.Lreturn				|end of the stream while refilling
    5e66:	|  |  |  |           |   bls.s 5ede <doy_table+0x6>
.Lmrefill:
	DOY_REFILL2
    5e68:	|  |  |  |           |   move.w (a0)+,d0
    5e6a:	|  |  |  |           |   swap d0

.Lmprefix:
	|Fetch the first three bits identifying the match length, and look up
	|the corresponding table entry
	rol.l	#3+3,d0
    5e6c:	|  |  |  |           \-> rol.l #6,d0
	move.w	d0,d1
    5e6e:	|  |  |  |               move.w d0,d1
	and.w	d4,d1
    5e70:	|  |  |  |               and.w d4,d1
	eor.w	d1,d0
    5e72:	|  |  |  |               eor.w d1,d0
	movem.w	doy_table(pc,d1.w),d2/d3/a4
    5e74:	|  |  |  |               movem.w (5ed8 <doy_table>,pc,d1.w),d2-d3/a4

	|Extract the offset bits and compute the relative source address from it
	rol.l	d2,d0					|Reduced by 3 to account for 8x offset
    5e7a:	|  |  |  |               rol.l d2,d0
	and.w	d0,d3					|scaling
    5e7c:	|  |  |  |               and.w d0,d3
	eor.w	d3,d0
    5e7e:	|  |  |  |               eor.w d3,d0
	suba.w	d3,a4
    5e80:	|  |  |  |               suba.w d3,a4
	adda.l	a1,a4
    5e82:	|  |  |  |               adda.l a1,a4

	|Decode the match length
	DOY_REFILL
    5e84:	|  |  |  |               tst.w d0
    5e86:	|  |  |  |           /-- bne.s 5e8c <_doynaxdepack_asm+0x48>
    5e88:	|  |  |  |           |   move.w (a0)+,d0
    5e8a:	|  |  |  |           |   swap d0
	and.w	d5,d1					|Check the initial length bit from the
    5e8c:	|  |  |  |           \-> and.w d5,d1
	beq.s	.Lmcopy					|type triple
    5e8e:	|  |  |  |  /----------- beq.s 5ea6 <_doynaxdepack_asm+0x62>

	moveq	#1,d1					|This loops peeks at the next flag
    5e90:	|  |  |  |  |            moveq #1,d1
	tst.l	d0						|through the sign bit bit while keeping
    5e92:	|  |  |  |  |            tst.l d0
	bpl.s	.Lmendlen2				|the LSB in carry
    5e94:	|  |  |  |  |  /-------- bpl.s 5ea2 <_doynaxdepack_asm+0x5e>
	lsl.l	#2,d0
    5e96:	|  |  |  |  |  |         lsl.l #2,d0
	bpl.s	.Lmendlen1
    5e98:	|  |  |  |  |  |  /----- bpl.s 5ea0 <_doynaxdepack_asm+0x5c>
.Lmgetlen:
	addx.b	d1,d1
    5e9a:	|  |  |  |  |  |  |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5e9c:	|  |  |  |  |  |  |  |   lsl.l #2,d0
	bmi.s	.Lmgetlen
    5e9e:	|  |  |  |  |  |  |  \-- bmi.s 5e9a <_doynaxdepack_asm+0x56>
.Lmendlen1:
	addx.b	d1,d1
    5ea0:	|  |  |  |  |  |  \----> addx.b d1,d1
.Lmendlen2:
	|Copy the match data a word at a time. Note that the minimum length is
	|two bytes
	lsl.l	#2,d0					|The trailing length payload bit is
    5ea2:	|  |  |  |  |  \-------> lsl.l #2,d0
	bcc.s	.Lmhalf					|stored out-of-order
    5ea4:	|  |  |  |  |        /-- bcc.s 5ea8 <_doynaxdepack_asm+0x64>
.Lmcopy:
	move.b	(a4)+,(a1)+
    5ea6:	|  |  |  |  >--------|-> move.b (a4)+,(a1)+
.Lmhalf:
	move.b	(a4)+,(a1)+
    5ea8:	|  |  |  |  |        \-> move.b (a4)+,(a1)+
	dbf		d1,.Lmcopy
    5eaa:	|  |  |  |  \----------- dbf d1,5ea6 <_doynaxdepack_asm+0x62>

	|Fetch a bit flag to see whether what follows is a literal run or
	|another match
	add.l	d0,d0
    5eae:	|  |  |  |               add.l d0,d0
	bcc.s	.Lmatch
    5eb0:	|  |  |  \-------------- bcc.s 5e60 <_doynaxdepack_asm+0x1c>


	|******** Process a run of literal bytes ********

	DOY_REFILL						|Replenish the shift-register
    5eb2:	|  |  |                  tst.w d0
    5eb4:	|  +--|----------------- bne.s 5eba <_doynaxdepack_asm+0x76>
    5eb6:	|  |  |                  move.w (a0)+,d0
    5eb8:	|  |  |                  swap d0
.Lliteral:
	|Extract delta-coded run length in the same swizzled format as the
	|matches above
	moveq	#0,d1
    5eba:	|  \--|----------------> moveq #0,d1
	add.l	d0,d0
    5ebc:	|     |                  add.l d0,d0
	bcc.s	.Llsingle				|Single out the one-byte case
    5ebe:	|     \----------------- bcc.s 5e5e <_doynaxdepack_asm+0x1a>
	bpl.s	.Llendlen
    5ec0:	|                 /----- bpl.s 5ec8 <_doynaxdepack_asm+0x84>
.Llgetlen:
	addx.b	d1,d1
    5ec2:	|                 |  /-> addx.b d1,d1
	lsl.l	#2,d0
    5ec4:	|                 |  |   lsl.l #2,d0
	bmi.s	.Llgetlen
    5ec6:	|                 |  \-- bmi.s 5ec2 <_doynaxdepack_asm+0x7e>
.Llendlen:
	addx.b	d1,d1
    5ec8:	|                 \----> addx.b d1,d1
	|or greater, in which case the sixteen guaranteed bits in the buffer
	|may have run out.
	|In the latter case simply give up and stuff the payload bits back onto
	|the stream before fetching a literal 16-bit run length instead
.Llcopy_near:
	dbvs	d1,.Llcopy
    5eca:	\--------------------/-X dbv.s d1,5e52 <_doynaxdepack_asm+0xe>

	add.l	d0,d0
    5ece:	                     |   add.l d0,d0
	eor.w	d1,d0		
    5ed0:	                     |   eor.w d1,d0
	ror.l	#7+1,d0					|Note that the constant MSB acts as a
    5ed2:	                     |   ror.l #8,d0
	move.w	(a0)+,d1				|substitute for the unfetched stop bit
    5ed4:	                     |   move.w (a0)+,d1
	bra.s	.Llcopy_near
    5ed6:	                     \-- bra.s 5eca <_doynaxdepack_asm+0x86>

00005ed8 <doy_table>:
    5ed8:	......Nu........
doy_table:
	DOY_OFFSET 3,1					|Short A
.Lreturn:
	rts
	DOY_OFFSET 4,1					|Long A
	dc.w	0						|(Empty hole)
    5ee8:	...?............
	DOY_OFFSET 6,1+8				|Short B
	dc.w	0						|(Empty hole)
	DOY_OFFSET 7,1+16				|Long B
	dc.w	0						|(Empty hole)
    5ef8:	.............o..
	DOY_OFFSET 8,1+8+64				|Short C
	dc.w	0						|(Empty hole)
	DOY_OFFSET 10,1+16+128			|Long C
	dc.w	0						|(Empty hole)
    5f08:	.............oNq

00005f18 <_lz4_depack>:
| output: none
|
	.type _lz4_depack,function
	.globl _lz4_depack
_lz4_depack:			
			lea		0(a0,d0.l),a4	| packed buffer end
    5f18:	lea (0,a0,d0.l),a4
			moveq	#0,d1
    5f1c:	moveq #0,d1
			moveq	#0,d2
    5f1e:	moveq #0,d2
			moveq	#0,d3
    5f20:	moveq #0,d3
			moveq	#16,d7
    5f22:	moveq #16,d7
| this part is generated
|
|-------------------------------------------------------------------			
		

		lea		lz4jmp(pc),a3
    5f24:	lea 6ba2 <lz4jmp>(pc),a3
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

00005f36 <lz4Rts0>:
lz4Rts0:	rts
    5f36:	rts

00005f38 <sl_sm0>:

sl_sm0:
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
		beq.s	lz4Rts1
    5f56:	beq.s 5f7a <lz4Rts1>
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
		moveq	#0,d0
    5f6c:	moveq #0,d0
		move.b	(a0)+,d0
    5f6e:	move.b (a0)+,d0
		add.w	d0,d0
    5f70:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5f72:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5f76:	jmp (0,a3,d0.w)

00005f7a <lz4Rts1>:
lz4Rts1:	rts
    5f7a:	rts

00005f7c <sl_sm1>:

sl_sm1:
		move.b	(a0)+,(a1)+
    5f7c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f7e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f80:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5f82:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    5f98:	cmpa.l a0,a4
		beq.s	lz4Rts2
    5f9a:	beq.s 5fc0 <lz4Rts2>
		move.b	(a0)+,d0
    5f9c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5f9e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fa0:	move.w (sp)+,d3
		move.b	d0,d3
    5fa2:	move.b d0,d3
		move.l	a1,a2
    5fa4:	movea.l a1,a2
		sub.l	d3,a2
    5fa6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    5fa8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5faa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fac:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fae:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    5fb0:	move.b (a2)+,(a1)+
		moveq	#0,d0
    5fb2:	moveq #0,d0
		move.b	(a0)+,d0
    5fb4:	move.b (a0)+,d0
		add.w	d0,d0
    5fb6:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    5fb8:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    5fbc:	jmp (0,a3,d0.w)

00005fc0 <lz4Rts2>:
lz4Rts2:	rts
    5fc0:	rts

00005fc2 <sl_sm2>:

sl_sm2:
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
		move.b	(a0)+,(a1)+
    5fd4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fd6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fd8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fda:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    5fdc:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    5fde:	cmpa.l a0,a4
		beq.s	lz4Rts3
    5fe0:	beq.s 6008 <lz4Rts3>
		move.b	(a0)+,d0
    5fe2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    5fe4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    5fe6:	move.w (sp)+,d3
		move.b	d0,d3
    5fe8:	move.b d0,d3
		move.l	a1,a2
    5fea:	movea.l a1,a2
		sub.l	d3,a2
    5fec:	suba.l d3,a2
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
		moveq	#0,d0
    5ffa:	moveq #0,d0
		move.b	(a0)+,d0
    5ffc:	move.b (a0)+,d0
		add.w	d0,d0
    5ffe:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6000:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6004:	jmp (0,a3,d0.w)

00006008 <lz4Rts3>:
lz4Rts3:	rts
    6008:	rts

0000600a <sl_sm3>:

sl_sm3:
		move.b	(a0)+,(a1)+
    600a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    600c:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    6026:	cmpa.l a0,a4
		beq.s	lz4Rts4
    6028:	beq.s 6052 <lz4Rts4>
		move.b	(a0)+,d0
    602a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    602c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    602e:	move.w (sp)+,d3
		move.b	d0,d3
    6030:	move.b d0,d3
		move.l	a1,a2
    6032:	movea.l a1,a2
		sub.l	d3,a2
    6034:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    6042:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6044:	moveq #0,d0
		move.b	(a0)+,d0
    6046:	move.b (a0)+,d0
		add.w	d0,d0
    6048:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    604a:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    604e:	jmp (0,a3,d0.w)

00006052 <lz4Rts4>:
lz4Rts4:	rts
    6052:	rts

00006054 <sl_sm4>:

sl_sm4:
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
		move.b	(a0)+,(a1)+
    606e:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6070:	cmpa.l a0,a4
		beq.s	lz4Rts5
    6072:	beq.s 609e <lz4Rts5>
		move.b	(a0)+,d0
    6074:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6076:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6078:	move.w (sp)+,d3
		move.b	d0,d3
    607a:	move.b d0,d3
		move.l	a1,a2
    607c:	movea.l a1,a2
		sub.l	d3,a2
    607e:	suba.l d3,a2
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
		moveq	#0,d0
    6090:	moveq #0,d0
		move.b	(a0)+,d0
    6092:	move.b (a0)+,d0
		add.w	d0,d0
    6094:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6096:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    609a:	jmp (0,a3,d0.w)

0000609e <lz4Rts5>:
lz4Rts5:	rts
    609e:	rts

000060a0 <sl_sm5>:

sl_sm5:
		move.b	(a0)+,(a1)+
    60a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    60a6:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    60bc:	cmpa.l a0,a4
		beq.s	lz4Rts6
    60be:	beq.s 60ec <lz4Rts6>
		move.b	(a0)+,d0
    60c0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    60c2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    60c4:	move.w (sp)+,d3
		move.b	d0,d3
    60c6:	move.b d0,d3
		move.l	a1,a2
    60c8:	movea.l a1,a2
		sub.l	d3,a2
    60ca:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    60d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    60dc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    60de:	moveq #0,d0
		move.b	(a0)+,d0
    60e0:	move.b (a0)+,d0
		add.w	d0,d0
    60e2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    60e4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    60e8:	jmp (0,a3,d0.w)

000060ec <lz4Rts6>:
lz4Rts6:	rts
    60ec:	rts

000060ee <sl_sm6>:

sl_sm6:
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
		move.b	(a0)+,(a1)+
    6104:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6106:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6108:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    610a:	cmpa.l a0,a4
		beq.s	lz4Rts7
    610c:	beq.s 613c <lz4Rts7>
		move.b	(a0)+,d0
    610e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6110:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6112:	move.w (sp)+,d3
		move.b	d0,d3
    6114:	move.b d0,d3
		move.l	a1,a2
    6116:	movea.l a1,a2
		sub.l	d3,a2
    6118:	suba.l d3,a2
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
		moveq	#0,d0
    612e:	moveq #0,d0
		move.b	(a0)+,d0
    6130:	move.b (a0)+,d0
		add.w	d0,d0
    6132:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6134:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6138:	jmp (0,a3,d0.w)

0000613c <lz4Rts7>:
lz4Rts7:	rts
    613c:	rts

0000613e <sl_sm7>:

sl_sm7:
		move.b	(a0)+,(a1)+
    613e:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    615a:	cmpa.l a0,a4
		beq.s	lz4Rts8
    615c:	beq.s 618e <lz4Rts8>
		move.b	(a0)+,d0
    615e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6160:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6162:	move.w (sp)+,d3
		move.b	d0,d3
    6164:	move.b d0,d3
		move.l	a1,a2
    6166:	movea.l a1,a2
		sub.l	d3,a2
    6168:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    616a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    616c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    616e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6170:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    6180:	moveq #0,d0
		move.b	(a0)+,d0
    6182:	move.b (a0)+,d0
		add.w	d0,d0
    6184:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6186:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    618a:	jmp (0,a3,d0.w)

0000618e <lz4Rts8>:
lz4Rts8:	rts
    618e:	rts

00006190 <sl_sm8>:

sl_sm8:
		move.b	(a0)+,(a1)+
    6190:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6192:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6194:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6196:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6198:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    619a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    619c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    619e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61a8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61aa:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    61ac:	cmpa.l a0,a4
		beq.s	lz4Rts9
    61ae:	beq.s 61e2 <lz4Rts9>
		move.b	(a0)+,d0
    61b0:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    61b2:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    61b4:	move.w (sp)+,d3
		move.b	d0,d3
    61b6:	move.b d0,d3
		move.l	a1,a2
    61b8:	movea.l a1,a2
		sub.l	d3,a2
    61ba:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    61ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61cc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61ce:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61d0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    61d2:	move.b (a2)+,(a1)+
		moveq	#0,d0
    61d4:	moveq #0,d0
		move.b	(a0)+,d0
    61d6:	move.b (a0)+,d0
		add.w	d0,d0
    61d8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    61da:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    61de:	jmp (0,a3,d0.w)

000061e2 <lz4Rts9>:
lz4Rts9:	rts
    61e2:	rts

000061e4 <sl_sm9>:

sl_sm9:
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
		move.b	(a0)+,(a1)+
    61f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    61fe:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6200:	cmpa.l a0,a4
		beq.s	lz4Rts10
    6202:	beq.s 6238 <lz4Rts10>
		move.b	(a0)+,d0
    6204:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6206:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6208:	move.w (sp)+,d3
		move.b	d0,d3
    620a:	move.b d0,d3
		move.l	a1,a2
    620c:	movea.l a1,a2
		sub.l	d3,a2
    620e:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    6224:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6226:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6228:	move.b (a2)+,(a1)+
		moveq	#0,d0
    622a:	moveq #0,d0
		move.b	(a0)+,d0
    622c:	move.b (a0)+,d0
		add.w	d0,d0
    622e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6230:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6234:	jmp (0,a3,d0.w)

00006238 <lz4Rts10>:
lz4Rts10:	rts
    6238:	rts

0000623a <sl_sm10>:

sl_sm10:
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
		move.b	(a0)+,(a1)+
    6252:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6254:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6256:	cmpa.l a0,a4
		beq.s	lz4Rts11
    6258:	beq.s 6290 <lz4Rts11>
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
		move.b	(a2)+,(a1)+
    626e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6270:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6272:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6274:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6276:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6278:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    627a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    627c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    627e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6280:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6282:	moveq #0,d0
		move.b	(a0)+,d0
    6284:	move.b (a0)+,d0
		add.w	d0,d0
    6286:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6288:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    628c:	jmp (0,a3,d0.w)

00006290 <lz4Rts11>:
lz4Rts11:	rts
    6290:	rts

00006292 <sl_sm11>:

sl_sm11:
		move.b	(a0)+,(a1)+
    6292:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    62ae:	cmpa.l a0,a4
		beq.s	lz4Rts12
    62b0:	beq.s 62ea <lz4Rts12>
		move.b	(a0)+,d0
    62b2:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    62b4:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    62b6:	move.w (sp)+,d3
		move.b	d0,d3
    62b8:	move.b d0,d3
		move.l	a1,a2
    62ba:	movea.l a1,a2
		sub.l	d3,a2
    62bc:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    62be:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62c0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62c2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62c6:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    62d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    62da:	move.b (a2)+,(a1)+
		moveq	#0,d0
    62dc:	moveq #0,d0
		move.b	(a0)+,d0
    62de:	move.b (a0)+,d0
		add.w	d0,d0
    62e0:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    62e2:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    62e6:	jmp (0,a3,d0.w)

000062ea <lz4Rts12>:
lz4Rts12:	rts
    62ea:	rts

000062ec <sl_sm12>:

sl_sm12:
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
		cmpa.l	a0,a4
    6308:	cmpa.l a0,a4
		beq.s	lz4Rts13
    630a:	beq.s 6346 <lz4Rts13>
		move.b	(a0)+,d0
    630c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    630e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6310:	move.w (sp)+,d3
		move.b	d0,d3
    6312:	move.b d0,d3
		move.l	a1,a2
    6314:	movea.l a1,a2
		sub.l	d3,a2
    6316:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    6322:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6324:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6326:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6328:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    632a:	move.b (a2)+,(a1)+
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

00006346 <lz4Rts13>:
lz4Rts13:	rts
    6346:	rts

00006348 <sl_sm13>:

sl_sm13:
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
		cmpa.l	a0,a4
    6364:	cmpa.l a0,a4
		beq.s	lz4Rts14
    6366:	beq.s 63a4 <lz4Rts14>
		move.b	(a0)+,d0
    6368:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    636a:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    636c:	move.w (sp)+,d3
		move.b	d0,d3
    636e:	move.b d0,d3
		move.l	a1,a2
    6370:	movea.l a1,a2
		sub.l	d3,a2
    6372:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6374:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6376:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6378:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    637a:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    6390:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6392:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6394:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6396:	moveq #0,d0
		move.b	(a0)+,d0
    6398:	move.b (a0)+,d0
		add.w	d0,d0
    639a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    639c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    63a0:	jmp (0,a3,d0.w)

000063a4 <lz4Rts14>:
lz4Rts14:	rts
    63a4:	rts

000063a6 <sl_sm14>:

sl_sm14:
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
		move.b	(a0)+,(a1)+
    63b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    63b4:	move.b (a0)+,(a1)+
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
		cmpa.l	a0,a4
    63c2:	cmpa.l a0,a4
		beq.s	lz4Rts15
    63c4:	beq.s 6404 <lz4Rts15>
		move.b	(a0)+,d0
    63c6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    63c8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    63ca:	move.w (sp)+,d3
		move.b	d0,d3
    63cc:	move.b d0,d3
		move.l	a1,a2
    63ce:	movea.l a1,a2
		sub.l	d3,a2
    63d0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    63d2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63d4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63d6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63d8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63da:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63dc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63de:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63e0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    63e8:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    63f6:	moveq #0,d0
		move.b	(a0)+,d0
    63f8:	move.b (a0)+,d0
		add.w	d0,d0
    63fa:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    63fc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6400:	jmp (0,a3,d0.w)

00006404 <lz4Rts15>:
lz4Rts15:	rts
    6404:	rts

00006406 <sl_lm>:

sl_lm:
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
		move.b	(a0)+,(a1)+
    641a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    641c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    641e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6420:	move.b (a0)+,(a1)+
		cmpa.l	a0,a4
    6422:	cmpa.l a0,a4
		beq.s	lz4Rts16
    6424:	beq.s 647a <lz4Rts16>
		move.b	(a0)+,d0
    6426:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6428:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    642a:	move.w (sp)+,d3
		move.b	d0,d3
    642c:	move.b d0,d3
		move.l	a1,a2
    642e:	movea.l a1,a2
		sub.l	d3,a2
    6430:	suba.l d3,a2
		moveq	#15+4,d1
    6432:	moveq #19,d1

00006434 <.cl0>:
.cl0:	move.b	(a0)+,d2
    6434:	/-> move.b (a0)+,d2
		add.l d2,d1
    6436:	|   add.l d2,d1
		not.b	d2
    6438:	|   not.b d2
		beq.s	.cl0
    643a:	\-- beq.s 6434 <.cl0>
		moveq	#15,d5
    643c:	    moveq #15,d5
		and.w	d1,d5
    643e:	    and.w d1,d5
		add.w	d5,d5
    6440:	    add.w d5,d5
		neg.w	d5
    6442:	    neg.w d5
		jmp		.eloop1(pc,d5.w)
    6444:	    jmp (6468 <.eloop1>,pc,d5.w)

00006448 <.tloop1>:
.tloop1:
		move.b	(a2)+,(a1)+
    6448:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    644a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    644c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    644e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6450:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6452:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6454:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6456:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6458:	move.b (a2)+,(a1)+
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

00006468 <.eloop1>:
.eloop1:	sub.l	d7,d1
    6468:	sub.l d7,d1
		bpl.s	.tloop1
    646a:	bpl.s 6448 <.tloop1>
		moveq	#0,d0
    646c:	moveq #0,d0
		move.b	(a0)+,d0
    646e:	move.b (a0)+,d0
		add.w	d0,d0
    6470:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6472:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6476:	jmp (0,a3,d0.w)

0000647a <lz4Rts16>:
lz4Rts16:	rts
    647a:	rts

0000647c <ll_sm0>:

ll_sm0:
		moveq	#15,d1
    647c:	moveq #15,d1

0000647e <.cl2>:
.cl2:	move.b	(a0)+,d2
    647e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6480:	|   add.l d2,d1
		not.b	d2
    6482:	|   not.b d2
		beq.s	.cl2
    6484:	\-- beq.s 647e <.cl2>
		moveq	#15,d5
    6486:	    moveq #15,d5
		and.w	d1,d5
    6488:	    and.w d1,d5
		add.w	d5,d5
    648a:	    add.w d5,d5
		neg.w	d5
    648c:	    neg.w d5
		jmp		.eloop3(pc,d5.w)
    648e:	    jmp (64b2 <.eloop3>,pc,d5.w)

00006492 <.tloop3>:
.tloop3:
		move.b	(a0)+,(a1)+
    6492:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6494:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6496:	move.b (a0)+,(a1)+
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

000064b2 <.eloop3>:
.eloop3:	sub.l	d7,d1
    64b2:	sub.l d7,d1
		bpl.s	.tloop3
    64b4:	bpl.s 6492 <.tloop3>
		cmpa.l	a0,a4
    64b6:	cmpa.l a0,a4
		beq.s	lz4Rts17
    64b8:	beq.s 64dc <lz4Rts17>
		move.b	(a0)+,d0
    64ba:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    64bc:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    64be:	move.w (sp)+,d3
		move.b	d0,d3
    64c0:	move.b d0,d3
		move.l	a1,a2
    64c2:	movea.l a1,a2
		sub.l	d3,a2
    64c4:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    64c6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64c8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64ca:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    64cc:	move.b (a2)+,(a1)+
		moveq	#0,d0
    64ce:	moveq #0,d0
		move.b	(a0)+,d0
    64d0:	move.b (a0)+,d0
		add.w	d0,d0
    64d2:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    64d4:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    64d8:	jmp (0,a3,d0.w)

000064dc <lz4Rts17>:
lz4Rts17:	rts
    64dc:	rts

000064de <ll_sm1>:

ll_sm1:
		moveq	#15,d1
    64de:	moveq #15,d1

000064e0 <.cl4>:
.cl4:	move.b	(a0)+,d2
    64e0:	/-> move.b (a0)+,d2
		add.l d2,d1
    64e2:	|   add.l d2,d1
		not.b	d2
    64e4:	|   not.b d2
		beq.s	.cl4
    64e6:	\-- beq.s 64e0 <.cl4>
		moveq	#15,d5
    64e8:	    moveq #15,d5
		and.w	d1,d5
    64ea:	    and.w d1,d5
		add.w	d5,d5
    64ec:	    add.w d5,d5
		neg.w	d5
    64ee:	    neg.w d5
		jmp		.eloop5(pc,d5.w)
    64f0:	    jmp (6514 <.eloop5>,pc,d5.w)

000064f4 <.tloop5>:
.tloop5:
		move.b	(a0)+,(a1)+
    64f4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64f6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64f8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64fa:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64fc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    64fe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6500:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6502:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6504:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6506:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6508:	move.b (a0)+,(a1)+
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

00006514 <.eloop5>:
.eloop5:	sub.l	d7,d1
    6514:	sub.l d7,d1
		bpl.s	.tloop5
    6516:	bpl.s 64f4 <.tloop5>
		cmpa.l	a0,a4
    6518:	cmpa.l a0,a4
		beq.s	lz4Rts18
    651a:	beq.s 6540 <lz4Rts18>
		move.b	(a0)+,d0
    651c:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    651e:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6520:	move.w (sp)+,d3
		move.b	d0,d3
    6522:	move.b d0,d3
		move.l	a1,a2
    6524:	movea.l a1,a2
		sub.l	d3,a2
    6526:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6528:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    652a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    652c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    652e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6530:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6532:	moveq #0,d0
		move.b	(a0)+,d0
    6534:	move.b (a0)+,d0
		add.w	d0,d0
    6536:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6538:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    653c:	jmp (0,a3,d0.w)

00006540 <lz4Rts18>:
lz4Rts18:	rts
    6540:	rts

00006542 <ll_sm2>:

ll_sm2:
		moveq	#15,d1
    6542:	moveq #15,d1

00006544 <.cl6>:
.cl6:	move.b	(a0)+,d2
    6544:	/-> move.b (a0)+,d2
		add.l d2,d1
    6546:	|   add.l d2,d1
		not.b	d2
    6548:	|   not.b d2
		beq.s	.cl6
    654a:	\-- beq.s 6544 <.cl6>
		moveq	#15,d5
    654c:	    moveq #15,d5
		and.w	d1,d5
    654e:	    and.w d1,d5
		add.w	d5,d5
    6550:	    add.w d5,d5
		neg.w	d5
    6552:	    neg.w d5
		jmp		.eloop7(pc,d5.w)
    6554:	    jmp (6578 <.eloop7>,pc,d5.w)

00006558 <.tloop7>:
.tloop7:
		move.b	(a0)+,(a1)+
    6558:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    655a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    655c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    655e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6560:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6562:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6564:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6566:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6568:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    656a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    656c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    656e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6570:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6572:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6574:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6576:	move.b (a0)+,(a1)+

00006578 <.eloop7>:
.eloop7:	sub.l	d7,d1
    6578:	sub.l d7,d1
		bpl.s	.tloop7
    657a:	bpl.s 6558 <.tloop7>
		cmpa.l	a0,a4
    657c:	cmpa.l a0,a4
		beq.s	lz4Rts19
    657e:	beq.s 65a6 <lz4Rts19>
		move.b	(a0)+,d0
    6580:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6582:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6584:	move.w (sp)+,d3
		move.b	d0,d3
    6586:	move.b d0,d3
		move.l	a1,a2
    6588:	movea.l a1,a2
		sub.l	d3,a2
    658a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    658c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    658e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6590:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6592:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6594:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6596:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6598:	moveq #0,d0
		move.b	(a0)+,d0
    659a:	move.b (a0)+,d0
		add.w	d0,d0
    659c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    659e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    65a2:	jmp (0,a3,d0.w)

000065a6 <lz4Rts19>:
lz4Rts19:	rts
    65a6:	rts

000065a8 <ll_sm3>:

ll_sm3:
		moveq	#15,d1
    65a8:	moveq #15,d1

000065aa <.cl8>:
.cl8:	move.b	(a0)+,d2
    65aa:	/-> move.b (a0)+,d2
		add.l d2,d1
    65ac:	|   add.l d2,d1
		not.b	d2
    65ae:	|   not.b d2
		beq.s	.cl8
    65b0:	\-- beq.s 65aa <.cl8>
		moveq	#15,d5
    65b2:	    moveq #15,d5
		and.w	d1,d5
    65b4:	    and.w d1,d5
		add.w	d5,d5
    65b6:	    add.w d5,d5
		neg.w	d5
    65b8:	    neg.w d5
		jmp		.eloop9(pc,d5.w)
    65ba:	    jmp (65de <.eloop9>,pc,d5.w)

000065be <.tloop9>:
.tloop9:
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
		move.b	(a0)+,(a1)+
    65ce:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65d0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65d2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65d4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65d6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65d8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65da:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    65dc:	move.b (a0)+,(a1)+

000065de <.eloop9>:
.eloop9:	sub.l	d7,d1
    65de:	sub.l d7,d1
		bpl.s	.tloop9
    65e0:	bpl.s 65be <.tloop9>
		cmpa.l	a0,a4
    65e2:	cmpa.l a0,a4
		beq.s	lz4Rts20
    65e4:	beq.s 660e <lz4Rts20>
		move.b	(a0)+,d0
    65e6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    65e8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    65ea:	move.w (sp)+,d3
		move.b	d0,d3
    65ec:	move.b d0,d3
		move.l	a1,a2
    65ee:	movea.l a1,a2
		sub.l	d3,a2
    65f0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    65f2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    65fe:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6600:	moveq #0,d0
		move.b	(a0)+,d0
    6602:	move.b (a0)+,d0
		add.w	d0,d0
    6604:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6606:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    660a:	jmp (0,a3,d0.w)

0000660e <lz4Rts20>:
lz4Rts20:	rts
    660e:	rts

00006610 <ll_sm4>:

ll_sm4:
		moveq	#15,d1
    6610:	moveq #15,d1

00006612 <.cl10>:
.cl10:	move.b	(a0)+,d2
    6612:	/-> move.b (a0)+,d2
		add.l d2,d1
    6614:	|   add.l d2,d1
		not.b	d2
    6616:	|   not.b d2
		beq.s	.cl10
    6618:	\-- beq.s 6612 <.cl10>
		moveq	#15,d5
    661a:	    moveq #15,d5
		and.w	d1,d5
    661c:	    and.w d1,d5
		add.w	d5,d5
    661e:	    add.w d5,d5
		neg.w	d5
    6620:	    neg.w d5
		jmp		.eloop11(pc,d5.w)
    6622:	    jmp (6646 <.eloop11>,pc,d5.w)

00006626 <.tloop11>:
.tloop11:
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
		move.b	(a0)+,(a1)+
    6640:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6642:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6644:	move.b (a0)+,(a1)+

00006646 <.eloop11>:
.eloop11:	sub.l	d7,d1
    6646:	sub.l d7,d1
		bpl.s	.tloop11
    6648:	bpl.s 6626 <.tloop11>
		cmpa.l	a0,a4
    664a:	cmpa.l a0,a4
		beq.s	lz4Rts21
    664c:	beq.s 6678 <lz4Rts21>
		move.b	(a0)+,d0
    664e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6650:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6652:	move.w (sp)+,d3
		move.b	d0,d3
    6654:	move.b d0,d3
		move.l	a1,a2
    6656:	movea.l a1,a2
		sub.l	d3,a2
    6658:	suba.l d3,a2
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
		moveq	#0,d0
    666a:	moveq #0,d0
		move.b	(a0)+,d0
    666c:	move.b (a0)+,d0
		add.w	d0,d0
    666e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6670:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6674:	jmp (0,a3,d0.w)

00006678 <lz4Rts21>:
lz4Rts21:	rts
    6678:	rts

0000667a <ll_sm5>:

ll_sm5:
		moveq	#15,d1
    667a:	moveq #15,d1

0000667c <.cl12>:
.cl12:	move.b	(a0)+,d2
    667c:	/-> move.b (a0)+,d2
		add.l d2,d1
    667e:	|   add.l d2,d1
		not.b	d2
    6680:	|   not.b d2
		beq.s	.cl12
    6682:	\-- beq.s 667c <.cl12>
		moveq	#15,d5
    6684:	    moveq #15,d5
		and.w	d1,d5
    6686:	    and.w d1,d5
		add.w	d5,d5
    6688:	    add.w d5,d5
		neg.w	d5
    668a:	    neg.w d5
		jmp		.eloop13(pc,d5.w)
    668c:	    jmp (66b0 <.eloop13>,pc,d5.w)

00006690 <.tloop13>:
.tloop13:
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

000066b0 <.eloop13>:
.eloop13:	sub.l	d7,d1
    66b0:	sub.l d7,d1
		bpl.s	.tloop13
    66b2:	bpl.s 6690 <.tloop13>
		cmpa.l	a0,a4
    66b4:	cmpa.l a0,a4
		beq.s	lz4Rts22
    66b6:	beq.s 66e4 <lz4Rts22>
		move.b	(a0)+,d0
    66b8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    66ba:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    66bc:	move.w (sp)+,d3
		move.b	d0,d3
    66be:	move.b d0,d3
		move.l	a1,a2
    66c0:	movea.l a1,a2
		sub.l	d3,a2
    66c2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    66c4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    66c6:	move.b (a2)+,(a1)+
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
		moveq	#0,d0
    66d6:	moveq #0,d0
		move.b	(a0)+,d0
    66d8:	move.b (a0)+,d0
		add.w	d0,d0
    66da:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    66dc:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    66e0:	jmp (0,a3,d0.w)

000066e4 <lz4Rts22>:
lz4Rts22:	rts
    66e4:	rts

000066e6 <ll_sm6>:

ll_sm6:
		moveq	#15,d1
    66e6:	moveq #15,d1

000066e8 <.cl14>:
.cl14:	move.b	(a0)+,d2
    66e8:	/-> move.b (a0)+,d2
		add.l d2,d1
    66ea:	|   add.l d2,d1
		not.b	d2
    66ec:	|   not.b d2
		beq.s	.cl14
    66ee:	\-- beq.s 66e8 <.cl14>
		moveq	#15,d5
    66f0:	    moveq #15,d5
		and.w	d1,d5
    66f2:	    and.w d1,d5
		add.w	d5,d5
    66f4:	    add.w d5,d5
		neg.w	d5
    66f6:	    neg.w d5
		jmp		.eloop15(pc,d5.w)
    66f8:	    jmp (671c <.eloop15>,pc,d5.w)

000066fc <.tloop15>:
.tloop15:
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

0000671c <.eloop15>:
.eloop15:	sub.l	d7,d1
    671c:	sub.l d7,d1
		bpl.s	.tloop15
    671e:	bpl.s 66fc <.tloop15>
		cmpa.l	a0,a4
    6720:	cmpa.l a0,a4
		beq.s	lz4Rts23
    6722:	beq.s 6752 <lz4Rts23>
		move.b	(a0)+,d0
    6724:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6726:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6728:	move.w (sp)+,d3
		move.b	d0,d3
    672a:	move.b d0,d3
		move.l	a1,a2
    672c:	movea.l a1,a2
		sub.l	d3,a2
    672e:	suba.l d3,a2
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

00006752 <lz4Rts23>:
lz4Rts23:	rts
    6752:	rts

00006754 <ll_sm7>:

ll_sm7:
		moveq	#15,d1
    6754:	moveq #15,d1

00006756 <.cl16>:
.cl16:	move.b	(a0)+,d2
    6756:	/-> move.b (a0)+,d2
		add.l d2,d1
    6758:	|   add.l d2,d1
		not.b	d2
    675a:	|   not.b d2
		beq.s	.cl16
    675c:	\-- beq.s 6756 <.cl16>
		moveq	#15,d5
    675e:	    moveq #15,d5
		and.w	d1,d5
    6760:	    and.w d1,d5
		add.w	d5,d5
    6762:	    add.w d5,d5
		neg.w	d5
    6764:	    neg.w d5
		jmp		.eloop17(pc,d5.w)
    6766:	    jmp (678a <.eloop17>,pc,d5.w)

0000676a <.tloop17>:
.tloop17:
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

0000678a <.eloop17>:
.eloop17:	sub.l	d7,d1
    678a:	sub.l d7,d1
		bpl.s	.tloop17
    678c:	bpl.s 676a <.tloop17>
		cmpa.l	a0,a4
    678e:	cmpa.l a0,a4
		beq.s	lz4Rts24
    6790:	beq.s 67c2 <lz4Rts24>
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
		moveq	#0,d0
    67b4:	moveq #0,d0
		move.b	(a0)+,d0
    67b6:	move.b (a0)+,d0
		add.w	d0,d0
    67b8:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    67ba:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    67be:	jmp (0,a3,d0.w)

000067c2 <lz4Rts24>:
lz4Rts24:	rts
    67c2:	rts

000067c4 <ll_sm8>:

ll_sm8:
		moveq	#15,d1
    67c4:	moveq #15,d1

000067c6 <.cl18>:
.cl18:	move.b	(a0)+,d2
    67c6:	/-> move.b (a0)+,d2
		add.l d2,d1
    67c8:	|   add.l d2,d1
		not.b	d2
    67ca:	|   not.b d2
		beq.s	.cl18
    67cc:	\-- beq.s 67c6 <.cl18>
		moveq	#15,d5
    67ce:	    moveq #15,d5
		and.w	d1,d5
    67d0:	    and.w d1,d5
		add.w	d5,d5
    67d2:	    add.w d5,d5
		neg.w	d5
    67d4:	    neg.w d5
		jmp		.eloop19(pc,d5.w)
    67d6:	    jmp (67fa <.eloop19>,pc,d5.w)

000067da <.tloop19>:
.tloop19:
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

000067fa <.eloop19>:
.eloop19:	sub.l	d7,d1
    67fa:	sub.l d7,d1
		bpl.s	.tloop19
    67fc:	bpl.s 67da <.tloop19>
		cmpa.l	a0,a4
    67fe:	cmpa.l a0,a4
		beq.s	lz4Rts25
    6800:	beq.s 6834 <lz4Rts25>
		move.b	(a0)+,d0
    6802:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6804:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6806:	move.w (sp)+,d3
		move.b	d0,d3
    6808:	move.b d0,d3
		move.l	a1,a2
    680a:	movea.l a1,a2
		sub.l	d3,a2
    680c:	suba.l d3,a2
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
		move.b	(a2)+,(a1)+
    681e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6820:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6822:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6824:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6826:	moveq #0,d0
		move.b	(a0)+,d0
    6828:	move.b (a0)+,d0
		add.w	d0,d0
    682a:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    682c:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6830:	jmp (0,a3,d0.w)

00006834 <lz4Rts25>:
lz4Rts25:	rts
    6834:	rts

00006836 <ll_sm9>:

ll_sm9:
		moveq	#15,d1
    6836:	moveq #15,d1

00006838 <.cl20>:
.cl20:	move.b	(a0)+,d2
    6838:	/-> move.b (a0)+,d2
		add.l d2,d1
    683a:	|   add.l d2,d1
		not.b	d2
    683c:	|   not.b d2
		beq.s	.cl20
    683e:	\-- beq.s 6838 <.cl20>
		moveq	#15,d5
    6840:	    moveq #15,d5
		and.w	d1,d5
    6842:	    and.w d1,d5
		add.w	d5,d5
    6844:	    add.w d5,d5
		neg.w	d5
    6846:	    neg.w d5
		jmp		.eloop21(pc,d5.w)
    6848:	    jmp (686c <.eloop21>,pc,d5.w)

0000684c <.tloop21>:
.tloop21:
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
		move.b	(a0)+,(a1)+
    6864:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6866:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6868:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    686a:	move.b (a0)+,(a1)+

0000686c <.eloop21>:
.eloop21:	sub.l	d7,d1
    686c:	sub.l d7,d1
		bpl.s	.tloop21
    686e:	bpl.s 684c <.tloop21>
		cmpa.l	a0,a4
    6870:	cmpa.l a0,a4
		beq.s	lz4Rts26
    6872:	beq.s 68a8 <lz4Rts26>
		move.b	(a0)+,d0
    6874:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6876:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6878:	move.w (sp)+,d3
		move.b	d0,d3
    687a:	move.b d0,d3
		move.l	a1,a2
    687c:	movea.l a1,a2
		sub.l	d3,a2
    687e:	suba.l d3,a2
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
		moveq	#0,d0
    689a:	moveq #0,d0
		move.b	(a0)+,d0
    689c:	move.b (a0)+,d0
		add.w	d0,d0
    689e:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    68a0:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    68a4:	jmp (0,a3,d0.w)

000068a8 <lz4Rts26>:
lz4Rts26:	rts
    68a8:	rts

000068aa <ll_sm10>:

ll_sm10:
		moveq	#15,d1
    68aa:	moveq #15,d1

000068ac <.cl22>:
.cl22:	move.b	(a0)+,d2
    68ac:	/-> move.b (a0)+,d2
		add.l d2,d1
    68ae:	|   add.l d2,d1
		not.b	d2
    68b0:	|   not.b d2
		beq.s	.cl22
    68b2:	\-- beq.s 68ac <.cl22>
		moveq	#15,d5
    68b4:	    moveq #15,d5
		and.w	d1,d5
    68b6:	    and.w d1,d5
		add.w	d5,d5
    68b8:	    add.w d5,d5
		neg.w	d5
    68ba:	    neg.w d5
		jmp		.eloop23(pc,d5.w)
    68bc:	    jmp (68e0 <.eloop23>,pc,d5.w)

000068c0 <.tloop23>:
.tloop23:
		move.b	(a0)+,(a1)+
    68c0:	move.b (a0)+,(a1)+
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

000068e0 <.eloop23>:
.eloop23:	sub.l	d7,d1
    68e0:	sub.l d7,d1
		bpl.s	.tloop23
    68e2:	bpl.s 68c0 <.tloop23>
		cmpa.l	a0,a4
    68e4:	cmpa.l a0,a4
		beq.s	lz4Rts27
    68e6:	beq.s 691e <lz4Rts27>
		move.b	(a0)+,d0
    68e8:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    68ea:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    68ec:	move.w (sp)+,d3
		move.b	d0,d3
    68ee:	move.b d0,d3
		move.l	a1,a2
    68f0:	movea.l a1,a2
		sub.l	d3,a2
    68f2:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    68f4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    68fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6900:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6902:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6904:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6906:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6908:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    690a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    690c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    690e:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6910:	moveq #0,d0
		move.b	(a0)+,d0
    6912:	move.b (a0)+,d0
		add.w	d0,d0
    6914:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6916:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    691a:	jmp (0,a3,d0.w)

0000691e <lz4Rts27>:
lz4Rts27:	rts
    691e:	rts

00006920 <ll_sm11>:

ll_sm11:
		moveq	#15,d1
    6920:	moveq #15,d1

00006922 <.cl24>:
.cl24:	move.b	(a0)+,d2
    6922:	/-> move.b (a0)+,d2
		add.l d2,d1
    6924:	|   add.l d2,d1
		not.b	d2
    6926:	|   not.b d2
		beq.s	.cl24
    6928:	\-- beq.s 6922 <.cl24>
		moveq	#15,d5
    692a:	    moveq #15,d5
		and.w	d1,d5
    692c:	    and.w d1,d5
		add.w	d5,d5
    692e:	    add.w d5,d5
		neg.w	d5
    6930:	    neg.w d5
		jmp		.eloop25(pc,d5.w)
    6932:	    jmp (6956 <.eloop25>,pc,d5.w)

00006936 <.tloop25>:
.tloop25:
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
		move.b	(a0)+,(a1)+
    6950:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6952:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6954:	move.b (a0)+,(a1)+

00006956 <.eloop25>:
.eloop25:	sub.l	d7,d1
    6956:	sub.l d7,d1
		bpl.s	.tloop25
    6958:	bpl.s 6936 <.tloop25>
		cmpa.l	a0,a4
    695a:	cmpa.l a0,a4
		beq.s	lz4Rts28
    695c:	beq.s 6996 <lz4Rts28>
		move.b	(a0)+,d0
    695e:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6960:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6962:	move.w (sp)+,d3
		move.b	d0,d3
    6964:	move.b d0,d3
		move.l	a1,a2
    6966:	movea.l a1,a2
		sub.l	d3,a2
    6968:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    696a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    696c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    696e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6970:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6972:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6974:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6976:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6978:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    697a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    697c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    697e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6980:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6982:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6984:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6986:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6988:	moveq #0,d0
		move.b	(a0)+,d0
    698a:	move.b (a0)+,d0
		add.w	d0,d0
    698c:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    698e:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6992:	jmp (0,a3,d0.w)

00006996 <lz4Rts28>:
lz4Rts28:	rts
    6996:	rts

00006998 <ll_sm12>:

ll_sm12:
		moveq	#15,d1
    6998:	moveq #15,d1

0000699a <.cl26>:
.cl26:	move.b	(a0)+,d2
    699a:	/-> move.b (a0)+,d2
		add.l d2,d1
    699c:	|   add.l d2,d1
		not.b	d2
    699e:	|   not.b d2
		beq.s	.cl26
    69a0:	\-- beq.s 699a <.cl26>
		moveq	#15,d5
    69a2:	    moveq #15,d5
		and.w	d1,d5
    69a4:	    and.w d1,d5
		add.w	d5,d5
    69a6:	    add.w d5,d5
		neg.w	d5
    69a8:	    neg.w d5
		jmp		.eloop27(pc,d5.w)
    69aa:	    jmp (69ce <.eloop27>,pc,d5.w)

000069ae <.tloop27>:
.tloop27:
		move.b	(a0)+,(a1)+
    69ae:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69b0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69b2:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69b4:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69b6:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69b8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69ba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    69bc:	move.b (a0)+,(a1)+
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

000069ce <.eloop27>:
.eloop27:	sub.l	d7,d1
    69ce:	sub.l d7,d1
		bpl.s	.tloop27
    69d0:	bpl.s 69ae <.tloop27>
		cmpa.l	a0,a4
    69d2:	cmpa.l a0,a4
		beq.s	lz4Rts29
    69d4:	beq.s 6a10 <lz4Rts29>
		move.b	(a0)+,d0
    69d6:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    69d8:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    69da:	move.w (sp)+,d3
		move.b	d0,d3
    69dc:	move.b d0,d3
		move.l	a1,a2
    69de:	movea.l a1,a2
		sub.l	d3,a2
    69e0:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    69e2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69e4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69e6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69e8:	move.b (a2)+,(a1)+
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
		move.b	(a2)+,(a1)+
    69f6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69f8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69fa:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69fc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    69fe:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a00:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6a02:	moveq #0,d0
		move.b	(a0)+,d0
    6a04:	move.b (a0)+,d0
		add.w	d0,d0
    6a06:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6a08:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6a0c:	jmp (0,a3,d0.w)

00006a10 <lz4Rts29>:
lz4Rts29:	rts
    6a10:	rts

00006a12 <ll_sm13>:

ll_sm13:
		moveq	#15,d1
    6a12:	moveq #15,d1

00006a14 <.cl28>:
.cl28:	move.b	(a0)+,d2
    6a14:	/-> move.b (a0)+,d2
		add.l d2,d1
    6a16:	|   add.l d2,d1
		not.b	d2
    6a18:	|   not.b d2
		beq.s	.cl28
    6a1a:	\-- beq.s 6a14 <.cl28>
		moveq	#15,d5
    6a1c:	    moveq #15,d5
		and.w	d1,d5
    6a1e:	    and.w d1,d5
		add.w	d5,d5
    6a20:	    add.w d5,d5
		neg.w	d5
    6a22:	    neg.w d5
		jmp		.eloop29(pc,d5.w)
    6a24:	    jmp (6a48 <.eloop29>,pc,d5.w)

00006a28 <.tloop29>:
.tloop29:
		move.b	(a0)+,(a1)+
    6a28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a40:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a42:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a44:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6a46:	move.b (a0)+,(a1)+

00006a48 <.eloop29>:
.eloop29:	sub.l	d7,d1
    6a48:	sub.l d7,d1
		bpl.s	.tloop29
    6a4a:	bpl.s 6a28 <.tloop29>
		cmpa.l	a0,a4
    6a4c:	cmpa.l a0,a4
		beq.s	lz4Rts30
    6a4e:	beq.s 6a8c <lz4Rts30>
		move.b	(a0)+,d0
    6a50:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6a52:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6a54:	move.w (sp)+,d3
		move.b	d0,d3
    6a56:	move.b d0,d3
		move.l	a1,a2
    6a58:	movea.l a1,a2
		sub.l	d3,a2
    6a5a:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6a5c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a5e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a60:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a62:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a64:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a66:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a68:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a6a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a6c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a6e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a70:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a72:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a74:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a76:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a78:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a7a:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6a7c:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6a7e:	moveq #0,d0
		move.b	(a0)+,d0
    6a80:	move.b (a0)+,d0
		add.w	d0,d0
    6a82:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6a84:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6a88:	jmp (0,a3,d0.w)

00006a8c <lz4Rts30>:
lz4Rts30:	rts
    6a8c:	rts

00006a8e <ll_sm14>:

ll_sm14:
		moveq	#15,d1
    6a8e:	moveq #15,d1

00006a90 <.cl30>:
.cl30:	move.b	(a0)+,d2
    6a90:	/-> move.b (a0)+,d2
		add.l d2,d1
    6a92:	|   add.l d2,d1
		not.b	d2
    6a94:	|   not.b d2
		beq.s	.cl30
    6a96:	\-- beq.s 6a90 <.cl30>
		moveq	#15,d5
    6a98:	    moveq #15,d5
		and.w	d1,d5
    6a9a:	    and.w d1,d5
		add.w	d5,d5
    6a9c:	    add.w d5,d5
		neg.w	d5
    6a9e:	    neg.w d5
		jmp		.eloop31(pc,d5.w)
    6aa0:	    jmp (6ac4 <.eloop31>,pc,d5.w)

00006aa4 <.tloop31>:
.tloop31:
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
		move.b	(a0)+,(a1)+
    6ab8:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6aba:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6abc:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6abe:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ac0:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6ac2:	move.b (a0)+,(a1)+

00006ac4 <.eloop31>:
.eloop31:	sub.l	d7,d1
    6ac4:	sub.l d7,d1
		bpl.s	.tloop31
    6ac6:	bpl.s 6aa4 <.tloop31>
		cmpa.l	a0,a4
    6ac8:	cmpa.l a0,a4
		beq.s	lz4Rts31
    6aca:	beq.s 6b0a <lz4Rts31>
		move.b	(a0)+,d0
    6acc:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6ace:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6ad0:	move.w (sp)+,d3
		move.b	d0,d3
    6ad2:	move.b d0,d3
		move.l	a1,a2
    6ad4:	movea.l a1,a2
		sub.l	d3,a2
    6ad6:	suba.l d3,a2
		move.b	(a2)+,(a1)+
    6ad8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ada:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6adc:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ade:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ae0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ae2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ae4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ae6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6ae8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6aea:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6aec:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6aee:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6af0:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6af2:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6af4:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6af6:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6af8:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6afa:	move.b (a2)+,(a1)+
		moveq	#0,d0
    6afc:	moveq #0,d0
		move.b	(a0)+,d0
    6afe:	move.b (a0)+,d0
		add.w	d0,d0
    6b00:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6b02:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6b06:	jmp (0,a3,d0.w)

00006b0a <lz4Rts31>:
lz4Rts31:	rts
    6b0a:	rts

00006b0c <ll_lm>:

ll_lm:
		moveq	#15,d1
    6b0c:	moveq #15,d1

00006b0e <.cl32>:
.cl32:	move.b	(a0)+,d2
    6b0e:	/-> move.b (a0)+,d2
		add.l d2,d1
    6b10:	|   add.l d2,d1
		not.b	d2
    6b12:	|   not.b d2
		beq.s	.cl32
    6b14:	\-- beq.s 6b0e <.cl32>
		moveq	#15,d5
    6b16:	    moveq #15,d5
		and.w	d1,d5
    6b18:	    and.w d1,d5
		add.w	d5,d5
    6b1a:	    add.w d5,d5
		neg.w	d5
    6b1c:	    neg.w d5
		jmp		.eloop33(pc,d5.w)
    6b1e:	    jmp (6b42 <.eloop33>,pc,d5.w)

00006b22 <.tloop33>:
.tloop33:
		move.b	(a0)+,(a1)+
    6b22:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b24:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b26:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b28:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b2a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b2c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b2e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b30:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b32:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b34:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b36:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b38:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b3a:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b3c:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b3e:	move.b (a0)+,(a1)+
		move.b	(a0)+,(a1)+
    6b40:	move.b (a0)+,(a1)+

00006b42 <.eloop33>:
.eloop33:	sub.l	d7,d1
    6b42:	sub.l d7,d1
		bpl.s	.tloop33
    6b44:	bpl.s 6b22 <.tloop33>
		cmpa.l	a0,a4
    6b46:	cmpa.l a0,a4
		beq.s	lz4Rts32
    6b48:	beq.s 6b9e <lz4Rts32>
		move.b	(a0)+,d0
    6b4a:	move.b (a0)+,d0
		move.b	(a0)+,-(a7)
    6b4c:	move.b (a0)+,-(sp)
		move.w	(a7)+,d3
    6b4e:	move.w (sp)+,d3
		move.b	d0,d3
    6b50:	move.b d0,d3
		move.l	a1,a2
    6b52:	movea.l a1,a2
		sub.l	d3,a2
    6b54:	suba.l d3,a2
		moveq	#15+4,d1
    6b56:	moveq #19,d1

00006b58 <.cl34>:
.cl34:	move.b	(a0)+,d2
    6b58:	/-> move.b (a0)+,d2
		add.l d2,d1
    6b5a:	|   add.l d2,d1
		not.b	d2
    6b5c:	|   not.b d2
		beq.s	.cl34
    6b5e:	\-- beq.s 6b58 <.cl34>
		moveq	#15,d5
    6b60:	    moveq #15,d5
		and.w	d1,d5
    6b62:	    and.w d1,d5
		add.w	d5,d5
    6b64:	    add.w d5,d5
		neg.w	d5
    6b66:	    neg.w d5
		jmp		.eloop35(pc,d5.w)
    6b68:	    jmp (6b8c <.eloop35>,pc,d5.w)

00006b6c <.tloop35>:
.tloop35:
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
		move.b	(a2)+,(a1)+
    6b7c:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b7e:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b80:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b82:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b84:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b86:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b88:	move.b (a2)+,(a1)+
		move.b	(a2)+,(a1)+
    6b8a:	move.b (a2)+,(a1)+

00006b8c <.eloop35>:
.eloop35:	sub.l	d7,d1
    6b8c:	sub.l d7,d1
		bpl.s	.tloop35
    6b8e:	bpl.s 6b6c <.tloop35>
		moveq	#0,d0
    6b90:	moveq #0,d0
		move.b	(a0)+,d0
    6b92:	move.b (a0)+,d0
		add.w	d0,d0
    6b94:	add.w d0,d0
		move.w	0(a3,d0.w),d0
    6b96:	move.w (0,a3,d0.w),d0
		jmp		0(a3,d0.w)
    6b9a:	jmp (0,a3,d0.w)

00006b9e <lz4Rts32>:
lz4Rts32:				
			rts
    6b9e:	rts

00006ba0 <lz4Over>:

lz4Over:	rts
    6ba0:	rts

00006ba2 <lz4jmp>:
    6ba2:	.short 0xf3b6


lz4jmp:
	dc.w	sl_sm0+32 - lz4jmp		| 00
    6ba4:	.short 0xf3fa
	dc.w	sl_sm1+32 - lz4jmp		| 01
    6ba6:	.short 0xf440
	dc.w	sl_sm2+32 - lz4jmp		| 02
    6ba8:	.short 0xf488
	dc.w	sl_sm3+32 - lz4jmp		| 03
    6baa:	.short 0xf4d2
	dc.w	sl_sm4+32 - lz4jmp		| 04
    6bac:	.short 0xf51e
	dc.w	sl_sm5+32 - lz4jmp		| 05
    6bae:	.short 0xf56c
	dc.w	sl_sm6+32 - lz4jmp		| 06
    6bb0:	.short 0xf5bc
	dc.w	sl_sm7+32 - lz4jmp		| 07
    6bb2:	.short 0xf60e
	dc.w	sl_sm8+32 - lz4jmp		| 08
    6bb4:	.short 0xf662
	dc.w	sl_sm9+32 - lz4jmp		| 09
    6bb6:	.short 0xf6b8
	dc.w	sl_sm10+32 - lz4jmp		| 0A
    6bb8:	.short 0xf710
	dc.w	sl_sm11+32 - lz4jmp		| 0B
    6bba:	.short 0xf76a
	dc.w	sl_sm12+32 - lz4jmp		| 0C
    6bbc:	.short 0xf7c6
	dc.w	sl_sm13+32 - lz4jmp		| 0D
    6bbe:	.short 0xf824
	dc.w	sl_sm14+32 - lz4jmp		| 0E
    6bc0:	.short 0xf884
	dc.w	sl_lm+32 - lz4jmp		| 0F
    6bc2:	.short 0xf3b0
	dc.w	sl_sm0+26 - lz4jmp		| 10
    6bc4:	.short 0xf3f4
	dc.w	sl_sm1+26 - lz4jmp		| 11
    6bc6:	.short 0xf43a
	dc.w	sl_sm2+26 - lz4jmp		| 12
    6bc8:	.short 0xf482
	dc.w	sl_sm3+26 - lz4jmp		| 13
    6bca:	.short 0xf4cc
	dc.w	sl_sm4+26 - lz4jmp		| 14
    6bcc:	.short 0xf518
	dc.w	sl_sm5+26 - lz4jmp		| 15
    6bce:	.short 0xf566
	dc.w	sl_sm6+26 - lz4jmp		| 16
    6bd0:	.short 0xf5b6
	dc.w	sl_sm7+26 - lz4jmp		| 17
    6bd2:	.short 0xf608
	dc.w	sl_sm8+26 - lz4jmp		| 18
    6bd4:	.short 0xf65c
	dc.w	sl_sm9+26 - lz4jmp		| 19
    6bd6:	.short 0xf6b2
	dc.w	sl_sm10+26 - lz4jmp		| 1A
    6bd8:	.short 0xf70a
	dc.w	sl_sm11+26 - lz4jmp		| 1B
    6bda:	.short 0xf764
	dc.w	sl_sm12+26 - lz4jmp		| 1C
    6bdc:	.short 0xf7c0
	dc.w	sl_sm13+26 - lz4jmp		| 1D
    6bde:	.short 0xf81e
	dc.w	sl_sm14+26 - lz4jmp		| 1E
    6be0:	.short 0xf87e
	dc.w	sl_lm+26 - lz4jmp		| 1F
    6be2:	.short 0xf3ae
	dc.w	sl_sm0+24 - lz4jmp		| 20
    6be4:	.short 0xf3f2
	dc.w	sl_sm1+24 - lz4jmp		| 21
    6be6:	.short 0xf438
	dc.w	sl_sm2+24 - lz4jmp		| 22
    6be8:	.short 0xf480
	dc.w	sl_sm3+24 - lz4jmp		| 23
    6bea:	.short 0xf4ca
	dc.w	sl_sm4+24 - lz4jmp		| 24
    6bec:	.short 0xf516
	dc.w	sl_sm5+24 - lz4jmp		| 25
    6bee:	.short 0xf564
	dc.w	sl_sm6+24 - lz4jmp		| 26
    6bf0:	.short 0xf5b4
	dc.w	sl_sm7+24 - lz4jmp		| 27
    6bf2:	.short 0xf606
	dc.w	sl_sm8+24 - lz4jmp		| 28
    6bf4:	.short 0xf65a
	dc.w	sl_sm9+24 - lz4jmp		| 29
    6bf6:	.short 0xf6b0
	dc.w	sl_sm10+24 - lz4jmp		| 2A
    6bf8:	.short 0xf708
	dc.w	sl_sm11+24 - lz4jmp		| 2B
    6bfa:	.short 0xf762
	dc.w	sl_sm12+24 - lz4jmp		| 2C
    6bfc:	.short 0xf7be
	dc.w	sl_sm13+24 - lz4jmp		| 2D
    6bfe:	.short 0xf81c
	dc.w	sl_sm14+24 - lz4jmp		| 2E
    6c00:	.short 0xf87c
	dc.w	sl_lm+24 - lz4jmp		| 2F
    6c02:	.short 0xf3ac
	dc.w	sl_sm0+22 - lz4jmp		| 30
    6c04:	.short 0xf3f0
	dc.w	sl_sm1+22 - lz4jmp		| 31
    6c06:	.short 0xf436
	dc.w	sl_sm2+22 - lz4jmp		| 32
    6c08:	.short 0xf47e
	dc.w	sl_sm3+22 - lz4jmp		| 33
    6c0a:	.short 0xf4c8
	dc.w	sl_sm4+22 - lz4jmp		| 34
    6c0c:	.short 0xf514
	dc.w	sl_sm5+22 - lz4jmp		| 35
    6c0e:	.short 0xf562
	dc.w	sl_sm6+22 - lz4jmp		| 36
    6c10:	.short 0xf5b2
	dc.w	sl_sm7+22 - lz4jmp		| 37
    6c12:	.short 0xf604
	dc.w	sl_sm8+22 - lz4jmp		| 38
    6c14:	.short 0xf658
	dc.w	sl_sm9+22 - lz4jmp		| 39
    6c16:	.short 0xf6ae
	dc.w	sl_sm10+22 - lz4jmp		| 3A
    6c18:	.short 0xf706
	dc.w	sl_sm11+22 - lz4jmp		| 3B
    6c1a:	.short 0xf760
	dc.w	sl_sm12+22 - lz4jmp		| 3C
    6c1c:	.short 0xf7bc
	dc.w	sl_sm13+22 - lz4jmp		| 3D
    6c1e:	.short 0xf81a
	dc.w	sl_sm14+22 - lz4jmp		| 3E
    6c20:	.short 0xf87a
	dc.w	sl_lm+22 - lz4jmp		| 3F
    6c22:	.short 0xf3aa
	dc.w	sl_sm0+20 - lz4jmp		| 40
    6c24:	.short 0xf3ee
	dc.w	sl_sm1+20 - lz4jmp		| 41
    6c26:	.short 0xf434
	dc.w	sl_sm2+20 - lz4jmp		| 42
    6c28:	.short 0xf47c
	dc.w	sl_sm3+20 - lz4jmp		| 43
    6c2a:	.short 0xf4c6
	dc.w	sl_sm4+20 - lz4jmp		| 44
    6c2c:	.short 0xf512
	dc.w	sl_sm5+20 - lz4jmp		| 45
    6c2e:	.short 0xf560
	dc.w	sl_sm6+20 - lz4jmp		| 46
    6c30:	.short 0xf5b0
	dc.w	sl_sm7+20 - lz4jmp		| 47
    6c32:	.short 0xf602
	dc.w	sl_sm8+20 - lz4jmp		| 48
    6c34:	.short 0xf656
	dc.w	sl_sm9+20 - lz4jmp		| 49
    6c36:	.short 0xf6ac
	dc.w	sl_sm10+20 - lz4jmp		| 4A
    6c38:	.short 0xf704
	dc.w	sl_sm11+20 - lz4jmp		| 4B
    6c3a:	.short 0xf75e
	dc.w	sl_sm12+20 - lz4jmp		| 4C
    6c3c:	.short 0xf7ba
	dc.w	sl_sm13+20 - lz4jmp		| 4D
    6c3e:	.short 0xf818
	dc.w	sl_sm14+20 - lz4jmp		| 4E
    6c40:	.short 0xf878
	dc.w	sl_lm+20 - lz4jmp		| 4F
    6c42:	.short 0xf3a8
	dc.w	sl_sm0+18 - lz4jmp		| 50
    6c44:	.short 0xf3ec
	dc.w	sl_sm1+18 - lz4jmp		| 51
    6c46:	.short 0xf432
	dc.w	sl_sm2+18 - lz4jmp		| 52
    6c48:	.short 0xf47a
	dc.w	sl_sm3+18 - lz4jmp		| 53
    6c4a:	.short 0xf4c4
	dc.w	sl_sm4+18 - lz4jmp		| 54
    6c4c:	.short 0xf510
	dc.w	sl_sm5+18 - lz4jmp		| 55
    6c4e:	.short 0xf55e
	dc.w	sl_sm6+18 - lz4jmp		| 56
    6c50:	.short 0xf5ae
	dc.w	sl_sm7+18 - lz4jmp		| 57
    6c52:	.short 0xf600
	dc.w	sl_sm8+18 - lz4jmp		| 58
    6c54:	.short 0xf654
	dc.w	sl_sm9+18 - lz4jmp		| 59
    6c56:	.short 0xf6aa
	dc.w	sl_sm10+18 - lz4jmp		| 5A
    6c58:	.short 0xf702
	dc.w	sl_sm11+18 - lz4jmp		| 5B
    6c5a:	.short 0xf75c
	dc.w	sl_sm12+18 - lz4jmp		| 5C
    6c5c:	.short 0xf7b8
	dc.w	sl_sm13+18 - lz4jmp		| 5D
    6c5e:	.short 0xf816
	dc.w	sl_sm14+18 - lz4jmp		| 5E
    6c60:	.short 0xf876
	dc.w	sl_lm+18 - lz4jmp		| 5F
    6c62:	.short 0xf3a6
	dc.w	sl_sm0+16 - lz4jmp		| 60
    6c64:	.short 0xf3ea
	dc.w	sl_sm1+16 - lz4jmp		| 61
    6c66:	.short 0xf430
	dc.w	sl_sm2+16 - lz4jmp		| 62
    6c68:	.short 0xf478
	dc.w	sl_sm3+16 - lz4jmp		| 63
    6c6a:	.short 0xf4c2
	dc.w	sl_sm4+16 - lz4jmp		| 64
    6c6c:	.short 0xf50e
	dc.w	sl_sm5+16 - lz4jmp		| 65
    6c6e:	.short 0xf55c
	dc.w	sl_sm6+16 - lz4jmp		| 66
    6c70:	.short 0xf5ac
	dc.w	sl_sm7+16 - lz4jmp		| 67
    6c72:	.short 0xf5fe
	dc.w	sl_sm8+16 - lz4jmp		| 68
    6c74:	.short 0xf652
	dc.w	sl_sm9+16 - lz4jmp		| 69
    6c76:	.short 0xf6a8
	dc.w	sl_sm10+16 - lz4jmp		| 6A
    6c78:	.short 0xf700
	dc.w	sl_sm11+16 - lz4jmp		| 6B
    6c7a:	.short 0xf75a
	dc.w	sl_sm12+16 - lz4jmp		| 6C
    6c7c:	.short 0xf7b6
	dc.w	sl_sm13+16 - lz4jmp		| 6D
    6c7e:	.short 0xf814
	dc.w	sl_sm14+16 - lz4jmp		| 6E
    6c80:	.short 0xf874
	dc.w	sl_lm+16 - lz4jmp		| 6F
    6c82:	.short 0xf3a4
	dc.w	sl_sm0+14 - lz4jmp		| 70
    6c84:	.short 0xf3e8
	dc.w	sl_sm1+14 - lz4jmp		| 71
    6c86:	.short 0xf42e
	dc.w	sl_sm2+14 - lz4jmp		| 72
    6c88:	.short 0xf476
	dc.w	sl_sm3+14 - lz4jmp		| 73
    6c8a:	.short 0xf4c0
	dc.w	sl_sm4+14 - lz4jmp		| 74
    6c8c:	.short 0xf50c
	dc.w	sl_sm5+14 - lz4jmp		| 75
    6c8e:	.short 0xf55a
	dc.w	sl_sm6+14 - lz4jmp		| 76
    6c90:	.short 0xf5aa
	dc.w	sl_sm7+14 - lz4jmp		| 77
    6c92:	.short 0xf5fc
	dc.w	sl_sm8+14 - lz4jmp		| 78
    6c94:	.short 0xf650
	dc.w	sl_sm9+14 - lz4jmp		| 79
    6c96:	.short 0xf6a6
	dc.w	sl_sm10+14 - lz4jmp		| 7A
    6c98:	.short 0xf6fe
	dc.w	sl_sm11+14 - lz4jmp		| 7B
    6c9a:	.short 0xf758
	dc.w	sl_sm12+14 - lz4jmp		| 7C
    6c9c:	.short 0xf7b4
	dc.w	sl_sm13+14 - lz4jmp		| 7D
    6c9e:	.short 0xf812
	dc.w	sl_sm14+14 - lz4jmp		| 7E
    6ca0:	.short 0xf872
	dc.w	sl_lm+14 - lz4jmp		| 7F
    6ca2:	.short 0xf3a2
	dc.w	sl_sm0+12 - lz4jmp		| 80
    6ca4:	.short 0xf3e6
	dc.w	sl_sm1+12 - lz4jmp		| 81
    6ca6:	.short 0xf42c
	dc.w	sl_sm2+12 - lz4jmp		| 82
    6ca8:	.short 0xf474
	dc.w	sl_sm3+12 - lz4jmp		| 83
    6caa:	.short 0xf4be
	dc.w	sl_sm4+12 - lz4jmp		| 84
    6cac:	.short 0xf50a
	dc.w	sl_sm5+12 - lz4jmp		| 85
    6cae:	.short 0xf558
	dc.w	sl_sm6+12 - lz4jmp		| 86
    6cb0:	.short 0xf5a8
	dc.w	sl_sm7+12 - lz4jmp		| 87
    6cb2:	.short 0xf5fa
	dc.w	sl_sm8+12 - lz4jmp		| 88
    6cb4:	.short 0xf64e
	dc.w	sl_sm9+12 - lz4jmp		| 89
    6cb6:	.short 0xf6a4
	dc.w	sl_sm10+12 - lz4jmp		| 8A
    6cb8:	.short 0xf6fc
	dc.w	sl_sm11+12 - lz4jmp		| 8B
    6cba:	.short 0xf756
	dc.w	sl_sm12+12 - lz4jmp		| 8C
    6cbc:	.short 0xf7b2
	dc.w	sl_sm13+12 - lz4jmp		| 8D
    6cbe:	.short 0xf810
	dc.w	sl_sm14+12 - lz4jmp		| 8E
    6cc0:	.short 0xf870
	dc.w	sl_lm+12 - lz4jmp		| 8F
    6cc2:	.short 0xf3a0
	dc.w	sl_sm0+10 - lz4jmp		| 90
    6cc4:	.short 0xf3e4
	dc.w	sl_sm1+10 - lz4jmp		| 91
    6cc6:	.short 0xf42a
	dc.w	sl_sm2+10 - lz4jmp		| 92
    6cc8:	.short 0xf472
	dc.w	sl_sm3+10 - lz4jmp		| 93
    6cca:	.short 0xf4bc
	dc.w	sl_sm4+10 - lz4jmp		| 94
    6ccc:	.short 0xf508
	dc.w	sl_sm5+10 - lz4jmp		| 95
    6cce:	.short 0xf556
	dc.w	sl_sm6+10 - lz4jmp		| 96
    6cd0:	.short 0xf5a6
	dc.w	sl_sm7+10 - lz4jmp		| 97
    6cd2:	.short 0xf5f8
	dc.w	sl_sm8+10 - lz4jmp		| 98
    6cd4:	.short 0xf64c
	dc.w	sl_sm9+10 - lz4jmp		| 99
    6cd6:	.short 0xf6a2
	dc.w	sl_sm10+10 - lz4jmp		| 9A
    6cd8:	.short 0xf6fa
	dc.w	sl_sm11+10 - lz4jmp		| 9B
    6cda:	.short 0xf754
	dc.w	sl_sm12+10 - lz4jmp		| 9C
    6cdc:	.short 0xf7b0
	dc.w	sl_sm13+10 - lz4jmp		| 9D
    6cde:	.short 0xf80e
	dc.w	sl_sm14+10 - lz4jmp		| 9E
    6ce0:	.short 0xf86e
	dc.w	sl_lm+10 - lz4jmp		| 9F
    6ce2:	.short 0xf39e
	dc.w	sl_sm0+8 - lz4jmp		| A0
    6ce4:	.short 0xf3e2
	dc.w	sl_sm1+8 - lz4jmp		| A1
    6ce6:	.short 0xf428
	dc.w	sl_sm2+8 - lz4jmp		| A2
    6ce8:	.short 0xf470
	dc.w	sl_sm3+8 - lz4jmp		| A3
    6cea:	.short 0xf4ba
	dc.w	sl_sm4+8 - lz4jmp		| A4
    6cec:	.short 0xf506
	dc.w	sl_sm5+8 - lz4jmp		| A5
    6cee:	.short 0xf554
	dc.w	sl_sm6+8 - lz4jmp		| A6
    6cf0:	.short 0xf5a4
	dc.w	sl_sm7+8 - lz4jmp		| A7
    6cf2:	.short 0xf5f6
	dc.w	sl_sm8+8 - lz4jmp		| A8
    6cf4:	.short 0xf64a
	dc.w	sl_sm9+8 - lz4jmp		| A9
    6cf6:	.short 0xf6a0
	dc.w	sl_sm10+8 - lz4jmp		| AA
    6cf8:	.short 0xf6f8
	dc.w	sl_sm11+8 - lz4jmp		| AB
    6cfa:	.short 0xf752
	dc.w	sl_sm12+8 - lz4jmp		| AC
    6cfc:	.short 0xf7ae
	dc.w	sl_sm13+8 - lz4jmp		| AD
    6cfe:	.short 0xf80c
	dc.w	sl_sm14+8 - lz4jmp		| AE
    6d00:	.short 0xf86c
	dc.w	sl_lm+8 - lz4jmp		| AF
    6d02:	.short 0xf39c
	dc.w	sl_sm0+6 - lz4jmp		| B0
    6d04:	.short 0xf3e0
	dc.w	sl_sm1+6 - lz4jmp		| B1
    6d06:	.short 0xf426
	dc.w	sl_sm2+6 - lz4jmp		| B2
    6d08:	.short 0xf46e
	dc.w	sl_sm3+6 - lz4jmp		| B3
    6d0a:	.short 0xf4b8
	dc.w	sl_sm4+6 - lz4jmp		| B4
    6d0c:	.short 0xf504
	dc.w	sl_sm5+6 - lz4jmp		| B5
    6d0e:	.short 0xf552
	dc.w	sl_sm6+6 - lz4jmp		| B6
    6d10:	.short 0xf5a2
	dc.w	sl_sm7+6 - lz4jmp		| B7
    6d12:	.short 0xf5f4
	dc.w	sl_sm8+6 - lz4jmp		| B8
    6d14:	.short 0xf648
	dc.w	sl_sm9+6 - lz4jmp		| B9
    6d16:	.short 0xf69e
	dc.w	sl_sm10+6 - lz4jmp		| BA
    6d18:	.short 0xf6f6
	dc.w	sl_sm11+6 - lz4jmp		| BB
    6d1a:	.short 0xf750
	dc.w	sl_sm12+6 - lz4jmp		| BC
    6d1c:	.short 0xf7ac
	dc.w	sl_sm13+6 - lz4jmp		| BD
    6d1e:	.short 0xf80a
	dc.w	sl_sm14+6 - lz4jmp		| BE
    6d20:	.short 0xf86a
	dc.w	sl_lm+6 - lz4jmp		| BF
    6d22:	.short 0xf39a
	dc.w	sl_sm0+4 - lz4jmp		| C0
    6d24:	.short 0xf3de
	dc.w	sl_sm1+4 - lz4jmp		| C1
    6d26:	.short 0xf424
	dc.w	sl_sm2+4 - lz4jmp		| C2
    6d28:	.short 0xf46c
	dc.w	sl_sm3+4 - lz4jmp		| C3
    6d2a:	.short 0xf4b6
	dc.w	sl_sm4+4 - lz4jmp		| C4
    6d2c:	.short 0xf502
	dc.w	sl_sm5+4 - lz4jmp		| C5
    6d2e:	.short 0xf550
	dc.w	sl_sm6+4 - lz4jmp		| C6
    6d30:	.short 0xf5a0
	dc.w	sl_sm7+4 - lz4jmp		| C7
    6d32:	.short 0xf5f2
	dc.w	sl_sm8+4 - lz4jmp		| C8
    6d34:	.short 0xf646
	dc.w	sl_sm9+4 - lz4jmp		| C9
    6d36:	.short 0xf69c
	dc.w	sl_sm10+4 - lz4jmp		| CA
    6d38:	.short 0xf6f4
	dc.w	sl_sm11+4 - lz4jmp		| CB
    6d3a:	.short 0xf74e
	dc.w	sl_sm12+4 - lz4jmp		| CC
    6d3c:	.short 0xf7aa
	dc.w	sl_sm13+4 - lz4jmp		| CD
    6d3e:	.short 0xf808
	dc.w	sl_sm14+4 - lz4jmp		| CE
    6d40:	.short 0xf868
	dc.w	sl_lm+4 - lz4jmp		| CF
    6d42:	.short 0xf398
	dc.w	sl_sm0+2 - lz4jmp		| D0
    6d44:	.short 0xf3dc
	dc.w	sl_sm1+2 - lz4jmp		| D1
    6d46:	.short 0xf422
	dc.w	sl_sm2+2 - lz4jmp		| D2
    6d48:	.short 0xf46a
	dc.w	sl_sm3+2 - lz4jmp		| D3
    6d4a:	.short 0xf4b4
	dc.w	sl_sm4+2 - lz4jmp		| D4
    6d4c:	.short 0xf500
	dc.w	sl_sm5+2 - lz4jmp		| D5
    6d4e:	.short 0xf54e
	dc.w	sl_sm6+2 - lz4jmp		| D6
    6d50:	.short 0xf59e
	dc.w	sl_sm7+2 - lz4jmp		| D7
    6d52:	.short 0xf5f0
	dc.w	sl_sm8+2 - lz4jmp		| D8
    6d54:	.short 0xf644
	dc.w	sl_sm9+2 - lz4jmp		| D9
    6d56:	.short 0xf69a
	dc.w	sl_sm10+2 - lz4jmp		| DA
    6d58:	.short 0xf6f2
	dc.w	sl_sm11+2 - lz4jmp		| DB
    6d5a:	.short 0xf74c
	dc.w	sl_sm12+2 - lz4jmp		| DC
    6d5c:	.short 0xf7a8
	dc.w	sl_sm13+2 - lz4jmp		| DD
    6d5e:	.short 0xf806
	dc.w	sl_sm14+2 - lz4jmp		| DE
    6d60:	.short 0xf866
	dc.w	sl_lm+2 - lz4jmp		| DF
    6d62:	.short 0xf396
	dc.w	sl_sm0+0 - lz4jmp		| E0
    6d64:	.short 0xf3da
	dc.w	sl_sm1+0 - lz4jmp		| E1
    6d66:	.short 0xf420
	dc.w	sl_sm2+0 - lz4jmp		| E2
    6d68:	.short 0xf468
	dc.w	sl_sm3+0 - lz4jmp		| E3
    6d6a:	.short 0xf4b2
	dc.w	sl_sm4+0 - lz4jmp		| E4
    6d6c:	.short 0xf4fe
	dc.w	sl_sm5+0 - lz4jmp		| E5
    6d6e:	.short 0xf54c
	dc.w	sl_sm6+0 - lz4jmp		| E6
    6d70:	.short 0xf59c
	dc.w	sl_sm7+0 - lz4jmp		| E7
    6d72:	.short 0xf5ee
	dc.w	sl_sm8+0 - lz4jmp		| E8
    6d74:	.short 0xf642
	dc.w	sl_sm9+0 - lz4jmp		| E9
    6d76:	.short 0xf698
	dc.w	sl_sm10+0 - lz4jmp		| EA
    6d78:	.short 0xf6f0
	dc.w	sl_sm11+0 - lz4jmp		| EB
    6d7a:	.short 0xf74a
	dc.w	sl_sm12+0 - lz4jmp		| EC
    6d7c:	.short 0xf7a6
	dc.w	sl_sm13+0 - lz4jmp		| ED
    6d7e:	.short 0xf804
	dc.w	sl_sm14+0 - lz4jmp		| EE
    6d80:	.short 0xf864
	dc.w	sl_lm+0 - lz4jmp		| EF
    6d82:	.short 0xf8da
	dc.w	ll_sm0 - lz4jmp		| F0
    6d84:	.short 0xf93c
	dc.w	ll_sm1 - lz4jmp		| F1
    6d86:	.short 0xf9a0
	dc.w	ll_sm2 - lz4jmp		| F2
    6d88:	.short 0xfa06
	dc.w	ll_sm3 - lz4jmp		| F3
    6d8a:	.short 0xfa6e
	dc.w	ll_sm4 - lz4jmp		| F4
    6d8c:	.short 0xfad8
	dc.w	ll_sm5 - lz4jmp		| F5
    6d8e:	.short 0xfb44
	dc.w	ll_sm6 - lz4jmp		| F6
    6d90:	.short 0xfbb2
	dc.w	ll_sm7 - lz4jmp		| F7
    6d92:	.short 0xfc22
	dc.w	ll_sm8 - lz4jmp		| F8
    6d94:	.short 0xfc94
	dc.w	ll_sm9 - lz4jmp		| F9
    6d96:	.short 0xfd08
	dc.w	ll_sm10 - lz4jmp		| FA
    6d98:	.short 0xfd7e
	dc.w	ll_sm11 - lz4jmp		| FB
    6d9a:	.short 0xfdf6
	dc.w	ll_sm12 - lz4jmp		| FC
    6d9c:	.short 0xfe70
	dc.w	ll_sm13 - lz4jmp		| FD
    6d9e:	.short 0xfeec
	dc.w	ll_sm14 - lz4jmp		| FE
    6da0:	.short 0xff6a

Disassembly of section CODE:

00006da2 <P61B>:

	endc	;ifne asmonereport

P61B:
P61_motuuli:
	jmp P61_Init(PC)
    6da2:	jmp 6e00 <_P61_Init>(pc)

	ifeq p61cia
	jmp P61_Music(PC)
	else
	rts
    6da6:	rts
	rts
    6da8:	rts
	endc

	jmp P61_End(PC)
    6daa:	jmp 70d2 <_P61_End>(pc)

	rts				;no P61_SetRepeat
    6dae:	rts
	rts
    6db0:	rts

	ifne p61jump
	jmp P61_SetPosition(PC)
	else
	rts
    6db2:	rts
	rts
    6db4:	rts

00006db6 <P61_Master>:
    6db6:	Address 0x6db8 is out of bounds.


00006db8 <P61_Tempo>:
    6db8:	Address 0x6dba is out of bounds.


00006dba <P61_Play>:
    6dba:	Address 0x6dbc is out of bounds.


00006dbc <P61_E8>:
	...

00006dbe <P61_VBR>:
    6dbe:	ori.b #0,d0

00006dc2 <P61_Pos>:
	...

00006dc4 <P61_Patt>:
	...

00006dc6 <P61_CRow>:
	...

00006dc8 <P61_Temp0Offset>:
    6dc8:	ori.b #-124,d0

00006dcc <P61_Temp1Offset>:
    6dcc:	ori.b #-60,d0

00006dd0 <P61_Temp2Offset>:
    6dd0:	ori.b #4,d0

00006dd4 <P61_Temp3Offset>:
    6dd4:	ori.b #68,d0

00006dd8 <P61_intti>:
.nonote:
	endm
	ifeq p61system
	ifne p61cia
P61_intti:
	movem.l d0-a6,-(sp)
    6dd8:	movem.l d0-a6,-(sp)
	tst.b $bfdd00
    6ddc:	tst.b bfdd00 <_end+0xb88a1c>
	lea $dff000+C,a6
    6de2:	lea dff000 <_end+0xd89d1c>,a6
	move #$2000,$9c-C(a6)
    6de8:	move.w #8192,156(a6)
	move #$2000,$9c-C(a6)
    6dee:	move.w #8192,156(a6)
	bsr P61_Music
    6df4:	bsr.w 7138 <_P61_Music>
	movem.l (sp)+,d0-a6
    6df8:	movem.l (sp)+,d0-a6
	nop
    6dfc:	nop
	rte
    6dfe:	rte

00006e00 <_P61_Init>:
* Returns:	D0=0 if okay (i.e. P61 module!). No need to change D0.l.
* NOTE: the define 'start' has been made runtime. move.w #<startpos>,P61_InitPos instead.

_P61_Init:
P61_Init:
	lea $dff000+C,a6
    6e00:	    lea dff000 <_end+0xd89d1c>,a6
	addq.w #4,a5
	dbf d5,.choffl
	endc
	endc

	cmp.l #"P61A",(a0)+
    6e06:	    cmpi.l #1345728833,(a0)+
	beq.b .modok
    6e0c:	/-- beq.s 6e10 <_P61_Init+0x10>
	subq.l #4,a0
    6e0e:	|   subq.l #4,a0
.modok:
	ifne p61cia
	move d0,-(sp)
    6e10:	\-> move.w d0,-(sp)
	endc
	moveq #0,d0
    6e12:	    moveq #0,d0
	cmp.l d0,a1
    6e14:	    cmpa.l d0,a1
	bne.b .redirect
    6e16:	/-- bne.s 6e1e <_P61_Init+0x1e>
	move (a0),d0
    6e18:	|   move.w (a0),d0
	lea (a0,d0.l),a1
    6e1a:	|   lea (0,a0,d0.l),a1
.redirect:
	move.l a2,a6
    6e1e:	\-> movea.l a2,a6
	lea 8(a0),a2
    6e20:	    lea 8(a0),a2
	moveq #$40,d0
    6e24:	    moveq #64,d0
	and.b 3(a0),d0
    6e26:	    and.b 3(a0),d0
	bne.b .buffer
    6e2a:	/-- bne.s 6e30 <_P61_Init+0x30>
	move.l a1,a6
    6e2c:	|   movea.l a1,a6
	subq.l #4,a2
    6e2e:	|   subq.l #4,a2
.buffer:

	lea P61_cn(pc),a3
    6e30:	\-> lea 7826 <P61_cn>(pc),a3

	move.w #$ff00,d1
    6e34:	    move.w #-256,d1
	move.w d1,P61_OnOff+P61_temp0-P61_cn(a3)	;stop active decsteps
    6e38:	    move.w d1,-248(a3)
	move.w d1,P61_OnOff+P61_temp1-P61_cn(a3)
    6e3c:	    move.w d1,-184(a3)
	move.w d1,P61_OnOff+P61_temp2-P61_cn(a3)
    6e40:	    move.w d1,-120(a3)
	move.w d1,P61_OnOff+P61_temp3-P61_cn(a3)
    6e44:	    move.w d1,-56(a3)

	ifne copdma
	move.l a4,p61_DMApokeAddr-P61_cn(a3)
	endc

	moveq #$1f,d1
    6e48:	    moveq #31,d1
	and.b 3(a0),d1
    6e4a:	    and.b 3(a0),d1
	move.l a0,-(sp)
    6e4e:	    move.l a0,-(sp)
;;    ---  insert pan/echo in this loop  ---
	lea P61_samples(pc),a4
    6e50:	    lea 789c <P61_samples>(pc),a4
	subq #1,d1
    6e54:	    subq.w #1,d1
	moveq #0,d4
    6e56:	    moveq #0,d4

00006e58 <P61_lopos>:
P61_lopos:
	move.l a6,(a4)+
    6e58:	move.l a6,(a4)+
	move (a2)+,d4
    6e5a:	move.w (a2)+,d4
	bpl.b P61_kook
    6e5c:	bpl.s 6e78 <P61_kook>
	neg d4
    6e5e:	neg.w d4
	lea P61_samples-16(pc),a5
    6e60:	lea 788c <P61_timers>(pc),a5
	ifeq opt020
	asl #4,d4
    6e64:	asl.w #4,d4
	move.l (a5,d4),d6
    6e66:	move.l (0,a5,d4.w),d6
	else
	add d4,d4
	move.l (a5,d4*8),d6
	endc
	move.l d6,-4(a4)
    6e6a:	move.l d6,-4(a4)
	ifeq opt020
	move 4(a5,d4),d4
    6e6e:	move.w (4,a5,d4.w),d4
	else
	move 4(a5,d4*8),d4
	endc
	sub.l d4,a6
    6e72:	suba.l d4,a6
	sub.l d4,a6
    6e74:	suba.l d4,a6
	bra.b P61_jatk
    6e76:	bra.s 6e9e <P61_jatk>

00006e78 <P61_kook>:
P61_kook:
	move.l a6,d6
    6e78:	    move.l a6,d6
	tst.b 3(a0)
    6e7a:	    tst.b 3(a0)
	bpl.b P61_jatk
    6e7e:	    bpl.s 6e9e <P61_jatk>
	tst.b (a2)
    6e80:	    tst.b (a2)
	bmi.b P61_jatk
    6e82:	    bmi.s 6e9e <P61_jatk>
	move d4,d0
    6e84:	    move.w d4,d0
	subq #2,d0
    6e86:	    subq.w #2,d0
	bmi.b P61_jatk
    6e88:	    bmi.s 6e9e <P61_jatk>
	move.l a1,a5
    6e8a:	    movea.l a1,a5
	move.b (a5)+,d2
    6e8c:	    move.b (a5)+,d2
	sub.b (a5),d2
    6e8e:	    sub.b (a5),d2
	move.b d2,(a5)+
    6e90:	    move.b d2,(a5)+
.loop:sub.b (a5),d2
    6e92:	/-> sub.b (a5),d2
	move.b d2,(a5)+
    6e94:	|   move.b d2,(a5)+
	sub.b (a5),d2
    6e96:	|   sub.b (a5),d2
	move.b d2,(a5)+
    6e98:	|   move.b d2,(a5)+
	dbf d0,.loop
    6e9a:	\-- dbf d0,6e92 <P61_kook+0x1a>

00006e9e <P61_jatk>:
P61_jatk:
	move d4,(a4)+
    6e9e:	    move.w d4,(a4)+
	moveq #0,d2
    6ea0:	    moveq #0,d2
	move.b (a2)+,d2
    6ea2:	    move.b (a2)+,d2
	moveq #0,d3
    6ea4:	    moveq #0,d3
	move.b (a2)+,d3
    6ea6:	    move.b (a2)+,d3
	moveq #0,d0
    6ea8:	    moveq #0,d0
	move (a2)+,d0
    6eaa:	    move.w (a2)+,d0
	bmi.b .norepeat
    6eac:	/-- bmi.s 6ebe <P61_jatk+0x20>
	move d4,d5
    6eae:	|   move.w d4,d5
	sub d0,d5
    6eb0:	|   sub.w d0,d5
	move.l d6,a5
    6eb2:	|   movea.l d6,a5
	add.l d0,a5
    6eb4:	|   adda.l d0,a5
	add.l d0,a5
    6eb6:	|   adda.l d0,a5
	move.l a5,(a4)+
    6eb8:	|   move.l a5,(a4)+
	move d5,(a4)+
    6eba:	|   move.w d5,(a4)+
	bra.b P61_gene
    6ebc:	|   bra.s 6ec4 <P61_gene>
.norepeat:
	move.l d6,(a4)+
    6ebe:	\-> move.l d6,(a4)+
	move #1,(a4)+
    6ec0:	    move.w #1,(a4)+

00006ec4 <P61_gene>:
P61_gene:
	move d3,(a4)+
    6ec4:	             move.w d3,(a4)+
	moveq #$f,d0
    6ec6:	             moveq #15,d0
	and d2,d0
    6ec8:	             and.w d2,d0
	mulu #74,d0
    6eca:	             mulu.w #74,d0
	move d0,(a4)+
    6ece:	             move.w d0,(a4)+
	tst -6(a2)
    6ed0:	             tst.w -6(a2)
	bmi.b .nobuffer
    6ed4:	/----------- bmi.s 6f20 <P61_gene+0x5c>
	moveq #$40,d0
    6ed6:	|            moveq #64,d0
	and.b 3(a0),d0
    6ed8:	|            and.b 3(a0),d0
	beq.b .nobuffer
    6edc:	+----------- beq.s 6f20 <P61_gene+0x5c>
	move d4,d7
    6ede:	|            move.w d4,d7
	tst.b d2
    6ee0:	|            tst.b d2
	bpl.b .copy
    6ee2:	|     /----- bpl.s 6f04 <P61_gene+0x40>
	subq #1,d7
    6ee4:	|     |      subq.w #1,d7
	moveq #0,d5
    6ee6:	|     |      moveq #0,d5
	moveq #0,d4
    6ee8:	|     |      moveq #0,d4
.lo:	move.b (a1)+,d4
    6eea:	|     |  /-> move.b (a1)+,d4
	moveq #$f,d3
    6eec:	|     |  |   moveq #15,d3
	and d4,d3
    6eee:	|     |  |   and.w d4,d3
	lsr #4,d4
    6ef0:	|     |  |   lsr.w #4,d4
	sub.b .table(pc,d4),d5
    6ef2:	|     |  |   sub.b (6f10 <P61_gene+0x4c>,pc,d4.w),d5
	move.b d5,(a6)+
    6ef6:	|     |  |   move.b d5,(a6)+
	sub.b .table(pc,d3),d5
    6ef8:	|     |  |   sub.b (6f10 <P61_gene+0x4c>,pc,d3.w),d5
	move.b d5,(a6)+
    6efc:	|     |  |   move.b d5,(a6)+
	dbf d7,.lo
    6efe:	|     |  \-- dbf d7,6eea <P61_gene+0x26>
	bra.b .kop
    6f02:	|  /--|----- bra.s 6f28 <P61_gene+0x64>
.copy:
	add d7,d7
    6f04:	|  |  \----> add.w d7,d7
	subq #1,d7
    6f06:	|  |         subq.w #1,d7
.cob:
	move.b (a1)+,(a6)+
    6f08:	|  |     /-> move.b (a1)+,(a6)+
	dbf d7,.cob
    6f0a:	|  |     \-- dbf d7,6f08 <P61_gene+0x44>
	bra.b .kop
    6f0e:	|  +-------- bra.s 6f28 <P61_gene+0x64>
    6f10:	|  |         ori.b #4,d1
    6f14:	|  |         btst #64,(a0)
    6f18:	|  |         divu.w d0,d0
    6f1a:	|  |         asr.w (-4,a0,sp.l)
    6f1e:	|  |         .short 0xfeff
.table:
	dc.b 0,1,2,4,8,16,32,64,128,-64,-32,-16,-8,-4,-2,-1
.nobuffer:
	move.l d4,d6
    6f20:	\--|-------> move.l d4,d6
	add.l d6,d6
    6f22:	   |         add.l d6,d6
	add.l d6,a6
    6f24:	   |         adda.l d6,a6
	add.l d6,a1
    6f26:	   |         adda.l d6,a1
.kop:
	dbf d1,P61_lopos
    6f28:	   \-------> dbf d1,6e58 <P61_lopos>
	move.l (sp)+,a0
    6f2c:	             movea.l (sp)+,a0
	and.b #$7f,3(a0)
    6f2e:	             andi.b #127,3(a0)
	move.l a2,-(sp)
    6f34:	             move.l a2,-(sp)
	lea P61_temp0(pc),a1
    6f36:	             lea 7726 <P61_temp0>(pc),a1
	lea P61_temp1(pc),a2
    6f3a:	             lea 7766 <P61_temp1>(pc),a2
	lea P61_temp2(pc),a4
    6f3e:	             lea 77a6 <P61_temp2>(pc),a4
	lea P61_temp3(pc),a5
    6f42:	             lea 77e6 <P61_temp3>(pc),a5
	moveq #Channel_Block_Size/2-2,d0
    6f46:	             moveq #30,d0
	moveq #0,d1
    6f48:	             moveq #0,d1
.cl:	move d1,(a1)+
    6f4a:	         /-> move.w d1,(a1)+
	move d1,(a2)+
    6f4c:	         |   move.w d1,(a2)+
	move d1,(a4)+
    6f4e:	         |   move.w d1,(a4)+
	move d1,(a5)+
    6f50:	         |   move.w d1,(a5)+
	dbf d0,.cl
    6f52:	         \-- dbf d0,6f4a <P61_gene+0x86>
	lea P61_temp0-P61_cn(a3),a1
    6f56:	             lea -256(a3),a1
	lea P61_emptysample-P61_cn(a3),a2
    6f5a:	             lea 614(a3),a2
	moveq #channels-1,d0
    6f5e:	             moveq #3,d0
.loo:
	move.l a2,P61_Sample(a1)
    6f60:	         /-> move.l a2,4(a1)
	lea Channel_Block_Size(a1),a1
    6f64:	         |   lea 64(a1),a1
	dbf d0,.loo
    6f68:	         \-- dbf d0,6f60 <P61_gene+0x9c>
	move.l (sp)+,a2
    6f6c:	             movea.l (sp)+,a2
	move.l a2,P61_positionbase-P61_cn(a3)
    6f6e:	             move.l a2,630(a3)
	moveq #$7f,d1
    6f72:	             moveq #127,d1
	and.b 2(a0),d1
    6f74:	             and.b 2(a0),d1
	ifeq opt020
	lsl #3,d1
    6f78:	             lsl.w #3,d1
	lea (a2,d1.l),a4
    6f7a:	             lea (0,a2,d1.l),a4
	else
	lea (a2,d1.l*8),a4
	endc
	move.l a4,P61_possibase-P61_cn(a3)	;base to pos. indices.
    6f7e:	             move.l a4,634(a3)
	move.l a4,a1
    6f82:	             movea.l a4,a1
	moveq #-1,d0
    6f84:	             moveq #-1,d0
.search:
	cmp.b (a1)+,d0
    6f86:	         /-> cmp.b (a1)+,d0
	bne.b .search
    6f88:	         \-- bne.s 6f86 <P61_gene+0xc2>
	move.l a1,P61_patternbase-P61_cn(a3)
    6f8a:	             move.l a1,638(a3)
	move.l a1,d0
    6f8e:	             move.l a1,d0
	sub.l a4,d0
    6f90:	             sub.l a4,d0
	subq.w #1,d0			;this is the * BUGFIX! whoa!
    6f92:	             subq.w #1,d0
	move d0,P61_slen-P61_cn(a3)
    6f94:	             move.w d0,80(a3)
;;    ---  Bugfix: P61_Init gives P61_slen=actual songlength +1.
;;    ---  This did not affect NextPattern, because it looks for endbyte flag.
;;    ---  It did affect Bxx/Dxx, but I guess nobody has tried to jump or 
;;    ---  break to Last Pattern, ever. Now fixed to set correct SLen and 
;;    ---  suddenly Bxx/Dxx/Setposition works as they should. //Photon
	add.w P61_InitPos(pc),a4	;position from which to start playing the song
    6f98:	             adda.w 7aac <P61_InitPos>(pc),a4

	moveq #0,d0
    6f9c:	             moveq #0,d0
	move.b (a4)+,d0
    6f9e:	             move.b (a4)+,d0
	move.l a4,P61_spos-P61_cn(a3)
    6fa0:	             move.l a4,88(a3)
	lsl #3,d0
    6fa4:	             lsl.w #3,d0
	add.l d0,a2
    6fa6:	             adda.l d0,a2
	move.l a1,a4
    6fa8:	             movea.l a1,a4
	moveq #0,d0	;hi word must be clear to manage >32K of patterns
    6faa:	             moveq #0,d0
	move (a2)+,d0	;and no movem-signextend. This code is correct.
    6fac:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6fae:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp0-P61_cn(a3)
    6fb2:	             move.l a1,-246(a3)
	move (a2)+,d0
    6fb6:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6fb8:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp1-P61_cn(a3)
    6fbc:	             move.l a1,-182(a3)
	move (a2)+,d0
    6fc0:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6fc2:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp2-P61_cn(a3)
    6fc6:	             move.l a1,-118(a3)
	move (a2)+,d0
    6fca:	             move.w (a2)+,d0
	lea (a4,d0.l),a1
    6fcc:	             lea (0,a4,d0.l),a1
	move.l a1,P61_ChaPos+P61_temp3-P61_cn(a3)
    6fd0:	             move.l a1,-54(a3)

	ifeq nowaveforms
	lea P61_setrepeat(pc),a0
    6fd4:	             lea 76c6 <P61_setrepeat>(pc),a0
	move.l a0,P61_intaddr-P61_cn(a3)
    6fd8:	             move.l a0,642(a3)
	endc

	move #63,P61_rowpos-P61_cn(a3)
    6fdc:	             move.w #63,78(a3)
	move #6,P61_speed-P61_cn(a3)
    6fe2:	             move.w #6,82(a3)
	move #5,P61_speed2-P61_cn(a3)
    6fe8:	             move.w #5,84(a3)
	clr P61_speedis1-P61_cn(a3)
    6fee:	             clr.w 86(a3)
	endc
	ifne P61_pde
	clr P61_pdelay-P61_cn(a3)
	clr P61_pdflag-P61_cn(a3)
	endc
	clr (a3)		;start frame of very first song note.
    6ff2:	             clr.w (a3)
;"reused" patterns with effects coming out of nowhere
;at start of song require 0. Otherwise F0x speed-2 is 
;ok, except if split4=1, set to F-speed - #channels.
;Don't change if you don't need 'the very quickest click to start' speed.
	moveq #2,d0
    6ff4:	             moveq #2,d0
	and.b $bfe001,d0
    6ff6:	             and.b bfe001 <_end+0xb88d1d>,d0
	move.b d0,P61_ofilter-P61_cn(a3)
    6ffc:	             move.b d0,100(a3)
	bset #1,$bfe001
    7000:	             bset #1,bfe001 <_end+0xb88d1d>
	lea P61_liko(pc),a5
	jsr -$1e(a6)
.no68010:
	move.l d0,P61_VBR-P61_cn(a3)
	endc
	move.l P61_VBR-P61_cn(a3),a0
    7008:	             movea.l -2664(a3),a0
	lea $78(a0),a0
    700c:	             lea 120(a0),a0
	move.l a0,P61_vektori-P61_cn(a3)
    7010:	             move.l a0,92(a3)
	move.l (a0),P61_oldlev6-P61_cn(a3)
    7014:	             move.l (a0),96(a3)
	ifeq copdma
	lea P61_dmason(pc),a1		;set 'dma-on-interrupt'.
    7018:	             lea 7690 <P61_dmason>(pc),a1
	move.l a1,(a0)
    701c:	             move.l a1,(a0)
	endc
	endc
	moveq #$f,d0
    701e:	             moveq #15,d0
	lea $dff000+C,a6		;a6 trashed above.
    7020:	             lea dff000 <_end+0xd89d1c>,a6
	ifeq quietstart
	moveq #$0,d1			;original code
    7026:	             moveq #0,d1
	move d1,$a8-C(a6)
    7028:	             move.w d1,168(a6)
	move d1,$b8-C(a6)
    702c:	             move.w d1,184(a6)
	move d1,$c8-C(a6)
    7030:	             move.w d1,200(a6)
	move d1,$d8-C(a6)
    7034:	             move.w d1,216(a6)
	move d0,$96-C(a6)
    7038:	             move.w d0,150(a6)
	move.w d0,P61_NewDMA-P61_cn(a3)	;"NEXTframe setloop" to be triggered
	endc

	ifeq p61system
	ifeq copdma
	lea P61_dmason(pc),a1		;again?
    703c:	             lea 7690 <P61_dmason>(pc),a1
	move.l a1,(a0)
    7040:	             move.l a1,(a0)
	endc
	move #$2000,$9a-C(a6)		;old timerb OFF
    7042:	             move.w #8192,154(a6)
	lea $bfd000,a0
    7048:	             lea bfd000 <_end+0xb87d1c>,a0
	lea P61_timers(pc),a1
    704e:	             lea 788c <P61_timers>(pc),a1
	move.b #$7f,$d00(a0)
    7052:	             move.b #127,3328(a0)

	ifne p61cia			;only affect cia if actually used
	move.b #$10,$e00(a0)
    7058:	             move.b #16,3584(a0)
	endc
	move.b #$10,$f00(a0)
    705e:	             move.b #16,3840(a0)
	ifne p61cia
	move.b $400(a0),(a1)+
    7064:	             move.b 1024(a0),(a1)+
	move.b $500(a0),(a1)+
    7068:	             move.b 1280(a0),(a1)+
	else
	addq.w #2,a1	
	endc

	move.b $600(a0),(a1)+
    706c:	             move.b 1536(a0),(a1)+
	move.b $700(a0),(a1)
    7070:	             move.b 1792(a0),(a1)
	endc
	ifeq (p61system+p61cia)
	move.b #$82,$d00(a0)
	endc
	ifne p61cia
	move (sp)+,d0
    7074:	             move.w (sp)+,d0
	subq #1,d0
    7076:	             subq.w #1,d0
	beq.b P61_ForcePAL
    7078:	             beq.s 707e <P61_ForcePAL>
	subq #1,d0
    707a:	             subq.w #1,d0
	beq.b P61_NTSC
    707c:	             beq.s 7086 <P61_NTSC>

0000707e <P61_ForcePAL>:
	move.l 4.w,a1
	cmp.b #60,$213(a1)
	beq.b P61_NTSC
	endc
P61_ForcePAL:
	move.l #1773447,d0
    707e:	move.l #1773447,d0
	bra.b P61_setcia
    7084:	bra.s 708c <P61_setcia>

00007086 <P61_NTSC>:
P61_NTSC:
	move.l #1789773,d0
    7086:	move.l #1789773,d0

0000708c <P61_setcia>:
P61_setcia:
	move.l d0,P61_timer-P61_cn(a3)
    708c:	move.l d0,114(a3)
	divu #125,d0
    7090:	divu.w #125,d0
	move d0,P61_thi2-P61_cn(a3)
    7094:	move.w d0,112(a3)
	sub #$1f0*2,d0
    7098:	sub.w #992,d0
	move d0,P61_thi-P61_cn(a3)
    709c:	move.w d0,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d0
    70a0:	move.w 112(a3),d0
	move.b d0,$400(a0)
    70a4:	move.b d0,1024(a0)
	lsr #8,d0
    70a8:	lsr.w #8,d0
	move.b d0,$500(a0)
    70aa:	move.b d0,1280(a0)
	lea P61_intti(pc),a1
    70ae:	lea 6dd8 <P61_intti>(pc),a1
	move.l a1,P61_tintti-P61_cn(a3)
    70b2:	move.l a1,106(a3)
	move.l P61_vektori(pc),a2
    70b6:	movea.l 7882 <P61_vektori>(pc),a2
	move.l a1,(a2)
    70ba:	move.l a1,(a2)
	move.b #$83,$d00(a0)
    70bc:	move.b #-125,3328(a0)
	move.b #$11,$e00(a0)
    70c2:	move.b #17,3584(a0)
	endc
	endc

	ifeq p61system
	ifeq copdma
	move #$e000,$9a-C(a6)	;level 6 timer B int, at least for setloop
    70c8:	move.w #-8192,154(a6)
	endc
	ifne quietstart
	move.w #$800f,$96-C(A6)	;make all used channels start a quiet loop.
	endc

	moveq #0,d0
    70ce:	moveq #0,d0
	rts
    70d0:	rts

000070d2 <_P61_End>:
* Input:	none.
* Uses:		D0-D1/A0-A1/A3/A6, A6 set to $dff000+C (your custombase) at exit.

_P61_End:
P61_End:
	lea $dff000+C,a6
    70d2:	lea dff000 <_end+0xd89d1c>,a6
	moveq #0,d0
    70d8:	moveq #0,d0
	move d0,$a8-C(a6)
    70da:	move.w d0,168(a6)
	move d0,$b8-C(a6)
    70de:	move.w d0,184(a6)
	move d0,$c8-C(a6)
    70e2:	move.w d0,200(a6)
	move d0,$d8-C(a6)
    70e6:	move.w d0,216(a6)
	move #$f,$96-C(a6)
    70ea:	move.w #15,150(a6)
	and.b #%11111101,$bfe001
    70f0:	andi.b #-3,bfe001 <_end+0xb88d1d>
	move.b P61_ofilter(pc),d0
    70f8:	move.b 788a <P61_ofilter>(pc),d0
	or.b d0,$bfe001
    70fc:	or.b d0,bfe001 <_end+0xb88d1d>
	ifeq p61system
	move #$2000,$9a-C(a6)
    7102:	move.w #8192,154(a6)
	move.l P61_vektori(pc),a0
    7108:	movea.l 7882 <P61_vektori>(pc),a0
	move.l P61_oldlev6(pc),(a0)
    710c:	move.l 7886 <P61_oldlev6>(pc),(a0)
	lea $bfd000,a0
    7110:	lea bfd000 <_end+0xb87d1c>,a0
	lea P61_timers(pc),a1
    7116:	lea 788c <P61_timers>(pc),a1

	ifne p61cia			;only affect cia if used
	move.b (a1)+,$400(a0)
    711a:	move.b (a1)+,1024(a0)
	move.b (a1)+,$500(a0)
    711e:	move.b (a1)+,1280(a0)
	else
	addq.w #2,a1
	endc
	move.b (a1)+,$600(a0)
    7122:	move.b (a1)+,1536(a0)
	move.b (a1)+,$700(a0)
    7126:	move.b (a1)+,1792(a0)
	ifne p61cia
	move.b #$10,$e00(a0)
    712a:	move.b #16,3584(a0)
	endc

	move.b #$10,$f00(a0)
    7130:	move.b #16,3840(a0)
	jsr -$150(a6)
	st P61_sigbit-P61_cn(a3)
P61_rem3:
	move.l (sp)+,a6
	endc
	rts
    7136:	rts

00007138 <_P61_Music>:
********** Main entry point from CIA/VB int or frame loop **********
* Input:	A6=your custombase ("$dff000")
* Uses:		D0-A7, A6 set to $dff000+C (your custombase) at exit.
_P61_Music:
P61_Music:
	lea P61_cn(pc),a3
    7138:	lea 7826 <P61_cn>(pc),a3
	moveq #0,d7			;replaced clr.* with move.* d7,
    713c:	moveq #0,d7
	lea $a0-C(a6),a4		;Aud Chan Base.
    713e:	lea 160(a6),a4

00007142 <P61_ohitaaa>:
	rts
	endc

P61_ohitaaa:
	ifne visuctrs				;easy visualizer counters.
	addq.w #1,P61_visuctr0-P61_cn(a3)	;inc elapsed #calls since last
    7142:	addq.w #1,650(a3)
	addq.w #1,P61_visuctr1-P61_cn(a3)
    7146:	addq.w #1,652(a3)
	addq.w #1,P61_visuctr2-P61_cn(a3)
    714a:	addq.w #1,654(a3)
	addq.w #1,P61_visuctr3-P61_cn(a3)
    714e:	addq.w #1,656(a3)
	
	ifne p61fade
	pea P61_mfade(pc)
	endc

	move.w (a3),d4
    7152:	move.w (a3),d4
	cmp.w P61_speed2(pc),d4	;Really compares with P61_speed, 1 added later.
    7154:	cmp.w 787a <P61_speed2>(pc),d4
	beq.w P61_playtime	;if new note frame, handle
    7158:	beq.w 747c <P61_playtime>

0000715c <P61_nowrap>:
	move d0,P61_CRow-P61_cn(a3)
	endc
;;    ---  end of rolled over code  ---

P61_nowrap:
	addq.w #1,d4			;NOW I do!
    715c:	addq.w #1,d4
	move d4,(a3)
    715e:	move.w d4,(a3)

00007160 <P61_delay>:
	move.b P61_tlo2(pc),(a0)
	move.b P61_thi2(pc),$100(a0)
	endc
	endc
********** mainfx handling **********
	lea P61_temp0(pc),a5
    7160:	lea 7726 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    7164:	moveq #3,d5

00007166 <P61_lopas>:
P61_lopas:
	tst.b P61_OnOff+1(a5)
    7166:	tst.b 9(a5)
	beq.w P61_contfxdone
    716a:	beq.w 71d6 <P61_contfxdone>
	moveq #$f,d0
    716e:	moveq #15,d0
	and (a5),d0
    7170:	and.w (a5),d0
	ifeq opt020
	add d0,d0
    7172:	add.w d0,d0
	move P61_jtab2(pc,d0),d0
    7174:	move.w (717c <P61_jtab2>,pc,d0.w),d0
	else
	move P61_jtab2(pc,d0*2),d0
	endc
	jmp P61_jtab2(pc,d0)
    7178:	jmp (717c <P61_jtab2>,pc,d0.w)

0000717c <P61_jtab2>:
    717c:	ori.w #90,(a2)+
    7180:	ori.w #90,(a2)+
    7184:	ori.w #90,(a2)+
    7188:	ori.w #90,(a2)+
    718c:	ori.w #90,(a2)+
    7190:	ori.b #90,-(a0)
    7194:	ori.w #90,(a2)+
    7198:	ori.w #90,(a2)+

0000719c <P61_volslide>:
	bra.w P61_contfxdone
	endc
;;    ---  period table move to before P61_cn  ---
	ifne P61_vs
P61_volslide:
	move.b P61_Info(a5),d0
    719c:	    move.b 2(a5),d0
	sub.b d0,P61_Volume+1(a5)
    71a0:	    sub.b d0,25(a5)
	bpl.b .test
    71a4:	/-- bpl.s 71b2 <P61_volslide+0x16>
	move d7,P61_Volume(a5)
    71a6:	|   move.w d7,24(a5)
	ifeq p61fade
	move d7,8(a4)
    71aa:	|   move.w d7,8(a4)
	else
	move d7,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    71ae:	|   bra.w 71d6 <P61_contfxdone>
.test:
	moveq #64,d0
    71b2:	\-> moveq #64,d0
	cmp P61_Volume(a5),d0
    71b4:	    cmp.w 24(a5),d0
	bge.b .ncs
    71b8:	/-- bge.s 71c6 <P61_volslide+0x2a>
	move d0,P61_Volume(a5)
    71ba:	|   move.w d0,24(a5)
	ifeq p61fade
	move d0,8(a4)
    71be:	|   move.w d0,8(a4)
	else
	move d0,P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    71c2:	|   bra.w 71d6 <P61_contfxdone>
.ncs:
	ifeq p61fade
	move P61_Volume(a5),8(a4)
    71c6:	\-> move.w 24(a5),8(a4)
	else
	move P61_Volume(a5),P61_Shadow(a5)
	endc
	bra.w P61_contfxdone
    71cc:	    bra.w 71d6 <P61_contfxdone>
	move d0,P61_Period(a5)
	move d7,P61_ToPeriod(a5)
.setper:
	move P61_Period(a5),6(a4)
	else
	nop
    71d0:	    nop
	endc
	bra.w P61_contfxdone
    71d2:	    bra.w 71d6 <P61_contfxdone>

000071d6 <P61_contfxdone>:
********** MainFX returns here from all fx **********
P61_contfxdone:
	ifne P61_il
	bsr.w P61_funk2
	endc
	lea Channel_Block_Size(a5),a5
    71d6:	lea 64(a5),a5
	lea Custom_Block_Size(a4),a4
    71da:	lea 16(a4),a4
	dbf d5,P61_lopas
    71de:	dbf d5,7166 <P61_lopas>
;;    ---  splitchans or normal decrunch  ---
	ifeq split4
	cmp P61_speed2(PC),d4		;'decrunch frame'? (1 before playtime)
    71e2:	cmp.w 787a <P61_speed2>(pc),d4
	bne.w P61_ret2
    71e6:	bne.w 747a <P61_ret2>

000071ea <P61_preplay2>:
P61_preplay2:

.pr:	ifle (channels-splitchans)
	printt "splitchans >= channels! Must be less."
	else
	moveq #(channels-splitchans)-1,d5	;do preplay "first" half
    71ea:	moveq #2,d5
	lea P61_temp0(pc),a5
    71ec:	lea 7726 <P61_temp0>(pc),a5
	bra.w P61_preplay
    71f0:	bra.w 736a <P61_preplay>

000071f4 <P61_MyJpt>:

	endc				;if split4
********** My Jump Table **********
P61_MyJpt:;jump table,%x1111xxx,%x111xxxx,%x11xxxxx=note,cmd,all - else empty
;	REPT 12
	jmp P61_all(PC)
    71f4:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    71f8:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    71fc:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7200:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    7204:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7208:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    720c:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7210:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    7214:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7218:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    721c:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7220:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    7224:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7228:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    722c:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7230:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    7234:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7238:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    723c:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7240:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    7244:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7248:	jmp 73e6 <P61_all2>(pc)
	jmp P61_all(PC)
    724c:	jmp 739a <P61_all>(pc)
	jmp P61_all2(PC)
    7250:	jmp 73e6 <P61_all2>(pc)
;	ENDR
	jmp P61_cmd(PC)
    7254:	jmp 73a4 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    7258:	jmp 73f2 <P61_cmd2>(pc)
	jmp P61_cmd(PC)
    725c:	jmp 73a4 <P61_cmd>(pc)
	jmp P61_cmd2(PC)
    7260:	jmp 73f2 <P61_cmd2>(pc)
	jmp P61_noote(PC)
    7264:	jmp 73b0 <P61_noote>(pc)
	jmp P61_note2(PC)
    7268:	jmp 7400 <P61_note2>(pc)
	jmp P61_empty(PC)
    726c:	jmp 7392 <P61_empty>(pc)
	jmp P61_empty2(PC)
    7270:	jmp 73dc <P61_empty2>(pc)

;	REPT 12
	jmp P61_allS(PC)
    7274:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    7278:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    727c:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    7280:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7284:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    7288:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    728c:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    7290:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    7294:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    7298:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    729c:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72a0:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72a4:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72a8:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72ac:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72b0:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72b4:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72b8:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72bc:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72c0:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72c4:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72c8:	jmp 7426 <P61_all2S>(pc)
	jmp P61_allS(PC)
    72cc:	jmp 73ca <P61_allS>(pc)
	jmp P61_all2S(PC)
    72d0:	jmp 7426 <P61_all2S>(pc)
;	ENDR
	jmp P61_cmdS(PC)
    72d4:	jmp 73d2 <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    72d8:	jmp 7430 <P61_cmd2S>(pc)
	jmp P61_cmdS(PC)
    72dc:	jmp 73d2 <P61_cmdS>(pc)
	jmp P61_cmd2S(PC)
    72e0:	jmp 7430 <P61_cmd2S>(pc)
	jmp P61_noteS(PC)
    72e4:	jmp 743c <P61_noteS>(pc)
	jmp P61_note2S(PC)
    72e8:	jmp 7414 <P61_note2S>(pc)
	jmp P61_emptyS(PC)
    72ec:	jmp 73c2 <P61_emptyS>(pc)

000072f0 <P61_empty2S>:
;	jmp P61_empty2S(PC)
********** END OF MYJPT **********
P61_empty2S:
	move d7,(a5)+
    72f0:	move.w d7,(a5)+
	move.b d7,(a5)+
    72f2:	move.b d7,(a5)+

000072f4 <P61_proccompS>:
;;    ---  alt exit  ---
P61_proccompS:
	move.b (a0)+,d1
    72f4:	    move.b (a0)+,d1
	move.b d1,d0
    72f6:	    move.b d1,d0

	add.b d1,d1
    72f8:	    add.b d1,d1
	bpl.b P61_permexit		;bit 6 was 0
    72fa:	    bpl.s 7360 <P61_permexit>
;;    ---  stay in chan, repeat  ---
.b6set:	bcs.b .bit16
    72fc:	/-- bcs.s 731a <P61_proccompS+0x26>

.bit8:	move.b d7,(a5)
    72fe:	|   move.b d7,(a5)
	subq.l #3,a5			;stay tuned to this channel!
    7300:	|   subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    7302:	|   and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    7304:	|   move.b d0,19(a5)
	move.b (a0)+,d0			;hi word is clear. (constant)
    7308:	|   move.b (a0)+,d0
	move.l a0,P61_ChaPos(a5)	;dupe of above
    730a:	|   move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    730e:	|   suba.l d0,a0
.jedi1:	move.b (a0)+,d0			;used in .empty etc
    7310:	|   move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7312:	|   moveq #-8,d1
	and.b d0,d1
    7314:	|   and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    7316:	|   jmp (72f4 <P61_proccompS>,pc,d1.w)

.bit16:	move.b d7,(a5)
    731a:	\-> move.b d7,(a5)
	subq.l #3,a5
    731c:	    subq.l #3,a5
	and.w d4,d0			;nec to clr hi byte
    731e:	    and.w d4,d0
	move.b d0,P61_TempLen+1(a5)
    7320:	    move.b d0,19(a5)
	ifeq opt020
	move.b (a0)+,d0			;hi word is clear. (constant)
    7324:	    move.b (a0)+,d0
	lsl #8,d0
    7326:	    lsl.w #8,d0
	move.b (a0)+,d0
    7328:	    move.b (a0)+,d0
	else
	move.w (a0)+,d0			;(potentially) odd-address word-read.
	endc
	move.l a0,P61_ChaPos(a5)	;dupe of above
    732a:	    move.l a0,10(a5)
	sub.l d0,a0			;this 'repeats' same but doesnt update!
    732e:	    suba.l d0,a0
.jedi2:	move.b (a0)+,d0			;used in .empty etc
    7330:	    move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7332:	    moveq #-8,d1
	and.b d0,d1
    7334:	    and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)
    7336:	    jmp (72f4 <P61_proccompS>,pc,d1.w)

0000733a <P61_Take>:

P61_Take:
	tst.b P61_TempLen+1(a5)		;faster than subq + addq!
    733a:	tst.b 19(a5)
	bne.b P61_takeone
    733e:	bne.s 734e <P61_takeone>

00007340 <P61_TakeNorm>:
P61_TakeNorm:				;this is more frequent than takeone
	move.l P61_ChaPos(a5),a0	;dflt - if takenorm
    7340:	movea.l 10(a5),a0
	move.b (a0)+,d0			;used in .empty etc
    7344:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7346:	moveq #-8,d1
	and.b d0,d1
    7348:	and.b d0,d1
	jmp P61_MyJpt+256+4(PC,d1.w)	;first call can be this...
    734a:	jmp (72f8 <P61_proccompS+0x4>,pc,d1.w)

0000734e <P61_takeone>:
P61_takeone:
	subq.b #1,P61_TempLen+1(a5)
    734e:	subq.b #1,19(a5)
	move.l P61_TempPos(a5),a0
    7352:	movea.l 14(a5),a0

00007356 <P61_Jedi>:
P61_Jedi:	;temp/repeat. copy below proccompS.
	move.b (a0)+,d0			;used in .empty etc
    7356:	move.b (a0)+,d0
	moveq #-8,d1			;if sign, new P61_pack, retaddr-2
    7358:	moveq #-8,d1
	and.b d0,d1
    735a:	and.b d0,d1
	jmp P61_MyJpt+256(PC,d1.w)	;but rest is always this
    735c:	jmp (72f4 <P61_proccompS>,pc,d1.w)

00007360 <P61_permexit>:
;;    ---  alt (perm) exit  ---		;does not affect maxtime.
P61_permexit:
	move.b d0,(a5)
    7360:	move.b d0,(a5)
	move.l a0,P61_ChaPos-3(a5)
    7362:	move.l a0,7(a5)
	bra.w P61_permdko
    7366:	bra.w 7450 <P61_permdko>

0000736a <P61_preplay>:

;;    ---  The hipper wilderbeest run gnu linux at midnight!  ---
	ifne P61_ft
	lea (P61_samples-16)-P61_cn(a3),a2
	endc
	moveq #$3f,d4
    736a:	moveq #63,d4
	moveq #-$10,d6			;intelligent on/off-flag
    736c:	moveq #-16,d6
	moveq #0,d0			;clear hi word, never dirtied below.
    736e:	moveq #0,d0

00007370 <P61_loaps>:
	move.l P61_ChaPos(a5),(a1)+
	move.l P61_TempPos(a5),(a1)+
	move P61_TempLen(a5),(a1)
	endc

	moveq #-65,d1			;%10111111 const
    7370:	moveq #-65,d1
	and.b P61_Pack(a5),d1
    7372:	and.b 3(a5),d1
	add.b d1,d1			;sign in carry
    7376:	add.b d1,d1
	beq.b P61_Take			;6 lsb bits 0?
    7378:	beq.s 733a <P61_Take>
	bcc.b P61_nodko
    737a:	bcc.s 7384 <P61_nodko>
	addq #3,a5
    737c:	addq.w #3,a5
	subq.b #1,(a5)
    737e:	subq.b #1,(a5)
	bra.w P61_permdko
    7380:	bra.w 7450 <P61_permdko>

00007384 <P61_nodko>:
P61_nodko:
	move.b d7,P61_OnOff+1(a5)
    7384:	move.b d7,9(a5)
	subq.b #1,P61_Pack(a5)
    7388:	subq.b #1,3(a5)
	addq #3,a5
    738c:	addq.w #3,a5
	bra.w P61_koto
    738e:	bra.w 7472 <P61_koto>

00007392 <P61_empty>:

;;    ---  routines  ---
P61_empty:
	move d7,(a5)+
    7392:	move.w d7,(a5)+
	move.b d7,(a5)+
    7394:	move.b d7,(a5)+
	bra.w P61_ex
    7396:	bra.w 744c <P61_ex>

0000739a <P61_all>:
P61_all:
	move.b d0,(a5)+		;but this can't...
    739a:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    739c:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    739e:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_ex
    73a0:	bra.w 744c <P61_ex>

000073a4 <P61_cmd>:
P61_cmd:
	moveq #$f,d1
    73a4:	moveq #15,d1
	and d0,d1
    73a6:	and.w d0,d1
	move d1,(a5)+
    73a8:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    73aa:	move.b (a0)+,(a5)+
	bra.w P61_ex
    73ac:	bra.w 744c <P61_ex>

000073b0 <P61_noote>:
P61_noote:
	moveq #7,d1
    73b0:	moveq #7,d1
	and d0,d1
    73b2:	and.w d0,d1
	lsl #8,d1
    73b4:	lsl.w #8,d1
	move.b (a0)+,d1
    73b6:	move.b (a0)+,d1
	lsl #4,d1
    73b8:	lsl.w #4,d1
	move d1,(a5)+
    73ba:	move.w d1,(a5)+
	move.b d7,(a5)+
    73bc:	move.b d7,(a5)+
	bra.w P61_ex
    73be:	bra.w 744c <P61_ex>

000073c2 <P61_emptyS>:
;;    ---  copyS  ---
P61_emptyS:
	move d7,(a5)+
    73c2:	move.w d7,(a5)+
	move.b d7,(a5)+
    73c4:	move.b d7,(a5)+
	bra.w P61_exS
    73c6:	bra.w 744a <P61_exS>

000073ca <P61_allS>:
P61_allS:
	move.b d0,(a5)+		;but this can't...
    73ca:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    73cc:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    73ce:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.b P61_exS
    73d0:	bra.s 744a <P61_exS>

000073d2 <P61_cmdS>:
P61_cmdS:
	moveq #$f,d1
    73d2:	moveq #15,d1
	and d0,d1
    73d4:	and.w d0,d1
	move d1,(a5)+
    73d6:	move.w d1,(a5)+
	move.b (a0)+,(a5)+	;join common endcontinues...
    73d8:	move.b (a0)+,(a5)+
	bra.b P61_exS
    73da:	bra.s 744a <P61_exS>

000073dc <P61_empty2>:
;;    ---    ---
********** copy, perm exit **********
P61_empty2:
	move d7,(a5)+
    73dc:	move.w d7,(a5)+
	move.b d7,(a5)+
    73de:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    73e0:	move.l a0,7(a5)
	bra.b P61_permdko
    73e4:	bra.s 7450 <P61_permdko>

000073e6 <P61_all2>:
P61_all2:
	move.b d0,(a5)+
    73e6:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    73e8:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    73ea:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	move.l a0,P61_ChaPos-3(a5)
    73ec:	move.l a0,7(a5)
	bra.b P61_permdko
    73f0:	bra.s 7450 <P61_permdko>

000073f2 <P61_cmd2>:
P61_cmd2:
	moveq #$f,d1
    73f2:	moveq #15,d1
	and d0,d1
    73f4:	and.w d0,d1
	move d1,(a5)+
    73f6:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    73f8:	move.b (a0)+,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    73fa:	move.l a0,7(a5)
	bra.b P61_permdko
    73fe:	bra.s 7450 <P61_permdko>

00007400 <P61_note2>:
P61_note2:
	moveq #7,d1
    7400:	moveq #7,d1
	and d0,d1
    7402:	and.w d0,d1
	lsl #8,d1
    7404:	lsl.w #8,d1
	move.b (a0)+,d1
    7406:	move.b (a0)+,d1
	lsl #4,d1
    7408:	lsl.w #4,d1
	move d1,(a5)+
    740a:	move.w d1,(a5)+
	move.b d7,(a5)+
    740c:	move.b d7,(a5)+
	move.l a0,P61_ChaPos-3(a5)
    740e:	move.l a0,7(a5)
	bra.b P61_permdko
    7412:	bra.s 7450 <P61_permdko>

00007414 <P61_note2S>:
;;    ---  copyS, diff exit  ---
P61_note2S:
	moveq #7,d1
    7414:	moveq #7,d1
	and d0,d1
    7416:	and.w d0,d1
	lsl #8,d1
    7418:	lsl.w #8,d1
	move.b (a0)+,d1
    741a:	move.b (a0)+,d1
	lsl #4,d1
    741c:	lsl.w #4,d1
	move d1,(a5)+
    741e:	move.w d1,(a5)+
	move.b d7,(a5)+
    7420:	move.b d7,(a5)+
	bra.w P61_proccompS
    7422:	bra.w 72f4 <P61_proccompS>

00007426 <P61_all2S>:
P61_all2S:
	move.b d0,(a5)+
    7426:	move.b d0,(a5)+
	ifeq opt020
	move.b (a0)+,(a5)+
    7428:	move.b (a0)+,(a5)+
	move.b (a0)+,(a5)+
    742a:	move.b (a0)+,(a5)+
	else
	move (a0)+,(a5)+
	endc
	bra.w P61_proccompS
    742c:	bra.w 72f4 <P61_proccompS>

00007430 <P61_cmd2S>:
P61_cmd2S:
	moveq #$f,d1
    7430:	moveq #15,d1
	and d0,d1
    7432:	and.w d0,d1
	move d1,(a5)+
    7434:	move.w d1,(a5)+
	move.b (a0)+,(a5)+
    7436:	move.b (a0)+,(a5)+
	bra.w P61_proccompS
    7438:	bra.w 72f4 <P61_proccompS>

0000743c <P61_noteS>:
;;    ---    ---
P61_noteS:
	moveq #7,d1
    743c:	moveq #7,d1
	and d0,d1
    743e:	and.w d0,d1
	lsl #8,d1
    7440:	lsl.w #8,d1
	move.b (a0)+,d1
    7442:	move.b (a0)+,d1
	lsl #4,d1
    7444:	lsl.w #4,d1
	move d1,(a5)+
    7446:	move.w d1,(a5)+
	move.b d7,(a5)+
    7448:	move.b d7,(a5)+

0000744a <P61_exS>:
;;    ---  norm (temp) exit  ---
;This exit is called when you have max rastertime.
P61_exS:
	move.b (a0)+,(a5)
    744a:	move.b (a0)+,(a5)

0000744c <P61_ex>:
P61_ex:
	move.l a0,P61_TempPos-3(a5)
    744c:	move.l a0,11(a5)

00007450 <P61_permdko>:
P61_permdko:
	move.w d6,P61_OnOff-3(a5)		;was byte size in word var...
    7450:	move.w d6,5(a5)
	move -3(a5),d0
    7454:	move.w -3(a5),d0
	and #$1f0,d0
    7458:	and.w #496,d0
	beq.b .koto
    745c:	beq.s 7472 <P61_koto>
	ifne P61_ft
	lea (a2,d0),a1			;this is not the same a2 as the fix.
	else
	lea (P61_samples-16)-P61_cn(a3),a1
    745e:	lea 102(a3),a1
	add d0,a1
    7462:	adda.w d0,a1
	endc
	move.l a1,P61_Sample-3(a5)
    7464:	move.l a1,1(a5)
	ifne P61_ft
	move.l P61_SampleVolume(a1),P61_Volume-3(a5)
	else
	move P61_SampleVolume(a1),P61_Volume-3(a5)
    7468:	move.w 12(a1),21(a5)
	endc
	ifne P61_il
	move.l P61_RepeatOffset(a1),P61_Wave-3(a5)
	endc
	ifne P61_sof
	move d7,P61_Offset-3(a5)
    746e:	move.w d7,25(a5)

00007472 <P61_koto>:
	endc
.koto:
P61_koto:
	ifeq split4			;split4 means only do once.
	lea Channel_Block_Size-3(a5),a5
    7472:	lea 61(a5),a5
	dbf d5,P61_loaps
    7476:	dbf d5,7370 <P61_loaps>

0000747a <P61_ret2>:
	endc
P61_ret2:
	rts
    747a:	rts

0000747c <P61_playtime>:

********** END OF LOAPS LOOP **********
********** here comes another :) **********
	ifeq dupedec
P61_playtime:
	addq.w #1,(a3)	;inc framecount past _Speed for detection+reset later
    747c:	addq.w #1,(a3)
	ifeq split4
	ifgt splitchans
	moveq #splitchans-1,d5		;channels split off?(optimization flag)
    747e:	moveq #0,d5
	lea P61_temp0+Channel_Block_Size*(channels-splitchans)(PC),a5
    7480:	lea 77e6 <P61_temp3>(pc),a5
	bsr P61_preplay
    7484:	bsr.w 736a <P61_preplay>

00007488 <P61_playtimeCont>:
.djdj:
	move d7,P61_pdflag-P61_cn(a3)
	endc

	ifne suppF01
	tst P61_speedis1-P61_cn(a3)
    7488:	       tst.w 86(a3)
	beq.b .mo
    748c:	/----- beq.s 74a0 <P61_playtimeCont+0x18>

	lea P61_temp0(pc),a5
    748e:	|      lea 7726 <P61_temp0>(pc),a5
	moveq #channels-1,d5
    7492:	|      moveq #3,d5
.chl:	bsr.w P61_preplay		;then do the remaining from prev frame
    7494:	|  /-> bsr.w 736a <P61_preplay>
	ifeq split4		;split4 means preplay is one-shot. So ext loop.
	lea Channel_Block_Size-3(a5),a5
    7498:	|  |   lea 61(a5),a5
	dbf d5,.chl
    749c:	|  \-- dbf d5,7494 <P61_playtimeCont+0xc>
.mo:
	endc	;suppF01

	ifeq copdma&nowaveforms		;both must be off to skip int.
	ifeq p61system		;main 'new note' int starter.
	lea P61_dmason(pc),a1
    74a0:	\----> lea 7690 <P61_dmason>(pc),a1
	move.l P61_vektori(pc),a0
    74a4:	       movea.l 7882 <P61_vektori>(pc),a0
	move.l a1,(a0)
    74a8:	       move.l a1,(a0)
	move.b #$f0,$bfd600		;496 ticks=11.000677 scanlines,
    74aa:	       move.b #-16,bfd600 <_end+0xb8831c>
	move.b #$01,$bfd700		;dmaoff $1.38 scanlines later on 68000.
    74b2:	       move.b #1,bfd700 <_end+0xb8841c>
	move.b #$19,$bfdf00		;With unlucky timing and max period 856
    74ba:	       move.b #25,bfdf00 <_end+0xb88c1c>
	move.b #$f0,(a1)
	move.b #1,$100(a1)
	endc
	endc

	moveq #0,d4			;clr dmamask accumulator
    74c2:	       moveq #0,d4
	moveq #channels-1,d5
    74c4:	       moveq #3,d5
	lea P61_temp0(pc),a5
    74c6:	       lea 7726 <P61_temp0>(pc),a5
	bra.w P61_loscont		;I'd trade a bra for 2 Leias any day!
    74ca:	       bra.w 74f6 <P61_loscont>
    74ce:	       ori.b #28,(a4)+
    74d2:	       ori.b #28,(a4)+
    74d6:	       ori.b #28,(a4)+
    74da:	       ori.b #28,(a4)+
    74de:	       ori.b #-42,(a4)+
    74e2:	       ori.b #28,(a4)+
    74e6:	       btst d0,(28,a6,d0.w)
    74ea:	       ori.b #64,(a4)+

000074ee <P61_jtab>:
	endc
.j:
P61_jtab:
;;    ---  end of table  ---
P61_los:
	lea Custom_Block_Size(a4),a4
    74ee:	lea 16(a4),a4
	lea Channel_Block_Size(a5),a5
    74f2:	lea 64(a5),a5

000074f6 <P61_loscont>:
P61_loscont:
	move P61_OnOff(a5),d0		;$ff00/$ffff? if off, will goto nocha.
    74f6:	move.w 8(a5),d0
	ifeq p61bigjtab
	tst.b d0
    74fa:	tst.b d0
	beq.s P61_nocha
    74fc:	beq.s 7530 <P61_nocha>
	endc
	or (a5),d0
    74fe:	or.w (a5),d0
	add d0,d0			;->$fe00..$fffe (if big jtab)
    7500:	add.w d0,d0
	move P61_jtab(PC,d0),d0
    7502:	move.w (74ee <P61_jtab>,pc,d0.w),d0
	jmp P61_jtab(PC,d0)
    7506:	jmp (74ee <P61_jtab>,pc,d0.w)

0000750a <P61_fxdone>:

P61_fxdone:				;this sets dma and paula values
	moveq #$7e,d0
    750a:	moveq #126,d0
	and.b (a5),d0
    750c:	and.b (a5),d0
	beq.b P61_nocha
    750e:	beq.s 7530 <P61_nocha>
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    7510:	move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    7514:	move.w (2,a3,d0.w),22(a5)

0000751a <P61_zample>:
P61_zample:				;also direct target for finetune retrig
	ifne P61_sof
	tst P61_Offset(a5)
    751a:	tst.w 28(a5)
	bne.w P61_pek
    751e:	bne.w 75fa <P61_pek>
	endc
;;    ---  check DMA-mask for pan/echo samplestarts, modify it, mix.  ---
;	bsr P61_Synth		;synth/pan/echo cpu-mix routine. Not done yet.
;;   --- modify below code to not touch synth/pan/echo fixchans ---
	or P61_DMABit(a5),d4		;accumulate channels touched
    7522:	or.w 62(a5),d4
	move.l P61_Sample(a5),a1	;skipped if nocha
    7526:	movea.l 4(a5),a1
	ifeq oscillo
	move.l (a1)+,(a4)
    752a:	move.l (a1)+,(a4)
	move (a1),4(a4)
    752c:	move.w (a1),4(a4)

00007530 <P61_nocha>:
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo
P61_nocha:
	ifeq p61fade
	move.l P61_Period(a5),6(a4)
    7530:	move.l 22(a5),6(a4)

00007536 <P61_skip>:
	endc
P61_skip:
	ifne P61_il
	bsr.w P61_funk2
	endc
	DBF d5,P61_los
    7536:	dbf d5,74ee <P61_jtab>

0000753a <P61_chansdone>:
	bpl.b .noch0
	move.w d7,$aa-C(A6)		;clear AUDxDAT
.noch0:
	endc

	move d4,$96-C(a6)	;DMAclear - changed to not be written 4 times
    753a:	       move.w d4,150(a6)

	ifne visuctrs
	lea P61_visuctr0+channels*2(PC),a0
    753e:	       lea 7ab8 <P61E>(pc),a0
	moveq #channels-1,d5
    7542:	       moveq #3,d5
.visul:	subq.w #2,a0
    7544:	/----> subq.w #2,a0
	btst d5,d4
    7546:	|      btst d5,d4
	beq.s .noctr0
    7548:	|  /-- beq.s 754c <P61_chansdone+0x12>
	move.w d7,(a0)
    754a:	|  |   move.w d7,(a0)
.noctr0:
	dbf d5,.visul
    754c:	\--\-X dbf d5,7544 <P61_chansdone+0xa>

	ifne copdma
	move.l p61_DMApokeAddr(PC),a0
	move.b d4,(a0)		;only the low byte is poked, allowing other dma
	endc
	move.b d4,P61_dma+1-P61_cn(a3)
    7550:	       move.b d4,77(a3)
;;    ---  non-rolled over code  --- compatible with F01.
	ifne suppF01				;moved to here in P6110.
	ifne nowaveforms
	move.b d4,P61_NewDMA+1-P61_cn(a3)	;or set by fx
	endc
	move.w d7,(a3)				;clr p61_cn
    7554:	       move.w d7,(a3)
	move d0,P61_CRow-P61_cn(a3)
	rts
P61_ohittaa:					;nextrow
	endc

	subq #1,P61_rowpos-P61_cn(a3)		;next pattern-step
    7556:	       subq.w #1,78(a3)
	bpl.b P61_nonewpatt
    755a:	       bpl.s 75b8 <P61_nonewpatt>

0000755c <P61_nextpattern>:

P61_nextpattern:
	ifne P61_pl
	move d7,P61_plflag-P61_cn(a3)
	endc
	move.l P61_patternbase(pc),a0
    755c:	movea.l 7aa4 <P61_patternbase>(pc),a0
	moveq #63,d0
    7560:	moveq #63,d0
	move d0,P61_rowpos-P61_cn(a3)
    7562:	move.w d0,78(a3)
	move d7,P61_CRow-P61_cn(a3)
    7566:	move.w d7,-2656(a3)
	move.l P61_spos(pc),a1
    756a:	movea.l 787e <P61_spos>(pc),a1
	addq #1,P61_Pos-P61_cn(a3)
    756e:	addq.w #1,-2660(a3)
	move.b (a1)+,d0
    7572:	move.b (a1)+,d0
	bpl.b P61_dk
    7574:	bpl.s 7580 <P61_dk>
	move.l P61_possibase(pc),a1
    7576:	movea.l 7aa0 <P61_possibase>(pc),a1
	move.b (a1)+,d0
    757a:	move.b (a1)+,d0
	move d7,P61_Pos-P61_cn(a3)
    757c:	move.w d7,-2660(a3)

00007580 <P61_dk>:
P61_dk:
	move.l a1,P61_spos-P61_cn(a3)
    7580:	move.l a1,88(a3)
	move d0,P61_Patt-P61_cn(a3)
    7584:	move.w d0,-2658(a3)
	lsl #3,d0
    7588:	lsl.w #3,d0
	move.l P61_positionbase(pc),a1
    758a:	movea.l 7a9c <P61_positionbase>(pc),a1
	add.l d0,a1
    758e:	adda.l d0,a1
	move.w (a1)+,d0			;no movem sign-extend... check.
    7590:	move.w (a1)+,d0
	add.l a0,d0
    7592:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp0-P61_cn(a3)
    7594:	move.l d0,-246(a3)
	moveq #0,d0			;actually faster than lea (a0,d0.l)
    7598:	moveq #0,d0
	move.w (a1)+,d0			;for some reason this code doesn't 
    759a:	move.w (a1)+,d0
	add.l a0,d0			;use 'ifgt channels-1' etc. Kept as is.
    759c:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp1-P61_cn(a3)
    759e:	move.l d0,-182(a3)
	moveq #0,d0
    75a2:	moveq #0,d0
	move.w (a1)+,d0
    75a4:	move.w (a1)+,d0
	add.l a0,d0
    75a6:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp2-P61_cn(a3)
    75a8:	move.l d0,-118(a3)
	moveq #0,d0
    75ac:	moveq #0,d0
	move.w (a1)+,d0
    75ae:	move.w (a1)+,d0
	add.l a0,d0
    75b0:	add.l a0,d0
	move.l d0,P61_ChaPos+P61_temp3-P61_cn(a3)
    75b2:	move.l d0,-54(a3)
	rts
    75b6:	rts

000075b8 <P61_nonewpatt>:
P61_nonewpatt:
	moveq #63,d0
    75b8:	moveq #63,d0
	sub P61_rowpos-P61_cn(a3),d0
    75ba:	sub.w 78(a3),d0
	move d0,P61_CRow-P61_cn(a3)
    75be:	move.w d0,-2656(a3)
;;    ---  end of non-rolled over code  ---
	endc	;suppF01
	rts				;end of P61_playtime.
    75c2:	rts

000075c4 <P61_sampleoffse>:
	bra.w P61_nocha
	endc

	ifne P61_sof
P61_sampleoffse:
	moveq #0,d1
    75c4:	    moveq #0,d1
	move #$ff00,d1
    75c6:	    move.w #-256,d1
	and 2(a5),d1
    75ca:	    and.w 2(a5),d1
	bne.b .deq
    75ce:	/-- bne.s 75d4 <P61_sampleoffse+0x10>
	move P61_LOffset(a5),d1
    75d0:	|   move.w 30(a5),d1
.deq:
	move d1,P61_LOffset(a5)
    75d4:	\-> move.w d1,30(a5)
	add d1,P61_Offset(a5)
    75d8:	    add.w d1,28(a5)

	moveq #$7e,d0
    75dc:	    moveq #126,d0
	and.b (a5),d0
    75de:	    and.b (a5),d0
	beq.w P61_nocha
    75e0:	    beq.w 7530 <P61_nocha>
	move P61_Offset(a5),d2
    75e4:	    move.w 28(a5),d2
	add d1,P61_Offset(a5)
    75e8:	    add.w d1,28(a5)
	move d2,d1
    75ec:	    move.w d2,d1
	move.b d7,P61_TrePos(a5)
	endc
	ifne P61_ft
	add P61_Fine(a5),d0
	endc
	move d0,P61_Note(a5)
    75ee:	    move.w d0,20(a5)
	move P61_periods-P61_cn(a3,d0),P61_Period(a5)
    75f2:	    move.w (2,a3,d0.w),22(a5)
	bra.b P61_hup
    75f8:	    bra.s 7600 <P61_hup>

000075fa <P61_pek>:
P61_pek:
	moveq #0,d1
    75fa:	moveq #0,d1
	move P61_Offset(a5),d1
    75fc:	move.w 28(a5),d1

00007600 <P61_hup>:
P61_hup:
	or P61_DMABit(a5),d4			;don't write 4 times, please.
    7600:	or.w 62(a5),d4

	move.l P61_Sample(a5),a1
    7604:	movea.l 4(a5),a1
	move.l (a1)+,d0
    7608:	move.l (a1)+,d0
	add.l d1,d0
    760a:	add.l d1,d0
	move.l d0,(a4)
    760c:	move.l d0,(a4)
	lsr #1,d1
    760e:	lsr.w #1,d1
	move (a1),d6
    7610:	move.w (a1),d6
	sub d1,d6
    7612:	sub.w d1,d6
	bpl.b P61_offok
    7614:	bpl.s 761c <P61_offok>
	move.l -4(a1),(a4)
    7616:	move.l -4(a1),(a4)
	moveq #1,d6
    761a:	moveq #1,d6

0000761c <P61_offok>:
P61_offok:
	move d6,4(a4)
    761c:	move.w d6,4(a4)
	lsl.l #3,d1
	add.l d0,d1
	move.l d1,P61_oscptrWrap(a5)	;wrap endptr for compare.
	endc				;oscillo

	bra.w P61_nocha			;continues to where ints etc is handled
    7620:	bra.w 7530 <P61_nocha>

00007624 <P61_volum>:
	endc

	ifne P61_vl
P61_volum:
	move.b P61_Info(a5),P61_Volume+1(a5)
    7624:	move.b 2(a5),25(a5)
	bra.w P61_fxdone
    762a:	bra.w 750a <P61_fxdone>

0000762e <P61_cspeed>:
	st P61_pdflag-P61_cn(a3)
	bra.w P61_fxdone
	endc
	ifne P61_sd
P61_cspeed:
	moveq #0,d0
    762e:	moveq #0,d0
	move.b P61_Info(a5),d0
    7630:	move.b 2(a5),d0
	ifne p61cia
	tst P61_Tempo-P61_cn(a3)
    7634:	tst.w -2670(a3)
	beq.b P61_VBlank
    7638:	beq.s 7640 <P61_VBlank>
	cmp.b #32,d0
    763a:	cmp.b #32,d0
	bhs.b P61_STempo
    763e:	bcc.s 7668 <P61_STempo>

00007640 <P61_VBlank>:
	endc
P61_VBlank:
	cmp.b #1,d0
    7640:	cmp.b #1,d0
	beq.b P61_jkd
    7644:	beq.s 7658 <P61_jkd>
	move.b d0,P61_speed+1-P61_cn(a3)
    7646:	move.b d0,83(a3)
	subq.b #1,d0
    764a:	subq.b #1,d0
	move.b d0,P61_speed2+1-P61_cn(a3)
    764c:	move.b d0,85(a3)
	move d7,P61_speedis1-P61_cn(a3)
    7650:	move.w d7,86(a3)
	bra.w P61_fxdone
    7654:	bra.w 750a <P61_fxdone>

00007658 <P61_jkd>:
P61_jkd:
	move.b d0,P61_speed+1-P61_cn(a3)
    7658:	move.b d0,83(a3)
	move.b d0,P61_speed2+1-P61_cn(a3)
    765c:	move.b d0,85(a3)
	st P61_speedis1-P61_cn(a3)
    7660:	st 86(a3)
	bra.w P61_fxdone
    7664:	bra.w 750a <P61_fxdone>

00007668 <P61_STempo>:
	ifne p61cia
P61_STempo:
	move.l P61_timer(pc),d1
    7668:	move.l 7898 <P61_timer>(pc),d1
	divu d0,d1
    766c:	divu.w d0,d1
	move d1,P61_thi2-P61_cn(a3)
    766e:	move.w d1,112(a3)
	sub #$1f0*2,d1
    7672:	sub.w #992,d1
	move d1,P61_thi-P61_cn(a3)
    7676:	move.w d1,110(a3)
	ifeq p61system
	move P61_thi2-P61_cn(a3),d1
    767a:	move.w 112(a3),d1
	move.b d1,$bfd400
    767e:	move.b d1,bfd400 <_end+0xb8811c>
	lsr #8,d1
    7684:	lsr.w #8,d1
	move.b d1,$bfd500
    7686:	move.b d1,bfd500 <_end+0xb8821c>
	endc
	bra P61_fxdone
    768c:	bra.w 750a <P61_fxdone>

00007690 <P61_dmason>:
********** timing interrupt entry point **********
;;    ---  first int, DMAs on again.  ---
	ifeq copdma
P61_dmason:
	ifeq p61system
	tst.b $bfdd00
    7690:	tst.b bfdd00 <_end+0xb88a1c>
	move #$2000,$dff09c
    7696:	move.w #8192,dff09c <_end+0xd89db8>
	move #$2000,$dff09c
    769e:	move.w #8192,dff09c <_end+0xd89db8>

	ifeq nowaveforms
	move.b #$19,$bfdf00		;retrigger to chain replen int.
    76a6:	move.b #25,bfdf00 <_end+0xb88c1c>
	move.l a0,-(sp)
    76ae:	move.l a0,-(sp)
	move.l P61_vektori(pc),a0	;put another int in '$78.w'
    76b0:	movea.l 7882 <P61_vektori>(pc),a0
	move.l P61_intaddr(pc),(a0)
    76b4:	move.l 7aa8 <P61_intaddr>(pc),(a0)
	move.l (sp)+,a0
    76b8:	movea.l (sp)+,a0
	endc

	move P61_dma(pc),$dff096	;on only. includes $8200.
    76ba:	move.w 7872 <P61_dma>(pc),dff096 <_end+0xd89db2>
	nop
    76c2:	nop
	rte
    76c4:	rte

000076c6 <P61_setrepeat>:
	endc				;ifeq copdma
;;    ---  second chained int, replen  ---
	ifeq nowaveforms
P61_setrepeat:
	ifeq p61system
	tst.b $bfdd00
    76c6:	tst.b bfdd00 <_end+0xb88a1c>
	movem.l a0/a1,-(sp)
    76cc:	movem.l a0-a1,-(sp)
	lea $dff0a0,a1
    76d0:	lea dff0a0 <_end+0xd89dbc>,a1
	move #$2000,-4(a1)
    76d6:	move.w #8192,-4(a1)
	move #$2000,-4(a1)
    76dc:	move.w #8192,-4(a1)
	else
	lea $dff0a0,a1
	endc

	move.l P61_Sample+P61_temp0(pc),a0
    76e2:	movea.l 772a <P61_temp0+0x4>(pc),a0
	addq.l #6,a0
    76e6:	addq.l #6,a0
	move.l (a0)+,(a1)+
    76e8:	move.l (a0)+,(a1)+
	move (a0),(a1)
    76ea:	move.w (a0),(a1)
	ifgt channels-1
	move.l P61_Sample+P61_temp1(pc),a0
    76ec:	movea.l 776a <P61_temp1+0x4>(pc),a0
	addq.l #6,a0
    76f0:	addq.l #6,a0
	move.l (a0)+,12(a1)
    76f2:	move.l (a0)+,12(a1)
	move (a0),16(a1)
    76f6:	move.w (a0),16(a1)
	endc
	ifgt channels-2
	move.l P61_Sample+P61_temp2(pc),a0
    76fa:	movea.l 77aa <P61_temp2+0x4>(pc),a0
	addq.l #6,a0
    76fe:	addq.l #6,a0
	move.l (a0)+,28(a1)
    7700:	move.l (a0)+,28(a1)
	move (a0),32(a1)
    7704:	move.w (a0),32(a1)
	endc
	ifgt channels-3
	move.l P61_Sample+P61_temp3(pc),a0
    7708:	movea.l 77ea <P61_temp3+0x4>(pc),a0
	addq.l #6,a0
    770c:	addq.l #6,a0
	move.l (a0)+,44(a1)
    770e:	move.l (a0)+,44(a1)
	move (a0),48(a1)
    7712:	move.w (a0),48(a1)
	endc
	bra P61_ohi
	endc
	ifeq p61system
	ifne p61cia
	move.l P61_vektori(pc),a0
    7716:	movea.l 7882 <P61_vektori>(pc),a0
	move.l P61_tintti(pc),(a0)
    771a:	move.l 7890 <P61_tintti>(pc),(a0)
	endc
	movem.l (sp)+,a0/a1
    771e:	movem.l (sp)+,a0-a1
	nop
    7722:	nop
	rte
    7724:	rte

00007726 <P61_temp0>:
	...
    7762:	ori.b #1,d0

00007766 <P61_temp1>:
	...
    77a2:	ori.b #2,d0

000077a6 <P61_temp2>:
	...
    77e2:	ori.b #4,d0

000077e6 <P61_temp3>:
	...
    7822:	ori.b #8,d0

00007826 <P61_cn>:
	...

00007828 <P61_periods>:
    7828:	bchg d1,(a0)+
    782a:	bchg d1,(a0)+
    782c:	btst d1,762(a0)
    7830:	.short 0x02d0
    7832:	andi.l #41943644,-(a6)
    7838:	.short 0x023a
    783a:	andi.b #-4,(a2)+
    783e:	bset d0,-(a0)
    7840:	bset d0,d5
    7842:	bclr d0,404(a4)
    7846:	.short 0x017d
    7848:	bchg d0,339(a0)
    784c:	bchg d0,d0
    784e:	btst d0,285(a6)
    7852:	movep.w 254(a5),d0
    7856:	.short 0x00f0
    7858:	.short 0x00e2
    785a:	.short 0x00d6
    785c:	.short 0x00ca
    785e:	.short 0x00be
    7860:	ori.l #11141280,(-105,a4,d0.w)
    7868:	.short 0x008f
    786a:	ori.l #8323192,d7
    7870:	Address 0x7872 is out of bounds.


00007872 <P61_dma>:
    7872:	or.b d0,d1

00007874 <P61_rowpos>:
	...

00007876 <P61_slen>:
	...

00007878 <P61_speed>:
	...

0000787a <P61_speed2>:
	...

0000787c <P61_speedis1>:
	...

0000787e <P61_spos>:
    787e:	ori.b #0,d0

00007882 <P61_vektori>:
    7882:	ori.b #0,d0

00007886 <P61_oldlev6>:
    7886:	ori.b #0,d0

0000788a <P61_ofilter>:
	...

0000788c <P61_timers>:
    788c:	ori.b #0,d0

00007890 <P61_tintti>:
    7890:	ori.b #0,d0

00007894 <P61_thi>:
	...

00007895 <P61_tlo>:
	...

00007896 <P61_thi2>:
	...

00007897 <P61_tlo2>:
	...

00007898 <P61_timer>:
    7898:	ori.b #0,d0

0000789c <P61_samples>:
	...

00007a8c <P61_emptysample>:
	...

00007a9c <P61_positionbase>:
    7a9c:	ori.b #0,d0

00007aa0 <P61_possibase>:
    7aa0:	ori.b #0,d0

00007aa4 <P61_patternbase>:
    7aa4:	ori.b #0,d0

00007aa8 <P61_intaddr>:
    7aa8:	ori.b #0,d0

00007aac <P61_InitPos>:
	...

00007aae <P61_PattFlag>:
	...

00007ab0 <P61_etu>:
    7ab0:	negx.b d0

00007ab2 <P61_visuctr1>:
    7ab2:	negx.b d0

00007ab4 <P61_visuctr2>:
    7ab4:	negx.b d0

00007ab6 <P61_visuctr3>:
    7ab6:	negx.b d0
